@implementation BBDataProviderConnectionResolver

- (BBDataProviderConnectionResolver)initWithConnection:(id)a3
{
  id v5;
  BBDataProviderConnectionResolver *v6;
  BBDataProviderConnectionResolver *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *queue;
  id v11;
  void *v12;
  uint64_t v13;
  NSXPCListener *wakeupListener;
  NSObject *v15;
  void *v17;
  _QWORD block[4];
  BBDataProviderConnectionResolver *v19;
  objc_super v20;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BBDataProviderConnectionResolver.m"), 33, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("connection != nil"));

  }
  v20.receiver = self;
  v20.super_class = (Class)BBDataProviderConnectionResolver;
  v6 = -[BBDataProviderConnectionResolver init](&v20, sel_init);
  v7 = v6;
  if (v6)
  {
    -[BBDataProviderConnectionResolver setDataProviderConnection:](v6, "setDataProviderConnection:", v5);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create("com.apple.bulletinboard.BBDataProviderConnectionResolver", v8);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v9;

    v11 = objc_alloc(MEMORY[0x24BDD1998]);
    objc_msgSend(v5, "serviceName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "initWithMachServiceName:", v12);
    wakeupListener = v7->_wakeupListener;
    v7->_wakeupListener = (NSXPCListener *)v13;

    -[NSXPCListener setDelegate:](v7->_wakeupListener, "setDelegate:", v7);
    -[NSXPCListener resume](v7->_wakeupListener, "resume");
    v15 = v7->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __55__BBDataProviderConnectionResolver_initWithConnection___block_invoke;
    block[3] = &unk_24C562E28;
    v19 = v7;
    dispatch_async(v15, block);

  }
  return v7;
}

void __55__BBDataProviderConnectionResolver_initWithConnection___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v1 = *(void **)(a1 + 32);
  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __55__BBDataProviderConnectionResolver_initWithConnection___block_invoke_2;
  v2[3] = &unk_24C562E28;
  v3 = v1;
  objc_msgSend(v3, "_queue_registerWithServer:", v2);

}

uint64_t __55__BBDataProviderConnectionResolver_initWithConnection___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_registerForPublicationNotification");
}

+ (id)resolverForConnection:(id)a3
{
  id v3;
  BBDataProviderConnectionResolver *v4;

  v3 = a3;
  v4 = -[BBDataProviderConnectionResolver initWithConnection:]([BBDataProviderConnectionResolver alloc], "initWithConnection:", v3);

  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[BBDataProviderConnectionResolver _invalidate](self, "_invalidate");
  v3.receiver = self;
  v3.super_class = (Class)BBDataProviderConnectionResolver;
  -[BBDataProviderConnectionResolver dealloc](&v3, sel_dealloc);
}

- (void)_invalidate
{
  NSXPCListener *wakeupListener;
  NSXPCConnection *connectionToServer;

  notify_cancel(self->_listeningToken);
  self->_listeningToken = -1;
  -[NSXPCListener invalidate](self->_wakeupListener, "invalidate");
  wakeupListener = self->_wakeupListener;
  self->_wakeupListener = 0;

  -[NSXPCConnection invalidate](self->_connectionToServer, "invalidate");
  connectionToServer = self->_connectionToServer;
  self->_connectionToServer = 0;

  -[BBDataProviderConnectionResolver setDataProviderConnection:](self, "setDataProviderConnection:", 0);
}

- (void)invalidate
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__BBDataProviderConnectionResolver_invalidate__block_invoke;
  block[3] = &unk_24C562E28;
  block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __46__BBDataProviderConnectionResolver_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

- (void)_registerForPublicationNotification
{
  NSObject *queue;
  _QWORD handler[5];

  queue = self->_queue;
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __71__BBDataProviderConnectionResolver__registerForPublicationNotification__block_invoke;
  handler[3] = &unk_24C563BB0;
  handler[4] = self;
  notify_register_dispatch(BBServerListeningForConnectionsKey, &self->_listeningToken, queue, handler);
}

uint64_t __71__BBDataProviderConnectionResolver__registerForPublicationNotification__block_invoke(uint64_t result, int token)
{
  uint64_t v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t state64;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (*(_DWORD *)(*(_QWORD *)(result + 32) + 32) == token)
  {
    v2 = result;
    state64 = 0;
    result = notify_get_state(token, &state64);
    if (state64 == 1)
    {
      v3 = (void *)BBLogConnection;
      if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
      {
        v4 = *(void **)(v2 + 32);
        v5 = v3;
        objc_msgSend(v4, "dataProviderConnection");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "serviceName");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v10 = v7;
        _os_log_impl(&dword_20CCB9000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ notified that BBServer is ready for publication.", buf, 0xCu);

      }
      return objc_msgSend(*(id *)(v2 + 32), "_queue_registerWithServer:", 0);
    }
  }
  return result;
}

- (void)_queue_registerWithServer:(id)a3
{
  id v5;
  void *v6;
  NSXPCConnection *connectionToServer;
  NSXPCConnection *v8;
  NSXPCConnection *v9;
  NSXPCConnection *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSXPCConnection *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  _QWORD v24[5];
  id v25;
  id v26;
  __int128 *p_buf;
  _QWORD v28[5];
  id v29;
  _QWORD v30[4];
  id v31;
  id location;
  __int128 buf;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  NSXPCConnection *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (self->_connectionToServer)
  {
    -[BBDataProviderConnectionResolver dataProviderConnection](self, "dataProviderConnection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setServerProxy:", 0);

    -[NSXPCConnection invalidate](self->_connectionToServer, "invalidate");
    connectionToServer = self->_connectionToServer;
    self->_connectionToServer = 0;

  }
  v8 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.bulletinboard.dataproviderconnection"), 0);
  v9 = self->_connectionToServer;
  self->_connectionToServer = v8;

  v10 = self->_connectionToServer;
  BBDataProviderConnectionCheckinServerInterface();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSXPCConnection setRemoteObjectInterface:](v10, "setRemoteObjectInterface:", v11);

  objc_initWeak(&location, self);
  v12 = MEMORY[0x24BDAC760];
  v30[0] = MEMORY[0x24BDAC760];
  v30[1] = 3221225472;
  v30[2] = __62__BBDataProviderConnectionResolver__queue_registerWithServer___block_invoke;
  v30[3] = &unk_24C562FE0;
  objc_copyWeak(&v31, &location);
  v13 = (void *)MEMORY[0x212B949C0](v30);
  -[NSXPCConnection setInterruptionHandler:](self->_connectionToServer, "setInterruptionHandler:", v13);
  -[NSXPCConnection setInvalidationHandler:](self->_connectionToServer, "setInvalidationHandler:", v13);
  -[NSXPCConnection resume](self->_connectionToServer, "resume");
  v14 = self->_connectionToServer;
  v28[0] = v12;
  v28[1] = 3221225472;
  v28[2] = __62__BBDataProviderConnectionResolver__queue_registerWithServer___block_invoke_15;
  v28[3] = &unk_24C564808;
  v28[4] = self;
  v15 = v5;
  v29 = v15;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](v14, "remoteObjectProxyWithErrorHandler:", v28);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    -[BBDataProviderConnectionResolver dataProviderConnection](self, "dataProviderConnection");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "serviceName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v17)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BBDataProviderConnectionResolver.m"), 131, CFSTR("dataProviderConnection is nil"));

    }
    if (!v18)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BBDataProviderConnectionResolver.m"), 132, CFSTR("Must register a non-nil service name with BBDataProviderConnectionCheckinServer"));

    }
    v19 = BBLogConnection;
    if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v18;
      _os_log_impl(&dword_20CCB9000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ is registering with BulletinBoard", (uint8_t *)&buf, 0xCu);
    }
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v34 = 0x3032000000;
    v35 = __Block_byref_object_copy__10;
    v36 = __Block_byref_object_dispose__10;
    v37 = self->_connectionToServer;
    objc_msgSend(v17, "bundleID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v12;
    v24[1] = 3221225472;
    v24[2] = __62__BBDataProviderConnectionResolver__queue_registerWithServer___block_invoke_21;
    v24[3] = &unk_24C564830;
    p_buf = &buf;
    v24[4] = self;
    v21 = v17;
    v25 = v21;
    v26 = v15;
    objc_msgSend(v16, "registerServiceName:appBundleID:completion:", v18, v20, v24);

    _Block_object_dispose(&buf, 8);
  }

  objc_destroyWeak(&v31);
  objc_destroyWeak(&location);

}

void __62__BBDataProviderConnectionResolver__queue_registerWithServer___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  uint64_t v3;
  void *v4;
  __CFString *v5;
  __CFString *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "dataProviderConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "serviceName");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  v5 = CFSTR("<unknown>");
  if (v3)
    v5 = (__CFString *)v3;
  v6 = v5;

  v7 = BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_ERROR))
    __62__BBDataProviderConnectionResolver__queue_registerWithServer___block_invoke_cold_1((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);

}

void __62__BBDataProviderConnectionResolver__queue_registerWithServer___block_invoke_15(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a2;
  v4 = (void *)BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_ERROR))
    __62__BBDataProviderConnectionResolver__queue_registerWithServer___block_invoke_15_cold_1(a1, v4, (uint64_t)v3);
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(void))(v5 + 16))();

}

void __62__BBDataProviderConnectionResolver__queue_registerWithServer___block_invoke_21(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;

  v3 = a2;
  v5 = v3;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) == *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24))
  {
    objc_msgSend(*(id *)(a1 + 40), "setServerProxy:", v3);
    v3 = v5;
  }
  v4 = *(_QWORD *)(a1 + 48);
  if (v4)
  {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
    v3 = v5;
  }

}

+ (id)xpcInterface
{
  if (xpcInterface_onceToken_0 != -1)
    dispatch_once(&xpcInterface_onceToken_0, &__block_literal_global_17);
  return (id)xpcInterface___interface_0;
}

void __48__BBDataProviderConnectionResolver_xpcInterface__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2549A1A78);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)xpcInterface___interface_0;
  xpcInterface___interface_0 = v0;

}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  NSXPCListener *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSXPCListener *wakeupListener;
  void *v12;
  int v13;
  void *v14;
  BOOL v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v24;
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = (NSXPCListener *)a3;
  -[BBDataProviderConnectionResolver dataProviderConnection](self, "dataProviderConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "serviceName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    v24 = 138543618;
    v25 = v9;
    v26 = 2112;
    v27 = v6;
    _os_log_impl(&dword_20CCB9000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ received a connection request: %@", (uint8_t *)&v24, 0x16u);
  }
  wakeupListener = self->_wakeupListener;

  if (wakeupListener != v7)
    goto LABEL_8;
  objc_msgSend(v6, "valueForEntitlement:", CFSTR("com.apple.bulletinboard"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "BOOLValue");

  if (!v13)
  {
    v16 = BBLogConnection;
    if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_ERROR))
      -[BBDataProviderConnectionResolver listener:shouldAcceptNewConnection:].cold.1((uint64_t)v9, v16, v17, v18, v19, v20, v21, v22);
LABEL_8:
    v15 = 0;
    goto LABEL_9;
  }
  objc_msgSend((id)objc_opt_class(), "xpcInterface");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setExportedInterface:", v14);

  objc_msgSend(v6, "setExportedObject:", self);
  objc_msgSend(v6, "resume");
  v15 = 1;
LABEL_9:

  return v15;
}

- (void)ping:(id)a3
{
  id v3;

  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  objc_msgSend(MEMORY[0x24BDD1988], "currentConnection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

}

- (BBDataProviderConnection)dataProviderConnection
{
  return (BBDataProviderConnection *)objc_loadWeakRetained((id *)&self->_dataProviderConnection);
}

- (void)setDataProviderConnection:(id)a3
{
  objc_storeWeak((id *)&self->_dataProviderConnection, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataProviderConnection);
  objc_storeStrong((id *)&self->_connectionToServer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_wakeupListener, 0);
}

void __62__BBDataProviderConnectionResolver__queue_registerWithServer___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_20CCB9000, a2, a3, "Your data provider for service '%{public}@' has been interrupted or invalidated. Either BulletinBoard has crashed or you are using the same service name from two different processes.", a5, a6, a7, a8, 2u);
}

void __62__BBDataProviderConnectionResolver__queue_registerWithServer___block_invoke_15_cold_1(uint64_t a1, void *a2, uint64_t a3)
{
  NSObject *v4;
  objc_class *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138543618;
  v8 = v6;
  v9 = 2114;
  v10 = a3;
  _os_log_error_impl(&dword_20CCB9000, v4, OS_LOG_TYPE_ERROR, "%{public}@ unable to retrieve checkin server proxy: %{public}@", (uint8_t *)&v7, 0x16u);

}

- (void)listener:(uint64_t)a3 shouldAcceptNewConnection:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_20CCB9000, a2, a3, "%{public}@ cancelling incoming connection because it lacks proper entitlement.", a5, a6, a7, a8, 2u);
}

@end
