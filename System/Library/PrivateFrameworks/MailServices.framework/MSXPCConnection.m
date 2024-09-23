@implementation MSXPCConnection

uint64_t __29__MSXPCConnection_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_invokeInvalidationHandler");
}

uint64_t __76__MSXPCConnection__sendInvocation_remoteInterface_remoteProxy_errorHandler___block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "becomeCurrentWithPendingUnitCount:", 1);
  objc_msgSend(*(id *)(a1 + 40), "invokeWithTarget:", *(_QWORD *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 32), "resignCurrent");
}

- (void)dealloc
{
  objc_super v3;

  -[MSXPCConnection _invalidatePromise:](self, "_invalidatePromise:", self->_connectionPromise);
  v3.receiver = self;
  v3.super_class = (Class)MSXPCConnection;
  -[MSXPCConnection dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  BOOL *p_locallyInvalidated;
  unsigned __int8 v3;
  NSObject *queue;
  _QWORD block[5];

  p_locallyInvalidated = &self->_locallyInvalidated;
  do
    v3 = __ldaxr((unsigned __int8 *)p_locallyInvalidated);
  while (__stlxr(1u, (unsigned __int8 *)p_locallyInvalidated));
  if ((v3 & 1) == 0)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __29__MSXPCConnection_invalidate__block_invoke;
    block[3] = &unk_24C3857F8;
    block[4] = self;
    dispatch_async(queue, block);
  }
}

void __76__MSXPCConnection__sendInvocation_remoteInterface_remoteProxy_errorHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;
  id v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "___nsxpc_remoteObjectProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", *(_QWORD *)(a1 + 64));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "___setNSXPCRemoteObjectProxy:", v4);
  }
  v5 = *(void **)(a1 + 48);
  v6 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 168);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __76__MSXPCConnection__sendInvocation_remoteInterface_remoteProxy_errorHandler___block_invoke_4;
  block[3] = &unk_24C385980;
  v9 = v5;
  v10 = *(id *)(a1 + 56);
  v11 = v4;
  v7 = v4;
  dispatch_async(v6, block);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protocol, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong(&self->_exportedObject, 0);
  objc_storeStrong((id *)&self->_exportedInterface, 0);
  objc_storeStrong((id *)&self->_remoteObjectInterface, 0);
  objc_storeStrong((id *)&self->_connectionPromise, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

void __76__MSXPCConnection__sendInvocation_remoteInterface_remoteProxy_errorHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  id v14;

  v14 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "lock");
  v6 = v14;
  if (v14)
  {
    objc_msgSend(v14, "setRemoteObjectInterface:", *(_QWORD *)(a1 + 40));
    objc_msgSend(v14, "setExportedInterface:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 192));
    objc_msgSend(v14, "setExportedObject:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 200));
    objc_msgSend(*(id *)(a1 + 32), "_nts_wrappedInterruptionHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setInterruptionHandler:", v7);
    objc_msgSend(v14, "setInvalidationHandler:", v7);
    objc_msgSend(v14, "_setQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 168));
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 224);
    if (v8 < 1)
    {
      v10 = v14;
      if ((v8 & 0x8000000000000000) == 0)
      {
LABEL_6:
        v11 = *(void **)(a1 + 48);
        objc_msgSend(v10, "remoteObjectProxyWithErrorHandler:", *(_QWORD *)(a1 + 64));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "___setNSXPCRemoteObjectProxy:", v12);

        goto LABEL_7;
      }
    }
    else
    {
      v9 = 0;
      v10 = v14;
      do
      {
        objc_msgSend(v10, "resume");
        ++v9;
        v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 224);
        v10 = v14;
      }
      while (v9 < v8);
      if ((v8 & 0x8000000000000000) == 0)
        goto LABEL_6;
    }
    do
    {
      objc_msgSend(v10, "suspend");
      v13 = __CFADD__(v8++, 1);
      v10 = v14;
    }
    while (!v13);
    goto LABEL_6;
  }
  if (v5)
    goto LABEL_9;
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("MailServices"), 3, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_7:
  v6 = v14;
LABEL_9:
  objc_msgSend(*(id *)(a1 + 32), "_finishPromise:withConnection:error:", *(_QWORD *)(a1 + 56), v6, v5);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "unlock");

}

- (void)resume
{
  void *v3;

  -[NSLock lock](self->_lock, "lock");
  ++self->_resumeCount;
  -[MSXPCConnection _connectionForPromise:](self, "_connectionForPromise:", self->_connectionPromise);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resume");

  -[NSLock unlock](self->_lock, "unlock");
}

- (id)_nts_wrappedInterruptionHandler
{
  EFPromise *v3;
  EFPromise *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  EFPromise *v9;
  id v10;
  id location;

  v3 = self->_connectionPromise;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __50__MSXPCConnection__nts_wrappedInterruptionHandler__block_invoke;
  v8[3] = &unk_24C385930;
  objc_copyWeak(&v10, &location);
  v9 = v3;
  v4 = v3;
  v5 = (void *)MEMORY[0x20BD2EB84](v8);
  v6 = (void *)objc_msgSend(v5, "copy");

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
  return v6;
}

- (void)_invalidatePromise:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "future");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancel");

  -[MSXPCConnection _connectionForPromise:](self, "_connectionForPromise:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidate");

}

- (void)_queue_invokeInvalidationHandler
{
  void (**invalidationHandler)(void);
  EFPromise *connectionPromise;
  id v5;
  id interruptionHandler;
  id v7;
  id v8;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[NSLock lock](self->_lock, "lock");
  -[EFPromise future](self->_connectionPromise, "future");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cancel");

  invalidationHandler = (void (**)(void))self->_invalidationHandler;
  if (invalidationHandler)
    invalidationHandler[2]();
  -[MSXPCConnection _connectionForPromise:](self, "_connectionForPromise:", self->_connectionPromise);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setInterruptionHandler:", 0);
  objc_msgSend(v8, "setInvalidationHandler:", 0);
  objc_msgSend(v8, "invalidate");
  connectionPromise = self->_connectionPromise;
  self->_connectionPromise = 0;

  v5 = self->_invalidationHandler;
  self->_invalidationHandler = 0;

  interruptionHandler = self->_interruptionHandler;
  self->_interruptionHandler = 0;

  -[NSLock unlock](self->_lock, "unlock");
}

- (void)_finishPromise:(id)a3 withConnection:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  id v9;

  v9 = a3;
  v7 = a4;
  v8 = a5;
  if ((objc_msgSend(v9, "finishWithResult:error:", v7, v8) & 1) == 0)
    objc_msgSend(v7, "invalidate");

}

- (void)_sendInvocation:(id)a3 remoteInterface:(id)a4 remoteProxy:(id)a5 errorHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  unsigned __int8 v15;
  EFPromise **p_connectionPromise;
  id v17;
  MSXPCEndpoint *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  NSObject *queue;
  id v24;
  void *v25;
  uint64_t v26;
  id v27;
  void *v28;
  id v29;
  _QWORD v30[5];
  id v31;
  _QWORD v32[4];
  id v33;
  MSXPCConnection *v34;
  id v35;
  id v36;
  id v37;
  _QWORD v38[5];
  id v39;
  id v40;
  id v41;
  id v42;
  _QWORD block[4];
  id v44;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = v13;
  v15 = atomic_load((unsigned __int8 *)&self->_locallyInvalidated);
  if ((v15 & 1) == 0)
  {
    v29 = v11;
    objc_msgSend(v10, "retainArguments");
    -[NSLock lock](self->_lock, "lock");
    p_connectionPromise = &self->_connectionPromise;
    if (!self->_connectionPromise)
    {
      v17 = objc_alloc_init(MEMORY[0x24BE2E680]);
      objc_storeStrong((id *)&self->_connectionPromise, v17);
      v18 = objc_alloc_init(MSXPCEndpoint);
      -[MSMailDefaultService setShouldLaunchMobileMail:](v18, "setShouldLaunchMobileMail:", self->_shouldLaunchMobileMail);
      objc_msgSend(v11, "protocol");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v38[0] = MEMORY[0x24BDAC760];
      v38[1] = 3221225472;
      v38[2] = __76__MSXPCConnection__sendInvocation_remoteInterface_remoteProxy_errorHandler___block_invoke_2;
      v38[3] = &unk_24C385958;
      v38[4] = self;
      v39 = v11;
      v40 = v12;
      v42 = v14;
      v20 = v17;
      v41 = v20;
      -[MSXPCEndpoint connectionForProtocol:completionHandler:](v18, "connectionForProtocol:completionHandler:", v19, v38);

    }
    objc_msgSend(MEMORY[0x24BDD1768], "currentProgress");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      objc_msgSend(MEMORY[0x24BDD1768], "progressWithTotalUnitCount:", 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = 0;
    }
    -[EFPromise future](*p_connectionPromise, "future");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = MEMORY[0x24BDAC760];
    v32[0] = MEMORY[0x24BDAC760];
    v32[1] = 3221225472;
    v32[2] = __76__MSXPCConnection__sendInvocation_remoteInterface_remoteProxy_errorHandler___block_invoke_3;
    v32[3] = &unk_24C3859A8;
    v33 = v12;
    v27 = v14;
    v37 = v27;
    v34 = self;
    v24 = v22;
    v35 = v24;
    v36 = v10;
    objc_msgSend(v25, "addSuccessBlock:", v32);

    -[EFPromise future](*p_connectionPromise, "future");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v26;
    v30[1] = 3221225472;
    v30[2] = __76__MSXPCConnection__sendInvocation_remoteInterface_remoteProxy_errorHandler___block_invoke_5;
    v30[3] = &unk_24C3859F8;
    v30[4] = self;
    v31 = v27;
    objc_msgSend(v28, "addFailureBlock:", v30);

    v11 = v29;
    -[NSLock unlock](self->_lock, "unlock");

    goto LABEL_10;
  }
  if (v13)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __76__MSXPCConnection__sendInvocation_remoteInterface_remoteProxy_errorHandler___block_invoke;
    block[3] = &unk_24C385740;
    v44 = v13;
    dispatch_async(queue, block);
    v24 = v44;
LABEL_10:

  }
}

- (id)_connectionForPromise:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "future");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resultIfAvailable:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setShouldLaunchMobileMail:(BOOL)a3
{
  self->_shouldLaunchMobileMail = a3;
}

- (void)setRemoteObjectInterface:(id)a3
{
  void *v6;
  id v7;

  v7 = a3;
  -[NSLock lock](self->_lock, "lock");
  objc_storeStrong((id *)&self->_remoteObjectInterface, a3);
  -[MSXPCConnection _connectionForPromise:](self, "_connectionForPromise:", self->_connectionPromise);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, a2, v7);

  -[NSLock unlock](self->_lock, "unlock");
}

- (void)setInterruptionHandler:(id)a3
{
  void *v4;
  id interruptionHandler;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[NSLock lock](self->_lock, "lock");
  if (self->_interruptionHandler != v8)
  {
    v4 = (void *)MEMORY[0x20BD2EB84](v8);
    interruptionHandler = self->_interruptionHandler;
    self->_interruptionHandler = v4;

    -[MSXPCConnection _connectionForPromise:](self, "_connectionForPromise:", self->_connectionPromise);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[MSXPCConnection _nts_wrappedInterruptionHandler](self, "_nts_wrappedInterruptionHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setInterruptionHandler:", v7);
      objc_msgSend(v6, "setInvalidationHandler:", v7);

    }
  }
  -[NSLock unlock](self->_lock, "unlock");

}

- (MSXPCConnection)initWithProtocol:(id)a3
{
  Protocol *v5;
  MSXPCConnection *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSLock *v11;
  NSLock *lock;
  id v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *queue;
  MSXPCConnection *v16;
  objc_super v18;

  v5 = (Protocol *)a3;
  v18.receiver = self;
  v18.super_class = (Class)MSXPCConnection;
  v6 = -[MSXPCConnection init](&v18, sel_init);
  if (v6)
  {
    v7 = (void *)MEMORY[0x24BDD17C8];
    v8 = objc_opt_class();
    NSStringFromProtocol(v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("com.apple.mailservices.%@.%@.%p"), v8, v9, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (NSLock *)objc_alloc_init(MEMORY[0x24BDD1648]);
    lock = v6->_lock;
    v6->_lock = v11;

    objc_storeStrong((id *)&v6->_protocol, a3);
    v13 = objc_retainAutorelease(v10);
    v14 = dispatch_queue_create((const char *)objc_msgSend(v13, "UTF8String"), 0);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v14;

    v6->_shouldLaunchMobileMail = 1;
    atomic_store(0, (unsigned __int8 *)&v6->_locallyInvalidated);
    v16 = v6;

  }
  return v6;
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  id v4;
  _MSXPCRemoteProxy *v5;

  v4 = a3;
  v5 = -[_MSXPCRemoteProxy initWithConnection:interface:errorHandler:]([_MSXPCRemoteProxy alloc], "initWithConnection:interface:errorHandler:", self, self->_remoteObjectInterface, v4);

  return v5;
}

- (id)description
{
  void *v3;
  uint64_t v4;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> connection for protocol %s"), v4, self, protocol_getName(self->_protocol));
}

- (id)remoteObjectInterface
{
  NSXPCInterface *v3;

  -[NSLock lock](self->_lock, "lock");
  v3 = self->_remoteObjectInterface;
  -[NSLock unlock](self->_lock, "unlock");
  return v3;
}

- (id)exportedInterface
{
  NSXPCInterface *v3;

  -[NSLock lock](self->_lock, "lock");
  v3 = self->_exportedInterface;
  -[NSLock unlock](self->_lock, "unlock");
  return v3;
}

- (void)setExportedInterface:(id)a3
{
  void *v6;
  id v7;

  v7 = a3;
  -[NSLock lock](self->_lock, "lock");
  objc_storeStrong((id *)&self->_exportedInterface, a3);
  -[MSXPCConnection _connectionForPromise:](self, "_connectionForPromise:", self->_connectionPromise);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, a2, v7);

  -[NSLock unlock](self->_lock, "unlock");
}

- (id)exportedObject
{
  id v3;

  -[NSLock lock](self->_lock, "lock");
  v3 = self->_exportedObject;
  -[NSLock unlock](self->_lock, "unlock");
  return v3;
}

- (void)setExportedObject:(id)a3
{
  void *v6;
  id v7;

  v7 = a3;
  -[NSLock lock](self->_lock, "lock");
  objc_storeStrong(&self->_exportedObject, a3);
  -[MSXPCConnection _connectionForPromise:](self, "_connectionForPromise:", self->_connectionPromise);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, a2, v7);

  -[NSLock unlock](self->_lock, "unlock");
}

void __50__MSXPCConnection__nts_wrappedInterruptionHandler__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_invokeInterruptionHandlerForPromise:", *(_QWORD *)(a1 + 32));

}

- (void)_invokeInterruptionHandlerForPromise:(id)a3
{
  void *v4;
  id interruptionHandler;
  void *v6;
  EFPromise *v7;

  v7 = (EFPromise *)a3;
  -[NSLock lock](self->_lock, "lock");
  -[EFPromise future](v7, "future");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancel");

  interruptionHandler = self->_interruptionHandler;
  if (interruptionHandler)
    dispatch_async((dispatch_queue_t)self->_queue, interruptionHandler);
  -[MSXPCConnection _connectionForPromise:](self, "_connectionForPromise:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setInterruptionHandler:", 0);
  objc_msgSend(v6, "setInvalidationHandler:", 0);
  objc_msgSend(v6, "invalidate");
  if (self->_connectionPromise == v7)
  {
    self->_connectionPromise = 0;

  }
  -[NSLock unlock](self->_lock, "unlock");

}

- (id)interruptionHandler
{
  void *v3;
  void *v4;

  -[NSLock lock](self->_lock, "lock");
  v3 = (void *)MEMORY[0x20BD2EB84](self->_interruptionHandler);
  -[NSLock unlock](self->_lock, "unlock");
  v4 = (void *)MEMORY[0x20BD2EB84](v3);

  return v4;
}

- (id)invalidationHandler
{
  void *v3;
  void *v4;

  -[NSLock lock](self->_lock, "lock");
  v3 = (void *)MEMORY[0x20BD2EB84](self->_invalidationHandler);
  -[NSLock unlock](self->_lock, "unlock");
  v4 = (void *)MEMORY[0x20BD2EB84](v3);

  return v4;
}

- (void)setInvalidationHandler:(id)a3
{
  void *v4;
  id invalidationHandler;
  id v6;

  v6 = a3;
  -[NSLock lock](self->_lock, "lock");
  v4 = (void *)MEMORY[0x20BD2EB84](v6);
  invalidationHandler = self->_invalidationHandler;
  self->_invalidationHandler = v4;

  -[NSLock unlock](self->_lock, "unlock");
}

- (void)suspend
{
  void *v3;

  -[NSLock lock](self->_lock, "lock");
  -[MSXPCConnection _connectionForPromise:](self, "_connectionForPromise:", self->_connectionPromise);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "suspend");

  --self->_resumeCount;
  -[NSLock unlock](self->_lock, "unlock");
}

- (id)_connection
{
  void *v3;

  -[NSLock lock](self->_lock, "lock");
  -[MSXPCConnection _connectionForPromise:](self, "_connectionForPromise:", self->_connectionPromise);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSLock unlock](self->_lock, "unlock");
  return v3;
}

- (int)auditSessionIdentifier
{
  void *v2;
  int v3;

  -[MSXPCConnection _connection](self, "_connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "auditSessionIdentifier");

  return v3;
}

- (int)processIdentifier
{
  void *v2;
  int v3;

  -[MSXPCConnection _connection](self, "_connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "processIdentifier");

  return v3;
}

- (unsigned)effectiveUserIdentifier
{
  void *v2;
  unsigned int v3;

  -[MSXPCConnection _connection](self, "_connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "effectiveUserIdentifier");

  return v3;
}

- (unsigned)effectiveGroupIdentifier
{
  void *v2;
  unsigned int v3;

  -[MSXPCConnection _connection](self, "_connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "effectiveGroupIdentifier");

  return v3;
}

- (id)remoteObjectProxy
{
  return -[_MSXPCRemoteProxy initWithConnection:interface:errorHandler:]([_MSXPCRemoteProxy alloc], "initWithConnection:interface:errorHandler:", self, self->_remoteObjectInterface, 0);
}

void __76__MSXPCConnection__sendInvocation_remoteInterface_remoteProxy_errorHandler___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD0B88], 4099, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __76__MSXPCConnection__sendInvocation_remoteInterface_remoteProxy_errorHandler___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t);
  void *v9;
  id v10;
  id v11;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  if (v4)
  {
    v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 168);
    v6 = MEMORY[0x24BDAC760];
    v7 = 3221225472;
    v8 = __76__MSXPCConnection__sendInvocation_remoteInterface_remoteProxy_errorHandler___block_invoke_6;
    v9 = &unk_24C3859D0;
    v11 = v4;
    v10 = v3;
    dispatch_async(v5, &v6);

  }
  objc_msgSend(*(id *)(a1 + 32), "invalidate", v6, v7, v8, v9);

}

uint64_t __76__MSXPCConnection__sendInvocation_remoteInterface_remoteProxy_errorHandler___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (Protocol)protocol
{
  return self->_protocol;
}

- (BOOL)shouldLaunchMobileMail
{
  return self->_shouldLaunchMobileMail;
}

@end
