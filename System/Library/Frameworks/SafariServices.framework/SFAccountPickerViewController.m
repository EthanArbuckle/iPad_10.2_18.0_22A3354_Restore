@implementation SFAccountPickerViewController

- (SFAccountPickerViewController)initWithConfiguration:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  SFAccountPickerViewController *v8;
  uint64_t v9;
  id completionHandler;
  _SFAccountPickerTableViewController *v11;
  _SFAccountPickerTableViewController *accountPickerTableViewController;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  _ASIncomingCallObserver *callObserver;
  void *v17;
  SFAccountPickerViewController *v18;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  id location;
  objc_super v25;

  v6 = a3;
  v7 = a4;
  v25.receiver = self;
  v25.super_class = (Class)SFAccountPickerViewController;
  v8 = -[SFAccountPickerViewController initWithNibName:bundle:](&v25, sel_initWithNibName_bundle_, 0, 0);
  if (v8)
  {
    objc_initWeak(&location, v8);
    v9 = MEMORY[0x1A8598C40](v7);
    completionHandler = v8->_completionHandler;
    v8->_completionHandler = (id)v9;

    v11 = -[_SFAccountPickerTableViewController initWithConfiguration:]([_SFAccountPickerTableViewController alloc], "initWithConfiguration:", v6);
    accountPickerTableViewController = v8->_accountPickerTableViewController;
    v8->_accountPickerTableViewController = v11;

    -[_SFAccountPickerTableViewController setDelegate:](v8->_accountPickerTableViewController, "setDelegate:", v8);
    -[SFAccountPickerViewController pushViewController:animated:](v8, "pushViewController:animated:", v8->_accountPickerTableViewController, 0);
    v13 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __73__SFAccountPickerViewController_initWithConfiguration_completionHandler___block_invoke;
    v22[3] = &unk_1E4ABFF20;
    objc_copyWeak(&v23, &location);
    -[SFAccountPickerViewController _as_setApplicationBackgroundBlock:](v8, "_as_setApplicationBackgroundBlock:", v22);
    v14 = (void *)MEMORY[0x1E0C92650];
    v20[0] = v13;
    v20[1] = 3221225472;
    v20[2] = __73__SFAccountPickerViewController_initWithConfiguration_completionHandler___block_invoke_2;
    v20[3] = &unk_1E4ABFF20;
    objc_copyWeak(&v21, &location);
    objc_msgSend(v14, "callObserverWithBlock:", v20);
    v15 = objc_claimAutoreleasedReturnValue();
    callObserver = v8->_callObserver;
    v8->_callObserver = (_ASIncomingCallObserver *)v15;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObserver:selector:name:object:", v8, sel__viewControllerDismissalTransitionDidEnd_, *MEMORY[0x1E0DC5218], 0);

    v18 = v8;
    objc_destroyWeak(&v21);
    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }

  return v8;
}

void __73__SFAccountPickerViewController_initWithConfiguration_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_dismiss");

}

void __73__SFAccountPickerViewController_initWithConfiguration_completionHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_dismiss");

}

- (void)_dismiss
{
  -[SFAccountPickerViewController _dismissWithAnimation:accounts:](self, "_dismissWithAnimation:accounts:", 0, 0);
}

- (void)_callCompletionHandlerIfNeeded:(id)a3
{
  void (**completionHandler)(id, id);
  id v5;

  completionHandler = (void (**)(id, id))self->_completionHandler;
  if (completionHandler)
  {
    completionHandler[2](completionHandler, a3);
    v5 = self->_completionHandler;
    self->_completionHandler = 0;

  }
}

- (void)_viewControllerDismissalTransitionDidEnd:(id)a3
{
  if (!self->_isDismissingSelf)
  {
    if (-[SFAccountPickerViewController _sf_isPresentationControllerDismissalTransitionDidEndNotification:](self, "_sf_isPresentationControllerDismissalTransitionDidEndNotification:", a3))-[SFAccountPickerViewController _callCompletionHandlerIfNeeded:](self, "_callCompletionHandlerIfNeeded:", 0);
  }
}

- (void)_dismissWithAnimation:(BOOL)a3 accounts:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v6 = a4;
  self->_isDismissingSelf = 1;
  -[SFAccountPickerViewController presentingViewController](self, "presentingViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __64__SFAccountPickerViewController__dismissWithAnimation_accounts___block_invoke;
  v9[3] = &unk_1E4ABFB20;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v7, "dismissViewControllerAnimated:completion:", v4, v9);

}

uint64_t __64__SFAccountPickerViewController__dismissWithAnimation_accounts___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_callCompletionHandlerIfNeeded:", *(_QWORD *)(a1 + 40));
}

- (void)buildMenuWithBuilder:(id)a3
{
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SFAccountPickerViewController;
  v3 = a3;
  -[SFAccountPickerViewController buildMenuWithBuilder:](&v4, sel_buildMenuWithBuilder_, v3);
  objc_msgSend(v3, "replaceChildrenOfMenuForIdentifier:fromChildrenBlock:", *MEMORY[0x1E0DC5028], &__block_literal_global_61, v4.receiver, v4.super_class);

}

uint64_t __54__SFAccountPickerViewController_buildMenuWithBuilder___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "safari_filterObjectsUsingBlock:", &__block_literal_global_9_0);
}

BOOL __54__SFAccountPickerViewController_buildMenuWithBuilder___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;

  v2 = a2;
  v3 = (objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v2, "action") == (_QWORD)sel_captureTextFromCamera_;

  return v3;
}

- (void)accountPickerTableViewControllerDidCancel:(id)a3
{
  -[SFAccountPickerViewController _dismissWithAnimation:accounts:](self, "_dismissWithAnimation:accounts:", 1, 0);
}

- (void)accountPickerTableViewController:(id)a3 didPickSavedAccounts:(id)a4
{
  -[SFAccountPickerViewController _dismissWithAnimation:accounts:](self, "_dismissWithAnimation:accounts:", 1, a4);
}

- (void)accountPickerTableViewController:(id)a3 fillUsernameForSavedAccount:(id)a4
{
  id WeakRetained;
  id v6;

  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_systemAutoFillDelegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "accountPickerViewController:fillUsernameForSavedAccount:", self, v6);

}

- (void)accountPickerTableViewController:(id)a3 fillPasswordForSavedAccount:(id)a4
{
  id WeakRetained;
  id v6;

  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_systemAutoFillDelegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "accountPickerViewController:fillPasswordForSavedAccount:", self, v6);

}

- (void)accountPickerTableViewController:(id)a3 fillVerificationCodeForSavedAccount:(id)a4
{
  id WeakRetained;
  id v6;

  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_systemAutoFillDelegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "accountPickerViewController:fillVerificationCodeForSavedAccount:", self, v6);

}

- (void)accountPickerTableViewController:(id)a3 fillVerificationCode:(id)a4
{
  id WeakRetained;
  id v6;

  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_systemAutoFillDelegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "accountPickerViewController:fillVerificationCode:", self, v6);

}

- (LAContext)authenticatedContext
{
  return -[_SFAccountPickerTableViewController authenticatedContext](self->_accountPickerTableViewController, "authenticatedContext");
}

- (void)setAuthenticatedContext:(id)a3
{
  -[_SFAccountPickerTableViewController setAuthenticatedContext:](self->_accountPickerTableViewController, "setAuthenticatedContext:", a3);
}

- (void)setSearchQuery:(id)a3
{
  -[_SFAccountTableViewController setSearchQuery:](self->_accountPickerTableViewController, "setSearchQuery:", a3);
}

- (NSString)searchQuery
{
  return -[_SFAccountTableViewController searchQuery](self->_accountPickerTableViewController, "searchQuery");
}

- (SFAccountPickerViewControllerSystemAutoFillDelegate)systemAutoFillDelegate
{
  return (SFAccountPickerViewControllerSystemAutoFillDelegate *)objc_loadWeakRetained((id *)&self->_systemAutoFillDelegate);
}

- (void)setSystemAutoFillDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_systemAutoFillDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_systemAutoFillDelegate);
  objc_storeStrong((id *)&self->_callObserver, 0);
  objc_storeStrong((id *)&self->_accountPickerTableViewController, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

@end
