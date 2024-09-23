@implementation AAUIAccountConversionHook

- (BOOL)shouldMatchElement:(id)a3
{
  id v3;
  void *v4;
  char v5;
  void *v6;

  v3 = a3;
  if (+[AAUIFeatureFlags isConvertToMAIDEnabled](AAUIFeatureFlags, "isConvertToMAIDEnabled"))
  {
    objc_msgSend(v3, "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("account:signout")) & 1) != 0)
    {
      v5 = 1;
    }
    else
    {
      objc_msgSend(v3, "name");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v6, "isEqualToString:", CFSTR("account:navigateToSignIn"));

    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)shouldMatchModel:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  char v7;

  v3 = a3;
  if (+[AAUIFeatureFlags isConvertToMAIDEnabled](AAUIFeatureFlags, "isConvertToMAIDEnabled"))
  {
    objc_opt_class();
    objc_msgSend(v3, "clientInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D87308]);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;

    if ((objc_msgSend(v6, "isEqualToString:", CFSTR("account:signout")) & 1) != 0)
      v7 = 1;
    else
      v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("account:navigateToSignIn"));

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  id v15;

  v15 = a3;
  v9 = a4;
  v10 = a6;
  objc_msgSend(v15, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("account:signout"));

  if (v12)
  {
    -[AAUIAccountConversionHook _signOutWithAttributes:completion:](self, "_signOutWithAttributes:completion:", v9, v10);
  }
  else
  {
    objc_msgSend(v15, "name");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("account:navigateToSignIn"));

    if (v14)
      -[AAUIAccountConversionHook _navigateBackToStartWithCompletion:](self, "_navigateBackToStartWithCompletion:", v10);
  }

}

- (void)processObjectModel:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  objc_opt_class();
  objc_msgSend(v11, "clientInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D87308]);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;

  if (objc_msgSend(v9, "isEqualToString:", CFSTR("account:signout")))
  {
    objc_msgSend(v11, "clientInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAUIAccountConversionHook _signOutWithAttributes:completion:](self, "_signOutWithAttributes:completion:", v10, v6);

  }
  else if (objc_msgSend(v9, "isEqualToString:", CFSTR("account:navigateToSignIn")))
  {
    -[AAUIAccountConversionHook _navigateBackToStartWithCompletion:](self, "_navigateBackToStartWithCompletion:", v6);
  }

}

- (void)_signOutWithAttributes:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  id WeakRetained;

  v6 = a4;
  v7 = a3;
  objc_opt_class();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("retainTrust"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v8;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;

  v11 = objc_msgSend(v10, "BOOLValue");
  WeakRetained = objc_loadWeakRetained((id *)&self->delegate);
  objc_msgSend(WeakRetained, "presentationContextForHook:", self);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAUIAccountConversionHook signOutPrimaryAccountWithShouldRetainTrust:viewController:completion:](self, "signOutPrimaryAccountWithShouldRetainTrust:viewController:completion:", v11, v12, v6);

}

- (void)signOutPrimaryAccountWithShouldRetainTrust:(BOOL)a3 viewController:(id)a4 completion:(id)a5
{
  _BOOL4 v6;
  id v8;
  void (**v9)(id, uint64_t, _QWORD);
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  const __CFString *v14;
  NSObject *v15;
  int v16;
  const __CFString *v17;
  uint64_t v18;

  v6 = a3;
  v18 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = (void (**)(id, uint64_t, _QWORD))a5;
  _AAUILogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[AAUIAccountConversionHook signOutPrimaryAccountWithShouldRetainTrust:viewController:completion:].cold.1(v10);

  objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "aa_primaryAppleAccount");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    _AAUILogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = CFSTR("YES");
      if (v6)
        v14 = CFSTR("NO");
      v16 = 138412290;
      v17 = v14;
      _os_log_impl(&dword_1DB4ED000, v13, OS_LOG_TYPE_DEFAULT, "Account Conversion - Initating sign out with intent to remove the AppleAccount : %@", (uint8_t *)&v16, 0xCu);
    }

    -[AAUIAccountConversionHook _signOutAccountsWithAccount:shouldRemoveAppleAccount:viewController:completion:](self, "_signOutAccountsWithAccount:shouldRemoveAppleAccount:viewController:completion:", v12, !v6, v8, v9);
  }
  else
  {
    _AAUILogSystem();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      _os_log_impl(&dword_1DB4ED000, v15, OS_LOG_TYPE_DEFAULT, "Account Conversion - The account has already been removed. Move straight to conversion.", (uint8_t *)&v16, 2u);
    }

    v9[2](v9, 1, 0);
  }

}

- (void)_signOutAccountsWithAccount:(id)a3 shouldRemoveAppleAccount:(BOOL)a4 viewController:(id)a5 completion:(id)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  id v12;
  AAUIAccountConversionSignOutFlowControllerDelegate *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  AIDAServiceOwnerProtocol *v17;
  AIDAServiceOwnerProtocol *serviceOwnersManager;
  AIDAServiceOwnerProtocol *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  id v29;
  BOOL v30;
  id location;
  uint64_t v32;
  _QWORD v33[2];

  v8 = a4;
  v33[1] = *MEMORY[0x1E0C80C00];
  v24 = a3;
  v10 = a5;
  v11 = a6;
  v12 = objc_alloc_init(MEMORY[0x1E0CFCF58]);
  objc_msgSend(v12, "setViewController:", v10);
  v13 = -[AAUIAccountConversionSignOutFlowControllerDelegate initWithPresentingViewController:shouldRemoveAppleAccount:]([AAUIAccountConversionSignOutFlowControllerDelegate alloc], "initWithPresentingViewController:shouldRemoveAppleAccount:", v10, v8);
  v32 = *MEMORY[0x1E0CFCF18];
  v14 = v32;
  v33[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, &v32, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setSignOutContexts:", v15);

  objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (AIDAServiceOwnerProtocol *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFCF68]), "initWithAccountStore:", v16);
  serviceOwnersManager = self->_serviceOwnersManager;
  self->_serviceOwnersManager = v17;

  objc_initWeak(&location, self);
  v19 = self->_serviceOwnersManager;
  v20 = (void *)objc_msgSend(v12, "copy");
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __108__AAUIAccountConversionHook__signOutAccountsWithAccount_shouldRemoveAppleAccount_viewController_completion___block_invoke;
  v25[3] = &unk_1EA2DCAA0;
  objc_copyWeak(&v29, &location);
  v21 = v11;
  v28 = v21;
  v30 = v8;
  v22 = v12;
  v26 = v22;
  v23 = v24;
  v27 = v23;
  -[AIDAServiceOwnerProtocol signOutService:withContext:completion:](v19, "signOutService:withContext:completion:", v14, v20, v25);

  objc_destroyWeak(&v29);
  objc_destroyWeak(&location);

}

void __108__AAUIAccountConversionHook__signOutAccountsWithAccount_shouldRemoveAppleAccount_viewController_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  _QWORD *WeakRetained;
  NSObject *v7;
  NSObject *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  id v32;
  uint8_t buf[4];
  const __CFString *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  _AAUILogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (WeakRetained)
  {
    if (a2)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        if (*(_BYTE *)(a1 + 64))
          v9 = CFSTR("YES");
        else
          v9 = CFSTR("NO");
        *(_DWORD *)buf = 138412290;
        v34 = v9;
        _os_log_impl(&dword_1DB4ED000, v8, OS_LOG_TYPE_DEFAULT, "Account Conversion - Sign Out of iCloud service returned successfully with shouldRemoveAppleAccount: %@", buf, 0xCu);
      }

      v10 = (void *)WeakRetained[1];
      v11 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy");
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __108__AAUIAccountConversionHook__signOutAccountsWithAccount_shouldRemoveAppleAccount_viewController_completion___block_invoke_42;
      v28[3] = &unk_1EA2DCA78;
      objc_copyWeak(&v32, (id *)(a1 + 56));
      v12 = *MEMORY[0x1E0CFCF38];
      v31 = *(id *)(a1 + 48);
      v29 = *(id *)(a1 + 40);
      v30 = *(id *)(a1 + 32);
      objc_msgSend(v10, "signOutService:withContext:completion:", v12, v11, v28);

      objc_destroyWeak(&v32);
    }
    else
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        __108__AAUIAccountConversionHook__signOutAccountsWithAccount_shouldRemoveAppleAccount_viewController_completion___block_invoke_cold_2((uint64_t)v5, v8, v22, v23, v24, v25, v26, v27);

      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __108__AAUIAccountConversionHook__signOutAccountsWithAccount_shouldRemoveAppleAccount_viewController_completion___block_invoke_cold_1(v8, v13, v14, v15, v16, v17, v18, v19);

    v20 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("AAUIConversionToMAIDErrorDomain"), -12001, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v20 + 16))(v20, 0, v21);

  }
}

void __108__AAUIAccountConversionHook__signOutAccountsWithAccount_shouldRemoveAppleAccount_viewController_completion___block_invoke_42(id *a1, int a2, void *a3)
{
  id v5;
  _QWORD *WeakRetained;
  NSObject *v7;
  NSObject *v8;
  const __CFString *v9;
  AAUISignOutUtilities *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  AAUISignOutUtilities *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void (**v24)(id, _QWORD, AAUISignOutUtilities *);
  _QWORD v25[4];
  AAUISignOutUtilities *v26;
  id v27;
  uint8_t buf[4];
  const __CFString *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained(a1 + 7);
  _AAUILogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = CFSTR("NO");
      if (a2)
        v9 = CFSTR("YES");
      *(_DWORD *)buf = 138412546;
      v29 = v9;
      v30 = 2112;
      v31 = v5;
      _os_log_impl(&dword_1DB4ED000, v8, OS_LOG_TYPE_DEFAULT, "Account Conversion - Store sign out completed with success %@, error: %@", buf, 0x16u);
    }

    v10 = objc_alloc_init(AAUISignOutUtilities);
    v11 = WeakRetained[1];
    objc_msgSend(a1[4], "aa_altDSID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "aa_personID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(a1[5], "copy");
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __108__AAUIAccountConversionHook__signOutAccountsWithAccount_shouldRemoveAppleAccount_viewController_completion___block_invoke_44;
    v25[3] = &unk_1EA2DCA50;
    v15 = a1[6];
    v26 = v10;
    v27 = v15;
    v16 = v10;
    -[AAUISignOutUtilities signOutServiceAccountsWithServiceOwnersManager:forAltDSID:DSID:context:completion:](v16, "signOutServiceAccountsWithServiceOwnersManager:forAltDSID:DSID:context:completion:", v11, v12, v13, v14, v25);

  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __108__AAUIAccountConversionHook__signOutAccountsWithAccount_shouldRemoveAppleAccount_viewController_completion___block_invoke_cold_1(v8, v17, v18, v19, v20, v21, v22, v23);

    v24 = (void (**)(id, _QWORD, AAUISignOutUtilities *))a1[6];
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("AAUIConversionToMAIDErrorDomain"), -12001, 0);
    v16 = (AAUISignOutUtilities *)objc_claimAutoreleasedReturnValue();
    v24[2](v24, 0, v16);
  }

}

void __108__AAUIAccountConversionHook__signOutAccountsWithAccount_shouldRemoveAppleAccount_viewController_completion___block_invoke_44(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  const __CFString *v7;
  int v8;
  const __CFString *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _AAUILogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("NO");
    if (a2)
      v7 = CFSTR("YES");
    v8 = 138412546;
    v9 = v7;
    v10 = 2112;
    v11 = v5;
    _os_log_impl(&dword_1DB4ED000, v6, OS_LOG_TYPE_DEFAULT, "Account Conversion - Service accounts sign out completed with success %@, error: %@", (uint8_t *)&v8, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_navigateBackToStartWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __64__AAUIAccountConversionHook__navigateBackToStartWithCompletion___block_invoke;
  v6[3] = &unk_1EA2DB138;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __64__AAUIAccountConversionHook__navigateBackToStartWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  _QWORD block[4];
  id v8;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(WeakRetained, "presentationContextForHook:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "popViewControllerAnimated:", 1);

  dispatch_get_global_queue(25, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__AAUIAccountConversionHook__navigateBackToStartWithCompletion___block_invoke_2;
  block[3] = &unk_1EA2DB0E8;
  v8 = *(id *)(a1 + 40);
  dispatch_async(v6, block);

}

uint64_t __64__AAUIAccountConversionHook__navigateBackToStartWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (RUIServerHookDelegate)delegate
{
  return (RUIServerHookDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->delegate);
  objc_storeStrong((id *)&self->_serviceOwnersManager, 0);
}

- (void)signOutPrimaryAccountWithShouldRetainTrust:(os_log_t)log viewController:completion:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1DB4ED000, log, OS_LOG_TYPE_DEBUG, "Account Conversion - Hook called to sign out the primary account if there is one signed in.", v1, 2u);
}

void __108__AAUIAccountConversionHook__signOutAccountsWithAccount_shouldRemoveAppleAccount_viewController_completion___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1DB4ED000, a1, a3, "%s:Account Conversion - self is nil", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

void __108__AAUIAccountConversionHook__signOutAccountsWithAccount_shouldRemoveAppleAccount_viewController_completion___block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1DB4ED000, a2, a3, "Account Conversion - Didn't remove find my or didn't sign out Apple Account. Discontinuing to sign out or remove accounts. Error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

@end
