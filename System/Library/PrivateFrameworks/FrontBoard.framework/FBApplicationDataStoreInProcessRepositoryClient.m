@implementation FBApplicationDataStoreInProcessRepositoryClient

void __107__FBApplicationDataStoreInProcessRepositoryClient_prefetchedObjectIfAvailableForKey_application_outObject___block_invoke(_QWORD *a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  char v17;
  uint64_t v18;
  void *v19;

  v2 = a1 + 5;
  objc_msgSend(*(id *)(a1[4] + 24), "objectForKey:", a1[5]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "objectForKey:", a1[6]);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1[7] + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    if (*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40)
      || objc_msgSend(*(id *)(a1[4] + 16), "containsObject:", a1[6]))
    {
      *(_BYTE *)(*(_QWORD *)(a1[8] + 8) + 24) = 1;
    }
  }
  v8 = *(void **)(*(_QWORD *)(a1[7] + 8) + 40);
  +[FBApplicationDataStoreInProcessRepositoryClientInvalidationSentinel sentinel](FBApplicationDataStoreInProcessRepositoryClientInvalidationSentinel, "sentinel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 == v9)
  {
    FBLogAppDataStore();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      __107__FBApplicationDataStoreInProcessRepositoryClient_prefetchedObjectIfAvailableForKey_application_outObject___block_invoke_cold_1((uint64_t)a1, v2, v10);

    objc_msgSend(*(id *)(a1[4] + 8), "objectForKey:forApplication:", a1[6], a1[5]);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1[7] + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

    v14 = *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40);
    if (v14)
      objc_msgSend(v4, "setObject:forKey:", v14, a1[6]);
    else
      objc_msgSend(v4, "removeObjectForKey:", a1[6]);
  }
  v15 = *(void **)(*(_QWORD *)(a1[7] + 8) + 40);
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v15, "isEqual:", v16);
  v18 = *(_QWORD *)(a1[7] + 8);
  if ((v17 & 1) != 0)
    v19 = 0;
  else
    v19 = *(void **)(v18 + 40);
  objc_storeStrong((id *)(v18 + 40), v19);

}

- (void)setObject:(id)a3 forKey:(id)a4 forApplication:(id)a5 withCompletion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  NSObject *clientCalloutQueue;
  _QWORD block[4];
  id v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  id v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  FBLogAppDataStore();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    _descriptionForObject(v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v20 = v11;
    v21 = 2112;
    v22 = v12;
    v23 = 2112;
    v24 = v15;
    _os_log_impl(&dword_1A359A000, v14, OS_LOG_TYPE_INFO, "setting object for key=%{public}@ appID=%@ object=%@", buf, 0x20u);

  }
  -[FBApplicationDataStoreInProcessRepositoryClient _updateCacheIfNecessaryWithObject:forKey:forApplication:](self, "_updateCacheIfNecessaryWithObject:forKey:forApplication:", v10, v11, v12);
  -[FBApplicationDataStoreRepository setObject:forKey:forApplication:](self->_dataStore, "setObject:forKey:forApplication:", v10, v11, v12);
  if (v13)
  {
    clientCalloutQueue = self->_clientCalloutQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __98__FBApplicationDataStoreInProcessRepositoryClient_setObject_forKey_forApplication_withCompletion___block_invoke;
    block[3] = &unk_1E4A12168;
    v18 = v13;
    dispatch_async(clientCalloutQueue, block);

  }
}

- (void)_updateCacheIfNecessaryWithObject:(id)a3 forKey:(id)a4 forApplication:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *prefetchQueue;
  id v12;
  id v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  prefetchQueue = self->_prefetchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __107__FBApplicationDataStoreInProcessRepositoryClient__updateCacheIfNecessaryWithObject_forKey_forApplication___block_invoke;
  block[3] = &unk_1E4A12068;
  block[4] = self;
  v16 = v9;
  v17 = v10;
  v18 = v8;
  v12 = v8;
  v13 = v10;
  v14 = v9;
  dispatch_sync(prefetchQueue, block);

}

- (id)objectForKey:(id)a3 forApplication:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  BOOL v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v14;

  v6 = a3;
  v7 = a4;
  FBLogAppDataStore();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[FBApplicationDataStoreInProcessRepositoryClient objectForKey:forApplication:].cold.3();

  v14 = 0;
  v9 = -[FBApplicationDataStoreInProcessRepositoryClient prefetchedObjectIfAvailableForKey:application:outObject:](self, "prefetchedObjectIfAvailableForKey:application:outObject:", v6, v7, &v14);
  v10 = v14;
  if (v9)
  {
    FBLogAppDataStore();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[FBApplicationDataStoreInProcessRepositoryClient objectForKey:forApplication:].cold.1(v10);
    v12 = v10;
LABEL_10:

    goto LABEL_11;
  }
  -[FBApplicationDataStoreRepository objectForKey:forApplication:](self->_dataStore, "objectForKey:forApplication:", v6, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    FBLogAppDataStore();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[FBApplicationDataStoreInProcessRepositoryClient objectForKey:forApplication:].cold.2(v12);
    goto LABEL_10;
  }
LABEL_11:

  return v12;
}

- (BOOL)prefetchedObjectIfAvailableForKey:(id)a3 application:(id)a4 outObject:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  NSObject *prefetchQueue;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  BOOL v25;
  _QWORD block[5];
  id v28;
  id v29;
  uint64_t *v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint8_t buf[24];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__7;
  v40 = __Block_byref_object_dispose__7;
  v41 = 0;
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 0;
  FBLogAppDataStore();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[FBApplicationDataStoreInProcessRepositoryClient prefetchedObjectIfAvailableForKey:application:outObject:].cold.3();

  prefetchQueue = self->_prefetchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __107__FBApplicationDataStoreInProcessRepositoryClient_prefetchedObjectIfAvailableForKey_application_outObject___block_invoke;
  block[3] = &unk_1E4A145D0;
  block[4] = self;
  v12 = v9;
  v28 = v12;
  v30 = &v36;
  v13 = v8;
  v29 = v13;
  v31 = &v32;
  dispatch_sync(prefetchQueue, block);
  if (*((_BYTE *)v33 + 24))
  {
    FBLogAppDataStore();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      _descriptionForObject((void *)v37[5]);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[FBApplicationDataStoreInProcessRepositoryClient prefetchedObjectIfAvailableForKey:application:outObject:].cold.2(v15, buf, v14);
    }

    if (a5)
    {
      v16 = objc_retainAutorelease((id)v37[5]);
LABEL_12:
      *a5 = v16;
    }
  }
  else
  {
    FBLogAppDataStore();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      -[FBApplicationDataStoreInProcessRepositoryClient prefetchedObjectIfAvailableForKey:application:outObject:].cold.1(v17, v18, v19, v20, v21, v22, v23, v24);

    if (a5)
    {
      v16 = 0;
      goto LABEL_12;
    }
  }
  v25 = *((_BYTE *)v33 + 24) != 0;

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v36, 8);

  return v25;
}

void __107__FBApplicationDataStoreInProcessRepositoryClient__updateCacheIfNecessaryWithObject_forKey_forApplication___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = a1 + 40;
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "containsObject:", *(_QWORD *)(a1 + 40)))
  {
    FBLogAppDataStore();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      __107__FBApplicationDataStoreInProcessRepositoryClient__updateCacheIfNecessaryWithObject_forKey_forApplication___block_invoke_cold_1(v2, a1);

    objc_msgSend(*(id *)(a1 + 32), "_prefetchQueue_prefetchedKeysForApplication:", *(_QWORD *)(a1 + 48));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = *(_QWORD *)(a1 + 56);
    if (v6)
      objc_msgSend(v4, "setObject:forKey:", v6, *(_QWORD *)(a1 + 40));
    else
      objc_msgSend(v4, "removeObjectForKey:", *(_QWORD *)(a1 + 40));

  }
}

void __108__FBApplicationDataStoreInProcessRepositoryClient__invalidateCacheIfObjectIsNotEqual_forKey_forApplication___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  char v6;
  NSObject *v7;
  _BOOL4 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v2 = (_QWORD *)(a1 + 40);
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "containsObject:", *(_QWORD *)(a1 + 40)))
  {
    FBLogAppDataStore();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      __108__FBApplicationDataStoreInProcessRepositoryClient__invalidateCacheIfObjectIsNotEqual_forKey_forApplication___block_invoke_cold_3((uint64_t)v2, a1);

    objc_msgSend(*(id *)(a1 + 32), "_prefetchQueue_prefetchedKeysForApplication:", *(_QWORD *)(a1 + 48));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", *(_QWORD *)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = BSEqualObjects();
    FBLogAppDataStore();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
    if ((v6 & 1) != 0)
    {
      if (v8)
        __108__FBApplicationDataStoreInProcessRepositoryClient__invalidateCacheIfObjectIsNotEqual_forKey_forApplication___block_invoke_cold_1(v7, v9, v10, v11, v12, v13, v14, v15);
    }
    else
    {
      if (v8)
        __108__FBApplicationDataStoreInProcessRepositoryClient__invalidateCacheIfObjectIsNotEqual_forKey_forApplication___block_invoke_cold_2(v7, v9, v10, v11, v12, v13, v14, v15);

      +[FBApplicationDataStoreInProcessRepositoryClientInvalidationSentinel sentinel](FBApplicationDataStoreInProcessRepositoryClientInvalidationSentinel, "sentinel");
      v7 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v7, *v2);
    }

  }
}

- (id)_prefetchQueue_prefetchedKeysForApplication:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_prefetchQueue);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_prefetchedKeyValues, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](self->_prefetchedKeyValues, "setObject:forKey:", v5, v4);
  }

  return v5;
}

void __65__FBApplicationDataStoreInProcessRepositoryClient__valueChanged___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "_observers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "applicationDataStoreRepositoryClient:application:changedObject:forKey:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (id)_observers
{
  os_unfair_lock_s *p_observersLock;
  void *v4;

  p_observersLock = &self->_observersLock;
  os_unfair_lock_assert_not_owner(&self->_observersLock);
  os_unfair_lock_lock(p_observersLock);
  -[NSHashTable allObjects](self->_observersLock_observers, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_observersLock);
  return v4;
}

- (void)_valueChanged:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *clientCalloutQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("FBApplicationStoreRepositoryChangeApp"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("FBApplicationStoreRepositoryChangeKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "userInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKey:", CFSTR("FBApplicationStoreRepositoryChangeValue"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[FBApplicationDataStoreInProcessRepositoryClient _invalidateCacheIfObjectIsNotEqual:forKey:forApplication:](self, "_invalidateCacheIfObjectIsNotEqual:forKey:forApplication:", v10, v8, v6);
  clientCalloutQueue = self->_clientCalloutQueue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __65__FBApplicationDataStoreInProcessRepositoryClient__valueChanged___block_invoke;
  v15[3] = &unk_1E4A12068;
  v15[4] = self;
  v16 = v6;
  v17 = v10;
  v18 = v8;
  v12 = v8;
  v13 = v10;
  v14 = v6;
  dispatch_async(clientCalloutQueue, v15);

}

- (void)_invalidateCacheIfObjectIsNotEqual:(id)a3 forKey:(id)a4 forApplication:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *prefetchQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  prefetchQueue = self->_prefetchQueue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __108__FBApplicationDataStoreInProcessRepositoryClient__invalidateCacheIfObjectIsNotEqual_forKey_forApplication___block_invoke;
  v15[3] = &unk_1E4A12068;
  v15[4] = self;
  v16 = v9;
  v17 = v10;
  v18 = v8;
  v12 = v8;
  v13 = v10;
  v14 = v9;
  dispatch_async(prefetchQueue, v15);

}

- (void)removeObjectForKey:(id)a3 forApplication:(id)a4 withCompletion:(id)a5
{
  id v8;
  NSObject *clientCalloutQueue;
  _QWORD block[4];
  id v11;

  v8 = a5;
  -[FBApplicationDataStoreRepository removeObjectForKey:forApplication:](self->_dataStore, "removeObjectForKey:forApplication:", a3, a4);
  if (v8)
  {
    clientCalloutQueue = self->_clientCalloutQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __100__FBApplicationDataStoreInProcessRepositoryClient_removeObjectForKey_forApplication_withCompletion___block_invoke;
    block[3] = &unk_1E4A12168;
    v11 = v8;
    dispatch_async(clientCalloutQueue, block);

  }
}

- (void)synchronizeWithCompletion:(id)a3
{
  id v4;
  NSObject *clientCalloutQueue;
  _QWORD block[4];
  id v7;

  v4 = a3;
  -[FBApplicationDataStoreRepository flushSynchronously](self->_dataStore, "flushSynchronously");
  if (v4)
  {
    clientCalloutQueue = self->_clientCalloutQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __77__FBApplicationDataStoreInProcessRepositoryClient_synchronizeWithCompletion___block_invoke;
    block[3] = &unk_1E4A12168;
    v7 = v4;
    dispatch_async(clientCalloutQueue, block);

  }
}

- (FBApplicationDataStoreInProcessRepositoryClient)init
{
  void *v3;
  void *v4;
  FBApplicationDataStoreInProcessRepositoryClient *v5;

  +[FBApplicationDataStoreRepositoryManager sharedInstance](FBApplicationDataStoreRepositoryManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[FBApplicationDataStoreInProcessRepositoryClient initWithDataStore:](self, "initWithDataStore:", v4);

  return v5;
}

- (FBApplicationDataStoreInProcessRepositoryClient)initWithDataStore:(id)a3
{
  id v5;
  FBApplicationDataStoreInProcessRepositoryClient *v6;
  FBApplicationDataStoreInProcessRepositoryClient *v7;
  uint64_t Serial;
  OS_dispatch_queue *clientCalloutQueue;
  NSCountedSet *v10;
  NSCountedSet *prefetchedKeys;
  NSMutableDictionary *v12;
  NSMutableDictionary *prefetchedKeyValues;
  uint64_t v14;
  OS_dispatch_queue *prefetchQueue;
  uint64_t v16;
  NSHashTable *observersLock_observers;
  objc_super v19;

  v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)FBApplicationDataStoreInProcessRepositoryClient;
  v6 = -[FBApplicationDataStoreInProcessRepositoryClient init](&v19, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dataStore, a3);
    Serial = BSDispatchQueueCreateSerial();
    clientCalloutQueue = v7->_clientCalloutQueue;
    v7->_clientCalloutQueue = (OS_dispatch_queue *)Serial;

    v10 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E0CB3550]);
    prefetchedKeys = v7->_prefetchedKeys;
    v7->_prefetchedKeys = v10;

    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    prefetchedKeyValues = v7->_prefetchedKeyValues;
    v7->_prefetchedKeyValues = v12;

    v14 = BSDispatchQueueCreateSerial();
    prefetchQueue = v7->_prefetchQueue;
    v7->_prefetchQueue = (OS_dispatch_queue *)v14;

    v7->_observersLock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v16 = objc_claimAutoreleasedReturnValue();
    observersLock_observers = v7->_observersLock_observers;
    v7->_observersLock_observers = (NSHashTable *)v16;

  }
  return v7;
}

- (void)addPrefetchedKeys:(id)a3
{
  id v4;
  NSObject *prefetchQueue;
  id v6;
  _QWORD block[4];
  id v8;
  FBApplicationDataStoreInProcessRepositoryClient *v9;

  v4 = a3;
  prefetchQueue = self->_prefetchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__FBApplicationDataStoreInProcessRepositoryClient_addPrefetchedKeys___block_invoke;
  block[3] = &unk_1E4A11FD0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(prefetchQueue, block);

}

void __69__FBApplicationDataStoreInProcessRepositoryClient_addPrefetchedKeys___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  _QWORD v10[5];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "addObject:", v8);
        if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "countForObject:", v8) == 1)
          objc_msgSend(v2, "addObject:", v8);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  if (objc_msgSend(v2, "count"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "allObjectsForKeys:", v2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __69__FBApplicationDataStoreInProcessRepositoryClient_addPrefetchedKeys___block_invoke_2;
    v10[3] = &unk_1E4A14580;
    v10[4] = *(_QWORD *)(a1 + 40);
    objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v10);
    objc_msgSend(*(id *)(a1 + 40), "_prefetchQueue_updateNotificationListeners");

  }
}

void __69__FBApplicationDataStoreInProcessRepositoryClient_addPrefetchedKeys___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;

  v11 = a2;
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  v6 = a3;
  objc_msgSend(v5, "objectForKey:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "addEntriesFromDictionary:", v6);
  }
  else
  {
    v9 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
    v10 = objc_msgSend(v6, "mutableCopy");

    objc_msgSend(v9, "setObject:forKey:", v10, v11);
    v6 = (id)v10;
  }

}

- (void)removePrefetchedKeys:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *prefetchQueue;
  uint64_t v9;
  id v10;
  NSObject *clientCalloutQueue;
  _QWORD v12[4];
  id v13;
  _QWORD block[4];
  id v15;
  FBApplicationDataStoreInProcessRepositoryClient *v16;

  v6 = a3;
  v7 = a4;
  prefetchQueue = self->_prefetchQueue;
  v9 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __87__FBApplicationDataStoreInProcessRepositoryClient_removePrefetchedKeys_withCompletion___block_invoke;
  block[3] = &unk_1E4A11FD0;
  v10 = v6;
  v15 = v10;
  v16 = self;
  dispatch_sync(prefetchQueue, block);
  if (v7)
  {
    clientCalloutQueue = self->_clientCalloutQueue;
    v12[0] = v9;
    v12[1] = 3221225472;
    v12[2] = __87__FBApplicationDataStoreInProcessRepositoryClient_removePrefetchedKeys_withCompletion___block_invoke_3;
    v12[3] = &unk_1E4A12168;
    v13 = v7;
    dispatch_async(clientCalloutQueue, v12);

  }
}

void __87__FBApplicationDataStoreInProcessRepositoryClient_removePrefetchedKeys_withCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "removeObject:", v8);
        if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "countForObject:", v8))
          objc_msgSend(v2, "addObject:", v8);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }

  v9 = *(void **)(*(_QWORD *)(a1 + 40) + 24);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __87__FBApplicationDataStoreInProcessRepositoryClient_removePrefetchedKeys_withCompletion___block_invoke_2;
  v11[3] = &unk_1E4A145A8;
  v12 = v2;
  v10 = v2;
  objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v11);
  objc_msgSend(*(id *)(a1 + 40), "_prefetchQueue_updateNotificationListeners");

}

uint64_t __87__FBApplicationDataStoreInProcessRepositoryClient_removePrefetchedKeys_withCompletion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "removeObjectsForKeys:", *(_QWORD *)(a1 + 32));
}

uint64_t __87__FBApplicationDataStoreInProcessRepositoryClient_removePrefetchedKeys_withCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_updateNotificationListeners
{
  NSObject *prefetchQueue;
  _QWORD block[5];

  prefetchQueue = self->_prefetchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__FBApplicationDataStoreInProcessRepositoryClient__updateNotificationListeners__block_invoke;
  block[3] = &unk_1E4A12348;
  block[4] = self;
  dispatch_sync(prefetchQueue, block);
}

uint64_t __79__FBApplicationDataStoreInProcessRepositoryClient__updateNotificationListeners__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_prefetchQueue_updateNotificationListeners");
}

- (void)_prefetchQueue_updateNotificationListeners
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;

  BSDispatchQueueAssert();
  v3 = -[NSCountedSet count](self->_prefetchedKeys, "count");
  -[FBApplicationDataStoreInProcessRepositoryClient _observers](self, "_observers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3 | objc_msgSend(v4, "count");

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__valueChanged_, CFSTR("FBApplicationStoreRepositoryChangeNotification"), 0);
    objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__repositoryInvalidated_, CFSTR("FBApplicationStoreRepositoryInvalidatedNotification"), 0);
  }
  else
  {
    objc_msgSend(v6, "removeObserver:name:object:", self, CFSTR("FBApplicationStoreRepositoryChangeNotification"), 0);
    objc_msgSend(v6, "removeObserver:name:object:", self, CFSTR("FBApplicationStoreRepositoryInvalidatedNotification"), 0);
  }

}

- (void)_repositoryInvalidated:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *prefetchQueue;
  id v8;
  NSObject *clientCalloutQueue;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD block[5];
  id v14;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("FBApplicationStoreRepositoryChangeApp"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = MEMORY[0x1E0C809B0];
  prefetchQueue = self->_prefetchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__FBApplicationDataStoreInProcessRepositoryClient__repositoryInvalidated___block_invoke;
  block[3] = &unk_1E4A11FD0;
  block[4] = self;
  v8 = v5;
  v14 = v8;
  dispatch_async(prefetchQueue, block);
  clientCalloutQueue = self->_clientCalloutQueue;
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __74__FBApplicationDataStoreInProcessRepositoryClient__repositoryInvalidated___block_invoke_2;
  v11[3] = &unk_1E4A11FD0;
  v11[4] = self;
  v12 = v8;
  v10 = v8;
  dispatch_async(clientCalloutQueue, v11);

}

uint64_t __74__FBApplicationDataStoreInProcessRepositoryClient__repositoryInvalidated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
}

void __74__FBApplicationDataStoreInProcessRepositoryClient__repositoryInvalidated___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "_observers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "applicationDataStoreRepositoryClient:storeInvalidatedForApplication:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

uint64_t __77__FBApplicationDataStoreInProcessRepositoryClient_synchronizeWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)availableDataStores
{
  void *v2;

  -[FBApplicationDataStoreRepository applicationIdentifiersWithState](self->_dataStore, "applicationIdentifiersWithState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (id)migrateIdentifier:(id)a3 toIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v12;
  void *v13;
  void *v14;

  v6 = a3;
  v7 = a4;
  v8 = v6;
  NSClassFromString(CFSTR("NSString"));
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBApplicationDataStoreInProcessRepositoryClient migrateIdentifier:toIdentifier:].cold.1();
LABEL_17:
    objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35FD37CLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBApplicationDataStoreInProcessRepositoryClient migrateIdentifier:toIdentifier:].cold.1();
    objc_msgSend(objc_retainAutorelease(v13), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35FD3E0);
  }

  v9 = v7;
  NSClassFromString(CFSTR("NSString"));
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBApplicationDataStoreInProcessRepositoryClient migrateIdentifier:toIdentifier:].cold.2();
    objc_msgSend(objc_retainAutorelease(v14), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35FD444);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBApplicationDataStoreInProcessRepositoryClient migrateIdentifier:toIdentifier:].cold.2();
    goto LABEL_17;
  }

  -[FBApplicationDataStoreRepository migrateIdentifier:toIdentifier:](self->_dataStore, "migrateIdentifier:toIdentifier:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

uint64_t __98__FBApplicationDataStoreInProcessRepositoryClient_setObject_forKey_forApplication_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __100__FBApplicationDataStoreInProcessRepositoryClient_removeObjectForKey_forApplication_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)removeAllObjectsForApplication:(id)a3 withCompletion:(id)a4
{
  id v6;
  NSObject *clientCalloutQueue;
  _QWORD block[4];
  id v9;

  v6 = a4;
  -[FBApplicationDataStoreRepository removeAllObjectsForApplication:](self->_dataStore, "removeAllObjectsForApplication:", a3);
  if (v6)
  {
    clientCalloutQueue = self->_clientCalloutQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __97__FBApplicationDataStoreInProcessRepositoryClient_removeAllObjectsForApplication_withCompletion___block_invoke;
    block[3] = &unk_1E4A12168;
    v9 = v6;
    dispatch_async(clientCalloutQueue, block);

  }
}

uint64_t __97__FBApplicationDataStoreInProcessRepositoryClient_removeAllObjectsForApplication_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)objectForKey:(id)a3 forApplication:(id)a4 withResult:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  BOOL v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *clientCalloutQueue;
  id v18;
  _QWORD block[4];
  id v20;
  id v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  FBLogAppDataStore();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[FBApplicationDataStoreInProcessRepositoryClient objectForKey:forApplication:withResult:].cold.2();

  if (v10)
  {
    v22 = 0;
    v12 = -[FBApplicationDataStoreInProcessRepositoryClient prefetchedObjectIfAvailableForKey:application:outObject:](self, "prefetchedObjectIfAvailableForKey:application:outObject:", v8, v9, &v22);
    v13 = v22;
    if (v12)
    {
      FBLogAppDataStore();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        -[FBApplicationDataStoreInProcessRepositoryClient objectForKey:forApplication:].cold.1(v13);
      v15 = v13;
    }
    else
    {
      -[FBApplicationDataStoreRepository objectForKey:forApplication:](self->_dataStore, "objectForKey:forApplication:", v8, v9);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      FBLogAppDataStore();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        _descriptionForObject(v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v24 = v16;
        _os_log_impl(&dword_1A359A000, v14, OS_LOG_TYPE_INFO, "retrieved object from store: %@", buf, 0xCu);

      }
    }

    clientCalloutQueue = self->_clientCalloutQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __90__FBApplicationDataStoreInProcessRepositoryClient_objectForKey_forApplication_withResult___block_invoke;
    block[3] = &unk_1E4A13090;
    v20 = v15;
    v21 = v10;
    v18 = v15;
    dispatch_async(clientCalloutQueue, block);

  }
}

uint64_t __90__FBApplicationDataStoreInProcessRepositoryClient_objectForKey_forApplication_withResult___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

- (void)addObserver:(id)a3
{
  os_unfair_lock_s *p_observersLock;
  id v5;

  p_observersLock = &self->_observersLock;
  v5 = a3;
  os_unfair_lock_assert_not_owner(p_observersLock);
  os_unfair_lock_lock(p_observersLock);
  -[NSHashTable addObject:](self->_observersLock_observers, "addObject:", v5);

  os_unfair_lock_unlock(p_observersLock);
  -[FBApplicationDataStoreInProcessRepositoryClient _updateNotificationListeners](self, "_updateNotificationListeners");
}

- (void)removeObserver:(id)a3
{
  os_unfair_lock_s *p_observersLock;
  id v5;

  p_observersLock = &self->_observersLock;
  v5 = a3;
  os_unfair_lock_assert_not_owner(p_observersLock);
  os_unfair_lock_lock(p_observersLock);
  -[NSHashTable removeObject:](self->_observersLock_observers, "removeObject:", v5);

  os_unfair_lock_unlock(p_observersLock);
  -[FBApplicationDataStoreInProcessRepositoryClient _updateNotificationListeners](self, "_updateNotificationListeners");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observersLock_observers, 0);
  objc_storeStrong((id *)&self->_clientCalloutQueue, 0);
  objc_storeStrong((id *)&self->_prefetchQueue, 0);
  objc_storeStrong((id *)&self->_prefetchedKeyValues, 0);
  objc_storeStrong((id *)&self->_prefetchedKeys, 0);
  objc_storeStrong((id *)&self->_dataStore, 0);
}

void __107__FBApplicationDataStoreInProcessRepositoryClient__updateCacheIfNecessaryWithObject_forKey_forApplication___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  _descriptionForObject(*(void **)(a2 + 56));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_4();
  OUTLINED_FUNCTION_10_5(&dword_1A359A000, v3, v4, "updating cache key=%{public}@ appID=%@ object=%@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_13();
}

void __108__FBApplicationDataStoreInProcessRepositoryClient__invalidateCacheIfObjectIsNotEqual_forKey_forApplication___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1A359A000, a1, a3, "objects match", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_8_5();
}

void __108__FBApplicationDataStoreInProcessRepositoryClient__invalidateCacheIfObjectIsNotEqual_forKey_forApplication___block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1A359A000, a1, a3, "objects don't match, invalidating", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_8_5();
}

void __108__FBApplicationDataStoreInProcessRepositoryClient__invalidateCacheIfObjectIsNotEqual_forKey_forApplication___block_invoke_cold_3(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  _descriptionForObject(*(void **)(a2 + 56));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_4();
  OUTLINED_FUNCTION_10_5(&dword_1A359A000, v3, v4, "conditionally invalidating cache key=%{public}@ appID=%@ object=%@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_13();
}

- (void)migrateIdentifier:toIdentifier:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1A359A000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

- (void)migrateIdentifier:toIdentifier:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1A359A000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

- (void)objectForKey:(void *)a1 forApplication:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  _descriptionForObject(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_1(&dword_1A359A000, v2, v3, "found prefetched object: %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_10_4();
}

- (void)objectForKey:(void *)a1 forApplication:.cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  _descriptionForObject(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_1(&dword_1A359A000, v2, v3, "retrieved object from store: %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_10_4();
}

- (void)objectForKey:forApplication:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_1_4(&dword_1A359A000, v0, v1, "fetching object for key=%{public}@ appID=%@ (synchronously)");
  OUTLINED_FUNCTION_12();
}

- (void)objectForKey:forApplication:withResult:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_1_4(&dword_1A359A000, v0, v1, "fetching object for key=%{public}@ appID=%@");
  OUTLINED_FUNCTION_12();
}

- (void)prefetchedObjectIfAvailableForKey:(uint64_t)a3 application:(uint64_t)a4 outObject:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1A359A000, a1, a3, "no object found", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_8_5();
}

- (void)prefetchedObjectIfAvailableForKey:(void *)a1 application:(uint8_t *)buf outObject:(os_log_t)log .cold.2(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_debug_impl(&dword_1A359A000, log, OS_LOG_TYPE_DEBUG, "found object %@", buf, 0xCu);

}

- (void)prefetchedObjectIfAvailableForKey:application:outObject:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_1_4(&dword_1A359A000, v0, v1, "checking for prefetched object for key=%{public}@ appID=%@");
  OUTLINED_FUNCTION_12();
}

void __107__FBApplicationDataStoreInProcessRepositoryClient_prefetchedObjectIfAvailableForKey_application_outObject___block_invoke_cold_1(uint64_t a1, _QWORD *a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138543618;
  *(_QWORD *)&v3[4] = *(_QWORD *)(a1 + 48);
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = *a2;
  OUTLINED_FUNCTION_1_4(&dword_1A359A000, (uint64_t)a2, a3, "found invalidation sentinel for key=%{public}@ appID=%@, refreshing cache", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_12();
}

@end
