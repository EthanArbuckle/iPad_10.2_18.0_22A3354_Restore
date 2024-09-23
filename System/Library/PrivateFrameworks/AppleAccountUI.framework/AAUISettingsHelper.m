@implementation AAUISettingsHelper

+ (void)showAccountRecoveryFromViewController:(id)a3 accountManager:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15[2];
  id location;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  _AAUILogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v18 = v10;
    _os_log_impl(&dword_1DB4ED000, v8, OS_LOG_TYPE_DEFAULT, "%@: Starting Account recovery flow.", buf, 0xCu);

  }
  objc_initWeak((id *)buf, v6);
  objc_initWeak(&location, v7);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __75__AAUISettingsHelper_showAccountRecoveryFromViewController_accountManager___block_invoke;
  v12[3] = &unk_1EA2DD788;
  objc_copyWeak(&v14, (id *)buf);
  objc_copyWeak(v15, &location);
  v11 = v7;
  v13 = v11;
  v15[1] = a1;
  objc_msgSend(a1, "repairPrimaryAppleAccountInViewController:completion:", v6, v12);

  objc_destroyWeak(v15);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)buf);

}

void __75__AAUISettingsHelper_showAccountRecoveryFromViewController_accountManager___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  AAUIAccountRecoveryViewController *v18;
  void *v19;
  id v20;
  AAUIAccountRecoveryViewController *v21;
  id v22;
  NSObject *v23;
  id v24;
  objc_class *v25;
  void *v26;
  id v27;
  id to;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_copyWeak(&to, (id *)(a1 + 40));
  objc_copyWeak(&v27, (id *)(a1 + 48));
  v6 = objc_loadWeakRetained(&to);
  if (v6)
  {
    v7 = objc_loadWeakRetained(&v27);
    if (!v7)
      a2 = 0;

    if (a2)
    {
      v8 = MEMORY[0x1E0C80D38];
      v9 = MEMORY[0x1E0C80D38];
      dispatch_assert_queue_V2(v8);

      if (+[AAUIFeatureFlags isSignInSecurityRedesignEnabled](AAUIFeatureFlags, "isSignInSecurityRedesignEnabled"))
      {
        _AAUILogSystem();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
          __75__AAUISettingsHelper_showAccountRecoveryFromViewController_accountManager___block_invoke_cold_1(v10, v11, v12, v13, v14, v15, v16, v17);

        +[AAUIRecoveryContactsViewFactory createViewModelWithAccountManager:](AAUIRecoveryContactsViewFactory, "createViewModelWithAccountManager:", *(_QWORD *)(a1 + 32));
        v18 = (AAUIAccountRecoveryViewController *)objc_claimAutoreleasedReturnValue();
        +[AAUIRecoveryContactsViewFactory createWithViewModel:](AAUIRecoveryContactsViewFactory, "createWithViewModel:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_loadWeakRetained(&to);
        objc_msgSend(v20, "showViewController:sender:", v19, *(_QWORD *)(a1 + 56));
      }
      else
      {
        v21 = [AAUIAccountRecoveryViewController alloc];
        v22 = objc_loadWeakRetained(&v27);
        v18 = -[AAUIAccountRecoveryViewController initWithAccountManager:](v21, "initWithAccountManager:", v22);

        v20 = objc_loadWeakRetained(&to);
        objc_msgSend(v20, "showViewController:sender:", v18, v20);
        v19 = v20;
      }

    }
  }
  _AAUILogSystem();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    v24 = objc_loadWeakRetained(&to);
    v25 = (objc_class *)objc_opt_class();
    NSStringFromClass(v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v30 = v26;
    v31 = 2112;
    v32 = v5;
    _os_log_impl(&dword_1DB4ED000, v23, OS_LOG_TYPE_DEFAULT, "%@: Account recovery flow completed with error: %@", buf, 0x16u);

  }
  objc_destroyWeak(&v27);
  objc_destroyWeak(&to);

}

+ (void)showAccountRecoveryFromViewController:(id)a3 accountManager:(id)a4 highlightRowIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id v20[2];
  id location;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  _AAUILogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v23 = v13;
    _os_log_impl(&dword_1DB4ED000, v11, OS_LOG_TYPE_DEFAULT, "%@: Starting Account recovery flow.", buf, 0xCu);

  }
  objc_initWeak((id *)buf, v8);
  objc_initWeak(&location, v9);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __98__AAUISettingsHelper_showAccountRecoveryFromViewController_accountManager_highlightRowIdentifier___block_invoke;
  v16[3] = &unk_1EA2DD7B0;
  objc_copyWeak(&v19, (id *)buf);
  objc_copyWeak(v20, &location);
  v14 = v9;
  v17 = v14;
  v20[1] = a1;
  v15 = v10;
  v18 = v15;
  objc_msgSend(a1, "repairPrimaryAppleAccountInViewController:completion:", v8, v16);

  objc_destroyWeak(v20);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)buf);

}

void __98__AAUISettingsHelper_showAccountRecoveryFromViewController_accountManager_highlightRowIdentifier___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  AAUIAccountRecoveryViewController *v18;
  void *v19;
  id v20;
  AAUIAccountRecoveryViewController *v21;
  id v22;
  NSObject *v23;
  id v24;
  objc_class *v25;
  void *v26;
  id v27;
  id to;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_copyWeak(&to, (id *)(a1 + 48));
  objc_copyWeak(&v27, (id *)(a1 + 56));
  v6 = objc_loadWeakRetained(&to);
  if (v6)
  {
    v7 = objc_loadWeakRetained(&v27);
    if (!v7)
      a2 = 0;

    if (a2)
    {
      v8 = MEMORY[0x1E0C80D38];
      v9 = MEMORY[0x1E0C80D38];
      dispatch_assert_queue_V2(v8);

      if (+[AAUIFeatureFlags isSignInSecurityRedesignEnabled](AAUIFeatureFlags, "isSignInSecurityRedesignEnabled"))
      {
        _AAUILogSystem();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
          __75__AAUISettingsHelper_showAccountRecoveryFromViewController_accountManager___block_invoke_cold_1(v10, v11, v12, v13, v14, v15, v16, v17);

        +[AAUIRecoveryContactsViewFactory createViewModelWithAccountManager:](AAUIRecoveryContactsViewFactory, "createViewModelWithAccountManager:", *(_QWORD *)(a1 + 32));
        v18 = (AAUIAccountRecoveryViewController *)objc_claimAutoreleasedReturnValue();
        +[AAUIRecoveryContactsViewFactory createWithViewModel:](AAUIRecoveryContactsViewFactory, "createWithViewModel:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_loadWeakRetained(&to);
        objc_msgSend(v20, "showViewController:sender:", v19, *(_QWORD *)(a1 + 64));
      }
      else
      {
        v21 = [AAUIAccountRecoveryViewController alloc];
        v22 = objc_loadWeakRetained(&v27);
        v18 = -[AAUIAccountRecoveryViewController initWithAccountManager:highlightRowIdentifier:](v21, "initWithAccountManager:highlightRowIdentifier:", v22, *(_QWORD *)(a1 + 40));

        v20 = objc_loadWeakRetained(&to);
        objc_msgSend(v20, "showViewController:sender:", v18, v20);
        v19 = v20;
      }

    }
  }
  _AAUILogSystem();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    v24 = objc_loadWeakRetained(&to);
    v25 = (objc_class *)objc_opt_class();
    NSStringFromClass(v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v30 = v26;
    v31 = 2112;
    v32 = v5;
    _os_log_impl(&dword_1DB4ED000, v23, OS_LOG_TYPE_DEFAULT, "%@: Account recovery flow completed with error: %@", buf, 0x16u);

  }
  objc_destroyWeak(&v27);
  objc_destroyWeak(&to);

}

+ (void)repairPrimaryAppleAccountInViewController:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  AAUIManateeStateValidator *v7;
  AAUID2DEncryptionFlowContext *v8;

  v5 = a4;
  v6 = a3;
  v8 = -[AAUID2DEncryptionFlowContext initWithType:]([AAUID2DEncryptionFlowContext alloc], "initWithType:", 2);
  v7 = -[AAUIManateeStateValidator initWithFlowContext:withPresentingViewController:]([AAUIManateeStateValidator alloc], "initWithFlowContext:withPresentingViewController:", v8, v6);

  -[AAUIManateeStateValidator repairIfPrimaryAppleAccountIsCDP:](v7, "repairIfPrimaryAppleAccountIsCDP:", v5);
}

void __75__AAUISettingsHelper_showAccountRecoveryFromViewController_accountManager___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1DB4ED000, a1, a3, "Presenting new Recovery Contacts UI", a5, a6, a7, a8, 0);
}

@end
