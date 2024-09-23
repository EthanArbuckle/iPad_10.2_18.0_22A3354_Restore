@implementation AKAdaptiveService

- (id)_initWithInterface:(id)a3 object:(id)a4
{
  id v7;
  id v8;
  AKAdaptiveService *v9;
  id *p_isa;
  uint64_t v11;
  id v12;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AKAdaptiveService;
  v9 = -[AKAdaptiveService init](&v14, sel_init);
  p_isa = (id *)&v9->super.isa;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_exportedInterface, a3);
    objc_storeStrong(p_isa + 2, a4);
    objc_msgSend(MEMORY[0x1E0CB3B58], "anonymousListener");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = p_isa[3];
    p_isa[3] = (id)v11;

    objc_msgSend(p_isa[3], "setDelegate:", p_isa);
  }

  return p_isa;
}

- (AKAdaptiveService)initWithInterface:(id)a3 strongObject:(id)a4
{
  id v6;
  id v7;
  _AKMessageForwarder *v8;
  AKAdaptiveService *v9;

  v6 = a4;
  v7 = a3;
  v8 = -[_AKMessageForwarder initWithStrongReceiver:]([_AKMessageForwarder alloc], "initWithStrongReceiver:", v6);

  v9 = (AKAdaptiveService *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithInterface:object:", v7, v8);
  return v9;
}

- (AKAdaptiveService)initWithInterface:(id)a3 weakObject:(id)a4
{
  id v6;
  id v7;
  _AKMessageForwarder *v8;
  AKAdaptiveService *v9;

  v6 = a4;
  v7 = a3;
  v8 = -[_AKMessageForwarder initWithWeakReceiver:]([_AKMessageForwarder alloc], "initWithWeakReceiver:", v6);

  v9 = (AKAdaptiveService *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithInterface:object:", v7, v8);
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  -[AKAdaptiveService invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)AKAdaptiveService;
  -[AKAdaptiveService dealloc](&v3, sel_dealloc);
}

- (void)activate
{
  -[NSXPCListener activate](self->_listener, "activate");
}

- (void)resume
{
  -[NSXPCListener resume](self->_listener, "resume");
}

- (void)invalidate
{
  id interruptionHandler;
  id invalidationHandler;

  interruptionHandler = self->_interruptionHandler;
  self->_interruptionHandler = 0;

  invalidationHandler = self->_invalidationHandler;
  self->_invalidationHandler = 0;

  -[NSXPCListener invalidate](self->_listener, "invalidate");
}

- (id)listenerEndpoint
{
  return -[NSXPCListener endpoint](self->_listener, "endpoint");
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14[2];
  _QWORD v15[4];
  id v16;
  id location;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "setExportedInterface:", self->_exportedInterface);
  objc_msgSend(v7, "setExportedObject:", self->_exportedObject);
  objc_msgSend(v7, "setRemoteObjectInterface:", self->_remoteObjectInterface);
  objc_initWeak(&location, self);
  v8 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __56__AKAdaptiveService_listener_shouldAcceptNewConnection___block_invoke;
  v15[3] = &unk_1E2E5E1F8;
  objc_copyWeak(&v16, &location);
  objc_msgSend(v7, "setInterruptionHandler:", v15);
  v10 = v8;
  v11 = 3221225472;
  v12 = __56__AKAdaptiveService_listener_shouldAcceptNewConnection___block_invoke_2;
  v13 = &unk_1E2E5E350;
  v14[1] = v7;
  objc_copyWeak(v14, &location);
  objc_msgSend(v7, "setInvalidationHandler:", &v10);
  objc_msgSend(v7, "setShouldHandleInvalidation:", 0, v10, v11, v12, v13);
  objc_msgSend(v7, "activate");
  objc_destroyWeak(v14);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

  return 1;
}

void __56__AKAdaptiveService_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  void *v1;
  void (**v2)(void);
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "interruptionHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if (v1)
  {
    objc_msgSend(WeakRetained, "interruptionHandler");
    v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v2[2]();

  }
}

void __56__AKAdaptiveService_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1)
{
  void *v2;
  void (**v3)(void);
  id WeakRetained;

  if (objc_msgSend(*(id *)(a1 + 40), "shouldHandleInvalidation"))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "invalidationHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (v2)
    {
      objc_msgSend(WeakRetained, "invalidationHandler");
      v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v3[2]();

    }
  }
}

- (NSXPCInterface)remoteObjectInterface
{
  return self->_remoteObjectInterface;
}

- (void)setRemoteObjectInterface:(id)a3
{
  objc_storeStrong((id *)&self->_remoteObjectInterface, a3);
}

- (id)interruptionHandler
{
  return self->_interruptionHandler;
}

- (void)setInterruptionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong((id *)&self->_remoteObjectInterface, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong(&self->_exportedObject, 0);
  objc_storeStrong((id *)&self->_exportedInterface, 0);
}

@end
