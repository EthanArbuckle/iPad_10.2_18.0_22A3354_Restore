@implementation AAUIMyPendingBeneficiaryActionHandler

- (void)doPrimaryAction:(id)a3 specifier:(id)a4
{
  id v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  AAUIInheritanceShareAccessKeyOptionsViewController *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  AAUIInheritanceShareAccessKeyOptionsViewController *v14;
  AAUIInheritanceShareAccessKeyOptionsViewController *shareAccessKeyOptionsViewController;
  UINavigationController *v16;
  UINavigationController *navigationController;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _AAUILogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138412290;
    v20 = v8;
    _os_log_impl(&dword_1DB4ED000, v6, OS_LOG_TYPE_DEFAULT, "%@ : Showing Share Access Key Options...", (uint8_t *)&v19, 0xCu);

  }
  v9 = [AAUIInheritanceShareAccessKeyOptionsViewController alloc];
  -[AAUIMyBeneficiaryActionHandler contact](self, "contact");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAUIMyBeneficiaryActionHandler contact](self, "contact");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "handle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[AAUIInheritanceShareAccessKeyOptionsViewController initWithBeneficiaryName:handle:](v9, "initWithBeneficiaryName:handle:", v11, v13);
  shareAccessKeyOptionsViewController = self->_shareAccessKeyOptionsViewController;
  self->_shareAccessKeyOptionsViewController = v14;

  -[AAUIInheritanceShareAccessKeyOptionsViewController setFlowDelegate:](self->_shareAccessKeyOptionsViewController, "setFlowDelegate:", self);
  v16 = (UINavigationController *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", self->_shareAccessKeyOptionsViewController);
  navigationController = self->_navigationController;
  self->_navigationController = v16;

  objc_msgSend(v5, "navigationController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "presentViewController:animated:completion:", self->_navigationController, 1, 0);
}

- (void)inheritanceDidSelectSharingOption:(unint64_t)a3
{
  if (a3 == 1)
  {
    -[AAUIMyPendingBeneficiaryActionHandler _showPrintPreview](self, "_showPrintPreview");
  }
  else if (!a3)
  {
    -[AAUIMyPendingBeneficiaryActionHandler _startInviteMessageFlow](self, "_startInviteMessageFlow");
  }
}

- (void)_checkMessageEligibility
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id location;

  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFACA8]), "initWithCapabilityType:", 2);
  objc_initWeak(&location, self);
  -[AAUIMyBeneficiaryActionHandler contact](self, "contact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65__AAUIMyPendingBeneficiaryActionHandler__checkMessageEligibility__block_invoke;
  v7[3] = &unk_1EA2DBFB0;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v3, "isRecipient:capableOf:completion:", v6, v4, v7);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

void __65__AAUIMyPendingBeneficiaryActionHandler__checkMessageEligibility__block_invoke(uint64_t a1, char a2)
{
  id WeakRetained;
  void *v4;
  _QWORD v5[5];
  char v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __65__AAUIMyPendingBeneficiaryActionHandler__checkMessageEligibility__block_invoke_2;
    v5[3] = &unk_1EA2DBF88;
    v6 = a2;
    v5[4] = WeakRetained;
    dispatch_async(MEMORY[0x1E0C80D38], v5);
  }

}

uint64_t __65__AAUIMyPendingBeneficiaryActionHandler__checkMessageEligibility__block_invoke_2(uint64_t a1)
{
  int v2;
  NSObject *v3;
  _BOOL4 v4;
  objc_class *v5;
  void *v6;
  objc_class *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = *(unsigned __int8 *)(a1 + 40);
  _AAUILogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      v5 = (objc_class *)objc_opt_class();
      NSStringFromClass(v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412290;
      v11 = v6;
      _os_log_impl(&dword_1DB4ED000, v3, OS_LOG_TYPE_DEFAULT, "%@ : Recipient has compatible device to recieve access key. Starting message invite flow...", (uint8_t *)&v10, 0xCu);

    }
    return objc_msgSend(*(id *)(a1 + 32), "_startInviteMessageFlow");
  }
  else
  {
    if (v4)
    {
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412290;
      v11 = v9;
      _os_log_impl(&dword_1DB4ED000, v3, OS_LOG_TYPE_DEFAULT, "%@ : Recipient does not have compatible device to recieve access key. Showing incompatible device alert...", (uint8_t *)&v10, 0xCu);

    }
    return objc_msgSend(*(id *)(a1 + 32), "_showIncompatibleDeviceAlert");
  }
}

- (void)_startInviteMessageFlow
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1DB4ED000, log, OS_LOG_TYPE_DEBUG, "LCInvite: Initialing LC Invite Message view without checking if receiver isFamilyMember", v1, 2u);
}

- (void)_showPrintPreview
{
  NSObject *v3;
  objc_class *v4;
  void *v5;
  AAUIInheritanceAccessKeyPDFGenerator *v6;
  void *v7;
  void *v8;
  AAUIInheritanceAccessKeyPDFGenerator *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  _AAUILogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v20 = v5;
    _os_log_impl(&dword_1DB4ED000, v3, OS_LOG_TYPE_DEFAULT, "%@ : Showing Print Preview...", buf, 0xCu);

  }
  v6 = [AAUIInheritanceAccessKeyPDFGenerator alloc];
  -[AAUIMyPendingBeneficiaryActionHandler _appleAccount](self, "_appleAccount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAUIMyBeneficiaryActionHandler contact](self, "contact");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[AAUIInheritanceAccessKeyPDFGenerator initWithAppleAccount:localContactInfo:](v6, "initWithAppleAccount:localContactInfo:", v7, v8);

  -[AAUIInheritanceAccessKeyPDFGenerator createPDFDocumentData](v9, "createPDFDocumentData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0D80C28], "canPrintData:", v10))
  {
    objc_msgSend(MEMORY[0x1E0D80C20], "printInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x1E0CB3940];
    -[AAUIMyBeneficiaryActionHandler contact](self, "contact");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "firstName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CFAD50], "printAccessKeyDocumentTitle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("%@ - %@"), v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setJobName:", v16);

    objc_msgSend(v11, "setOrientation:", 0);
    objc_msgSend(v11, "setOutputType:", 2);
    objc_msgSend(MEMORY[0x1E0D80C28], "sharedPrintController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setPrintInfo:", v11);
    objc_msgSend(v17, "setShowsNumberOfCopies:", 1);
    objc_msgSend(v17, "setPrintingItem:", v10);
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __58__AAUIMyPendingBeneficiaryActionHandler__showPrintPreview__block_invoke;
    v18[3] = &unk_1EA2DBFD8;
    v18[4] = self;
    objc_msgSend(v17, "presentAnimated:completionHandler:", 1, v18);

  }
}

void __58__AAUIMyPendingBeneficiaryActionHandler__showPrintPreview__block_invoke(uint64_t a1, void *a2, int a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  _QWORD v13[5];
  _QWORD block[5];
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a4;
  if (v8)
  {
    _AAUILogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v8;
      _os_log_impl(&dword_1DB4ED000, v9, OS_LOG_TYPE_DEFAULT, "Error presenting printInteractionController - %@", buf, 0xCu);
    }

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __58__AAUIMyPendingBeneficiaryActionHandler__showPrintPreview__block_invoke_40;
    block[3] = &unk_1EA2DB778;
    block[4] = *(_QWORD *)(a1 + 32);
    v15 = v8;
    dispatch_async(MEMORY[0x1E0C80D38], block);
    v10 = v15;
    goto LABEL_8;
  }
  if (!a3)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __58__AAUIMyPendingBeneficiaryActionHandler__showPrintPreview__block_invoke_3;
    v11[3] = &unk_1EA2DB778;
    v11[4] = *(_QWORD *)(a1 + 32);
    v12 = v7;
    dispatch_async(MEMORY[0x1E0C80D38], v11);
    v10 = v12;
LABEL_8:

    goto LABEL_9;
  }
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __58__AAUIMyPendingBeneficiaryActionHandler__showPrintPreview__block_invoke_2;
  v13[3] = &unk_1EA2DB208;
  v13[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], v13);
LABEL_9:

}

void __58__AAUIMyPendingBeneficiaryActionHandler__showPrintPreview__block_invoke_40(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "localizedDescription");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_showAlertWithTitle:message:", 0, v2);

}

uint64_t __58__AAUIMyPendingBeneficiaryActionHandler__showPrintPreview__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_showSetupCompleteWithShareTypePrint");
}

uint64_t __58__AAUIMyPendingBeneficiaryActionHandler__showPrintPreview__block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "navigationItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_doneButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setRightBarButtonItem:animated:", v3, 1);

  return objc_msgSend(*(id *)(a1 + 40), "dismissAnimated:", 1);
}

- (void)_showSetupCompleteWithShareTypePrint
{
  AAUIOBInheritanceSetupCompleteViewModel *v3;
  void *v4;
  void *v5;
  AAUIOBWelcomeController *v6;
  void *v7;
  void *v8;
  void *v9;
  AAUIOBInheritanceSetupCompleteViewModel *v10;

  v3 = [AAUIOBInheritanceSetupCompleteViewModel alloc];
  -[AAUIMyBeneficiaryActionHandler contact](self, "contact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[AAUIOBInheritanceSetupCompleteViewModel initWithBeneficiaryName:accessKeyShareType:](v3, "initWithBeneficiaryName:accessKeyShareType:", v5, 1);

  v6 = -[AAUIOBWelcomeController initWithViewModel:]([AAUIOBWelcomeController alloc], "initWithViewModel:", v10);
  -[AAUIOBWelcomeController primaryButton](v6, "primaryButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addTarget:action:forControlEvents:", self, sel__dismiss, 64);

  -[AAUIOBWelcomeController secondaryButton](v6, "secondaryButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addTarget:action:forControlEvents:", self, sel__dismissAndNavigateToDateOfBirthSettings, 64);

  -[OBBaseWelcomeController navigationItem](v6, "navigationItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setHidesBackButton:", 1);

  -[UINavigationController showViewController:sender:](self->_navigationController, "showViewController:sender:", v6, 0);
}

- (void)_showIncompatibleDeviceAlert
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[5];

  v3 = (void *)MEMORY[0x1E0DC3450];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("ALERT_BENEFICIARY_INELIGIBLE_TITLE"), &stru_1EA2E2A18, CFSTR("Localizable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("ALERT_BENEFICIARY_INELIGIBLE_MESSAGE"), &stru_1EA2E2A18, CFSTR("Localizable"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAUIMyBeneficiaryActionHandler contact](self, "contact");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alertWithTitle:message:", v5, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("ALERT_BENEFICIARY_INELIGIBLE_BUTTON_PRIMARY"), &stru_1EA2E2A18, CFSTR("Localizable"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __69__AAUIMyPendingBeneficiaryActionHandler__showIncompatibleDeviceAlert__block_invoke;
  v20[3] = &unk_1EA2DB868;
  v20[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", v14, 0, v20);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addAction:", v15);

  v16 = (void *)MEMORY[0x1E0DC3448];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("ALERT_BENEFICIARY_INELIGIBLE_BUTTON_DISMISS"), &stru_1EA2E2A18, CFSTR("Localizable"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "actionWithTitle:style:handler:", v18, 1, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addAction:", v19);

  -[UINavigationController presentViewController:animated:completion:](self->_navigationController, "presentViewController:animated:completion:", v12, 1, 0);
}

uint64_t __69__AAUIMyPendingBeneficiaryActionHandler__showIncompatibleDeviceAlert__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_showPrintPreview");
}

- (void)inviteMessageFlowDidFinish:(id)a3
{
  id v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  _AAUILogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v6;
    _os_log_impl(&dword_1DB4ED000, v4, OS_LOG_TYPE_DEFAULT, "%@ : Resend Invite flow did finish", (uint8_t *)&v8, 0xCu);

  }
  objc_msgSend(v3, "navigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)inviteMessageWasSent:(id)a3 completion:(id)a4
{
  id v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  _AAUILogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v16 = v8;
    _os_log_impl(&dword_1DB4ED000, v6, OS_LOG_TYPE_DEFAULT, "%@ : Sending IDS Message to Beneficiary", buf, 0xCu);

  }
  v9 = (void *)objc_opt_new();
  -[AAUIMyBeneficiaryActionHandler contact](self, "contact");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "inheritanceContactInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __73__AAUIMyPendingBeneficiaryActionHandler_inviteMessageWasSent_completion___block_invoke;
  v13[3] = &unk_1EA2DC028;
  v13[4] = self;
  v14 = v5;
  v12 = v5;
  objc_msgSend(v9, "sendInvitationToContact:completion:", v11, v13);

}

void __73__AAUIMyPendingBeneficiaryActionHandler_inviteMessageWasSent_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD block[4];
  id v8;
  uint64_t v9;
  id v10;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__AAUIMyPendingBeneficiaryActionHandler_inviteMessageWasSent_completion___block_invoke_2;
  block[3] = &unk_1EA2DC000;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v8 = v3;
  v9 = v4;
  v10 = v5;
  v6 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __73__AAUIMyPendingBeneficiaryActionHandler_inviteMessageWasSent_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;

  if (!*(_QWORD *)(a1 + 32))
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  _AALogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __73__AAUIMyPendingBeneficiaryActionHandler_inviteMessageWasSent_completion___block_invoke_2_cold_1(a1, v2);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (id)_appleAccount
{
  void *v2;
  void *v3;
  void *v4;

  -[AAUIMyBeneficiaryActionHandler accountManager](self, "accountManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accounts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0CFCF18]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_showAlertWithTitle:(id)a3 message:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0DC3450], "alertWithTitle:message:", a3, a4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1EA2E2A18, CFSTR("Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", v6, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addAction:", v7);

  -[UINavigationController presentViewController:animated:completion:](self->_navigationController, "presentViewController:animated:completion:", v8, 1, 0);
}

- (void)_dismiss
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__AAUIMyPendingBeneficiaryActionHandler__dismiss__block_invoke;
  block[3] = &unk_1EA2DB208;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __49__AAUIMyPendingBeneficiaryActionHandler__dismiss__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)_dismissAndNavigateToDateOfBirthSettings
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __81__AAUIMyPendingBeneficiaryActionHandler__dismissAndNavigateToDateOfBirthSettings__block_invoke;
  block[3] = &unk_1EA2DB208;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __81__AAUIMyPendingBeneficiaryActionHandler__dismissAndNavigateToDateOfBirthSettings__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "dismissViewControllerAnimated:completion:", 1, &__block_literal_global_8);
}

void __81__AAUIMyPendingBeneficiaryActionHandler__dismissAndNavigateToDateOfBirthSettings__block_invoke_2()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=APPLE_ACCOUNT&aaaction=accountContactDetails"));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "openSensitiveURL:withOptions:", v1, 0);

}

- (id)_doneButton
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0DC34F0]);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("NEXT"), &stru_1EA2E2A18, CFSTR("Localizable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithTitle:style:target:action:", v5, 0, self, sel__showSetupCompleteWithShareTypePrint);

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inviteFlowController, 0);
  objc_storeStrong((id *)&self->_shareAccessKeyOptionsViewController, 0);
  objc_storeStrong((id *)&self->_navigationController, 0);
}

void __73__AAUIMyPendingBeneficiaryActionHandler_inviteMessageWasSent_completion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  objc_class *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v4;
  _os_log_error_impl(&dword_1DB4ED000, a2, OS_LOG_TYPE_ERROR, "%@ : Failed to notify beneficiary via private IDS channel.", (uint8_t *)&v5, 0xCu);

}

@end
