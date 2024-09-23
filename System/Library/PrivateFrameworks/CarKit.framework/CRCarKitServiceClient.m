@implementation CRCarKitServiceClient

void __37__CRCarKitServiceClient_serviceQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.carkit.serviceClient", v2);
  v1 = (void *)serviceQueue___queue;
  serviceQueue___queue = (uint64_t)v0;

}

- (void)performServiceBlock:(id)a3 errorHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  objc_msgSend((id)objc_opt_class(), "serviceQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__CRCarKitServiceClient_performServiceBlock_errorHandler___block_invoke;
  block[3] = &unk_1E5427EA0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

+ (id)serviceQueue
{
  if (serviceQueue_onceToken != -1)
    dispatch_once(&serviceQueue_onceToken, &__block_literal_global_0);
  return (id)serviceQueue___queue;
}

- (void)_serviceQueuePerformBlock:(id)a3 errorHandler:(id)a4
{
  void (**v6)(id, void *);
  id v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  uint8_t v12[8];
  _QWORD v13[4];
  id v14;

  v6 = (void (**)(id, void *))a3;
  v7 = a4;
  -[CRCarKitServiceClient connection](self, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __64__CRCarKitServiceClient__serviceQueuePerformBlock_errorHandler___block_invoke;
  v13[3] = &unk_1E5427E30;
  v14 = v7;
  v9 = v7;
  objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    CarGeneralLogging();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1A83A2000, v11, OS_LOG_TYPE_DEFAULT, "Connecting to CarKit service.", v12, 2u);
    }

    v6[2](v6, v10);
  }

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[CRCarKitServiceClient connection](self, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  v4.receiver = self;
  v4.super_class = (Class)CRCarKitServiceClient;
  -[CRCarKitServiceClient dealloc](&v4, sel_dealloc);
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (CRCarKitServiceClient)init
{
  CRCarKitServiceClient *v2;
  CRCarKitServiceClient *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CRCarKitServiceClient;
  v2 = -[CRCarKitServiceClient init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[CRCarKitServiceClient _setupConnection](v2, "_setupConnection");
  return v3;
}

- (void)_setupConnection
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint8_t buf[16];

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE9AC258);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v5, objc_opt_class(), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_fetchAllVehiclesWithReply_, 0, 1);

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.carkit.service"), 4096);
  objc_msgSend(v7, "setRemoteObjectInterface:", v3);
  CarGeneralLogging();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A83A2000, v8, OS_LOG_TYPE_DEFAULT, "Connecting to CarKit service.", buf, 2u);
  }

  objc_msgSend(v7, "resume");
  -[CRCarKitServiceClient setConnection:](self, "setConnection:", v7);

}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

uint64_t __58__CRCarKitServiceClient_performServiceBlock_errorHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_serviceQueuePerformBlock:errorHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)performSynchronousServiceBlock:(id)a3 errorHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  objc_msgSend((id)objc_opt_class(), "serviceQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__CRCarKitServiceClient_performSynchronousServiceBlock_errorHandler___block_invoke;
  block[3] = &unk_1E5427EA0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(v8, block);

}

uint64_t __69__CRCarKitServiceClient_performSynchronousServiceBlock_errorHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_serviceQueuePerformBlock:errorHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __64__CRCarKitServiceClient__serviceQueuePerformBlock_errorHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  CarGeneralLogging();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __64__CRCarKitServiceClient__serviceQueuePerformBlock_errorHandler___block_invoke_cold_1((uint64_t)v3, v4);

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

void __64__CRCarKitServiceClient__serviceQueuePerformBlock_errorHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1A83A2000, a2, OS_LOG_TYPE_ERROR, "CarKit Service Error: %@", (uint8_t *)&v2, 0xCu);
}

@end
