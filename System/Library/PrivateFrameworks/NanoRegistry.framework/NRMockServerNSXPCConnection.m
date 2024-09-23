@implementation NRMockServerNSXPCConnection

- (void)_invalidate
{
  NSObject *isa;
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;

  if (a1)
  {
    +[NRMockXPCStuff sharedInstance](NRMockXPCStuff, "sharedInstance");
    isa = objc_claimAutoreleasedReturnValue();
    v7 = isa;
    if (isa)
      isa = isa[2].isa;
    dispatch_assert_queue_V2(isa);
    if (!*(_BYTE *)(a1 + 40))
    {
      *(_BYTE *)(a1 + 40) = 1;
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
      v4 = WeakRetained;
      if (WeakRetained)
      {
        objc_msgSend(WeakRetained, "_invalidate");
        objc_storeWeak((id *)(a1 + 8), 0);
      }
      objc_storeWeak((id *)(a1 + 24), 0);
      objc_storeWeak((id *)(a1 + 32), 0);
      v5 = (void *)MEMORY[0x1A1B01DE4](*(_QWORD *)(a1 + 72));
      v6 = *(void **)(a1 + 72);
      *(_QWORD *)(a1 + 72) = 0;

      if (v5)
        dispatch_async(*(dispatch_queue_t *)(a1 + 48), v5);

    }
  }
}

- (NRMockServerNSXPCConnection)initWithListener:(id)a3 clientConnection:(id)a4
{
  _QWORD *v6;
  id v7;
  NRMockServerNSXPCConnection *v8;
  NRMockServerNSXPCConnection *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  v8 = -[NRMockServerNSXPCConnection init](self, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_clientConnection, v7);
    objc_storeWeak((id *)&v9->_listener, v6);
    if (v6)
      v10 = (void *)v6[4];
    else
      v10 = 0;
    objc_storeStrong((id *)&v9->_queue, v10);
    -[NRMockServerNSXPCConnection suspend](v9, "suspend");
  }

  return v9;
}

- (NSString)processName
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("client%ld"), -[NRMockServerNSXPCConnection processIdentifier](self, "processIdentifier"));
}

- (id)valueForEntitlement:(id)a3
{
  return (id)MEMORY[0x1E0C9AAB0];
}

- (void)runCompletionBlock:(id)a3
{
  id WeakRetained;
  void *v5;
  NSObject *v6;
  dispatch_block_t block;

  block = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_clientConnection);
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "queue");
    v6 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v6, block);

  }
}

- (NSXPCInterface)remoteObjectInterface
{
  uint64_t v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy_;
  v13 = __Block_byref_object_dispose_;
  v14 = 0;
  +[NRMockXPCStuff sharedInstance](NRMockXPCStuff, "sharedInstance");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
    v5 = *(NSObject **)(v3 + 16);
  else
    v5 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __52__NRMockServerNSXPCConnection_remoteObjectInterface__block_invoke;
  v8[3] = &unk_1E4494F20;
  v8[4] = self;
  v8[5] = &v9;
  dispatch_sync(v5, v8);
  v6 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  return (NSXPCInterface *)v6;
}

void __52__NRMockServerNSXPCConnection_remoteObjectInterface__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  if ((objc_msgSend(WeakRetained, "invalidated") & 1) == 0)
  {
    objc_msgSend(WeakRetained, "exportedInterface");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "copy");
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
}

- (id)remoteObjectProxyAsync:(BOOL)a3
{
  uint64_t v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD block[6];
  BOOL v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  v17 = 0;
  +[NRMockXPCStuff sharedInstance](NRMockXPCStuff, "sharedInstance");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = *(NSObject **)(v5 + 16);
  else
    v7 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__NRMockServerNSXPCConnection_remoteObjectProxyAsync___block_invoke;
  block[3] = &unk_1E4494FE0;
  block[4] = self;
  block[5] = &v12;
  v11 = a3;
  dispatch_sync(v7, block);
  v8 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v8;
}

void __54__NRMockServerNSXPCConnection_remoteObjectProxyAsync___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  char v4;
  uint64_t v5;
  id v6;
  NRMockXPCProxy *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v13 = WeakRetained;
    v4 = objc_msgSend(WeakRetained, "invalidated");
    v3 = v13;
    if ((v4 & 1) == 0)
    {
      v5 = 32;
      if (!*(_BYTE *)(a1 + 48))
        v5 = 24;
      v6 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + v5));
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v6);

      v3 = v13;
      if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
      {
        v7 = [NRMockXPCProxy alloc];
        objc_msgSend(v13, "exportedObject");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "queue");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[NRMockXPCProxy initWithBlahBlahBlahTarget:queue:async:]((uint64_t)v7, v8, v9, *(_BYTE *)(a1 + 48));
        v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v11 = *(void **)(v10 + 40);
        *(_QWORD *)(v10 + 40) = v7;

        v12 = 32;
        if (!*(_BYTE *)(a1 + 48))
          v12 = 24;
        objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + v12), *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
        v3 = v13;
      }
    }
  }

}

- (id)remoteObjectProxy
{
  return -[NRMockServerNSXPCConnection remoteObjectProxyAsync:](self, "remoteObjectProxyAsync:", 1);
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  NSObject **WeakRetained;
  NSObject **v8;
  NSObject *v9;
  _QWORD block[4];
  id v12;

  v4 = a3;
  -[NRMockServerNSXPCConnection remoteObjectProxy](self, "remoteObjectProxy");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v4 && !v5)
  {
    WeakRetained = (NSObject **)objc_loadWeakRetained((id *)&self->_listener);
    v8 = WeakRetained;
    if (WeakRetained)
      v9 = WeakRetained[4];
    else
      v9 = 0;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __65__NRMockServerNSXPCConnection_remoteObjectProxyWithErrorHandler___block_invoke;
    block[3] = &unk_1E4494F90;
    v12 = v4;
    dispatch_async(v9, block);

  }
  return v6;
}

void __65__NRMockServerNSXPCConnection_remoteObjectProxyWithErrorHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v2 = (void *)MEMORY[0x1E0CB35C8];
  v3 = *MEMORY[0x1E0CB28A8];
  v6 = *MEMORY[0x1E0CB2D50];
  v7[0] = CFSTR("NSXPCConnectionInvalid: Did mock client stop running?");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", v3, 4099, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v5);

}

- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  NSObject **WeakRetained;
  NSObject **v8;
  NSObject *v9;
  _QWORD block[4];
  id v12;

  v4 = a3;
  -[NRMockServerNSXPCConnection remoteObjectProxyAsync:](self, "remoteObjectProxyAsync:", 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v4 && !v5)
  {
    WeakRetained = (NSObject **)objc_loadWeakRetained((id *)&self->_listener);
    v8 = WeakRetained;
    if (WeakRetained)
      v9 = WeakRetained[4];
    else
      v9 = 0;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __76__NRMockServerNSXPCConnection_synchronousRemoteObjectProxyWithErrorHandler___block_invoke;
    block[3] = &unk_1E4494F90;
    v12 = v4;
    dispatch_async(v9, block);

  }
  return v6;
}

void __76__NRMockServerNSXPCConnection_synchronousRemoteObjectProxyWithErrorHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v2 = (void *)MEMORY[0x1E0CB35C8];
  v3 = *MEMORY[0x1E0CB28A8];
  v6 = *MEMORY[0x1E0CB2D50];
  v7[0] = CFSTR("NSXPCConnectionInvalid: Did mock client stop running?");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", v3, 4099, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v5);

}

- (void)invalidate
{
  NSObject *isa;
  NSObject *v4;
  _QWORD block[5];

  +[NRMockXPCStuff sharedInstance](NRMockXPCStuff, "sharedInstance");
  isa = objc_claimAutoreleasedReturnValue();
  v4 = isa;
  if (isa)
    isa = isa[2].isa;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__NRMockServerNSXPCConnection_invalidate__block_invoke;
  block[3] = &unk_1E4494FB8;
  block[4] = self;
  dispatch_sync(isa, block);

}

void __41__NRMockServerNSXPCConnection_invalidate__block_invoke(uint64_t a1)
{
  -[NRMockServerNSXPCConnection _invalidate](*(_QWORD *)(a1 + 32));
}

- (void)dealloc
{
  NSObject *isa;
  NSObject *v4;
  objc_super v5;

  +[NRMockXPCStuff sharedInstance](NRMockXPCStuff, "sharedInstance");
  isa = objc_claimAutoreleasedReturnValue();
  v4 = isa;
  if (isa)
    isa = isa[2].isa;
  dispatch_sync(isa, &__block_literal_global_0);

  v5.receiver = self;
  v5.super_class = (Class)NRMockServerNSXPCConnection;
  -[NRMockServerNSXPCConnection dealloc](&v5, sel_dealloc);
}

- (NRMockServerNSXPCConnection)initWithMachServiceName:(id)a3 options:(unint64_t)a4
{

  return 0;
}

- (int)processIdentifier
{
  id WeakRetained;
  int v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_clientConnection);
  v3 = ((int)WeakRetained >> 8) % 10000;

  return v3;
}

- (NSXPCInterface)exportedInterface
{
  return self->_exportedInterface;
}

- (void)setExportedInterface:(id)a3
{
  objc_storeStrong((id *)&self->_exportedInterface, a3);
}

- (id)exportedObject
{
  return self->_exportedObject;
}

- (void)setExportedObject:(id)a3
{
  objc_storeStrong(&self->_exportedObject, a3);
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (id)interruptionHandler
{
  return self->_interruptionHandler;
}

- (void)setInterruptionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_exportedObject, 0);
  objc_storeStrong((id *)&self->_exportedInterface, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak(&self->_remoteObjectProxy);
  objc_destroyWeak(&self->_synchronousRemoteObjectProxy);
  objc_destroyWeak((id *)&self->_listener);
  objc_destroyWeak((id *)&self->_clientConnection);
}

@end
