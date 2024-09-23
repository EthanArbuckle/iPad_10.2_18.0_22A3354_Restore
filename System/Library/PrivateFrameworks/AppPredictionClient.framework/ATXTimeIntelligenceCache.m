@implementation ATXTimeIntelligenceCache

- (ATXTimeIntelligenceCache)init
{
  ATXTimeIntelligenceCache *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ATXTimeIntelligenceCache;
  v2 = -[ATXTimeIntelligenceCache init](&v9, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CF94D8], "appPredictionCacheDirectory");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("TimeIntelligence"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = objc_alloc(MEMORY[0x1E0CF94C0]);
    __atxlog_handle_time_intelligence();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithCacheFilePath:loggingHandle:debugName:", v4, v6, CFSTR("Time Intelligence"));
    -[ATXTimeIntelligenceCache setCache:](v2, "setCache:", v7);

  }
  return v2;
}

- (void)cacheEvents:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[ATXTimeIntelligenceCache cache](self, "cache");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  objc_msgSend(v6, "storeSecureCodedObject:error:", v5, 0);
}

- (id)cachedEvents
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;

  -[ATXTimeIntelligenceCache cache](self, "cache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1A85A4F90]();
  v4 = objc_alloc(MEMORY[0x1E0C99E60]);
  v5 = objc_opt_class();
  v6 = (void *)objc_msgSend(v4, "initWithObjects:", v5, objc_opt_class(), 0);
  objc_autoreleasePoolPop(v3);
  objc_msgSend(v2, "readSecureCodedObjectWithMaxValidAge:allowableClasses:error:", v6, 0, 86400.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)evictCachedEvents
{
  id v2;

  -[ATXTimeIntelligenceCache cache](self, "cache");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "evict");

}

- (ATXGenericFileBasedCache)cache
{
  return self->_cache;
}

- (void)setCache:(id)a3
{
  objc_storeStrong((id *)&self->_cache, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
}

@end
