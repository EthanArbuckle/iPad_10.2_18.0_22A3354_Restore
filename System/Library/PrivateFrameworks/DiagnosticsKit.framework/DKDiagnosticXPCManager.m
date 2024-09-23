@implementation DKDiagnosticXPCManager

- (DKDiagnosticXPCManager)init
{
  return -[DKDiagnosticXPCManager initWithBundleIdentifier:connectionRoute:](self, "initWithBundleIdentifier:connectionRoute:", CFSTR("Default"), 1);
}

- (DKDiagnosticXPCManager)initWithBundleIdentifier:(id)a3 connectionRoute:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  DKDiagnosticXPCManager *v8;
  NSMutableDictionary *v9;
  NSMutableDictionary *diagnostics;
  NSMutableArray *v11;
  NSMutableArray *activeDiagnostics;
  objc_super v14;
  uint8_t buf[4];
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  DiagnosticsKitLogHandleForCategory(1);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v16 = "-[DKDiagnosticXPCManager initWithBundleIdentifier:connectionRoute:]";
    _os_log_impl(&dword_22DE4C000, v7, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v14.receiver = self;
  v14.super_class = (Class)DKDiagnosticXPCManager;
  v8 = -[DKDiagnosticManager initWithBundleIdentifier:connectionRoute:](&v14, sel_initWithBundleIdentifier_connectionRoute_, v6, a4);

  if (v8)
  {
    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    diagnostics = v8->_diagnostics;
    v8->_diagnostics = v9;

    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    activeDiagnostics = v8->_activeDiagnostics;
    v8->_activeDiagnostics = v11;

  }
  return v8;
}

- (void)beginDiagnosticWithIdentifier:(id)a3 parameters:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  DiagnosticsKitLogHandleForCategory(1);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v21 = "-[DKDiagnosticXPCManager beginDiagnosticWithIdentifier:parameters:completion:]";
    _os_log_impl(&dword_22DE4C000, v11, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  -[DKDiagnosticManager diagnosticsManagerQueue](self, "diagnosticsManagerQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __78__DKDiagnosticXPCManager_beginDiagnosticWithIdentifier_parameters_completion___block_invoke;
  v16[3] = &unk_24F99AE80;
  v16[4] = self;
  v17 = v8;
  v18 = v9;
  v19 = v10;
  v13 = v9;
  v14 = v10;
  v15 = v8;
  dispatch_async(v12, v16);

}

void __78__DKDiagnosticXPCManager_beginDiagnosticWithIdentifier_parameters_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  DKDiagnosticHostContext *v7;
  DKDiagnosticServiceRequest *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id from;
  id location;
  uint8_t buf[4];
  uint64_t v29;
  uint64_t v30;
  _QWORD v31[3];

  v31[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "diagnostics");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x24BDD1988]);
    objc_msgSend(v3, "serviceName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "initWithServiceName:", v5);

    v7 = -[DKDiagnosticHostContext initWithConnection:]([DKDiagnosticHostContext alloc], "initWithConnection:", v6);
    v8 = -[DKDiagnosticServiceRequest initWithHostServicesDelegate:]([DKDiagnosticServiceRequest alloc], "initWithHostServicesDelegate:", *(_QWORD *)(a1 + 32));
    -[DKDiagnosticServiceRequest setCompletion:](v8, "setCompletion:", *(_QWORD *)(a1 + 56));
    -[DKDiagnosticServiceRequest setConnection:](v8, "setConnection:", v6);
    -[DKDiagnosticServiceRequest setContext:](v8, "setContext:", v7);
    -[DKDiagnosticHostContext setDelegate:](v7, "setDelegate:", v8);
    objc_msgSend(*(id *)(a1 + 32), "activeDiagnostics");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v8);

    +[DKDiagnosticHostContext _extensionAuxiliaryVendorProtocol](DKDiagnosticHostContext, "_extensionAuxiliaryVendorProtocol");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setRemoteObjectInterface:", v10);

    objc_msgSend(v6, "setExportedObject:", v7);
    +[DKDiagnosticHostContext _extensionAuxiliaryHostProtocol](DKDiagnosticHostContext, "_extensionAuxiliaryHostProtocol");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setExportedInterface:", v11);

    objc_initWeak(&location, *(id *)(a1 + 32));
    objc_initWeak(&from, v8);
    v12 = MEMORY[0x24BDAC760];
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __78__DKDiagnosticXPCManager_beginDiagnosticWithIdentifier_parameters_completion___block_invoke_2;
    v23[3] = &unk_24F99AE08;
    objc_copyWeak(&v24, &from);
    objc_copyWeak(&v25, &location);
    objc_msgSend(v6, "setInvalidationHandler:", v23);
    v21[0] = v12;
    v21[1] = 3221225472;
    v21[2] = __78__DKDiagnosticXPCManager_beginDiagnosticWithIdentifier_parameters_completion___block_invoke_7;
    v21[3] = &unk_24F99AE30;
    objc_copyWeak(&v22, &from);
    objc_msgSend(v6, "setInterruptionHandler:", v21);
    objc_msgSend(v6, "resume");
    DiagnosticsKitLogHandleForCategory(1);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = objc_msgSend(*(id *)(a1 + 40), "longValue");
      *(_DWORD *)buf = 134217984;
      v29 = v14;
      _os_log_impl(&dword_22DE4C000, v13, OS_LOG_TYPE_DEFAULT, "Found diagnostic for ID: %ld", buf, 0xCu);
    }

    v15 = *(_QWORD *)(a1 + 48);
    v19[0] = v12;
    v19[1] = 3221225472;
    v19[2] = __78__DKDiagnosticXPCManager_beginDiagnosticWithIdentifier_parameters_completion___block_invoke_8;
    v19[3] = &unk_24F99AE58;
    objc_copyWeak(&v20, &from);
    -[DKDiagnosticHostContext startWithPayload:completion:](v7, "startWithPayload:completion:", v15, v19);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&v25);
    objc_destroyWeak(&v24);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);

  }
  else
  {
    v16 = (void *)MEMORY[0x24BDD1540];
    v30 = *MEMORY[0x24BDD0FC8];
    DKErrorLocalizedDescriptionForCode(-1000);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = v17;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("DKErrorDomain"), -1000, v18);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

void __78__DKDiagnosticXPCManager_beginDiagnosticWithIdentifier_parameters_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  DiagnosticsKitLogHandleForCategory(4);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __78__DKDiagnosticXPCManager_beginDiagnosticWithIdentifier_parameters_completion___block_invoke_2_cold_1((uint64_t)WeakRetained, v3, v4, v5, v6, v7, v8, v9);

  objc_msgSend(WeakRetained, "didInvalidate");
  v10 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v10, "activeDiagnostics");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeObject:", WeakRetained);

}

void __78__DKDiagnosticXPCManager_beginDiagnosticWithIdentifier_parameters_completion___block_invoke_7(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  DiagnosticsKitLogHandleForCategory(4);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __78__DKDiagnosticXPCManager_beginDiagnosticWithIdentifier_parameters_completion___block_invoke_7_cold_1((uint64_t)WeakRetained, v2, v3, v4, v5, v6, v7, v8);

  objc_msgSend(WeakRetained, "didInterrupt");
}

void __78__DKDiagnosticXPCManager_beginDiagnosticWithIdentifier_parameters_completion___block_invoke_8(uint64_t a1, int a2)
{
  NSObject *v4;
  id WeakRetained;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  DiagnosticsKitLogHandleForCategory(1);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = a2;
    _os_log_impl(&dword_22DE4C000, v4, OS_LOG_TYPE_DEFAULT, "Started: %d", (uint8_t *)v6, 8u);
  }

  if ((a2 & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "didFailStart");

  }
}

- (void)diagnosticsWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  DiagnosticsKitLogHandleForCategory(1);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v11 = "-[DKDiagnosticXPCManager diagnosticsWithCompletion:]";
    _os_log_impl(&dword_22DE4C000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  -[DKDiagnosticManager diagnosticListQueue](self, "diagnosticListQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __52__DKDiagnosticXPCManager_diagnosticsWithCompletion___block_invoke;
  v8[3] = &unk_24F99AC90;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

}

void __52__DKDiagnosticXPCManager_diagnosticsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "diagnostics");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v2);

}

- (id)attributesForIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[5];
  id v11;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  DiagnosticsKitLogHandleForCategory(1);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "-[DKDiagnosticXPCManager attributesForIdentifier:]";
    _os_log_impl(&dword_22DE4C000, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__0;
  v16 = __Block_byref_object_dispose__0;
  v17 = 0;
  -[DKDiagnosticManager diagnosticListQueue](self, "diagnosticListQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__DKDiagnosticXPCManager_attributesForIdentifier___block_invoke;
  block[3] = &unk_24F99AEA8;
  v11 = v4;
  p_buf = &buf;
  block[4] = self;
  v7 = v4;
  dispatch_sync(v6, block);

  v8 = *(id *)(*((_QWORD *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  return v8;
}

void __50__DKDiagnosticXPCManager_attributesForIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "diagnostics");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)cancelAllDiagnostics
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint8_t v14[128];
  uint8_t buf[4];
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  DiagnosticsKitLogHandleForCategory(1);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v16 = "-[DKDiagnosticXPCManager cancelAllDiagnostics]";
    _os_log_impl(&dword_22DE4C000, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[DKDiagnosticXPCManager activeDiagnostics](self, "activeDiagnostics", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8), "context");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "cancelWithCompletion:", &__block_literal_global_9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

void __46__DKDiagnosticXPCManager_cancelAllDiagnostics__block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  DiagnosticsKitLogHandleForCategory(1);
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_22DE4C000, v0, OS_LOG_TYPE_DEFAULT, "DKDiagnosticXPCManager: Finished canceling all diags", v1, 2u);
  }

}

- (void)registerDiagnosticWithAttributes:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  DiagnosticsKitLogHandleForCategory(1);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v11 = "-[DKDiagnosticXPCManager registerDiagnosticWithAttributes:]";
    _os_log_impl(&dword_22DE4C000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  -[DKDiagnosticManager diagnosticListQueue](self, "diagnosticListQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __59__DKDiagnosticXPCManager_registerDiagnosticWithAttributes___block_invoke;
  v8[3] = &unk_24F99ABB0;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_barrier_async(v6, v8);

}

void __59__DKDiagnosticXPCManager_registerDiagnosticWithAttributes___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "diagnostics");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v2, v3);

}

- (void)getAsset:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  char v10;
  void *v11;
  int v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  DiagnosticsKitLogHandleForCategory(1);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 136315138;
    v13 = "-[DKDiagnosticXPCManager getAsset:completion:]";
    _os_log_impl(&dword_22DE4C000, v8, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v12, 0xCu);
  }

  -[DKDiagnosticManager assetResponder](self, "assetResponder");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    -[DKDiagnosticManager assetResponder](self, "assetResponder");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "getAsset:completion:", v6, v7);

  }
}

- (void)showUI:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  char v10;
  void *v11;
  int v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  DiagnosticsKitLogHandleForCategory(1);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 136315138;
    v13 = "-[DKDiagnosticXPCManager showUI:completion:]";
    _os_log_impl(&dword_22DE4C000, v8, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v12, 0xCu);
  }

  -[DKDiagnosticXPCManager uiResponder](self, "uiResponder");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    -[DKDiagnosticXPCManager uiResponder](self, "uiResponder");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "showUI:completion:", v6, v7);

  }
}

- (DKUIResponder)uiResponder
{
  return (DKUIResponder *)objc_loadWeakRetained((id *)&self->_uiResponder);
}

- (void)setUiResponder:(id)a3
{
  objc_storeWeak((id *)&self->_uiResponder, a3);
}

- (NSMutableDictionary)diagnostics
{
  return self->_diagnostics;
}

- (void)setDiagnostics:(id)a3
{
  objc_storeStrong((id *)&self->_diagnostics, a3);
}

- (NSMutableArray)activeDiagnostics
{
  return self->_activeDiagnostics;
}

- (void)setActiveDiagnostics:(id)a3
{
  objc_storeStrong((id *)&self->_activeDiagnostics, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeDiagnostics, 0);
  objc_storeStrong((id *)&self->_diagnostics, 0);
  objc_destroyWeak((id *)&self->_uiResponder);
}

void __78__DKDiagnosticXPCManager_beginDiagnosticWithIdentifier_parameters_completion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_22DE4C000, a2, a3, "Connection invalidated: %@", a5, a6, a7, a8, 2u);
}

void __78__DKDiagnosticXPCManager_beginDiagnosticWithIdentifier_parameters_completion___block_invoke_7_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_22DE4C000, a2, a3, "Connection interrupted: %@", a5, a6, a7, a8, 2u);
}

@end
