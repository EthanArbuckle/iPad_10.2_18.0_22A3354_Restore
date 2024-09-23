@implementation MLRServiceClient

- (MLRServiceClient)initWithConnection:(id)a3
{
  id v5;
  void *v6;
  MLRServiceClient *v7;
  MLRServiceClient *v8;
  NSXPCConnection *connection;
  void *v10;
  id v12;
  objc_super v13;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], CFSTR("connection must not be nil"), 0);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v12);
  }
  v6 = v5;
  v13.receiver = self;
  v13.super_class = (Class)MLRServiceClient;
  v7 = -[MLRServiceClient init](&v13, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_connection, a3);
    connection = v8->_connection;
    DESServiceGetXPCInterface();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](connection, "setRemoteObjectInterface:", v10);

    -[NSXPCConnection resume](v8->_connection, "resume");
  }

  return v8;
}

- (void)dealloc
{
  NSXPCConnection *connection;
  objc_super v4;

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  connection = self->_connection;
  self->_connection = 0;

  v4.receiver = self;
  v4.super_class = (Class)MLRServiceClient;
  -[MLRServiceClient dealloc](&v4, sel_dealloc);
}

+ (id)sharedConnection
{
  if (sharedConnection_onceToken != -1)
    dispatch_once(&sharedConnection_onceToken, &__block_literal_global);
  return (id)sharedConnection_client;
}

void __36__MLRServiceClient_sharedConnection__block_invoke()
{
  MLRServiceClient *v0;
  id v1;
  uint64_t v2;
  void *v3;
  id v4;

  v0 = [MLRServiceClient alloc];
  v1 = objc_alloc(MEMORY[0x24BDD1988]);
  v4 = (id)objc_msgSend(v1, "initWithMachServiceName:options:", *MEMORY[0x24BE2D0E0], 4096);
  v2 = -[MLRServiceClient initWithConnection:](v0, "initWithConnection:", v4);
  v3 = (void *)sharedConnection_client;
  sharedConnection_client = v2;

}

- (void)performOnRemoteObjecWithBlock:(id)a3 isSynchronous:(BOOL)a4 errorHandler:(id)a5
{
  _BOOL4 v6;
  void (**v8)(id, void *);
  id v9;
  void (**v10)(_QWORD, _QWORD);
  NSXPCConnection *connection;
  id *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  uint64_t v23;
  _QWORD v24[2];

  v6 = a4;
  v24[1] = *MEMORY[0x24BDAC8D0];
  v8 = (void (**)(id, void *))a3;
  v9 = a5;
  v10 = (void (**)(_QWORD, _QWORD))v9;
  connection = self->_connection;
  if (v6)
  {
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __77__MLRServiceClient_performOnRemoteObjecWithBlock_isSynchronous_errorHandler___block_invoke;
    v21[3] = &unk_24CB92498;
    v12 = &v22;
    v22 = v9;
    -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v21);
    v13 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __77__MLRServiceClient_performOnRemoteObjecWithBlock_isSynchronous_errorHandler___block_invoke_2;
    v19[3] = &unk_24CB92498;
    v12 = &v20;
    v20 = v9;
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v19);
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v14 = (void *)v13;

  if (v14)
  {
    if (v8)
      v8[2](v8, v14);
  }
  else if (v10)
  {
    v15 = (void *)MEMORY[0x24BDD1540];
    v16 = *MEMORY[0x24BE2D188];
    v23 = *MEMORY[0x24BDD0FC8];
    v24[0] = CFSTR("Fail to create remote object proxy.");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", v16, 1300, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v10)[2](v10, v18);

  }
}

uint64_t __77__MLRServiceClient_performOnRemoteObjecWithBlock_isSynchronous_errorHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __77__MLRServiceClient_performOnRemoteObjecWithBlock_isSynchronous_errorHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)performOnRemoteObjecWithBlock:(id)a3 errorHandler:(id)a4
{
  -[MLRServiceClient performOnRemoteObjecWithBlock:isSynchronous:errorHandler:](self, "performOnRemoteObjecWithBlock:isSynchronous:errorHandler:", a3, 0, a4);
}

- (void)performSynchronouslyOnRemoteObjecWithBlock:(id)a3 errorHandler:(id)a4
{
  -[MLRServiceClient performOnRemoteObjecWithBlock:isSynchronous:errorHandler:](self, "performOnRemoteObjecWithBlock:isSynchronous:errorHandler:", a3, 1, a4);
}

- (void)donateJSONResult:(id)a3 identifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *);
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  const __CFString **v16;
  uint64_t *v17;
  void *v18;
  _QWORD v19[4];
  void (**v20)(id, void *);
  _QWORD v21[4];
  id v22;
  id v23;
  void (**v24)(id, void *);
  uint64_t v25;
  const __CFString *v26;
  uint64_t v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *))a5;
  if (!v8)
  {
    v13 = (void *)MEMORY[0x24BDD1540];
    v14 = *MEMORY[0x24BE2D188];
    v27 = *MEMORY[0x24BDD0FC8];
    v28[0] = CFSTR("JSONResult must be not be nil.");
    v15 = (void *)MEMORY[0x24BDBCE70];
    v16 = (const __CFString **)v28;
    v17 = &v27;
LABEL_6:
    objc_msgSend(v15, "dictionaryWithObjects:forKeys:count:", v16, v17, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, 1400, v12);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, v18);

    goto LABEL_7;
  }
  if (!v9)
  {
    v13 = (void *)MEMORY[0x24BDD1540];
    v14 = *MEMORY[0x24BE2D188];
    v25 = *MEMORY[0x24BDD0FC8];
    v26 = CFSTR("identifier must be not be nil.");
    v15 = (void *)MEMORY[0x24BDBCE70];
    v16 = &v26;
    v17 = &v25;
    goto LABEL_6;
  }
  v11 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __59__MLRServiceClient_donateJSONResult_identifier_completion___block_invoke;
  v21[3] = &unk_24CB924C0;
  v22 = v8;
  v23 = v9;
  v24 = v10;
  v19[0] = v11;
  v19[1] = 3221225472;
  v19[2] = __59__MLRServiceClient_donateJSONResult_identifier_completion___block_invoke_3;
  v19[3] = &unk_24CB92498;
  v20 = v24;
  -[MLRServiceClient performOnRemoteObjecWithBlock:errorHandler:](self, "performOnRemoteObjecWithBlock:errorHandler:", v21, v19);

  v12 = v22;
LABEL_7:

}

void __59__MLRServiceClient_donateJSONResult_identifier_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __59__MLRServiceClient_donateJSONResult_identifier_completion___block_invoke_2;
  v5[3] = &unk_24CB92498;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(a2, "donateJSONResult:identifier:completion:", v3, v4, v5);

}

uint64_t __59__MLRServiceClient_donateJSONResult_identifier_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __59__MLRServiceClient_donateJSONResult_identifier_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
