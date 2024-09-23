@implementation _HKXPCConnection

- (_HKXPCConnection)initWithServiceName:(id)a3
{
  id v4;
  void *v5;
  _HKXPCConnection *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithServiceName:", v4);
  if (v5)
  {
    self = -[_HKXPCConnection initWithUnderlyingConnection:](self, "initWithUnderlyingConnection:", v5);
    v6 = self;
  }
  else
  {
    _HKInitializeLogging();
    v7 = HKLogDefault;
    if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_ERROR))
      -[_HKXPCConnection initWithServiceName:].cold.1((uint64_t)v4, v7, v8, v9, v10, v11, v12, v13);
    v6 = 0;
  }

  return v6;
}

- (_HKXPCConnection)initWithMachServiceName:(id)a3 options:(unint64_t)a4
{
  id v6;
  void *v7;
  _HKXPCConnection *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", v6, a4);
  if (v7)
  {
    self = -[_HKXPCConnection initWithUnderlyingConnection:](self, "initWithUnderlyingConnection:", v7);
    v8 = self;
  }
  else
  {
    _HKInitializeLogging();
    v9 = HKLogDefault;
    if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_ERROR))
      -[_HKXPCConnection initWithServiceName:].cold.1((uint64_t)v6, v9, v10, v11, v12, v13, v14, v15);
    v8 = 0;
  }

  return v8;
}

- (_HKXPCConnection)initWithListenerEndpoint:(id)a3
{
  id v5;
  void *v6;
  _HKXPCConnection *v7;
  void *v9;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_HKXPCConnection.m"), 54, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("endpoint != nil"));

  }
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithListenerEndpoint:", v5);
  v7 = -[_HKXPCConnection initWithUnderlyingConnection:](self, "initWithUnderlyingConnection:", v6);

  return v7;
}

- (_HKXPCConnection)initWithUnderlyingConnection:(id)a3
{
  id v6;
  _HKXPCConnection *v7;
  _HKXPCConnection *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_HKXPCConnection.m"), 61, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("connection != nil"));

  }
  v11.receiver = self;
  v11.super_class = (Class)_HKXPCConnection;
  v7 = -[_HKXPCConnection init](&v11, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_underlyingConnection, a3);
    -[_HKXPCConnection setInterruptionHandler:](v8, "setInterruptionHandler:", 0);
    -[_HKXPCConnection setInvalidationHandler:](v8, "setInvalidationHandler:", 0);
  }

  return v8;
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection setInvalidationHandler:](self->_underlyingConnection, "setInvalidationHandler:", 0);
  -[NSXPCConnection invalidate](self->_underlyingConnection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)_HKXPCConnection;
  -[_HKXPCConnection dealloc](&v3, sel_dealloc);
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  return -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_underlyingConnection, "remoteObjectProxyWithErrorHandler:", a3);
}

- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  return -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](self->_underlyingConnection, "synchronousRemoteObjectProxyWithErrorHandler:", a3);
}

- (void)resume
{
  _HKXPCExportable **p_exportedObject;
  void *v4;
  id v5;
  void *v6;
  id WeakRetained;

  p_exportedObject = &self->_exportedObject;
  WeakRetained = objc_loadWeakRetained((id *)&self->_exportedObject);
  objc_msgSend(WeakRetained, "exportedInterface");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_loadWeakRetained((id *)p_exportedObject);
  objc_msgSend(v5, "remoteInterface");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HKXPCConnection resumeWithExportedInterface:remoteInterface:](self, "resumeWithExportedInterface:remoteInterface:", v4, v6);

}

- (void)resumeWithExportedInterface:(id)a3 remoteInterface:(id)a4
{
  id v7;
  id v8;
  id WeakRetained;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  __CFString *v14;
  __CFString *v15;
  NSXPCConnection *underlyingConnection;
  uint64_t v17;
  id v18;
  __CFString *v19;
  NSXPCConnection *v20;
  id v21;
  __CFString *v22;
  _HKXPCExportedObjectProxy *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  __CFString *v27;
  id v28;
  _QWORD v29[4];
  id v30;
  __CFString *v31;
  id v32;
  id location[2];

  v7 = a3;
  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_exportedObject);

  if (!WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_HKXPCConnection.m"), 95, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_exportedObject != nil"));

  }
  v10 = objc_loadWeakRetained((id *)&self->_exportedObject);
  if (v10)
  {
    -[_HKXPCConnection _loggingPrefix](self, "_loggingPrefix");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection serviceName](self->_underlyingConnection, "serviceName");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    v14 = CFSTR("<anonymous>");
    if (v12)
      v14 = (__CFString *)v12;
    v15 = v14;

    objc_initWeak(location, self);
    underlyingConnection = self->_underlyingConnection;
    v17 = MEMORY[0x1E0C809B0];
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __64___HKXPCConnection_resumeWithExportedInterface_remoteInterface___block_invoke;
    v29[3] = &unk_1E37F62A0;
    v18 = v11;
    v30 = v18;
    v19 = v15;
    v31 = v19;
    objc_copyWeak(&v32, location);
    -[NSXPCConnection setInterruptionHandler:](underlyingConnection, "setInterruptionHandler:", v29);
    v20 = self->_underlyingConnection;
    v25[0] = v17;
    v25[1] = 3221225472;
    v25[2] = __64___HKXPCConnection_resumeWithExportedInterface_remoteInterface___block_invoke_19;
    v25[3] = &unk_1E37F62A0;
    v21 = v18;
    v26 = v21;
    v22 = v19;
    v27 = v22;
    objc_copyWeak(&v28, location);
    -[NSXPCConnection setInvalidationHandler:](v20, "setInvalidationHandler:", v25);
    -[NSXPCConnection setExportedInterface:](self->_underlyingConnection, "setExportedInterface:", v7);
    -[NSXPCConnection setRemoteObjectInterface:](self->_underlyingConnection, "setRemoteObjectInterface:", v8);
    v23 = objc_alloc_init(_HKXPCExportedObjectProxy);
    -[_HKXPCExportedObjectProxy setWeakExportedObject:](v23, "setWeakExportedObject:", v10);
    -[NSXPCConnection setExportedObject:](self->_underlyingConnection, "setExportedObject:", v23);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v10, "connectionConfigured");

    objc_destroyWeak(&v28);
    objc_destroyWeak(&v32);

    objc_destroyWeak(location);
  }
  -[NSXPCConnection resume](self->_underlyingConnection, "resume");

}

- (void)invalidate
{
  -[NSXPCConnection invalidate](self->_underlyingConnection, "invalidate");
}

- (void)unitTest_interrupt
{
  void (**v2)(void);
  void (**v3)(void);

  v2 = (void (**)(void))_Block_copy(self->_interruptionHandler);
  if (v2)
  {
    v3 = v2;
    v2[2]();
    v2 = v3;
  }

}

- (void)setInterruptionHandler:(id)a3
{
  id v4;
  void *v5;
  id interruptionHandler;
  _QWORD v7[4];
  id v8;
  id location;

  v4 = a3;
  if (!v4)
  {
    objc_initWeak(&location, self);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __43___HKXPCConnection_setInterruptionHandler___block_invoke;
    v7[3] = &unk_1E37E85F0;
    objc_copyWeak(&v8, &location);
    v4 = _Block_copy(v7);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
  v5 = _Block_copy(v4);
  interruptionHandler = self->_interruptionHandler;
  self->_interruptionHandler = v5;

}

- (void)setInvalidationHandler:(id)a3
{
  id v4;
  void *v5;
  id invalidationHandler;
  _QWORD v7[4];
  id v8;
  id location;

  v4 = a3;
  if (!v4)
  {
    objc_initWeak(&location, self);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __43___HKXPCConnection_setInvalidationHandler___block_invoke;
    v7[3] = &unk_1E37E85F0;
    objc_copyWeak(&v8, &location);
    v4 = _Block_copy(v7);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
  v5 = _Block_copy(v4);
  invalidationHandler = self->_invalidationHandler;
  self->_invalidationHandler = v5;

}

- (id)_loggingPrefix
{
  NSString *debugIdentifier;
  uint64_t v4;

  debugIdentifier = self->_debugIdentifier;
  if (debugIdentifier)
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%p: "), debugIdentifier, self);
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%p: "), self, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (_HKXPCExportable)exportedObject
{
  return (_HKXPCExportable *)objc_loadWeakRetained((id *)&self->_exportedObject);
}

- (void)setExportedObject:(id)a3
{
  objc_storeWeak((id *)&self->_exportedObject, a3);
}

- (NSString)debugIdentifier
{
  return self->_debugIdentifier;
}

- (void)setDebugIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)interruptionHandler
{
  return self->_interruptionHandler;
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong((id *)&self->_debugIdentifier, 0);
  objc_destroyWeak((id *)&self->_exportedObject);
  objc_storeStrong((id *)&self->_underlyingConnection, 0);
}

- (void)initWithServiceName:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_19A0E6000, a2, a3, "Could not establish connection with %@", a5, a6, a7, a8, 2u);
}

@end
