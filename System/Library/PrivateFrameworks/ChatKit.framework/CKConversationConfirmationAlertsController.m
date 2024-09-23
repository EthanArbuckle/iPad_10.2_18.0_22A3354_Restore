@implementation CKConversationConfirmationAlertsController

- (void)presentRecoverableDeletionConfirmationsFromViewController:(id)a3 forConversations:(id)a4 alertControllerStyle:(int64_t)a5 alertsCompletedBlock:(id)a6 cancelBlock:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  BOOL v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  _QWORD aBlock[5];
  BOOL v33;

  v12 = a3;
  v13 = a6;
  v14 = a7;
  v15 = a4;
  -[CKConversationConfirmationAlertsController setShouldPromptBusinessChatSpamReason:](self, "setShouldPromptBusinessChatSpamReason:", 0);
  -[CKConversationConfirmationAlertsController setShouldPromptStopBusinessChat:](self, "setShouldPromptStopBusinessChat:", 1);
  -[CKConversationConfirmationAlertsController setPresentationViewController:](self, "setPresentationViewController:", v12);
  -[CKConversationConfirmationAlertsController setSelectedConversations:](self, "setSelectedConversations:", v15);
  -[CKConversationConfirmationAlertsController setAlertControllerStyle:](self, "setAlertControllerStyle:", a5);
  -[CKConversationConfirmationAlertsController setPresentationViewController:](self, "setPresentationViewController:", v12);
  -[CKConversationConfirmationAlertsController _identifySpamConversationsToRemove:](self, "_identifySpamConversationsToRemove:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKConversationConfirmationAlertsController setJunkConversations:](self, "setJunkConversations:", v16);

  v17 = -[CKConversationConfirmationAlertsController _shouldConfirmStopSharingLocationForConversations:](self, "_shouldConfirmStopSharingLocationForConversations:", v15);
  -[CKConversationConfirmationAlertsController _presentReportSpamReaonsControllerIfNeeded](self, "_presentReportSpamReaonsControllerIfNeeded");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKConversationConfirmationAlertsController _presentStopBusinessChatAlertIfNeededForConversations:](self, "_presentStopBusinessChatAlertIfNeededForConversations:", v15);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __175__CKConversationConfirmationAlertsController_presentRecoverableDeletionConfirmationsFromViewController_forConversations_alertControllerStyle_alertsCompletedBlock_cancelBlock___block_invoke;
  aBlock[3] = &unk_1E2755878;
  v33 = v17;
  aBlock[4] = self;
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __175__CKConversationConfirmationAlertsController_presentRecoverableDeletionConfirmationsFromViewController_forConversations_alertControllerStyle_alertsCompletedBlock_cancelBlock___block_invoke_2;
  v26[3] = &unk_1E27558F0;
  v29 = v19;
  v30 = _Block_copy(aBlock);
  v27 = v12;
  v28 = v18;
  v31 = v13;
  v20 = v13;
  v21 = v12;
  v22 = v30;
  v23 = v19;
  v24 = v18;
  v25 = _Block_copy(v26);
  -[CKConversationConfirmationAlertsController _presentRecoverableDeletionConfirmationWithConfirmedBlock:cancelBlock:](self, "_presentRecoverableDeletionConfirmationWithConfirmedBlock:cancelBlock:", v25, v14);

}

void __175__CKConversationConfirmationAlertsController_presentRecoverableDeletionConfirmationsFromViewController_forConversations_alertControllerStyle_alertsCompletedBlock_cancelBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  v4 = v3;
  if (*(_BYTE *)(a1 + 40))
  {
    v5 = v3;
    objc_msgSend(*(id *)(a1 + 32), "_presentStopSharingLocationConfirmationWithActionCompletionBlock:", v3);
LABEL_5:
    v4 = v5;
    goto LABEL_6;
  }
  if (v3)
  {
    v5 = v3;
    (*((void (**)(id))v3 + 2))(v3);
    goto LABEL_5;
  }
LABEL_6:

}

void __175__CKConversationConfirmationAlertsController_presentRecoverableDeletionConfirmationsFromViewController_forConversations_alertControllerStyle_alertsCompletedBlock_cancelBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;
  id v7;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __175__CKConversationConfirmationAlertsController_presentRecoverableDeletionConfirmationsFromViewController_forConversations_alertControllerStyle_alertsCompletedBlock_cancelBlock___block_invoke_3;
  v3[3] = &unk_1E27558C8;
  v2 = *(_QWORD *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 56);
  v4 = *(id *)(a1 + 32);
  v7 = *(id *)(a1 + 64);
  (*(void (**)(uint64_t, _QWORD *))(v2 + 16))(v2, v3);

}

void __175__CKConversationConfirmationAlertsController_presentRecoverableDeletionConfirmationsFromViewController_forConversations_alertControllerStyle_alertsCompletedBlock_cancelBlock___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __175__CKConversationConfirmationAlertsController_presentRecoverableDeletionConfirmationsFromViewController_forConversations_alertControllerStyle_alertsCompletedBlock_cancelBlock___block_invoke_4;
  v3[3] = &unk_1E27558A0;
  v2 = *(_QWORD *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  v4 = *(id *)(a1 + 32);
  v6 = *(id *)(a1 + 56);
  (*(void (**)(uint64_t, _QWORD *))(v2 + 16))(v2, v3);

}

void __175__CKConversationConfirmationAlertsController_presentRecoverableDeletionConfirmationsFromViewController_forConversations_alertControllerStyle_alertsCompletedBlock_cancelBlock___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  _QWORD v3[4];
  id v4;
  id v5;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __175__CKConversationConfirmationAlertsController_presentRecoverableDeletionConfirmationsFromViewController_forConversations_alertControllerStyle_alertsCompletedBlock_cancelBlock___block_invoke_5;
  v3[3] = &unk_1E274C2E0;
  v2 = *(_QWORD *)(a1 + 40);
  v4 = *(id *)(a1 + 32);
  v5 = *(id *)(a1 + 48);
  (*(void (**)(uint64_t, _QWORD *))(v2 + 16))(v2, v3);

}

void __175__CKConversationConfirmationAlertsController_presentRecoverableDeletionConfirmationsFromViewController_forConversations_alertControllerStyle_alertsCompletedBlock_cancelBlock___block_invoke_5(uint64_t a1)
{
  uint64_t v1;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __175__CKConversationConfirmationAlertsController_presentRecoverableDeletionConfirmationsFromViewController_forConversations_alertControllerStyle_alertsCompletedBlock_cancelBlock___block_invoke_6;
  v2[3] = &unk_1E274AED0;
  v1 = *(_QWORD *)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  +[CKUtilities onboardRecentlyDeletedIfNeeded:actionHandler:](CKUtilities, "onboardRecentlyDeletedIfNeeded:actionHandler:", v1, v2);

}

uint64_t __175__CKConversationConfirmationAlertsController_presentRecoverableDeletionConfirmationsFromViewController_forConversations_alertControllerStyle_alertsCompletedBlock_cancelBlock___block_invoke_6(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (id)_presentStopBusinessChatAlertIfNeededForConversations:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __100__CKConversationConfirmationAlertsController__presentStopBusinessChatAlertIfNeededForConversations___block_invoke;
  v8[3] = &unk_1E2755918;
  v8[4] = self;
  v9 = v4;
  v5 = v4;
  v6 = _Block_copy(v8);

  return v6;
}

void __100__CKConversationConfirmationAlertsController__presentStopBusinessChatAlertIfNeededForConversations___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void (**v4)(void);
  void (**v5)(void);

  v5 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "shouldPromptStopBusinessChat") & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_identifyBusinessConversationToRemove:", *(_QWORD *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      objc_msgSend(*(id *)(a1 + 32), "_presentEndBusinessChatConfirmationForBusinessConversation:actionCompletionBlock:", v3, v5);
    }
    else if (v5)
    {
      v5[2]();
    }

    goto LABEL_9;
  }
  v4 = v5;
  if (v5)
  {
    ((void (*)(void (**)(void)))v5[2])(v5);
LABEL_9:
    v4 = v5;
  }

}

- (id)_presentReportSpamReaonsControllerIfNeeded
{
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __88__CKConversationConfirmationAlertsController__presentReportSpamReaonsControllerIfNeeded__block_invoke;
  aBlock[3] = &unk_1E2755010;
  aBlock[4] = self;
  return _Block_copy(aBlock);
}

void __88__CKConversationConfirmationAlertsController__presentReportSpamReaonsControllerIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  void (**v3)(_QWORD);
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  void (**v14)(_QWORD);
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "shouldPromptBusinessChatSpamReason") & 1) != 0)
  {
    v4 = (void *)objc_opt_new();
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "junkConversations");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v16 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          if (objc_msgSend(v10, "shouldPresentSpamReasonPicker"))
            objc_msgSend(v4, "addObject:", v10);
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v7);
    }

    if (objc_msgSend(v4, "count"))
    {
      objc_msgSend(*(id *)(a1 + 32), "setShouldPromptStopBusinessChat:", 0);
      v11 = *(void **)(a1 + 32);
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __88__CKConversationConfirmationAlertsController__presentReportSpamReaonsControllerIfNeeded__block_invoke_2;
      v12[3] = &unk_1E274C2E0;
      v13 = v4;
      v14 = v3;
      objc_msgSend(v11, "_presentReportSpamReasonWithConversations:didReportBlock:", v13, v12);

    }
    else
    {
      v3[2](v3);
    }

  }
  else
  {
    v3[2](v3);
  }

}

uint64_t __88__CKConversationConfirmationAlertsController__presentReportSpamReaonsControllerIfNeeded__block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t result;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v6), "chat", (_QWORD)v9);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "closeSession");

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_presentRecoverableDeletionConfirmationWithConfirmedBlock:(id)a3 cancelBlock:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  _QWORD v33[5];
  id v34;
  _QWORD v35[4];
  id v36;
  _QWORD v37[4];
  id v38;

  v6 = a3;
  v31 = a4;
  v7 = 2 * (CKIsRunningInMacCatalyst() == 0);
  CKFrameworkBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("DELETE"), &stru_1E276D870, CFSTR("ChatKit"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __116__CKConversationConfirmationAlertsController__presentRecoverableDeletionConfirmationWithConfirmedBlock_cancelBlock___block_invoke;
  v37[3] = &unk_1E274B330;
  v30 = v6;
  v38 = v30;
  +[CKAlertAction actionWithTitle:style:handler:](CKAlertAction, "actionWithTitle:style:handler:", v9, v7, v37);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  CKFrameworkBundle();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1E276D870, CFSTR("ChatKit"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v10;
  v35[1] = 3221225472;
  v35[2] = __116__CKConversationConfirmationAlertsController__presentRecoverableDeletionConfirmationWithConfirmedBlock_cancelBlock___block_invoke_2;
  v35[3] = &unk_1E274B330;
  v14 = v31;
  v36 = v14;
  +[CKAlertAction actionWithTitle:style:handler:](CKAlertAction, "actionWithTitle:style:handler:", v13, 1, v35);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[CKConversationConfirmationAlertsController alertControllerStyle](self, "alertControllerStyle") == 1)
  {
    -[CKConversationConfirmationAlertsController selectedConversations](self, "selectedConversations");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKConversationConfirmationAlertsController _moveToRecentlyDeletedAlertTitleForConversationsCount:](self, "_moveToRecentlyDeletedAlertTitleForConversationsCount:", objc_msgSend(v16, "count"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v17 = 0;
  }
  -[CKConversationConfirmationAlertsController junkConversations](self, "junkConversations");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "count");

  if (v19)
  {
    -[CKConversationConfirmationAlertsController _reportSpamConfirmationMessageForJunkConversations](self, "_reportSpamConfirmationMessageForJunkConversations");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    CKFrameworkBundle();
    v32 = v11;
    v21 = v17;
    v22 = v15;
    v23 = v14;
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("REPORT_SPAM_ALERT_BUTTON_TITLE"), &stru_1E276D870, CFSTR("ChatKit"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = v10;
    v33[1] = 3221225472;
    v33[2] = __116__CKConversationConfirmationAlertsController__presentRecoverableDeletionConfirmationWithConfirmedBlock_cancelBlock___block_invoke_3;
    v33[3] = &unk_1E2755940;
    v33[4] = self;
    v34 = v30;
    +[CKAlertAction actionWithTitle:style:handler:](CKAlertAction, "actionWithTitle:style:handler:", v25, 2, v33);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = v23;
    v15 = v22;
    v17 = v21;
    v11 = v32;
    +[CKAlertController alertControllerWithTitle:message:preferredStyle:](CKAlertController, "alertControllerWithTitle:message:preferredStyle:", v17, v20, -[CKConversationConfirmationAlertsController alertControllerStyle](self, "alertControllerStyle"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addAction:", v32);
    objc_msgSend(v27, "addAction:", v26);

  }
  else
  {
    -[CKConversationConfirmationAlertsController selectedConversations](self, "selectedConversations");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKConversationConfirmationAlertsController _conversationDeletionAlertMessageForConversations:](self, "_conversationDeletionAlertMessageForConversations:", v28);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    +[CKAlertController alertControllerWithTitle:message:preferredStyle:](CKAlertController, "alertControllerWithTitle:message:preferredStyle:", v17, v20, -[CKConversationConfirmationAlertsController alertControllerStyle](self, "alertControllerStyle"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addAction:", v11);
  }

  objc_msgSend(v27, "addAction:", v15);
  objc_msgSend(v27, "setPreferredAction:", v11);
  -[CKConversationConfirmationAlertsController _configureAppearanceForAlertController:](self, "_configureAppearanceForAlertController:", v27);
  -[CKConversationConfirmationAlertsController presentationViewController](self, "presentationViewController");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "presentFromViewController:animated:completion:", v29, 1, 0);

}

uint64_t __116__CKConversationConfirmationAlertsController__presentRecoverableDeletionConfirmationWithConfirmedBlock_cancelBlock___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __116__CKConversationConfirmationAlertsController__presentRecoverableDeletionConfirmationWithConfirmedBlock_cancelBlock___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __116__CKConversationConfirmationAlertsController__presentRecoverableDeletionConfirmationWithConfirmedBlock_cancelBlock___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "junkConversations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_markConversationsAsSpam:", v3);

  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "setShouldPromptBusinessChatSpamReason:", 1);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

- (void)_presentReportSpamReasonWithConversations:(id)a3 didReportBlock:(id)a4
{
  id v6;
  id v7;
  CKReportSpamReasonContoller *v8;
  id v9;
  CKReportSpamReasonContoller *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  CKConversationConfirmationAlertsController *v18;
  id v19;

  v6 = a4;
  v7 = a3;
  v8 = [CKReportSpamReasonContoller alloc];
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __103__CKConversationConfirmationAlertsController__presentReportSpamReasonWithConversations_didReportBlock___block_invoke;
  v17 = &unk_1E274C2E0;
  v18 = self;
  v19 = v6;
  v9 = v6;
  v10 = -[CKReportSpamReasonContoller initWithConversations:didReportBlock:](v8, "initWithConversations:didReportBlock:", v7, &v14);

  v11 = objc_alloc(MEMORY[0x1E0CEA7B8]);
  v12 = (void *)objc_msgSend(v11, "initWithRootViewController:", v10, v14, v15, v16, v17, v18);
  objc_msgSend(v12, "setModalPresentationStyle:", 2);
  -[CKConversationConfirmationAlertsController presentationViewController](self, "presentationViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "presentViewController:animated:completion:", v12, 1, 0);

}

uint64_t __103__CKConversationConfirmationAlertsController__presentReportSpamReasonWithConversations_didReportBlock___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "presentationViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 1, 0);

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_presentEndBusinessChatConfirmationForBusinessConversation:(id)a3 actionCompletionBlock:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  _QWORD aBlock[4];
  id v31;
  id v32;

  v5 = a3;
  v6 = a4;
  v7 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __127__CKConversationConfirmationAlertsController__presentEndBusinessChatConfirmationForBusinessConversation_actionCompletionBlock___block_invoke;
  aBlock[3] = &unk_1E274C780;
  v31 = v5;
  v32 = v6;
  v25 = v6;
  v24 = v5;
  v8 = _Block_copy(aBlock);
  CKFrameworkBundle();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("BUSINESS_LEAVE_CONVERSATION_BUTTON"), &stru_1E276D870, CFSTR("ChatKit"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v7;
  v28[1] = 3221225472;
  v28[2] = __127__CKConversationConfirmationAlertsController__presentEndBusinessChatConfirmationForBusinessConversation_actionCompletionBlock___block_invoke_2;
  v28[3] = &unk_1E274B330;
  v11 = v8;
  v29 = v11;
  +[CKAlertAction actionWithTitle:style:handler:](CKAlertAction, "actionWithTitle:style:handler:", v10, 0, v28);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  CKFrameworkBundle();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("BUSINESS_LEAVE_CONVERSATION_NOT_NOW_BUTTON"), &stru_1E276D870, CFSTR("ChatKit"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v7;
  v26[1] = 3221225472;
  v26[2] = __127__CKConversationConfirmationAlertsController__presentEndBusinessChatConfirmationForBusinessConversation_actionCompletionBlock___block_invoke_3;
  v26[3] = &unk_1E274B330;
  v27 = v11;
  v15 = v11;
  +[CKAlertAction actionWithTitle:style:handler:](CKAlertAction, "actionWithTitle:style:handler:", v14, 1, v26);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  CKFrameworkBundle();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("BUSINESS_LEAVE_CONVERSATION_TITLE"), &stru_1E276D870, CFSTR("ChatKit"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  CKFrameworkBundle();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("BUSINESS_LEAVE_CONVERSATION_MESSAGE"), &stru_1E276D870, CFSTR("ChatKit"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKAlertController alertControllerWithTitle:message:preferredStyle:](CKAlertController, "alertControllerWithTitle:message:preferredStyle:", v18, v20, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "addAction:", v12);
  objc_msgSend(v21, "addAction:", v16);
  objc_msgSend(v21, "setPreferredAction:", v12);
  -[CKConversationConfirmationAlertsController presentationViewController](self, "presentationViewController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "presentFromViewController:animated:completion:", v22, 1, 0);

}

uint64_t __127__CKConversationConfirmationAlertsController__presentEndBusinessChatConfirmationForBusinessConversation_actionCompletionBlock___block_invoke(uint64_t a1, int a2)
{
  void *v3;
  uint64_t result;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "chat");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "closeSession");

  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __127__CKConversationConfirmationAlertsController__presentEndBusinessChatConfirmationForBusinessConversation_actionCompletionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __127__CKConversationConfirmationAlertsController__presentEndBusinessChatConfirmationForBusinessConversation_actionCompletionBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_presentStopSharingLocationConfirmationWithActionCompletionBlock:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  _QWORD aBlock[5];
  id v26;
  id v27;
  id location[2];

  v4 = a3;
  location[0] = 0;
  objc_initWeak(location, self);
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __111__CKConversationConfirmationAlertsController__presentStopSharingLocationConfirmationWithActionCompletionBlock___block_invoke;
  aBlock[3] = &unk_1E2755968;
  objc_copyWeak(&v27, location);
  aBlock[4] = self;
  v6 = v4;
  v26 = v6;
  v7 = _Block_copy(aBlock);
  CKFrameworkBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("YES"), &stru_1E276D870, CFSTR("ChatKit"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v5;
  v23[1] = 3221225472;
  v23[2] = __111__CKConversationConfirmationAlertsController__presentStopSharingLocationConfirmationWithActionCompletionBlock___block_invoke_2;
  v23[3] = &unk_1E274B330;
  v10 = v7;
  v24 = v10;
  +[CKAlertAction actionWithTitle:style:handler:](CKAlertAction, "actionWithTitle:style:handler:", v9, 0, v23);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  CKFrameworkBundle();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("NO"), &stru_1E276D870, CFSTR("ChatKit"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v5;
  v21[1] = 3221225472;
  v21[2] = __111__CKConversationConfirmationAlertsController__presentStopSharingLocationConfirmationWithActionCompletionBlock___block_invoke_3;
  v21[3] = &unk_1E274B330;
  v14 = v10;
  v22 = v14;
  +[CKAlertAction actionWithTitle:style:handler:](CKAlertAction, "actionWithTitle:style:handler:", v13, 1, v21);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKConversationConfirmationAlertsController selectedConversations](self, "selectedConversations");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v16, "count") >= 2)
  {
    CKFrameworkBundle();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("STOP_SHARING_ON_BULK_DELETE_BODY"), &stru_1E276D870, CFSTR("ChatKit"));
  }
  else
  {
    CKFrameworkBundle();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("STOP_SHARING_ON_DELETE_OR_LEAVE_BODY"), &stru_1E276D870, CFSTR("ChatKit"));
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  +[CKAlertController alertControllerWithTitle:message:preferredStyle:](CKAlertController, "alertControllerWithTitle:message:preferredStyle:", 0, v18, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addAction:", v11);
  objc_msgSend(v19, "addAction:", v15);
  objc_msgSend(v19, "setPreferredAction:", v11);
  -[CKConversationConfirmationAlertsController presentationViewController](self, "presentationViewController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "presentFromViewController:animated:completion:", v20, 1, 0);

  objc_destroyWeak(&v27);
  objc_destroyWeak(location);

}

uint64_t __111__CKConversationConfirmationAlertsController__presentStopSharingLocationConfirmationWithActionCompletionBlock___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained;
  void *v4;
  uint64_t result;

  if (a2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "selectedConversations");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_stopSharingLocationInConversations:", v4);

  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __111__CKConversationConfirmationAlertsController__presentStopSharingLocationConfirmationWithActionCompletionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __111__CKConversationConfirmationAlertsController__presentStopSharingLocationConfirmationWithActionCompletionBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)_reportSpamConfirmationMessageForJunkConversations
{
  void *v3;
  unint64_t v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  const __CFString *v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  __CFString *v25;
  const __CFString *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;

  -[CKConversationConfirmationAlertsController _spamReportDestinationsForJunkConversations](self, "_spamReportDestinationsForJunkConversations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");
  objc_msgSend(MEMORY[0x1E0CB3738], "localizedStringByJoiningStrings:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CKConversationConfirmationAlertsController _isStoredOnIcloud](self, "_isStoredOnIcloud");
  if (v4 >= 2)
  {
    if (v6)
    {
      -[CKConversationConfirmationAlertsController selectedConversations](self, "selectedConversations");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "count");
      v9 = (void *)MEMORY[0x1E0CB3940];
      CKFrameworkBundle();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8 >= 2)
      {
        v11 = CFSTR("BATCH_DELETE_AND_REPORT_APPLE_CARRIER_ALERT_MESSAGE_ICLOUD");
        goto LABEL_17;
      }
      v21 = CFSTR("DELETE_AND_REPORT_APPLE_CARRIER_ALERT_MESSAGE_ICLOUD");
LABEL_27:
      objc_msgSend(v10, "localizedStringForKey:value:table:", v21, &stru_1E276D870, CFSTR("ChatKit"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringWithFormat:", v28, v5);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "userInterfaceLayoutDirection");

      if (v30 == 1)
        v25 = CFSTR("\u200F");
      else
        v25 = CFSTR("\u200E");
      goto LABEL_30;
    }
    v13 = -[CKConversationConfirmationAlertsController alertControllerStyle](self, "alertControllerStyle");
    -[CKConversationConfirmationAlertsController selectedConversations](self, "selectedConversations");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v7, "count");
    v9 = (void *)MEMORY[0x1E0CB3940];
    CKFrameworkBundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13 == 1)
    {
      if (v14 >= 2)
      {
        v21 = CFSTR("BATCH_DELETE_AND_REPORT_APPLE_CARRIER_ALERT_MESSAGE");
        goto LABEL_27;
      }
      v11 = CFSTR("DELETE_AND_REPORT_APPLE_CARRIER_ALERT_MESSAGE");
    }
    else
    {
      if (v14 >= 2)
      {
        v21 = CFSTR("BATCH_DELETE_AND_REPORT_APPLE_CARRIER_ALERT_MESSAGE_IPHONE");
        goto LABEL_27;
      }
      v11 = CFSTR("DELETE_AND_REPORT_APPLE_CARRIER_ALERT_MESSAGE_IPHONE");
    }
LABEL_17:
    objc_msgSend(v10, "localizedStringForKey:value:table:", v11, &stru_1E276D870, CFSTR("ChatKit"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", v22, v5);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "userInterfaceLayoutDirection");

    if (v24 == 1)
      v25 = CFSTR("\u200F");
    else
      v25 = CFSTR("\u200E");
LABEL_30:
    -[__CFString stringByAppendingString:](v25, "stringByAppendingString:", v18);
    v27 = objc_claimAutoreleasedReturnValue();
    goto LABEL_31;
  }
  if (v6)
  {
    -[CKConversationConfirmationAlertsController selectedConversations](self, "selectedConversations");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v7, "count");
    v9 = (void *)MEMORY[0x1E0CB3940];
    CKFrameworkBundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12 >= 2)
    {
      v21 = CFSTR("BATCH_DELETE_AND_REPORT_APPLE_ALERT_MESSAGE_ICLOUD");
      goto LABEL_27;
    }
    v11 = CFSTR("DELETE_AND_REPORT_APPLE_ALERT_MESSAGE_ICLOUD");
    goto LABEL_17;
  }
  v15 = -[CKConversationConfirmationAlertsController alertControllerStyle](self, "alertControllerStyle");
  -[CKConversationConfirmationAlertsController selectedConversations](self, "selectedConversations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v7, "count");
  CKFrameworkBundle();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v15 == 1)
  {
    v19 = CFSTR("BATCH_DELETE_AND_REPORT_APPLE_ALERT_MESSAGE");
    v20 = CFSTR("DELETE_AND_REPORT_APPLE_ALERT_MESSAGE");
  }
  else
  {
    v19 = CFSTR("BATCH_DELETE_AND_REPORT_APPLE_ALERT_MESSAGE_IPHONE");
    v20 = CFSTR("DELETE_AND_REPORT_APPLE_ALERT_MESSAGE_IPHONE");
  }
  if (v16 >= 2)
    v26 = v19;
  else
    v26 = v20;
  objc_msgSend(v17, "localizedStringForKey:value:table:", v26, &stru_1E276D870, CFSTR("ChatKit"));
  v27 = objc_claimAutoreleasedReturnValue();
LABEL_31:
  v31 = (void *)v27;

  return v31;
}

- (id)_spamReportDestinationsForJunkConversations
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v25;
  id obj;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v25 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  -[CKConversationConfirmationAlertsController junkConversations](self, "junkConversations");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v27)
  {
    v3 = *(_QWORD *)v29;
    v4 = (_QWORD *)MEMORY[0x1E0D38E90];
    do
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v29 != v3)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v6, "chat");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "account");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "service");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v9, "supportsCapability:", *v4) & 1) != 0)
        {
          v10 = (void *)MEMORY[0x1E0D35778];
          objc_msgSend(v6, "chat");
          v11 = v3;
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "lastFinishedMessageItem");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "chat");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v10) = objc_msgSend(v10, "isReportJunkServiceAllowedForMessageItem:junkChatStyle:", v13, objc_msgSend(v14, "chatStyle"));

          v3 = v11;
          v4 = (_QWORD *)MEMORY[0x1E0D38E90];

          if (!(_DWORD)v10)
            continue;
          v15 = (void *)MEMORY[0x1E0D39730];
          objc_msgSend(v6, "chat");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "lastFinishedMessageItem");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "destinationCallerID");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "carrierNameForPhoneNumber:", v18);
          v7 = (void *)objc_claimAutoreleasedReturnValue();

          if (v7)
            objc_msgSend(v25, "addObject:", v7);
        }
        else
        {

        }
      }
      v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v27);
  }

  v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (objc_msgSend(v25, "count"))
  {
    objc_msgSend(v25, "allObjects");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObjectsFromArray:", v20);

  }
  CKFrameworkBundle();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("APPLE"), &stru_1E276D870, CFSTR("ChatKit"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addObject:", v22);

  v23 = (void *)objc_msgSend(v19, "copy");
  return v23;
}

- (void)presentRecoverableDeletionConfirmationsFromViewController:(id)a3 forMessagesCount:(unint64_t)a4 alertControllerStyle:(int64_t)a5 sender:(id)a6 alertsCompletedBlock:(id)a7 cancelBlock:(id)a8
{
  id v14;
  id v15;
  id v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  __CFString *v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id WeakRetained;
  void *v36;
  id v37;
  id v38;
  void *v39;
  id v40;
  _QWORD v41[4];
  id v42;
  _QWORD v43[4];
  id v44;
  id v45;
  id location[2];

  v14 = a3;
  v15 = a6;
  v16 = a7;
  v40 = a8;
  if (a4)
  {
    location[0] = 0;
    objc_initWeak(location, self);
    -[CKConversationConfirmationAlertsController setPresentationViewController:](self, "setPresentationViewController:", v14);
    -[CKConversationConfirmationAlertsController setAlertControllerStyle:](self, "setAlertControllerStyle:", a5);
    if (CKIsRunningInMacCatalyst())
    {
      CKFrameworkBundle();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("DELETE"), &stru_1E276D870, CFSTR("ChatKit"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19 = (void *)MEMORY[0x1E0CB3940];
      CKFrameworkBundle();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("DELETE_MESSAGES"), &stru_1E276D870, CFSTR("ChatKit"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "localizedStringWithFormat:", v21, a4);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "userInterfaceLayoutDirection");

      if (v23 == 1)
        v24 = CFSTR("\u200F");
      else
        v24 = CFSTR("\u200E");
      -[__CFString stringByAppendingString:](v24, "stringByAppendingString:", v17);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v38 = v15;

    v25 = 2 * (CKIsRunningInMacCatalyst() == 0);
    v26 = MEMORY[0x1E0C809B0];
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = __182__CKConversationConfirmationAlertsController_presentRecoverableDeletionConfirmationsFromViewController_forMessagesCount_alertControllerStyle_sender_alertsCompletedBlock_cancelBlock___block_invoke;
    v43[3] = &unk_1E2755940;
    v27 = v14;
    v44 = v27;
    v37 = v16;
    v45 = v16;
    +[CKAlertAction actionWithTitle:style:handler:](CKAlertAction, "actionWithTitle:style:handler:", v39, v25, v43);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    CKFrameworkBundle();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1E276D870, CFSTR("ChatKit"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v41[0] = v26;
    v41[1] = 3221225472;
    v41[2] = __182__CKConversationConfirmationAlertsController_presentRecoverableDeletionConfirmationsFromViewController_forMessagesCount_alertControllerStyle_sender_alertsCompletedBlock_cancelBlock___block_invoke_3;
    v41[3] = &unk_1E274B330;
    v42 = v40;
    +[CKAlertAction actionWithTitle:style:handler:](CKAlertAction, "actionWithTitle:style:handler:", v30, 1, v41);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKConversationConfirmationAlertsController _moveToRecentlyDeletedAlertTitleForMessagesCount:](self, "_moveToRecentlyDeletedAlertTitleForMessagesCount:", a4);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKConversationConfirmationAlertsController _moveToRecentlyDeletedAlertMessageForMessagesCount:](self, "_moveToRecentlyDeletedAlertMessageForMessagesCount:", a4);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKAlertController alertControllerWithTitle:message:preferredStyle:](CKAlertController, "alertControllerWithTitle:message:preferredStyle:", v32, v33, -[CKConversationConfirmationAlertsController alertControllerStyle](self, "alertControllerStyle"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addAction:", v28);
    objc_msgSend(v34, "addAction:", v31);
    objc_msgSend(v34, "setPreferredAction:", v28);
    WeakRetained = objc_loadWeakRetained(location);
    objc_msgSend(WeakRetained, "_configureAppearanceForAlertController:", v34);

    if (!a5)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v34, "popoverPresentationController");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "setBarButtonItem:", v38);

      }
    }
    objc_msgSend(v34, "presentFromViewController:animated:completion:", v27, 1, 0);

    objc_destroyWeak(location);
    v16 = v37;
    v15 = v38;
  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl(&dword_18DFCD000, v18, OS_LOG_TYPE_INFO, "Delete requested on 0 messages", (uint8_t *)location, 2u);
    }

  }
}

void __182__CKConversationConfirmationAlertsController_presentRecoverableDeletionConfirmationsFromViewController_forMessagesCount_alertControllerStyle_sender_alertsCompletedBlock_cancelBlock___block_invoke(uint64_t a1)
{
  uint64_t v1;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __182__CKConversationConfirmationAlertsController_presentRecoverableDeletionConfirmationsFromViewController_forMessagesCount_alertControllerStyle_sender_alertsCompletedBlock_cancelBlock___block_invoke_2;
  v2[3] = &unk_1E274AED0;
  v1 = *(_QWORD *)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  +[CKUtilities onboardRecentlyDeletedIfNeeded:actionHandler:](CKUtilities, "onboardRecentlyDeletedIfNeeded:actionHandler:", v1, v2);

}

uint64_t __182__CKConversationConfirmationAlertsController_presentRecoverableDeletionConfirmationsFromViewController_forMessagesCount_alertControllerStyle_sender_alertsCompletedBlock_cancelBlock___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __182__CKConversationConfirmationAlertsController_presentRecoverableDeletionConfirmationsFromViewController_forMessagesCount_alertControllerStyle_sender_alertsCompletedBlock_cancelBlock___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)presentPermanentDeletionConfirmationFromViewController:(id)a3 forConversations:(id)a4 alertControllerStyle:(int64_t)a5 alertsCompletedBlock:(id)a6 cancelBlock:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  unint64_t v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  __CFString *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  _QWORD v39[4];
  id v40;
  _QWORD v41[4];
  id v42;
  uint8_t buf[16];

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  v16 = -[CKConversationConfirmationAlertsController _numberOfRecoverableMessagesInConversations:](self, "_numberOfRecoverableMessagesInConversations:", v13);
  if (v16)
  {
    v17 = v16;
    v36 = v12;
    -[CKConversationConfirmationAlertsController setPresentationViewController:](self, "setPresentationViewController:", v12);
    -[CKConversationConfirmationAlertsController setAlertControllerStyle:](self, "setAlertControllerStyle:", a5);
    v18 = (void *)MEMORY[0x1E0CB3940];
    CKFrameworkBundle();
    v19 = v15;
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("DELETE_MESSAGES"), &stru_1E276D870, CFSTR("ChatKit"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localizedStringWithFormat:", v21, v17);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "userInterfaceLayoutDirection");

    if (v24 == 1)
      v25 = CFSTR("\u200F");
    else
      v25 = CFSTR("\u200E");
    -[__CFString stringByAppendingString:](v25, "stringByAppendingString:", v22);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = MEMORY[0x1E0C809B0];
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __172__CKConversationConfirmationAlertsController_presentPermanentDeletionConfirmationFromViewController_forConversations_alertControllerStyle_alertsCompletedBlock_cancelBlock___block_invoke;
    v41[3] = &unk_1E274B330;
    v38 = v14;
    v42 = v14;
    +[CKAlertAction actionWithTitle:style:handler:](CKAlertAction, "actionWithTitle:style:handler:", v26, 2, v41);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    CKFrameworkBundle();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1E276D870, CFSTR("ChatKit"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = v27;
    v39[1] = 3221225472;
    v39[2] = __172__CKConversationConfirmationAlertsController_presentPermanentDeletionConfirmationFromViewController_forConversations_alertControllerStyle_alertsCompletedBlock_cancelBlock___block_invoke_2;
    v39[3] = &unk_1E274B330;
    v37 = v19;
    v40 = v19;
    +[CKAlertAction actionWithTitle:style:handler:](CKAlertAction, "actionWithTitle:style:handler:", v30, 1, v39);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKConversationConfirmationAlertsController _permanentDeletionAlertTitleForCount:](self, "_permanentDeletionAlertTitleForCount:", v17);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (a5 == 1)
    {
      -[CKConversationConfirmationAlertsController _permanentDeletionAlertMessageForCount:](self, "_permanentDeletionAlertMessageForCount:", v17);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v33 = 0;
    }
    +[CKAlertController alertControllerWithTitle:message:preferredStyle:](CKAlertController, "alertControllerWithTitle:message:preferredStyle:", v32, v33, -[CKConversationConfirmationAlertsController alertControllerStyle](self, "alertControllerStyle"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "addAction:", v28);
    objc_msgSend(v35, "addAction:", v31);
    objc_msgSend(v35, "setPreferredAction:", v28);
    -[CKConversationConfirmationAlertsController _configureAppearanceForAlertController:](self, "_configureAppearanceForAlertController:", v35);
    v12 = v36;
    objc_msgSend(v35, "presentFromViewController:animated:completion:", v36, 1, 0);

    v14 = v38;
    v15 = v37;
  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DFCD000, v34, OS_LOG_TYPE_INFO, "Delete requested on 0 messages", buf, 2u);
    }

  }
}

uint64_t __172__CKConversationConfirmationAlertsController_presentPermanentDeletionConfirmationFromViewController_forConversations_alertControllerStyle_alertsCompletedBlock_cancelBlock___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __172__CKConversationConfirmationAlertsController_presentPermanentDeletionConfirmationFromViewController_forConversations_alertControllerStyle_alertsCompletedBlock_cancelBlock___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)presentPermanentJunkDeletionConfirmationFromViewController:(id)a3 forConversations:(id)a4 alertControllerStyle:(int64_t)a5 alertsCompletedBlock:(id)a6 cancelBlock:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  __CFString *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  int64_t v44;
  id v45;
  id v46;
  void *v47;
  void *v48;
  id v49;
  id v50;
  void *v51;
  _QWORD v52[5];
  id v53;
  id v54;
  _QWORD v55[4];
  id v56;
  _QWORD v57[5];
  id v58;
  _QWORD aBlock[4];
  id v60;
  uint8_t buf[16];

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  v16 = objc_msgSend(v13, "count");
  if (v16)
  {
    v17 = v16;
    v50 = v12;
    -[CKConversationConfirmationAlertsController setPresentationViewController:](self, "setPresentationViewController:", v12);
    v44 = a5;
    -[CKConversationConfirmationAlertsController setAlertControllerStyle:](self, "setAlertControllerStyle:", a5);
    v46 = v13;
    -[CKConversationConfirmationAlertsController _identifySpamConversationsToRemove:](self, "_identifySpamConversationsToRemove:", v13);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKConversationConfirmationAlertsController setJunkConversations:](self, "setJunkConversations:", v18);

    v19 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __176__CKConversationConfirmationAlertsController_presentPermanentJunkDeletionConfirmationFromViewController_forConversations_alertControllerStyle_alertsCompletedBlock_cancelBlock___block_invoke;
    aBlock[3] = &unk_1E274AED0;
    v49 = v14;
    v45 = v14;
    v60 = v45;
    v20 = _Block_copy(aBlock);
    -[CKConversationConfirmationAlertsController _presentReportSpamReaonsControllerIfNeeded](self, "_presentReportSpamReaonsControllerIfNeeded");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)MEMORY[0x1E0CB3940];
    CKFrameworkBundle();
    v51 = v15;
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("DELETE_CONVERSATION"), &stru_1E276D870, CFSTR("ChatKit"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "localizedStringWithFormat:", v23, v17);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "userInterfaceLayoutDirection");

    if (v26 == 1)
      v27 = CFSTR("\u200F");
    else
      v27 = CFSTR("\u200E");
    -[__CFString stringByAppendingString:](v27, "stringByAppendingString:", v24);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    v57[0] = v19;
    v57[1] = 3221225472;
    v57[2] = __176__CKConversationConfirmationAlertsController_presentPermanentJunkDeletionConfirmationFromViewController_forConversations_alertControllerStyle_alertsCompletedBlock_cancelBlock___block_invoke_2;
    v57[3] = &unk_1E2755990;
    v29 = v20;
    v57[4] = self;
    v58 = v29;
    +[CKAlertAction actionWithTitle:style:handler:](CKAlertAction, "actionWithTitle:style:handler:", v28, 2, v57);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    CKFrameworkBundle();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1E276D870, CFSTR("ChatKit"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v55[0] = v19;
    v55[1] = 3221225472;
    v55[2] = __176__CKConversationConfirmationAlertsController_presentPermanentJunkDeletionConfirmationFromViewController_forConversations_alertControllerStyle_alertsCompletedBlock_cancelBlock___block_invoke_3;
    v55[3] = &unk_1E274B330;
    v56 = v51;
    +[CKAlertAction actionWithTitle:style:handler:](CKAlertAction, "actionWithTitle:style:handler:", v32, 1, v55);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[CKConversationConfirmationAlertsController alertControllerStyle](self, "alertControllerStyle") == 1)
    {
      -[CKConversationConfirmationAlertsController _permanentJunkDeletionAlertTitleForCount:](self, "_permanentJunkDeletionAlertTitleForCount:", v17);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v34 = 0;
    }
    -[CKConversationConfirmationAlertsController junkConversations](self, "junkConversations");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "count");

    v13 = v46;
    v47 = v29;
    if (v37)
    {
      -[CKConversationConfirmationAlertsController _reportSpamConfirmationMessageForJunkConversations](self, "_reportSpamConfirmationMessageForJunkConversations");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      CKFrameworkBundle();
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "localizedStringForKey:value:table:", CFSTR("REPORT_SPAM_ALERT_BUTTON_TITLE"), &stru_1E276D870, CFSTR("ChatKit"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v52[0] = MEMORY[0x1E0C809B0];
      v52[1] = 3221225472;
      v52[2] = __176__CKConversationConfirmationAlertsController_presentPermanentJunkDeletionConfirmationFromViewController_forConversations_alertControllerStyle_alertsCompletedBlock_cancelBlock___block_invoke_4;
      v52[3] = &unk_1E27559B8;
      v52[4] = self;
      v41 = v48;
      v53 = v48;
      v54 = v45;
      +[CKAlertAction actionWithTitle:style:handler:](CKAlertAction, "actionWithTitle:style:handler:", v40, 2, v52);
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      +[CKAlertController alertControllerWithTitle:message:preferredStyle:](CKAlertController, "alertControllerWithTitle:message:preferredStyle:", v34, v38, -[CKConversationConfirmationAlertsController alertControllerStyle](self, "alertControllerStyle"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "addAction:", v30);
      objc_msgSend(v43, "addAction:", v42);

      v12 = v50;
    }
    else
    {
      if (v44 == 1)
      {
        -[CKConversationConfirmationAlertsController _conversationDeletionAlertMessageForConversations:](self, "_conversationDeletionAlertMessageForConversations:", v46);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v38 = 0;
      }
      v12 = v50;
      +[CKAlertController alertControllerWithTitle:message:preferredStyle:](CKAlertController, "alertControllerWithTitle:message:preferredStyle:", v34, v38, -[CKConversationConfirmationAlertsController alertControllerStyle](self, "alertControllerStyle"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "addAction:", v30);
      v41 = v48;
    }

    objc_msgSend(v43, "addAction:", v33);
    objc_msgSend(v43, "setPreferredAction:", v30);
    -[CKConversationConfirmationAlertsController _configureAppearanceForAlertController:](self, "_configureAppearanceForAlertController:", v43);
    objc_msgSend(v43, "presentFromViewController:animated:completion:", v12, 1, 0);

    v14 = v49;
    v15 = v51;
  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DFCD000, v35, OS_LOG_TYPE_INFO, "Delete requested on 0 messages", buf, 2u);
    }

  }
}

uint64_t __176__CKConversationConfirmationAlertsController_presentPermanentJunkDeletionConfirmationFromViewController_forConversations_alertControllerStyle_alertsCompletedBlock_cancelBlock___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __176__CKConversationConfirmationAlertsController_presentPermanentJunkDeletionConfirmationFromViewController_forConversations_alertControllerStyle_alertsCompletedBlock_cancelBlock___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "junkConversations");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_trackEvent:forConversations:", 0, v3);

}

uint64_t __176__CKConversationConfirmationAlertsController_presentPermanentJunkDeletionConfirmationFromViewController_forConversations_alertControllerStyle_alertsCompletedBlock_cancelBlock___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __176__CKConversationConfirmationAlertsController_presentPermanentJunkDeletionConfirmationFromViewController_forConversations_alertControllerStyle_alertsCompletedBlock_cancelBlock___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "junkConversations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_markConversationsAsSpam:", v3);

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __176__CKConversationConfirmationAlertsController_presentPermanentJunkDeletionConfirmationFromViewController_forConversations_alertControllerStyle_alertsCompletedBlock_cancelBlock___block_invoke_5;
  v7[3] = &unk_1E274AED0;
  v4 = *(_QWORD *)(a1 + 40);
  v8 = *(id *)(a1 + 48);
  (*(void (**)(uint64_t, _QWORD *))(v4 + 16))(v4, v7);
  v5 = *(void **)(a1 + 32);
  objc_msgSend(v5, "junkConversations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_trackEvent:forConversations:", 1, v6);

}

uint64_t __176__CKConversationConfirmationAlertsController_presentPermanentJunkDeletionConfirmationFromViewController_forConversations_alertControllerStyle_alertsCompletedBlock_cancelBlock___block_invoke_5(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)presentRecoverDeletedConversationsConfirmationFromViewController:(id)a3 forConversations:(id)a4 alertControllerStyle:(int64_t)a5 alertsCompletedBlock:(id)a6 cancelBlock:(id)a7
{
  id v12;
  id v13;
  unint64_t v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  __CFString *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  unsigned int v33;
  uint64_t v34;
  NSObject *v35;
  void *v36;
  void *v37;
  int64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _QWORD v49[4];
  id v50;
  _QWORD v51[4];
  id v52;
  uint8_t buf[16];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v44 = a6;
  v42 = v13;
  v43 = a7;
  v14 = -[CKConversationConfirmationAlertsController _numberOfRecoverableMessagesInConversations:](self, "_numberOfRecoverableMessagesInConversations:", v13);
  v41 = v12;
  if (v14)
  {
    v15 = v14;
    -[CKConversationConfirmationAlertsController setPresentationViewController:](self, "setPresentationViewController:", v12);
    v38 = a5;
    -[CKConversationConfirmationAlertsController setAlertControllerStyle:](self, "setAlertControllerStyle:", a5);
    v16 = (void *)MEMORY[0x1E0CB3940];
    CKFrameworkBundle();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("RECENTLY_DELETED_RECOVER_ACTION_TITLE"), &stru_1E276D870, CFSTR("ChatKit"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringWithFormat:", v18, v15);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "userInterfaceLayoutDirection");

    if (v21 == 1)
      v22 = CFSTR("\u200F");
    else
      v22 = CFSTR("\u200E");
    -[__CFString stringByAppendingString:](v22, "stringByAppendingString:", v19);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = MEMORY[0x1E0C809B0];
    v51[0] = MEMORY[0x1E0C809B0];
    v51[1] = 3221225472;
    v51[2] = __182__CKConversationConfirmationAlertsController_presentRecoverDeletedConversationsConfirmationFromViewController_forConversations_alertControllerStyle_alertsCompletedBlock_cancelBlock___block_invoke;
    v51[3] = &unk_1E274B330;
    v52 = v44;
    +[CKAlertAction actionWithTitle:style:handler:](CKAlertAction, "actionWithTitle:style:handler:", v40, 0, v51);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    CKFrameworkBundle();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1E276D870, CFSTR("ChatKit"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v49[0] = v23;
    v49[1] = 3221225472;
    v49[2] = __182__CKConversationConfirmationAlertsController_presentRecoverDeletedConversationsConfirmationFromViewController_forConversations_alertControllerStyle_alertsCompletedBlock_cancelBlock___block_invoke_2;
    v49[3] = &unk_1E274B330;
    v50 = v43;
    +[CKAlertAction actionWithTitle:style:handler:](CKAlertAction, "actionWithTitle:style:handler:", v26, 1, v49);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v27 = v42;
    v28 = 0;
    v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
    if (v29)
    {
      v30 = *(_QWORD *)v46;
      do
      {
        for (i = 0; i != v29; ++i)
        {
          if (*(_QWORD *)v46 != v30)
            objc_enumerationMutation(v27);
          objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * i), "chat");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = objc_msgSend(v32, "isDeletingIncomingMessages");

          v28 += v33;
        }
        v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
      }
      while (v29);
    }

    v34 = objc_msgSend(v27, "count") - (_QWORD)v28;
    if (v38 == 1)
    {
      if (v28)
        -[CKConversationConfirmationAlertsController _recoveryAlertTitleForBlockedConversationsCount:allowedConversationsCount:](self, "_recoveryAlertTitleForBlockedConversationsCount:allowedConversationsCount:", v28, v34);
      else
        -[CKConversationConfirmationAlertsController _recoveryAlertTitleForMessagesCount:](self, "_recoveryAlertTitleForMessagesCount:", v15, v34);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKConversationConfirmationAlertsController _recoveryAlertMessageForMessagesCount:](self, "_recoveryAlertMessageForMessagesCount:", v15);
      v28 = (char *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v28)
      {
        -[CKConversationConfirmationAlertsController _recoveryAlertMessageForBlockedConversationsCount:allowedConversationsCount:](self, "_recoveryAlertMessageForBlockedConversationsCount:allowedConversationsCount:", v28, v34);
        v28 = (char *)objc_claimAutoreleasedReturnValue();
      }
      v36 = 0;
    }
    +[CKAlertController alertControllerWithTitle:message:preferredStyle:](CKAlertController, "alertControllerWithTitle:message:preferredStyle:", v36, v28, -[CKConversationConfirmationAlertsController alertControllerStyle](self, "alertControllerStyle"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "addAction:", v24);
    objc_msgSend(v37, "addAction:", v39);
    objc_msgSend(v37, "setPreferredAction:", v24);
    -[CKConversationConfirmationAlertsController _configureAppearanceForAlertController:](self, "_configureAppearanceForAlertController:", v37);
    objc_msgSend(v37, "presentFromViewController:animated:completion:", v41, 1, 0);

  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DFCD000, v35, OS_LOG_TYPE_INFO, "Recover requested on 0 messages", buf, 2u);
    }

  }
}

uint64_t __182__CKConversationConfirmationAlertsController_presentRecoverDeletedConversationsConfirmationFromViewController_forConversations_alertControllerStyle_alertsCompletedBlock_cancelBlock___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __182__CKConversationConfirmationAlertsController_presentRecoverDeletedConversationsConfirmationFromViewController_forConversations_alertControllerStyle_alertsCompletedBlock_cancelBlock___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)presentRecoverJunkConversationsConfirmationFromViewController:(id)a3 forConversations:(id)a4 alertControllerStyle:(int64_t)a5 alertsCompletedBlock:(id)a6 cancelBlock:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  id v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;
  uint8_t buf[16];

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  if (objc_msgSend(v13, "count"))
  {
    -[CKConversationConfirmationAlertsController setPresentationViewController:](self, "setPresentationViewController:", v12);
    -[CKConversationConfirmationAlertsController setAlertControllerStyle:](self, "setAlertControllerStyle:", a5);
    CKFrameworkBundle();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("REMOVE_FROM_JUNK"), &stru_1E276D870, CFSTR("ChatKit"));
    v17 = objc_claimAutoreleasedReturnValue();

    v18 = MEMORY[0x1E0C809B0];
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __179__CKConversationConfirmationAlertsController_presentRecoverJunkConversationsConfirmationFromViewController_forConversations_alertControllerStyle_alertsCompletedBlock_cancelBlock___block_invoke;
    v31[3] = &unk_1E274B330;
    v28 = v14;
    v32 = v14;
    v27 = (void *)v17;
    +[CKAlertAction actionWithTitle:style:handler:](CKAlertAction, "actionWithTitle:style:handler:", v17, 0, v31);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    CKFrameworkBundle();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1E276D870, CFSTR("ChatKit"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v18;
    v29[1] = 3221225472;
    v29[2] = __179__CKConversationConfirmationAlertsController_presentRecoverJunkConversationsConfirmationFromViewController_forConversations_alertControllerStyle_alertsCompletedBlock_cancelBlock___block_invoke_2;
    v29[3] = &unk_1E274B330;
    v30 = v15;
    +[CKAlertAction actionWithTitle:style:handler:](CKAlertAction, "actionWithTitle:style:handler:", v21, 1, v29);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = 0;
    v24 = 0;
    if (a5 == 1)
    {
      -[CKConversationConfirmationAlertsController _junkRecoveryAlertTitleForCount:](self, "_junkRecoveryAlertTitleForCount:", objc_msgSend(v13, "count"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKConversationConfirmationAlertsController _junkRecoveryAlertMessageForCount:](self, "_junkRecoveryAlertMessageForCount:", objc_msgSend(v13, "count"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
    }
    +[CKAlertController alertControllerWithTitle:message:preferredStyle:](CKAlertController, "alertControllerWithTitle:message:preferredStyle:", v24, v23, -[CKConversationConfirmationAlertsController alertControllerStyle](self, "alertControllerStyle"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addAction:", v19);
    objc_msgSend(v25, "addAction:", v22);
    objc_msgSend(v25, "setPreferredAction:", v19);
    -[CKConversationConfirmationAlertsController _configureAppearanceForAlertController:](self, "_configureAppearanceForAlertController:", v25);
    objc_msgSend(v25, "presentFromViewController:animated:completion:", v12, 1, 0);

    v14 = v28;
  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DFCD000, v26, OS_LOG_TYPE_INFO, "Junk recovery requested on 0 conversations", buf, 2u);
    }

  }
}

uint64_t __179__CKConversationConfirmationAlertsController_presentRecoverJunkConversationsConfirmationFromViewController_forConversations_alertControllerStyle_alertsCompletedBlock_cancelBlock___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __179__CKConversationConfirmationAlertsController_presentRecoverJunkConversationsConfirmationFromViewController_forConversations_alertControllerStyle_alertsCompletedBlock_cancelBlock___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_markConversationsAsSpam:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  char v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t j;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  char v28;
  uint64_t v29;
  id v30;
  id obj;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v38 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        objc_msgSend(v9, "chat");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isBusinessChat");

        if ((v11 & 1) == 0)
          objc_msgSend(v4, "addObject:", v9);
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    }
    while (v6);
  }

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v30 = v4;
  v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
  if (v32)
  {
    v12 = *(_QWORD *)v34;
    v13 = (_QWORD *)MEMORY[0x1E0D38E90];
    v29 = *(_QWORD *)v34;
    do
    {
      for (j = 0; j != v32; ++j)
      {
        if (*(_QWORD *)v34 != v12)
          objc_enumerationMutation(v30);
        v15 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * j);
        objc_msgSend(v15, "chat", v29);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "account");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "service");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "supportsCapability:", *v13);
        if ((v19 & 1) == 0)
        {

          goto LABEL_19;
        }
        v20 = (void *)MEMORY[0x1E0D35778];
        objc_msgSend(v15, "chat");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "lastFinishedMessageItem");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "chat");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v20) = objc_msgSend(v20, "isReportJunkServiceAllowedForMessageItem:junkChatStyle:", v22, objc_msgSend(v23, "chatStyle"));

        if ((_DWORD)v20)
        {
          objc_msgSend(v15, "chat");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "reportJunkToCarrier");
          v12 = v29;
          v13 = (_QWORD *)MEMORY[0x1E0D38E90];
LABEL_19:

          goto LABEL_21;
        }
        v19 = 0;
        v12 = v29;
        v13 = (_QWORD *)MEMORY[0x1E0D38E90];
LABEL_21:
        objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "isReportJunkTextToAppleServerEnabled");

        objc_msgSend(v15, "chat");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v26;
        if (v25)
        {
          objc_msgSend(v26, "markAsSpam:isJunkReportedToCarrier:", +[CKUtilities messageJunkStatus](CKUtilities, "messageJunkStatus"), v19);
          goto LABEL_28;
        }
        if (!objc_msgSend(v26, "isSMS"))
        {

LABEL_27:
          objc_msgSend(v15, "chat");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "markAsSpam:", +[CKUtilities messageJunkStatus](CKUtilities, "messageJunkStatus"));
LABEL_28:

          continue;
        }
        v28 = IMShouldHandleInternalPhishingAttempts();

        if ((v28 & 1) != 0)
          goto LABEL_27;
      }
      v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    }
    while (v32);
  }

}

- (id)_identifySpamConversationsToRemove:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  char v15;
  void *v16;
  char v17;
  void *v18;
  char v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  void *v31;
  void *v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v34 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = IMSMSReportSpamExtensionAvailable();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v36 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        objc_msgSend(v10, "chat");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "isBusinessChat"))
        {

        }
        else
        {
          objc_msgSend(v10, "chat");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "numberOfTimesRespondedToThread");

          if (v13 > 2)
            continue;
        }
        if ((objc_msgSend(v10, "isStewieConversation") & 1) == 0)
        {
          objc_msgSend(v10, "chat");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "isStewieSharingChat");

          if ((v15 & 1) == 0)
          {
            objc_msgSend(v10, "chat");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v16, "supportsFilteringExtensions") & v4;

            if ((v17 & 1) == 0)
            {
              objc_msgSend(v10, "chat");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = objc_msgSend(v18, "hasKnownParticipants");

              if ((v19 & 1) == 0)
              {
                v20 = v4;
                objc_msgSend(v10, "chat");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v21, "chatItems");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "messages");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "firstObject");
                v24 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v10, "chat");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                if ((objc_msgSend(v25, "isMapKitBusinessChat") & 1) != 0)
                {

                  v4 = v20;
                  goto LABEL_16;
                }
                v26 = objc_msgSend(v24, "isFromMe");

                v4 = v20;
                if ((v26 & 1) == 0)
                {
LABEL_16:
                  if ((IMShouldHandleInternalPhishingAttempts() & 1) != 0)
                    goto LABEL_19;
                  objc_msgSend(v10, "chat");
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  v28 = objc_msgSend(v27, "supportsFilteringExtensions");

                  if (!v28)
                    goto LABEL_19;
                  v29 = (void *)MEMORY[0x1E0D35778];
                  objc_msgSend(v10, "chat");
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v33, "lastFinishedMessageItem");
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v10, "chat");
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  LODWORD(v29) = objc_msgSend(v29, "isReportJunkServiceAllowedForMessageItem:junkChatStyle:", v30, objc_msgSend(v31, "chatStyle"));

                  v4 = v20;
                  if ((_DWORD)v29)
LABEL_19:
                    objc_msgSend(v34, "addObject:", v10);
                }

                continue;
              }
            }
          }
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    }
    while (v7);
  }

  return v34;
}

- (BOOL)_hasChatSharingLocationInConversations:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  char v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "chat", (_QWORD)v10);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "hasRecipientsFollowingLocation");

        if ((v8 & 1) != 0)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

- (void)_stopSharingLocationInConversations:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7), "chat");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "stopSharingLocation");

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (unint64_t)_numberOfRecoverableMessagesInConversations:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "chat");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v6 += objc_msgSend(v9, "recoverableMessagesCount");

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_moveToRecentlyDeletedAlertTitleForConversationsCount:(unint64_t)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  __CFString *v11;
  void *v12;

  if (-[CKConversationConfirmationAlertsController _isStoredOnIcloud](self, "_isStoredOnIcloud"))
  {
    CKFrameworkBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("CONVERSATIONLIST_RECOVERABLE_DELETION_ICLOUD_TITLE"), &stru_1E276D870, CFSTR("ChatKit"));
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    CKFrameworkBundle();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("DELETE_CONVERSATION"), &stru_1E276D870, CFSTR("ChatKit"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringWithFormat:", v8, a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "userInterfaceLayoutDirection");

    if (v10 == 1)
      v11 = CFSTR("\u200F");
    else
      v11 = CFSTR("\u200E");
    -[__CFString stringByAppendingString:](v11, "stringByAppendingString:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v12 = (void *)v5;

  return v12;
}

- (id)_conversationDeletionAlertMessageForConversations:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  int64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v4);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v8), "hasCancellableScheduledMessage", (_QWORD)v17) & 1) != 0)
        {
          v9 = 1;
          goto LABEL_11;
        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v6)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_11:

  if (-[CKConversationConfirmationAlertsController _isStoredOnIcloud](self, "_isStoredOnIcloud"))
  {
    v10 = objc_msgSend(v4, "count");
    CKFrameworkBundle();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 == 1)
    {
      if ((v9 & 1) != 0)
        v12 = CFSTR("SCHEDULED_DELETE_ALERT_MESSAGE_ON_ICLOUD");
      else
        v12 = CFSTR("DELETE_ALERT_MESSAGE_ON_ICLOUD");
    }
    else if ((v9 & 1) != 0)
    {
      v12 = CFSTR("SCHEDULED_BATCH_DELETE_ALERT_MESSAGE_ON_ICLOUD");
    }
    else
    {
      v12 = CFSTR("BATCH_DELETE_ALERT_MESSAGE_ON_ICLOUD");
    }
  }
  else
  {
    v13 = -[CKConversationConfirmationAlertsController alertControllerStyle](self, "alertControllerStyle");
    v14 = objc_msgSend(v4, "count");
    CKFrameworkBundle();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13 == 1)
    {
      if (v14 == 1)
      {
        if ((v9 & 1) != 0)
          v12 = CFSTR("SCHEDULED_DELETE_ALERT_MESSAGE");
        else
          v12 = CFSTR("DELETE_ALERT_MESSAGE");
      }
      else if ((v9 & 1) != 0)
      {
        v12 = CFSTR("SCHEDULED_BATCH_DELETE_ALERT_MESSAGE");
      }
      else
      {
        v12 = CFSTR("BATCH_DELETE_ALERT_MESSAGE");
      }
    }
    else if (v14 == 1)
    {
      if ((v9 & 1) != 0)
        v12 = CFSTR("SCHEDULED_DELETE_CONVERSATION_MESSAGE");
      else
        v12 = CFSTR("DELETE_CONVERSATION_MESSAGE");
    }
    else if ((v9 & 1) != 0)
    {
      v12 = CFSTR("SCHEDULED_BATCH_DELETE_CONVERSATION_MESSAGE");
    }
    else
    {
      v12 = CFSTR("BATCH_DELETE_CONVERSATION_MESSAGE");
    }
  }
  objc_msgSend(v11, "localizedStringForKey:value:table:", v12, &stru_1E276D870, CFSTR("ChatKit"), (_QWORD)v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)_moveToRecentlyDeletedAlertTitleForMessagesCount:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  __CFString *v13;

  if (-[CKConversationConfirmationAlertsController alertControllerStyle](self, "alertControllerStyle"))
  {
    if (-[CKConversationConfirmationAlertsController _isStoredOnIcloud](self, "_isStoredOnIcloud"))
    {
      CKFrameworkBundle();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("CONVERSATIONLIST_RECOVERABLE_DELETION_ICLOUD_TITLE"), &stru_1E276D870, CFSTR("ChatKit"));
      v6 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = (void *)MEMORY[0x1E0CB3940];
      CKFrameworkBundle();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("DELETE_MESSAGES"), &stru_1E276D870, CFSTR("ChatKit"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "localizedStringWithFormat:", v10, a3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "userInterfaceLayoutDirection");

      if (v12 == 1)
        v13 = CFSTR("\u200F");
      else
        v13 = CFSTR("\u200E");
      -[__CFString stringByAppendingString:](v13, "stringByAppendingString:", v5);
      v6 = objc_claimAutoreleasedReturnValue();
    }
    v7 = (void *)v6;

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)_moveToRecentlyDeletedAlertMessageForMessagesCount:(unint64_t)a3
{
  void *v4;
  const __CFString *v5;
  void *v6;

  if (-[CKConversationConfirmationAlertsController _isStoredOnIcloud](self, "_isStoredOnIcloud"))
  {
    CKFrameworkBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (a3 > 1)
      v5 = CFSTR("BATCH_DELETE_INDIVIDUAL_MESSAGE_ON_ICLOUD");
    else
      v5 = CFSTR("DELETE_INDIVIDUAL_MESSAGE_ON_ICLOUD");
LABEL_10:
    objc_msgSend(v4, "localizedStringForKey:value:table:", v5, &stru_1E276D870, CFSTR("ChatKit"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    return v6;
  }
  if (CKIsRunningInMacCatalyst())
  {
    CKFrameworkBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (a3 > 1)
      v5 = CFSTR("DELETE_MULTIPLE_MESSAGES");
    else
      v5 = CFSTR("DELETE_SINGLE_MESSAGE");
    goto LABEL_10;
  }
  v6 = 0;
  return v6;
}

- (id)_permanentDeletionAlertTitleForCount:(unint64_t)a3
{
  void *v5;
  const __CFString *v6;
  _BOOL4 v7;
  void *v8;

  if (-[CKConversationConfirmationAlertsController alertControllerStyle](self, "alertControllerStyle") == 1)
  {
    CKFrameworkBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (a3 > 1)
      v6 = CFSTR("RECENTLY_DELETED_PLURAL_PERMANENT_DELETION_ALERT_TITLE");
    else
      v6 = CFSTR("RECENTLY_DELETED_SINGULAR_PERMANENT_DELETION_ALERT_TITLE");
  }
  else
  {
    v7 = -[CKConversationConfirmationAlertsController _isStoredOnIcloud](self, "_isStoredOnIcloud");
    CKFrameworkBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      if (a3 > 1)
        v6 = CFSTR("RECENTLY_DELETED_PLURAL_PERMANENT_DELETION_ICLOUD_MESSAGE");
      else
        v6 = CFSTR("RECENTLY_DELETED_SINGULAR_PERMANENT_DELETION_ICLOUD_MESSAGE");
    }
    else if (a3 > 1)
    {
      v6 = CFSTR("RECENTLY_DELETED_PLURAL_PERMANENT_DELETION_TITLE");
    }
    else
    {
      v6 = CFSTR("RECENTLY_DELETED_SINGULAR_PERMANENT_DELETION_TITLE");
    }
  }
  objc_msgSend(v5, "localizedStringForKey:value:table:", v6, &stru_1E276D870, CFSTR("ChatKit"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_permanentJunkDeletionAlertTitleForCount:(unint64_t)a3
{
  void *v5;
  const __CFString *v6;
  _BOOL4 v7;
  void *v8;

  if (-[CKConversationConfirmationAlertsController alertControllerStyle](self, "alertControllerStyle") == 1)
  {
    CKFrameworkBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (a3 > 1)
      v6 = CFSTR("PERMANENT_PLURAL_CONVERSATION_DELETION_CONFIRMATION");
    else
      v6 = CFSTR("PERMANENT_CONVERSATION_DELETION_CONFIRMATION");
  }
  else
  {
    v7 = -[CKConversationConfirmationAlertsController _isStoredOnIcloud](self, "_isStoredOnIcloud");
    CKFrameworkBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      if (a3 > 1)
        v6 = CFSTR("DELETE_PLURAL_WARNING_ON_ICLOUD");
      else
        v6 = CFSTR("DELETE_WARNING_ON_ICLOUD");
    }
    else if (a3 > 1)
    {
      v6 = CFSTR("PERMANENT_PLURAL_CONVERSATION_DELETION_WARNING");
    }
    else
    {
      v6 = CFSTR("PERMANENT_CONVERSATION_DELETION_WARNING");
    }
  }
  objc_msgSend(v5, "localizedStringForKey:value:table:", v6, &stru_1E276D870, CFSTR("ChatKit"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_permanentDeletionAlertMessageForCount:(unint64_t)a3
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  void *v10;

  v4 = -[CKConversationConfirmationAlertsController _isStoredOnIcloud](self, "_isStoredOnIcloud");
  CKFrameworkBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = CFSTR("RECENTLY_DELETED_PLURAL_PERMANENT_DELETION_ICLOUD_MESSAGE");
  if (a3 < 2)
    v7 = CFSTR("RECENTLY_DELETED_SINGULAR_PERMANENT_DELETION_ICLOUD_MESSAGE");
  v8 = CFSTR("RECENTLY_DELETED_SINGULAR_PERMANENT_DELETION_MESSAGE");
  if (a3 >= 2)
    v8 = CFSTR("RECENTLY_DELETED_PLURAL_PERMANENT_DELETION_MESSAGE");
  if (v4)
    v9 = v7;
  else
    v9 = v8;
  objc_msgSend(v5, "localizedStringForKey:value:table:", v9, &stru_1E276D870, CFSTR("ChatKit"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_recoveryAlertTitleForMessagesCount:(unint64_t)a3
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  CKFrameworkBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a3 <= 1)
    v6 = CFSTR("RECENTLY_DELETED_SINGULAR_RECOVERY_TITLE");
  else
    v6 = CFSTR("RECENTLY_DELETED_PLURAL_RECOVERY_TITLE");
  objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_1E276D870, CFSTR("ChatKit"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_recoveryAlertTitleForBlockedConversationsCount:(unint64_t)a3 allowedConversationsCount:(unint64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  __CFString *v12;
  void *v13;
  const __CFString *v14;
  uint64_t v15;
  void *v16;

  if (a4)
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    CKFrameworkBundle();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("RECENTLY_DELETED_RECOVER_BLOCKED_CONVERSATIONS_CATALYST"), &stru_1E276D870, CFSTR("ChatKit"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringWithFormat:", v8, a3, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "userInterfaceLayoutDirection");

    if (v11 == 1)
      v12 = CFSTR("\u200F");
    else
      v12 = CFSTR("\u200E");
    -[__CFString stringByAppendingString:](v12, "stringByAppendingString:", v9);
    v15 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    CKFrameworkBundle();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v13;
    if (a3 < 2)
      v14 = CFSTR("RECENTLY_DELETED_RECOVER_BLOCKED_CONVERSATIONS_SINGLE_CATALYST");
    else
      v14 = CFSTR("RECENTLY_DELETED_RECOVER_BLOCKED_CONVERSATIONS_MULTIPLE_CATALYST");
    objc_msgSend(v13, "localizedStringForKey:value:table:", v14, &stru_1E276D870, CFSTR("ChatKit"));
    v15 = objc_claimAutoreleasedReturnValue();
  }
  v16 = (void *)v15;

  return v16;
}

- (id)_recoveryAlertMessageForMessagesCount:(unint64_t)a3
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  CKFrameworkBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a3 <= 1)
    v6 = CFSTR("RECENTLY_DELETED_SINGULAR_RECOVERY_MESSAGE");
  else
    v6 = CFSTR("RECENTLY_DELETED_PLURAL_RECOVERY_MESSAGE");
  objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_1E276D870, CFSTR("ChatKit"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_recoveryAlertMessageForBlockedConversationsCount:(unint64_t)a3 allowedConversationsCount:(unint64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  __CFString *v12;
  void *v13;
  const __CFString *v14;
  uint64_t v15;
  void *v16;

  if (a3 && a4)
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    CKFrameworkBundle();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("RECENTLY_DELETED_RECOVER_BLOCKED_CONVERSATIONS"), &stru_1E276D870, CFSTR("ChatKit"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringWithFormat:", v8, a3, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "userInterfaceLayoutDirection");

    if (v11 == 1)
      v12 = CFSTR("\u200F");
    else
      v12 = CFSTR("\u200E");
    -[__CFString stringByAppendingString:](v12, "stringByAppendingString:", v9);
    v15 = objc_claimAutoreleasedReturnValue();
LABEL_13:
    v16 = (void *)v15;

    return v16;
  }
  if (a3)
  {
    if (a3 == 1)
    {
      CKFrameworkBundle();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v13;
      v14 = CFSTR("RECENTLY_DELETED_RECOVER_BLOCKED_CONVERSATION_SINGLE");
    }
    else
    {
      CKFrameworkBundle();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v13;
      v14 = CFSTR("RECENTLY_DELETED_RECOVER_BLOCKED_CONVERSATIONS_MULTIPLE");
    }
    objc_msgSend(v13, "localizedStringForKey:value:table:", v14, &stru_1E276D870, CFSTR("ChatKit"));
    v15 = objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  v16 = 0;
  return v16;
}

- (id)_junkRecoveryAlertTitleForCount:(unint64_t)a3
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  CKFrameworkBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a3 <= 1)
    v6 = CFSTR("ARE_YOU_SURE_WANT_TO_REMOVE_THIS_CONVERSATION_FROM_JUNK");
  else
    v6 = CFSTR("ARE_YOU_SURE_WANT_TO_REMOVE_THESE_CONVERSATIONS_FROM_JUNK");
  objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_1E276D870, CFSTR("ChatKit"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_junkRecoveryAlertMessageForCount:(unint64_t)a3
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  CKFrameworkBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a3 <= 1)
    v6 = CFSTR("THIS_CONVERSATION_WILL_BE_REMOVED_FROM_JUNK");
  else
    v6 = CFSTR("THESE_CONVERSATIONS_WILL_BE_REMOVED_FROM_JUNK");
  objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_1E276D870, CFSTR("ChatKit"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_identifyBusinessConversationToRemove:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  if (objc_msgSend(v3, "count") == 1)
  {
    objc_msgSend(v3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isMapKitBusinessConversation")
      && (objc_msgSend(v4, "isMakoConversation") & 1) == 0)
    {
      v5 = v4;
    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)_shouldConfirmStopSharingLocationForConversations:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  BOOL v8;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D35810], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "restrictLocationSharing"))
  {

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D35810], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "disableLocationSharing");

    if ((v7 & 1) == 0)
    {
      v8 = -[CKConversationConfirmationAlertsController _hasChatSharingLocationInConversations:](self, "_hasChatSharingLocationInConversations:", v4);
      goto LABEL_6;
    }
  }
  v8 = 0;
LABEL_6:

  return v8;
}

- (void)_configureAppearanceForAlertController:(id)a3
{
  id v3;

  v3 = a3;
  if (CKIsRunningInMacCatalyst())
  {
    objc_msgSend(v3, "setWantsWindowedPresentation:", 1);
    objc_msgSend(v3, "setShouldHidePresentingWindow:", 1);
  }

}

- (BOOL)_isStoredOnIcloud
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0D357C0], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEnabled");

  return v3;
}

- (void)_trackEvent:(int64_t)a3 forConversations:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  void *v24;
  void *v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    if (a3 != 1)
      return;
    v4 = 10;
    v5 = 11;
  }
  else
  {
    v4 = 8;
    v5 = 9;
  }
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[CKConversationConfirmationAlertsController junkConversations](self, "junkConversations", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v11, "chat");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isFiltered");

        if (v13 == 2)
        {
          objc_msgSend(v11, "chat");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "isSMS");

          objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v16;
          if (v15)
          {
            v24 = &unk_1E2870888;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", IMIsOscarEnabled());
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = v18;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "trackiMessageJunkEvent:withDictionary:", v5, v19);

          }
          else
          {
            objc_msgSend(v16, "trackiMessageJunkEvent:", v4);
          }

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
    }
    while (v8);
  }

}

- (int64_t)alertControllerStyle
{
  return self->_alertControllerStyle;
}

- (void)setAlertControllerStyle:(int64_t)a3
{
  self->_alertControllerStyle = a3;
}

- (NSArray)selectedConversations
{
  return self->_selectedConversations;
}

- (void)setSelectedConversations:(id)a3
{
  objc_storeStrong((id *)&self->_selectedConversations, a3);
}

- (NSArray)junkConversations
{
  return self->_junkConversations;
}

- (void)setJunkConversations:(id)a3
{
  objc_storeStrong((id *)&self->_junkConversations, a3);
}

- (UIViewController)presentationViewController
{
  return self->_presentationViewController;
}

- (void)setPresentationViewController:(id)a3
{
  objc_storeStrong((id *)&self->_presentationViewController, a3);
}

- (BOOL)shouldPromptBusinessChatSpamReason
{
  return self->_shouldPromptBusinessChatSpamReason;
}

- (void)setShouldPromptBusinessChatSpamReason:(BOOL)a3
{
  self->_shouldPromptBusinessChatSpamReason = a3;
}

- (BOOL)shouldPromptStopBusinessChat
{
  return self->_shouldPromptStopBusinessChat;
}

- (void)setShouldPromptStopBusinessChat:(BOOL)a3
{
  self->_shouldPromptStopBusinessChat = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentationViewController, 0);
  objc_storeStrong((id *)&self->_junkConversations, 0);
  objc_storeStrong((id *)&self->_selectedConversations, 0);
}

@end
