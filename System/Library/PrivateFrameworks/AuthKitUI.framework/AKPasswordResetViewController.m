@implementation AKPasswordResetViewController

- (AKPasswordResetViewController)initWithImageProvider:(id)a3
{
  id v5;
  void *v6;
  AKPasswordResetViewController *v7;
  objc_super v9;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)AKPasswordResetViewController;
  v7 = -[AKPasswordResetViewController initWithNibName:bundle:](&v9, sel_initWithNibName_bundle_, CFSTR("AKPasswordResetViewController"), v6);

  if (v7)
    objc_storeStrong((id *)&v7->_imageProvider, a3);

  return v7;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AKPasswordResetViewController;
  -[AKPasswordResetViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[AKPasswordResetViewController _setupSubviews](self, "_setupSubviews");
  -[AKPasswordResetViewController _applyStyle](self, "_applyStyle");
  -[AKPasswordResetViewController _applyLocalization](self, "_applyLocalization");
  -[AKPasswordResetViewController _loadProfilePicture](self, "_loadProfilePicture");
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AKPasswordResetViewController;
  -[AKPasswordResetViewController viewDidLayoutSubviews](&v8, sel_viewDidLayoutSubviews);
  -[AKPasswordResetViewController footerView](self, "footerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;

  -[AKPasswordResetViewController contentScrollView](self, "contentScrollView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setContentInset:", 0.0, 0.0, v5, 0.0);

  -[AKPasswordResetViewController contentScrollView](self, "contentScrollView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setScrollIndicatorInsets:", 0.0, 0.0, v5, 0.0);

}

- (void)_setupSubviews
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v3 = objc_alloc(MEMORY[0x1E0CEA380]);
  -[AKPasswordResetViewController titleView](self, "titleView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithCustomView:", v4);
  -[AKPasswordResetViewController navigationItem](self, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLeftBarButtonItem:", v5);

  v7 = objc_alloc(MEMORY[0x1E0CEA380]);
  -[AKPasswordResetViewController closeButton](self, "closeButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithCustomView:", v8);
  -[AKPasswordResetViewController navigationItem](self, "navigationItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setRightBarButtonItem:", v9);

  -[AKPasswordResetViewController profilePictureImageView](self, "profilePictureImageView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "frame");
  v13 = v12 * 0.5;
  -[AKPasswordResetViewController profilePictureImageView](self, "profilePictureImageView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "layer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setCornerRadius:", v13);

  -[AKPasswordResetViewController profilePictureImageView](self, "profilePictureImageView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "layer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setMasksToBounds:", 1);

  -[AKPasswordResetViewController contentScrollView](self, "contentScrollView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setAccessibilityIdentifier:", CFSTR("SCROLL_VIEW"));

  -[AKPasswordResetViewController contentView](self, "contentView");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setAccessibilityIdentifier:", CFSTR("SCROLL_VIEW_CONTENT_VIEW"));

}

- (void)_applyLocalization
{
  void *v2;
  void *v4;
  __CFString *v5;
  char v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
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
  id v35;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = CFSTR("PASSWORD_RESET_OPTIONS_SERVICE_TITLE");
  v6 = objc_msgSend(CFSTR("PASSWORD_RESET_OPTIONS_SERVICE_TITLE"), "containsString:", CFSTR("REBRAND"));
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
      objc_msgSend(CFSTR("PASSWORD_RESET_OPTIONS_SERVICE_TITLE"), "stringByAppendingString:", CFSTR("_REBRAND"));
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
  -[AKPasswordResetViewController serviceNameLabel](self, "serviceNameLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setText:", v8);

  if (v7)
  if ((v6 & 1) == 0)

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("PASSWORD_RESET_OPTIONS_SCREEN_TITLE"), &stru_1E7679C68, CFSTR("Localizable"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKPasswordResetViewController screenTitleLabel](self, "screenTitleLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setText:", v11);

  objc_msgSend(MEMORY[0x1E0D00100], "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "primaryAuthKitAccount");
  v35 = (id)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x1E0D002B8];
  objc_msgSend(v35, "username");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "formattedUsernameFromUsername:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_alloc_init(MEMORY[0x1E0CB3850]);
  objc_msgSend(MEMORY[0x1E0D00100], "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "familyNameForAccount:", v35);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setFamilyName:", v19);

  objc_msgSend(MEMORY[0x1E0D00100], "sharedInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "givenNameForAccount:", v35);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setGivenName:", v21);

  v22 = objc_alloc_init(MEMORY[0x1E0CB3858]);
  objc_msgSend(v22, "stringFromPersonNameComponents:", v17);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("PASSWORD_RESET_OPTIONS_SCREEN_SUMMARY"), &stru_1E7679C68, CFSTR("Localizable"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "localizedModel");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "stringWithFormat:", v25, v23, v16, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  -[AKPasswordResetViewController screenSummaryLabel](self, "screenSummaryLabel");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setText:", v29);

  -[AKPasswordResetViewController resetMyPasswordButton](self, "resetMyPasswordButton");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKPasswordResetViewController _resetMyPasswordButtonTitle](self, "_resetMyPasswordButtonTitle");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setTitle:forState:", v32, 0);

  -[AKPasswordResetViewController helpSomeoneElseButton](self, "helpSomeoneElseButton");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKPasswordResetViewController _helpSomeonElseButtonTitle](self, "_helpSomeonElseButtonTitle");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setTitle:forState:", v34, 0);

}

- (id)_resetMyPasswordButtonTitle
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("PASSWORD_RESET_OPTIONS_CURRENT_USER_ACTION_BUTTON"), &stru_1E7679C68, CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_helpSomeonElseButtonTitle
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("PASSWORD_RESET_OPTIONS_SOMEONE_ELSE_ACTION_BUTTON"), &stru_1E7679C68, CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_applyStyle
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
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
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;
  id location;

  objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKPasswordResetViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  -[AKPasswordResetViewController keyIconImageView](self, "keyIconImageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "frame");
  v7 = v6 * 0.5;
  -[AKPasswordResetViewController keyIconImageView](self, "keyIconImageView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setCornerRadius:", v7);

  objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKPasswordResetViewController keyIconImageView](self, "keyIconImageView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setBackgroundColor:", v10);

  +[AKPasswordResetAppearance serviceNameFont](AKPasswordResetAppearance, "serviceNameFont");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKPasswordResetViewController serviceNameLabel](self, "serviceNameLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFont:", v12);

  -[AKPasswordResetViewController serviceNameLabel](self, "serviceNameLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAdjustsFontForContentSizeCategory:", 0);

  +[AKPasswordResetAppearance closeButtonConfiguration](AKPasswordResetAppearance, "closeButtonConfiguration");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKPasswordResetViewController closeButton](self, "closeButton");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setConfiguration:", v15);

  +[AKPasswordResetAppearance screenTitleFont](AKPasswordResetAppearance, "screenTitleFont");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKPasswordResetViewController screenTitleLabel](self, "screenTitleLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setFont:", v17);

  +[AKPasswordResetAppearance screenSummaryFont](AKPasswordResetAppearance, "screenSummaryFont");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKPasswordResetViewController screenSummaryLabel](self, "screenSummaryLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setFont:", v19);

  objc_initWeak(&location, self);
  -[AKPasswordResetViewController _resetMyPasswordButtonConfiguration](self, "_resetMyPasswordButtonConfiguration");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKPasswordResetViewController resetMyPasswordButton](self, "resetMyPasswordButton");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setConfiguration:", v21);

  -[AKPasswordResetViewController resetMyPasswordButton](self, "resetMyPasswordButton");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __44__AKPasswordResetViewController__applyStyle__block_invoke;
  v30[3] = &unk_1E7678A88;
  objc_copyWeak(&v31, &location);
  objc_msgSend(v23, "setConfigurationUpdateHandler:", v30);

  -[AKPasswordResetViewController _helpSomeoneElseButtonConfiguration](self, "_helpSomeoneElseButtonConfiguration");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKPasswordResetViewController helpSomeoneElseButton](self, "helpSomeoneElseButton");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setConfiguration:", v25);

  -[AKPasswordResetViewController helpSomeoneElseButton](self, "helpSomeoneElseButton");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v24;
  v28[1] = 3221225472;
  v28[2] = __44__AKPasswordResetViewController__applyStyle__block_invoke_2;
  v28[3] = &unk_1E7678A88;
  objc_copyWeak(&v29, &location);
  objc_msgSend(v27, "setConfigurationUpdateHandler:", v28);

  objc_destroyWeak(&v29);
  objc_destroyWeak(&v31);
  objc_destroyWeak(&location);
}

void __44__AKPasswordResetViewController__applyStyle__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(v6, "configuration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setShowsActivityIndicator:", objc_msgSend(WeakRetained, "showResetMyPasswordButtonLoading"));
    if (objc_msgSend(WeakRetained, "showResetMyPasswordButtonLoading"))
    {
      objc_msgSend(v4, "setTitle:", 0);
    }
    else
    {
      objc_msgSend(WeakRetained, "_resetMyPasswordButtonTitle");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setTitle:", v5);

    }
    objc_msgSend(v6, "setConfiguration:", v4);

  }
}

void __44__AKPasswordResetViewController__applyStyle__block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(v6, "configuration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setShowsActivityIndicator:", objc_msgSend(WeakRetained, "showHelpSomeoneElseButtonLoading"));
    if (objc_msgSend(WeakRetained, "showHelpSomeoneElseButtonLoading"))
    {
      objc_msgSend(v4, "setTitle:", 0);
    }
    else
    {
      objc_msgSend(WeakRetained, "_helpSomeonElseButtonTitle");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setTitle:", v5);

    }
    objc_msgSend(v6, "setConfiguration:", v4);

  }
}

- (void)didSelectClose:(id)a3
{
  void *v4;
  char v5;
  NSObject *v6;
  NSObject *v7;
  uint8_t v8[16];

  -[AKPasswordResetViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();
  _AKLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((v5 & 1) != 0)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1BD795000, v7, OS_LOG_TYPE_DEFAULT, "User selected close in password reset options screen", v8, 2u);
    }

    objc_msgSend(v4, "passwordResetControllerDidSelectClose:", self);
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[AKPasswordResetViewController didSelectClose:].cold.1(v7);

  }
}

- (void)didSelectResetMyPassword:(id)a3
{
  void *v4;
  id v5;

  -[AKPasswordResetViewController setShowResetMyPasswordButtonLoading:](self, "setShowResetMyPasswordButtonLoading:", 1);
  -[AKPasswordResetViewController resetMyPasswordButton](self, "resetMyPasswordButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNeedsUpdateConfiguration");

  -[AKPasswordResetViewController _startLoading](self, "_startLoading");
  -[AKPasswordResetViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "passwordResetControllerDidSelectPrimaryUser:", self);

}

- (void)didSelectHelpSomeoneElse:(id)a3
{
  void *v4;
  id v5;

  -[AKPasswordResetViewController setShowHelpSomeoneElseButtonLoading:](self, "setShowHelpSomeoneElseButtonLoading:", 1);
  -[AKPasswordResetViewController helpSomeoneElseButton](self, "helpSomeoneElseButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNeedsUpdateConfiguration");

  -[AKPasswordResetViewController _startLoading](self, "_startLoading");
  -[AKPasswordResetViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "passwordResetControllerDidSelectOtherUser:", self);

}

- (void)_loadProfilePicture
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id location;

  -[AKPasswordResetViewController imageProvider](self, "imageProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "profilePictureForAccountOwner");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[AKPasswordResetViewController profilePictureImageView](self, "profilePictureImageView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setImage:", v4);

  }
  else
  {
    objc_initWeak(&location, self);
    -[AKPasswordResetViewController imageProvider](self, "imageProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __52__AKPasswordResetViewController__loadProfilePicture__block_invoke;
    v7[3] = &unk_1E7678AD8;
    objc_copyWeak(&v8, &location);
    objc_msgSend(v6, "profilePictureForAccountOwnerWithCompletion:", v7);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }

}

void __52__AKPasswordResetViewController__loadProfilePicture__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__AKPasswordResetViewController__loadProfilePicture__block_invoke_2;
  v5[3] = &unk_1E7678AB0;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v7);
}

void __52__AKPasswordResetViewController__loadProfilePicture__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = *(_QWORD *)(a1 + 32);
    if (v3)
    {
      v5 = WeakRetained;
      objc_msgSend(WeakRetained, "profilePictureImageView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setImage:", v3);

      WeakRetained = v5;
    }
  }

}

- (id)_resetMyPasswordButtonConfiguration
{
  void *v2;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0CEA3A8], "filledButtonConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCornerStyle:", 3);
  objc_msgSend(v2, "setImagePadding:", 6.0);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __68__AKPasswordResetViewController__resetMyPasswordButtonConfiguration__block_invoke;
  v4[3] = &unk_1E7678B00;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v2, "setTitleTextAttributesTransformer:", v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return v2;
}

id __68__AKPasswordResetViewController__resetMyPasswordButtonConfiguration__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id WeakRetained;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_msgSend(a2, "mutableCopy");
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    if ((objc_msgSend(WeakRetained, "showResetMyPasswordButtonLoading") & 1) != 0
      || objc_msgSend(v5, "showHelpSomeoneElseButtonLoading"))
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
      v6 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
      v6 = objc_claimAutoreleasedReturnValue();
    }
    v7 = (void *)v6;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0CEA0A0]);

    +[AKPasswordResetAppearance actionButtonFont](AKPasswordResetAppearance, "actionButtonFont");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0CEA098]);

  }
  return v3;
}

- (id)_helpSomeoneElseButtonConfiguration
{
  void *v2;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0CEA3A8], "plainButtonConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setImagePadding:", 6.0);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __68__AKPasswordResetViewController__helpSomeoneElseButtonConfiguration__block_invoke;
  v4[3] = &unk_1E7678B00;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v2, "setTitleTextAttributesTransformer:", v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return v2;
}

id __68__AKPasswordResetViewController__helpSomeoneElseButtonConfiguration__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id WeakRetained;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_msgSend(a2, "mutableCopy");
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    if ((objc_msgSend(WeakRetained, "showResetMyPasswordButtonLoading") & 1) != 0
      || objc_msgSend(v5, "showHelpSomeoneElseButtonLoading"))
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
      v6 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "systemBlueColor");
      v6 = objc_claimAutoreleasedReturnValue();
    }
    v7 = (void *)v6;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0CEA0A0]);

    +[AKPasswordResetAppearance actionButtonFont](AKPasswordResetAppearance, "actionButtonFont");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0CEA098]);

  }
  return v3;
}

- (void)_startLoading
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  _AKLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1BD795000, v3, OS_LOG_TYPE_DEFAULT, "Started loading state in password reset options screen", v8, 2u);
  }

  -[AKPasswordResetViewController resetMyPasswordButton](self, "resetMyPasswordButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabled:", 0);

  -[AKPasswordResetViewController helpSomeoneElseButton](self, "helpSomeoneElseButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:", 0);

  -[AKPasswordResetViewController closeButton](self, "closeButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHidden:", 1);

  -[AKPasswordResetViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setUserInteractionEnabled:", 0);

}

- (void)stopLoading
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint8_t v10[16];

  _AKLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_1BD795000, v3, OS_LOG_TYPE_DEFAULT, "Stopped loading state in password reset options screen", v10, 2u);
  }

  -[AKPasswordResetViewController setShowResetMyPasswordButtonLoading:](self, "setShowResetMyPasswordButtonLoading:", 0);
  -[AKPasswordResetViewController resetMyPasswordButton](self, "resetMyPasswordButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNeedsUpdateConfiguration");

  -[AKPasswordResetViewController setShowHelpSomeoneElseButtonLoading:](self, "setShowHelpSomeoneElseButtonLoading:", 0);
  -[AKPasswordResetViewController helpSomeoneElseButton](self, "helpSomeoneElseButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNeedsUpdateConfiguration");

  -[AKPasswordResetViewController resetMyPasswordButton](self, "resetMyPasswordButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEnabled:", 1);

  -[AKPasswordResetViewController helpSomeoneElseButton](self, "helpSomeoneElseButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setEnabled:", 1);

  -[AKPasswordResetViewController closeButton](self, "closeButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setHidden:", 0);

  -[AKPasswordResetViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setUserInteractionEnabled:", 1);

}

- (AKPasswordResetViewControllerDelegate)delegate
{
  return (AKPasswordResetViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIView)titleView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_titleView);
}

- (void)setTitleView:(id)a3
{
  objc_storeWeak((id *)&self->_titleView, a3);
}

- (UILabel)serviceNameLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_serviceNameLabel);
}

- (void)setServiceNameLabel:(id)a3
{
  objc_storeWeak((id *)&self->_serviceNameLabel, a3);
}

- (UIButton)closeButton
{
  return (UIButton *)objc_loadWeakRetained((id *)&self->_closeButton);
}

- (void)setCloseButton:(id)a3
{
  objc_storeWeak((id *)&self->_closeButton, a3);
}

- (UIScrollView)contentScrollView
{
  return (UIScrollView *)objc_loadWeakRetained((id *)&self->_contentScrollView);
}

- (void)setContentScrollView:(id)a3
{
  objc_storeWeak((id *)&self->_contentScrollView, a3);
}

- (UIStackView)contentView
{
  return (UIStackView *)objc_loadWeakRetained((id *)&self->_contentView);
}

- (void)setContentView:(id)a3
{
  objc_storeWeak((id *)&self->_contentView, a3);
}

- (UIImageView)profilePictureImageView
{
  return (UIImageView *)objc_loadWeakRetained((id *)&self->_profilePictureImageView);
}

- (void)setProfilePictureImageView:(id)a3
{
  objc_storeWeak((id *)&self->_profilePictureImageView, a3);
}

- (UIImageView)keyIconImageView
{
  return (UIImageView *)objc_loadWeakRetained((id *)&self->_keyIconImageView);
}

- (void)setKeyIconImageView:(id)a3
{
  objc_storeWeak((id *)&self->_keyIconImageView, a3);
}

- (UILabel)screenTitleLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_screenTitleLabel);
}

- (void)setScreenTitleLabel:(id)a3
{
  objc_storeWeak((id *)&self->_screenTitleLabel, a3);
}

- (UILabel)screenSummaryLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_screenSummaryLabel);
}

- (void)setScreenSummaryLabel:(id)a3
{
  objc_storeWeak((id *)&self->_screenSummaryLabel, a3);
}

- (UIView)footerView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_footerView);
}

- (void)setFooterView:(id)a3
{
  objc_storeWeak((id *)&self->_footerView, a3);
}

- (UIButton)resetMyPasswordButton
{
  return (UIButton *)objc_loadWeakRetained((id *)&self->_resetMyPasswordButton);
}

- (void)setResetMyPasswordButton:(id)a3
{
  objc_storeWeak((id *)&self->_resetMyPasswordButton, a3);
}

- (UIButton)helpSomeoneElseButton
{
  return (UIButton *)objc_loadWeakRetained((id *)&self->_helpSomeoneElseButton);
}

- (void)setHelpSomeoneElseButton:(id)a3
{
  objc_storeWeak((id *)&self->_helpSomeoneElseButton, a3);
}

- (UIActivityIndicatorView)activityIndicatorView
{
  return self->_activityIndicatorView;
}

- (void)setActivityIndicatorView:(id)a3
{
  objc_storeStrong((id *)&self->_activityIndicatorView, a3);
}

- (UITraitChangeRegistration)traitChangeRegistration
{
  return self->_traitChangeRegistration;
}

- (void)setTraitChangeRegistration:(id)a3
{
  objc_storeStrong((id *)&self->_traitChangeRegistration, a3);
}

- (BOOL)showResetMyPasswordButtonLoading
{
  return self->_showResetMyPasswordButtonLoading;
}

- (void)setShowResetMyPasswordButtonLoading:(BOOL)a3
{
  self->_showResetMyPasswordButtonLoading = a3;
}

- (BOOL)showHelpSomeoneElseButtonLoading
{
  return self->_showHelpSomeoneElseButtonLoading;
}

- (void)setShowHelpSomeoneElseButtonLoading:(BOOL)a3
{
  self->_showHelpSomeoneElseButtonLoading = a3;
}

- (AKProfileImageProviding)imageProvider
{
  return self->_imageProvider;
}

- (void)setImageProvider:(id)a3
{
  objc_storeStrong((id *)&self->_imageProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageProvider, 0);
  objc_storeStrong((id *)&self->_traitChangeRegistration, 0);
  objc_storeStrong((id *)&self->_activityIndicatorView, 0);
  objc_destroyWeak((id *)&self->_helpSomeoneElseButton);
  objc_destroyWeak((id *)&self->_resetMyPasswordButton);
  objc_destroyWeak((id *)&self->_footerView);
  objc_destroyWeak((id *)&self->_screenSummaryLabel);
  objc_destroyWeak((id *)&self->_screenTitleLabel);
  objc_destroyWeak((id *)&self->_keyIconImageView);
  objc_destroyWeak((id *)&self->_profilePictureImageView);
  objc_destroyWeak((id *)&self->_contentView);
  objc_destroyWeak((id *)&self->_contentScrollView);
  objc_destroyWeak((id *)&self->_closeButton);
  objc_destroyWeak((id *)&self->_serviceNameLabel);
  objc_destroyWeak((id *)&self->_titleView);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)didSelectClose:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1BD795000, log, OS_LOG_TYPE_ERROR, "Password reset option controller's delegate didn't implement to close event.", v1, 2u);
}

@end
