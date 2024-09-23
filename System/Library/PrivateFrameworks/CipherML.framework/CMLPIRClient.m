@implementation CMLPIRClient

- (NSString)useCase
{
  void *v2;
  void *v3;

  -[CMLPIRClient clientConfig](self, "clientConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "useCase");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (CMLPIRClient)initWithClientConfig:(id)a3
{
  id v4;
  dispatch_queue_t v5;
  CMLPIRClient *v6;

  v4 = a3;
  v5 = dispatch_queue_create("com.apple.CipherML.CMLPIRClient", 0);
  v6 = -[CMLPIRClient initWithClientConfig:dispatchQueue:](self, "initWithClientConfig:dispatchQueue:", v4, v5);

  return v6;
}

- (CMLPIRClient)initWithClientConfig:(id)a3 dispatchQueue:(id)a4
{
  id v6;
  id v7;
  void *v8;
  CMLPIRClient *v9;
  NSObject *v10;

  v6 = a3;
  v7 = a4;
  if (-[CMLPIRClient isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class()))
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("CMLPIRClient should not be instantiated, only its subclasses"));
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.ciphermld"), 0);
  if (v8)
  {
    self = -[CMLPIRClient initWithClientConfig:dispatchQueue:connection:](self, "initWithClientConfig:dispatchQueue:connection:", v6, v7, v8);
    v9 = self;
  }
  else
  {
    +[CMLLog client](CMLLog, "client");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[CMLSimilarityClient initWithClientConfig:dispatchQueue:].cold.1((uint64_t)CFSTR("com.apple.ciphermld"), v10);

    v9 = 0;
  }

  return v9;
}

- (CMLPIRClient)initWithClientConfig:(id)a3 dispatchQueue:(id)a4 connection:(id)a5
{
  id v9;
  id v10;
  id v11;
  CMLPIRClient *v12;
  void *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CMLPIRClient;
  v12 = -[CMLPIRClient init](&v15, sel_init);
  if (v12)
  {
    +[CMLXPC interfaceDescription](CMLXPC, "interfaceDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setRemoteObjectInterface:", v13);

    objc_msgSend(v11, "activate");
    objc_storeStrong((id *)&v12->_clientConfig, a3);
    objc_storeStrong((id *)&v12->_dispatchQueue, a4);
    objc_storeStrong((id *)&v12->_connection, a5);
  }

  return v12;
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)CMLPIRClient;
  -[CMLPIRClient dealloc](&v3, sel_dealloc);
}

- (id)setPIRConfig:(id)a3 error:(id *)a4
{
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v17[7];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  id v30;
  uint8_t buf[4];
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v30 = 0;
  -[CMLPIRClient connection](self, "connection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[CMLXPC syncProxyToConnection:error:](CMLXPC, "syncProxyToConnection:error:", v9, &v30);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_storeStrong((id *)&self->_pirConfig, a3);
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__2;
  v28 = __Block_byref_object_dispose__2;
  v29 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__2;
  v22 = __Block_byref_object_dispose__2;
  v23 = 0;
  +[CMLLog client](CMLLog, "client");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v32 = v12;
    _os_log_impl(&dword_237BC8000, v11, OS_LOG_TYPE_DEFAULT, "%@ Sending XPC request", buf, 0xCu);

  }
  -[CMLPIRClient clientConfig](self, "clientConfig");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __35__CMLPIRClient_setPIRConfig_error___block_invoke;
  v17[3] = &unk_2509A8050;
  v17[4] = &v18;
  v17[5] = &v24;
  v17[6] = a2;
  objc_msgSend(v10, "setPIRConfig:clientConfig:reply:", v8, v13, v17);

  if (a4)
  {
    v14 = v30;
    if (!v30)
      v14 = (id)v25[5];
    *a4 = objc_retainAutorelease(v14);
  }
  v15 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  return v15;
}

void __35__CMLPIRClient_setPIRConfig_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  _BOOL4 v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a3;
  +[CMLLog client](CMLLog, "client");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412802;
    v14 = v9;
    v15 = 1024;
    v16 = v6 != 0;
    v17 = 2114;
    v18 = v7;
    _os_log_impl(&dword_237BC8000, v8, OS_LOG_TYPE_DEFAULT, "%@ XPC request complete, success(%d) error:%{public}@", (uint8_t *)&v13, 0x1Cu);

  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  if (v7)
  {
    +[CMLError errorWithCode:underlyingError:description:](CMLError, "errorWithCode:underlyingError:description:", 200, v7, CFSTR("Unable to set PIR config due to errors"));
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

  }
}

- (id)generateEvaluationKey:(id *)a3
{
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v15[7];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v28 = 0;
  -[CMLPIRClient connection](self, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CMLXPC syncProxyToConnection:error:](CMLXPC, "syncProxyToConnection:error:", v6, &v28);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__2;
  v26 = __Block_byref_object_dispose__2;
  v27 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__2;
  v20 = __Block_byref_object_dispose__2;
  v21 = 0;
  +[CMLLog client](CMLLog, "client");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v30 = v9;
    _os_log_impl(&dword_237BC8000, v8, OS_LOG_TYPE_DEFAULT, "%@ Sending XPC request", buf, 0xCu);

  }
  -[CMLPIRClient pirConfig](self, "pirConfig");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CMLPIRClient clientConfig](self, "clientConfig");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __38__CMLPIRClient_generateEvaluationKey___block_invoke;
  v15[3] = &unk_2509A8050;
  v15[4] = &v16;
  v15[5] = &v22;
  v15[6] = a2;
  objc_msgSend(v7, "generateEvaluationKey:clientConfig:reply:", v10, v11, v15);

  if (a3)
  {
    v12 = v28;
    if (!v28)
      v12 = (id)v23[5];
    *a3 = objc_retainAutorelease(v12);
  }
  v13 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  return v13;
}

void __38__CMLPIRClient_generateEvaluationKey___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  _BOOL4 v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a3;
  +[CMLLog client](CMLLog, "client");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412802;
    v14 = v9;
    v15 = 1024;
    v16 = v6 != 0;
    v17 = 2114;
    v18 = v7;
    _os_log_impl(&dword_237BC8000, v8, OS_LOG_TYPE_DEFAULT, "%@ XPC request complete, success(%d) error:%{public}@", (uint8_t *)&v13, 0x1Cu);

  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  if (v7)
  {
    +[CMLError errorWithCode:underlyingError:description:](CMLError, "errorWithCode:underlyingError:description:", 1500, v7, CFSTR("Unable to set generateEvaluationKey due to errors"));
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

  }
}

- (CMLPIRClient)init
{

  return 0;
}

+ (id)new
{
  return 0;
}

- (CMLClientConfig)clientConfig
{
  return self->_clientConfig;
}

- (CMLPIRConfig)pirConfig
{
  return self->_pirConfig;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_pirConfig, 0);
  objc_storeStrong((id *)&self->_clientConfig, 0);
}

@end
