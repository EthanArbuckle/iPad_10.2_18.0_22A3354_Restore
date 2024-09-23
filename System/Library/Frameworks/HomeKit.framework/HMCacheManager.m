@implementation HMCacheManager

void __32__HMCacheManager_cacheWithName___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_cacheWithName:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_cacheWithName:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;

  v4 = a3;
  -[HMCacheManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  os_unfair_lock_lock_with_options();
  -[NSMapTable objectForKey:](self->_cacheMap, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(&self->_lock);
  if (!v6)
  {
    -[HMCacheManager _loadCacheNamed:](self, "_loadCacheNamed:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDelegate:", self);
    os_unfair_lock_lock_with_options();
    -[NSMapTable setObject:forKey:](self->_cacheMap, "setObject:forKey:", v6, v4);
    os_unfair_lock_unlock(&self->_lock);
  }

  return v6;
}

- (id)_loadCacheNamed:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  HMCache *v8;

  v4 = a3;
  -[HMCacheManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMCacheManager persistentCache](self, "persistentCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "loadCachedObjectsForCacheWithName:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[HMCache initWithCachedObjects:name:]([HMCache alloc], "initWithCachedObjects:name:", v7, v4);
  return v8;
}

- (HMPersistentCache)persistentCache
{
  return (HMPersistentCache *)objc_getProperty(self, a2, 16, 1);
}

- (id)cacheWithName:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  v17 = 0;
  -[HMCacheManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__HMCacheManager_cacheWithName___block_invoke;
  block[3] = &unk_1E3AAEF90;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 48, 1);
}

- (HMCacheManager)initWithTimerFactory:(id)a3 persistentCache:(id)a4
{
  void (**v6)(_QWORD);
  id v7;
  HMCacheManager *v8;
  HMCacheManager *v9;
  uint64_t v10;
  NSMapTable *cacheMap;
  uint64_t v12;
  NSMutableDictionary *pendingWrites;
  id v14;
  const char *v15;
  NSObject *v16;
  dispatch_queue_t v17;
  OS_dispatch_queue *workQueue;
  uint64_t v19;
  HMFTimer *writeDebounceTimer;
  objc_super v22;

  v6 = (void (**)(_QWORD))a3;
  v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)HMCacheManager;
  v8 = -[HMCacheManager init](&v22, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
    v10 = objc_claimAutoreleasedReturnValue();
    cacheMap = v9->_cacheMap;
    v9->_cacheMap = (NSMapTable *)v10;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v12 = objc_claimAutoreleasedReturnValue();
    pendingWrites = v9->_pendingWrites;
    v9->_pendingWrites = (NSMutableDictionary *)v12;

    HMDispatchQueueNameString(v9, CFSTR("WorkQueue"));
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v15 = (const char *)objc_msgSend(v14, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = dispatch_queue_create(v15, v16);
    workQueue = v9->_workQueue;
    v9->_workQueue = (OS_dispatch_queue *)v17;

    objc_storeStrong((id *)&v9->_persistentCache, a4);
    v6[2](v6);
    v19 = objc_claimAutoreleasedReturnValue();
    writeDebounceTimer = v9->_writeDebounceTimer;
    v9->_writeDebounceTimer = (HMFTimer *)v19;

    -[HMFTimer setDelegate:](v9->_writeDebounceTimer, "setDelegate:", v9);
    -[HMFTimer setDelegateQueue:](v9->_writeDebounceTimer, "setDelegateQueue:", v9->_workQueue);
  }

  return v9;
}

- (void)cacheDidUpdate:(id)a3
{
  NSMutableDictionary *pendingWrites;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  os_unfair_lock_lock_with_options();
  pendingWrites = self->_pendingWrites;
  objc_msgSend(v7, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](pendingWrites, "setObject:forKeyedSubscript:", v7, v5);

  os_unfair_lock_unlock(&self->_lock);
  -[HMCacheManager writeDebounceTimer](self, "writeDebounceTimer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resume");

}

- (HMFTimer)writeDebounceTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 40, 1);
}

- (void)cacheWithName:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[HMCacheManager workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__HMCacheManager_cacheWithName_completion___block_invoke;
  block[3] = &unk_1E3AB5C58;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)_saveCache:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[HMCacheManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMCacheManager persistentCache](self, "persistentCache");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cachedObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "storeCachedObjects:forCacheName:", v6, v7);
}

- (void)timerDidFire:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;

  v4 = a3;
  -[HMCacheManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMCacheManager writeDebounceTimer](self, "writeDebounceTimer");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v4)
    -[HMCacheManager forceFlushToDisk](self, "forceFlushToDisk");
}

- (void)forceFlushToDisk
{
  NSObject *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[HMCacheManager workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  os_unfair_lock_lock_with_options();
  v4 = (void *)-[NSMutableDictionary copy](self->_pendingWrites, "copy");
  -[NSMutableDictionary removeAllObjects](self->_pendingWrites, "removeAllObjects");
  os_unfair_lock_unlock(&self->_lock);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8), (_QWORD)v10);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMCacheManager _saveCache:](self, "_saveCache:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (NSMapTable)cacheMap
{
  return (NSMapTable *)objc_getProperty(self, a2, 24, 1);
}

- (NSMutableDictionary)pendingWrites
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_writeDebounceTimer, 0);
  objc_storeStrong((id *)&self->_pendingWrites, 0);
  objc_storeStrong((id *)&self->_cacheMap, 0);
  objc_storeStrong((id *)&self->_persistentCache, 0);
}

void __43__HMCacheManager_cacheWithName_completion___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_cacheWithName:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

@end
