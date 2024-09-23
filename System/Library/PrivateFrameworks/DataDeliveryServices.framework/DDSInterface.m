@implementation DDSInterface

- (NSString)xpcServiceName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (DDSInterface)initWithXPCServiceName:(id)a3
{
  id v4;
  DDSInterface *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *connectionUsageQueue;
  uint64_t v8;
  NSString *xpcServiceName;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DDSInterface;
  v5 = -[DDSInterface init](&v11, sel_init);
  if (v5)
  {
    v6 = dispatch_queue_create("com.apple.DataDeliveryServices.ddsinterface.queue", 0);
    connectionUsageQueue = v5->_connectionUsageQueue;
    v5->_connectionUsageQueue = (OS_dispatch_queue *)v6;

    v8 = objc_msgSend(v4, "copy");
    xpcServiceName = v5->_xpcServiceName;
    v5->_xpcServiceName = (NSString *)v8;

  }
  return v5;
}

- (void)addAssertionForQuery:(id)a3 policy:(id)a4 assertionID:(id)a5 clientID:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
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
  v13 = a6;
  -[DDSInterface connectionUsageQueue](self, "connectionUsageQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__DDSInterface_addAssertionForQuery_policy_assertionID_clientID___block_invoke;
  block[3] = &unk_1EA1417B0;
  block[4] = self;
  v20 = v10;
  v21 = v11;
  v22 = v12;
  v23 = v13;
  v15 = v13;
  v16 = v12;
  v17 = v11;
  v18 = v10;
  dispatch_sync(v14, block);

}

void __65__DDSInterface_addAssertionForQuery_policy_assertionID_clientID___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "server");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addAssertionForQuery:policy:assertionID:clientID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));

}

- (void)removeAssertionWithID:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[DDSInterface connectionUsageQueue](self, "connectionUsageQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__DDSInterface_removeAssertionWithID___block_invoke;
  block[3] = &unk_1EA1412F0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

void __38__DDSInterface_removeAssertionWithID___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "server");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAssertionWithID:", *(_QWORD *)(a1 + 40));

}

- (void)assertionIDsForClientID:(id)a3 reply:(id)a4
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
  -[DDSInterface connectionUsageQueue](self, "connectionUsageQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__DDSInterface_assertionIDsForClientID_reply___block_invoke;
  block[3] = &unk_1EA1412C8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(v8, block);

}

void __46__DDSInterface_assertionIDsForClientID_reply___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "syncServer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __46__DDSInterface_assertionIDsForClientID_reply___block_invoke_2;
  v4[3] = &unk_1EA1417D8;
  v3 = *(_QWORD *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "assertionIDsForClientID:reply:", v3, v4);

}

uint64_t __46__DDSInterface_assertionIDsForClientID_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchAssetUpdateStatusForQuery:(id)a3 callback:(id)a4
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
  -[DDSInterface connectionUsageQueue](self, "connectionUsageQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__DDSInterface_fetchAssetUpdateStatusForQuery_callback___block_invoke;
  block[3] = &unk_1EA1412C8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __56__DDSInterface_fetchAssetUpdateStatusForQuery_callback___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "server");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchAssetUpdateStatusForQuery:callback:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)updateAssetForQuery:(id)a3 callback:(id)a4
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
  -[DDSInterface connectionUsageQueue](self, "connectionUsageQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__DDSInterface_updateAssetForQuery_callback___block_invoke;
  block[3] = &unk_1EA1412C8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __45__DDSInterface_updateAssetForQuery_callback___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "server");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateAssetForQuery:callback:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)triggerDump
{
  NSObject *v3;
  _QWORD block[5];

  -[DDSInterface connectionUsageQueue](self, "connectionUsageQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __27__DDSInterface_triggerDump__block_invoke;
  block[3] = &unk_1EA141158;
  block[4] = self;
  dispatch_sync(v3, block);

}

void __27__DDSInterface_triggerDump__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "server");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "triggerDump");

}

- (void)triggerUpdate
{
  NSObject *v3;
  _QWORD block[5];

  -[DDSInterface connectionUsageQueue](self, "connectionUsageQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__DDSInterface_triggerUpdate__block_invoke;
  block[3] = &unk_1EA141158;
  block[4] = self;
  dispatch_sync(v3, block);

}

void __29__DDSInterface_triggerUpdate__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "server");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "triggerUpdate");

}

- (void)createConnectionIfNecessary
{
  NSObject *v3;
  id v4;
  void *v5;
  NSXPCConnection *v6;
  NSXPCConnection *remoteServer;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  id location;

  -[DDSInterface connectionUsageQueue](self, "connectionUsageQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (!self->_remoteServer)
  {
    v4 = objc_alloc(MEMORY[0x1E0CB3B38]);
    -[DDSInterface xpcServiceName](self, "xpcServiceName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (NSXPCConnection *)objc_msgSend(v4, "initWithMachServiceName:options:", v5, objc_msgSend((id)objc_opt_class(), "xpcConnectionOptionsForServer"));
    remoteServer = self->_remoteServer;
    self->_remoteServer = v6;

    -[NSXPCConnection setExportedObject:](self->_remoteServer, "setExportedObject:", self);
    objc_msgSend((id)objc_opt_class(), "interface");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](self->_remoteServer, "setExportedInterface:", v8);

    +[DDSServer interface](DDSServer, "interface");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](self->_remoteServer, "setRemoteObjectInterface:", v9);

    objc_initWeak(&location, self);
    v10 = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = __43__DDSInterface_createConnectionIfNecessary__block_invoke;
    v13 = &unk_1EA141800;
    objc_copyWeak(&v14, &location);
    -[NSXPCConnection setInvalidationHandler:](self->_remoteServer, "setInvalidationHandler:", &v10);
    -[NSXPCConnection setInterruptionHandler:](self->_remoteServer, "setInterruptionHandler:", &__block_literal_global_2, v10, v11, v12, v13);
    -[NSXPCConnection resume](self->_remoteServer, "resume");
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
}

void __43__DDSInterface_createConnectionIfNecessary__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  uint8_t v3[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    DefaultLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_1DA990000, v2, OS_LOG_TYPE_DEFAULT, "XPC connection to server invalidated.", v3, 2u);
    }

    objc_msgSend(WeakRetained, "teardownXPCConnection");
  }

}

void __43__DDSInterface_createConnectionIfNecessary__block_invoke_5()
{
  NSObject *v0;
  uint8_t v1[16];

  DefaultLog();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1DA990000, v0, OS_LOG_TYPE_DEFAULT, "XPC connection to server interrupted.", v1, 2u);
  }

}

+ (unint64_t)xpcConnectionOptionsForServer
{
  NSObject *v2;
  uint8_t v4[16];

  DefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1DA990000, v2, OS_LOG_TYPE_DEFAULT, "Using NSXPCConnectionPrivileged for iOS connection", v4, 2u);
  }

  return 4096;
}

- (void)teardownXPCConnection
{
  NSObject *v3;
  _QWORD block[5];

  -[DDSInterface connectionUsageQueue](self, "connectionUsageQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__DDSInterface_teardownXPCConnection__block_invoke;
  block[3] = &unk_1EA141158;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __37__DDSInterface_teardownXPCConnection__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_teardownXPCConnection");
}

- (void)_teardownXPCConnection
{
  NSXPCConnection *remoteServer;

  -[NSXPCConnection setInvalidationHandler:](self->_remoteServer, "setInvalidationHandler:", 0);
  -[NSXPCConnection setInterruptionHandler:](self->_remoteServer, "setInterruptionHandler:", 0);
  -[NSXPCConnection invalidate](self->_remoteServer, "invalidate");
  remoteServer = self->_remoteServer;
  self->_remoteServer = 0;

}

- (id)serviceObjectProxy
{
  NSObject *v3;

  -[DDSInterface connectionUsageQueue](self, "connectionUsageQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[DDSInterface createConnectionIfNecessary](self, "createConnectionIfNecessary");
  return -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_remoteServer, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_7);
}

void __34__DDSInterface_serviceObjectProxy__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  DefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __34__DDSInterface_serviceObjectProxy__block_invoke_cold_1();

}

- (id)syncServiceObjectProxy
{
  NSObject *v3;

  -[DDSInterface connectionUsageQueue](self, "connectionUsageQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[DDSInterface createConnectionIfNecessary](self, "createConnectionIfNecessary");
  return -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](self->_remoteServer, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_8);
}

void __38__DDSInterface_syncServiceObjectProxy__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  DefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __38__DDSInterface_syncServiceObjectProxy__block_invoke_cold_1();

}

- (id)server
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  void *v7;
  NSObject *v8;
  uint8_t v9[16];

  -[DDSInterface connectionUsageQueue](self, "connectionUsageQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[DDSInterface serverOverride](self, "serverOverride");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    DefaultLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1DA990000, v5, OS_LOG_TYPE_DEFAULT, "Using test local server", v9, 2u);
    }

    -[DDSInterface serverOverride](self, "serverOverride");
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[DDSInterface serviceObjectProxy](self, "serviceObjectProxy");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    DefaultLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[DDSInterface server].cold.1();

    return v7;
  }
}

- (id)syncServer
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  void *v7;
  NSObject *v8;
  uint8_t v9[16];

  -[DDSInterface connectionUsageQueue](self, "connectionUsageQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[DDSInterface serverOverride](self, "serverOverride");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    DefaultLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1DA990000, v5, OS_LOG_TYPE_DEFAULT, "Using test local server", v9, 2u);
    }

    -[DDSInterface serverOverride](self, "serverOverride");
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[DDSInterface syncServiceObjectProxy](self, "syncServiceObjectProxy");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    DefaultLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[DDSInterface syncServer].cold.1();

    return v7;
  }
}

+ (id)interface
{
  if (interface_onceToken_0 != -1)
    dispatch_once(&interface_onceToken_0, &__block_literal_global_9);
  return (id)interface_xpcInterface;
}

void __25__DDSInterface_interface__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1F02867C8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)interface_xpcInterface;
  interface_xpcInterface = v0;

}

- (void)dealloc
{
  objc_super v3;

  -[DDSInterface _teardownXPCConnection](self, "_teardownXPCConnection");
  v3.receiver = self;
  v3.super_class = (Class)DDSInterface;
  -[DDSInterface dealloc](&v3, sel_dealloc);
}

- (DDSManagingDelegate)delegate
{
  return (DDSManagingDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (DDSManaging)serverOverride
{
  return self->_serverOverride;
}

- (void)setServerOverride:(id)a3
{
  objc_storeStrong((id *)&self->_serverOverride, a3);
}

- (NSXPCConnection)remoteServer
{
  return self->_remoteServer;
}

- (void)setRemoteServer:(id)a3
{
  objc_storeStrong((id *)&self->_remoteServer, a3);
}

- (DDSInterface)sharedInstance
{
  return self->_sharedInstance;
}

- (OS_dispatch_queue)connectionUsageQueue
{
  return self->_connectionUsageQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionUsageQueue, 0);
  objc_storeStrong((id *)&self->_sharedInstance, 0);
  objc_storeStrong((id *)&self->_remoteServer, 0);
  objc_storeStrong((id *)&self->_serverOverride, 0);
  objc_storeStrong((id *)&self->_xpcServiceName, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __34__DDSInterface_serviceObjectProxy__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_1DA990000, v0, v1, "Error creating proxy (%{public}@)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __38__DDSInterface_syncServiceObjectProxy__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_1DA990000, v0, v1, "Error creating sync proxy (%{public}@)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)server
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1DA990000, v0, v1, "Interface is using remote server: (%{public}@)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)syncServer
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1DA990000, v0, v1, "Interface is using sync remote server: (%{public}@)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

@end
