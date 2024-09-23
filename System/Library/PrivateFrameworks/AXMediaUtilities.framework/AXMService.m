@implementation AXMService

- (AXMService)init
{
  AXMService *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *xpcConnectionQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AXMService;
  v2 = -[AXMService init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("AXMServiceConnection", 0);
    xpcConnectionQueue = v2->_xpcConnectionQueue;
    v2->_xpcConnectionQueue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (void)_destroyXPCConnection
{
  NSXPCConnection *xpcConnection;

  -[NSXPCConnection invalidate](self->_xpcConnection, "invalidate");
  xpcConnection = self->_xpcConnection;
  self->_xpcConnection = 0;

}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  AXMService *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  AXMediaLogService();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v6 = self;
    _os_log_impl(&dword_1B0E3B000, v3, OS_LOG_TYPE_DEFAULT, "AXMService being deallocated: %@", buf, 0xCu);
  }

  -[AXMService _destroyXPCConnection](self, "_destroyXPCConnection");
  v4.receiver = self;
  v4.super_class = (Class)AXMService;
  -[AXMService dealloc](&v4, sel_dealloc);
}

- (NSXPCConnection)xpcConnection
{
  NSObject *xpcConnectionQueue;
  NSXPCConnection *v4;
  _QWORD block[5];
  id v7;
  id location;

  objc_initWeak(&location, self);
  xpcConnectionQueue = self->_xpcConnectionQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __27__AXMService_xpcConnection__block_invoke;
  block[3] = &unk_1E625CA00;
  block[4] = self;
  objc_copyWeak(&v7, &location);
  dispatch_sync(xpcConnectionQueue, block);
  v4 = self->_xpcConnection;
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
  return v4;
}

void __27__AXMService_xpcConnection__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;

  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24))
  {
    v2 = objc_alloc(MEMORY[0x1E0CB3B38]);
    v3 = (void *)objc_msgSend(v2, "initWithServiceName:", AXMServiceIdentifier);
    AXMServiceInterface();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setRemoteObjectInterface:", v4);

    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEEDFEA0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setExportedInterface:", v5);

    objc_msgSend(v3, "setExportedObject:", *(_QWORD *)(a1 + 32));
    v6 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __27__AXMService_xpcConnection__block_invoke_2;
    v14[3] = &unk_1E625C9D8;
    objc_copyWeak(&v15, (id *)(a1 + 40));
    objc_msgSend(v3, "setInterruptionHandler:", v14);
    v9 = v6;
    v10 = 3221225472;
    v11 = __27__AXMService_xpcConnection__block_invoke_63;
    v12 = &unk_1E625C9D8;
    objc_copyWeak(&v13, (id *)(a1 + 40));
    objc_msgSend(v3, "setInvalidationHandler:", &v9);
    objc_msgSend(v3, "resume", v9, v10, v11, v12);
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 24);
    *(_QWORD *)(v7 + 24) = v3;

    objc_destroyWeak(&v13);
    objc_destroyWeak(&v15);
  }
}

void __27__AXMService_xpcConnection__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  void *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  AXMediaLogService();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = WeakRetained;
    _os_log_impl(&dword_1B0E3B000, v2, OS_LOG_TYPE_DEFAULT, "Connection to service interrupted. client: %@", (uint8_t *)&v4, 0xCu);
  }

  objc_msgSend(WeakRetained, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axMediaUtilitiesService:eventOccurred:", WeakRetained, 1);

  objc_msgSend(WeakRetained, "_destroyXPCConnection");
}

void __27__AXMService_xpcConnection__block_invoke_63(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  AXMediaLogService();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __27__AXMService_xpcConnection__block_invoke_63_cold_1((uint64_t)WeakRetained, v2, v3, v4, v5, v6, v7, v8);

  objc_msgSend(WeakRetained, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "axMediaUtilitiesService:eventOccurred:", WeakRetained, 2);

  objc_msgSend(WeakRetained, "_destroyXPCConnection");
}

- (id)_serviceProxy
{
  void *v3;
  void *v4;
  _QWORD v6[4];
  id v7;
  id location;

  objc_initWeak(&location, self);
  -[AXMService xpcConnection](self, "xpcConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __27__AXMService__serviceProxy__block_invoke;
  v6[3] = &unk_1E625CA28;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v7);

  objc_destroyWeak(&location);
  return v4;
}

void __27__AXMService__serviceProxy__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  AXMediaLogService();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __27__AXMService__serviceProxy__block_invoke_cold_1((uint64_t)v3, v5, v6, v7, v8, v9, v10, v11);

  objc_msgSend(WeakRetained, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "axMediaUtilitiesService:eventOccurred:", WeakRetained, 3);

}

- (void)prewarmVisionEngineService
{
  id v2;

  -[AXMService _serviceProxy](self, "_serviceProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "prewarmVisionEngineService");

}

- (void)visionEngine:(id)a3 evaluateSource:(id)a4 context:(id)a5 options:(int64_t)a6 result:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;

  v12 = a7;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  -[AXMService _serviceProxy](self, "_serviceProxy");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "visionEngine:evaluateSource:context:options:result:", v15, v14, v13, a6, v12);

}

- (AXMServiceDelegate)delegate
{
  return (AXMServiceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setXpcConnection:(id)a3
{
  objc_storeStrong((id *)&self->_xpcConnection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_xpcConnectionQueue, 0);
}

void __27__AXMService_xpcConnection__block_invoke_63_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_1B0E3B000, a2, a3, "Connection to service invalidated. client: %@", a5, a6, a7, a8, 2u);
}

void __27__AXMService__serviceProxy__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_1B0E3B000, a2, a3, "Failed to get service proxy: %@", a5, a6, a7, a8, 2u);
}

@end
