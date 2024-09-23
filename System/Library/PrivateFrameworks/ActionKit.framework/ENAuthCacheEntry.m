@implementation ENAuthCacheEntry

- (BOOL)isValid
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;

  -[ENAuthCacheEntry cachedDate](self, "cachedDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceNow");
  v5 = fabs(v4);

  -[ENAuthCacheEntry authResult](self, "authResult");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "expiration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "longLongValue");
  -[ENAuthCacheEntry authResult](self, "authResult");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "currentTime");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (v8 - objc_msgSend(v10, "longLongValue")) / 1000;

  return v5 <= (double)v11 * 0.9;
}

- (EDAMAuthenticationResult)authResult
{
  return self->_authResult;
}

- (void)setAuthResult:(id)a3
{
  objc_storeStrong((id *)&self->_authResult, a3);
}

- (NSDate)cachedDate
{
  return self->_cachedDate;
}

- (void)setCachedDate:(id)a3
{
  objc_storeStrong((id *)&self->_cachedDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedDate, 0);
  objc_storeStrong((id *)&self->_authResult, 0);
}

+ (ENAuthCacheEntry)entryWithResult:(id)a3
{
  id v3;
  ENAuthCacheEntry *v4;
  void *v5;

  if (a3)
  {
    v3 = a3;
    v4 = objc_alloc_init(ENAuthCacheEntry);
    -[ENAuthCacheEntry setAuthResult:](v4, "setAuthResult:", v3);

    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ENAuthCacheEntry setCachedDate:](v4, "setCachedDate:", v5);

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

@end
