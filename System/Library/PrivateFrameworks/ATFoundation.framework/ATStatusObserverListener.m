@implementation ATStatusObserverListener

- (void)start
{
  NSObject *v3;
  id v4;
  NSXPCListener *v5;
  NSXPCListener *listener;
  int v7;
  ATStatusObserverListener *v8;
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
  v5 = (NSXPCListener *)objc_msgSend(v4, "initWithMachServiceName:", *MEMORY[0x1E0CF7620]);
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
  ATStatusObserverListener *v7;
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
  ATStatusObserverConnection *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  ATStatusObserverConnection *v12;
  void *v13;
  _QWORD v15[5];
  ATStatusObserverConnection *v16;
  int v17;
  _QWORD v18[5];
  int v19;
  uint8_t buf[4];
  ATStatusObserverListener *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = objc_msgSend(v5, "processIdentifier");
  _ATLogCategoryXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v21 = self;
    v22 = 1024;
    v23 = v6;
    _os_log_impl(&dword_1D19F1000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Got connection from pid %i", buf, 0x12u);
  }

  v8 = -[ATStatusObserverConnection initWithConnection:]([ATStatusObserverConnection alloc], "initWithConnection:", v5);
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EFC71110);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRemoteObjectInterface:", v9);

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EFC6B0F0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setExportedInterface:", v10);

  objc_msgSend(v5, "setExportedObject:", v8);
  v11 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __63__ATStatusObserverListener_listener_shouldAcceptNewConnection___block_invoke;
  v18[3] = &unk_1E928CAA0;
  v18[4] = self;
  v19 = v6;
  objc_msgSend(v5, "setInterruptionHandler:", v18);
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __63__ATStatusObserverListener_listener_shouldAcceptNewConnection___block_invoke_52;
  v15[3] = &unk_1E928C7B8;
  v17 = v6;
  v15[4] = self;
  v16 = v8;
  v12 = v8;
  objc_msgSend(v5, "setInvalidationHandler:", v15);
  +[ATStatusMonitor sharedMonitor](ATStatusMonitor, "sharedMonitor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObserver:", v12);

  objc_msgSend(v5, "resume");
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listener, 0);
}

void __63__ATStatusObserverListener_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  _ATLogCategoryXPC();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_DWORD *)(a1 + 40);
    v5 = 138543618;
    v6 = v3;
    v7 = 1024;
    v8 = v4;
    _os_log_impl(&dword_1D19F1000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ Connection interrupted from pid: %i", (uint8_t *)&v5, 0x12u);
  }

}

void __63__ATStatusObserverListener_listener_shouldAcceptNewConnection___block_invoke_52(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  _ATLogCategoryXPC();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_DWORD *)(a1 + 48);
    v6 = 138543618;
    v7 = v3;
    v8 = 1024;
    v9 = v4;
    _os_log_impl(&dword_1D19F1000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ Connection invalidated from pid: %i", (uint8_t *)&v6, 0x12u);
  }

  +[ATStatusMonitor sharedMonitor](ATStatusMonitor, "sharedMonitor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", *(_QWORD *)(a1 + 40));

}

@end
