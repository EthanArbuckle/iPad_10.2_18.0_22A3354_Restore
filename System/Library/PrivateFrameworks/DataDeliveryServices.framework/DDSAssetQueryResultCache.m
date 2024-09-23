@implementation DDSAssetQueryResultCache

- (id)cachedAssetsForQuery:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[DDSAssetQueryResultCache cache](self, "cache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cacheKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (DDSCache)cache
{
  return self->_cache;
}

- (void)cacheAssets:(id)a3 forQuery:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[DDSAssetQueryResultCache cache](self, "cache");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cacheKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "cacheObject:forKey:", v7, v8);
}

- (DDSAssetQueryResultCache)init
{
  DDSAssetQueryResultCache *v2;
  DDSCache *v3;
  DDSCache *cache;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DDSAssetQueryResultCache;
  v2 = -[DDSAssetQueryResultCache init](&v6, sel_init);
  if (v2)
  {
    v3 = -[DDSCache initWithMaxCount:]([DDSCache alloc], "initWithMaxCount:", 100);
    cache = v2->_cache;
    v2->_cache = v3;

    -[DDSCache setDelegate:](v2->_cache, "setDelegate:", v2);
  }
  return v2;
}

- (void)clearCache
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  DefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1DA990000, v3, OS_LOG_TYPE_DEFAULT, "Asked to clear cache...", v5, 2u);
  }

  -[DDSAssetQueryResultCache cache](self, "cache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clearCache");

}

- (void)clearCacheForAssetType:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  DefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_1DA990000, v5, OS_LOG_TYPE_DEFAULT, "Asked to clear cache for asset type: %@", (uint8_t *)&v7, 0xCu);
  }

  -[DDSAssetQueryResultCache cache](self, "cache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeEntriesWithPrefixKey:", v4);

}

- (void)cache:(id)a3 willEvictObjects:(id)a4
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a4;
  DefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_1DA990000, v5, OS_LOG_TYPE_DEFAULT, "Cache will evict: %{public}@", (uint8_t *)&v6, 0xCu);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
}

@end
