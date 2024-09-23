@implementation ILMessageFilterExtensionContext

- (void)deferQueryRequestToNetworkWithCompletion:(void *)completion
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;

  v4 = completion;
  v5 = MEMORY[0x24BDAC760];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __76__ILMessageFilterExtensionContext_deferQueryRequestToNetworkWithCompletion___block_invoke;
  v11[3] = &unk_24CE06C30;
  v6 = v4;
  v12 = v6;
  -[ILMessageFilterExtensionContext remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __76__ILMessageFilterExtensionContext_deferQueryRequestToNetworkWithCompletion___block_invoke_1;
  v9[3] = &unk_24CE06E28;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v7, "deferQueryRequestToNetworkWithReply:", v9);

}

void __76__ILMessageFilterExtensionContext_deferQueryRequestToNetworkWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  ILDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __76__ILMessageFilterExtensionContext_deferQueryRequestToNetworkWithCompletion___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __76__ILMessageFilterExtensionContext_deferQueryRequestToNetworkWithCompletion___block_invoke_1(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  ILDefaultLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138412290;
      v10 = v5;
      _os_log_impl(&dword_2126D5000, v8, OS_LOG_TYPE_DEFAULT, "response: %@", (uint8_t *)&v9, 0xCu);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    __76__ILMessageFilterExtensionContext_deferQueryRequestToNetworkWithCompletion___block_invoke_1_cold_1();
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)deferReportRequestToNetworkWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  v5 = MEMORY[0x24BDAC760];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __77__ILMessageFilterExtensionContext_deferReportRequestToNetworkWithCompletion___block_invoke;
  v11[3] = &unk_24CE06C30;
  v6 = v4;
  v12 = v6;
  -[ILMessageFilterExtensionContext remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __77__ILMessageFilterExtensionContext_deferReportRequestToNetworkWithCompletion___block_invoke_3;
  v9[3] = &unk_24CE06E28;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v7, "deferReportRequestToNetworkWithReply:", v9);

}

void __77__ILMessageFilterExtensionContext_deferReportRequestToNetworkWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  ILDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __76__ILMessageFilterExtensionContext_deferQueryRequestToNetworkWithCompletion___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __77__ILMessageFilterExtensionContext_deferReportRequestToNetworkWithCompletion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  ILDefaultLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138412290;
      v10 = v5;
      _os_log_impl(&dword_2126D5000, v8, OS_LOG_TYPE_DEFAULT, "response: %@", (uint8_t *)&v9, 0xCu);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    __77__ILMessageFilterExtensionContext_deferReportRequestToNetworkWithCompletion___block_invoke_3_cold_1();
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)finish
{
  NSObject *v3;
  uint8_t v4[16];

  ILDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_2126D5000, v3, OS_LOG_TYPE_DEFAULT, "finishing extension context", v4, 2u);
  }

  -[ILMessageFilterExtensionContext completeRequestReturningItems:completionHandler:](self, "completeRequestReturningItems:completionHandler:", 0, 0);
}

- (void)handleQueryRequest:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  NSObject *v11;

  v6 = a3;
  v7 = a4;
  -[ILMessageFilterExtensionContext extension](self, "extension");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "conformsToProtocol:", &unk_254B5AC88);

  if (v9)
  {
    -[ILMessageFilterExtensionContext extension](self, "extension");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleQueryRequest:context:completion:", v6, self, v7);

  }
  else
  {
    ILDefaultLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[ILMessageFilterExtensionContext handleQueryRequest:reply:].cold.1(self, v11);

    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

- (void)handleReportRequest:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  int v9;
  void *v10;
  NSObject *v11;

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  -[ILMessageFilterExtensionContext extension](self, "extension");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "conformsToProtocol:", &unk_254B5ACE8);

  if (v9)
  {
    -[ILMessageFilterExtensionContext extension](self, "extension");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleReportRequest:context:completion:", v6, self, v7);

  }
  else
  {
    ILDefaultLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[ILMessageFilterExtensionContext handleReportRequest:reply:].cold.1(self, v11);

    v7[2](v7);
  }

}

- (void)handleCapabilitiesQueryRequest:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  NSObject *v11;

  v6 = a3;
  v7 = a4;
  -[ILMessageFilterExtensionContext extension](self, "extension");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "conformsToProtocol:", &unk_254B5AD48);

  if (v9)
  {
    -[ILMessageFilterExtensionContext extension](self, "extension");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleCapabilitiesQueryRequest:context:completion:", v6, self, v7);

  }
  else
  {
    ILDefaultLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[ILMessageFilterExtensionContext handleCapabilitiesQueryRequest:reply:].cold.1(self, v11);

    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[ILMessageFilterExtensionContext _auxiliaryConnection](self, "_auxiliaryConnection");
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

void __76__ILMessageFilterExtensionContext_deferQueryRequestToNetworkWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_2126D5000, v0, v1, "remoteObjectProxy error: %@", v2);
  OUTLINED_FUNCTION_1();
}

void __76__ILMessageFilterExtensionContext_deferQueryRequestToNetworkWithCompletion___block_invoke_1_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_2126D5000, v0, v1, "deferQueryRequestToNetwork error: %@", v2);
  OUTLINED_FUNCTION_1();
}

void __77__ILMessageFilterExtensionContext_deferReportRequestToNetworkWithCompletion___block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_2126D5000, v0, v1, "deferReportRequestToNetwork error: %@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)handleQueryRequest:(void *)a1 reply:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "extension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_2126D5000, a2, v4, "Extension %@ does not conform to protocol ILMessageFilterQueryHandling", v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)handleReportRequest:(void *)a1 reply:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "extension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_2126D5000, a2, v4, "Extension %@ does not conform to protocol ILMessageFilterReportHandling", v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)handleCapabilitiesQueryRequest:(void *)a1 reply:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "extension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_2126D5000, a2, v4, "Extension %@ does not conform to protocol ILMessageFilterCapabilitiesQueryHandling", v5);

  OUTLINED_FUNCTION_2_0();
}

@end
