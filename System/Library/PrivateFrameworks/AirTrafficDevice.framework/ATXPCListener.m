@implementation ATXPCListener

- (id)proxyForConnection:(id)a3
{
  id v4;
  NSMutableArray *v5;
  void *v6;

  v4 = a3;
  v5 = self->_connections;
  objc_sync_enter(v5);
  -[NSMapTable objectForKey:](self->_proxyMap, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v5);

  return v6;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSMutableArray *v18;
  NSMapTable *proxyMap;
  void *v20;
  _QWORD v22[4];
  id v23;
  id v24;
  int v25;
  id location;
  _QWORD v27[4];
  int v28;
  __int128 v29;
  __int128 v30;
  id buf;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  v29 = 0u;
  v30 = 0u;
  if (v7)
  {
    objc_msgSend(v7, "auditToken");
    v9 = DWORD1(v30);
  }
  else
  {
    v9 = 0;
  }
  _ATLogCategoryXPC();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 67109120;
    HIDWORD(buf) = v9;
    _os_log_impl(&dword_1D1868000, v10, OS_LOG_TYPE_DEFAULT, "got connection from pid %i", (uint8_t *)&buf, 8u);
  }

  +[ATDeviceService sharedInstance](ATDeviceService, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setExportedObject:", v11);

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EFC6E3E0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0C99E60];
  v14 = objc_opt_class();
  objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setClasses:forSelector:argumentIndex:ofReply:", v15, sel_registerForStatusOfDataclasses_enabled_withCompletion_, 0, 0);

  objc_msgSend(v8, "setExportedInterface:", v12);
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EFC7B4F0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setRemoteObjectInterface:", v16);

  v17 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __52__ATXPCListener_listener_shouldAcceptNewConnection___block_invoke;
  v27[3] = &__block_descriptor_36_e5_v8__0l;
  v28 = v9;
  objc_msgSend(v8, "setInterruptionHandler:", v27);
  objc_initWeak(&buf, self);
  objc_initWeak(&location, v8);
  v22[0] = v17;
  v22[1] = 3221225472;
  v22[2] = __52__ATXPCListener_listener_shouldAcceptNewConnection___block_invoke_101;
  v22[3] = &unk_1E927CF60;
  objc_copyWeak(&v23, &buf);
  objc_copyWeak(&v24, &location);
  v25 = v9;
  objc_msgSend(v8, "setInvalidationHandler:", v22);
  v18 = self->_connections;
  objc_sync_enter(v18);
  -[NSMutableArray addObject:](self->_connections, "addObject:", v8);
  proxyMap = self->_proxyMap;
  objc_msgSend(v8, "remoteObjectProxy");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable setObject:forKey:](proxyMap, "setObject:forKey:", v20, v8);

  objc_sync_exit(v18);
  objc_msgSend(v8, "resume");
  objc_destroyWeak(&v24);
  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
  objc_destroyWeak(&buf);

  return 1;
}

- (ATXPCListener)init
{
  ATXPCListener *v2;
  NSMutableArray *v3;
  NSMutableArray *connections;
  uint64_t v5;
  NSMapTable *proxyMap;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ATXPCListener;
  v2 = -[ATXPCListener init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    connections = v2->_connections;
    v2->_connections = v3;

    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v5 = objc_claimAutoreleasedReturnValue();
    proxyMap = v2->_proxyMap;
    v2->_proxyMap = (NSMapTable *)v5;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[ATXPCListener stop](self, "stop");
  v3.receiver = self;
  v3.super_class = (Class)ATXPCListener;
  -[ATXPCListener dealloc](&v3, sel_dealloc);
}

- (BOOL)run
{
  NSObject *v3;
  NSXPCListener *v4;
  NSXPCListener *xpcListener;
  uint8_t v7[16];

  _ATLogCategoryFramework();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1D1868000, v3, OS_LOG_TYPE_DEFAULT, "ATXPCListener starting up", v7, 2u);
  }

  v4 = (NSXPCListener *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B58]), "initWithMachServiceName:", CFSTR("com.apple.atc.xpc"));
  xpcListener = self->_xpcListener;
  self->_xpcListener = v4;

  -[NSXPCListener setDelegate:](self->_xpcListener, "setDelegate:", self);
  -[NSXPCListener resume](self->_xpcListener, "resume");
  return 1;
}

- (void)stop
{
  NSObject *v3;
  NSXPCListener *xpcListener;
  NSXPCListener *v5;
  uint8_t v6[16];

  _ATLogCategoryFramework();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1D1868000, v3, OS_LOG_TYPE_DEFAULT, "ATXPCListener stopping", v6, 2u);
  }

  xpcListener = self->_xpcListener;
  if (xpcListener)
  {
    -[NSXPCListener invalidate](xpcListener, "invalidate");
    -[NSXPCListener setDelegate:](self->_xpcListener, "setDelegate:", 0);
    v5 = self->_xpcListener;
    self->_xpcListener = 0;

  }
}

- (id)connections
{
  NSMutableArray *v3;
  void *v4;

  v3 = self->_connections;
  objc_sync_enter(v3);
  v4 = (void *)-[NSMutableArray copy](self->_connections, "copy");
  objc_sync_exit(v3);

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxyMap, 0);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_xpcListener, 0);
}

void __52__ATXPCListener_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v3;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  _ATLogCategoryXPC();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_DWORD *)(a1 + 32);
    v4[0] = 67109120;
    v4[1] = v3;
    _os_log_impl(&dword_1D1868000, v2, OS_LOG_TYPE_DEFAULT, "xpc connection interrupted from pid: %i", (uint8_t *)v4, 8u);
  }

}

void __52__ATXPCListener_listener_shouldAcceptNewConnection___block_invoke_101(uint64_t a1)
{
  id *WeakRetained;
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  int v7;
  id *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_loadWeakRetained((id *)(a1 + 40));
  _ATLogCategoryXPC();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_DWORD *)(a1 + 48);
    v7 = 138543618;
    v8 = WeakRetained;
    v9 = 1024;
    v10 = v5;
    _os_log_impl(&dword_1D1868000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Connection invalidated from pid: %i", (uint8_t *)&v7, 0x12u);
  }

  if (WeakRetained)
  {
    v6 = WeakRetained[2];
    objc_sync_enter(v6);
    objc_msgSend(WeakRetained[3], "removeObjectForKey:", v3);
    objc_msgSend(WeakRetained[2], "removeObject:", v3);
    objc_sync_exit(v6);

  }
}

@end
