@implementation FMNSXPCCachedConnection

void __37__FMNSXPCCachedConnection_invalidate__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_invalidate");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong(&self->_failureBlock, 0);
  objc_storeStrong(&self->_didInvalidate, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)invalidate
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[FMNSXPCCachedConnection serialQueue](self, "serialQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __37__FMNSXPCCachedConnection_invalidate__block_invoke;
  v4[3] = &unk_1E829C900;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (FMNSXPCCachedConnection)initWithFMNSXPCConnection:(id)a3
{
  id v4;
  FMNSXPCCachedConnection *v5;
  FMNSXPCCachedConnection *v6;
  dispatch_queue_t v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FMNSXPCCachedConnection;
  v5 = -[FMNSXPCCachedConnection init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    -[FMNSXPCCachedConnection setConnection:](v5, "setConnection:", v4);
    v7 = dispatch_queue_create("FMNSXPCCachedConnectionSerialQueue", 0);
    -[FMNSXPCCachedConnection setSerialQueue:](v6, "setSerialQueue:", v7);

  }
  return v6;
}

- (void)setSerialQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serialQueue, a3);
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (void)addFailureBlock:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id location;

  v4 = a3;
  -[FMNSXPCCachedConnection setFailureBlock:](self, "setFailureBlock:", v4);
  objc_initWeak(&location, self);
  -[FMNSXPCCachedConnection connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __43__FMNSXPCCachedConnection_addFailureBlock___block_invoke;
  v6[3] = &unk_1E829C8D8;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v5, "addFailureBlock:", v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

- (void)setFailureBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)remoteObjectProxy
{
  void *v2;
  void *v3;

  -[FMNSXPCCachedConnection connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteObjectProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (FMNSXPCConnection)connection
{
  return self->_connection;
}

void __43__FMNSXPCCachedConnection_addFailureBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  NSObject *v4;
  NSObject *v5;
  _QWORD v6[6];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "serialQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __43__FMNSXPCCachedConnection_addFailureBlock___block_invoke_2;
    v6[3] = &unk_1E829C8B0;
    v6[4] = WeakRetained;
    v6[5] = a2;
    dispatch_async(v4, v6);
  }

}

void __43__FMNSXPCCachedConnection_addFailureBlock___block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  id v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  objc_msgSend(*(id *)(a1 + 32), "failureBlock");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_get_global_queue(0, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __43__FMNSXPCCachedConnection_addFailureBlock___block_invoke_3;
  v6[3] = &unk_1E829C888;
  v4 = *(_QWORD *)(a1 + 40);
  v7 = v2;
  v8 = v4;
  v5 = v2;
  dispatch_async(v3, v6);

}

uint64_t __43__FMNSXPCCachedConnection_addFailureBlock___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 40));
  return result;
}

- (void)_invalidate
{
  void *v3;
  void *v4;
  void *v5;
  void (**v6)(void);

  -[FMNSXPCCachedConnection connection](self, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {

  }
  else
  {
    -[FMNSXPCCachedConnection failureBlock](self, "failureBlock");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
      return;
  }
  -[FMNSXPCCachedConnection setFailureBlock:](self, "setFailureBlock:", 0);
  -[FMNSXPCCachedConnection setConnection:](self, "setConnection:", 0);
  -[FMNSXPCCachedConnection didInvalidate](self, "didInvalidate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[FMNSXPCCachedConnection didInvalidate](self, "didInvalidate");
    v6 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v6[2]();

    -[FMNSXPCCachedConnection setDidInvalidate:](self, "setDidInvalidate:", 0);
  }
}

- (id)didInvalidate
{
  return self->_didInvalidate;
}

- (void)setDidInvalidate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)failureBlock
{
  return self->_failureBlock;
}

@end
