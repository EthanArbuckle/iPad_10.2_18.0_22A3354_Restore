@implementation AAUIAuthKitRecoveryHook

- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6
{
  (*((void (**)(id, uint64_t, _QWORD))a6 + 2))(a6, 1, 0);
}

- (void)processObjectModel:(id)a3 completion:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;

  v5 = a4;
  -[AAUIAuthKitRecoveryHook serverDataHarvester](self, "serverDataHarvester");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "harvestedData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[AAUIAuthKitRecoveryHook setServerHookResponse:](self, "setServerHookResponse:", 0);
  -[AAUIAuthKitRecoveryHook setServerDataHarvester:](self, "setServerDataHarvester:", 0);
  objc_msgSend(MEMORY[0x1E0D00108], "recoveryContextWithServerInfo:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc(MEMORY[0x1E0D00238]);
  -[AAUIAuthKitRecoveryHook _cdpStateUIProvider](self, "_cdpStateUIProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithContext:uiProvider:", v8, v10);

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __57__AAUIAuthKitRecoveryHook_processObjectModel_completion___block_invoke;
  v14[3] = &unk_1EA2DC250;
  v14[4] = self;
  v15 = v8;
  v16 = v5;
  v12 = v5;
  v13 = v8;
  objc_msgSend(v11, "presentNativeRecoveryUIWithCompletion:", v14);

}

void __57__AAUIAuthKitRecoveryHook_processObjectModel_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  int v7;
  NSObject *v8;
  _BOOL4 v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = objc_msgSend(MEMORY[0x1E0D00238], "shouldSendServerResponseForRecoveredInfo:withRecoveryError:", v5, v6);
  _AAUILogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB4ED000, v8, OS_LOG_TYPE_DEFAULT, "Recovered info, proceeding with rest of the flow...", buf, 2u);
    }

    v10 = objc_alloc_init(MEMORY[0x1E0D872E0]);
    objc_msgSend(*(id *)(a1 + 32), "setServerHookResponse:", v10);

    objc_msgSend(MEMORY[0x1E0D00238], "requestForRecoveryCompletionWithContext:recoveredInfo:recoveryError:", *(_QWORD *)(a1 + 40), v5, v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "serverHookResponse");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setContinuationRequest:", v11);

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    if (v9)
    {
      *(_DWORD *)buf = 138412290;
      v18 = v6;
      _os_log_impl(&dword_1DB4ED000, v8, OS_LOG_TYPE_DEFAULT, "Recovery flow ended with client error... %@", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __57__AAUIAuthKitRecoveryHook_processObjectModel_completion___block_invoke_21;
    v14[3] = &unk_1EA2DB110;
    v16 = *(id *)(a1 + 48);
    v15 = v6;
    objc_msgSend(v13, "dismissObjectModelsAnimated:completion:", 1, v14);

  }
}

uint64_t __57__AAUIAuthKitRecoveryHook_processObjectModel_completion___block_invoke_21(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

- (id)_cdpStateUIProvider
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0D157C0]);
  -[AAUIAuthKitRecoveryHook delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presentationContextForHook:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithPresentingViewController:", v5);

  objc_msgSend(v6, "setForceInlinePresentation:", 1);
  return v6;
}

- (BOOL)shouldMatchElement:(id)a3
{
  return 0;
}

- (BOOL)shouldMatchModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  char v10;

  v4 = a3;
  -[AAUIAuthKitRecoveryHook serverDataHarvester](self, "serverDataHarvester");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "harvestDataFromServerUIObjectModel:", v4);

  objc_opt_class();
  -[AAUIAuthKitRecoveryHook serverDataHarvester](self, "serverDataHarvester");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "harvestedData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CFFED8]);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;

  if ((objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0CFFEF0]) & 1) != 0)
    v10 = 1;
  else
    v10 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0CFFEF8]);

  return v10;
}

- (void)harvestDataFromResponse:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AAUIAuthKitRecoveryHook serverDataHarvester](self, "serverDataHarvester");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "harvestDataFromServerHTTPResponse:", v4);

}

- (AKAppleIDServerUIDataHarvester)serverDataHarvester
{
  AKAppleIDServerUIDataHarvester *serverDataHarvester;
  AKAppleIDServerUIDataHarvester *v4;
  AKAppleIDServerUIDataHarvester *v5;

  serverDataHarvester = self->_serverDataHarvester;
  if (!serverDataHarvester)
  {
    v4 = (AKAppleIDServerUIDataHarvester *)objc_alloc_init(MEMORY[0x1E0D00308]);
    v5 = self->_serverDataHarvester;
    self->_serverDataHarvester = v4;

    serverDataHarvester = self->_serverDataHarvester;
  }
  return serverDataHarvester;
}

- (RUIServerHookDelegate)delegate
{
  return (RUIServerHookDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (RUIServerHookResponse)serverHookResponse
{
  return self->_serverHookResponse;
}

- (void)setServerHookResponse:(id)a3
{
  objc_storeStrong((id *)&self->_serverHookResponse, a3);
}

- (void)setServerDataHarvester:(id)a3
{
  objc_storeStrong((id *)&self->_serverDataHarvester, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverDataHarvester, 0);
  objc_storeStrong((id *)&self->_serverHookResponse, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
