@implementation SWRemoveParticipantAlertController

- (id)_initWithParticipant:(id)a3 highlight:(id)a4
{
  uint64_t v4;
  void *v5;
  void *v6;
  id v9;
  id v10;
  SWRemoveParticipantAlertController *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v17.receiver = self;
  v17.super_class = (Class)SWRemoveParticipantAlertController;
  v11 = -[SWRemoveParticipantAlertController init](&v17, sel_init);
  if (v11)
  {
    objc_msgSend(v10, "title");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = (void *)MEMORY[0x1E0CB3940];
      SWFrameworkBundle();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("PERSON_HAS_BEEN_REMOVED_FROM_THIS_COLLABORATION_WITH_NAME"), &stru_1E2875070, CFSTR("SharedWithYou"));
      v4 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "displayName");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "title");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringWithFormat:", v4, v5, v6);
    }
    else
    {
      SWFrameworkBundle();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("PERSON_HAS_BEEN_REMOVED_FROM_THIS_COLLABORATION_WITHOUT_NAME"), &stru_1E2875070, CFSTR("SharedWithYou"));
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v11->_messageText, v15);
    if (v12)
    {

      v15 = (void *)v4;
    }

  }
  return v11;
}

+ (SWRemoveParticipantAlertController)alertControllerWithParticipant:(SWPerson *)participant highlight:(SWCollaborationHighlight *)highlight
{
  SWCollaborationHighlight *v5;
  SWPerson *v6;
  id v7;

  v5 = highlight;
  v6 = participant;
  v7 = -[SWRemoveParticipantAlertController _initWithParticipant:highlight:]([SWRemoveParticipantAlertController alloc], "_initWithParticipant:highlight:", v6, v5);

  objc_msgSend(v7, "setModalPresentationStyle:", 6);
  return (SWRemoveParticipantAlertController *)v7;
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  BOOL v14;
  id location;
  objc_super v16;

  v3 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SWRemoveParticipantAlertController;
  -[SWRemoveParticipantAlertController viewDidAppear:](&v16, sel_viewDidAppear_);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SWRemoveParticipantAlertController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v5);

  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", self->_messageText, 0, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0DC3448];
  SWFrameworkBundle();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1E2875070, CFSTR("SharedWithYou"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __52__SWRemoveParticipantAlertController_viewDidAppear___block_invoke;
  v12[3] = &unk_1E2873EE8;
  objc_copyWeak(&v13, &location);
  v14 = v3;
  objc_msgSend(v8, "actionWithTitle:style:handler:", v10, 0, v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "addAction:", v11);
  -[SWRemoveParticipantAlertController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, v3, 0);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __52__SWRemoveParticipantAlertController_viewDidAppear___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "dismissViewControllerAnimated:completion:", *(unsigned __int8 *)(a1 + 40), 0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageText, 0);
}

void __54___SWRemoveParticipantAlertController_viewWillAppear___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  int v26;
  id v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v5;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v9 = WeakRetained;
  if (v7 && !v6 && WeakRetained)
  {
    objc_msgSend(v7, "setDelegate:", WeakRetained);
    objc_msgSend(v9, "addChildViewController:", v7);
    objc_msgSend(v9, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bounds");
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;
    objc_msgSend(v7, "view");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setFrame:", v12, v14, v16, v18);

    objc_msgSend(v7, "view");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setAutoresizingMask:", 18);

    objc_msgSend(v9, "view");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "view");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addSubview:", v22);

    objc_msgSend(v7, "didMoveToParentViewController:", v9);
    objc_msgSend(v9, "participant");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "highlight");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_promptToRemoveParticipant:fromHighlight:preferredStyle:", v23, v24, objc_msgSend(v9, "preferredStyle"));

  }
  else
  {
    SWFrameworkLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v26 = 138412802;
      v27 = v7;
      v28 = 2112;
      v29 = v9;
      v30 = 2112;
      v31 = v6;
      _os_log_error_impl(&dword_18EAB1000, v25, OS_LOG_TYPE_ERROR, "Failed to present _SWRemoveParticipantAlertRemoteController. Dismissing without prompting the user for changes to the Messages group. remotePromptController: %@, presenter: %@, error: %@", (uint8_t *)&v26, 0x20u);
    }

    objc_msgSend(v9, "dismissAlert");
  }

}

@end
