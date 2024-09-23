@implementation AAUIRecoveryFactorController

- (AAUIRecoveryFactorController)initWithAccountManager:(id)a3 presentingViewController:(id)a4
{
  id v6;
  id v7;
  AAUIRecoveryFactorController *v8;
  AAUIRecoveryFactorController *v9;
  id v10;
  AAUIDTOHelper *v11;
  AAUIDTOHelper *dtoHelper;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AAUIRecoveryFactorController;
  v8 = -[AAUIRecoveryFactorController init](&v14, sel_init);
  v9 = v8;
  if (v8)
  {
    -[AAUIRecoveryFactorController setAccountManager:](v8, "setAccountManager:", v6);
    -[AAUIRecoveryFactorController setPresentingViewController:](v9, "setPresentingViewController:", v7);
    v10 = objc_alloc_init(MEMORY[0x1E0D001A0]);
    v11 = -[AAUIDTOHelper initWithDTOController:]([AAUIDTOHelper alloc], "initWithDTOController:", v10);
    dtoHelper = v9->_dtoHelper;
    v9->_dtoHelper = v11;

  }
  return v9;
}

- (void)_displayCustodianAddNotAllowedAlert
{
  void *v3;
  id v4;

  -[AAUIDTOHelper makeCustodianAddOpNotAllowedAlert](self->_dtoHelper, "makeCustodianAddOpNotAllowedAlert");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AAUIRecoveryFactorController presentingViewController](self, "presentingViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentViewController:animated:completion:", v4, 1, 0);

}

- (void)_displayRatchetGenericErrorAlert
{
  void *v3;
  id v4;

  -[AAUIDTOHelper makeGenericRatchetFailedAlert](self->_dtoHelper, "makeGenericRatchetFailedAlert");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AAUIRecoveryFactorController presentingViewController](self, "presentingViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentViewController:animated:completion:", v4, 1, 0);

}

- (void)startAddingRecoveryContact
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_1DB4ED000, v0, v1, "appleAccount found nil, returning without adding RC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __58__AAUIRecoveryFactorController_startAddingRecoveryContact__block_invoke(uint64_t a1, int a2)
{
  NSObject *v3;
  NSObject *v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  _QWORD *v12;
  _QWORD v13[5];
  _QWORD block[5];
  _QWORD v15[5];

  if (!a2)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __58__AAUIRecoveryFactorController_startAddingRecoveryContact__block_invoke_28;
    v13[3] = &unk_1EA2DB208;
    v13[4] = *(_QWORD *)(a1 + 32);
    v11 = MEMORY[0x1E0C80D38];
    v12 = v13;
LABEL_10:
    dispatch_async(v11, v12);
    return;
  }
  _AAUILogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __58__AAUIRecoveryFactorController_startAddingRecoveryContact__block_invoke_cold_2();

  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "isDTOGatingEnabled"))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __58__AAUIRecoveryFactorController_startAddingRecoveryContact__block_invoke_2;
    block[3] = &unk_1EA2DB208;
    block[4] = *(_QWORD *)(a1 + 32);
    v11 = MEMORY[0x1E0C80D38];
    v12 = block;
    goto LABEL_10;
  }
  _AAUILogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __58__AAUIRecoveryFactorController_startAddingRecoveryContact__block_invoke_cold_1();

  v5 = *(_QWORD **)(a1 + 32);
  v6 = (void *)v5[5];
  objc_msgSend(v5, "presentingViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "makeRatchetContextWithPresentationContext:DTOContextType:", v7, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(v9 + 40);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __58__AAUIRecoveryFactorController_startAddingRecoveryContact__block_invoke_24;
  v15[3] = &unk_1EA2DBB10;
  v15[4] = v9;
  objc_msgSend(v10, "shouldAllowOpForContext:completion:", v8, v15);

}

void __58__AAUIRecoveryFactorController_startAddingRecoveryContact__block_invoke_24(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  _QWORD block[5];

  v5 = a3;
  _AAUILogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    __58__AAUIRecoveryFactorController_startAddingRecoveryContact__block_invoke_24_cold_1(a2, (uint64_t)v5, v6);

  if (a2)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __58__AAUIRecoveryFactorController_startAddingRecoveryContact__block_invoke_25;
    block[3] = &unk_1EA2DB208;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }

}

uint64_t __58__AAUIRecoveryFactorController_startAddingRecoveryContact__block_invoke_25(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_continueAddingRecoveryContact");
}

uint64_t __58__AAUIRecoveryFactorController_startAddingRecoveryContact__block_invoke_2(uint64_t a1)
{
  NSObject *v2;

  _AAUILogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __58__AAUIRecoveryFactorController_startAddingRecoveryContact__block_invoke_2_cold_1();

  return objc_msgSend(*(id *)(a1 + 32), "_continueAddingRecoveryContact");
}

uint64_t __58__AAUIRecoveryFactorController_startAddingRecoveryContact__block_invoke_28(uint64_t a1)
{
  NSObject *v2;

  _AAUILogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __58__AAUIRecoveryFactorController_startAddingRecoveryContact__block_invoke_28_cold_1();

  return objc_msgSend(*(id *)(a1 + 32), "_displayCustodianAddNotAllowedAlert");
}

- (void)_continueAddingRecoveryContact
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __62__AAUIRecoveryFactorController__continueAddingRecoveryContact__block_invoke;
  v2[3] = &unk_1EA2DBC40;
  v2[4] = self;
  -[AAUIRecoveryFactorController _custodianFlowControllerWithCompletion:](self, "_custodianFlowControllerWithCompletion:", v2);
}

void __62__AAUIRecoveryFactorController__continueAddingRecoveryContact__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  v7 = a3;
  v8 = a4;
  if (!v12 || !v7)
  {
    objc_msgSend(v12, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "recoveryFactorController:didFinishAddingRecoveryContactWithError:", v12, v8);
    goto LABEL_6;
  }
  objc_msgSend(*(id *)(a1 + 32), "telemetryFlowID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTelemetryFlowID:", v9);

  objc_msgSend(v7, "start");
  if ((objc_msgSend(v12, "forceInlinePresentation") & 1) == 0)
  {
    objc_msgSend(v7, "navigationController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "presentingViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "presentViewController:animated:completion:", v10, 1, 0);

LABEL_6:
  }

}

- (void)authenticateAndGenerateNewRecoveryKeyWithCompletion:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  NSObject *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[AAUIRecoveryFactorController _stateController](self, "_stateController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[AAUIRecoveryFactorController _stateController](self, "_stateController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __84__AAUIRecoveryFactorController_authenticateAndGenerateNewRecoveryKeyWithCompletion___block_invoke;
    v10[3] = &unk_1EA2DBC68;
    objc_copyWeak(&v12, &location);
    v11 = v4;
    objc_msgSend(v7, "authenticateAndGenerateNewRecoveryKeyWithCompletion:", v10);

    objc_destroyWeak(&v12);
  }
  else
  {
    _AAUILogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[AAUIRecoveryFactorController authenticateAndGenerateNewRecoveryKeyWithCompletion:].cold.1();

    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "aa_errorWithCode:", -3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v9);

    }
  }
  objc_destroyWeak(&location);

}

void __84__AAUIRecoveryFactorController_authenticateAndGenerateNewRecoveryKeyWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id *v5;
  id v6;
  id WeakRetained;

  v5 = (id *)(a1 + 40);
  v6 = a3;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "_handleRecoveryKeyOperationResultWithSuccess:error:operationDescription:completion:", a2, v6, CFSTR("recovery key generation"), *(_QWORD *)(a1 + 32));

}

- (void)generateRecoveryKeyWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[AAUIRecoveryFactorController _stateController](self, "_stateController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __66__AAUIRecoveryFactorController_generateRecoveryKeyWithCompletion___block_invoke;
  v7[3] = &unk_1EA2DBC68;
  objc_copyWeak(&v9, &location);
  v6 = v4;
  v8 = v6;
  objc_msgSend(v5, "generateNewRecoveryKey:", v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __66__AAUIRecoveryFactorController_generateRecoveryKeyWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id *v5;
  id v6;
  id WeakRetained;

  v5 = (id *)(a1 + 40);
  v6 = a3;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "_handleRecoveryKeyOperationResultWithSuccess:error:operationDescription:completion:", a2, v6, CFSTR("recovery key generation"), *(_QWORD *)(a1 + 32));

}

- (void)validateRecoveryKeyWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D15768], "contextForPrimaryAccount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setType:", 9);
  -[AAUIRecoveryFactorController _cdpHelper](self, "_cdpHelper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cdpStateControllerWithContext:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __66__AAUIRecoveryFactorController_validateRecoveryKeyWithCompletion___block_invoke;
  v9[3] = &unk_1EA2DBC90;
  v10 = v4;
  v8 = v4;
  objc_msgSend(v7, "verifyRecoveryKey:", v9);

}

void __66__AAUIRecoveryFactorController_validateRecoveryKeyWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;

  v5 = a3;
  _AAUILogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __66__AAUIRecoveryFactorController_validateRecoveryKeyWithCompletion___block_invoke_cold_2();
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    __66__AAUIRecoveryFactorController_validateRecoveryKeyWithCompletion___block_invoke_cold_1();
  }

  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    (*(void (**)(uint64_t, uint64_t, id))(v8 + 16))(v8, a2, v5);

}

- (void)deleteRecoveryKeyFromAllSystems:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v4 = (void *)MEMORY[0x1E0D15768];
  v5 = a3;
  objc_msgSend(v4, "contextForPrimaryAccount");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[AAUIRecoveryFactorController _cdpHelper](self, "_cdpHelper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cdpStateControllerWithContext:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "deleteRecoveryKey:", v5);
}

- (void)authenticateAndDeleteRecoveryKeyFromAllSystemsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  NSObject *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[AAUIRecoveryFactorController _stateController](self, "_stateController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[AAUIRecoveryFactorController _stateController](self, "_stateController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __93__AAUIRecoveryFactorController_authenticateAndDeleteRecoveryKeyFromAllSystemsWithCompletion___block_invoke;
    v10[3] = &unk_1EA2DBC68;
    objc_copyWeak(&v12, &location);
    v11 = v4;
    objc_msgSend(v7, "authenticateAndDeleteRecoveryKeyWithCompletion:", v10);

    objc_destroyWeak(&v12);
  }
  else
  {
    _AAUILogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[AAUIRecoveryFactorController authenticateAndDeleteRecoveryKeyFromAllSystemsWithCompletion:].cold.1();

    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "aa_errorWithCode:", -3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v9);

    }
  }
  objc_destroyWeak(&location);

}

void __93__AAUIRecoveryFactorController_authenticateAndDeleteRecoveryKeyFromAllSystemsWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id *v5;
  id v6;
  id WeakRetained;

  v5 = (id *)(a1 + 40);
  v6 = a3;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "_handleRecoveryKeyOperationResultWithSuccess:error:operationDescription:completion:", a2, v6, CFSTR("recovery key deletion"), *(_QWORD *)(a1 + 32));

}

- (void)_handleRecoveryKeyOperationResultWithSuccess:(BOOL)a3 error:(id)a4 operationDescription:(id)a5 completion:(id)a6
{
  _BOOL8 v8;
  id v9;
  id v10;
  void (**v11)(id, _BOOL8, id);
  NSObject *v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void (**)(id, _BOOL8, id))a6;
  if (v8)
  {
    v12 = objc_alloc_init(MEMORY[0x1E0CFAC10]);
    -[NSObject startHealthCheckWithCompletion:](v12, "startHealthCheckWithCompletion:", &__block_literal_global_4);
  }
  else
  {
    _AAUILogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[AAUIRecoveryFactorController _handleRecoveryKeyOperationResultWithSuccess:error:operationDescription:completion:].cold.1();
  }

  if (v11)
    v11[2](v11, v8, v9);

}

void __115__AAUIRecoveryFactorController__handleRecoveryKeyOperationResultWithSuccess_error_operationDescription_completion___block_invoke(uint64_t a1, void *a2)
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

- (void)startAddingDataRecoveryService
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __62__AAUIRecoveryFactorController_startAddingDataRecoveryService__block_invoke;
  v2[3] = &unk_1EA2DBC40;
  v2[4] = self;
  -[AAUIRecoveryFactorController _custodianFlowControllerWithCompletion:](self, "_custodianFlowControllerWithCompletion:", v2);
}

void __62__AAUIRecoveryFactorController_startAddingDataRecoveryService__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  uint8_t v13[16];

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v7 && objc_msgSend(v8, "isWalrusEnabled"))
  {
    _AALogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_1DB4ED000, v10, OS_LOG_TYPE_DEFAULT, "Starting to add iCDRS after verifying that walrus is enabled", v13, 2u);
    }

    objc_msgSend(v7, "presentingViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "startAddingDataRecoveryService:", v11);
  }
  else
  {
    _AALogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __62__AAUIRecoveryFactorController_startAddingDataRecoveryService__block_invoke_cold_1();

    objc_msgSend(v7, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "recoveryFactorController:didFinishAddingRecoveryContactWithError:", *(_QWORD *)(a1 + 32), v9);
  }

}

- (void)setForceInlinePresentation:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  self->_forceInlinePresentation = a3;
  -[AAUIRecoveryFactorController _cdpHelper](self, "_cdpHelper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setForceInline:", v3);

  -[AAUIRecoveryFactorController _custodianFlowController](self, "_custodianFlowController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setForceInlinePresentation:", v3);

}

- (id)_custodianFlowController
{
  AAUICustodianSetupFlowController *v3;
  void *v4;
  AAUICustodianSetupFlowController *v5;
  AAUICustodianSetupFlowController *custodianFlowController;
  void *v7;
  char isKindOfClass;
  void *v9;

  if (!self->_custodianFlowController)
  {
    v3 = [AAUICustodianSetupFlowController alloc];
    -[AAUIRecoveryFactorController accountManager](self, "accountManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[AAUICustodianSetupFlowController initWithAccountManager:](v3, "initWithAccountManager:", v4);
    custodianFlowController = self->_custodianFlowController;
    self->_custodianFlowController = v5;

    -[AAUICustodianSetupFlowController setDelegate:](self->_custodianFlowController, "setDelegate:", self);
    if (-[AAUIRecoveryFactorController forceInlinePresentation](self, "forceInlinePresentation"))
    {
      -[AAUIRecoveryFactorController presentingViewController](self, "presentingViewController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        -[AAUIRecoveryFactorController presentingViewController](self, "presentingViewController");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[AAUICustodianSetupFlowController setNavigationController:](self->_custodianFlowController, "setNavigationController:", v9);

      }
    }
  }
  return self->_custodianFlowController;
}

- (void)_custodianFlowControllerWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;

  v4 = a3;
  _AALogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[AAUIRecoveryFactorController _custodianFlowControllerWithCompletion:].cold.1();

  objc_initWeak(&location, self);
  -[AAUIRecoveryFactorController _walrusStateController](self, "_walrusStateController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __71__AAUIRecoveryFactorController__custodianFlowControllerWithCompletion___block_invoke;
  v8[3] = &unk_1EA2DBD20;
  objc_copyWeak(&v10, &location);
  v7 = v4;
  v9 = v7;
  objc_msgSend(v6, "walrusStatusWithCompletion:", v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __71__AAUIRecoveryFactorController__custodianFlowControllerWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id WeakRetained;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  uint64_t v14;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __71__AAUIRecoveryFactorController__custodianFlowControllerWithCompletion___block_invoke_2;
  v10[3] = &unk_1EA2DBCF8;
  v14 = a2;
  v7 = *(id *)(a1 + 32);
  v12 = WeakRetained;
  v13 = v7;
  v11 = v5;
  v8 = WeakRetained;
  v9 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v10);

}

void __71__AAUIRecoveryFactorController__custodianFlowControllerWithCompletion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  if (*(_QWORD *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 40), "_custodianFlowController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setIsWalrusEnabled:", *(_QWORD *)(a1 + 56) == 1);

    v5 = a1 + 40;
    v3 = *(void **)(a1 + 40);
    v4 = *(_QWORD *)(v5 + 8);
    objc_msgSend(v3, "_custodianFlowController");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, id, _QWORD))(v4 + 16))(v4, v3, v6, 0);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

- (id)_stateController
{
  CDPStateController *stateController;
  void *v4;
  CDPStateController *v5;
  CDPStateController *v6;

  stateController = self->_stateController;
  if (!stateController)
  {
    -[AAUIRecoveryFactorController _cdpHelper](self, "_cdpHelper");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cdpStateControllerForPrimaryAccount");
    v5 = (CDPStateController *)objc_claimAutoreleasedReturnValue();
    v6 = self->_stateController;
    self->_stateController = v5;

    stateController = self->_stateController;
  }
  return stateController;
}

- (id)_cdpHelper
{
  AAUICDPHelper *cdpHelper;
  void *v4;
  AAUICDPHelper *v5;
  AAUICDPHelper *v6;

  cdpHelper = self->_cdpHelper;
  if (!cdpHelper)
  {
    -[AAUIRecoveryFactorController presentingViewController](self, "presentingViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[AAUICDPHelper helperWithPresenter:](AAUICDPHelper, "helperWithPresenter:", v4);
    v5 = (AAUICDPHelper *)objc_claimAutoreleasedReturnValue();
    v6 = self->_cdpHelper;
    self->_cdpHelper = v5;

    cdpHelper = self->_cdpHelper;
  }
  return cdpHelper;
}

- (id)_walrusStateController
{
  CDPWalrusStateController *walrusStateController;
  CDPWalrusStateController *v4;
  CDPWalrusStateController *v5;

  walrusStateController = self->_walrusStateController;
  if (!walrusStateController)
  {
    v4 = (CDPWalrusStateController *)objc_alloc_init(MEMORY[0x1E0D15788]);
    v5 = self->_walrusStateController;
    self->_walrusStateController = v4;

    walrusStateController = self->_walrusStateController;
  }
  return walrusStateController;
}

- (void)custodianSetupFlowControllerDidFinish:(id)a3
{
  void *v4;
  id v5;

  if (!-[AAUIRecoveryFactorController forceInlinePresentation](self, "forceInlinePresentation", a3))
  {
    -[AAUIRecoveryFactorController presentingViewController](self, "presentingViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, 0);

  }
  -[AAUIRecoveryFactorController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recoveryFactorController:didFinishAddingRecoveryContactWithError:", self, 0);

}

- (id)followUpUniqueIdentifier
{
  return 0;
}

- (void)custodianSetupFlowControllerRecoveryContactInviteSent
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_1DB4ED000, v0, v1, "Unimplemented", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (AIDAAccountManager)accountManager
{
  return self->_accountManager;
}

- (void)setAccountManager:(id)a3
{
  objc_storeStrong((id *)&self->_accountManager, a3);
}

- (UIViewController)presentingViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_presentingViewController);
}

- (void)setPresentingViewController:(id)a3
{
  objc_storeWeak((id *)&self->_presentingViewController, a3);
}

- (AAUIRecoveryFactorControllerDelegate)delegate
{
  return (AAUIRecoveryFactorControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)forceInlinePresentation
{
  return self->_forceInlinePresentation;
}

- (NSString)telemetryFlowID
{
  return self->_telemetryFlowID;
}

- (void)setTelemetryFlowID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_telemetryFlowID, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_storeStrong((id *)&self->_accountManager, 0);
  objc_storeStrong((id *)&self->_dtoHelper, 0);
  objc_storeStrong((id *)&self->_walrusStateController, 0);
  objc_storeStrong((id *)&self->_stateController, 0);
  objc_storeStrong((id *)&self->_cdpHelper, 0);
  objc_storeStrong((id *)&self->_custodianFlowController, 0);
}

void __58__AAUIRecoveryFactorController_startAddingRecoveryContact__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_1DB4ED000, v0, v1, "DTO enabled, IdMS says RC add is allowed, proceeding to ratchet auth", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __58__AAUIRecoveryFactorController_startAddingRecoveryContact__block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_1DB4ED000, v0, v1, "IdMS says RC add is allowed on this device, proceeding to check if DTO is enabled", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __58__AAUIRecoveryFactorController_startAddingRecoveryContact__block_invoke_24_cold_1(char a1, uint64_t a2, os_log_t log)
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
  _os_log_debug_impl(&dword_1DB4ED000, log, OS_LOG_TYPE_DEBUG, "Ratchet auth returned with success: %d, error: %@,", (uint8_t *)v3, 0x12u);
  OUTLINED_FUNCTION_4();
}

void __58__AAUIRecoveryFactorController_startAddingRecoveryContact__block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_1DB4ED000, v0, v1, "DTO disabled, proceeding with usual flow without auth", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __58__AAUIRecoveryFactorController_startAddingRecoveryContact__block_invoke_28_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_1DB4ED000, v0, v1, "IdMS says RC add is not allowed on weak device, proceeding to show error alert", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)authenticateAndGenerateNewRecoveryKeyWithCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1DB4ED000, v0, v1, "CDP change has not been integrated for authenticateAndGenerateNewRecoveryKeyWithCompletion", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __66__AAUIRecoveryFactorController_validateRecoveryKeyWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_1DB4ED000, v0, v1, "Verified Recovery key successfully", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __66__AAUIRecoveryFactorController_validateRecoveryKeyWithCompletion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_1DB4ED000, v0, v1, "Error verifying recovery key: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)authenticateAndDeleteRecoveryKeyFromAllSystemsWithCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1DB4ED000, v0, v1, "CDP change has not been integrated for authenticateAndDeleteRecoveryKeyWithCompletion", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_handleRecoveryKeyOperationResultWithSuccess:error:operationDescription:completion:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_7();
  v3 = 2112;
  v4 = v0;
  _os_log_error_impl(&dword_1DB4ED000, v1, OS_LOG_TYPE_ERROR, "Recovery Key operation '%@' was not successful. MaybeError: %@", v2, 0x16u);
  OUTLINED_FUNCTION_4();
}

void __115__AAUIRecoveryFactorController__handleRecoveryKeyOperationResultWithSuccess_error_operationDescription_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_1DB4ED000, v0, v1, "Health check failed with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __62__AAUIRecoveryFactorController_startAddingDataRecoveryService__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_1DB4ED000, v0, v1, "Unable to add iCDRS since walrus not determined to be enabled: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_custodianFlowControllerWithCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_1DB4ED000, v0, v1, "Determining walrus status for custodian flow controller", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end
