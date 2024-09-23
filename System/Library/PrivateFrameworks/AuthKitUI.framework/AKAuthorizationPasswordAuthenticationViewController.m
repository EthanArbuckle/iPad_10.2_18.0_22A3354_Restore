@implementation AKAuthorizationPasswordAuthenticationViewController

- (void)viewDidLoad
{
  void *v2;
  void *v4;
  __CFString *v5;
  char v6;
  int v7;
  void *v8;
  AKModalSignInViewController *v9;
  void *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  char v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  AKModalSignInViewController *modalSignInViewController;
  AKModalSignInViewController *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSLayoutConstraint *v30;
  NSLayoutConstraint *modalSignInViewBottomConstraint;
  void *v32;
  NSLayoutConstraint *v33;
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
  AKModalSignInViewController *v56;
  objc_super v57;
  _QWORD v58[5];

  v58[4] = *MEMORY[0x1E0C80C00];
  v57.receiver = self;
  v57.super_class = (Class)AKAuthorizationPasswordAuthenticationViewController;
  -[AKAuthorizationPaneViewController viewDidLoad](&v57, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = CFSTR("APPLE_ID");
  v6 = objc_msgSend(CFSTR("APPLE_ID"), "containsString:", CFSTR("REBRAND"));
  if ((v6 & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D001E8], "sharedManager");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v2, "isAABrandingEnabled"))
    {
      objc_msgSend(CFSTR("APPLE_ID"), "stringByAppendingString:", CFSTR("_REBRAND"));
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v7 = 1;
    }
    else
    {
      v7 = 0;
    }
  }
  objc_msgSend(v4, "localizedStringForKey:value:table:", v5, &stru_1E7679C68, CFSTR("Localizable"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationPasswordAuthenticationViewController setTitle:](self, "setTitle:", v8);

  if (v7)
  if ((v6 & 1) == 0)

  v9 = objc_alloc_init(AKModalSignInViewController);
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKModalSignInViewController setBackgroundColor:](v9, "setBackgroundColor:", v10);

  -[AKModalSignInViewController setHideTitle:](v9, "setHideTitle:", 1);
  v11 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = CFSTR("AUTHORIZE_FOR_ACCOUNT_WITH_PASSWORD");
  v14 = objc_msgSend(CFSTR("AUTHORIZE_FOR_ACCOUNT_WITH_PASSWORD"), "containsString:", CFSTR("REBRAND"));
  if ((v14 & 1) != 0)
  {
    v15 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D001E8], "sharedManager");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v55, "isAABrandingEnabled"))
    {
      objc_msgSend(CFSTR("AUTHORIZE_FOR_ACCOUNT_WITH_PASSWORD"), "stringByAppendingString:", CFSTR("_REBRAND"));
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v15 = 1;
    }
    else
    {
      v15 = 0;
    }
  }
  objc_msgSend(v12, "localizedStringForKey:value:table:", v13, &stru_1E7679C68, CFSTR("Localizable"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationPasswordAuthenticationViewController _username](self, "_username");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKModalSignInViewController setCustomBodyText:](v9, "setCustomBodyText:", v18);

  if (v15)
  if ((v14 & 1) == 0)

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("SIGN_IN"), &stru_1E7679C68, CFSTR("Localizable"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKModalSignInViewController setCustomButtonTitle:](v9, "setCustomButtonTitle:", v20);

  -[AKAuthorizationPasswordAuthenticationViewController _contextForAuthentication](self, "_contextForAuthentication");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKBaseSignInViewController setContext:](v9, "setContext:", v21);

  -[AKBaseSignInViewController setDelegate:](v9, "setDelegate:", self);
  -[AKAuthorizationPasswordAuthenticationViewController addChildViewController:](self, "addChildViewController:", v9);
  -[AKAuthorizationPasswordAuthenticationViewController view](self, "view");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKModalSignInViewController view](v9, "view");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addSubview:", v23);

  -[AKModalSignInViewController didMoveToParentViewController:](v9, "didMoveToParentViewController:", self);
  modalSignInViewController = self->_modalSignInViewController;
  self->_modalSignInViewController = v9;
  v25 = v9;

  -[AKModalSignInViewController view](v25, "view");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "bottomAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationPasswordAuthenticationViewController view](self, "view");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "bottomAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToAnchor:", v29);
  v30 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  modalSignInViewBottomConstraint = self->_modalSignInViewBottomConstraint;
  self->_modalSignInViewBottomConstraint = v30;

  -[AKModalSignInViewController view](v25, "view");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v48 = (void *)MEMORY[0x1E0CB3718];
  -[AKModalSignInViewController view](v25, "view");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "topAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationPasswordAuthenticationViewController view](self, "view");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "topAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "constraintEqualToAnchor:constant:", v51, 24.0);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = self->_modalSignInViewBottomConstraint;
  v58[0] = v50;
  v58[1] = v33;
  v56 = v25;
  -[AKModalSignInViewController view](v25, "view");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "leadingAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationPasswordAuthenticationViewController view](self, "view");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "leadingAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "constraintEqualToAnchor:", v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v58[2] = v36;
  -[AKModalSignInViewController view](v25, "view");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "trailingAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationPasswordAuthenticationViewController view](self, "view");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "trailingAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraintEqualToAnchor:", v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v58[3] = v41;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v58, 4);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "activateConstraints:", v42);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "addObserver:selector:name:object:", self, sel_keyboardDidShow_, *MEMORY[0x1E0CEB828], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "addObserver:selector:name:object:", self, sel_keyboardWillShow_, *MEMORY[0x1E0CEB978], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "addObserver:selector:name:object:", self, sel_keyboardWillHide_, *MEMORY[0x1E0CEB970], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "addObserver:selector:name:object:", self, sel_keyboardWillChangeFrame_, *MEMORY[0x1E0CEB960], 0);

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  id v5;

  if (-[AKAuthorizationPasswordAuthenticationViewController isMovingFromParentViewController](self, "isMovingFromParentViewController", a3))
  {
    -[AKAuthorizationPasswordAuthenticationViewController delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "conformsToProtocol:", &unk_1EF52D470))
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "ak_errorWithCode:", -7003);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "passwordAuthenticationCompletedWithResults:error:", 0, v4);

    }
  }
}

- (id)_contextForAuthentication
{
  AKAppleIDAuthenticationInAppContext *v3;
  void *v4;

  v3 = objc_alloc_init(AKAppleIDAuthenticationInAppContext);
  -[AKAuthorizationPasswordAuthenticationViewController _username](self, "_username");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAppleIDAuthenticationInAppContext setUsername:](v3, "setUsername:", v4);

  -[AKAppleIDAuthenticationInAppContext setIsUsernameEditable:](v3, "setIsUsernameEditable:", 0);
  -[AKAppleIDAuthenticationInAppContext setIgnorePasswordCache:](v3, "setIgnorePasswordCache:", 1);
  -[AKAppleIDAuthenticationInAppContext setPresentingViewController:](v3, "setPresentingViewController:", self);
  return v3;
}

- (id)_username
{
  void *v2;
  void *v3;
  void *v4;

  -[AKAuthorizationPasswordAuthenticationViewController presentationContext](self, "presentationContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userInformation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accountName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0CEB828], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x1E0CEB978], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:name:object:", self, *MEMORY[0x1E0CEB970], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:name:object:", self, *MEMORY[0x1E0CEB960], 0);

  v7.receiver = self;
  v7.super_class = (Class)AKAuthorizationPasswordAuthenticationViewController;
  -[AKAuthorizationPasswordAuthenticationViewController dealloc](&v7, sel_dealloc);
}

- (double)intrinsicContentHeight
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double Width;
  double v8;
  double v9;
  double v10;
  double v11;
  CGRect v13;

  -[AKModalSignInViewController view](self->_modalSignInViewController, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "subviews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[AKAuthorizationPasswordAuthenticationViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  Width = CGRectGetWidth(v13);

  LODWORD(v8) = 1148846080;
  LODWORD(v9) = 1112014848;
  objc_msgSend(v5, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", Width, 0.0, v8, v9);
  v11 = v10 + 0.0 + self->_keyboardHeight + 24.0;

  return v11;
}

- (void)sizeToFitPaneContentAnimated:(BOOL)a3
{
  double v3;
  _QWORD v4[5];

  v3 = 0.3;
  if (!a3)
    v3 = 0.0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __84__AKAuthorizationPasswordAuthenticationViewController_sizeToFitPaneContentAnimated___block_invoke;
  v4[3] = &unk_1E76789A0;
  v4[4] = self;
  objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:delay:options:animations:completion:", 4, v4, 0, v3, 0.0);
}

uint64_t __84__AKAuthorizationPasswordAuthenticationViewController_sizeToFitPaneContentAnimated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "sizeToFitPaneContent");
}

- (void)layoutViewWithAnimation
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __78__AKAuthorizationPasswordAuthenticationViewController_layoutViewWithAnimation__block_invoke;
  v2[3] = &unk_1E76789A0;
  v2[4] = self;
  objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:delay:options:animations:completion:", 4, v2, 0, 0.3, 0.0);
}

void __78__AKAuthorizationPasswordAuthenticationViewController_layoutViewWithAnimation__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "layoutIfNeeded");

}

- (void)keyboardWillShow:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  _BOOL4 v9;
  void *v10;
  uint64_t v11;
  id v14;

  v14 = a3;
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;

  v9 = -[AKAuthorizationPasswordAuthenticationViewController isKeyboardAttachedToBottom:](self, "isKeyboardAttachedToBottom:", v14);
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "userInterfaceIdiom");

  if (v11 == 1 && v6 > v8 && v9)
  {
    -[AKAuthorizationPasswordAuthenticationViewController adjustBottomInsetForKeyboard:](self, "adjustBottomInsetForKeyboard:", v14);
    -[AKAuthorizationPasswordAuthenticationViewController layoutViewWithAnimation](self, "layoutViewWithAnimation");
  }

}

- (void)keyboardDidShow:(id)a3
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  id v9;

  objc_msgSend(a3, "userInfo");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", *MEMORY[0x1E0CEB890]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "CGRectValue");
  v6 = v5;

  -[AKAuthorizationPasswordAuthenticationViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "safeAreaInsets");
  self->_keyboardHeight = v6 - v8;

  -[AKAuthorizationPasswordAuthenticationViewController sizeToFitPaneContentAnimated:](self, "sizeToFitPaneContentAnimated:", 1);
}

- (void)keyboardWillHide:(id)a3
{
  void *v4;
  uint64_t v5;

  self->_keyboardHeight = 0.0;
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  if (v5 == 1)
  {
    -[NSLayoutConstraint setConstant:](self->_modalSignInViewBottomConstraint, "setConstant:", self->_keyboardHeight);
    -[AKAuthorizationPasswordAuthenticationViewController layoutViewWithAnimation](self, "layoutViewWithAnimation");
  }
  else
  {
    -[AKAuthorizationPasswordAuthenticationViewController sizeToFitPaneContentAnimated:](self, "sizeToFitPaneContentAnimated:", 1);
  }
}

- (void)keyboardWillChangeFrame:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a3;
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "userInterfaceIdiom");

  v11 = v12;
  if (v10 == 1)
  {
    if (-[AKAuthorizationPasswordAuthenticationViewController isKeyboardAttachedToBottom:](self, "isKeyboardAttachedToBottom:", v12)&& v6 > v8)
    {
      -[AKAuthorizationPasswordAuthenticationViewController adjustBottomInsetForKeyboard:](self, "adjustBottomInsetForKeyboard:", v12);
    }
    else
    {
      self->_keyboardHeight = 0.0;
      -[NSLayoutConstraint setConstant:](self->_modalSignInViewBottomConstraint, "setConstant:", 0.0);
    }
    -[AKAuthorizationPasswordAuthenticationViewController layoutViewWithAnimation](self, "layoutViewWithAnimation");
    v11 = v12;
  }

}

- (void)adjustBottomInsetForKeyboard:(id)a3
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  id v9;

  objc_msgSend(a3, "userInfo");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", *MEMORY[0x1E0CEB890]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "CGRectValue");
  v6 = v5;

  -[AKAuthorizationPasswordAuthenticationViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "safeAreaInsets");
  self->_keyboardHeight = v6 - v8;

  -[NSLayoutConstraint setConstant:](self->_modalSignInViewBottomConstraint, "setConstant:", -(self->_keyboardHeight * 0.5 + 36.0));
}

- (BOOL)isKeyboardAttachedToBottom:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  void *v14;
  void *v15;
  double v16;
  CGFloat v17;
  double v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double MaxX;
  BOOL v24;
  double Width;
  double v26;
  BOOL v27;
  BOOL v28;
  CGFloat v30;
  CGFloat v31;
  double v32;
  double MaxY;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;

  v3 = (void *)MEMORY[0x1E0CEA950];
  v4 = a3;
  objc_msgSend(v3, "mainScreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  objc_msgSend(v4, "userInfo");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "objectForKey:", *MEMORY[0x1E0CEB890]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "CGRectValue");
  v17 = v16;
  v30 = v18;
  v31 = v16;
  v20 = v19;
  v22 = v21;

  v34.origin.x = v7;
  v34.origin.y = v9;
  v34.size.width = v11;
  v34.size.height = v13;
  MaxX = CGRectGetMaxX(v34);
  v35.origin.x = v17;
  v35.origin.y = v30;
  v35.size.width = v20;
  v35.size.height = v22;
  v24 = MaxX == CGRectGetMaxX(v35);
  v36.origin.x = v7;
  v36.origin.y = v9;
  v36.size.width = v11;
  v36.size.height = v13;
  MaxY = CGRectGetMaxY(v36);
  v37.origin.x = v31;
  v37.origin.y = v30;
  v37.size.width = v20;
  v37.size.height = v22;
  v32 = CGRectGetMaxY(v37);
  v38.origin.x = v7;
  v38.origin.y = v9;
  v38.size.width = v11;
  v38.size.height = v13;
  Width = CGRectGetWidth(v38);
  v39.origin.x = v31;
  v39.origin.y = v30;
  v39.size.width = v20;
  v39.size.height = v22;
  v26 = CGRectGetWidth(v39);
  v27 = MaxY == v32 && v24;
  v28 = Width == v26 && v27;

  return v28;
}

- (void)signInViewController:(id)a3 didAuthenticateWithResults:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a5;
  v8 = a4;
  -[AKAuthorizationPasswordAuthenticationViewController delegate](self, "delegate");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "passwordAuthenticationCompletedWithResults:error:", v8, v7);

}

- (AKAuthorizationPasswordAuthenticationDelegate)delegate
{
  return (AKAuthorizationPasswordAuthenticationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (AKAuthorizationPresentationContext)presentationContext
{
  return self->_presentationContext;
}

- (void)setPresentationContext:(id)a3
{
  objc_storeStrong((id *)&self->_presentationContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentationContext, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_modalSignInViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_modalSignInViewController, 0);
}

@end
