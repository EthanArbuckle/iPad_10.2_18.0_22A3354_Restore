@implementation NRMockNSXPCListener

- (NRMockNSXPCListener)initWithMachServiceName:(id)a3
{
  id v5;
  NRMockNSXPCListener *v6;
  NRMockNSXPCListener *v7;
  id v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *queue;
  _QWORD *v11;
  void *v12;
  NSObject *v13;
  id v14;
  _QWORD block[4];
  id v17;
  id v18;
  NRMockNSXPCListener *v19;
  objc_super v20;

  v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)NRMockNSXPCListener;
  v6 = -[NRMockNSXPCListener init](&v20, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_name, a3);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.nanoregistry.mockxpclistener.%@"), v5);
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v9 = dispatch_queue_create((const char *)objc_msgSend(v8, "UTF8String"), 0);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v9;

    -[NRMockNSXPCListener suspend](v7, "suspend");
    +[NRMockXPCStuff sharedInstance](NRMockXPCStuff, "sharedInstance");
    v11 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
      v13 = v11[2];
    else
      v13 = 0;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __47__NRMockNSXPCListener_initWithMachServiceName___block_invoke;
    block[3] = &unk_1E4495008;
    v17 = v11;
    v18 = v5;
    v19 = v7;
    v14 = v12;
    dispatch_sync(v13, block);

  }
  return v7;
}

uint64_t __47__NRMockNSXPCListener_initWithMachServiceName___block_invoke(_QWORD *a1)
{
  _QWORD *v1;

  v1 = (_QWORD *)a1[4];
  if (v1)
    v1 = (_QWORD *)v1[1];
  return objc_msgSend(v1, "setObject:forKeyedSubscript:", a1[6], a1[5]);
}

- (void)resume
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
  block[2] = __29__NRMockNSXPCListener_resume__block_invoke;
  block[3] = &unk_1E4494FB8;
  block[4] = self;
  dispatch_sync(isa, block);

}

void __29__NRMockNSXPCListener_resume__block_invoke(uint64_t a1)
{
  dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 32));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 0;
}

- (void)suspend
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
  block[2] = __30__NRMockNSXPCListener_suspend__block_invoke;
  block[3] = &unk_1E4494FB8;
  block[4] = self;
  dispatch_sync(isa, block);

}

void __30__NRMockNSXPCListener_suspend__block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 1;
  dispatch_suspend(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 32));
}

- (void)invalidate
{
  _QWORD *v3;
  NSObject *v4;
  _QWORD *v5;
  _QWORD block[5];
  id v7;

  +[NRMockXPCStuff sharedInstance](NRMockXPCStuff, "sharedInstance");
  v3 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = v3[2];
  else
    v4 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__NRMockNSXPCListener_invalidate__block_invoke;
  block[3] = &unk_1E4495030;
  block[4] = self;
  v7 = v3;
  v5 = v3;
  dispatch_sync(v4, block);

}

uint64_t __33__NRMockNSXPCListener_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v2 + 8))
  {
    *(_BYTE *)(v2 + 8) = 1;
    dispatch_suspend(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 32));
  }
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    v4 = *(void **)(v3 + 8);
  else
    v4 = 0;
  result = objc_msgSend(v4, "removeObjectForKey:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 9) = 1;
  return result;
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
  dispatch_sync(isa, &__block_literal_global_212);

  v5.receiver = self;
  v5.super_class = (Class)NRMockNSXPCListener;
  -[NRMockNSXPCListener dealloc](&v5, sel_dealloc);
}

void __60__NRMockNSXPCListener_serverConnectionWithClientConnection___block_invoke(_QWORD *a1)
{
  NRMockServerNSXPCConnection *obj;

  obj = -[NRMockServerNSXPCConnection initWithListener:clientConnection:]([NRMockServerNSXPCConnection alloc], "initWithListener:clientConnection:", a1[4], a1[5]);
  if (objc_msgSend(*(id *)(a1[4] + 16), "listener:shouldAcceptNewConnection:"))
    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), obj);

}

- (NRNSXPCListenerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

@end
