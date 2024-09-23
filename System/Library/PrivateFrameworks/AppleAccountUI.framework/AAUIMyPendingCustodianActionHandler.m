@implementation AAUIMyPendingCustodianActionHandler

- (void)doPrimaryAction:(id)a3 specifier:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0CFAC10]);
  objc_initWeak(&location, self);
  -[AAUIMyCustodianActionHandler contact](self, "contact");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "custodianID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __65__AAUIMyPendingCustodianActionHandler_doPrimaryAction_specifier___block_invoke;
  v12[3] = &unk_1EA2DBD48;
  objc_copyWeak(&v14, &location);
  v11 = v6;
  v13 = v11;
  objc_msgSend(v8, "reSendCustodianInvitationWithCustodianID:completion:", v10, v12);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

void __65__AAUIMyPendingCustodianActionHandler_doPrimaryAction_specifier___block_invoke(uint64_t a1, void *a2)
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
  uint64_t v13;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  _AAUILogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138412290;
      v15 = v3;
      _os_log_impl(&dword_1DB4ED000, v6, OS_LOG_TYPE_DEFAULT, "Resending custodian IDS invitation completed with error: %@", (uint8_t *)&v14, 0xCu);
    }

    objc_msgSend(WeakRetained, "displayMessagesInvitationFlowWithViewController:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __65__AAUIMyPendingCustodianActionHandler_doPrimaryAction_specifier___block_invoke_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);

  }
}

- (void)displayMessagesInvitationFlowWithViewController:(id)a3
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
  block[2] = __87__AAUIMyPendingCustodianActionHandler_displayMessagesInvitationFlowWithViewController___block_invoke;
  block[3] = &unk_1EA2DB728;
  objc_copyWeak(&v8, &location);
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __87__AAUIMyPendingCustodianActionHandler_displayMessagesInvitationFlowWithViewController___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  AAUIOBTrustedContactInviteMessageModel *v10;
  void *v11;
  uint64_t v12;
  AAUIOBInvitationSentViewModel *v13;
  void *v14;
  void *v15;
  AAUIOBInvitationSentViewModel *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  AAUIInviteMessageFlowController *v22;
  id v23;
  uint64_t v24;
  id v25;
  void *v26;
  void *v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "contact");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isFamilyMember"))
      v5 = 2;
    else
      v5 = 1;

    v6 = objc_alloc(MEMORY[0x1E0CFACE0]);
    objc_msgSend(v3, "contact");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v6, "initWithType:recipientHandle:", v5, v8);

    v10 = -[AAUIOBTrustedContactInviteMessageModel initWithModel:]([AAUIOBTrustedContactInviteMessageModel alloc], "initWithModel:", v9);
    objc_msgSend(v3, "contact");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isFamilyMember") ^ 1;

    v13 = [AAUIOBInvitationSentViewModel alloc];
    objc_msgSend(v3, "contact");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[AAUIOBInvitationSentViewModel initWithType:recipientHandle:](v13, "initWithType:recipientHandle:", v12, v15);

    v17 = objc_alloc(MEMORY[0x1E0CFAC18]);
    objc_msgSend(v3, "contact");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "contact");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "custodianID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v17, "initWithLocalContact:custodianID:", v18, v20);

    v22 = [AAUIInviteMessageFlowController alloc];
    v23 = objc_alloc_init(MEMORY[0x1E0DC3A40]);
    v24 = -[AAUIInviteMessageFlowController initWithContext:flow:navigationController:defaultMessageViewModel:messageSentViewModel:](v22, "initWithContext:flow:navigationController:defaultMessageViewModel:messageSentViewModel:", v21, 0, v23, v10, v16);
    v25 = v3[8];
    v3[8] = (id)v24;

    objc_msgSend(v3[8], "start");
    objc_msgSend(*(id *)(a1 + 32), "navigationController");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3[8], "navigationController");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "presentViewController:animated:completion:", v27, 1, 0);

  }
  else
  {
    _AAUILogSystem();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      __87__AAUIMyPendingCustodianActionHandler_displayMessagesInvitationFlowWithViewController___block_invoke_cold_1(v28, v29, v30, v31, v32, v33, v34, v35);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inviteFlowController, 0);
}

void __65__AAUIMyPendingCustodianActionHandler_doPrimaryAction_specifier___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1DB4ED000, a1, a3, "Missing strong self for displaying our messages invitation controller.", a5, a6, a7, a8, 0);
}

void __87__AAUIMyPendingCustodianActionHandler_displayMessagesInvitationFlowWithViewController___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1DB4ED000, a1, a3, "Missing strong self for presenting our invitation flow controller.", a5, a6, a7, a8, 0);
}

@end
