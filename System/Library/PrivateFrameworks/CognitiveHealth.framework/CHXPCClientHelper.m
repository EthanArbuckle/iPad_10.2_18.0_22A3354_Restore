@implementation CHXPCClientHelper

- (CHXPCClientHelper)initWithServiceName:(id)a3 whitelistedServerInterface:(id)a4 clientExportedObject:(id)a5 interruptionHandler:(id)a6 invalidationHandler:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  CHXPCClientHelper *v18;
  CHXPCClientHelper *v19;
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
  v25.super_class = (Class)CHXPCClientHelper;
  v18 = -[CHXPCClientHelper init](&v25, sel_init);
  v19 = v18;
  if (v18)
  {
    pthread_mutex_init(&v18->_connLock, 0);
    objc_storeStrong((id *)&v19->_serviceName, a3);
    objc_storeStrong((id *)&v19->_whitelistedServerInterface, a4);
    objc_storeWeak(&v19->_clientExportedObject, v15);
    v20 = MEMORY[0x23B8303BC](v16);
    interruptionHandler = v19->_interruptionHandler;
    v19->_interruptionHandler = (id)v20;

    v22 = MEMORY[0x23B8303BC](v17);
    invalidationHandler = v19->_invalidationHandler;
    v19->_invalidationHandler = (id)v22;

  }
  return v19;
}

- (void)dealloc
{
  objc_super v3;

  pthread_mutex_destroy(&self->_connLock);
  v3.receiver = self;
  v3.super_class = (Class)CHXPCClientHelper;
  -[CHXPCClientHelper dealloc](&v3, sel_dealloc);
}

- (void)_locked_establishConnection
{
  NSObject *v3;
  NSString *serviceName;
  NSXPCConnection *v5;
  NSXPCConnection *conn;
  id WeakRetained;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _BYTE buf[24];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (!self->_conn)
  {
    ch_xpc_handle();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      serviceName = self->_serviceName;
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = serviceName;
      _os_log_impl(&dword_238250000, v3, OS_LOG_TYPE_DEFAULT, "Establishing new connection to %@ .", buf, 0xCu);
    }

    v5 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", self->_serviceName, 0);
    conn = self->_conn;
    self->_conn = v5;

    -[NSXPCConnection setRemoteObjectInterface:](self->_conn, "setRemoteObjectInterface:", self->_whitelistedServerInterface);
    WeakRetained = objc_loadWeakRetained(&self->_clientExportedObject);
    -[NSXPCConnection setExportedObject:](self->_conn, "setExportedObject:", WeakRetained);

    *(_QWORD *)buf = 0;
    objc_initWeak((id *)buf, self);
    v8 = MEMORY[0x24BDAC760];
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __48__CHXPCClientHelper__locked_establishConnection__block_invoke;
    v14[3] = &unk_2509FE958;
    objc_copyWeak(&v15, (id *)buf);
    -[NSXPCConnection setInterruptionHandler:](self->_conn, "setInterruptionHandler:", v14);
    v9 = v8;
    v10 = 3221225472;
    v11 = __48__CHXPCClientHelper__locked_establishConnection__block_invoke_3;
    v12 = &unk_2509FE958;
    objc_copyWeak(&v13, (id *)buf);
    -[NSXPCConnection setInvalidationHandler:](self->_conn, "setInvalidationHandler:", &v9);
    -[NSXPCConnection resume](self->_conn, "resume", v9, v10, v11, v12);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&v15);
    objc_destroyWeak((id *)buf);
  }
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  _opaque_pthread_mutex_t *p_connLock;
  id v5;
  void *v6;

  p_connLock = &self->_connLock;
  v5 = a3;
  pthread_mutex_lock(p_connLock);
  -[CHXPCClientHelper _locked_establishConnection](self, "_locked_establishConnection");
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_conn, "remoteObjectProxyWithErrorHandler:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  pthread_mutex_unlock(p_connLock);
  return v6;
}

- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  _opaque_pthread_mutex_t *p_connLock;
  id v5;
  void *v6;

  p_connLock = &self->_connLock;
  v5 = a3;
  pthread_mutex_lock(p_connLock);
  -[CHXPCClientHelper _locked_establishConnection](self, "_locked_establishConnection");
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](self->_conn, "synchronousRemoteObjectProxyWithErrorHandler:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  pthread_mutex_unlock(p_connLock);
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_destroyWeak(&self->_clientExportedObject);
  objc_storeStrong((id *)&self->_whitelistedServerInterface, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_conn, 0);
}

void __48__CHXPCClientHelper__locked_establishConnection__block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    ch_xpc_handle();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v3 = WeakRetained[10];
      v4 = 138412290;
      v5 = v3;
      _os_log_error_impl(&dword_238250000, v2, OS_LOG_TYPE_ERROR, "Connection to %@ interrupted.", (uint8_t *)&v4, 0xCu);
    }

    (*(void (**)(void))(WeakRetained[13] + 16))();
  }

}

void __48__CHXPCClientHelper__locked_establishConnection__block_invoke_3(uint64_t a1)
{
  char *WeakRetained;
  NSObject *v2;
  void *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    ch_xpc_handle();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v4 = *((_QWORD *)WeakRetained + 10);
      v5 = 138412290;
      v6 = v4;
      _os_log_error_impl(&dword_238250000, v2, OS_LOG_TYPE_ERROR, "Connection to %@ invalidated.", (uint8_t *)&v5, 0xCu);
    }

    (*(void (**)(void))(*((_QWORD *)WeakRetained + 14) + 16))();
    pthread_mutex_lock((pthread_mutex_t *)(WeakRetained + 8));
    v3 = (void *)*((_QWORD *)WeakRetained + 9);
    *((_QWORD *)WeakRetained + 9) = 0;

    pthread_mutex_unlock((pthread_mutex_t *)(WeakRetained + 8));
  }

}

@end
