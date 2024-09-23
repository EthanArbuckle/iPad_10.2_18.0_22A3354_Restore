@implementation AAUICustodianSetupFlowController

- (AAUICustodianSetupFlowController)initWithAccountManager:(id)a3
{
  id v4;
  void *v5;
  AAUICustodianSetupFlowController *v6;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = -[AAUICustodianSetupFlowController initWithAccountManager:navigationController:](self, "initWithAccountManager:navigationController:", v4, v5);

  return v6;
}

- (AAUICustodianSetupFlowController)initWithAccountManager:(id)a3 navigationController:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  AAUICustodianSetupFlowController *v9;
  uint8_t v11[16];

  v6 = a4;
  v7 = a3;
  _AAUILogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_1DB4ED000, v8, OS_LOG_TYPE_DEFAULT, "Instantiating AAUICustodianSetupFlowController with nil cdpContext", v11, 2u);
  }

  v9 = -[AAUICustodianSetupFlowController initWithAccountManager:navigationController:isADPUpsellFlow:cdpContext:](self, "initWithAccountManager:navigationController:isADPUpsellFlow:cdpContext:", v7, v6, 0, 0);
  return v9;
}

- (AAUICustodianSetupFlowController)initWithAccountManager:(id)a3 navigationController:(id)a4 isADPUpsellFlow:(BOOL)a5 cdpContext:(id)a6
{
  id v11;
  id v12;
  id v13;
  AAUICustodianSetupFlowController *v14;
  AAUICustodianSetupFlowController *v15;
  uint64_t v16;
  AACustodianController *custodianController;
  objc_super v19;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)AAUICustodianSetupFlowController;
  v14 = -[AAUICustodianSetupFlowController init](&v19, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_navigationController, a4);
    objc_storeStrong((id *)&v15->_accountManager, a3);
    v16 = objc_opt_new();
    custodianController = v15->_custodianController;
    v15->_custodianController = (AACustodianController *)v16;

    v15->_isADPUpsellFlow = a5;
    objc_storeStrong((id *)&v15->_cdpContext, a6);
  }

  return v15;
}

- (void)start
{
  NSObject *v3;
  uint8_t v4[16];

  _AAUILogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1DB4ED000, v3, OS_LOG_TYPE_DEFAULT, "Initiating Custodian setup flow...", v4, 2u);
  }

  -[AAUICustodianSetupFlowController _showFirstTimeSetup](self, "_showFirstTimeSetup");
}

- (void)startWithoutFirstTimeSetup
{
  NSObject *v3;
  uint8_t v4[16];

  _AAUILogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1DB4ED000, v3, OS_LOG_TYPE_DEFAULT, "Skipping first time setup. Showing Add Recovery Contact flow.", v4, 2u);
  }

  -[AAUICustodianSetupFlowController _beginAddRecoveryContactFlow](self, "_beginAddRecoveryContactFlow");
}

- (void)startAddingDataRecoveryService:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = a3;
  _AAUILogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1DB4ED000, v5, OS_LOG_TYPE_DEFAULT, "Initating data recovery service enable UI", v6, 2u);
  }

  -[AAUICustodianSetupFlowController _showDataRecoveryServiceEnableUIWithPresenter:modal:](self, "_showDataRecoveryServiceEnableUIWithPresenter:modal:", v4, -[AAUICustodianSetupFlowController forceInlinePresentation](self, "forceInlinePresentation") ^ 1);
}

- (void)chooseContactController:(id)a3 didSelectContact:(id)a4
{
  -[AAUICustodianSetupFlowController _verifyAndInviteContact:](self, "_verifyAndInviteContact:", a4);
}

- (void)accountContactSelector:(id)a3 didSelectContact:(id)a4
{
  -[AAUICustodianSetupFlowController _verifyAndInviteContact:](self, "_verifyAndInviteContact:", a4);
}

- (void)accountContactSelectorShowOtherContacts:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__AAUICustodianSetupFlowController_accountContactSelectorShowOtherContacts___block_invoke;
  block[3] = &unk_1EA2DB208;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __76__AAUICustodianSetupFlowController_accountContactSelectorShowOtherContacts___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_showChooseContact");
}

- (void)_startInviteMessageFlow
{
  int v3;
  uint64_t v4;
  id v5;
  void *v6;
  AAUIOBTrustedContactInviteMessageModel *v7;
  AAUIOBInvitationSentViewModel *v8;
  void *v9;
  AAUIOBInvitationSentViewModel *v10;
  void *v11;
  AAUIInviteMessageFlowController *v12;
  void *v13;
  AAUIInviteMessageFlowController *v14;
  AAUIInviteMessageFlowController *inviteFlowController;
  uint64_t v16;
  id v17;

  v3 = -[AALocalContactInfo isFamilyMember](self->_invitedContact, "isFamilyMember");
  if (v3)
    v4 = 2;
  else
    v4 = 1;
  v5 = objc_alloc(MEMORY[0x1E0CFACE0]);
  -[AALocalContactInfo handle](self->_invitedContact, "handle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (id)objc_msgSend(v5, "initWithType:recipientHandle:", v4, v6);

  v7 = -[AAUIOBTrustedContactInviteMessageModel initWithModel:]([AAUIOBTrustedContactInviteMessageModel alloc], "initWithModel:", v17);
  v8 = [AAUIOBInvitationSentViewModel alloc];
  -[AALocalContactInfo handle](self->_invitedContact, "handle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[AAUIOBInvitationSentViewModel initWithType:recipientHandle:](v8, "initWithType:recipientHandle:", v3 ^ 1u, v9);

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFAC18]), "initWithLocalContact:custodianID:", self->_invitedContact, self->_custodianshipID);
  v12 = [AAUIInviteMessageFlowController alloc];
  -[AAUICustodianSetupFlowController navigationController](self, "navigationController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v16) = v3;
  v14 = -[AAUIInviteMessageFlowController initWithContext:flow:navigationController:defaultMessageViewModel:messageSentViewModel:isADPUpsellFlow:isFamilyMember:cdpContext:](v12, "initWithContext:flow:navigationController:defaultMessageViewModel:messageSentViewModel:isADPUpsellFlow:isFamilyMember:cdpContext:", v11, 0, v13, v7, v10, self->_isADPUpsellFlow, v16, self->_cdpContext);
  inviteFlowController = self->_inviteFlowController;
  self->_inviteFlowController = v14;

  -[AAUIInviteMessageFlowController setDelegate:](self->_inviteFlowController, "setDelegate:", self);
  -[AAUIInviteMessageFlowController setTelemetryFlowID:](self->_inviteFlowController, "setTelemetryFlowID:", self->_telemetryFlowID);
  -[AAUIInviteMessageFlowController setAccountManager:](self->_inviteFlowController, "setAccountManager:", self->_accountManager);
  -[AAUIInviteMessageFlowController start](self->_inviteFlowController, "start");

}

- (void)_loadRemoteUIPresenterRequest:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_opt_new();
  objc_msgSend(v5, "setURL:", v4);

  -[AAUIGrandSlamRemoteUIPresenter setDelegate:](self->_remoteUIPresenter, "setDelegate:", self);
  -[AAUIGrandSlamRemoteUIPresenter loadRequest:](self->_remoteUIPresenter, "loadRequest:", v5);

}

- (void)remoteUIDidDismiss:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D15750], -5307, 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AAUICustodianSetupFlowController _dismissWithError:](self, "_dismissWithError:", v4);

}

- (void)_sendTelemetryEventWithEscapeOffers:(id)a3 offers:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v6 = a4;
  -[AIDAAccountManager accounts](self->_accountManager, "accounts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CFCF18]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0CF0E68];
    objc_msgSend(v8, "aida_alternateDSID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAUICustodianSetupFlowController telemetryFlowID](self, "telemetryFlowID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "analyticsEventWithName:altDSID:flowID:", v15, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "aaf_arrayAsCommaSeperatedString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0D15798]);

    objc_msgSend(MEMORY[0x1E0CFABB8], "reporter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "sendEvent:", v12);

  }
}

- (void)_sendEscapeOfferSelectedEvent:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  -[AIDAAccountManager accounts](self->_accountManager, "accounts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CFCF18]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0CF0E68];
    v7 = *MEMORY[0x1E0CFAE00];
    objc_msgSend(v5, "aida_alternateDSID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAUICustodianSetupFlowController telemetryFlowID](self, "telemetryFlowID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "analyticsEventWithName:altDSID:flowID:", v7, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, *MEMORY[0x1E0D157A0]);
    objc_msgSend(MEMORY[0x1E0CFABB8], "reporter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sendEvent:", v10);

  }
}

- (void)_showFirstTimeSetup
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_1DB4ED000, v0, v1, "Not adding an action to the secondary button because it is ADP upsell flow.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_postAdpUpsellCFUCustodianFirstTimeSetupEvent
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)MEMORY[0x1E0CF0E68];
  -[CDPContext altDSID](self->_cdpContext, "altDSID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPContext telemetryFlowID](self->_cdpContext, "telemetryFlowID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "analyticsEventWithName:altDSID:flowID:", CFSTR("com.apple.appleaccount.custodianFirstTimeSetup"), v4, v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CFABB8], "reporter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sendEvent:", v7);

}

- (void)_beginAddRecoveryContactFlow
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_1DB4ED000, v0, v1, "Beginning add recovery contact flow", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __64__AAUICustodianSetupFlowController__beginAddRecoveryContactFlow__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  id WeakRetained;
  NSObject *v7;
  id v8;
  _QWORD block[5];

  v5 = a3;
  if (objc_msgSend(v5, "ak_isIncompatibleDevicesError"))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "_showDeviceUpgradeUI");
  }
  else if (objc_msgSend(v5, "ak_isUserCancelError"))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "_dismissWithError:", v5);
  }
  else if (a2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "_fetchSuggestedContacts");
  }
  else
  {
    _AAUILogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __64__AAUICustodianSetupFlowController__beginAddRecoveryContactFlow__block_invoke_cold_1();

    v8 = objc_loadWeakRetained((id *)(a1 + 32));
    WeakRetained = v8;
    if (v8)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __64__AAUICustodianSetupFlowController__beginAddRecoveryContactFlow__block_invoke_43;
      block[3] = &unk_1EA2DB208;
      block[4] = v8;
      dispatch_async(MEMORY[0x1E0C80D38], block);
    }
  }

}

void __64__AAUICustodianSetupFlowController__beginAddRecoveryContactFlow__block_invoke_43(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "primaryButton");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setEnabled:", 1);

}

- (void)_showDataRecoveryServiceEnableUI
{
  -[AAUICustodianSetupFlowController _showDataRecoveryServiceEnableUIWithPresenter:modal:](self, "_showDataRecoveryServiceEnableUIWithPresenter:modal:", self->_firstTimeSetupVC, 0);
}

- (void)_showDataRecoveryServiceEnableUIWithPresenter:(id)a3 modal:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  AAUIGrandSlamRemoteUIPresenter *v9;
  AAUIGrandSlamRemoteUIPresenter *remoteUIPresenter;
  NSObject *v11;
  void *v12;
  uint8_t v13[16];

  v4 = a4;
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0D002A0], "sharedBag");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "urlAtKey:", *MEMORY[0x1E0D000E0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[AAUICustodianSetupFlowController _showActivityIndicator](self, "_showActivityIndicator");
    v9 = -[AAUIGrandSlamRemoteUIPresenter initWithAccountManager:hookType:presenter:]([AAUIGrandSlamRemoteUIPresenter alloc], "initWithAccountManager:hookType:presenter:", self->_accountManager, 2, v6);
    remoteUIPresenter = self->_remoteUIPresenter;
    self->_remoteUIPresenter = v9;

    -[AAUIGrandSlamRemoteUIPresenter setModalInPresentation:](self->_remoteUIPresenter, "setModalInPresentation:", v4);
    -[AAUIGrandSlamRemoteUIPresenter setShowCancelInModalPresentation:](self->_remoteUIPresenter, "setShowCancelInModalPresentation:", 1);
    -[AAUICustodianSetupFlowController _loadRemoteUIPresenterRequest:](self, "_loadRemoteUIPresenterRequest:", v8);
  }
  else
  {
    _AAUILogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_1DB4ED000, v11, OS_LOG_TYPE_DEFAULT, "Unable to load data recovery service enable remote UI. We're missing the URL from the URL bag.", v13, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CFAB08], -7000, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAUICustodianSetupFlowController _dismissWithError:](self, "_dismissWithError:", v12);

  }
}

- (void)_validateAccountWithCompletion:(id)a3
{
  id v4;
  AIDAAccountManager *accountManager;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  id location;

  v4 = a3;
  accountManager = self->_accountManager;
  if (!accountManager)
  {
    _AAUILogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[AAUICustodianSetupFlowController _validateAccountWithCompletion:].cold.2();

    accountManager = self->_accountManager;
  }
  -[AIDAAccountManager accounts](accountManager, "accounts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CFCF18]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0CF0E68];
    v10 = *MEMORY[0x1E0CFADD0];
    objc_msgSend(v8, "aida_alternateDSID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAUICustodianSetupFlowController telemetryFlowID](self, "telemetryFlowID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "analyticsEventWithName:altDSID:flowID:", v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_initWeak(&location, self);
    v14 = (void *)objc_opt_new();
    -[AAUICustodianSetupFlowController navigationController](self, "navigationController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "presentingViewController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __67__AAUICustodianSetupFlowController__validateAccountWithCompletion___block_invoke;
    v19[3] = &unk_1EA2DD850;
    objc_copyWeak(&v22, &location);
    v19[4] = self;
    v17 = v13;
    v20 = v17;
    v21 = v4;
    objc_msgSend(v14, "aaui_custodianAuthForAccount:presentingViewController:completion:", v8, v16, v19);

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }
  else
  {
    _AAUILogSystem();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[AAUICustodianSetupFlowController _validateAccountWithCompletion:].cold.1();

    objc_msgSend(MEMORY[0x1E0CB35C8], "aa_errorWithCode:", -4404);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, id))v4 + 2))(v4, 0, v17);
  }

}

void __67__AAUICustodianSetupFlowController__validateAccountWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  id *WeakRetained;
  NSObject *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  uint8_t v14[16];

  v6 = a2;
  v7 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  if (!v6 || v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "_hideActivityIndicator");
    _AAUILogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __82__AAUIMyCustodianActionHandler__continueDoingDestructiveAction_specifier_account___block_invoke_cold_1();

    objc_msgSend(*(id *)(a1 + 40), "populateUnderlyingErrorsStartingWithRootError:", v7);
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0CF0EE0]);
    objc_msgSend(MEMORY[0x1E0CFABB8], "reporter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "sendEvent:", *(_QWORD *)(a1 + 40));

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    _AAUILogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_1DB4ED000, v9, OS_LOG_TYPE_DEFAULT, "Authentication successful, continue setup...", v14, 2u);
    }

    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CF0EE0]);
    objc_msgSend(MEMORY[0x1E0CFABB8], "reporter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sendEvent:", *(_QWORD *)(a1 + 40));

    objc_storeStrong(WeakRetained + 4, a2);
    v11 = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(v11, "_verifyCDPWithCompletion:", *(_QWORD *)(a1 + 48));

  }
}

- (void)_verifyCDPWithCompletion:(id)a3
{
  id v4;
  AAUID2DEncryptionFlowContext *v5;
  AAUIManateeStateValidator *v6;
  void *v7;
  AAUIManateeStateValidator *v8;
  id v9;
  AAUIManateeStateValidator *v10;
  _QWORD v11[4];
  AAUIManateeStateValidator *v12;
  id v13;

  v4 = a3;
  v5 = -[AAUID2DEncryptionFlowContext initWithType:]([AAUID2DEncryptionFlowContext alloc], "initWithType:", 2);
  v6 = [AAUIManateeStateValidator alloc];
  -[AAUICustodianSetupFlowController navigationController](self, "navigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[AAUIManateeStateValidator initWithFlowContext:withPresentingViewController:](v6, "initWithFlowContext:withPresentingViewController:", v5, v7);

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __61__AAUICustodianSetupFlowController__verifyCDPWithCompletion___block_invoke;
  v11[3] = &unk_1EA2DC458;
  v12 = v8;
  v13 = v4;
  v9 = v4;
  v10 = v8;
  -[AAUIManateeStateValidator verifyAndRepairManateeWithCompletion:](v10, "verifyAndRepairManateeWithCompletion:", v11);

}

uint64_t __61__AAUICustodianSetupFlowController__verifyCDPWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_showDeviceUpgradeUI
{
  NSObject *v3;
  void *v4;
  void *v5;
  AAUIGrandSlamRemoteUIPresenter *v6;
  AAUIGrandSlamRemoteUIPresenter *remoteUIPresenter;
  NSObject *v8;
  void *v9;
  uint8_t v10[16];
  uint8_t buf[16];

  _AAUILogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DB4ED000, v3, OS_LOG_TYPE_DEFAULT, "Show device upgrade UI...", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0D002A0], "sharedBag");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "urlAtKey:", *MEMORY[0x1E0D000E8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = -[AAUIGrandSlamRemoteUIPresenter initWithAccountManager:presenter:]([AAUIGrandSlamRemoteUIPresenter alloc], "initWithAccountManager:presenter:", self->_accountManager, self->_firstTimeSetupVC);
    remoteUIPresenter = self->_remoteUIPresenter;
    self->_remoteUIPresenter = v6;

    -[AAUICustodianSetupFlowController _loadRemoteUIPresenterRequest:](self, "_loadRemoteUIPresenterRequest:", v5);
  }
  else
  {
    _AAUILogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1DB4ED000, v8, OS_LOG_TYPE_DEFAULT, "Unable to load device upgrade remote UI. We're missing the URL from the URL bag.", v10, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CFAB08], -7000, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAUICustodianSetupFlowController _dismissWithError:](self, "_dismissWithError:", v9);

  }
}

- (void)_fetchSuggestedContacts
{
  NSObject *v3;
  void *v4;
  _QWORD v5[5];
  uint8_t buf[16];

  _AAUILogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DB4ED000, v3, OS_LOG_TYPE_DEFAULT, "Fetching suggested contacts...", buf, 2u);
  }

  v4 = (void *)objc_opt_new();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59__AAUICustodianSetupFlowController__fetchSuggestedContacts__block_invoke;
  v5[3] = &unk_1EA2DD878;
  v5[4] = self;
  objc_msgSend(v4, "fetchSuggestedCustodiansWithImagesOfSize:andCompletion:", v5, 16.0);

}

void __59__AAUICustodianSetupFlowController__fetchSuggestedContacts__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[5];
  id v6;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59__AAUICustodianSetupFlowController__fetchSuggestedContacts__block_invoke_2;
  v5[3] = &unk_1EA2DB778;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

uint64_t __59__AAUICustodianSetupFlowController__fetchSuggestedContacts__block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "navigationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "aaui_hideActivityIndicator");

  v3 = objc_msgSend(*(id *)(a1 + 40), "count");
  v4 = *(void **)(a1 + 32);
  if (v3)
    return objc_msgSend(v4, "_showSuggestedContactSelector:", *(_QWORD *)(a1 + 40));
  else
    return objc_msgSend(v4, "_showChooseContactWithCancel");
}

- (void)_showSuggestedContactSelector:(id)a3
{
  id v4;
  NSObject *v5;
  AAUIOBContactSelectorViewModel *v6;
  AAUIAccountContactSelectorViewController *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id buf[2];

  v4 = a3;
  _AAUILogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1DB4ED000, v5, OS_LOG_TYPE_DEFAULT, "Showing suggested contacts...", (uint8_t *)buf, 2u);
  }

  v6 = -[AAUIOBContactSelectorViewModel initWithFlow:]([AAUIOBContactSelectorViewModel alloc], "initWithFlow:", 0);
  -[AAUIOBContactSelectorViewModel setSuggestedContacts:](v6, "setSuggestedContacts:", v4);
  v7 = -[AAUIAccountContactSelectorViewController initWithViewModel:]([AAUIAccountContactSelectorViewController alloc], "initWithViewModel:", v6);
  objc_initWeak(buf, self);
  v8 = (void *)MEMORY[0x1E0DC3428];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __66__AAUICustodianSetupFlowController__showSuggestedContactSelector___block_invoke;
  v13[3] = &unk_1EA2DD8A0;
  objc_copyWeak(&v14, buf);
  objc_msgSend(v8, "actionWithHandler:", v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:primaryAction:", 1, v9);
  -[OBBaseWelcomeController navigationItem](v7, "navigationItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setLeftBarButtonItem:", v10);

  -[AAUIOBTableWelcomeController setDelegate:](v7, "setDelegate:", self);
  -[AAUICustodianSetupFlowController navigationController](self, "navigationController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "pushViewController:animated:", v7, 1);

  objc_destroyWeak(&v14);
  objc_destroyWeak(buf);

}

void __66__AAUICustodianSetupFlowController__showSuggestedContactSelector___block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D15750], -5307, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_dismissWithError:", v1);

}

- (void)_showChooseContact
{
  NSObject *v3;
  AAUIChooseContactController *v4;
  AAUIChooseContactController *chooseContactController;
  void *v6;
  void *v7;
  uint8_t v8[16];

  _AAUILogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1DB4ED000, v3, OS_LOG_TYPE_DEFAULT, "Showing choose contacts...", v8, 2u);
  }

  v4 = -[AAUIChooseContactController initWithAccountManager:]([AAUIChooseContactController alloc], "initWithAccountManager:", self->_accountManager);
  chooseContactController = self->_chooseContactController;
  self->_chooseContactController = v4;

  -[AAUIChooseContactController setDelegate:](self->_chooseContactController, "setDelegate:", self);
  -[AAUIChooseContactController setTelemetryFlowID:](self->_chooseContactController, "setTelemetryFlowID:", self->_telemetryFlowID);
  -[AAUIChooseContactController chooseContactViewController](self->_chooseContactController, "chooseContactViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAUICustodianSetupFlowController navigationController](self, "navigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "showViewController:sender:", v6, 0);

}

- (void)_showChooseContactWithCancel
{
  NSObject *v3;
  AAUIChooseContactController *v4;
  AAUIChooseContactController *chooseContactController;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id buf;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  _AAUILogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_1DB4ED000, v3, OS_LOG_TYPE_DEFAULT, "Showing choose contacts...", (uint8_t *)&buf, 2u);
  }

  v4 = -[AAUIChooseContactController initWithAccountManager:]([AAUIChooseContactController alloc], "initWithAccountManager:", self->_accountManager);
  chooseContactController = self->_chooseContactController;
  self->_chooseContactController = v4;

  -[AAUIChooseContactController setDelegate:](self->_chooseContactController, "setDelegate:", self);
  -[AAUIChooseContactController setTelemetryFlowID:](self->_chooseContactController, "setTelemetryFlowID:", self->_telemetryFlowID);
  -[AAUIChooseContactController chooseContactViewController](self->_chooseContactController, "chooseContactViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&buf, self);
  v7 = (void *)MEMORY[0x1E0DC3428];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __64__AAUICustodianSetupFlowController__showChooseContactWithCancel__block_invoke;
  v14[3] = &unk_1EA2DD8A0;
  objc_copyWeak(&v15, &buf);
  objc_msgSend(v7, "actionWithHandler:", v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:primaryAction:", 1, v8);
  objc_msgSend(v6, "navigationItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setLeftBarButtonItem:", v9);

  v11 = *MEMORY[0x1E0CFAEB8];
  v17[0] = *MEMORY[0x1E0CFAEA8];
  v17[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAUICustodianSetupFlowController _sendTelemetryEventWithEscapeOffers:offers:](self, "_sendTelemetryEventWithEscapeOffers:offers:", *MEMORY[0x1E0CFADB8], v12);

  -[AAUICustodianSetupFlowController navigationController](self, "navigationController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "showViewController:sender:", v6, 0);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&buf);

}

void __64__AAUICustodianSetupFlowController__showChooseContactWithCancel__block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D15750], -5307, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_dismissWithError:", v1);

}

- (void)_verifyAndInviteContact:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _AAUILogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "handle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v14 = v6;
    _os_log_impl(&dword_1DB4ED000, v5, OS_LOG_TYPE_DEFAULT, "Verifying %@ is reachable.", buf, 0xCu);

  }
  -[AAUICustodianSetupFlowController _showActivityIndicator](self, "_showActivityIndicator");
  v7 = objc_alloc(MEMORY[0x1E0CFACB0]);
  objc_msgSend(v4, "handle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithHandle:", v8);

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __60__AAUICustodianSetupFlowController__verifyAndInviteContact___block_invoke;
  v11[3] = &unk_1EA2DD8C8;
  v11[4] = self;
  v12 = v4;
  v10 = v4;
  objc_msgSend(v9, "isRegisteredToiMessageWithCompletion:", v11);

}

uint64_t __60__AAUICustodianSetupFlowController__verifyAndInviteContact___block_invoke(uint64_t a1, int a2)
{
  NSObject *v4;
  _BOOL4 v5;
  uint8_t v7[16];
  uint8_t buf[16];

  _AAUILogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB4ED000, v4, OS_LOG_TYPE_DEFAULT, "The contact is reachable-able.", buf, 2u);
    }

    return objc_msgSend(*(id *)(a1 + 32), "_inviteContact:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    if (v5)
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1DB4ED000, v4, OS_LOG_TYPE_DEFAULT, "The contact with is not iMessage-able.", v7, 2u);
    }

    return objc_msgSend(*(id *)(a1 + 32), "_displayAlertForNotReachableContact:", *(_QWORD *)(a1 + 40));
  }
}

- (void)_displayAlertForNotReachableContact:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __72__AAUICustodianSetupFlowController__displayAlertForNotReachableContact___block_invoke;
  v6[3] = &unk_1EA2DD168;
  objc_copyWeak(&v8, &location);
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __72__AAUICustodianSetupFlowController__displayAlertForNotReachableContact___block_invoke(uint64_t a1)
{
  id WeakRetained;
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
  id *v15;
  void *v16;
  _QWORD v17[4];
  id v18;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("CANNOT_ADD_TITLE"), &stru_1EA2E2A18, CFSTR("Localizable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0DC3450];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("CANNOT_ADD_BODY"), &stru_1EA2E2A18, CFSTR("Localizable"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "alertWithTitle:message:", v7, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1EA2E2A18, CFSTR("Localizable"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x1E0DC3448];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __72__AAUICustodianSetupFlowController__displayAlertForNotReachableContact___block_invoke_2;
  v17[3] = &unk_1EA2DB868;
  v18 = WeakRetained;
  v15 = (id *)WeakRetained;
  objc_msgSend(v14, "actionWithTitle:style:handler:", v13, 0, v17);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addAction:", v16);

  objc_msgSend(v15[12], "presentViewController:animated:completion:", v11, 1, 0);
}

uint64_t __72__AAUICustodianSetupFlowController__displayAlertForNotReachableContact___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "aaui_hideActivityIndicator");
}

- (void)_inviteContact:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  AACustodianController *custodianController;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _AAUILogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "handle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v17 = v7;
    _os_log_impl(&dword_1DB4ED000, v6, OS_LOG_TYPE_DEFAULT, "Inviting %@...", buf, 0xCu);

  }
  v8 = objc_alloc(MEMORY[0x1E0CFAC28]);
  objc_msgSend(v5, "handle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithHandle:authResults:", v9, self->_authResults);

  objc_storeStrong((id *)&self->_invitedContact, a3);
  objc_initWeak((id *)buf, self);
  custodianController = self->_custodianController;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __51__AAUICustodianSetupFlowController__inviteContact___block_invoke;
  v13[3] = &unk_1EA2DD8F0;
  v13[4] = self;
  v12 = v5;
  v14 = v12;
  objc_copyWeak(&v15, (id *)buf);
  -[AACustodianController setupCustodianshipWithContext:completion:](custodianController, "setupCustodianshipWithContext:completion:", v10, v13);
  objc_destroyWeak(&v15);

  objc_destroyWeak((id *)buf);
}

void __51__AAUICustodianSetupFlowController__inviteContact___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[8];
  _QWORD block[5];
  id v14;
  id v15;

  v6 = a2;
  v7 = a3;
  _AAUILogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __51__AAUICustodianSetupFlowController__inviteContact___block_invoke_cold_1();

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __51__AAUICustodianSetupFlowController__inviteContact___block_invoke_75;
    block[3] = &unk_1EA2DB818;
    block[4] = *(_QWORD *)(a1 + 32);
    v14 = v7;
    v15 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB4ED000, v9, OS_LOG_TYPE_DEFAULT, "Custodian setup succeeded. Will display message composer.", buf, 2u);
    }

    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 48), a2);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __51__AAUICustodianSetupFlowController__inviteContact___block_invoke_79;
    v10[3] = &unk_1EA2DBC18;
    objc_copyWeak(&v11, (id *)(a1 + 48));
    dispatch_async(MEMORY[0x1E0C80D38], v10);
    objc_destroyWeak(&v11);
  }

}

void __51__AAUICustodianSetupFlowController__inviteContact___block_invoke_75(id *a1)
{
  void *v2;
  void *v3;
  id *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;

  objc_msgSend(*((id *)a1[4] + 12), "aaui_hideActivityIndicator");
  objc_msgSend(MEMORY[0x1E0CFAD50], "setupCustodianErrorTitle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CFAD50], "setupCustodianErrorMessage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = a1 + 5;
  objc_msgSend(a1[5], "localizedDescription");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    objc_msgSend(*v4, "userInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("ec"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "integerValue");

    if (v9 == -27412)
    {
      _AAUILogSystem();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        __51__AAUICustodianSetupFlowController__inviteContact___block_invoke_75_cold_3();

      objc_msgSend(*v4, "localizedDescription");
      v11 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CFAD50], "custodianCountMaxLimitReachedErrorTitle");
      v12 = objc_claimAutoreleasedReturnValue();

      v3 = (void *)v11;
      v2 = (void *)v12;
      goto LABEL_19;
    }
  }
  objc_msgSend(*v4, "domain");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *MEMORY[0x1E0CFAAF8];
  if (objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0CFAAF8]))
  {
    v15 = objc_msgSend(*v4, "code");

    if (v15 == -7020)
    {
      _AAUILogSystem();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        __51__AAUICustodianSetupFlowController__inviteContact___block_invoke_75_cold_1();

      objc_msgSend(MEMORY[0x1E0CFAD50], "selfCannotBeCustodianErrorTitle");
      v17 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CFAD50], "selfCannotBeCustodianErrorMessage");
      v18 = objc_claimAutoreleasedReturnValue();

LABEL_17:
      v3 = (void *)v18;
      v2 = (void *)v17;
      goto LABEL_19;
    }
  }
  else
  {

  }
  objc_msgSend(*v4, "domain");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v19, "isEqualToString:", v14))
  {

    goto LABEL_19;
  }
  v20 = objc_msgSend(*v4, "code");

  if (v20 == -7014)
  {
    _AAUILogSystem();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      __51__AAUICustodianSetupFlowController__inviteContact___block_invoke_75_cold_2();

    objc_msgSend(MEMORY[0x1E0CFAD50], "cannotAddAnExistingCustodianErrorTitle");
    v17 = objc_claimAutoreleasedReturnValue();

    v22 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CFAD50], "cannotAddAnExistingCustodianErrorMessageFormat");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[6], "handle");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "stringWithFormat:", v23, v24);
    v18 = objc_claimAutoreleasedReturnValue();

    goto LABEL_17;
  }
LABEL_19:
  objc_msgSend(a1[4], "_showAlertWithTitle:message:", v2, v3);

}

void __51__AAUICustodianSetupFlowController__inviteContact___block_invoke_79(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  id v4;
  id v5;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "aaui_hideActivityIndicator");

  v4 = objc_loadWeakRetained(v1);
  objc_msgSend(v4, "_startInviteMessageFlow");

  v5 = objc_loadWeakRetained(v1);
  objc_msgSend(v5, "_dismissCFUIfNeeded");

}

- (void)_showAlertWithTitle:(id)a3 message:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0DC3450], "alertWithTitle:message:", a3, a4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1EA2E2A18, CFSTR("Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", v6, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addAction:", v7);

  -[AAUICustodianSetupFlowController navigationController](self, "navigationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "presentViewController:animated:completion:", v9, 1, 0);

}

- (void)_cancelCustodianInvite
{
  NSObject *v3;
  AACustodianController *custodianController;
  NSUUID *custodianshipID;
  _QWORD v6[4];
  id v7;
  uint8_t buf[8];
  id location;

  objc_initWeak(&location, self);
  _AAUILogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DB4ED000, v3, OS_LOG_TYPE_DEFAULT, "Custodian invitation was cancelled, revoking custodianship...", buf, 2u);
  }

  -[AAUICustodianSetupFlowController _showActivityIndicator](self, "_showActivityIndicator");
  custodianController = self->_custodianController;
  custodianshipID = self->_custodianshipID;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __58__AAUICustodianSetupFlowController__cancelCustodianInvite__block_invoke;
  v6[3] = &unk_1EA2DD0C8;
  objc_copyWeak(&v7, &location);
  -[AACustodianController removeCustodian:completion:](custodianController, "removeCustodian:completion:", custodianshipID, v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __58__AAUICustodianSetupFlowController__cancelCustodianInvite__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  id WeakRetained;
  NSObject *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (v3)
  {
    _AAUILogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __58__AAUICustodianSetupFlowController__cancelCustodianInvite__block_invoke_cold_1();

    v7 = objc_loadWeakRetained(v4);
    objc_msgSend(v7, "_sendEscapeOfferSelectedEvent:", *MEMORY[0x1E0CFAEB8]);

    objc_msgSend(WeakRetained, "_hideActivityIndicator");
    v11 = *MEMORY[0x1E0CB3388];
    v12[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = objc_loadWeakRetained(v4);
    objc_msgSend(v9, "_sendEscapeOfferSelectedEvent:", *MEMORY[0x1E0CFAEB8]);

    objc_msgSend(WeakRetained, "_hideActivityIndicator");
    v8 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D15750], -5307, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_dismissWithError:", v10);

}

- (void)_dismissWithError:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _AAUILogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v10 = v4;
    _os_log_impl(&dword_1DB4ED000, v5, OS_LOG_TYPE_DEFAULT, "Dismissing setup flow controller with error=%@", buf, 0xCu);
  }

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__AAUICustodianSetupFlowController__dismissWithError___block_invoke;
  v7[3] = &unk_1EA2DB778;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

void __54__AAUICustodianSetupFlowController__dismissWithError___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v4;
  if ((v3 & 1) != 0)
  {
    objc_msgSend(v4, "custodianSetupFlowControllerDidFinish:withError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  }
  else
  {
    v5 = objc_opt_respondsToSelector();

    v6 = *(void **)(a1 + 32);
    if ((v5 & 1) != 0)
    {
      objc_msgSend(v6, "delegate");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "navigationController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "custodianSetupFlowControllerDidFinish:", v7);

    }
    else
    {
      objc_msgSend(v6, "navigationController");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "dismissViewControllerAnimated:completion:", 1, 0);
    }
  }

}

- (void)_dismissWithCancel
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D15750], -5307, 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[AAUICustodianSetupFlowController _dismissWithError:](self, "_dismissWithError:", v3);

}

- (void)_dismissCFUIfNeeded
{
  id v2;
  uint64_t v3;
  id v4;
  _QWORD v5[4];
  id v6;

  v2 = objc_alloc_init(MEMORY[0x1E0CFAC68]);
  v3 = *MEMORY[0x1E0CFAB20];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __55__AAUICustodianSetupFlowController__dismissCFUIfNeeded__block_invoke;
  v5[3] = &unk_1EA2DD938;
  v6 = v2;
  v4 = v2;
  objc_msgSend(v4, "pendingFollowUpWithIdentifier:completion:", v3, v5);

}

void __55__AAUICustodianSetupFlowController__dismissCFUIfNeeded__block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  _BOOL4 v5;

  _AAUILogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (a2)
  {
    if (v5)
      __55__AAUICustodianSetupFlowController__dismissCFUIfNeeded__block_invoke_cold_2();

    objc_msgSend(*(id *)(a1 + 32), "dismissFollowUpWithIdentifier:completion:", *MEMORY[0x1E0CFAB20], &__block_literal_global_21);
  }
  else
  {
    if (v5)
      __55__AAUICustodianSetupFlowController__dismissCFUIfNeeded__block_invoke_cold_1();

  }
}

void __55__AAUICustodianSetupFlowController__dismissCFUIfNeeded__block_invoke_88(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  NSObject *v4;

  v3 = a3;
  if (v3)
  {
    _AAUILogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __55__AAUICustodianSetupFlowController__dismissCFUIfNeeded__block_invoke_88_cold_1();

  }
}

- (void)_removeRecoveryKeyAndDismissCFUIfNeeded
{
  AAUICustodianSetupFlowControllerDelegate **p_delegate;
  id WeakRetained;
  char v4;
  id v5;
  void *v6;
  int v7;
  id v8;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    v5 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v5, "followUpUniqueIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.AAFollowUpIdentifier.RecoveryKeyMismatch"));

    if (v7)
    {
      v8 = objc_loadWeakRetained((id *)p_delegate);
      objc_msgSend(v8, "custodianSetupFlowControllerRecoveryContactInviteSent");

    }
  }
}

- (void)_showActivityIndicator
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__AAUICustodianSetupFlowController__showActivityIndicator__block_invoke;
  block[3] = &unk_1EA2DB208;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __58__AAUICustodianSetupFlowController__showActivityIndicator__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "navigationController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "aaui_showActivityIndicator");

}

- (void)_hideActivityIndicator
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__AAUICustodianSetupFlowController__hideActivityIndicator__block_invoke;
  block[3] = &unk_1EA2DB208;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __58__AAUICustodianSetupFlowController__hideActivityIndicator__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "navigationController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "aaui_hideActivityIndicator");

}

- (void)inviteMessageFlowDidFinish:(id)a3
{
  -[AAUICustodianSetupFlowController _removeRecoveryKeyAndDismissCFUIfNeeded](self, "_removeRecoveryKeyAndDismissCFUIfNeeded", a3);
  -[AAUICustodianSetupFlowController _dismissWithError:](self, "_dismissWithError:", 0);
}

- (UINavigationController)navigationController
{
  return self->_navigationController;
}

- (void)setNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_navigationController, a3);
}

- (BOOL)isWalrusEnabled
{
  return self->_isWalrusEnabled;
}

- (void)setIsWalrusEnabled:(BOOL)a3
{
  self->_isWalrusEnabled = a3;
}

- (BOOL)forceInlinePresentation
{
  return self->_forceInlinePresentation;
}

- (void)setForceInlinePresentation:(BOOL)a3
{
  self->_forceInlinePresentation = a3;
}

- (AAUICustodianSetupFlowControllerDelegate)delegate
{
  return (AAUICustodianSetupFlowControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)telemetryFlowID
{
  return self->_telemetryFlowID;
}

- (void)setTelemetryFlowID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_telemetryFlowID, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_navigationController, 0);
  objc_storeStrong((id *)&self->_cdpContext, 0);
  objc_storeStrong((id *)&self->_chooseContactController, 0);
  objc_storeStrong((id *)&self->_inviteFlowController, 0);
  objc_storeStrong((id *)&self->_remoteUIPresenter, 0);
  objc_storeStrong((id *)&self->_custodianshipID, 0);
  objc_storeStrong((id *)&self->_invitedContact, 0);
  objc_storeStrong((id *)&self->_authResults, 0);
  objc_storeStrong((id *)&self->_firstTimeSetupVC, 0);
  objc_storeStrong((id *)&self->_custodianController, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
}

void __64__AAUICustodianSetupFlowController__beginAddRecoveryContactFlow__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_1DB4ED000, v0, v1, "Unhandled error %@. Re-enabling primary button on main queue", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_validateAccountWithCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_2(&dword_1DB4ED000, v0, v1, "Failed to get a cloud account from the accounts manager %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_validateAccountWithCompletion:.cold.2()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_1DB4ED000, v0, OS_LOG_TYPE_ERROR, "Account manager is nil. We will not be able to get an account", v1, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __51__AAUICustodianSetupFlowController__inviteContact___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_1DB4ED000, v0, v1, "Custodian setup failed: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __51__AAUICustodianSetupFlowController__inviteContact___block_invoke_75_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_2(&dword_1DB4ED000, v0, v1, "Can't add self. %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __51__AAUICustodianSetupFlowController__inviteContact___block_invoke_75_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_2(&dword_1DB4ED000, v0, v1, "Can't add existing custodian again %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __51__AAUICustodianSetupFlowController__inviteContact___block_invoke_75_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_2(&dword_1DB4ED000, v0, v1, "Max Custodian Limit reached. Showing localized error message in alert from server error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __58__AAUICustodianSetupFlowController__cancelCustodianInvite__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_1DB4ED000, v0, v1, "Custodianship revoke failed: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __55__AAUICustodianSetupFlowController__dismissCFUIfNeeded__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_3_0(&dword_1DB4ED000, v0, v1, "No previous %@ CFU exists. Nothing to dismiss", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __55__AAUICustodianSetupFlowController__dismissCFUIfNeeded__block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_3_0(&dword_1DB4ED000, v0, v1, "CFU %@ exists. Dismissing...", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __55__AAUICustodianSetupFlowController__dismissCFUIfNeeded__block_invoke_88_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_1DB4ED000, v0, v1, "Error occurred while dismissing the followup - %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

@end
