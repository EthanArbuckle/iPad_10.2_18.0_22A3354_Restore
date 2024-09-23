@implementation ASCServicesConnection

+ (OS_os_log)log
{
  if (log_onceToken_6 != -1)
    dispatch_once(&log_onceToken_6, &__block_literal_global_26);
  return (OS_os_log *)(id)log_log_6;
}

void __28__ASCServicesConnection_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.AppStoreComponents", "ASCServicesConnection");
  v1 = (void *)log_log_6;
  log_log_6 = (uint64_t)v0;

}

+ (ASCServicesConnection)sharedConnection
{
  if (sharedConnection_onceToken != -1)
    dispatch_once(&sharedConnection_onceToken, &__block_literal_global_6_1);
  return (ASCServicesConnection *)(id)sharedConnection_sharedConnection;
}

void __41__ASCServicesConnection_sharedConnection__block_invoke()
{
  ASCServicesConnection *v0;
  void *v1;

  v0 = objc_alloc_init(ASCServicesConnection);
  v1 = (void *)sharedConnection_sharedConnection;
  sharedConnection_sharedConnection = (uint64_t)v0;

}

- (ASCServicesConnection)init
{
  ASCServicesConnection *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *workQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ASCServicesConnection;
  v2 = -[ASCServicesConnection init](&v7, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.AppStoreComponents.ServiceConnection", v3);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v4;

  }
  return v2;
}

- (NSXPCConnection)connection
{
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  id location;

  -[ASCServicesConnection workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[ASCServicesConnection connectionIfValid](self, "connectionIfValid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.appstorecomponentsd.xpc"), 0);
    ASCServiceBrokerGetInterface();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setRemoteObjectInterface:", v7);

    objc_initWeak(&location, self);
    v8 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __35__ASCServicesConnection_connection__block_invoke;
    v13[3] = &unk_1E7560470;
    objc_copyWeak(&v14, &location);
    objc_msgSend(v6, "setInterruptionHandler:", v13);
    v11[0] = v8;
    v11[1] = 3221225472;
    v11[2] = __35__ASCServicesConnection_connection__block_invoke_2;
    v11[3] = &unk_1E7560470;
    objc_copyWeak(&v12, &location);
    objc_msgSend(v6, "setInvalidationHandler:", v11);
    -[ASCServicesConnection workQueue](self, "workQueue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_setQueue:", v9);

    objc_msgSend(v6, "resume");
    -[ASCServicesConnection setConnectionIfValid:](self, "setConnectionIfValid:", v6);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

  return (NSXPCConnection *)v6;
}

void __35__ASCServicesConnection_connection__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "connectionWasInterrupted");

}

void __35__ASCServicesConnection_connection__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "connectionWasInvalidated");

}

- (void)connectionWasInterrupted
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  -[ASCServicesConnection workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  +[ASCServicesConnection log](ASCServicesConnection, "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1BCB7B000, v4, OS_LOG_TYPE_INFO, "daemon connection interrupted", v6, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:", CFSTR("ASCServicesConnectionWasInterruptedNotification"), self);

}

- (void)connectionWasInvalidated
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  -[ASCServicesConnection workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  +[ASCServicesConnection log](ASCServicesConnection, "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1BCB7B000, v4, OS_LOG_TYPE_INFO, "daemon connection invalidated", v6, 2u);
  }

  -[ASCServicesConnection setConnectionIfValid:](self, "setConnectionIfValid:", 0);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:", CFSTR("ASCServicesConnectionWasInvalidatedNotification"), self);

}

- (id)serviceWithBlock:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD block[5];
  id v13;
  id v14;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0CFDBB8]);
  -[ASCServicesConnection workQueue](self, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__ASCServicesConnection_serviceWithBlock___block_invoke;
  block[3] = &unk_1E75617E8;
  block[4] = self;
  v7 = v5;
  v13 = v7;
  v14 = v4;
  v8 = v4;
  dispatch_async(v6, block);

  v9 = v14;
  v10 = v7;

  return v10;
}

void __42__ASCServicesConnection_serviceWithBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __42__ASCServicesConnection_serviceWithBlock___block_invoke_2;
  v4[3] = &unk_1E7560410;
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

uint64_t __42__ASCServicesConnection_serviceWithBlock___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithError:", a2);
}

- (id)testConnection
{
  id v3;
  NSObject *v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  id v10;

  v3 = objc_alloc_init(MEMORY[0x1E0CFDBA8]);
  -[ASCServicesConnection workQueue](self, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __39__ASCServicesConnection_testConnection__block_invoke;
  v9[3] = &unk_1E75605A0;
  v9[4] = self;
  v5 = v3;
  v10 = v5;
  dispatch_async(v4, v9);

  v6 = v10;
  v7 = v5;

  return v7;
}

void __39__ASCServicesConnection_testConnection__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[4];
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __39__ASCServicesConnection_testConnection__block_invoke_2;
  v7[3] = &unk_1E7560410;
  v8 = *(id *)(a1 + 40);
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5[0] = v3;
  v5[1] = 3221225472;
  v5[2] = __39__ASCServicesConnection_testConnection__block_invoke_3;
  v5[3] = &unk_1E7560410;
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v4, "testConnectionWithReplyHandler:", v5);

}

uint64_t __39__ASCServicesConnection_testConnection__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithError:", a2);
}

uint64_t __39__ASCServicesConnection_testConnection__block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  if (a2)
    return objc_msgSend(v2, "finishWithError:", a2);
  else
    return objc_msgSend(v2, "finishWithSuccess");
}

- (id)lockupFetcherService
{
  return -[ASCServicesConnection serviceWithBlock:](self, "serviceWithBlock:", &__block_literal_global_16_0);
}

void __45__ASCServicesConnection_lockupFetcherService__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v4 = a2;
  objc_msgSend(a3, "completionHandlerAdapter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getLockupFetcherServiceWithReplyHandler:", v5);

}

- (id)metricsService
{
  return -[ASCServicesConnection serviceWithBlock:](self, "serviceWithBlock:", &__block_literal_global_17);
}

void __39__ASCServicesConnection_metricsService__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v4 = a2;
  objc_msgSend(a3, "completionHandlerAdapter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getMetricsServiceWithReplyHandler:", v5);

}

- (id)offerStateServiceWithDelegate:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __55__ASCServicesConnection_offerStateServiceWithDelegate___block_invoke;
  v8[3] = &unk_1E7561830;
  v9 = v4;
  v5 = v4;
  -[ASCServicesConnection serviceWithBlock:](self, "serviceWithBlock:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __55__ASCServicesConnection_offerStateServiceWithDelegate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  id v6;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a2;
  objc_msgSend(a3, "completionHandlerAdapter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getAppOfferStateServiceForDelegate:withReplyHandler:", v4, v6);

}

- (id)urlLauncherService
{
  return -[ASCServicesConnection serviceWithBlock:](self, "serviceWithBlock:", &__block_literal_global_18);
}

void __43__ASCServicesConnection_urlLauncherService__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v4 = a2;
  objc_msgSend(a3, "completionHandlerAdapter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getURLLaunchServiceWithReplyHandler:", v5);

}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (NSXPCConnection)connectionIfValid
{
  return self->_connectionIfValid;
}

- (void)setConnectionIfValid:(id)a3
{
  objc_storeStrong((id *)&self->_connectionIfValid, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionIfValid, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

@end
