@implementation NPKIDVRemoteDeviceServiceClient

- (NPKIDVRemoteDeviceServiceClient)initWithRemoteServiceName:(id)a3
{
  id v4;
  NPKIDVRemoteDeviceServiceClient *v5;
  uint64_t v6;
  NSString *serviceName;
  id v8;
  void *v9;
  uint64_t v10;
  PKXPCService *remoteService;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NPKIDVRemoteDeviceServiceClient;
  v5 = -[NPKIDVRemoteDeviceServiceClient init](&v13, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    serviceName = v5->_serviceName;
    v5->_serviceName = (NSString *)v6;

    v8 = objc_alloc(MEMORY[0x24BE6EF78]);
    NPKIDVRemoteDeviceServiceServerProtocolInterface();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "initWithMachServiceName:remoteObjectInterface:exportedObjectInterface:exportedObject:", v4, v9, 0, v5);
    remoteService = v5->_remoteService;
    v5->_remoteService = (PKXPCService *)v10;

    -[PKXPCService setDelegate:](v5->_remoteService, "setDelegate:", v5);
  }

  return v5;
}

- (void)didReceiveEvent:(unint64_t)a3 fromRemoteDeviceWithID:(id)a4
{
  NSString *v7;
  id v8;
  NSObject *v9;
  _BOOL4 v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  NSString *v14;
  void *v15;
  NSString *v16;
  _QWORD v17[4];
  NSString *v18;
  NPKIDVRemoteDeviceServiceClient *v19;
  unint64_t v20;
  _QWORD v21[4];
  NSString *v22;
  unint64_t v23;
  uint8_t buf[4];
  NSString *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v7 = self->_serviceName;
  v8 = a4;
  pk_Payment_log();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

  if (v10)
  {
    pk_Payment_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      stringsArrayFromNPKIDVRemoteDeviceServiceEvents(a3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v25 = v7;
      v26 = 2112;
      v27 = v12;
      _os_log_impl(&dword_213518000, v11, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Will Notify notify remote process with service Names:%@ event:%@", buf, 0x16u);

    }
  }
  v13 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __74__NPKIDVRemoteDeviceServiceClient_didReceiveEvent_fromRemoteDeviceWithID___block_invoke;
  v21[3] = &unk_24CFEC6E8;
  v14 = v7;
  v22 = v14;
  v23 = a3;
  -[NPKIDVRemoteDeviceServiceClient _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v21);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v13;
  v17[1] = 3221225472;
  v17[2] = __74__NPKIDVRemoteDeviceServiceClient_didReceiveEvent_fromRemoteDeviceWithID___block_invoke_32;
  v17[3] = &unk_24CFE83A8;
  v19 = self;
  v20 = a3;
  v18 = v14;
  v16 = v14;
  objc_msgSend(v15, "didReceiveEvent:fromRemoteDeviceWithID:ackHandler:", a3, v8, v17);

}

void __74__NPKIDVRemoteDeviceServiceClient_didReceiveEvent_fromRemoteDeviceWithID___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  pk_Payment_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);

  if (v3)
  {
    pk_Payment_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 32);
      stringsArrayFromNPKIDVRemoteDeviceServiceEvents(*(_QWORD *)(a1 + 40));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138412546;
      v8 = v5;
      v9 = 2112;
      v10 = v6;
      _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_ERROR, "Error: NPKIDVRemoteDeviceService: Fail to notify remote process with service Names:%@ event:%@", (uint8_t *)&v7, 0x16u);

    }
  }
}

void __74__NPKIDVRemoteDeviceServiceClient_didReceiveEvent_fromRemoteDeviceWithID___block_invoke_32(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  pk_Payment_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    pk_Payment_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      stringsArrayFromNPKIDVRemoteDeviceServiceEvents(*(_QWORD *)(a1 + 48));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138412546;
      v8 = v5;
      v9 = 2112;
      v10 = v6;
      _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Did Notify notify remote process with service Names:%@ event:%@", (uint8_t *)&v7, 0x16u);

    }
  }
}

- (id)_remoteObjectProxyWithFailureHandler:(id)a3
{
  PKXPCService *remoteService;
  void *v4;
  void *v5;

  remoteService = self->_remoteService;
  -[NPKIDVRemoteDeviceServiceClient _errorHandlerWithCompletion:](self, "_errorHandlerWithCompletion:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKXPCService remoteObjectProxyWithErrorHandler:](remoteService, "remoteObjectProxyWithErrorHandler:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_errorHandlerWithCompletion:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v3 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __63__NPKIDVRemoteDeviceServiceClient__errorHandlerWithCompletion___block_invoke;
  v8[3] = &unk_24CFE7B80;
  v9 = v3;
  v4 = v3;
  v5 = (void *)MEMORY[0x2199B6780](v8);
  v6 = (void *)MEMORY[0x2199B6780]();

  return v6;
}

void __63__NPKIDVRemoteDeviceServiceClient__errorHandlerWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  pk_Payment_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

  if (v5)
  {
    pk_Payment_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8 = 138412290;
      v9 = v3;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_ERROR, "Error: NPKIDVRemoteDeviceService: Error on connection: %@", (uint8_t *)&v8, 0xCu);
    }

  }
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);

}

- (void)remoteService:(id)a3 didEstablishConnection:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  int v11;
  NPKIDVRemoteDeviceServiceClient *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  pk_Payment_log();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    pk_Payment_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138412802;
      v12 = self;
      v13 = 2112;
      v14 = v6;
      v15 = 2112;
      v16 = v7;
      _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: %@, remote service:%@ did establish connection:%@", (uint8_t *)&v11, 0x20u);
    }

  }
}

- (void)remoteService:(id)a3 didInterruptConnection:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  int v11;
  NPKIDVRemoteDeviceServiceClient *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  pk_Payment_log();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    pk_Payment_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138412802;
      v12 = self;
      v13 = 2112;
      v14 = v6;
      v15 = 2112;
      v16 = v7;
      _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: %@, remote service:%@ did interrupt connection:%@", (uint8_t *)&v11, 0x20u);
    }

  }
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_remoteService, 0);
}

@end
