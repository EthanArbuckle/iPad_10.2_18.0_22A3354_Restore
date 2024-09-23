@implementation HearingMLHelperService

- (HearingMLHelperService)init
{
  HearingMLHelperService *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *xpcConnectionQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HearingMLHelperService;
  v2 = -[HearingMLHelperService init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("HearingMLHelperService Connection", 0);
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
  HearingMLHelperService *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  AXLogUltronKShot();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v6 = self;
    _os_log_impl(&dword_21909B000, v3, OS_LOG_TYPE_DEFAULT, "HearingMLHelperService being deallocated: %@", buf, 0xCu);
  }

  -[HearingMLHelperService _destroyXPCConnection](self, "_destroyXPCConnection");
  v4.receiver = self;
  v4.super_class = (Class)HearingMLHelperService;
  -[HearingMLHelperService dealloc](&v4, sel_dealloc);
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
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__HearingMLHelperService_xpcConnection__block_invoke;
  block[3] = &unk_24DA713D0;
  block[4] = self;
  objc_copyWeak(&v7, &location);
  dispatch_sync(xpcConnectionQueue, block);
  v4 = self->_xpcConnection;
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
  return v4;
}

void __39__HearingMLHelperService_xpcConnection__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithServiceName:", CFSTR("com.apple.accessibility.HearingMLHelperService"));
    HearingMLHelperServiceInterface();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setRemoteObjectInterface:", v3);

    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_25503D998);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setExportedInterface:", v4);

    objc_msgSend(v2, "setExportedObject:", *(_QWORD *)(a1 + 32));
    v5 = MEMORY[0x24BDAC760];
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __39__HearingMLHelperService_xpcConnection__block_invoke_2;
    v13[3] = &unk_24DA713A8;
    objc_copyWeak(&v14, (id *)(a1 + 40));
    objc_msgSend(v2, "setInterruptionHandler:", v13);
    v8 = v5;
    v9 = 3221225472;
    v10 = __39__HearingMLHelperService_xpcConnection__block_invoke_47;
    v11 = &unk_24DA713A8;
    objc_copyWeak(&v12, (id *)(a1 + 40));
    objc_msgSend(v2, "setInvalidationHandler:", &v8);
    objc_msgSend(v2, "resume", v8, v9, v10, v11);
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 24);
    *(_QWORD *)(v6 + 24) = v2;

    objc_destroyWeak(&v12);
    objc_destroyWeak(&v14);
  }
}

void __39__HearingMLHelperService_xpcConnection__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  void *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  AXLogUltronKShot();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = WeakRetained;
    _os_log_impl(&dword_21909B000, v2, OS_LOG_TYPE_DEFAULT, "Connection to service interrupted. client: %@", (uint8_t *)&v4, 0xCu);
  }

  objc_msgSend(WeakRetained, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hearingMLHelperService:eventOccurred:", WeakRetained, 1);

  objc_msgSend(WeakRetained, "_destroyXPCConnection");
}

void __39__HearingMLHelperService_xpcConnection__block_invoke_47(uint64_t a1)
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
  AXLogUltronKShot();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __39__HearingMLHelperService_xpcConnection__block_invoke_47_cold_1((uint64_t)WeakRetained, v2, v3, v4, v5, v6, v7, v8);

  objc_msgSend(WeakRetained, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hearingMLHelperService:eventOccurred:", WeakRetained, 2);

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
  -[HearingMLHelperService xpcConnection](self, "xpcConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __39__HearingMLHelperService__serviceProxy__block_invoke;
  v6[3] = &unk_24DA713F8;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v7);

  objc_destroyWeak(&location);
  return v4;
}

void __39__HearingMLHelperService__serviceProxy__block_invoke(uint64_t a1, void *a2)
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
  AXLogUltronKShot();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __39__HearingMLHelperService__serviceProxy__block_invoke_cold_1((uint64_t)v3, v5, v6, v7, v8, v9, v10, v11);

  objc_msgSend(WeakRetained, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "hearingMLHelperService:eventOccurred:", WeakRetained, 3);

}

- (void)trainWithDetectorID:(id)a3 hallucinatorPath:(id)a4 pretrainedWeightsPath:(id)a5 resultHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  -[HearingMLHelperService _serviceProxy](self, "_serviceProxy");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "trainWithDetectorID:hallucinatorPath:pretrainedWeightsPath:resultHandler:", v13, v12, v11, v10);

}

- (HearingMLHelperServiceDelegate)delegate
{
  return (HearingMLHelperServiceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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

void __39__HearingMLHelperService_xpcConnection__block_invoke_47_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_21909B000, a2, a3, "Connection to service invalidated. client: %@", a5, a6, a7, a8, 2u);
}

void __39__HearingMLHelperService__serviceProxy__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_21909B000, a2, a3, "Failed to get service proxy: %@", a5, a6, a7, a8, 2u);
}

@end
