@implementation DUXPCClientHelpers

- (DUXPCClientHelpers)initWithServiceName:(id)a3 whitelistedServerInterface:(id)a4 clientExportedObject:(id)a5 interruptionHandler:(id)a6 invalidationHandler:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  DUXPCClientHelpers *v18;
  DUXPCClientHelpers *v19;
  uint64_t v20;
  id interruptionHandler;
  uint64_t v22;
  id invalidationHandler;
  objc_super v25;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v25.receiver = self;
  v25.super_class = (Class)DUXPCClientHelpers;
  v18 = -[DUXPCClientHelpers init](&v25, sel_init);
  v19 = v18;
  if (v18)
  {
    pthread_mutex_init(&v18->_connectionLock, 0);
    objc_storeStrong((id *)&v19->_serviceName, a3);
    objc_storeStrong((id *)&v19->_allowListedServerInterface, a4);
    objc_storeWeak(&v19->_clientExportedObject, v15);
    v20 = MEMORY[0x23B85402C](v16);
    interruptionHandler = v19->_interruptionHandler;
    v19->_interruptionHandler = (id)v20;

    v22 = MEMORY[0x23B85402C](v17);
    invalidationHandler = v19->_invalidationHandler;
    v19->_invalidationHandler = (id)v22;

  }
  return v19;
}

- (void)dealloc
{
  objc_super v3;

  pthread_mutex_destroy(&self->_connectionLock);
  v3.receiver = self;
  v3.super_class = (Class)DUXPCClientHelpers;
  -[DUXPCClientHelpers dealloc](&v3, sel_dealloc);
}

- (void)_locked_establishConnection
{
  NSString *serviceName;
  NSXPCConnection *v4;
  NSXPCConnection *connection;
  id WeakRetained;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  NSString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (!self->_connection)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      serviceName = self->_serviceName;
      *(_DWORD *)buf = 138412290;
      v16 = serviceName;
      _os_log_impl(&dword_23A6C9000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Establishing new connection to %@ .", buf, 0xCu);
    }
    v4 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", self->_serviceName, 0);
    connection = self->_connection;
    self->_connection = v4;

    -[NSXPCConnection setRemoteObjectInterface:](self->_connection, "setRemoteObjectInterface:", self->_allowListedServerInterface);
    WeakRetained = objc_loadWeakRetained(&self->_clientExportedObject);
    -[NSXPCConnection setExportedObject:](self->_connection, "setExportedObject:", WeakRetained);

    objc_initWeak((id *)buf, self);
    v7 = MEMORY[0x24BDAC760];
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __49__DUXPCClientHelpers__locked_establishConnection__block_invoke;
    v13[3] = &unk_250B87EC0;
    objc_copyWeak(&v14, (id *)buf);
    -[NSXPCConnection setInterruptionHandler:](self->_connection, "setInterruptionHandler:", v13);
    v8 = v7;
    v9 = 3221225472;
    v10 = __49__DUXPCClientHelpers__locked_establishConnection__block_invoke_3;
    v11 = &unk_250B87EC0;
    objc_copyWeak(&v12, (id *)buf);
    -[NSXPCConnection setInvalidationHandler:](self->_connection, "setInvalidationHandler:", &v8);
    -[NSXPCConnection resume](self->_connection, "resume", v8, v9, v10, v11);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&v14);
    objc_destroyWeak((id *)buf);
  }
}

void __49__DUXPCClientHelpers__locked_establishConnection__block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __49__DUXPCClientHelpers__locked_establishConnection__block_invoke_cold_1((uint64_t)WeakRetained);
    (*(void (**)(void))(WeakRetained[13] + 16))();
  }

}

void __49__DUXPCClientHelpers__locked_establishConnection__block_invoke_3(uint64_t a1)
{
  char *WeakRetained;
  uint64_t v2;
  void *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v2 = *((_QWORD *)WeakRetained + 10);
      v4 = 138412290;
      v5 = v2;
      _os_log_impl(&dword_23A6C9000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Invalidated connection to %@ .", (uint8_t *)&v4, 0xCu);
    }
    (*(void (**)(void))(*((_QWORD *)WeakRetained + 14) + 16))();
    pthread_mutex_lock((pthread_mutex_t *)(WeakRetained + 8));
    v3 = (void *)*((_QWORD *)WeakRetained + 9);
    *((_QWORD *)WeakRetained + 9) = 0;

    pthread_mutex_unlock((pthread_mutex_t *)(WeakRetained + 8));
  }

}

- (id)remoteObjectProxy
{
  _opaque_pthread_mutex_t *p_connectionLock;
  void *v4;

  p_connectionLock = &self->_connectionLock;
  pthread_mutex_lock(&self->_connectionLock);
  -[DUXPCClientHelpers _locked_establishConnection](self, "_locked_establishConnection");
  -[NSXPCConnection remoteObjectProxy](self->_connection, "remoteObjectProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  pthread_mutex_unlock(p_connectionLock);
  return v4;
}

- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  _opaque_pthread_mutex_t *p_connectionLock;
  id v5;
  void *v6;

  p_connectionLock = &self->_connectionLock;
  v5 = a3;
  pthread_mutex_lock(p_connectionLock);
  -[DUXPCClientHelpers _locked_establishConnection](self, "_locked_establishConnection");
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](self->_connection, "synchronousRemoteObjectProxyWithErrorHandler:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  pthread_mutex_unlock(p_connectionLock);
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_destroyWeak(&self->_clientExportedObject);
  objc_storeStrong((id *)&self->_allowListedServerInterface, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

void __49__DUXPCClientHelpers__locked_establishConnection__block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 80);
  v2 = 138412290;
  v3 = v1;
  _os_log_error_impl(&dword_23A6C9000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Connection to %@ interrupted.", (uint8_t *)&v2, 0xCu);
}

@end
