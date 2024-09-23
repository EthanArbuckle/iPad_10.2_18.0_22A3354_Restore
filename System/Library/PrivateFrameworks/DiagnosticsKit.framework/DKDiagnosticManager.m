@implementation DKDiagnosticManager

- (DKDiagnosticManager)init
{
  return -[DKDiagnosticManager initWithBundleIdentifier:](self, "initWithBundleIdentifier:", CFSTR("Default"));
}

- (DKDiagnosticManager)initWithBundleIdentifier:(id)a3
{
  return -[DKDiagnosticManager initWithBundleIdentifier:connectionRoute:](self, "initWithBundleIdentifier:connectionRoute:", a3, 0);
}

- (DKDiagnosticManager)initWithBundleIdentifier:(id)a3 connectionRoute:(unint64_t)a4
{
  id v7;
  DKDiagnosticManager *v8;
  DKDiagnosticManager *v9;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *diagnosticsManagerQueue;
  dispatch_queue_t v13;
  OS_dispatch_queue *diagnosticListQueue;
  uint64_t v15;
  DKDiagnosticRegistry *registry;
  DKDiagnosticRegistry *v17;
  void *v18;
  uint64_t v19;
  DKExtensionDiscovery *discovery;
  objc_super v22;

  v7 = a3;
  v22.receiver = self;
  v22.super_class = (Class)DKDiagnosticManager;
  v8 = -[DKDiagnosticManager init](&v22, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_bundleIdentifier, a3);
    v9->_connectionRoute = a4;
    v9->_pluginReloadRequested = 0;
    v10 = MEMORY[0x24BDAC9C0];
    v11 = dispatch_queue_create("com.apple.DiagnosticsKit.diagnosticsManager", MEMORY[0x24BDAC9C0]);
    diagnosticsManagerQueue = v9->_diagnosticsManagerQueue;
    v9->_diagnosticsManagerQueue = (OS_dispatch_queue *)v11;

    v13 = dispatch_queue_create("com.apple.DiagnosticsKit.diagnosticsList", v10);
    diagnosticListQueue = v9->_diagnosticListQueue;
    v9->_diagnosticListQueue = (OS_dispatch_queue *)v13;

    if (!a4)
    {
      v15 = objc_opt_new();
      registry = v9->_registry;
      v9->_registry = (DKDiagnosticRegistry *)v15;

      v17 = v9->_registry;
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("com.apple.diagnostics-service"), CFSTR("com.apple.diagnostics-ui-service"), CFSTR("com.apple.diagnostics-restricted-service"), CFSTR("com.apple.diagnostics-restricted-ui-service"), 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[DKExtensionDiscovery discoveryUsingExtensionRegistry:services:bundleIdentifier:](DKExtensionDiscovery, "discoveryUsingExtensionRegistry:services:bundleIdentifier:", v17, v18, v9->_bundleIdentifier);
      v19 = objc_claimAutoreleasedReturnValue();
      discovery = v9->_discovery;
      v9->_discovery = (DKExtensionDiscovery *)v19;

    }
  }

  return v9;
}

- (void)beginDiagnosticWithIdentifier:(id)a3 parameters:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[DKDiagnosticManager diagnosticsManagerQueue](self, "diagnosticsManagerQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __75__DKDiagnosticManager_beginDiagnosticWithIdentifier_parameters_completion___block_invoke;
  v15[3] = &unk_24F99AE80;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v9;
  v13 = v10;
  v14 = v8;
  dispatch_async(v11, v15);

}

void __75__DKDiagnosticManager_beginDiagnosticWithIdentifier_parameters_completion___block_invoke(uint64_t a1)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id location;
  uint64_t v34;
  void *v35;
  uint8_t buf[4];
  uint64_t v37;
  uint64_t v38;
  _QWORD v39[2];

  v39[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "adapterForIdentifier:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x22E320CF4](*(_QWORD *)(a1 + 56));
  objc_initWeak(&location, *(id *)(a1 + 32));
  v30[0] = MEMORY[0x24BDAC760];
  v30[1] = 3221225472;
  v30[2] = __75__DKDiagnosticManager_beginDiagnosticWithIdentifier_parameters_completion___block_invoke_2;
  v30[3] = &unk_24F99B068;
  v31 = *(id *)(a1 + 56);
  objc_copyWeak(&v32, &location);
  v5 = (void *)MEMORY[0x22E320CF4](v30);

  if (!v3)
  {
    v23 = (void *)MEMORY[0x24BDD1540];
    v38 = *MEMORY[0x24BDD0FC8];
    DKErrorLocalizedDescriptionForCode(-1000);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = v24;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v39, &v38, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "errorWithDomain:code:userInfo:", CFSTR("DKErrorDomain"), -1000, v25);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    if (v9)
      goto LABEL_15;
  }
  v6 = *(void **)(a1 + 32);
  objc_msgSend(v3, "extensionAttributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 48);
  v29 = 0;
  objc_msgSend(v6, "_checkPrerequisitesForDiagnostic:parameters:error:", v7, v8, &v29);
  v9 = v29;

  if (v9)
    goto LABEL_15;
  DiagnosticsKitLogHandleForCategory(1);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = objc_msgSend(*(id *)(a1 + 40), "longValue");
    *(_DWORD *)buf = 134217984;
    v37 = v11;
    _os_log_impl(&dword_22DE4C000, v10, OS_LOG_TYPE_DEFAULT, "Found diagnostic for ID: %ld", buf, 0xCu);
  }

  objc_msgSend(v3, "extensionAttributes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[DKExtensionRequest requestWithExtensionAttributes:](DKExtensionRequest, "requestWithExtensionAttributes:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setHostServicesDelegate:", *(_QWORD *)(a1 + 32));
  if (!v13)
  {
    v26 = (void *)MEMORY[0x24BDD1540];
    v34 = *MEMORY[0x24BDD0FC8];
    DKErrorLocalizedDescriptionForCode(-1001);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v27;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "errorWithDomain:code:userInfo:", CFSTR("DKErrorDomain"), -1001, v28);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    if (!v9)
      goto LABEL_16;
LABEL_15:
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    goto LABEL_16;
  }
  objc_msgSend(*(id *)(a1 + 32), "allowList");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend(*(id *)(a1 + 32), "allowList");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "containsIdentifier:", *(_QWORD *)(a1 + 40));

    if ((v16 & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "attributesForIdentifier:", *(_QWORD *)(a1 + 40));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      DiagnosticsKitLogHandleForCategory(1);
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      {
        v19 = *(_QWORD *)(a1 + 40);
        objc_msgSend(v17, "name");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        __75__DKDiagnosticManager_beginDiagnosticWithIdentifier_parameters_completion___block_invoke_cold_1(v19, v20, buf, v18);
      }

      objc_msgSend(*(id *)(a1 + 32), "allowList");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "contactMessage");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setNotAllowListedWithContactMessage:", v22);

    }
  }
  objc_msgSend(v3, "beginRequest:payload:completion:", v13, *(_QWORD *)(a1 + 48), v5);

  v9 = 0;
LABEL_16:
  objc_destroyWeak(&v32);

  objc_destroyWeak(&location);
}

void __75__DKDiagnosticManager_beginDiagnosticWithIdentifier_parameters_completion___block_invoke_2(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  int v4;
  id v5;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained(v2);
  v4 = objc_msgSend(WeakRetained, "pluginReloadRequested");

  if (v4)
  {
    v5 = objc_loadWeakRetained(v2);
    objc_msgSend(v5, "_reloadUpdatedPlugins");

  }
}

- (void)diagnosticsWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[DKDiagnosticManager diagnosticListQueue](self, "diagnosticListQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __49__DKDiagnosticManager_diagnosticsWithCompletion___block_invoke;
  v7[3] = &unk_24F99AC68;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __49__DKDiagnosticManager_diagnosticsWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "discovery");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "waitUntilComplete");

  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "registry");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "diagnostics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);

}

- (id)attributesForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[DKDiagnosticManager discovery](self, "discovery");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "waitUntilComplete");

  -[DKDiagnosticManager registry](self, "registry");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "diagnosticForIdentifier:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)adapterForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[DKDiagnosticManager discovery](self, "discovery");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "waitUntilComplete");

  -[DKDiagnosticManager registry](self, "registry");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "adapterForIdentifier:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)cancelAllDiagnostics
{
  id v2;

  -[DKDiagnosticManager registry](self, "registry");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enumerateExtensionAdaptersWithBlock:", &__block_literal_global_11);

}

uint64_t __43__DKDiagnosticManager_cancelAllDiagnostics__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "cancelAll");
}

- (void)updateProgress:(id)a3 forTest:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  -[DKDiagnosticManager progressResponder](self, "progressResponder");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[DKDiagnosticManager progressResponder](self, "progressResponder");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      -[DKDiagnosticManager progressResponder](self, "progressResponder");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "updateProgress:forTest:", v12, v6);

    }
  }

}

- (void)getAsset:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  -[DKDiagnosticManager assetResponder](self, "assetResponder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[DKDiagnosticManager assetResponder](self, "assetResponder");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "getAsset:completion:", v10, v6);

  }
}

- (void)uploadAssets:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  -[DKDiagnosticManager assetResponder](self, "assetResponder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[DKDiagnosticManager assetResponder](self, "assetResponder");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "uploadAssets:completion:", v10, v6);

  }
}

- (void)requestSessionAccessoryIdentifierWithCompletion:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  id v9;

  v9 = a3;
  -[DKDiagnosticManager accessoryResponder](self, "accessoryResponder");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[DKDiagnosticManager accessoryResponder](self, "accessoryResponder");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      -[DKDiagnosticManager accessoryResponder](self, "accessoryResponder");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "requestSessionAccessoryIdentifierWithCompletion:", v9);

    }
  }

}

- (void)unpairSessionAccessoryOnTestCompletion
{
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  id v7;

  -[DKDiagnosticManager accessoryResponder](self, "accessoryResponder");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[DKDiagnosticManager accessoryResponder](self, "accessoryResponder");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      -[DKDiagnosticManager accessoryResponder](self, "accessoryResponder");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "unpairSessionAccessoryOnTestCompletion");

    }
  }
}

- (void)allowSessionAccessoryDisconnectForDuration:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  id v9;

  v9 = a3;
  -[DKDiagnosticManager accessoryResponder](self, "accessoryResponder");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[DKDiagnosticManager accessoryResponder](self, "accessoryResponder");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      -[DKDiagnosticManager accessoryResponder](self, "accessoryResponder");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "allowSessionAccessoryDisconnectForDuration:", v9);

    }
  }

}

- (void)clearAllowSessionAccessoryDisconnect
{
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  id v7;

  -[DKDiagnosticManager accessoryResponder](self, "accessoryResponder");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[DKDiagnosticManager accessoryResponder](self, "accessoryResponder");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      -[DKDiagnosticManager accessoryResponder](self, "accessoryResponder");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "clearAllowSessionAccessoryDisconnect");

    }
  }
}

- (void)displayAlertWithHeader:(id)a3 message:(id)a4 buttonStrings:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  id v18;

  v18 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  -[DKDiagnosticManager userAlertResponder](self, "userAlertResponder");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[DKDiagnosticManager userAlertResponder](self, "userAlertResponder");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_opt_respondsToSelector();

    if ((v16 & 1) != 0)
    {
      -[DKDiagnosticManager userAlertResponder](self, "userAlertResponder");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "displayAlertWithHeader:message:buttonStrings:completion:", v18, v10, v11, v12);

    }
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
  uint64_t v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  void *v31;
  char v32;
  uint64_t v33;
  void *v34;
  DKDiagnosticManager *v35;
  id v36;

  v14 = *(_QWORD *)&a4;
  v36 = a3;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  v21 = a10;
  -[DKDiagnosticManager userAlertResponder](self, "userAlertResponder");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[DKDiagnosticManager userAlertResponder](self, "userAlertResponder");
    v35 = self;
    v24 = v21;
    v25 = v20;
    v26 = v19;
    v27 = v18;
    v28 = v17;
    v29 = v16;
    v30 = v14;
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_opt_respondsToSelector();

    v33 = v30;
    v16 = v29;
    v17 = v28;
    v18 = v27;
    v19 = v26;
    v20 = v25;
    v21 = v24;

    if ((v32 & 1) != 0)
    {
      -[DKDiagnosticManager userAlertResponder](v35, "userAlertResponder");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "displayInstructions:style:imageLocators:title:subtitle:iconLocator:options:completion:", v36, v33, v16, v17, v18, v19, v20, v24);

    }
  }

}

- (void)showStatusBar
{
  void *v3;
  id v4;

  -[DKDiagnosticManager statusBarResponder](self, "statusBarResponder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[DKDiagnosticManager statusBarResponder](self, "statusBarResponder");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "showStatusBar");

  }
}

- (void)hideStatusBar
{
  void *v3;
  id v4;

  -[DKDiagnosticManager statusBarResponder](self, "statusBarResponder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[DKDiagnosticManager statusBarResponder](self, "statusBarResponder");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "hideStatusBar");

  }
}

- (void)setStatusBarStyle:(int64_t)a3
{
  void *v5;
  id v6;

  -[DKDiagnosticManager statusBarResponder](self, "statusBarResponder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[DKDiagnosticManager statusBarResponder](self, "statusBarResponder");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setStatusBarStyle:", a3);

  }
}

- (void)request:(id)a3 presentViewController:(id)a4 completion:(id)a5
{
  id v7;
  void *v8;
  char v9;
  void *v10;
  id v11;

  v11 = a4;
  v7 = a5;
  -[DKDiagnosticManager viewControllerDelegate](self, "viewControllerDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    objc_msgSend(v11, "setModalPresentationStyle:", 0);
    -[DKDiagnosticManager viewControllerDelegate](self, "viewControllerDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "diagnosticManager:presentViewController:completion:", self, v11, v7);

  }
}

- (void)request:(id)a3 dismissViewController:(id)a4 completion:(id)a5
{
  id v7;
  void *v8;
  char v9;
  void *v10;
  id v11;

  v11 = a4;
  v7 = a5;
  -[DKDiagnosticManager viewControllerDelegate](self, "viewControllerDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[DKDiagnosticManager viewControllerDelegate](self, "viewControllerDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "diagnosticManager:dismissViewController:completion:", self, v11, v7);

  }
}

- (void)setScreenToBrightness:(float)a3 animate:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  char v8;
  double v9;
  id v10;

  v4 = a4;
  -[DKDiagnosticManager brightnessResponder](self, "brightnessResponder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[DKDiagnosticManager brightnessResponder](self, "brightnessResponder");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    *(float *)&v9 = a3;
    objc_msgSend(v10, "setScreenToBrightness:animate:", v4, v9);

  }
}

- (void)enableVolumeHUD:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  char v6;
  id v7;

  v3 = a3;
  -[DKDiagnosticManager volumeHUDResponder](self, "volumeHUDResponder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[DKDiagnosticManager volumeHUDResponder](self, "volumeHUDResponder");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "enableVolumeHUD:", v3);

  }
}

- (void)requestPluginReloadOnFinishWithCompletion:(id)a3
{
  void (**v4)(_QWORD);
  NSObject *v5;
  uint8_t v6[16];

  v4 = (void (**)(_QWORD))a3;
  DiagnosticsKitLogHandleForCategory(1);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_22DE4C000, v5, OS_LOG_TYPE_DEFAULT, "Plugin reload was requested by the running DK extension", v6, 2u);
  }

  -[DKDiagnosticManager setPluginReloadRequested:](self, "setPluginReloadRequested:", 1);
  v4[2](v4);

}

- (void)_reloadUpdatedPlugins
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[DKDiagnosticManager registry](self, "registry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("com.apple.diagnostics-service"), CFSTR("com.apple.diagnostics-ui-service"), CFSTR("com.apple.diagnostics-restricted-service"), CFSTR("com.apple.diagnostics-restricted-ui-service"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DKDiagnosticManager bundleIdentifier](self, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[DKExtensionDiscovery discoveryUsingExtensionRegistry:services:bundleIdentifier:](DKExtensionDiscovery, "discoveryUsingExtensionRegistry:services:bundleIdentifier:", v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DKDiagnosticManager setDiscovery:](self, "setDiscovery:", v6);

  -[DKDiagnosticManager discovery](self, "discovery");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "waitUntilComplete");

  -[DKDiagnosticManager setPluginReloadRequested:](self, "setPluginReloadRequested:", 0);
}

- (BOOL)_checkPrerequisitesForDiagnostic:(id)a3 parameters:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  objc_msgSend(a4, "specifications");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v10 = 0;
LABEL_7:
    objc_msgSend(v8, "freeSpaceRequired");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_8;
  }
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("freeSpaceRequired"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
    goto LABEL_7;
  objc_opt_class();
  v11 = v10;
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_7;
LABEL_8:
  v12 = -[DKDiagnosticManager _freeSpaceAvailable:](self, "_freeSpaceAvailable:", v11);
  v13 = v12;
  if (a5 && !v12)
  {
    v14 = (void *)MEMORY[0x24BDD1540];
    v24 = *MEMORY[0x24BDD0FC8];
    DKErrorLocalizedDescriptionForCode(-1005);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v15;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("DKErrorDomain"), -1005, v16);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (objc_msgSend(v8, "requiresUnlock"))
  {
    v17 = !-[DKDiagnosticManager _isDeviceLocked](self, "_isDeviceLocked");
    v13 &= v17;
    if (a5)
    {
      if ((v17 & 1) == 0)
      {
        v18 = (void *)MEMORY[0x24BDD1540];
        v22 = *MEMORY[0x24BDD0FC8];
        DKErrorLocalizedDescriptionForCode(-1007);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v19;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "errorWithDomain:code:userInfo:", CFSTR("DKErrorDomain"), -1007, v20);
        *a5 = (id)objc_claimAutoreleasedReturnValue();

        v13 = 0;
      }
    }
  }

  return v13;
}

- (BOOL)_isDeviceLocked
{
  int v2;
  NSObject *v3;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = MGGetBoolAnswer();
  DiagnosticsKitLogHandleForCategory(1);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109120;
    v5[1] = v2;
    _os_log_impl(&dword_22DE4C000, v3, OS_LOG_TYPE_DEFAULT, "Device lock status: %d", (uint8_t *)v5, 8u);
  }

  return v2;
}

- (BOOL)_freeSpaceAvailable:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  BOOL v10;
  id v12;
  id v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", CFSTR("/private/var"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v5 = *MEMORY[0x24BDBCDC0];
  v12 = 0;
  objc_msgSend(v4, "getResourceValue:forKey:error:", &v13, v5, &v12);
  v6 = v13;
  v7 = v12;
  DiagnosticsKitLogHandleForCategory(1);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v15 = v3;
      v16 = 2112;
      v17 = v6;
      _os_log_impl(&dword_22DE4C000, v9, OS_LOG_TYPE_DEFAULT, "Free space required by diagnostic: %@, available space: %@", buf, 0x16u);
    }

    v10 = objc_msgSend(v6, "compare:", v3) != -1;
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[DKDiagnosticManager _freeSpaceAvailable:].cold.1((uint64_t)v7, v9);

    v10 = 1;
  }

  return v10;
}

- (DKProgressResponder)progressResponder
{
  return (DKProgressResponder *)objc_loadWeakRetained((id *)&self->_progressResponder);
}

- (void)setProgressResponder:(id)a3
{
  objc_storeWeak((id *)&self->_progressResponder, a3);
}

- (DKAssetResponder)assetResponder
{
  return (DKAssetResponder *)objc_loadWeakRetained((id *)&self->_assetResponder);
}

- (void)setAssetResponder:(id)a3
{
  objc_storeWeak((id *)&self->_assetResponder, a3);
}

- (DKAccessoryResponder)accessoryResponder
{
  return (DKAccessoryResponder *)objc_loadWeakRetained((id *)&self->_accessoryResponder);
}

- (void)setAccessoryResponder:(id)a3
{
  objc_storeWeak((id *)&self->_accessoryResponder, a3);
}

- (DKUserAlertResponder)userAlertResponder
{
  return (DKUserAlertResponder *)objc_loadWeakRetained((id *)&self->_userAlertResponder);
}

- (void)setUserAlertResponder:(id)a3
{
  objc_storeWeak((id *)&self->_userAlertResponder, a3);
}

- (DKDiagnosticAllowList)allowList
{
  return self->_allowList;
}

- (void)setAllowList:(id)a3
{
  self->_allowList = (DKDiagnosticAllowList *)a3;
}

- (OS_dispatch_queue)diagnosticsManagerQueue
{
  return self->_diagnosticsManagerQueue;
}

- (void)setDiagnosticsManagerQueue:(id)a3
{
  objc_storeStrong((id *)&self->_diagnosticsManagerQueue, a3);
}

- (OS_dispatch_queue)diagnosticListQueue
{
  return self->_diagnosticListQueue;
}

- (void)setDiagnosticListQueue:(id)a3
{
  objc_storeStrong((id *)&self->_diagnosticListQueue, a3);
}

- (DKDiagnosticRegistry)registry
{
  return self->_registry;
}

- (void)setRegistry:(id)a3
{
  objc_storeStrong((id *)&self->_registry, a3);
}

- (DKExtensionDiscovery)discovery
{
  return self->_discovery;
}

- (void)setDiscovery:(id)a3
{
  objc_storeStrong((id *)&self->_discovery, a3);
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_bundleIdentifier, a3);
}

- (unint64_t)connectionRoute
{
  return self->_connectionRoute;
}

- (void)setConnectionRoute:(unint64_t)a3
{
  self->_connectionRoute = a3;
}

- (DKBrightnessResponder)brightnessResponder
{
  return (DKBrightnessResponder *)objc_loadWeakRetained((id *)&self->_brightnessResponder);
}

- (void)setBrightnessResponder:(id)a3
{
  objc_storeWeak((id *)&self->_brightnessResponder, a3);
}

- (DKVolumeHUDResponder)volumeHUDResponder
{
  return (DKVolumeHUDResponder *)objc_loadWeakRetained((id *)&self->_volumeHUDResponder);
}

- (void)setVolumeHUDResponder:(id)a3
{
  objc_storeWeak((id *)&self->_volumeHUDResponder, a3);
}

- (DKStatusBarResponder)statusBarResponder
{
  return (DKStatusBarResponder *)objc_loadWeakRetained((id *)&self->_statusBarResponder);
}

- (void)setStatusBarResponder:(id)a3
{
  objc_storeWeak((id *)&self->_statusBarResponder, a3);
}

- (DKViewControllerDelegate)viewControllerDelegate
{
  return (DKViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_viewControllerDelegate);
}

- (void)setViewControllerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_viewControllerDelegate, a3);
}

- (BOOL)pluginReloadRequested
{
  return self->_pluginReloadRequested;
}

- (void)setPluginReloadRequested:(BOOL)a3
{
  self->_pluginReloadRequested = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_viewControllerDelegate);
  objc_destroyWeak((id *)&self->_statusBarResponder);
  objc_destroyWeak((id *)&self->_volumeHUDResponder);
  objc_destroyWeak((id *)&self->_brightnessResponder);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_discovery, 0);
  objc_storeStrong((id *)&self->_registry, 0);
  objc_storeStrong((id *)&self->_diagnosticListQueue, 0);
  objc_storeStrong((id *)&self->_diagnosticsManagerQueue, 0);
  objc_destroyWeak((id *)&self->_userAlertResponder);
  objc_destroyWeak((id *)&self->_accessoryResponder);
  objc_destroyWeak((id *)&self->_assetResponder);
  objc_destroyWeak((id *)&self->_progressResponder);
}

void __75__DKDiagnosticManager_beginDiagnosticWithIdentifier_parameters_completion___block_invoke_cold_1(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_fault_impl(&dword_22DE4C000, log, OS_LOG_TYPE_FAULT, "This DiagnosticsKit extension (%@ - %@) is not allow listed with the DK host application", buf, 0x16u);

}

- (void)_freeSpaceAvailable:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_22DE4C000, a2, OS_LOG_TYPE_ERROR, "Unable to check available disk space prior to running diagnostic with error: %@", (uint8_t *)&v2, 0xCu);
}

@end
