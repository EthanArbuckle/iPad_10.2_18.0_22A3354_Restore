@implementation EDServer

uint64_t __28__EDServer_addRemoteClient___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "addObject:", *(_QWORD *)(a1 + 32));
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  EDRemoteClient *v10;
  void *v11;
  EDRemoteClient *v12;
  void *v13;
  uint64_t v14;
  BOOL v15;
  NSObject *v16;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  EDServer *v22;
  id v23;
  _QWORD v24[5];
  id v25;
  _BYTE buf[24];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  +[EDServer log](EDServer, "log");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v5;
    _os_log_impl(&dword_1D2F2C000, v6, OS_LOG_TYPE_INFO, "received a new connection request %@", buf, 0xCu);
  }

  objc_msgSend(v5, "valueForEntitlement:", CFSTR("com.apple.private.email"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

    v7 = 0;
  }
  objc_msgSend(v5, "valueForEntitlement:", CFSTR("com.apple.mobilemail.mailservices"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

    v8 = 0;
  }
  if ((objc_msgSend(v7, "BOOLValue") & 1) != 0 || (objc_msgSend(v8, "BOOLValue") & 1) != 0)
  {
    v9 = (void *)MEMORY[0x1D824B334]();
    v10 = [EDRemoteClient alloc];
    -[EDServer daemonInterfaceFactory](self, "daemonInterfaceFactory");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[EDRemoteClient initWithConnection:daemonInterfaceFactory:serverRemoteClientsProvider:](v10, "initWithConnection:daemonInterfaceFactory:serverRemoteClientsProvider:", v5, v11, self);

    +[EDRemoteClient exportedInterface](EDRemoteClient, "exportedInterface");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setExportedInterface:", v13);

    objc_msgSend(v5, "setExportedObject:", v12);
    *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, v12);
    v14 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __47__EDServer_listener_shouldAcceptNewConnection___block_invoke;
    v24[3] = &unk_1E949AD60;
    objc_copyWeak(&v25, (id *)buf);
    v24[4] = self;
    objc_msgSend(v5, "setInterruptionHandler:", v24);
    v18 = v14;
    v19 = 3221225472;
    v20 = __47__EDServer_listener_shouldAcceptNewConnection___block_invoke_16;
    v21 = &unk_1E949AD60;
    objc_copyWeak(&v23, (id *)buf);
    v22 = self;
    objc_msgSend(v5, "setInvalidationHandler:", &v18);
    -[EDServer addRemoteClient:](self, "addRemoteClient:", v12, v18, v19, v20, v21);
    objc_msgSend(v5, "resume");
    objc_destroyWeak(&v23);
    objc_destroyWeak(&v25);
    objc_destroyWeak((id *)buf);

    objc_autoreleasePoolPop(v9);
    v15 = 1;
  }
  else
  {
    +[EDServer log](EDServer, "log");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[EDServer listener:shouldAcceptNewConnection:].cold.1(v16);

    v15 = 0;
  }

  return v15;
}

- (void)start
{
  NSObject *v3;
  NSXPCListener *listener;
  int v5;
  NSXPCListener *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  +[EDServer log](EDServer, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    listener = self->_listener;
    v5 = 138412290;
    v6 = listener;
    _os_log_impl(&dword_1D2F2C000, v3, OS_LOG_TYPE_DEFAULT, "starting listener %@", (uint8_t *)&v5, 0xCu);
  }

  -[NSXPCListener resume](self->_listener, "resume");
  notify_post((const char *)objc_msgSend((id)*MEMORY[0x1E0D1DBF8], "UTF8String"));
}

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __15__EDServer_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_85 != -1)
    dispatch_once(&log_onceToken_85, block);
  return (OS_os_log *)(id)log_log_85;
}

- (EDDaemonInterfaceFactory)daemonInterfaceFactory
{
  return self->_daemonInterfaceFactory;
}

- (void)addRemoteClient:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[EDServer connectedClients](self, "connectedClients");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __28__EDServer_addRemoteClient___block_invoke;
  v7[3] = &unk_1E949CE78;
  v6 = v4;
  v8 = v6;
  objc_msgSend(v5, "performWhileLocked:", v7);

}

- (EFLocked)connectedClients
{
  return self->_connectedClients;
}

- (EDServer)initWithDaemonInterfaceFactory:(id)a3
{
  id v4;
  id v5;
  void *v6;
  EDServer *v7;

  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0CB3B58]);
  v6 = (void *)objc_msgSend(v5, "initWithMachServiceName:", *MEMORY[0x1E0D1DC00]);
  v7 = -[EDServer initWithDaemonInterfaceFactory:listener:](self, "initWithDaemonInterfaceFactory:listener:", v4, v6);

  return v7;
}

- (EDServer)initWithDaemonInterfaceFactory:(id)a3 listener:(id)a4
{
  id v7;
  id v8;
  EDServer *v9;
  id v10;
  id v11;
  uint64_t v12;
  EFLocked *connectedClients;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)EDServer;
  v9 = -[EDServer init](&v15, sel_init);
  if (v9)
  {
    v10 = objc_alloc(MEMORY[0x1E0D1EEF0]);
    v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v12 = objc_msgSend(v10, "initWithObject:", v11);
    connectedClients = v9->_connectedClients;
    v9->_connectedClients = (EFLocked *)v12;

    objc_storeStrong((id *)&v9->_daemonInterfaceFactory, a3);
    objc_storeStrong((id *)&v9->_listener, a4);
    -[NSXPCListener setDelegate:](v9->_listener, "setDelegate:", v9);
  }

  return v9;
}

void __15__EDServer_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_85;
  log_log_85 = (uint64_t)v1;

}

void __40__EDServer_messageReconciliationQueries__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "ef_compactMap:", &__block_literal_global_72);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ef_flatten");
  v4 = objc_claimAutoreleasedReturnValue();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

void __39__EDServer_threadReconciliationQueries__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "ef_compactMap:", &__block_literal_global_110);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ef_flatten");
  v4 = objc_claimAutoreleasedReturnValue();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (id)threadReconciliationQueries
{
  void *v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__32;
  v10 = __Block_byref_object_dispose__32;
  v11 = 0;
  -[EDServer connectedClients](self, "connectedClients");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __39__EDServer_threadReconciliationQueries__block_invoke;
  v5[3] = &unk_1E94A0378;
  v5[4] = &v6;
  objc_msgSend(v2, "performWhileLocked:", v5);

  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)messageReconciliationQueries
{
  void *v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__32;
  v10 = __Block_byref_object_dispose__32;
  v11 = 0;
  -[EDServer connectedClients](self, "connectedClients");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __40__EDServer_messageReconciliationQueries__block_invoke;
  v5[3] = &unk_1E94A0378;
  v5[4] = &v6;
  objc_msgSend(v2, "performWhileLocked:", v5);

  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)test_tearDown
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if ((EFIsRunningUnitTests() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EDServer.m"), 51, CFSTR("%s can only be called from unit tests"), "-[EDServer test_tearDown]");

  }
  -[EDServer connectedClients](self, "connectedClients");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9++), "test_tearDown");
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  -[EDServer daemonInterfaceFactory](self, "daemonInterfaceFactory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "test_tearDown");

  -[NSXPCListener invalidate](self->_listener, "invalidate");
}

void __47__EDServer_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  +[EDServer log](EDServer, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = WeakRetained;
    _os_log_impl(&dword_1D2F2C000, v3, OS_LOG_TYPE_DEFAULT, "Remote Client Interrupted %@", (uint8_t *)&v4, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "removeRemoteClient:", WeakRetained);
}

void __47__EDServer_listener_shouldAcceptNewConnection___block_invoke_16(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  +[EDServer log](EDServer, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = WeakRetained;
    _os_log_impl(&dword_1D2F2C000, v3, OS_LOG_TYPE_DEFAULT, "Remote Client Invalidated %@", (uint8_t *)&v4, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "removeRemoteClient:", WeakRetained);
}

- (void)removeRemoteClient:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[EDServer connectedClients](self, "connectedClients");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __31__EDServer_removeRemoteClient___block_invoke;
  v7[3] = &unk_1E949CE78;
  v6 = v4;
  v8 = v6;
  objc_msgSend(v5, "performWhileLocked:", v7);

}

uint64_t __31__EDServer_removeRemoteClient___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeObject:", *(_QWORD *)(a1 + 32));
}

- (NSXPCListenerEndpoint)serverXPCEndpoint
{
  return -[NSXPCListener endpoint](self->_listener, "endpoint");
}

- (NSArray)remoteClients
{
  void *v2;
  void *v3;

  -[EDServer connectedClients](self, "connectedClients");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
  objc_storeStrong((id *)&self->_listener, a3);
}

- (void)setDaemonInterfaceFactory:(id)a3
{
  objc_storeStrong((id *)&self->_daemonInterfaceFactory, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_daemonInterfaceFactory, 0);
  objc_storeStrong((id *)&self->_connectedClients, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

- (void)listener:(os_log_t)log shouldAcceptNewConnection:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D2F2C000, log, OS_LOG_TYPE_ERROR, "connection rejected because of missing entitlement", v1, 2u);
}

@end
