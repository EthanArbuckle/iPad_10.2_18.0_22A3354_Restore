@implementation AAUIInviteMessageFlowController

- (AAUIInviteMessageFlowController)initWithContext:(id)a3 flow:(unint64_t)a4 navigationController:(id)a5 defaultMessageViewModel:(id)a6 messageSentViewModel:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  AAUIInviteMessageFlowController *v17;
  uint64_t v19;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a3;
  _AAUILogSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    -[AAUIInviteMessageFlowController initWithContext:flow:navigationController:defaultMessageViewModel:messageSentViewModel:].cold.1(v16);

  LOBYTE(v19) = 0;
  v17 = -[AAUIInviteMessageFlowController initWithContext:flow:navigationController:defaultMessageViewModel:messageSentViewModel:isADPUpsellFlow:isFamilyMember:cdpContext:](self, "initWithContext:flow:navigationController:defaultMessageViewModel:messageSentViewModel:isADPUpsellFlow:isFamilyMember:cdpContext:", v15, a4, v14, v13, v12, 0, v19, 0);

  return v17;
}

- (AAUIInviteMessageFlowController)initWithContext:(id)a3 flow:(unint64_t)a4 navigationController:(id)a5 defaultMessageViewModel:(id)a6 messageSentViewModel:(id)a7 isADPUpsellFlow:(BOOL)a8 isFamilyMember:(BOOL)a9 cdpContext:(id)a10
{
  id v16;
  id v17;
  id v18;
  AAUIInviteMessageFlowController *v19;
  AAUIInviteMessageFlowController *v20;
  void *v21;
  uint64_t v22;
  NSString *recipientHandle;
  id v26;
  id v27;
  objc_super v28;

  v16 = a3;
  v17 = a5;
  v27 = a6;
  v26 = a7;
  v18 = a10;
  v28.receiver = self;
  v28.super_class = (Class)AAUIInviteMessageFlowController;
  v19 = -[AAUIInviteMessageFlowController init](&v28, sel_init);
  v20 = v19;
  if (v19)
  {
    v19->_flow = a4;
    objc_storeStrong((id *)&v19->_context, a3);
    objc_msgSend(v16, "recipients");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "firstObject");
    v22 = objc_claimAutoreleasedReturnValue();
    recipientHandle = v20->_recipientHandle;
    v20->_recipientHandle = (NSString *)v22;

    objc_storeStrong((id *)&v20->_navigationController, a5);
    objc_storeStrong((id *)&v20->_defaultMessageViewModel, a6);
    objc_storeStrong((id *)&v20->_messageSentViewModel, a7);
    v20->_isADPUpsellFlow = a8;
    v20->_isFamilyMember = a9;
    objc_storeStrong((id *)&v20->_cdpContext, a10);
  }

  return v20;
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
    _os_log_impl(&dword_1DB4ED000, v3, OS_LOG_TYPE_DEFAULT, "Initiating Trusted Contact invitation message flow...", v4, 2u);
  }

  -[AAUIInviteMessageFlowController _showDefaultMessageView](self, "_showDefaultMessageView");
}

- (void)_showActivitySpinnerInNavigationBar
{
  AAUISpinnerManager *spinnerManager;
  void *v4;
  void *v5;
  void *v6;
  AAUISpinnerManager *v7;
  AAUISpinnerManager *v8;

  spinnerManager = self->_spinnerManager;
  if (!spinnerManager)
  {
    -[AAUIInviteMessageFlowController navigationController](self, "navigationController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "topViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "navigationItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = -[AAUISpinnerManager initWithNavigationItem:hideBackButton:]([AAUISpinnerManager alloc], "initWithNavigationItem:hideBackButton:", v6, 1);
    v8 = self->_spinnerManager;
    self->_spinnerManager = v7;

    spinnerManager = self->_spinnerManager;
  }
  -[AAUISpinnerManager startNavigationSpinner](spinnerManager, "startNavigationSpinner");
}

- (void)_hideActivitySpinnerInNavigationBar
{
  AAUISpinnerManager *spinnerManager;
  AAUISpinnerManager *v4;

  spinnerManager = self->_spinnerManager;
  if (spinnerManager)
  {
    -[AAUISpinnerManager stopNavigationSpinner](spinnerManager, "stopNavigationSpinner");
    v4 = self->_spinnerManager;
    self->_spinnerManager = 0;

  }
}

- (void)_showDefaultMessageView
{
  AAUIOBWelcomeController *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  UINavigationController *navigationController;
  UINavigationController *v9;
  UINavigationController *v10;
  id v11;

  v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = -[AAUIOBWelcomeController initWithViewModel:]([AAUIOBWelcomeController alloc], "initWithViewModel:", self->_defaultMessageViewModel);
  -[AAUIOBWelcomeController primaryButton](v3, "primaryButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addTarget:action:forEvents:", self, sel__sendDefaultMessage, 64);

  -[AAUIOBWelcomeController secondaryButton](v3, "secondaryButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addTarget:action:forEvents:", self, sel__showMessagesComposeController, 64);

  if (!self->_hideCancel)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, self, sel__cancelMessageInvitationFlow);
    -[OBBaseWelcomeController navigationItem](v3, "navigationItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setLeftBarButtonItem:", v6);

    objc_msgSend(v11, "addObject:", *MEMORY[0x1E0CFAEB8]);
  }
  objc_msgSend(v11, "addObject:", CFSTR("com.apple.accountaccess.editInvite"));
  objc_msgSend(v11, "addObject:", CFSTR("com.apple.accountaccess.send"));
  -[AAUIInviteMessageFlowController _sendRecoveryContactSendMessageLandingEvent:](self, "_sendRecoveryContactSendMessageLandingEvent:", v11);
  navigationController = self->_navigationController;
  if (navigationController)
  {
    -[UINavigationController pushViewController:animated:](navigationController, "pushViewController:animated:", v3, 1);
  }
  else
  {
    v9 = (UINavigationController *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v3);
    v10 = self->_navigationController;
    self->_navigationController = v9;

  }
}

- (void)_showMessagesComposeController
{
  NSObject *v3;
  AAUIMessagesInviteConfigurationController *v4;
  AAUIMessagesInviteConfigurationController *messageComposer;
  uint8_t v6[16];

  _AAUILogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1DB4ED000, v3, OS_LOG_TYPE_DEFAULT, "Show message composer...", v6, 2u);
  }

  -[AAUIInviteMessageFlowController _sendEscapeOfferSelectedEvent:](self, "_sendEscapeOfferSelectedEvent:", CFSTR("com.apple.accountaccess.editInvite"));
  v4 = -[AAUIMessagesInviteConfigurationController initWithInviteContext:flow:presentingController:]([AAUIMessagesInviteConfigurationController alloc], "initWithInviteContext:flow:presentingController:", self->_context, self->_flow, self->_navigationController);
  messageComposer = self->_messageComposer;
  self->_messageComposer = v4;

  -[AAUIMessagesInviteConfigurationController setDelegate:](self->_messageComposer, "setDelegate:", self);
  -[AAUIMessagesInviteConfigurationController presentWhenReadyWithCompletion:](self->_messageComposer, "presentWhenReadyWithCompletion:", 0);
}

- (void)_showInvitationSent
{
  NSObject *v3;
  AAUIOBWelcomeController *v4;
  AAUIOBWelcomeController *allSetVC;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  id buf[2];

  _AAUILogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1DB4ED000, v3, OS_LOG_TYPE_DEFAULT, "Show invitation message sent UI...", (uint8_t *)buf, 2u);
  }

  v4 = -[AAUIOBWelcomeController initWithViewModel:]([AAUIOBWelcomeController alloc], "initWithViewModel:", self->_messageSentViewModel);
  allSetVC = self->_allSetVC;
  self->_allSetVC = v4;

  -[OBBaseWelcomeController navigationItem](self->_allSetVC, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHidesBackButton:", 1);

  -[AAUIOBWelcomeController primaryButton](self->_allSetVC, "primaryButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addTarget:action:forEvents:", self, sel__finishMessageInvitationFlow, 64);

  -[AAUIOBWelcomeController secondaryButton](self->_allSetVC, "secondaryButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addTarget:action:forEvents:", self, sel__messageSentSecondaryActionTapped, 64);

  objc_initWeak(buf, self);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __54__AAUIInviteMessageFlowController__showInvitationSent__block_invoke;
  v9[3] = &unk_1EA2DB728;
  objc_copyWeak(&v10, buf);
  v9[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], v9);
  objc_destroyWeak(&v10);
  objc_destroyWeak(buf);
}

void __54__AAUIInviteMessageFlowController__showInvitationSent__block_invoke(uint64_t a1)
{
  id *v2;
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained[11], "showViewController:sender:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64), 0);
  v2 = WeakRetained;
  if (*((_BYTE *)WeakRetained + 80))
  {
    if (*((_BYTE *)WeakRetained + 81))
      objc_msgSend(WeakRetained, "_postAdpUpsellCFUFamilyCustodianAddedEvent");
    else
      objc_msgSend(WeakRetained, "_postAdpUpsellCFUCustodianInviteSentEvent");
    v2 = WeakRetained;
  }

}

- (void)_postAdpUpsellCFUFamilyCustodianAddedEvent
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
  objc_msgSend(v3, "analyticsEventWithName:altDSID:flowID:", CFSTR("com.apple.appleaccount.familyCustodianAdded"), v4, v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CFABB8], "reporter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sendEvent:", v7);

}

- (void)_postAdpUpsellCFUCustodianInviteSentEvent
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
  objc_msgSend(v3, "analyticsEventWithName:altDSID:flowID:", CFSTR("com.apple.appleaccount.custodianInviteSent"), v4, v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CFABB8], "reporter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sendEvent:", v7);

}

- (void)_invitationWasSent
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id location;

  WeakRetained = objc_loadWeakRetained((id *)&self->_accountManager);
  objc_msgSend(WeakRetained, "accounts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CFCF18]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0CF0E68];
    v7 = *MEMORY[0x1E0CFADE0];
    objc_msgSend(v5, "aida_alternateDSID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAUIInviteMessageFlowController telemetryFlowID](self, "telemetryFlowID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "analyticsEventWithName:altDSID:flowID:", v7, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }
  -[AAUIInviteMessageFlowController delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0)
  {
    objc_initWeak(&location, self);
    -[AAUIInviteMessageFlowController delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __53__AAUIInviteMessageFlowController__invitationWasSent__block_invoke;
    v14[3] = &unk_1EA2DD510;
    v14[4] = self;
    v15 = v10;
    objc_copyWeak(&v16, &location);
    objc_msgSend(v13, "inviteMessageWasSent:completion:", self, v14);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  else
  {
    -[AAUIInviteMessageFlowController _showInvitationSent](self, "_showInvitationSent");
    -[AAUIInviteMessageFlowController _sendTelemetryEventWithSuccess:didSucceed:error:](self, "_sendTelemetryEventWithSuccess:didSucceed:error:", v10, 1, 0);
  }

}

void __53__AAUIInviteMessageFlowController__invitationWasSent__block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  id *v7;
  id WeakRetained;

  v5 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v7 = (id *)(a1 + 48);
  if (a2)
  {
    objc_msgSend(v5, "_sendTelemetryEventWithSuccess:didSucceed:error:", v6, 1, 0);
    WeakRetained = objc_loadWeakRetained(v7);
    objc_msgSend(WeakRetained, "_showInvitationSent");
  }
  else
  {
    objc_msgSend(v5, "_sendTelemetryEventWithSuccess:didSucceed:error:", v6, 0, a3);
    WeakRetained = objc_loadWeakRetained(v7);
    objc_msgSend(WeakRetained, "_cancelMessageInvitationFlow");
  }

}

- (void)_sendTelemetryEventWithSuccess:(id)a3 didSucceed:(BOOL)a4 error:(id)a5
{
  _BOOL8 v5;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;

  if (a3)
  {
    v5 = a4;
    v7 = (void *)MEMORY[0x1E0CB37E8];
    v8 = a5;
    v9 = a3;
    objc_msgSend(v7, "numberWithBool:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0CF0EE0]);

    objc_msgSend(v9, "populateUnderlyingErrorsStartingWithRootError:", v8);
    objc_msgSend(MEMORY[0x1E0CFABB8], "reporter");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sendEvent:", v9);

  }
}

- (void)_cancelMessageInvitationFlow
{
  NSObject *v3;
  void *v4;
  char v5;
  void *v6;
  _QWORD block[4];
  id v8;
  id buf[2];

  _AAUILogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1DB4ED000, v3, OS_LOG_TYPE_DEFAULT, "Cancelling invitation flow...", (uint8_t *)buf, 2u);
  }

  -[AAUIInviteMessageFlowController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[AAUIInviteMessageFlowController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "inviteMessageFlowWasCancelled:", self);

  }
  else
  {
    objc_initWeak(buf, self);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __63__AAUIInviteMessageFlowController__cancelMessageInvitationFlow__block_invoke;
    block[3] = &unk_1EA2DBC18;
    objc_copyWeak(&v8, buf);
    dispatch_async(MEMORY[0x1E0C80D38], block);
    objc_destroyWeak(&v8);
    objc_destroyWeak(buf);
  }
}

void __63__AAUIInviteMessageFlowController__cancelMessageInvitationFlow__block_invoke(uint64_t a1)
{
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained[11], "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)_finishMessageInvitationFlow
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD block[4];
  id v8;
  id buf[2];

  _AAUILogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1DB4ED000, v3, OS_LOG_TYPE_DEFAULT, "Finishing invitation flow...", (uint8_t *)buf, 2u);
  }

  -[AAUIOBWelcomeController primaryButton](self->_allSetVC, "primaryButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabled:", 0);

  -[AAUIInviteMessageFlowController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[AAUIInviteMessageFlowController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "inviteMessageFlowDidFinish:", self);

  }
  else
  {
    objc_initWeak(buf, self);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __63__AAUIInviteMessageFlowController__finishMessageInvitationFlow__block_invoke;
    block[3] = &unk_1EA2DBC18;
    objc_copyWeak(&v8, buf);
    dispatch_async(MEMORY[0x1E0C80D38], block);
    objc_destroyWeak(&v8);
    objc_destroyWeak(buf);
  }
}

void __63__AAUIInviteMessageFlowController__finishMessageInvitationFlow__block_invoke(uint64_t a1)
{
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained[11], "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)_messageSentSecondaryActionTapped
{
  NSObject *v3;
  void *v4;
  char v5;
  void *v6;
  uint8_t v7[16];

  _AAUILogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1DB4ED000, v3, OS_LOG_TYPE_DEFAULT, "Invite Message Completed - Secondary Button tapped", v7, 2u);
  }

  -[AAUIInviteMessageFlowController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[AAUIInviteMessageFlowController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "inviteMessageCompleteSecondaryButtonTapped:", self);

  }
}

- (void)_sendDefaultMessage
{
  NSObject *v3;
  AAUIInviteLinkMetadataProvider *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id buf[2];

  _AAUILogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1DB4ED000, v3, OS_LOG_TYPE_DEFAULT, "Sending default message...", (uint8_t *)buf, 2u);
  }

  v4 = -[AAUIInviteLinkMetadataProvider initWithContext:]([AAUIInviteLinkMetadataProvider alloc], "initWithContext:", self->_context);
  -[AAUIInviteMessageFlowController _bubbleImageForFlow:](self, "_bubbleImageForFlow:", self->_flow);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(buf, self);
  -[AAUIInviteMessageFlowController _sendEscapeOfferSelectedEvent:](self, "_sendEscapeOfferSelectedEvent:", CFSTR("com.apple.accountaccess.send"));
  -[AAUIInviteMessageFlowController _showActivitySpinnerInNavigationBar](self, "_showActivitySpinnerInNavigationBar");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __54__AAUIInviteMessageFlowController__sendDefaultMessage__block_invoke;
  v6[3] = &unk_1EA2DD538;
  objc_copyWeak(&v7, buf);
  -[AAUIInviteLinkMetadataProvider loadMetadataWithImage:completion:](v4, "loadMetadataWithImage:completion:", v5, v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(buf);

}

void __54__AAUIInviteMessageFlowController__sendDefaultMessage__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id *WeakRetained;
  id *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  int v15;
  void *v16;
  int v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint8_t buf[4];
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_hideActivitySpinnerInNavigationBar");
    _AAUILogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v5)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v28 = v5;
        _os_log_impl(&dword_1DB4ED000, v10, OS_LOG_TYPE_DEFAULT, "Sending message with linkmetadata: %@", buf, 0xCu);
      }

      v10 = objc_alloc_init(MEMORY[0x1E0CC11D8]);
      objc_msgSend(v5, "bubbleMetadata");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setMetadata:](v10, "setMetadata:", v11);

      v26 = 0;
      -[NSObject dataRepresentationWithOutOfLineAttachments:](v10, "dataRepresentationWithOutOfLineAttachments:", &v26);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v26;
      objc_msgSend(v8[2], "inviteURL");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = IMSPISendRichLink();

      objc_msgSend(v8[2], "messageBody");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = IMSPISendMessageWithAttachments();

      if (v15 && v17)
      {
        objc_msgSend(v8, "_invitationWasSent");
      }
      else
      {
        _AAUILogSystem();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          __54__AAUIInviteMessageFlowController__sendDefaultMessage__block_invoke_cold_3(v18, v19, v20, v21, v22, v23, v24, v25);

      }
    }
    else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      __54__AAUIInviteMessageFlowController__sendDefaultMessage__block_invoke_cold_2((uint64_t)v6, v10);
    }
  }
  else
  {
    _AAUILogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      __54__AAUIInviteMessageFlowController__sendDefaultMessage__block_invoke_cold_1(v10);
  }

}

- (id)_bubbleImageForFlow:(unint64_t)a3
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  if (a3 == 1)
  {
    v3 = (void *)MEMORY[0x1E0DC3870];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = CFSTR("beneficiary_message_bubble");
  }
  else
  {
    if (a3)
    {
      v6 = 0;
      return v6;
    }
    v3 = (void *)MEMORY[0x1E0DC3870];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = CFSTR("custodian_message_bubble");
  }
  objc_msgSend(v3, "imageNamed:inBundle:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_sendRecoveryContactSendMessageLandingEvent:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_accountManager);
  objc_msgSend(WeakRetained, "accounts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CFCF18]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0CF0E68];
    v8 = *MEMORY[0x1E0CFADE8];
    objc_msgSend(v6, "aida_alternateDSID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAUIInviteMessageFlowController telemetryFlowID](self, "telemetryFlowID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "analyticsEventWithName:altDSID:flowID:", v8, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "aaf_arrayAsCommaSeperatedString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, *MEMORY[0x1E0D15798]);

    objc_msgSend(MEMORY[0x1E0CFABB8], "reporter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "sendEvent:", v11);

  }
}

- (void)_sendEscapeOfferSelectedEvent:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_accountManager);
  objc_msgSend(WeakRetained, "accounts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CFCF18]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0CF0E68];
    v8 = *MEMORY[0x1E0CFAE00];
    objc_msgSend(v6, "aida_alternateDSID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAUIInviteMessageFlowController telemetryFlowID](self, "telemetryFlowID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "analyticsEventWithName:altDSID:flowID:", v8, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0D157A0]);
    objc_msgSend(MEMORY[0x1E0CFABB8], "reporter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sendEvent:", v11);

  }
}

- (void)inviteController:(id)a3 didFinishWithStatus:(unint64_t)a4 recipients:(id)a5 userInfo:(id)a6 error:(id)a7
{
  AIDAAccountManager **p_accountManager;
  id v10;
  id WeakRetained;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint8_t v31[16];

  p_accountManager = &self->_accountManager;
  v10 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_accountManager);
  objc_msgSend(WeakRetained, "accounts");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0CFCF18]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = (void *)MEMORY[0x1E0CF0E68];
    v15 = *MEMORY[0x1E0CFADE0];
    objc_msgSend(v13, "aida_alternateDSID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAUIInviteMessageFlowController telemetryFlowID](self, "telemetryFlowID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "analyticsEventWithName:altDSID:flowID:", v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (a4)
      goto LABEL_3;
LABEL_6:
    _AAUILogSystem();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v31 = 0;
      _os_log_impl(&dword_1DB4ED000, v19, OS_LOG_TYPE_DEFAULT, "User cancelled", v31, 2u);
    }

    v20 = (void *)MEMORY[0x1E0CB35C8];
    v21 = -1;
    goto LABEL_12;
  }
  v18 = 0;
  if (!a4)
    goto LABEL_6;
LABEL_3:
  if (a4 != 1)
  {
    _AAUILogSystem();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[AAUIInviteMessageFlowController inviteController:didFinishWithStatus:recipients:userInfo:error:].cold.1(v22, v23, v24, v25, v26, v27, v28, v29);

    v20 = (void *)MEMORY[0x1E0CB35C8];
    v21 = 0;
LABEL_12:
    objc_msgSend(v20, "aa_errorWithCode:", v21);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAUIInviteMessageFlowController _sendTelemetryEventWithSuccess:didSucceed:error:](self, "_sendTelemetryEventWithSuccess:didSucceed:error:", v18, 0, v30);

    goto LABEL_13;
  }
  -[AAUIInviteMessageFlowController _invitationWasSent](self, "_invitationWasSent");
LABEL_13:
  objc_msgSend(v10, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (UINavigationController)navigationController
{
  return self->_navigationController;
}

- (void)setNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_navigationController, a3);
}

- (AAUIInviteMessageFlowControllerDelegate)delegate
{
  return (AAUIInviteMessageFlowControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)hideCancel
{
  return self->_hideCancel;
}

- (void)setHideCancel:(BOOL)a3
{
  self->_hideCancel = a3;
}

- (NSString)telemetryFlowID
{
  return self->_telemetryFlowID;
}

- (void)setTelemetryFlowID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (AIDAAccountManager)accountManager
{
  return (AIDAAccountManager *)objc_loadWeakRetained((id *)&self->_accountManager);
}

- (void)setAccountManager:(id)a3
{
  objc_storeWeak((id *)&self->_accountManager, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_accountManager);
  objc_storeStrong((id *)&self->_telemetryFlowID, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_navigationController, 0);
  objc_storeStrong((id *)&self->_cdpContext, 0);
  objc_storeStrong((id *)&self->_allSetVC, 0);
  objc_storeStrong((id *)&self->_spinnerManager, 0);
  objc_storeStrong((id *)&self->_messageComposer, 0);
  objc_storeStrong((id *)&self->_messageSentViewModel, 0);
  objc_storeStrong((id *)&self->_defaultMessageViewModel, 0);
  objc_storeStrong((id *)&self->_recipientHandle, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

- (void)initWithContext:(os_log_t)log flow:navigationController:defaultMessageViewModel:messageSentViewModel:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1DB4ED000, log, OS_LOG_TYPE_DEBUG, "Instantiating AAUIInviteMessageFlowController with nil cdpContext", v1, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __54__AAUIInviteMessageFlowController__sendDefaultMessage__block_invoke_cold_1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136315138;
  v2 = "-[AAUIInviteMessageFlowController _sendDefaultMessage]_block_invoke";
  _os_log_debug_impl(&dword_1DB4ED000, log, OS_LOG_TYPE_DEBUG, "%s failed to acquire strong ref.", (uint8_t *)&v1, 0xCu);
}

void __54__AAUIInviteMessageFlowController__sendDefaultMessage__block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1DB4ED000, a2, OS_LOG_TYPE_ERROR, "Failed to fetch metadata for message with error %@", (uint8_t *)&v2, 0xCu);
}

void __54__AAUIInviteMessageFlowController__sendDefaultMessage__block_invoke_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1DB4ED000, a1, a3, "Message did not send!", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

- (void)inviteController:(uint64_t)a3 didFinishWithStatus:(uint64_t)a4 recipients:(uint64_t)a5 userInfo:(uint64_t)a6 error:(uint64_t)a7 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1DB4ED000, a1, a3, "MFMessageComposeViewController failed with other error", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

@end
