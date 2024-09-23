@implementation AAUIMyBenefactorActionHandler

- (AAUIMyBenefactorActionHandler)initWithAccountManager:(id)a3 localContact:(id)a4
{
  id v7;
  id v8;
  AAUIMyBenefactorActionHandler *v9;
  AAUIMyBenefactorActionHandler *v10;
  AAUISpinnerManager *v11;
  AAUISpinnerManager *spinnerManager;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AAUIMyBenefactorActionHandler;
  v9 = -[AAUIMyBenefactorActionHandler init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_accountManager, a3);
    objc_storeStrong((id *)&v10->_contact, a4);
    v11 = objc_alloc_init(AAUISpinnerManager);
    spinnerManager = v10->_spinnerManager;
    v10->_spinnerManager = v11;

  }
  return v10;
}

- (void)doDestructiveAction:(id)a3 specifier:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v5 = a3;
  v6 = (void *)objc_opt_new();
  -[AALocalContactInfo inheritanceContactInfo](self->_contact, "inheritanceContactInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __63__AAUIMyBenefactorActionHandler_doDestructiveAction_specifier___block_invoke;
  v9[3] = &unk_1EA2DC6A8;
  v9[4] = self;
  v10 = v5;
  v8 = v5;
  objc_msgSend(v6, "removeBenefactor:completion:", v7, v9);

}

void __63__AAUIMyBenefactorActionHandler_doDestructiveAction_specifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = a2;
  _AAUILogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __63__AAUIMyBenefactorActionHandler_doDestructiveAction_specifier___block_invoke_cold_1(v5);

    goto LABEL_10;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __63__AAUIMyBenefactorActionHandler_doDestructiveAction_specifier___block_invoke_cold_2((uint64_t)v3, v5, v6, v7, v8, v9, v10, v11);

  if (objc_msgSend(v3, "code") != 2110 && objc_msgSend(v3, "code") != 2111)
  {
LABEL_10:
    objc_msgSend(*(id *)(a1 + 32), "_popViewController:", *(_QWORD *)(a1 + 40));
    goto LABEL_11;
  }
  objc_msgSend(*(id *)(a1 + 32), "_showAlert:", *(_QWORD *)(a1 + 40));
LABEL_11:

}

- (void)_popViewController:(id)a3
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;

  v3 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__AAUIMyBenefactorActionHandler__popViewController___block_invoke;
  block[3] = &unk_1EA2DB208;
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __52__AAUIMyBenefactorActionHandler__popViewController___block_invoke(uint64_t a1)
{
  id v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "navigationController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v1 = (id)objc_msgSend(v2, "popViewControllerAnimated:", 1);

}

- (void)_showAlert:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  _QWORD block[4];
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;

  v3 = a3;
  v4 = (void *)MEMORY[0x1E0DC3450];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("LEGACY_CONTACT_DELETION_FAILURE_ALERT_TITLE"), &stru_1EA2E2A18, CFSTR("Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("LEGACY_CONTACT_DELETION_FAILURE_ALERT_MESSAGE"), &stru_1EA2E2A18, CFSTR("Localizable"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alertWithTitle:message:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1EA2E2A18, CFSTR("Localizable"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0DC3448];
  v13 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __44__AAUIMyBenefactorActionHandler__showAlert___block_invoke;
  v21[3] = &unk_1EA2DB868;
  v14 = v3;
  v22 = v14;
  objc_msgSend(v12, "actionWithTitle:style:handler:", v11, 0, v21);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addAction:", v15);

  block[0] = v13;
  block[1] = 3221225472;
  block[2] = __44__AAUIMyBenefactorActionHandler__showAlert___block_invoke_3;
  block[3] = &unk_1EA2DB778;
  v19 = v14;
  v20 = v9;
  v16 = v9;
  v17 = v14;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __44__AAUIMyBenefactorActionHandler__showAlert___block_invoke(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__AAUIMyBenefactorActionHandler__showAlert___block_invoke_2;
  block[3] = &unk_1EA2DB208;
  v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __44__AAUIMyBenefactorActionHandler__showAlert___block_invoke_2(uint64_t a1)
{
  id v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "navigationController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v1 = (id)objc_msgSend(v2, "popViewControllerAnimated:", 1);

}

uint64_t __44__AAUIMyBenefactorActionHandler__showAlert___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", *(_QWORD *)(a1 + 40), 1, 0);
}

- (void)doPrimaryAction:(id)a3 specifier:(id)a4
{
  id v6;

  v6 = a3;
  -[AAUIMyBenefactorActionHandler _startSpinnerInSpecifier:](self, "_startSpinnerInSpecifier:", a4);
  -[AAUIMyBenefactorActionHandler _showAuthPromptInViewController:](self, "_showAuthPromptInViewController:", v6);

}

- (void)_showAuthPromptInViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  v4 = a3;
  -[AIDAAccountManager accounts](self->_accountManager, "accounts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CFCF18]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_opt_new();
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __65__AAUIMyBenefactorActionHandler__showAuthPromptInViewController___block_invoke;
  v9[3] = &unk_1EA2DC6D0;
  objc_copyWeak(&v11, &location);
  v8 = v4;
  v10 = v8;
  objc_msgSend(v7, "aaui_authenticateAccount:forceInteraction:presentingViewController:completion:", v6, 1, v8, v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __65__AAUIMyBenefactorActionHandler__showAuthPromptInViewController___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[5];
  id v17;
  uint8_t buf[16];

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_stopAllSpinners");
    _AAUILogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (!a2 || v5)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        __65__AAUIMyBenefactorActionHandler__showAuthPromptInViewController___block_invoke_cold_1((uint64_t)v5, v9, v10, v11, v12, v13, v14, v15);

    }
    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DB4ED000, v9, OS_LOG_TYPE_DEFAULT, "Authentication successful, continuing to show Access Key...", buf, 2u);
      }

      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __65__AAUIMyBenefactorActionHandler__showAuthPromptInViewController___block_invoke_39;
      v16[3] = &unk_1EA2DB778;
      v16[4] = v7;
      v17 = *(id *)(a1 + 32);
      dispatch_async(MEMORY[0x1E0C80D38], v16);

    }
  }

}

uint64_t __65__AAUIMyBenefactorActionHandler__showAuthPromptInViewController___block_invoke_39(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_navigateToAccessKeyScreenFromViewController:", *(_QWORD *)(a1 + 40));
}

- (void)_navigateToAccessKeyScreenFromViewController:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  AAUIShowAccessKeyViewController *v13;
  void *v14;
  id v15;

  v4 = (objc_class *)MEMORY[0x1E0CFAC80];
  v5 = a3;
  v6 = [v4 alloc];
  -[AALocalContactInfo inheritanceContactInfo](self->_contact, "inheritanceContactInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (id)objc_msgSend(v6, "initWithContactInfo:contactType:", v7, -[AALocalContactInfo contactType](self->_contact, "contactType"));

  objc_msgSend(v15, "accessKeyString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "accessKeyQRCodeImageDataWithSize:", 155.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "imageWithData:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AIDAAccountManager accounts](self->_accountManager, "accounts");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0CFCF18]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[AAUIShowAccessKeyViewController initWithAppleAccount:localContactInfo:accessKey:accessKeyQRCodeImage:]([AAUIShowAccessKeyViewController alloc], "initWithAppleAccount:localContactInfo:accessKey:accessKeyQRCodeImage:", v12, self->_contact, v8, v10);
  objc_msgSend(v5, "navigationController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "showViewController:sender:", v13, 0);
}

- (void)doSecondaryAction:(id)a3 specifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  AAUIGrandSlamRemoteUIPresenter *v20;
  AAUIGrandSlamRemoteUIPresenter *remoteUIPresenter;
  AAUIGrandSlamRemoteUIPresenter *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint8_t v38[16];
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  _AAUILogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DB4ED000, v8, OS_LOG_TYPE_DEFAULT, "Request Access Tapped. Beginning Beneficiary Claim RUI...", buf, 2u);
  }

  v9 = objc_alloc(MEMORY[0x1E0CFAC80]);
  -[AALocalContactInfo inheritanceContactInfo](self->_contact, "inheritanceContactInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithContactInfo:contactType:", v10, -[AALocalContactInfo contactType](self->_contact, "contactType"));

  -[AIDAAccountManager accountStore](self->_accountManager, "accountStore");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[AIDAAccountManager accounts](self->_accountManager, "accounts");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0CFCF18]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v12, "aida_accountForiCloudAccount:", v14);
    v15 = objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v16 = objc_alloc(MEMORY[0x1E0CFABC8]);
      objc_msgSend(v11, "claimTokenString");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "initWithGrandSlamAccount:accountStore:claimCode:", v15, v12, v17);

      -[AAUIMyBenefactorActionHandler _startSpinnerInSpecifier:](self, "_startSpinnerInSpecifier:", v7);
      _AAUILogSystem();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v38 = 0;
        _os_log_impl(&dword_1DB4ED000, v19, OS_LOG_TYPE_DEFAULT, "Presenting Beneficiary Claim RUI...", v38, 2u);
      }

      v20 = -[AAUIGrandSlamRemoteUIPresenter initWithAccountManager:presenter:]([AAUIGrandSlamRemoteUIPresenter alloc], "initWithAccountManager:presenter:", self->_accountManager, v6);
      remoteUIPresenter = self->_remoteUIPresenter;
      self->_remoteUIPresenter = v20;

      -[AAUIGrandSlamRemoteUIPresenter setDelegate:](self->_remoteUIPresenter, "setDelegate:", self);
      v22 = self->_remoteUIPresenter;
      -[NSObject urlRequest](v18, "urlRequest");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[AAUIGrandSlamRemoteUIPresenter loadRequest:](v22, "loadRequest:", v23);

    }
    else
    {
      _AAUILogSystem();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[AAUIMyBenefactorActionHandler doSecondaryAction:specifier:].cold.2(v18, v31, v32, v33, v34, v35, v36, v37);
    }

  }
  else
  {
    _AAUILogSystem();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[AAUIMyBenefactorActionHandler doSecondaryAction:specifier:].cold.1(v15, v24, v25, v26, v27, v28, v29, v30);
  }

}

- (void)_startSpinnerInSpecifier:(id)a3
{
  id v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__AAUIMyBenefactorActionHandler__startSpinnerInSpecifier___block_invoke;
  block[3] = &unk_1EA2DB728;
  objc_copyWeak(&v8, &location);
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __58__AAUIMyBenefactorActionHandler__startSpinnerInSpecifier___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  _QWORD *v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = (void *)WeakRetained[3];
    v4 = *(void **)(a1 + 32);
    v6 = WeakRetained;
    objc_msgSend(v4, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "startSpinnerInSpecifier:forKey:", v4, v5);

    WeakRetained = v6;
  }

}

- (void)_stopAllSpinners
{
  _QWORD v2[4];
  id v3;
  id location;

  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __49__AAUIMyBenefactorActionHandler__stopAllSpinners__block_invoke;
  v2[3] = &unk_1EA2DBC18;
  objc_copyWeak(&v3, &location);
  dispatch_async(MEMORY[0x1E0C80D38], v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

void __49__AAUIMyBenefactorActionHandler__stopAllSpinners__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained[3], "stopAllSpinners");
    WeakRetained = v2;
  }

}

- (void)remoteUIRequestComplete:(id)a3 error:(id)a4
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v5 = a4;
  if (v5)
  {
    _AAUILogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[AAUIMyBenefactorActionHandler remoteUIRequestComplete:error:].cold.1((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12);

  }
  -[AAUIMyBenefactorActionHandler _stopAllSpinners](self, "_stopAllSpinners");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteUIPresenter, 0);
  objc_storeStrong((id *)&self->_spinnerManager, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
}

void __63__AAUIMyBenefactorActionHandler_doDestructiveAction_specifier___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1DB4ED000, log, OS_LOG_TYPE_DEBUG, "Successfully removed Benefactor", v1, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __63__AAUIMyBenefactorActionHandler_doDestructiveAction_specifier___block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1DB4ED000, a2, a3, "Error removing Benefactor - %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

void __65__AAUIMyBenefactorActionHandler__showAuthPromptInViewController___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1DB4ED000, a2, a3, "Unable to authenticate: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)doSecondaryAction:(uint64_t)a3 specifier:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1DB4ED000, a1, a3, "Could not fetch Apple Account", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

- (void)doSecondaryAction:(uint64_t)a3 specifier:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1DB4ED000, a1, a3, "Could not fetch GrandSlam Account", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

- (void)remoteUIRequestComplete:(uint64_t)a3 error:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1DB4ED000, a2, a3, "Beneficiary Claim flow completed with error : %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

@end
