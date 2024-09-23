@implementation NRMockClientNSXPCConnection

- (NRMockClientNSXPCConnection)initWithMachServiceName:(id)a3 options:(unint64_t)a4
{
  id v6;
  NRMockClientNSXPCConnection *v7;
  NRMockClientNSXPCConnection *v8;
  id v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *queue;

  v6 = a3;
  v7 = -[NRMockClientNSXPCConnection init](self, "init");
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_name, a3);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.nanoregistry.mockxpclistener.%@.serverservice%p"), v6, v8);
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v10 = dispatch_queue_create((const char *)objc_msgSend(v9, "UTF8String"), 0);
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v10;

  }
  return v8;
}

- (NSString)processName
{
  return (NSString *)CFSTR("server");
}

- (void)runCompletionBlock:(id)a3
{
  _QWORD *v4;
  void *v5;
  dispatch_queue_t *v6;
  void *v7;
  dispatch_block_t block;

  block = a3;
  +[NRMockXPCStuff sharedInstance](NRMockXPCStuff, "sharedInstance");
  v4 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v4 = (_QWORD *)v4[1];
  objc_msgSend(v4, "objectForKeyedSubscript:", self->_name);
  v6 = (dispatch_queue_t *)objc_claimAutoreleasedReturnValue();
  -[NRMockClientNSXPCConnection serverConnection](self, "serverConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && v6)
    dispatch_async(v6[4], block);

}

- (NRMockServerNSXPCConnection)serverConnection
{
  NRMockServerNSXPCConnection **p_serverConnection;
  _BYTE *WeakRetained;
  _QWORD *v5;
  void *v6;
  _QWORD *v7;
  NRMockClientNSXPCConnection *v8;
  NRMockClientNSXPCConnection *v9;
  NSObject *v10;
  _QWORD block[5];
  NRMockClientNSXPCConnection *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  p_serverConnection = &self->_serverConnection;
  WeakRetained = objc_loadWeakRetained((id *)&self->_serverConnection);
  if (!WeakRetained)
  {
    objc_storeWeak(&self->_remoteObjectProxy, 0);
    objc_storeWeak(&self->_synchronousRemoteObjectProxy, 0);
    if (!self->_invalidated)
    {
      +[NRMockXPCStuff sharedInstance](NRMockXPCStuff, "sharedInstance");
      v5 = (_QWORD *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      if (v5)
        v5 = (_QWORD *)v5[1];
      objc_msgSend(v5, "objectForKeyedSubscript:", self->_name);
      v7 = (_QWORD *)objc_claimAutoreleasedReturnValue();
      v8 = self;
      v9 = v8;
      if (v7)
      {
        v15 = 0;
        v16 = &v15;
        v17 = 0x3032000000;
        v18 = __Block_byref_object_copy_;
        v19 = __Block_byref_object_dispose_;
        v20 = 0;
        v10 = v7[4];
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __60__NRMockNSXPCListener_serverConnectionWithClientConnection___block_invoke;
        block[3] = &unk_1E4495078;
        block[4] = v7;
        v13 = v8;
        v14 = &v15;
        dispatch_sync(v10, block);
        WeakRetained = (id)v16[5];

        _Block_object_dispose(&v15, 8);
      }
      else
      {
        WeakRetained = 0;
      }

      if (WeakRetained && WeakRetained[40])
      {

        WeakRetained = 0;
      }
    }
    objc_storeWeak((id *)p_serverConnection, WeakRetained);
  }
  return (NRMockServerNSXPCConnection *)WeakRetained;
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
  v8[2] = __52__NRMockClientNSXPCConnection_remoteObjectInterface__block_invoke;
  v8[3] = &unk_1E4494F20;
  v8[4] = self;
  v8[5] = &v9;
  dispatch_sync(v5, v8);
  v6 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  return (NSXPCInterface *)v6;
}

void __52__NRMockClientNSXPCConnection_remoteObjectInterface__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "serverConnection");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "exportedInterface");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)remoteObjectProxyAsync:(BOOL)a3
{
  _QWORD *v5;
  NSObject *v6;
  _QWORD *v7;
  id v8;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  BOOL v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  v19 = 0;
  +[NRMockXPCStuff sharedInstance](NRMockXPCStuff, "sharedInstance");
  v5 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v6 = v5[2];
  else
    v6 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __54__NRMockClientNSXPCConnection_remoteObjectProxyAsync___block_invoke;
  v10[3] = &unk_1E4494F68;
  v10[4] = self;
  v11 = v5;
  v12 = &v14;
  v13 = a3;
  v7 = v5;
  dispatch_sync(v6, v10);
  v8 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v8;
}

void __54__NRMockClientNSXPCConnection_remoteObjectProxyAsync___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id *v5;
  BOOL v6;
  uint64_t v7;
  id WeakRetained;
  NRMockXPCProxy *v9;
  void *v10;
  char v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;

  objc_msgSend(*(id *)(a1 + 32), "serverConnection");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v16 = (id)v2;
  if (v3)
    v4 = *(void **)(v3 + 8);
  else
    v4 = 0;
  objc_msgSend(v4, "objectForKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
  v5 = (id *)objc_claimAutoreleasedReturnValue();
  if (v16)
    v6 = v5 == 0;
  else
    v6 = 1;
  if (!v6)
  {
    v7 = 32;
    if (!*(_BYTE *)(a1 + 56))
      v7 = 24;
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + v7));
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), WeakRetained);

    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    {
      v9 = [NRMockXPCProxy alloc];
      objc_msgSend(v16, "exportedObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(_BYTE *)(a1 + 56);
      v12 = v5[4];
      -[NRMockXPCProxy initWithBlahBlahBlahTarget:queue:async:]((uint64_t)v9, v10, v12, v11);
      v13 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v14 = *(void **)(v13 + 40);
      *(_QWORD *)(v13 + 40) = v9;

      v15 = 32;
      if (!*(_BYTE *)(a1 + 56))
        v15 = 24;
      objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + v15), *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
    }
  }

}

- (id)remoteObjectProxy
{
  return -[NRMockClientNSXPCConnection remoteObjectProxyAsync:](self, "remoteObjectProxyAsync:", 1);
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  _QWORD block[4];
  id v10;

  v4 = a3;
  -[NRMockClientNSXPCConnection remoteObjectProxy](self, "remoteObjectProxy");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v4 && !v5)
  {
    -[NRMockClientNSXPCConnection queue](self, "queue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __65__NRMockClientNSXPCConnection_remoteObjectProxyWithErrorHandler___block_invoke;
    block[3] = &unk_1E4494F90;
    v10 = v4;
    dispatch_async(v7, block);

  }
  return v6;
}

void __65__NRMockClientNSXPCConnection_remoteObjectProxyWithErrorHandler___block_invoke(uint64_t a1)
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
  v7[0] = CFSTR("NSXPCConnectionInterrupted: Make sure mock server is running");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", v3, 4097, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v5);

}

- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  _QWORD *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  _QWORD block[4];
  id v14;

  v4 = a3;
  -[NRMockClientNSXPCConnection remoteObjectProxyAsync:](self, "remoteObjectProxyAsync:", 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v4 && !v5)
  {
    +[NRMockXPCStuff sharedInstance](NRMockXPCStuff, "sharedInstance");
    v7 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
      v7 = (_QWORD *)v7[1];
    objc_msgSend(v7, "objectForKeyedSubscript:", self->_name);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v9)
      v11 = *(NSObject **)(v9 + 32);
    else
      v11 = 0;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __76__NRMockClientNSXPCConnection_synchronousRemoteObjectProxyWithErrorHandler___block_invoke;
    block[3] = &unk_1E4494F90;
    v14 = v4;
    dispatch_async(v11, block);

  }
  return v6;
}

void __76__NRMockClientNSXPCConnection_synchronousRemoteObjectProxyWithErrorHandler___block_invoke(uint64_t a1)
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
  v7[0] = CFSTR("NSXPCConnectionInterrupted: Make sure mock server is running");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", v3, 4097, v4);
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
  block[2] = __41__NRMockClientNSXPCConnection_invalidate__block_invoke;
  block[3] = &unk_1E4494FB8;
  block[4] = self;
  dispatch_sync(isa, block);

}

uint64_t __41__NRMockClientNSXPCConnection_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

- (id)valueForEntitlement:(id)a3
{
  return (id)MEMORY[0x1E0C9AAB0];
}

- (void)_invalidate
{
  NSObject *isa;
  id WeakRetained;
  void *v5;
  void *v6;
  id invalidationHandler;
  NSObject *v8;

  +[NRMockXPCStuff sharedInstance](NRMockXPCStuff, "sharedInstance");
  isa = objc_claimAutoreleasedReturnValue();
  v8 = isa;
  if (isa)
    isa = isa[2].isa;
  dispatch_assert_queue_V2(isa);
  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    WeakRetained = objc_loadWeakRetained((id *)&self->_serverConnection);
    v5 = WeakRetained;
    if (WeakRetained)
    {
      -[NRMockServerNSXPCConnection _invalidate]((uint64_t)WeakRetained);
      objc_storeWeak((id *)&self->_serverConnection, 0);
    }
    objc_storeWeak(&self->_synchronousRemoteObjectProxy, 0);
    objc_storeWeak(&self->_remoteObjectProxy, 0);
    v6 = (void *)MEMORY[0x1A1B01DE4](self->_invalidationHandler);
    invalidationHandler = self->_invalidationHandler;
    self->_invalidationHandler = 0;

    if (v6)
      dispatch_async((dispatch_queue_t)self->_queue, v6);

  }
}

- (int)processIdentifier
{
  return 0;
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (id)interruptionHandler
{
  return self->_interruptionHandler;
}

- (void)setInterruptionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (BOOL)invalidated
{
  return self->_invalidated;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_exportedObject, 0);
  objc_storeStrong((id *)&self->_exportedInterface, 0);
  objc_destroyWeak(&self->_remoteObjectProxy);
  objc_destroyWeak(&self->_synchronousRemoteObjectProxy);
  objc_destroyWeak((id *)&self->_serverConnection);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
