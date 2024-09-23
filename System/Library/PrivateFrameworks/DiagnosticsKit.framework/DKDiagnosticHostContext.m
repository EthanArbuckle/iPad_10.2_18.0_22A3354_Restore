@implementation DKDiagnosticHostContext

- (DKDiagnosticHostContext)initWithConnection:(id)a3
{
  id v5;
  DKDiagnosticHostContext *v6;
  DKDiagnosticHostContext *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DKDiagnosticHostContext;
  v6 = -[DKDiagnosticHostContext init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_xpcConnection, a3);
    v7->_isXPC = 1;
  }

  return v7;
}

- (id)_helperConnnection
{
  void *v3;
  void *v4;

  if (-[DKDiagnosticHostContext isXPC](self, "isXPC")
    && (-[DKDiagnosticHostContext xpcConnection](self, "xpcConnection"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    -[DKDiagnosticHostContext xpcConnection](self, "xpcConnection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[DKDiagnosticHostContext _auxiliaryConnection](self, "_auxiliaryConnection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (_extensionAuxiliaryVendorProtocol_onceToken_2 != -1)
    dispatch_once(&_extensionAuxiliaryVendorProtocol_onceToken_2, &__block_literal_global_10);
  return (id)_extensionAuxiliaryVendorProtocol_interface_2;
}

void __60__DKDiagnosticHostContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_255DD0EB8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_extensionAuxiliaryVendorProtocol_interface_2;
  _extensionAuxiliaryVendorProtocol_interface_2 = v0;

  v2 = (void *)_extensionAuxiliaryVendorProtocol_interface_2;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_startRemoteDiagnosticWithDiagnosticParameters_completion_, 0, 0);

}

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_extensionAuxiliaryHostProtocol_onceToken_2 != -1)
    dispatch_once(&_extensionAuxiliaryHostProtocol_onceToken_2, &__block_literal_global_59);
  return (id)_extensionAuxiliaryHostProtocol_interface_2;
}

void __58__DKDiagnosticHostContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_255DD1270);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_extensionAuxiliaryHostProtocol_interface_2;
  _extensionAuxiliaryHostProtocol_interface_2 = v0;

  v2 = (void *)_extensionAuxiliaryHostProtocol_interface_2;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_remoteHostCompleteWithResult_completion_, 0, 0);

}

- (void)startWithPayload:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *);
  void *v17;
  DKDiagnosticHostContext *v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  DiagnosticsKitLogHandleForCategory(4);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22DE4C000, v8, OS_LOG_TYPE_DEFAULT, "DKDiagnosticHostContext::startWithCompletion:", buf, 2u);
  }

  -[DKDiagnosticHostContext _helperConnnection](self, "_helperConnnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x24BDAC760];
  v15 = 3221225472;
  v16 = __55__DKDiagnosticHostContext_startWithPayload_completion___block_invoke;
  v17 = &unk_24F99B000;
  v18 = self;
  v10 = v7;
  v19 = v10;
  objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", &v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  DiagnosticsKitLogHandleForCategory(4);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = (void *)MEMORY[0x22E320CF4](v10);
    *(_DWORD *)buf = 138412546;
    v21 = v11;
    v22 = 2112;
    v23 = v13;
    _os_log_impl(&dword_22DE4C000, v12, OS_LOG_TYPE_DEFAULT, "Got ROP: %@, completion: %@", buf, 0x16u);

  }
  if (!v10)
    v10 = &__block_literal_global_101;
  if (v11)
    objc_msgSend(v11, "startRemoteDiagnosticWithDiagnosticParameters:completion:", v6, v10, v14, v15, v16, v17, v18);
  else
    (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);

}

void __55__DKDiagnosticHostContext_startWithPayload_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  DiagnosticsKitLogHandleForCategory(4);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __55__DKDiagnosticHostContext_startWithPayload_completion___block_invoke_cold_1();

  if ((objc_msgSend(*(id *)(a1 + 32), "isXPC") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "cancelRequestWithError:", v3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  +[DKAnalytics sendAnalyticsWithEvent:error:](DKAnalytics, "sendAnalyticsWithEvent:error:", 2, v3);

}

- (void)cancelWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void (**v6)(_QWORD);
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *);
  void *v11;
  DKDiagnosticHostContext *v12;
  id v13;

  v4 = a3;
  -[DKDiagnosticHostContext _helperConnnection](self, "_helperConnnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v9 = 3221225472;
  v10 = __48__DKDiagnosticHostContext_cancelWithCompletion___block_invoke;
  v11 = &unk_24F99B000;
  v12 = self;
  v6 = (void (**)(_QWORD))v4;
  v13 = v6;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", &v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    v6 = (void (**)(_QWORD))&__block_literal_global_103;
  if (v7)
    objc_msgSend(v7, "cancelRemoteDiagnosticWithCompletion:", v6, v8, v9, v10, v11, v12);
  else
    v6[2](v6);

}

void __48__DKDiagnosticHostContext_cancelWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  DiagnosticsKitLogHandleForCategory(4);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __48__DKDiagnosticHostContext_cancelWithCompletion___block_invoke_cold_1();

  if ((objc_msgSend(*(id *)(a1 + 32), "isXPC") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "cancelRequestWithError:", v3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  +[DKAnalytics sendAnalyticsWithEvent:error:](DKAnalytics, "sendAnalyticsWithEvent:error:", 2, v3);

}

- (void)setNotAllowListedWithContactMessage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  _QWORD v10[5];
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  DiagnosticsKitLogHandleForCategory(4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22DE4C000, v5, OS_LOG_TYPE_DEFAULT, "DKDiagnosticHostContext::setNotAllowListedWithContactMessage", buf, 2u);
  }

  -[DKDiagnosticHostContext _helperConnnection](self, "_helperConnnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __63__DKDiagnosticHostContext_setNotAllowListedWithContactMessage___block_invoke;
  v10[3] = &unk_24F99A8E8;
  v10[4] = self;
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  DiagnosticsKitLogHandleForCategory(4);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v12 = v7;
    _os_log_impl(&dword_22DE4C000, v8, OS_LOG_TYPE_DEFAULT, "Got ROP: %@", buf, 0xCu);
  }

  DiagnosticsKitLogHandleForCategory(2);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22DE4C000, v9, OS_LOG_TYPE_DEFAULT, "About to call setRemoteDiagnosticNotAllowListed", buf, 2u);
  }

  objc_msgSend(v7, "setRemoteDiagnosticNotAllowListedWithContactMessage:", v4);
}

void __63__DKDiagnosticHostContext_setNotAllowListedWithContactMessage___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  DiagnosticsKitLogHandleForCategory(4);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __63__DKDiagnosticHostContext_setNotAllowListedWithContactMessage___block_invoke_cold_1();

  if ((objc_msgSend(*(id *)(a1 + 32), "isXPC") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "cancelRequestWithError:", v3);
  +[DKAnalytics sendAnalyticsWithEvent:error:](DKAnalytics, "sendAnalyticsWithEvent:error:", 2, v3);

}

- (void)checkShouldShowViewController:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  _QWORD v10[5];
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  DiagnosticsKitLogHandleForCategory(4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22DE4C000, v5, OS_LOG_TYPE_DEFAULT, "DKDiagnosticHostContext::checkShouldShowViewController", buf, 2u);
  }

  -[DKDiagnosticHostContext _helperConnnection](self, "_helperConnnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __57__DKDiagnosticHostContext_checkShouldShowViewController___block_invoke;
  v10[3] = &unk_24F99A8E8;
  v10[4] = self;
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  DiagnosticsKitLogHandleForCategory(4);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v12 = v7;
    _os_log_impl(&dword_22DE4C000, v8, OS_LOG_TYPE_DEFAULT, "Got ROP: %@", buf, 0xCu);
  }

  DiagnosticsKitLogHandleForCategory(2);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22DE4C000, v9, OS_LOG_TYPE_DEFAULT, "About to call checkShouldShowViewController", buf, 2u);
  }

  objc_msgSend(v7, "checkShouldShowRemoteDiagnosticViewController:", v4);
}

void __57__DKDiagnosticHostContext_checkShouldShowViewController___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  DiagnosticsKitLogHandleForCategory(4);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __57__DKDiagnosticHostContext_checkShouldShowViewController___block_invoke_cold_1();

  if ((objc_msgSend(*(id *)(a1 + 32), "isXPC") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "cancelRequestWithError:", v3);
  +[DKAnalytics sendAnalyticsWithEvent:error:](DKAnalytics, "sendAnalyticsWithEvent:error:", 2, v3);

}

- (void)remoteHostUpdateProgress:(id)a3 forTest:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  -[DKDiagnosticHostContext delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hostServicesDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "conformsToProtocol:", &unk_255DD12E8);

  if (v9)
  {
    -[DKDiagnosticHostContext delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "hostServicesDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "updateProgress:forTest:", v12, v6);
  }

}

- (void)remoteHostEnableVolumeHUD:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  id v9;

  v3 = a3;
  -[DKDiagnosticHostContext delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hostServicesDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "conformsToProtocol:", &unk_255DD17B0);

  if (v7)
  {
    -[DKDiagnosticHostContext delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "hostServicesDelegate");
    v9 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "enableVolumeHUD:", v3);
  }
}

- (void)remoteHostSetScreenToBrightness:(float)a3 animate:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  double v11;
  id v12;

  v4 = a4;
  -[DKDiagnosticHostContext delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hostServicesDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "conformsToProtocol:", &unk_255DD16E0);

  if (v9)
  {
    -[DKDiagnosticHostContext delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "hostServicesDelegate");
    v12 = (id)objc_claimAutoreleasedReturnValue();

    *(float *)&v11 = a3;
    objc_msgSend(v12, "setScreenToBrightness:animate:", v4, v11);

  }
}

- (void)remoteHostGetAsset:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  uint8_t v14[16];

  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  DiagnosticsKitLogHandleForCategory(4);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_22DE4C000, v8, OS_LOG_TYPE_DEFAULT, "DKDiagnosticHostContext::getAsset:completion:", v14, 2u);
  }

  -[DKDiagnosticHostContext delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hostServicesDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "conformsToProtocol:", &unk_255DD1380);

  if (v11)
  {
    -[DKDiagnosticHostContext delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "hostServicesDelegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "getAsset:completion:", v6, v7);
  }
  else
  {
    v7[2](v7, 0);
  }

}

- (void)remoteHostUploadAssets:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *, void *);
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  uint8_t v15[16];

  v6 = a3;
  v7 = (void (**)(id, void *, void *))a4;
  DiagnosticsKitLogHandleForCategory(4);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v15 = 0;
    _os_log_impl(&dword_22DE4C000, v8, OS_LOG_TYPE_DEFAULT, "DKDiagnosticHostContext::uploadAssets:completion:", v15, 2u);
  }

  -[DKDiagnosticHostContext delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hostServicesDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "conformsToProtocol:", &unk_255DD1380);

  if (v11)
  {
    -[DKDiagnosticHostContext delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "hostServicesDelegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "uploadAssets:completion:", v6, v7);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE30], "array");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("DKErrorDomain"), -1008, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v13, v14);

  }
}

- (void)remoteHostCompleteWithResult:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[DKDiagnosticHostContext delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "completeWithPayload:completion:", v7, v6);

}

- (void)remoteHostDismissViewControllerWithCompletion:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[DKDiagnosticHostContext delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[DKDiagnosticHostContext delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dismissViewControllerWithCompletion:", v7);

  }
}

- (void)remoteHostShowUI:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  -[DKDiagnosticHostContext delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hostServicesDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "conformsToProtocol:", &unk_255DD13F8);

  if (v9)
  {
    -[DKDiagnosticHostContext delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "hostServicesDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "showUI:completion:", v12, v6);
  }

}

- (void)remoteHostRequestPluginReloadOnFinishWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[DKDiagnosticHostContext delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hostServicesDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "conformsToProtocol:", &unk_255DD18D8);

  if (v6)
  {
    -[DKDiagnosticHostContext delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "hostServicesDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "requestPluginReloadOnFinishWithCompletion:", v9);
  }

}

- (void)remoteHostRequestSessionAccessoryIdentifierWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[DKDiagnosticHostContext delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hostServicesDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "conformsToProtocol:", &unk_255DD1510);

  if (v6)
  {
    -[DKDiagnosticHostContext delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "hostServicesDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "requestSessionAccessoryIdentifierWithCompletion:", v9);
  }

}

- (void)remoteHostUnpairSessionAccessoryOnTestCompletion
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  id v7;

  -[DKDiagnosticHostContext delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hostServicesDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "conformsToProtocol:", &unk_255DD1510);

  if (v5)
  {
    -[DKDiagnosticHostContext delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "hostServicesDelegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "unpairSessionAccessoryOnTestCompletion");
  }
}

- (void)remoteHostAllowSessionAccessoryDisconnectForDuration:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[DKDiagnosticHostContext delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hostServicesDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "conformsToProtocol:", &unk_255DD1510);

  if (v6)
  {
    -[DKDiagnosticHostContext delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "hostServicesDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "allowSessionAccessoryDisconnectForDuration:", v9);
  }

}

- (void)remoteHostClearAllowSessionAccessoryDisconnect
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  id v7;

  -[DKDiagnosticHostContext delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hostServicesDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "conformsToProtocol:", &unk_255DD1510);

  if (v5)
  {
    -[DKDiagnosticHostContext delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "hostServicesDelegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "clearAllowSessionAccessoryDisconnect");
  }
}

- (void)remoteHostDisplayAlertWithHeader:(id)a3 message:(id)a4 buttonStrings:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  -[DKDiagnosticHostContext delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "hostServicesDelegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "conformsToProtocol:", &unk_255DD1608);

  if (v15)
  {
    -[DKDiagnosticHostContext delegate](self, "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "hostServicesDelegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "displayAlertWithHeader:message:buttonStrings:completion:", v18, v10, v11, v12);
  }

}

- (void)remoteHostDisplayInstructions:(id)a3 style:(int)a4 imageLocators:(id)a5 title:(id)a6 subtitle:(id)a7 iconLocator:(id)a8 options:(id)a9 completion:(id)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  id v27;

  v27 = a3;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v19 = a9;
  v20 = a10;
  -[DKDiagnosticHostContext delegate](self, "delegate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "hostServicesDelegate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "conformsToProtocol:", &unk_255DD1608);

  if (v23)
  {
    -[DKDiagnosticHostContext delegate](self, "delegate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "hostServicesDelegate");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v25, "displayInstructions:style:imageLocators:title:subtitle:iconLocator:options:completion:", v27, a4, v15, v16, v17, v18, v19, v20);
  }

}

- (void)remoteHostShowStatusBar
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  id v7;

  -[DKDiagnosticHostContext delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hostServicesDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "conformsToProtocol:", &unk_255DD1848);

  if (v5)
  {
    -[DKDiagnosticHostContext delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "hostServicesDelegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "showStatusBar");
  }
}

- (void)remoteHostHideStatusBar
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  id v7;

  -[DKDiagnosticHostContext delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hostServicesDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "conformsToProtocol:", &unk_255DD1848);

  if (v5)
  {
    -[DKDiagnosticHostContext delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "hostServicesDelegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "hideStatusBar");
  }
}

- (void)remoteHostSetStatusBarStyle:(int64_t)a3
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  id v9;

  -[DKDiagnosticHostContext delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hostServicesDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "conformsToProtocol:", &unk_255DD1848);

  if (v7)
  {
    -[DKDiagnosticHostContext delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "hostServicesDelegate");
    v9 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "setStatusBarStyle:", a3);
  }
}

- (DKExtensionHostAdapterDelegate)delegate
{
  return (DKExtensionHostAdapterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXpcConnection:(id)a3
{
  objc_storeStrong((id *)&self->_xpcConnection, a3);
}

- (BOOL)isXPC
{
  return self->_isXPC;
}

- (void)setIsXPC:(BOOL)a3
{
  self->_isXPC = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __55__DKDiagnosticHostContext_startWithPayload_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_22DE4C000, v0, v1, "%s Failed to retrieve remote object proxy: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void __48__DKDiagnosticHostContext_cancelWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_22DE4C000, v0, v1, "%s Failed to retrieve remote object proxy: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void __63__DKDiagnosticHostContext_setNotAllowListedWithContactMessage___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_22DE4C000, v0, v1, "%s Failed to retrieve remote object proxy: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void __57__DKDiagnosticHostContext_checkShouldShowViewController___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_22DE4C000, v0, v1, "%s Failed to retrieve remote object proxy: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

@end
