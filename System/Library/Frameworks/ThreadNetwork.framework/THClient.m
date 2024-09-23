@implementation THClient

- (THClient)init
{
  THClient *v2;
  THClient *v3;
  BOOL v4;
  NSObject *v5;
  NSObject *v6;
  THClient *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  objc_super v16;
  uint8_t buf[4];
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)THClient;
  v2 = -[THClient init](&v16, sel_init);
  v3 = v2;
  if (!v2)
  {
LABEL_5:
    v7 = v3;
    goto LABEL_9;
  }
  v4 = -[THClient initCommon](v2, "initCommon");
  v5 = ThreadNetworkLoggingCategory(0);
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v18 = "-[THClient init]";
      _os_log_impl(&dword_1CD04F000, v6, OS_LOG_TYPE_INFO, "Client: %s - XPC Client Init done", buf, 0xCu);
    }
    goto LABEL_5;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[THClient init].cold.1(v6, v8, v9, v10, v11, v12, v13, v14);
  -[THClient invalidate](v3, "invalidate");
  v7 = 0;
LABEL_9:

  return v7;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  objc_super v7;
  uint8_t buf[4];
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  -[THClient xpcConnection](self, "xpcConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[THClient xpcConnection](self, "xpcConnection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invalidate");

  }
  v5 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v9 = "-[THClient dealloc]";
    _os_log_impl(&dword_1CD04F000, v5, OS_LOG_TYPE_DEFAULT, "%s : Client: Connection - deallocated...", buf, 0xCu);
  }
  if (-[THClient threadSafePropertyQueue](self, "threadSafePropertyQueue"))
    dispatch_release((dispatch_object_t)self->_threadSafePropertyQueue);
  v6 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v9 = "-[THClient dealloc]";
    _os_log_impl(&dword_1CD04F000, v6, OS_LOG_TYPE_DEFAULT, "%s : Client: thread safe property queue - deallocated...", buf, 0xCu);
  }
  v7.receiver = self;
  v7.super_class = (Class)THClient;
  -[THClient dealloc](&v7, sel_dealloc);
}

- (THClient)initWithKeychainAccessGroup:(id)a3
{
  id v4;
  THClient *v5;
  THClient *v6;
  BOOL v7;
  NSObject *v8;
  NSObject *v9;
  THClient *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  objc_super v19;
  uint8_t buf[4];
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)THClient;
  v5 = -[THClient init](&v19, sel_init);
  v6 = v5;
  if (!v5)
  {
LABEL_5:
    v10 = v6;
    goto LABEL_9;
  }
  v7 = -[THClient initCommon:](v5, "initCommon:", v4);
  v8 = ThreadNetworkLoggingCategory(0);
  v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v21 = "-[THClient initWithKeychainAccessGroup:]";
      _os_log_impl(&dword_1CD04F000, v9, OS_LOG_TYPE_DEFAULT, "Client: %s - XPC Client Init done", buf, 0xCu);
    }
    goto LABEL_5;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    -[THClient initWithKeychainAccessGroup:].cold.1(v9, v11, v12, v13, v14, v15, v16, v17);
  -[THClient invalidate](v6, "invalidate");
  v10 = 0;
LABEL_9:

  return v10;
}

- (BOOL)initCommon:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  char v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  id v12;
  id location;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v4 = a3;
  v5 = dispatch_queue_attr_make_with_qos_class(MEMORY[0x1E0C80D50], QOS_CLASS_USER_INITIATED, 0);
  self->_threadSafePropertyQueue = (dispatch_queue_s *)dispatch_queue_create("CTCS XPC Client Thread Safe Property Queue", v5);
  self->_isConnected = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __23__THClient_initCommon___block_invoke;
  v9[3] = &unk_1E8992358;
  objc_copyWeak(&v12, &location);
  v11 = &v14;
  v6 = v4;
  v10 = v6;
  DispatchXPCConnectionQueueIfNecessaryAndWait(v9, 1);
  v7 = *((_BYTE *)v15 + 24);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v14, 8);

  return v7;
}

void __23__THClient_initCommon___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(WeakRetained, "getConnectionEntitlementValidity:", *(_QWORD *)(a1 + 32));
    WeakRetained = v3;
  }

}

- (BOOL)initCommon
{
  NSObject *v3;
  char v4;
  _QWORD v6[5];
  id v7;
  id location;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v3 = dispatch_queue_attr_make_with_qos_class(MEMORY[0x1E0C80D50], QOS_CLASS_USER_INITIATED, 0);
  self->_threadSafePropertyQueue = (dispatch_queue_s *)dispatch_queue_create("CTCS XPC Client Thread Safe Property Queue", v3);
  self->_isConnected = 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __22__THClient_initCommon__block_invoke;
  v6[3] = &unk_1E8992380;
  objc_copyWeak(&v7, &location);
  v6[4] = &v9;
  DispatchXPCConnectionQueueIfNecessaryAndWait(v6, 1);
  v4 = *((_BYTE *)v10 + 24);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v9, 8);
  return v4;
}

void __22__THClient_initCommon__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(WeakRetained, "getConnectionEntitlementValidity");
    WeakRetained = v3;
  }

}

- (void)pingXPCServiceWithClientProxy:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __53__THClient_pingXPCServiceWithClientProxy_completion___block_invoke;
  v9[3] = &unk_1E89923A8;
  objc_copyWeak(&v11, &location);
  v8 = v7;
  v10 = v8;
  objc_msgSend(v6, "ping:", v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __53__THClient_pingXPCServiceWithClientProxy_completion___block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v4;
  id WeakRetained;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint8_t v18[16];

  LODWORD(v4) = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    if (a3)
      v4 = 0;
    else
      v4 = v4;
    if ((_DWORD)v4 == 1)
    {
      objc_msgSend(WeakRetained, "setIsConnected:", 1);
      v8 = ThreadNetworkLoggingCategory(0);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v18 = 0;
        _os_log_impl(&dword_1CD04F000, v8, OS_LOG_TYPE_INFO, "Successfully established connection", v18, 2u);
      }
    }
    else
    {
      v9 = ThreadNetworkLoggingCategory(0);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        __53__THClient_pingXPCServiceWithClientProxy_completion___block_invoke_cold_1(v9, v10, v11, v12, v13, v14, v15, v16);
      objc_msgSend(v7, "setIsConnected:", 0);
    }
    v17 = *(_QWORD *)(a1 + 32);
    if (v17)
      (*(void (**)(uint64_t, uint64_t))(v17 + 16))(v17, v4);
  }

}

- (void)pingXPCService
{
  id v2;

  v2 = -[THClient clientProxyWithErrorHandler:pingService:](self, "clientProxyWithErrorHandler:pingService:", &__block_literal_global_2, 1);
}

void __26__THClient_pingXPCService__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_1CD04F000, v3, OS_LOG_TYPE_INFO, "clientProxyWithErrorHandler: %@", (uint8_t *)&v4, 0xCu);
  }

}

- (void)handleXPCConnectionInterrupted
{
  NSObject *v3;
  uint8_t v4[16];

  v3 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1CD04F000, v3, OS_LOG_TYPE_INFO, "Handle interrupted XPC Connection", v4, 2u);
  }
  -[THClient setIsConnected:](self, "setIsConnected:", 0);
}

- (void)handleXPCConnectionInvalidated
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id buf[2];

  v3 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1CD04F000, v3, OS_LOG_TYPE_INFO, "Handle invalidated XPC Connection", (uint8_t *)buf, 2u);
  }
  objc_initWeak(buf, self);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __42__THClient_handleXPCConnectionInvalidated__block_invoke;
  v4[3] = &unk_1E8992410;
  objc_copyWeak(&v5, buf);
  DispatchXPCConnectionQueueIfNecessaryAndWait(v4, 1);
  -[THClient setIsConnected:](self, "setIsConnected:", 0);
  objc_destroyWeak(&v5);
  objc_destroyWeak(buf);
}

void __42__THClient_handleXPCConnectionInvalidated__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setXpcConnection:", 0);

}

- (void)connectToXPCService
{
  NSObject *v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  id location;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = ThreadNetworkLoggingCategory(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v20 = "-[THClient connectToXPCService]";
    v21 = 1024;
    v22 = 177;
    _os_log_impl(&dword_1CD04F000, v3, OS_LOG_TYPE_DEFAULT, "Client: %s:%d", buf, 0x12u);
  }
  -[THClient xpcConnection](self, "xpcConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 == 0;

  if (v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.ThreadNetwork.xpc"), 4096);
    -[THClient setXpcConnection:](self, "setXpcConnection:", v6);

    +[XPCInterface CTCSCreateXPCTransportInterface](XPCInterface, "CTCSCreateXPCTransportInterface");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[THClient xpcConnection](self, "xpcConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setRemoteObjectInterface:", v7);

    objc_initWeak(&location, self);
    v9 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __31__THClient_connectToXPCService__block_invoke;
    v16[3] = &unk_1E8992410;
    objc_copyWeak(&v17, &location);
    -[THClient xpcConnection](self, "xpcConnection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setInterruptionHandler:", v16);

    v14[0] = v9;
    v14[1] = 3221225472;
    v14[2] = __31__THClient_connectToXPCService__block_invoke_7;
    v14[3] = &unk_1E8992410;
    objc_copyWeak(&v15, &location);
    -[THClient xpcConnection](self, "xpcConnection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setInvalidationHandler:", v14);

    -[THClient xpcConnection](self, "xpcConnection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "resume");

    v13 = ThreadNetworkLoggingCategory(0);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v20 = "-[THClient connectToXPCService]";
      _os_log_impl(&dword_1CD04F000, v13, OS_LOG_TYPE_INFO, "Client: %s - connectToXPCService Connection resumed", buf, 0xCu);
    }
    objc_destroyWeak(&v15);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
}

void __31__THClient_connectToXPCService__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = ThreadNetworkLoggingCategory(0);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __31__THClient_connectToXPCService__block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    objc_msgSend(WeakRetained, "handleXPCConnectionInterrupted");
  }

}

void __31__THClient_connectToXPCService__block_invoke_7(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = ThreadNetworkLoggingCategory(0);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __31__THClient_connectToXPCService__block_invoke_7_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    objc_msgSend(WeakRetained, "handleXPCConnectionInvalidated");
  }

}

- (void)invalidate
{
  _QWORD v2[4];
  id v3;
  id location;

  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __22__THClient_invalidate__block_invoke;
  v2[3] = &unk_1E8992410;
  objc_copyWeak(&v3, &location);
  DispatchXPCConnectionQueueIfNecessaryAndWait(v2, 1);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

void __22__THClient_invalidate__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = ThreadNetworkLoggingCategory(0);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __22__THClient_invalidate__block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    objc_msgSend(WeakRetained, "xpcConnection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(WeakRetained, "xpcConnection");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "invalidate");

    }
    objc_msgSend(WeakRetained, "setIsConnected:", 0);
  }

}

- (id)clientProxyWithErrorHandler:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[THClient clientProxyWithErrorHandler:pingService:](self, "clientProxyWithErrorHandler:pingService:", v4, -[THClient isConnected](self, "isConnected") ^ 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)clientProxyWithErrorHandler:(id)a3 pingService:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  id v7;
  id v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  uint64_t *v15;
  id v16;
  id location;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v4 = a4;
  v6 = a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy_;
  v22 = __Block_byref_object_dispose_;
  v23 = 0;
  objc_initWeak(&location, self);
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __52__THClient_clientProxyWithErrorHandler_pingService___block_invoke;
  v13 = &unk_1E8992460;
  objc_copyWeak(&v16, &location);
  v15 = &v18;
  v7 = v6;
  v14 = v7;
  DispatchXPCConnectionQueueIfNecessaryAndWait(&v10, 1);
  if (v4)
    -[THClient pingXPCServiceWithClientProxy:completion:](self, "pingXPCServiceWithClientProxy:completion:", v19[5], &__block_literal_global_10, v10, v11, v12, v13);
  v8 = (id)v19[5];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v18, 8);

  return v8;
}

void __52__THClient_clientProxyWithErrorHandler_pingService___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "connectToXPCService");
    objc_msgSend(v3, "xpcConnection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __52__THClient_clientProxyWithErrorHandler_pingService___block_invoke_2;
    v8[3] = &unk_1E8992438;
    v9 = *(id *)(a1 + 32);
    objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", v8);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
}

void __52__THClient_clientProxyWithErrorHandler_pingService___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_1CD04F000, v4, OS_LOG_TYPE_INFO, "remoteObjectProxyWithErrorHandler: %@", (uint8_t *)&v6, 0xCu);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

void __52__THClient_clientProxyWithErrorHandler_pingService___block_invoke_8(uint64_t a1, int a2)
{
  NSObject *v3;
  const __CFString *v4;
  int v5;
  const __CFString *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = CFSTR("NO");
    if (a2)
      v4 = CFSTR("YES");
    v5 = 138412290;
    v6 = v4;
    _os_log_impl(&dword_1CD04F000, v3, OS_LOG_TYPE_INFO, "clientProxyWithErrorHandler connected=%@", (uint8_t *)&v5, 0xCu);
  }
}

- (id)synchronousRemoteObjectProxy
{
  return -[THClient synchronousClientProxyWithErrorHandler:](self, "synchronousClientProxyWithErrorHandler:", &__block_literal_global_14);
}

void __40__THClient_synchronousRemoteObjectProxy__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_1CD04F000, v3, OS_LOG_TYPE_INFO, "synchronousRemoteObjectProxy - %@", (uint8_t *)&v4, 0xCu);
  }

}

- (id)synchronousClientProxyWithErrorHandler:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  id v11;
  id location;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  v18 = 0;
  objc_initWeak(&location, self);
  if (!-[THClient isConnected](self, "isConnected"))
    -[THClient pingXPCService](self, "pingXPCService");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51__THClient_synchronousClientProxyWithErrorHandler___block_invoke;
  v8[3] = &unk_1E8992460;
  objc_copyWeak(&v11, &location);
  v10 = &v13;
  v5 = v4;
  v9 = v5;
  DispatchXPCConnectionQueueIfNecessaryAndWait(v8, 1);
  v6 = (id)v14[5];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v13, 8);

  return v6;
}

void __51__THClient_synchronousClientProxyWithErrorHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "xpcConnection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __51__THClient_synchronousClientProxyWithErrorHandler___block_invoke_2;
    v8[3] = &unk_1E8992438;
    v9 = *(id *)(a1 + 32);
    objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", v8);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
}

void __51__THClient_synchronousClientProxyWithErrorHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = a2;
  v4 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __51__THClient_synchronousClientProxyWithErrorHandler___block_invoke_2_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);
  v11 = *(_QWORD *)(a1 + 32);
  if (v11)
    (*(void (**)(uint64_t, id))(v11 + 16))(v11, v3);

}

- (id)performXPCRequestBlock:(id)a3 timeout:(double)a4 error:(id *)a5
{
  void (**v7)(id, _QWORD *);
  NSObject *v8;
  dispatch_time_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  id v23;
  _QWORD v25[7];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint8_t buf[4];
  void *v39;
  uint64_t v40;
  _QWORD v41[2];

  v41[1] = *MEMORY[0x1E0C80C00];
  v7 = (void (**)(id, _QWORD *))a3;
  v8 = dispatch_semaphore_create(0);
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy_;
  v36 = __Block_byref_object_dispose_;
  v37 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy_;
  v30 = __Block_byref_object_dispose_;
  v31 = 0;
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __49__THClient_performXPCRequestBlock_timeout_error___block_invoke;
  v25[3] = &unk_1E89924E8;
  v25[4] = &v32;
  v25[5] = &v26;
  v25[6] = v8;
  v7[2](v7, v25);
  if (a4 <= 0.0)
    v9 = -1;
  else
    v9 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
  if (!dispatch_semaphore_wait(v8, v9))
  {
    v15 = 0;
    if (!a5)
      goto LABEL_17;
    goto LABEL_12;
  }
  v10 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("XPC method request timed out after %@ seconds"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0CB35C8];
  v40 = *MEMORY[0x1E0CB2D50];
  v41[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, &v40, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ThreadNetwork"), 3, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v15, "description");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v39 = v17;
    _os_log_impl(&dword_1CD04F000, v16, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

  }
  v18 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v39 = v19;
    _os_log_impl(&dword_1CD04F000, v18, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

  }
  if (a5)
  {
LABEL_12:
    v20 = (void *)v27[5];
    if (v20)
    {
      *a5 = objc_retainAutorelease(v20);
      v21 = ThreadNetworkLoggingCategory(0);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend((id)v27[5], "description");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[THClient performXPCRequestBlock:timeout:error:].cold.1(v22, buf, v21);
      }
    }
    else if (v15)
    {
      *a5 = objc_retainAutorelease(v15);
    }
  }
LABEL_17:
  v23 = (id)v33[5];

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v32, 8);

  return v23;
}

void __49__THClient_performXPCRequestBlock_timeout_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

- (BOOL)isConnected
{
  NSObject *threadSafePropertyQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  threadSafePropertyQueue = self->_threadSafePropertyQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __23__THClient_isConnected__block_invoke;
  v5[3] = &unk_1E8992550;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(threadSafePropertyQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __23__THClient_isConnected__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 8);
  return result;
}

- (void)setIsConnected:(BOOL)a3
{
  NSObject *threadSafePropertyQueue;
  _QWORD v4[5];
  BOOL v5;

  threadSafePropertyQueue = self->_threadSafePropertyQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __27__THClient_setIsConnected___block_invoke;
  v4[3] = &unk_1E8992578;
  v5 = a3;
  v4[4] = self;
  dispatch_barrier_async(threadSafePropertyQueue, v4);
}

void __27__THClient_setIsConnected___block_invoke(uint64_t a1)
{
  int v1;
  uint64_t v2;
  NSObject *v4;
  const __CFString *v5;
  int v6;
  const __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v1 = *(unsigned __int8 *)(a1 + 40);
  v2 = *(_QWORD *)(a1 + 32);
  if (v1 != *(unsigned __int8 *)(v2 + 8))
  {
    *(_BYTE *)(v2 + 8) = v1;
    v4 = ThreadNetworkLoggingCategory(0);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      if (*(_BYTE *)(a1 + 40))
        v5 = CFSTR("true");
      else
        v5 = CFSTR("false");
      v6 = 138412290;
      v7 = v5;
      _os_log_impl(&dword_1CD04F000, v4, OS_LOG_TYPE_INFO, "CTCS XPC Client - isConnected: %@", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (BOOL)getConnectionEntitlementValidity:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  _QWORD v9[6];
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v5 = dispatch_semaphore_create(0);
  v6 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __45__THClient_getConnectionEntitlementValidity___block_invoke;
  v10[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v10[4] = v5;
  -[THClient clientProxyWithErrorHandler:](self, "clientProxyWithErrorHandler:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __45__THClient_getConnectionEntitlementValidity___block_invoke_30;
  v9[3] = &unk_1E89925C0;
  v9[4] = &v11;
  v9[5] = v5;
  objc_msgSend(v7, "isConnectionValid:completion:", v4, v9);
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_release(v5);
  LOBYTE(v5) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)v5;
}

void __45__THClient_getConnectionEntitlementValidity___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  v4 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __45__THClient_getConnectionEntitlementValidity___block_invoke_cold_1();
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __45__THClient_getConnectionEntitlementValidity___block_invoke_30(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;

  v5 = a3;
  v6 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    __45__THClient_getConnectionEntitlementValidity___block_invoke_30_cold_1();
  v7 = *(NSObject **)(a1 + 40);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  dispatch_semaphore_signal(v7);

}

- (BOOL)getConnectionEntitlementValidity
{
  NSObject *v3;
  uint64_t v4;
  void *v5;
  _QWORD v7[6];
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v3 = dispatch_semaphore_create(0);
  v4 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __44__THClient_getConnectionEntitlementValidity__block_invoke;
  v8[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v8[4] = v3;
  -[THClient clientProxyWithErrorHandler:](self, "clientProxyWithErrorHandler:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  v7[1] = 3221225472;
  v7[2] = __44__THClient_getConnectionEntitlementValidity__block_invoke_31;
  v7[3] = &unk_1E89925C0;
  v7[4] = &v9;
  v7[5] = v3;
  objc_msgSend(v5, "isConnectionValid:", v7);
  dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_release(v3);
  LOBYTE(v3) = *((_BYTE *)v10 + 24);

  _Block_object_dispose(&v9, 8);
  return (char)v3;
}

void __44__THClient_getConnectionEntitlementValidity__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  v4 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __44__THClient_getConnectionEntitlementValidity__block_invoke_cold_1();
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __44__THClient_getConnectionEntitlementValidity__block_invoke_31(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;

  v5 = a3;
  v6 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    __44__THClient_getConnectionEntitlementValidity__block_invoke_31_cold_1();
  v7 = *(NSObject **)(a1 + 40);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  dispatch_semaphore_signal(v7);

}

- (id)asynchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[THClient xpcConnection](self, "xpcConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __58__THClient_asynchronousRemoteObjectProxyWithErrorHandler___block_invoke;
  v9[3] = &unk_1E8992438;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __58__THClient_asynchronousRemoteObjectProxyWithErrorHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v3, "description");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_1CD04F000, v4, OS_LOG_TYPE_INFO, "Connection failed while trying to get async remote object proxy (%@)\n", (uint8_t *)&v7, 0xCu);

  }
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);

}

- (void)ctcsStoreThreadNetworkCredentialActiveDataSetInternally:(id)a3 network:(id)a4 credentialsDataSet:(id)a5 waitForSync:(BOOL)a6 completion:(id)a7
{
  _BOOL8 v7;
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v7 = a6;
  v30 = *MEMORY[0x1E0C80C00];
  v12 = a7;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  v16 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v27 = "-[THClient ctcsStoreThreadNetworkCredentialActiveDataSetInternally:network:credentialsDataSet:waitForSync:completion:]";
    v28 = 1024;
    v29 = 436;
    _os_log_impl(&dword_1CD04F000, v16, OS_LOG_TYPE_INFO, "Client: %s:%d - Calling Server remoteObjectProxyWithErrorHandler", buf, 0x12u);
  }
  -[THClient xpcConnection](self, "xpcConnection");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __118__THClient_ctcsStoreThreadNetworkCredentialActiveDataSetInternally_network_credentialsDataSet_waitForSync_completion___block_invoke;
  v24[3] = &unk_1E8992438;
  v19 = v12;
  v25 = v19;
  objc_msgSend(v17, "remoteObjectProxyWithErrorHandler:", v24);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v22[0] = v18;
  v22[1] = 3221225472;
  v22[2] = __118__THClient_ctcsStoreThreadNetworkCredentialActiveDataSetInternally_network_credentialsDataSet_waitForSync_completion___block_invoke_32;
  v22[3] = &unk_1E89925E8;
  v23 = v19;
  v21 = v19;
  objc_msgSend(v20, "ctcsServerStoreThreadNetworkCredentialActiveDataSetInternally:network:credentialsDataSet:waitForSync:completion:", v15, v14, v13, v7, v22);

}

void __118__THClient_ctcsStoreThreadNetworkCredentialActiveDataSetInternally_network_credentialsDataSet_waitForSync_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  v4 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __118__THClient_ctcsStoreThreadNetworkCredentialActiveDataSetInternally_network_credentialsDataSet_waitForSync_completion___block_invoke_cold_1();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __118__THClient_ctcsStoreThreadNetworkCredentialActiveDataSetInternally_network_credentialsDataSet_waitForSync_completion___block_invoke_32(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)ctcsDeleteActiveDataSetRecordWithUniqueIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  v8 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v19 = "-[THClient ctcsDeleteActiveDataSetRecordWithUniqueIdentifier:completion:]";
    v20 = 1024;
    v21 = 451;
    _os_log_impl(&dword_1CD04F000, v8, OS_LOG_TYPE_INFO, "Client: %s:%d - Calling Server remoteObjectProxyWithErrorHandler", buf, 0x12u);
  }
  -[THClient xpcConnection](self, "xpcConnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __73__THClient_ctcsDeleteActiveDataSetRecordWithUniqueIdentifier_completion___block_invoke;
  v16[3] = &unk_1E8992438;
  v11 = v6;
  v17 = v11;
  objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = __73__THClient_ctcsDeleteActiveDataSetRecordWithUniqueIdentifier_completion___block_invoke_34;
  v14[3] = &unk_1E8992438;
  v15 = v11;
  v13 = v11;
  objc_msgSend(v12, "ctcsServerDeleteActiveDataSetRecordWithUniqueIdentifier:completion:", v7, v14);

}

void __73__THClient_ctcsDeleteActiveDataSetRecordWithUniqueIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  v4 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __73__THClient_ctcsDeleteActiveDataSetRecordWithUniqueIdentifier_completion___block_invoke_cold_1();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __73__THClient_ctcsDeleteActiveDataSetRecordWithUniqueIdentifier_completion___block_invoke_34(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)ctcsRetrieveActiveDataSetRecordWithUniqueIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  v8 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v19 = "-[THClient ctcsRetrieveActiveDataSetRecordWithUniqueIdentifier:completion:]";
    v20 = 1024;
    v21 = 466;
    _os_log_impl(&dword_1CD04F000, v8, OS_LOG_TYPE_INFO, "Client: %s:%d - Calling Server remoteObjectProxyWithErrorHandler", buf, 0x12u);
  }
  -[THClient xpcConnection](self, "xpcConnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __75__THClient_ctcsRetrieveActiveDataSetRecordWithUniqueIdentifier_completion___block_invoke;
  v16[3] = &unk_1E8992438;
  v11 = v6;
  v17 = v11;
  objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = __75__THClient_ctcsRetrieveActiveDataSetRecordWithUniqueIdentifier_completion___block_invoke_35;
  v14[3] = &unk_1E8992610;
  v15 = v11;
  v13 = v11;
  objc_msgSend(v12, "ctcsServerRetrieveActiveDataSetRecordWithUniqueIdentifier:completion:", v7, v14);

}

void __75__THClient_ctcsRetrieveActiveDataSetRecordWithUniqueIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  v4 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __75__THClient_ctcsRetrieveActiveDataSetRecordWithUniqueIdentifier_completion___block_invoke_cold_1();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __75__THClient_ctcsRetrieveActiveDataSetRecordWithUniqueIdentifier_completion___block_invoke_35(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)ctcsRetrievePreferredNetworkInternallyWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v16 = "-[THClient ctcsRetrievePreferredNetworkInternallyWithCompletion:]";
    v17 = 1024;
    v18 = 480;
    _os_log_impl(&dword_1CD04F000, v5, OS_LOG_TYPE_INFO, "Client: %s:%d - Calling Server remoteObjectProxyWithErrorHandler", buf, 0x12u);
  }
  -[THClient xpcConnection](self, "xpcConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __65__THClient_ctcsRetrievePreferredNetworkInternallyWithCompletion___block_invoke;
  v13[3] = &unk_1E8992438;
  v8 = v4;
  v14 = v8;
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __65__THClient_ctcsRetrievePreferredNetworkInternallyWithCompletion___block_invoke_37;
  v11[3] = &unk_1E8992610;
  v12 = v8;
  v10 = v8;
  objc_msgSend(v9, "ctcsServerRetrievePreferredNetworkInternallyWithCompletion:", v11);

}

void __65__THClient_ctcsRetrievePreferredNetworkInternallyWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  v4 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __65__THClient_ctcsRetrievePreferredNetworkInternallyWithCompletion___block_invoke_cold_1();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __65__THClient_ctcsRetrievePreferredNetworkInternallyWithCompletion___block_invoke_37(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)ctcsRetrieveOrGeneratePreferredNetworkInternallyWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v16 = "-[THClient ctcsRetrieveOrGeneratePreferredNetworkInternallyWithCompletion:]";
    v17 = 1024;
    v18 = 494;
    _os_log_impl(&dword_1CD04F000, v5, OS_LOG_TYPE_INFO, "Client: %s:%d - Calling Server remoteObjectProxyWithErrorHandler", buf, 0x12u);
  }
  -[THClient xpcConnection](self, "xpcConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __75__THClient_ctcsRetrieveOrGeneratePreferredNetworkInternallyWithCompletion___block_invoke;
  v13[3] = &unk_1E8992438;
  v8 = v4;
  v14 = v8;
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __75__THClient_ctcsRetrieveOrGeneratePreferredNetworkInternallyWithCompletion___block_invoke_38;
  v11[3] = &unk_1E8992610;
  v12 = v8;
  v10 = v8;
  objc_msgSend(v9, "ctcsServerRetrieveOrGeneratePreferredNetworkInternallyWithCompletion:", v11);

}

void __75__THClient_ctcsRetrieveOrGeneratePreferredNetworkInternallyWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  v4 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __75__THClient_ctcsRetrieveOrGeneratePreferredNetworkInternallyWithCompletion___block_invoke_cold_1();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __75__THClient_ctcsRetrieveOrGeneratePreferredNetworkInternallyWithCompletion___block_invoke_38(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)ctcsDeletePreferredNetworkWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v16 = "-[THClient ctcsDeletePreferredNetworkWithCompletion:]";
    v17 = 1024;
    v18 = 509;
    _os_log_impl(&dword_1CD04F000, v5, OS_LOG_TYPE_INFO, "Client: %s:%d - Calling Server remoteObjectProxyWithErrorHandler", buf, 0x12u);
  }
  -[THClient xpcConnection](self, "xpcConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __53__THClient_ctcsDeletePreferredNetworkWithCompletion___block_invoke;
  v13[3] = &unk_1E8992438;
  v8 = v4;
  v14 = v8;
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __53__THClient_ctcsDeletePreferredNetworkWithCompletion___block_invoke_39;
  v11[3] = &unk_1E8992438;
  v12 = v8;
  v10 = v8;
  objc_msgSend(v9, "ctcsServerDeletePreferredNetworkWithCompletion:", v11);

}

void __53__THClient_ctcsDeletePreferredNetworkWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  v4 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __53__THClient_ctcsDeletePreferredNetworkWithCompletion___block_invoke_cold_1();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __53__THClient_ctcsDeletePreferredNetworkWithCompletion___block_invoke_39(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)ctcsCleanPreferredAndFrozenThreadNetworksWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v16 = "-[THClient ctcsCleanPreferredAndFrozenThreadNetworksWithCompletion:]";
    v17 = 1024;
    v18 = 524;
    _os_log_impl(&dword_1CD04F000, v5, OS_LOG_TYPE_INFO, "Client: %s:%d - Calling Server remoteObjectProxyWithErrorHandler", buf, 0x12u);
  }
  -[THClient xpcConnection](self, "xpcConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __68__THClient_ctcsCleanPreferredAndFrozenThreadNetworksWithCompletion___block_invoke;
  v13[3] = &unk_1E8992438;
  v8 = v4;
  v14 = v8;
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __68__THClient_ctcsCleanPreferredAndFrozenThreadNetworksWithCompletion___block_invoke_40;
  v11[3] = &unk_1E8992438;
  v12 = v8;
  v10 = v8;
  objc_msgSend(v9, "ctcsServerCleanPreferredAndFrozenThreadNetworksWithCompletion:", v11);

}

void __68__THClient_ctcsCleanPreferredAndFrozenThreadNetworksWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  v4 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __68__THClient_ctcsCleanPreferredAndFrozenThreadNetworksWithCompletion___block_invoke_cold_1();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __68__THClient_ctcsCleanPreferredAndFrozenThreadNetworksWithCompletion___block_invoke_40(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)ctcsCleanKeychainThreadNetworksWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v16 = "-[THClient ctcsCleanKeychainThreadNetworksWithCompletion:]";
    v17 = 1024;
    v18 = 538;
    _os_log_impl(&dword_1CD04F000, v5, OS_LOG_TYPE_INFO, "Client: %s:%d - Calling Server remoteObjectProxyWithErrorHandler", buf, 0x12u);
  }
  -[THClient xpcConnection](self, "xpcConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __58__THClient_ctcsCleanKeychainThreadNetworksWithCompletion___block_invoke;
  v13[3] = &unk_1E8992438;
  v8 = v4;
  v14 = v8;
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __58__THClient_ctcsCleanKeychainThreadNetworksWithCompletion___block_invoke_41;
  v11[3] = &unk_1E8992438;
  v12 = v8;
  v10 = v8;
  objc_msgSend(v9, "ctcsServerCleanKeychainThreadNetworksWithCompletion:", v11);

}

void __58__THClient_ctcsCleanKeychainThreadNetworksWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  v4 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __58__THClient_ctcsCleanKeychainThreadNetworksWithCompletion___block_invoke_cold_1();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __58__THClient_ctcsCleanKeychainThreadNetworksWithCompletion___block_invoke_41(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)storeCredentialsForBorderAgentInternally:(id)a3 networkName:(id)a4 extendedPANId:(id)a5 activeOperationalDataSet:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void (**v16)(id, void *);
  void *v17;
  void *v18;
  void (**v19)(id, void *);
  void *v20;
  THThreadNetworkBorderAgent *v21;
  THThreadNetwork *v22;
  THThreadNetworkCredentialsDataSet *v23;
  THThreadNetworkCredentialsDataSet *v24;
  void *v25;
  void (**v26)(id, void *);
  _QWORD v27[4];
  void (**v28)(id, void *);
  _QWORD v29[4];
  void (**v30)(id, void *);

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = (void (**)(id, void *))a7;
  if (!v14 || !v13 || !v12 || !v15)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "storeError:description:", 4, CFSTR("Invalid input parameter"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v16[2](v16, v17);

  }
  -[THClient xpcConnection](self, "xpcConnection");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __115__THClient_storeCredentialsForBorderAgentInternally_networkName_extendedPANId_activeOperationalDataSet_completion___block_invoke;
  v29[3] = &unk_1E8992438;
  v19 = v16;
  v30 = v19;
  objc_msgSend(v18, "remoteObjectProxyWithErrorHandler:", v29);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = -[THThreadNetworkBorderAgent initWithBaDiscrId:]([THThreadNetworkBorderAgent alloc], "initWithBaDiscrId:", v12);
  v22 = -[THThreadNetwork initWithName:extendedPANID:]([THThreadNetwork alloc], "initWithName:extendedPANID:", v13, v14);
  v23 = -[THThreadNetworkCredentialsDataSet initWithDataSetArray:userInfo:]([THThreadNetworkCredentialsDataSet alloc], "initWithDataSetArray:userInfo:", v15, 0);
  v24 = v23;
  if (!v21 || !v22 || !v23)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "storeError:description:", 4, CFSTR("Invalid input parameter caused error"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v19[2](v19, v25);

  }
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __115__THClient_storeCredentialsForBorderAgentInternally_networkName_extendedPANId_activeOperationalDataSet_completion___block_invoke_49;
  v27[3] = &unk_1E89925E8;
  v28 = v19;
  v26 = v19;
  objc_msgSend(v20, "ctcsServerStoreThreadNetworkCredentialActiveDataSetInternally:network:credentialsDataSet:waitForSync:completion:", v21, v22, v24, 0, v27);

}

void __115__THClient_storeCredentialsForBorderAgentInternally_networkName_extendedPANId_activeOperationalDataSet_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  v4 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __115__THClient_storeCredentialsForBorderAgentInternally_networkName_extendedPANId_activeOperationalDataSet_completion___block_invoke_cold_1();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __115__THClient_storeCredentialsForBorderAgentInternally_networkName_extendedPANId_activeOperationalDataSet_completion___block_invoke_49(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)retrieveActiveDataSetRecordInternallyForExtendedPANID:(id)a3 completion:(id)a4
{
  void (**v6)(id, _QWORD, void *);
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void (**v12)(id, _QWORD, void *);
  void *v13;
  void (**v14)(id, _QWORD, void *);
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, _QWORD, void *))a4;
  v7 = a3;
  v8 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v20 = "-[THClient retrieveActiveDataSetRecordInternallyForExtendedPANID:completion:]";
    v21 = 1024;
    v22 = 586;
    _os_log_impl(&dword_1CD04F000, v8, OS_LOG_TYPE_INFO, "Client: %s:%d - Calling Server remoteObjectProxyWithErrorHandler", buf, 0x12u);
  }
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "storeError:description:", 4, CFSTR("Invalid input parameter"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, 0, v9);

  }
  -[THClient xpcConnection](self, "xpcConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __77__THClient_retrieveActiveDataSetRecordInternallyForExtendedPANID_completion___block_invoke;
  v17[3] = &unk_1E8992438;
  v12 = v6;
  v18 = v12;
  objc_msgSend(v10, "remoteObjectProxyWithErrorHandler:", v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __77__THClient_retrieveActiveDataSetRecordInternallyForExtendedPANID_completion___block_invoke_50;
  v15[3] = &unk_1E8992610;
  v16 = v12;
  v14 = v12;
  objc_msgSend(v13, "ctcsServerRetrieveActiveDataSetRecordInternallyWithXPANId:completion:", v7, v15);

}

void __77__THClient_retrieveActiveDataSetRecordInternallyForExtendedPANID_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  v4 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __77__THClient_retrieveActiveDataSetRecordInternallyForExtendedPANID_completion___block_invoke_cold_1();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __77__THClient_retrieveActiveDataSetRecordInternallyForExtendedPANID_completion___block_invoke_50(uint64_t a1, void *a2, void *a3)
{
  id v5;
  THCredentials *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  void *v29;
  id v30;

  v30 = a2;
  v5 = a3;
  if (v30)
  {
    v27 = a1;
    v28 = v5;
    v6 = [THCredentials alloc];
    objc_msgSend(v30, "network");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "networkName");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "network");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "extendedPANID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "borderAgent");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "discriminatorId");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "credentialsDataSet");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "dataSetArray");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "credentials");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "PSKc");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "credentials");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "masterKey");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "credentials");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "channel");
    objc_msgSend(v30, "credentials");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "PANID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "creationDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "lastModificationDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v17) = v10;
    v15 = -[THCredentials initThreadCredentials:extendedPANID:borderAgentID:activeOperationalDataSet:PSKC:networkKey:channel:panID:creationDate:lastModificationDate:](v6, "initThreadCredentials:extendedPANID:borderAgentID:activeOperationalDataSet:PSKC:networkKey:channel:panID:creationDate:lastModificationDate:", v29, v21, v19, v18, v7, v8, v17, v12, v13, v14);

    if (v15)
    {
      v5 = v28;
      (*(void (**)(void))(*(_QWORD *)(v27 + 32) + 16))();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "storeError:description:", 3, CFSTR("Failed to retrieve record"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(v27 + 32) + 16))();

      v5 = v28;
    }

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (void)updatePreferredCredentialsInternally:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v16 = "-[THClient updatePreferredCredentialsInternally:]";
    v17 = 1024;
    v18 = 620;
    _os_log_impl(&dword_1CD04F000, v5, OS_LOG_TYPE_INFO, "Client: %s:%d - Calling Server remoteObjectProxyWithErrorHandler", buf, 0x12u);
  }
  -[THClient xpcConnection](self, "xpcConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __49__THClient_updatePreferredCredentialsInternally___block_invoke;
  v13[3] = &unk_1E8992438;
  v8 = v4;
  v14 = v8;
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __49__THClient_updatePreferredCredentialsInternally___block_invoke_54;
  v11[3] = &unk_1E8992638;
  v12 = v8;
  v10 = v8;
  objc_msgSend(v9, "ctcsUpdatePreferredNetworkInternallyWithCompletion:", v11);

}

void __49__THClient_updatePreferredCredentialsInternally___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  v4 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __49__THClient_updatePreferredCredentialsInternally___block_invoke_cold_1();
  (*(void (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v3 != 0);

}

uint64_t __49__THClient_updatePreferredCredentialsInternally___block_invoke_54(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)validateAODInternally:(id)a3 completion:(id)a4
{
  void (**v6)(id, _QWORD, void *);
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void (**v12)(id, _QWORD, void *);
  void *v13;
  void (**v14)(id, _QWORD, void *);
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, _QWORD, void *))a4;
  v7 = a3;
  v8 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v20 = "-[THClient validateAODInternally:completion:]";
    v21 = 1024;
    v22 = 635;
    _os_log_impl(&dword_1CD04F000, v8, OS_LOG_TYPE_INFO, "Client: %s:%d - Calling Server remoteObjectProxyWithErrorHandler", buf, 0x12u);
  }
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "storeError:description:", 4, CFSTR("Invalid input parameter"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, 0, v9);

  }
  -[THClient xpcConnection](self, "xpcConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __45__THClient_validateAODInternally_completion___block_invoke;
  v17[3] = &unk_1E8992438;
  v12 = v6;
  v18 = v12;
  objc_msgSend(v10, "remoteObjectProxyWithErrorHandler:", v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __45__THClient_validateAODInternally_completion___block_invoke_55;
  v15[3] = &unk_1E8992610;
  v16 = v12;
  v14 = v12;
  objc_msgSend(v13, "ctcsValidateAODInternally:completion:", v7, v15);

}

void __45__THClient_validateAODInternally_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  v4 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __45__THClient_validateAODInternally_completion___block_invoke_cold_1();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __45__THClient_validateAODInternally_completion___block_invoke_55(uint64_t a1, void *a2, void *a3)
{
  id v5;
  THCredentials *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  void *v29;
  id v30;

  v30 = a2;
  v5 = a3;
  if (v30)
  {
    v27 = a1;
    v28 = v5;
    v6 = [THCredentials alloc];
    objc_msgSend(v30, "network");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "networkName");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "network");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "extendedPANID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "borderAgent");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "discriminatorId");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "credentialsDataSet");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "dataSetArray");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "credentials");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "PSKc");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "credentials");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "masterKey");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "credentials");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "channel");
    objc_msgSend(v30, "credentials");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "PANID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "creationDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "lastModificationDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v17) = v10;
    v15 = -[THCredentials initThreadCredentials:extendedPANID:borderAgentID:activeOperationalDataSet:PSKC:networkKey:channel:panID:creationDate:lastModificationDate:](v6, "initThreadCredentials:extendedPANID:borderAgentID:activeOperationalDataSet:PSKC:networkKey:channel:panID:creationDate:lastModificationDate:", v29, v21, v19, v18, v7, v8, v17, v12, v13, v14);

    if (v15)
    {
      v5 = v28;
      (*(void (**)(void))(*(_QWORD *)(v27 + 32) + 16))();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "storeError:description:", 3, CFSTR("Failed to retrieve record"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(v27 + 32) + 16))();

      v5 = v28;
    }

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (void)deleteCredentialsForBorderAgent:(NSData *)borderAgentID completion:(void *)completion
{
  NSData *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = borderAgentID;
  v7 = completion;
  v8 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v19 = "-[THClient deleteCredentialsForBorderAgent:completion:]";
    v20 = 1024;
    v21 = 672;
    _os_log_impl(&dword_1CD04F000, v8, OS_LOG_TYPE_INFO, "Client: %s:%d - Calling Server remoteObjectProxyWithErrorHandler", buf, 0x12u);
  }
  if (v6)
  {
    -[THClient xpcConnection](self, "xpcConnection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __55__THClient_deleteCredentialsForBorderAgent_completion___block_invoke;
    v16[3] = &unk_1E8992438;
    v11 = v7;
    v17 = v11;
    objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v16);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v14[0] = v10;
    v14[1] = 3221225472;
    v14[2] = __55__THClient_deleteCredentialsForBorderAgent_completion___block_invoke_56;
    v14[3] = &unk_1E8992438;
    v15 = v11;
    objc_msgSend(v12, "ctcsServerDeleteActiveDataSetRecordForThreadBorderAgent:completion:", v6, v14);

    v13 = v17;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "storeError:description:", 4, CFSTR("Invalid input parameter"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void *, void *))v7 + 2))(v7, v13);
  }

}

void __55__THClient_deleteCredentialsForBorderAgent_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  v4 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __55__THClient_deleteCredentialsForBorderAgent_completion___block_invoke_cold_1();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __55__THClient_deleteCredentialsForBorderAgent_completion___block_invoke_56(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)storeCredentialsForBorderAgent:(NSData *)borderAgentID activeOperationalDataSet:(NSData *)activeOperationalDataSet completion:(void *)completion
{
  NSData *v8;
  NSData *v9;
  void (**v10)(void *, void *);
  void *v11;
  void *v12;
  uint64_t v13;
  void (**v14)(void *, void *);
  void *v15;
  void (**v16)(void *, void *);
  _QWORD v17[4];
  void (**v18)(void *, void *);
  _QWORD v19[4];
  void (**v20)(void *, void *);

  v8 = borderAgentID;
  v9 = activeOperationalDataSet;
  v10 = completion;
  if (!v8 || !v9)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "storeError:description:", 4, CFSTR("Invalid input parameter"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, v11);

  }
  -[THClient xpcConnection](self, "xpcConnection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __79__THClient_storeCredentialsForBorderAgent_activeOperationalDataSet_completion___block_invoke;
  v19[3] = &unk_1E8992438;
  v14 = v10;
  v20 = v14;
  objc_msgSend(v12, "remoteObjectProxyWithErrorHandler:", v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = v13;
  v17[1] = 3221225472;
  v17[2] = __79__THClient_storeCredentialsForBorderAgent_activeOperationalDataSet_completion___block_invoke_57;
  v17[3] = &unk_1E89925E8;
  v18 = v14;
  v16 = v14;
  objc_msgSend(v15, "ctcsServerStoreThreadNetworkCredentialActiveDataSet:credentialsDataSet:completion:", v8, v9, v17);

}

void __79__THClient_storeCredentialsForBorderAgent_activeOperationalDataSet_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  v4 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __79__THClient_storeCredentialsForBorderAgent_activeOperationalDataSet_completion___block_invoke_cold_1();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __79__THClient_storeCredentialsForBorderAgent_activeOperationalDataSet_completion___block_invoke_57(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;

  v4 = a3;
  v5 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __79__THClient_storeCredentialsForBorderAgent_activeOperationalDataSet_completion___block_invoke_57_cold_1();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)storeCachedAODasPreferredNetwork:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  void *v9;
  uint64_t v10;
  void (**v11)(id, void *);
  void *v12;
  void (**v13)(id, void *);
  _QWORD v14[4];
  void (**v15)(id, void *);
  _QWORD v16[4];
  void (**v17)(id, void *);

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "storeError:description:", 4, CFSTR("Invalid input parameter"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v8);

  }
  -[THClient xpcConnection](self, "xpcConnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __56__THClient_storeCachedAODasPreferredNetwork_completion___block_invoke;
  v16[3] = &unk_1E8992438;
  v11 = v7;
  v17 = v11;
  objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = __56__THClient_storeCachedAODasPreferredNetwork_completion___block_invoke_58;
  v14[3] = &unk_1E89925E8;
  v15 = v11;
  v13 = v11;
  objc_msgSend(v12, "ctcsServerStoreCachedAODasPreferredNetwork:completion:", v6, v14);

}

void __56__THClient_storeCachedAODasPreferredNetwork_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  v4 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __56__THClient_storeCachedAODasPreferredNetwork_completion___block_invoke_cold_1();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __56__THClient_storeCachedAODasPreferredNetwork_completion___block_invoke_58(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;

  v5 = a2;
  v6 = a3;
  v7 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    __56__THClient_storeCachedAODasPreferredNetwork_completion___block_invoke_58_cold_1();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)retrieveAllCredentials:(void *)completion
{
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = completion;
  v5 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v16 = "-[THClient retrieveAllCredentials:]";
    v17 = 1024;
    v18 = 732;
    _os_log_impl(&dword_1CD04F000, v5, OS_LOG_TYPE_INFO, "Client: %s:%d - Calling Server remoteObjectProxyWithErrorHandler", buf, 0x12u);
  }
  -[THClient xpcConnection](self, "xpcConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __35__THClient_retrieveAllCredentials___block_invoke;
  v13[3] = &unk_1E8992438;
  v8 = v4;
  v14 = v8;
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __35__THClient_retrieveAllCredentials___block_invoke_59;
  v11[3] = &unk_1E8992660;
  v12 = v8;
  v10 = v8;
  objc_msgSend(v9, "ctcsServerRetrieveAllActiveDataSetRecordsWithActiveFlag:completion:", 0, v11);

}

void __35__THClient_retrieveAllCredentials___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  v4 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __35__THClient_retrieveAllCredentials___block_invoke_cold_1();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __35__THClient_retrieveAllCredentials___block_invoke_59(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  THCredentials *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  id v27;
  id obj;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5 && objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v8 = v5;
    v31 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
    if (v31)
    {
      v29 = *(_QWORD *)v44;
      v30 = v7;
      v26 = v6;
      v27 = v5;
      v25 = a1;
      obj = v8;
      while (2)
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v44 != v29)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v9);
          if (!v10)
            goto LABEL_14;
          v32 = v9;
          v11 = [THCredentials alloc];
          objc_msgSend(v10, "network");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "networkName");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "network");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "extendedPANID");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "borderAgent");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "discriminatorId");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "credentialsDataSet");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "dataSetArray");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "credentials");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "PSKc");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "credentials");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "masterKey");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "credentials");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "channel");
          objc_msgSend(v10, "credentials");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "PANID");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "creationDate");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "lastModificationDate");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v24) = v15;
          v20 = -[THCredentials initThreadCredentials:extendedPANID:borderAgentID:activeOperationalDataSet:PSKC:networkKey:channel:panID:creationDate:lastModificationDate:](v11, "initThreadCredentials:extendedPANID:borderAgentID:activeOperationalDataSet:PSKC:networkKey:channel:panID:creationDate:lastModificationDate:", v42, v41, v34, v33, v12, v13, v24, v17, v18, v19);

          if (!v20)
          {
LABEL_14:
            objc_msgSend(MEMORY[0x1E0CB35C8], "storeError:description:", 3, CFSTR("Failed to retrieve record"));
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            (*(void (**)(void))(*(_QWORD *)(v25 + 32) + 16))();
            v5 = v27;
            v7 = v30;

            v6 = v26;
            v22 = obj;
            goto LABEL_15;
          }
          v7 = v30;
          objc_msgSend(v30, "addObject:", v20);

          v9 = v32 + 1;
        }
        while (v31 != v32 + 1);
        v8 = obj;
        v6 = v26;
        v5 = v27;
        a1 = v25;
        v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
        if (v31)
          continue;
        break;
      }
    }

    v21 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v7);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v21 + 16))(v21, v22, 0);
LABEL_15:

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (void)retrieveCredentialsForBorderAgent:(NSData *)borderAgentID completion:(void *)completion
{
  void (**v6)(void *, _QWORD, void *);
  NSData *v7;
  NSObject *v8;
  THThreadNetworkBorderAgent *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void (**v13)(void *, _QWORD, void *);
  void *v14;
  void (**v15)(void *, _QWORD, void *);
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = completion;
  v7 = borderAgentID;
  v8 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v21 = "-[THClient retrieveCredentialsForBorderAgent:completion:]";
    v22 = 1024;
    v23 = 775;
    _os_log_impl(&dword_1CD04F000, v8, OS_LOG_TYPE_INFO, "Client: %s:%d - Calling Server remoteObjectProxyWithErrorHandler", buf, 0x12u);
  }
  v9 = -[THThreadNetworkBorderAgent initWithBaDiscrId:]([THThreadNetworkBorderAgent alloc], "initWithBaDiscrId:", v7);

  if (!v7 || !v9)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "storeError:description:", 4, CFSTR("Invalid input parameter"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, 0, v10);

  }
  -[THClient xpcConnection](self, "xpcConnection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __57__THClient_retrieveCredentialsForBorderAgent_completion___block_invoke;
  v18[3] = &unk_1E8992438;
  v13 = v6;
  v19 = v13;
  objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = v12;
  v16[1] = 3221225472;
  v16[2] = __57__THClient_retrieveCredentialsForBorderAgent_completion___block_invoke_63;
  v16[3] = &unk_1E8992610;
  v17 = v13;
  v15 = v13;
  objc_msgSend(v14, "ctcsServerRetrieveActiveDataSetRecordForThreadBorderAgent:completion:", v9, v16);

}

void __57__THClient_retrieveCredentialsForBorderAgent_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  v4 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __57__THClient_retrieveCredentialsForBorderAgent_completion___block_invoke_cold_1();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __57__THClient_retrieveCredentialsForBorderAgent_completion___block_invoke_63(uint64_t a1, void *a2, void *a3)
{
  id v5;
  THCredentials *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  void *v29;
  id v30;

  v30 = a2;
  v5 = a3;
  if (v30)
  {
    v27 = a1;
    v28 = v5;
    v6 = [THCredentials alloc];
    objc_msgSend(v30, "network");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "networkName");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "network");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "extendedPANID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "borderAgent");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "discriminatorId");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "credentialsDataSet");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "dataSetArray");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "credentials");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "PSKc");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "credentials");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "masterKey");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "credentials");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "channel");
    objc_msgSend(v30, "credentials");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "PANID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "creationDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "lastModificationDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v17) = v10;
    v15 = -[THCredentials initThreadCredentials:extendedPANID:borderAgentID:activeOperationalDataSet:PSKC:networkKey:channel:panID:creationDate:lastModificationDate:](v6, "initThreadCredentials:extendedPANID:borderAgentID:activeOperationalDataSet:PSKC:networkKey:channel:panID:creationDate:lastModificationDate:", v29, v21, v19, v18, v7, v8, v17, v12, v13, v14);

    if (v15)
    {
      v5 = v28;
      (*(void (**)(void))(*(_QWORD *)(v27 + 32) + 16))();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "storeError:description:", 3, CFSTR("Failed to retrieve record"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(v27 + 32) + 16))();

      v5 = v28;
    }

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (void)retrievePreferredCredentials:(void *)completion
{
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = completion;
  v5 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v16 = "-[THClient retrievePreferredCredentials:]";
    v17 = 1024;
    v18 = 814;
    _os_log_impl(&dword_1CD04F000, v5, OS_LOG_TYPE_INFO, "Client: %s:%d - Calling Server remoteObjectProxyWithErrorHandler", buf, 0x12u);
  }
  -[THClient xpcConnection](self, "xpcConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __41__THClient_retrievePreferredCredentials___block_invoke;
  v13[3] = &unk_1E8992438;
  v8 = v4;
  v14 = v8;
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __41__THClient_retrievePreferredCredentials___block_invoke_64;
  v11[3] = &unk_1E8992610;
  v12 = v8;
  v10 = v8;
  objc_msgSend(v9, "ctcsServerRetrievePreferredNetworkWithCompletion:", v11);

}

void __41__THClient_retrievePreferredCredentials___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  v4 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __41__THClient_retrievePreferredCredentials___block_invoke_cold_1();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __41__THClient_retrievePreferredCredentials___block_invoke_64(uint64_t a1, void *a2, void *a3)
{
  id v5;
  THCredentials *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  void *v29;
  id v30;

  v30 = a2;
  v5 = a3;
  if (v30)
  {
    v27 = a1;
    v28 = v5;
    v6 = [THCredentials alloc];
    objc_msgSend(v30, "network");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "networkName");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "network");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "extendedPANID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "borderAgent");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "discriminatorId");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "credentialsDataSet");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "dataSetArray");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "credentials");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "PSKc");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "credentials");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "masterKey");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "credentials");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "channel");
    objc_msgSend(v30, "credentials");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "PANID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "creationDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "lastModificationDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v17) = v10;
    v15 = -[THCredentials initThreadCredentials:extendedPANID:borderAgentID:activeOperationalDataSet:PSKC:networkKey:channel:panID:creationDate:lastModificationDate:](v6, "initThreadCredentials:extendedPANID:borderAgentID:activeOperationalDataSet:PSKC:networkKey:channel:panID:creationDate:lastModificationDate:", v29, v21, v19, v18, v7, v8, v17, v12, v13, v14);

    if (v15)
    {
      v5 = v28;
      (*(void (**)(void))(*(_QWORD *)(v27 + 32) + 16))();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "storeError:description:", 3, CFSTR("Failed to retrieve record"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(v27 + 32) + 16))();

      v5 = v28;
    }

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (void)retrieveCredentialsForExtendedPANID:(NSData *)extendedPANID completion:(void *)completion
{
  void (**v6)(void *, _QWORD, void *);
  NSData *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void (**v12)(void *, _QWORD, void *);
  void *v13;
  void (**v14)(void *, _QWORD, void *);
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = completion;
  v7 = extendedPANID;
  v8 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v20 = "-[THClient retrieveCredentialsForExtendedPANID:completion:]";
    v21 = 1024;
    v22 = 843;
    _os_log_impl(&dword_1CD04F000, v8, OS_LOG_TYPE_INFO, "Client: %s:%d - Calling Server remoteObjectProxyWithErrorHandler", buf, 0x12u);
  }
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "storeError:description:", 4, CFSTR("Invalid input parameter"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, 0, v9);

  }
  -[THClient xpcConnection](self, "xpcConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __59__THClient_retrieveCredentialsForExtendedPANID_completion___block_invoke;
  v17[3] = &unk_1E8992438;
  v12 = v6;
  v18 = v12;
  objc_msgSend(v10, "remoteObjectProxyWithErrorHandler:", v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __59__THClient_retrieveCredentialsForExtendedPANID_completion___block_invoke_65;
  v15[3] = &unk_1E8992610;
  v16 = v12;
  v14 = v12;
  objc_msgSend(v13, "ctcsServerRetrieveActiveDataSetRecordWithXPANId:completion:", v7, v15);

}

void __59__THClient_retrieveCredentialsForExtendedPANID_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  v4 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __59__THClient_retrieveCredentialsForExtendedPANID_completion___block_invoke_cold_1();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __59__THClient_retrieveCredentialsForExtendedPANID_completion___block_invoke_65(uint64_t a1, void *a2, void *a3)
{
  id v5;
  THCredentials *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  void *v29;
  id v30;

  v30 = a2;
  v5 = a3;
  if (v30)
  {
    v27 = a1;
    v28 = v5;
    v6 = [THCredentials alloc];
    objc_msgSend(v30, "network");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "networkName");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "network");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "extendedPANID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "borderAgent");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "discriminatorId");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "credentialsDataSet");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "dataSetArray");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "credentials");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "PSKc");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "credentials");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "masterKey");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "credentials");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "channel");
    objc_msgSend(v30, "credentials");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "PANID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "creationDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "lastModificationDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v17) = v10;
    v15 = -[THCredentials initThreadCredentials:extendedPANID:borderAgentID:activeOperationalDataSet:PSKC:networkKey:channel:panID:creationDate:lastModificationDate:](v6, "initThreadCredentials:extendedPANID:borderAgentID:activeOperationalDataSet:PSKC:networkKey:channel:panID:creationDate:lastModificationDate:", v29, v21, v19, v18, v7, v8, v17, v12, v13, v14);

    if (v15)
    {
      v5 = v28;
      (*(void (**)(void))(*(_QWORD *)(v27 + 32) + 16))();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "storeError:description:", 3, CFSTR("Failed to retrieve record"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(v27 + 32) + 16))();

      v5 = v28;
    }

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (void)retrievePreferredNetworkInternallyOnMdnsAndSig:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v16 = "-[THClient retrievePreferredNetworkInternallyOnMdnsAndSig:]";
    v17 = 1024;
    v18 = 876;
    _os_log_impl(&dword_1CD04F000, v5, OS_LOG_TYPE_INFO, "Client: %s:%d - Calling Server remoteObjectProxyWithErrorHandler", buf, 0x12u);
  }
  -[THClient xpcConnection](self, "xpcConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __59__THClient_retrievePreferredNetworkInternallyOnMdnsAndSig___block_invoke;
  v13[3] = &unk_1E8992438;
  v8 = v4;
  v14 = v8;
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __59__THClient_retrievePreferredNetworkInternallyOnMdnsAndSig___block_invoke_66;
  v11[3] = &unk_1E8992610;
  v12 = v8;
  v10 = v8;
  objc_msgSend(v9, "ctcsServerRetrievePreferredNetworkInternallyOnMdnsAndSigWithCompletion:", v11);

}

void __59__THClient_retrievePreferredNetworkInternallyOnMdnsAndSig___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  v4 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __59__THClient_retrievePreferredNetworkInternallyOnMdnsAndSig___block_invoke_cold_1();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __59__THClient_retrievePreferredNetworkInternallyOnMdnsAndSig___block_invoke_66(uint64_t a1, void *a2, void *a3)
{
  id v5;
  THCredentials *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void (*v18)(uint64_t, id, void *, id);
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id v31;
  void *v32;
  id v33;

  v33 = a2;
  v5 = a3;
  if (v33)
  {
    v30 = a1;
    v31 = v5;
    v6 = [THCredentials alloc];
    objc_msgSend(v33, "network");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "networkName");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "network");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "extendedPANID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "borderAgent");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "discriminatorId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "credentialsDataSet");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "dataSetArray");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "credentials");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "PSKc");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "credentials");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "masterKey");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "credentials");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "channel");
    objc_msgSend(v33, "credentials");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "PANID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "creationDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "lastModificationDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v20) = v11;
    v22 = -[THCredentials initThreadCredentials:extendedPANID:borderAgentID:activeOperationalDataSet:PSKC:networkKey:channel:panID:creationDate:lastModificationDate:](v6, "initThreadCredentials:extendedPANID:borderAgentID:activeOperationalDataSet:PSKC:networkKey:channel:panID:creationDate:lastModificationDate:", v32, v7, v8, v23, v21, v9, v20, v13, v14, v15);

    if (v22)
    {
      v16 = *(_QWORD *)(v30 + 32);
      objc_msgSend(v33, "uniqueIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = *(void (**)(uint64_t, id, void *, id))(v16 + 16);
      v19 = v16;
      v5 = v31;
      v18(v19, v22, v17, v31);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "storeError:description:", 3, CFSTR("Failed to retrieve record"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(v30 + 32) + 16))();
      v5 = v31;
    }

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (void)retrieveOrGeneratePreferredNetworkInternally:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v16 = "-[THClient retrieveOrGeneratePreferredNetworkInternally:]";
    v17 = 1024;
    v18 = 905;
    _os_log_impl(&dword_1CD04F000, v5, OS_LOG_TYPE_INFO, "Client: %s:%d - Calling Server remoteObjectProxyWithErrorHandler", buf, 0x12u);
  }
  -[THClient xpcConnection](self, "xpcConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __57__THClient_retrieveOrGeneratePreferredNetworkInternally___block_invoke;
  v13[3] = &unk_1E8992438;
  v8 = v4;
  v14 = v8;
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __57__THClient_retrieveOrGeneratePreferredNetworkInternally___block_invoke_67;
  v11[3] = &unk_1E8992610;
  v12 = v8;
  v10 = v8;
  objc_msgSend(v9, "ctcsServerRetrieveOrGeneratePreferredNetworkInternallyWithCompletion:", v11);

}

void __57__THClient_retrieveOrGeneratePreferredNetworkInternally___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  v4 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __57__THClient_retrieveOrGeneratePreferredNetworkInternally___block_invoke_cold_1();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __57__THClient_retrieveOrGeneratePreferredNetworkInternally___block_invoke_67(uint64_t a1, void *a2, void *a3)
{
  id v5;
  THCredentials *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void (*v18)(uint64_t, id, void *, id);
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id v31;
  void *v32;
  id v33;

  v33 = a2;
  v5 = a3;
  if (v33)
  {
    v30 = a1;
    v31 = v5;
    v6 = [THCredentials alloc];
    objc_msgSend(v33, "network");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "networkName");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "network");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "extendedPANID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "borderAgent");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "discriminatorId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "credentialsDataSet");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "dataSetArray");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "credentials");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "PSKc");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "credentials");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "masterKey");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "credentials");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "channel");
    objc_msgSend(v33, "credentials");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "PANID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "creationDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "lastModificationDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v20) = v11;
    v22 = -[THCredentials initThreadCredentials:extendedPANID:borderAgentID:activeOperationalDataSet:PSKC:networkKey:channel:panID:creationDate:lastModificationDate:](v6, "initThreadCredentials:extendedPANID:borderAgentID:activeOperationalDataSet:PSKC:networkKey:channel:panID:creationDate:lastModificationDate:", v32, v7, v8, v23, v21, v9, v20, v13, v14, v15);

    if (v22)
    {
      v16 = *(_QWORD *)(v30 + 32);
      objc_msgSend(v33, "uniqueIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = *(void (**)(uint64_t, id, void *, id))(v16 + 16);
      v19 = v16;
      v5 = v31;
      v18(v19, v22, v17, v31);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "storeError:description:", 3, CFSTR("Failed to retrieve record"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(v30 + 32) + 16))();
      v5 = v31;
    }

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (void)retrievePreferredCredentialsInternally:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v16 = "-[THClient retrievePreferredCredentialsInternally:]";
    v17 = 1024;
    v18 = 934;
    _os_log_impl(&dword_1CD04F000, v5, OS_LOG_TYPE_INFO, "Client: %s:%d - Calling Server remoteObjectProxyWithErrorHandler", buf, 0x12u);
  }
  -[THClient xpcConnection](self, "xpcConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __51__THClient_retrievePreferredCredentialsInternally___block_invoke;
  v13[3] = &unk_1E8992438;
  v8 = v4;
  v14 = v8;
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __51__THClient_retrievePreferredCredentialsInternally___block_invoke_68;
  v11[3] = &unk_1E8992610;
  v12 = v8;
  v10 = v8;
  objc_msgSend(v9, "ctcsServerRetrievePreferredNetworkInternallyWithCompletion:", v11);

}

void __51__THClient_retrievePreferredCredentialsInternally___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  v4 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __51__THClient_retrievePreferredCredentialsInternally___block_invoke_cold_1();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __51__THClient_retrievePreferredCredentialsInternally___block_invoke_68(uint64_t a1, void *a2, void *a3)
{
  id v5;
  THCredentials *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void (*v18)(uint64_t, id, void *, id);
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id v31;
  void *v32;
  id v33;

  v33 = a2;
  v5 = a3;
  if (v33)
  {
    v30 = a1;
    v31 = v5;
    v6 = [THCredentials alloc];
    objc_msgSend(v33, "network");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "networkName");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "network");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "extendedPANID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "borderAgent");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "discriminatorId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "credentialsDataSet");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "dataSetArray");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "credentials");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "PSKc");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "credentials");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "masterKey");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "credentials");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "channel");
    objc_msgSend(v33, "credentials");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "PANID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "creationDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "lastModificationDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v20) = v11;
    v22 = -[THCredentials initThreadCredentials:extendedPANID:borderAgentID:activeOperationalDataSet:PSKC:networkKey:channel:panID:creationDate:lastModificationDate:](v6, "initThreadCredentials:extendedPANID:borderAgentID:activeOperationalDataSet:PSKC:networkKey:channel:panID:creationDate:lastModificationDate:", v32, v7, v8, v23, v21, v9, v20, v13, v14, v15);

    if (v22)
    {
      v16 = *(_QWORD *)(v30 + 32);
      objc_msgSend(v33, "uniqueIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = *(void (**)(uint64_t, id, void *, id))(v16 + 16);
      v19 = v16;
      v5 = v31;
      v18(v19, v22, v17, v31);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "storeError:description:", 3, CFSTR("Failed to retrieve record"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(v30 + 32) + 16))();
      v5 = v31;
    }

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (void)retrieveCredentialsForUUID:(id)a3 completion:(id)a4
{
  void (**v6)(id, _QWORD, void *);
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void (**v12)(id, _QWORD, void *);
  void *v13;
  void (**v14)(id, _QWORD, void *);
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, _QWORD, void *))a4;
  v7 = a3;
  v8 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v20 = "-[THClient retrieveCredentialsForUUID:completion:]";
    v21 = 1024;
    v22 = 963;
    _os_log_impl(&dword_1CD04F000, v8, OS_LOG_TYPE_INFO, "Client: %s:%d - Calling Server remoteObjectProxyWithErrorHandler", buf, 0x12u);
  }
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "storeError:description:", 4, CFSTR("Invalid input parameter"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, 0, v9);

  }
  -[THClient xpcConnection](self, "xpcConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __50__THClient_retrieveCredentialsForUUID_completion___block_invoke;
  v17[3] = &unk_1E8992438;
  v12 = v6;
  v18 = v12;
  objc_msgSend(v10, "remoteObjectProxyWithErrorHandler:", v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __50__THClient_retrieveCredentialsForUUID_completion___block_invoke_69;
  v15[3] = &unk_1E8992610;
  v16 = v12;
  v14 = v12;
  objc_msgSend(v13, "ctcsServerRetrieveActiveDataSetRecordWithUniqueIdentifier:completion:", v7, v15);

}

void __50__THClient_retrieveCredentialsForUUID_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  v4 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __50__THClient_retrieveCredentialsForUUID_completion___block_invoke_cold_1();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __50__THClient_retrieveCredentialsForUUID_completion___block_invoke_69(uint64_t a1, void *a2, void *a3)
{
  id v5;
  THCredentials *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  void *v29;
  id v30;

  v30 = a2;
  v5 = a3;
  if (v30)
  {
    v27 = a1;
    v28 = v5;
    v6 = [THCredentials alloc];
    objc_msgSend(v30, "network");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "networkName");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "network");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "extendedPANID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "borderAgent");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "discriminatorId");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "credentialsDataSet");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "dataSetArray");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "credentials");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "PSKc");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "credentials");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "masterKey");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "credentials");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "channel");
    objc_msgSend(v30, "credentials");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "PANID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "creationDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "lastModificationDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v17) = v10;
    v15 = -[THCredentials initThreadCredentials:extendedPANID:borderAgentID:activeOperationalDataSet:PSKC:networkKey:channel:panID:creationDate:lastModificationDate:](v6, "initThreadCredentials:extendedPANID:borderAgentID:activeOperationalDataSet:PSKC:networkKey:channel:panID:creationDate:lastModificationDate:", v29, v21, v19, v18, v7, v8, v17, v12, v13, v14);

    if (v15)
    {
      v5 = v28;
      (*(void (**)(void))(*(_QWORD *)(v27 + 32) + 16))();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "storeError:description:", 3, CFSTR("Failed to retrieve record"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(v27 + 32) + 16))();

      v5 = v28;
    }

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (void)checkPreferredNetworkForActiveOperationalDataset:(NSData *)activeOperationalDataSet completion:(void *)completion
{
  NSData *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;

  v6 = activeOperationalDataSet;
  v7 = completion;
  if (v6)
  {
    -[THClient xpcConnection](self, "xpcConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __72__THClient_checkPreferredNetworkForActiveOperationalDataset_completion___block_invoke;
    v16[3] = &unk_1E8992438;
    v10 = v7;
    v17 = v10;
    objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v16);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v14[0] = v9;
    v14[1] = 3221225472;
    v14[2] = __72__THClient_checkPreferredNetworkForActiveOperationalDataset_completion___block_invoke_70;
    v14[3] = &unk_1E8992638;
    v15 = v10;
    objc_msgSend(v11, "ctcsIsPreferredNetworkForActiveOperationalDataset:completion:", v6, v14);

    v12 = v17;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "storeError:description:", 4, CFSTR("Invalid input parameter"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = ThreadNetworkLoggingCategory(0);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[THClient checkPreferredNetworkForActiveOperationalDataset:completion:].cold.1();
    (*((void (**)(void *, _QWORD))v7 + 2))(v7, 0);
  }

}

void __72__THClient_checkPreferredNetworkForActiveOperationalDataset_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  v4 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __72__THClient_checkPreferredNetworkForActiveOperationalDataset_completion___block_invoke_cold_1();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __72__THClient_checkPreferredNetworkForActiveOperationalDataset_completion___block_invoke_70(uint64_t a1, char a2)
{
  NSObject *v4;

  v4 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __72__THClient_checkPreferredNetworkForActiveOperationalDataset_completion___block_invoke_70_cold_1(a2, v4);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)ctcsAddPreferredNetworkWithCompletionInternally:(id)a3 extendedPANId:(id)a4 borderAgentID:(id)a5 ipV4NwSignature:(id)a6 ipv6NwSignature:(id)a7 wifiSSID:(id)a8 wifiPassword:(id)a9 completion:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  NSObject *v31;
  id v32;
  _QWORD v33[4];
  id v34;
  _QWORD v35[4];
  id v36;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v32 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v22 = a10;
  if (v16 && v17)
  {
    -[THClient xpcConnection](self, "xpcConnection");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __153__THClient_ctcsAddPreferredNetworkWithCompletionInternally_extendedPANId_borderAgentID_ipV4NwSignature_ipv6NwSignature_wifiSSID_wifiPassword_completion___block_invoke;
    v35[3] = &unk_1E8992438;
    v24 = v22;
    v36 = v24;
    objc_msgSend(v23, "remoteObjectProxyWithErrorHandler:", v35);
    v25 = v16;
    v26 = v21;
    v27 = v20;
    v28 = v18;
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __153__THClient_ctcsAddPreferredNetworkWithCompletionInternally_extendedPANId_borderAgentID_ipV4NwSignature_ipv6NwSignature_wifiSSID_wifiPassword_completion___block_invoke_71;
    v33[3] = &unk_1E8992438;
    v34 = v24;
    objc_msgSend(v29, "ctcsServerAddPreferredNetworkWithCompletionInternally:extendedPANId:borderAgentID:ipV4NwSignature:ipv6NwSignature:wifiSSID:wifiPassword:completion:", v25, v17, v28, v32, v19, v27, v26, v33);

    v18 = v28;
    v20 = v27;
    v21 = v26;
    v16 = v25;
    v30 = v36;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "storeError:description:", 4, CFSTR("Invalid input parameter"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = ThreadNetworkLoggingCategory(0);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      -[THClient ctcsAddPreferredNetworkWithCompletionInternally:extendedPANId:borderAgentID:ipV4NwSignature:ipv6NwSignature:wifiSSID:wifiPassword:completion:].cold.1();
    (*((void (**)(id, void *))v22 + 2))(v22, v30);
  }

}

void __153__THClient_ctcsAddPreferredNetworkWithCompletionInternally_extendedPANId_borderAgentID_ipV4NwSignature_ipv6NwSignature_wifiSSID_wifiPassword_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  v4 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __153__THClient_ctcsAddPreferredNetworkWithCompletionInternally_extendedPANId_borderAgentID_ipV4NwSignature_ipv6NwSignature_wifiSSID_wifiPassword_completion___block_invoke_cold_1();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __153__THClient_ctcsAddPreferredNetworkWithCompletionInternally_extendedPANId_borderAgentID_ipV4NwSignature_ipv6NwSignature_wifiSSID_wifiPassword_completion___block_invoke_71(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  v4 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __153__THClient_ctcsAddPreferredNetworkWithCompletionInternally_extendedPANId_borderAgentID_ipV4NwSignature_ipv6NwSignature_wifiSSID_wifiPassword_completion___block_invoke_71_cold_1();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)ctcsDeletePreferredNetworkForNetworkSignatureInternallyWithCompletion:(id)a3 ipv6NwSignature:(id)a4 wifiSSID:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  -[THClient xpcConnection](self, "xpcConnection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __118__THClient_ctcsDeletePreferredNetworkForNetworkSignatureInternallyWithCompletion_ipv6NwSignature_wifiSSID_completion___block_invoke;
  v21[3] = &unk_1E8992438;
  v16 = v10;
  v22 = v16;
  objc_msgSend(v14, "remoteObjectProxyWithErrorHandler:", v21);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v19[0] = v15;
  v19[1] = 3221225472;
  v19[2] = __118__THClient_ctcsDeletePreferredNetworkForNetworkSignatureInternallyWithCompletion_ipv6NwSignature_wifiSSID_completion___block_invoke_72;
  v19[3] = &unk_1E8992438;
  v20 = v16;
  v18 = v16;
  objc_msgSend(v17, "ctcsServerDeletePreferredNetworkForNetworkSignatureInternallyWithCompletion:ipv6NwSignature:wifiSSID:completion:", v13, v12, v11, v19);

}

void __118__THClient_ctcsDeletePreferredNetworkForNetworkSignatureInternallyWithCompletion_ipv6NwSignature_wifiSSID_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  v4 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __118__THClient_ctcsDeletePreferredNetworkForNetworkSignatureInternallyWithCompletion_ipv6NwSignature_wifiSSID_completion___block_invoke_cold_1();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __118__THClient_ctcsDeletePreferredNetworkForNetworkSignatureInternallyWithCompletion_ipv6NwSignature_wifiSSID_completion___block_invoke_72(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  v4 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __118__THClient_ctcsDeletePreferredNetworkForNetworkSignatureInternallyWithCompletion_ipv6NwSignature_wifiSSID_completion___block_invoke_72_cold_1();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)retrieveAllActiveCredentials:(void *)completion
{
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = completion;
  v5 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v16 = "-[THClient retrieveAllActiveCredentials:]";
    v17 = 1024;
    v18 = 1059;
    _os_log_impl(&dword_1CD04F000, v5, OS_LOG_TYPE_INFO, "Client: %s:%d - Calling Server remoteObjectProxyWithErrorHandler", buf, 0x12u);
  }
  -[THClient xpcConnection](self, "xpcConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __41__THClient_retrieveAllActiveCredentials___block_invoke;
  v13[3] = &unk_1E8992438;
  v8 = v4;
  v14 = v8;
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __41__THClient_retrieveAllActiveCredentials___block_invoke_73;
  v11[3] = &unk_1E8992660;
  v12 = v8;
  v10 = v8;
  objc_msgSend(v9, "ctcsServerRetrieveAllActiveDataSetRecordsWithActiveFlag:completion:", 1, v11);

}

void __41__THClient_retrieveAllActiveCredentials___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  v4 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __41__THClient_retrieveAllActiveCredentials___block_invoke_cold_1();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __41__THClient_retrieveAllActiveCredentials___block_invoke_73(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  THCredentials *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  id v27;
  id obj;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5 && objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v8 = v5;
    v31 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
    if (v31)
    {
      v29 = *(_QWORD *)v44;
      v30 = v7;
      v26 = v6;
      v27 = v5;
      v25 = a1;
      obj = v8;
      while (2)
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v44 != v29)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v9);
          if (!v10)
            goto LABEL_14;
          v32 = v9;
          v11 = [THCredentials alloc];
          objc_msgSend(v10, "network");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "networkName");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "network");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "extendedPANID");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "borderAgent");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "discriminatorId");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "credentialsDataSet");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "dataSetArray");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "credentials");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "PSKc");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "credentials");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "masterKey");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "credentials");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "channel");
          objc_msgSend(v10, "credentials");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "PANID");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "creationDate");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "lastModificationDate");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v24) = v15;
          v20 = -[THCredentials initThreadCredentials:extendedPANID:borderAgentID:activeOperationalDataSet:PSKC:networkKey:channel:panID:creationDate:lastModificationDate:](v11, "initThreadCredentials:extendedPANID:borderAgentID:activeOperationalDataSet:PSKC:networkKey:channel:panID:creationDate:lastModificationDate:", v42, v41, v34, v33, v12, v13, v24, v17, v18, v19);

          if (!v20)
          {
LABEL_14:
            objc_msgSend(MEMORY[0x1E0CB35C8], "storeError:description:", 3, CFSTR("Failed to retrieve record"));
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            (*(void (**)(void))(*(_QWORD *)(v25 + 32) + 16))();
            v5 = v27;
            v7 = v30;

            v6 = v26;
            v22 = obj;
            goto LABEL_15;
          }
          v7 = v30;
          objc_msgSend(v30, "addObject:", v20);

          v9 = v32 + 1;
        }
        while (v31 != v32 + 1);
        v8 = obj;
        v6 = v26;
        v5 = v27;
        a1 = v25;
        v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
        if (v31)
          continue;
        break;
      }
    }

    v21 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v7);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v21 + 16))(v21, v22, 0);
LABEL_15:

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (void)isPreferredNetworkAvailableWithCompletion:(void *)completion
{
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = completion;
  v5 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v16 = "-[THClient isPreferredNetworkAvailableWithCompletion:]";
    v17 = 1024;
    v18 = 1103;
    _os_log_impl(&dword_1CD04F000, v5, OS_LOG_TYPE_INFO, "Client: %s:%d - Calling Server remoteObjectProxyWithErrorHandler", buf, 0x12u);
  }
  -[THClient xpcConnection](self, "xpcConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __54__THClient_isPreferredNetworkAvailableWithCompletion___block_invoke;
  v13[3] = &unk_1E8992438;
  v8 = v4;
  v14 = v8;
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __54__THClient_isPreferredNetworkAvailableWithCompletion___block_invoke_74;
  v11[3] = &unk_1E8992638;
  v12 = v8;
  v10 = v8;
  objc_msgSend(v9, "ctcsServerRetrieveIsPreferredNetworkAvailable:", v11);

}

void __54__THClient_isPreferredNetworkAvailableWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  v4 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __54__THClient_isPreferredNetworkAvailableWithCompletion___block_invoke_cold_1();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __54__THClient_isPreferredNetworkAvailableWithCompletion___block_invoke_74(uint64_t a1, int a2)
{
  NSObject *v4;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315650;
    v7 = "-[THClient isPreferredNetworkAvailableWithCompletion:]_block_invoke";
    v8 = 1024;
    v9 = 1113;
    v10 = 1024;
    v11 = a2;
    _os_log_impl(&dword_1CD04F000, v4, OS_LOG_TYPE_DEFAULT, "%s:%d: - Response: isPreferredAvailable : %d", (uint8_t *)&v6, 0x18u);
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)retrievePreferredNetworkWithNoScan:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v16 = "-[THClient retrievePreferredNetworkWithNoScan:]";
    v17 = 1024;
    v18 = 1120;
    _os_log_impl(&dword_1CD04F000, v5, OS_LOG_TYPE_INFO, "Client: %s:%d - Calling Server remoteObjectProxyWithErrorHandler", buf, 0x12u);
  }
  -[THClient xpcConnection](self, "xpcConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __47__THClient_retrievePreferredNetworkWithNoScan___block_invoke;
  v13[3] = &unk_1E8992438;
  v8 = v4;
  v14 = v8;
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __47__THClient_retrievePreferredNetworkWithNoScan___block_invoke_75;
  v11[3] = &unk_1E8992610;
  v12 = v8;
  v10 = v8;
  objc_msgSend(v9, "ctcsServerRetrievePreferredNetworkWithNoScanWithCompletion:", v11);

}

void __47__THClient_retrievePreferredNetworkWithNoScan___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  v4 = ThreadNetworkLoggingCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __47__THClient_retrievePreferredNetworkWithNoScan___block_invoke_cold_1();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __47__THClient_retrievePreferredNetworkWithNoScan___block_invoke_75(uint64_t a1, void *a2, void *a3)
{
  id v5;
  THCredentials *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void (*v18)(uint64_t, id, void *, id);
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id v31;
  void *v32;
  id v33;

  v33 = a2;
  v5 = a3;
  if (v33)
  {
    v30 = a1;
    v31 = v5;
    v6 = [THCredentials alloc];
    objc_msgSend(v33, "network");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "networkName");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "network");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "extendedPANID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "borderAgent");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "discriminatorId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "credentialsDataSet");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "dataSetArray");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "credentials");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "PSKc");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "credentials");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "masterKey");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "credentials");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "channel");
    objc_msgSend(v33, "credentials");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "PANID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "creationDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "lastModificationDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v20) = v11;
    v22 = -[THCredentials initThreadCredentials:extendedPANID:borderAgentID:activeOperationalDataSet:PSKC:networkKey:channel:panID:creationDate:lastModificationDate:](v6, "initThreadCredentials:extendedPANID:borderAgentID:activeOperationalDataSet:PSKC:networkKey:channel:panID:creationDate:lastModificationDate:", v32, v7, v8, v23, v21, v9, v20, v13, v14, v15);

    if (v22)
    {
      v16 = *(_QWORD *)(v30 + 32);
      objc_msgSend(v33, "uniqueIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = *(void (**)(uint64_t, id, void *, id))(v16 + 16);
      v19 = v16;
      v5 = v31;
      v18(v19, v22, v17, v31);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "storeError:description:", 3, CFSTR("Failed to retrieve record"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(v30 + 32) + 16))();
      v5 = v31;
    }

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXpcConnection:(id)a3
{
  objc_storeStrong((id *)&self->_xpcConnection, a3);
}

- (dispatch_queue_s)threadSafePropertyQueue
{
  return self->_threadSafePropertyQueue;
}

- (void)setThreadSafePropertyQueue:(dispatch_queue_s *)a3
{
  self->_threadSafePropertyQueue = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

- (void)init
{
  OUTLINED_FUNCTION_6(&dword_1CD04F000, a1, a3, "Client: %s - XPC Client Init Failed", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)initWithKeychainAccessGroup:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_1CD04F000, a1, a3, "Client: %s - XPC Client Init Failed", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void __53__THClient_pingXPCServiceWithClientProxy_completion___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_8(&dword_1CD04F000, a1, a3, "Failed to ping service.", a5, a6, a7, a8, 0);
}

void __31__THClient_connectToXPCService__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_1CD04F000, a1, a3, "Client: %s - CTCS XPC Client is interrupted.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void __31__THClient_connectToXPCService__block_invoke_7_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_1CD04F000, a1, a3, "Client: %s - CTCS XPC Client is invalidated.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void __22__THClient_invalidate__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_8(&dword_1CD04F000, a1, a3, "Invalidating XPC connection.", a5, a6, a7, a8, 0);
}

void __51__THClient_synchronousClientProxyWithErrorHandler___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_1CD04F000, a2, a3, "Failed to create synchronous remote object proxy: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)performXPCRequestBlock:(void *)a1 timeout:(uint8_t *)buf error:(os_log_t)log .cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1CD04F000, log, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

}

void __45__THClient_getConnectionEntitlementValidity___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CD04F000, v0, v1, "Client: %s - clientProxyWithErrorHandler Error: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void __45__THClient_getConnectionEntitlementValidity___block_invoke_30_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CD04F000, v0, v1, "Client: %s - Error: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void __44__THClient_getConnectionEntitlementValidity__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CD04F000, v0, v1, "Client: %s - clientProxyWithErrorHandler Error: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void __44__THClient_getConnectionEntitlementValidity__block_invoke_31_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CD04F000, v0, v1, "Client: %s - Error: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void __118__THClient_ctcsStoreThreadNetworkCredentialActiveDataSetInternally_network_credentialsDataSet_waitForSync_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CD04F000, v0, v1, "Client: %s - Error: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void __73__THClient_ctcsDeleteActiveDataSetRecordWithUniqueIdentifier_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CD04F000, v0, v1, "Client: %s - Error: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void __75__THClient_ctcsRetrieveActiveDataSetRecordWithUniqueIdentifier_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CD04F000, v0, v1, "Client: %s - Error: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void __65__THClient_ctcsRetrievePreferredNetworkInternallyWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CD04F000, v0, v1, "Client: %s - Error: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void __75__THClient_ctcsRetrieveOrGeneratePreferredNetworkInternallyWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CD04F000, v0, v1, "Client: %s - Error: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void __53__THClient_ctcsDeletePreferredNetworkWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CD04F000, v0, v1, "Client: %s - Error: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void __68__THClient_ctcsCleanPreferredAndFrozenThreadNetworksWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CD04F000, v0, v1, "Client: %s - Error: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void __58__THClient_ctcsCleanKeychainThreadNetworksWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CD04F000, v0, v1, "Client: %s - Error: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void __115__THClient_storeCredentialsForBorderAgentInternally_networkName_extendedPANId_activeOperationalDataSet_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_1CD04F000, v0, v1, "%s:%d: - Error: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_7();
}

void __77__THClient_retrieveActiveDataSetRecordInternallyForExtendedPANID_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CD04F000, v0, v1, "Client: %s - Error: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void __49__THClient_updatePreferredCredentialsInternally___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CD04F000, v0, v1, "Client: %s - Error: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void __45__THClient_validateAODInternally_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CD04F000, v0, v1, "Client: %s - Error: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void __55__THClient_deleteCredentialsForBorderAgent_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CD04F000, v0, v1, "Client: %s - Error: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void __79__THClient_storeCredentialsForBorderAgent_activeOperationalDataSet_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_1CD04F000, v0, v1, "%s:%d: - Error: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_7();
}

void __79__THClient_storeCredentialsForBorderAgent_activeOperationalDataSet_completion___block_invoke_57_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_1CD04F000, v0, v1, "%s:%d: - Response: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_7();
}

void __56__THClient_storeCachedAODasPreferredNetwork_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_1CD04F000, v0, v1, "%s:%d: - Error: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_7();
}

void __56__THClient_storeCachedAODasPreferredNetwork_completion___block_invoke_58_cold_1()
{
  __int16 v0;
  uint64_t v1;
  os_log_t v2;
  int v3[7];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3[0] = 136315906;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  v4 = v0;
  v5 = v1;
  _os_log_error_impl(&dword_1CD04F000, v2, OS_LOG_TYPE_ERROR, "%s:%d: - Response: recordUniqueIdentifier %@ error %@", (uint8_t *)v3, 0x26u);
  OUTLINED_FUNCTION_7();
}

void __35__THClient_retrieveAllCredentials___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CD04F000, v0, v1, "Client: %s - Error: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void __57__THClient_retrieveCredentialsForBorderAgent_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CD04F000, v0, v1, "Client: %s - Error: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void __41__THClient_retrievePreferredCredentials___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CD04F000, v0, v1, "Client: %s - Error: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void __59__THClient_retrieveCredentialsForExtendedPANID_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CD04F000, v0, v1, "Client: %s - Error: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void __59__THClient_retrievePreferredNetworkInternallyOnMdnsAndSig___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CD04F000, v0, v1, "Client: %s - Error: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void __57__THClient_retrieveOrGeneratePreferredNetworkInternally___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CD04F000, v0, v1, "Client: %s - Error: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void __51__THClient_retrievePreferredCredentialsInternally___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CD04F000, v0, v1, "Client: %s - Error: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void __50__THClient_retrieveCredentialsForUUID_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CD04F000, v0, v1, "Client: %s - Error: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)checkPreferredNetworkForActiveOperationalDataset:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_1CD04F000, v0, v1, "%s:%d: - Error: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_7();
}

void __72__THClient_checkPreferredNetworkForActiveOperationalDataset_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_1CD04F000, v0, v1, "%s:%d: - Error: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_7();
}

void __72__THClient_checkPreferredNetworkForActiveOperationalDataset_completion___block_invoke_70_cold_1(char a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  int v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = 136315650;
  v3 = "-[THClient checkPreferredNetworkForActiveOperationalDataset:completion:]_block_invoke";
  v4 = 1024;
  v5 = 1011;
  v6 = 1024;
  v7 = a1 & 1;
  _os_log_error_impl(&dword_1CD04F000, a2, OS_LOG_TYPE_ERROR, "%s:%d: - Response: isPreferred : %d", (uint8_t *)&v2, 0x18u);
  OUTLINED_FUNCTION_2();
}

- (void)ctcsAddPreferredNetworkWithCompletionInternally:extendedPANId:borderAgentID:ipV4NwSignature:ipv6NwSignature:wifiSSID:wifiPassword:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_1CD04F000, v0, v1, "%s:%d: - Error: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_7();
}

void __153__THClient_ctcsAddPreferredNetworkWithCompletionInternally_extendedPANId_borderAgentID_ipV4NwSignature_ipv6NwSignature_wifiSSID_wifiPassword_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_1CD04F000, v0, v1, "%s:%d: - Error: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_7();
}

void __153__THClient_ctcsAddPreferredNetworkWithCompletionInternally_extendedPANId_borderAgentID_ipV4NwSignature_ipv6NwSignature_wifiSSID_wifiPassword_completion___block_invoke_71_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_1CD04F000, v0, v1, "%s:%d: - Completion with error : %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_7();
}

void __118__THClient_ctcsDeletePreferredNetworkForNetworkSignatureInternallyWithCompletion_ipv6NwSignature_wifiSSID_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_1CD04F000, v0, v1, "%s:%d: - Error: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_7();
}

void __118__THClient_ctcsDeletePreferredNetworkForNetworkSignatureInternallyWithCompletion_ipv6NwSignature_wifiSSID_completion___block_invoke_72_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_1CD04F000, v0, v1, "%s:%d: - Completion with error : %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_7();
}

void __41__THClient_retrieveAllActiveCredentials___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CD04F000, v0, v1, "Client: %s - Error: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void __54__THClient_isPreferredNetworkAvailableWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CD04F000, v0, v1, "Client: %s - Error: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void __47__THClient_retrievePreferredNetworkWithNoScan___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CD04F000, v0, v1, "Client: %s - Error: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

@end
