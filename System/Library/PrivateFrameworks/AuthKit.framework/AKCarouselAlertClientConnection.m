@implementation AKCarouselAlertClientConnection

+ (id)sharedConnection
{
  if (sharedConnection_onceToken != -1)
    dispatch_once(&sharedConnection_onceToken, &__block_literal_global);
  return (id)sharedConnection_sharedConnection;
}

void __51__AKCarouselAlertClientConnection_sharedConnection__block_invoke()
{
  AKCarouselAlertClientConnection *v0;
  void *v1;

  v0 = objc_alloc_init(AKCarouselAlertClientConnection);
  v1 = (void *)sharedConnection_sharedConnection;
  sharedConnection_sharedConnection = (uint64_t)v0;

}

- (AKCarouselAlertClientConnection)init
{
  AKCarouselAlertClientConnection *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *internalQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AKCarouselAlertClientConnection;
  v2 = -[AKCarouselAlertClientConnection init](&v7, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.AuthKit.alertRequestQueue", v3);
    internalQueue = v2->_internalQueue;
    v2->_internalQueue = (OS_dispatch_queue *)v4;

  }
  return v2;
}

- (void)unsafe_invalidate
{
  NSXPCConnection *xpcConnection;

  -[NSXPCConnection setInterruptionHandler:](self->_xpcConnection, "setInterruptionHandler:", 0);
  -[NSXPCConnection setInvalidationHandler:](self->_xpcConnection, "setInvalidationHandler:", 0);
  -[NSXPCConnection invalidate](self->_xpcConnection, "invalidate");
  xpcConnection = self->_xpcConnection;
  self->_xpcConnection = 0;

}

- (void)dealloc
{
  objc_super v3;

  -[AKCarouselAlertClientConnection unsafe_invalidate](self, "unsafe_invalidate");
  v3.receiver = self;
  v3.super_class = (Class)AKCarouselAlertClientConnection;
  -[AKCarouselAlertClientConnection dealloc](&v3, sel_dealloc);
}

- (id)connection
{
  NSXPCConnection *xpcConnection;
  NSXPCConnection *v4;
  NSXPCConnection *v5;
  void *v6;
  uint64_t v7;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  id location;

  xpcConnection = self->_xpcConnection;
  if (!xpcConnection)
  {
    v4 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.Carousel.authAlertXPCService"), 4096);
    v5 = self->_xpcConnection;
    self->_xpcConnection = v4;

    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE270AB8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](self->_xpcConnection, "setRemoteObjectInterface:", v6);

    objc_initWeak(&location, self);
    v7 = MEMORY[0x1E0C809B0];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __45__AKCarouselAlertClientConnection_connection__block_invoke;
    v11[3] = &unk_1E2E5E1F8;
    objc_copyWeak(&v12, &location);
    -[NSXPCConnection setInterruptionHandler:](self->_xpcConnection, "setInterruptionHandler:", v11);
    v9[0] = v7;
    v9[1] = 3221225472;
    v9[2] = __45__AKCarouselAlertClientConnection_connection__block_invoke_2;
    v9[3] = &unk_1E2E5E1F8;
    objc_copyWeak(&v10, &location);
    -[NSXPCConnection setInvalidationHandler:](self->_xpcConnection, "setInvalidationHandler:", v9);
    -[NSXPCConnection resume](self->_xpcConnection, "resume");
    objc_destroyWeak(&v10);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
    xpcConnection = self->_xpcConnection;
  }
  return xpcConnection;
}

void __45__AKCarouselAlertClientConnection_connection__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  NSObject *v3;
  _QWORD block[4];
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  _AKLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __45__AKCarouselAlertClientConnection_connection__block_invoke_cold_1();

  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "internalQueue");
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __45__AKCarouselAlertClientConnection_connection__block_invoke_53;
    block[3] = &unk_1E2E5E1D0;
    v5 = WeakRetained;
    dispatch_async(v3, block);

  }
}

uint64_t __45__AKCarouselAlertClientConnection_connection__block_invoke_53(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "xpcConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidate");

  return objc_msgSend(*(id *)(a1 + 32), "setXpcConnection:", 0);
}

void __45__AKCarouselAlertClientConnection_connection__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  NSObject *v3;
  _QWORD block[4];
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  _AKLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __45__AKCarouselAlertClientConnection_connection__block_invoke_2_cold_1();

  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "internalQueue");
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __45__AKCarouselAlertClientConnection_connection__block_invoke_54;
    block[3] = &unk_1E2E5E1D0;
    v5 = WeakRetained;
    dispatch_async(v3, block);

  }
}

uint64_t __45__AKCarouselAlertClientConnection_connection__block_invoke_54(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setXpcConnection:", 0);
}

- (void)presentAlertWithDictionary:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *internalQueue;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  internalQueue = self->_internalQueue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __73__AKCarouselAlertClientConnection_presentAlertWithDictionary_completion___block_invoke;
  v11[3] = &unk_1E2E5E270;
  objc_copyWeak(&v14, &location);
  v12 = v6;
  v13 = v7;
  v9 = v6;
  v10 = v7;
  dispatch_async(internalQueue, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __73__AKCarouselAlertClientConnection_presentAlertWithDictionary_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __73__AKCarouselAlertClientConnection_presentAlertWithDictionary_completion___block_invoke_2;
  v9[3] = &unk_1E2E5E220;
  v10 = *(id *)(a1 + 40);
  objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  v7[1] = 3221225472;
  v7[2] = __73__AKCarouselAlertClientConnection_presentAlertWithDictionary_completion___block_invoke_56;
  v7[3] = &unk_1E2E5E248;
  v6 = *(_QWORD *)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  objc_msgSend(v5, "presentAlertWithDictionary:completion:", v6, v7);

}

void __73__AKCarouselAlertClientConnection_presentAlertWithDictionary_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _AKLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __73__AKCarouselAlertClientConnection_presentAlertWithDictionary_completion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __73__AKCarouselAlertClientConnection_presentAlertWithDictionary_completion___block_invoke_56(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)dismissAlert:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__AKCarouselAlertClientConnection_dismissAlert___block_invoke;
  block[3] = &unk_1E2E5E2B8;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(internalQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __48__AKCarouselAlertClientConnection_dismissAlert___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_58);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissAlert:", *(_QWORD *)(a1 + 32));

}

void __48__AKCarouselAlertClientConnection_dismissAlert___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  _AKLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __73__AKCarouselAlertClientConnection_presentAlertWithDictionary_completion___block_invoke_2_cold_1();

}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (void)setInternalQueue:(id)a3
{
  objc_storeStrong((id *)&self->_internalQueue, a3);
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXpcConnection:(id)a3
{
  objc_storeStrong((id *)&self->_xpcConnection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
}

void __45__AKCarouselAlertClientConnection_connection__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "self: (%p); Connection interrupted", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __45__AKCarouselAlertClientConnection_connection__block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "self: (%p); Connection invalidated", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __73__AKCarouselAlertClientConnection_presentAlertWithDictionary_completion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "error communicating to XPC: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
