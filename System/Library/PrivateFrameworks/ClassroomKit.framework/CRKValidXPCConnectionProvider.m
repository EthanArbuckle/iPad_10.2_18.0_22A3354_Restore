@implementation CRKValidXPCConnectionProvider

- (void)dealloc
{
  objc_super v3;

  -[CRKValidXPCConnectionProvider tearDownConnection](self, "tearDownConnection");
  v3.receiver = self;
  v3.super_class = (Class)CRKValidXPCConnectionProvider;
  -[CRKValidXPCConnectionProvider dealloc](&v3, sel_dealloc);
}

- (CRKValidXPCConnectionProvider)initWithBuilder:(id)a3
{
  id v4;
  CRKValidXPCConnectionProvider *v5;
  uint64_t v6;
  id builder;
  id v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *queue;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CRKValidXPCConnectionProvider;
  v5 = -[CRKValidXPCConnectionProvider init](&v12, sel_init);
  if (v5)
  {
    v6 = MEMORY[0x219A226E8](v4);
    builder = v5->_builder;
    v5->_builder = (id)v6;

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-%p"), objc_opt_class(), v5);
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v9 = dispatch_queue_create((const char *)objc_msgSend(v8, "UTF8String"), 0);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v9;

  }
  return v5;
}

- (NSXPCConnection)connection
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__2;
  v11 = __Block_byref_object_dispose__2;
  v12 = 0;
  -[CRKValidXPCConnectionProvider queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __43__CRKValidXPCConnectionProvider_connection__block_invoke;
  v6[3] = &unk_24D9CA448;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSXPCConnection *)v4;
}

void __43__CRKValidXPCConnectionProvider_connection__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "unprotectedConnection");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)unprotectedConnection
{
  void *v3;
  void *v4;

  -[CRKValidXPCConnectionProvider backingConnection](self, "backingConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[CRKValidXPCConnectionProvider makeConnection](self, "makeConnection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRKValidXPCConnectionProvider setBackingConnection:](self, "setBackingConnection:", v4);

  }
  return -[CRKValidXPCConnectionProvider backingConnection](self, "backingConnection");
}

- (id)makeConnection
{
  void *v3;
  void *v4;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  id v10;
  id v11;
  id from;
  id location;

  -[CRKValidXPCConnectionProvider invokeBuilder](self, "invokeBuilder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v3);
  objc_initWeak(&from, self);
  v6 = MEMORY[0x24BDAC760];
  v7 = 3221225472;
  v8 = __47__CRKValidXPCConnectionProvider_makeConnection__block_invoke;
  v9 = &unk_24D9CA498;
  objc_copyWeak(&v10, &from);
  objc_copyWeak(&v11, &location);
  v4 = (void *)MEMORY[0x219A226E8](&v6);
  objc_msgSend(v3, "setInterruptionHandler:", v4, v6, v7, v8, v9);
  objc_msgSend(v3, "setInvalidationHandler:", v4);
  objc_msgSend(v3, "resume");

  objc_destroyWeak(&v11);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
  return v3;
}

void __47__CRKValidXPCConnectionProvider_makeConnection__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  _QWORD v5[5];
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "queue");
    v4 = objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __47__CRKValidXPCConnectionProvider_makeConnection__block_invoke_2;
    v5[3] = &unk_24D9CA470;
    v5[4] = v3;
    objc_copyWeak(&v6, (id *)(a1 + 40));
    dispatch_async(v4, v5);

    objc_destroyWeak(&v6);
  }

}

void __47__CRKValidXPCConnectionProvider_makeConnection__block_invoke_2(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  v1 = *(void **)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v1, "connectionDied:", WeakRetained);

}

- (id)invokeBuilder
{
  void *v3;
  void (**v4)(void);
  void *v5;

  v3 = (void *)MEMORY[0x219A22538](self, a2);
  -[CRKValidXPCConnectionProvider builder](self, "builder");
  v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v4[2]();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v3);
  return v5;
}

- (void)connectionDied:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;

  v4 = a3;
  -[CRKValidXPCConnectionProvider backingConnection](self, "backingConnection");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    if (_CRKLogGeneral_onceToken_35 != -1)
      dispatch_once(&_CRKLogGeneral_onceToken_35, &__block_literal_global_104);
    v6 = _CRKLogGeneral_logObj_35;
    if (os_log_type_enabled((os_log_t)_CRKLogGeneral_logObj_35, OS_LOG_TYPE_ERROR))
      -[CRKValidXPCConnectionProvider connectionDied:].cold.1((uint64_t)v4, v6);
    -[CRKValidXPCConnectionProvider tearDownConnection](self, "tearDownConnection");
  }

}

- (void)tearDownConnection
{
  id v2;

  -[CRKValidXPCConnectionProvider captureConnection](self, "captureConnection");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setInterruptionHandler:", 0);
  objc_msgSend(v2, "setInvalidationHandler:", 0);
  objc_msgSend(v2, "invalidate");

}

- (id)captureConnection
{
  void *v3;

  -[CRKValidXPCConnectionProvider backingConnection](self, "backingConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKValidXPCConnectionProvider setBackingConnection:](self, "setBackingConnection:", 0);
  return v3;
}

- (NSXPCConnection)backingConnection
{
  return self->_backingConnection;
}

- (void)setBackingConnection:(id)a3
{
  objc_storeStrong((id *)&self->_backingConnection, a3);
}

- (id)builder
{
  return self->_builder;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_builder, 0);
  objc_storeStrong((id *)&self->_backingConnection, 0);
}

- (void)connectionDied:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_218C99000, a2, OS_LOG_TYPE_ERROR, "XPC connection died: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
