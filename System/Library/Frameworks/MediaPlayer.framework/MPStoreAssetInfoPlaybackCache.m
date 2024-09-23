@implementation MPStoreAssetInfoPlaybackCache

- (id)_init
{
  MPStoreAssetInfoPlaybackCache *v2;
  MPStoreAssetInfoPlaybackCache *v3;
  NSMutableArray *v4;
  NSMutableArray *accessOrderedRequests;
  NSMutableDictionary *v6;
  NSMutableDictionary *requestToCachedResponse;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MPStoreAssetInfoPlaybackCache;
  v2 = -[MPStoreAssetInfoPlaybackCache init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    accessOrderedRequests = v3->_accessOrderedRequests;
    v3->_accessOrderedRequests = v4;

    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    requestToCachedResponse = v3->_requestToCachedResponse;
    v3->_requestToCachedResponse = v6;

  }
  return v3;
}

- (void)withSyncLock:(id)a3
{
  os_unfair_lock_s *p_lock;
  void (**v4)(_QWORD);

  p_lock = &self->_lock;
  v4 = (void (**)(_QWORD))a3;
  os_unfair_lock_lock(p_lock);
  v4[2](v4);

  os_unfair_lock_unlock(p_lock);
}

- (void)addCachedResponse:(id)a3 forRequest:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a4;
  v7 = (void *)objc_msgSend(a3, "copy");
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __62__MPStoreAssetInfoPlaybackCache_addCachedResponse_forRequest___block_invoke;
  v10[3] = &unk_1E3163698;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[MPStoreAssetInfoPlaybackCache withSyncLock:](self, "withSyncLock:", v10);

}

- (id)cachedResponseForRequest:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__37724;
  v15 = __Block_byref_object_dispose__37725;
  v16 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __58__MPStoreAssetInfoPlaybackCache_cachedResponseForRequest___block_invoke;
  v8[3] = &unk_1E31635A8;
  v10 = &v11;
  v8[4] = self;
  v5 = v4;
  v9 = v5;
  -[MPStoreAssetInfoPlaybackCache withSyncLock:](self, "withSyncLock:", v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (void)updateForPlaybackOfFileAsset:(id)a3 fromResponse:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __75__MPStoreAssetInfoPlaybackCache_updateForPlaybackOfFileAsset_fromResponse___block_invoke;
  v7[3] = &unk_1E31635F8;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  -[MPStoreAssetInfoPlaybackCache withSyncLock:](self, "withSyncLock:", v7);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestToCachedResponse, 0);
  objc_storeStrong((id *)&self->_accessOrderedRequests, 0);
}

void __75__MPStoreAssetInfoPlaybackCache_updateForPlaybackOfFileAsset_fromResponse___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__37724;
  v20 = __Block_byref_object_dispose__37725;
  v21 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[2] = __75__MPStoreAssetInfoPlaybackCache_updateForPlaybackOfFileAsset_fromResponse___block_invoke_2;
  v13[3] = &unk_1E315DFC0;
  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  v13[1] = 3221225472;
  v14 = v2;
  v15 = &v16;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v13);
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v4 = (id)v17[5];
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v22, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v4);
        v8 = *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * i);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObjectForKey:", v8, (_QWORD)v9);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObject:", v8);
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v22, 16);
    }
    while (v5);
  }

  _Block_object_dispose(&v16, 8);
}

void __75__MPStoreAssetInfoPlaybackCache_updateForPlaybackOfFileAsset_fromResponse___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a2;
  objc_msgSend(a3, "fileAssetInfoList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", *(_QWORD *)(a1 + 32));

  if (v6)
  {
    v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    if (!v7)
    {
      v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v10 = *(void **)(v9 + 40);
      *(_QWORD *)(v9 + 40) = v8;

      v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    }
    objc_msgSend(v7, "addObject:", v11);
  }

}

uint64_t __58__MPStoreAssetInfoPlaybackCache_cachedResponseForRequest___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  uint64_t v9;
  void *v10;

  objc_msgSend(*(id *)(a1[4] + 24), "objectForKey:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  v5 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
  if (v5)
  {
    objc_msgSend(v5, "expirationDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "timeIntervalSinceNow");
      if (v8 < 10.0)
      {
        objc_msgSend(*(id *)(a1[4] + 24), "removeObjectForKey:", a1[5]);
        v9 = *(_QWORD *)(a1[6] + 8);
        v10 = *(void **)(v9 + 40);
        *(_QWORD *)(v9 + 40) = 0;

      }
    }

  }
  objc_msgSend(*(id *)(a1[4] + 16), "removeObject:", a1[5]);
  return objc_msgSend(*(id *)(a1[4] + 16), "insertObject:atIndex:", a1[5], 0);
}

void __62__MPStoreAssetInfoPlaybackCache_addCachedResponse_forRequest___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKey:", *(_QWORD *)(a1 + 40));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "expirationDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2
    || (objc_msgSend(*(id *)(a1 + 48), "expirationDate"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v2, "laterDate:", v3),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        v3,
        v4 == v3))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setObject:forKey:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObject:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "insertObject:atIndex:", *(_QWORD *)(a1 + 40), 0);
  if ((unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "count") >= 0x33)
  {
    do
    {
      v5 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "count") - 1;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectAtIndex:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObjectForKey:", v6);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObjectAtIndex:", v5);

    }
    while ((unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "count") > 0x32);
  }

}

+ (MPStoreAssetInfoPlaybackCache)sharedCache
{
  if (sharedCache_sOnceToken != -1)
    dispatch_once(&sharedCache_sOnceToken, &__block_literal_global_37735);
  return (MPStoreAssetInfoPlaybackCache *)(id)sharedCache_sSharedCache;
}

void __44__MPStoreAssetInfoPlaybackCache_sharedCache__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[MPStoreAssetInfoPlaybackCache _init]([MPStoreAssetInfoPlaybackCache alloc], "_init");
  v1 = (void *)sharedCache_sSharedCache;
  sharedCache_sSharedCache = (uint64_t)v0;

}

@end
