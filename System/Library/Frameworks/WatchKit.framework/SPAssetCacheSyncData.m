@implementation SPAssetCacheSyncData

- (SPAssetCacheSyncData)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SPAssetCacheSyncData;
  return -[SPAssetCacheSyncData init](&v3, sel_init);
}

+ (id)toProto:(id)a3
{
  id v3;
  SPProtoCacheSyncData *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  v4 = objc_alloc_init(SPProtoCacheSyncData);
  objc_msgSend(v3, "cacheIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPProtoCacheSyncData setCacheIdentifier:](v4, "setCacheIdentifier:", v5);

  objc_msgSend(v3, "permanentCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[SPAssetCacheAssets toProto:](SPAssetCacheAssets, "toProto:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPProtoCacheSyncData setPermanentCache:](v4, "setPermanentCache:", v7);

  objc_msgSend(v3, "transientCache");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[SPAssetCacheAssets toProto:](SPAssetCacheAssets, "toProto:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPProtoCacheSyncData setTransientCache:](v4, "setTransientCache:", v9);

  return v4;
}

+ (id)fromProto:(id)a3
{
  id v3;
  SPAssetCacheSyncData *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  v4 = objc_alloc_init(SPAssetCacheSyncData);
  objc_msgSend(v3, "cacheIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPAssetCacheSyncData setCacheIdentifier:](v4, "setCacheIdentifier:", v5);

  objc_msgSend(v3, "permanentCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[SPAssetCacheAssets fromProto:](SPAssetCacheAssets, "fromProto:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPAssetCacheSyncData setPermanentCache:](v4, "setPermanentCache:", v7);

  objc_msgSend(v3, "transientCache");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[SPAssetCacheAssets fromProto:](SPAssetCacheAssets, "fromProto:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPAssetCacheSyncData setTransientCache:](v4, "setTransientCache:", v9);

  return v4;
}

- (SPAssetCacheAssets)permanentCache
{
  return self->_permanentCache;
}

- (void)setPermanentCache:(id)a3
{
  objc_storeStrong((id *)&self->_permanentCache, a3);
}

- (SPAssetCacheAssets)transientCache
{
  return self->_transientCache;
}

- (void)setTransientCache:(id)a3
{
  objc_storeStrong((id *)&self->_transientCache, a3);
}

- (NSString)cacheIdentifier
{
  return self->_cacheIdentifier;
}

- (void)setCacheIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_cacheIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheIdentifier, 0);
  objc_storeStrong((id *)&self->_transientCache, 0);
  objc_storeStrong((id *)&self->_permanentCache, 0);
}

@end
