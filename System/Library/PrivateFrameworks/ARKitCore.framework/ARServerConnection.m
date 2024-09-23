@implementation ARServerConnection

- (ARServerConnection)initWithListenerEndpoint:(id)a3
{
  id v5;
  ARServerConnection *v6;
  ARServerConnection *v7;
  uint64_t v8;
  id connectionCreationBlock;
  _QWORD v11[4];
  id v12;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ARServerConnection;
  v6 = -[ARServerConnection init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_listenerEndpoint, a3);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __47__ARServerConnection_initWithListenerEndpoint___block_invoke;
    v11[3] = &unk_1E6674F88;
    v12 = v5;
    v8 = objc_msgSend(v11, "copy");
    connectionCreationBlock = v7->_connectionCreationBlock;
    v7->_connectionCreationBlock = (id)v8;

  }
  return v7;
}

id __47__ARServerConnection_initWithListenerEndpoint___block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithListenerEndpoint:", *(_QWORD *)(a1 + 32));
}

- (ARServerConnection)initWithServiceName:(id)a3 options:(unint64_t)a4 queue:(id)a5
{
  id v8;
  id v9;
  ARServerConnection *v10;
  uint64_t v11;
  id connectionCreationBlock;
  _QWORD v14[4];
  id v15;
  id v16;
  unint64_t v17;
  objc_super v18;

  v8 = a3;
  v9 = a5;
  v18.receiver = self;
  v18.super_class = (Class)ARServerConnection;
  v10 = -[ARServerConnection init](&v18, sel_init);
  if (v10)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __56__ARServerConnection_initWithServiceName_options_queue___block_invoke;
    v14[3] = &unk_1E6674FB0;
    v15 = v8;
    v17 = a4;
    v16 = v9;
    v11 = objc_msgSend(v14, "copy");
    connectionCreationBlock = v10->_connectionCreationBlock;
    v10->_connectionCreationBlock = (id)v11;

  }
  return v10;
}

id __56__ARServerConnection_initWithServiceName_options_queue___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", a1[4], a1[6]);
  v3 = v2;
  if (a1[5])
    objc_msgSend(v2, "_setQueue:");
  return v3;
}

- (ARServerConnection)initWithServiceName:(id)a3 options:(unint64_t)a4
{
  return -[ARServerConnection initWithServiceName:options:queue:](self, "initWithServiceName:options:queue:", a3, a4, 0);
}

- (ARServerConnection)initWithServiceName:(id)a3
{
  return -[ARServerConnection initWithServiceName:options:](self, "initWithServiceName:options:", a3, 4096);
}

- (void)dealloc
{
  void *v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  objc_super v7;
  uint8_t buf[4];
  void *v9;
  __int16 v10;
  ARServerConnection *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (_ARLogGeneral_onceToken_37 != -1)
    dispatch_once(&_ARLogGeneral_onceToken_37, &__block_literal_global_83);
  v3 = (void *)_ARLogGeneral_logObj_37;
  if (os_log_type_enabled((os_log_t)_ARLogGeneral_logObj_37, OS_LOG_TYPE_DEBUG))
  {
    v4 = v3;
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v9 = v6;
    v10 = 2048;
    v11 = self;
    _os_log_impl(&dword_1B3A68000, v4, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: dealloc", buf, 0x16u);

  }
  -[ARServerConnection invalidate](self, "invalidate");
  v7.receiver = self;
  v7.super_class = (Class)ARServerConnection;
  -[ARServerConnection dealloc](&v7, sel_dealloc);
}

- (NSXPCConnection)connection
{
  NSXPCConnection *connection;
  NSXPCConnection *v4;
  NSXPCConnection *v5;
  NSXPCConnection *v6;
  uint64_t v7;
  NSXPCConnection *v8;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  id location;

  connection = self->_connection;
  if (!connection)
  {
    (*((void (**)(void))self->_connectionCreationBlock + 2))();
    v4 = (NSXPCConnection *)objc_claimAutoreleasedReturnValue();
    v5 = self->_connection;
    self->_connection = v4;

    -[NSXPCConnection setExportedInterface:](self->_connection, "setExportedInterface:", self->_exportedInterface);
    -[NSXPCConnection setExportedObject:](self->_connection, "setExportedObject:", self->_exportedObjectWeakReference);
    -[NSXPCConnection setRemoteObjectInterface:](self->_connection, "setRemoteObjectInterface:", self->_remoteObjectInterface);
    objc_initWeak(&location, self);
    v6 = self->_connection;
    v7 = MEMORY[0x1E0C809B0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __32__ARServerConnection_connection__block_invoke;
    v12[3] = &unk_1E66722C0;
    objc_copyWeak(&v13, &location);
    -[NSXPCConnection setInterruptionHandler:](v6, "setInterruptionHandler:", v12);
    v8 = self->_connection;
    v10[0] = v7;
    v10[1] = 3221225472;
    v10[2] = __32__ARServerConnection_connection__block_invoke_2;
    v10[3] = &unk_1E66722C0;
    objc_copyWeak(&v11, &location);
    -[NSXPCConnection setInvalidationHandler:](v8, "setInvalidationHandler:", v10);
    -[NSXPCConnection resume](self->_connection, "resume");
    objc_destroyWeak(&v11);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
    connection = self->_connection;
  }
  return connection;
}

void __32__ARServerConnection_connection__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "serverConnectionInterrupted");

}

void __32__ARServerConnection_connection__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "serverConnectionInvalidated");

}

- (void)setExportedInterface:(id)a3
{
  objc_storeStrong((id *)&self->_exportedInterface, a3);
  -[ARServerConnection invalidate](self, "invalidate");
}

- (id)exportedObject
{
  return -[ARWeakReference object](self->_exportedObjectWeakReference, "object");
}

- (void)setExportedObject:(id)a3
{
  ARWeakReference *v4;
  ARWeakReference *exportedObjectWeakReference;
  id v6;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = (ARWeakReference *)v6;
  }
  else
  {
    +[ARWeakReference weakReferenceWithObject:](ARWeakReference, "weakReferenceWithObject:", v6);
    v4 = (ARWeakReference *)objc_claimAutoreleasedReturnValue();
  }
  exportedObjectWeakReference = self->_exportedObjectWeakReference;
  self->_exportedObjectWeakReference = v4;

  -[ARServerConnection invalidate](self, "invalidate");
}

- (void)setRemoteObjectInterface:(id)a3
{
  objc_storeStrong((id *)&self->_remoteObjectInterface, a3);
  -[ARServerConnection invalidate](self, "invalidate");
}

- (void)invalidate
{
  -[NSXPCConnection invalidate](self->_connection, "invalidate");
}

- (void)serverConnectionInterrupted
{
  ARServerConnectionDelegate **p_delegate;
  id WeakRetained;
  char v5;
  id v6;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v6, "serverConnectionInterrupted:", self);

  }
}

- (void)serverConnectionInvalidated
{
  NSXPCConnection *connection;
  id WeakRetained;
  char v5;
  id v6;

  connection = self->_connection;
  self->_connection = 0;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v6, "serverConnectionInvalidated:", self);

  }
}

- (id)remoteObjectProxy
{
  void *v2;
  void *v3;

  -[ARServerConnection connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteObjectProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[ARServerConnection connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[ARServerConnection connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)interruptionHandler
{
  void *v2;
  void *v3;

  -[ARServerConnection connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "interruptionHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setInterruptionHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ARServerConnection connection](self, "connection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInterruptionHandler:", v4);

}

- (id)invalidationHandler
{
  void *v2;
  void *v3;

  -[ARServerConnection connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidationHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setInvalidationHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ARServerConnection connection](self, "connection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInvalidationHandler:", v4);

}

- (ARServerConnectionDelegate)delegate
{
  return (ARServerConnectionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSXPCInterface)exportedInterface
{
  return self->_exportedInterface;
}

- (NSXPCInterface)remoteObjectInterface
{
  return self->_remoteObjectInterface;
}

- (NSXPCListenerEndpoint)listenerEndpoint
{
  return self->_listenerEndpoint;
}

- (void)setListenerEndpoint:(id)a3
{
  objc_storeStrong((id *)&self->_listenerEndpoint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listenerEndpoint, 0);
  objc_storeStrong((id *)&self->_remoteObjectInterface, 0);
  objc_storeStrong((id *)&self->_exportedInterface, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_exportedObjectWeakReference, 0);
  objc_storeStrong(&self->_connectionCreationBlock, 0);
}

@end
