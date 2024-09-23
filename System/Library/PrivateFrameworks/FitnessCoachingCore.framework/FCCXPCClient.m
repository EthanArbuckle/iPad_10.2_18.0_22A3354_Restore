@implementation FCCXPCClient

- (FCCXPCClient)init
{
  void *v3;
  FCCXPCClient *v4;

  HKCreateSerialDispatchQueueWithQOSClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[FCCXPCClient initWithQueue:](self, "initWithQueue:", v3);

  return v4;
}

- (FCCXPCClient)initWithQueue:(id)a3
{
  id v5;
  FCCXPCClient *v6;
  FCCXPCClient *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FCCXPCClient;
  v6 = -[FCCXPCClient init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_dispatchQueue, a3);
  -[FCCXPCClient _setupXPCConnection](v7, "_setupXPCConnection");

  return v7;
}

- (void)dealloc
{
  NSXPCConnection *connection;
  objc_super v4;

  -[NSXPCConnection setInvalidationHandler:](self->_connection, "setInvalidationHandler:", 0);
  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  connection = self->_connection;
  self->_connection = 0;

  v4.receiver = self;
  v4.super_class = (Class)FCCXPCClient;
  -[FCCXPCClient dealloc](&v4, sel_dealloc);
}

- (void)_setupXPCConnection
{
  NSXPCConnection *v3;
  void *v4;
  NSXPCConnection *connection;

  v3 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.fitnesscoachingd"), 0);
  -[NSXPCConnection _setQueue:](v3, "_setQueue:", self->_dispatchQueue);
  FCCDefaultTransportInterface();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSXPCConnection setRemoteObjectInterface:](v3, "setRemoteObjectInterface:", v4);

  -[NSXPCConnection setInterruptionHandler:](v3, "setInterruptionHandler:", &__block_literal_global_0);
  -[NSXPCConnection setInvalidationHandler:](v3, "setInvalidationHandler:", &__block_literal_global_189);
  -[NSXPCConnection resume](v3, "resume");
  connection = self->_connection;
  self->_connection = v3;

}

void __35__FCCXPCClient__setupXPCConnection__block_invoke()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  _HKInitializeLogging();
  v0 = *MEMORY[0x1E0CB5298];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5298], OS_LOG_TYPE_ERROR))
    __35__FCCXPCClient__setupXPCConnection__block_invoke_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);
}

void __35__FCCXPCClient__setupXPCConnection__block_invoke_188()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  _HKInitializeLogging();
  v0 = *MEMORY[0x1E0CB5298];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5298], OS_LOG_TYPE_ERROR))
    __35__FCCXPCClient__setupXPCConnection__block_invoke_188_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);
}

- (void)_remoteProxy:(id)a3 errorHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__FCCXPCClient__remoteProxy_errorHandler___block_invoke;
  block[3] = &unk_1E6210368;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(dispatchQueue, block);

}

void __42__FCCXPCClient__remoteProxy_errorHandler___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  v2 = (void *)a1[5];
  v3 = *(void **)(a1[4] + 8);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42__FCCXPCClient__remoteProxy_errorHandler___block_invoke_2;
  v5[3] = &unk_1E62102E0;
  v6 = v2;
  objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(a1[6] + 16))();

}

void __42__FCCXPCClient__remoteProxy_errorHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  _HKInitializeLogging();
  v4 = *MEMORY[0x1E0CB5298];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5298], OS_LOG_TYPE_ERROR))
    __42__FCCXPCClient__remoteProxy_errorHandler___block_invoke_2_cold_1((uint64_t)v3, v4);
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

- (void)transportMessage:(unint64_t)a3 data:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *dispatchQueue;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  unint64_t v16;

  v8 = a4;
  v9 = a5;
  dispatchQueue = self->_dispatchQueue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __49__FCCXPCClient_transportMessage_data_completion___block_invoke;
  v13[3] = &unk_1E6210290;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a3;
  v11 = v9;
  v12 = v8;
  dispatch_async(dispatchQueue, v13);

}

uint64_t __49__FCCXPCClient_transportMessage_data_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_transportMessage:data:completion:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)transportRequest:(unint64_t)a3 data:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *dispatchQueue;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  unint64_t v16;

  v8 = a4;
  v9 = a5;
  dispatchQueue = self->_dispatchQueue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __49__FCCXPCClient_transportRequest_data_completion___block_invoke;
  v13[3] = &unk_1E6210290;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a3;
  v11 = v9;
  v12 = v8;
  dispatch_async(dispatchQueue, v13);

}

uint64_t __49__FCCXPCClient_transportRequest_data_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_transportRequest:data:completion:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_transportMessage:(unint64_t)a3 data:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  unint64_t v18;

  v8 = a4;
  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __50__FCCXPCClient__transportMessage_data_completion___block_invoke;
  v15[3] = &unk_1E6210390;
  v18 = a3;
  v16 = v8;
  v17 = v9;
  v13[0] = v10;
  v13[1] = 3221225472;
  v13[2] = __50__FCCXPCClient__transportMessage_data_completion___block_invoke_2;
  v13[3] = &unk_1E62102E0;
  v14 = v17;
  v11 = v17;
  v12 = v8;
  -[FCCXPCClient _remoteProxy:errorHandler:](self, "_remoteProxy:errorHandler:", v15, v13);

}

uint64_t __50__FCCXPCClient__transportMessage_data_completion___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "transportMessage:data:completion:", a1[6], a1[4], a1[5]);
}

uint64_t __50__FCCXPCClient__transportMessage_data_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_transportRequest:(unint64_t)a3 data:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  unint64_t v18;

  v8 = a4;
  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __50__FCCXPCClient__transportRequest_data_completion___block_invoke;
  v15[3] = &unk_1E6210390;
  v18 = a3;
  v16 = v8;
  v17 = v9;
  v13[0] = v10;
  v13[1] = 3221225472;
  v13[2] = __50__FCCXPCClient__transportRequest_data_completion___block_invoke_2;
  v13[3] = &unk_1E62102E0;
  v14 = v17;
  v11 = v17;
  v12 = v8;
  -[FCCXPCClient _remoteProxy:errorHandler:](self, "_remoteProxy:errorHandler:", v15, v13);

}

uint64_t __50__FCCXPCClient__transportRequest_data_completion___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "transportRequest:data:completion:", a1[6], a1[4], a1[5]);
}

uint64_t __50__FCCXPCClient__transportRequest_data_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

void __35__FCCXPCClient__setupXPCConnection__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1B0C58000, a1, a3, "Compatibility xpc connection interrupted", a5, a6, a7, a8, 0);
}

void __35__FCCXPCClient__setupXPCConnection__block_invoke_188_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1B0C58000, a1, a3, "Compatibility xpc connection invalidated", a5, a6, a7, a8, 0);
}

void __42__FCCXPCClient__remoteProxy_errorHandler___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1B0C58000, a2, OS_LOG_TYPE_ERROR, "Failed to fetch server proxy with error %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
