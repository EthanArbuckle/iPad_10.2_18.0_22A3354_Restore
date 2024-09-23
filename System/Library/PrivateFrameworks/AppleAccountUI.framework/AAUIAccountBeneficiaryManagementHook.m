@implementation AAUIAccountBeneficiaryManagementHook

- (AAUIAccountBeneficiaryManagementHook)initWithAccountManager:(id)a3 legacyContactsViewModel:(id)a4
{
  id v7;
  id v8;
  AAUIAccountBeneficiaryManagementHook *v9;
  AAUIAccountBeneficiaryManagementHook *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AAUIAccountBeneficiaryManagementHook;
  v9 = -[AAUIAccountBeneficiaryManagementHook init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_accountManager, a3);
    objc_storeStrong((id *)&v10->_legacyContactsViewModel, a4);
  }

  return v10;
}

- (BOOL)shouldMatchElement:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("inheritance:show"));

  return v4;
}

- (BOOL)shouldMatchModel:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(a3, "clientInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("action"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("inheritance:show"));

  return v5;
}

- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6
{
  -[AAUIAccountBeneficiaryManagementHook _showAccountBeneficiaryManagementWithServerAttributes:completion:](self, "_showAccountBeneficiaryManagementWithServerAttributes:completion:", a4, a6, a5);
}

- (void)processObjectModel:(id)a3 completion:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  objc_msgSend(a3, "clientInfo");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[AAUIAccountBeneficiaryManagementHook _showAccountBeneficiaryManagementWithServerAttributes:completion:](self, "_showAccountBeneficiaryManagementWithServerAttributes:completion:", v7, v6);

}

- (void)_showAccountBeneficiaryManagementWithServerAttributes:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  AAUID2DEncryptionFlowContext *v9;
  AAUIManateeStateValidator *v10;
  AAUIManateeStateValidator *v11;
  AAUIManateeStateValidator *v12;
  id v13;
  _QWORD v14[4];
  AAUIManateeStateValidator *v15;
  AAUIAccountBeneficiaryManagementHook *v16;
  id v17;
  uint64_t *v18;
  id v19;
  id location;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v6 = a3;
  v7 = a4;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__12;
  v25 = __Block_byref_object_dispose__12;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "presentationContextForHook:", self);
  v26 = (id)objc_claimAutoreleasedReturnValue();

  v9 = -[AAUID2DEncryptionFlowContext initWithType:]([AAUID2DEncryptionFlowContext alloc], "initWithType:", 3);
  v10 = [AAUIManateeStateValidator alloc];
  v11 = -[AAUIManateeStateValidator initWithFlowContext:withPresentingViewController:](v10, "initWithFlowContext:withPresentingViewController:", v9, v22[5]);
  objc_initWeak(&location, self);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __105__AAUIAccountBeneficiaryManagementHook__showAccountBeneficiaryManagementWithServerAttributes_completion___block_invoke;
  v14[3] = &unk_1EA2DD4E8;
  v12 = v11;
  v15 = v12;
  objc_copyWeak(&v19, &location);
  v18 = &v21;
  v16 = self;
  v13 = v7;
  v17 = v13;
  -[AAUIManateeStateValidator verifyAndRepairManateeWithCompletion:](v12, "verifyAndRepairManateeWithCompletion:", v14);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

  _Block_object_dispose(&v21, 8);
}

void __105__AAUIAccountBeneficiaryManagementHook__showAccountBeneficiaryManagementWithServerAttributes_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  _QWORD *WeakRetained;
  NSObject *v7;
  AAUIAccountBeneficiaryViewController *v8;
  NSObject *v9;
  void (*v10)(void);
  AAUIAccountBeneficiaryViewController *v11;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (a2)
  {
    if (+[AAUIFeatureFlags isSignInSecurityRedesignEnabled](AAUIFeatureFlags, "isSignInSecurityRedesignEnabled"))
    {
      _AAUILogSystem();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        __105__AAUIAccountBeneficiaryManagementHook__showAccountBeneficiaryManagementWithServerAttributes_completion___block_invoke_cold_1(v7);

      +[AAUILegacyContactsViewFactory createWithViewModel:](AAUILegacyContactsViewFactory, "createWithViewModel:", WeakRetained[2]);
      v8 = (AAUIAccountBeneficiaryViewController *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = -[AAUIAccountBeneficiaryViewController initWithAccountManager:]([AAUIAccountBeneficiaryViewController alloc], "initWithAccountManager:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8));
    }
    v11 = v8;
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "showViewController:sender:", v8, WeakRetained);

    v10 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  else
  {
    _AAUILogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __99__AAUIAccountRecoveryManagementHook__showAccountRecoveryManagementWithServerAttributes_completion___block_invoke_cold_2((id *)(a1 + 64), (uint64_t)v5, v9);

    v10 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  v10();

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
  objc_storeStrong((id *)&self->_legacyContactsViewModel, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
}

void __105__AAUIAccountBeneficiaryManagementHook__showAccountBeneficiaryManagementWithServerAttributes_completion___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1DB4ED000, log, OS_LOG_TYPE_DEBUG, "Presenting new Legacy Contacts UI", v1, 2u);
}

@end
