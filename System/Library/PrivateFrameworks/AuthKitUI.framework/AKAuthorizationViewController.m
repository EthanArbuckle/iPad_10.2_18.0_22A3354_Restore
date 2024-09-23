@implementation AKAuthorizationViewController

- (AKAuthorizationViewController)init
{
  -[AKAuthorizationViewController doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (AKAuthorizationViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  -[AKAuthorizationViewController doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);

  return 0;
}

- (AKAuthorizationViewController)initWithAuthorizationContext:(id)a3
{
  id v5;
  AKAuthorizationViewController *v6;
  AKAuthorizationViewController *v7;
  void *v8;
  void *v9;
  void *v10;
  AKAuthorizationScopeChoices *v11;
  void *v12;
  uint64_t v13;
  AKAuthorizationScopeChoices *scopeChoices;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)AKAuthorizationViewController;
  v6 = -[AKAuthorizationViewController initWithNibName:bundle:](&v16, sel_initWithNibName_bundle_, 0, 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_presentationContext, a3);
    objc_msgSend(v5, "credentialRequestContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "authorizationRequest");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "requestedScopes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = [AKAuthorizationScopeChoices alloc];
    objc_msgSend(v5, "userInformation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[AKAuthorizationScopeChoices initWithScopes:userInformation:](v11, "initWithScopes:userInformation:", v10, v12);
    scopeChoices = v7->_scopeChoices;
    v7->_scopeChoices = (AKAuthorizationScopeChoices *)v13;

  }
  return v7;
}

- (AKAuthorizationViewController)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AKAuthorizationViewController;
  return -[AKAuthorizationViewController initWithCoder:](&v4, sel_initWithCoder_, a3);
}

- (void)viewDidLoad
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)AKAuthorizationViewController;
  -[AKAuthorizationViewController viewDidLoad](&v2, sel_viewDidLoad);
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AKAuthorizationViewController;
  -[AKAuthorizationViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  if (!self->_navigationController)
    -[AKAuthorizationViewController _presentAuthorizationViewController](self, "_presentAuthorizationViewController");
}

- (void)presentConfirmPaneViewController
{
  if (-[AKAuthorizationViewController _isFirstTimeAppleIDAuthorization](self, "_isFirstTimeAppleIDAuthorization"))
    -[AKAuthorizationViewController _presentFirstTimeViewController](self, "_presentFirstTimeViewController");
  else
    -[AKAuthorizationViewController _presentInputPaneViewControllerReplacing:](self, "_presentInputPaneViewControllerReplacing:", 0);
}

- (void)_presentFirstTimeViewController
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[AKAuthorizationViewController firstTimeViewController](self, "firstTimeViewController");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationViewController navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewControllers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    objc_msgSend(v9, "navigationItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKAuthorizationViewController _backBarButtonItem](self, "_backBarButtonItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setLeftBarButtonItem:", v7);

  }
  -[AKAuthorizationViewController navigationController](self, "navigationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pushViewController:animated:", v9, 1);

}

- (void)_presentAuthorizationViewController
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1BD795000, v0, v1, "No UI was shown to the user because there is no credential request!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)presentAuthenticationChoiceUIWithCompletion:(id)a3
{
  id v3;
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
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;

  v3 = a3;
  v4 = (void *)MEMORY[0x1E0CEA2E8];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AuthKit"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("ACCOUNT_FORK_ALERT_TITLE"), &stru_1E7679C68, CFSTR("Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AuthKit"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("ACCOUNT_FORK_ALERT_MESSAGE"), &stru_1E7679C68, CFSTR("Localizable"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alertControllerWithTitle:message:preferredStyle:", v6, v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0CEA2E0];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AuthKit"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("ACCOUNT_FORK_ALERT_BUTTON_CREATE"), &stru_1E7679C68, CFSTR("Localizable"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __77__AKAuthorizationViewController_presentAuthenticationChoiceUIWithCompletion___block_invoke;
  v31[3] = &unk_1E7678D70;
  v14 = v3;
  v32 = v14;
  objc_msgSend(v10, "actionWithTitle:style:handler:", v12, 0, v31);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addAction:", v15);

  v16 = (void *)MEMORY[0x1E0CEA2E0];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AuthKit"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("ACCOUNT_FORK_ALERT_BUTTON_KEYCHAIN"), &stru_1E7679C68, CFSTR("Localizable"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v13;
  v29[1] = 3221225472;
  v29[2] = __77__AKAuthorizationViewController_presentAuthenticationChoiceUIWithCompletion___block_invoke_38;
  v29[3] = &unk_1E7678D70;
  v19 = v14;
  v30 = v19;
  objc_msgSend(v16, "actionWithTitle:style:handler:", v18, 0, v29);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addAction:", v20);

  v21 = (void *)MEMORY[0x1E0CEA2E0];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AuthKit"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("ALERT_DEFAULT_CANCEL"), &stru_1E7679C68, CFSTR("Localizable"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v13;
  v27[1] = 3221225472;
  v27[2] = __77__AKAuthorizationViewController_presentAuthenticationChoiceUIWithCompletion___block_invoke_41;
  v27[3] = &unk_1E7678D70;
  v28 = v19;
  v24 = v19;
  objc_msgSend(v21, "actionWithTitle:style:handler:", v23, 0, v27);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addAction:", v25);

  -[AKAuthorizationViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v9, 1, 0);
}

uint64_t __77__AKAuthorizationViewController_presentAuthenticationChoiceUIWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;

  _AKLogSiwa();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __77__AKAuthorizationViewController_presentAuthenticationChoiceUIWithCompletion___block_invoke_cold_1();

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __77__AKAuthorizationViewController_presentAuthenticationChoiceUIWithCompletion___block_invoke_38(uint64_t a1)
{
  NSObject *v2;

  _AKLogSiwa();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __77__AKAuthorizationViewController_presentAuthenticationChoiceUIWithCompletion___block_invoke_38_cold_1();

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __77__AKAuthorizationViewController_presentAuthenticationChoiceUIWithCompletion___block_invoke_41(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;

  _AKLogSiwa();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __77__AKAuthorizationViewController_presentAuthenticationChoiceUIWithCompletion___block_invoke_41_cold_1();

  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "ak_errorWithCode:", -7003);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v3 + 16))(v3, 0, v4);

}

- (void)_presentContainerViewControllerWith:(id)a3
{
  id v4;
  AKAuthorizationNavigationController *v5;
  AKAuthorizationNavigationController *navigationController;
  AKAuthorizationContainerViewController *v7;
  void *v8;
  void *v9;
  AKAuthorizationContainerViewController *v10;

  v4 = a3;
  v5 = -[AKAuthorizationNavigationController initWithRootViewController:]([AKAuthorizationNavigationController alloc], "initWithRootViewController:", v4);
  navigationController = self->_navigationController;
  self->_navigationController = v5;

  v7 = [AKAuthorizationContainerViewController alloc];
  -[AKAuthorizationViewController navigationController](self, "navigationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[AKAuthorizationContainerViewController initWithRootViewController:authorizationContext:](v7, "initWithRootViewController:authorizationContext:", v8, self->_presentationContext);

  -[AKAuthorizationContainerViewController setDelegate:](v10, "setDelegate:", self);
  -[AKAuthorizationContainerViewController setPaneDelegate:](v10, "setPaneDelegate:", self);
  objc_msgSend(v4, "sizeToFitPaneContent");

  -[AKAuthorizationViewController navigationController](self, "navigationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDelegate:", v10);

  -[AKAuthorizationViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v10, 1, 0);
}

- (id)_parentalApprovalRequestViewController
{
  AKParentalApprovalRequestViewController *v3;
  void *v4;
  AKParentalApprovalRequestViewController *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = [AKParentalApprovalRequestViewController alloc];
  -[AKAuthorizationViewController presentationContext](self, "presentationContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[AKParentalApprovalRequestViewController initWithPresentationContext:](v3, "initWithPresentationContext:", v4);

  -[AKParentalApprovalRequestViewController setAuthorizationViewController:](v5, "setAuthorizationViewController:", self);
  -[AKParentalApprovalRequestViewController navigationItem](v5, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationViewController _paneTitleString](self, "_paneTitleString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationViewController _logoBarButtonItem:](self, "_logoBarButtonItem:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLeftBarButtonItem:", v8);

  -[AKParentalApprovalRequestViewController navigationItem](v5, "navigationItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationViewController _cancelBarButtonItem](self, "_cancelBarButtonItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setRightBarButtonItem:", v10);

  return v5;
}

- (id)firstTimeViewController
{
  AKAuthorizationFirstTimePaneViewController *v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init(AKAuthorizationFirstTimePaneViewController);
  -[AKAuthorizationFirstTimePaneViewController setAuthorizationViewController:](v3, "setAuthorizationViewController:", self);
  -[AKAuthorizationFirstTimePaneViewController navigationItem](v3, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationViewController _cancelBarButtonItem](self, "_cancelBarButtonItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRightBarButtonItem:", v5);

  return v3;
}

- (id)_inputPaneViewController
{
  AKAuthorizationInputPaneViewController *v3;
  void *v4;
  void *v5;
  AKAuthorizationInputPaneViewController *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = [AKAuthorizationInputPaneViewController alloc];
  -[AKAuthorizationViewController presentationContext](self, "presentationContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationViewController scopeChoices](self, "scopeChoices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[AKAuthorizationInputPaneViewController initWithPresentationContext:scopeChoices:](v3, "initWithPresentationContext:scopeChoices:", v4, v5);

  -[AKAuthorizationInputPaneViewController setAuthorizationViewController:](v6, "setAuthorizationViewController:", self);
  -[AKAuthorizationInputPaneViewController navigationItem](v6, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationViewController _paneTitleString](self, "_paneTitleString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationViewController _logoBarButtonItem:](self, "_logoBarButtonItem:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLeftBarButtonItem:", v9);

  -[AKAuthorizationInputPaneViewController navigationItem](v6, "navigationItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationViewController _cancelBarButtonItem](self, "_cancelBarButtonItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setRightBarButtonItem:", v11);

  return v6;
}

- (int64_t)modalPresentationStyle
{
  return 5;
}

- (id)_logoBarButtonItem:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (objc_class *)MEMORY[0x1E0CEA700];
  v4 = a3;
  v5 = [v3 alloc];
  v6 = (void *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:weight:", 18.0, *MEMORY[0x1E0CEB5F8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFont:", v7);

  objc_msgSend(v6, "setText:", v4);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithCustomView:", v6);

  return v8;
}

- (id)_cancelBarButtonItem
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];

  objc_msgSend(MEMORY[0x1E0D001E8], "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isLisbonAvailable");

  if (v4)
  {
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __53__AKAuthorizationViewController__cancelBarButtonItem__block_invoke;
    v17[3] = &unk_1E7678D98;
    v17[4] = self;
    objc_msgSend(MEMORY[0x1E0CEA2A8], "actionWithHandler:", v17);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1E0CEA3A0];
    +[AKAuthorizationAppearance dismissButtonConfiguration](AKAuthorizationAppearance, "dismissButtonConfiguration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "buttonWithConfiguration:primaryAction:", v7, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("AUTHORIZATION_VIEWCONTROLLER_CANCEL"), &stru_1E7679C68, CFSTR("Localizable"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAccessibilityLabel:", v10);

    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithCustomView:", v8);
    return v11;
  }
  else
  {
    v13 = objc_alloc(MEMORY[0x1E0CEA380]);
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("AUTHORIZATION_VIEWCONTROLLER_CANCEL"), &stru_1E7679C68, CFSTR("Localizable"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v13, "initWithTitle:style:target:action:", v15, 0, self, sel__cancelButtonSelected_);

    return v16;
  }
}

uint64_t __53__AKAuthorizationViewController__cancelBarButtonItem__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cancelButtonSelected:", a2);
}

- (id)_backBarButtonItem
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CEA380]);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("AUTHORIZATION_VIEWCONTROLLER_BACK"), &stru_1E7679C68, CFSTR("Localizable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithTitle:style:target:action:", v5, 0, self, sel__backButtonSelected_);

  return v6;
}

- (id)_paneTitleString
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;

  -[AKAuthorizationViewController presentationContext](self, "presentationContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "credentialRequestContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_isFirstPartyLogin");

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v6 = CFSTR("AUTHORIZATION_VIEWCONTROLLER_TITLE_MODERN");
    goto LABEL_5;
  }
  if (objc_msgSend(CFSTR("AUTHORIZATION_VIEWCONTROLLER_TITLE"), "containsString:", CFSTR("REBRAND")))
  {
    v6 = CFSTR("AUTHORIZATION_VIEWCONTROLLER_TITLE");
LABEL_5:
    objc_msgSend(v5, "localizedStringForKey:value:table:", v6, &stru_1E7679C68, CFSTR("Localizable"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E0D001E8], "sharedManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isAABrandingEnabled"))
  {
    objc_msgSend(CFSTR("AUTHORIZATION_VIEWCONTROLLER_TITLE"), "stringByAppendingString:", CFSTR("_REBRAND"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", v9, &stru_1E7679C68, CFSTR("Localizable"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("AUTHORIZATION_VIEWCONTROLLER_TITLE"), &stru_1E7679C68, CFSTR("Localizable"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_10:
  return v7;
}

- (void)authorizationContainerViewControllerDidDismiss:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB35C8], "ak_errorWithCode:", -7003);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationViewController _delegate_authorizationViewControllerDidCompleteWithAuthorization:error:](self, "_delegate_authorizationViewControllerDidCompleteWithAuthorization:error:", 0, v4);

}

- (void)presentInputPaneViewController
{
  if (-[AKAuthorizationViewController _isFirstTimeAppleIDAuthorization](self, "_isFirstTimeAppleIDAuthorization"))
    -[AKAuthorizationViewController _presentFirstTimeViewController](self, "_presentFirstTimeViewController");
  else
    -[AKAuthorizationViewController _presentInputPaneViewControllerReplacing:](self, "_presentInputPaneViewControllerReplacing:", 0);
}

- (BOOL)_isFirstTimeAppleIDAuthorization
{
  void *v3;
  uint64_t v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;
  char v13;

  objc_msgSend(MEMORY[0x1E0D001C8], "sharedConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "shouldAlwaysShowWelcome");

  if (v4 != 1)
  {
    -[AKAuthorizationViewController presentationContext](self, "presentationContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "userInformation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "hasUsedAuthorization");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v8, "BOOLValue"))
    {
      -[AKAuthorizationViewController presentationContext](self, "presentationContext");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "credentialRequestContext");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v10, "_isFirstPartyLogin") & 1) == 0)
      {
        -[AKAuthorizationViewController presentationContext](self, "presentationContext");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "hasShownFirstTimeAlready");

        if ((v13 & 1) != 0)
          return 0;
        -[AKAuthorizationViewController presentationContext](self, "presentationContext");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = 1;
        objc_msgSend(v6, "setHasShownFirstTimeAlready:", 1);
        goto LABEL_7;
      }

    }
    v5 = 0;
LABEL_7:

    return v5;
  }
  return 1;
}

- (BOOL)_isManagedAppleID
{
  void *v2;
  void *v3;
  char v4;

  -[AKAuthorizationViewController presentationContext](self, "presentationContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userInformation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isManagedAppleID");

  return v4;
}

- (void)_presentInputPaneViewControllerReplacing:(BOOL)a3
{
  int v3;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v3 = a3;
  -[AKAuthorizationViewController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[AKAuthorizationViewController _inputPaneViewController](self, "_inputPaneViewController");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setPaneDelegate:", self);
    -[AKAuthorizationViewController navigationController](self, "navigationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "viewControllers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v8 != v3)
    {
      objc_msgSend(v17, "navigationItem");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[AKAuthorizationViewController _backBarButtonItem](self, "_backBarButtonItem");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setLeftBarButtonItem:", v10);

    }
    -[AKAuthorizationViewController navigationController](self, "navigationController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v3)
    {
      objc_msgSend(v11, "viewControllers");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v13, "mutableCopy");

      objc_msgSend(v14, "replaceObjectAtIndex:withObject:", objc_msgSend(v14, "count") - 1, v17);
      -[AKAuthorizationViewController navigationController](self, "navigationController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(v14, "copy");
      objc_msgSend(v15, "setViewControllers:animated:", v16, 1);

      v12 = v14;
    }
    else
    {
      objc_msgSend(v11, "pushViewController:animated:", v17, 1);
    }

  }
}

- (void)_cancelButtonSelected:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB35C8], "ak_errorWithCode:", -7003);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationViewController _delegate_authorizationViewControllerDidCompleteWithAuthorization:error:](self, "_delegate_authorizationViewControllerDidCompleteWithAuthorization:error:", 0, v4);

}

- (void)_backButtonSelected:(id)a3
{
  id v3;
  id v4;

  -[AKAuthorizationViewController navigationController](self, "navigationController", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v4, "popViewControllerAnimated:", 1);

}

- (void)_delegate_authorizationViewControllerDidCompleteWithAuthorization:(id)a3 error:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[AKAuthorizationViewController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "authorizationViewController:didCompleteWithAuthorization:error:", self, v8, v6);

}

- (void)authorizationPaneViewController:(id)a3 dismissWithAuthorization:(id)a4 error:(id)a5
{
  -[AKAuthorizationViewController _delegate_authorizationViewControllerDidCompleteWithAuthorization:error:](self, "_delegate_authorizationViewControllerDidCompleteWithAuthorization:error:", a4, a5);
}

- (void)authorizationPaneViewController:(id)a3 didRequestAuthorizationWithUserProvidedInformation:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a5;
  v8 = a4;
  -[AKAuthorizationViewController delegate](self, "delegate");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "authorizationViewController:didRequestAuthorizationWithUserProvidedInformation:completion:", self, v8, v7);

}

- (void)authorizationPaneViewController:(id)a3 didRequestIconWithCompletion:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v5 = a4;
  -[AKAuthorizationViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[AKAuthorizationViewController presentationContext](self, "presentationContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "credentialRequestContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __94__AKAuthorizationViewController_authorizationPaneViewController_didRequestIconWithCompletion___block_invoke;
    v10[3] = &unk_1E7678DC0;
    v11 = v5;
    objc_msgSend(v6, "authorizationViewController:didRequestIconForRequestContext:completion:", self, v8, v10);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "ak_errorWithCode:", -7027);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v5 + 2))(v5, 0, v9);

  }
}

void __94__AKAuthorizationViewController_authorizationPaneViewController_didRequestIconWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;

  v5 = a2;
  v6 = a3;
  _AKLogSiwa();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __94__AKAuthorizationViewController_authorizationPaneViewController_didRequestIconWithCompletion___block_invoke_cold_2();

    v9 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v5, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v9 + 16))(v9, v10, 0);

  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __94__AKAuthorizationViewController_authorizationPaneViewController_didRequestIconWithCompletion___block_invoke_cold_1((uint64_t)v6, v8);

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (void)authorizationPaneViewController:(id)a3 pushEditScope:(id)a4 presentationContext:(id)a5 options:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  AKAuthorizationEmailEditPaneViewController *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;

  v9 = a3;
  v10 = a4;
  v11 = a6;
  -[AKAuthorizationViewController navigationController](self, "navigationController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "topViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = v13;
    if (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0CFFFD8]))
    {
      objc_msgSend(v11, "objectForKey:", CFSTR("shouldClear"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "BOOLValue");

      -[NSObject setEditingName:shouldClear:animated:](v14, "setEditingName:shouldClear:animated:", 1, v16, 1);
    }
    else if (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0CFFFD0]))
    {
      v17 = objc_alloc_init(AKAuthorizationEmailEditPaneViewController);
      -[AKAuthorizationViewController presentationContext](self, "presentationContext");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "localizedAppName");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[AKAuthorizationEmailEditPaneViewController setApplicationName:](v17, "setApplicationName:", v19);

      -[AKAuthorizationPaneViewController setEditableDataSources:](v17, "setEditableDataSources:", v9);
      -[AKAuthorizationPaneViewController sizeToFitPaneContent](v17, "sizeToFitPaneContent");
      -[AKAuthorizationViewController navigationController](self, "navigationController");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "pushViewController:animated:", v17, 1);

    }
    else
    {
      _AKLogSiwa();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        -[AKAuthorizationViewController authorizationPaneViewController:pushEditScope:presentationContext:options:].cold.1((uint64_t)v10, v21);

    }
  }
  else
  {
    _AKLogSiwa();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[AKAuthorizationViewController authorizationPaneViewController:pushEditScope:presentationContext:options:].cold.2();
  }

}

- (void)performAppleIDAuthorizationForPaneViewController:(id)a3
{
  void *v4;
  void *v5;
  char isKindOfClass;

  -[AKAuthorizationViewController navigationController](self, "navigationController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "topViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
    -[AKAuthorizationViewController _presentInputPaneViewControllerReplacing:](self, "_presentInputPaneViewControllerReplacing:", 1);
  else
    -[AKAuthorizationViewController presentInputPaneViewController](self, "presentInputPaneViewController");
}

- (void)_performPasswordAuthenticationForFederatedManagedAccountForPaneViewController:(id)a3
{
  id v4;
  AKAppleIDAuthenticationInAppContext *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;

  v4 = a3;
  v5 = objc_alloc_init(AKAppleIDAuthenticationInAppContext);
  -[AKAuthorizationViewController presentationContext](self, "presentationContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "userInformation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "accountName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAppleIDAuthenticationInAppContext setUsername:](v5, "setUsername:", v8);

  -[AKAppleIDAuthenticationInAppContext setIsUsernameEditable:](v5, "setIsUsernameEditable:", 0);
  -[AKAuthorizationViewController presentationContext](self, "presentationContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "credentialRequestContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "authorizationRequest");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "altDSID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAppleIDAuthenticationInAppContext setAltDSID:](v5, "setAltDSID:", v12);

  -[AKAppleIDAuthenticationInAppContext setAuthenticationMode:](v5, "setAuthenticationMode:", 2);
  -[AKAppleIDAuthenticationInAppContext setAuthenticationType:](v5, "setAuthenticationType:", 3);
  -[AKAppleIDAuthenticationInAppContext setPresentingViewController:](v5, "setPresentingViewController:", v4);
  v13 = objc_alloc_init(MEMORY[0x1E0D00130]);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __111__AKAuthorizationViewController__performPasswordAuthenticationForFederatedManagedAccountForPaneViewController___block_invoke;
  v15[3] = &unk_1E7678DE8;
  v16 = v4;
  v14 = v4;
  objc_msgSend(v13, "authenticateWithContext:completion:", v5, v15);

}

void __111__AKAuthorizationViewController__performPasswordAuthenticationForFederatedManagedAccountForPaneViewController___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __111__AKAuthorizationViewController__performPasswordAuthenticationForFederatedManagedAccountForPaneViewController___block_invoke_2;
  block[3] = &unk_1E7678CC8;
  v10 = *(id *)(a1 + 32);
  v11 = v5;
  v12 = v6;
  v7 = v6;
  v8 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __111__AKAuthorizationViewController__performPasswordAuthenticationForFederatedManagedAccountForPaneViewController___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "passwordAuthenticationCompletedWithResults:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)performPasswordAuthenticationForPaneViewController:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  AKAuthorizationPasswordAuthenticationViewController *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  if (-[AKAuthorizationViewController _isManagedAppleID](self, "_isManagedAppleID")
    && (-[AKAuthorizationViewController presentationContext](self, "presentationContext"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "userInformation"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "authMode"),
        v5,
        v4,
        v6 == 2))
  {
    -[AKAuthorizationViewController _performPasswordAuthenticationForFederatedManagedAccountForPaneViewController:](self, "_performPasswordAuthenticationForFederatedManagedAccountForPaneViewController:", v10);
  }
  else
  {
    v7 = objc_alloc_init(AKAuthorizationPasswordAuthenticationViewController);
    -[AKAuthorizationViewController presentationContext](self, "presentationContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKAuthorizationPasswordAuthenticationViewController setPresentationContext:](v7, "setPresentationContext:", v8);

    -[AKAuthorizationPasswordAuthenticationViewController setDelegate:](v7, "setDelegate:", v10);
    -[AKAuthorizationPaneViewController sizeToFitPaneContent](v7, "sizeToFitPaneContent");
    -[AKAuthorizationViewController navigationController](self, "navigationController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pushViewController:animated:", v7, 1);

  }
}

- (AKAuthorizationPresentationContext)presentationContext
{
  return self->_presentationContext;
}

- (void)setPresentationContext:(id)a3
{
  objc_storeStrong((id *)&self->_presentationContext, a3);
}

- (AKAuthorizationViewControllerDelegate)delegate
{
  return (AKAuthorizationViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (AKAuthorizationNavigationController)navigationController
{
  return self->_navigationController;
}

- (AKAuthorizationScopeChoices)scopeChoices
{
  return self->_scopeChoices;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scopeChoices, 0);
  objc_storeStrong((id *)&self->_navigationController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_presentationContext, 0);
}

void __77__AKAuthorizationViewController_presentAuthenticationChoiceUIWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1BD795000, v0, v1, "User picked create", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __77__AKAuthorizationViewController_presentAuthenticationChoiceUIWithCompletion___block_invoke_38_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1BD795000, v0, v1, "User picked keychain", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __77__AKAuthorizationViewController_presentAuthenticationChoiceUIWithCompletion___block_invoke_41_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1BD795000, v0, v1, "User picked cancel", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __94__AKAuthorizationViewController_authorizationPaneViewController_didRequestIconWithCompletion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1BD795000, a2, OS_LOG_TYPE_ERROR, "Failed to fetch icon - %@", (uint8_t *)&v2, 0xCu);
}

void __94__AKAuthorizationViewController_authorizationPaneViewController_didRequestIconWithCompletion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1BD795000, v0, v1, "Successfully fetched icon.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)authorizationPaneViewController:(uint64_t)a1 pushEditScope:(NSObject *)a2 presentationContext:options:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1BD795000, a2, OS_LOG_TYPE_DEBUG, "Unsupported scope %@.", (uint8_t *)&v2, 0xCu);
}

- (void)authorizationPaneViewController:pushEditScope:presentationContext:options:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1BD795000, v0, v1, "Expected AKAuthorizationInputPaneViewController as top controller.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
