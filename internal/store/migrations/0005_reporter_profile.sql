-- Registry profile fields newer than the events this indexer consumes today.
--
-- `expires_at` mirrors reporter-registry's proposed ReporterExpirySet
-- (plimsoll-contracts#92) and `reputation_score` its proposed on-chain score
-- (plimsoll-contracts#72). Both are nullable on purpose: NULL means "the
-- registry has not told us", which is different from a score of zero or a
-- reporter that has already expired. Until a registry deployment exposes
-- them, GET /v1/reporters reports null instead of inventing a value.
ALTER TABLE reporters ADD COLUMN IF NOT EXISTS reputation_score INTEGER;
ALTER TABLE reporters ADD COLUMN IF NOT EXISTS expires_at TIMESTAMPTZ;
