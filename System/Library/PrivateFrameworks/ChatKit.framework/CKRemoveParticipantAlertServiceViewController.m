@implementation CKRemoveParticipantAlertServiceViewController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKRemoveParticipantAlertServiceViewController;
  -[CKRemoveParticipantAlertServiceViewController viewDidLoad](&v5, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKRemoveParticipantAlertServiceViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

}

- (void)promptToRemoveParticipant:(id)a3 fromHighlight:(id)a4 usingPreferredStyle:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  CKRemoveParticipantAlertServiceViewController *v17;
  id v18[2];
  id location;

  v8 = a3;
  v9 = a4;
  if (_IMWillLog())
    _IMAlwaysLog();
  location = 0;
  objc_initWeak(&location, self);
  objc_msgSend(v8, "displayName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D35900], "sharedController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __109__CKRemoveParticipantAlertServiceViewController_promptToRemoveParticipant_fromHighlight_usingPreferredStyle___block_invoke;
  v14[3] = &unk_1E2758A50;
  objc_copyWeak(v18, &location);
  v12 = v8;
  v15 = v12;
  v13 = v10;
  v18[1] = (id)a5;
  v16 = v13;
  v17 = self;
  objc_msgSend(v11, "fetchAttributionsForHighlight:completionHandler:", v9, v14);

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);

}

void __109__CKRemoveParticipantAlertServiceViewController_promptToRemoveParticipant_fromHighlight_usingPreferredStyle___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
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
  id WeakRetained;
  id v17;
  id v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  CKConversation *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  _QWORD v53[4];
  id v54;
  _QWORD v55[4];
  CKConversation *v56;
  id v57;
  id v58;
  _QWORD v59[4];
  id v60;
  _QWORD v61[3];

  v61[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "attributions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v4, "count") < 2)
  {
    objc_msgSend(v4, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "conversationIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D35798], "sharedRegistryIfAvailable");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (!v8)
    {
      _IMWarn();
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
      objc_msgSend(WeakRetained, "_dismissAndCleanup");

LABEL_26:
      goto LABEL_27;
    }
    objc_msgSend(v8, "existingChatWithGUID:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      if ((objc_msgSend(v10, "isGroupChat") & 1) != 0)
      {
        objc_msgSend(v11, "account");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "handle");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "existingIMHandleWithID:", v13);
        v52 = (void *)objc_claimAutoreleasedReturnValue();

        if (v52)
        {
          v46 = -[CKConversation initWithChat:]([CKConversation alloc], "initWithChat:", v11);
          -[CKConversation displayName](v46, "displayName");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v14;
          if (v14)
          {
            v51 = v14;
          }
          else
          {
            -[CKConversation name](v46, "name");
            v51 = (id)objc_claimAutoreleasedReturnValue();
          }

          v61[0] = v52;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v61, 1);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v11, "canRemoveParticipants:", v19);

          if ((v20 & 1) != 0)
          {
            v49 = (void *)MEMORY[0x1E0CB3940];
            CKFrameworkBundle();
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("REMOVE_PARTICIPANT_FROM_GROUP"), &stru_1E276D870, CFSTR("ChatKit"));
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "stringWithFormat:", v22, *(_QWORD *)(a1 + 40), v51);
            v50 = (void *)objc_claimAutoreleasedReturnValue();

            v47 = (void *)MEMORY[0x1E0CB3940];
            CKFrameworkBundle();
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("PARTICIPANT_REMOVED_FROM_COLLABORATIVE_DOCUMENT_SHARED_WITH_GROUP"), &stru_1E276D870, CFSTR("ChatKit"));
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "stringWithFormat:", v24, *(_QWORD *)(a1 + 40), v51);
            v48 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x1E0CEA2E8], "alertControllerWithTitle:message:preferredStyle:", v50, v48, *(_QWORD *)(a1 + 64));
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            v42 = (void *)MEMORY[0x1E0CEA2E0];
            v25 = (void *)MEMORY[0x1E0CB3940];
            CKFrameworkBundle();
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("REMOVE_FROM_GROUP"), &stru_1E276D870, CFSTR("ChatKit"));
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "stringWithFormat:", v27, v51);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v55[0] = MEMORY[0x1E0C809B0];
            v55[1] = 3221225472;
            v55[2] = __109__CKRemoveParticipantAlertServiceViewController_promptToRemoveParticipant_fromHighlight_usingPreferredStyle___block_invoke_3;
            v55[3] = &unk_1E2758A28;
            v56 = v46;
            v57 = v52;
            objc_copyWeak(&v58, (id *)(a1 + 56));
            objc_msgSend(v42, "actionWithTitle:style:handler:", v28, 0, v55);
            v43 = (void *)objc_claimAutoreleasedReturnValue();

            v29 = (void *)MEMORY[0x1E0CEA2E0];
            CKFrameworkBundle();
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1E276D870, CFSTR("ChatKit"));
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v53[0] = MEMORY[0x1E0C809B0];
            v53[1] = 3221225472;
            v53[2] = __109__CKRemoveParticipantAlertServiceViewController_promptToRemoveParticipant_fromHighlight_usingPreferredStyle___block_invoke_4;
            v53[3] = &unk_1E274B7A0;
            objc_copyWeak(&v54, (id *)(a1 + 56));
            objc_msgSend(v29, "actionWithTitle:style:handler:", v31, 1, v53);
            v32 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v44, "addAction:", v43);
            objc_msgSend(v44, "addAction:", v32);
            objc_msgSend(*(id *)(a1 + 48), "presentViewController:animated:completion:", v44, 1, 0);
            v33 = objc_loadWeakRetained((id *)(a1 + 56));
            objc_msgSend(v33, "_dismissAndCleanup");

            objc_destroyWeak(&v54);
            objc_destroyWeak(&v58);

          }
          else
          {
            if (_IMWillLog())
              _IMAlwaysLog();
            v34 = (void *)MEMORY[0x1E0CB3940];
            CKFrameworkBundle();
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "localizedStringForKey:value:table:", CFSTR("PARTICIPANT_IS_STILL_IN_MESSAGES_CONVERSATION"), &stru_1E276D870, CFSTR("ChatKit"));
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "stringWithFormat:", v36, *(_QWORD *)(a1 + 40), v51);
            v50 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x1E0CEA2E8], "alertControllerWithTitle:message:preferredStyle:", 0, v50, *(_QWORD *)(a1 + 64));
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = (void *)MEMORY[0x1E0CEA2E0];
            v38 = (void *)MEMORY[0x1E0CB3940];
            CKFrameworkBundle();
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1E276D870, CFSTR("ChatKit"));
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "stringWithFormat:", v39, v51);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v59[0] = MEMORY[0x1E0C809B0];
            v59[1] = 3221225472;
            v59[2] = __109__CKRemoveParticipantAlertServiceViewController_promptToRemoveParticipant_fromHighlight_usingPreferredStyle___block_invoke_2;
            v59[3] = &unk_1E274B7A0;
            objc_copyWeak(&v60, (id *)(a1 + 56));
            objc_msgSend(v37, "actionWithTitle:style:handler:", v40, 0, v59);
            v41 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v48, "addAction:", v41);
            objc_msgSend(*(id *)(a1 + 48), "presentViewController:animated:completion:", v48, 1, 0);

            objc_destroyWeak(&v60);
          }

        }
        else
        {
          if (_IMWillLog())
            _IMAlwaysLog();
          v18 = objc_loadWeakRetained((id *)(a1 + 56));
          objc_msgSend(v18, "_dismissAndCleanup");

        }
        goto LABEL_25;
      }
      if (_IMWillLog())
        _IMAlwaysLog();
    }
    else
    {
      _IMWarn();
    }
    v17 = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(v17, "_dismissAndCleanup");

LABEL_25:
    goto LABEL_26;
  }
  _IMWarn();
  v5 = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(v5, "_dismissAndCleanup");

LABEL_27:
}

void __109__CKRemoveParticipantAlertServiceViewController_promptToRemoveParticipant_fromHighlight_usingPreferredStyle___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_dismissAndCleanup");

}

void __109__CKRemoveParticipantAlertServiceViewController_promptToRemoveParticipant_fromHighlight_usingPreferredStyle___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  if (_IMWillLog())
    _IMAlwaysLog();
  v2 = *(void **)(a1 + 32);
  v5[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeRecipientHandles:", v3);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_dismissAndCleanup");

}

void __109__CKRemoveParticipantAlertServiceViewController_promptToRemoveParticipant_fromHighlight_usingPreferredStyle___block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  if (_IMWillLog())
    _IMAlwaysLog();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_dismissAndCleanup");

}

- (void)_dismissAndCleanup
{
  id v2;

  -[CKRemoveParticipantAlertServiceViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissAlert");

}

+ (id)_remoteViewControllerInterface
{
  if (_remoteViewControllerInterface_onceToken != -1)
    dispatch_once(&_remoteViewControllerInterface_onceToken, &__block_literal_global_212);
  return (id)_remoteViewControllerInterface_interface;
}

void __79__CKRemoveParticipantAlertServiceViewController__remoteViewControllerInterface__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE31CE80);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_remoteViewControllerInterface_interface;
  _remoteViewControllerInterface_interface = v0;

}

+ (id)_exportedInterface
{
  if (_exportedInterface_onceToken != -1)
    dispatch_once(&_exportedInterface_onceToken, &__block_literal_global_95_2);
  return (id)_exportedInterface_interface;
}

void __67__CKRemoveParticipantAlertServiceViewController__exportedInterface__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE276CF8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_exportedInterface_interface;
  _exportedInterface_interface = v0;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_exportedInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_promptToRemoveParticipant_fromHighlight_usingPreferredStyle_, 0, 0);
  objc_msgSend((id)_exportedInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_promptToRemoveParticipant_fromHighlight_usingPreferredStyle_, 1, 0);

}

@end
