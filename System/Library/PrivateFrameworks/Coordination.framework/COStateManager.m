@implementation COStateManager

- (COStateManager)initWithConnectionProvider:(id)a3 suite:(id)a4 clusters:(id)a5
{
  id v9;
  id v10;
  id v11;
  COStateManager *v12;
  COStateManager *v13;
  NSArray *v14;
  NSArray *observers;
  NSObject *v16;
  dispatch_queue_t v17;
  OS_dispatch_queue *workQueue;
  NSObject *v19;
  objc_super v21;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v21.receiver = self;
  v21.super_class = (Class)COStateManager;
  v12 = -[COStateManager init](&v21, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_provider, a3);
    v14 = (NSArray *)objc_alloc_init(MEMORY[0x24BDBCE30]);
    observers = v13->_observers;
    v13->_observers = v14;

    objc_storeStrong((id *)&v13->_suite, a4);
    objc_storeStrong((id *)&v13->_clusters, a5);
    v13->_lock._os_unfair_lock_opaque = 0;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = dispatch_queue_create("com.apple.COStateManager.queue", v16);
    workQueue = v13->_workQueue;
    v13->_workQueue = (OS_dispatch_queue *)v17;

    COLogForCategory(4);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      -[COStateManager initWithConnectionProvider:suite:clusters:].cold.1((uint64_t)v13, (uint64_t)v9, v19);

  }
  return v13;
}

- (COStateManager)initWithSuiteName:(id)a3 clusters:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _COStateManagerConnectionProvider *v16;
  COStateManager *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x24BDBCF20]);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v20;
    do
    {
      v13 = 0;
      v14 = v8;
      do
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v9);
        +[COCluster _clusterForCluster:](COCluster, "_clusterForCluster:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v13), (_QWORD)v19);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setByAddingObject:", v15);
        v8 = (id)objc_claimAutoreleasedReturnValue();

        ++v13;
        v14 = v8;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v11);
  }

  v16 = objc_alloc_init(_COStateManagerConnectionProvider);
  v17 = -[COStateManager initWithConnectionProvider:suite:clusters:](self, "initWithConnectionProvider:suite:clusters:", v16, v6, v8);

  return v17;
}

- (void)dealloc
{
  objc_super v3;
  _QWORD v4[5];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __25__COStateManager_dealloc__block_invoke;
  v4[3] = &unk_24CD3EFE8;
  v4[4] = self;
  -[COStateManager _withLock:](self, "_withLock:", v4);
  v3.receiver = self;
  v3.super_class = (Class)COStateManager;
  -[COStateManager dealloc](&v3, sel_dealloc);
}

void __25__COStateManager_dealloc__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "lastConnection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "co_originalInterruptionHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInterruptionHandler:", v1);

  objc_msgSend(v3, "co_originalInvalidationHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInvalidationHandler:", v2);

  objc_msgSend(v3, "invalidate");
}

- (void)setBool:(BOOL)a3 forKeyPath:(id)a4 clusters:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  void *v12;
  NSObject *workQueue;
  id v14;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  BOOL v21;

  v10 = a4;
  v11 = a6;
  -[COStateManager _clustersForClustersTmp:](self, "_clustersForClustersTmp:", a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __64__COStateManager_setBool_forKeyPath_clusters_completionHandler___block_invoke;
  block[3] = &unk_24CD3F270;
  block[4] = self;
  v18 = v10;
  v21 = a3;
  v19 = v12;
  v20 = v11;
  v14 = v11;
  v15 = v12;
  v16 = v10;
  dispatch_async(workQueue, block);

}

void __64__COStateManager_setBool_forKeyPath_clusters_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 64));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_onqueue_setDictionary:clusters:cacheLocally:completionHandler:", v4, *(_QWORD *)(a1 + 48), 1, *(_QWORD *)(a1 + 56));

}

- (void)setNumber:(id)a3 forKeyPath:(id)a4 clusters:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *workQueue;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  -[COStateManager _clustersForClustersTmp:](self, "_clustersForClustersTmp:", a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __66__COStateManager_setNumber_forKeyPath_clusters_completionHandler___block_invoke;
  block[3] = &unk_24CD3F298;
  block[4] = self;
  v20 = v11;
  v21 = v10;
  v22 = v13;
  v23 = v12;
  v15 = v12;
  v16 = v13;
  v17 = v10;
  v18 = v11;
  dispatch_async(workQueue, block);

}

void __66__COStateManager_setNumber_forKeyPath_clusters_completionHandler___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)a1[4];
  v3 = a1[6];
  v5 = a1[5];
  v6[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_onqueue_setDictionary:clusters:cacheLocally:completionHandler:", v4, a1[7], 1, a1[8]);

}

- (void)setString:(id)a3 forKeyPath:(id)a4 clusters:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *workQueue;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  -[COStateManager _clustersForClustersTmp:](self, "_clustersForClustersTmp:", a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __66__COStateManager_setString_forKeyPath_clusters_completionHandler___block_invoke;
  block[3] = &unk_24CD3F298;
  block[4] = self;
  v20 = v11;
  v21 = v10;
  v22 = v13;
  v23 = v12;
  v15 = v12;
  v16 = v13;
  v17 = v10;
  v18 = v11;
  dispatch_async(workQueue, block);

}

void __66__COStateManager_setString_forKeyPath_clusters_completionHandler___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)a1[4];
  v3 = a1[6];
  v5 = a1[5];
  v6[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_onqueue_setDictionary:clusters:cacheLocally:completionHandler:", v4, a1[7], 1, a1[8]);

}

- (void)setDate:(id)a3 forKeyPath:(id)a4 clusters:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *workQueue;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  -[COStateManager _clustersForClustersTmp:](self, "_clustersForClustersTmp:", a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __64__COStateManager_setDate_forKeyPath_clusters_completionHandler___block_invoke;
  block[3] = &unk_24CD3F298;
  block[4] = self;
  v20 = v11;
  v21 = v10;
  v22 = v13;
  v23 = v12;
  v15 = v12;
  v16 = v13;
  v17 = v10;
  v18 = v11;
  dispatch_async(workQueue, block);

}

void __64__COStateManager_setDate_forKeyPath_clusters_completionHandler___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)a1[4];
  v3 = a1[6];
  v5 = a1[5];
  v6[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_onqueue_setDictionary:clusters:cacheLocally:completionHandler:", v4, a1[7], 1, a1[8]);

}

- (void)setDictionary:(id)a3 clusters:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *workQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a5;
  -[COStateManager _clustersForClustersTmp:](self, "_clustersForClustersTmp:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  workQueue = self->_workQueue;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __59__COStateManager_setDictionary_clusters_completionHandler___block_invoke;
  v15[3] = &unk_24CD3EF48;
  v15[4] = self;
  v16 = v8;
  v17 = v10;
  v18 = v9;
  v12 = v9;
  v13 = v10;
  v14 = v8;
  dispatch_async(workQueue, v15);

}

uint64_t __59__COStateManager_setDictionary_clusters_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_setDictionary:clusters:cacheLocally:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 1, *(_QWORD *)(a1 + 56));
}

- (void)removeObjectForKeyPath:(id)a3 clusters:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *workQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  COStateManager *v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a5;
  -[COStateManager _clustersForClustersTmp:](self, "_clustersForClustersTmp:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  workQueue = self->_workQueue;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __68__COStateManager_removeObjectForKeyPath_clusters_completionHandler___block_invoke;
  v15[3] = &unk_24CD3EF48;
  v16 = v8;
  v17 = self;
  v18 = v10;
  v19 = v9;
  v12 = v9;
  v13 = v10;
  v14 = v8;
  dispatch_async(workQueue, v15);

}

void __68__COStateManager_removeObjectForKeyPath_clusters_completionHandler___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", *(_QWORD *)(a1 + 32));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "removeObjectsForKeyPaths:clusters:completionHandler:", v2, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

- (void)removeObjectsForKeyPaths:(id)a3 clusters:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *workQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a5;
  -[COStateManager _clustersForClustersTmp:](self, "_clustersForClustersTmp:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  workQueue = self->_workQueue;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __70__COStateManager_removeObjectsForKeyPaths_clusters_completionHandler___block_invoke;
  v15[3] = &unk_24CD3EF48;
  v15[4] = self;
  v16 = v8;
  v17 = v10;
  v18 = v9;
  v12 = v9;
  v13 = v10;
  v14 = v8;
  dispatch_async(workQueue, v15);

}

uint64_t __70__COStateManager_removeObjectsForKeyPaths_clusters_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_removeObjectsForKeyPaths:clusters:cacheLocally:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 1, *(_QWORD *)(a1 + 56));
}

- (id)addObserverForKeyPathUsingPredicate:(id)a3 queue:(id)a4 usingBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *workQueue;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v17[4];
  id v18;
  id v19;
  COStateManager *v20;
  id v21;
  uint64_t *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  dispatch_group_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__2;
  v34 = __Block_byref_object_dispose__2;
  v35 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__2;
  v28 = __Block_byref_object_dispose__2;
  v29 = dispatch_group_create();
  dispatch_group_enter((dispatch_group_t)v25[5]);
  workQueue = self->_workQueue;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __71__COStateManager_addObserverForKeyPathUsingPredicate_queue_usingBlock___block_invoke;
  v17[3] = &unk_24CD3F2C0;
  v18 = v9;
  v19 = v8;
  v20 = self;
  v21 = v10;
  v22 = &v30;
  v23 = &v24;
  v12 = v10;
  v13 = v8;
  v14 = v9;
  dispatch_async(workQueue, v17);
  dispatch_group_wait((dispatch_group_t)v25[5], 0xFFFFFFFFFFFFFFFFLL);
  v15 = (id)v31[5];

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);

  return v15;
}

void __71__COStateManager_addObserverForKeyPathUsingPredicate_queue_usingBlock___block_invoke(uint64_t a1)
{
  COStateObserver *v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v2 = -[COStateObserver initWithDispatchQueue:predicate:block:]([COStateObserver alloc], "initWithDispatchQueue:predicate:block:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  COLogForCategory(4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    __71__COStateManager_addObserverForKeyPathUsingPredicate_queue_usingBlock___block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 48), "_onqueue_registerObserver:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
  objc_msgSend(*(id *)(a1 + 48), "observers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(v7, "addObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
  objc_msgSend(*(id *)(a1 + 48), "setObservers:", v7);
  COLogForCategory(4);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    v11 = *(_QWORD *)(a1 + 40);
    v10 = *(_QWORD *)(a1 + 48);
    v12 = 134218498;
    v13 = v10;
    v14 = 2048;
    v15 = v9;
    v16 = 2112;
    v17 = v11;
    _os_log_debug_impl(&dword_21214B000, v8, OS_LOG_TYPE_DEBUG, "StateManager %p added observer %p with predicate %@", (uint8_t *)&v12, 0x20u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
}

- (void)removeObserver:(id)a3
{
  id v4;
  NSObject *workQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  COStateManager *v9;

  v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __33__COStateManager_removeObserver___block_invoke;
  v7[3] = &unk_24CD3EF20;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(workQueue, v7);

}

void __33__COStateManager_removeObserver___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  id v14;
  id location;

  v2 = *(id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "observers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "indexOfObject:", v2);
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = v4;
    v6 = (void *)objc_msgSend(v3, "mutableCopy");
    objc_initWeak(&location, *(id *)(a1 + 40));
    v7 = *(void **)(a1 + 40);
    v10 = MEMORY[0x24BDAC760];
    v11 = 3221225472;
    v12 = __33__COStateManager_removeObserver___block_invoke_2;
    v13 = &unk_24CD3F2E8;
    objc_copyWeak(&v14, &location);
    objc_msgSend(v7, "_remoteInterfaceWithErrorHandler:", &v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "predicate", v10, v11, v12, v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObserverWithPredicate:", v9);

    objc_msgSend(v6, "removeObjectAtIndex:", v5);
    objc_msgSend(*(id *)(a1 + 40), "setObservers:", v6);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);

  }
}

void __33__COStateManager_removeObserver___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (v3 && WeakRetained)
  {
    v9 = *MEMORY[0x24BDD1398];
    v10[0] = v3;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("COStateManagerErrorDomain"), -1001, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    COLogForCategory(4);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __33__COStateManager_removeObserver___block_invoke_2_cold_1();

  }
}

- (void)changesObserved:(id)a3 forPredicate:(id)a4
{
  id v6;
  id v7;
  NSObject *workQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__COStateManager_changesObserved_forPredicate___block_invoke;
  block[3] = &unk_24CD3F310;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(workQueue, block);

}

void __47__COStateManager_changesObserved_forPredicate___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  void *v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  COLogForCategory(4);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __47__COStateManager_changesObserved_forPredicate___block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "_sanitizeChanges:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "observers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v17;
    *(_QWORD *)&v6 = 134218240;
    v15 = v6;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v10, "predicate", v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqual:", *(_QWORD *)(a1 + 48));

        if (v12)
        {
          COLogForCategory(4);
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            v14 = *(_QWORD *)(a1 + 32);
            *(_DWORD *)buf = v15;
            v21 = v14;
            v22 = 2048;
            v23 = v10;
            _os_log_impl(&dword_21214B000, v13, OS_LOG_TYPE_DEFAULT, "StateManager %p notifying observer %p of changes", buf, 0x16u);
          }

          objc_msgSend(v10, "notify:", v3);
        }
      }
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v7);
  }

}

- (void)_onqueue_setDictionary:(id)a3 clusters:(id)a4 cacheLocally:(BOOL)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  char isKindOfClass;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  id v26;
  void *v27;
  void (**v28)(id, void *);
  id v29;
  uint64_t v30;
  id v31;
  COStateManager *v32;
  NSObject *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  BOOL v40;
  COStateManager *val;
  void *v42;
  void (**v43)(id, void *);
  id obj;
  id *v45;
  id v46;
  _QWORD v47[4];
  id v48;
  void (**v49)(id, void *);
  id v50;
  _QWORD v51[4];
  id v52;
  void (**v53)(id, void *);
  id v54;
  id v55;
  BOOL v56;
  _QWORD v57[4];
  id v58;
  id v59;
  id v60;
  id v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _BYTE location[12];
  __int16 v71;
  id v72;
  __int16 v73;
  void *v74;
  _BYTE v75[128];
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v43 = (void (**)(id, void *))a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  v42 = v11;
  if (-[COStateManager _onqueue_clustersValid:](self, "_onqueue_clustersValid:", v11))
  {
    val = self;
    v40 = a5;
    if (_onqueue_setDictionary_clusters_cacheLocally_completionHandler__onceToken != -1)
      dispatch_once(&_onqueue_setDictionary_clusters_cacheLocally_completionHandler__onceToken, &__block_literal_global_2);
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v46 = (id)objc_claimAutoreleasedReturnValue();
    v68 = 0u;
    v69 = 0u;
    v66 = 0u;
    v67 = 0u;
    objc_msgSend(v10, "allKeys");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v76, 16);
    if (v12)
    {
      v45 = *(id **)v67;
      while (1)
      {
        v13 = 0;
LABEL_7:
        if (*(id **)v67 != v45)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * v13);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          break;
        v15 = v14;
        v62 = 0u;
        v63 = 0u;
        v64 = 0u;
        v65 = 0u;
        v16 = (id)_onqueue_setDictionary_clusters_cacheLocally_completionHandler__supportedClasses;
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v62, v75, 16);
        if (!v17)
        {
LABEL_26:

          break;
        }
        v18 = *(_QWORD *)v63;
LABEL_12:
        v19 = 0;
        while (1)
        {
          if (*(_QWORD *)v63 != v18)
            objc_enumerationMutation(v16);
          objc_msgSend(v10, "objectForKeyedSubscript:", v15);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) != 0)
            break;
          if (v17 == ++v19)
          {
            v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v62, v75, 16);
            if (v17)
              goto LABEL_12;
            goto LABEL_26;
          }
        }

        objc_msgSend(v10, "objectForKeyedSubscript:", v15);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "absoluteString");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "setObject:forKey:", v22, v23);

        if (++v13 != v12)
          goto LABEL_7;
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v76, 16);
        if (!v12)
          goto LABEL_21;
      }

      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("COStateManagerErrorDomain"), -1003, 0);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      COLogForCategory(4);
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)location = 134218498;
        *(_QWORD *)&location[4] = val;
        v71 = 2112;
        v72 = v10;
        v73 = 2112;
        v74 = v34;
        _os_log_error_impl(&dword_21214B000, v35, OS_LOG_TYPE_ERROR, "%p failed to set state %@ since it contains unsupported types - %@", location, 0x20u);
      }

      v43[2](v43, v34);
    }
    else
    {
LABEL_21:

      objc_initWeak((id *)location, val);
      v24 = MEMORY[0x24BDAC760];
      v57[0] = MEMORY[0x24BDAC760];
      v57[1] = 3221225472;
      v57[2] = __81__COStateManager__onqueue_setDictionary_clusters_cacheLocally_completionHandler___block_invoke_63;
      v57[3] = &unk_24CD3F358;
      objc_copyWeak(&v61, (id *)location);
      v25 = v42;
      v58 = v25;
      v46 = v46;
      v59 = v46;
      v26 = v10;
      v60 = v26;
      v27 = (void *)MEMORY[0x212BE9A2C](v57);
      v51[0] = v24;
      v51[1] = 3221225472;
      v51[2] = __81__COStateManager__onqueue_setDictionary_clusters_cacheLocally_completionHandler___block_invoke_2;
      v51[3] = &unk_24CD3F3A8;
      objc_copyWeak(&v55, (id *)location);
      v52 = v26;
      v28 = v43;
      v53 = v28;
      v56 = v40;
      v29 = v27;
      v54 = v29;
      -[COStateManager _remoteInterfaceWithErrorHandler:](val, "_remoteInterfaceWithErrorHandler:", v51);
      v30 = objc_claimAutoreleasedReturnValue();
      if (v25)
      {
        v31 = v25;
        v32 = val;
      }
      else
      {
        v32 = val;
        -[COStateManager clusters](val, "clusters");
        v31 = (id)objc_claimAutoreleasedReturnValue();
      }
      -[COStateManager suite](v32, "suite");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[COStateManager clusters](v32, "clusters");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v47[0] = v24;
      v47[1] = 3221225472;
      v47[2] = __81__COStateManager__onqueue_setDictionary_clusters_cacheLocally_completionHandler___block_invoke_65;
      v47[3] = &unk_24CD3F3D0;
      objc_copyWeak(&v50, (id *)location);
      v38 = (void *)v30;
      v39 = v29;
      v48 = v39;
      v49 = v28;
      objc_msgSend(v38, "setDictionary:suite:interestClusters:targetCluster:withCallback:", v46, v36, v37, v31, v47);

      objc_destroyWeak(&v50);
      objc_destroyWeak(&v55);

      objc_destroyWeak(&v61);
      objc_destroyWeak((id *)location);
    }
  }
  else
  {
    COLogForCategory(4);
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      -[COStateManager _onqueue_setDictionary:clusters:cacheLocally:completionHandler:].cold.1();

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("COStateManagerErrorDomain"), -1000, 0);
    v46 = (id)objc_claimAutoreleasedReturnValue();
    v43[2](v43, v46);
  }

}

void __81__COStateManager__onqueue_setDictionary_clusters_cacheLocally_completionHandler___block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v0 = (void *)MEMORY[0x24BDBCF20];
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  objc_msgSend(v0, "setWithObjects:", v1, v2, objc_opt_class(), 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)_onqueue_setDictionary_clusters_cacheLocally_completionHandler__supportedClasses;
  _onqueue_setDictionary_clusters_cacheLocally_completionHandler__supportedClasses = v3;

}

void __81__COStateManager__onqueue_setDictionary_clusters_cacheLocally_completionHandler___block_invoke_63(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  id v30;
  unsigned int v31;
  void *v32;
  uint64_t v33;
  id obj;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _QWORD v45[2];
  _QWORD v46[2];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v35 = a1;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "state");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v7;
    if (v8)
    {
      objc_msgSend(v7, "state");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v9, "mutableCopy");

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }

    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    obj = *(id *)(v35 + 32);
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v47, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v41;
      v31 = a3;
      v30 = v5;
      v33 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v41 != v13)
            objc_enumerationMutation(obj);
          v15 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i);
          if ((objc_msgSend(v5, "containsObject:", v15, v30) & 1) == 0)
          {
            objc_msgSend(v10, "objectForKeyedSubscript:", v15);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            if (v16)
            {
              objc_msgSend(v10, "objectForKeyedSubscript:", v15);
              v17 = v5;
              v18 = v12;
              v19 = v7;
              v20 = a3;
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v22 = (void *)objc_msgSend(v21, "mutableCopy");

              a3 = v20;
              v7 = v19;
              v12 = v18;
              v5 = v17;
            }
            else
            {
              objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
            }

            objc_msgSend(v22, "addEntriesFromDictionary:", *(_QWORD *)(v35 + 40));
            objc_msgSend(v10, "setObject:forKey:", v22, v15);
            objc_msgSend(v7, "setState:", v10);
            if ((_DWORD)a3)
            {
              v45[0] = CFSTR("COStateManagerChangesCluster");
              v45[1] = CFSTR("COStateManagerChangesUpdatedKeyPaths");
              v23 = *(_QWORD *)(v35 + 48);
              v46[0] = v15;
              v46[1] = v23;
              objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v46, v45, 2);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v36 = 0u;
              v37 = 0u;
              v38 = 0u;
              v39 = 0u;
              objc_msgSend(v7, "observers");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
              if (v26)
              {
                v27 = v26;
                v28 = *(_QWORD *)v37;
                do
                {
                  for (j = 0; j != v27; ++j)
                  {
                    if (*(_QWORD *)v37 != v28)
                      objc_enumerationMutation(v25);
                    objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * j), "notify:", v24);
                  }
                  v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
                }
                while (v27);
              }

              v5 = v30;
              a3 = v31;
              v7 = v32;
            }

            v13 = v33;
          }
        }
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v47, 16);
      }
      while (v12);
    }

  }
}

void __81__COStateManager__onqueue_setDictionary_clusters_cacheLocally_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject **WeakRetained;
  NSObject **v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  NSObject **v9;
  id v10;
  id v11;
  id v12;
  char v13;

  v3 = a2;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 56));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained[2];
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __81__COStateManager__onqueue_setDictionary_clusters_cacheLocally_completionHandler___block_invoke_3;
    v7[3] = &unk_24CD3F380;
    v8 = v3;
    v9 = v5;
    v10 = *(id *)(a1 + 32);
    v11 = *(id *)(a1 + 40);
    v13 = *(_BYTE *)(a1 + 64);
    v12 = *(id *)(a1 + 48);
    dispatch_async(v6, v7);

  }
}

void __81__COStateManager__onqueue_setDictionary_clusters_cacheLocally_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    v6 = *MEMORY[0x24BDD1398];
    v7[0] = v1;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("COStateManagerErrorDomain"), -1001, v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    COLogForCategory(4);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __81__COStateManager__onqueue_setDictionary_clusters_cacheLocally_completionHandler___block_invoke_3_cold_1();

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    if (*(_BYTE *)(a1 + 72))
      (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

  }
}

void __81__COStateManager__onqueue_setDictionary_clusters_cacheLocally_completionHandler___block_invoke_65(uint64_t a1, void *a2)
{
  id v3;
  NSObject **WeakRetained;
  uint64_t v5;
  uint64_t v6;
  NSObject **v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v3 = a2;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 48));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    v8 = WeakRetained[2];
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __81__COStateManager__onqueue_setDictionary_clusters_cacheLocally_completionHandler___block_invoke_2_66;
    v9[3] = &unk_24CD3ED38;
    v10 = v3;
    v11 = *(id *)(a1 + 32);
    dispatch_async(v8, v9);

  }
  (*(void (**)(_QWORD, id, uint64_t, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v3, v5, v6);

}

void __81__COStateManager__onqueue_setDictionary_clusters_cacheLocally_completionHandler___block_invoke_2_66(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v2, "userInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("COStateManagerErrorFailedClustersKey"));
    v4 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)_onqueue_removeObjectsForKeyPaths:(id)a3 clusters:(id)a4 cacheLocally:(BOOL)a5 completionHandler:(id)a6
{
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;
  id v38;
  BOOL v39;
  _QWORD v40[4];
  id v41;
  id v42;
  id v43;
  id v44;
  id location;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v29 = a3;
  v10 = a4;
  v30 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  if (-[COStateManager _onqueue_clustersValid:](self, "_onqueue_clustersValid:", v10))
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v12 = v29;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v47;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v47 != v14)
            objc_enumerationMutation(v12);
          v16 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v16, "absoluteString");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "addObject:", v17);

          }
        }
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
      }
      while (v13);
    }

    objc_initWeak(&location, self);
    v18 = MEMORY[0x24BDAC760];
    v40[0] = MEMORY[0x24BDAC760];
    v40[1] = 3221225472;
    v40[2] = __92__COStateManager__onqueue_removeObjectsForKeyPaths_clusters_cacheLocally_completionHandler___block_invoke;
    v40[3] = &unk_24CD3F358;
    objc_copyWeak(&v44, &location);
    v19 = v10;
    v41 = v19;
    v20 = v11;
    v42 = v20;
    v43 = v12;
    v21 = (void *)MEMORY[0x212BE9A2C](v40);
    v35[0] = v18;
    v35[1] = 3221225472;
    v35[2] = __92__COStateManager__onqueue_removeObjectsForKeyPaths_clusters_cacheLocally_completionHandler___block_invoke_2;
    v35[3] = &unk_24CD3F420;
    objc_copyWeak(&v38, &location);
    v22 = v30;
    v36 = v22;
    v39 = a5;
    v23 = v21;
    v37 = v23;
    -[COStateManager _remoteInterfaceWithErrorHandler:](self, "_remoteInterfaceWithErrorHandler:", v35);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      v25 = v19;
    }
    else
    {
      -[COStateManager clusters](self, "clusters");
      v25 = (id)objc_claimAutoreleasedReturnValue();
    }
    v27 = v25;
    v31[0] = v18;
    v31[1] = 3221225472;
    v31[2] = __92__COStateManager__onqueue_removeObjectsForKeyPaths_clusters_cacheLocally_completionHandler___block_invoke_68;
    v31[3] = &unk_24CD3F3D0;
    objc_copyWeak(&v34, &location);
    v28 = v23;
    v32 = v28;
    v33 = v22;
    objc_msgSend(v24, "removeKeyPaths:targetClusters:withCallback:", v20, v27, v31);

    objc_destroyWeak(&v34);
    objc_destroyWeak(&v38);

    objc_destroyWeak(&v44);
    objc_destroyWeak(&location);
  }
  else
  {
    COLogForCategory(4);
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      -[COStateManager _onqueue_removeObjectsForKeyPaths:clusters:cacheLocally:completionHandler:].cold.1();

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("COStateManagerErrorDomain"), -1000, 0);
    v20 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, id))v30 + 2))(v30, v20);
  }

}

void __92__COStateManager__onqueue_removeObjectsForKeyPaths_clusters_cacheLocally_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  id v31;
  unsigned int v32;
  void *v33;
  uint64_t v34;
  id obj;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _QWORD v46[2];
  _QWORD v47[2];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v36 = a1;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "state");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v7;
    if (v8)
    {
      objc_msgSend(v7, "state");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v9, "mutableCopy");

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }

    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    obj = *(id *)(v36 + 32);
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v48, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v42;
      v32 = a3;
      v31 = v5;
      v34 = *(_QWORD *)v42;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v42 != v13)
            objc_enumerationMutation(obj);
          v15 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i);
          if ((objc_msgSend(v5, "containsObject:", v15, v31) & 1) == 0)
          {
            objc_msgSend(v10, "objectForKeyedSubscript:", v15);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            if (v16)
            {
              objc_msgSend(v10, "objectForKeyedSubscript:", v15);
              v17 = v5;
              v18 = v12;
              v19 = v7;
              v20 = a3;
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v22 = (void *)objc_msgSend(v21, "mutableCopy");

              a3 = v20;
              v7 = v19;
              v12 = v18;
              v5 = v17;
            }
            else
            {
              objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
            }

            objc_msgSend(*(id *)(v36 + 40), "allObjects");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "removeObjectsForKeys:", v23);

            objc_msgSend(v10, "setObject:forKey:", v22, v15);
            objc_msgSend(v7, "setState:", v10);
            if ((_DWORD)a3)
            {
              v46[0] = CFSTR("COStateManagerChangesCluster");
              v46[1] = CFSTR("COStateManagerChangesRemovedKeyPaths");
              v24 = *(_QWORD *)(v36 + 48);
              v47[0] = v15;
              v47[1] = v24;
              objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v47, v46, 2);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v37 = 0u;
              v38 = 0u;
              v39 = 0u;
              v40 = 0u;
              objc_msgSend(v7, "observers");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
              if (v27)
              {
                v28 = v27;
                v29 = *(_QWORD *)v38;
                do
                {
                  for (j = 0; j != v28; ++j)
                  {
                    if (*(_QWORD *)v38 != v29)
                      objc_enumerationMutation(v26);
                    objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * j), "notify:", v25);
                  }
                  v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
                }
                while (v28);
              }

              v5 = v31;
              a3 = v32;
              v7 = v33;
            }

            v13 = v34;
          }
        }
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v48, 16);
      }
      while (v12);
    }

  }
}

void __92__COStateManager__onqueue_removeObjectsForKeyPaths_clusters_cacheLocally_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject **WeakRetained;
  NSObject **v5;
  NSObject *v6;
  _QWORD block[4];
  id v8;
  NSObject **v9;
  id v10;
  id v11;
  char v12;

  v3 = a2;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 48));
  v5 = WeakRetained;
  if (v3 && WeakRetained)
  {
    v6 = WeakRetained[2];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __92__COStateManager__onqueue_removeObjectsForKeyPaths_clusters_cacheLocally_completionHandler___block_invoke_3;
    block[3] = &unk_24CD3F3F8;
    v8 = v3;
    v9 = v5;
    v10 = *(id *)(a1 + 32);
    v12 = *(_BYTE *)(a1 + 56);
    v11 = *(id *)(a1 + 40);
    dispatch_async(v6, block);

  }
}

void __92__COStateManager__onqueue_removeObjectsForKeyPaths_clusters_cacheLocally_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  v6 = *MEMORY[0x24BDD1398];
  v7[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("COStateManagerErrorDomain"), -1001, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  COLogForCategory(4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __92__COStateManager__onqueue_removeObjectsForKeyPaths_clusters_cacheLocally_completionHandler___block_invoke_3_cold_1(a1, (uint64_t)v4, v5);

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  if (*(_BYTE *)(a1 + 64))
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

void __92__COStateManager__onqueue_removeObjectsForKeyPaths_clusters_cacheLocally_completionHandler___block_invoke_68(uint64_t a1, void *a2)
{
  id v3;
  NSObject **WeakRetained;
  uint64_t v5;
  uint64_t v6;
  NSObject **v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v3 = a2;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 48));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    v8 = WeakRetained[2];
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __92__COStateManager__onqueue_removeObjectsForKeyPaths_clusters_cacheLocally_completionHandler___block_invoke_2_69;
    v9[3] = &unk_24CD3ED38;
    v10 = v3;
    v11 = *(id *)(a1 + 32);
    dispatch_async(v8, v9);

  }
  (*(void (**)(_QWORD, id, uint64_t, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v3, v5, v6);

}

void __92__COStateManager__onqueue_removeObjectsForKeyPaths_clusters_cacheLocally_completionHandler___block_invoke_2_69(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v2, "userInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("COStateManagerErrorFailedClustersKey"));
    v4 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)_onqueue_registerObserver:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *);
  void *v12;
  id v13;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v9 = MEMORY[0x24BDAC760];
  v10 = 3221225472;
  v11 = __44__COStateManager__onqueue_registerObserver___block_invoke;
  v12 = &unk_24CD3F2E8;
  objc_copyWeak(&v13, &location);
  -[COStateManager _remoteInterfaceWithErrorHandler:](self, "_remoteInterfaceWithErrorHandler:", &v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "predicate", v9, v10, v11, v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[COStateManager suite](self, "suite");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[COStateManager clusters](self, "clusters");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserverWithPredicate:suite:interestClusters:", v6, v7, v8);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

void __44__COStateManager__onqueue_registerObserver___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (v3 && WeakRetained)
  {
    v9 = *MEMORY[0x24BDD1398];
    v10[0] = v3;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("COStateManagerErrorDomain"), -1001, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    COLogForCategory(4);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __44__COStateManager__onqueue_registerObserver___block_invoke_cold_1();

  }
}

- (void)_lostConnectionToService
{
  NSObject *workQueue;
  _QWORD block[5];
  id v5;
  id location;

  objc_initWeak(&location, self);
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__COStateManager__lostConnectionToService__block_invoke;
  block[3] = &unk_24CD3F470;
  objc_copyWeak(&v5, &location);
  block[4] = self;
  dispatch_async(workQueue, block);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __42__COStateManager__lostConnectionToService__block_invoke(uint64_t a1)
{
  _BYTE *WeakRetained;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  uint64_t v6;
  uint64_t j;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t k;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  id v25;
  id obj;
  _BYTE *v27;
  _QWORD v28[5];
  id v29;
  uint64_t *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && !WeakRetained[24])
  {
    WeakRetained[24] = 1;
    v27 = WeakRetained;
    objc_msgSend(WeakRetained, "observers");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "state");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    obj = v2;
    v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
    if (v3)
    {
      v4 = *(_QWORD *)v44;
      do
      {
        for (i = 0; i != v3; ++i)
        {
          if (*(_QWORD *)v44 != v4)
            objc_enumerationMutation(obj);
          objc_msgSend(v27, "_onqueue_registerObserver:", *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i), v21);
        }
        v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
      }
      while (v3);
    }

    if (objc_msgSend(v21, "count"))
    {
      v39 = 0;
      v40 = &v39;
      v41 = 0x2020000000;
      v42 = 0;
      v35 = 0u;
      v36 = 0u;
      v37 = 0u;
      v38 = 0u;
      v25 = v21;
      v6 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v35, v48, 16);
      if (v6)
      {
        v22 = *(_QWORD *)v36;
        do
        {
          v23 = v6;
          for (j = 0; j != v23; ++j)
          {
            if (*(_QWORD *)v36 != v22)
              objc_enumerationMutation(v25);
            v8 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * j);
            objc_msgSend(v25, "objectForKeyedSubscript:", v8, v21);
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = 0u;
            v34 = 0u;
            v31 = 0u;
            v32 = 0u;
            v11 = v9;
            v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v31, v47, 16);
            if (v12)
            {
              v13 = *(_QWORD *)v32;
              do
              {
                for (k = 0; k != v12; ++k)
                {
                  if (*(_QWORD *)v32 != v13)
                    objc_enumerationMutation(v11);
                  v15 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * k);
                  +[COKeyPath createWithString:](COKeyPath, "createWithString:", v15);
                  v16 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v11, "objectForKeyedSubscript:", v15);
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v10, "setObject:forKey:", v17, v16);

                }
                v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v31, v47, 16);
              }
              while (v12);
            }

            ++v40[3];
            v18 = *(void **)(a1 + 32);
            objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v8);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v28[0] = MEMORY[0x24BDAC760];
            v28[1] = 3221225472;
            v28[2] = __42__COStateManager__lostConnectionToService__block_invoke_2;
            v28[3] = &unk_24CD3F448;
            v28[4] = v27;
            v20 = v10;
            v29 = v20;
            v30 = &v39;
            objc_msgSend(v18, "_onqueue_setDictionary:clusters:cacheLocally:completionHandler:", v20, v19, 0, v28);

          }
          v6 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v35, v48, 16);
        }
        while (v6);
      }

      _Block_object_dispose(&v39, 8);
    }
    else
    {
      v27[24] = 0;
    }

    WeakRetained = v27;
  }

}

void __42__COStateManager__lostConnectionToService__block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  COLogForCategory(4);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __42__COStateManager__lostConnectionToService__block_invoke_2_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = a1[4];
    v7 = a1[5];
    v8 = 134218242;
    v9 = v6;
    v10 = 2112;
    v11 = v7;
    _os_log_impl(&dword_21214B000, v5, OS_LOG_TYPE_DEFAULT, "%p Successfully re-presented state %@", (uint8_t *)&v8, 0x16u);
  }

  if (!--*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24))
    *(_BYTE *)(a1[4] + 24) = 0;

}

- (BOOL)_onqueue_clustersValid:(id)a3
{
  NSObject *workQueue;
  id v5;
  void *v6;
  void *v7;

  workQueue = self->_workQueue;
  v5 = a3;
  dispatch_assert_queue_V2(workQueue);
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  -[COStateManager clusters](self, "clusters");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "minusSet:", v7);

  LOBYTE(v7) = objc_msgSend(v6, "count") == 0;
  return (char)v7;
}

- (id)_clustersForClustersTmp:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x24BDBCF20]);
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      do
      {
        v9 = 0;
        v10 = v4;
        do
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v5);
          +[COCluster _clusterForCluster:](COCluster, "_clusterForCluster:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9), (_QWORD)v13);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setByAddingObject:", v11);
          v4 = (id)objc_claimAutoreleasedReturnValue();

          ++v9;
          v10 = v4;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v7);
    }

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_sanitizeChanges:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("COStateManagerChangesUpdatedKeyPaths"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  objc_msgSend(v4, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v30 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
        +[COKeyPath createWithString:](COKeyPath, "createWithString:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKeyedSubscript:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKey:", v13, v12);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v8);
  }

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("COStateManagerChangesRemovedKeyPaths"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v16 = v14;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v26;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v26 != v19)
          objc_enumerationMutation(v16);
        +[COKeyPath createWithString:](COKeyPath, "createWithString:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * j));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addObject:", v21);

      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v18);
  }

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("COStateManagerChangesCluster"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setObject:forKey:", v22, CFSTR("COStateManagerChangesCluster"));

  objc_msgSend(v24, "setObject:forKey:", v5, CFSTR("COStateManagerChangesUpdatedKeyPaths"));
  objc_msgSend(v24, "setObject:forKey:", v15, CFSTR("COStateManagerChangesRemovedKeyPaths"));

  return v24;
}

- (void)_withLock:(id)a3
{
  os_unfair_lock_s *p_lock;
  void (**v4)(_QWORD);

  p_lock = &self->_lock;
  v4 = (void (**)(_QWORD))a3;
  os_unfair_lock_lock(p_lock);
  v4[2](v4);

  os_unfair_lock_unlock(p_lock);
}

- (id)_remoteInterfaceWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v4 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__2;
  v12 = __Block_byref_object_dispose__2;
  v13 = 0;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __51__COStateManager__remoteInterfaceWithErrorHandler___block_invoke;
  v7[3] = &unk_24CD3EEA8;
  v7[4] = self;
  v7[5] = &v8;
  -[COStateManager _withLock:](self, "_withLock:", v7);
  objc_msgSend((id)v9[5], "remoteObjectProxyWithErrorHandler:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __51__COStateManager__remoteInterfaceWithErrorHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  COStateManagerClientInterfaceMediator *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  id v35;
  void *v36;
  id v37;
  void *v38;
  COStateManagerClientInterfaceMediator *v39;
  _QWORD v40[4];
  id v41;
  id v42;
  _QWORD v43[4];
  id v44;
  id v45;
  id location[2];

  objc_msgSend(*(id *)(a1 + 32), "provider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stateManagerServiceConnection");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  objc_msgSend(*(id *)(a1 + 32), "lastConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 != v7)
  {
    v8 = &unk_254B49680;
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (+[COFeatureStatus isCOClusterEnabled](COFeatureStatus, "isCOClusterEnabled"))
    {
      objc_msgSend(v9, "classesForSelector:argumentIndex:ofReply:", sel_changesObserved_forPredicate_, 0, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setByAddingObject:", objc_opt_class());
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_changesObserved_forPredicate_, 0, 0);
    }
    v12 = -[COStateManagerClientInterfaceMediator initWithStateManager:]([COStateManagerClientInterfaceMediator alloc], "initWithStateManager:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setExportedInterface:", v9);
    v39 = v12;
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setExportedObject:", v12);
    v13 = &unk_254B4F9D8;

    v38 = v13;
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = (void *)MEMORY[0x24BDBCF20];
    v16 = objc_opt_class();
    v17 = objc_opt_class();
    v18 = objc_opt_class();
    v19 = objc_opt_class();
    v20 = objc_opt_class();
    objc_msgSend(v15, "setWithObjects:", v16, v17, v18, v19, v20, objc_opt_class(), 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setClasses:forSelector:argumentIndex:ofReply:", v21, sel_requestCompositionForCluster_withCallback_, 0, 1);
    +[COCluster _allowedClusterClasses](COCluster, "_allowedClusterClasses");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setClasses:forSelector:argumentIndex:ofReply:", v22, sel_requestCompositionForCluster_withCallback_, 0, 0);

    +[COCluster _allowedClusterClasses](COCluster, "_allowedClusterClasses");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setByAddingObject:", objc_opt_class());
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "setClasses:forSelector:argumentIndex:ofReply:", v24, sel_addObserverWithPredicate_suite_interestClusters_, 2, 0);
    objc_msgSend(v14, "setClasses:forSelector:argumentIndex:ofReply:", v24, sel_setDictionary_suite_interestClusters_targetCluster_withCallback_, 2, 0);
    objc_msgSend(v14, "setClasses:forSelector:argumentIndex:ofReply:", v24, sel_setDictionary_suite_interestClusters_targetCluster_withCallback_, 3, 0);
    objc_msgSend(v14, "setClasses:forSelector:argumentIndex:ofReply:", v24, sel_removeKeyPaths_targetClusters_withCallback_, 1, 0);
    objc_msgSend(v14, "classesForSelector:argumentIndex:ofReply:", sel_setDictionary_suite_interestClusters_targetCluster_withCallback_, 0, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    +[COCluster _allowedClusterClasses](COCluster, "_allowedClusterClasses");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setByAddingObjectsFromSet:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "setClasses:forSelector:argumentIndex:ofReply:", v27, sel_setDictionary_suite_interestClusters_targetCluster_withCallback_, 0, 1);
    objc_msgSend(v14, "classesForSelector:argumentIndex:ofReply:", sel_removeKeyPaths_targetClusters_withCallback_, 0, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    +[COCluster _allowedClusterClasses](COCluster, "_allowedClusterClasses");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setByAddingObjectsFromSet:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "setClasses:forSelector:argumentIndex:ofReply:", v30, sel_removeKeyPaths_targetClusters_withCallback_, 0, 1);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setRemoteObjectInterface:", v14);
    objc_initWeak(location, *(id *)(a1 + 32));
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "interruptionHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "invalidationHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "co_setOriginalInterruptionHandler:", v31);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "co_setOriginalInvalidationHandler:", v32);
    v33 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v34 = MEMORY[0x24BDAC760];
    v43[0] = MEMORY[0x24BDAC760];
    v43[1] = 3221225472;
    v43[2] = __51__COStateManager__remoteInterfaceWithErrorHandler___block_invoke_2;
    v43[3] = &unk_24CD3F498;
    v35 = v31;
    v44 = v35;
    objc_copyWeak(&v45, location);
    objc_msgSend(v33, "setInterruptionHandler:", v43);
    v36 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v40[0] = v34;
    v40[1] = 3221225472;
    v40[2] = __51__COStateManager__remoteInterfaceWithErrorHandler___block_invoke_144;
    v40[3] = &unk_24CD3F498;
    v37 = v32;
    v41 = v37;
    objc_copyWeak(&v42, location);
    objc_msgSend(v36, "setInvalidationHandler:", v40);
    objc_msgSend(*(id *)(a1 + 32), "setLastConnection:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "resume");
    objc_destroyWeak(&v42);

    objc_destroyWeak(&v45);
    objc_destroyWeak(location);

  }
}

void __51__COStateManager__remoteInterfaceWithErrorHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;
  NSObject *v4;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    COLogForCategory(4);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __51__COStateManager__remoteInterfaceWithErrorHandler___block_invoke_2_cold_1();

  }
}

void __51__COStateManager__remoteInterfaceWithErrorHandler___block_invoke_144(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;
  NSObject *v4;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    COLogForCategory(4);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __51__COStateManager__remoteInterfaceWithErrorHandler___block_invoke_144_cold_1();

  }
}

- (void)_invalidate
{
  id v2;

  -[COStateManagerConnectionProvider stateManagerServiceConnection](self->_provider, "stateManagerServiceConnection");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidate");

}

- (NSArray)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)suite
{
  return self->_suite;
}

- (NSSet)clusters
{
  return self->_clusters;
}

- (NSXPCConnection)lastConnection
{
  return (NSXPCConnection *)objc_loadWeakRetained((id *)&self->_lastConnection);
}

- (void)setLastConnection:(id)a3
{
  objc_storeWeak((id *)&self->_lastConnection, a3);
}

- (NSDictionary)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (COStateManagerConnectionProvider)provider
{
  return self->_provider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_provider, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_destroyWeak((id *)&self->_lastConnection);
  objc_storeStrong((id *)&self->_clusters, 0);
  objc_storeStrong((id *)&self->_suite, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

- (void)fetchCompositionForCluster:(id)a3 dispatchQueue:(id)a4 block:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  v11 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __85__COStateManager_ClusterExamination__fetchCompositionForCluster_dispatchQueue_block___block_invoke;
  v18[3] = &unk_24CD3F2E8;
  objc_copyWeak(&v19, &location);
  -[COStateManager _remoteInterfaceWithErrorHandler:](self, "_remoteInterfaceWithErrorHandler:", v18);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __85__COStateManager_ClusterExamination__fetchCompositionForCluster_dispatchQueue_block___block_invoke_218;
  v15[3] = &unk_24CD3F4E8;
  v13 = v9;
  v16 = v13;
  v14 = v10;
  v17 = v14;
  objc_msgSend(v12, "requestCompositionForCluster:withCallback:", v8, v15);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

}

void __85__COStateManager_ClusterExamination__fetchCompositionForCluster_dispatchQueue_block___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    COLogForCategory(4);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __85__COStateManager_ClusterExamination__fetchCompositionForCluster_dispatchQueue_block___block_invoke_cold_1();

  }
}

void __85__COStateManager_ClusterExamination__fetchCompositionForCluster_dispatchQueue_block___block_invoke_218(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __85__COStateManager_ClusterExamination__fetchCompositionForCluster_dispatchQueue_block___block_invoke_2;
  block[3] = &unk_24CD3F4C0;
  v7 = *(NSObject **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v13 = v6;
  v14 = v8;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

uint64_t __85__COStateManager_ClusterExamination__fetchCompositionForCluster_dispatchQueue_block___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)delayForDoorbellChimeWithCompletionHandler:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = MEMORY[0x24BDAC760];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __71__COStateManager_Doorbell__delayForDoorbellChimeWithCompletionHandler___block_invoke;
  v11[3] = &unk_24CD3F010;
  objc_copyWeak(&v13, &location);
  v6 = v4;
  v12 = v6;
  -[COStateManager _remoteInterfaceWithErrorHandler:](self, "_remoteInterfaceWithErrorHandler:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __71__COStateManager_Doorbell__delayForDoorbellChimeWithCompletionHandler___block_invoke_222;
  v9[3] = &unk_24CD3F510;
  v8 = v6;
  v10 = v8;
  objc_msgSend(v7, "doorbellDelayWithCallback:", v9);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

void __71__COStateManager_Doorbell__delayForDoorbellChimeWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (v3 && WeakRetained)
  {
    v9 = *MEMORY[0x24BDD1398];
    v10[0] = v3;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("COStateManagerErrorDomain"), -1001, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    COLogForCategory(4);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __71__COStateManager_Doorbell__delayForDoorbellChimeWithCompletionHandler___block_invoke_cold_1();

    (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(0.2);
  }

}

uint64_t __71__COStateManager_Doorbell__delayForDoorbellChimeWithCompletionHandler___block_invoke_222(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (id)homed_COStateManagerWithSuiteName:(id)a3 homeIdentifier:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  COStateManager *v9;
  NSObject *v10;
  int v12;
  COStateManager *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v6 = a3;
  +[COCluster _homeClusterForHomeKitHomeIdentifier:](COCluster, "_homeClusterForHomeKitHomeIdentifier:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[COStateManager initWithSuiteName:clusters:]([COStateManager alloc], "initWithSuiteName:clusters:", v6, v8);

  COLogForCategory(4);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 134218499;
    v13 = v9;
    v14 = 2113;
    v15 = v5;
    v16 = 2112;
    v17 = v7;
    _os_log_impl(&dword_21214B000, v10, OS_LOG_TYPE_DEFAULT, "%p Created homed COStateManager instance for %{private}@, cluster %@", (uint8_t *)&v12, 0x20u);
  }

  return v9;
}

- (void)initWithConnectionProvider:(uint64_t)a1 suite:(uint64_t)a2 clusters:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  objc_class *v5;
  void *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 134218242;
  v9 = a1;
  v10 = 2112;
  v11 = v6;
  OUTLINED_FUNCTION_5(&dword_21214B000, a3, v7, "%p state manager created with %@ provider", (uint8_t *)&v8);

}

void __71__COStateManager_addObserverForKeyPathUsingPredicate_queue_usingBlock___block_invoke_cold_1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_5(&dword_21214B000, v0, (uint64_t)v0, "StateManager %p adding observer with predicate %@", v1);
  OUTLINED_FUNCTION_1();
}

void __33__COStateManager_removeObserver___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_21214B000, v0, v1, "%p failed to get state manager remote proxy for removal of observation - %@");
  OUTLINED_FUNCTION_1();
}

void __47__COStateManager_changesObserved_forPredicate___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_5(&dword_21214B000, v0, v1, "StateManager %p observed changes %@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)_onqueue_setDictionary:clusters:cacheLocally:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4(&dword_21214B000, v0, v1, "Cannot set value for clusters %@ outside scope of COStateManager", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __81__COStateManager__onqueue_setDictionary_clusters_cacheLocally_completionHandler___block_invoke_3_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_6(&dword_21214B000, v0, v1, "%p failed to get state manager remote proxy for setting state %@ - %@. Setting state locally");
}

- (void)_onqueue_removeObjectsForKeyPaths:clusters:cacheLocally:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4(&dword_21214B000, v0, v1, "Cannot remove value for clusters %@ outside scope of COStateManager", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __92__COStateManager__onqueue_removeObjectsForKeyPaths_clusters_cacheLocally_completionHandler___block_invoke_3_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 134218242;
  *(_QWORD *)&v3[4] = *(_QWORD *)(a1 + 40);
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_0(&dword_21214B000, a2, a3, "%p failed to get state manager remote proxy for removing object with key - %@. Removing state locally", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_1();
}

void __44__COStateManager__onqueue_registerObserver___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_21214B000, v0, v1, "%p failed to get state manager remote proxy for observation - %@");
  OUTLINED_FUNCTION_1();
}

void __42__COStateManager__lostConnectionToService__block_invoke_2_cold_1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_1();
  _os_log_error_impl(&dword_21214B000, v0, OS_LOG_TYPE_ERROR, "%p Failed to re-present state %@", v1, 0x16u);
  OUTLINED_FUNCTION_1();
}

void __51__COStateManager__remoteInterfaceWithErrorHandler___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4(&dword_21214B000, v0, v1, "%p connection to State service interrupted", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __51__COStateManager__remoteInterfaceWithErrorHandler___block_invoke_144_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4(&dword_21214B000, v0, v1, "%p connection to State service invalidated", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __85__COStateManager_ClusterExamination__fetchCompositionForCluster_dispatchQueue_block___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_21214B000, v0, v1, "%p failed to get state manager remote proxy for cluster composition - %@");
  OUTLINED_FUNCTION_1();
}

void __71__COStateManager_Doorbell__delayForDoorbellChimeWithCompletionHandler___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6(&dword_21214B000, v0, v1, "%p failed to get state manager remote proxy for doorbell delay - %@. Falling back to default delay of %f seconds");
}

@end
