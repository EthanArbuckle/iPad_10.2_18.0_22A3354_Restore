@implementation GEONavdRemoteProxy

- (GEONavdRemoteProxy)init
{
  GEONavdRemoteProxy *v2;
  NSMutableArray *v3;
  NSMutableArray *observers;
  NSMutableDictionary *v5;
  NSMutableDictionary *handlers;
  uint64_t v7;
  OS_dispatch_queue *queue;
  __CFNotificationCenter *DarwinNotifyCenter;
  GEONavdRemoteProxy *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)GEONavdRemoteProxy;
  v2 = -[GEONavdServerProxy init](&v12, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    observers = v2->_observers;
    v2->_observers = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    handlers = v2->_handlers;
    v2->_handlers = v5;

    v7 = geo_dispatch_queue_create();
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    if (DarwinNotifyCenter)
      CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)navdRestarted, CFSTR("com.apple.navd.restarted"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v10 = v2;
  }

  return v2;
}

- (void)open
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __26__GEONavdRemoteProxy_open__block_invoke;
  block[3] = &unk_1E1BFF6F8;
  block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __26__GEONavdRemoteProxy_open__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_connectToDaemonIfNeededThreadUnsafe");
}

- (void)close
{
  NSObject *v3;
  NSObject *queue;
  _QWORD v5[6];
  uint8_t buf[8];
  uint8_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  GEOFindOrCreateLog("com.apple.GeoServices", "GEONavdRemoteProxy");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1885A9000, v3, OS_LOG_TYPE_INFO, "Closing a connection", buf, 2u);
  }

  *(_QWORD *)buf = 0;
  v7 = buf;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__84;
  v10 = __Block_byref_object_dispose__84;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __27__GEONavdRemoteProxy_close__block_invoke;
  v5[3] = &unk_1E1C00760;
  v5[4] = self;
  v5[5] = buf;
  dispatch_sync(queue, v5);
  objc_msgSend(*((id *)v7 + 5), "invalidate");
  _Block_object_dispose(buf, 8);

}

void __27__GEONavdRemoteProxy_close__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 8));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 8);
  *(_QWORD *)(v2 + 8) = 0;

}

- (void)_connectToDaemonIfNeededThreadUnsafe
{
  NSObject *v3;
  NSXPCConnection *v4;
  NSXPCConnection *connection;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  int v22;
  id *v23;
  id *v24;
  NSMutableDictionary *obj;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD v31[4];
  id v32;
  _QWORD v33[4];
  id v34;
  id location;
  uint8_t buf[4];
  void *v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  if (!self->_connection)
  {
    GEOFindOrCreateLog("com.apple.GeoServices", "GEONavdRemoteProxy");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1885A9000, v3, OS_LOG_TYPE_INFO, "Opening a connection", buf, 2u);
    }

    v4 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.navd"), 0);
    connection = self->_connection;
    self->_connection = v4;

    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE046D28);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](self->_connection, "setRemoteObjectInterface:", v6);

    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE00A2B8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](self->_connection, "setExportedInterface:", v7);

    -[NSXPCConnection setExportedObject:](self->_connection, "setExportedObject:", self);
    objc_initWeak(&location, self);
    v8 = MEMORY[0x1E0C809B0];
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __58__GEONavdRemoteProxy__connectToDaemonIfNeededThreadUnsafe__block_invoke;
    v33[3] = &unk_1E1BFF8B0;
    v23 = &v34;
    objc_copyWeak(&v34, &location);
    -[NSXPCConnection setInterruptionHandler:](self->_connection, "setInterruptionHandler:", v33);
    v31[0] = v8;
    v31[1] = 3221225472;
    v31[2] = __58__GEONavdRemoteProxy__connectToDaemonIfNeededThreadUnsafe__block_invoke_79;
    v31[3] = &unk_1E1BFF8B0;
    v24 = &v32;
    objc_copyWeak(&v32, &location);
    -[NSXPCConnection setInvalidationHandler:](self->_connection, "setInvalidationHandler:", v31);
    -[NSXPCConnection resume](self->_connection, "resume");
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    obj = self->_handlers;
    v9 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v27, v38, 16);
    if (v9)
    {
      v26 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v28 != v26)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          -[NSXPCConnection remoteObjectProxy](self->_connection, "remoteObjectProxy", v23, v24);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          GEOFindOrCreateLog("com.apple.GeoServices", "GEONavdRemoteProxy");
          v13 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v11, "description");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138477827;
            v37 = v14;
            _os_log_impl(&dword_1885A9000, v13, OS_LOG_TYPE_DEBUG, "reconnect handler : %{private}@", buf, 0xCu);

          }
          -[NSMutableDictionary objectForKeyedSubscript:](self->_handlers, "objectForKeyedSubscript:", v11);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("Stopped"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "BOOLValue");

          if ((v17 & 1) != 0)
          {
            objc_msgSend(v15, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("Stopped"));
            objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("UUID"));
            v18 = objc_claimAutoreleasedReturnValue();
            GEOFindOrCreateLog("com.apple.GeoServices", "GEONavdRemoteProxy");
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1885A9000, v19, OS_LOG_TYPE_DEBUG, "handler reconnected", buf, 2u);
            }

            objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("Destination"));
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "startMonitoringDestination:forClient:uuid:", v20, v11, v18);
            objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("LocalOnly"));
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v21, "BOOLValue");

            if (v22)
              objc_msgSend(v12, "onlyPerformLocalUpdatesForPlannedDestination:client:", v20, v11);

          }
          else
          {
            GEOFindOrCreateLog("com.apple.GeoServices", "GEONavdRemoteProxy");
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1885A9000, v18, OS_LOG_TYPE_DEBUG, "handler already connected", buf, 2u);
            }
          }

        }
        v9 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v27, v38, 16);
      }
      while (v9);
    }

    objc_destroyWeak(v24);
    objc_destroyWeak(v23);
    objc_destroyWeak(&location);
  }
}

void __58__GEONavdRemoteProxy__connectToDaemonIfNeededThreadUnsafe__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  void *v4;
  uint8_t v5[16];

  GEOFindOrCreateLog("com.apple.GeoServices", "GEONavdRemoteProxy");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1885A9000, v2, OS_LOG_TYPE_INFO, "Connection interrupted", v5, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "close");

}

void __58__GEONavdRemoteProxy__connectToDaemonIfNeededThreadUnsafe__block_invoke_79(uint64_t a1)
{
  NSObject *v2;
  NSObject **WeakRetained;
  NSObject **v4;
  NSObject *v5;
  _QWORD block[5];
  uint8_t buf[16];

  GEOFindOrCreateLog("com.apple.GeoServices", "GEONavdRemoteProxy");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1885A9000, v2, OS_LOG_TYPE_INFO, "Connection invalidated", buf, 2u);
  }

  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = WeakRetained[4];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __58__GEONavdRemoteProxy__connectToDaemonIfNeededThreadUnsafe__block_invoke_80;
    block[3] = &unk_1E1BFF6F8;
    block[4] = v4;
    dispatch_sync(v5, block);
  }

}

void __58__GEONavdRemoteProxy__connectToDaemonIfNeededThreadUnsafe__block_invoke_80(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 8);
  *(_QWORD *)(v2 + 8) = 0;

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = *(id *)(*(_QWORD *)(a1 + 32) + 24);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    v8 = MEMORY[0x1E0C9AAB0];
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i), (_QWORD)v11);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v8, CFSTR("Stopped"));

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

}

- (void)registerObserver:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__GEONavdRemoteProxy_registerObserver___block_invoke;
  block[3] = &unk_1E1C00738;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

uint64_t __39__GEONavdRemoteProxy_registerObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "addObject:", *(_QWORD *)(a1 + 40));
}

- (void)unregisterObserver:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__GEONavdRemoteProxy_unregisterObserver___block_invoke;
  block[3] = &unk_1E1C00738;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

uint64_t __41__GEONavdRemoteProxy_unregisterObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObject:", *(_QWORD *)(a1 + 40));
}

- (GEONavdXPCInterface)remoteObjectProxyThreadUnsafe
{
  -[GEONavdRemoteProxy _connectToDaemonIfNeededThreadUnsafe](self, "_connectToDaemonIfNeededThreadUnsafe");
  return (GEONavdXPCInterface *)-[NSXPCConnection remoteObjectProxy](self->_connection, "remoteObjectProxy");
}

- (void)statusWithCallback:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__GEONavdRemoteProxy_statusWithCallback___block_invoke;
  block[3] = &unk_1E1BFFBF0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

void __41__GEONavdRemoteProxy_statusWithCallback___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "remoteObjectProxyThreadUnsafe");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __41__GEONavdRemoteProxy_statusWithCallback___block_invoke_2;
  v3[3] = &unk_1E1C150A8;
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "statusWithCallback:", v3);

}

uint64_t __41__GEONavdRemoteProxy_statusWithCallback___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)startMonitoringDestination:(id)a3 forClient:(id)a4 uuid:(id)a5 handler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *queue;
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
  v12 = a5;
  v13 = (void *)objc_msgSend(a6, "copy");
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__GEONavdRemoteProxy_startMonitoringDestination_forClient_uuid_handler___block_invoke;
  block[3] = &unk_1E1C150D0;
  block[4] = self;
  v20 = v11;
  v22 = v12;
  v23 = v13;
  v21 = v10;
  v15 = v12;
  v16 = v10;
  v17 = v13;
  v18 = v11;
  dispatch_sync(queue, block);

}

void __72__GEONavdRemoteProxy_startMonitoringDestination_forClient_uuid_handler___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  _QWORD v10[5];

  v10[4] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0C99E08]);
  v9[0] = CFSTR("Handler");
  v3 = (void *)MEMORY[0x18D765024](*(_QWORD *)(a1 + 64));
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v10[0] = v3;
  v10[1] = v4;
  v9[1] = CFSTR("Destination");
  v9[2] = CFSTR("Stopped");
  v9[3] = CFSTR("UUID");
  v10[2] = MEMORY[0x1E0C9AAA0];
  v10[3] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v2, "initWithDictionary:", v6);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setObject:forKeyedSubscript:", v7, *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "remoteObjectProxyThreadUnsafe");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "startMonitoringDestination:forClient:uuid:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));

}

- (void)requestRefreshForPlannedDestination:(id)a3 client:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__GEONavdRemoteProxy_requestRefreshForPlannedDestination_client___block_invoke;
  block[3] = &unk_1E1C01790;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(queue, block);

}

void __65__GEONavdRemoteProxy_requestRefreshForPlannedDestination_client___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "remoteObjectProxyThreadUnsafe");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requestRefreshForPlannedDestination:client:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)onlyPerformLocalUpdatesForPlannedDestination:(id)a3 client:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__GEONavdRemoteProxy_onlyPerformLocalUpdatesForPlannedDestination_client___block_invoke;
  block[3] = &unk_1E1C01790;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_sync(queue, block);

}

void __74__GEONavdRemoteProxy_onlyPerformLocalUpdatesForPlannedDestination_client___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("LocalOnly"));
  objc_msgSend(*(id *)(a1 + 32), "remoteObjectProxyThreadUnsafe");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "onlyPerformLocalUpdatesForPlannedDestination:client:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));

}

- (void)stopMonitoringDestination:(id)a3 forClient:(id)a4 uuid:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queue;
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
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__GEONavdRemoteProxy_stopMonitoringDestination_forClient_uuid___block_invoke;
  block[3] = &unk_1E1C00898;
  block[4] = self;
  v16 = v9;
  v17 = v8;
  v18 = v10;
  v12 = v10;
  v13 = v8;
  v14 = v9;
  dispatch_sync(queue, block);

}

void __63__GEONavdRemoteProxy_stopMonitoringDestination_forClient_uuid___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "remoteObjectProxyThreadUnsafe");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stopMonitoringDestination:forClient:uuid:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));

}

- (void)didPostUINotification:(unint64_t)a3 forDestination:(id)a4 fromClient:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a4;
  -[GEONavdRemoteProxy remoteObjectProxyThreadUnsafe](self, "remoteObjectProxyThreadUnsafe");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "didPostUINotification:forDestination:fromClient:", a3, v9, v8);

}

- (void)forceCacheRefresh
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__GEONavdRemoteProxy_forceCacheRefresh__block_invoke;
  block[3] = &unk_1E1BFF6F8;
  block[4] = self;
  dispatch_sync(queue, block);
}

void __39__GEONavdRemoteProxy_forceCacheRefresh__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "remoteObjectProxyThreadUnsafe");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "forceCacheRefresh");

}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  NSMutableArray *observers;
  NSMutableDictionary *handlers;
  OS_dispatch_queue *queue;
  objc_super v7;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  if (DarwinNotifyCenter)
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("com.apple.navd.restarted"), 0);
  observers = self->_observers;
  self->_observers = 0;

  handlers = self->_handlers;
  self->_handlers = 0;

  -[GEONavdRemoteProxy close](self, "close");
  queue = self->_queue;
  self->_queue = 0;

  v7.receiver = self;
  v7.super_class = (Class)GEONavdRemoteProxy;
  -[GEONavdRemoteProxy dealloc](&v7, sel_dealloc);
}

- (void)navdProxyReceivedData:(id)a3 ofType:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *queue;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  __int128 *p_buf;
  _QWORD block[6];
  __int128 buf;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  GEOFindOrCreateLog("com.apple.GeoServices", "GEONavdRemoteProxy");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138477827;
    *(_QWORD *)((char *)&buf + 4) = v7;
    _os_log_impl(&dword_1885A9000, v8, OS_LOG_TYPE_DEBUG, "Navd remote proxy received data. Message type: %{private}@", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__84;
  v21 = __Block_byref_object_dispose__84;
  v22 = 0;
  queue = self->_queue;
  v10 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__GEONavdRemoteProxy_navdProxyReceivedData_ofType___block_invoke;
  block[3] = &unk_1E1C00760;
  block[4] = self;
  block[5] = &buf;
  dispatch_sync(queue, block);
  v13[0] = v10;
  v13[1] = 3221225472;
  v13[2] = __51__GEONavdRemoteProxy_navdProxyReceivedData_ofType___block_invoke_2;
  v13[3] = &unk_1E1C041E8;
  v15 = v7;
  p_buf = &buf;
  v14 = v6;
  v11 = v7;
  v12 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], v13);

  _Block_object_dispose(&buf, 8);
}

void __51__GEONavdRemoteProxy_navdProxyReceivedData_ofType___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __51__GEONavdRemoteProxy_navdProxyReceivedData_ofType___block_invoke_2(_QWORD *a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1[6] + 8) + 40);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "navdProxyReceivedData:ofType:", a1[4], a1[5], (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)navdProxyReceivedHypothesis:(id)a3 forClient:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  _QWORD block[5];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v7 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__85;
  v21 = __Block_byref_object_dispose__86;
  v22 = 0;
  queue = self->_queue;
  v9 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__GEONavdRemoteProxy_navdProxyReceivedHypothesis_forClient___block_invoke;
  block[3] = &unk_1E1C041E8;
  v16 = &v17;
  block[4] = self;
  v10 = v7;
  v15 = v10;
  dispatch_sync(queue, block);
  if (v18[5])
  {
    v11[0] = v9;
    v11[1] = 3221225472;
    v11[2] = __60__GEONavdRemoteProxy_navdProxyReceivedHypothesis_forClient___block_invoke_2;
    v11[3] = &unk_1E1C00760;
    v13 = &v17;
    v12 = v6;
    dispatch_async(MEMORY[0x1E0C80D38], v11);

  }
  _Block_object_dispose(&v17, 8);

}

void __60__GEONavdRemoteProxy_navdProxyReceivedHypothesis_forClient___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1[4] + 24), "objectForKeyedSubscript:", a1[5]);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("Handler"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __60__GEONavdRemoteProxy_navdProxyReceivedHypothesis_forClient___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_handlers, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
