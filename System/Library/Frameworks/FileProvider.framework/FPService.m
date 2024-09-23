@implementation FPService

id __30__FPService_remoteObjectProxy__block_invoke_2()
{
  return (id)objc_opt_self();
}

id __30__FPService_remoteObjectProxy__block_invoke(uint64_t a1)
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __30__FPService_remoteObjectProxy__block_invoke_2;
  v2[3] = &unk_1E444BDA8;
  v2[4] = *(_QWORD *)(a1 + 32);
  return (id)MEMORY[0x1A1B00850](v2);
}

- (id)remoteObjectProxy
{
  void *v3;
  FPXPCAutomaticErrorProxy *v4;
  void *connection;
  void *v6;
  Protocol *v7;
  void *v8;
  FPXPCAutomaticErrorProxy *v9;
  _QWORD v11[5];

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __30__FPService_remoteObjectProxy__block_invoke;
  v11[3] = &unk_1E444BDD0;
  v11[4] = self;
  v3 = (void *)MEMORY[0x1A1B00850](v11, a2);
  v4 = [FPXPCAutomaticErrorProxy alloc];
  connection = self->_connection;
  if (!connection)
    connection = self->_proxy;
  -[NSXPCInterface protocol](self->_interface, "protocol");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSXPCInterface protocol](self->_interface, "protocol");
  v7 = (Protocol *)objc_claimAutoreleasedReturnValue();
  NSStringFromProtocol(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[FPXPCAutomaticErrorProxy initWithConnection:protocol:orError:name:requestPid:requestWillBegin:](v4, "initWithConnection:protocol:orError:name:requestPid:requestWillBegin:", connection, v6, 0, v8, getpid(), v3);

  return v9;
}

- (void)invalidate
{
  FPDLifetimeServicing *extender;
  FPService *obj;

  obj = self;
  objc_sync_enter(obj);
  -[FPDLifetimeServicing stopExtendingLifetime](obj->_extender, "stopExtendingLifetime");
  extender = obj->_extender;
  obj->_extender = 0;

  -[NSXPCConnection invalidate](obj->_connection, "invalidate");
  objc_sync_exit(obj);

}

- (FPService)initWithProxy:(id)a3 interface:(id)a4 lifetimeExtender:(id)a5 providerDomainID:(id)a6
{
  id v10;
  id v11;
  id v12;
  FPService *v13;
  FPService *v14;
  objc_super v16;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v16.receiver = self;
  v16.super_class = (Class)FPService;
  v13 = -[FPService init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_extender, a5);
    objc_storeStrong((id *)&v14->_proxy, a3);
    objc_storeStrong((id *)&v14->_interface, a4);
  }

  return v14;
}

- (void)dealloc
{
  objc_super v3;

  -[FPService invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)FPService;
  -[FPService dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interface, 0);
  objc_storeStrong((id *)&self->_proxy, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_extender, 0);
}

- (FPService)initWithEndpoint:(id)a3 interface:(id)a4 lifetimeExtender:(id)a5 providerDomainID:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  FPService *v14;
  FPService *v15;
  uint64_t v16;
  NSXPCConnection *connection;
  NSXPCConnection *v18;
  FPXPCSanitizer *v19;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t);
  void *v24;
  id v25;
  id location;
  objc_super v27;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v27.receiver = self;
  v27.super_class = (Class)FPService;
  v14 = -[FPService init](&v27, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_extender, a5);
    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithListenerEndpoint:", v10);
    connection = v15->_connection;
    v15->_connection = (NSXPCConnection *)v16;

    -[NSXPCConnection setRemoteObjectInterface:](v15->_connection, "setRemoteObjectInterface:", v11);
    v18 = v15->_connection;
    v19 = -[FPXPCSanitizer initWithProviderDomainIdentifier:]([FPXPCSanitizer alloc], "initWithProviderDomainIdentifier:", v13);
    -[NSXPCConnection fp_annotateWithXPCSanitizer:](v18, "fp_annotateWithXPCSanitizer:", v19);

    objc_storeStrong((id *)&v15->_interface, a4);
    location = 0;
    objc_initWeak(&location, v15);
    v21 = MEMORY[0x1E0C809B0];
    v22 = 3221225472;
    v23 = __74__FPService_initWithEndpoint_interface_lifetimeExtender_providerDomainID___block_invoke;
    v24 = &unk_1E44499C0;
    objc_copyWeak(&v25, &location);
    -[NSXPCConnection setInterruptionHandler:](v15->_connection, "setInterruptionHandler:", &v21);
    -[NSXPCConnection resume](v15->_connection, "resume", v21, v22, v23, v24);
    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }

  return v15;
}

void __74__FPService_initWithEndpoint_interface_lifetimeExtender_providerDomainID___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "invalidate");

}

- (id)remoteObjectProxyCreating
{
  return -[NSXPCConnection remoteObjectProxy](self->_connection, "remoteObjectProxy");
}

- (id)synchronousRemoteObjectProxy
{
  void *v2;
  void *v3;

  -[FPService remoteObjectProxy](self, "remoteObjectProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "synchronousRemoteObjectProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
