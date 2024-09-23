@implementation AKBasicLoginOptionsViewController

- (AKBasicLoginOptionsViewController)initWithContext:(id)a3
{
  id v4;
  AKBasicLoginOptionsViewController *v5;
  AKBasicLoginOptionsViewController *v6;
  NSObject *v7;
  _QWORD v9[4];
  id v10;
  id location;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AKBasicLoginOptionsViewController;
  v5 = -[AKBasicLoginOptionsViewController init](&v12, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_context, v4);
    objc_initWeak(&location, v6);
    dispatch_get_global_queue(33, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __53__AKBasicLoginOptionsViewController_initWithContext___block_invoke;
    v9[3] = &unk_1E7678EE8;
    objc_copyWeak(&v10, &location);
    dispatch_async(v7, v9);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }

  return v6;
}

void __53__AKBasicLoginOptionsViewController_initWithContext___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  v2 = (void *)objc_opt_new();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __53__AKBasicLoginOptionsViewController_initWithContext___block_invoke_2;
  v3[3] = &unk_1E7678EC0;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  objc_msgSend(v2, "isCreateAppleIDAllowedWithCompletion:", v3);
  objc_destroyWeak(&v4);

}

void __53__AKBasicLoginOptionsViewController_initWithContext___block_invoke_2(uint64_t a1, char a2)
{
  _QWORD v3[4];
  id v4;
  char v5;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __53__AKBasicLoginOptionsViewController_initWithContext___block_invoke_3;
  v3[3] = &unk_1E7678E98;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  v5 = a2;
  dispatch_async(MEMORY[0x1E0C80D38], v3);
  objc_destroyWeak(&v4);
}

void __53__AKBasicLoginOptionsViewController_initWithContext___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setIsCreateAppleIDAllowed:", *(unsigned __int8 *)(a1 + 40));
  objc_msgSend(WeakRetained, "_refreshCreateAppleIDButton");

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  __CFString *v16;
  char v17;
  int v18;
  void *v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)AKBasicLoginOptionsViewController;
  -[AKBasicLoginOptionsViewController viewDidLoad](&v20, sel_viewDidLoad);
  -[AKBasicLoginOptionsViewController context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKBasicLoginOptionsViewController _refreshCreateAppleIDButton](self, "_refreshCreateAppleIDButton");
  -[AKBasicLoginOptionsViewController _createLinkButtonWithSelector:](self, "_createLinkButtonWithSelector:", sel_forgotPressed_);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKBasicLoginOptionsViewController setForgotButton:](self, "setForgotButton:", v4);

  -[AKBasicLoginOptionsViewController _createLinkButtonWithSelector:](self, "_createLinkButtonWithSelector:", sel_createPressed_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKBasicLoginOptionsViewController setCreateButton:](self, "setCreateButton:", v5);

  -[AKBasicLoginOptionsViewController _setupStackView](self, "_setupStackView");
  -[AKBasicLoginOptionsViewController forgotButton](self, "forgotButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKBasicLoginOptionsViewController _configureButtonForFontAdjustment:](self, "_configureButtonForFontAdjustment:", v6);

  -[AKBasicLoginOptionsViewController createButton](self, "createButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKBasicLoginOptionsViewController _configureButtonForFontAdjustment:](self, "_configureButtonForFontAdjustment:", v7);

  -[AKBasicLoginOptionsViewController forgotButton](self, "forgotButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v3, "isUsernameEditable");
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AuthKitUI"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9)
    v12 = CFSTR("IFORGOT_BUTTON_TITLE");
  else
    v12 = CFSTR("FORGOT_PASSWORD");
  objc_msgSend(v10, "localizedStringForKey:value:table:", v12, &stru_1E7679C68, CFSTR("Localizable"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTitle:forState:", v13, 0);

  -[AKBasicLoginOptionsViewController createButton](self, "createButton");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AuthKitUI"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = CFSTR("CREATE_APPLE_ID_BUTTON_TITLE");
  v17 = objc_msgSend(CFSTR("CREATE_APPLE_ID_BUTTON_TITLE"), "containsString:", CFSTR("REBRAND"));
  if ((v17 & 1) != 0)
  {
    v18 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D001E8], "sharedManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isAABrandingEnabled"))
    {
      objc_msgSend(CFSTR("CREATE_APPLE_ID_BUTTON_TITLE"), "stringByAppendingString:", CFSTR("_REBRAND"));
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v18 = 1;
    }
    else
    {
      v18 = 0;
    }
  }
  objc_msgSend(v15, "localizedStringForKey:value:table:", v16, &stru_1E7679C68, CFSTR("Localizable"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTitle:forState:", v19, 0);

  if (v18)
  if ((v17 & 1) == 0)

  -[AKBasicLoginOptionsViewController _setupPrivacyLinkControllerWithContext:](self, "_setupPrivacyLinkControllerWithContext:", v3);
  -[AKBasicLoginOptionsViewController setView:](self, "setView:", self->_stackView);

}

- (void)_setupStackView
{
  id v3;
  UIStackView *v4;
  UIStackView *stackView;
  UIStackView *v6;
  void *v7;
  UIStackView *v8;
  id v9;

  v3 = objc_alloc(MEMORY[0x1E0CEA9E0]);
  v4 = (UIStackView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  stackView = self->_stackView;
  self->_stackView = v4;

  -[UIStackView setAlignment:](self->_stackView, "setAlignment:", 3);
  -[UIStackView setAxis:](self->_stackView, "setAxis:", 1);
  -[UIStackView setDistribution:](self->_stackView, "setDistribution:", 0);
  -[UIStackView setLayoutMarginsRelativeArrangement:](self->_stackView, "setLayoutMarginsRelativeArrangement:", 1);
  -[UIStackView setSpacing:](self->_stackView, "setSpacing:", 7.0);
  -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_stackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v6 = self->_stackView;
  -[AKBasicLoginOptionsViewController forgotButton](self, "forgotButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStackView addArrangedSubview:](v6, "addArrangedSubview:", v7);

  v8 = self->_stackView;
  -[AKBasicLoginOptionsViewController createButton](self, "createButton");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[UIStackView addArrangedSubview:](v8, "addArrangedSubview:", v9);

}

- (void)_setupPrivacyLinkControllerWithContext:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  UIStackView *stackView;
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
  _QWORD v32[3];

  v32[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "privacyBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    _AKLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[AKBasicLoginOptionsViewController _setupPrivacyLinkControllerWithContext:].cold.1(v6);

    v7 = (void *)MEMORY[0x1E0D65190];
    objc_msgSend(v4, "privacyBundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "linkWithBundleIdentifier:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKBasicLoginOptionsViewController setPrivacyController:](self, "setPrivacyController:", v9);

    -[AKBasicLoginOptionsViewController privacyController](self, "privacyController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKBasicLoginOptionsViewController addChildViewController:](self, "addChildViewController:", v10);

    -[UIStackView arrangedSubviews](self->_stackView, "arrangedSubviews");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");

    if (v12)
    {
      -[UIStackView arrangedSubviews](self->_stackView, "arrangedSubviews");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIStackView arrangedSubviews](self->_stackView, "arrangedSubviews");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectAtIndexedSubscript:", objc_msgSend(v14, "count") - 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      stackView = self->_stackView;
      -[AKBasicLoginOptionsViewController privacyController](self, "privacyController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "view");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIStackView addArrangedSubview:](stackView, "addArrangedSubview:", v18);

      if (v15)
        -[UIStackView setCustomSpacing:afterView:](self->_stackView, "setCustomSpacing:afterView:", v15, 20.0);

    }
    -[AKBasicLoginOptionsViewController privacyController](self, "privacyController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "didMoveToParentViewController:", self);

    -[AKBasicLoginOptionsViewController privacyController](self, "privacyController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "view");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "leadingAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView leadingAnchor](self->_stackView, "leadingAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    -[AKBasicLoginOptionsViewController privacyController](self, "privacyController");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "view");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "trailingAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView trailingAnchor](self->_stackView, "trailingAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    v30 = (void *)MEMORY[0x1E0CB3718];
    v32[0] = v24;
    v32[1] = v29;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 2);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "activateConstraints:", v31);

  }
}

- (void)forgotPressed:(id)a3
{
  void *v4;
  void (**v5)(void);

  -[AKBasicLoginOptionsViewController forgotAction](self, "forgotAction", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[AKBasicLoginOptionsViewController forgotAction](self, "forgotAction");
    v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v5[2]();

  }
}

- (void)createPressed:(id)a3
{
  void *v4;
  void (**v5)(void);

  -[AKBasicLoginOptionsViewController createIDAction](self, "createIDAction", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[AKBasicLoginOptionsViewController createIDAction](self, "createIDAction");
    v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v5[2]();

  }
}

- (void)_configureButtonForFontAdjustment:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[5];

  v25[4] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "titleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0CEA5F0], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E0CEB538], 0x8000, 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA5E8], "fontWithDescriptor:size:", v24, 0.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFont:", v5);

  objc_msgSend(v4, "setNumberOfLines:", 0);
  objc_msgSend(v4, "setAdjustsFontForContentSizeCategory:", 1);
  objc_msgSend(v4, "setLineBreakMode:", 0);
  objc_msgSend(v4, "setTextAlignment:", 1);
  v19 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(v4, "leadingAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "leadingAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentEdgeInsets");
  objc_msgSend(v23, "constraintGreaterThanOrEqualToAnchor:constant:", v22, v6);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v21;
  objc_msgSend(v4, "trailingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "trailingAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentEdgeInsets");
  objc_msgSend(v20, "constraintGreaterThanOrEqualToAnchor:constant:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v9;
  objc_msgSend(v4, "topAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "topAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentEdgeInsets");
  objc_msgSend(v10, "constraintGreaterThanOrEqualToAnchor:constant:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2] = v12;
  objc_msgSend(v4, "bottomAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bottomAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentEdgeInsets");
  v16 = v15;

  objc_msgSend(v13, "constraintGreaterThanOrEqualToAnchor:constant:", v14, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v25[3] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "activateConstraints:", v18);

}

- (void)_refreshCreateAppleIDButton
{
  const __CFString *v2;
  int v3;
  const __CFString *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = CFSTR("NO");
  if ((a1 & 1) != 0)
    v2 = CFSTR("YES");
  v3 = 138412290;
  v4 = v2;
  _os_log_debug_impl(&dword_1BD795000, a2, OS_LOG_TYPE_DEBUG, "Create button hidden - %@", (uint8_t *)&v3, 0xCu);
}

- (BOOL)_shouldHideCreateButton
{
  void *v3;
  _BOOL4 v4;

  -[AKBasicLoginOptionsViewController context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "shouldAllowAppleIDCreation"))
    v4 = !-[AKBasicLoginOptionsViewController isCreateAppleIDAllowed](self, "isCreateAppleIDAllowed");
  else
    LOBYTE(v4) = 1;

  return v4;
}

- (id)_createLinkButtonWithSelector:(SEL)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v5, "addTarget:action:forControlEvents:", self, a3, 64);
  return v5;
}

- (id)createIDAction
{
  return self->_createIDAction;
}

- (void)setCreateIDAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 976);
}

- (id)forgotAction
{
  return self->_forgotAction;
}

- (void)setForgotAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 984);
}

- (AKAppleIDAuthenticationInAppContext)context
{
  return (AKAppleIDAuthenticationInAppContext *)objc_loadWeakRetained((id *)&self->_context);
}

- (void)setContext:(id)a3
{
  objc_storeWeak((id *)&self->_context, a3);
}

- (UIButton)forgotButton
{
  return self->_forgotButton;
}

- (void)setForgotButton:(id)a3
{
  objc_storeStrong((id *)&self->_forgotButton, a3);
}

- (UIButton)createButton
{
  return self->_createButton;
}

- (void)setCreateButton:(id)a3
{
  objc_storeStrong((id *)&self->_createButton, a3);
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
  objc_storeStrong((id *)&self->_stackView, a3);
}

- (OBPrivacyLinkController)privacyController
{
  return self->_privacyController;
}

- (void)setPrivacyController:(id)a3
{
  objc_storeStrong((id *)&self->_privacyController, a3);
}

- (BOOL)isCreateAppleIDAllowed
{
  return self->_isCreateAppleIDAllowed;
}

- (void)setIsCreateAppleIDAllowed:(BOOL)a3
{
  self->_isCreateAppleIDAllowed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privacyController, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_createButton, 0);
  objc_storeStrong((id *)&self->_forgotButton, 0);
  objc_destroyWeak((id *)&self->_context);
  objc_storeStrong(&self->_forgotAction, 0);
  objc_storeStrong(&self->_createIDAction, 0);
}

- (void)_setupPrivacyLinkControllerWithContext:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1BD795000, log, OS_LOG_TYPE_DEBUG, "Showing On Boarding Privacy link...", v1, 2u);
}

@end
