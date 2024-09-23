@implementation AAUICustodianForActionHandler

- (AAUICustodianForActionHandler)initWithLocalContact:(id)a3
{
  id v5;
  AAUICustodianForActionHandler *v6;
  AAUICustodianForActionHandler *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AAUICustodianForActionHandler;
  v6 = -[AAUICustodianForActionHandler init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_contact, a3);

  return v7;
}

- (void)doDestructiveAction:(id)a3 specifier:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v5 = a3;
  v6 = (void *)objc_opt_new();
  -[AALocalContactInfo custodianID](self->_contact, "custodianID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __63__AAUICustodianForActionHandler_doDestructiveAction_specifier___block_invoke;
  v9[3] = &unk_1EA2DB7F0;
  v10 = v5;
  v8 = v5;
  objc_msgSend(v6, "stopBeingCustodian:completion:", v7, v9);

}

void __63__AAUICustodianForActionHandler_doDestructiveAction_specifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _QWORD block[4];
  NSObject *v6;

  v3 = a2;
  if (v3)
  {
    _AAUILogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __63__AAUICustodianForActionHandler_doDestructiveAction_specifier___block_invoke_cold_1((uint64_t)v3, v4);
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __63__AAUICustodianForActionHandler_doDestructiveAction_specifier___block_invoke_23;
    block[3] = &unk_1EA2DB208;
    v6 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x1E0C80D38], block);
    v4 = v6;
  }

}

void __63__AAUICustodianForActionHandler_doDestructiveAction_specifier___block_invoke_23(uint64_t a1)
{
  id v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "navigationController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v1 = (id)objc_msgSend(v2, "popViewControllerAnimated:", 1);

}

- (void)doPrimaryAction:(id)a3 specifier:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v5 = a3;
  v6 = (void *)objc_opt_new();
  v7 = (void *)objc_opt_new();
  -[AALocalContactInfo custodianID](self->_contact, "custodianID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCustodianUUID:", v8);

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __59__AAUICustodianForActionHandler_doPrimaryAction_specifier___block_invoke;
  v10[3] = &unk_1EA2DB840;
  v10[4] = self;
  v11 = v5;
  v9 = v5;
  objc_msgSend(v6, "generateCustodianRecoveryCodeWithContext:completion:", v7, v10);

}

void __59__AAUICustodianForActionHandler_doPrimaryAction_specifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  _QWORD block[5];
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  if (v6 || !objc_msgSend(v5, "length"))
  {
    _AALogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      __59__AAUICustodianForActionHandler_doPrimaryAction_specifier___block_invoke_cold_1((uint64_t)v6, v7);

    objc_msgSend(v6, "userInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2D50]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "length"))
      objc_msgSend(*(id *)(a1 + 32), "_showHelpNowUnavailableAlertWithMessage:viewController:", v9, *(_QWORD *)(a1 + 40));

  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __59__AAUICustodianForActionHandler_doPrimaryAction_specifier___block_invoke_27;
    block[3] = &unk_1EA2DB818;
    block[4] = *(_QWORD *)(a1 + 32);
    v11 = v5;
    v12 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __59__AAUICustodianForActionHandler_doPrimaryAction_specifier___block_invoke_27(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_showHelpNowViewWithRecoveryCode:presentingViewController:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_showHelpNowViewWithRecoveryCode:(id)a3 presentingViewController:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  AAUIOBCustodianHelpNowViewModel *v11;
  AAUIOBWelcomeController *v12;
  AAUIOBWelcomeController *recoveryViewController;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v6 = (objc_class *)MEMORY[0x1E0CFACC8];
  v7 = a4;
  v8 = a3;
  v9 = [v6 alloc];
  -[AALocalContactInfo firstNameOrHandleForDisplay](self->_contact, "firstNameOrHandleForDisplay");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (id)objc_msgSend(v9, "initWithRecoveryCode:ownerName:", v8, v10);

  v11 = -[AAUIOBCustodianHelpNowViewModel initWithModel:]([AAUIOBCustodianHelpNowViewModel alloc], "initWithModel:", v19);
  v12 = -[AAUIOBWelcomeController initWithViewModel:]([AAUIOBWelcomeController alloc], "initWithViewModel:", v11);
  recoveryViewController = self->_recoveryViewController;
  self->_recoveryViewController = v12;

  -[AAUIOBWelcomeController primaryButton](self->_recoveryViewController, "primaryButton");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addTarget:action:forControlEvents:", self, sel__dismissRecoveryViewController, 64);

  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", self->_recoveryViewController);
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, self, sel__dismissRecoveryViewController);
  -[OBBaseWelcomeController navigationItem](self->_recoveryViewController, "navigationItem");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setLeftBarButtonItem:", v16);

  objc_msgSend(v7, "navigationController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "presentViewController:animated:completion:", v15, 1, 0);
}

- (void)_dismissRecoveryViewController
{
  id v2;

  -[AAUIOBWelcomeController navigationController](self->_recoveryViewController, "navigationController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)_showHelpNowUnavailableAlertWithMessage:(id)a3 viewController:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  AAUICustodianForActionHandler *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __88__AAUICustodianForActionHandler__showHelpNowUnavailableAlertWithMessage_viewController___block_invoke;
  block[3] = &unk_1EA2DB818;
  v11 = v6;
  v12 = self;
  v13 = v7;
  v8 = v7;
  v9 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __88__AAUICustodianForActionHandler__showHelpNowUnavailableAlertWithMessage_viewController___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v2 = (void *)MEMORY[0x1E0DC3450];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("ACCOUNT_RECOVERY_CONTACT_STATUS_NOT_REACHABLE"), &stru_1EA2E2A18, CFSTR("Localizable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "alertWithTitle:message:", v4, *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0DC3448];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1EA2E2A18, CFSTR("Localizable"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __88__AAUICustodianForActionHandler__showHelpNowUnavailableAlertWithMessage_viewController___block_invoke_2;
  v10[3] = &unk_1EA2DB868;
  v11 = *(id *)(a1 + 32);
  objc_msgSend(v6, "actionWithTitle:style:handler:", v8, 0, v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAction:", v9);

  objc_msgSend(*(id *)(a1 + 48), "presentViewController:animated:completion:", v5, 1, 0);
}

void __88__AAUICustodianForActionHandler__showHelpNowUnavailableAlertWithMessage_viewController___block_invoke_2(uint64_t a1)
{
  NSObject *v2;

  _AAUILogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __88__AAUICustodianForActionHandler__showHelpNowUnavailableAlertWithMessage_viewController___block_invoke_2_cold_1(a1, v2);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recoveryViewController, 0);
  objc_storeStrong((id *)&self->_contact, 0);
}

void __63__AAUICustodianForActionHandler_doDestructiveAction_specifier___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1DB4ED000, a2, OS_LOG_TYPE_ERROR, "Error ending Custodianship - %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_4();
}

void __59__AAUICustodianForActionHandler_doPrimaryAction_specifier___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl(&dword_1DB4ED000, a2, OS_LOG_TYPE_FAULT, "Failed to generate custodian recovery code with error: %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_4();
}

void __88__AAUICustodianForActionHandler__showHelpNowUnavailableAlertWithMessage_viewController___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = 138412290;
  v4 = v2;
  _os_log_debug_impl(&dword_1DB4ED000, a2, OS_LOG_TYPE_DEBUG, "User dismissed generate code alert for message: %@", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_4();
}

@end
