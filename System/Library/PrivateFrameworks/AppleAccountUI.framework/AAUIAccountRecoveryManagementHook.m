@implementation AAUIAccountRecoveryManagementHook

- (AAUIAccountRecoveryManagementHook)initWithAccountManager:(id)a3 recoveryContactsViewModel:(id)a4
{
  id v7;
  id v8;
  AAUIAccountRecoveryManagementHook *v9;
  AAUIAccountRecoveryManagementHook *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AAUIAccountRecoveryManagementHook;
  v9 = -[AAUIAccountRecoveryManagementHook init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_accountManager, a3);
    objc_storeStrong((id *)&v10->_recoveryContactsViewModel, a4);
  }

  return v10;
}

- (BOOL)shouldMatchElement:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("recoveryOptions:show"));

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
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("recoveryOptions:show"));

  return v5;
}

- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6
{
  -[AAUIAccountRecoveryManagementHook _showAccountRecoveryManagementWithServerAttributes:completion:](self, "_showAccountRecoveryManagementWithServerAttributes:completion:", a4, a6, a5);
}

- (void)processObjectModel:(id)a3 completion:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  objc_msgSend(a3, "clientInfo");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[AAUIAccountRecoveryManagementHook _showAccountRecoveryManagementWithServerAttributes:completion:](self, "_showAccountRecoveryManagementWithServerAttributes:completion:", v7, v6);

}

- (void)_showAccountRecoveryManagementWithServerAttributes:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  id WeakRetained;
  AAUID2DEncryptionFlowContext *v12;
  AAUIManateeStateValidator *v13;
  AAUIManateeStateValidator *v14;
  AAUIManateeStateValidator *v15;
  id v16;
  _QWORD v17[4];
  AAUIManateeStateValidator *v18;
  id v19;
  uint64_t *v20;
  id v21;
  id location;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v6 = a3;
  v7 = a4;
  objc_opt_class();
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D87340]);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;

  _AAUILogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[AAUIAccountRecoveryManagementHook _showAccountRecoveryManagementWithServerAttributes:completion:].cold.1((uint64_t)v9, v10);

  self->_presentationType = -[AAUIAccountRecoveryManagementHook _presentationTypeForString:](self, "_presentationTypeForString:", v9);
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__1;
  v27 = __Block_byref_object_dispose__1;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "presentationContextForHook:", self);
  v28 = (id)objc_claimAutoreleasedReturnValue();

  v12 = -[AAUID2DEncryptionFlowContext initWithType:]([AAUID2DEncryptionFlowContext alloc], "initWithType:", 2);
  v13 = [AAUIManateeStateValidator alloc];
  v14 = -[AAUIManateeStateValidator initWithFlowContext:withPresentingViewController:](v13, "initWithFlowContext:withPresentingViewController:", v12, v24[5]);
  objc_initWeak(&location, self);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __99__AAUIAccountRecoveryManagementHook__showAccountRecoveryManagementWithServerAttributes_completion___block_invoke;
  v17[3] = &unk_1EA2DB890;
  v15 = v14;
  v18 = v15;
  objc_copyWeak(&v21, &location);
  v20 = &v23;
  v16 = v7;
  v19 = v16;
  -[AAUIManateeStateValidator repairIfPrimaryAppleAccountIsCDP:](v15, "repairIfPrimaryAppleAccountIsCDP:", v17);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

  _Block_object_dispose(&v23, 8);
}

void __99__AAUIAccountRecoveryManagementHook__showAccountRecoveryManagementWithServerAttributes_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  _QWORD *WeakRetained;
  NSObject *v7;
  AAUIAccountRecoveryViewController *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained && a2)
  {
    if (+[AAUIFeatureFlags isSignInSecurityRedesignEnabled](AAUIFeatureFlags, "isSignInSecurityRedesignEnabled"))
    {
      _AAUILogSystem();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        __99__AAUIAccountRecoveryManagementHook__showAccountRecoveryManagementWithServerAttributes_completion___block_invoke_cold_1(v7);

      +[AAUIRecoveryContactsViewFactory createWithViewModel:](AAUIRecoveryContactsViewFactory, "createWithViewModel:", WeakRetained[2]);
      v8 = (AAUIAccountRecoveryViewController *)objc_claimAutoreleasedReturnValue();
      v9 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    }
    else
    {
      v8 = -[AAUIAccountRecoveryViewController initWithAccountManager:]([AAUIAccountRecoveryViewController alloc], "initWithAccountManager:", WeakRetained[1]);
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      if (!WeakRetained[3])
      {
        objc_msgSend(WeakRetained, "_presentWithBasePresentationMode:fromCurrentViewController:completion:", v8, *(_QWORD *)(v11 + 40), *(_QWORD *)(a1 + 40));
        goto LABEL_13;
      }
      v9 = *(void **)(v11 + 40);
    }
    objc_msgSend(v9, "showViewController:sender:", v8, WeakRetained);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_13:

    goto LABEL_14;
  }
  _AAUILogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    __99__AAUIAccountRecoveryManagementHook__showAccountRecoveryManagementWithServerAttributes_completion___block_invoke_cold_2((id *)(a1 + 56), (uint64_t)v5, v10);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_14:

}

- (void)_presentWithBasePresentationMode:(id)a3 fromCurrentViewController:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_opt_class();
  objc_opt_class();
  v10 = v8;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;

  objc_opt_class();
  objc_opt_class();
  objc_msgSend(v11, "hostViewController");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v13 = v12;
  else
    v13 = 0;

  _AAUILogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v25 = v10;
    v26 = 2112;
    v27 = v11;
    v28 = 2112;
    v29 = v13;
    _os_log_impl(&dword_1DB4ED000, v14, OS_LOG_TYPE_DEFAULT, "Base presentation was specified. Dismissing current vc %@ as modal %@ and showing on host %@.", buf, 0x20u);
  }

  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __107__AAUIAccountRecoveryManagementHook__presentWithBasePresentationMode_fromCurrentViewController_completion___block_invoke;
  v19[3] = &unk_1EA2DB8B8;
  v20 = v10;
  v21 = v13;
  v22 = v7;
  v23 = v9;
  v15 = v9;
  v16 = v7;
  v17 = v13;
  v18 = v10;
  objc_msgSend(v18, "dismissViewControllerAnimated:completion:", 1, v19);

}

uint64_t __107__AAUIAccountRecoveryManagementHook__presentWithBasePresentationMode_fromCurrentViewController_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;

  _AAUILogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __107__AAUIAccountRecoveryManagementHook__presentWithBasePresentationMode_fromCurrentViewController_completion___block_invoke_cold_1(a1, v2);

  objc_msgSend(*(id *)(a1 + 40), "pushViewController:animated:", *(_QWORD *)(a1 + 48), 1);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

- (unint64_t)_presentationTypeForString:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D87330]) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D87338]) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D87348]))
  {
    v4 = 2;
  }
  else
  {
    v4 = 1;
  }

  return v4;
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
  objc_storeStrong((id *)&self->_recoveryContactsViewModel, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
}

- (void)_showAccountRecoveryManagementWithServerAttributes:(uint64_t)a1 completion:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1DB4ED000, a2, OS_LOG_TYPE_DEBUG, "Found presentation type %@ from attributes", (uint8_t *)&v2, 0xCu);
}

void __99__AAUIAccountRecoveryManagementHook__showAccountRecoveryManagementWithServerAttributes_completion___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1DB4ED000, log, OS_LOG_TYPE_DEBUG, "Presenting new Recovery Contacts UI", v1, 2u);
}

void __99__AAUIAccountRecoveryManagementHook__showAccountRecoveryManagementWithServerAttributes_completion___block_invoke_cold_2(id *a1, uint64_t a2, NSObject *a3)
{
  id WeakRetained;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained(a1);
  v6 = 138412546;
  v7 = objc_opt_class();
  v8 = 2112;
  v9 = a2;
  _os_log_error_impl(&dword_1DB4ED000, a3, OS_LOG_TYPE_ERROR, "%@ - Unable to validate CDP state. Stopping flow with error %@", (uint8_t *)&v6, 0x16u);

}

void __107__AAUIAccountRecoveryManagementHook__presentWithBasePresentationMode_fromCurrentViewController_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = 138412546;
  v5 = v2;
  v6 = 2112;
  v7 = v3;
  _os_log_debug_impl(&dword_1DB4ED000, a2, OS_LOG_TYPE_DEBUG, "Finished dismissing currentViewController %@, now showing host %@", (uint8_t *)&v4, 0x16u);
}

@end
