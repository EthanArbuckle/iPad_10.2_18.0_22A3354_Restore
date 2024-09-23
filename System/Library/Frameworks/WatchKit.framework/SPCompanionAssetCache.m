@implementation SPCompanionAssetCache

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_80);
  return (id)sharedInstance___sharedInstance;
}

void __39__SPCompanionAssetCache_sharedInstance__block_invoke()
{
  SPCompanionAssetCache *v0;
  void *v1;

  v0 = objc_alloc_init(SPCompanionAssetCache);
  v1 = (void *)sharedInstance___sharedInstance;
  sharedInstance___sharedInstance = (uint64_t)v0;

}

- (SPCompanionAssetCache)init
{
  SPCompanionAssetCache *v2;
  void *v3;
  SPAssetCacheClientCache *v4;
  SPAssetCacheClientCache *permanentCache;
  SPAssetCacheClientCache *v6;
  SPAssetCacheClientCache *transientCache;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SPCompanionAssetCache;
  v2 = -[SPCompanionAssetCache init](&v9, sel_init);
  if (v2)
  {
    +[SPRemoteInterface cacheIdentifier](SPRemoteInterface, "cacheIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[SPAssetCacheClientCache initWithIdentifier:cacheType:]([SPAssetCacheClientCache alloc], "initWithIdentifier:cacheType:", v3, 1);
    permanentCache = v2->_permanentCache;
    v2->_permanentCache = v4;

    v6 = -[SPAssetCacheClientCache initWithIdentifier:cacheType:]([SPAssetCacheClientCache alloc], "initWithIdentifier:cacheType:", v3, 2);
    transientCache = v2->_transientCache;
    v2->_transientCache = v6;

  }
  return v2;
}

- (BOOL)imageInTransientCache:(id)a3
{
  id v4;
  SPCompanionAssetCache *v5;
  void *v6;
  void *v7;
  BOOL v8;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[SPAssetCacheClientCache assets](v5->_transientCache, "assets");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v8 = objc_msgSend(v7, "state") == 0;
  else
    v8 = 0;

  objc_sync_exit(v5);
  return v8;
}

- (void)addImageReferenceToTransientCache:(id)a3 withName:(id)a4
{
  id v6;
  SPCompanionAssetCache *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  -[SPAssetCacheClientCache addAsset:withName:sendImage:](v7->_transientCache, "addAsset:withName:sendImage:", v8, v6, 0);
  objc_sync_exit(v7);

}

- (void)handleCacheMessage:(id)a3
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "messageType") == 6)
  {
    -[SPCompanionAssetCache addedAsset:](self, "addedAsset:", v4);
  }
  else if (objc_msgSend(v4, "messageType") == 7)
  {
    -[SPCompanionAssetCache deletedAsset:](self, "deletedAsset:", v4);
  }
  else if (objc_msgSend(v4, "messageType") == 8)
  {
    -[SPCompanionAssetCache clearedCache:](self, "clearedCache:", v4);
  }
  else if (objc_msgSend(v4, "messageType") == 11)
  {
    -[SPCompanionAssetCache syncCache:](self, "syncCache:", v4);
  }

}

- (void)addedAsset:(id)a3
{
  id v4;
  SPCompanionAssetCache *v5;
  NSObject *v6;
  void *v7;
  SPAssetCacheClientCache *permanentCache;
  void *v9;
  SPAssetCacheClientCache *transientCache;
  _QWORD v11[6];

  v11[5] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (!objc_msgSend(v4, "error"))
  {
    if (objc_msgSend(v4, "cacheType") == 1)
    {
      permanentCache = v5->_permanentCache;
      objc_msgSend(v4, "assetKey");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SPAssetCacheClientCache addedAssetWithName:](permanentCache, "addedAssetWithName:", v9);
    }
    else
    {
      if (objc_msgSend(v4, "cacheType") != 2)
        goto LABEL_10;
      transientCache = v5->_transientCache;
      objc_msgSend(v4, "assetKey");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SPAssetCacheClientCache addedAssetWithName:](transientCache, "addedAssetWithName:", v9);
    }

    goto LABEL_10;
  }
  wk_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v4, "assetKey");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPCompanionAssetCache addedAsset:].cold.1(v7, (uint64_t)v11);
  }

LABEL_10:
  objc_sync_exit(v5);

}

- (void)deletedAsset:(id)a3
{
  id v4;
  SPCompanionAssetCache *v5;
  NSObject *v6;
  void *v7;
  SPAssetCacheClientCache *permanentCache;
  void *v9;
  SPAssetCacheClientCache *transientCache;
  _QWORD v11[6];

  v11[5] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (!objc_msgSend(v4, "error"))
  {
    if (objc_msgSend(v4, "cacheType") == 1)
    {
      permanentCache = v5->_permanentCache;
      objc_msgSend(v4, "assetKey");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SPAssetCacheClientCache deletedAssetWithName:](permanentCache, "deletedAssetWithName:", v9);
    }
    else
    {
      if (objc_msgSend(v4, "cacheType") != 2)
        goto LABEL_10;
      transientCache = v5->_transientCache;
      objc_msgSend(v4, "assetKey");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SPAssetCacheClientCache deletedAssetWithName:](transientCache, "deletedAssetWithName:", v9);
    }

    goto LABEL_10;
  }
  wk_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v4, "assetKey");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPCompanionAssetCache deletedAsset:].cold.1(v7, (uint64_t)v11);
  }

LABEL_10:
  objc_sync_exit(v5);

}

- (void)clearedCache:(id)a3
{
  id v4;
  SPCompanionAssetCache *v5;
  NSObject *v6;
  uint64_t v7;
  _QWORD v8[6];

  v8[5] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (!objc_msgSend(v4, "error"))
  {
    if (objc_msgSend(v4, "cacheType") == 1)
    {
      v7 = 8;
    }
    else
    {
      if (objc_msgSend(v4, "cacheType") != 2)
        goto LABEL_10;
      v7 = 16;
    }
    objc_msgSend(*(id *)((char *)&v5->super.isa + v7), "clearedCache");
    goto LABEL_10;
  }
  wk_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    -[SPCompanionAssetCache clearedCache:].cold.1((uint64_t)v8, objc_msgSend(v4, "cacheType"), v6);

LABEL_10:
  objc_sync_exit(v5);

}

- (void)syncCache:(id)a3
{
  id v4;
  SPCompanionAssetCache *v5;
  NSObject *v6;
  SPAssetCacheClientCache *transientCache;
  void *v8;
  SPAssetCacheClientCache *permanentCache;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (objc_msgSend(v4, "error"))
  {
    wk_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SPCompanionAssetCache syncCache:].cold.1();
  }
  else
  {
    transientCache = v5->_transientCache;
    objc_msgSend(v4, "syncData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPAssetCacheClientCache syncAssets:](transientCache, "syncAssets:", v8);

    permanentCache = v5->_permanentCache;
    objc_msgSend(v4, "syncData");
    v6 = objc_claimAutoreleasedReturnValue();
    -[SPAssetCacheClientCache syncAssets:](permanentCache, "syncAssets:", v6);
  }

  objc_sync_exit(v5);
}

- (BOOL)imageInPermanentCache:(id)a3
{
  id v4;
  SPCompanionAssetCache *v5;
  void *v6;
  void *v7;
  BOOL v8;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[SPAssetCacheClientCache assets](v5->_permanentCache, "assets");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v8 = objc_msgSend(v7, "state") == 0;
  else
    v8 = 0;

  objc_sync_exit(v5);
  return v8;
}

- (BOOL)addImageToPermanentCache:(id)a3 withName:(id)a4
{
  id v6;
  id v7;
  SPCompanionAssetCache *v8;
  BOOL v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  v9 = -[SPAssetCacheClientCache addAsset:withName:sendImage:](v8->_permanentCache, "addAsset:withName:sendImage:", v6, v7, 1);
  objc_sync_exit(v8);

  return v9;
}

- (void)removeImageFromPermanentCacheWithName:(id)a3
{
  SPCompanionAssetCache *v4;
  id v5;

  v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[SPAssetCacheClientCache deleteAssetWithName:](v4->_permanentCache, "deleteAssetWithName:", v5);
  objc_sync_exit(v4);

}

- (void)removeAllImagesFromPermanentCache
{
  SPCompanionAssetCache *obj;

  obj = self;
  objc_sync_enter(obj);
  -[SPAssetCacheClientCache deleteAllAssets](obj->_permanentCache, "deleteAllAssets");
  objc_sync_exit(obj);

}

- (id)cachedImages
{
  SPCompanionAssetCache *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  -[SPAssetCacheClientCache cachedImages](v2->_permanentCache, "cachedImages");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v2);

  return v3;
}

- (id)dataForImageWithName:(id)a3
{
  id v4;
  SPCompanionAssetCache *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[SPAssetCacheClientCache dataForImageWithName:](v5->_permanentCache, "dataForImageWithName:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v5);

  return v6;
}

- (id)keyFromImageData:(id)a3
{
  id v3;
  void *v4;
  uint64_t i;
  unsigned __int8 md[16];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = objc_retainAutorelease(a3);
  CC_MD5((const void *)objc_msgSend(v3, "bytes"), objc_msgSend(v3, "length"), md);
  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithCapacity:", 32);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 16; ++i)
    objc_msgSend(v4, "appendFormat:", CFSTR("%02x"), md[i]);

  return v4;
}

- (SPAssetCacheClientCache)permanentCache
{
  return self->_permanentCache;
}

- (void)setPermanentCache:(id)a3
{
  objc_storeStrong((id *)&self->_permanentCache, a3);
}

- (SPAssetCacheClientCache)transientCache
{
  return self->_transientCache;
}

- (void)setTransientCache:(id)a3
{
  objc_storeStrong((id *)&self->_transientCache, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transientCache, 0);
  objc_storeStrong((id *)&self->_permanentCache, 0);
}

- (void)addedAsset:(void *)a1 .cold.1(void *a1, uint64_t a2)
{
  NSObject *v3;
  uint8_t *v4;

  *(_DWORD *)a2 = 136446722;
  *(_QWORD *)(a2 + 4) = "-[SPCompanionAssetCache addedAsset:]";
  *(_WORD *)(a2 + 12) = 1024;
  OUTLINED_FUNCTION_5_0((uint64_t)a1, a2, 377);
  OUTLINED_FUNCTION_5(&dword_215918000, v3, (uint64_t)v3, "%{public}s:%d: asset caching error for asset id: %{public}@", v4);

}

- (void)deletedAsset:(void *)a1 .cold.1(void *a1, uint64_t a2)
{
  NSObject *v3;
  uint8_t *v4;

  *(_DWORD *)a2 = 136446722;
  *(_QWORD *)(a2 + 4) = "-[SPCompanionAssetCache deletedAsset:]";
  *(_WORD *)(a2 + 12) = 1024;
  OUTLINED_FUNCTION_5_0((uint64_t)a1, a2, 392);
  OUTLINED_FUNCTION_5(&dword_215918000, v3, (uint64_t)v3, "%{public}s:%d: asset removal error for asset id: %{public}@", v4);

}

- (void)clearedCache:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136446722;
  *(_QWORD *)(a1 + 4) = "-[SPCompanionAssetCache clearedCache:]";
  *(_WORD *)(a1 + 12) = 1024;
  *(_DWORD *)(a1 + 14) = 407;
  *(_WORD *)(a1 + 18) = 2048;
  *(_QWORD *)(a1 + 20) = a2;
  OUTLINED_FUNCTION_5(&dword_215918000, a3, (uint64_t)a3, "%{public}s:%d: clearedCache error for cache type %lu", (uint8_t *)a1);
}

- (void)syncCache:.cold.1()
{
  os_log_t v0;
  _DWORD v1[6];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  v1[0] = 136446466;
  OUTLINED_FUNCTION_0_1();
  *(_DWORD *)((char *)&v1[3] + 2) = 419;
  _os_log_error_impl(&dword_215918000, v0, OS_LOG_TYPE_ERROR, "%{public}s:%d: sync cache error", (uint8_t *)v1, 0x12u);
}

@end
