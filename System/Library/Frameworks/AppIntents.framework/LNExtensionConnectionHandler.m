@implementation LNExtensionConnectionHandler

- (BOOL)shouldAcceptXPCConnection:(id)a3
{
  id v4;
  NSObject *v5;
  LNClientConnection *v6;
  void *v7;
  void *v8;
  void *v9;
  LNClientConnection *v10;
  uint64_t v11;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id location;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  getLNLogCategoryExecution();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v21 = v4;
    _os_log_impl(&dword_227EAE000, v5, OS_LOG_TYPE_INFO, "Resuming new XPC connection: %{public}@", buf, 0xCu);
  }

  v6 = [LNClientConnection alloc];
  +[LNAppConnectionListener sharedListener](LNAppConnectionListener, "sharedListener");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_queue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNExtensionConnectionHandler appContext](self, "appContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[LNClientConnection initWithConnection:connectionListener:queue:appContext:](v6, "initWithConnection:connectionListener:queue:appContext:", v4, v7, v8, v9);

  -[LNExtensionConnectionHandler addClientConnection:](self, "addClientConnection:", v10);
  objc_initWeak((id *)buf, v10);
  objc_initWeak(&location, self);
  v11 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __58__LNExtensionConnectionHandler_shouldAcceptXPCConnection___block_invoke;
  v16[3] = &unk_24F0CB470;
  objc_copyWeak(&v17, &location);
  objc_copyWeak(&v18, (id *)buf);
  objc_msgSend(v4, "setInterruptionHandler:", v16);
  v13[0] = v11;
  v13[1] = 3221225472;
  v13[2] = __58__LNExtensionConnectionHandler_shouldAcceptXPCConnection___block_invoke_9;
  v13[3] = &unk_24F0CB470;
  objc_copyWeak(&v14, &location);
  objc_copyWeak(&v15, (id *)buf);
  objc_msgSend(v4, "setInvalidationHandler:", v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)buf);

  return 1;
}

- (NSMutableSet)clientConnections
{
  os_unfair_lock_assert_owner(&self->_lock);
  return self->_clientConnections;
}

- (LNAppContext)appContext
{
  LNAppContext *appContext;
  LNAppContext *v4;
  LNAppContext *v5;

  appContext = self->_appContext;
  if (!appContext)
  {
    v4 = objc_alloc_init(LNAppContext);
    v5 = self->_appContext;
    self->_appContext = v4;

    appContext = self->_appContext;
  }
  return appContext;
}

- (LNExtensionConnectionHandler)init
{
  LNExtensionConnectionHandler *v2;
  uint64_t v3;
  NSMutableSet *clientConnections;
  LNExtensionConnectionHandler *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)LNExtensionConnectionHandler;
  v2 = -[LNExtensionConnectionHandler init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    clientConnections = v2->_clientConnections;
    v2->_clientConnections = (NSMutableSet *)v3;

    v2->_lock._os_unfair_lock_opaque = 0;
    v5 = v2;
  }

  return v2;
}

- (LNExtensionConnectionHandler)initWithPrincipalObject:(id)a3
{
  id v5;
  LNExtensionConnectionHandler *v6;
  LNExtensionConnectionHandler *v7;
  LNExtensionConnectionHandler *v8;

  v5 = a3;
  v6 = -[LNExtensionConnectionHandler init](self, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong(&v6->_principalObject, a3);
    v8 = v7;
  }

  return v7;
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
  aBlock[2] = __52__LNExtensionConnectionHandler_addClientConnection___block_invoke;
  aBlock[3] = &unk_24F0CB448;
  aBlock[4] = self;
  v5 = (void (**)(_QWORD))_Block_copy(aBlock);
  -[LNExtensionConnectionHandler clientConnections](self, "clientConnections");
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
  aBlock[2] = __55__LNExtensionConnectionHandler_removeClientConnection___block_invoke;
  aBlock[3] = &unk_24F0CB448;
  aBlock[4] = self;
  v5 = (void (**)(_QWORD))_Block_copy(aBlock);
  -[LNExtensionConnectionHandler clientConnections](self, "clientConnections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObject:", v4);

  v5[2](v5);
}

- (void)setAppContext:(id)a3
{
  objc_storeStrong((id *)&self->_appContext, a3);
}

- (id)principalObject
{
  return self->_principalObject;
}

- (void)setPrincipalObject:(id)a3
{
  objc_storeStrong(&self->_principalObject, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_principalObject, 0);
  objc_storeStrong((id *)&self->_appContext, 0);
  objc_storeStrong((id *)&self->_clientConnections, 0);
}

void __58__LNExtensionConnectionHandler_shouldAcceptXPCConnection___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_loadWeakRetained((id *)(a1 + 40));
  getLNLogCategoryExecution();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v3, "xpcConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v5;
    _os_log_impl(&dword_227EAE000, v4, OS_LOG_TYPE_ERROR, "XPC connection has been interrupted: %{public}@", (uint8_t *)&v8, 0xCu);

  }
  objc_msgSend(WeakRetained, "appContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "xpcConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAllDeferredOutputsFor:", v7);

  if (v3)
    objc_msgSend(WeakRetained, "removeClientConnection:", v3);

}

void __58__LNExtensionConnectionHandler_shouldAcceptXPCConnection___block_invoke_9(uint64_t a1)
{
  id WeakRetained;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_loadWeakRetained((id *)(a1 + 40));
  getLNLogCategoryExecution();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v3, "xpcConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v5;
    _os_log_impl(&dword_227EAE000, v4, OS_LOG_TYPE_INFO, "XPC connection has been invalidated: %{public}@", (uint8_t *)&v8, 0xCu);

  }
  objc_msgSend(WeakRetained, "appContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "xpcConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAllDeferredOutputsFor:", v7);

  if (v3)
    objc_msgSend(WeakRetained, "removeClientConnection:", v3);

}

void __55__LNExtensionConnectionHandler_removeClientConnection___block_invoke(uint64_t a1)
{
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
}

void __52__LNExtensionConnectionHandler_addClientConnection___block_invoke(uint64_t a1)
{
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
}

@end
