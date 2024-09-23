@implementation ATServiceProxyListener

- (ATServiceProxyListener)initWithService:(id)a3
{
  id v4;
  ATServiceProxyListener *v5;
  ATServiceProxyListener *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ATServiceProxyListener;
  v5 = -[ATServiceProxyListener init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_service, v4);

  return v6;
}

- (void)start
{
  NSObject *v3;
  id v4;
  NSXPCListener *v5;
  NSXPCListener *listener;
  int v7;
  ATServiceProxyListener *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  _ATLogCategoryFramework();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543362;
    v8 = self;
    _os_log_impl(&dword_1D19F1000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ starting", (uint8_t *)&v7, 0xCu);
  }

  v4 = objc_alloc(MEMORY[0x1E0CB3B58]);
  v5 = (NSXPCListener *)objc_msgSend(v4, "initWithMachServiceName:", *MEMORY[0x1E0CF7628]);
  listener = self->_listener;
  self->_listener = v5;

  -[NSXPCListener setDelegate:](self->_listener, "setDelegate:", self);
  -[NSXPCListener resume](self->_listener, "resume");
}

- (void)stop
{
  NSObject *v3;
  NSXPCListener *listener;
  NSXPCListener *v5;
  int v6;
  ATServiceProxyListener *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  _ATLogCategoryFramework();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = self;
    _os_log_impl(&dword_1D19F1000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ stopping", (uint8_t *)&v6, 0xCu);
  }

  listener = self->_listener;
  if (listener)
  {
    -[NSXPCListener invalidate](listener, "invalidate");
    -[NSXPCListener setDelegate:](self->_listener, "setDelegate:", 0);
    v5 = self->_listener;
    self->_listener = 0;

  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  int v6;
  NSObject *v7;
  id WeakRetained;
  ATServiceProxyConnection *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  ATServiceProxyConnection *v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  ATServiceProxyListener *v19;
  ATServiceProxyConnection *v20;
  int v21;
  _QWORD v22[4];
  int v23;
  uint8_t buf[4];
  ATServiceProxyListener *v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = objc_msgSend(v5, "processIdentifier");
  _ATLogCategoryXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v25 = self;
    v26 = 1024;
    v27 = v6;
    _os_log_impl(&dword_1D19F1000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ got connection from pid %i", buf, 0x12u);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_service);
  v9 = -[ATServiceProxyConnection initWithService:connection:]([ATServiceProxyConnection alloc], "initWithService:connection:", WeakRetained, v5);
  objc_msgSend(v5, "setExportedObject:", v9);
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EFC710B0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRemoteObjectInterface:", v10);
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EFC6C240);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setExportedInterface:", v11);
  v12 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __61__ATServiceProxyListener_listener_shouldAcceptNewConnection___block_invoke;
  v22[3] = &__block_descriptor_36_e5_v8__0l;
  v23 = v6;
  objc_msgSend(v5, "setInterruptionHandler:", v22);
  v15 = v12;
  v16 = 3221225472;
  v17 = __61__ATServiceProxyListener_listener_shouldAcceptNewConnection___block_invoke_54;
  v18 = &unk_1E928C7B8;
  v21 = v6;
  v19 = self;
  v20 = v9;
  v13 = v9;
  objc_msgSend(v5, "setInvalidationHandler:", &v15);
  objc_msgSend(WeakRetained, "addObserver:", v13, v15, v16, v17, v18, v19);
  objc_msgSend(v5, "resume");

  return 1;
}

- (ATService)service
{
  return (ATService *)objc_loadWeakRetained((id *)&self->_service);
}

- (void)setService:(id)a3
{
  objc_storeWeak((id *)&self->_service, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_service);
  objc_storeStrong((id *)&self->_listener, 0);
}

void __61__ATServiceProxyListener_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v3;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  _ATLogCategoryFramework();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_DWORD *)(a1 + 32);
    v4[0] = 67109120;
    v4[1] = v3;
    _os_log_impl(&dword_1D19F1000, v2, OS_LOG_TYPE_DEFAULT, "connection interrupted from pid: %i", (uint8_t *)v4, 8u);
  }

}

void __61__ATServiceProxyListener_listener_shouldAcceptNewConnection___block_invoke_54(uint64_t a1)
{
  NSObject *v2;
  int v3;
  id WeakRetained;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  _ATLogCategoryFramework();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_DWORD *)(a1 + 48);
    v5[0] = 67109120;
    v5[1] = v3;
    _os_log_impl(&dword_1D19F1000, v2, OS_LOG_TYPE_DEFAULT, "connection invalidated from pid: %i", (uint8_t *)v5, 8u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(WeakRetained, "removeObserver:", *(_QWORD *)(a1 + 40));

}

@end
