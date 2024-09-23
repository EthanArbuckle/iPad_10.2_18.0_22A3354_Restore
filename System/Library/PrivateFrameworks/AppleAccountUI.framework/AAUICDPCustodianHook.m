@implementation AAUICDPCustodianHook

- (AAUICDPCustodianHook)initWithAccountManager:(id)a3 contactsProvider:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  AAUICDPCustodianHook *v9;

  v6 = a4;
  v7 = a3;
  _AAUILogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[AAUICDPCustodianHook initWithAccountManager:contactsProvider:].cold.1();

  v9 = -[AAUICDPCustodianHook initWithAccountManager:contactsProvider:cdpContext:](self, "initWithAccountManager:contactsProvider:cdpContext:", v7, v6, 0);
  return v9;
}

- (AAUICDPCustodianHook)initWithAccountManager:(id)a3 contactsProvider:(id)a4 cdpContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  AAUICDPCustodianHook *v11;
  AIDAAccountManager *v12;
  void *accountManager;
  NSObject *v14;
  id v15;
  uint64_t v16;
  AIDAAccountManager *v17;
  AAUIContactsProvider *v18;
  NSObject *v19;
  AAUIContactsProvider *contactsProvider;
  objc_super v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v22.receiver = self;
  v22.super_class = (Class)AAUICDPCustodianHook;
  v11 = -[AAUICDPCustodianHook init](&v22, sel_init);
  if (v11)
  {
    if (v8)
    {
      v12 = (AIDAAccountManager *)v8;
      accountManager = v11->_accountManager;
      v11->_accountManager = v12;
    }
    else
    {
      _AAUILogSystem();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[AAUICDPCustodianHook initWithAccountManager:contactsProvider:cdpContext:].cold.2();

      v15 = objc_alloc(MEMORY[0x1E0CFCF50]);
      objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
      accountManager = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "initWithAccountStore:", accountManager);
      v17 = v11->_accountManager;
      v11->_accountManager = (AIDAAccountManager *)v16;

    }
    if (v9)
    {
      v18 = (AAUIContactsProvider *)v9;
    }
    else
    {
      _AAUILogSystem();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        -[AAUICDPCustodianHook initWithAccountManager:contactsProvider:cdpContext:].cold.1();

      v18 = objc_alloc_init(AAUIContactsProvider);
    }
    contactsProvider = v11->_contactsProvider;
    v11->_contactsProvider = v18;

    objc_storeStrong((id *)&v11->_cdpContext, a5);
  }

  return v11;
}

- (BOOL)shouldMatchElement:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("custodian:add"));

  return v4;
}

- (BOOL)shouldMatchModel:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  char v7;

  v3 = a3;
  objc_opt_class();
  objc_msgSend(v3, "clientInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D87308]);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;

  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("custodian:add"));
  return v7;
}

- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6
{
  -[AAUICDPCustodianHook processObjectModel:completion:](self, "processObjectModel:completion:", a5, a6);
}

- (void)processObjectModel:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  _DWORD v17[2];
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_opt_class();
  objc_msgSend(v6, "clientInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D87308]);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;

  if (objc_msgSend(v10, "isEqualToString:", CFSTR("custodian:add")))
  {
    objc_opt_class();
    objc_msgSend(v6, "clientInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("context"));
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v12;
    else
      v13 = 0;

    v15 = objc_msgSend(v13, "isEqualToString:", CFSTR("adpEnroll"));
    _AAUILogSystem();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17[0] = 67109378;
      v17[1] = v15;
      v18 = 2112;
      v19 = v13;
      _os_log_impl(&dword_1DB4ED000, v16, OS_LOG_TYPE_DEFAULT, "isADPUpsellFlow=%{BOOL}d because clientContext=%@", (uint8_t *)v17, 0x12u);
    }

    -[AAUICDPCustodianHook _performInlineCustodianSetupWithIsADPUpsellFlow:completion:](self, "_performInlineCustodianSetupWithIsADPUpsellFlow:completion:", v15, v7);
  }
  else
  {
    _AAUILogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[AAUICDPCustodianHook processObjectModel:completion:].cold.1();

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CFAAF8], -7000, 0);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    -[AAUICDPCustodianHook _callSetupCompletionWithSuccess:error:](self, "_callSetupCompletionWithSuccess:error:", 0, v13);
  }

}

- (void)_performInlineCustodianSetupWithIsADPUpsellFlow:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  AAUICustodianSetupFlowController *v13;
  void *v14;
  AAUICustodianSetupFlowController *v15;
  void *v16;
  void *v17;
  id v18;

  v4 = a3;
  v6 = (void *)objc_msgSend(a4, "copy");
  -[AAUICDPCustodianHook setSetupCompletion:](self, "setSetupCompletion:", v6);

  -[AAUICDPCustodianHook _custodianInlineSetupFlowNavigationController](self, "_custodianInlineSetupFlowNavigationController");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc(MEMORY[0x1E0DC34F0]);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccountUI"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("BACK"), &stru_1EA2E2A18, CFSTR("Localizable"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "initWithTitle:style:target:action:", v9, 0, 0, 0);
  objc_msgSend(v18, "topViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "navigationItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setBackBarButtonItem:", v10);

  v13 = [AAUICustodianSetupFlowController alloc];
  -[AAUICDPCustodianHook accountManager](self, "accountManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[AAUICustodianSetupFlowController initWithAccountManager:navigationController:isADPUpsellFlow:cdpContext:](v13, "initWithAccountManager:navigationController:isADPUpsellFlow:cdpContext:", v14, v18, v4, self->_cdpContext);
  -[AAUICDPCustodianHook setSetupFlowController:](self, "setSetupFlowController:", v15);

  -[AAUICDPCustodianHook setupFlowController](self, "setupFlowController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setDelegate:", self);

  -[AAUICDPCustodianHook setupFlowController](self, "setupFlowController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "start");

}

- (void)custodianSetupFlowControllerDidFinish:(id)a3 withError:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  char v13;
  void *v14;
  NSObject *v15;
  _QWORD v16[4];
  id v17;
  id location;
  _QWORD v19[5];
  id v20;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    _AAUILogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[AAUICDPCustodianHook custodianSetupFlowControllerDidFinish:withError:].cold.3();

    objc_msgSend(v6, "navigationController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "presentingViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    _AAUILogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[AAUICDPCustodianHook custodianSetupFlowControllerDidFinish:withError:].cold.2();

    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __72__AAUICDPCustodianHook_custodianSetupFlowControllerDidFinish_withError___block_invoke;
    v19[3] = &unk_1EA2DB778;
    v19[4] = self;
    v20 = v7;
    objc_msgSend(v10, "dismissViewControllerAnimated:completion:", 1, v19);

  }
  else
  {
    -[AAUICDPCustodianHook contactsProvider](self, "contactsProvider");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_opt_respondsToSelector();

    if ((v13 & 1) != 0)
    {
      objc_initWeak(&location, self);
      -[AAUICDPCustodianHook contactsProvider](self, "contactsProvider");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __72__AAUICDPCustodianHook_custodianSetupFlowControllerDidFinish_withError___block_invoke_45;
      v16[3] = &unk_1EA2DC278;
      objc_copyWeak(&v17, &location);
      objc_msgSend(v14, "fetchWalrusEligibleCustodiansForExpansionCohortsWithCompletion:", v16);

      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);
    }
    else
    {
      _AAUILogSystem();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[AAUICDPCustodianHook custodianSetupFlowControllerDidFinish:withError:].cold.1();

    }
  }

}

uint64_t __72__AAUICDPCustodianHook_custodianSetupFlowControllerDidFinish_withError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_callSetupCompletionWithSuccess:error:", 0, *(_QWORD *)(a1 + 40));
}

void __72__AAUICDPCustodianHook_custodianSetupFlowControllerDidFinish_withError___block_invoke_45(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  uint8_t v16[16];

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (v6)
  {
    _AAUILogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __72__AAUICDPCustodianHook_custodianSetupFlowControllerDidFinish_withError___block_invoke_45_cold_2();

    v9 = WeakRetained;
    v10 = 0;
    v11 = v6;
LABEL_9:
    objc_msgSend(v9, "_callSetupCompletionWithSuccess:error:", v10, v11);
    goto LABEL_10;
  }
  v12 = objc_msgSend(v5, "count");
  _AAUILogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v12)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_1DB4ED000, v14, OS_LOG_TYPE_DEFAULT, "Found at least one eligible custodian for walrus expansion cohort.", v16, 2u);
    }

    v9 = WeakRetained;
    v10 = 1;
    v11 = 0;
    goto LABEL_9;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    __72__AAUICDPCustodianHook_custodianSetupFlowControllerDidFinish_withError___block_invoke_45_cold_1();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CFAAF8], -7003, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_callSetupCompletionWithSuccess:error:", 0, v15);

LABEL_10:
}

- (id)_custodianInlineSetupFlowNavigationController
{
  id WeakRetained;
  void *v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  _BOOL4 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "presentationContextForHook:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    _AAUILogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[AAUICDPCustodianHook _custodianInlineSetupFlowNavigationController].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);

    v6 = objc_alloc_init(MEMORY[0x1E0DC3A40]);
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    _AAUILogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[AAUICDPCustodianHook _custodianInlineSetupFlowNavigationController].cold.2();

    v6 = v4;
LABEL_9:
    v15 = v6;
    goto LABEL_18;
  }
  objc_msgSend(v4, "navigationController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  _AAUILogSystem();
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG);
  if (v16)
  {
    if (v18)
      -[AAUICDPCustodianHook _custodianInlineSetupFlowNavigationController].cold.4(v17, v19, v20, v21, v22, v23, v24, v25);

    v26 = v16;
  }
  else
  {
    if (v18)
      -[AAUICDPCustodianHook _custodianInlineSetupFlowNavigationController].cold.3();

    v26 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v4);
  }
  v15 = v26;

LABEL_18:
  return v15;
}

- (void)_callSetupCompletionWithSuccess:(BOOL)a3 error:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;

  v4 = a3;
  v6 = a4;
  -[AAUICDPCustodianHook setupCompletion](self, "setupCompletion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  _AAUILogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (uint64_t)v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[AAUICDPCustodianHook _callSetupCompletionWithSuccess:error:].cold.2(v4, (uint64_t)v6, (os_log_t)v9);

    -[AAUICDPCustodianHook setupCompletion](self, "setupCompletion");
    v9 = objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _BOOL8, id))(v9 + 16))(v9, v4, v6);
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    -[AAUICDPCustodianHook _callSetupCompletionWithSuccess:error:].cold.1();
  }

}

- (RUIServerHookDelegate)delegate
{
  return (RUIServerHookDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (AIDAAccountManager)accountManager
{
  return self->_accountManager;
}

- (AAUIContactsProvider)contactsProvider
{
  return self->_contactsProvider;
}

- (id)setupCompletion
{
  return self->_setupCompletion;
}

- (void)setSetupCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (AAUICustodianSetupFlowController)setupFlowController
{
  return self->_setupFlowController;
}

- (void)setSetupFlowController:(id)a3
{
  objc_storeStrong((id *)&self->_setupFlowController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setupFlowController, 0);
  objc_storeStrong(&self->_setupCompletion, 0);
  objc_storeStrong((id *)&self->_contactsProvider, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_cdpContext, 0);
}

- (void)initWithAccountManager:contactsProvider:.cold.1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_1DB4ED000, v0, OS_LOG_TYPE_DEBUG, "Instantiating AAUICDPCustodianHook with nil cdpContext", v1, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithAccountManager:contactsProvider:cdpContext:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1DB4ED000, v0, v1, "Passed in contacts provider should not be nil. Creating a new one.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithAccountManager:contactsProvider:cdpContext:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1DB4ED000, v0, v1, "Passed in account manager should not be nil. Creating one with the default account store.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)processObjectModel:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_1DB4ED000, v0, v1, "Not proceeding with inline custodian setup. Action=(%@)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)custodianSetupFlowControllerDidFinish:withError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1DB4ED000, v0, v1, "AppleAccount changes have not yet integrated", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)custodianSetupFlowControllerDidFinish:withError:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3_0(&dword_1DB4ED000, v0, v1, "Dismissing from landing screen %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)custodianSetupFlowControllerDidFinish:withError:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_1DB4ED000, v0, v1, "Encountered an error while finishing custodian setup flow: %@.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __72__AAUICDPCustodianHook_custodianSetupFlowControllerDidFinish_withError___block_invoke_45_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1DB4ED000, v0, v1, "No eligible custodians found for walrus expansion cohort.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __72__AAUICDPCustodianHook_custodianSetupFlowControllerDidFinish_withError___block_invoke_45_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_1DB4ED000, v0, v1, "Failed to fetch custodians for Walrus expansion cohort due to error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_custodianInlineSetupFlowNavigationController
{
  OUTLINED_FUNCTION_3_0(&dword_1DB4ED000, a1, a3, "%s: Returning presenting VC's nav controller", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)_callSetupCompletionWithSuccess:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1DB4ED000, v0, v1, "Completion handler was not set.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_callSetupCompletionWithSuccess:(os_log_t)log error:.cold.2(char a1, uint64_t a2, os_log_t log)
{
  _DWORD v3[2];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3[0] = 67109378;
  v3[1] = a1 & 1;
  v4 = 2112;
  v5 = a2;
  _os_log_debug_impl(&dword_1DB4ED000, log, OS_LOG_TYPE_DEBUG, "AAUICDPCustodianHook: Calling completion with success=(%d) error=(%@)", (uint8_t *)v3, 0x12u);
  OUTLINED_FUNCTION_4();
}

@end
