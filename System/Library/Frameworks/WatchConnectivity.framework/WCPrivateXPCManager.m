@implementation WCPrivateXPCManager

+ (void)initialize
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254E5D328);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)sXPCPrivateManagerDaemonInterface;
  sXPCPrivateManagerDaemonInterface = v2;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254E5A8E0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)sXPCPrivateManagerClientInterface;
  sXPCPrivateManagerClientInterface = v4;

}

+ (id)privateDaemonInterface
{
  return (id)sXPCPrivateManagerDaemonInterface;
}

+ (id)privateClientInterface
{
  return (id)sXPCPrivateManagerClientInterface;
}

+ (id)sharedManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __36__WCPrivateXPCManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, block);
  return (id)sharedManager_manager;
}

void __36__WCPrivateXPCManager_sharedManager__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedManager_manager;
  sharedManager_manager = v0;

}

- (WCPrivateXPCManager)init
{
  WCPrivateXPCManager *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *delegateQueue;
  void *v5;
  const char *v6;
  NSObject *v7;
  id v8;
  const char *v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  id location;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)WCPrivateXPCManager;
  v2 = -[WCPrivateXPCManager init](&v17, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.private.watchconnectivity.xpc.delegate-queue", 0);
    delegateQueue = v2->_delegateQueue;
    v2->_delegateQueue = (OS_dispatch_queue *)v3;

    objc_initWeak(&location, v2);
    v11 = MEMORY[0x24BDAC760];
    v12 = 3221225472;
    v13 = __27__WCPrivateXPCManager_init__block_invoke;
    v14 = &unk_24D662048;
    objc_copyWeak(&v15, &location);
    v5 = (void *)MEMORY[0x219A05838](&v11);
    v6 = (const char *)objc_msgSend(CFSTR("com.apple.wcd.listener.resumed"), "UTF8String", v11, v12, v13, v14);
    v7 = MEMORY[0x24BDAC9B8];
    v8 = MEMORY[0x24BDAC9B8];
    notify_register_dispatch(v6, &v2->_listenerResumedToken, v7, v5);

    v9 = (const char *)objc_msgSend(CFSTR("com.apple.wcd.listener.private.should-connect"), "UTF8String");
    notify_register_dispatch(v9, &v2->_privateServiceShouldConnectToken, MEMORY[0x24BDAC9B8], v5);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __27__WCPrivateXPCManager_init__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id *v3;
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  wc_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136446210;
    v10 = "-[WCPrivateXPCManager init]_block_invoke";
    _os_log_impl(&dword_216F21000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s service listener resumed, attempting to re-establish XPC connection", (uint8_t *)&v9, 0xCu);
  }

  v3 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_loadWeakRetained(v3);
  objc_msgSend(v6, "connection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "reconnect");
}

void __27__WCPrivateXPCManager_init__block_invoke_59(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  wc_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __27__WCPrivateXPCManager_init__block_invoke_59_cold_1((uint64_t)v2);

}

- (void)dealloc
{
  objc_super v3;

  notify_cancel(self->_listenerResumedToken);
  notify_cancel(self->_privateServiceShouldConnectToken);
  v3.receiver = self;
  v3.super_class = (Class)WCPrivateXPCManager;
  -[WCPrivateXPCManager dealloc](&v3, sel_dealloc);
}

- (NSXPCConnection)connection
{
  NSXPCConnection *connection;

  connection = self->_connection;
  if (!connection)
  {
    -[WCPrivateXPCManager setupConnection](self, "setupConnection");
    connection = self->_connection;
  }
  return connection;
}

- (void)setupConnection
{
  NSObject *v3;
  NSXPCConnection *v4;
  NSXPCConnection *connection;
  uint64_t v6;
  _QWORD v7[5];
  _QWORD v8[4];
  id v9;
  id location;
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_initWeak(&location, self);
  wc_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v12 = "-[WCPrivateXPCManager setupConnection]";
    _os_log_impl(&dword_216F21000, v3, OS_LOG_TYPE_DEFAULT, "%{public}s setting up private xpc connection", buf, 0xCu);
  }

  v4 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.wcd.private"), 0);
  connection = self->_connection;
  self->_connection = v4;

  -[NSXPCConnection setDelegate:](self->_connection, "setDelegate:", self);
  -[NSXPCConnection setExportedInterface:](self->_connection, "setExportedInterface:", sXPCPrivateManagerClientInterface);
  -[NSXPCConnection setExportedObject:](self->_connection, "setExportedObject:", self);
  -[NSXPCConnection setRemoteObjectInterface:](self->_connection, "setRemoteObjectInterface:", sXPCPrivateManagerDaemonInterface);
  v6 = MEMORY[0x24BDAC760];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __38__WCPrivateXPCManager_setupConnection__block_invoke;
  v8[3] = &unk_24D662070;
  objc_copyWeak(&v9, &location);
  -[NSXPCConnection setInterruptionHandler:](self->_connection, "setInterruptionHandler:", v8);
  v7[0] = v6;
  v7[1] = 3221225472;
  v7[2] = __38__WCPrivateXPCManager_setupConnection__block_invoke_67;
  v7[3] = &unk_24D661AB8;
  v7[4] = self;
  -[NSXPCConnection setInvalidationHandler:](self->_connection, "setInvalidationHandler:", v7);
  -[NSXPCConnection resume](self->_connection, "resume");
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __38__WCPrivateXPCManager_setupConnection__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  void *v4;

  wc_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __38__WCPrivateXPCManager_setupConnection__block_invoke_cold_1(v2);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

}

void __38__WCPrivateXPCManager_setupConnection__block_invoke_67(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 16);
  *(_QWORD *)(v1 + 16) = 0;

}

- (void)connection:(id)a3 handleInvocation:(id)a4 isReply:(BOOL)a5
{
  id v6;
  NSObject *delegateQueue;
  id v8;
  _QWORD block[4];
  id v10;

  v6 = a4;
  objc_msgSend(v6, "retainArguments");
  delegateQueue = self->_delegateQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__WCPrivateXPCManager_connection_handleInvocation_isReply___block_invoke;
  block[3] = &unk_24D661AB8;
  v10 = v6;
  v8 = v6;
  dispatch_async(delegateQueue, block);

}

uint64_t __59__WCPrivateXPCManager_connection_handleInvocation_isReply___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invoke");
}

- (void)fakeIncomingPayloadOnSubService:(id)a3 ofType:(id)a4 clientData:(id)a5 resource:(id)a6 resourceSandboxToken:(id)a7 completionHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  NSObject *v20;
  const char *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  const char *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a4;
  v16 = a6;
  v17 = a8;
  v18 = a7;
  v19 = a5;
  wc_log();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    if (v19)
      v21 = "YES";
    else
      v21 = "NO";
    objc_msgSend(v16, "path");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 136447234;
    v26 = "-[WCPrivateXPCManager fakeIncomingPayloadOnSubService:ofType:clientData:resource:resourceSandboxToken:completionHandler:]";
    v27 = 2114;
    v28 = v14;
    v29 = 2114;
    v30 = v15;
    v31 = 2080;
    v32 = v21;
    v33 = 2114;
    v34 = v22;
    _os_log_impl(&dword_216F21000, v20, OS_LOG_TYPE_DEFAULT, "%{public}s %{public}@, transferType: %{public}@, clientData: %s, URL: %{public}@", (uint8_t *)&v25, 0x34u);

  }
  -[WCPrivateXPCManager connection](self, "connection");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_70);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v24, "fakeIncomingPayloadOnSubService:ofType:clientData:resource:resourceSandboxToken:completionHandler:", v14, v15, v19, v16, v18, v17);
}

void __121__WCPrivateXPCManager_fakeIncomingPayloadOnSubService_ofType_clientData_resource_resourceSandboxToken_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  wc_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __121__WCPrivateXPCManager_fakeIncomingPayloadOnSubService_ofType_clientData_resource_resourceSandboxToken_completionHandler___block_invoke_cold_1((uint64_t)v2);

}

- (void)handlePingForExtensionBundleID:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WCPrivateXPCManager delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "xpcManager:handlePingForExtensionBundleID:", self, v4);

}

- (void)isExtensionPrivileged:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[WCPrivateXPCManager delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "xpcManager:isExtensionPrivileged:completionHandler:", self, v7, v6);

}

- (void)handlePairedSyncComplicationsStartedWithCompletionHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WCPrivateXPCManager delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "xpcManager:handlePairedSyncComplicationsStartedWithCompletionHandler:", self, v4);

}

- (WCPrivateXPCManagerDelegate)delegate
{
  return (WCPrivateXPCManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)delegateQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (int)listenerResumedToken
{
  return self->_listenerResumedToken;
}

- (void)setListenerResumedToken:(int)a3
{
  self->_listenerResumedToken = a3;
}

- (int)privateServiceShouldConnectToken
{
  return self->_privateServiceShouldConnectToken;
}

- (void)setPrivateServiceShouldConnectToken:(int)a3
{
  self->_privateServiceShouldConnectToken = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_connection, 0);
}

void __27__WCPrivateXPCManager_init__block_invoke_59_cold_1(uint64_t a1)
{
  void *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v9;

  NSPrintF();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_0(&dword_216F21000, v2, v3, "%{public}s failed to retrieve remote object proxy %{public}@", v4, v5, v6, v7, a1, v9, 2u);

  OUTLINED_FUNCTION_17();
}

void __38__WCPrivateXPCManager_setupConnection__block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_216F21000, log, OS_LOG_TYPE_ERROR, "private xpc connection interrupted", v1, 2u);
}

void __121__WCPrivateXPCManager_fakeIncomingPayloadOnSubService_ofType_clientData_resource_resourceSandboxToken_completionHandler___block_invoke_cold_1(uint64_t a1)
{
  void *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v9;

  NSPrintF();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_0(&dword_216F21000, v2, v3, "%{public}s failed to retrieve remote object proxy %{public}@", v4, v5, v6, v7, a1, v9, 2u);

  OUTLINED_FUNCTION_17();
}

@end
