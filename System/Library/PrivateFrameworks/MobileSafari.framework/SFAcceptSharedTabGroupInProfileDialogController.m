@implementation SFAcceptSharedTabGroupInProfileDialogController

+ (void)presentDialogInScene:(id)a3 forSharedTabGroupWithTitle:(id)a4 tabGroupManager:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, _QWORD);
  uint64_t v13;
  void *v14;
  id v15;

  v15 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (void (**)(id, _QWORD))a6;
  if ((objc_msgSend(v11, "hasMultipleProfiles") & 1) != 0)
  {
    v13 = objc_msgSend(objc_alloc((Class)a1), "_initWithScene:sharedTabGroupTitle:tabGroupManager:completionHandler:", v15, v10, v11, v12);
    v14 = (void *)_currentDialogController;
    _currentDialogController = v13;

    objc_msgSend((id)_currentDialogController, "_presentDialog");
  }
  else
  {
    v12[2](v12, *MEMORY[0x1E0D89E20]);
  }

}

- (id)_initWithScene:(id)a3 sharedTabGroupTitle:(id)a4 tabGroupManager:(id)a5 completionHandler:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  SFAcceptSharedTabGroupInProfileDialogController *v15;
  SFAcceptSharedTabGroupInProfileDialogController *v16;
  uint64_t v17;
  NSString *sharedTabGroupTitle;
  uint64_t v19;
  id completionHandler;
  SFAcceptSharedTabGroupInProfileDialogController *v21;
  objc_super v23;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v23.receiver = self;
  v23.super_class = (Class)SFAcceptSharedTabGroupInProfileDialogController;
  v15 = -[SFAcceptSharedTabGroupInProfileDialogController init](&v23, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_windowScene, a3);
    v17 = objc_msgSend(v12, "copy");
    sharedTabGroupTitle = v16->_sharedTabGroupTitle;
    v16->_sharedTabGroupTitle = (NSString *)v17;

    objc_storeStrong((id *)&v16->_tabGroupManager, a5);
    v19 = objc_msgSend(v14, "copy");
    completionHandler = v16->_completionHandler;
    v16->_completionHandler = (id)v19;

    v21 = v16;
  }

  return v16;
}

- (void)_presentDialog
{
  SFDialog *v3;
  SFDialog *dialog;
  SFDialogController *v5;
  SFDialogController *dialogController;

  -[SFAcceptSharedTabGroupInProfileDialogController _makeDialog](self, "_makeDialog");
  v3 = (SFDialog *)objc_claimAutoreleasedReturnValue();
  dialog = self->_dialog;
  self->_dialog = v3;

  v5 = objc_alloc_init(SFDialogController);
  dialogController = self->_dialogController;
  self->_dialogController = v5;

  -[SFDialogController setDelegate:](self->_dialogController, "setDelegate:", self);
  -[SFDialogController setDialogPresenter:](self->_dialogController, "setDialogPresenter:", self);
  -[SFDialogController setViewControllerPresenter:](self->_dialogController, "setViewControllerPresenter:", self);
  -[SFDialogController presentDialog:](self->_dialogController, "presentDialog:", self->_dialog);
}

- (id)_makeDialog
{
  SFBasicDialog *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  _QWORD v27[5];
  id v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(SFBasicDialog);
  v4 = (void *)MEMORY[0x1E0CB3940];
  _WBSLocalizedString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", v5, self->_sharedTabGroupTitle);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFBasicDialog setTitle:](v3, "setTitle:", v6);

  _WBSLocalizedString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFBasicDialog setMessage:](v3, "setMessage:", v7);

  -[WBTabGroupManager profiles](self->_tabGroupManager, "profiles");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAcceptSharedTabGroupInProfileDialogController _actionToOpenInProfile:](self, "_actionToOpenInProfile:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v11);

  if ((unint64_t)objc_msgSend(v8, "count") > 3)
  {
    v18 = (void *)MEMORY[0x1E0CB3940];
    _WBSLocalizedString();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringWithFormat:", v19, self->_sharedTabGroupTitle);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[SFDialogAction actionWithTitle:activatingKeyboardShortcut:type:](SFDialogAction, "actionWithTitle:activatingKeyboardShortcut:type:", v20, 0, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v21);

  }
  else
  {
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    objc_msgSend(v8, "subarrayWithRange:", 1, objc_msgSend(v8, "count") - 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v31;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v31 != v15)
            objc_enumerationMutation(v12);
          -[SFAcceptSharedTabGroupInProfileDialogController _actionToOpenInProfile:](self, "_actionToOpenInProfile:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v16));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v17);

          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      }
      while (v14);
    }

  }
  _WBSLocalizedString();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[SFDialogAction actionWithTitle:activatingKeyboardShortcut:type:](SFDialogAction, "actionWithTitle:activatingKeyboardShortcut:type:", v22, 1, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v23);

  -[SFBasicDialog setActions:](v3, "setActions:", v9);
  -[SFBasicDialog setPresentationStyle:](v3, "setPresentationStyle:", 1);
  -[SFBasicDialog setAlertControllerPresentsAsActionSheet:](v3, "setAlertControllerPresentsAsActionSheet:", 0);
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __62__SFAcceptSharedTabGroupInProfileDialogController__makeDialog__block_invoke;
  v27[3] = &unk_1E21E5A20;
  v27[4] = self;
  v28 = v9;
  v29 = v8;
  v24 = v8;
  v25 = v9;
  -[SFBasicDialog setCompletionHandler:](v3, "setCompletionHandler:", v27);

  return v3;
}

void __62__SFAcceptSharedTabGroupInProfileDialogController__makeDialog__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  void (*v8)(void);
  void *v9;
  unint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v7 = a4;
  if (!a2)
  {
    v8 = *(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) + 16);
    goto LABEL_5;
  }
  if (objc_msgSend(*(id *)(a1 + 40), "count") - 1 == a2)
  {
    v8 = *(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) + 16);
LABEL_5:
    v8();
    goto LABEL_6;
  }
  v10 = objc_msgSend(*(id *)(a1 + 48), "count");
  v11 = *(_QWORD **)(a1 + 32);
  if (v10 > 3)
  {
    objc_msgSend(v11, "_showAllProfilesDialog");
    goto LABEL_7;
  }
  v12 = v11[4];
  objc_msgSend(*(id *)(a1 + 48), "objectAtIndexedSubscript:", a2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v14);

LABEL_6:
  v9 = (void *)_currentDialogController;
  _currentDialogController = 0;

LABEL_7:
}

- (id)_actionToOpenInProfile:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  NSString *sharedTabGroupTitle;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = a3;
  _WBSLocalizedString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  sharedTabGroupTitle = self->_sharedTabGroupTitle;
  objc_msgSend(v5, "title");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", v6, sharedTabGroupTitle, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0D89E20]);
  if ((_DWORD)v11)
    v12 = 2;
  else
    v12 = 0;
  +[SFDialogAction actionWithTitle:activatingKeyboardShortcut:type:isPreferredAction:](SFDialogAction, "actionWithTitle:activatingKeyboardShortcut:type:isPreferredAction:", v9, v12, 0, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)_showAllProfilesDialog
{
  _SFProfileSelectionTableViewController *v3;
  _SFProfileSelectionTableViewController *selectionViewController;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  UINavigationController *v14;
  UINavigationController *navigationController;
  void *v16;
  id v17;

  v3 = objc_alloc_init(_SFProfileSelectionTableViewController);
  selectionViewController = self->_selectionViewController;
  self->_selectionViewController = v3;

  _WBSLocalizedString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFProfileSelectionTableViewController setTitle:](self->_selectionViewController, "setTitle:", v5);

  -[WBTabGroupManager profiles](self->_tabGroupManager, "profiles");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFProfileSelectionTableViewController setProfiles:](self->_selectionViewController, "setProfiles:", v6);

  v7 = objc_alloc(MEMORY[0x1E0DC34F0]);
  _WBSLocalizedString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (id)objc_msgSend(v7, "initWithTitle:style:target:action:", v8, 2, self, sel_selectProfile);

  v9 = objc_alloc(MEMORY[0x1E0DC34F0]);
  _WBSLocalizedString();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithTitle:style:target:action:", v10, 0, self, sel_cancel);

  -[_SFProfileSelectionTableViewController navigationItem](self->_selectionViewController, "navigationItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setRightBarButtonItem:", v17);

  -[_SFProfileSelectionTableViewController navigationItem](self->_selectionViewController, "navigationItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setLeftBarButtonItem:", v11);

  v14 = (UINavigationController *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", self->_selectionViewController);
  navigationController = self->_navigationController;
  self->_navigationController = v14;

  -[UINavigationController setModalPresentationStyle:](self->_navigationController, "setModalPresentationStyle:", 2);
  -[SFAcceptSharedTabGroupInProfileDialogController _presentationViewController](self, "_presentationViewController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "presentViewController:animated:completion:", self->_navigationController, 1, 0);

}

- (void)selectProfile
{
  void *v3;
  void (**completionHandler)(id, void *);
  void *v5;
  void *v6;
  void *v7;

  -[UINavigationController presentingViewController](self->_navigationController, "presentingViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", self->_navigationController != 0, &__block_literal_global_38);

  completionHandler = (void (**)(id, void *))self->_completionHandler;
  -[_SFProfileSelectionTableViewController selectedProfile](self->_selectionViewController, "selectedProfile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  completionHandler[2](completionHandler, v6);

  v7 = (void *)_currentDialogController;
  _currentDialogController = 0;

}

- (void)cancel
{
  void *v3;
  void *v4;

  -[UINavigationController presentingViewController](self->_navigationController, "presentingViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", self->_navigationController != 0, &__block_literal_global_28_0);

  (*((void (**)(void))self->_completionHandler + 2))();
  v4 = (void *)_currentDialogController;
  _currentDialogController = 0;

}

- (id)_presentationViewController
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;

  -[UIWindowScene keyWindow](self->_windowScene, "keyWindow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rootViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "presentedViewController");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    while (1)
    {
      objc_msgSend(v3, "presentedViewController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "isBeingDismissed");

      if ((v7 & 1) != 0)
        break;
      objc_msgSend(v3, "presentedViewController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "presentedViewController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = v8;
      if (!v5)
        return v8;
    }
  }
  v8 = v3;
  return v8;
}

- (int)webProcessIDForDialogController:(id)a3
{
  return 1;
}

- (void)dialogController:(id)a3 presentViewController:(id)a4 withAdditionalAnimations:(id)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a5;
  v8 = a4;
  -[SFAcceptSharedTabGroupInProfileDialogController _presentationViewController](self, "_presentationViewController");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "presentViewController:animated:completion:", v8, 1, 0);
  objc_msgSend(v8, "_sf_animateAlongsideTransitionOrPerform:", v7);

}

- (void)dialogController:(id)a3 dismissViewController:(id)a4 withAdditionalAnimations:(id)a5
{
  id v6;
  void *v7;
  id v8;

  v6 = a5;
  v8 = a4;
  objc_msgSend(v8, "presentingViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 1, 0);

  objc_msgSend(v8, "_sf_animateAlongsideTransitionOrPerform:", v6);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectionViewController, 0);
  objc_storeStrong((id *)&self->_navigationController, 0);
  objc_storeStrong((id *)&self->_dialogController, 0);
  objc_storeStrong((id *)&self->_dialog, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_tabGroupManager, 0);
  objc_storeStrong((id *)&self->_sharedTabGroupTitle, 0);
  objc_storeStrong((id *)&self->_windowScene, 0);
}

@end
