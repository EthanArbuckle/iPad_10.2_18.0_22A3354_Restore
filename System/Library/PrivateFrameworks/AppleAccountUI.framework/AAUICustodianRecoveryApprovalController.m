@implementation AAUICustodianRecoveryApprovalController

+ (id)approvalControllerWithPresenter:(id)a3 recoverySessionID:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  _QWORD *v8;
  void *v9;
  id v10;
  void *v11;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  _AAUILogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412290;
    v14 = v6;
    _os_log_impl(&dword_1DB4ED000, v7, OS_LOG_TYPE_DEFAULT, "Creating Custodian Recovery Approval Controller with Session ID: %@", (uint8_t *)&v13, 0xCu);
  }

  v8 = objc_alloc_init((Class)objc_opt_class());
  v9 = (void *)v8[1];
  v8[1] = v6;
  v10 = v6;

  v11 = (void *)v8[2];
  v8[2] = v5;

  return v8;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[16];

  _AAUILogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DB4ED000, v3, OS_LOG_TYPE_DEFAULT, "AAUICustodianRecoveryApprovalController dealloc", buf, 2u);
  }

  v4.receiver = self;
  v4.super_class = (Class)AAUICustodianRecoveryApprovalController;
  -[AAUICustodianRecoveryApprovalController dealloc](&v4, sel_dealloc);
}

- (void)validateRecoveryCodeWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[16];

  v4 = a3;
  _AAUILogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DB4ED000, v5, OS_LOG_TYPE_DEFAULT, "Custodian recovery approval validation was requested", buf, 2u);
  }

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __78__AAUICustodianRecoveryApprovalController_validateRecoveryCodeWithCompletion___block_invoke;
  v7[3] = &unk_1EA2DB0C0;
  v8 = v4;
  v6 = v4;
  -[AAUICustodianRecoveryApprovalController _promptForRecoveryCodeWithCompletion:](self, "_promptForRecoveryCodeWithCompletion:", v7);

}

void __78__AAUICustodianRecoveryApprovalController_validateRecoveryCodeWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void (*v10)(void);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "custodianUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  _AAUILogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v6 || !v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __78__AAUICustodianRecoveryApprovalController_validateRecoveryCodeWithCompletion___block_invoke_cold_1((uint64_t)v6, v9, v11, v12, v13, v14, v15, v16);

    v10 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 138412290;
      v18 = v5;
      _os_log_impl(&dword_1DB4ED000, v9, OS_LOG_TYPE_DEFAULT, "Successfully validated custodian recovery code with context: %@", (uint8_t *)&v17, 0xCu);
    }

    v10 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  v10();

}

- (void)_validateRecoveryCode:(id)a3 withCompletion:(id)a4
{
  id v6;
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v6 = a4;
  v7 = (objc_class *)MEMORY[0x1E0CFAC20];
  v8 = a3;
  v9 = objc_alloc_init(v7);
  objc_msgSend(v9, "setRecoverySessionID:", self->_recoverySessionID);
  objc_msgSend(v9, "setRecoveryCode:", v8);

  v10 = objc_alloc_init(MEMORY[0x1E0CFAC10]);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __80__AAUICustodianRecoveryApprovalController__validateRecoveryCode_withCompletion___block_invoke;
  v12[3] = &unk_1EA2DB0C0;
  v13 = v6;
  v11 = v6;
  objc_msgSend(v10, "validateCustodianRecoveryCodeWithContext:completion:", v9, v12);

}

uint64_t __80__AAUICustodianRecoveryApprovalController__validateRecoveryCode_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_promptForRecoveryCodeWithCompletion:(id)a3
{
  id v4;
  AAUICodeEntryContext *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  AAUICodeEntryViewController *v16;
  AAUICodeEntryViewController *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *, void *);
  void *v21;
  AAUICustodianRecoveryApprovalController *v22;
  id v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;

  v4 = a3;
  v5 = objc_alloc_init(AAUICodeEntryContext);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("CUSTODIAN_RECOVERY_CODE_PROMPT_TITLE"), &stru_1EA2E2A18, CFSTR("Localizable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAUICodeEntryContext setPromptTitle:](v5, "setPromptTitle:", v7);

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("CUSTODIAN_RECOVERY_CODE_PROMPT_MESSAGE"), &stru_1EA2E2A18, CFSTR("Localizable"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAUICodeEntryContext setPromptMessage:](v5, "setPromptMessage:", v9);

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("CUSTODIAN_RECOVERY_CODE_PROMPT_ESCAPE_TITLE"), &stru_1EA2E2A18, CFSTR("Localizable"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAUICodeEntryContext setEscapeTitle:](v5, "setEscapeTitle:", v11);

  v12 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __80__AAUICustodianRecoveryApprovalController__promptForRecoveryCodeWithCompletion___block_invoke;
  v26[3] = &unk_1EA2DB0E8;
  v13 = v4;
  v27 = v13;
  -[AAUICodeEntryContext setEscapeAction:](v5, "setEscapeAction:", v26);
  v24[0] = v12;
  v24[1] = 3221225472;
  v24[2] = __80__AAUICustodianRecoveryApprovalController__promptForRecoveryCodeWithCompletion___block_invoke_37;
  v24[3] = &unk_1EA2DB0E8;
  v14 = v13;
  v25 = v14;
  -[AAUICodeEntryContext setCancelEntryAction:](v5, "setCancelEntryAction:", v24);
  v18 = v12;
  v19 = 3221225472;
  v20 = __80__AAUICustodianRecoveryApprovalController__promptForRecoveryCodeWithCompletion___block_invoke_38;
  v21 = &unk_1EA2DB188;
  v22 = self;
  v23 = v14;
  v15 = v14;
  -[AAUICodeEntryContext setCodeEnteredAction:](v5, "setCodeEnteredAction:", &v18);
  v16 = [AAUICodeEntryViewController alloc];
  v17 = -[AAUICodeEntryViewController initWithContext:](v16, "initWithContext:", v5, v18, v19, v20, v21, v22);
  -[UIViewController presentViewController:animated:completion:](self->_presenter, "presentViewController:animated:completion:", v17, 1, 0);

}

void __80__AAUICustodianRecoveryApprovalController__promptForRecoveryCodeWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint8_t v5[16];

  _AAUILogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1DB4ED000, v2, OS_LOG_TYPE_DEFAULT, "Custodian Recovery Code Attempt: User elected for escape action!", v5, 2u);
  }

  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CFAB00], -9007, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v3 + 16))(v3, 0, v4);

}

void __80__AAUICustodianRecoveryApprovalController__promptForRecoveryCodeWithCompletion___block_invoke_37(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;

  _AAUILogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __80__AAUICustodianRecoveryApprovalController__promptForRecoveryCodeWithCompletion___block_invoke_37_cold_1();

  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CFAB00], -9003, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v3 + 16))(v3, 0, v4);

}

void __80__AAUICustodianRecoveryApprovalController__promptForRecoveryCodeWithCompletion___block_invoke_38(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _AAUILogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v14 = v5;
    _os_log_impl(&dword_1DB4ED000, v7, OS_LOG_TYPE_DEFAULT, "Custodian Recovery Code Attempt: Code Entered: %@", buf, 0xCu);
  }

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __80__AAUICustodianRecoveryApprovalController__promptForRecoveryCodeWithCompletion___block_invoke_39;
  v10[3] = &unk_1EA2DB160;
  v11 = v6;
  v8 = *(void **)(a1 + 32);
  v12 = *(id *)(a1 + 40);
  v9 = v6;
  objc_msgSend(v8, "_validateRecoveryCode:withCompletion:", v5, v10);

}

void __80__AAUICustodianRecoveryApprovalController__promptForRecoveryCodeWithCompletion___block_invoke_39(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  void (*v15)(void);
  void *v16;
  NSObject *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD block[4];
  id v22;
  id v23;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    _AAUILogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __80__AAUICustodianRecoveryApprovalController__promptForRecoveryCodeWithCompletion___block_invoke_39_cold_2((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);

    v14 = objc_msgSend(v6, "aa_isAACustodianRecoveryErrorWithCode:", -9002);
    v15 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
    if ((v14 & 1) != 0)
    {
      v15();
      goto LABEL_13;
    }
    v15();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __80__AAUICustodianRecoveryApprovalController__promptForRecoveryCodeWithCompletion___block_invoke_40;
    block[3] = &unk_1EA2DB110;
    v23 = *(id *)(a1 + 40);
    v22 = v6;
    dispatch_async(MEMORY[0x1E0C80D38], block);

    v16 = v23;
LABEL_9:

    goto LABEL_13;
  }
  if (v5)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __80__AAUICustodianRecoveryApprovalController__promptForRecoveryCodeWithCompletion___block_invoke_41;
    v18[3] = &unk_1EA2DB138;
    v19 = v5;
    v20 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x1E0C80D38], v18);

    v16 = v19;
    goto LABEL_9;
  }
  _AAUILogSystem();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    __80__AAUICustodianRecoveryApprovalController__promptForRecoveryCodeWithCompletion___block_invoke_39_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
LABEL_13:

}

uint64_t __80__AAUICustodianRecoveryApprovalController__promptForRecoveryCodeWithCompletion___block_invoke_40(uint64_t a1)
{
  NSObject *v2;

  _AAUILogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __80__AAUICustodianRecoveryApprovalController__promptForRecoveryCodeWithCompletion___block_invoke_40_cold_1();

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __80__AAUICustodianRecoveryApprovalController__promptForRecoveryCodeWithCompletion___block_invoke_41(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  _AAUILogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1DB4ED000, v2, OS_LOG_TYPE_DEFAULT, "Custodian Recovery Code Attempt: Code validation success! Custodian with context: %@", (uint8_t *)&v5, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (id)_actionsForRecoveryCodeAlert:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;
  id location;
  _QWORD v16[4];
  id v17;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  v8 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __83__AAUICustodianRecoveryApprovalController__actionsForRecoveryCodeAlert_completion___block_invoke;
  v16[3] = &unk_1EA2DB0E8;
  v9 = v6;
  v17 = v9;
  objc_msgSend(v7, "setAk_cancelAction:", v16);
  objc_initWeak(&location, v5);
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __83__AAUICustodianRecoveryApprovalController__actionsForRecoveryCodeAlert_completion___block_invoke_45;
  v12[3] = &unk_1EA2DB1B0;
  objc_copyWeak(&v14, &location);
  v10 = v9;
  v13 = v10;
  objc_msgSend(v7, "setCodeEnteredAction:", v12);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  return v7;
}

void __83__AAUICustodianRecoveryApprovalController__actionsForRecoveryCodeAlert_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;

  _AAUILogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __83__AAUICustodianRecoveryApprovalController__actionsForRecoveryCodeAlert_completion___block_invoke_cold_1();

  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CFAB00], -9003, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v3 + 16))(v3, 0, v4);

}

void __83__AAUICustodianRecoveryApprovalController__actionsForRecoveryCodeAlert_completion___block_invoke_45(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _AAUILogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v3;
    _os_log_impl(&dword_1DB4ED000, v4, OS_LOG_TYPE_DEFAULT, "User entered recovery code %@.", (uint8_t *)&v7, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "setPasscodeFieldDisabled:", 1);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (BOOL)isResetEligible
{
  return self->_isResetEligible;
}

- (void)setIsResetEligible:(BOOL)a3
{
  self->_isResetEligible = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presenter, 0);
  objc_storeStrong((id *)&self->_recoverySessionID, 0);
}

void __78__AAUICustodianRecoveryApprovalController_validateRecoveryCodeWithCompletion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1DB4ED000, a2, a3, "Failed to validate recovery code from user, bailing: %@", a5, a6, a7, a8, 2u);
}

void __80__AAUICustodianRecoveryApprovalController__promptForRecoveryCodeWithCompletion___block_invoke_37_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1DB4ED000, v0, v1, "Custodian Recovery Code Attempt: User Cancelled Code Entry!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __80__AAUICustodianRecoveryApprovalController__promptForRecoveryCodeWithCompletion___block_invoke_39_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1DB4ED000, v0, v1, "Custodian Recovery Code Attempt: Failed with no error or context", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __80__AAUICustodianRecoveryApprovalController__promptForRecoveryCodeWithCompletion___block_invoke_39_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1DB4ED000, a2, a3, "Custodian Recovery Code Attempt: Code validation failed: %@", a5, a6, a7, a8, 2u);
}

void __80__AAUICustodianRecoveryApprovalController__promptForRecoveryCodeWithCompletion___block_invoke_40_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1DB4ED000, v0, v1, "Custodian Recovery Code Attempt: Failed with unrecoverable error. bailing....", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __83__AAUICustodianRecoveryApprovalController__actionsForRecoveryCodeAlert_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1DB4ED000, v0, v1, "User canceled recovery code entry!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end
