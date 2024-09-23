@implementation AKBasicLoginViewController

- (AKBasicLoginViewController)initWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  AKBasicLoginViewController *v7;
  objc_super v9;

  v4 = a3;
  objc_msgSend(v4, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reason");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)AKBasicLoginViewController;
  v7 = -[AKBasicLoginViewController initWithTitle:detailText:icon:](&v9, sel_initWithTitle_detailText_icon_, v5, v6, 0);

  if (v7)
  {
    objc_storeWeak((id *)&v7->_context, v4);
    if (objc_msgSend(v4, "shouldAllowAppleIDCreation"))
      objc_msgSend(v4, "setIsUsernameEditable:", 1);
  }

  return v7;
}

- (void)loadView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AKBasicLoginViewController;
  -[OBBaseWelcomeController loadView](&v7, sel_loadView);
  -[OBBaseWelcomeController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKBasicLoginViewController _cancelBarButtonItem](self, "_cancelBarButtonItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLeftBarButtonItem:", v4);

  -[OBBaseWelcomeController navigationItem](self, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKBasicLoginViewController _signInBarButtonItem](self, "_signInBarButtonItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRightBarButtonItem:", v6);

  -[AKBasicLoginViewController _initializeView](self, "_initializeView");
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AKBasicLoginViewController;
  -[AKBasicLoginViewController viewWillAppear:](&v3, sel_viewWillAppear_, a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  _BOOL4 v5;
  int *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AKBasicLoginViewController;
  -[OBBaseWelcomeController viewDidAppear:](&v8, sel_viewDidAppear_, a3);
  -[AKBasicLoginViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "basicLoginControllerDidPresent:", self);

  -[UITableView reloadData](self->_tableView, "reloadData");
  v5 = -[AKBasicLoginViewController _shouldShowUserName](self, "_shouldShowUserName");
  v6 = &OBJC_IVAR___AKBasicLoginViewController__passwordCell;
  if (v5)
    v6 = &OBJC_IVAR___AKBasicLoginViewController__usernameCell;
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + *v6), "cellTextField");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "becomeFirstResponder");

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AKBasicLoginViewController;
  -[AKBasicLoginViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, a3);
  -[AKBasicLoginViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "basicLoginControllerWillDismiss:", self);

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void (**v8)(void);
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AKBasicLoginViewController;
  -[AKBasicLoginViewController viewDidDisappear:](&v9, sel_viewDidDisappear_, a3);
  -[AKBasicLoginViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "basicLoginControllerDidDismiss:", self);

  -[AKBasicLoginViewController loginActions](self, "loginActions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ak_cancelAction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[AKBasicLoginViewController loginActions](self, "loginActions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "ak_cancelAction");
    v8 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v8[2]();

  }
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  objc_super v8;

  -[AKBasicLoginViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutIfNeeded");

  -[AKBasicLoginViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentSize");
  v6 = v5;
  -[AKBasicLoginViewController heightAnchor](self, "heightAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setConstant:", v6);

  v8.receiver = self;
  v8.super_class = (Class)AKBasicLoginViewController;
  -[OBBaseWelcomeController viewDidLayoutSubviews](&v8, sel_viewDidLayoutSubviews);
}

- (int64_t)modalPresentationStyle
{
  return 2;
}

- (BOOL)isPresentedModally
{
  void *v3;
  void *v4;
  void *v5;
  AKBasicLoginViewController *v6;
  BOOL v7;
  void *v8;

  -[AKBasicLoginViewController navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    goto LABEL_4;
  -[AKBasicLoginViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (AKBasicLoginViewController *)objc_claimAutoreleasedReturnValue();

  if (v6 != self)
    return 0;
LABEL_4:
  -[AKBasicLoginViewController presentingViewController](self, "presentingViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v8 != 0;

  return v7;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)startAnimating
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA2C8]), "initWithActivityIndicatorStyle:", 100);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithCustomView:", v5);
  -[OBBaseWelcomeController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRightBarButtonItem:", v3);

  objc_msgSend(v5, "startAnimating");
}

- (void)stopAnimating
{
  void *v3;
  id v4;

  -[OBBaseWelcomeController navigationItem](self, "navigationItem");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AKBasicLoginViewController _signInBarButtonItem](self, "_signInBarButtonItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRightBarButtonItem:", v3);

}

- (void)clearPasswordField
{
  id v2;

  -[AKBasicLoginViewController passwordCellTextField](self, "passwordCellTextField");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setText:", 0);

}

- (void)_cancelPressed:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void (**v8)(void);
  uint8_t v9[16];

  _AKLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1BD795000, v4, OS_LOG_TYPE_DEFAULT, "Cancel Pressed", v9, 2u);
  }

  -[AKBasicLoginViewController loginActions](self, "loginActions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ak_cancelAction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[AKBasicLoginViewController loginActions](self, "loginActions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "ak_cancelAction");
    v8 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v8[2]();

  }
}

- (void)_signInPressed:(id)a3
{
  void *WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void (**v13)(_QWORD, _QWORD, _QWORD);
  id v14;

  if (-[AKBasicLoginViewController _shouldShowUserName](self, "_shouldShowUserName", a3))
  {
    -[AKBasicLoginViewController usernameCellTextField](self, "usernameCellTextField");
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "text");
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_context);
    objc_msgSend(WeakRetained, "username");
  }
  v14 = (id)objc_claimAutoreleasedReturnValue();

  -[AKBasicLoginViewController passwordCellTextField](self, "passwordCellTextField");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[AKBasicLoginViewController passwordHandler](self, "passwordHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[AKBasicLoginViewController passwordHandler](self, "passwordHandler");
    v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, _QWORD))v8)[2](v8, v6, 0);

    -[AKBasicLoginViewController setPasswordHandler:](self, "setPasswordHandler:", 0);
  }
  else
  {
    -[AKBasicLoginViewController loginActions](self, "loginActions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "authenticateAction");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[AKBasicLoginViewController _formatUsernameAsPhoneNumberIfNeeded:](self, "_formatUsernameAsPhoneNumberIfNeeded:", v14);
      v11 = objc_claimAutoreleasedReturnValue();

      -[AKBasicLoginViewController loginActions](self, "loginActions");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "authenticateAction");
      v13 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, uint64_t, void *))v13)[2](v13, v11, v6);

      v14 = (id)v11;
    }
  }

}

- (id)_title
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  const __CFString *v11;
  __CFString *v13;
  char v14;
  int v15;

  -[AKBasicLoginViewController context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    if ((objc_msgSend(v3, "isUsernameEditable") & 1) != 0 || (objc_msgSend(v3, "shouldAllowAppleIDCreation") & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AuthKitUI"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(CFSTR("APPLE_ID_SIGN_IN_HEADER"), "containsString:", CFSTR("REBRAND")))
      {
        objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("APPLE_ID_SIGN_IN_HEADER"), &stru_1E7679C68, CFSTR("Localizable"));
        v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:

        goto LABEL_15;
      }
      objc_msgSend(MEMORY[0x1E0D001E8], "sharedManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "isAABrandingEnabled"))
      {
        objc_msgSend(CFSTR("APPLE_ID_SIGN_IN_HEADER"), "stringByAppendingString:", CFSTR("_REBRAND"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "localizedStringForKey:value:table:", v8, &stru_1E7679C68, CFSTR("Localizable"));
        v5 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_13:
        goto LABEL_14;
      }
      v11 = CFSTR("APPLE_ID_SIGN_IN_HEADER");
      v10 = v6;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D001D8], "currentDevice");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v6, "isMultiUserMode");
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AuthKitUI"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v10;
      if ((v9 & 1) == 0)
      {
        v13 = CFSTR("APPLE_ID_PASSWORD_HEADER");
        v14 = objc_msgSend(CFSTR("APPLE_ID_PASSWORD_HEADER"), "containsString:", CFSTR("REBRAND"));
        if ((v14 & 1) != 0)
        {
          v15 = 0;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0D001E8], "sharedManager");
          v2 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v2, "isAABrandingEnabled"))
          {
            objc_msgSend(CFSTR("APPLE_ID_PASSWORD_HEADER"), "stringByAppendingString:", CFSTR("_REBRAND"));
            v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v15 = 1;
          }
          else
          {
            v15 = 0;
          }
        }
        objc_msgSend(v7, "localizedStringForKey:value:table:", v13, &stru_1E7679C68, CFSTR("Localizable"));
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)

        if ((v14 & 1) == 0)
        goto LABEL_13;
      }
      v11 = CFSTR("APPLE_ID_PASSCODE_HEADER_IPAD");
    }
    objc_msgSend(v10, "localizedStringForKey:value:table:", v11, &stru_1E7679C68, CFSTR("Localizable"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  objc_msgSend(v3, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:

  return v5;
}

- (BOOL)_shouldShowUserName
{
  void *v2;
  char v3;

  -[AKBasicLoginViewController context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isUsernameEditable");

  return v3;
}

- (BOOL)_shouldShowPassword
{
  void *v3;
  BOOL v4;

  -[AKBasicLoginViewController context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_msgSend(v3, "_requiresPasswordInput") & 1) != 0
    || -[AKBasicLoginViewController isPasswordFieldVisible](self, "isPasswordFieldVisible");

  return v4;
}

- (id)_loginOptions
{
  UIView *loginOptions;
  UIView *v4;
  UIView *v5;
  AKBasicLoginOptionsViewController *v6;
  void *v7;
  AKBasicLoginOptionsViewController *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  UIView *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  _QWORD v41[4];
  id v42;
  _QWORD v43[4];
  id v44;
  id location;
  _QWORD v46[6];

  v46[4] = *MEMORY[0x1E0C80C00];
  loginOptions = self->_loginOptions;
  if (!loginOptions)
  {
    v4 = (UIView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
    v5 = self->_loginOptions;
    self->_loginOptions = v4;

    v6 = [AKBasicLoginOptionsViewController alloc];
    -[AKBasicLoginViewController context](self, "context");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[AKBasicLoginOptionsViewController initWithContext:](v6, "initWithContext:", v7);
    -[AKBasicLoginViewController setLoginOptionsViewController:](self, "setLoginOptionsViewController:", v8);

    -[AKBasicLoginViewController loginOptionsViewController](self, "loginOptionsViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[AKBasicLoginViewController loginOptionsViewController](self, "loginOptionsViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKBasicLoginViewController addChildViewController:](self, "addChildViewController:", v11);

    objc_initWeak(&location, self);
    v12 = MEMORY[0x1E0C809B0];
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = __43__AKBasicLoginViewController__loginOptions__block_invoke;
    v43[3] = &unk_1E7678EE8;
    objc_copyWeak(&v44, &location);
    -[AKBasicLoginViewController loginOptionsViewController](self, "loginOptionsViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setCreateIDAction:", v43);

    v41[0] = v12;
    v41[1] = 3221225472;
    v41[2] = __43__AKBasicLoginViewController__loginOptions__block_invoke_48;
    v41[3] = &unk_1E7678EE8;
    objc_copyWeak(&v42, &location);
    -[AKBasicLoginViewController loginOptionsViewController](self, "loginOptionsViewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setForgotAction:", v41);

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_loginOptions, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v15 = self->_loginOptions;
    -[AKBasicLoginViewController loginOptionsViewController](self, "loginOptionsViewController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "view");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addSubview:](v15, "addSubview:", v17);

    -[AKBasicLoginViewController loginOptionsViewController](self, "loginOptionsViewController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "didMoveToParentViewController:", self);

    -[AKBasicLoginViewController loginOptionsViewController](self, "loginOptionsViewController");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "view");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "topAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](self->_loginOptions, "topAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "constraintEqualToAnchor:", v37);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v46[0] = v36;
    -[AKBasicLoginViewController loginOptionsViewController](self, "loginOptionsViewController");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "view");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "bottomAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](self->_loginOptions, "bottomAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "constraintEqualToAnchor:", v32);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v46[1] = v31;
    -[AKBasicLoginViewController loginOptionsViewController](self, "loginOptionsViewController");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "view");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "leadingAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](self->_loginOptions, "leadingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:constant:", v20, 20.0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v46[2] = v21;
    -[AKBasicLoginViewController loginOptionsViewController](self, "loginOptionsViewController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "view");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "trailingAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](self->_loginOptions, "trailingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:constant:", v25, -20.0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v46[3] = v26;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 4);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v28);
    objc_destroyWeak(&v42);
    objc_destroyWeak(&v44);
    objc_destroyWeak(&location);
    loginOptions = self->_loginOptions;
  }
  return loginOptions;
}

void __43__AKBasicLoginViewController__loginOptions__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void (**v8)(void);
  uint8_t v9[16];

  _AKLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1BD795000, v2, OS_LOG_TYPE_DEFAULT, "Create Pressed", v9, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "loginActions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "createIDAction");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "loginActions");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "createIDAction");
      v8 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v8[2]();

    }
  }

}

void __43__AKBasicLoginViewController__loginOptions__block_invoke_48(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD);
  uint8_t v11[16];

  _AKLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_1BD795000, v2, OS_LOG_TYPE_DEFAULT, "Forgot Pressed", v11, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "loginActions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "forgotPasswordAction");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      if ((objc_msgSend(v4, "_shouldShowUserName") & 1) != 0)
      {
        objc_msgSend(v4, "usernameCellTextField");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "text");
      }
      else
      {
        objc_msgSend(v4, "context");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "username");
      }
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "loginActions");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "forgotPasswordAction");
      v10 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v10)[2](v10, v8);

    }
  }

}

- (id)_cancelBarButtonItem
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithBarButtonSystemItem:target:action:", 1, self, sel__cancelPressed_);
}

- (id)_signInBarButtonItem
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc(MEMORY[0x1E0CEA380]);
  WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  objc_msgSend(WeakRetained, "defaultButtonString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)objc_msgSend(v3, "initWithTitle:style:target:action:", v5, 0, self, sel__signInPressed_);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AuthKitUI"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("SIGN_IN"), &stru_1E7679C68, CFSTR("Localizable"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v3, "initWithTitle:style:target:action:", v8, 0, self, sel__signInPressed_);

  }
  return v6;
}

- (id)_formatUsernameAsPhoneNumberIfNeeded:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  if ((objc_msgSend(v4, "containsString:", CFSTR("@")) & 1) != 0)
  {
    v5 = v4;
  }
  else
  {
    v6 = (void *)objc_opt_new();
    objc_msgSend(v6, "displayFormatFor:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "normalizedFormatFor:", v7);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "isEqualToString:", v4) & 1) == 0)
    {
      -[AKBasicLoginViewController usernameCellTextField](self, "usernameCellTextField");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setText:", v7);

    }
  }

  return v5;
}

- (void)context:(id)a3 needsPasswordWithCompletion:(id)a4
{
  id v5;
  BOOL v6;
  uint64_t v7;
  void (**v8)(_QWORD, _QWORD);
  void *v9;
  _QWORD v10[5];
  _QWORD v11[5];

  v5 = a4;
  v6 = -[AKBasicLoginViewController isPasswordFieldVisible](self, "isPasswordFieldVisible");
  -[AKBasicLoginViewController setPasswordHandler:](self, "setPasswordHandler:", v5);

  if (!v6)
  {
    v7 = MEMORY[0x1E0C809B0];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __66__AKBasicLoginViewController_context_needsPasswordWithCompletion___block_invoke;
    v11[3] = &unk_1E7678C38;
    v11[4] = self;
    v8 = (void (**)(_QWORD, _QWORD))MEMORY[0x1C3B760D8](v11);
    if (-[AKBasicLoginViewController _shouldShowUserName](self, "_shouldShowUserName"))
    {
      -[AKBasicLoginViewController setIsPasswordFieldVisible:](self, "setIsPasswordFieldVisible:", 1);
      -[AKBasicLoginViewController tableView](self, "tableView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10[0] = v7;
      v10[1] = 3221225472;
      v10[2] = __66__AKBasicLoginViewController_context_needsPasswordWithCompletion___block_invoke_2;
      v10[3] = &unk_1E76789A0;
      v10[4] = self;
      objc_msgSend(v9, "performBatchUpdates:completion:", v10, v8);

    }
    else
    {
      v8[2](v8, 1);
    }

  }
}

uint64_t __66__AKBasicLoginViewController_context_needsPasswordWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "passwordCell");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cellTextField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "becomeFirstResponder");

  return objc_msgSend(*(id *)(a1 + 32), "stopAnimating");
}

void __66__AKBasicLoginViewController_context_needsPasswordWithCompletion___block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 1, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "insertRowsAtIndexPaths:withRowAnimation:", v3, 100);

}

- (void)_setPasswordHiddenIfNeeded
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[5];
  _QWORD v13[5];
  id v14;

  if (-[AKBasicLoginViewController isPasswordFieldVisible](self, "isPasswordFieldVisible"))
  {
    -[AKBasicLoginViewController setIsPasswordFieldVisible:](self, "setIsPasswordFieldVisible:", 0);
    -[AKBasicLoginViewController passwordCellTextField](self, "passwordCellTextField");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setText:", 0);

    -[AKBasicLoginViewController setPasswordHandler:](self, "setPasswordHandler:", 0);
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 1, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "section");
    -[AKBasicLoginViewController tableView](self, "tableView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 >= objc_msgSend(v6, "numberOfSections"))
    {

    }
    else
    {
      v7 = objc_msgSend(v4, "row");
      -[AKBasicLoginViewController tableView](self, "tableView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "numberOfRowsInSection:", objc_msgSend(v4, "section"));

      if (v7 < v9)
      {
        -[AKBasicLoginViewController tableView](self, "tableView");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = MEMORY[0x1E0C809B0];
        v13[0] = MEMORY[0x1E0C809B0];
        v13[1] = 3221225472;
        v13[2] = __56__AKBasicLoginViewController__setPasswordHiddenIfNeeded__block_invoke;
        v13[3] = &unk_1E7678D18;
        v13[4] = self;
        v14 = v4;
        v12[0] = v11;
        v12[1] = 3221225472;
        v12[2] = __56__AKBasicLoginViewController__setPasswordHiddenIfNeeded__block_invoke_2;
        v12[3] = &unk_1E7678C38;
        v12[4] = self;
        objc_msgSend(v10, "performBatchUpdates:completion:", v13, v12);

      }
    }

  }
}

void __56__AKBasicLoginViewController__setPasswordHiddenIfNeeded__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deleteRowsAtIndexPaths:withRowAnimation:", v3, 100);

}

void __56__AKBasicLoginViewController__setPasswordHiddenIfNeeded__block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "usernameCell");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cellTextField");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "becomeFirstResponder");

}

- (void)initializePasswordCellTextField:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x1E0CB34D0];
  v7 = a3;
  objc_msgSend(v4, "bundleWithIdentifier:", CFSTR("com.apple.AuthKitUI"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("PASSWORD_PLACEHOLDER"), &stru_1E7679C68, CFSTR("Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPlaceholder:", v6);

  objc_msgSend(v7, "setTextContentType:", *MEMORY[0x1E0CEBCB8]);
  objc_msgSend(v7, "setSecureTextEntry:", 1);
  objc_msgSend(v7, "setReturnKeyType:", 9);
  objc_msgSend(v7, "setDelegate:", self);

}

- (void)initializeUsernameCellTextField:(id)a3
{
  void *v4;
  void *v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AuthKitUI"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("EMAIL_OR_PHONE_PLACEHOLDER"), &stru_1E7679C68, CFSTR("Localizable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setPlaceholder:", v5);

  objc_msgSend(v12, "setTextContentType:", *MEMORY[0x1E0CEBCB8]);
  objc_msgSend(v12, "setAutocapitalizationType:", 0);
  objc_msgSend(v12, "setKeyboardType:", 7);
  objc_msgSend(v12, "setReturnKeyType:", 11);
  WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  objc_msgSend(WeakRetained, "username");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[AKBasicLoginViewController context](self, "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "username");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setText:", v9);

    -[OBBaseWelcomeController navigationItem](self, "navigationItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "rightBarButtonItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setEnabled:", 1);

  }
  objc_msgSend(v12, "setDelegate:", self);

}

- (void)_initializeView
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
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
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
  void *v33;
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
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  _QWORD v64[13];

  v64[11] = *MEMORY[0x1E0C80C00];
  -[AKBasicLoginViewController headerView](self, "headerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKBasicLoginViewController _title](self, "_title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", v4);

  -[AKBasicLoginViewController headerView](self, "headerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKBasicLoginViewController context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_interpolatedReasonWithBlame");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDetailText:", v7);

  -[AKBasicLoginViewController _tableView](self, "_tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKBasicLoginViewController contentView](self, "contentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSubview:", v8);

  -[AKBasicLoginViewController _loginOptions](self, "_loginOptions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKBasicLoginViewController contentView](self, "contentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSubview:", v10);

  v43 = (void *)MEMORY[0x1E0CB3718];
  -[AKBasicLoginViewController headerView](self, "headerView");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "leadingAnchor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKBasicLoginViewController view](self, "view");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "leadingAnchor");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "constraintEqualToAnchor:constant:", v60, 20.0);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v64[0] = v59;
  -[AKBasicLoginViewController headerView](self, "headerView");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "trailingAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKBasicLoginViewController view](self, "view");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "trailingAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "constraintEqualToAnchor:constant:", v55, -20.0);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v64[1] = v54;
  -[AKBasicLoginViewController contentView](self, "contentView");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "leadingAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKBasicLoginViewController view](self, "view");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "leadingAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "constraintEqualToAnchor:", v50);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v64[2] = v49;
  -[AKBasicLoginViewController contentView](self, "contentView");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "trailingAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKBasicLoginViewController view](self, "view");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "trailingAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "constraintEqualToAnchor:", v45);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v64[3] = v44;
  -[AKBasicLoginViewController contentView](self, "contentView");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "topAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "topAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "constraintEqualToAnchor:", v38);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v64[4] = v37;
  -[AKBasicLoginViewController contentView](self, "contentView");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "leadingAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "leadingAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "constraintEqualToAnchor:", v34);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v64[5] = v33;
  -[AKBasicLoginViewController contentView](self, "contentView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "trailingAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v8;
  objc_msgSend(v8, "trailingAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "constraintEqualToAnchor:", v30);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v64[6] = v29;
  -[AKBasicLoginViewController contentView](self, "contentView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "leadingAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "leadingAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToAnchor:", v26);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v64[7] = v25;
  -[AKBasicLoginViewController contentView](self, "contentView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "trailingAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v10;
  objc_msgSend(v10, "trailingAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:", v22);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v64[8] = v12;
  -[AKBasicLoginViewController contentView](self, "contentView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bottomAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bottomAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v64[9] = v16;
  objc_msgSend(v10, "topAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bottomAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v64[10] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v64, 11);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "activateConstraints:", v20);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addObserver:selector:name:object:", self, sel__keyboardDidShow_, *MEMORY[0x1E0CEB828], 0);
  objc_msgSend(v21, "addObserver:selector:name:object:", self, sel__keyboardDidHide_, *MEMORY[0x1E0CEB820], 0);

}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (!-[AKBasicLoginViewController _shouldShowUserName](self, "_shouldShowUserName", a3, a4))
    return 1;
  if (-[AKBasicLoginViewController _shouldShowPassword](self, "_shouldShowPassword"))
    return 2;
  return 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;

  v5 = a4;
  if (!objc_msgSend(v5, "row"))
  {
    if (-[AKBasicLoginViewController _shouldShowUserName](self, "_shouldShowUserName"))
    {
      -[AKBasicLoginViewController _usernameCell](self, "_usernameCell");
      v7 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v6 = (void *)v7;
      goto LABEL_8;
    }
LABEL_6:
    -[AKBasicLoginViewController _passwordCell](self, "_passwordCell");
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (objc_msgSend(v5, "row") == 1)
    goto LABEL_6;
  v6 = 0;
LABEL_8:

  return v6;
}

- (id)passwordCellTextField
{
  void *v2;
  void *v3;

  -[AKBasicLoginViewController passwordCell](self, "passwordCell");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cellTextField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)usernameCellTextField
{
  void *v2;
  void *v3;

  -[AKBasicLoginViewController usernameCell](self, "usernameCell");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cellTextField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  -[AKBasicLoginViewController _signInPressed:](self, "_signInPressed:", a3);
  return 1;
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint8_t v14[16];

  v6 = a3;
  -[AKBasicLoginViewController usernameCell](self, "usernameCell");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cellTextField");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "isEqual:", v8);

  if (v9)
  {
    -[AKBasicLoginViewController context](self, "context");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "username");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      _AKLogSystem();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl(&dword_1BD795000, v12, OS_LOG_TYPE_DEFAULT, "Username is changing", v14, 2u);
      }

      objc_msgSend(v10, "setUsername:", 0);
    }
    -[AKBasicLoginViewController _setPasswordHiddenIfNeeded](self, "_setPasswordHiddenIfNeeded");

  }
  return 1;
}

- (id)_usernameCell
{
  AKBasicLoginTableViewCell *usernameCell;
  AKBasicLoginTableViewCell *v4;
  AKBasicLoginTableViewCell *v5;
  void *v6;

  usernameCell = self->_usernameCell;
  if (!usernameCell)
  {
    v4 = -[AKBasicLoginTableViewCell initWithStyle:reuseIdentifier:]([AKBasicLoginTableViewCell alloc], "initWithStyle:reuseIdentifier:", 0, 0);
    v5 = self->_usernameCell;
    self->_usernameCell = v4;

    -[AKBasicLoginTableViewCell cellTextField](self->_usernameCell, "cellTextField");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKBasicLoginViewController initializeUsernameCellTextField:](self, "initializeUsernameCellTextField:", v6);

    usernameCell = self->_usernameCell;
  }
  return usernameCell;
}

- (id)_passwordCell
{
  AKBasicLoginTableViewCell *passwordCell;
  AKBasicLoginTableViewCell *v4;
  AKBasicLoginTableViewCell *v5;
  void *v6;

  passwordCell = self->_passwordCell;
  if (!passwordCell)
  {
    v4 = -[AKBasicLoginTableViewCell initWithStyle:reuseIdentifier:]([AKBasicLoginTableViewCell alloc], "initWithStyle:reuseIdentifier:", 0, 0);
    v5 = self->_passwordCell;
    self->_passwordCell = v4;

    -[AKBasicLoginTableViewCell cellTextField](self->_passwordCell, "cellTextField");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKBasicLoginViewController initializePasswordCellTextField:](self, "initializePasswordCellTextField:", v6);

    passwordCell = self->_passwordCell;
  }
  return passwordCell;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  void *v4;
  NSString *v5;
  _BOOL4 IsAccessibilityCategory;
  double result;

  -[AKBasicLoginViewController traitCollection](self, "traitCollection", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSizeCategory");
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v5);

  result = *MEMORY[0x1E0CEBC10];
  if (!IsAccessibilityCategory)
    return 44.0;
  return result;
}

- (id)_tableView
{
  UITableView *tableView;
  id v4;
  int64_t v5;
  double v6;
  double v7;
  double v8;
  UITableView *v9;
  UITableView *v10;
  void *v11;
  UITableView *v12;
  void *v13;
  UITableView *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;

  tableView = self->_tableView;
  if (!tableView)
  {
    v4 = objc_alloc(MEMORY[0x1E0CEAA58]);
    v5 = +[AKBasicLoginAppearance tableViewStyle](AKBasicLoginAppearance, "tableViewStyle");
    v6 = *MEMORY[0x1E0C9D648];
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v9 = (UITableView *)objc_msgSend(v4, "initWithFrame:style:", v5, *MEMORY[0x1E0C9D648], v7, v8, *(double *)(MEMORY[0x1E0C9D648] + 24));
    v10 = self->_tableView;
    self->_tableView = v9;

    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableView setBackgroundColor:](self->_tableView, "setBackgroundColor:", v11);

    -[UITableView setTranslatesAutoresizingMaskIntoConstraints:](self->_tableView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UITableView setDelegate:](self->_tableView, "setDelegate:", self);
    -[UITableView setDataSource:](self->_tableView, "setDataSource:", self);
    -[UITableView setRowHeight:](self->_tableView, "setRowHeight:", *MEMORY[0x1E0CEBC10]);
    -[UITableView setEstimatedRowHeight:](self->_tableView, "setEstimatedRowHeight:", 0.0);
    -[UITableView setScrollEnabled:](self->_tableView, "setScrollEnabled:", 0);
    -[UITableView setAllowsSelection:](self->_tableView, "setAllowsSelection:", 0);
    -[UITableView setSeparatorStyle:](self->_tableView, "setSeparatorStyle:", 1);
    v12 = self->_tableView;
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", v6, v7, v8, 10.0);
    -[UITableView setTableHeaderView:](v12, "setTableHeaderView:", v13);

    v14 = self->_tableView;
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", v6, v7, v8, 2.0);
    -[UITableView setTableFooterView:](v14, "setTableFooterView:", v15);

    -[UITableView reloadData](self->_tableView, "reloadData");
    -[UITableView heightAnchor](self->_tableView, "heightAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKBasicLoginViewController tableView](self, "tableView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "contentSize");
    objc_msgSend(v16, "constraintEqualToConstant:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKBasicLoginViewController setHeightAnchor:](self, "setHeightAnchor:", v19);

    -[AKBasicLoginViewController heightAnchor](self, "heightAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setActive:", 1);

    tableView = self->_tableView;
  }
  return tableView;
}

- (void)_keyboardDidShow:(id)a3
{
  void *v4;
  double v5;
  double v6;
  id v7;

  objc_msgSend(a3, "userInfo");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0CEB890]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "CGRectValue");
  v6 = v5;

  -[AKBasicLoginViewController _setContentInset:](self, "_setContentInset:", v6);
}

- (void)_keyboardDidHide:(id)a3
{
  -[AKBasicLoginViewController _setContentInset:](self, "_setContentInset:", a3, 0.0);
}

- (void)_setContentInset:(double)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  id v13;

  -[AKBasicLoginViewController contentScrollView](self, "contentScrollView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentInset");
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[AKBasicLoginViewController contentScrollView](self, "contentScrollView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setContentInset:", v7, v9, a3, v11);

  -[AKBasicLoginViewController contentScrollView](self, "contentScrollView");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setScrollIndicatorInsets:", v7, v9, a3, v11);

}

- (AKBasicLoginActions)loginActions
{
  return self->_loginActions;
}

- (void)setLoginActions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1184);
}

- (AKBasicLoginControllerDelegate)delegate
{
  return (AKBasicLoginControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (AKAppleIDAuthenticationInAppContext)context
{
  return (AKAppleIDAuthenticationInAppContext *)objc_loadWeakRetained((id *)&self->_context);
}

- (void)setContext:(id)a3
{
  objc_storeWeak((id *)&self->_context, a3);
}

- (UIView)loginOptions
{
  return self->_loginOptions;
}

- (void)setLoginOptions:(id)a3
{
  objc_storeStrong((id *)&self->_loginOptions, a3);
}

- (AKBasicLoginOptionsViewController)loginOptionsViewController
{
  return self->_loginOptionsViewController;
}

- (void)setLoginOptionsViewController:(id)a3
{
  objc_storeStrong((id *)&self->_loginOptionsViewController, a3);
}

- (id)passwordHandler
{
  return self->_passwordHandler;
}

- (void)setPasswordHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1224);
}

- (BOOL)isPasswordFieldVisible
{
  return self->_isPasswordFieldVisible;
}

- (void)setIsPasswordFieldVisible:(BOOL)a3
{
  self->_isPasswordFieldVisible = a3;
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
  objc_storeStrong((id *)&self->_tableView, a3);
}

- (NSLayoutConstraint)heightAnchor
{
  return self->_heightAnchor;
}

- (void)setHeightAnchor:(id)a3
{
  objc_storeStrong((id *)&self->_heightAnchor, a3);
}

- (AKBasicLoginTableViewCell)usernameCell
{
  return self->_usernameCell;
}

- (void)setUsernameCell:(id)a3
{
  objc_storeStrong((id *)&self->_usernameCell, a3);
}

- (AKBasicLoginTableViewCell)passwordCell
{
  return self->_passwordCell;
}

- (void)setPasswordCell:(id)a3
{
  objc_storeStrong((id *)&self->_passwordCell, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passwordCell, 0);
  objc_storeStrong((id *)&self->_usernameCell, 0);
  objc_storeStrong((id *)&self->_heightAnchor, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong(&self->_passwordHandler, 0);
  objc_storeStrong((id *)&self->_loginOptionsViewController, 0);
  objc_storeStrong((id *)&self->_loginOptions, 0);
  objc_destroyWeak((id *)&self->_context);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_loginActions, 0);
}

@end
