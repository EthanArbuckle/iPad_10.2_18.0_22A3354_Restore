@implementation BCSBusinessLookupResult

- (BCSBusinessLookupResult)initWithHasBusiness:(BOOL)a3 matchingTruncatedHash:(int64_t)a4 config:(id)a5
{
  id v9;
  BCSBusinessLookupResult *v10;
  BCSBusinessLookupResult *v11;
  objc_super v13;

  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)BCSBusinessLookupResult;
  v10 = -[BCSBusinessLookupResult init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_hasBusiness = a3;
    v10->_matchingTruncatedHash = a4;
    objc_storeStrong((id *)&v10->_config, a5);
  }

  return v11;
}

- (id)initForMatchWithTruncatedHash:(int64_t)a3
{
  return -[BCSBusinessLookupResult initWithHasBusiness:matchingTruncatedHash:config:](self, "initWithHasBusiness:matchingTruncatedHash:config:", 1, a3, 0);
}

- (id)initForMatchWithTruncatedHash:(int64_t)a3 config:(id)a4
{
  return -[BCSBusinessLookupResult initWithHasBusiness:matchingTruncatedHash:config:](self, "initWithHasBusiness:matchingTruncatedHash:config:", 1, a3, a4);
}

- (id)initForNoMatch
{
  return -[BCSBusinessLookupResult initWithHasBusiness:matchingTruncatedHash:config:](self, "initWithHasBusiness:matchingTruncatedHash:config:", 0, 0, 0);
}

- (id)initForNoMatchWithConfig:(id)a3
{
  return -[BCSBusinessLookupResult initWithHasBusiness:matchingTruncatedHash:config:](self, "initWithHasBusiness:matchingTruncatedHash:config:", 0, 0, a3);
}

- (BOOL)hasBusiness
{
  return self->_hasBusiness;
}

- (void)setHasBusiness:(BOOL)a3
{
  self->_hasBusiness = a3;
}

- (int64_t)matchingTruncatedHash
{
  return self->_matchingTruncatedHash;
}

- (void)setMatchingTruncatedHash:(int64_t)a3
{
  self->_matchingTruncatedHash = a3;
}

- (BCSBusinessConfig)config
{
  return self->_config;
}

- (void)setConfig:(id)a3
{
  objc_storeStrong((id *)&self->_config, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_config, 0);
}

@end
