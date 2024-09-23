@implementation DKDiagnosticContext

- (DKDiagnosticContext)initWithConnection:(id)a3
{
  id v5;
  DKDiagnosticContext *v6;
  DKDiagnosticContext *v7;
  id xpcPrincipalObject;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DKDiagnosticContext;
  v6 = -[DKDiagnosticContext init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_xpcConnection, a3);
    v7->_isXPC = 1;
    xpcPrincipalObject = v7->_xpcPrincipalObject;
    v7->_xpcPrincipalObject = 0;

    v7->_isPresentingView = 0;
  }

  return v7;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  void *v4;
  $115C4C562B26FF47E01F9F4EA65B5887 *result;
  void *v6;

  -[DKDiagnosticContext _helperConnnection](self, "_helperConnnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v6 = v4;
    objc_msgSend(v4, "auditToken");
    v4 = v6;
  }
  else
  {
    *(_OWORD *)retstr->var0 = 0u;
    *(_OWORD *)&retstr->var0[4] = 0u;
  }

  return result;
}

- (id)_helperConnnection
{
  void *v3;
  void *v4;

  if (-[DKDiagnosticContext isXPC](self, "isXPC")
    && (-[DKDiagnosticContext xpcConnection](self, "xpcConnection"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    -[DKDiagnosticContext xpcConnection](self, "xpcConnection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[DKDiagnosticContext _auxiliaryConnection](self, "_auxiliaryConnection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (id)_helperPrincipalObject
{
  void *v3;
  void *v4;

  if (-[DKDiagnosticContext isXPC](self, "isXPC")
    && (-[DKDiagnosticContext xpcPrincipalObject](self, "xpcPrincipalObject"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    -[DKDiagnosticContext xpcPrincipalObject](self, "xpcPrincipalObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[DKDiagnosticContext _principalObject](self, "_principalObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (id)testID
{
  void *v2;
  void *v3;

  -[DKDiagnosticContext _extensionAttributes](self, "_extensionAttributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("DKDiagnosticIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_testName
{
  void *v2;
  void *v3;

  -[DKDiagnosticContext _extensionAttributes](self, "_extensionAttributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("DKDiagnosticName"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_extensionAttributes
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForInfoDictionaryKey:", CFSTR("NSExtension"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("NSExtensionAttributes"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (_extensionAuxiliaryVendorProtocol_onceToken_1 != -1)
    dispatch_once(&_extensionAuxiliaryVendorProtocol_onceToken_1, &__block_literal_global_6);
  return (id)_extensionAuxiliaryVendorProtocol_interface_1;
}

void __56__DKDiagnosticContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_255DD0EB8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_extensionAuxiliaryVendorProtocol_interface_1;
  _extensionAuxiliaryVendorProtocol_interface_1 = v0;

  v2 = (void *)_extensionAuxiliaryVendorProtocol_interface_1;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_startRemoteDiagnosticWithDiagnosticParameters_completion_, 0, 0);

}

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_extensionAuxiliaryHostProtocol_onceToken_1 != -1)
    dispatch_once(&_extensionAuxiliaryHostProtocol_onceToken_1, &__block_literal_global_68);
  return (id)_extensionAuxiliaryHostProtocol_interface_1;
}

void __54__DKDiagnosticContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_255DD1270);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_extensionAuxiliaryHostProtocol_interface_1;
  _extensionAuxiliaryHostProtocol_interface_1 = v0;

  v2 = (void *)_extensionAuxiliaryHostProtocol_interface_1;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_remoteHostCompleteWithResult_completion_, 0, 0);

}

- (void)updateProgress:(id)a3 forTest:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[DKDiagnosticContext _getRemoteProxyAndSetUpHandlers](self, "_getRemoteProxyAndSetUpHandlers");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "remoteHostUpdateProgress:forTest:", v7, v6);

}

- (void)enableVolumeHUD:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[DKDiagnosticContext _getRemoteProxyAndSetUpHandlers](self, "_getRemoteProxyAndSetUpHandlers");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteHostEnableVolumeHUD:", v3);

}

- (void)setScreenToBrightness:(float)a3 animate:(BOOL)a4
{
  _BOOL8 v4;
  double v6;
  id v7;

  v4 = a4;
  -[DKDiagnosticContext _getRemoteProxyAndSetUpHandlers](self, "_getRemoteProxyAndSetUpHandlers");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v6 = a3;
  objc_msgSend(v7, "remoteHostSetScreenToBrightness:animate:", v4, v6);

}

- (void)getAsset:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  DiagnosticsKitLogHandleForCategory(4);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315394;
    v11 = "-[DKDiagnosticContext getAsset:completion:]";
    v12 = 2112;
    v13 = v6;
    _os_log_impl(&dword_22DE4C000, v8, OS_LOG_TYPE_DEFAULT, "%s: %@", (uint8_t *)&v10, 0x16u);
  }

  -[DKDiagnosticContext _getRemoteProxyAndSetUpHandlers](self, "_getRemoteProxyAndSetUpHandlers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "remoteHostGetAsset:completion:", v6, v7);

}

- (void)uploadAssets:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  DiagnosticsKitLogHandleForCategory(4);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315394;
    v11 = "-[DKDiagnosticContext uploadAssets:completion:]";
    v12 = 2112;
    v13 = v6;
    _os_log_impl(&dword_22DE4C000, v8, OS_LOG_TYPE_DEFAULT, "%s: %@", (uint8_t *)&v10, 0x16u);
  }

  -[DKDiagnosticContext _getRemoteProxyAndSetUpHandlers](self, "_getRemoteProxyAndSetUpHandlers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "remoteHostUploadAssets:completion:", v6, v7);

}

- (void)showUI:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  DiagnosticsKitLogHandleForCategory(4);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315138;
    v11 = "-[DKDiagnosticContext showUI:completion:]";
    _os_log_impl(&dword_22DE4C000, v8, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v10, 0xCu);
  }

  -[DKDiagnosticContext _getRemoteProxyAndSetUpHandlers](self, "_getRemoteProxyAndSetUpHandlers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "remoteHostShowUI:completion:", v7, v6);

}

- (void)requestSessionAccessoryIdentifierWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  DiagnosticsKitLogHandleForCategory(4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "-[DKDiagnosticContext requestSessionAccessoryIdentifierWithCompletion:]";
    _os_log_impl(&dword_22DE4C000, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v7, 0xCu);
  }

  -[DKDiagnosticContext _getRemoteProxyAndSetUpHandlers](self, "_getRemoteProxyAndSetUpHandlers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteHostRequestSessionAccessoryIdentifierWithCompletion:", v4);

}

- (void)unpairSessionAccessoryOnTestCompletion
{
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  DiagnosticsKitLogHandleForCategory(4);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[DKDiagnosticContext unpairSessionAccessoryOnTestCompletion]";
    _os_log_impl(&dword_22DE4C000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
  }

  -[DKDiagnosticContext _getRemoteProxyAndSetUpHandlers](self, "_getRemoteProxyAndSetUpHandlers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteHostUnpairSessionAccessoryOnTestCompletion");

}

- (void)allowSessionAccessoryDisconnectForDuration:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  DiagnosticsKitLogHandleForCategory(4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "-[DKDiagnosticContext allowSessionAccessoryDisconnectForDuration:]";
    _os_log_impl(&dword_22DE4C000, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v7, 0xCu);
  }

  -[DKDiagnosticContext _getRemoteProxyAndSetUpHandlers](self, "_getRemoteProxyAndSetUpHandlers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteHostAllowSessionAccessoryDisconnectForDuration:", v4);

}

- (void)clearAllowSessionAccessoryDisconnect
{
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  DiagnosticsKitLogHandleForCategory(4);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[DKDiagnosticContext clearAllowSessionAccessoryDisconnect]";
    _os_log_impl(&dword_22DE4C000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
  }

  -[DKDiagnosticContext _getRemoteProxyAndSetUpHandlers](self, "_getRemoteProxyAndSetUpHandlers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteHostClearAllowSessionAccessoryDisconnect");

}

- (void)requestPluginReloadOnFinishWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  DiagnosticsKitLogHandleForCategory(4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "-[DKDiagnosticContext requestPluginReloadOnFinishWithCompletion:]";
    _os_log_impl(&dword_22DE4C000, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v7, 0xCu);
  }

  -[DKDiagnosticContext _getRemoteProxyAndSetUpHandlers](self, "_getRemoteProxyAndSetUpHandlers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteHostRequestPluginReloadOnFinishWithCompletion:", v4);

}

- (void)displayAlertWithHeader:(id)a3 message:(id)a4 buttonStrings:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, void *, void *);
  NSObject *v14;
  NSObject *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  const __CFString *v20;
  uint8_t buf[4];
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, void *, void *))a6;
  DiagnosticsKitLogHandleForCategory(4);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v22 = "-[DKDiagnosticContext displayAlertWithHeader:message:buttonStrings:completion:]";
    _os_log_impl(&dword_22DE4C000, v14, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  if (-[DKDiagnosticContext isPresentingView](self, "isPresentingView"))
  {
    DiagnosticsKitLogHandleForCategory(4);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22DE4C000, v15, OS_LOG_TYPE_DEFAULT, "Not calling displayAlertWithHeader: because DK is currently presenting a view controller", buf, 2u);
    }

    v16 = objc_alloc(MEMORY[0x24BDD1540]);
    v19 = *MEMORY[0x24BDD0FC8];
    v20 = CFSTR("This DiagnosticsKit extension is already presenting a view controller");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v16, "initWithDomain:code:userInfo:", CFSTR("com.apple.DiagnosticsKit"), -1, v17);

    v13[2](v13, &unk_24F9A35D0, v18);
  }
  else
  {
    -[DKDiagnosticContext _getRemoteProxyAndSetUpHandlers](self, "_getRemoteProxyAndSetUpHandlers");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "remoteHostDisplayAlertWithHeader:message:buttonStrings:completion:", v10, v11, v12, v13);
  }

}

- (void)displayInstructions:(id)a3 style:(int)a4 imageLocators:(id)a5 title:(id)a6 subtitle:(id)a7 iconLocator:(id)a8 options:(id)a9 completion:(id)a10
{
  uint64_t v14;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void (**v22)(id, const __CFString *, void *);
  NSObject *v23;
  NSObject *v24;
  id v25;
  void *v26;
  void *v27;
  uint64_t v28;
  const __CFString *v29;
  uint8_t buf[4];
  const char *v31;
  uint64_t v32;

  v14 = *(_QWORD *)&a4;
  v32 = *MEMORY[0x24BDAC8D0];
  v16 = a3;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v22 = (void (**)(id, const __CFString *, void *))a10;
  DiagnosticsKitLogHandleForCategory(4);
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v31 = "-[DKDiagnosticContext displayInstructions:style:imageLocators:title:subtitle:iconLocator:options:completion:]";
    _os_log_impl(&dword_22DE4C000, v23, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  if (-[DKDiagnosticContext isPresentingView](self, "isPresentingView"))
  {
    DiagnosticsKitLogHandleForCategory(4);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22DE4C000, v24, OS_LOG_TYPE_DEFAULT, "Not calling displayInstructions: because DK is currently presenting a view controller", buf, 2u);
    }

    v25 = objc_alloc(MEMORY[0x24BDD1540]);
    v28 = *MEMORY[0x24BDD0FC8];
    v29 = CFSTR("This DiagnosticsKit extension is already presenting a view controller");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)objc_msgSend(v25, "initWithDomain:code:userInfo:", CFSTR("com.apple.DiagnosticsKit"), -1, v26);

    v22[2](v22, &stru_24F99B508, v27);
  }
  else
  {
    -[DKDiagnosticContext _getRemoteProxyAndSetUpHandlers](self, "_getRemoteProxyAndSetUpHandlers");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "remoteHostDisplayInstructions:style:imageLocators:title:subtitle:iconLocator:options:completion:", v16, v14, v17, v18, v19, v20, v21, v22);
  }

}

- (void)showStatusBar
{
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  DiagnosticsKitLogHandleForCategory(4);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[DKDiagnosticContext showStatusBar]";
    _os_log_impl(&dword_22DE4C000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
  }

  -[DKDiagnosticContext _getRemoteProxyAndSetUpHandlers](self, "_getRemoteProxyAndSetUpHandlers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteHostShowStatusBar");

}

- (void)hideStatusBar
{
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  DiagnosticsKitLogHandleForCategory(4);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[DKDiagnosticContext hideStatusBar]";
    _os_log_impl(&dword_22DE4C000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
  }

  -[DKDiagnosticContext _getRemoteProxyAndSetUpHandlers](self, "_getRemoteProxyAndSetUpHandlers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteHostHideStatusBar");

}

- (void)setStatusBarStyle:(int64_t)a3
{
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  DiagnosticsKitLogHandleForCategory(4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "-[DKDiagnosticContext setStatusBarStyle:]";
    _os_log_impl(&dword_22DE4C000, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v7, 0xCu);
  }

  -[DKDiagnosticContext _getRemoteProxyAndSetUpHandlers](self, "_getRemoteProxyAndSetUpHandlers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteHostSetStatusBarStyle:", a3);

}

- (void)startRemoteDiagnosticWithDiagnosticParameters:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  char *v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  char *v17;
  NSObject *v18;
  _QWORD v19[4];
  char *v20;
  id v21;
  DKDiagnosticContext *v22;
  id v23;
  uint8_t buf[4];
  const char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  DiagnosticsKitLogHandleForCategory(4);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v25 = "-[DKDiagnosticContext startRemoteDiagnosticWithDiagnosticParameters:completion:]";
    _os_log_impl(&dword_22DE4C000, v8, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  -[DKDiagnosticContext _helperPrincipalObject](self, "_helperPrincipalObject");
  v9 = (char *)objc_claimAutoreleasedReturnValue();
  DiagnosticsKitLogHandleForCategory(2);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v25 = v9;
    _os_log_impl(&dword_22DE4C000, v10, OS_LOG_TYPE_DEFAULT, "Diagnostic: %@", buf, 0xCu);
  }

  v11 = -[DKDiagnosticContext isXPC](self, "isXPC");
  v12 = MEMORY[0x24BDAC9B8];
  if (v11)
  {
    dispatch_get_global_queue(21, 0);
    v13 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = MEMORY[0x24BDAC9B8];
    v14 = MEMORY[0x24BDAC9B8];
  }
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __80__DKDiagnosticContext_startRemoteDiagnosticWithDiagnosticParameters_completion___block_invoke;
  v19[3] = &unk_24F99AC40;
  v20 = v9;
  v21 = v6;
  v22 = self;
  v23 = v7;
  v15 = v7;
  v16 = v6;
  v17 = v9;
  dispatch_async(v13, v19);
  if (v11)
    v18 = v13;
  else
    v18 = v12;

}

void __80__DKDiagnosticContext_startRemoteDiagnosticWithDiagnosticParameters_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  _QWORD block[4];
  id v12;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "predicates");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "specifications");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "parameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[DKUtilities inputsForDiagnostic:predicates:specifications:parameters:](DKUtilities, "inputsForDiagnostic:predicates:specifications:parameters:", v2, v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(*(id *)(a1 + 32), "isFinished") & 1) != 0)
    goto LABEL_5;
  objc_msgSend(*(id *)(a1 + 32), "setSetup:", 1);
  objc_msgSend(*(id *)(a1 + 32), "result");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setStatusCode:", &unk_24F9A35E8);

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 32), "setupWithInputs:responder:", v6, *(_QWORD *)(a1 + 48));
  if ((objc_msgSend(*(id *)(a1 + 32), "isFinished") & 1) != 0)
  {
LABEL_5:
    v8 = 0;
  }
  else if (objc_msgSend(*(id *)(a1 + 48), "isXPC"))
  {
    dispatch_get_global_queue(21, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __80__DKDiagnosticContext_startRemoteDiagnosticWithDiagnosticParameters_completion___block_invoke_120;
    block[3] = &unk_24F99AA50;
    v12 = *(id *)(a1 + 32);
    dispatch_async(v10, block);

    v8 = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "start");
    v8 = objc_msgSend(*(id *)(a1 + 32), "isFinished") ^ 1;
  }
  v9 = *(_QWORD *)(a1 + 56);
  if (v9)
    (*(void (**)(uint64_t, uint64_t))(v9 + 16))(v9, v8);

}

uint64_t __80__DKDiagnosticContext_startRemoteDiagnosticWithDiagnosticParameters_completion___block_invoke_120(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "start");
}

- (void)cancelRemoteDiagnosticWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  DiagnosticsKitLogHandleForCategory(4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v18 = "-[DKDiagnosticContext cancelRemoteDiagnosticWithCompletion:]";
    _os_log_impl(&dword_22DE4C000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  -[DKDiagnosticContext _helperPrincipalObject](self, "_helperPrincipalObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByAppendingString:", CFSTR(".cancelQueue"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_retainAutorelease(v9);
  v11 = dispatch_queue_create((const char *)objc_msgSend(v10, "UTF8String"), 0);
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __60__DKDiagnosticContext_cancelRemoteDiagnosticWithCompletion___block_invoke;
  v14[3] = &unk_24F99AC68;
  v15 = v6;
  v16 = v4;
  v12 = v4;
  v13 = v6;
  dispatch_async(v11, v14);

}

uint64_t __60__DKDiagnosticContext_cancelRemoteDiagnosticWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "result");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setStatusCode:", &unk_24F9A3600);

  objc_msgSend(*(id *)(a1 + 32), "setCancelled:", 1);
  objc_msgSend(*(id *)(a1 + 32), "progress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 32), "cancel");
  objc_msgSend(*(id *)(a1 + 32), "setFinished:", 1);
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)completeWithDiagnosticResult:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v6 = a4;
  v7 = a3;
  -[DKDiagnosticContext _getRemoteProxyAndSetUpHandlers](self, "_getRemoteProxyAndSetUpHandlers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __63__DKDiagnosticContext_completeWithDiagnosticResult_completion___block_invoke;
  v10[3] = &unk_24F99AC90;
  v10[4] = self;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "remoteHostCompleteWithResult:completion:", v7, v10);

}

uint64_t __63__DKDiagnosticContext_completeWithDiagnosticResult_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  void *v4;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  result = objc_msgSend(*(id *)(a1 + 32), "isXPC");
  if ((_DWORD)result)
  {
    objc_msgSend(*(id *)(a1 + 32), "xpcConnection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invalidate");

    objc_msgSend(*(id *)(a1 + 32), "setXpcConnection:", 0);
    return objc_msgSend(*(id *)(a1 + 32), "setXpcPrincipalObject:", 0);
  }
  return result;
}

- (void)checkShouldShowRemoteDiagnosticViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v4 = a3;
  -[DKDiagnosticContext _helperPrincipalObject](self, "_helperPrincipalObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAppendingString:", CFSTR(".checkShowViewControllerQueue"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_retainAutorelease(v8);
  v10 = dispatch_queue_create((const char *)objc_msgSend(v9, "UTF8String"), 0);
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __69__DKDiagnosticContext_checkShouldShowRemoteDiagnosticViewController___block_invoke;
  v13[3] = &unk_24F99AC68;
  v14 = v5;
  v15 = v4;
  v11 = v4;
  v12 = v5;
  dispatch_async(v10, v13);

}

uint64_t __69__DKDiagnosticContext_checkShouldShowRemoteDiagnosticViewController___block_invoke(uint64_t a1)
{
  uint64_t result;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "shouldShowViewControllerInHostApp:", *(_QWORD *)(a1 + 40));
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

- (void)dismissRemoteDiagnosticViewControllerWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[DKDiagnosticContext _getRemoteProxyAndSetUpHandlers](self, "_getRemoteProxyAndSetUpHandlers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteHostDismissViewControllerWithCompletion:", v4);

}

- (void)setRemoteDiagnosticNotAllowListedWithContactMessage:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  DiagnosticsKitLogHandleForCategory(2);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    -[DKDiagnosticContext setRemoteDiagnosticNotAllowListedWithContactMessage:].cold.1(self, (uint64_t)v4, v5);

}

- (id)_getRemoteProxyAndSetUpHandlers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[DKDiagnosticContext _helperConnnection](self, "_helperConnnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_131);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[DKDiagnosticContext _helperConnnection](self, "_helperConnnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInterruptionHandler:", &__block_literal_global_134);

  -[DKDiagnosticContext _helperConnnection](self, "_helperConnnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setInvalidationHandler:", &__block_literal_global_135);

  return v4;
}

void __54__DKDiagnosticContext__getRemoteProxyAndSetUpHandlers__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  DiagnosticsKitLogHandleForCategory(2);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __54__DKDiagnosticContext__getRemoteProxyAndSetUpHandlers__block_invoke_cold_1((uint64_t)v2, v3);

  +[DKAnalytics sendAnalyticsWithEvent:error:](DKAnalytics, "sendAnalyticsWithEvent:error:", 2, v2);
}

void __54__DKDiagnosticContext__getRemoteProxyAndSetUpHandlers__block_invoke_133()
{
  id v0;

  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("DKDiagnosticsContextConnectionInterrupted"), 0, 0);
  v0 = (id)objc_claimAutoreleasedReturnValue();
  +[DKAnalytics sendAnalyticsWithEvent:error:](DKAnalytics, "sendAnalyticsWithEvent:error:", 0, v0);

}

void __54__DKDiagnosticContext__getRemoteProxyAndSetUpHandlers__block_invoke_2()
{
  id v0;

  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("DKDiagnosticsContextConnectionInvalidated"), 0, 0);
  v0 = (id)objc_claimAutoreleasedReturnValue();
  +[DKAnalytics sendAnalyticsWithEvent:error:](DKAnalytics, "sendAnalyticsWithEvent:error:", 1, v0);

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

- (id)xpcPrincipalObject
{
  return self->_xpcPrincipalObject;
}

- (void)setXpcPrincipalObject:(id)a3
{
  objc_storeStrong(&self->_xpcPrincipalObject, a3);
}

- (BOOL)isPresentingView
{
  return self->_isPresentingView;
}

- (void)setIsPresentingView:(BOOL)a3
{
  self->_isPresentingView = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_xpcPrincipalObject, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

- (void)setRemoteDiagnosticNotAllowListedWithContactMessage:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "testID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_testName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412802;
  v9 = v6;
  v10 = 2112;
  v11 = v7;
  v12 = 2112;
  v13 = a2;
  _os_log_fault_impl(&dword_22DE4C000, a3, OS_LOG_TYPE_FAULT, "This DiagnosticsKit extension (%@ - %@) is not allow listed with the DK host application. %@", (uint8_t *)&v8, 0x20u);

}

void __54__DKDiagnosticContext__getRemoteProxyAndSetUpHandlers__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_22DE4C000, a2, OS_LOG_TYPE_ERROR, "Failed to retrieve remote object proxy: %@", (uint8_t *)&v2, 0xCu);
}

@end
