@implementation AAUICustodianVerificationHook

- (AAUICustodianVerificationHook)initWithAccountManager:(id)a3
{
  id v5;
  AAUICustodianVerificationHook *v6;
  AAUICustodianVerificationHook *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AAUICustodianVerificationHook;
  v6 = -[AAUICustodianVerificationHook init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_accountManager, a3);

  return v7;
}

- (BOOL)shouldMatchElement:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("custodian:verify"));

  return v4;
}

- (BOOL)shouldMatchModel:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(a3, "clientInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0D87308]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("custodian:verify"));

  return v5;
}

- (void)_processAttributes:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;

  v4 = a3;
  objc_opt_class();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D87318]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v5;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v7;
  else
    v6 = 0;

  self->_forceInline = objc_msgSend(v6, "BOOLValue");
}

- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;

  v9 = a6;
  v10 = a3;
  -[AAUICustodianVerificationHook _processAttributes:](self, "_processAttributes:", a4);
  objc_msgSend(v10, "name");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  -[AAUICustodianVerificationHook _verifyCustodianWithServerAttributes:completion:](self, "_verifyCustodianWithServerAttributes:completion:", v11, v9);
}

- (void)processObjectModel:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "clientInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAUICustodianVerificationHook _processAttributes:](self, "_processAttributes:", v8);

  objc_msgSend(v7, "clientInfo");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("custodian:verify"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAUICustodianVerificationHook _verifyCustodianWithServerAttributes:completion:](self, "_verifyCustodianWithServerAttributes:completion:", v9, v6);

}

- (void)_verifyCustodianWithServerAttributes:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id WeakRetained;
  UIViewController *v10;
  UIViewController *presentingViewController;
  AAUIContactsProvider *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id location;

  v6 = a3;
  v7 = a4;
  _AAUILogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[AAUICustodianVerificationHook _verifyCustodianWithServerAttributes:completion:].cold.1((uint64_t)v6, v8);

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "presentationContextForHook:", self);
  v10 = (UIViewController *)objc_claimAutoreleasedReturnValue();
  presentingViewController = self->_presentingViewController;
  self->_presentingViewController = v10;

  objc_initWeak(&location, self);
  v12 = objc_alloc_init(AAUIContactsProvider);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __81__AAUICustodianVerificationHook__verifyCustodianWithServerAttributes_completion___block_invoke;
  v14[3] = &unk_1EA2DCAC8;
  objc_copyWeak(&v16, &location);
  v13 = v7;
  v14[4] = self;
  v15 = v13;
  -[AAContactsProvider fetchMyWalrusEligibleCustodians:](v12, "fetchMyWalrusEligibleCustodians:", v14);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

void __81__AAUICustodianVerificationHook__verifyCustodianWithServerAttributes_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id WeakRetained;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  _QWORD block[5];

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (a3)
  {
    _AAUILogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __81__AAUICustodianVerificationHook__verifyCustodianWithServerAttributes_completion___block_invoke_cold_2();

    if (WeakRetained)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __81__AAUICustodianVerificationHook__verifyCustodianWithServerAttributes_completion___block_invoke_26;
      block[3] = &unk_1EA2DB208;
      block[4] = WeakRetained;
      dispatch_async(MEMORY[0x1E0C80D38], block);
    }
    v8 = *(_QWORD *)(a1 + 40);
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v10 = *MEMORY[0x1E0CFAAF8];
    v11 = -7000;
LABEL_7:
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, v11, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v8 + 16))(v8, 0, v12);

    goto LABEL_8;
  }
  if (!objc_msgSend(v5, "count"))
  {
    _AAUILogSystem();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      __81__AAUICustodianVerificationHook__verifyCustodianWithServerAttributes_completion___block_invoke_cold_1();

    v8 = *(_QWORD *)(a1 + 40);
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v10 = *MEMORY[0x1E0CFAAF8];
    v11 = -7003;
    goto LABEL_7;
  }
  v13 = *(_QWORD *)(a1 + 40);
  if (WeakRetained)
  {
    v14 = objc_msgSend(*(id *)(a1 + 40), "copy");
    v15 = *(_QWORD *)(a1 + 32);
    v16 = *(void **)(v15 + 8);
    *(_QWORD *)(v15 + 8) = v14;

    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __81__AAUICustodianVerificationHook__verifyCustodianWithServerAttributes_completion___block_invoke_29;
    v19[3] = &unk_1EA2DB778;
    v19[4] = WeakRetained;
    v20 = v5;
    dispatch_async(MEMORY[0x1E0C80D38], v19);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CFAAF8], -7000, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v13 + 16))(v13, 0, v18);

  }
LABEL_8:

}

uint64_t __81__AAUICustodianVerificationHook__verifyCustodianWithServerAttributes_completion___block_invoke_26(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_displayCustodianFetchErrorAlert");
}

uint64_t __81__AAUICustodianVerificationHook__verifyCustodianWithServerAttributes_completion___block_invoke_29(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_displayListOfCustodiansWithContacts:", *(_QWORD *)(a1 + 40));
}

- (void)_displayCustodianFetchErrorAlert
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = (void *)MEMORY[0x1E0DC3450];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("CANNOT_ADD_ADP_ALERT_TITLE"), &stru_1EA2E2A18, CFSTR("Localizable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("ERROR_DISPLAYING_HEALTHY_CUSTODIANS"), &stru_1EA2E2A18, CFSTR("Localizable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alertWithTitle:message:", v5, v7);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1EA2E2A18, CFSTR("Localizable"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", v9, 0, &__block_literal_global_14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addAction:", v10);

  -[UIViewController presentViewController:animated:completion:](self->_presentingViewController, "presentViewController:animated:completion:", v11, 1, 0);
}

void __65__AAUICustodianVerificationHook__displayCustodianFetchErrorAlert__block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  _AAUILogSystem();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1DB4ED000, v0, OS_LOG_TYPE_DEFAULT, "User tapped on OK button of custodian error alert.", v1, 2u);
  }

}

- (void)_displayListOfCustodiansWithContacts:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  AAUINavigationItemSpinnerController *v7;
  void *v8;
  AAUINavigationItemSpinnerController *v9;
  AAUINavigationItemSpinnerController *spinnerController;
  void *v11;
  void *v12;
  uint64_t v13;
  AAUICustodiansListViewController *v14;

  v4 = a3;
  v14 = -[AAUICustodiansListViewController initWithContacts:]([AAUICustodiansListViewController alloc], "initWithContacts:", v4);

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, self, sel__cancelFlow);
  -[OBBaseWelcomeController navigationItem](v14, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLeftBarButtonItem:", v5);

  -[AAUIOBTableWelcomeController setDelegate:](v14, "setDelegate:", self);
  v7 = [AAUINavigationItemSpinnerController alloc];
  -[OBBaseWelcomeController navigationItem](v14, "navigationItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[AAUINavigationItemSpinnerController initWithNavigationItem:hideBackButton:](v7, "initWithNavigationItem:hideBackButton:", v8, 1);
  spinnerController = self->_spinnerController;
  self->_spinnerController = v9;

  if (-[AAUICustodianVerificationHook _shouldPresentInline](self, "_shouldPresentInline"))
  {
    -[UIViewController showViewController:sender:](self->_presentingViewController, "showViewController:sender:", v14, self);
  }
  else
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v14);
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "userInterfaceIdiom");

    if (v13 == 1)
      objc_msgSend(v11, "setModalPresentationStyle:", 2);
    -[UIViewController presentViewController:animated:completion:](self->_presentingViewController, "presentViewController:animated:completion:", v11, 1, 0);

  }
}

- (void)_cancelFlow
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_1DB4ED000, v0, v1, "AAUICustodianVerificationHook: user tapped cancel button", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (BOOL)_shouldPresentInline
{
  objc_opt_class();
  return (objc_opt_isKindOfClass() & 1) != 0 && self->_forceInline;
}

- (void)_dismissUI
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_debug_impl(&dword_1DB4ED000, a2, OS_LOG_TYPE_DEBUG, "Dismissing custodian verification UI, was modally presented: %d", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_1_0();
}

- (void)tableWelcomeViewControllerDidTapPrimaryButton
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_1DB4ED000, v0, v1, "tableWelcomeViewControllerDidTapPrimaryButton: user tapped continue button", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)tableWelcomeViewControllerDidTapSecondaryButton
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_1DB4ED000, v0, v1, "tableWelcomeViewControllerDidTapSecondaryButton: user tapped Manage recovery contacts button", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (RUIServerHookDelegate)delegate
{
  return (RUIServerHookDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_accountManager, 0);
  objc_storeStrong((id *)&self->_presentingViewController, 0);
  objc_storeStrong((id *)&self->_spinnerController, 0);
  objc_storeStrong(&self->_hookCompletion, 0);
}

- (void)_verifyCustodianWithServerAttributes:(uint64_t)a1 completion:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1DB4ED000, a2, OS_LOG_TYPE_DEBUG, "custodian action received - %@, getting custodians", (uint8_t *)&v2, 0xCu);
}

void __81__AAUICustodianVerificationHook__verifyCustodianWithServerAttributes_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1DB4ED000, v0, v1, "AAUICustodianVerificationHook: No custodians found, returning early.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __81__AAUICustodianVerificationHook__verifyCustodianWithServerAttributes_completion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1DB4ED000, v0, v1, "AAUICustodianVerificationHook: Error occurred in fetching custodians, displaying alert and returning early.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end
