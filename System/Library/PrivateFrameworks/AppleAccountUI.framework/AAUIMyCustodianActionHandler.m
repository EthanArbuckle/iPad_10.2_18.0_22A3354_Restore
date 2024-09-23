@implementation AAUIMyCustodianActionHandler

- (AAUIMyCustodianActionHandler)initWithAccountManager:(id)a3 localContact:(id)a4
{
  id v7;
  id v8;
  AAUIMyCustodianActionHandler *v9;
  AAUIMyCustodianActionHandler *v10;
  uint64_t v11;
  AAUISpinnerManager *spinnerManager;
  id v13;
  AAUIDTOHelper *v14;
  AAUIDTOHelper *dtoHelper;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)AAUIMyCustodianActionHandler;
  v9 = -[AAUIMyCustodianActionHandler init](&v17, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_contact, a4);
    objc_storeStrong((id *)&v10->_accountManager, a3);
    v11 = objc_opt_new();
    spinnerManager = v10->_spinnerManager;
    v10->_spinnerManager = (AAUISpinnerManager *)v11;

    v13 = objc_alloc_init(MEMORY[0x1E0D001A0]);
    v14 = -[AAUIDTOHelper initWithDTOController:]([AAUIDTOHelper alloc], "initWithDTOController:", v13);
    dtoHelper = v10->_dtoHelper;
    v10->_dtoHelper = v14;

  }
  return v10;
}

- (void)doDestructiveAction:(id)a3 specifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  AAUIDTOHelper *dtoHelper;
  void *v11;
  NSObject *v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  -[AIDAAccountManager accounts](self->_accountManager, "accounts");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CFCF18]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    dtoHelper = self->_dtoHelper;
    objc_msgSend(v9, "aa_altDSID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __62__AAUIMyCustodianActionHandler_doDestructiveAction_specifier___block_invoke;
    v13[3] = &unk_1EA2DD5D8;
    v13[4] = self;
    v14 = v6;
    v15 = v7;
    v16 = v9;
    -[AAUIDTOHelper shouldGateUsingRatchetForAltDSID:completion:](dtoHelper, "shouldGateUsingRatchetForAltDSID:completion:", v11, v13);

  }
  else
  {
    _AAUILogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[AAUIRecoveryFactorController startAddingRecoveryContact].cold.1();

  }
}

void __62__AAUIMyCustodianActionHandler_doDestructiveAction_specifier___block_invoke(uint64_t a1, int a2)
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD block[5];
  _QWORD v11[5];
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  if (a2)
  {
    _AAUILogSystem();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      __62__AAUIMyCustodianActionHandler_doDestructiveAction_specifier___block_invoke_cold_2();

    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "isDTOGatingEnabled"))
    {
      _AAUILogSystem();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
        __62__AAUIMyCustodianActionHandler_doDestructiveAction_specifier___block_invoke_cold_1();

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "makeRatchetContextWithPresentationContext:DTOContextType:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32), 2);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(a1 + 32);
      v7 = *(void **)(a1 + 40);
      v8 = *(void **)(v6 + 48);
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __62__AAUIMyCustodianActionHandler_doDestructiveAction_specifier___block_invoke_25;
      v15[3] = &unk_1EA2DD5B0;
      v15[4] = v6;
      v16 = v7;
      v17 = *(id *)(a1 + 48);
      v18 = *(id *)(a1 + 56);
      objc_msgSend(v8, "shouldAllowOpForContext:completion:", v5, v15);

    }
    else
    {
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __62__AAUIMyCustodianActionHandler_doDestructiveAction_specifier___block_invoke_2;
      v11[3] = &unk_1EA2DD588;
      v9 = *(void **)(a1 + 40);
      v11[4] = *(_QWORD *)(a1 + 32);
      v12 = v9;
      v13 = *(id *)(a1 + 48);
      v14 = *(id *)(a1 + 56);
      dispatch_async(MEMORY[0x1E0C80D38], v11);

    }
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __62__AAUIMyCustodianActionHandler_doDestructiveAction_specifier___block_invoke_29;
    block[3] = &unk_1EA2DB208;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

void __62__AAUIMyCustodianActionHandler_doDestructiveAction_specifier___block_invoke_25(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  id v10;
  id v11;

  v5 = a3;
  _AAUILogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    __58__AAUIRecoveryFactorController_startAddingRecoveryContact__block_invoke_24_cold_1(a2, (uint64_t)v5, v6);

  if (a2)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __62__AAUIMyCustodianActionHandler_doDestructiveAction_specifier___block_invoke_26;
    v8[3] = &unk_1EA2DD588;
    v7 = *(void **)(a1 + 40);
    v8[4] = *(_QWORD *)(a1 + 32);
    v9 = v7;
    v10 = *(id *)(a1 + 48);
    v11 = *(id *)(a1 + 56);
    dispatch_async(MEMORY[0x1E0C80D38], v8);

  }
}

uint64_t __62__AAUIMyCustodianActionHandler_doDestructiveAction_specifier___block_invoke_26(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_continueDoingDestructiveAction:specifier:account:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

uint64_t __62__AAUIMyCustodianActionHandler_doDestructiveAction_specifier___block_invoke_2(uint64_t a1)
{
  NSObject *v2;

  _AAUILogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __58__AAUIRecoveryFactorController_startAddingRecoveryContact__block_invoke_2_cold_1();

  return objc_msgSend(*(id *)(a1 + 32), "_continueDoingDestructiveAction:specifier:account:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

uint64_t __62__AAUIMyCustodianActionHandler_doDestructiveAction_specifier___block_invoke_29(uint64_t a1)
{
  NSObject *v2;

  _AAUILogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __58__AAUIRecoveryFactorController_startAddingRecoveryContact__block_invoke_28_cold_1();

  return objc_msgSend(*(id *)(a1 + 32), "_displayCustodianDeleteNotAllowedAlert");
}

- (void)_continueDoingDestructiveAction:(id)a3 specifier:(id)a4 account:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  AAUISpinnerManager *spinnerManager;
  void *v14;
  _BOOL8 v15;
  void *v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  _AAUILogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    -[AALocalContactInfo handle](self->_contact, "handle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v22 = v12;
    _os_log_impl(&dword_1DB4ED000, v11, OS_LOG_TYPE_DEFAULT, "Removing custodian %@.", buf, 0xCu);

  }
  spinnerManager = self->_spinnerManager;
  objc_msgSend(v9, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAUISpinnerManager startSpinnerInSpecifier:forKey:](spinnerManager, "startSpinnerInSpecifier:forKey:", v9, v14);

  objc_initWeak((id *)buf, self);
  v15 = -[AAUIMyCustodianActionHandler _isWalrusEnabled](self, "_isWalrusEnabled");
  v16 = (void *)objc_opt_new();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __82__AAUIMyCustodianActionHandler__continueDoingDestructiveAction_specifier_account___block_invoke;
  v18[3] = &unk_1EA2DD600;
  objc_copyWeak(&v20, (id *)buf);
  v18[4] = self;
  v17 = v8;
  v19 = v17;
  objc_msgSend(v16, "aaui_authenticateAccount:forceInteraction:presentingViewController:completion:", v10, v15, v17, v18);

  objc_destroyWeak(&v20);
  objc_destroyWeak((id *)buf);

}

void __82__AAUIMyCustodianActionHandler__continueDoingDestructiveAction_specifier_account___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id WeakRetained;
  NSObject *v7;
  NSObject *v8;
  uint8_t v9[16];

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  _AAUILogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!a2 || v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __82__AAUIMyCustodianActionHandler__continueDoingDestructiveAction_specifier_account___block_invoke_cold_1();

    objc_msgSend(WeakRetained, "_stopSpinners");
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1DB4ED000, v8, OS_LOG_TYPE_DEFAULT, "Authentication successful, continue removing custodian...", v9, 2u);
    }

    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 32), *(id *)(a1 + 40));
    objc_msgSend(WeakRetained, "_doCustodianRemove");
  }

}

- (void)_doCustodianRemove
{
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;
  id location;

  objc_initWeak(&location, self);
  v3 = (void *)objc_opt_new();
  -[AALocalContactInfo custodianID](self->_contact, "custodianID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50__AAUIMyCustodianActionHandler__doCustodianRemove__block_invoke;
  v5[3] = &unk_1EA2DBD48;
  objc_copyWeak(&v6, &location);
  v5[4] = self;
  objc_msgSend(v3, "removeCustodian:completion:", v4, v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __50__AAUIMyCustodianActionHandler__doCustodianRemove__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  _QWORD block[6];
  id v7;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (v3)
  {
    _AAUILogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __50__AAUIMyCustodianActionHandler__doCustodianRemove__block_invoke_cold_1();

    objc_msgSend(WeakRetained, "_stopSpinners");
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __50__AAUIMyCustodianActionHandler__doCustodianRemove__block_invoke_34;
    block[3] = &unk_1EA2DD650;
    block[4] = *(_QWORD *)(a1 + 32);
    objc_copyWeak(&v7, (id *)(a1 + 40));
    block[5] = WeakRetained;
    dispatch_async(MEMORY[0x1E0C80D38], block);
    objc_destroyWeak(&v7);
  }

}

void __50__AAUIMyCustodianActionHandler__doCustodianRemove__block_invoke_34(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;

  if (objc_msgSend(*(id *)(a1 + 32), "_isWalrusEnabled"))
  {
    v2 = *(void **)(a1 + 32);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __50__AAUIMyCustodianActionHandler__doCustodianRemove__block_invoke_2;
    v5[3] = &unk_1EA2DD628;
    objc_copyWeak(&v6, (id *)(a1 + 48));
    objc_msgSend(v2, "_checkRecoveryContactAndRecoveryKeyStatus:", v5);
    objc_destroyWeak(&v6);
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "stopAllSpinners");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "navigationController");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    v3 = (id)objc_msgSend(v4, "popViewControllerAnimated:", 1);

  }
}

void __50__AAUIMyCustodianActionHandler__doCustodianRemove__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v6 = WeakRetained;
    objc_msgSend(WeakRetained, "_updateUIAfterDeleteWithHasRecoveryContact:hasRecoveryKey:", a2, a3);
    WeakRetained = v6;
  }

}

- (id)_recoveryFactorController
{
  AAUIRecoveryFactorController *recoveryFactorController;
  AAUIRecoveryFactorController *v4;
  AAUIRecoveryFactorController *v5;

  recoveryFactorController = self->_recoveryFactorController;
  if (!recoveryFactorController)
  {
    v4 = -[AAUIRecoveryFactorController initWithAccountManager:presentingViewController:]([AAUIRecoveryFactorController alloc], "initWithAccountManager:presentingViewController:", self->_accountManager, self->_presentingViewController);
    v5 = self->_recoveryFactorController;
    self->_recoveryFactorController = v4;

    -[AAUIRecoveryFactorController setDelegate:](self->_recoveryFactorController, "setDelegate:", self);
    -[AAUIRecoveryFactorController setForceInlinePresentation:](self->_recoveryFactorController, "setForceInlinePresentation:", 0);
    recoveryFactorController = self->_recoveryFactorController;
  }
  return recoveryFactorController;
}

- (BOOL)_isWalrusEnabled
{
  id v2;
  uint64_t v3;
  id v4;
  NSObject *v5;
  BOOL v6;
  id v8;

  v2 = objc_alloc_init(MEMORY[0x1E0D15788]);
  v8 = 0;
  v3 = objc_msgSend(v2, "walrusStatus:", &v8);
  v4 = v8;
  if (v4)
  {
    _AAUILogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[AAUIMyCustodianActionHandler _isWalrusEnabled].cold.1();

    v6 = 0;
  }
  else
  {
    v6 = v3 == 1;
  }

  return v6;
}

- (void)_dismissAndPopFromRecoveryContactRemovedScreen
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __78__AAUIMyCustodianActionHandler__dismissAndPopFromRecoveryContactRemovedScreen__block_invoke;
  v2[3] = &unk_1EA2DB208;
  v2[4] = self;
  -[AAUIMyCustodianActionHandler _dismissRecoveryContactRemovedScreenWithCompletion:](self, "_dismissRecoveryContactRemovedScreenWithCompletion:", v2);
}

uint64_t __78__AAUIMyCustodianActionHandler__dismissAndPopFromRecoveryContactRemovedScreen__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_popToAccountRecoveryScreen");
}

- (void)_performHealthCheck
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x1E0CFAC10]);
  objc_msgSend(v2, "startHealthCheckWithCompletion:", &__block_literal_global_20);

}

void __51__AAUIMyCustodianActionHandler__performHealthCheck__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (v2)
  {
    _AAUILogSystem();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __115__AAUIRecoveryFactorController__handleRecoveryKeyOperationResultWithSuccess_error_operationDescription_completion___block_invoke_cold_1();

  }
}

- (void)_dismissAndStartHealthCheck
{
  -[AAUIMyCustodianActionHandler _dismissAndPopFromRecoveryContactRemovedScreen](self, "_dismissAndPopFromRecoveryContactRemovedScreen");
  -[AAUIMyCustodianActionHandler _performHealthCheck](self, "_performHealthCheck");
}

- (void)_popToAccountRecoveryScreen
{
  id v2;
  id v3;

  -[UIViewController navigationController](self->_presentingViewController, "navigationController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v3, "popViewControllerAnimated:", 0);

}

- (void)_dismissRecoveryContactRemovedScreenWithCompletion:(id)a3
{
  id v4;
  OBNavigationController *recoveryContactRemovedNavigationController;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  recoveryContactRemovedNavigationController = self->_recoveryContactRemovedNavigationController;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __83__AAUIMyCustodianActionHandler__dismissRecoveryContactRemovedScreenWithCompletion___block_invoke;
  v7[3] = &unk_1EA2DB0E8;
  v8 = v4;
  v6 = v4;
  -[OBNavigationController dismissViewControllerAnimated:completion:](recoveryContactRemovedNavigationController, "dismissViewControllerAnimated:completion:", 1, v7);

}

uint64_t __83__AAUIMyCustodianActionHandler__dismissRecoveryContactRemovedScreenWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_addRecoveryContact
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __51__AAUIMyCustodianActionHandler__addRecoveryContact__block_invoke;
  v2[3] = &unk_1EA2DB208;
  v2[4] = self;
  -[AAUIMyCustodianActionHandler _dismissRecoveryContactRemovedScreenWithCompletion:](self, "_dismissRecoveryContactRemovedScreenWithCompletion:", v2);
}

void __51__AAUIMyCustodianActionHandler__addRecoveryContact__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "_recoveryFactorController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "startAddingRecoveryContact");

}

- (void)_setupRecoveryKey
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __49__AAUIMyCustodianActionHandler__setupRecoveryKey__block_invoke;
  v2[3] = &unk_1EA2DB208;
  v2[4] = self;
  -[AAUIMyCustodianActionHandler _dismissRecoveryContactRemovedScreenWithCompletion:](self, "_dismissRecoveryContactRemovedScreenWithCompletion:", v2);
}

void __49__AAUIMyCustodianActionHandler__setupRecoveryKey__block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "_recoveryFactorController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __49__AAUIMyCustodianActionHandler__setupRecoveryKey__block_invoke_2;
  v3[3] = &unk_1EA2DCEC0;
  objc_copyWeak(&v4, &location);
  objc_msgSend(v2, "generateRecoveryKeyWithCompletion:", v3);

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __49__AAUIMyCustodianActionHandler__setupRecoveryKey__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id WeakRetained;
  NSObject *v6;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (v4)
  {
    _AAUILogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __49__AAUIMyCustodianActionHandler__setupRecoveryKey__block_invoke_2_cold_1();

  }
  objc_msgSend(WeakRetained, "_popToAccountRecoveryScreen");

}

- (void)_checkRecoveryContactAndRecoveryKeyStatus:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  id v10;
  _QWORD block[4];
  id v12;
  _QWORD *v13;
  _QWORD *v14;
  _QWORD v15[4];
  NSObject *v16;
  _QWORD *v17;
  _QWORD v18[4];
  NSObject *v19;
  _QWORD *v20;
  _QWORD v21[3];
  char v22;
  _QWORD v23[3];
  char v24;

  v3 = a3;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  v24 = 0;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  v22 = 0;
  v4 = (void *)objc_opt_new();
  v5 = dispatch_group_create();
  dispatch_group_enter(v5);
  v6 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __74__AAUIMyCustodianActionHandler__checkRecoveryContactAndRecoveryKeyStatus___block_invoke;
  v18[3] = &unk_1EA2DD698;
  v20 = v23;
  v7 = v5;
  v19 = v7;
  objc_msgSend(v4, "fetchMyHealthyCustodians:", v18);
  v8 = (void *)objc_opt_new();
  dispatch_group_enter(v7);
  v15[0] = v6;
  v15[1] = 3221225472;
  v15[2] = __74__AAUIMyCustodianActionHandler__checkRecoveryContactAndRecoveryKeyStatus___block_invoke_2;
  v15[3] = &unk_1EA2DD6C0;
  v17 = v21;
  v9 = v7;
  v16 = v9;
  objc_msgSend(v8, "isWalrusRecoveryKeyAvailableWithCompletion:", v15);
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __74__AAUIMyCustodianActionHandler__checkRecoveryContactAndRecoveryKeyStatus___block_invoke_42;
  block[3] = &unk_1EA2DD6E8;
  v12 = v3;
  v13 = v23;
  v14 = v21;
  v10 = v3;
  dispatch_group_notify(v9, MEMORY[0x1E0C80D38], block);

  _Block_object_dispose(v21, 8);
  _Block_object_dispose(v23, 8);
}

void __74__AAUIMyCustodianActionHandler__checkRecoveryContactAndRecoveryKeyStatus___block_invoke(uint64_t a1, void *a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(a2, "count") != 0;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __74__AAUIMyCustodianActionHandler__checkRecoveryContactAndRecoveryKeyStatus___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;

  v5 = a3;
  if (v5)
  {
    _AAUILogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __74__AAUIMyCustodianActionHandler__checkRecoveryContactAndRecoveryKeyStatus___block_invoke_2_cold_1();

  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

uint64_t __74__AAUIMyCustodianActionHandler__checkRecoveryContactAndRecoveryKeyStatus___block_invoke_42(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[4] + 16))(a1[4], *(unsigned __int8 *)(*(_QWORD *)(a1[5] + 8) + 24), *(unsigned __int8 *)(*(_QWORD *)(a1[6] + 8) + 24));
}

- (void)_updateUIAfterDeleteWithHasRecoveryContact:(BOOL)a3 hasRecoveryKey:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  AAUIOBWelcomeController *v7;
  AAUIOBWelcomeController *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  OBNavigationController *v16;
  OBNavigationController *recoveryContactRemovedNavigationController;
  void *v18;
  AAUIWalrusRecoveryContactRemovedScreenModel *v19;

  v4 = a4;
  v5 = a3;
  -[AAUISpinnerManager stopAllSpinners](self->_spinnerManager, "stopAllSpinners");
  v19 = -[AAUIWalrusRecoveryContactRemovedScreenModel initWithHasRecoveryContact:hasRecoveryKey:]([AAUIWalrusRecoveryContactRemovedScreenModel alloc], "initWithHasRecoveryContact:hasRecoveryKey:", v5, v4);
  v7 = -[AAUIOBWelcomeController initWithViewModel:]([AAUIOBWelcomeController alloc], "initWithViewModel:", v19);
  v8 = v7;
  if (v5 || v4)
  {
    -[AAUIOBWelcomeController primaryButton](v7, "primaryButton");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addTarget:action:forControlEvents:", self, sel__dismissAndPopFromRecoveryContactRemovedScreen, 64);

    -[OBBaseWelcomeController navigationItem](v8, "navigationItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setHidesBackButton:", 1);
  }
  else
  {
    v9 = objc_alloc(MEMORY[0x1E0DC34F0]);
    -[AAWalrusRecoveryContactRemovedScreenModel leftBarButton](v19, "leftBarButton");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initWithTitle:style:target:action:", v10, 0, self, sel__dismissAndStartHealthCheck);
    -[OBBaseWelcomeController navigationItem](v8, "navigationItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setLeftBarButtonItem:", v11);

    -[AAUIOBWelcomeController primaryButton](v8, "primaryButton");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addTarget:action:forControlEvents:", self, sel__addRecoveryContact, 64);

    -[AAUIOBWelcomeController secondaryButton](v8, "secondaryButton");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addTarget:action:forControlEvents:", self, sel__setupRecoveryKey, 64);
  }

  v16 = (OBNavigationController *)objc_msgSend(objc_alloc(MEMORY[0x1E0D65180]), "initWithRootViewController:", v8);
  recoveryContactRemovedNavigationController = self->_recoveryContactRemovedNavigationController;
  self->_recoveryContactRemovedNavigationController = v16;

  -[UIViewController navigationController](self->_presentingViewController, "navigationController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "presentViewController:animated:completion:", self->_recoveryContactRemovedNavigationController, 1, 0);

}

- (void)_stopSpinners
{
  _QWORD v2[4];
  id v3;
  id location;

  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __45__AAUIMyCustodianActionHandler__stopSpinners__block_invoke;
  v2[3] = &unk_1EA2DBC18;
  objc_copyWeak(&v3, &location);
  dispatch_async(MEMORY[0x1E0C80D38], v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

void __45__AAUIMyCustodianActionHandler__stopSpinners__block_invoke(uint64_t a1)
{
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained[1], "stopAllSpinners");

}

- (void)_displayCustodianDeleteNotAllowedAlert
{
  id v3;

  -[AAUIDTOHelper makeCustodianDeleteOpNotAllowedAlert](self->_dtoHelper, "makeCustodianDeleteOpNotAllowedAlert");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[UIViewController presentViewController:animated:completion:](self->_presentingViewController, "presentViewController:animated:completion:", v3, 1, 0);

}

- (void)_displayRatchetGenericErrorAlert
{
  id v3;

  -[AAUIDTOHelper makeGenericRatchetFailedAlert](self->_dtoHelper, "makeGenericRatchetFailedAlert");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[UIViewController presentViewController:animated:completion:](self->_presentingViewController, "presentViewController:animated:completion:", v3, 1, 0);

}

- (AALocalContactInfo)contact
{
  return self->_contact;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_dtoHelper, 0);
  objc_storeStrong((id *)&self->_recoveryFactorController, 0);
  objc_storeStrong((id *)&self->_presentingViewController, 0);
  objc_storeStrong((id *)&self->_recoveryContactRemovedNavigationController, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
  objc_storeStrong((id *)&self->_spinnerManager, 0);
}

void __62__AAUIMyCustodianActionHandler_doDestructiveAction_specifier___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_1DB4ED000, v0, v1, "DTO enabled, IdMS says RC delete is allowed, proceeding to ratchet auth", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __62__AAUIMyCustodianActionHandler_doDestructiveAction_specifier___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_1DB4ED000, v0, v1, "IdMS says RC delete is allowed on this device, proceeding to check if DTO is enabled", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __82__AAUIMyCustodianActionHandler__continueDoingDestructiveAction_specifier_account___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_1DB4ED000, v0, v1, "Unable to authenticate: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __50__AAUIMyCustodianActionHandler__doCustodianRemove__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_1DB4ED000, v0, v1, "Error removing Custodian - %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_isWalrusEnabled
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_1DB4ED000, v0, v1, "Error while fetching walrus status: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __49__AAUIMyCustodianActionHandler__setupRecoveryKey__block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_1DB4ED000, v0, v1, "Error generating recovery key - %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __74__AAUIMyCustodianActionHandler__checkRecoveryContactAndRecoveryKeyStatus___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_1DB4ED000, v0, v1, "Error determining recovery key state: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

@end
