@implementation FMXPCSession

uint64_t __26__FMXPCSession_connection__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "destroyXPCConnection");
}

- (void)invalidate
{
  NSObject *serialQueue;
  _QWORD block[5];

  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __26__FMXPCSession_invalidate__block_invoke;
  block[3] = &unk_1E5E0DE90;
  block[4] = self;
  dispatch_sync(serialQueue, block);
}

void __26__FMXPCSession_connection__block_invoke_6(uint64_t a1)
{
  id WeakRetained;
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD block[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = objc_loadWeakRetained((id *)(a1 + 56));
  v4 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __26__FMXPCSession_connection__block_invoke_2;
  block[3] = &unk_1E5E0DE90;
  block[4] = WeakRetained;
  dispatch_async(v4, block);
  v5 = *(_QWORD *)(a1 + 40);
  if (v5 && v3)
  {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    __26__FMXPCSession_connection__block_invoke_6_cold_1((uint64_t)v3, v6, v7, v8, v9, v10, v11, v12);
  }

}

void __26__FMXPCSession_connection__block_invoke_6_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1AEA5C000, MEMORY[0x1E0C81028], a3, "Connection invalidated: %@", a5, a6, a7, a8, 2u);
}

- (void)resume
{
  NSObject *serialQueue;
  _QWORD block[5];

  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __22__FMXPCSession_resume__block_invoke;
  block[3] = &unk_1E5E0DE90;
  block[4] = self;
  dispatch_sync(serialQueue, block);
}

- (void)dealloc
{
  objc_super v3;

  -[FMXPCSession destroyXPCConnection](self, "destroyXPCConnection");
  v3.receiver = self;
  v3.super_class = (Class)FMXPCSession;
  -[FMXPCSession dealloc](&v3, sel_dealloc);
}

- (void)destroyXPCConnection
{
  NSXPCConnection *connection;

  -[FMXPCSession set_proxy:](self, "set_proxy:", 0);
  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  connection = self->_connection;
  self->_connection = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_serviceDescription, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong(&self->__proxy, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

void __22__FMXPCSession_resume__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "resume");

}

- (FMXPCSession)initWithServiceDescription:(id)a3
{
  id v5;
  FMXPCSession *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *serialQueue;
  NSUUID *v9;
  NSUUID *identifier;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)FMXPCSession;
  v6 = -[FMXPCSession init](&v12, sel_init);
  if (v6)
  {
    v7 = dispatch_queue_create("com.apple.icloud.fmcorelite.fmxpcsession", 0);
    serialQueue = v6->_serialQueue;
    v6->_serialQueue = (OS_dispatch_queue *)v7;

    v9 = (NSUUID *)objc_alloc_init(MEMORY[0x1E0CB3A28]);
    identifier = v6->_identifier;
    v6->_identifier = v9;

    objc_storeStrong((id *)&v6->_serviceDescription, a3);
  }

  return v6;
}

void __21__FMXPCSession_proxy__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(*(id *)(a1 + 32), "_proxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "connection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "remoteObjectProxy");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "set_proxy:", v4);

  }
  objc_msgSend(*(id *)(a1 + 32), "_proxy");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (id)_proxy
{
  return self->__proxy;
}

- (void)set_proxy:(id)a3
{
  objc_storeStrong(&self->__proxy, a3);
}

- (id)proxy
{
  NSObject *serialQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__1;
  v10 = __Block_byref_object_dispose__1;
  v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __21__FMXPCSession_proxy__block_invoke;
  v5[3] = &unk_1E5E0E020;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (NSXPCConnection)connection
{
  NSXPCConnection *connection;
  NSXPCConnection *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSXPCConnection *v9;
  NSXPCConnection *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;
  id from;
  id location;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  connection = self->_connection;
  if (connection)
  {
    v4 = connection;
  }
  else
  {
    v5 = objc_alloc(MEMORY[0x1E0CB3B38]);
    -[FMXPCSession serviceDescription](self, "serviceDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "machService");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMXPCSession serviceDescription](self, "serviceDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (NSXPCConnection *)objc_msgSend(v5, "initWithMachServiceName:options:", v7, objc_msgSend(v8, "options"));
    v10 = self->_connection;
    self->_connection = v9;

    -[FMXPCSession serviceDescription](self, "serviceDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "exportedObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedObject:](self->_connection, "setExportedObject:", v12);

    -[FMXPCSession serviceDescription](self, "serviceDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "exportedInterface");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](self->_connection, "setExportedInterface:", v14);

    -[FMXPCSession serviceDescription](self, "serviceDescription");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "remoteObjectInterface");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](self->_connection, "setRemoteObjectInterface:", v16);

    objc_initWeak(&location, self->_connection);
    objc_initWeak(&from, self);
    -[FMXPCSession serviceDescription](self, "serviceDescription");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "interruptionHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = MEMORY[0x1E0C809B0];
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __26__FMXPCSession_connection__block_invoke;
    v32[3] = &unk_1E5E0DFF8;
    objc_copyWeak(&v34, &location);
    v20 = v18;
    v33 = v20;
    -[NSXPCConnection setInterruptionHandler:](self->_connection, "setInterruptionHandler:", v32);
    -[FMXPCSession serialQueue](self, "serialQueue");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMXPCSession serviceDescription](self, "serviceDescription");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "invalidationHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v27[0] = v19;
    v27[1] = 3221225472;
    v27[2] = __26__FMXPCSession_connection__block_invoke_6;
    v27[3] = &unk_1E5E0E0C0;
    objc_copyWeak(&v30, &from);
    objc_copyWeak(&v31, &location);
    v24 = v21;
    v28 = v24;
    v25 = v23;
    v29 = v25;
    -[NSXPCConnection setInvalidationHandler:](self->_connection, "setInvalidationHandler:", v27);
    v4 = self->_connection;

    objc_destroyWeak(&v31);
    objc_destroyWeak(&v30);

    objc_destroyWeak(&v34);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
  return v4;
}

- (FMXPCServiceDescription)serviceDescription
{
  return self->_serviceDescription;
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

uint64_t __26__FMXPCSession_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "destroyXPCConnection");
}

- (id)syncProxyWithErrorHandler:(id)a3
{
  id v4;
  NSObject *serialQueue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__1;
  v16 = __Block_byref_object_dispose__1;
  v17 = 0;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__FMXPCSession_syncProxyWithErrorHandler___block_invoke;
  block[3] = &unk_1E5E0E098;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(serialQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __42__FMXPCSession_syncProxyWithErrorHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __42__FMXPCSession_syncProxyWithErrorHandler___block_invoke_2;
  v6[3] = &unk_1E5E0E070;
  v7 = *(id *)(a1 + 40);
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

uint64_t __42__FMXPCSession_syncProxyWithErrorHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)suspend
{
  NSObject *serialQueue;
  _QWORD block[5];

  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __23__FMXPCSession_suspend__block_invoke;
  block[3] = &unk_1E5E0DE90;
  block[4] = self;
  dispatch_sync(serialQueue, block);
}

void __23__FMXPCSession_suspend__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "suspend");

}

void __26__FMXPCSession_connection__block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  BOOL v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
    v4 = WeakRetained == 0;
  else
    v4 = 1;
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      __26__FMXPCSession_connection__block_invoke_cold_1((uint64_t)WeakRetained, v5, v6, v7, v8, v9, v10, v11);
  }
  else
  {
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, WeakRetained);
  }

}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setSerialQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serialQueue, a3);
}

- (void)setServiceDescription:(id)a3
{
  objc_storeStrong((id *)&self->_serviceDescription, a3);
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

void __26__FMXPCSession_connection__block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1AEA5C000, MEMORY[0x1E0C81028], a3, "Connection interrupted: %@", a5, a6, a7, a8, 2u);
}

@end
