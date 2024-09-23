@implementation DASession

- (DASession)initWithDelegate:(id)a3
{
  id v4;
  DASession *v5;
  DASessionInternal *v6;
  DASessionInternal *internal;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DASession;
  v5 = -[DASession init](&v9, sel_init);
  if (v5)
  {
    v6 = -[DASessionInternal initWithDelegate:]([DASessionInternal alloc], "initWithDelegate:", v4);
    internal = v5->_internal;
    v5->_internal = v6;

  }
  return v5;
}

- (void)endSession
{
  DASession *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[6];
  _QWORD v11[5];
  _QWORD v12[5];
  id v13;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_hasEnded)
  {
    v12[0] = 0;
    v12[1] = v12;
    v12[2] = 0x3032000000;
    v12[3] = __Block_byref_object_copy__1;
    v12[4] = __Block_byref_object_dispose__1;
    v13 = 0;
    KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DASession endSession]", 48, &stru_24C3287B0, v3, v4, v5, v6, v9);
    v7 = MEMORY[0x24BDAC760];
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __23__DASession_endSession__block_invoke;
    v11[3] = &unk_24C327380;
    v11[4] = v12;
    -[DASession getRemoteProxy:](v2, "getRemoteProxy:", v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v7;
    v10[1] = 3221225472;
    v10[2] = __23__DASession_endSession__block_invoke_2;
    v10[3] = &unk_24C327A40;
    v10[4] = v2;
    v10[5] = v12;
    objc_msgSend(v8, "endSessionWithCompletion:", v10);

    _Block_object_dispose(v12, 8);
  }
  objc_sync_exit(v2);

}

void __23__DASession_endSession__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v3 = a2;
  KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DASession endSession]_block_invoke", 50, CFSTR("%@"), v4, v5, v6, v7, (uint64_t)v3);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v3;

}

void __23__DASession_endSession__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DASession endSession]_block_invoke_2", 53, CFSTR("Proxy end session"), v4, v5, v6, v7, v8);
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  if (!v9)
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) = 1;

}

- (void)setProxy:(id)a3
{
  -[DASessionInternal setProxy:](self->_internal, "setProxy:", a3);
}

- (id)getRemoteProxy:(id)a3
{
  void (**v4)(id, void *);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, void *))a3;
  -[DASessionInternal synchronousRemoteObjectProxyWithErrorHandler:](self->_internal, "synchronousRemoteObjectProxyWithErrorHandler:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DASession getRemoteProxy:]", 74, CFSTR("XPC proxy not available"), v5, v6, v7, v8, v15);
    v10 = (void *)MEMORY[0x24BDD1540];
    v16 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", DAErrorString(216));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v11;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("DigitalAccessError"), 216, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v13);

  }
  return v9;
}

- (id)getDelegate
{
  return -[DASessionInternal delegate](self->_internal, "delegate");
}

- (void)dispatchOnCallbackQueue:(id)a3
{
  -[DASessionInternal dispatchBlockOnCallback:](self->_internal, "dispatchBlockOnCallback:", a3);
}

- (void)didStart:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  DASessionInternal *internal;
  _QWORD v9[4];
  id v10;
  id location;

  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DASession didStart:]", 98, CFSTR(": %d"), v3, v4, v5, v6, a3);
  objc_initWeak(&location, self);
  internal = self->_internal;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __22__DASession_didStart___block_invoke;
  v9[3] = &unk_24C327A68;
  objc_copyWeak(&v10, &location);
  -[DASessionInternal dispatchBlockOnCallback:](internal, "dispatchBlockOnCallback:", v9);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __22__DASession_didStart___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  void *v2;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained[2], "delegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "daSession:didBecomeActive:", v3, 0);

    WeakRetained = v3;
  }

}

- (void)didEnd:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  DASessionInternal *internal;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id location;

  v4 = a3;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DASession didEnd:]", 112, CFSTR(":%@"), v5, v6, v7, v8, (uint64_t)v4);
  objc_initWeak(&location, self);
  internal = self->_internal;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __20__DASession_didEnd___block_invoke;
  v11[3] = &unk_24C327A90;
  objc_copyWeak(&v13, &location);
  v10 = v4;
  v12 = v10;
  -[DASessionInternal dispatchBlockOnCallback:](internal, "dispatchBlockOnCallback:", v11);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

void __20__DASession_didEnd___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    +[DAManager sharedManager](DAManager, "sharedManager");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "unregisterSession:", WeakRetained);

    objc_msgSend(WeakRetained[2], "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "daSession:didEnd:", WeakRetained, *(_QWORD *)(a1 + 32));

    objc_msgSend(WeakRetained[2], "closeProxy");
    v4 = WeakRetained[2];
    WeakRetained[2] = 0;

  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DASession)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)DASession;
  return -[DASession init](&v4, sel_init, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internal, 0);
  objc_storeStrong((id *)&self->_clientConnection, 0);
}

@end
