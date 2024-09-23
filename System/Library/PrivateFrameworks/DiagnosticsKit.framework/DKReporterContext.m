@implementation DKReporterContext

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (_extensionAuxiliaryVendorProtocol_onceToken_0 != -1)
    dispatch_once(&_extensionAuxiliaryVendorProtocol_onceToken_0, &__block_literal_global_5);
  return (id)_extensionAuxiliaryVendorProtocol_interface_0;
}

void __54__DKReporterContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_255DD0948);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_extensionAuxiliaryVendorProtocol_interface_0;
  _extensionAuxiliaryVendorProtocol_interface_0 = v0;

  v2 = (void *)_extensionAuxiliaryVendorProtocol_interface_0;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_startRemoteReportWithComponentIdentity_completion_, 0, 0);

}

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_extensionAuxiliaryHostProtocol_onceToken_0 != -1)
    dispatch_once(&_extensionAuxiliaryHostProtocol_onceToken_0, &__block_literal_global_49_0);
  return (id)_extensionAuxiliaryHostProtocol_interface_0;
}

void __52__DKReporterContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_255DD0140);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_extensionAuxiliaryHostProtocol_interface_0;
  _extensionAuxiliaryHostProtocol_interface_0 = v0;

  v2 = (void *)_extensionAuxiliaryHostProtocol_interface_0;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_completeRemoteWithReport_completion_, 0, 0);

}

- (void)completeWithReport:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
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
  v7 = (void (**)(_QWORD))a4;
  DiagnosticsKitLogHandleForCategory(4);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v15 = "-[DKReporterContext completeWithReport:completion:]";
    _os_log_impl(&dword_22DE4C000, v8, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  -[DKReporterContext _auxiliaryConnection](self, "_auxiliaryConnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __51__DKReporterContext_completeWithReport_completion___block_invoke;
  v13[3] = &unk_24F99A8E8;
  v13[4] = self;
  objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[DKReporterContext _auxiliaryConnection](self, "_auxiliaryConnection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setInterruptionHandler:", &__block_literal_global_58_0);

  -[DKReporterContext _auxiliaryConnection](self, "_auxiliaryConnection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setInvalidationHandler:", &__block_literal_global_60_0);

  if (!v7)
    v7 = (void (**)(_QWORD))&__block_literal_global_61;
  if (v10)
    objc_msgSend(v10, "completeRemoteWithReport:completion:", v6, v7);
  else
    v7[2](v7);

}

void __51__DKReporterContext_completeWithReport_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  DiagnosticsKitLogHandleForCategory(4);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __51__DKReporterContext_completeWithReport_completion___block_invoke_cold_1((uint64_t)v3, v4);

  objc_msgSend(*(id *)(a1 + 32), "cancelRequestWithError:", v3);
  +[DKAnalytics sendAnalyticsWithEvent:error:](DKAnalytics, "sendAnalyticsWithEvent:error:", 2, v3);

}

void __51__DKReporterContext_completeWithReport_completion___block_invoke_57()
{
  id v0;

  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("DKReporterContextConnectionInterrupted"), 0, 0);
  v0 = (id)objc_claimAutoreleasedReturnValue();
  +[DKAnalytics sendAnalyticsWithEvent:error:](DKAnalytics, "sendAnalyticsWithEvent:error:", 0, v0);

}

void __51__DKReporterContext_completeWithReport_completion___block_invoke_2()
{
  id v0;

  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("DKReporterContextConnectionInvalidated"), 0, 0);
  v0 = (id)objc_claimAutoreleasedReturnValue();
  +[DKAnalytics sendAnalyticsWithEvent:error:](DKAnalytics, "sendAnalyticsWithEvent:error:", 1, v0);

}

- (void)startRemoteReportWithComponentIdentity:(id)a3 completion:(id)a4
{
  void (**v6)(id, uint64_t);
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  DKReporterContext *v14;
  uint8_t buf[4];
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = (void (**)(id, uint64_t))a4;
  v7 = a3;
  DiagnosticsKitLogHandleForCategory(4);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v16 = "-[DKReporterContext startRemoteReportWithComponentIdentity:completion:]";
    _os_log_impl(&dword_22DE4C000, v8, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  if (v6)
    v6[2](v6, 1);
  -[DKReporterContext _principalObject](self, "_principalObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setComponentIdentity:", v7);

  dispatch_get_global_queue(21, 0);
  v10 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __71__DKReporterContext_startRemoteReportWithComponentIdentity_completion___block_invoke;
  v12[3] = &unk_24F99ABB0;
  v13 = v9;
  v14 = self;
  v11 = v9;
  dispatch_async(v10, v12);

}

uint64_t __71__DKReporterContext_startRemoteReportWithComponentIdentity_completion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setupWithContext:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "start");
}

void __51__DKReporterContext_completeWithReport_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 136315394;
  v3 = "-[DKReporterContext completeWithReport:completion:]_block_invoke";
  v4 = 2112;
  v5 = a1;
  _os_log_error_impl(&dword_22DE4C000, a2, OS_LOG_TYPE_ERROR, "%s Failed to retrieve remote object proxy: %@", (uint8_t *)&v2, 0x16u);
}

@end
