@implementation AAUICodeEntryViewController

- (AAUICodeEntryViewController)initWithContext:(id)a3
{
  id v5;
  AAUICodeEntryViewController *v6;
  AAUICodeEntryViewController *v7;
  void *v8;
  void *v9;
  _BOOL8 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)AAUICodeEntryViewController;
  v6 = -[DevicePINController init](&v16, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_context, a3);
    objc_msgSend(MEMORY[0x1E0D804E8], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", CFSTR("AAUICodeEntry"), 0, 0, 0, 0, 13, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setEditPaneClass:", objc_opt_class());
    -[DevicePINController setSpecifier:](v7, "setSpecifier:", v8);
    -[DevicePINController setMode:](v7, "setMode:", 3);
    -[DevicePINController setShouldDismissWhenDone:](v7, "setShouldDismissWhenDone:", 1);
    -[DevicePINController setHidesCancelButton:](v7, "setHidesCancelButton:", 0);
    -[DevicePINController setHidesNavigationButtons:](v7, "setHidesNavigationButtons:", 0);
    -[DevicePINController setPinDelegate:](v7, "setPinDelegate:", v7);
    -[DevicePINController setPinLength:](v7, "setPinLength:", 6);
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "userInterfaceIdiom") != 1;

    -[DevicePINController setNumericPIN:](v7, "setNumericPIN:", v10);
    objc_msgSend(MEMORY[0x1E0D804B8], "appearance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTextColor:", v12);

    objc_msgSend(MEMORY[0x1E0D804B8], "appearance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setBackgroundColor:", v14);

  }
  return v7;
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  AAUICodeEntryViewController *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AAUICodeEntryViewController;
  -[DevicePINController viewWillAppear:](&v9, sel_viewWillAppear_, a3);
  -[AAUICodeEntryViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (AAUICodeEntryViewController *)objc_claimAutoreleasedReturnValue();

  if (v6 == self)
  {
    -[AAUICodeEntryViewController navigationController](self, "navigationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "navigationBar");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_setBackgroundOpacity:", 0.0);

  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AAUICodeEntryViewController;
  -[DevicePINController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[AAUICodeEntryViewController _enableUserInteractionAndStopSpinner](self, "_enableUserInteractionAndStopSpinner");
}

- (id)stringsBundle
{
  return (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
}

- (BOOL)showSimplePINCancelButtonOnLeft
{
  return 1;
}

- (CGSize)preferredContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = *MEMORY[0x1E0C9D820];
  v3 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  result.height = v3;
  result.width = v2;
  return result;
}

- (BOOL)simplePIN
{
  return 1;
}

- (void)setPane:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)AAUICodeEntryViewController;
  -[DevicePINController setPane:](&v5, sel_setPane_, v4);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v4, "setContext:", self->_context);

}

- (id)pinInstructionsPrompt
{
  if (self->_pinInstructions)
    return self->_pinInstructions;
  else
    return &stru_1EA2E2A18;
}

- (void)didAcceptEnteredPIN:(id)a3
{
  -[AAUICodeEntryViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)didCancelEnteringPIN
{
  void *v3;
  void (**v4)(void);

  -[AAUICodeEntryContext cancelEntryAction](self->_context, "cancelEntryAction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[AAUICodeEntryContext cancelEntryAction](self->_context, "cancelEntryAction");
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v4[2]();

  }
}

- (BOOL)validatePIN:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  dispatch_semaphore_t v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  NSObject *v9;
  BOOL v10;
  _QWORD v12[4];
  NSObject *v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  v4 = a3;
  -[PSDetailController pane](self, "pane");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resignFirstResponder");

  -[AAUICodeEntryContext codeEnteredAction](self->_context, "codeEnteredAction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[AAUICodeEntryViewController _disableUserInteractionAndStartSpinner](self, "_disableUserInteractionAndStartSpinner");
    v20 = 0;
    v21 = &v20;
    v22 = 0x2020000000;
    v23 = 0;
    v16 = 0;
    v17 = &v16;
    v18 = 0x2020000000;
    v19 = 0;
    v7 = dispatch_semaphore_create(0);
    -[AAUICodeEntryContext codeEnteredAction](self->_context, "codeEnteredAction");
    v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __43__AAUICodeEntryViewController_validatePIN___block_invoke;
    v12[3] = &unk_1EA2DCA28;
    v14 = &v20;
    v15 = &v16;
    v9 = v7;
    v13 = v9;
    ((void (**)(_QWORD, id, _QWORD *))v8)[2](v8, v4, v12);

    dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
    if (!*((_BYTE *)v21 + 24))
    {
      if (*((_BYTE *)v17 + 24))
      {
        -[AAUICodeEntryViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
        v10 = 0;
        goto LABEL_7;
      }
      -[AAUICodeEntryViewController _showIncorrectCodeAlert](self, "_showIncorrectCodeAlert");
    }
    -[AAUICodeEntryViewController _enableUserInteractionAndStopSpinner](self, "_enableUserInteractionAndStopSpinner");
    v10 = *((_BYTE *)v21 + 24) != 0;
LABEL_7:

    _Block_object_dispose(&v16, 8);
    _Block_object_dispose(&v20, 8);
    goto LABEL_8;
  }
  v10 = 1;
LABEL_8:

  return v10;
}

intptr_t __43__AAUICodeEntryViewController_validatePIN___block_invoke(uint64_t a1, char a2, char a3)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a3;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)title
{
  return 0;
}

- (void)_showIncorrectCodeAlert
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  id location;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("INCORRECT_CODE_TRY_AGAIN_ALERT"), &stru_1EA2E2A18, CFSTR("Localizable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("INCORRECT_CODE_TRY_AGAIN_ALERT_TITLE"), &stru_1EA2E2A18, CFSTR("Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3450], "alertWithTitle:message:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v8 = (void *)MEMORY[0x1E0DC3448];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1EA2E2A18, CFSTR("Localizable"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __54__AAUICodeEntryViewController__showIncorrectCodeAlert__block_invoke;
  v15 = &unk_1EA2DBA30;
  objc_copyWeak(&v16, &location);
  objc_msgSend(v8, "actionWithTitle:style:handler:", v10, 0, &v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "addAction:", v11, v12, v13, v14, v15);
  -[AAUICodeEntryViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

void __54__AAUICodeEntryViewController__showIncorrectCodeAlert__block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "pane");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "becomeFirstResponder");

}

- (void)_disableUserInteractionAndStartSpinner
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0D804D0], "sharedSpinnerManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAUICodeEntryViewController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startAnimatingInNavItem:forIdentifier:hideBackButton:", v4, CFSTR("aauiCodeEntryValidator"), 1);

  -[AAUICodeEntryViewController view](self, "view");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUserInteractionEnabled:", 0);

}

- (void)_enableUserInteractionAndStopSpinner
{
  void *v2;
  id v3;

  -[AAUICodeEntryViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setUserInteractionEnabled:", 1);

  objc_msgSend(MEMORY[0x1E0D804D0], "sharedSpinnerManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopAnimatingForIdentifier:", CFSTR("aauiCodeEntryValidator"));

}

- (AAUICodeEntryContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_pinInstructions, 0);
}

@end
