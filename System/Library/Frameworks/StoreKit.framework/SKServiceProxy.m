@implementation SKServiceProxy

+ (id)inAppServiceInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EECA7720);
}

+ (id)inAppClientInterface
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEC7A9C8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, v5, v6, v7, v8, objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_downloadStatusChanged_, 0, 0);

  v10 = (void *)MEMORY[0x1E0C99E60];
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  v13 = objc_opt_class();
  v14 = objc_opt_class();
  v15 = objc_opt_class();
  v16 = objc_opt_class();
  v17 = objc_opt_class();
  objc_msgSend(v10, "setWithObjects:", v11, v12, v13, v14, v15, v16, v17, objc_opt_class(), 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v18, sel_updatedTransactions_, 0, 0);

  return v2;
}

+ (id)serviceProxy
{
  if (serviceProxy_onceToken != -1)
    dispatch_once(&serviceProxy_onceToken, &__block_literal_global_11);
  return (id)serviceProxy__sharedServiceProxy;
}

void __30__SKServiceProxy_serviceProxy__block_invoke()
{
  SKServiceProxy *v0;
  void *v1;

  v0 = objc_alloc_init(SKServiceProxy);
  v1 = (void *)serviceProxy__sharedServiceProxy;
  serviceProxy__sharedServiceProxy = (uint64_t)v0;

}

- (SKServiceProxy)init
{
  SKServiceProxy *v2;
  NSLock *v3;
  NSLock *serviceConnectionLock;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SKServiceProxy;
  v2 = -[SKServiceProxy init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    serviceConnectionLock = v2->_serviceConnectionLock;
    v2->_serviceConnectionLock = v3;

  }
  return v2;
}

- (id)serviceConnection
{
  NSXPCConnection *v3;
  NSXPCConnection *serviceConnection;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSXPCConnection *v9;
  NSXPCConnection *v10;
  _QWORD v12[5];
  _QWORD v13[5];
  _QWORD v14[5];
  SKServiceProxy *v15;

  -[NSLock lock](self->_serviceConnectionLock, "lock");
  if (!self->_serviceConnection)
  {
    v3 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.storeagent.storekit"), 0);
    serviceConnection = self->_serviceConnection;
    self->_serviceConnection = v3;

    +[SKServiceProxy inAppServiceInterface](SKServiceProxy, "inAppServiceInterface");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](self->_serviceConnection, "setRemoteObjectInterface:", v5);

    +[SKServiceProxy inAppClientInterface](SKServiceProxy, "inAppClientInterface");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](self->_serviceConnection, "setExportedInterface:", v6);

    +[SKClientBroker defaultBroker](SKClientBroker, "defaultBroker");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedObject:](self->_serviceConnection, "setExportedObject:", v7);

    v14[0] = 0;
    v14[1] = v14;
    v14[2] = 0x3032000000;
    v14[3] = __Block_byref_object_copy__2;
    v14[4] = __Block_byref_object_dispose__2;
    v15 = self;
    v8 = MEMORY[0x1E0C809B0];
    v9 = self->_serviceConnection;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __35__SKServiceProxy_serviceConnection__block_invoke;
    v13[3] = &unk_1E5B26828;
    v13[4] = v14;
    -[NSXPCConnection setInterruptionHandler:](v9, "setInterruptionHandler:", v13);
    v10 = self->_serviceConnection;
    v12[0] = v8;
    v12[1] = 3221225472;
    v12[2] = __35__SKServiceProxy_serviceConnection__block_invoke_2;
    v12[3] = &unk_1E5B26828;
    v12[4] = v14;
    -[NSXPCConnection setInvalidationHandler:](v10, "setInvalidationHandler:", v12);
    -[NSXPCConnection resume](self->_serviceConnection, "resume");
    _Block_object_dispose(v14, 8);

  }
  -[NSLock unlock](self->_serviceConnectionLock, "unlock");
  return self->_serviceConnection;
}

uint64_t __35__SKServiceProxy_serviceConnection__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "_serviceConnectionInvalidated");
}

uint64_t __35__SKServiceProxy_serviceConnection__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "_serviceConnectionInvalidated");
}

- (void)_serviceConnectionInvalidated
{
  NSXPCConnection *serviceConnection;

  -[NSLock lock](self->_serviceConnectionLock, "lock");
  serviceConnection = self->_serviceConnection;
  self->_serviceConnection = 0;

  -[NSLock unlock](self->_serviceConnectionLock, "unlock");
}

- (id)objectProxyWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[SKServiceProxy serviceConnection](self, "serviceConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __46__SKServiceProxy_objectProxyWithErrorHandler___block_invoke;
  v9[3] = &unk_1E5B26C08;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __46__SKServiceProxy_objectProxyWithErrorHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (id)inAppService
{
  return -[SKServiceProxy inAppServiceWithErrorHandler:](self, "inAppServiceWithErrorHandler:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceConnection, 0);
  objc_storeStrong((id *)&self->_serviceConnectionLock, 0);
}

@end
