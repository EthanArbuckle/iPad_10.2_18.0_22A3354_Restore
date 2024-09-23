@implementation COCapabilityManager

- (COCapabilityManager)initWithConnectionProvider:(id)a3
{
  id v5;
  COCapabilityManager *v6;
  COCapabilityManager *v7;
  NSSet *v8;
  NSSet *registeredCapabilities;
  NSArray *v10;
  NSArray *observers;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *observerQueue;
  NSObject *v15;
  objc_super v17;

  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)COCapabilityManager;
  v6 = -[COCapabilityManager init](&v17, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v6->_provider, a3);
    v8 = (NSSet *)objc_alloc_init(MEMORY[0x24BDBCF20]);
    registeredCapabilities = v7->_registeredCapabilities;
    v7->_registeredCapabilities = v8;

    v10 = (NSArray *)objc_alloc_init(MEMORY[0x24BDBCE30]);
    observers = v7->_observers;
    v7->_observers = v10;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = dispatch_queue_create("com.apple.coordination.COCapabilityManager.observer", v12);
    observerQueue = v7->_observerQueue;
    v7->_observerQueue = (OS_dispatch_queue *)v13;

    COLogForCategory(3);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      -[COCapabilityManager initWithConnectionProvider:].cold.1((uint64_t)v7, (uint64_t)v5, v15);

  }
  return v7;
}

- (COCapabilityManager)init
{
  _COCapabilityManagerConnectionProvider *v3;
  COCapabilityManager *v4;

  v3 = objc_alloc_init(_COCapabilityManagerConnectionProvider);
  v4 = -[COCapabilityManager initWithConnectionProvider:](self, "initWithConnectionProvider:", v3);

  return v4;
}

- (void)dealloc
{
  objc_super v3;
  _QWORD v4[5];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __30__COCapabilityManager_dealloc__block_invoke;
  v4[3] = &unk_24CD3EFE8;
  v4[4] = self;
  -[COCapabilityManager _withLock:](self, "_withLock:", v4);
  v3.receiver = self;
  v3.super_class = (Class)COCapabilityManager;
  -[COCapabilityManager dealloc](&v3, sel_dealloc);
}

void __30__COCapabilityManager_dealloc__block_invoke(uint64_t a1)
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

- (void)registerCapability:(id)a3
{
  id v4;
  void *v5;
  char v6;
  NSObject *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[COCapabilityManager registeredCapabilities](self, "registeredCapabilities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  if ((v6 & 1) != 0)
  {
    COLogForCategory(3);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[COCapabilityManager registerCapability:].cold.1();

  }
  else
  {
    -[COCapabilityManager registeredCapabilities](self, "registeredCapabilities");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setByAddingObject:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[COCapabilityManager setRegisteredCapabilities:](self, "setRegisteredCapabilities:", v9);
    -[COCapabilityManager _registerCapabililty:](self, "_registerCapabililty:", v4);

  }
}

- (void)unregisterCapability:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;

  v4 = a3;
  -[COCapabilityManager registeredCapabilities](self, "registeredCapabilities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "containsObject:", v4))
  {
    v6 = objc_msgSend(v5, "mutableCopy");
    -[NSObject removeObject:](v6, "removeObject:", v4);
    -[COCapabilityManager setRegisteredCapabilities:](self, "setRegisteredCapabilities:", v6);
    objc_initWeak(&location, self);
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __44__COCapabilityManager_unregisterCapability___block_invoke;
    v10[3] = &unk_24CD3FF70;
    objc_copyWeak(&v12, &location);
    v7 = v4;
    v11 = v7;
    -[COCapabilityManager _remoteInterfaceWithErrorHandler:](self, "_remoteInterfaceWithErrorHandler:", v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    COLogForCategory(3);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[COCapabilityManager unregisterCapability:].cold.1();

    objc_msgSend(v8, "unregisterCapability:", v7);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);

  }
  else
  {
    COLogForCategory(3);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[COCapabilityManager unregisterCapability:].cold.2();
  }

}

void __44__COCapabilityManager_unregisterCapability___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  uint64_t v6;
  int v7;
  id v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    COLogForCategory(3);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = 134218498;
      v8 = WeakRetained;
      v9 = 2112;
      v10 = v6;
      v11 = 2112;
      v12 = v3;
      _os_log_error_impl(&dword_21214B000, v5, OS_LOG_TYPE_ERROR, "%p failed to unregister Capability(%@): %@", (uint8_t *)&v7, 0x20u);
    }

  }
}

- (id)addObserverForCapability:(id)a3 inCluster:(id)a4 usingBlock:(id)a5
{
  id v8;
  id v9;
  void *v10;
  _COCapabilityObserver *v11;
  void *v12;
  void *v13;
  NSObject *v14;

  v8 = a5;
  v9 = a3;
  +[COCluster _clusterForCluster:](COCluster, "_clusterForCluster:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[_COCapabilityObserver initWithCapability:cluster:block:]([_COCapabilityObserver alloc], "initWithCapability:cluster:block:", v9, v10, v8);

  -[COCapabilityManager observers](self, "observers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "mutableCopy");

  objc_msgSend(v13, "addObject:", v11);
  -[COCapabilityManager setObservers:](self, "setObservers:", v13);
  COLogForCategory(3);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    -[COCapabilityManager addObserverForCapability:inCluster:usingBlock:].cold.1();

  -[COCapabilityManager _registerObserver:](self, "_registerObserver:", v11);
  return v11;
}

- (void)removeObserver:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id location;

  v4 = a3;
  -[COCapabilityManager observers](self, "observers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", v4);
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = v6;
    v8 = (void *)objc_msgSend(v5, "mutableCopy");
    objc_msgSend(v8, "objectAtIndex:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObjectAtIndex:", v7);
    -[COCapabilityManager setObservers:](self, "setObservers:", v8);
    objc_initWeak(&location, self);
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __38__COCapabilityManager_removeObserver___block_invoke;
    v14[3] = &unk_24CD3FF70;
    objc_copyWeak(&v16, &location);
    v15 = v4;
    -[COCapabilityManager _remoteInterfaceWithErrorHandler:](self, "_remoteInterfaceWithErrorHandler:", v14);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    COLogForCategory(3);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[COCapabilityManager removeObserver:].cold.1();

    objc_msgSend(v9, "capability");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cluster");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeObserverForCapability:inCluster:", v12, v13);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);

  }
}

void __38__COCapabilityManager_removeObserver___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  uint64_t v6;
  int v7;
  id v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    COLogForCategory(3);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = 134218754;
      v8 = WeakRetained;
      v9 = 2048;
      v10 = v6;
      v11 = 2112;
      v12 = v6;
      v13 = 2112;
      v14 = v3;
      _os_log_error_impl(&dword_21214B000, v5, OS_LOG_TYPE_ERROR, "%p failed to remove Observer(%p/%@): %@", (uint8_t *)&v7, 0x2Au);
    }

  }
}

- (void)availabilityChanged:(BOOL)a3 ofCapability:(id)a4 inCluster:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  int v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  COCapabilityManager *v20;
  _BOOL4 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t v26[128];
  uint8_t buf[4];
  COCapabilityManager *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;
  __int16 v33;
  int v34;
  uint64_t v35;

  v21 = a3;
  v35 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  COLogForCategory(3);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218754;
    v28 = self;
    if (v21)
      v10 = 89;
    else
      v10 = 78;
    v29 = 2112;
    v30 = v7;
    v31 = 2112;
    v32 = v8;
    v33 = 1024;
    v34 = v10;
    _os_log_impl(&dword_21214B000, v9, OS_LOG_TYPE_DEFAULT, "%p received notification that Capability(%@) in Cluster(%@) is Available(%c)", buf, 0x26u);
  }

  v20 = self;
  -[COCapabilityManager observers](self, "observers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v23 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v16, "capability");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v17, "isEqualToString:", v7) & 1) != 0)
        {
          objc_msgSend(v16, "cluster");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "isEqual:", v8);

          if (v19)
            -[COCapabilityManager _notifyObserver:available:](v20, "_notifyObserver:available:", v16, v21);
        }
        else
        {

        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v13);
  }

}

- (NSSet)registeredCapabilities
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__5;
  v9 = __Block_byref_object_dispose__5;
  v10 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __45__COCapabilityManager_registeredCapabilities__block_invoke;
  v4[3] = &unk_24CD3EEA8;
  v4[4] = self;
  v4[5] = &v5;
  -[COCapabilityManager _withLock:](self, "_withLock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSSet *)v2;
}

void __45__COCapabilityManager_registeredCapabilities__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 16));
}

- (void)setRegisteredCapabilities:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  COCapabilityManager *v8;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __49__COCapabilityManager_setRegisteredCapabilities___block_invoke;
  v6[3] = &unk_24CD3EF20;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[COCapabilityManager _withLock:](self, "_withLock:", v6);

}

void __49__COCapabilityManager_setRegisteredCapabilities___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  if (v2 != *(void **)(*(_QWORD *)(a1 + 40) + 16) && (objc_msgSend(v2, "isEqualToSet:") & 1) == 0)
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "copy");
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(void **)(v4 + 16);
    *(_QWORD *)(v4 + 16) = v3;

  }
}

- (NSArray)observers
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__5;
  v9 = __Block_byref_object_dispose__5;
  v10 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __32__COCapabilityManager_observers__block_invoke;
  v4[3] = &unk_24CD3EEA8;
  v4[4] = self;
  v4[5] = &v5;
  -[COCapabilityManager _withLock:](self, "_withLock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSArray *)v2;
}

void __32__COCapabilityManager_observers__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 24));
}

- (void)setObservers:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  COCapabilityManager *v8;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __36__COCapabilityManager_setObservers___block_invoke;
  v6[3] = &unk_24CD3EF20;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[COCapabilityManager _withLock:](self, "_withLock:", v6);

}

void __36__COCapabilityManager_setObservers___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  if (v2 != *(void **)(*(_QWORD *)(a1 + 40) + 24) && (objc_msgSend(v2, "isEqualToArray:") & 1) == 0)
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "copy");
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(void **)(v4 + 24);
    *(_QWORD *)(v4 + 24) = v3;

  }
}

- (void)_notifyObserver:(id)a3 available:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  int v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  BOOL v15;
  uint8_t buf[4];
  COCapabilityManager *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  __int16 v22;
  int v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v4 = a4;
  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  COLogForCategory(3);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    if (v4)
      v8 = 89;
    else
      v8 = 78;
    objc_msgSend(v6, "capability");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cluster");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134219266;
    v17 = self;
    v18 = 2048;
    v19 = v6;
    v20 = 2112;
    v21 = v6;
    v22 = 1024;
    v23 = v8;
    v24 = 2112;
    v25 = v9;
    v26 = 2112;
    v27 = v10;
    _os_log_impl(&dword_21214B000, v7, OS_LOG_TYPE_DEFAULT, "%p notifying Observer(%p/%@) of Availability(%c) for Capability(%@) in Cluster(%@)", buf, 0x3Au);

  }
  -[COCapabilityManager observerQueue](self, "observerQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __49__COCapabilityManager__notifyObserver_available___block_invoke;
  v13[3] = &unk_24CD40178;
  v14 = v6;
  v15 = v4;
  v12 = v6;
  dispatch_async(v11, v13);

}

uint64_t __49__COCapabilityManager__notifyObserver_available___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "notify:", *(unsigned __int8 *)(a1 + 40));
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
  v11 = __Block_byref_object_copy__5;
  v12 = __Block_byref_object_dispose__5;
  v13 = 0;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __56__COCapabilityManager__remoteInterfaceWithErrorHandler___block_invoke;
  v7[3] = &unk_24CD3EEA8;
  v7[4] = self;
  v7[5] = &v8;
  -[COCapabilityManager _withLock:](self, "_withLock:", v7);
  objc_msgSend((id)v9[5], "remoteObjectProxyWithErrorHandler:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __56__COCapabilityManager__remoteInterfaceWithErrorHandler___block_invoke(uint64_t a1)
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
  COCapabilityManagerClientInterfaceMediator *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id location;

  objc_msgSend(*(id *)(a1 + 32), "provider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "capabilityManagerServiceConnection");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  objc_msgSend(*(id *)(a1 + 32), "lastConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 != v7)
  {
    v8 = (void *)MEMORY[0x24BDD1990];
    v9 = &unk_254B4BA70;
    objc_msgSend(v8, "interfaceWithProtocol:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[COCluster _allowedClusterClasses](COCluster, "_allowedClusterClasses");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_availabilityChanged_ofCapability_inCluster_, 2, 0);

    v12 = -[COCapabilityManagerClientInterfaceMediator initWithCapabilityManager:]([COCapabilityManagerClientInterfaceMediator alloc], "initWithCapabilityManager:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setExportedInterface:", v10);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setExportedObject:", v12);
    v13 = &unk_254B4FAF8;

    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    +[COCluster _allowedClusterClasses](COCluster, "_allowedClusterClasses");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setClasses:forSelector:argumentIndex:ofReply:", v15, sel_addObserverForCapability_inCluster_, 1, 0);

    +[COCluster _allowedClusterClasses](COCluster, "_allowedClusterClasses");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setClasses:forSelector:argumentIndex:ofReply:", v16, sel_removeObserverForCapability_inCluster_, 1, 0);

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setRemoteObjectInterface:", v14);
    objc_initWeak(&location, *(id *)(a1 + 32));
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "interruptionHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "invalidationHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "co_setOriginalInterruptionHandler:", v17);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "co_setOriginalInvalidationHandler:", v18);
    v19 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v20 = MEMORY[0x24BDAC760];
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __56__COCapabilityManager__remoteInterfaceWithErrorHandler___block_invoke_2;
    v27[3] = &unk_24CD3F498;
    v21 = v17;
    v28 = v21;
    objc_copyWeak(&v29, &location);
    objc_msgSend(v19, "setInterruptionHandler:", v27);
    v22 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v24[0] = v20;
    v24[1] = 3221225472;
    v24[2] = __56__COCapabilityManager__remoteInterfaceWithErrorHandler___block_invoke_68;
    v24[3] = &unk_24CD3F498;
    v23 = v18;
    v25 = v23;
    objc_copyWeak(&v26, &location);
    objc_msgSend(v22, "setInvalidationHandler:", v24);
    objc_msgSend(*(id *)(a1 + 32), "setLastConnection:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "resume");
    objc_destroyWeak(&v26);

    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);

  }
}

void __56__COCapabilityManager__remoteInterfaceWithErrorHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    COLogForCategory(3);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __56__COCapabilityManager__remoteInterfaceWithErrorHandler___block_invoke_2_cold_1((uint64_t)WeakRetained, v4, v5, v6, v7, v8, v9, v10);

  }
}

void __56__COCapabilityManager__remoteInterfaceWithErrorHandler___block_invoke_68(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    COLogForCategory(3);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __56__COCapabilityManager__remoteInterfaceWithErrorHandler___block_invoke_68_cold_1((uint64_t)WeakRetained, v4, v5, v6, v7, v8, v9, v10);

  }
}

- (void)_lostConnectionToService
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  COCapabilityManager *v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  -[COCapabilityManager observers](self, "observers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[COCapabilityManager registeredCapabilities](self, "registeredCapabilities");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v27, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v5);
        -[COCapabilityManager _registerObserver:](self, "_registerObserver:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v27, 16);
    }
    while (v7);
  }

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v10 = v4;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v26, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v17;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(v10);
        -[COCapabilityManager _registerCapabililty:](self, "_registerCapabililty:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v14++), (_QWORD)v16);
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v26, 16);
    }
    while (v12);
  }

  COLogForCategory(3);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v25 = self;
    _os_log_impl(&dword_21214B000, v15, OS_LOG_TYPE_DEFAULT, "%p done restoring state after lost connection to service", buf, 0xCu);
  }

}

- (void)_registerCapabililty:(id)a3
{
  id v4;
  id v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __44__COCapabilityManager__registerCapabililty___block_invoke;
  v8[3] = &unk_24CD3FF70;
  objc_copyWeak(&v10, &location);
  v5 = v4;
  v9 = v5;
  -[COCapabilityManager _remoteInterfaceWithErrorHandler:](self, "_remoteInterfaceWithErrorHandler:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  COLogForCategory(3);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[COCapabilityManager _registerCapabililty:].cold.1();

  objc_msgSend(v6, "registerCapability:", v5);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __44__COCapabilityManager__registerCapabililty___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  uint64_t v6;
  int v7;
  id v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    COLogForCategory(3);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = 134218498;
      v8 = WeakRetained;
      v9 = 2112;
      v10 = v6;
      v11 = 2112;
      v12 = v3;
      _os_log_error_impl(&dword_21214B000, v5, OS_LOG_TYPE_ERROR, "%p failed to register Capability(%@): %@", (uint8_t *)&v7, 0x20u);
    }

  }
}

- (void)_registerObserver:(id)a3
{
  id v4;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __41__COCapabilityManager__registerObserver___block_invoke;
  v10[3] = &unk_24CD3FF70;
  objc_copyWeak(&v12, &location);
  v5 = v4;
  v11 = v5;
  -[COCapabilityManager _remoteInterfaceWithErrorHandler:](self, "_remoteInterfaceWithErrorHandler:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  COLogForCategory(3);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[COCapabilityManager _registerObserver:].cold.1();

  objc_msgSend(v5, "capability");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cluster");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserverForCapability:inCluster:", v8, v9);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

void __41__COCapabilityManager__registerObserver___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  uint64_t v6;
  int v7;
  id v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    COLogForCategory(3);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = 134218754;
      v8 = WeakRetained;
      v9 = 2048;
      v10 = v6;
      v11 = 2112;
      v12 = v6;
      v13 = 2112;
      v14 = v3;
      _os_log_error_impl(&dword_21214B000, v5, OS_LOG_TYPE_ERROR, "%p failed to add Observer(%p/%@): %@", (uint8_t *)&v7, 0x2Au);
    }

  }
}

- (OS_dispatch_queue)observerQueue
{
  return self->_observerQueue;
}

- (NSXPCConnection)lastConnection
{
  return (NSXPCConnection *)objc_loadWeakRetained((id *)&self->_lastConnection);
}

- (void)setLastConnection:(id)a3
{
  objc_storeWeak((id *)&self->_lastConnection, a3);
}

- (COCapabilityManagerConnectionProvider)provider
{
  return self->_provider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_provider, 0);
  objc_destroyWeak((id *)&self->_lastConnection);
  objc_storeStrong((id *)&self->_observerQueue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_registeredCapabilities, 0);
}

- (void)initWithConnectionProvider:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
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
  OUTLINED_FUNCTION_5(&dword_21214B000, a3, v7, "%p created with %@ provider", (uint8_t *)&v8);

}

- (void)registerCapability:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_21214B000, v0, v1, "%p ignoring duplicate registration of Capability(%@)");
  OUTLINED_FUNCTION_1();
}

- (void)unregisterCapability:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5(&dword_21214B000, v0, (uint64_t)v0, "%p unregistering Capability(%@)", v1);
  OUTLINED_FUNCTION_1();
}

- (void)unregisterCapability:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_21214B000, v0, v1, "%p cannot unregister Capability(%@) that is not registered");
  OUTLINED_FUNCTION_1();
}

- (void)addObserverForCapability:inCluster:usingBlock:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_2(&dword_21214B000, v0, v1, "%p adding Observer(%p/%@)");
  OUTLINED_FUNCTION_7_1();
}

- (void)removeObserver:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_2(&dword_21214B000, v0, v1, "%p removing Observer(%p/%@)");
  OUTLINED_FUNCTION_7_1();
}

void __56__COCapabilityManager__remoteInterfaceWithErrorHandler___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_21214B000, a2, a3, "%p connection to Capability service interrupted", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void __56__COCapabilityManager__remoteInterfaceWithErrorHandler___block_invoke_68_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_21214B000, a2, a3, "%p connection to Capability service invalidated", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)_registerCapabililty:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5(&dword_21214B000, v0, (uint64_t)v0, "%p registering Capability(%@)", v1);
  OUTLINED_FUNCTION_1();
}

- (void)_registerObserver:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_2(&dword_21214B000, v0, v1, "%p registering Observer(%p/%@) with service");
  OUTLINED_FUNCTION_7_1();
}

@end
