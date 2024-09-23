@implementation EMActivityRegistry

+ (NSXPCInterface)remoteInterface
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF25F928);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "observerInterface");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInterface:forSelector:argumentIndex:ofReply:", v4, sel_registerActivityObserver_completion_, 0, 0);

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF23EB98);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInterface:forSelector:argumentIndex:ofReply:", v5, sel_registerActivityObserver_completion_, 0, 1);

  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_registerActivityObserver_completion_, 1, 1);

  return (NSXPCInterface *)v3;
}

+ (NSXPCInterface)observerInterface
{
  return (NSXPCInterface *)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF23ECB0);
}

- (id)registerActivityObserver:(id)a3
{
  id v4;
  _EMActivityRegistryObserverWrapper *v5;
  void *v6;
  _EMActivityRegistryObserverWrapper *v7;
  void *v8;
  _EMActivityRegistryObserverWrapper *v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  _EMActivityRegistryObserverWrapper *v14;
  EMActivityRegistry *v15;
  id v16;

  v4 = a3;
  v5 = [_EMActivityRegistryObserverWrapper alloc];
  -[EMActivityRegistry connection](self, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[_EMActivityRegistryObserverWrapper initWithConnection:registry:observer:](v5, "initWithConnection:registry:observer:", v6, self, v4);

  os_unfair_lock_lock(&self->_lock);
  -[NSMapTable setObject:forKey:](self->_observerWrappersByObserver, "setObject:forKey:", v7, v4);
  os_unfair_lock_unlock(&self->_lock);
  v8 = (void *)MEMORY[0x1E0D1EE90];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __47__EMActivityRegistry_registerActivityObserver___block_invoke;
  v13[3] = &unk_1E70F2158;
  v9 = v7;
  v14 = v9;
  v15 = self;
  v10 = v4;
  v16 = v10;
  objc_msgSend(v8, "tokenWithCancelationBlock:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[_EMActivityRegistryObserverWrapper _startObservingIfNecessary](v9, "_startObservingIfNecessary");

  return v11;
}

- (EMRemoteConnection)connection
{
  return (EMRemoteConnection *)objc_getProperty(self, a2, 24, 1);
}

- (EMActivityRegistry)initWithRemoteConnection:(id)a3
{
  id v5;
  EMActivityRegistry *v6;
  EMActivityRegistry *v7;
  uint64_t v8;
  NSMapTable *observerWrappersByObserver;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)EMActivityRegistry;
  v6 = -[EMActivityRegistry init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_connection, a3);
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v8 = objc_claimAutoreleasedReturnValue();
    observerWrappersByObserver = v7->_observerWrappersByObserver;
    v7->_observerWrappersByObserver = (NSMapTable *)v8;

  }
  return v7;
}

void __47__EMActivityRegistry_registerActivityObserver___block_invoke(uint64_t a1)
{
  os_unfair_lock_s *v2;

  objc_msgSend(*(id *)(a1 + 32), "cancel");
  v2 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 40) + 16);
  os_unfair_lock_lock(v2);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "removeObjectForKey:", *(_QWORD *)(a1 + 48));
  os_unfair_lock_unlock(v2);
}

- (void)setConnection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_observerWrappersByObserver, 0);
}

@end
