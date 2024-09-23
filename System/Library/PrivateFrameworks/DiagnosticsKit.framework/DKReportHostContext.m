@implementation DKReportHostContext

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (_extensionAuxiliaryVendorProtocol_onceToken != -1)
    dispatch_once(&_extensionAuxiliaryVendorProtocol_onceToken, &__block_literal_global_1);
  return (id)_extensionAuxiliaryVendorProtocol_interface;
}

void __56__DKReportHostContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_255DD0948);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_extensionAuxiliaryVendorProtocol_interface;
  _extensionAuxiliaryVendorProtocol_interface = v0;

  v2 = (void *)_extensionAuxiliaryVendorProtocol_interface;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_startRemoteReportWithComponentIdentity_completion_, 0, 0);

}

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_extensionAuxiliaryHostProtocol_onceToken != -1)
    dispatch_once(&_extensionAuxiliaryHostProtocol_onceToken, &__block_literal_global_49);
  return (id)_extensionAuxiliaryHostProtocol_interface;
}

void __54__DKReportHostContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_255DD0140);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_extensionAuxiliaryHostProtocol_interface;
  _extensionAuxiliaryHostProtocol_interface = v0;

  v2 = (void *)_extensionAuxiliaryHostProtocol_interface;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_completeRemoteWithReport_completion_, 0, 0);

}

- (void)startWithPayload:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  DiagnosticsKitLogHandleForCategory(4);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v15 = "-[DKReportHostContext startWithPayload:completion:]";
    _os_log_impl(&dword_22DE4C000, v8, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  -[DKReportHostContext _auxiliaryConnection](self, "_auxiliaryConnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __51__DKReportHostContext_startWithPayload_completion___block_invoke;
  v13[3] = &unk_24F99A8E8;
  v13[4] = self;
  objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[DKReportHostContext _auxiliaryConnection](self, "_auxiliaryConnection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setInterruptionHandler:", &__block_literal_global_58);

  -[DKReportHostContext _auxiliaryConnection](self, "_auxiliaryConnection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setInvalidationHandler:", &__block_literal_global_60);

  if (!v7)
    v7 = (void (**)(id, _QWORD))&__block_literal_global_62;
  if (v10)
    objc_msgSend(v10, "startRemoteReportWithComponentIdentity:completion:", v6, v7);
  else
    v7[2](v7, 0);

}

void __51__DKReportHostContext_startWithPayload_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  DiagnosticsKitLogHandleForCategory(4);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __51__DKReportHostContext_startWithPayload_completion___block_invoke_cold_1((uint64_t)v3, v4);

  objc_msgSend(*(id *)(a1 + 32), "cancelRequestWithError:", v3);
  +[DKAnalytics sendAnalyticsWithEvent:error:](DKAnalytics, "sendAnalyticsWithEvent:error:", 2, v3);

}

void __51__DKReportHostContext_startWithPayload_completion___block_invoke_57()
{
  id v0;

  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("DKReportHostContextConnectionInterrupted"), 0, 0);
  v0 = (id)objc_claimAutoreleasedReturnValue();
  +[DKAnalytics sendAnalyticsWithEvent:error:](DKAnalytics, "sendAnalyticsWithEvent:error:", 0, v0);

}

void __51__DKReportHostContext_startWithPayload_completion___block_invoke_2()
{
  id v0;

  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("DKReportHostContextConnectionInvalidated"), 0, 0);
  v0 = (id)objc_claimAutoreleasedReturnValue();
  +[DKAnalytics sendAnalyticsWithEvent:error:](DKAnalytics, "sendAnalyticsWithEvent:error:", 1, v0);

}

- (void)cancelWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[DKReportHostContext delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancelExtensionRequest");

  v5 = v6;
  if (v6)
  {
    (*((void (**)(id))v6 + 2))(v6);
    v5 = v6;
  }

}

- (void)completeRemoteWithReport:(id)a3 completion:(id)a4
{
  void (*v6)(id);
  id v7;
  id v8;

  v6 = (void (*)(id))*((_QWORD *)a4 + 2);
  v7 = a3;
  v6(a4);
  -[DKReportHostContext delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "completeWithPayload:completion:", v7, &__block_literal_global_63);

}

- (DKExtensionHostAdapterDelegate)delegate
{
  return (DKExtensionHostAdapterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

void __51__DKReportHostContext_startWithPayload_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 136315394;
  v3 = "-[DKReportHostContext startWithPayload:completion:]_block_invoke";
  v4 = 2112;
  v5 = a1;
  _os_log_error_impl(&dword_22DE4C000, a2, OS_LOG_TYPE_ERROR, "%s Failed to retrieve remote object proxy: %@", (uint8_t *)&v2, 0x16u);
}

@end
