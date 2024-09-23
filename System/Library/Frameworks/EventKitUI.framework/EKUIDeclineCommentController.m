@implementation EKUIDeclineCommentController

+ (id)_newDeclineCommentControllerWithCompletionBlock:(id)a3
{
  id v3;
  _QWORD *v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD aBlock[4];
  id v10;
  id v11;
  id location;

  v3 = a3;
  if (_newDeclineCommentControllerWithCompletionBlock__onceToken != -1)
    dispatch_once(&_newDeclineCommentControllerWithCompletionBlock__onceToken, &__block_literal_global_23);
  v4 = (_QWORD *)objc_opt_new();
  objc_initWeak(&location, v4);
  objc_msgSend((id)_newDeclineCommentControllerWithCompletionBlock__s_controllers, "addObject:", v4);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __80__EKUIDeclineCommentController__newDeclineCommentControllerWithCompletionBlock___block_invoke_2;
  aBlock[3] = &unk_1E601A180;
  v10 = v3;
  v5 = v3;
  objc_copyWeak(&v11, &location);
  v6 = _Block_copy(aBlock);
  v7 = (void *)v4[3];
  v4[3] = v6;

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
  return v4;
}

void __80__EKUIDeclineCommentController__newDeclineCommentControllerWithCompletionBlock___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)_newDeclineCommentControllerWithCompletionBlock__s_controllers;
  _newDeclineCommentControllerWithCompletionBlock__s_controllers = v0;

}

void __80__EKUIDeclineCommentController__newDeclineCommentControllerWithCompletionBlock___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  id *v7;
  id WeakRetained;
  void *v9;
  id v10;
  id v11;

  v5 = a2;
  v6 = *(_QWORD *)(a1 + 32);
  v11 = v5;
  if (v6)
    (*(void (**)(uint64_t, id, uint64_t))(v6 + 16))(v6, v5, a3);
  v7 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained(v7);

  if (WeakRetained)
  {
    v9 = (void *)_newDeclineCommentControllerWithCompletionBlock__s_controllers;
    v10 = objc_loadWeakRetained(v7);
    objc_msgSend(v9, "removeObject:", v10);

  }
}

+ (id)presentDeclineCommentAlertWithOrganizer:(id)a3 currentComment:(id)a4 viewController:(id)a5 completionBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = (void *)objc_msgSend(a1, "_newDeclineCommentControllerWithCompletionBlock:", a6);
  objc_msgSend(v13, "_presentAlertWithOrganizer:currentComment:viewController:", v12, v11, v10);

  return v13;
}

- (void)dealloc
{
  objc_super v3;

  -[EKUIDeclineCommentController dismissAnimated:](self, "dismissAnimated:", 0);
  v3.receiver = self;
  v3.super_class = (Class)EKUIDeclineCommentController;
  -[EKUIDeclineCommentController dealloc](&v3, sel_dealloc);
}

- (void)_presentAlertWithOrganizer:(id)a3 currentComment:(id)a4 viewController:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  UIAlertController *v19;
  UIAlertController *alertController;
  UIAlertController *v21;
  uint64_t v22;
  id v23;
  UIAlertController *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  UIAlertController *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _QWORD v35[4];
  id v36;
  _QWORD v37[4];
  id v38;
  _QWORD v39[4];
  id v40;
  id v41;
  id location[2];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x1E0DC3450];
  EventKitUIBundle();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Decline Event"), &stru_1E601DFA8, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1E0CB3940];
  EventKitUIBundle();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("Enter an optional comment to %@."), &stru_1E601DFA8, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v8;
  CUIKDisplayStringForNotificationIdentity();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringWithFormat:", v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "alertControllerWithTitle:message:preferredStyle:", v13, v18, 1);
  v19 = (UIAlertController *)objc_claimAutoreleasedReturnValue();
  alertController = self->_alertController;
  self->_alertController = v19;

  objc_initWeak(location, self);
  v21 = self->_alertController;
  v22 = MEMORY[0x1E0C809B0];
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __89__EKUIDeclineCommentController__presentAlertWithOrganizer_currentComment_viewController___block_invoke;
  v39[3] = &unk_1E601A1A8;
  v23 = v9;
  v40 = v23;
  objc_copyWeak(&v41, location);
  -[UIAlertController addTextFieldWithConfigurationHandler:](v21, "addTextFieldWithConfigurationHandler:", v39);
  v24 = self->_alertController;
  v25 = (void *)MEMORY[0x1E0DC3448];
  EventKitUIBundle();
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("Cancel decline"), CFSTR("Cancel"), 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v22;
  v37[1] = 3221225472;
  v37[2] = __89__EKUIDeclineCommentController__presentAlertWithOrganizer_currentComment_viewController___block_invoke_2;
  v37[3] = &unk_1E601A1D0;
  objc_copyWeak(&v38, location);
  objc_msgSend(v25, "actionWithTitle:style:handler:", v27, 1, v37);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAlertController addAction:](v24, "addAction:", v28);

  v29 = self->_alertController;
  v30 = (void *)MEMORY[0x1E0DC3448];
  EventKitUIBundle();
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("Decline"), &stru_1E601DFA8, 0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __89__EKUIDeclineCommentController__presentAlertWithOrganizer_currentComment_viewController___block_invoke_3;
  v35[3] = &unk_1E601A1D0;
  objc_copyWeak(&v36, location);
  objc_msgSend(v30, "actionWithTitle:style:handler:", v32, 0, v35);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAlertController addAction:](v29, "addAction:", v33);

  objc_msgSend(v10, "presentViewController:animated:completion:", self->_alertController, 1, 0);
  objc_destroyWeak(&v36);
  objc_destroyWeak(&v38);
  objc_destroyWeak(&v41);

  objc_destroyWeak(location);
}

void __89__EKUIDeclineCommentController__presentAlertWithOrganizer_currentComment_viewController___block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  void *v5;
  id *WeakRetained;
  id *v7;
  id v8;

  v8 = a2;
  EventKitUIBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Comment to Organizer"), &stru_1E601DFA8, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPlaceholder:", v5);

  objc_msgSend(v8, "setText:", *(_QWORD *)(a1 + 32));
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v7 = WeakRetained;
  if (WeakRetained)
    objc_storeStrong(WeakRetained + 2, a2);

}

void __89__EKUIDeclineCommentController__presentAlertWithOrganizer_currentComment_viewController___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_completeWithButton:", 0);

}

void __89__EKUIDeclineCommentController__presentAlertWithOrganizer_currentComment_viewController___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_completeWithButton:", 1);

}

- (void)_completeWithButton:(unint64_t)a3
{
  id completionBlock;
  _BOOL8 v5;
  void *v6;
  id v7;
  UIAlertController *alertController;
  UITextField *alertTextField;
  void (**v10)(id, void *, _BOOL8);

  completionBlock = self->_completionBlock;
  if (completionBlock)
  {
    v5 = a3 == 0;
    v10 = (void (**)(id, void *, _BOOL8))_Block_copy(completionBlock);
    -[UITextField text](self->_alertTextField, "text");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = self->_completionBlock;
    self->_completionBlock = 0;

    alertController = self->_alertController;
    self->_alertController = 0;

    alertTextField = self->_alertTextField;
    self->_alertTextField = 0;

    v10[2](v10, v6, v5);
  }
}

- (void)dismissAnimated:(BOOL)a3
{
  -[UIAlertController dismissViewControllerAnimated:completion:](self->_alertController, "dismissViewControllerAnimated:completion:", a3, 0);
  -[EKUIDeclineCommentController _completeWithButton:](self, "_completeWithButton:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_alertTextField, 0);
  objc_storeStrong((id *)&self->_alertController, 0);
}

@end
