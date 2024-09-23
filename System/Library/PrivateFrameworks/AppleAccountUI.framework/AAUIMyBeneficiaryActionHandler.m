@implementation AAUIMyBeneficiaryActionHandler

- (AAUIMyBeneficiaryActionHandler)initWithAccountManager:(id)a3 localContact:(id)a4
{
  id v7;
  id v8;
  AAUIMyBeneficiaryActionHandler *v9;
  AAUIMyBeneficiaryActionHandler *v10;
  AAUISpinnerManager *v11;
  AAUISpinnerManager *spinnerManager;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AAUIMyBeneficiaryActionHandler;
  v9 = -[AAUIMyBeneficiaryActionHandler init](&v14, sel_init);
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
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  AAUISpinnerManager *spinnerManager;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[AIDAAccountManager accounts](self->_accountManager, "accounts");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CFCF18]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    _AAUILogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      -[AALocalContactInfo handle](self->_contact, "handle");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v19 = v11;
      _os_log_impl(&dword_1DB4ED000, v10, OS_LOG_TYPE_DEFAULT, "Removing beneficiary %@.", buf, 0xCu);

    }
    spinnerManager = self->_spinnerManager;
    objc_msgSend(v7, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAUISpinnerManager startSpinnerInSpecifier:forKey:](spinnerManager, "startSpinnerInSpecifier:forKey:", v7, v13);

    v14 = objc_alloc_init(MEMORY[0x1E0D00130]);
    objc_initWeak((id *)buf, self);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __64__AAUIMyBeneficiaryActionHandler_doDestructiveAction_specifier___block_invoke;
    v15[3] = &unk_1EA2DC6D0;
    objc_copyWeak(&v17, (id *)buf);
    v16 = v6;
    objc_msgSend(v14, "aaui_authenticateAccount:forceInteraction:presentingViewController:completion:", v9, 0, v16, v15);

    objc_destroyWeak(&v17);
    objc_destroyWeak((id *)buf);

  }
}

void __64__AAUIMyBeneficiaryActionHandler_doDestructiveAction_specifier___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id WeakRetained;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint8_t v15[16];

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  _AAUILogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!a2 || v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __65__AAUIMyBenefactorActionHandler__showAuthPromptInViewController___block_invoke_cold_1((uint64_t)v5, v8, v9, v10, v11, v12, v13, v14);

    objc_msgSend(WeakRetained, "_stopAllSpinners");
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_1DB4ED000, v8, OS_LOG_TYPE_DEFAULT, "Authentication successful, continue removing beneficiary...", v15, 2u);
    }

    objc_msgSend(WeakRetained, "_doBeneficiaryRemoveWithViewController:", *(_QWORD *)(a1 + 32));
  }

}

- (void)doPrimaryAction:(id)a3 specifier:(id)a4
{
  id v6;

  v6 = a3;
  -[AAUIMyBeneficiaryActionHandler _startSpinnerInSpecifier:](self, "_startSpinnerInSpecifier:", a4);
  -[AAUIMyBeneficiaryActionHandler _showAuthPromptInViewController:](self, "_showAuthPromptInViewController:", v6);

}

- (void)_doBeneficiaryRemoveWithViewController:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = objc_alloc_init(MEMORY[0x1E0CFAC88]);
  -[AALocalContactInfo inheritanceContactInfo](self->_contact, "inheritanceContactInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __73__AAUIMyBeneficiaryActionHandler__doBeneficiaryRemoveWithViewController___block_invoke;
  v8[3] = &unk_1EA2DD7D8;
  objc_copyWeak(&v10, &location);
  v8[4] = self;
  v7 = v4;
  v9 = v7;
  objc_msgSend(v5, "removeBeneficiary:manifest:completion:", v6, 0, v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __73__AAUIMyBeneficiaryActionHandler__doBeneficiaryRemoveWithViewController___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  _AAUILogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      __73__AAUIMyBeneficiaryActionHandler__doBeneficiaryRemoveWithViewController___block_invoke_cold_1(v6);

    goto LABEL_10;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __73__AAUIMyBeneficiaryActionHandler__doBeneficiaryRemoveWithViewController___block_invoke_cold_2((uint64_t)v3, v6, v7, v8, v9, v10, v11, v12);

  objc_msgSend(WeakRetained, "_stopAllSpinners");
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
  block[2] = __53__AAUIMyBeneficiaryActionHandler__popViewController___block_invoke;
  block[3] = &unk_1EA2DB208;
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __53__AAUIMyBeneficiaryActionHandler__popViewController___block_invoke(uint64_t a1)
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
  v21[2] = __45__AAUIMyBeneficiaryActionHandler__showAlert___block_invoke;
  v21[3] = &unk_1EA2DB868;
  v14 = v3;
  v22 = v14;
  objc_msgSend(v12, "actionWithTitle:style:handler:", v11, 0, v21);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addAction:", v15);

  block[0] = v13;
  block[1] = 3221225472;
  block[2] = __45__AAUIMyBeneficiaryActionHandler__showAlert___block_invoke_3;
  block[3] = &unk_1EA2DB778;
  v19 = v14;
  v20 = v9;
  v16 = v9;
  v17 = v14;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __45__AAUIMyBeneficiaryActionHandler__showAlert___block_invoke(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__AAUIMyBeneficiaryActionHandler__showAlert___block_invoke_2;
  block[3] = &unk_1EA2DB208;
  v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __45__AAUIMyBeneficiaryActionHandler__showAlert___block_invoke_2(uint64_t a1)
{
  id v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "navigationController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v1 = (id)objc_msgSend(v2, "popViewControllerAnimated:", 1);

}

uint64_t __45__AAUIMyBeneficiaryActionHandler__showAlert___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", *(_QWORD *)(a1 + 40), 1, 0);
}

- (void)_showAuthPromptInViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
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

  v7 = objc_alloc_init(MEMORY[0x1E0D00130]);
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __66__AAUIMyBeneficiaryActionHandler__showAuthPromptInViewController___block_invoke;
  v9[3] = &unk_1EA2DC6D0;
  objc_copyWeak(&v11, &location);
  v8 = v4;
  v10 = v8;
  objc_msgSend(v7, "aaui_beneficiaryViewAccessKeyForAccount:presentingViewController:completion:", v6, v8, v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __66__AAUIMyBeneficiaryActionHandler__showAuthPromptInViewController___block_invoke(uint64_t a1, uint64_t a2, void *a3)
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
      v16[2] = __66__AAUIMyBeneficiaryActionHandler__showAuthPromptInViewController___block_invoke_40;
      v16[3] = &unk_1EA2DB778;
      v16[4] = v7;
      v17 = *(id *)(a1 + 32);
      dispatch_async(MEMORY[0x1E0C80D38], v16);

    }
  }

}

uint64_t __66__AAUIMyBeneficiaryActionHandler__showAuthPromptInViewController___block_invoke_40(uint64_t a1)
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
  block[2] = __59__AAUIMyBeneficiaryActionHandler__startSpinnerInSpecifier___block_invoke;
  block[3] = &unk_1EA2DB728;
  objc_copyWeak(&v8, &location);
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __59__AAUIMyBeneficiaryActionHandler__startSpinnerInSpecifier___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  _QWORD *v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = (void *)WeakRetained[1];
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
  v2[2] = __50__AAUIMyBeneficiaryActionHandler__stopAllSpinners__block_invoke;
  v2[3] = &unk_1EA2DBC18;
  objc_copyWeak(&v3, &location);
  dispatch_async(MEMORY[0x1E0C80D38], v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

void __50__AAUIMyBeneficiaryActionHandler__stopAllSpinners__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained[1], "stopAllSpinners");
    WeakRetained = v2;
  }

}

- (AIDAAccountManager)accountManager
{
  return self->_accountManager;
}

- (AALocalContactInfo)contact
{
  return self->_contact;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
  objc_storeStrong((id *)&self->_spinnerManager, 0);
}

void __73__AAUIMyBeneficiaryActionHandler__doBeneficiaryRemoveWithViewController___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1DB4ED000, log, OS_LOG_TYPE_DEBUG, "Successfully removed Beneficiary", v1, 2u);
}

void __73__AAUIMyBeneficiaryActionHandler__doBeneficiaryRemoveWithViewController___block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1DB4ED000, a2, a3, "Error removing Beneficiary - %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

@end
