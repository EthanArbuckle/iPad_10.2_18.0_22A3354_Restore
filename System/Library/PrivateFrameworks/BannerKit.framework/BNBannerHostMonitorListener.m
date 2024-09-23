@implementation BNBannerHostMonitorListener

- (BOOL)isBannerHostAvailable
{
  BNBannerHostMonitorListener *v2;
  BOOL v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = -[NSMutableArray count](v2->_connections, "count") != 0;
  objc_sync_exit(v2);

  return v3;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    BNRegisterBannerKitLogging();
}

- (BNBannerHostMonitorListener)initWithServiceDomain:(id)a3 authorizedBundleIDs:(id)a4
{
  id v7;
  id v8;
  BNBannerHostMonitorListener *v9;
  uint64_t Serial;
  OS_dispatch_queue *queue;
  void *v12;
  id *v13;
  uint64_t v14;
  id v15;
  void *v16;
  NSObject *v17;
  objc_class *v18;
  void *v19;
  void *v20;
  void *v22;
  _QWORD v23[4];
  id v24;
  id *v25;
  objc_super v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v26.receiver = self;
  v26.super_class = (Class)BNBannerHostMonitorListener;
  v9 = -[BNBannerHostMonitorListener init](&v26, sel_init);
  if (v9)
  {
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, v9, CFSTR("BNBannerHostMonitorListener.m"), 43, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("serviceDomain"));

    }
    objc_storeStrong((id *)&v9->_authorizedBundleIDs, a4);
    Serial = BSDispatchQueueCreateSerial();
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)Serial;

    v12 = (void *)MEMORY[0x1E0D228C8];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __73__BNBannerHostMonitorListener_initWithServiceDomain_authorizedBundleIDs___block_invoke;
    v23[3] = &unk_1E7044420;
    v24 = v7;
    v13 = v9;
    v25 = v13;
    objc_msgSend(v12, "listenerWithConfigurator:", v23);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v13[2];
    v13[2] = (id)v14;

    v16 = (void *)BNLogHostingService;
    if (os_log_type_enabled((os_log_t)BNLogHostingService, OS_LOG_TYPE_DEFAULT))
    {
      v17 = v16;
      v18 = (objc_class *)objc_opt_class();
      NSStringFromClass(v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "description");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v28 = v19;
      v29 = 2114;
      v30 = v20;
      _os_log_impl(&dword_1B9628000, v17, OS_LOG_TYPE_DEFAULT, "Initializing new %{public}@ instance: %{public}@", buf, 0x16u);

    }
    objc_msgSend(v13[2], "activate");

  }
  return v9;
}

void __73__BNBannerHostMonitorListener_initWithServiceDomain_authorizedBundleIDs___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = *(_QWORD *)(a1 + 32);
  v5 = a2;
  objc_msgSend(v5, "setDomain:", v3);
  +[BNBannerHostMonitorSessionSpecification identifier](BNBannerHostMonitorSessionSpecification, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setService:", v4);

  objc_msgSend(v5, "setDelegate:", *(_QWORD *)(a1 + 40));
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[BSServiceConnectionListener domain](self->_connectionListener, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; serviceDomain: %@; authorizedBundleIDs: %@>"),
    v4,
    self,
    v5,
    self->_authorizedBundleIDs);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (void)addObserver:(id)a3
{
  id v4;
  BNBannerHostMonitorListener *v5;
  NSHashTable *observers;
  uint64_t v7;
  NSHashTable *v8;
  id v9;

  v4 = a3;
  if (v4)
  {
    v9 = v4;
    v5 = self;
    objc_sync_enter(v5);
    observers = v5->_observers;
    if (!observers)
    {
      objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 517);
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = v5->_observers;
      v5->_observers = (NSHashTable *)v7;

      observers = v5->_observers;
    }
    -[NSHashTable addObject:](observers, "addObject:", v9);
    objc_sync_exit(v5);

    v4 = v9;
  }

}

- (void)removeObserver:(id)a3
{
  id v4;
  BNBannerHostMonitorListener *v5;
  NSHashTable *observers;
  id v7;

  v4 = a3;
  if (v4)
  {
    v7 = v4;
    v5 = self;
    objc_sync_enter(v5);
    observers = v5->_observers;
    if (observers)
      -[NSHashTable removeObject:](observers, "removeObject:", v7);
    objc_sync_exit(v5);

    v4 = v7;
  }

}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  BNBannerHostMonitorListener *v11;
  void *v12;
  _BOOL4 v13;
  id v14;
  NSObject *v15;
  objc_class *v16;
  id v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  uint8_t buf[24];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  objc_sync_enter(v11);
  objc_msgSend(v9, "remoteProcess");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  v13 = -[BNBannerHostMonitorListener _isConnectingProcessAuthorized:error:](v11, "_isConnectingProcessAuthorized:error:", v12, &v20);
  v14 = v20;

  if (v13)
  {
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __73__BNBannerHostMonitorListener_listener_didReceiveConnection_withContext___block_invoke;
    v19[3] = &unk_1E70442E8;
    v19[4] = v11;
    objc_msgSend(v9, "configureConnection:", v19);
    -[BNBannerHostMonitorListener _addConnection:](v11, "_addConnection:", v9);
  }
  else
  {
    v15 = (id)BNLogHostingService;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      v17 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "localizedDescription");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[BNBannerHostMonitorListener listener:didReceiveConnection:withContext:].cold.1(v17, v18, buf, v15);
    }

    objc_msgSend(v9, "invalidate");
  }

  objc_sync_exit(v11);
}

void __73__BNBannerHostMonitorListener_listener_didReceiveConnection_withContext___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;
  id location;

  v3 = a2;
  +[BNBannerHostMonitorSessionSpecification serviceQuality](BNBannerHostMonitorSessionSpecification, "serviceQuality");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setServiceQuality:", v4);

  +[BNBannerHostMonitorSessionSpecification interface](BNBannerHostMonitorSessionSpecification, "interface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInterface:", v5);

  objc_msgSend(v3, "setInterfaceTarget:", *(_QWORD *)(a1 + 32));
  objc_initWeak(&location, *(id *)(a1 + 32));
  v6 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __73__BNBannerHostMonitorListener_listener_didReceiveConnection_withContext___block_invoke_2;
  v9[3] = &unk_1E7044FD8;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v3, "setActivationHandler:", v9);
  v7[0] = v6;
  v7[1] = 3221225472;
  v7[2] = __73__BNBannerHostMonitorListener_listener_didReceiveConnection_withContext___block_invoke_18;
  v7[3] = &unk_1E7044470;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v3, "setInvalidationHandler:", v7);
  objc_msgSend(v3, "setTargetQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __73__BNBannerHostMonitorListener_listener_didReceiveConnection_withContext___block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id WeakRetained;
  objc_class *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = (void *)BNLogHostingService;
  if (os_log_type_enabled((os_log_t)BNLogHostingService, OS_LOG_TYPE_DEFAULT))
  {
    v3 = v2;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_1B9628000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ (client-side) connection did activate", (uint8_t *)&v7, 0xCu);

  }
}

void __73__BNBannerHostMonitorListener_listener_didReceiveConnection_withContext___block_invoke_18(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  v5 = (void *)BNLogHostingService;
  if (os_log_type_enabled((os_log_t)BNLogHostingService, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v8;
    _os_log_impl(&dword_1B9628000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ (client-side) connection invalidated", (uint8_t *)&v9, 0xCu);

  }
  objc_msgSend(WeakRetained, "_removeConnection:", v3);

}

- (BOOL)_isConnectingProcessAuthorized:(id)a3 error:(id *)a4
{
  id v6;
  unsigned __int8 v7;
  NSSet *authorizedBundleIDs;
  void *v9;
  BOOL v10;
  BOOL v11;
  id v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = objc_msgSend(v6, "hasEntitlement:", CFSTR("com.apple.bannerkit.hostmonitor"));
  authorizedBundleIDs = self->_authorizedBundleIDs;
  objc_msgSend(v6, "bundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[NSSet containsObject:](authorizedBundleIDs, "containsObject:", v9);
  v11 = v7 & v10;
  if (a4 && (v7 & v10 & 1) == 0)
  {
    v12 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
    v13 = v12;
    if ((v7 & 1) == 0)
      objc_msgSend(v12, "appendString:", CFSTR("missing entitlement"));
    if (!v10)
    {
      if (objc_msgSend(v13, "length"))
        v14 = CFSTR(", not an authorized bundle ID");
      else
        v14 = CFSTR("not an authorized bundle ID");
      objc_msgSend(v13, "appendString:", v14);
    }
    v15 = (void *)MEMORY[0x1E0CB35C8];
    v18 = *MEMORY[0x1E0CB2D50];
    v19[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("BNBannerSourceErrorDomain"), 0, v16);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

- (void)_addConnection:(id)a3
{
  id v4;
  BNBannerHostMonitorListener *v5;
  NSMutableArray *connections;
  NSMutableArray *v7;
  NSMutableArray *v8;
  _QWORD block[5];

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  connections = v5->_connections;
  if (!connections)
  {
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v8 = v5->_connections;
    v5->_connections = v7;

    connections = v5->_connections;
  }
  -[NSMutableArray addObject:](connections, "addObject:", v4);
  objc_msgSend(v4, "activate");
  if (-[NSMutableArray count](v5->_connections, "count") == 1)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __46__BNBannerHostMonitorListener__addConnection___block_invoke;
    block[3] = &unk_1E7044948;
    block[4] = v5;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
  objc_sync_exit(v5);

}

uint64_t __46__BNBannerHostMonitorListener__addConnection___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __46__BNBannerHostMonitorListener__addConnection___block_invoke_2;
  v3[3] = &unk_1E7045000;
  v3[4] = v1;
  return objc_msgSend(v1, "_notifyObserversWithBlock:", v3);
}

void __46__BNBannerHostMonitorListener__addConnection___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "bannerHostDidBecomeAvailableForMonitorListener:", *(_QWORD *)(a1 + 32));

}

- (void)_removeConnection:(id)a3
{
  id v4;
  BNBannerHostMonitorListener *v5;
  NSMutableArray *connections;
  _QWORD block[5];

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[NSMutableArray removeObject:](v5->_connections, "removeObject:", v4);
  if (!-[NSMutableArray count](v5->_connections, "count"))
  {
    connections = v5->_connections;
    v5->_connections = 0;

  }
  if (!v5->_connections)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __49__BNBannerHostMonitorListener__removeConnection___block_invoke;
    block[3] = &unk_1E7044948;
    block[4] = v5;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
  objc_sync_exit(v5);

}

uint64_t __49__BNBannerHostMonitorListener__removeConnection___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __49__BNBannerHostMonitorListener__removeConnection___block_invoke_2;
  v3[3] = &unk_1E7045000;
  v3[4] = v1;
  return objc_msgSend(v1, "_notifyObserversWithBlock:", v3);
}

void __49__BNBannerHostMonitorListener__removeConnection___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "bannerHostDidBecomeUnavailableForMonitorListener:", *(_QWORD *)(a1 + 32));

}

- (void)_notifyObserversWithBlock:(id)a3
{
  void (**v4)(id, _QWORD);
  NSHashTable *observers;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD))a3;
  if (v4)
  {
    observers = self->_observers;
    if (observers)
    {
      v11 = 0u;
      v12 = 0u;
      v13 = 0u;
      v14 = 0u;
      v6 = (id)-[NSHashTable copy](observers, "copy");
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v12;
        do
        {
          v10 = 0;
          do
          {
            if (*(_QWORD *)v12 != v9)
              objc_enumerationMutation(v6);
            v4[2](v4, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++));
          }
          while (v8 != v10);
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        }
        while (v8);
      }

    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_connectionListener, 0);
  objc_storeStrong((id *)&self->_authorizedBundleIDs, 0);
}

- (void)listener:(uint8_t *)buf didReceiveConnection:(os_log_t)log withContext:.cold.1(void *a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_error_impl(&dword_1B9628000, log, OS_LOG_TYPE_ERROR, "%{public}@ (client-side) connection failed to authenticate: %{public}@", buf, 0x16u);

}

@end
