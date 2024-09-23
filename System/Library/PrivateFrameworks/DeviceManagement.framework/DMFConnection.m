@implementation DMFConnection

+ (DMFConnection)sharedConnection
{
  return +[DMFConnection systemConnection](DMFConnection, "systemConnection");
}

+ (DMFConnection)systemConnection
{
  return (DMFConnection *)objc_msgSend(a1, "connectionForUID:", 0);
}

+ (DMFConnection)currentUserConnection
{
  return (DMFConnection *)objc_msgSend(a1, "connectionForUID:", getuid());
}

+ (id)connectionForUID:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v14;
  _QWORD v15[2];

  v3 = *(_QWORD *)&a3;
  v15[1] = *MEMORY[0x1E0C80C00];
  if (connectionForUID__onceToken != -1)
    dispatch_once(&connectionForUID__onceToken, &__block_literal_global_2);
  v5 = (void *)connectionForUID__connectionByUID;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v8 = objc_alloc((Class)a1);
    v14 = CFSTR("DMFConnectionTargetUIDKey");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v8, "initWithUserInfo:", v10);

    if (!(_DWORD)v3)
      objc_msgSend(v7, "setIsSystemConnection:", 1);
    v11 = (void *)connectionForUID__connectionByUID;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v7, v12);

  }
  return v7;
}

void __34__DMFConnection_connectionForUID___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 0, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)connectionForUID__connectionByUID;
  connectionForUID__connectionByUID = v0;

}

+ (id)connectionForAppleID:(id)a3
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v10;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("DMFConnection.m"), 88, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("appleID"));

  }
  v6 = objc_alloc((Class)a1);
  v11 = CFSTR("DMFConnectionAppleIDKey");
  v12[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithUserInfo:", v7);

  return v8;
}

- (DMFConnection)initWithUserInfo:(id)a3
{
  return -[DMFConnection initWithTransportProvider:userInfo:](self, "initWithTransportProvider:userInfo:", self, a3);
}

- (DMFConnection)initWithTransportProvider:(id)a3 userInfo:(id)a4
{
  id v7;
  id v8;
  DMFConnection *v9;
  DMFConnection *v10;
  uint64_t v11;
  CATOperationQueue *operationQueue;
  uint64_t v13;
  CATTaskClient *taskClient;
  void *v15;
  void *v17;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DMFConnection.m"), 98, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("transportProvider"));

  }
  v18.receiver = self;
  v18.super_class = (Class)DMFConnection;
  v9 = -[DMFConnection init](&v18, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_connectionState = 0;
    v11 = objc_opt_new();
    operationQueue = v10->_operationQueue;
    v10->_operationQueue = (CATOperationQueue *)v11;

    -[CATOperationQueue setMaxConcurrentOperationCount:](v10->_operationQueue, "setMaxConcurrentOperationCount:", 0x7FFFFFFFFFFFFFFFLL);
    objc_storeWeak((id *)&v10->_transportProvider, v7);
    v13 = objc_opt_new();
    taskClient = v10->_taskClient;
    v10->_taskClient = (CATTaskClient *)v13;

    -[CATTaskClient setDelegate:](v10->_taskClient, "setDelegate:", v10);
    v15 = (void *)objc_msgSend(v8, "copy");
    -[CATTaskClient setUserInfo:](v10->_taskClient, "setUserInfo:", v15);

    -[DMFConnection _reconnectTaskClient](v10, "_reconnectTaskClient");
  }

  return v10;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  -[DMFConnection taskClient](self, "taskClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelegate:", 0);

  -[DMFConnection taskClient](self, "taskClient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "disconnect");

  -[DMFConnection taskClient](self, "taskClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidate");

  v6.receiver = self;
  v6.super_class = (Class)DMFConnection;
  -[DMFConnection dealloc](&v6, sel_dealloc);
}

- (void)performRequest:(id)a3 completion:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v7 = a4;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DMFConnection.m"), 129, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("request"));

  }
  -[DMFConnection prepareOperationForRequest:](self, "prepareOperationForRequest:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v9 = (void *)MEMORY[0x1BCCB7F34](v7);
    dispatch_get_global_queue(25, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addTarget:selector:forOperationEvents:userInfo:delegateQueue:", self, sel__operationDidFinish_completion_, 6, v9, v10);

  }
  -[DMFConnection operationQueue](self, "operationQueue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addOperation:", v8);

}

- (id)prepareOperationForRequest:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v9;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DMFConnection.m"), 145, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("request"));

  }
  if (!-[DMFConnection connectionState](self, "connectionState"))
    -[DMFConnection _reconnectTaskClient](self, "_reconnectTaskClient");
  -[DMFConnection taskClient](self, "taskClient");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "prepareTaskOperationForRequest:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)batchOperationToPerformOperations:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  DMFBatchRequestOperation *v7;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  -[DMFConnection prepareOperationForRequest:](self, "prepareOperationForRequest:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[DMFBatchRequestOperation initWithActivityTransactionOperation:subOperations:]([DMFBatchRequestOperation alloc], "initWithActivityTransactionOperation:subOperations:", v6, v4);

  return v7;
}

- (void)invalidate
{
  id v2;

  -[DMFConnection taskClient](self, "taskClient");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidate");

}

- (id)makeNewTransport
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.dmd"), 4096);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D450]), "initWithXPCConnection:", v2);

  return v3;
}

- (void)clientDidConnect:(id)a3
{
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138543362;
    v6 = a3;
    _os_log_impl(&dword_1B8C0C000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Client did connect: %{public}@", (uint8_t *)&v5, 0xCu);
  }
  -[DMFConnection setConnectionState:](self, "setConnectionState:", 2);
}

- (void)clientDidDisconnect:(id)a3
{
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138543362;
    v6 = a3;
    _os_log_impl(&dword_1B8C0C000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Client did disconnect: %{public}@", (uint8_t *)&v5, 0xCu);
  }
  -[DMFConnection setConnectionState:](self, "setConnectionState:", 0);
}

- (void)clientDidInvalidate:(id)a3
{
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138543362;
    v6 = a3;
    _os_log_impl(&dword_1B8C0C000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Client did invalidate: %{public}@", (uint8_t *)&v5, 0xCu);
  }
  -[DMFConnection setConnectionState:](self, "setConnectionState:", 0);
}

- (void)client:(id)a3 didInterruptWithError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v6 = a3;
  v7 = a4;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[DMFConnection client:didInterruptWithError:].cold.1((uint64_t)v6, (uint64_t)v7);
  -[DMFConnection setConnectionState:](self, "setConnectionState:", 0);
  -[DMFConnection operationQueue](self, "operationQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "operations");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10)
    -[DMFConnection _reconnectTaskClient](self, "_reconnectTaskClient");

}

- (void)_operationDidFinish:(id)a3 completion:(id)a4
{
  void (**v5)(id, void *, void *);
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v5 = (void (**)(id, void *, void *))a4;
  objc_msgSend(v8, "error");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(v8, "resultObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v5[2](v5, v7, v6);

}

- (void)_reconnectTaskClient
{
  void *v3;
  void *v4;
  id v5;

  -[DMFConnection setConnectionState:](self, "setConnectionState:", 1);
  -[DMFConnection taskClient](self, "taskClient");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[DMFConnection transportProvider](self, "transportProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "makeNewTransport");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "connectWithTransport:", v4);

}

- (DMFTransportProvider)transportProvider
{
  return (DMFTransportProvider *)objc_loadWeakRetained((id *)&self->_transportProvider);
}

- (CATTaskClient)taskClient
{
  return self->_taskClient;
}

- (CATOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (unint64_t)connectionState
{
  return self->_connectionState;
}

- (void)setConnectionState:(unint64_t)a3
{
  self->_connectionState = a3;
}

- (BOOL)isSystemConnection
{
  return self->_isSystemConnection;
}

- (void)setIsSystemConnection:(BOOL)a3
{
  self->_isSystemConnection = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_taskClient, 0);
  objc_destroyWeak((id *)&self->_transportProvider);
}

- (void)client:(uint64_t)a1 didInterruptWithError:(uint64_t)a2 .cold.1(uint64_t a1, uint64_t a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 138543618;
  v3 = a1;
  v4 = 2114;
  v5 = a2;
  _os_log_error_impl(&dword_1B8C0C000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Client did interrupt: %{public}@, error: %{public}@", (uint8_t *)&v2, 0x16u);
}

@end
