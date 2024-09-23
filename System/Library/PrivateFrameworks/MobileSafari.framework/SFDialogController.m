@implementation SFDialogController

- (void)owningWebViewWillBecomeActive
{
  WBSTabDialogManager *dialogManager;
  uint64_t v3;
  uint64_t v4;

  dialogManager = self->_dialogManager;
  v3 = -[SFDialogController _currentSlot](self, "_currentSlot");
  -[WBSTabDialogManager presentNextDialogForSlot:](dialogManager, "presentNextDialogForSlot:", v3, v4);
}

- (void)presentNextDialogIfNeeded
{
  WBSTabDialogManager *dialogManager;
  uint64_t v3;
  uint64_t v4;

  dialogManager = self->_dialogManager;
  v3 = -[SFDialogController _currentSlot](self, "_currentSlot");
  -[WBSTabDialogManager presentNextDialogForSlot:](dialogManager, "presentNextDialogForSlot:", v3, v4);
}

- ($74EE3C8A9A83D7DA9DE4D87A9C9037E2)_currentSlot
{
  unsigned int v3;
  unint64_t v4;
  uint64_t v5;
  $74EE3C8A9A83D7DA9DE4D87A9C9037E2 result;

  v3 = -[SFDialogController _currentWebProcessID](self, "_currentWebProcessID");
  v4 = -[SFDialogController _tabID](self, "_tabID");
  v5 = v3;
  result.var1 = v4;
  result.var0 = v5;
  return result;
}

- (int)_currentWebProcessID
{
  SFDialogController *v2;
  id WeakRetained;

  v2 = self;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dialogPresenter);
  LODWORD(v2) = objc_msgSend(WeakRetained, "webProcessIDForDialogController:", v2);

  return (int)v2;
}

- (void)setViewControllerPresenter:(id)a3
{
  objc_storeWeak((id *)&self->_viewControllerPresenter, a3);
}

- (void)setDialogPresenter:(id)a3
{
  objc_storeWeak((id *)&self->_dialogPresenter, a3);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SFDialog)presentedDialog
{
  return self->_presentedDialog;
}

- (void)cancelPresentedDialogIfNeeded
{
  if (self->_presentedDialog)
    -[SFDialogController _dismissCurrentDialogWithResponse:](self, "_dismissCurrentDialogWithResponse:", 0);
}

- (SFDialogController)init
{
  id v3;
  void *v4;

  if (!defaultDialogManager)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0D8A208]);
    v4 = (void *)defaultDialogManager;
    defaultDialogManager = (uint64_t)v3;

  }
  return (SFDialogController *)-[SFDialogController _initWithDialogManager:](self, "_initWithDialogManager:");
}

- (id)_initWithDialogManager:(id)a3
{
  id v5;
  SFDialogController *v6;
  SFDialogController *v7;
  SFDialogController *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SFDialogController;
  v6 = -[SFDialogController init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dialogManager, a3);
    v8 = v7;
  }

  return v7;
}

- (void)presentDialog:(id)a3
{
  -[SFDialogController presentDialog:animateAlongsidePresentation:dismissal:](self, "presentDialog:animateAlongsidePresentation:dismissal:", a3, 0, 0);
}

- (void)presentDialog:(id)a3 animateAlongsidePresentation:(id)a4 dismissal:(id)a5
{
  id v8;
  id v9;
  id v10;
  int v11;
  unsigned int v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  id v29;
  _QWORD aBlock[4];
  id v31;
  id v32;
  id v33;
  unsigned int v34;
  id from;
  id location[2];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[SFDialogController _currentWebProcessID](self, "_currentWebProcessID");
  if (v11)
  {
    v12 = v11;
    objc_initWeak(location, self);
    objc_initWeak(&from, self->_dialogManager);
    v13 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __75__SFDialogController_presentDialog_animateAlongsidePresentation_dismissal___block_invoke;
    aBlock[3] = &unk_1E21E65B8;
    objc_copyWeak(&v33, location);
    v14 = v8;
    v31 = v14;
    v34 = v12;
    v32 = v9;
    v15 = _Block_copy(aBlock);
    v25[0] = v13;
    v25[1] = 3221225472;
    v25[2] = __75__SFDialogController_presentDialog_animateAlongsidePresentation_dismissal___block_invoke_2;
    v25[3] = &unk_1E21E65E0;
    objc_copyWeak(&v28, location);
    objc_copyWeak(&v29, &from);
    v27 = v10;
    v16 = v14;
    v26 = v16;
    v17 = _Block_copy(v25);
    v24 = v15;
    objc_msgSend(MEMORY[0x1E0D8A1F0], "tabDialogWithPresentationBlock:dismissalBlock:", v15, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setBlocksWebProcessUntilDismissed:", objc_msgSend(v16, "completionHandlerBlocksWebProcess"));
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v16, "canceledOnProvisionalNavigation") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0D8A200], "provisionalNavigationExemption");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addObject:", v20);

    }
    if ((objc_msgSend(v16, "canceledOnCommittedNavigation") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0D8A200], "committedNavigationExemption");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addObject:", v21);

    }
    if ((objc_msgSend(v16, "canceledOnApplicationBackground") & 1) == 0)
    {
      v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8A200]), "initWithCancellationHandler:", &__block_literal_global_52);
      objc_msgSend(v19, "addObject:", v22);

    }
    objc_msgSend(v16, "additionalCancellationExemptions");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObjectsFromArray:", v23);

    objc_msgSend(v18, "setCancellationExemptions:", v19);
    -[WBSTabDialogManager enqueueOrPresentDialog:inSlot:](self->_dialogManager, "enqueueOrPresentDialog:inSlot:", v18, v12, -[SFDialogController _tabID](self, "_tabID"));

    objc_destroyWeak(&v29);
    objc_destroyWeak(&v28);

    objc_destroyWeak(&v33);
    objc_destroyWeak(&from);
    objc_destroyWeak(location);
  }
  else
  {
    objc_msgSend(v8, "completeWithResponse:", 0);
  }

}

uint64_t __75__SFDialogController_presentDialog_animateAlongsidePresentation_dismissal___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = objc_msgSend(WeakRetained, "_presentDialog:forWebProcessID:withAdditionalAnimations:", *(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 56), *(_QWORD *)(a1 + 40));

  return v3;
}

void __75__SFDialogController_presentDialog_animateAlongsidePresentation_dismissal___block_invoke_2(uint64_t a1, void *a2, int a3)
{
  id WeakRetained;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v6 = objc_loadWeakRetained((id *)(a1 + 56));
  if (a3)
    objc_msgSend(WeakRetained, "_dismissDialogWithAdditionalAnimations:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "completeWithResponse:", v9);
  v7 = objc_msgSend(WeakRetained, "_currentSlot");
  objc_msgSend(v6, "presentNextDialogForSlot:", v7, v8);

}

uint64_t __75__SFDialogController_presentDialog_animateAlongsidePresentation_dismissal___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "reason");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("SFTabDialogCancellationReasonApplicationBackground"));

  return v3;
}

- (void)owningTabWillClose
{
  WBSTabDialogManager *dialogManager;
  unint64_t v3;
  id v4;

  dialogManager = self->_dialogManager;
  v3 = -[SFDialogController _tabID](self, "_tabID");
  objc_msgSend(MEMORY[0x1E0D8A1F8], "tabClosedContext");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[WBSTabDialogManager cancelAllDialogsForTabID:context:](dialogManager, "cancelAllDialogsForTabID:context:", v3, v4);

}

- (void)owningWebViewDidChangeProcessID
{
  WBSTabDialogManager *dialogManager;
  unint64_t v3;
  id v4;

  dialogManager = self->_dialogManager;
  v3 = -[SFDialogController _tabID](self, "_tabID");
  objc_msgSend(MEMORY[0x1E0D8A1F8], "tabClosedContext");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[WBSTabDialogManager cancelAllDialogsForTabID:context:](dialogManager, "cancelAllDialogsForTabID:context:", v3, v4);

}

- (void)owningWebViewWillNavigate
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  WBSTabDialogManager *dialogManager;
  id v7;

  v3 = -[SFDialogController _currentSlot](self, "_currentSlot");
  v5 = v4;
  -[WBSTabDialogManager cancelAllDialogsBlockingSlot:](self->_dialogManager, "cancelAllDialogsBlockingSlot:", v3, v4);
  dialogManager = self->_dialogManager;
  objc_msgSend(MEMORY[0x1E0D8A1F8], "provisionalNavigationContext");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[WBSTabDialogManager cancelAllDialogsForTabID:context:](dialogManager, "cancelAllDialogsForTabID:context:", v5, v7);

}

- (void)owningWebViewDidCommitNavigationWithURL:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  WBSTabDialogManager *dialogManager;
  id v9;

  v4 = a3;
  v5 = -[SFDialogController _currentSlot](self, "_currentSlot");
  v7 = v6;
  -[WBSTabDialogManager cancelAllDialogsBlockingSlot:](self->_dialogManager, "cancelAllDialogsBlockingSlot:", v5, v6);
  dialogManager = self->_dialogManager;
  objc_msgSend(MEMORY[0x1E0D8A1F8], "committedNavigationContextWithURL:", v4);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[WBSTabDialogManager cancelAllDialogsForTabID:context:](dialogManager, "cancelAllDialogsForTabID:context:", v7, v9);
}

+ (void)applicationDidEnterBackground
{
  void *v2;
  id v3;

  v2 = (void *)defaultDialogManager;
  objc_msgSend(MEMORY[0x1E0D8A1F8], "cancellationContextWithReason:userInfo:", CFSTR("SFTabDialogCancellationReasonApplicationBackground"), 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancelAllDialogsWithContext:", v3);

}

- (BOOL)_isPresentingDialog
{
  return self->_webProcessID != 0;
}

- (int64_t)_presentDialog:(id)a3 forWebProcessID:(int)a4 withAdditionalAnimations:(id)a5
{
  id v9;
  id v10;
  id WeakRetained;
  uint64_t v12;
  uint64_t v13;
  SFDialogView *v14;
  SFDialogView *dialogView;
  id v16;
  UIViewController *v17;
  UIViewController *dialogViewController;
  id v19;
  int64_t v20;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, void *);
  void *v25;
  id v26;
  id location;

  v9 = a3;
  v10 = a5;
  objc_initWeak(&location, self);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) == 0)
    goto LABEL_5;
  v12 = objc_msgSend(WeakRetained, "dialogController:presentationPolicyForDialog:", self, v9);
  if (v12 != 2)
  {
    if (v12 == 1)
    {
      -[WBSTabDialogManager cancelAllDialogsForTabID:](self->_dialogManager, "cancelAllDialogsForTabID:", -[SFDialogController _tabID](self, "_tabID"));
    }
    else if (!v12)
    {
LABEL_5:
      objc_storeStrong((id *)&self->_presentedDialog, a3);
      self->_webProcessID = a4;
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(WeakRetained, "dialogController:willPresentDialog:", self, v9);
      v13 = objc_msgSend(v9, "presentationStyle");
      if (v13 == 1)
      {
        v22 = MEMORY[0x1E0C809B0];
        v23 = 3221225472;
        v24 = __78__SFDialogController__presentDialog_forWebProcessID_withAdditionalAnimations___block_invoke;
        v25 = &unk_1E21E6648;
        objc_copyWeak(&v26, &location);
        v17 = (UIViewController *)objc_msgSend(v9, "newViewControllerRepresentationWithCompletionHandler:", &v22);
        dialogViewController = self->_dialogViewController;
        self->_dialogViewController = v17;

        v19 = objc_loadWeakRetained((id *)&self->_viewControllerPresenter);
        objc_msgSend(v19, "dialogController:presentViewController:withAdditionalAnimations:", self, self->_dialogViewController, v10, v22, v23, v24, v25);

        objc_destroyWeak(&v26);
      }
      else if (!v13)
      {
        v14 = (SFDialogView *)objc_msgSend(v9, "newDialogViewRepresentation");
        dialogView = self->_dialogView;
        self->_dialogView = v14;

        -[SFDialogView setDelegate:](self->_dialogView, "setDelegate:", self);
        v16 = objc_loadWeakRetained((id *)&self->_dialogPresenter);
        objc_msgSend(v16, "presentDialogView:withAdditionalAnimations:forDialogController:", self->_dialogView, v10, self);

      }
    }
    v20 = 0;
    goto LABEL_14;
  }
  v20 = 1;
LABEL_14:

  objc_destroyWeak(&location);
  return v20;
}

void __78__SFDialogController__presentDialog_forWebProcessID_withAdditionalAnimations___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_dismissCurrentDialogWithResponse:", v3);

}

- (void)_dismissDialogWithAdditionalAnimations:(id)a3
{
  id v4;
  SFDialog *v5;
  SFDialog *presentedDialog;
  SFDialogView *v7;
  SFDialogView *dialogView;
  UIViewController *v9;
  UIViewController *dialogViewController;
  id WeakRetained;
  void *v12;
  NSObject *v13;
  id v14;
  id v15;

  v4 = a3;
  if (-[SFDialogController _isPresentingDialog](self, "_isPresentingDialog"))
  {
    v5 = self->_presentedDialog;
    presentedDialog = self->_presentedDialog;
    self->_presentedDialog = 0;

    v7 = self->_dialogView;
    dialogView = self->_dialogView;
    self->_dialogView = 0;

    v9 = self->_dialogViewController;
    dialogViewController = self->_dialogViewController;
    self->_dialogViewController = 0;

    self->_webProcessID = 0;
    if (v7)
    {
      -[SFDialogView setDelegate:](v7, "setDelegate:", 0);
      WeakRetained = objc_loadWeakRetained((id *)&self->_dialogPresenter);
      objc_msgSend(WeakRetained, "dismissDialogView:withAdditionalAnimations:forDialogController:", v7, v4, self);

    }
    if (v9)
    {
      -[UIViewController presentingViewController](v9, "presentingViewController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v12)
      {
        v13 = WBS_LOG_CHANNEL_PREFIXTabDialogs();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          -[SFDialogController _dismissDialogWithAdditionalAnimations:].cold.1(v13);
      }
      v14 = objc_loadWeakRetained((id *)&self->_viewControllerPresenter);
      objc_msgSend(v14, "dialogController:dismissViewController:withAdditionalAnimations:", self, v9, v4);

    }
    v15 = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v15, "dialogController:didDismissDialog:", self, v5);

  }
}

- (void)_dismissCurrentDialogWithResponse:(id)a3
{
  WBSTabDialogManager *dialogManager;
  id v5;

  dialogManager = self->_dialogManager;
  v5 = a3;
  -[WBSTabDialogManager dismissCurrentDialogForTabID:withResponse:](dialogManager, "dismissCurrentDialogForTabID:withResponse:", -[SFDialogController _tabID](self, "_tabID"), v5);

}

- (void)dialogView:(id)a3 didSelectActionAtIndex:(unint64_t)a4 withInputText:(id)a5 passwordText:(id)a6
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a5;
  v9 = a6;
  v10 = (void *)MEMORY[0x1E0C99E08];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dictionaryWithObject:forKey:", v11, CFSTR("selectedActionIndex"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, CFSTR("text"));
  if (v9)
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v9, CFSTR("password"));
  -[SFDialogController _dismissCurrentDialogWithResponse:](self, "_dismissCurrentDialogWithResponse:", v12);

}

- (SFDialogControllerDelegate)delegate
{
  return (SFDialogControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (SFDialogViewPresenting)dialogPresenter
{
  return (SFDialogViewPresenting *)objc_loadWeakRetained((id *)&self->_dialogPresenter);
}

- (SFDialogViewControllerPresenting)viewControllerPresenter
{
  return (SFDialogViewControllerPresenting *)objc_loadWeakRetained((id *)&self->_viewControllerPresenter);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentedDialog, 0);
  objc_destroyWeak((id *)&self->_viewControllerPresenter);
  objc_destroyWeak((id *)&self->_dialogPresenter);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dialogViewController, 0);
  objc_storeStrong((id *)&self->_dialogView, 0);
  objc_storeStrong((id *)&self->_dialogManager, 0);
}

- (void)_dismissDialogWithAdditionalAnimations:(void *)a1 .cold.1(void *a1)
{
  NSObject *v1;
  int v2;
  uint64_t v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = 138543618;
  v3 = objc_opt_class();
  v4 = 2114;
  v5 = objc_opt_class();
  _os_log_error_impl(&dword_18B7B2000, v1, OS_LOG_TYPE_ERROR, "Dialog %{public}@'s view controller %{public}@ was dismissed out of band of the SFDialogController", (uint8_t *)&v2, 0x16u);

}

@end
