@implementation LNConnectionListener

- (LNConnectionListener)initWithListener:(id)a3
{
  id v5;
  LNConnectionListener *v6;
  LNAppContext *v7;
  LNAppContext *appContext;
  uint64_t v9;
  NSMutableSet *clientConnections;
  void *v11;
  id v12;
  LNConnectionListener *v13;
  objc_super v15;
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)LNConnectionListener;
  v6 = -[LNConnectionListener init](&v15, sel_init);
  if (v6)
  {
    v7 = objc_alloc_init(LNAppContext);
    appContext = v6->_appContext;
    v6->_appContext = v7;

    v9 = objc_opt_new();
    clientConnections = v6->_clientConnections;
    v6->_clientConnections = (NSMutableSet *)v9;

    v6->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v6->_xpcListener, a3);
    -[NSXPCListener setDelegate:](v6->_xpcListener, "setDelegate:", v6);
    -[NSXPCListener resume](v6->_xpcListener, "resume");
    if (NSClassFromString(CFSTR("UIView")))
    {
      v17 = 0;
      v18 = &v17;
      v19 = 0x2050000000;
      v11 = (void *)get_AppIntentsUIKitBridgeLoaderClass_softClass;
      v20 = get_AppIntentsUIKitBridgeLoaderClass_softClass;
      if (!get_AppIntentsUIKitBridgeLoaderClass_softClass)
      {
        v16[0] = MEMORY[0x24BDAC760];
        v16[1] = 3221225472;
        v16[2] = __get_AppIntentsUIKitBridgeLoaderClass_block_invoke;
        v16[3] = &unk_24F0CB408;
        v16[4] = &v17;
        __get_AppIntentsUIKitBridgeLoaderClass_block_invoke((uint64_t)v16);
        v11 = (void *)v18[3];
      }
      v12 = objc_retainAutorelease(v11);
      _Block_object_dispose(&v17, 8);
      objc_msgSend(v12, "loadBridge");
    }
    v13 = v6;
  }

  return v6;
}

- (NSMutableSet)clientConnections
{
  os_unfair_lock_assert_owner(&self->_lock);
  return self->_clientConnections;
}

- (void)addClientConnection:(id)a3
{
  id v4;
  void (**v5)(_QWORD);
  void *v6;
  _QWORD aBlock[5];

  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __44__LNConnectionListener_addClientConnection___block_invoke;
  aBlock[3] = &unk_24F0CB448;
  aBlock[4] = self;
  v5 = (void (**)(_QWORD))_Block_copy(aBlock);
  -[LNConnectionListener clientConnections](self, "clientConnections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v4);

  v5[2](v5);
}

- (void)removeClientConnection:(id)a3
{
  id v4;
  void (**v5)(_QWORD);
  void *v6;
  _QWORD aBlock[5];

  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __47__LNConnectionListener_removeClientConnection___block_invoke;
  aBlock[3] = &unk_24F0CB448;
  aBlock[4] = self;
  v5 = (void (**)(_QWORD))_Block_copy(aBlock);
  -[LNConnectionListener clientConnections](self, "clientConnections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObject:", v4);

  v5[2](v5);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  LNClientConnection *v9;
  void *v10;
  void *v11;
  LNClientConnection *v12;
  uint64_t v13;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id location;
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  getLNLogCategoryExecution();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v23 = v7;
    _os_log_impl(&dword_227EAE000, v8, OS_LOG_TYPE_INFO, "Resuming new XPC connection: %{public}@", buf, 0xCu);
  }

  v9 = [LNClientConnection alloc];
  objc_msgSend(v7, "_queue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNConnectionListener appContext](self, "appContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[LNClientConnection initWithConnection:connectionListener:queue:appContext:](v9, "initWithConnection:connectionListener:queue:appContext:", v7, self, v10, v11);

  -[LNConnectionListener addClientConnection:](self, "addClientConnection:", v12);
  objc_initWeak((id *)buf, v12);
  objc_initWeak(&location, self);
  v13 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __59__LNConnectionListener_listener_shouldAcceptNewConnection___block_invoke;
  v18[3] = &unk_24F0CB470;
  objc_copyWeak(&v19, &location);
  objc_copyWeak(&v20, (id *)buf);
  objc_msgSend(v7, "setInterruptionHandler:", v18);
  v15[0] = v13;
  v15[1] = 3221225472;
  v15[2] = __59__LNConnectionListener_listener_shouldAcceptNewConnection___block_invoke_10;
  v15[3] = &unk_24F0CB470;
  objc_copyWeak(&v16, &location);
  objc_copyWeak(&v17, (id *)buf);
  objc_msgSend(v7, "setInvalidationHandler:", v15);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)buf);

  return 1;
}

- (NSXPCListener)xpcListener
{
  return self->_xpcListener;
}

- (LNAppContext)appContext
{
  return self->_appContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appContext, 0);
  objc_storeStrong((id *)&self->_xpcListener, 0);
  objc_storeStrong((id *)&self->_clientConnections, 0);
}

void __59__LNConnectionListener_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_loadWeakRetained((id *)(a1 + 40));
  getLNLogCategoryExecution();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v3, "xpcConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543362;
    v7 = v5;
    _os_log_impl(&dword_227EAE000, v4, OS_LOG_TYPE_ERROR, "XPC connection has been interrupted: %{public}@", (uint8_t *)&v6, 0xCu);

  }
  -[LNConnectionListener cleanUp:](WeakRetained, v3);

}

void __59__LNConnectionListener_listener_shouldAcceptNewConnection___block_invoke_10(uint64_t a1)
{
  id WeakRetained;
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_loadWeakRetained((id *)(a1 + 40));
  getLNLogCategoryExecution();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v3, "xpcConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543362;
    v7 = v5;
    _os_log_impl(&dword_227EAE000, v4, OS_LOG_TYPE_INFO, "XPC connection has been invalidated: %{public}@", (uint8_t *)&v6, 0xCu);

  }
  -[LNConnectionListener cleanUp:](WeakRetained, v3);

}

- (void)cleanUp:(void *)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (a1)
  {
    if (a2)
    {
      v3 = a2;
      objc_msgSend(a1, "removeClientConnection:", v3);
      objc_msgSend(a1, "appContext");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "xpcConnection");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "removeAllDeferredOutputsFor:", v5);

      objc_msgSend(a1, "appContext");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "xpcConnection");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "removeContextForConnection:", v6);
    }
  }
}

void __47__LNConnectionListener_removeClientConnection___block_invoke(uint64_t a1)
{
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
}

void __44__LNConnectionListener_addClientConnection___block_invoke(uint64_t a1)
{
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
}

@end
