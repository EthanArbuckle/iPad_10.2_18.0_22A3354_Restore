@implementation MTXPCConnectionListenerProvider

void __66__MTXPCConnectionListenerProvider_addClientConnection_clientLink___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  char v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)(a1 + 32))
  {
    v3 = objc_msgSend(*(id *)(a1 + 40), "processIdentifier");
    if (v3 != objc_msgSend(v2, "processIdentifier"))
    {
      +[MTXPCClientInfo clientInfoForConnection:clientLink:](MTXPCClientInfo, "clientInfoForConnection:clientLink:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "clients");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "containsObject:", v4);

      MTLogForCategory(2);
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
      if ((v6 & 1) != 0)
      {
        if (v8)
        {
          objc_msgSend(*(id *)(a1 + 48), "info");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "machServiceName");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = 138543618;
          v18 = v10;
          v19 = 2114;
          v20 = v4;
          _os_log_impl(&dword_19AC4E000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Already has XPC client: %{public}@", (uint8_t *)&v17, 0x16u);

        }
      }
      else
      {
        if (v8)
        {
          objc_msgSend(*(id *)(a1 + 48), "info");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "machServiceName");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = 138543618;
          v18 = v12;
          v19 = 2114;
          v20 = v4;
          _os_log_impl(&dword_19AC4E000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Adding XPC client: %{public}@", (uint8_t *)&v17, 0x16u);

        }
        objc_msgSend(*(id *)(a1 + 48), "clients");
        v7 = objc_claimAutoreleasedReturnValue();
        -[NSObject addObject:](v7, "addObject:", v4);
      }

      MTLogForCategory(2);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 48), "info");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "machServiceName");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = *(void **)(*(_QWORD *)(a1 + 48) + 40);
        v17 = 138543618;
        v18 = v15;
        v19 = 2114;
        v20 = v16;
        _os_log_impl(&dword_19AC4E000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: Current XPC clients: %{public}@", (uint8_t *)&v17, 0x16u);

      }
    }
  }

}

- (MTXPCConnectionInfo)info
{
  return self->_info;
}

- (NSMutableSet)clients
{
  return self->_clients;
}

- (NAScheduler)serializer
{
  return self->_serializer;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  NSObject *v15;
  uint64_t v16;
  BOOL v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;
  id from;
  id location;

  v6 = a3;
  v7 = a4;
  -[MTXPCConnectionListenerProvider info](self, "info");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "requiredEntitlement");
  v9 = objc_claimAutoreleasedReturnValue();
  if (!v9)
  {

    goto LABEL_7;
  }
  v10 = (void *)v9;
  -[MTXPCConnectionListenerProvider info](self, "info");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "requiredEntitlement");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "valueForEntitlement:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "BOOLValue");

  if (v14)
  {
LABEL_7:
    -[MTXPCConnectionListenerProvider info](self, "info");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "exportedObjectInterface");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setExportedInterface:", v19);

    -[MTXPCConnectionListenerProvider info](self, "info");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "exportedObject");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setExportedObject:", v21);

    -[MTXPCConnectionListenerProvider info](self, "info");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "remoteObjectInterface");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setRemoteObjectInterface:", v23);

    objc_initWeak(&location, self);
    objc_initWeak(&from, v7);
    v24 = MEMORY[0x1E0C809B0];
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __70__MTXPCConnectionListenerProvider_listener_shouldAcceptNewConnection___block_invoke;
    v32[3] = &unk_1E39CE730;
    objc_copyWeak(&v33, &location);
    objc_copyWeak(&v34, &from);
    objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", v32);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v24;
    v29[1] = 3221225472;
    v29[2] = __70__MTXPCConnectionListenerProvider_listener_shouldAcceptNewConnection___block_invoke_2;
    v29[3] = &unk_1E39CE758;
    objc_copyWeak(&v30, &location);
    objc_copyWeak(&v31, &from);
    objc_msgSend(v7, "setInvalidationHandler:", v29);
    v27[0] = v24;
    v27[1] = 3221225472;
    v27[2] = __70__MTXPCConnectionListenerProvider_listener_shouldAcceptNewConnection___block_invoke_13;
    v27[3] = &unk_1E39CBC38;
    objc_copyWeak(&v28, &location);
    objc_msgSend(v7, "setInterruptionHandler:", v27);
    -[MTXPCConnectionListenerProvider addClientConnection:clientLink:](self, "addClientConnection:clientLink:", v7, v25);
    objc_msgSend(v7, "resume");
    objc_destroyWeak(&v28);
    objc_destroyWeak(&v31);
    objc_destroyWeak(&v30);

    objc_destroyWeak(&v34);
    objc_destroyWeak(&v33);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
    v17 = 1;
    goto LABEL_8;
  }
  MTLogForCategory(2);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    -[MTXPCConnectionListenerProvider listener:shouldAcceptNewConnection:].cold.1((uint64_t)v7, v15, v16);

  v17 = 0;
LABEL_8:

  return v17;
}

- (void)addClientConnection:(id)a3 clientLink:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  MTXPCConnectionListenerProvider *v14;

  v6 = a3;
  v7 = a4;
  -[MTXPCConnectionListenerProvider serializer](self, "serializer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __66__MTXPCConnectionListenerProvider_addClientConnection_clientLink___block_invoke;
  v11[3] = &unk_1E39CB828;
  v12 = v7;
  v13 = v6;
  v14 = self;
  v9 = v6;
  v10 = v7;
  objc_msgSend(v8, "performBlock:", v11);

}

+ (MTXPCConnectionListenerProvider)providerWithConnectionInfo:(id)a3 errorHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithConnectionInfo:errorHandler:", v6, v5);

  return (MTXPCConnectionListenerProvider *)v7;
}

- (MTXPCConnectionListenerProvider)initWithConnectionInfo:(id)a3 errorHandler:(id)a4
{
  id v8;
  id v9;
  MTXPCConnectionListenerProvider *v10;
  uint64_t v11;
  NAScheduler *serializer;
  NSMutableSet *v13;
  NSMutableSet *clients;
  uint64_t v15;
  id errorHandler;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSXPCListener *connectionListener;
  void *v23;
  NSObject *v24;
  objc_super v25;

  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MTXPCConnectionListenerProvider.m"), 35, CFSTR("Connection info must be non-nil"));

    MTLogForCategory(2);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      -[MTXPCConnectionProvider initWithConnectionInfo:errorHandler:reconnectHandler:].cold.1(v24);

  }
  v25.receiver = self;
  v25.super_class = (Class)MTXPCConnectionListenerProvider;
  v10 = -[MTXPCConnectionListenerProvider init](&v25, sel_init);
  if (v10)
  {
    +[MTScheduler serialSchedulerWithName:priority:](MTScheduler, "serialSchedulerWithName:priority:", CFSTR("com.apple.MTXPCConnectionListenerProvider.serialqueue"), +[MTScheduler defaultPriority](MTScheduler, "defaultPriority"));
    v11 = objc_claimAutoreleasedReturnValue();
    serializer = v10->_serializer;
    v10->_serializer = (NAScheduler *)v11;

    objc_storeStrong((id *)&v10->_info, a3);
    v13 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    clients = v10->_clients;
    v10->_clients = v13;

    v15 = objc_msgSend(v9, "copy");
    errorHandler = v10->_errorHandler;
    v10->_errorHandler = (id)v15;

    v17 = objc_alloc(MEMORY[0x1E0CB3B58]);
    -[MTXPCConnectionListenerProvider info](v10, "info");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "machServiceName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v17, "initWithMachServiceName:", v19);
    connectionListener = v10->_connectionListener;
    v10->_connectionListener = (NSXPCListener *)v20;

    -[NSXPCListener setDelegate:](v10->_connectionListener, "setDelegate:", v10);
  }

  return v10;
}

- (void)startListening
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v8;
  __CFString *v9;
  int v10;
  MTXPCConnectionListenerProvider *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(2);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138543362;
    v11 = self;
    _os_log_impl(&dword_19AC4E000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ resuming connection", (uint8_t *)&v10, 0xCu);
  }

  -[NSXPCListener resume](self->_connectionListener, "resume");
  -[MTXPCConnectionInfo lifecycleNotification](self->_info, "lifecycleNotification");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    MTLogForCategory(2);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      -[MTXPCConnectionInfo lifecycleNotification](self->_info, "lifecycleNotification");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543618;
      v11 = self;
      v12 = 2114;
      v13 = v6;
      _os_log_impl(&dword_19AC4E000, v5, OS_LOG_TYPE_DEFAULT, "Listener %{public}@ posting lifecycle darwin notification %{public}@", (uint8_t *)&v10, 0x16u);

    }
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    -[MTXPCConnectionListenerProvider info](self, "info");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lifecycleNotification");
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, v9, 0, 0, 1u);

  }
}

void __70__MTXPCConnectionListenerProvider_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  id v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_didInvalidateConnection:", v2);

}

void __70__MTXPCConnectionListenerProvider_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v3;
  void *v4;
  NSObject *v5;
  uint8_t buf[4];
  id v7;
  __int16 v8;
  id v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s"), xpc_connection_copy_invalidation_reason());
  MTLogForCategory(2);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v7 = WeakRetained;
    v8 = 2114;
    v9 = v3;
    v10 = 2114;
    v11 = v4;
    _os_log_impl(&dword_19AC4E000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ invalidation handler called for connection %{public}@ with error: %{public}@", buf, 0x20u);
  }

  objc_msgSend(WeakRetained, "_didInvalidateConnection:", v3);
}

void __70__MTXPCConnectionListenerProvider_listener_shouldAcceptNewConnection___block_invoke_13(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_didInterruptConnection");

}

- (void)_didInterruptConnection
{
  void *v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "info");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "machServiceName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543362;
  v7 = v4;
  OUTLINED_FUNCTION_0_5(&dword_19AC4E000, a2, v5, "Connection to server via %{public}@ mach port was interrupted.", (uint8_t *)&v6);

  OUTLINED_FUNCTION_7();
}

- (void)_didInvalidateConnection:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void (**v7)(_QWORD, _QWORD);
  void *v8;

  v4 = a3;
  MTLogForCategory(2);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[MTXPCConnectionListenerProvider _didInvalidateConnection:].cold.1(self, v5);

  -[MTXPCConnectionListenerProvider removeClientConnection:](self, "removeClientConnection:", v4);
  -[MTXPCConnectionListenerProvider errorHandler](self, "errorHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[MTXPCConnectionListenerProvider errorHandler](self, "errorHandler");
    v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 4099, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v7)[2](v7, v8);

  }
}

- (void)removeClientConnection:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[MTXPCConnectionListenerProvider serializer](self, "serializer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__MTXPCConnectionListenerProvider_removeClientConnection___block_invoke;
  v7[3] = &unk_1E39CB7B0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performBlock:", v7);

}

void __58__MTXPCConnectionListenerProvider_removeClientConnection___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "_connectedClients", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v19 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v7, "connection");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = *(void **)(a1 + 40);

        if (v8 == v9)
        {
          MTLogForCategory(2);
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(*(id *)(a1 + 32), "info");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "machServiceName");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v23 = v12;
            v24 = 2114;
            v25 = v7;
            _os_log_impl(&dword_19AC4E000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: Removing XPC client: %{public}@", buf, 0x16u);

          }
          objc_msgSend(*(id *)(a1 + 32), "clients");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "removeObject:", v7);

          goto LABEL_13;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_13:

  MTLogForCategory(2);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "info");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "machServiceName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
    *(_DWORD *)buf = 138543618;
    v23 = v16;
    v24 = 2114;
    v25 = v17;
    _os_log_impl(&dword_19AC4E000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: Current XPC clients: %{public}@", buf, 0x16u);

  }
}

- (NSArray)connectedClients
{
  dispatch_semaphore_t v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v8[5];
  NSObject *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__14;
  v15 = __Block_byref_object_dispose__14;
  v16 = 0;
  v3 = dispatch_semaphore_create(0);
  -[MTXPCConnectionListenerProvider serializer](self, "serializer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51__MTXPCConnectionListenerProvider_connectedClients__block_invoke;
  v8[3] = &unk_1E39CB8A8;
  v10 = &v11;
  v8[4] = self;
  v5 = v3;
  v9 = v5;
  objc_msgSend(v4, "performBlock:", v8);

  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return (NSArray *)v6;
}

intptr_t __51__MTXPCConnectionListenerProvider_connectedClients__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_connectedClients");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (id)_connectedClients
{
  void *v2;
  void *v3;

  -[MTXPCConnectionListenerProvider clients](self, "clients");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)currentClient
{
  void *v3;
  dispatch_semaphore_t v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v8;
  _QWORD v10[5];
  id v11;
  NSObject *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__14;
  v18 = __Block_byref_object_dispose__14;
  v19 = 0;
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = dispatch_semaphore_create(0);
  -[MTXPCConnectionListenerProvider serializer](self, "serializer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __48__MTXPCConnectionListenerProvider_currentClient__block_invoke;
  v10[3] = &unk_1E39CE780;
  v13 = &v14;
  v10[4] = self;
  v6 = v3;
  v11 = v6;
  v7 = v4;
  v12 = v7;
  objc_msgSend(v5, "performBlock:", v10);

  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  v8 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v8;
}

intptr_t __48__MTXPCConnectionListenerProvider_currentClient__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_currentClientForConnection:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

- (id)_currentClientForConnection:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[MTXPCConnectionListenerProvider _connectedClients](self, "_connectedClients", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v13;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v13 != v7)
            objc_enumerationMutation(v5);
          v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v9, "connection");
          v10 = (id)objc_claimAutoreleasedReturnValue();

          if (v10 == v4)
          {
            v6 = v9;
            goto LABEL_12;
          }
        }
        v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)performBlockOnCurrentClient:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTXPCConnectionListenerProvider serializer](self, "serializer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __63__MTXPCConnectionListenerProvider_performBlockOnCurrentClient___block_invoke;
  v9[3] = &unk_1E39CB8D0;
  v9[4] = self;
  v10 = v5;
  v11 = v4;
  v7 = v4;
  v8 = v5;
  objc_msgSend(v6, "performBlock:", v9);

}

void __63__MTXPCConnectionListenerProvider_performBlockOnCurrentClient___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_currentClientForConnection:", *(_QWORD *)(a1 + 40));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(_QWORD *)(a1 + 48);
  objc_msgSend(v4, "clientLink");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);

}

- (void)performBlockOnAllClients:(id)a3
{
  -[MTXPCConnectionListenerProvider performBlockOnAllClients:excludingCurrent:](self, "performBlockOnAllClients:excludingCurrent:", a3, 0);
}

- (void)performBlockOnAllClients:(id)a3 excludingCurrent:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a4;
  v6 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __77__MTXPCConnectionListenerProvider_performBlockOnAllClients_excludingCurrent___block_invoke;
  v8[3] = &unk_1E39CE7A8;
  v9 = v6;
  v7 = v6;
  -[MTXPCConnectionListenerProvider performBlockOnClientInfos:excludeCurrent:](self, "performBlockOnClientInfos:excludeCurrent:", v8, v4);

}

void __77__MTXPCConnectionListenerProvider_performBlockOnAllClients_excludingCurrent___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "clientLink");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

- (void)performBlockOnClientInfos:(id)a3 excludeCurrent:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  BOOL v14;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTXPCConnectionListenerProvider serializer](self, "serializer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __76__MTXPCConnectionListenerProvider_performBlockOnClientInfos_excludeCurrent___block_invoke;
  v11[3] = &unk_1E39CE7D0;
  v14 = a4;
  v11[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  objc_msgSend(v8, "performBlock:", v11);

}

void __76__MTXPCConnectionListenerProvider_performBlockOnClientInfos_excludeCurrent___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;

  if (*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 32), "_currentClientForConnection:", *(_QWORD *)(a1 + 40));
    v2 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  v3 = (id)v2;
  objc_msgSend(*(id *)(a1 + 32), "_performBlockOnClientInfos:excludingClient:", *(_QWORD *)(a1 + 48), v2);

}

- (void)performBlockOnAllClients:(id)a3 excludingClient:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[MTXPCConnectionListenerProvider serializer](self, "serializer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __76__MTXPCConnectionListenerProvider_performBlockOnAllClients_excludingClient___block_invoke;
  v11[3] = &unk_1E39CC490;
  v12 = v7;
  v13 = v6;
  v11[4] = self;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "performBlock:", v11);

}

void __76__MTXPCConnectionListenerProvider_performBlockOnAllClients_excludingClient___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __76__MTXPCConnectionListenerProvider_performBlockOnAllClients_excludingClient___block_invoke_2;
  v3[3] = &unk_1E39CE7A8;
  v4 = *(id *)(a1 + 48);
  objc_msgSend(v2, "_performBlockOnClientInfos:excludingClient:", v3, *(_QWORD *)(a1 + 40));

}

void __76__MTXPCConnectionListenerProvider_performBlockOnAllClients_excludingClient___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "clientLink");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

- (void)_performBlockOnClientInfos:(id)a3 excludingClient:(id)a4
{
  void (**v6)(id, _QWORD);
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, _QWORD))a3;
  v7 = a4;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[MTXPCConnectionListenerProvider _connectedClients](self, "_connectedClients", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v12);
        if (!v7 || (objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v12), "isEqual:", v7) & 1) == 0)
          v6[2](v6, v13);
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

}

- (void)stopListening
{
  -[NSXPCListener suspend](self->_connectionListener, "suspend");
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[MTXPCConnectionListenerProvider info](self, "info");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "machServiceName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p %@>"), v4, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (void)dealloc
{
  NSXPCListener *connectionListener;
  objc_super v4;

  -[NSXPCListener setDelegate:](self->_connectionListener, "setDelegate:", 0);
  -[NSXPCListener invalidate](self->_connectionListener, "invalidate");
  connectionListener = self->_connectionListener;
  self->_connectionListener = 0;

  v4.receiver = self;
  v4.super_class = (Class)MTXPCConnectionListenerProvider;
  -[MTXPCConnectionListenerProvider dealloc](&v4, sel_dealloc);
}

- (void)setInfo:(id)a3
{
  objc_storeStrong((id *)&self->_info, a3);
}

- (void)setSerializer:(id)a3
{
  objc_storeStrong((id *)&self->_serializer, a3);
}

- (NSString)requiredEntitlement
{
  return self->_requiredEntitlement;
}

- (void)setRequiredEntitlement:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)errorHandler
{
  return self->_errorHandler;
}

- (void)setErrorHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setClients:(id)a3
{
  objc_storeStrong((id *)&self->_clients, a3);
}

- (NSXPCListener)connectionListener
{
  return self->_connectionListener;
}

- (void)setConnectionListener:(id)a3
{
  objc_storeStrong((id *)&self->_connectionListener, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionListener, 0);
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong(&self->_errorHandler, 0);
  objc_storeStrong((id *)&self->_requiredEntitlement, 0);
  objc_storeStrong((id *)&self->_serializer, 0);
  objc_storeStrong((id *)&self->_info, 0);
}

- (void)listener:(uint64_t)a3 shouldAcceptNewConnection:.cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138543362;
  v4 = a1;
  OUTLINED_FUNCTION_0_5(&dword_19AC4E000, a2, a3, "Connection %{public}@ not entitled", (uint8_t *)&v3);
}

- (void)_didInvalidateConnection:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "info");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "machServiceName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543362;
  v7 = v4;
  OUTLINED_FUNCTION_0_5(&dword_19AC4E000, a2, v5, "Connection to server via %{public}@ mach port was invalidated. Removing server side connection", (uint8_t *)&v6);

  OUTLINED_FUNCTION_7();
}

@end
