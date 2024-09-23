@implementation WCXPCManager

uint64_t __52__WCXPCManager_connection_handleInvocation_isReply___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invoke");
}

+ (id)daemonInterface
{
  return (id)sXPCManagerDaemonInterface;
}

+ (id)clientInterface
{
  return (id)sXPCManagerClientInterface;
}

+ (void)initialize
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254E5BBD8);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)sXPCManagerDaemonInterface;
  sXPCManagerDaemonInterface = v2;

  v4 = (void *)sXPCManagerDaemonInterface;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_sendMessage_clientPairingID_acceptanceHandler_, 0, 0);

  v6 = (void *)sXPCManagerDaemonInterface;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setClasses:forSelector:argumentIndex:ofReply:", v7, sel_transferFile_sandboxToken_clientPairingID_errorHandler_, 0, 0);

  v8 = (void *)sXPCManagerDaemonInterface;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_transferUserInfo_withURL_clientPairingID_errorHandler_, 0, 0);

  v10 = (void *)sXPCManagerDaemonInterface;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_transferUserInfo_withURL_clientPairingID_errorHandler_, 1, 0);

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254E5B910);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)sXPCManagerClientInterface;
  sXPCManagerClientInterface = v12;

  v14 = (void *)sXPCManagerClientInterface;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setClasses:forSelector:argumentIndex:ofReply:", v15, sel_handleSessionStateChanged_, 0, 0);

  v16 = (void *)sXPCManagerClientInterface;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setClasses:forSelector:argumentIndex:ofReply:", v17, sel_handleRequest_, 0, 0);

  v18 = (void *)sXPCManagerClientInterface;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setClasses:forSelector:argumentIndex:ofReply:", v19, sel_handleResponse_, 0, 0);

}

void __29__WCXPCManager_sharedManager__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedManager_manager_0;
  sharedManager_manager_0 = v0;

}

- (WCXPCManager)init
{
  WCXPCManager *v2;
  WCXPCManager *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *workQueue;
  const char *v6;
  NSObject *v7;
  _QWORD handler[4];
  WCXPCManager *v10;
  id v11;
  id location;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)WCXPCManager;
  v2 = -[WCXPCManager init](&v13, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_reconnectRetryCount = 0;
    *(_WORD *)&v2->_connectionInvalidated = 0;
    v4 = dispatch_queue_create("com.apple.private.watchconnectivity.work-queue", 0);
    workQueue = v3->_workQueue;
    v3->_workQueue = (OS_dispatch_queue *)v4;

    objc_initWeak(&location, v3);
    v6 = (const char *)objc_msgSend(CFSTR("com.apple.wcd.listener.resumed"), "UTF8String");
    v7 = v3->_workQueue;
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __20__WCXPCManager_init__block_invoke;
    handler[3] = &unk_24D662240;
    v10 = v3;
    objc_copyWeak(&v11, &location);
    notify_register_dispatch(v6, &v3->_listenerResumedToken, v7, handler);
    objc_destroyWeak(&v11);

    objc_destroyWeak(&location);
  }
  return v3;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSXPCConnection)connection
{
  NSXPCConnection *connection;

  connection = self->_connection;
  if (!connection)
  {
    -[WCXPCManager setupConnection](self, "setupConnection");
    connection = self->_connection;
  }
  return connection;
}

- (void)setupConnection
{
  NSXPCConnection *v3;
  NSXPCConnection *connection;
  uint64_t v5;
  _QWORD v6[5];
  _QWORD v7[4];
  id v8;
  id location;

  v3 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.wcd"), 0);
  connection = self->_connection;
  self->_connection = v3;

  -[NSXPCConnection setDelegate:](self->_connection, "setDelegate:", self);
  -[NSXPCConnection setExportedInterface:](self->_connection, "setExportedInterface:", sXPCManagerClientInterface);
  -[NSXPCConnection setExportedObject:](self->_connection, "setExportedObject:", self);
  -[NSXPCConnection setRemoteObjectInterface:](self->_connection, "setRemoteObjectInterface:", sXPCManagerDaemonInterface);
  objc_initWeak(&location, self);
  v5 = MEMORY[0x24BDAC760];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __31__WCXPCManager_setupConnection__block_invoke;
  v7[3] = &unk_24D662070;
  objc_copyWeak(&v8, &location);
  -[NSXPCConnection setInterruptionHandler:](self->_connection, "setInterruptionHandler:", v7);
  v6[0] = v5;
  v6[1] = 3221225472;
  v6[2] = __31__WCXPCManager_setupConnection__block_invoke_3;
  v6[3] = &unk_24D661AB8;
  v6[4] = self;
  -[NSXPCConnection setInvalidationHandler:](self->_connection, "setInvalidationHandler:", v6);
  -[NSXPCConnection resume](self->_connection, "resume");
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)handleSessionStateChanged:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WCXPCManager delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleSessionStateChanged:", v4);

}

- (WCXPCManagerDelegate)delegate
{
  return (WCXPCManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)connection:(id)a3 handleInvocation:(id)a4 isReply:(BOOL)a5
{
  id v6;
  NSObject *workQueue;
  id v8;
  _QWORD block[4];
  id v10;

  v6 = a4;
  objc_msgSend(v6, "retainArguments");
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52__WCXPCManager_connection_handleInvocation_isReply___block_invoke;
  block[3] = &unk_24D661AB8;
  v10 = v6;
  v8 = v6;
  dispatch_async(workQueue, block);

}

+ (id)sharedManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __29__WCXPCManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_onceToken_0 != -1)
    dispatch_once(&sharedManager_onceToken_0, block);
  return (id)sharedManager_manager_0;
}

- (void)sessionReadyForInitialStateForClientPairingID:(id)a3 supportsActiveDeviceSwitch:(BOOL)a4 withErrorHandler:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id location;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  objc_initWeak(&location, self);
  -[WCXPCManager connection](self, "connection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __106__WCXPCManager_sessionReadyForInitialStateForClientPairingID_supportsActiveDeviceSwitch_withErrorHandler___block_invoke;
  v18[3] = &unk_24D662290;
  objc_copyWeak(&v20, &location);
  v12 = v9;
  v19 = v12;
  objc_msgSend(v10, "remoteObjectProxyWithErrorHandler:", v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __106__WCXPCManager_sessionReadyForInitialStateForClientPairingID_supportsActiveDeviceSwitch_withErrorHandler___block_invoke_2;
  v15[3] = &unk_24D662290;
  objc_copyWeak(&v17, &location);
  v14 = v12;
  v16 = v14;
  objc_msgSend(v13, "sessionReadyForInitialStateForClientPairingID:supportsActiveDeviceSwitch:withErrorHandler:", v8, v6, v15);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

}

void __106__WCXPCManager_sessionReadyForInitialStateForClientPairingID_supportsActiveDeviceSwitch_withErrorHandler___block_invoke_2(uint64_t a1, void *a2)
{
  _BOOL8 v3;
  id *v4;
  id WeakRetained;
  id v6;

  v3 = a2 != 0;
  v4 = (id *)(a1 + 40);
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "setReconnectFailed:", v3);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setReconnectFailed:(BOOL)a3
{
  self->_reconnectFailed = a3;
}

void __20__WCXPCManager_init__block_invoke(uint64_t a1)
{
  id WeakRetained;

  objc_msgSend(*(id *)(a1 + 32), "setReconnectRetryCount:", 0);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "onqueue_retryConnectIfNecessary");

}

void __31__WCXPCManager_setupConnection__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  NSObject *v3;
  _QWORD block[4];
  id v5;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __31__WCXPCManager_setupConnection__block_invoke_2;
  block[3] = &unk_24D662070;
  objc_copyWeak(&v5, v1);
  dispatch_async(v3, block);

  objc_destroyWeak(&v5);
}

void __31__WCXPCManager_setupConnection__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "interruptionHandler");

}

void __31__WCXPCManager_setupConnection__block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint8_t v5[16];

  wc_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_216F21000, v2, OS_LOG_TYPE_DEFAULT, "xpc connection invalidated", v5, 2u);
  }

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 16);
  *(_QWORD *)(v3 + 16) = 0;

}

- (void)onqueue_retryConnectIfNecessary
{
  NSObject *v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (-[WCXPCManager reconnectFailed](self, "reconnectFailed"))
  {
    if (-[WCXPCManager reconnectRetryCount](self, "reconnectRetryCount") > 4)
    {
      wc_log();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v5 = 136446466;
        v6 = "-[WCXPCManager onqueue_retryConnectIfNecessary]";
        v7 = 1024;
        v8 = -[WCXPCManager reconnectRetryCount](self, "reconnectRetryCount");
        _os_log_impl(&dword_216F21000, v4, OS_LOG_TYPE_DEFAULT, "%{public}s failed to reconnect to daemon (%d attempts)", (uint8_t *)&v5, 0x12u);
      }

    }
    else
    {
      -[WCXPCManager setReconnectRetryCount:](self, "setReconnectRetryCount:", -[WCXPCManager reconnectRetryCount](self, "reconnectRetryCount") + 1);
      wc_log();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        v5 = 136446466;
        v6 = "-[WCXPCManager onqueue_retryConnectIfNecessary]";
        v7 = 1024;
        v8 = -[WCXPCManager reconnectRetryCount](self, "reconnectRetryCount");
        _os_log_impl(&dword_216F21000, v3, OS_LOG_TYPE_DEFAULT, "%{public}s retrying previously failed reconnect (%d attempt)", (uint8_t *)&v5, 0x12u);
      }

      -[WCXPCManager setReconnectFailed:](self, "setReconnectFailed:", 0);
      -[WCXPCManager onqueue_reconnect](self, "onqueue_reconnect");
    }
  }
}

- (void)onqueue_reconnect
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  wc_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v11 = "-[WCXPCManager onqueue_reconnect]";
    _os_log_impl(&dword_216F21000, v3, OS_LOG_TYPE_DEFAULT, "%{public}s ", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  -[WCXPCManager delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentPairingID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WCXPCManager delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "supportsActiveDeviceSwitch");
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __33__WCXPCManager_onqueue_reconnect__block_invoke;
  v8[3] = &unk_24D662268;
  objc_copyWeak(&v9, (id *)buf);
  v8[4] = self;
  -[WCXPCManager sessionReadyForInitialStateForClientPairingID:supportsActiveDeviceSwitch:withErrorHandler:](self, "sessionReadyForInitialStateForClientPairingID:supportsActiveDeviceSwitch:withErrorHandler:", v5, v7, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak((id *)buf);
}

void __33__WCXPCManager_onqueue_reconnect__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  void *v6;
  uint64_t v7;

  v3 = a2;
  if (v3)
  {
    wc_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __33__WCXPCManager_onqueue_reconnect__block_invoke_cold_1();

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v6 = WeakRetained;
    v7 = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setReconnectRetryCount:", 0);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v6 = WeakRetained;
    v7 = 0;
  }
  objc_msgSend(WeakRetained, "setReconnectFailed:", v7);

}

- (void)interruptionHandler
{
  id v3;

  if (-[WCXPCManager connectionInvalidated](self, "connectionInvalidated"))
  {
    -[WCXPCManager connection](self, "connection");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "invalidate");

  }
  else
  {
    -[WCXPCManager handleInterruptedConnection](self, "handleInterruptedConnection");
    if (-[WCXPCManager reconnectFailed](self, "reconnectFailed"))
      -[WCXPCManager onqueue_retryConnectIfNecessary](self, "onqueue_retryConnectIfNecessary");
    else
      -[WCXPCManager onqueue_reconnect](self, "onqueue_reconnect");
  }
}

- (void)handleInterruptedConnection
{
  id v2;

  -[WCXPCManager delegate](self, "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "xpcConnectionInterrupted");

}

void __106__WCXPCManager_sessionReadyForInitialStateForClientPairingID_supportsActiveDeviceSwitch_withErrorHandler___block_invoke(uint64_t a1, void *a2)
{
  _BOOL8 v3;
  id *v4;
  id WeakRetained;
  id v6;

  v3 = a2 != 0;
  v4 = (id *)(a1 + 40);
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "setReconnectFailed:", v3);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)sendMessage:(id)a3 clientPairingID:(id)a4 acceptanceHandler:(id)a5
{
  -[WCXPCManager sendMessage:clientPairingID:acceptanceHandler:errorHandler:](self, "sendMessage:clientPairingID:acceptanceHandler:errorHandler:", a3, a4, a5, 0);
}

- (void)sendMessage:(id)a3 clientPairingID:(id)a4 acceptanceHandler:(id)a5 errorHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  -[WCXPCManager onqueue_retryConnectIfNecessary](self, "onqueue_retryConnectIfNecessary");
  -[WCXPCManager connection](self, "connection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "remoteObjectProxyWithErrorHandler:", v10);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "sendMessage:clientPairingID:acceptanceHandler:", v13, v12, v11);
}

- (void)updateApplicationContext:(id)a3 clientPairingID:(id)a4 errorHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[WCXPCManager onqueue_retryConnectIfNecessary](self, "onqueue_retryConnectIfNecessary");
  -[WCXPCManager connection](self, "connection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", v8);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "updateApplicationContext:clientPairingID:errorHandler:", v10, v9, v8);
}

- (void)transferFile:(id)a3 sandboxToken:(id)a4 clientPairingID:(id)a5 errorHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  -[WCXPCManager onqueue_retryConnectIfNecessary](self, "onqueue_retryConnectIfNecessary");
  -[WCXPCManager connection](self, "connection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "remoteObjectProxyWithErrorHandler:", v10);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "transferFile:sandboxToken:clientPairingID:errorHandler:", v13, v12, v11, v10);
}

- (void)transferUserInfo:(id)a3 withURL:(id)a4 clientPairingID:(id)a5 errorHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  -[WCXPCManager onqueue_retryConnectIfNecessary](self, "onqueue_retryConnectIfNecessary");
  -[WCXPCManager connection](self, "connection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "remoteObjectProxyWithErrorHandler:", v10);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "transferUserInfo:withURL:clientPairingID:errorHandler:", v13, v12, v11, v10);
}

- (void)cancelSendWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[WCXPCManager onqueue_retryConnectIfNecessary](self, "onqueue_retryConnectIfNecessary");
  -[WCXPCManager connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_4);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "cancelSendWithIdentifier:", v4);
}

void __41__WCXPCManager_cancelSendWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  wc_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __41__WCXPCManager_cancelSendWithIdentifier___block_invoke_cold_1();

}

- (void)cancelAllOutstandingMessages
{
  void *v3;
  id v4;

  -[WCXPCManager onqueue_retryConnectIfNecessary](self, "onqueue_retryConnectIfNecessary");
  -[WCXPCManager connection](self, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_105);
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "cancelAllOutstandingMessages");
}

void __44__WCXPCManager_cancelAllOutstandingMessages__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  wc_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __44__WCXPCManager_cancelAllOutstandingMessages__block_invoke_cold_1();

}

- (void)acknowledgeFileIndexWithIdentifier:(id)a3 clientPairingID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[WCXPCManager onqueue_retryConnectIfNecessary](self, "onqueue_retryConnectIfNecessary");
  -[WCXPCManager connection](self, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_106);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "acknowledgeFileIndexWithIdentifier:clientPairingID:", v7, v6);
}

void __67__WCXPCManager_acknowledgeFileIndexWithIdentifier_clientPairingID___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  wc_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __67__WCXPCManager_acknowledgeFileIndexWithIdentifier_clientPairingID___block_invoke_cold_1();

}

- (void)acknowledgeFileResultIndexWithIdentifier:(id)a3 clientPairingID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[WCXPCManager onqueue_retryConnectIfNecessary](self, "onqueue_retryConnectIfNecessary");
  -[WCXPCManager connection](self, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_107);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "acknowledgeFileResultIndexWithIdentifier:clientPairingID:", v7, v6);
}

void __73__WCXPCManager_acknowledgeFileResultIndexWithIdentifier_clientPairingID___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  wc_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __73__WCXPCManager_acknowledgeFileResultIndexWithIdentifier_clientPairingID___block_invoke_cold_1();

}

- (void)acknowledgeUserInfoIndexWithIdentifier:(id)a3 clientPairingID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[WCXPCManager onqueue_retryConnectIfNecessary](self, "onqueue_retryConnectIfNecessary");
  -[WCXPCManager connection](self, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_108);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "acknowledgeUserInfoIndexWithIdentifier:clientPairingID:", v7, v6);
}

void __71__WCXPCManager_acknowledgeUserInfoIndexWithIdentifier_clientPairingID___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  wc_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __71__WCXPCManager_acknowledgeUserInfoIndexWithIdentifier_clientPairingID___block_invoke_cold_1();

}

- (void)acknowledgeUserInfoResultIndexWithIdentifier:(id)a3 clientPairingID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[WCXPCManager onqueue_retryConnectIfNecessary](self, "onqueue_retryConnectIfNecessary");
  -[WCXPCManager connection](self, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_109);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "acknowledgeUserInfoResultIndexWithIdentifier:clientPairingID:", v7, v6);
}

void __77__WCXPCManager_acknowledgeUserInfoResultIndexWithIdentifier_clientPairingID___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  wc_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __77__WCXPCManager_acknowledgeUserInfoResultIndexWithIdentifier_clientPairingID___block_invoke_cold_1();

}

- (void)invalidateConnection
{
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  wc_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136446210;
    v6 = "-[WCXPCManager invalidateConnection]";
    _os_log_impl(&dword_216F21000, v3, OS_LOG_TYPE_DEFAULT, "%{public}s ", (uint8_t *)&v5, 0xCu);
  }

  if (!-[WCXPCManager connectionInvalidated](self, "connectionInvalidated"))
  {
    -[WCXPCManager setConnectionInvalidated:](self, "setConnectionInvalidated:", 1);
    -[WCXPCManager connection](self, "connection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invalidate");

  }
}

- (void)handleMessageSendingAllowed
{
  id v2;

  -[WCXPCManager delegate](self, "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleMessageSendingAllowed");

}

- (void)handleSentMessageWithIdentifier:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[WCXPCManager delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "handleSentMessageWithIdentifier:error:", v7, v6);

}

- (void)handleRequest:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WCXPCManager delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleRequest:", v4);

}

- (void)handleResponse:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WCXPCManager delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleResponse:", v4);

}

- (void)handleApplicationContextWithPairingID:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WCXPCManager delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleApplicationContextWithPairingID:", v4);

}

- (void)handleIncomingFileWithPairingID:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WCXPCManager delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleIncomingFileWithPairingID:", v4);

}

- (void)handleIncomingUserInfoWithPairingID:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WCXPCManager delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleIncomingUserInfoWithPairingID:", v4);

}

- (void)handleFileResultWithPairingID:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WCXPCManager delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFileResultWithPairingID:", v4);

}

- (void)handleUserInfoResultWithPairingID:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WCXPCManager delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleUserInfoResultWithPairingID:", v4);

}

- (void)handleActiveDeviceSwitchStarted
{
  id v2;

  -[WCXPCManager delegate](self, "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleActiveDeviceSwitchStarted");

}

- (OS_dispatch_queue)workQueue
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

- (BOOL)connectionInvalidated
{
  return self->_connectionInvalidated;
}

- (void)setConnectionInvalidated:(BOOL)a3
{
  self->_connectionInvalidated = a3;
}

- (BOOL)reconnectFailed
{
  return self->_reconnectFailed;
}

- (unint64_t)reconnectRetryCount
{
  return self->_reconnectRetryCount;
}

- (void)setReconnectRetryCount:(unint64_t)a3
{
  self->_reconnectRetryCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_connection, 0);
}

void __33__WCXPCManager_onqueue_reconnect__block_invoke_cold_1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_24(*MEMORY[0x24BDAC8D0]);
  NSPrintF();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_0(&dword_216F21000, v1, v2, "%{public}s error reconnecting to daemon due to %{public}@", v3, v4, v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_17();
}

void __41__WCXPCManager_cancelSendWithIdentifier___block_invoke_cold_1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_24(*MEMORY[0x24BDAC8D0]);
  NSPrintF();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_0(&dword_216F21000, v1, v2, "%{public}s remote object error due to %{public}@", v3, v4, v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_17();
}

void __44__WCXPCManager_cancelAllOutstandingMessages__block_invoke_cold_1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_24(*MEMORY[0x24BDAC8D0]);
  NSPrintF();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_0(&dword_216F21000, v1, v2, "%{public}s remote object error due to %{public}@", v3, v4, v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_17();
}

void __67__WCXPCManager_acknowledgeFileIndexWithIdentifier_clientPairingID___block_invoke_cold_1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_24(*MEMORY[0x24BDAC8D0]);
  NSPrintF();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_0(&dword_216F21000, v1, v2, "%{public}s remote object error due to %{public}@", v3, v4, v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_17();
}

void __73__WCXPCManager_acknowledgeFileResultIndexWithIdentifier_clientPairingID___block_invoke_cold_1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_24(*MEMORY[0x24BDAC8D0]);
  NSPrintF();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_0(&dword_216F21000, v1, v2, "%{public}s remote object error due to %{public}@", v3, v4, v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_17();
}

void __71__WCXPCManager_acknowledgeUserInfoIndexWithIdentifier_clientPairingID___block_invoke_cold_1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_24(*MEMORY[0x24BDAC8D0]);
  NSPrintF();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_0(&dword_216F21000, v1, v2, "%{public}s remote object error due to %{public}@", v3, v4, v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_17();
}

void __77__WCXPCManager_acknowledgeUserInfoResultIndexWithIdentifier_clientPairingID___block_invoke_cold_1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_24(*MEMORY[0x24BDAC8D0]);
  NSPrintF();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_0(&dword_216F21000, v1, v2, "%{public}s remote object error due to %{public}@", v3, v4, v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_17();
}

@end
