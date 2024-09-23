@implementation ILMessageFilterExtensionHostContext

- (void)handleQueryRequest:(id)a3 completion:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;

  v6 = a4;
  v7 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __69__ILMessageFilterExtensionHostContext_handleQueryRequest_completion___block_invoke;
  v14[3] = &unk_24CE06C30;
  v8 = v6;
  v15 = v8;
  v9 = a3;
  -[ILMessageFilterExtensionHostContext remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __69__ILMessageFilterExtensionHostContext_handleQueryRequest_completion___block_invoke_1;
  v12[3] = &unk_24CE06C58;
  v13 = v8;
  v11 = v8;
  objc_msgSend(v10, "handleQueryRequest:reply:", v9, v12);

}

void __69__ILMessageFilterExtensionHostContext_handleQueryRequest_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  ILDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __69__ILMessageFilterExtensionHostContext_handleQueryRequest_completion___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __69__ILMessageFilterExtensionHostContext_handleQueryRequest_completion___block_invoke_1(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  ILDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_2126D5000, v4, OS_LOG_TYPE_DEFAULT, "response: %@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)handleReportRequest:(id)a3 completion:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;

  v6 = a4;
  v7 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __70__ILMessageFilterExtensionHostContext_handleReportRequest_completion___block_invoke;
  v14[3] = &unk_24CE06C30;
  v8 = v6;
  v15 = v8;
  v9 = a3;
  -[ILMessageFilterExtensionHostContext remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __70__ILMessageFilterExtensionHostContext_handleReportRequest_completion___block_invoke_3;
  v12[3] = &unk_24CE06C80;
  v13 = v8;
  v11 = v8;
  objc_msgSend(v10, "handleReportRequest:reply:", v9, v12);

}

void __70__ILMessageFilterExtensionHostContext_handleReportRequest_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  ILDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __69__ILMessageFilterExtensionHostContext_handleQueryRequest_completion___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __70__ILMessageFilterExtensionHostContext_handleReportRequest_completion___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  ILDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_2126D5000, v2, OS_LOG_TYPE_DEFAULT, "", v4, 2u);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)handleCapabilitiesQueryRequest:(id)a3 completion:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;

  v6 = a4;
  v7 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __81__ILMessageFilterExtensionHostContext_handleCapabilitiesQueryRequest_completion___block_invoke;
  v14[3] = &unk_24CE06C30;
  v8 = v6;
  v15 = v8;
  v9 = a3;
  -[ILMessageFilterExtensionHostContext remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __81__ILMessageFilterExtensionHostContext_handleCapabilitiesQueryRequest_completion___block_invoke_5;
  v12[3] = &unk_24CE06CA8;
  v13 = v8;
  v11 = v8;
  objc_msgSend(v10, "handleCapabilitiesQueryRequest:reply:", v9, v12);

}

void __81__ILMessageFilterExtensionHostContext_handleCapabilitiesQueryRequest_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  ILDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __69__ILMessageFilterExtensionHostContext_handleQueryRequest_completion___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __81__ILMessageFilterExtensionHostContext_handleCapabilitiesQueryRequest_completion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  ILDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_2126D5000, v4, OS_LOG_TYPE_DEFAULT, "response: %@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)finish
{
  id v2;

  -[ILMessageFilterExtensionHostContext remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", &__block_literal_global);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "finish");

}

void __45__ILMessageFilterExtensionHostContext_finish__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  ILDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __69__ILMessageFilterExtensionHostContext_handleQueryRequest_completion___block_invoke_cold_1();

}

- (void)deferQueryRequestToNetworkWithReply:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void (**v8)(id, id);

  v4 = a3;
  -[ILMessageFilterExtensionHostContext deferQueryRequestToNetwork](self, "deferQueryRequestToNetwork");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[ILMessageFilterExtensionHostContext deferQueryRequestToNetwork](self, "deferQueryRequestToNetwork");
    v8 = (void (**)(id, id))objc_claimAutoreleasedReturnValue();
    v8[2](v8, v4);

  }
  else
  {
    ILDefaultLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[ILMessageFilterExtensionHostContext deferQueryRequestToNetworkWithReply:].cold.1();

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.IdentityLookup.error.messagefilter"), 1, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v7);

  }
}

- (void)deferReportRequestToNetworkWithReply:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void (**v8)(id, id);

  v4 = a3;
  -[ILMessageFilterExtensionHostContext deferReportRequestToNetwork](self, "deferReportRequestToNetwork");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[ILMessageFilterExtensionHostContext deferReportRequestToNetwork](self, "deferReportRequestToNetwork");
    v8 = (void (**)(id, id))objc_claimAutoreleasedReturnValue();
    v8[2](v8, v4);

  }
  else
  {
    ILDefaultLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[ILMessageFilterExtensionHostContext deferReportRequestToNetworkWithReply:].cold.1();

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.IdentityLookup.error.messagefilter"), 1, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v7);

  }
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[ILMessageFilterExtensionHostContext _auxiliaryConnection](self, "_auxiliaryConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  return (id)objc_msgSend(MEMORY[0x24BDD1990], "il_messageFilterExtensionVendorInterface");
}

+ (id)_extensionAuxiliaryHostProtocol
{
  return (id)objc_msgSend(MEMORY[0x24BDD1990], "il_messageFilterExtensionHostInterface");
}

- (id)deferQueryRequestToNetwork
{
  return self->_deferQueryRequestToNetwork;
}

- (void)setDeferQueryRequestToNetwork:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)deferReportRequestToNetwork
{
  return self->_deferReportRequestToNetwork;
}

- (void)setDeferReportRequestToNetwork:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_deferReportRequestToNetwork, 0);
  objc_storeStrong(&self->_deferQueryRequestToNetwork, 0);
}

void __69__ILMessageFilterExtensionHostContext_handleQueryRequest_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2126D5000, v0, v1, "error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)deferQueryRequestToNetworkWithReply:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2126D5000, v0, v1, "Extension requested to defer query request to network but no deferQueryRequestToNetwork block is set on %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)deferReportRequestToNetworkWithReply:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2126D5000, v0, v1, "Extension requested to defer report request to network but no deferReportRequestToNetwork block is set on %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
