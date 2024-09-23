@implementation RPBroadcastExtensionProxy

- (RPBroadcastExtensionProxy)initWithBroadcastUploadExtension:(id)a3
{
  id v4;
  RPBroadcastExtensionProxy *v5;
  void *v6;
  void *v7;
  objc_super v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  RPBroadcastExtensionProxy *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RPBroadcastExtensionProxy;
  v5 = -[RPBroadcastExtensionProxy init](&v9, sel_init);
  if (v5)
  {
    if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      v11 = "-[RPBroadcastExtensionProxy initWithBroadcastUploadExtension:]";
      v12 = 1024;
      v13 = 41;
      v14 = 2048;
      v15 = v5;
      _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p", buf, 0x1Cu);
    }
    objc_msgSend(MEMORY[0x24BDD1998], "anonymousListener");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[RPBroadcastExtensionProxy setListener:](v5, "setListener:", v6);

    -[NSXPCListener resume](v5->_listener, "resume");
    -[NSXPCListener setDelegate:](v5->_listener, "setDelegate:", v5);
    -[NSXPCListener endpoint](v5->_listener, "endpoint");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[RPBroadcastExtensionProxy setListenerEndpoint:](v5, "setListenerEndpoint:", v7);

    -[RPBroadcastExtensionProxy setBroadcastUploadExtension:](v5, "setBroadcastUploadExtension:", v4);
  }

  return v5;
}

- (RPBroadcastExtensionProxy)initWithBroadcastUploadListenerEndpoint:(id)a3
{
  id v4;
  RPBroadcastExtensionProxy *v5;
  void *v6;
  objc_super v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  RPBroadcastExtensionProxy *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)RPBroadcastExtensionProxy;
  v5 = -[RPBroadcastExtensionProxy init](&v8, sel_init);
  if (v5)
  {
    if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      v10 = "-[RPBroadcastExtensionProxy initWithBroadcastUploadListenerEndpoint:]";
      v11 = 1024;
      v12 = 53;
      v13 = 2048;
      v14 = v5;
      _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p", buf, 0x1Cu);
    }
    if (!v5->_connection)
    {
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithListenerEndpoint:", v4);
      -[RPBroadcastExtensionProxy setupNewConnection:](v5, "setupNewConnection:", v6);

    }
  }

  return v5;
}

- (void)dealloc
{
  objc_super v3;
  uint8_t buf[4];
  const char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  RPBroadcastExtensionProxy *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v5 = "-[RPBroadcastExtensionProxy dealloc]";
    v6 = 1024;
    v7 = 63;
    v8 = 2048;
    v9 = self;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p", buf, 0x1Cu);
  }
  v3.receiver = self;
  v3.super_class = (Class)RPBroadcastExtensionProxy;
  -[RPBroadcastExtensionProxy dealloc](&v3, sel_dealloc);
}

- (void)establishConnectionWithHandler:(id)a3
{
  id v4;
  id v5;
  NSExtension *broadcastUploadExtension;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v13 = "-[RPBroadcastExtensionProxy establishConnectionWithHandler:]";
    v14 = 1024;
    v15 = 67;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d establishing connection to extension", buf, 0x12u);
  }
  -[RPBroadcastExtensionProxy setConnectionReadyHandler:](self, "setConnectionReadyHandler:", v4);
  v5 = objc_alloc_init(MEMORY[0x24BDD1560]);
  broadcastUploadExtension = self->_broadcastUploadExtension;
  v11 = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v11, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __60__RPBroadcastExtensionProxy_establishConnectionWithHandler___block_invoke;
  v9[3] = &unk_24D15DC28;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  -[NSExtension beginExtensionRequestWithInputItems:completion:](broadcastUploadExtension, "beginExtensionRequestWithInputItems:completion:", v7, v9);

}

void __60__RPBroadcastExtensionProxy_establishConnectionWithHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  dispatch_semaphore_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  _QWORD v13[4];
  NSObject *v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    if (__RPLogLevel <= 2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __60__RPBroadcastExtensionProxy_establishConnectionWithHandler___block_invoke_cold_2(v6);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v16 = "-[RPBroadcastExtensionProxy establishConnectionWithHandler:]_block_invoke";
      v17 = 1024;
      v18 = 78;
      _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d beginExtensionRequestWithInputItems returned", buf, 0x12u);
    }
    v7 = dispatch_semaphore_create(0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "_extensionContextForUUID:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_auxiliaryConnection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "remoteObjectProxy");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72);
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __60__RPBroadcastExtensionProxy_establishConnectionWithHandler___block_invoke_6;
      v13[3] = &unk_24D15D648;
      v12 = v7;
      v14 = v12;
      objc_msgSend(v10, "setEndpoint:completionHandler:", v11, v13);
      dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);

    }
    else
    {
      if (__RPLogLevel <= 2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        __60__RPBroadcastExtensionProxy_establishConnectionWithHandler___block_invoke_cold_1();
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }

  }
}

intptr_t __60__RPBroadcastExtensionProxy_establishConnectionWithHandler___block_invoke_6(uint64_t a1)
{
  int v3;
  const char *v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v3 = 136446466;
    v4 = "-[RPBroadcastExtensionProxy establishConnectionWithHandler:]_block_invoke";
    v5 = 1024;
    v6 = 87;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Remote endpoint set.", (uint8_t *)&v3, 0x12u);
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)invalidateConnection
{
  NSXPCConnection *connection;
  id serviceInfoHandler;
  id broadcastURLHandler;
  id errorHandler;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  RPBroadcastExtensionProxy *v13;
  __int16 v14;
  NSXPCConnection *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    connection = self->_connection;
    v8 = 136446978;
    v9 = "-[RPBroadcastExtensionProxy invalidateConnection]";
    v10 = 1024;
    v11 = 100;
    v12 = 2048;
    v13 = self;
    v14 = 2048;
    v15 = connection;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p invalidating connection=%p with extension", (uint8_t *)&v8, 0x26u);
  }
  -[RPBroadcastExtensionProxy setConnectionReadyHandler:](self, "setConnectionReadyHandler:", 0);
  -[NSXPCConnection setInvalidationHandler:](self->_connection, "setInvalidationHandler:", 0);
  -[NSXPCConnection setInterruptionHandler:](self->_connection, "setInterruptionHandler:", 0);
  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  -[NSXPCListener invalidate](self->_listener, "invalidate");
  -[RPBroadcastExtensionProxy setConnection:](self, "setConnection:", 0);
  -[RPBroadcastExtensionProxy setListener:](self, "setListener:", 0);
  serviceInfoHandler = self->_serviceInfoHandler;
  self->_serviceInfoHandler = 0;

  broadcastURLHandler = self->_broadcastURLHandler;
  self->_broadcastURLHandler = 0;

  errorHandler = self->_errorHandler;
  self->_errorHandler = 0;

  -[RPBroadcastExtensionProxy broadcastUploadExtension](self, "broadcastUploadExtension");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_kill:", 9);

  -[RPBroadcastExtensionProxy setBroadcastUploadExtension:](self, "setBroadcastUploadExtension:", 0);
}

- (void)setupNewConnection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  id location;

  v4 = a3;
  -[RPBroadcastExtensionProxy setConnection:](self, "setConnection:", v4);
  -[NSXPCConnection setExportedObject:](self->_connection, "setExportedObject:", self);
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254D81F10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSXPCConnection setExportedInterface:](self->_connection, "setExportedInterface:", v5);

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254D81EA8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSXPCConnection setRemoteObjectInterface:](self->_connection, "setRemoteObjectInterface:", v6);

  objc_initWeak(&location, self);
  v7 = MEMORY[0x24BDAC760];
  v8 = 3221225472;
  v9 = __48__RPBroadcastExtensionProxy_setupNewConnection___block_invoke;
  v10 = &unk_24D15DC50;
  objc_copyWeak(&v11, &location);
  -[NSXPCConnection setInvalidationHandler:](self->_connection, "setInvalidationHandler:", &v7);
  -[NSXPCConnection setInterruptionHandler:](self->_connection, "setInterruptionHandler:", &__block_literal_global_7, v7, v8, v9, v10);
  -[NSXPCConnection resume](self->_connection, "resume");
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __48__RPBroadcastExtensionProxy_setupNewConnection___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  id v5;
  void (**v6)(_QWORD, _QWORD);
  void *v7;

  if (__RPLogLevel <= 2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __48__RPBroadcastExtensionProxy_setupNewConnection___block_invoke_cold_1();
  v2 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "errorHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = objc_loadWeakRetained(v2);
    objc_msgSend(v5, "errorHandler");
    v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "_rpUserErrorForCode:userInfo:", -5808, MEMORY[0x24BDBD1B8]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v6)[2](v6, v7);

  }
}

void __48__RPBroadcastExtensionProxy_setupNewConnection___block_invoke_64()
{
  if (__RPLogLevel <= 2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __48__RPBroadcastExtensionProxy_setupNewConnection___block_invoke_64_cold_1();
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  -[RPBroadcastExtensionProxy setupNewConnection:](self, "setupNewConnection:", a4);
  return 1;
}

- (void)updateServiceInfo:(id)a3
{
  id v4;
  void (**serviceInfoHandler)(id, id);
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136446466;
    v7 = "-[RPBroadcastExtensionProxy updateServiceInfo:]";
    v8 = 1024;
    v9 = 145;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d received serviceInfo", (uint8_t *)&v6, 0x12u);
  }
  serviceInfoHandler = (void (**)(id, id))self->_serviceInfoHandler;
  if (serviceInfoHandler)
    serviceInfoHandler[2](serviceInfoHandler, v4);

}

- (void)updateBroadcastURL:(id)a3
{
  id v4;
  void (**broadcastURLHandler)(id, id);
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136446466;
    v7 = "-[RPBroadcastExtensionProxy updateBroadcastURL:]";
    v8 = 1024;
    v9 = 152;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d received broadcastURL", (uint8_t *)&v6, 0x12u);
  }
  broadcastURLHandler = (void (**)(id, id))self->_broadcastURLHandler;
  if (broadcastURLHandler)
    broadcastURLHandler[2](broadcastURLHandler, v4);

}

- (void)ping
{
  void (**connectionReadyHandler)(id, _QWORD);
  void *v4;
  _BOOL4 enableMixedRealityCamera;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  RPBroadcastExtensionProxy *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  _BOOL4 v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136446466;
    v7 = "-[RPBroadcastExtensionProxy ping]";
    v8 = 1024;
    v9 = 159;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d received ping from extension, notifying handler that connection is ready", (uint8_t *)&v6, 0x12u);
  }
  connectionReadyHandler = (void (**)(id, _QWORD))self->_connectionReadyHandler;
  if (connectionReadyHandler)
    connectionReadyHandler[2](connectionReadyHandler, 0);
  objc_msgSend(MEMORY[0x24BDD1988], "currentConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  self->_enableMixedRealityCamera = 0;
  if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    enableMixedRealityCamera = self->_enableMixedRealityCamera;
    v6 = 136447234;
    v7 = "-[RPBroadcastExtensionProxy ping]";
    v8 = 1024;
    v9 = 169;
    v10 = 2048;
    v11 = self;
    v12 = 2048;
    v13 = v4;
    v14 = 1024;
    v15 = enableMixedRealityCamera;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p connection=%p enableMixedRealityCamera=%d", (uint8_t *)&v6, 0x2Cu);
  }

}

- (void)finishBroadcastWithError:(id)a3
{
  id v4;
  void (**errorHandler)(id, id);
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136446722;
    v7 = "-[RPBroadcastExtensionProxy finishBroadcastWithError:]";
    v8 = 1024;
    v9 = 173;
    v10 = 2112;
    v11 = v4;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d received finish request from service due to error %@", (uint8_t *)&v6, 0x1Cu);
  }
  errorHandler = (void (**)(id, id))self->_errorHandler;
  if (errorHandler)
    errorHandler[2](errorHandler, v4);

}

- (void)processPayload:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSXPCConnection *connection;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  id v15;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  connection = self->_connection;
  v11 = MEMORY[0x24BDAC760];
  v12 = 3221225472;
  v13 = __55__RPBroadcastExtensionProxy_processPayload_completion___block_invoke;
  v14 = &unk_24D15DC98;
  objc_copyWeak(&v15, &location);
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", &v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
    objc_msgSend(v9, "processPayload:completion:", v6, v7, v11, v12, v13, v14);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

void __55__RPBroadcastExtensionProxy_processPayload_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  id WeakRetained;
  void *v6;
  id v7;
  void (**v8)(_QWORD, _QWORD);
  void *v9;

  v3 = a2;
  if (__RPLogLevel <= 2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __55__RPBroadcastExtensionProxy_processPayload_completion___block_invoke_cold_1(v3);
  v4 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "errorHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = objc_loadWeakRetained(v4);
    objc_msgSend(v7, "errorHandler");
    v8 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "_rpUserErrorForCode:userInfo:", -5808, MEMORY[0x24BDBD1B8]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v8)[2](v8, v9);

  }
}

- (id)serviceInfoHandler
{
  return self->_serviceInfoHandler;
}

- (void)setServiceInfoHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)broadcastURLHandler
{
  return self->_broadcastURLHandler;
}

- (void)setBroadcastURLHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)errorHandler
{
  return self->_errorHandler;
}

- (void)setErrorHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)enableMixedRealityCamera
{
  return self->_enableMixedRealityCamera;
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
  objc_storeStrong((id *)&self->_listener, a3);
}

- (NSExtension)broadcastUploadExtension
{
  return self->_broadcastUploadExtension;
}

- (void)setBroadcastUploadExtension:(id)a3
{
  objc_storeStrong((id *)&self->_broadcastUploadExtension, a3);
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (id)connectionReadyHandler
{
  return self->_connectionReadyHandler;
}

- (void)setConnectionReadyHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
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
  objc_storeStrong(&self->_connectionReadyHandler, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_broadcastUploadExtension, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong(&self->_errorHandler, 0);
  objc_storeStrong(&self->_broadcastURLHandler, 0);
  objc_storeStrong(&self->_serviceInfoHandler, 0);
}

void __60__RPBroadcastExtensionProxy_establishConnectionWithHandler___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_214135000, MEMORY[0x24BDACB70], v0, " [ERROR] %{public}s:%d Error setting listenerEndpoint", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_2();
}

void __60__RPBroadcastExtensionProxy_establishConnectionWithHandler___block_invoke_cold_2(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(a1, "code");
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3(&dword_214135000, MEMORY[0x24BDACB70], v1, " [ERROR] %{public}s:%d Error beginning extension request: %i", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void __48__RPBroadcastExtensionProxy_setupNewConnection___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_214135000, MEMORY[0x24BDACB70], v0, " [ERROR] %{public}s:%d connection to broadcast extension invalidated", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_2();
}

void __48__RPBroadcastExtensionProxy_setupNewConnection___block_invoke_64_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_214135000, MEMORY[0x24BDACB70], v0, " [ERROR] %{public}s:%d connection to broadcast extension interrupted", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_2();
}

void __55__RPBroadcastExtensionProxy_processPayload_completion___block_invoke_cold_1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(a1, "code");
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3(&dword_214135000, MEMORY[0x24BDACB70], v1, " [ERROR] %{public}s:%d error getting remote proxy to extension: %i", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

@end
