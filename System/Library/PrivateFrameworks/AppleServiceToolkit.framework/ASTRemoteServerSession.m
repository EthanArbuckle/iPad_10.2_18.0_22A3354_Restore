@implementation ASTRemoteServerSession

- (ASTRemoteServerSession)initWithSerialNumber:(id)a3
{
  void *v4;
  ASTRemoteServerSession *v5;

  +[ASTIdentity identityWithSerialNumber:](ASTIdentity, "identityWithSerialNumber:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[ASTRemoteServerSession initWithIdentity:](self, "initWithIdentity:", v4);

  return v5;
}

+ (ASTRemoteServerSession)sessionWithSerialNumber:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithSerialNumber:", v4);

  return (ASTRemoteServerSession *)v5;
}

- (ASTRemoteServerSession)initWithIdentity:(id)a3
{
  id v4;
  ASTContext *v5;
  ASTRemoteServerSession *v6;

  v4 = a3;
  v5 = -[ASTContext initWithIdentity:]([ASTContext alloc], "initWithIdentity:", v4);

  v6 = -[ASTRemoteServerSession initWithContext:](self, "initWithContext:", v5);
  return v6;
}

+ (ASTRemoteServerSession)sessionWithIdentity:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithIdentity:", v4);

  return (ASTRemoteServerSession *)v5;
}

- (ASTRemoteServerSession)initWithContext:(id)a3
{
  id v5;
  ASTRemoteServerSession *v6;
  ASTRemoteServerSession *v7;
  void *v8;
  void *v9;
  void *v10;
  ASTMaterializedConnectionManager *v11;
  ASTConnectionManager *connectionManager;
  void *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *delegateQueue;
  dispatch_queue_t v16;
  OS_dispatch_queue *clientStatusQueue;
  uint64_t v18;
  uint64_t v19;
  id payloadSigner;
  uint64_t v21;
  id fileSigner;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  id location;
  objc_super v29;

  v5 = a3;
  v29.receiver = self;
  v29.super_class = (Class)ASTRemoteServerSession;
  v6 = -[ASTRemoteServerSession init](&v29, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->super._context, a3);
    +[ASTEnvironment currentEnvironment](ASTEnvironment, "currentEnvironment");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "SOCKSProxyServer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "SOCKSProxyPort");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[ASTMaterializedConnectionManager initWithSOCKSProxyServer:port:]([ASTMaterializedConnectionManager alloc], "initWithSOCKSProxyServer:port:", v9, v10);
    connectionManager = v7->_connectionManager;
    v7->_connectionManager = (ASTConnectionManager *)v11;

    -[ASTConnectionManager setDelegate:](v7->_connectionManager, "setDelegate:", v7);
    -[ASTContext identity](v7->super._context, "identity");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASTConnectionManager setIdentity:](v7->_connectionManager, "setIdentity:", v13);

    v7->super._sessionEndReason = 0;
    v14 = dispatch_queue_create("com.apple.AppleServiceToolkit.delegateQueue", 0);
    delegateQueue = v7->_delegateQueue;
    v7->_delegateQueue = (OS_dispatch_queue *)v14;

    v16 = dispatch_queue_create("com.apple.AppleServiceToolkit.clientStatusLoop", 0);
    clientStatusQueue = v7->_clientStatusQueue;
    v7->_clientStatusQueue = (OS_dispatch_queue *)v16;

    v7->super._allowCellularSizeThreshold = +[ASTConnectionUtilities allowCellularSizeThreshold](ASTConnectionUtilities, "allowCellularSizeThreshold");
    objc_initWeak(&location, v7);
    v18 = MEMORY[0x24BDAC760];
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __42__ASTRemoteServerSession_initWithContext___block_invoke;
    v26[3] = &unk_24F96A3A0;
    objc_copyWeak(&v27, &location);
    v19 = MEMORY[0x22E31C3E0](v26);
    payloadSigner = v7->_payloadSigner;
    v7->_payloadSigner = (id)v19;

    v24[0] = v18;
    v24[1] = 3221225472;
    v24[2] = __42__ASTRemoteServerSession_initWithContext___block_invoke_2;
    v24[3] = &unk_24F96A3C8;
    objc_copyWeak(&v25, &location);
    v21 = MEMORY[0x22E31C3E0](v24);
    fileSigner = v7->_fileSigner;
    v7->_fileSigner = (id)v21;

    objc_destroyWeak(&v25);
    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);

  }
  return v7;
}

id __42__ASTRemoteServerSession_initWithContext___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id *v4;
  id v5;
  id WeakRetained;
  void *v7;

  v4 = (id *)(a1 + 32);
  v5 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_signPayload:error:", v5, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __42__ASTRemoteServerSession_initWithContext___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id *v4;
  id v5;
  id WeakRetained;
  void *v7;

  v4 = (id *)(a1 + 32);
  v5 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_signFile:error:", v5, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (ASTRemoteServerSession)sessionWithContext:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithContext:", v4);

  return (ASTRemoteServerSession *)v5;
}

- (BOOL)shouldShowResults
{
  return 1;
}

- (void)setSessionEndReason:(int64_t)a3
{
  ASTRemoteServerSession *obj;

  obj = self;
  objc_sync_enter(obj);
  if (!obj->super._sessionEndReason)
    obj->super._sessionEndReason = a3;
  objc_sync_exit(obj);

}

+ (void)sessionStatusForIdentities:(id)a3 ticketNumber:(id)a4 timeout:(double)a5 requestQueuedSuiteInfo:(BOOL)a6 completionHandler:(id)a7
{
  _BOOL8 v7;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  ASTMaterializedConnectionManager *v17;
  id v18;
  _QWORD v19[4];
  id v20;

  v7 = a6;
  v11 = a7;
  v12 = a4;
  v13 = a3;
  +[ASTEnvironment currentEnvironment](ASTEnvironment, "currentEnvironment");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "SOCKSProxyServer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "SOCKSProxyPort");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[ASTMaterializedConnectionManager initWithSOCKSProxyServer:port:]([ASTMaterializedConnectionManager alloc], "initWithSOCKSProxyServer:port:", v15, v16);
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __115__ASTRemoteServerSession_sessionStatusForIdentities_ticketNumber_timeout_requestQueuedSuiteInfo_completionHandler___block_invoke;
  v19[3] = &unk_24F96A3F0;
  v20 = v11;
  v18 = v11;
  -[ASTMaterializedConnectionManager postSessionStatusForIdentities:ticket:timeout:allowsCellularAccess:requestQueuedSuiteInfo:completion:](v17, "postSessionStatusForIdentities:ticket:timeout:allowsCellularAccess:requestQueuedSuiteInfo:completion:", v13, v12, 1, v7, v19, a5);

}

void __115__ASTRemoteServerSession_sessionStatusForIdentities_ticketNumber_timeout_requestQueuedSuiteInfo_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, void *a6, void *a7, void *a8)
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  ASTSessionInfo *v25;
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x24BDAC8D0];
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v18 = v17;
  if (v17)
  {
    v19 = (void *)MEMORY[0x24BDD1540];
    v26 = *MEMORY[0x24BDD1398];
    v27[0] = v17;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("ASTErrorDomain"), -1002, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[ASTEnvironment currentEnvironment](ASTEnvironment, "currentEnvironment");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setDiagsChannel:", v14);

    +[ASTEnvironment currentEnvironment](ASTEnvironment, "currentEnvironment");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setConfigCode:", v15);

    +[ASTEnvironment currentEnvironment](ASTEnvironment, "currentEnvironment");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setAssetURL:", v16);

    v21 = 0;
  }
  v25 = -[ASTSessionInfo initWithQueuedSuiteType:isGuided:]([ASTSessionInfo alloc], "initWithQueuedSuiteType:isGuided:", a4, a3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)start
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_22D91B000, v0, v1, "Ignored call to -[ASTSession start] while a session was already running.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __31__ASTRemoteServerSession_start__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "connectionManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postEnrollAllowingCellularAccess:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "setSessionId:", v3);

  objc_msgSend(WeakRetained, "sessionId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ASTErrorDomain"), -1000, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "setClientStatusLoopError:", v10);

    objc_msgSend(WeakRetained, "clientStatusLoopError");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[ASTAnalytics sendAnalyticsWithEvent:error:](ASTAnalytics, "sendAnalyticsWithEvent:error:", 0, v11);

    ASTLogHandleForCategory(0);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __31__ASTRemoteServerSession_start__block_invoke_cold_1();
    goto LABEL_13;
  }
  if ((objc_msgSend(WeakRetained, "_authInfoIfNecessary") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ASTErrorDomain"), -1005, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "setClientStatusLoopError:", v13);

    objc_msgSend(WeakRetained, "clientStatusLoopError");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[ASTAnalytics sendAnalyticsWithEvent:error:](ASTAnalytics, "sendAnalyticsWithEvent:error:", 1, v14);

    ASTLogHandleForCategory(0);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __31__ASTRemoteServerSession_start__block_invoke_cold_3();
    goto LABEL_13;
  }
  if ((objc_msgSend(WeakRetained, "_profile") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ASTErrorDomain"), -1001, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "setClientStatusLoopError:", v15);

    objc_msgSend(WeakRetained, "clientStatusLoopError");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[ASTAnalytics sendAnalyticsWithEvent:error:](ASTAnalytics, "sendAnalyticsWithEvent:error:", 2, v16);

    ASTLogHandleForCategory(0);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __31__ASTRemoteServerSession_start__block_invoke_cold_2();
LABEL_13:

    objc_msgSend(WeakRetained, "_teardown");
    goto LABEL_14;
  }
  objc_msgSend(WeakRetained, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "controlCommand");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(WeakRetained, "context");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "controlCommand");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "delegateQueue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "performActionsWithSession:queue:", WeakRetained, v9);

  }
  objc_msgSend(WeakRetained, "_startClientStatusLoop");
LABEL_14:

}

void __31__ASTRemoteServerSession_start__block_invoke_28(uint64_t a1)
{
  void *v1;
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ASTErrorDomain"), -2000, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "session:didEndWithError:", WeakRetained, v1);

  +[ASTAnalytics sendAnalyticsWithEvent:error:](ASTAnalytics, "sendAnalyticsWithEvent:error:", 0, v1);
}

- (void)idle
{
  NSObject *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  ASTLogHandleForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[ASTRemoteServerSession sessionId](self, "sessionId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_22D91B000, v3, OS_LOG_TYPE_DEFAULT, "[IDLE] (%@)", (uint8_t *)&v7, 0xCu);

  }
  -[ASTRemoteServerSession setShouldAbort:](self, "setShouldAbort:", 1);
  -[ASTRemoteServerSession backoffTimer](self, "backoffTimer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[ASTRemoteServerSession backoffTimer](self, "backoffTimer");
    v6 = objc_claimAutoreleasedReturnValue();
    dispatch_semaphore_signal(v6);

  }
}

- (void)end
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  ASTLogHandleForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[ASTRemoteServerSession sessionId](self, "sessionId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v4;
    _os_log_impl(&dword_22D91B000, v3, OS_LOG_TYPE_DEFAULT, "[END] (%@)", (uint8_t *)&v5, 0xCu);

  }
  -[ASTRemoteServerSession _endAndUnenrollIfNecessary:](self, "_endAndUnenrollIfNecessary:", 1);
}

- (void)invalidate
{
  NSObject *v3;
  void *v4;
  ASTRemoteServerSession *v5;
  _QWORD v6[4];
  id v7;
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  ASTLogHandleForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[ASTRemoteServerSession sessionId](self, "sessionId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v9 = v4;
    _os_log_impl(&dword_22D91B000, v3, OS_LOG_TYPE_DEFAULT, "[INVALIDATE] (%@)", buf, 0xCu);

  }
  v5 = self;
  objc_sync_enter(v5);
  -[ASTRemoteServerSession setPhase:](v5, "setPhase:", 3);
  objc_sync_exit(v5);

  objc_initWeak((id *)buf, v5);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __36__ASTRemoteServerSession_invalidate__block_invoke;
  v6[3] = &unk_24F96A418;
  objc_copyWeak(&v7, (id *)buf);
  -[ASTRemoteServerSession setSessionTeardownCompletion:](v5, "setSessionTeardownCompletion:", v6);
  -[ASTRemoteServerSession _endAndUnenrollIfNecessary:](v5, "_endAndUnenrollIfNecessary:", 0);
  objc_destroyWeak(&v7);
  objc_destroyWeak((id *)buf);
}

void __36__ASTRemoteServerSession_invalidate__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  char v4;
  id v5;
  NSObject *v6;
  _QWORD block[4];
  id v8;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    v5 = objc_loadWeakRetained(v1);
    objc_msgSend(v5, "delegateQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __36__ASTRemoteServerSession_invalidate__block_invoke_2;
    block[3] = &unk_24F96A418;
    objc_copyWeak(&v8, v1);
    dispatch_async(v6, block);

    objc_destroyWeak(&v8);
  }
}

void __36__ASTRemoteServerSession_invalidate__block_invoke_2(uint64_t a1)
{
  id *v1;
  void *v2;
  id v3;
  id WeakRetained;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v2, "sessionDidInvalidate:", v3);

}

- (void)archive
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_22D91B000, v0, v1, "Failed to archive the session, session id is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __33__ASTRemoteServerSession_archive__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    ASTLogHandleForCategory(0);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __33__ASTRemoteServerSession_archive__block_invoke_cold_1(a1, v3, v4);

  }
}

- (void)_endAndUnenrollIfNecessary:(BOOL)a3
{
  _BOOL8 v3;
  ASTRemoteServerSession *v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;

  v3 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = -[ASTRemoteServerSession phase](v4, "phase");
  if ((unint64_t)(v5 - 1) >= 3)
  {
    if (v5)
    {
      objc_sync_exit(v4);

      ASTLogHandleForCategory(0);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[ASTRemoteServerSession _endAndUnenrollIfNecessary:].cold.1();

    }
    else
    {
      objc_sync_exit(v4);

      -[ASTRemoteServerSession _teardown](v4, "_teardown");
    }
    v6 = 0;
    v7 = 0;
  }
  else
  {
    if (-[ASTRemoteServerSession phase](v4, "phase") != 3)
      -[ASTRemoteServerSession setPhase:](v4, "setPhase:", 4);
    -[ASTRemoteServerSession pendingProfileSemaphore](v4, "pendingProfileSemaphore");
    v6 = objc_claimAutoreleasedReturnValue();
    -[ASTRemoteServerSession setPendingProfileResult:](v4, "setPendingProfileResult:", 0);
    -[ASTRemoteServerSession setPendingProfileSemaphore:](v4, "setPendingProfileSemaphore:", 0);
    -[ASTRemoteServerSession pendingPropertiesSemaphore](v4, "pendingPropertiesSemaphore");
    v7 = objc_claimAutoreleasedReturnValue();
    -[ASTRemoteServerSession setPendingPropertiesResult:](v4, "setPendingPropertiesResult:", 0);
    -[ASTRemoteServerSession setPendingPropertiesSemaphore:](v4, "setPendingPropertiesSemaphore:", 0);
    -[ASTRemoteServerSession pendingAuthInfoSemaphore](v4, "pendingAuthInfoSemaphore");
    v8 = objc_claimAutoreleasedReturnValue();
    -[ASTRemoteServerSession setPendingAuthInfoResult:](v4, "setPendingAuthInfoResult:", 0);
    -[ASTRemoteServerSession setPendingAuthInfoSemaphore:](v4, "setPendingAuthInfoSemaphore:", 0);
    objc_sync_exit(v4);

    -[ASTRemoteServerSession setShouldUnenroll:](v4, "setShouldUnenroll:", v3);
    -[ASTRemoteServerSession setShouldContinueRequestLoop:](v4, "setShouldContinueRequestLoop:", 0);
    -[ASTRemoteServerSession _cancelRunningTests](v4, "_cancelRunningTests");
    -[ASTRemoteServerSession backoffTimer](v4, "backoffTimer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[ASTRemoteServerSession backoffTimer](v4, "backoffTimer");
      v10 = objc_claimAutoreleasedReturnValue();
      dispatch_semaphore_signal(v10);

    }
    if (v6)
      dispatch_semaphore_signal(v6);
    if (v7)
      dispatch_semaphore_signal(v7);
    if (v8)
    {
      dispatch_semaphore_signal(v8);

    }
  }

}

- (void)_startClientStatusLoop
{
  ASTRemoteServerSession *v2;
  void *v3;
  char v4;
  NSObject *v5;
  ASTRequest *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  ASTRequest *v27;
  uint64_t v28;
  ASTRequest *v29;
  uint64_t v30;
  NSObject *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  _BOOL4 v38;
  void *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  __int128 v50;
  void *v51;
  _QWORD block[4];
  id v53;
  id location;
  const __CFString *v55;
  void *v56;
  uint8_t buf[4];
  void *v58;
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v2 = self;
  objc_sync_enter(v2);
  -[ASTRemoteServerSession setPhase:](v2, "setPhase:", 2);
  objc_sync_exit(v2);

  objc_initWeak(&location, v2);
  -[ASTSession delegate](v2, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[ASTRemoteServerSession delegateQueue](v2, "delegateQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __48__ASTRemoteServerSession__startClientStatusLoop__block_invoke;
    block[3] = &unk_24F96A418;
    objc_copyWeak(&v53, &location);
    dispatch_async(v5, block);

    objc_destroyWeak(&v53);
  }
  v6 = objc_alloc_init(ASTRequest);
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASTSession context](v2, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "clientStatus");

  if ((unint64_t)(v8 - 13) < 2)
  {
    -[ASTSession context](v2, "context");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "controlCommand");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "requestData");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASTRequest setData:](v6, "setData:", v11);

LABEL_7:
    -[ASTSession context](v2, "context");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASTRequest setClientStatus:](v6, "setClientStatus:", objc_msgSend(v13, "clientStatus"));

    goto LABEL_8;
  }
  if (v8)
    goto LABEL_7;
  -[ASTRequest setClientStatus:](v6, "setClientStatus:", 1);
LABEL_8:
  *(_QWORD *)&v12 = 138412290;
  v50 = v12;
  while (-[ASTRemoteServerSession shouldContinueRequestLoop](v2, "shouldContinueRequestLoop", v50))
  {
    v14 = (void *)MEMORY[0x22E31C248]();
    if (-[ASTRemoteServerSession shouldAbort](v2, "shouldAbort"))
    {
      -[ASTRemoteServerSession setShouldAbort:](v2, "setShouldAbort:", 0);
      -[ASTRemoteServerSession _clientAbort](v2, "_clientAbort");
      v15 = objc_claimAutoreleasedReturnValue();

      v6 = (ASTRequest *)v15;
    }
    v16 = -[ASTRequest clientStatus](v6, "clientStatus");
    -[ASTSession context](v2, "context");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setClientStatus:", v16);

    -[ASTRemoteServerSession _sendRequest:](v2, "_sendRequest:", v6);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (!v18)
    {
      -[ASTRemoteServerSession _retryRequest](v2, "_retryRequest");
      v25 = objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
    }
    objc_msgSend(v18, "progress");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASTRemoteServerSession _updateProgress:](v2, "_updateProgress:", v20);

    v21 = objc_msgSend(v19, "command");
    if (!-[ASTRemoteServerSession _validateCommand:clientStatus:](v2, "_validateCommand:clientStatus:", v21, -[ASTRequest clientStatus](v6, "clientStatus")))
    {
      -[ASTRemoteServerSession _protocolError](v2, "_protocolError");
      -[ASTRemoteServerSession _retryRequest](v2, "_retryRequest");
      v25 = objc_claimAutoreleasedReturnValue();
LABEL_20:
      v26 = v6;
      v6 = (ASTRequest *)v25;
LABEL_21:

      goto LABEL_22;
    }
    v22 = objc_msgSend(v19, "command");
    -[ASTSession context](v2, "context");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setCommand:", v22);

    if (v21 != 7)
      -[ASTRemoteServerSession setBackoffCounter:](v2, "setBackoffCounter:", 0);
    -[ASTRemoteServerSession setRetryCounter:](v2, "setRetryCounter:", 0);
    switch(v21)
    {
      case 1:
        -[ASTRemoteServerSession _idle](v2, "_idle");
        v24 = objc_claimAutoreleasedReturnValue();
        goto LABEL_38;
      case 2:
        objc_msgSend(v19, "data");
        v27 = (ASTRequest *)objc_claimAutoreleasedReturnValue();
        -[ASTRemoteServerSession _updateUIWithData:](v2, "_updateUIWithData:", v27);
        v28 = objc_claimAutoreleasedReturnValue();
        goto LABEL_35;
      case 3:
        objc_msgSend(v19, "testId");
        v27 = (ASTRequest *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "data");
        v29 = (ASTRequest *)objc_claimAutoreleasedReturnValue();
        -[ASTRemoteServerSession _startNewTest:data:](v2, "_startNewTest:data:", v27, v29);
        v30 = objc_claimAutoreleasedReturnValue();
        goto LABEL_32;
      case 4:
        objc_msgSend(v19, "testId");
        v27 = (ASTRequest *)objc_claimAutoreleasedReturnValue();
        -[ASTRemoteServerSession _sendTestResults:](v2, "_sendTestResults:", v27);
        v28 = objc_claimAutoreleasedReturnValue();
        goto LABEL_35;
      case 5:
        objc_msgSend(v19, "data");
        v27 = (ASTRequest *)objc_claimAutoreleasedReturnValue();
        -[ASTRemoteServerSession _sendPropertiesWithData:](v2, "_sendPropertiesWithData:", v27);
        v28 = objc_claimAutoreleasedReturnValue();
        goto LABEL_35;
      case 6:
        objc_msgSend(v19, "data");
        v27 = (ASTRequest *)objc_claimAutoreleasedReturnValue();
        -[ASTRemoteServerSession _updateSessionSettingsWithData:](v2, "_updateSessionSettingsWithData:", v27);
        v28 = objc_claimAutoreleasedReturnValue();
        goto LABEL_35;
      case 7:
        -[ASTRemoteServerSession _continueWithLastRequest:](v2, "_continueWithLastRequest:", v6);
        v24 = objc_claimAutoreleasedReturnValue();
        goto LABEL_38;
      case 8:
        -[ASTRemoteServerSession _abort](v2, "_abort");
        v24 = objc_claimAutoreleasedReturnValue();
LABEL_38:
        v30 = v24;
        goto LABEL_39;
      case 9:
        -[ASTRemoteServerSession _archive](v2, "_archive");
        v36 = 1;
        goto LABEL_43;
      case 10:
        ASTLogHandleForCategory(0);
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          -[ASTRemoteServerSession sessionId](v2, "sessionId");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v50;
          v58 = v32;
          _os_log_impl(&dword_22D91B000, v31, OS_LOG_TYPE_DEFAULT, "[CONTROL] (%@)", buf, 0xCu);

        }
        -[ASTSession context](v2, "context");
        v27 = (ASTRequest *)objc_claimAutoreleasedReturnValue();
        -[ASTRequest controlCommand](v27, "controlCommand");
        v29 = (ASTRequest *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "data");
        v33 = objc_claimAutoreleasedReturnValue();
        -[ASTRemoteServerSession delegateQueue](v2, "delegateQueue");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[ASTRequest requestWithData:session:queue:](v29, "requestWithData:session:queue:", v33, v2, v34);
        v30 = objc_claimAutoreleasedReturnValue();

        v6 = (ASTRequest *)v33;
LABEL_32:

        v6 = v29;
        goto LABEL_36;
      case 11:
        objc_msgSend(v19, "data");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[ASTRemoteServerSession _rebootWithData:](v2, "_rebootWithData:", v35);
        v36 = 2;
        goto LABEL_42;
      case 12:
        objc_msgSend(v19, "data");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[ASTRemoteServerSession _shutdownWithData:](v2, "_shutdownWithData:", v35);
        v36 = 3;
LABEL_42:

LABEL_43:
        -[ASTRemoteServerSession setSessionEndReason:](v2, "setSessionEndReason:", v36);
        -[ASTRemoteServerSession setShouldContinueRequestLoop:](v2, "setShouldContinueRequestLoop:", 0);
        break;
      case 13:
        objc_msgSend(v19, "data");
        v27 = (ASTRequest *)objc_claimAutoreleasedReturnValue();
        -[ASTRemoteServerSession _showInstructionalPromptWithData:](v2, "_showInstructionalPromptWithData:", v27);
        v28 = objc_claimAutoreleasedReturnValue();
LABEL_35:
        v30 = v28;
LABEL_36:

        v6 = v27;
LABEL_39:

        v6 = (ASTRequest *)v30;
        break;
      default:
        break;
    }
    if (-[ASTRequest clientStatus](v6, "clientStatus") != 13 && -[ASTRequest clientStatus](v6, "clientStatus") != 14)
    {
      -[ASTSession context](v2, "context");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v37, "clientStatus") == 14;

      if (v38)
      {
        -[ASTSession context](v2, "context");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "controlCommand");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "reset");

        goto LABEL_21;
      }
    }
LABEL_22:

    objc_autoreleasePoolPop(v14);
  }
  if (-[ASTRemoteServerSession shouldUnenroll](v2, "shouldUnenroll"))
  {
    ASTLogHandleForCategory(0);
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      -[ASTRemoteServerSession sessionId](v2, "sessionId");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = v50;
      v58 = v41;
      _os_log_impl(&dword_22D91B000, v40, OS_LOG_TYPE_DEFAULT, "[UNENROLL] (%@)", buf, 0xCu);

    }
    +[ASTRequest request](ASTRequest, "request");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setClientStatus:", 9);
    -[ASTRemoteServerSession setSessionEndReason:](v2, "setSessionEndReason:", 4);
    -[ASTRemoteServerSession payloadSigner](v2, "payloadSigner");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "sealWithPayloadSigner:error:", v43, 0);

    v44 = -[ASTRemoteServerSession _shouldAllowCellularForSealedSealablePayload:](v2, "_shouldAllowCellularForSealedSealablePayload:", v42);
    -[ASTRemoteServerSession connectionManager](v2, "connectionManager");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = (id)objc_msgSend(v45, "postRequest:allowsCellularAccess:", v42, v44);

    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "timeIntervalSinceDate:", v51);
    v55 = CFSTR("sessionDuration");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = v48;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v56, &v55, 1);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    +[ASTAnalytics sendAnalyticsWithEvent:payloadDict:](ASTAnalytics, "sendAnalyticsWithEvent:payloadDict:", 3, v49);

  }
  -[ASTRemoteServerSession _teardown](v2, "_teardown");

  objc_destroyWeak(&location);
}

void __48__ASTRemoteServerSession__startClientStatusLoop__block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "sessionDidStart:", WeakRetained);

}

- (void)_setup
{
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id location;

  -[ASTRemoteServerSession setShouldContinueRequestLoop:](self, "setShouldContinueRequestLoop:", 1);
  -[ASTRemoteServerSession setShouldUnenroll:](self, "setShouldUnenroll:", 0);
  -[ASTRemoteServerSession setShouldAbort:](self, "setShouldAbort:", 0);
  -[ASTRemoteServerSession setRetryCounter:](self, "setRetryCounter:", 0);
  -[ASTRemoteServerSession setBackoffCounter:](self, "setBackoffCounter:", 0);
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASTRemoteServerSession setRunningTests:](self, "setRunningTests:", v3);

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASTRemoteServerSession setPendingTestResults:](self, "setPendingTestResults:", v4);

  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __32__ASTRemoteServerSession__setup__block_invoke;
  v5[3] = &unk_24F96A418;
  objc_copyWeak(&v6, &location);
  -[ASTRemoteServerSession setSessionTeardownCompletion:](self, "setSessionTeardownCompletion:", v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __32__ASTRemoteServerSession__setup__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  char v4;
  id v5;
  NSObject *v6;
  _QWORD block[4];
  id v8;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    v5 = objc_loadWeakRetained(v1);
    objc_msgSend(v5, "delegateQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __32__ASTRemoteServerSession__setup__block_invoke_2;
    block[3] = &unk_24F96A418;
    objc_copyWeak(&v8, v1);
    dispatch_async(v6, block);

    objc_destroyWeak(&v8);
  }
}

void __32__ASTRemoteServerSession__setup__block_invoke_2(uint64_t a1)
{
  id *v1;
  void *v2;
  id v3;
  void *v4;
  id WeakRetained;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v3, "clientStatusLoopError");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "session:didEndWithError:", v3, v4);

}

- (void)_teardown
{
  ASTRemoteServerSession *v2;
  uint64_t v3;
  ASTRemoteServerSession *v4;
  void (**v5)(void);

  v2 = self;
  objc_sync_enter(v2);
  v3 = -[ASTRemoteServerSession phase](v2, "phase");
  objc_sync_exit(v2);

  if (v3 != 3)
    -[ASTRemoteServerSession _cancelControlExecution](v2, "_cancelControlExecution");
  -[ASTRemoteServerSession _cancelRunningTests](v2, "_cancelRunningTests");
  v4 = v2;
  objc_sync_enter(v4);
  -[ASTRemoteServerSession setPhase:](v4, "setPhase:", 0);
  objc_sync_exit(v4);

  -[ASTRemoteServerSession sessionTeardownCompletion](v4, "sessionTeardownCompletion");
  v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v5[2]();

}

- (BOOL)_authInfoIfNecessary
{
  dispatch_semaphore_t v3;
  ASTRemoteServerSession *v4;
  NSObject *v5;
  NSObject *v6;
  ASTRemoteServerSession *v7;
  void *v8;
  uint64_t v9;
  ASTRemoteServerSession *v10;
  char v11;
  _QWORD block[4];
  NSObject *v14;
  id v15;
  id location;

  v3 = dispatch_semaphore_create(0);
  v4 = self;
  objc_sync_enter(v4);
  -[ASTRemoteServerSession setPendingAuthInfoSemaphore:](v4, "setPendingAuthInfoSemaphore:", v3);
  objc_sync_exit(v4);

  objc_initWeak(&location, v4);
  -[ASTRemoteServerSession delegateQueue](v4, "delegateQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__ASTRemoteServerSession__authInfoIfNecessary__block_invoke;
  block[3] = &unk_24F96A440;
  objc_copyWeak(&v15, &location);
  v6 = v3;
  v14 = v6;
  dispatch_async(v5, block);

  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  v7 = v4;
  objc_sync_enter(v7);
  -[ASTRemoteServerSession pendingAuthInfoResult](v7, "pendingAuthInfoResult");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASTRemoteServerSession setPendingAuthInfoResult:](v7, "setPendingAuthInfoResult:", 0);
  -[ASTRemoteServerSession setPendingAuthInfoSemaphore:](v7, "setPendingAuthInfoSemaphore:", 0);
  objc_sync_exit(v7);

  if (v8)
  {
    v9 = -[ASTRemoteServerSession _shouldAllowCellularForSealedSealablePayload:](v7, "_shouldAllowCellularForSealedSealablePayload:", v8);
    -[ASTRemoteServerSession connectionManager](v7, "connectionManager");
    v10 = (ASTRemoteServerSession *)objc_claimAutoreleasedReturnValue();
    v11 = -[ASTRemoteServerSession postAuthInfo:allowsCellularAccess:](v10, "postAuthInfo:allowsCellularAccess:", v8, v9);
  }
  else
  {
    v10 = v7;
    objc_sync_enter(v10);
    v11 = -[ASTRemoteServerSession phase](v10, "phase") == 1;
    objc_sync_exit(v10);
  }

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  return v11;
}

void __46__ASTRemoteServerSession__authInfoIfNecessary__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "conformsToProtocol:", &unk_255DA88B8);

  if (v4)
  {
    v5 = (void *)MEMORY[0x22E31C248]();
    objc_msgSend(WeakRetained, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc(MEMORY[0x24BDD1880]);
    objc_msgSend(WeakRetained, "sessionId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithUUIDString:", v8);

    v11[0] = 0;
    v11[1] = 0;
    objc_msgSend(v9, "getUUIDBytes:", v11);
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v11, 16);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "session:generateAuthInfoWithNonce:", WeakRetained, v10);

    objc_autoreleasePoolPop(v5);
  }
  else
  {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }

}

- (BOOL)_profile
{
  void *v3;
  void *v4;
  NSObject *v5;
  ASTRemoteServerSession *v6;
  NSObject *v7;
  ASTRemoteServerSession *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  char v12;
  _QWORD block[5];
  id v15;
  id location;
  _QWORD v17[5];
  id v18;

  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = __Block_byref_object_copy__5;
  v17[4] = __Block_byref_object_dispose__5;
  -[ASTSession context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[ASTProfileResult resultWithIdentity:](ASTProfileResult, "resultWithIdentity:", v4);
  v18 = (id)objc_claimAutoreleasedReturnValue();

  v5 = dispatch_semaphore_create(0);
  v6 = self;
  objc_sync_enter(v6);
  -[ASTRemoteServerSession setPendingProfileSemaphore:](v6, "setPendingProfileSemaphore:", v5);
  objc_sync_exit(v6);

  objc_initWeak(&location, v6);
  -[ASTRemoteServerSession delegateQueue](v6, "delegateQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __34__ASTRemoteServerSession__profile__block_invoke;
  block[3] = &unk_24F96A468;
  objc_copyWeak(&v15, &location);
  block[4] = v17;
  dispatch_async(v7, block);

  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  v8 = v6;
  objc_sync_enter(v8);
  -[ASTRemoteServerSession pendingProfileResult](v8, "pendingProfileResult");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASTRemoteServerSession setPendingProfileSemaphore:](v8, "setPendingProfileSemaphore:", 0);
  -[ASTRemoteServerSession setPendingProfileResult:](v8, "setPendingProfileResult:", 0);
  objc_sync_exit(v8);

  if (v9)
  {
    v10 = -[ASTRemoteServerSession _shouldAllowCellularForSealedSealablePayload:](v8, "_shouldAllowCellularForSealedSealablePayload:", v9);
    -[ASTRemoteServerSession connectionManager](v8, "connectionManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "postProfile:allowsCellularAccess:", v9, v10);

  }
  else
  {
    v12 = 0;
  }

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  _Block_object_dispose(v17, 8);
  return v12;
}

void __34__ASTRemoteServerSession__profile__block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  void *v4;
  uint64_t v5;
  void *v6;

  v2 = (void *)MEMORY[0x22E31C248]();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  objc_msgSend(MEMORY[0x24BDBCE30], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "session:profile:filteredByComponents:", WeakRetained, v5, v6);

  objc_autoreleasePoolPop(v2);
}

- (id)_sendRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  char v19;
  NSObject *v20;
  void *v21;
  char v22;
  NSObject *v23;
  void *v24;
  _BOOL8 v25;
  void *v26;
  void *v27;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t);
  void *v32;
  ASTRemoteServerSession *v33;
  id v34;
  id v35;
  _QWORD block[5];
  id v37;
  id v38;

  v4 = a3;
  -[ASTRemoteServerSession runningTests](self, "runningTests");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v5);
  -[ASTRemoteServerSession runningTests](self, "runningTests");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v5);
  -[ASTRemoteServerSession pendingTestResults](self, "pendingTestResults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && (objc_msgSend(v7, "count") || objc_msgSend(v9, "count")))
  {
    -[ASTRemoteServerSession runningTests](self, "runningTests");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "allKeys");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[ASTRemoteServerSession pendingTestResults](self, "pendingTestResults");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "allKeys");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "firstObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
      v16 = v12;
    else
      v16 = v15;
    v17 = v16;
    objc_msgSend(v4, "setCurrentTest:", v17);
    if (v12)
    {
      -[ASTSession delegate](self, "delegate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_opt_respondsToSelector();

      if ((v19 & 1) != 0)
      {
        -[ASTRemoteServerSession delegateQueue](self, "delegateQueue");
        v20 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __39__ASTRemoteServerSession__sendRequest___block_invoke;
        block[3] = &unk_24F969B70;
        block[4] = self;
        v37 = v12;
        v38 = v4;
        dispatch_sync(v20, block);

      }
      if (+[ASTRequest isEstimatedTimeRemainingFeatureEnabled](ASTRequest, "isEstimatedTimeRemainingFeatureEnabled"))
      {
        -[ASTSession delegate](self, "delegate");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_opt_respondsToSelector();

        if ((v22 & 1) != 0)
        {
          -[ASTRemoteServerSession delegateQueue](self, "delegateQueue");
          v23 = objc_claimAutoreleasedReturnValue();
          v29 = MEMORY[0x24BDAC760];
          v30 = 3221225472;
          v31 = __39__ASTRemoteServerSession__sendRequest___block_invoke_2;
          v32 = &unk_24F969B70;
          v33 = self;
          v34 = v12;
          v35 = v4;
          dispatch_sync(v23, &v29);

        }
      }
    }
    else if (objc_msgSend(v4, "clientStatus") == 4)
    {
      objc_msgSend(v4, "setProgress:", &unk_24F9761C0);
      objc_msgSend(v4, "setEstimatedTimeRemaining:", &unk_24F9761D8);
    }

  }
  -[ASTRemoteServerSession payloadSigner](self, "payloadSigner", v29, v30, v31, v32, v33);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sealWithPayloadSigner:error:", v24, 0);

  v25 = -[ASTRemoteServerSession _shouldAllowCellularForSealedSealablePayload:](self, "_shouldAllowCellularForSealedSealablePayload:", v4);
  -[ASTRemoteServerSession connectionManager](self, "connectionManager");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "postRequest:allowsCellularAccess:", v4, v25);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

void __39__ASTRemoteServerSession__sendRequest___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "session:progressForTest:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v3 = v7;
  if (v7)
  {
    v4 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v7, "doubleValue");
    objc_msgSend(v4, "numberWithDouble:", round(v5));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "setProgress:", v6);

    v3 = v7;
  }

}

void __39__ASTRemoteServerSession__sendRequest___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "session:estimatedTimeRemainingForTest:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v3 = v7;
  if (v7)
  {
    v4 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v7, "doubleValue");
    objc_msgSend(v4, "numberWithDouble:", round(v5));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "setEstimatedTimeRemaining:", v6);

    v3 = v7;
  }

}

- (void)_updateProgress:(id)a3
{
  id v4;
  void *v5;
  char v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;
  id v10;
  id location;

  v4 = a3;
  if (v4)
  {
    -[ASTSession delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      objc_initWeak(&location, self);
      -[ASTRemoteServerSession delegateQueue](self, "delegateQueue");
      v7 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __42__ASTRemoteServerSession__updateProgress___block_invoke;
      block[3] = &unk_24F96A440;
      objc_copyWeak(&v10, &location);
      v9 = v4;
      dispatch_async(v7, block);

      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);
    }
  }

}

void __42__ASTRemoteServerSession__updateProgress___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "session:didUpdateTestSuiteProgress:", WeakRetained, *(_QWORD *)(a1 + 32));

}

- (id)_idle
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  ASTLogHandleForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[ASTRemoteServerSession sessionId](self, "sessionId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_22D91B000, v3, OS_LOG_TYPE_DEFAULT, "[IDLE] (%@)", (uint8_t *)&v7, 0xCu);

  }
  -[ASTRemoteServerSession _backoff](self, "_backoff");
  +[ASTRequest request](ASTRequest, "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setClientStatus:", 1);
  return v5;
}

- (id)_updateUIWithData:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  _QWORD v20[5];
  id v21;
  _QWORD v22[5];
  id v23;
  _QWORD v24[4];
  id v25;
  ASTRemoteServerSession *v26;
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  ASTLogHandleForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[ASTRemoteServerSession sessionId](self, "sessionId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v28 = v6;
    _os_log_impl(&dword_22D91B000, v5, OS_LOG_TYPE_DEFAULT, "[UPDATE UI] (%@)", buf, 0xCu);

  }
  +[ASTRequest request](ASTRequest, "request");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setClientStatus:", 2);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("action"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("TestSuiteStarting")))
  {
    -[ASTSession context](self, "context");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTestSuiteRunning:", 1);

    -[ASTSession delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) != 0)
    {
      v24[0] = MEMORY[0x24BDAC760];
      v24[1] = 3221225472;
      v24[2] = __44__ASTRemoteServerSession__updateUIWithData___block_invoke;
      v24[3] = &unk_24F96A4B8;
      v25 = v4;
      v26 = self;
      +[ASTLocalization prepareLocalizedStringsWithCompletionHandler:](ASTLocalization, "prepareLocalizedStringsWithCompletionHandler:", v24);
      v12 = v25;
LABEL_8:

    }
  }
  else
  {
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("TestSuiteComplete")))
    {
      v22[0] = MEMORY[0x24BDAC760];
      v22[1] = 3221225472;
      v22[2] = __44__ASTRemoteServerSession__updateUIWithData___block_invoke_3;
      v22[3] = &unk_24F969B48;
      v22[4] = self;
      v23 = v4;
      objc_msgSend(v7, "setCompletion:", v22);
      v12 = v23;
      goto LABEL_8;
    }
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("TestSuiteImage")))
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("imageName"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v13)
      {
        v20[0] = MEMORY[0x24BDAC760];
        v20[1] = 3221225472;
        v20[2] = __44__ASTRemoteServerSession__updateUIWithData___block_invoke_6;
        v20[3] = &unk_24F96A4E0;
        v20[4] = self;
        v21 = v13;
        -[ASTSession requestAsset:completionHandler:](self, "requestAsset:completionHandler:", v21, v20);

      }
      else
      {
        ASTLogHandleForCategory(0);
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          -[ASTRemoteServerSession _updateUIWithData:].cold.1();

        -[ASTRemoteServerSession _retryRequest](self, "_retryRequest");
        v18 = objc_claimAutoreleasedReturnValue();

        v7 = (void *)v18;
      }

    }
    else
    {
      ASTLogHandleForCategory(0);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[ASTRemoteServerSession _updateUIWithData:].cold.2();

      -[ASTRemoteServerSession _retryRequest](self, "_retryRequest");
      v16 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v16;
    }
  }

  return v7;
}

void __44__ASTRemoteServerSession__updateUIWithData___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id location;

  v4 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("viewTitle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[ASTLocalization localizedStringForKey:](ASTLocalization, "localizedStringForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("suiteName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[ASTLocalization localizedStringForKey:](ASTLocalization, "localizedStringForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, *(id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 40), "delegateQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __44__ASTRemoteServerSession__updateUIWithData___block_invoke_2;
  v12[3] = &unk_24F96A490;
  objc_copyWeak(&v15, &location);
  v13 = v8;
  v14 = v6;
  v10 = v6;
  v11 = v8;
  dispatch_async(v9, v12);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

void __44__ASTRemoteServerSession__updateUIWithData___block_invoke_2(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "session:didStartTestSuite:description:", WeakRetained, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __44__ASTRemoteServerSession__updateUIWithData___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  id v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  objc_msgSend(*(id *)(a1 + 32), "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTestSuiteRunning:", 0);

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __44__ASTRemoteServerSession__updateUIWithData___block_invoke_4;
    v7[3] = &unk_24F96A4B8;
    v5 = *(id *)(a1 + 40);
    v6 = *(_QWORD *)(a1 + 32);
    v8 = v5;
    v9 = v6;
    +[ASTLocalization prepareLocalizedStringsWithCompletionHandler:](ASTLocalization, "prepareLocalizedStringsWithCompletionHandler:", v7);

  }
}

void __44__ASTRemoteServerSession__updateUIWithData___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id location;

  v4 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("viewTitle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[ASTLocalization localizedStringForKey:](ASTLocalization, "localizedStringForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("suiteName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[ASTLocalization localizedStringForKey:](ASTLocalization, "localizedStringForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, *(id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 40), "delegateQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __44__ASTRemoteServerSession__updateUIWithData___block_invoke_5;
  v12[3] = &unk_24F96A490;
  objc_copyWeak(&v15, &location);
  v13 = v8;
  v14 = v6;
  v10 = v6;
  v11 = v8;
  dispatch_async(v9, v12);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

void __44__ASTRemoteServerSession__updateUIWithData___block_invoke_5(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "session:didCompleteTestSuite:description:", WeakRetained, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __44__ASTRemoteServerSession__updateUIWithData___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  char v8;
  NSObject *v9;
  NSObject *v10;
  _QWORD block[4];
  id v12;
  id v13;
  id location;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      objc_initWeak(&location, *(id *)(a1 + 32));
      objc_msgSend(*(id *)(a1 + 32), "delegateQueue");
      v9 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __44__ASTRemoteServerSession__updateUIWithData___block_invoke_7;
      block[3] = &unk_24F96A440;
      objc_copyWeak(&v13, &location);
      v12 = v5;
      dispatch_async(v9, block);

      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    ASTLogHandleForCategory(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __44__ASTRemoteServerSession__updateUIWithData___block_invoke_6_cold_1(a1, (uint64_t)v6, v10);

  }
}

void __44__ASTRemoteServerSession__updateUIWithData___block_invoke_7(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "session:didUpdateTestSuiteImage:", WeakRetained, *(_QWORD *)(a1 + 32));

}

- (id)_startNewTest:(id)a3 data:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  id v18;
  dispatch_time_t v19;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t);
  void *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  ASTLogHandleForCategory(0);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    -[ASTRemoteServerSession sessionId](self, "sessionId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v30 = v9;
    _os_log_impl(&dword_22D91B000, v8, OS_LOG_TYPE_DEFAULT, "[START NEW TEST] (%@)", buf, 0xCu);

  }
  +[ASTRequest request](ASTRequest, "request");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setClientStatus:", 4);
  -[ASTSession delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0)
  {
    +[ASTTestResult resultWithTestId:parameters:](ASTTestResult, "resultWithTestId:parameters:", v6, v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = dispatch_semaphore_create(0);
    -[ASTRemoteServerSession runningTests](self, "runningTests");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v15);
    -[ASTRemoteServerSession runningTests](self, "runningTests");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v14, v6);

    objc_sync_exit(v15);
    objc_initWeak((id *)buf, self);
    -[ASTRemoteServerSession delegateQueue](self, "delegateQueue");
    v17 = objc_claimAutoreleasedReturnValue();
    v21 = MEMORY[0x24BDAC760];
    v22 = 3221225472;
    v23 = __45__ASTRemoteServerSession__startNewTest_data___block_invoke;
    v24 = &unk_24F96A508;
    objc_copyWeak(&v28, (id *)buf);
    v25 = v6;
    v26 = v7;
    v18 = v13;
    v27 = v18;
    dispatch_async(v17, &v21);

    v19 = dispatch_time(0, 5000000000);
    if (dispatch_semaphore_wait(v14, v19))
      objc_msgSend(v10, "setClientStatus:", 3, v21, v22, v23, v24, v25, v26);

    objc_destroyWeak(&v28);
    objc_destroyWeak((id *)buf);

  }
  return v10;
}

void __45__ASTRemoteServerSession__startNewTest_data___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "session:startTest:parameters:testResult:", WeakRetained, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (id)_sendTestResults:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  dispatch_group_t v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  ASTRemoteServerSession *v25;
  void *v26;
  void *v27;
  void *v28;
  dispatch_time_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v40;
  id v41;
  id obj;
  uint64_t v43;
  NSObject *v44;
  NSObject *v45;
  id v46;
  _BOOL4 v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _QWORD v55[5];
  id v56;
  NSObject *v57;
  _QWORD v58[3];
  _QWORD v59[3];
  uint8_t v60[128];
  uint8_t buf[4];
  void *v62;
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  ASTLogHandleForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[ASTRemoteServerSession sessionId](self, "sessionId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v62 = v6;
    _os_log_impl(&dword_22D91B000, v5, OS_LOG_TYPE_DEFAULT, "[SEND TEST RESULTS] (%@)", buf, 0xCu);

  }
  -[ASTRemoteServerSession pendingTestResults](self, "pendingTestResults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[ASTRequest request](ASTRequest, "request");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
  {
    v47 = -[ASTRemoteServerSession _shouldAllowCellularForSealedTestResult:](self, "_shouldAllowCellularForSealedTestResult:", v8);
    v11 = dispatch_group_create();
    v55[0] = MEMORY[0x24BDAC760];
    v55[1] = 3221225472;
    v55[2] = __43__ASTRemoteServerSession__sendTestResults___block_invoke;
    v55[3] = &unk_24F96A530;
    v55[4] = self;
    v46 = v4;
    v56 = v46;
    v12 = v11;
    v57 = v12;
    v48 = (void *)MEMORY[0x22E31C3E0](v55);
    objc_msgSend(v8, "files");
    v13 = objc_claimAutoreleasedReturnValue();
    if (v13
      && (v14 = (void *)v13,
          objc_msgSend(v8, "files"),
          v15 = (void *)objc_claimAutoreleasedReturnValue(),
          v16 = objc_msgSend(v15, "count"),
          v15,
          v14,
          v16))
    {
      v53 = 0u;
      v54 = 0u;
      v51 = 0u;
      v52 = 0u;
      objc_msgSend(v8, "files");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
      if (v49)
      {
        v41 = v4;
        obj = v17;
        v40 = v10;
        v43 = *(_QWORD *)v52;
        v44 = v12;
        v50 = 1;
        do
        {
          for (i = 0; i != v49; ++i)
          {
            if (*(_QWORD *)v52 != v43)
              objc_enumerationMutation(obj);
            v19 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
            dispatch_group_enter(v12);
            -[ASTRemoteServerSession connectionManager](self, "connectionManager");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lu"), v50 + i);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = (void *)MEMORY[0x24BDD17C8];
            objc_msgSend(v8, "files");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "stringWithFormat:", CFSTR("%lu"), objc_msgSend(v23, "count"));
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "fileURL");
            v25 = self;
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "lastPathComponent");
            v27 = v8;
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "postSealableFile:fileSequence:totalFiles:testId:dataId:allowsCellularAccess:completion:", v19, v21, v24, v46, v28, v47, v48);

            v8 = v27;
            self = v25;

            v12 = v44;
          }
          v49 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
          v50 += i;
        }
        while (v49);
        v10 = v40;
        v4 = v41;
        v17 = obj;
      }
    }
    else
    {
      dispatch_group_enter(v12);
      -[ASTRemoteServerSession connectionManager](self, "connectionManager");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "postTestResult:allowsCellularAccess:completion:", v8, v47, v48);
    }

    v29 = dispatch_time(0, 5000000000);
    if (dispatch_group_wait(v12, v29))
    {
      objc_msgSend(v10, "setClientStatus:", 5);
    }
    else
    {
      objc_msgSend(v10, "setClientStatus:", 6);
      v58[0] = CFSTR("testID");
      v45 = v12;
      v30 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v8, "testId");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "stringWithFormat:", CFSTR("%@"), v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v59[0] = v32;
      v58[1] = CFSTR("statusCode");
      objc_msgSend(v8, "statusCode");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v59[1] = v33;
      v58[2] = CFSTR("statusCodeStr");
      v34 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v8, "statusCode");
      v35 = v8;
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "stringWithFormat:", CFSTR("%@"), v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v59[2] = v37;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v59, v58, 3);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      +[ASTAnalytics sendAnalyticsWithEvent:payloadDict:](ASTAnalytics, "sendAnalyticsWithEvent:payloadDict:", 4, v38);

      v12 = v45;
      v8 = v35;

    }
  }
  else
  {
    objc_msgSend(v9, "setClientStatus:", 8);
  }

  return v10;
}

void __43__ASTRemoteServerSession__sendTestResults___block_invoke(uint64_t a1, char a2)
{
  void *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  char v9;
  NSObject *v10;
  _QWORD block[4];
  id v12;
  id v13;
  id location;

  objc_msgSend(*(id *)(a1 + 32), "pendingTestResults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObjectForKey:", *(_QWORD *)(a1 + 40));

  if ((a2 & 1) == 0)
  {
    ASTLogHandleForCategory(0);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __43__ASTRemoteServerSession__sendTestResults___block_invoke_cold_1();

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "backoffTimer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "backoffTimer");
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_semaphore_signal(v7);

  }
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 32), "delegateQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __43__ASTRemoteServerSession__sendTestResults___block_invoke_148;
    block[3] = &unk_24F96A440;
    objc_copyWeak(&v13, &location);
    v12 = *(id *)(a1 + 40);
    dispatch_async(v10, block);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

void __43__ASTRemoteServerSession__sendTestResults___block_invoke_148(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "session:didFinishSendingResultForTest:", WeakRetained, *(_QWORD *)(a1 + 32));

}

- (id)_continueWithLastRequest:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  int v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  ASTLogHandleForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[ASTRemoteServerSession sessionId](self, "sessionId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138412290;
    v24 = v6;
    _os_log_impl(&dword_22D91B000, v5, OS_LOG_TYPE_DEFAULT, "[CONTINUE] (%@)", (uint8_t *)&v23, 0xCu);

  }
  v7 = v4;
  if (objc_msgSend(v7, "clientStatus") == 3)
  {
    -[ASTRemoteServerSession runningTests](self, "runningTests");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (!v9)
    {
      +[ASTRequest request](ASTRequest, "request");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = v12;
      v21 = 4;
LABEL_15:
      objc_msgSend(v20, "setClientStatus:", v21);
      goto LABEL_16;
    }
  }
  if (objc_msgSend(v7, "clientStatus") == 5)
  {
    -[ASTRemoteServerSession pendingTestResults](self, "pendingTestResults");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    if (!v11)
    {
      +[ASTRequest request](ASTRequest, "request");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = v12;
      v21 = 6;
      goto LABEL_15;
    }
  }
  v12 = v7;
  if (objc_msgSend(v7, "clientStatus") != 13)
    goto LABEL_12;
  +[ASTRequest request](ASTRequest, "request");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[ASTSession context](self, "context");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "controlCommand");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "allActionsFinished");

  v16 = v15 ? 14 : 13;
  objc_msgSend(v12, "setClientStatus:", v16);
  -[ASTSession context](self, "context");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "controlCommand");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "requestData");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setData:", v19);

  if ((v15 & 1) == 0)
LABEL_12:
    -[ASTRemoteServerSession _backoff](self, "_backoff");
LABEL_16:

  return v12;
}

- (id)_sendPropertiesWithData:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  ASTRemoteServerSession *v13;
  NSObject *v14;
  id v15;
  id v16;
  ASTRemoteServerSession *v17;
  void *v18;
  void *v19;
  _QWORD block[4];
  id v22;
  id v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  ASTLogHandleForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[ASTRemoteServerSession sessionId](self, "sessionId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v26 = v6;
    _os_log_impl(&dword_22D91B000, v5, OS_LOG_TYPE_DEFAULT, "[SEND PROPERTIES] (%@)", buf, 0xCu);

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("propertyItems"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    goto LABEL_5;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("propertyItems"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASTSession context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[ASTProfileResult resultWithIdentity:](ASTProfileResult, "resultWithIdentity:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = dispatch_semaphore_create(0);
  v13 = self;
  objc_sync_enter(v13);
  -[ASTRemoteServerSession setPendingPropertiesSemaphore:](v13, "setPendingPropertiesSemaphore:", v12);
  objc_sync_exit(v13);

  objc_initWeak((id *)buf, v13);
  -[ASTRemoteServerSession delegateQueue](v13, "delegateQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__ASTRemoteServerSession__sendPropertiesWithData___block_invoke;
  block[3] = &unk_24F96A490;
  objc_copyWeak(&v24, (id *)buf);
  v15 = v11;
  v22 = v15;
  v16 = v8;
  v23 = v16;
  dispatch_async(v14, block);

  dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
  v17 = v13;
  objc_sync_enter(v17);
  -[ASTRemoteServerSession pendingPropertiesResult](v17, "pendingPropertiesResult");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASTRemoteServerSession setPendingPropertiesSemaphore:](v17, "setPendingPropertiesSemaphore:", 0);
  -[ASTRemoteServerSession setPendingPropertiesResult:](v17, "setPendingPropertiesResult:", 0);
  objc_sync_exit(v17);

  objc_destroyWeak(&v24);
  objc_destroyWeak((id *)buf);

  if (!v18)
  {
LABEL_5:
    +[ASTRequest request](ASTRequest, "request");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[ASTErrorStatus errorStatusWithCode:](ASTSendPropertiesErrorStatus, "errorStatusWithCode:", -2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setError:", v19);

    objc_msgSend(v18, "setClientStatus:", 10);
  }

  return v18;
}

void __50__ASTRemoteServerSession__sendPropertiesWithData___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "session:profile:filteredByComponents:", WeakRetained, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (id)_updateSessionSettingsWithData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  dispatch_semaphore_t v8;
  NSObject *v9;
  NSObject *v10;
  _QWORD block[4];
  id v13;
  id v14;
  dispatch_semaphore_t v15;
  id v16;
  id location;

  v4 = a3;
  +[ASTRequest request](ASTRequest, "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASTSession delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v8 = dispatch_semaphore_create(0);
    objc_initWeak(&location, self);
    -[ASTRemoteServerSession delegateQueue](self, "delegateQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __57__ASTRemoteServerSession__updateSessionSettingsWithData___block_invoke;
    block[3] = &unk_24F96A508;
    objc_copyWeak(&v16, &location);
    v13 = v4;
    v14 = v5;
    v15 = v8;
    v10 = v8;
    dispatch_async(v9, block);

    dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  objc_msgSend(v5, "setClientStatus:", 11);

  return v5;
}

void __57__ASTRemoteServerSession__updateSessionSettingsWithData___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __57__ASTRemoteServerSession__updateSessionSettingsWithData___block_invoke_2;
  v5[3] = &unk_24F96A558;
  v4 = *(_QWORD *)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v3, "session:didUpdateSettings:completionHandler:", WeakRetained, v4, v5);

}

void __57__ASTRemoteServerSession__updateSessionSettingsWithData___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if (v7)
    objc_msgSend(*(id *)(a1 + 32), "setData:", v7);
  if (v5)
  {
    +[ASTErrorStatus errorStatusWithCode:](ASTErrorStatus, "errorStatusWithCode:", objc_msgSend(v5, "code"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setError:", v6);

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

- (id)_abort
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  ASTLogHandleForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[ASTRemoteServerSession sessionId](self, "sessionId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_22D91B000, v3, OS_LOG_TYPE_DEFAULT, "[ABORT] (%@)", (uint8_t *)&v7, 0xCu);

  }
  -[ASTRemoteServerSession _abortRunningProcedures](self, "_abortRunningProcedures");
  +[ASTRequest request](ASTRequest, "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setClientStatus:", 1);
  return v5;
}

- (id)_clientAbort
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  ASTLogHandleForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[ASTRemoteServerSession sessionId](self, "sessionId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_22D91B000, v3, OS_LOG_TYPE_DEFAULT, "[CLIENT ABORT] (%@)", (uint8_t *)&v7, 0xCu);

  }
  -[ASTRemoteServerSession _abortRunningProcedures](self, "_abortRunningProcedures");
  +[ASTRequest request](ASTRequest, "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setClientStatus:", 12);
  return v5;
}

- (void)_archive
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  ASTLogHandleForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[ASTRemoteServerSession sessionId](self, "sessionId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v4;
    _os_log_impl(&dword_22D91B000, v3, OS_LOG_TYPE_DEFAULT, "[ARCHIVE] (%@)", (uint8_t *)&v5, 0xCu);

  }
  -[ASTRemoteServerSession _abortRunningProcedures](self, "_abortRunningProcedures");
}

- (void)_rebootWithData:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  char v8;
  NSObject *v9;
  void *v10;
  char v11;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  ASTLogHandleForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[ASTRemoteServerSession sessionId](self, "sessionId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v19 = v6;
    _os_log_impl(&dword_22D91B000, v5, OS_LOG_TYPE_DEFAULT, "[REBOOT] (%@)", buf, 0xCu);

  }
  -[ASTRemoteServerSession _abortRunningProcedures](self, "_abortRunningProcedures");
  -[ASTSession delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    objc_initWeak((id *)buf, self);
    -[ASTRemoteServerSession delegateQueue](self, "delegateQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __42__ASTRemoteServerSession__rebootWithData___block_invoke;
    block[3] = &unk_24F96A440;
    objc_copyWeak(&v17, (id *)buf);
    v16 = v4;
    dispatch_async(v9, block);

    objc_destroyWeak(&v17);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    -[ASTSession delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) != 0)
    {
      objc_initWeak((id *)buf, self);
      -[ASTRemoteServerSession delegateQueue](self, "delegateQueue");
      v12 = objc_claimAutoreleasedReturnValue();
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __42__ASTRemoteServerSession__rebootWithData___block_invoke_2;
      v13[3] = &unk_24F96A418;
      objc_copyWeak(&v14, (id *)buf);
      dispatch_async(v12, v13);

      objc_destroyWeak(&v14);
      objc_destroyWeak((id *)buf);
    }
  }

}

void __42__ASTRemoteServerSession__rebootWithData___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sessionDidReboot:withParameters:", WeakRetained, *(_QWORD *)(a1 + 32));

}

void __42__ASTRemoteServerSession__rebootWithData___block_invoke_2(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "sessionDidReboot:", WeakRetained);

}

- (void)_shutdownWithData:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  char v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  ASTLogHandleForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[ASTRemoteServerSession sessionId](self, "sessionId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v14 = v6;
    _os_log_impl(&dword_22D91B000, v5, OS_LOG_TYPE_DEFAULT, "[SHUTDOWN] (%@)", buf, 0xCu);

  }
  -[ASTRemoteServerSession _abortRunningProcedures](self, "_abortRunningProcedures");
  -[ASTSession delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    objc_initWeak((id *)buf, self);
    -[ASTRemoteServerSession delegateQueue](self, "delegateQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __44__ASTRemoteServerSession__shutdownWithData___block_invoke;
    v10[3] = &unk_24F96A440;
    objc_copyWeak(&v12, (id *)buf);
    v11 = v4;
    dispatch_async(v9, v10);

    objc_destroyWeak(&v12);
    objc_destroyWeak((id *)buf);
  }

}

void __44__ASTRemoteServerSession__shutdownWithData___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sessionDidShutDown:withParameters:", WeakRetained, *(_QWORD *)(a1 + 32));

}

- (id)_showInstructionalPromptWithData:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  dispatch_semaphore_t v22;
  void *v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  NSObject *v29;
  void *v31;
  _QWORD v32[5];
  NSObject *v33;
  id v34;
  id v35;
  __int128 *p_buf;
  uint64_t v37;
  uint8_t v38[4];
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  __int128 buf;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  ASTLogHandleForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[ASTRemoteServerSession sessionId](self, "sessionId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_22D91B000, v5, OS_LOG_TYPE_DEFAULT, "[SHOW INSTRUCTIONS] (%@)", (uint8_t *)&buf, 0xCu);

  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v45 = 0x3032000000;
  v46 = __Block_byref_object_copy__5;
  v47 = __Block_byref_object_dispose__5;
  v48 = 0;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("instructionId"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("reference"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("type"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v7)
    v11 = v8 == 0;
  else
    v11 = 1;
  if (v11 || v9 == 0)
  {
    -[ASTRemoteServerSession _retryRequest](self, "_retryRequest");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = *(void **)(*((_QWORD *)&buf + 1) + 40);
    *(_QWORD *)(*((_QWORD *)&buf + 1) + 40) = v13;

    ASTLogHandleForCategory(0);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v38 = 138412802;
      v39 = v7;
      v40 = 2112;
      v41 = v8;
      v42 = 2112;
      v43 = v10;
      _os_log_error_impl(&dword_22D91B000, v15, OS_LOG_TYPE_ERROR, "Bad instructional prompt data, identifier: %@, reference: %@, type: %@", v38, 0x20u);
    }

    v16 = *(id *)(*((_QWORD *)&buf + 1) + 40);
  }
  else
  {
    if ((objc_msgSend(v9, "isEqualToString:", CFSTR("Alert")) & 1) != 0)
    {
      v17 = 1;
LABEL_18:
      objc_msgSend(MEMORY[0x24BDBCEA0], "preferredLanguages");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "firstObject");
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "localeIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      -[ASTRemoteServerSession connectionManager](self, "connectionManager");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v19) = v21 == 0;

      if ((_DWORD)v19)
      {
        -[ASTRemoteServerSession _retryRequest](self, "_retryRequest");
        v26 = objc_claimAutoreleasedReturnValue();
        v27 = *(void **)(*((_QWORD *)&buf + 1) + 40);
        *(_QWORD *)(*((_QWORD *)&buf + 1) + 40) = v26;

        ASTLogHandleForCategory(0);
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          -[ASTRemoteServerSession _showInstructionalPromptWithData:].cold.1();

        v16 = *(id *)(*((_QWORD *)&buf + 1) + 40);
      }
      else
      {
        v22 = dispatch_semaphore_create(0);
        -[ASTRemoteServerSession connectionManager](self, "connectionManager");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[ASTRemoteServerSession payloadSigner](self, "payloadSigner");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v32[0] = MEMORY[0x24BDAC760];
        v32[1] = 3221225472;
        v32[2] = __59__ASTRemoteServerSession__showInstructionalPromptWithData___block_invoke;
        v32[3] = &unk_24F96A5A8;
        p_buf = &buf;
        v32[4] = self;
        v25 = v22;
        v33 = v25;
        v34 = v7;
        v37 = v17;
        v35 = v8;
        objc_msgSend(v23, "requestInstructionalPromptDetailsWithInstructionID:type:withPayloadSigner:language:locale:allowsCellularAccess:completionHandler:", v34, v10, v24, v31, v20, 1, v32);

        dispatch_semaphore_wait(v25, 0xFFFFFFFFFFFFFFFFLL);
        v16 = *(id *)(*((_QWORD *)&buf + 1) + 40);

      }
      goto LABEL_27;
    }
    if ((objc_msgSend(v10, "isEqualToString:", CFSTR("Query")) & 1) != 0)
    {
      v17 = 0;
      goto LABEL_18;
    }
    ASTLogHandleForCategory(0);
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      -[ASTRemoteServerSession _showInstructionalPromptWithData:].cold.2();

    v16 = 0;
  }
LABEL_27:

  _Block_object_dispose(&buf, 8);
  return v16;
}

void __59__ASTRemoteServerSession__showInstructionalPromptWithData___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5)
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  ASTInstructionalPrompt *v15;
  void *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  uint64_t v23;
  id v24;
  uint64_t v25;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  if (a5)
  {
    objc_msgSend(*(id *)(a1 + 32), "_retryRequest");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;

    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  }
  else
  {
    v15 = -[ASTInstructionalPrompt initWithID:type:imageLocators:instructions:options:]([ASTInstructionalPrompt alloc], "initWithID:type:imageLocators:instructions:options:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 72), v11, v9, v10);
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = *(_QWORD *)(a1 + 32);
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __59__ASTRemoteServerSession__showInstructionalPromptWithData___block_invoke_2;
    v21[3] = &unk_24F96A580;
    v18 = *(id *)(a1 + 56);
    v25 = *(_QWORD *)(a1 + 64);
    v19 = *(_QWORD *)(a1 + 32);
    v20 = *(void **)(a1 + 40);
    v22 = v18;
    v23 = v19;
    v24 = v20;
    objc_msgSend(v16, "session:didRequestInstructionalPrompt:withConfirmation:", v17, v15, v21);

  }
}

void __59__ASTRemoteServerSession__showInstructionalPromptWithData___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  _QWORD v18[3];
  _QWORD v19[3];
  uint8_t buf[4];
  id v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5 && v6 && *(_QWORD *)(a1 + 32))
  {
    +[ASTRequest request](ASTRequest, "request");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    v18[0] = CFSTR("instructionId");
    v18[1] = CFSTR("reference");
    v11 = *(_QWORD *)(a1 + 32);
    v19[0] = v5;
    v19[1] = v11;
    v18[2] = CFSTR("queryResponse");
    v19[2] = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setData:", v12);

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setClientStatus:", 15);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "_retryRequest");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v13;

    ASTLogHandleForCategory(0);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      v21 = v5;
      v22 = 2112;
      v23 = v17;
      v24 = 2112;
      v25 = v7;
      _os_log_error_impl(&dword_22D91B000, v16, OS_LOG_TYPE_ERROR, "Bad instructional prompt instructionID: %@, reference: %@ or answer: %@", buf, 0x20u);
    }

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));

}

- (void)_abortRunningProcedures
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  char v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  id location;

  -[ASTSession context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "testSuiteRunning");

  if (v4)
  {
    -[ASTRemoteServerSession _cancelRunningTests](self, "_cancelRunningTests");
    -[ASTRemoteServerSession _cancelSendingTestResults](self, "_cancelSendingTestResults");
    -[ASTSession context](self, "context");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTestSuiteRunning:", 0);

    -[ASTSession delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      objc_initWeak(&location, self);
      -[ASTRemoteServerSession delegateQueue](self, "delegateQueue");
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = MEMORY[0x24BDAC760];
      v10 = 3221225472;
      v11 = __49__ASTRemoteServerSession__abortRunningProcedures__block_invoke;
      v12 = &unk_24F96A418;
      objc_copyWeak(&v13, &location);
      dispatch_async(v8, &v9);

      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }
  }
  -[ASTRemoteServerSession _cancelControlExecution](self, "_cancelControlExecution", v9, v10, v11, v12);
}

void __49__ASTRemoteServerSession__abortRunningProcedures__block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "sessionDidCancelSuite:", WeakRetained);

}

- (void)_cancelRunningTests
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  char v12;
  NSObject *v13;
  void *v14;
  void *v15;
  _QWORD block[5];
  id v17;
  id location;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  -[ASTRemoteServerSession runningTests](self, "runningTests");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v3);
  -[ASTRemoteServerSession runningTests](self, "runningTests");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  objc_sync_exit(v3);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v20;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v6);
        v10 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v9);
        -[ASTSession delegate](self, "delegate");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_opt_respondsToSelector();

        if ((v12 & 1) != 0)
        {
          objc_initWeak(&location, self);
          -[ASTRemoteServerSession delegateQueue](self, "delegateQueue");
          v13 = objc_claimAutoreleasedReturnValue();
          block[0] = MEMORY[0x24BDAC760];
          block[1] = 3221225472;
          block[2] = __45__ASTRemoteServerSession__cancelRunningTests__block_invoke;
          block[3] = &unk_24F96A440;
          objc_copyWeak(&v17, &location);
          block[4] = v10;
          dispatch_async(v13, block);

          objc_destroyWeak(&v17);
          objc_destroyWeak(&location);
        }
        -[ASTRemoteServerSession runningTests](self, "runningTests");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_sync_enter(v14);
        -[ASTRemoteServerSession runningTests](self, "runningTests");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "removeObjectForKey:", v10);

        objc_sync_exit(v14);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v7);
  }

}

void __45__ASTRemoteServerSession__cancelRunningTests__block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "session:cancelTest:", WeakRetained, *(_QWORD *)(a1 + 32));

}

- (BOOL)sendAuthInfoResult:(id)a3 error:(id *)a4
{
  id v6;
  ASTRemoteServerSession *v7;
  NSObject *v8;
  void *v9;
  int v10;
  ASTRemoteServerSession *v11;
  BOOL v12;

  v6 = a3;
  v7 = self;
  objc_sync_enter(v7);
  if (-[ASTRemoteServerSession phase](v7, "phase") == 1)
  {
    -[ASTRemoteServerSession pendingAuthInfoSemaphore](v7, "pendingAuthInfoSemaphore");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  objc_sync_exit(v7);

  if (!v8)
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ASTErrorDomain"), -1007, 0);
      v12 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
LABEL_10:
    v12 = 0;
    goto LABEL_11;
  }
  if (v6)
  {
    -[ASTRemoteServerSession payloadSigner](v7, "payloadSigner");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v6, "sealWithPayloadSigner:error:", v9, a4);

    if (!v10)
      goto LABEL_10;
  }
  v11 = v7;
  objc_sync_enter(v11);
  -[ASTRemoteServerSession setPendingAuthInfoResult:](v11, "setPendingAuthInfoResult:", v6);
  objc_sync_exit(v11);

  dispatch_semaphore_signal(v8);
  v12 = 1;
LABEL_11:

  return v12;
}

- (BOOL)sendProfileResult:(id)a3 error:(id *)a4
{
  id v6;
  ASTRemoteServerSession *v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  int v12;
  ASTRemoteServerSession *v13;
  BOOL v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  ASTRemoteServerSession *v23;
  const __CFString *v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = self;
  objc_sync_enter(v7);
  v8 = -[ASTRemoteServerSession phase](v7, "phase");
  if (v8 == 1)
  {
    -[ASTRemoteServerSession pendingProfileSemaphore](v7, "pendingProfileSemaphore");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v8 == 2)
    {
      -[ASTRemoteServerSession pendingPropertiesSemaphore](v7, "pendingPropertiesSemaphore");
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = 0;
      goto LABEL_7;
    }
    v10 = 0;
  }
  v9 = 0;
LABEL_7:
  objc_sync_exit(v7);

  if (!v10)
  {
    if (!v9)
    {
      if (a4)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ASTErrorDomain"), -1007, 0);
        v14 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_26;
      }
LABEL_17:
      v14 = 0;
      goto LABEL_26;
    }
    if (v6)
    {
      +[ASTRequest request](ASTRequest, "request");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setClientStatus:", 10);
      if ((objc_msgSend(v6, "isSealed") & 1) != 0)
      {
        objc_msgSend(v15, "setData:", MEMORY[0x24BDBD1B8]);
        +[ASTErrorStatus errorStatusWithCode:](ASTSendPropertiesErrorStatus, "errorStatusWithCode:", -3);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setError:", v16);

        if (a4)
        {
          objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ASTErrorDomain"), -4002, 0);
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        objc_msgSend(v6, "properties");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "count");

        if (v18)
        {
          v25 = CFSTR("propertyItems");
          objc_msgSend(v6, "properties");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v26[0] = v19;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setData:", v20);

        }
      }
      if (v15)
      {
        -[ASTRemoteServerSession payloadSigner](v7, "payloadSigner");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v15, "sealWithPayloadSigner:error:", v21, a4);

        if (v22)
        {
          v23 = v7;
          objc_sync_enter(v23);
          -[ASTRemoteServerSession setPendingPropertiesResult:](v23, "setPendingPropertiesResult:", v15);
          objc_sync_exit(v23);

          dispatch_semaphore_signal(v9);
          v14 = 1;
LABEL_25:

          goto LABEL_26;
        }
      }
    }
    else
    {
      v15 = 0;
    }
    v14 = 0;
    goto LABEL_25;
  }
  -[ASTRemoteServerSession payloadSigner](v7, "payloadSigner");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v6, "sealWithPayloadSigner:error:", v11, a4);

  if (!v12)
    goto LABEL_17;
  v13 = v7;
  objc_sync_enter(v13);
  -[ASTRemoteServerSession setPendingProfileResult:](v13, "setPendingProfileResult:", v6);
  objc_sync_exit(v13);

  dispatch_semaphore_signal(v10);
  v14 = 1;
LABEL_26:

  return v14;
}

- (BOOL)sendTestResult:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  char v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  BOOL v25;

  v6 = a3;
  -[ASTRemoteServerSession runningTests](self, "runningTests");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v7);
  if (-[ASTRemoteServerSession phase](self, "phase") == 2)
  {
    -[ASTRemoteServerSession runningTests](self, "runningTests");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "testId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v9);
    v10 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }
  -[ASTRemoteServerSession runningTests](self, "runningTests");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "testId");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeObjectForKey:", v12);

  objc_sync_exit(v7);
  if (!v10)
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ASTErrorDomain"), -1007, 0);
      v25 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  objc_msgSend(v6, "files");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    objc_msgSend(v6, "files");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "count");

    if (v16)
    {
      -[ASTRemoteServerSession fileSigner](self, "fileSigner");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v6, "sealWithFileSigner:error:", v17, a4);

      if ((v18 & 1) == 0)
        goto LABEL_15;
      goto LABEL_10;
    }
  }
  -[ASTRemoteServerSession payloadSigner](self, "payloadSigner");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v6, "sealWithPayloadSigner:error:", v19, a4);

  if (!v20)
  {
LABEL_15:
    v25 = 0;
    goto LABEL_16;
  }
LABEL_10:
  -[ASTRemoteServerSession pendingTestResults](self, "pendingTestResults");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "testId");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setObject:forKeyedSubscript:", v6, v22);

  dispatch_semaphore_signal(v10);
  -[ASTRemoteServerSession backoffTimer](self, "backoffTimer");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    -[ASTRemoteServerSession backoffTimer](self, "backoffTimer");
    v24 = objc_claimAutoreleasedReturnValue();
    dispatch_semaphore_signal(v24);

  }
  v25 = 1;
LABEL_16:

  return v25;
}

- (void)_cancelSendingTestResults
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  -[ASTRemoteServerSession connectionManager](self, "connectionManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelAllTestResults");

  -[ASTRemoteServerSession pendingTestResults](self, "pendingTestResults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10);
        -[ASTRemoteServerSession pendingTestResults](self, "pendingTestResults", (_QWORD)v13);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "removeObjectForKey:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

}

- (void)updateAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;

  v4 = a3;
  -[ASTSession context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "controlCommand");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateAction:", v4);

  -[ASTRemoteServerSession backoffTimer](self, "backoffTimer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[ASTRemoteServerSession backoffTimer](self, "backoffTimer");
    v8 = objc_claimAutoreleasedReturnValue();
    dispatch_semaphore_signal(v8);

  }
}

+ (void)downloadAsset:(id)a3 useEnvironmentAssetsURL:(BOOL)a4 customEndpoint:(id)a5 fileHandle:(id)a6 completionHandler:(id)a7
{
  _BOOL4 v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  ASTMaterializedConnectionManager *v17;
  void *v18;
  id v19;

  v10 = a4;
  v19 = a3;
  v11 = a5;
  v12 = a6;
  v13 = a7;
  +[ASTEnvironment currentEnvironment](ASTEnvironment, "currentEnvironment");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "SOCKSProxyServer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "SOCKSProxyPort");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[ASTMaterializedConnectionManager initWithSOCKSProxyServer:port:]([ASTMaterializedConnectionManager alloc], "initWithSOCKSProxyServer:port:", v15, v16);
  if (v10)
  {
    objc_msgSend(v14, "assetURL");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = 0;
  }
  -[ASTMaterializedConnectionManager downloadAsset:customServerURL:customEndpoint:destinationFileHandle:allowsCellularAccess:completion:](v17, "downloadAsset:customServerURL:customEndpoint:destinationFileHandle:allowsCellularAccess:completion:", v19, v18, v11, v12, 1, v13);

}

- (void)_backoff
{
  int64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  int v7;
  dispatch_semaphore_t v8;
  dispatch_time_t v9;
  NSObject *dsema;

  v3 = 1000000000;
  -[ASTRemoteServerSession runningTests](self, "runningTests");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {

  }
  else
  {
    -[ASTRemoteServerSession pendingTestResults](self, "pendingTestResults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (!v6)
      goto LABEL_7;
  }
  if (-[ASTRemoteServerSession backoffCounter](self, "backoffCounter") >= 7)
    -[ASTRemoteServerSession setBackoffCounter:](self, "setBackoffCounter:", 6);
  v7 = kASTBackoffValues[-[ASTRemoteServerSession backoffCounter](self, "backoffCounter")];
  -[ASTRemoteServerSession setBackoffCounter:](self, "setBackoffCounter:", -[ASTRemoteServerSession backoffCounter](self, "backoffCounter") + 1);
  v3 = 1000000000 * v7;
LABEL_7:
  v8 = dispatch_semaphore_create(0);
  -[ASTRemoteServerSession setBackoffTimer:](self, "setBackoffTimer:", v8);

  -[ASTRemoteServerSession backoffTimer](self, "backoffTimer");
  dsema = objc_claimAutoreleasedReturnValue();
  v9 = dispatch_time(0, v3);
  dispatch_semaphore_wait(dsema, v9);

}

- (id)_retryRequest
{
  ASTRequest *v3;
  void *v4;

  -[ASTRemoteServerSession setRetryCounter:](self, "setRetryCounter:", -[ASTRemoteServerSession retryCounter](self, "retryCounter") + 1);
  if (-[ASTRemoteServerSession retryCounter](self, "retryCounter") > 2
    || (v3 = objc_alloc_init(ASTRequest), -[ASTRequest setClientStatus:](v3, "setClientStatus:", 8), !v3))
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ASTErrorDomain"), -1, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASTRemoteServerSession setClientStatusLoopError:](self, "setClientStatusLoopError:", v4);

    -[ASTRemoteServerSession setShouldContinueRequestLoop:](self, "setShouldContinueRequestLoop:", 0);
    v3 = 0;
  }
  return v3;
}

- (void)_protocolError
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  +[ASTRequest stringFromClientStatus:](ASTRequest, "stringFromClientStatus:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_0(&dword_22D91B000, a2, v4, "--------------- PROTOCOL ERROR DETECTED; clientStatus = %@ ---------------",
    v5);

  OUTLINED_FUNCTION_8_0();
}

- (void)_cancelControlExecution
{
  void *v3;
  void *v4;
  int v5;
  NSObject *v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;
  id buf;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  -[ASTSession context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "controlCommand");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "reset");

  ASTLogHandleForCategory(0);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 67109120;
    HIDWORD(buf) = v5;
    _os_log_impl(&dword_22D91B000, v6, OS_LOG_TYPE_DEFAULT, "Reset control command: %d", (uint8_t *)&buf, 8u);
  }

  if (v5)
  {
    objc_initWeak(&buf, self);
    -[ASTRemoteServerSession delegateQueue](self, "delegateQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __49__ASTRemoteServerSession__cancelControlExecution__block_invoke;
    block[3] = &unk_24F96A418;
    objc_copyWeak(&v9, &buf);
    dispatch_async(v7, block);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&buf);
  }
}

void __49__ASTRemoteServerSession__cancelControlExecution__block_invoke(uint64_t a1)
{
  void *v1;
  char v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_opt_respondsToSelector();

  if ((v2 & 1) != 0)
  {
    objc_msgSend(WeakRetained, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "sessionDidAbortWhilePerformingActions:", WeakRetained);

  }
}

- (BOOL)_validateCommand:(int64_t)a3 clientStatus:(int64_t)a4
{
  BOOL result;
  char v7;
  unsigned int v8;
  NSObject *v9;

  result = 1;
  switch(a3)
  {
    case 1:
      v7 = a4 - 1;
      if ((unint64_t)(a4 - 1) >= 0xF)
        goto LABEL_9;
      v8 = 28323;
      goto LABEL_4;
    case 2:
    case 3:
    case 5:
    case 10:
      v7 = a4 - 1;
      if ((unint64_t)(a4 - 1) < 0xF)
      {
        v8 = 28195;
LABEL_4:
        if (((v8 >> v7) & 1) != 0)
          return result;
      }
      goto LABEL_9;
    case 4:
      if (((a4 - 4) & 0xFFFFFFFFFFFFFFF7) != 0)
        goto LABEL_9;
      return result;
    case 6:
    case 7:
    case 8:
    case 9:
    case 11:
    case 12:
    case 13:
      return result;
    default:
LABEL_9:
      ASTLogHandleForCategory(0);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[ASTRemoteServerSession _validateCommand:clientStatus:].cold.1(a3, a4, v9);

      return 0;
  }
}

- (void)connectionManagerRequestPaused:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  NSObject *v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id location;

  v4 = a3;
  -[ASTSession delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ASTErrorDomain"), -1004, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    -[ASTRemoteServerSession delegateQueue](self, "delegateQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __57__ASTRemoteServerSession_connectionManagerRequestPaused___block_invoke;
    block[3] = &unk_24F96A440;
    objc_copyWeak(&v12, &location);
    v11 = v7;
    v9 = v7;
    dispatch_async(v8, block);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

}

void __57__ASTRemoteServerSession_connectionManagerRequestPaused___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "session:didPauseWithError:", WeakRetained, *(_QWORD *)(a1 + 32));

}

- (void)connectionManagerRequestResumed:(id)a3
{
  id v4;
  void *v5;
  char v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id location;

  v4 = a3;
  -[ASTSession delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    objc_initWeak(&location, self);
    -[ASTRemoteServerSession delegateQueue](self, "delegateQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __58__ASTRemoteServerSession_connectionManagerRequestResumed___block_invoke;
    v8[3] = &unk_24F96A418;
    objc_copyWeak(&v9, &location);
    dispatch_async(v7, v8);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }

}

void __58__ASTRemoteServerSession_connectionManagerRequestResumed___block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "sessionDidResume:", WeakRetained);

}

- (void)connectionManager:(id)a3 pausedSendingResultForTest:(id)a4 reason:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  char v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id location;

  v8 = a3;
  v9 = a4;
  -[ASTSession delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    if (a5)
      v12 = -1003;
    else
      v12 = -1004;
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ASTErrorDomain"), v12, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    -[ASTRemoteServerSession delegateQueue](self, "delegateQueue");
    v14 = objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __78__ASTRemoteServerSession_connectionManager_pausedSendingResultForTest_reason___block_invoke;
    v16[3] = &unk_24F96A490;
    objc_copyWeak(&v19, &location);
    v17 = v9;
    v18 = v13;
    v15 = v13;
    dispatch_async(v14, v16);

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }

}

void __78__ASTRemoteServerSession_connectionManager_pausedSendingResultForTest_reason___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "session:didPauseSendingResultForTest:error:", WeakRetained, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)connectionManager:(id)a3 resumedSendingResultForTest:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  NSObject *v10;
  _QWORD block[4];
  id v12;
  id v13;
  id location;

  v6 = a3;
  v7 = a4;
  -[ASTSession delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    objc_initWeak(&location, self);
    -[ASTRemoteServerSession delegateQueue](self, "delegateQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __72__ASTRemoteServerSession_connectionManager_resumedSendingResultForTest___block_invoke;
    block[3] = &unk_24F96A440;
    objc_copyWeak(&v13, &location);
    v12 = v7;
    dispatch_async(v10, block);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

}

void __72__ASTRemoteServerSession_connectionManager_resumedSendingResultForTest___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "session:didResumeSendingResultForTest:", WeakRetained, *(_QWORD *)(a1 + 32));

}

- (id)_signPayload:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  dispatch_semaphore_t v10;
  NSObject *v11;
  id v12;
  _QWORD v14[4];
  NSObject *v15;
  uint64_t *v16;
  id *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v6 = a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__5;
  v22 = __Block_byref_object_dispose__5;
  v23 = 0;
  -[ASTSession delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "conformsToProtocol:", &unk_255DA88B8))
    goto LABEL_4;
  -[ASTSession delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[ASTSession delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = dispatch_semaphore_create(0);
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __45__ASTRemoteServerSession__signPayload_error___block_invoke;
    v14[3] = &unk_24F96A5D0;
    v16 = &v18;
    v17 = a4;
    v11 = v10;
    v15 = v11;
    objc_msgSend(v7, "session:signPayload:completionHandler:", self, v6, v14);
    dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);

LABEL_4:
  }
  v12 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  return v12;
}

void __45__ASTRemoteServerSession__signPayload_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v6 = a3;
  v7 = v6;
  if (*(_QWORD *)(a1 + 48))
    **(_QWORD **)(a1 + 48) = objc_retainAutorelease(v6);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (id)_signFile:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  dispatch_semaphore_t v10;
  NSObject *v11;
  id v12;
  _QWORD v14[4];
  NSObject *v15;
  uint64_t *v16;
  id *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v6 = a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__5;
  v22 = __Block_byref_object_dispose__5;
  v23 = 0;
  -[ASTSession delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "conformsToProtocol:", &unk_255DA88B8))
    goto LABEL_4;
  -[ASTSession delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[ASTSession delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = dispatch_semaphore_create(0);
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __42__ASTRemoteServerSession__signFile_error___block_invoke;
    v14[3] = &unk_24F96A5D0;
    v16 = &v18;
    v17 = a4;
    v11 = v10;
    v15 = v11;
    objc_msgSend(v7, "session:signFile:completionHandler:", self, v6, v14);
    dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);

LABEL_4:
  }
  v12 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  return v12;
}

void __42__ASTRemoteServerSession__signFile_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v6 = a3;
  v7 = v6;
  if (*(_QWORD *)(a1 + 48))
    **(_QWORD **)(a1 + 48) = objc_retainAutorelease(v6);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (BOOL)_shouldAllowCellularForSealedTestResult:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  int v7;
  void *v8;
  NSObject *v9;
  BOOL v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  unint64_t v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  unint64_t v35;
  __int16 v36;
  unint64_t v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[ASTSession allowCellularSizeThreshold](self, "allowCellularSizeThreshold");
  objc_msgSend(v4, "allowCellularSizeThreshold");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  if (v7)
  {
    objc_msgSend(v4, "allowCellularSizeThreshold");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v8, "unsignedIntegerValue");

    ASTLogHandleForCategory(0);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v35 = v5;
      _os_log_impl(&dword_22D91B000, v9, OS_LOG_TYPE_DEFAULT, "Using cellular size threshold from test result: %lu", buf, 0xCu);
    }

  }
  if (v5 == -1)
  {
    v10 = 1;
  }
  else
  {
    objc_msgSend(v4, "files");
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11
      && (v12 = (void *)v11,
          objc_msgSend(v4, "files"),
          v13 = (void *)objc_claimAutoreleasedReturnValue(),
          v14 = objc_msgSend(v13, "count"),
          v13,
          v12,
          v14))
    {
      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      objc_msgSend(v4, "files");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
      if (v16)
      {
        v17 = v16;
        v28 = v5;
        v29 = v4;
        v18 = 0;
        v19 = *(_QWORD *)v31;
        do
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v31 != v19)
              objc_enumerationMutation(v15);
            v21 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
            objc_msgSend(MEMORY[0x24BDD1580], "defaultManager", v28, v29);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "fileURL");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "path");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "attributesOfItemAtPath:error:", v24, 0);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v18 += objc_msgSend(v25, "fileSize");

          }
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
        }
        while (v17);
        v5 = v28;
        v4 = v29;
      }
      else
      {
        v18 = 0;
      }
    }
    else
    {
      objc_msgSend(v4, "payload");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v15, "length");
    }

    ASTLogHandleForCategory(0);
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      v35 = v18;
      v36 = 2048;
      v37 = v5;
      _os_log_impl(&dword_22D91B000, v26, OS_LOG_TYPE_DEFAULT, "Payload size: %llu, threshold: %lu", buf, 0x16u);
    }

    v10 = v18 <= v5;
  }

  return v10;
}

- (BOOL)_shouldAllowCellularForSealedSealablePayload:(id)a3
{
  id v4;
  unint64_t v5;
  BOOL v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  NSObject *v10;
  int v12;
  unint64_t v13;
  __int16 v14;
  unint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[ASTSession allowCellularSizeThreshold](self, "allowCellularSizeThreshold");
  if (v5 == -1)
  {
    v6 = 1;
  }
  else
  {
    v7 = v5;
    objc_msgSend(v4, "payload");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "length");

    ASTLogHandleForCategory(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 134218240;
      v13 = v9;
      v14 = 2048;
      v15 = v7;
      _os_log_impl(&dword_22D91B000, v10, OS_LOG_TYPE_DEFAULT, "Payload size: %llu, threshold: %lu", (uint8_t *)&v12, 0x16u);
    }

    v6 = v9 <= v7;
  }

  return v6;
}

+ (BOOL)currentProcessHasEntitlement
{
  return 1;
}

+ (BOOL)auditToken:(id *)a3 hasEntitlement:(id)a4
{
  void *v4;
  void *v5;
  BOOL value;
  NSObject *v7;

  objc_msgSend(objc_retainAutorelease(a4), "UTF8String");
  v4 = (void *)xpc_copy_entitlement_for_token();
  v5 = v4;
  if (v4)
  {
    value = xpc_BOOL_get_value(v4);
  }
  else
  {
    ASTLogHandleForCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      +[ASTRemoteServerSession auditToken:hasEntitlement:].cold.1();

    value = 0;
  }

  return value;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  ASTLogHandleForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v6 = "-[ASTRemoteServerSession dealloc]";
    _os_log_impl(&dword_22D91B000, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  +[ASTEnvironment resetEnvironment](ASTEnvironment, "resetEnvironment");
  v4.receiver = self;
  v4.super_class = (Class)ASTRemoteServerSession;
  -[ASTSession dealloc](&v4, sel_dealloc);
}

- (void)requestSuitesAvailableWithCompletionHandler:(id)a3
{
  void (**v4)(id, void *, void *);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  _QWORD v13[5];
  void (**v14)(id, void *, void *);

  v4 = (void (**)(id, void *, void *))a3;
  if (-[ASTRemoteServerSession phase](self, "phase") != 2)
  {
    ASTLogHandleForCategory(0);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[ASTRemoteServerSession requestSuitesAvailableWithCompletionHandler:].cold.2(self, v9);

    objc_msgSend(MEMORY[0x24BDBCE30], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASTRemoteServerSession clientStatusLoopError](self, "clientStatusLoopError");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v6, v10);
    goto LABEL_10;
  }
  +[ASTEnvironment currentEnvironment](ASTEnvironment, "currentEnvironment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "configCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    ASTLogHandleForCategory(0);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[ASTRemoteServerSession requestSuitesAvailableWithCompletionHandler:].cold.1();

    objc_msgSend(MEMORY[0x24BDBCE30], "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ASTErrorDomain"), -4003, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v10, v12);

LABEL_10:
    goto LABEL_11;
  }
  -[ASTRemoteServerSession connectionManager](self, "connectionManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASTRemoteServerSession payloadSigner](self, "payloadSigner");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __70__ASTRemoteServerSession_requestSuitesAvailableWithCompletionHandler___block_invoke;
  v13[3] = &unk_24F96A5F8;
  v13[4] = self;
  v14 = v4;
  objc_msgSend(v7, "requestSelfServiceSuitesAvailableWithConfigCode:withPayloadSigner:allowsCellularAccess:completionHandler:", v6, v8, 1, v13);

LABEL_11:
}

void __70__ASTRemoteServerSession_requestSuitesAvailableWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  v6 = objc_msgSend(*(id *)(a1 + 32), "phase");
  v7 = *(_QWORD *)(a1 + 40);
  if (v6 == 2)
  {
    (*(void (**)(_QWORD, id, id))(v7 + 16))(*(_QWORD *)(a1 + 40), v10, v5);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE30], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "clientStatusLoopError");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, void *))(v7 + 16))(v7, v8, v9);

  }
}

- (void)requestSuiteStart:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  v7 = a3;
  if (-[ASTRemoteServerSession phase](self, "phase") == 2)
  {
    -[ASTRemoteServerSession connectionManager](self, "connectionManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASTRemoteServerSession payloadSigner](self, "payloadSigner");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __62__ASTRemoteServerSession_requestSuiteStart_completionHandler___block_invoke;
    v11[3] = &unk_24F96A620;
    v12 = v6;
    objc_msgSend(v8, "postSelectSelfServiceSuite:withPayloadSigner:allowsCellularAccess:completionHandler:", v7, v9, 1, v11);

  }
  else
  {
    -[ASTRemoteServerSession clientStatusLoopError](self, "clientStatusLoopError");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, id, _QWORD, _QWORD, void *))v6 + 2))(v6, v7, 0, 0, v10);

  }
}

uint64_t __62__ASTRemoteServerSession_requestSuiteStart_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)requestSuiteSummary:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, uint64_t);
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  _QWORD v13[4];
  void (**v14)(id, _QWORD, uint64_t);

  v6 = a3;
  v7 = (void (**)(id, _QWORD, uint64_t))a4;
  if (-[ASTRemoteServerSession phase](self, "phase") != 2)
  {
    -[ASTRemoteServerSession clientStatusLoopError](self, "clientStatusLoopError");
    v10 = objc_claimAutoreleasedReturnValue();
LABEL_8:
    v12 = (void *)v10;
    v7[2](v7, 0, v10);

    goto LABEL_9;
  }
  if (!objc_msgSend(v6, "length"))
  {
    ASTLogHandleForCategory(0);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[ASTRemoteServerSession requestSuiteSummary:completionHandler:].cold.1();

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ASTErrorDomain"), -4004, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  -[ASTRemoteServerSession connectionManager](self, "connectionManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASTRemoteServerSession payloadSigner](self, "payloadSigner");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __64__ASTRemoteServerSession_requestSuiteSummary_completionHandler___block_invoke;
  v13[3] = &unk_24F96A648;
  v14 = v7;
  objc_msgSend(v8, "requestSelfServiceSuiteResultsWithDiagnosticEventID:withPayloadSigner:allowsCellularAccess:completionHandler:", v6, v9, 1, v13);

LABEL_9:
}

uint64_t __64__ASTRemoteServerSession_requestSuiteSummary_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (NSString)sessionId
{
  return self->_sessionId;
}

- (void)setSessionId:(id)a3
{
  objc_storeStrong((id *)&self->_sessionId, a3);
}

- (ASTConnectionManager)connectionManager
{
  return self->_connectionManager;
}

- (void)setConnectionManager:(id)a3
{
  objc_storeStrong((id *)&self->_connectionManager, a3);
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void)setDelegateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_delegateQueue, a3);
}

- (OS_dispatch_queue)clientStatusQueue
{
  return self->_clientStatusQueue;
}

- (void)setClientStatusQueue:(id)a3
{
  objc_storeStrong((id *)&self->_clientStatusQueue, a3);
}

- (int64_t)retryCounter
{
  return self->_retryCounter;
}

- (void)setRetryCounter:(int64_t)a3
{
  self->_retryCounter = a3;
}

- (int64_t)backoffCounter
{
  return self->_backoffCounter;
}

- (void)setBackoffCounter:(int64_t)a3
{
  self->_backoffCounter = a3;
}

- (OS_dispatch_semaphore)backoffTimer
{
  return self->_backoffTimer;
}

- (void)setBackoffTimer:(id)a3
{
  objc_storeStrong((id *)&self->_backoffTimer, a3);
}

- (NSMutableDictionary)runningTests
{
  return self->_runningTests;
}

- (void)setRunningTests:(id)a3
{
  objc_storeStrong((id *)&self->_runningTests, a3);
}

- (NSMutableDictionary)pendingTestResults
{
  return self->_pendingTestResults;
}

- (void)setPendingTestResults:(id)a3
{
  objc_storeStrong((id *)&self->_pendingTestResults, a3);
}

- (ASTProfileResult)pendingProfileResult
{
  return self->_pendingProfileResult;
}

- (void)setPendingProfileResult:(id)a3
{
  objc_storeStrong((id *)&self->_pendingProfileResult, a3);
}

- (OS_dispatch_semaphore)pendingProfileSemaphore
{
  return self->_pendingProfileSemaphore;
}

- (void)setPendingProfileSemaphore:(id)a3
{
  objc_storeStrong((id *)&self->_pendingProfileSemaphore, a3);
}

- (ASTRequest)pendingPropertiesResult
{
  return self->_pendingPropertiesResult;
}

- (void)setPendingPropertiesResult:(id)a3
{
  objc_storeStrong((id *)&self->_pendingPropertiesResult, a3);
}

- (OS_dispatch_semaphore)pendingPropertiesSemaphore
{
  return self->_pendingPropertiesSemaphore;
}

- (void)setPendingPropertiesSemaphore:(id)a3
{
  objc_storeStrong((id *)&self->_pendingPropertiesSemaphore, a3);
}

- (ASTAuthInfoResult)pendingAuthInfoResult
{
  return self->_pendingAuthInfoResult;
}

- (void)setPendingAuthInfoResult:(id)a3
{
  objc_storeStrong((id *)&self->_pendingAuthInfoResult, a3);
}

- (OS_dispatch_semaphore)pendingAuthInfoSemaphore
{
  return self->_pendingAuthInfoSemaphore;
}

- (void)setPendingAuthInfoSemaphore:(id)a3
{
  objc_storeStrong((id *)&self->_pendingAuthInfoSemaphore, a3);
}

- (int64_t)phase
{
  return self->_phase;
}

- (void)setPhase:(int64_t)a3
{
  self->_phase = a3;
}

- (BOOL)shouldContinueRequestLoop
{
  return self->_shouldContinueRequestLoop;
}

- (void)setShouldContinueRequestLoop:(BOOL)a3
{
  self->_shouldContinueRequestLoop = a3;
}

- (BOOL)shouldUnenroll
{
  return self->_shouldUnenroll;
}

- (void)setShouldUnenroll:(BOOL)a3
{
  self->_shouldUnenroll = a3;
}

- (BOOL)shouldAbort
{
  return self->_shouldAbort;
}

- (void)setShouldAbort:(BOOL)a3
{
  self->_shouldAbort = a3;
}

- (id)sessionTeardownCompletion
{
  return self->_sessionTeardownCompletion;
}

- (void)setSessionTeardownCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (NSError)clientStatusLoopError
{
  return self->_clientStatusLoopError;
}

- (void)setClientStatusLoopError:(id)a3
{
  objc_storeStrong((id *)&self->_clientStatusLoopError, a3);
}

- (id)payloadSigner
{
  return self->_payloadSigner;
}

- (id)fileSigner
{
  return self->_fileSigner;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_fileSigner, 0);
  objc_storeStrong(&self->_payloadSigner, 0);
  objc_storeStrong((id *)&self->_clientStatusLoopError, 0);
  objc_storeStrong(&self->_sessionTeardownCompletion, 0);
  objc_storeStrong((id *)&self->_pendingAuthInfoSemaphore, 0);
  objc_storeStrong((id *)&self->_pendingAuthInfoResult, 0);
  objc_storeStrong((id *)&self->_pendingPropertiesSemaphore, 0);
  objc_storeStrong((id *)&self->_pendingPropertiesResult, 0);
  objc_storeStrong((id *)&self->_pendingProfileSemaphore, 0);
  objc_storeStrong((id *)&self->_pendingProfileResult, 0);
  objc_storeStrong((id *)&self->_pendingTestResults, 0);
  objc_storeStrong((id *)&self->_runningTests, 0);
  objc_storeStrong((id *)&self->_backoffTimer, 0);
  objc_storeStrong((id *)&self->_clientStatusQueue, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_connectionManager, 0);
  objc_storeStrong((id *)&self->_sessionId, 0);
}

void __31__ASTRemoteServerSession_start__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_22D91B000, v0, v1, "[Enroll] failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __31__ASTRemoteServerSession_start__block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_22D91B000, v0, v1, "[Profile] failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __31__ASTRemoteServerSession_start__block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_22D91B000, v0, v1, "[AuthInfo] failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __33__ASTRemoteServerSession_archive__block_invoke_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint8_t v8[24];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "sessionId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "debugDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_4_0(&dword_22D91B000, a3, v7, "Failed to archive the session %@, error: %@", v8);

  OUTLINED_FUNCTION_7_0();
}

- (void)_endAndUnenrollIfNecessary:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_22D91B000, v0, v1, "Ignored call to -[ASTSession end] while a session was already ending.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_updateUIWithData:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_22D91B000, v0, v1, "No imageName provided", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_updateUIWithData:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_0(&dword_22D91B000, v0, v1, "Invalid action: %@", v2);
  OUTLINED_FUNCTION_3();
}

void __44__ASTRemoteServerSession__updateUIWithData___block_invoke_6_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 40);
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  OUTLINED_FUNCTION_4_0(&dword_22D91B000, a3, (uint64_t)a3, "Failed to download test suite image: %@, error: %@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_3();
}

void __43__ASTRemoteServerSession__sendTestResults___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_22D91B000, v0, v1, "Failed to send test results", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_showInstructionalPromptWithData:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_22D91B000, v0, v1, "Connection manager is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_showInstructionalPromptWithData:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_0(&dword_22D91B000, v0, v1, "Unexpected instructional prompt type: %@", v2);
  OUTLINED_FUNCTION_3();
}

- (void)_validateCommand:(NSObject *)a3 clientStatus:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint8_t v8[24];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  +[ASTResponse stringFromCommand:](ASTResponse, "stringFromCommand:", a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[ASTRequest stringFromClientStatus:](ASTRequest, "stringFromClientStatus:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_4_0(&dword_22D91B000, a3, v7, "Unexpected command from server: command = %@, clientStatus = %@", v8);

  OUTLINED_FUNCTION_7_0();
}

+ (void)auditToken:hasEntitlement:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_22D91B000, v0, v1, "Unable to find entitlement", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)requestSuitesAvailableWithCompletionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_22D91B000, v0, v1, "Requesting suites with a bad config code", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)requestSuitesAvailableWithCompletionHandler:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "phase");
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_0(&dword_22D91B000, a2, v3, "Wrong session phase (%ld), skipping requesting the suites", v4);
  OUTLINED_FUNCTION_8_0();
}

- (void)requestSuiteSummary:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_22D91B000, v0, v1, "Requesting suite summary with a bad diagnostic event id", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

@end
