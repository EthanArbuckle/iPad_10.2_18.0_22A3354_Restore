@implementation IXATestAppRelayClient

- (IXATestAppRelayClient)init
{
  IXATestAppRelayClient *v2;
  IXATestAppRelayClient *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)IXATestAppRelayClient;
  v2 = -[IXATestAppRelayClient init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[IXATestAppRelayClient _initializeConnection](v2, "_initializeConnection");
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[IXATestAppRelayClient _disconnect](self, "_disconnect");
  v3.receiver = self;
  v3.super_class = (Class)IXATestAppRelayClient;
  -[IXATestAppRelayClient dealloc](&v3, sel_dealloc);
}

- (void)_initializeConnection
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_23ECA9000, log, OS_LOG_TYPE_ERROR, "Client is establishing connection to server.", v1, 2u);
}

- (void)_disconnect
{
  NSObject *v3;
  NSXPCConnection *connection;
  uint8_t v5[16];

  if (self->_connection)
  {
    IXATestAppRelayLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_23ECA9000, v3, OS_LOG_TYPE_DEFAULT, "Client is disconnecting from server.", v5, 2u);
    }

    -[NSXPCConnection invalidate](self->_connection, "invalidate");
    connection = self->_connection;
    self->_connection = 0;

  }
}

- (void)registerEndpoint:(id)a3 forServiceName:(id)a4 withEntitlement:(id)a5 canReplace:(BOOL)a6 completion:(id)a7
{
  _BOOL8 v7;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  _QWORD v19[4];
  id v20;

  v7 = a6;
  v12 = a7;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  -[IXATestAppRelayClient connection](self, "connection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __95__IXATestAppRelayClient_registerEndpoint_forServiceName_withEntitlement_canReplace_completion___block_invoke;
  v19[3] = &unk_250F5C8A0;
  v20 = v12;
  v17 = v12;
  objc_msgSend(v16, "synchronousRemoteObjectProxyWithErrorHandler:", v19);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "registerEndpoint:forServiceName:withEntitlement:canReplace:completion:", v15, v14, v13, v7, v17);
}

void __95__IXATestAppRelayClient_registerEndpoint_forServiceName_withEntitlement_canReplace_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  IXATestAppRelayLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __95__IXATestAppRelayClient_registerEndpoint_forServiceName_withEntitlement_canReplace_completion___block_invoke_cold_1(v3);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)unregisterEndpointForServiceName:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  v7 = a3;
  -[IXATestAppRelayClient connection](self, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __69__IXATestAppRelayClient_unregisterEndpointForServiceName_completion___block_invoke;
  v11[3] = &unk_250F5C8A0;
  v12 = v6;
  v9 = v6;
  objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "unregisterEndpointForServiceName:completion:", v7, v9);
}

void __69__IXATestAppRelayClient_unregisterEndpointForServiceName_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  IXATestAppRelayLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __95__IXATestAppRelayClient_registerEndpoint_forServiceName_withEntitlement_canReplace_completion___block_invoke_cold_1(v3);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchEndpointForServiceName:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  v7 = a3;
  -[IXATestAppRelayClient connection](self, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __64__IXATestAppRelayClient_fetchEndpointForServiceName_completion___block_invoke;
  v11[3] = &unk_250F5C8A0;
  v12 = v6;
  v9 = v6;
  objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "fetchEndpointForServiceName:completion:", v7, v9);
}

void __64__IXATestAppRelayClient_fetchEndpointForServiceName_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  IXATestAppRelayLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __95__IXATestAppRelayClient_registerEndpoint_forServiceName_withEntitlement_canReplace_completion___block_invoke_cold_1(v3);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

void __95__IXATestAppRelayClient_registerEndpoint_forServiceName_withEntitlement_canReplace_completion___block_invoke_cold_1(void *a1)
{
  void *v1;
  id v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  objc_msgSend(a1, "description");
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  OUTLINED_FUNCTION_2(v2, v3);
  OUTLINED_FUNCTION_0(&dword_23ECA9000, v4, v5, "Remote object proxy error: %{private}s", v6, v7, v8, v9, 3u);

  OUTLINED_FUNCTION_1();
}

@end
