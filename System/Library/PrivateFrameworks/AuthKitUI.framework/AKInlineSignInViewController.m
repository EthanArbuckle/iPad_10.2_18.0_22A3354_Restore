@implementation AKInlineSignInViewController

- (AKInlineSignInViewController)init
{
  void *v3;
  AKInlineSignInViewController *v4;
  NSObject *v5;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  id location;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[AKBaseSignInViewController _initWithNibName:bundle:](self, "_initWithNibName:bundle:", CFSTR("AKInlineSignInViewController_iOS"), v3);

  if (v4)
  {
    objc_initWeak(&location, v4);
    dispatch_get_global_queue(33, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x1E0C809B0];
    v8 = 3221225472;
    v9 = __36__AKInlineSignInViewController_init__block_invoke;
    v10 = &unk_1E7678EE8;
    objc_copyWeak(&v11, &location);
    dispatch_async(v5, &v7);

    -[AKInlineSignInViewController _setButtonTitles](v4, "_setButtonTitles", v7, v8, v9, v10);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  return v4;
}

void __36__AKInlineSignInViewController_init__block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  v2 = (void *)objc_opt_new();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __36__AKInlineSignInViewController_init__block_invoke_2;
  v3[3] = &unk_1E7678EC0;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  objc_msgSend(v2, "isCreateAppleIDAllowedWithCompletion:", v3);
  objc_destroyWeak(&v4);

}

void __36__AKInlineSignInViewController_init__block_invoke_2(uint64_t a1, char a2)
{
  _QWORD v3[4];
  id v4;
  char v5;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __36__AKInlineSignInViewController_init__block_invoke_3;
  v3[3] = &unk_1E7678E98;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  v5 = a2;
  dispatch_async(MEMORY[0x1E0C80D38], v3);
  objc_destroyWeak(&v4);
}

void __36__AKInlineSignInViewController_init__block_invoke_3(uint64_t a1)
{
  _BYTE *WeakRetained;
  _BYTE *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    WeakRetained[1010] = *(_BYTE *)(a1 + 40);
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "refreshCreateAppleIDButton");
    WeakRetained = v3;
  }

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0CEB3F0], 0);

  v4.receiver = self;
  v4.super_class = (Class)AKInlineSignInViewController;
  -[AKBaseSignInViewController dealloc](&v4, sel_dealloc);
}

- (AKInlineSignInViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  objc_super v6;

  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Call -init instead of -initWithNibName:bundle:"));
  v6.receiver = self;
  v6.super_class = (Class)AKInlineSignInViewController;
  return (AKInlineSignInViewController *)-[AKBaseSignInViewController _initWithNibName:bundle:](&v6, sel__initWithNibName_bundle_, 0, 0);
}

- (NSString)secondaryButtonTitle
{
  return self->_secondaryButtonTitle;
}

- (void)setSecondaryButtonTitle:(id)a3
{
  NSString *v4;
  NSString *secondaryButtonTitle;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (!-[NSString isEqualToString:](self->_secondaryButtonTitle, "isEqualToString:"))
  {
    v4 = (NSString *)objc_msgSend(v8, "copy");
    secondaryButtonTitle = self->_secondaryButtonTitle;
    self->_secondaryButtonTitle = v4;

    -[AKInlineSignInViewController iforgotButton](self, "iforgotButton");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTitle:forState:", self->_secondaryButtonTitle, 0);

    if (-[NSString length](self->_secondaryButtonTitle, "length"))
    {
      -[AKInlineSignInViewController iforgotButton](self, "iforgotButton");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setHidden:", 0);

    }
    else
    {
      -[AKInlineSignInViewController _setForgotButtonHidden:](self, "_setForgotButtonHidden:", 1);
    }
  }

}

- (NSString)tertiaryButtonTitle
{
  return self->_tertiaryButtonTitle;
}

- (void)setTertiaryButtonTitle:(id)a3
{
  NSString *v4;
  NSString *tertiaryButtonTitle;
  id v6;

  v6 = a3;
  if (!-[NSString isEqualToString:](self->_tertiaryButtonTitle, "isEqualToString:"))
  {
    v4 = (NSString *)objc_msgSend(v6, "copy");
    tertiaryButtonTitle = self->_tertiaryButtonTitle;
    self->_tertiaryButtonTitle = v4;

  }
  -[AKInlineSignInViewController refreshCreateAppleIDButton](self, "refreshCreateAppleIDButton");

}

- (void)refreshCreateAppleIDButton
{
  void *v3;
  id v4;

  if (self->_createAppleIDAllowed
    && (-[AKInlineSignInViewController createAppleIDButton](self, "createAppleIDButton"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v3, "setTitle:forState:", self->_tertiaryButtonTitle, 0),
        v3,
        -[NSString length](self->_tertiaryButtonTitle, "length")))
  {
    -[AKInlineSignInViewController _setCreateButtonHidden:](self, "_setCreateButtonHidden:", 0);
    -[AKInlineSignInViewController createAppleIDButton](self, "createAppleIDButton");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[AKInlineSignInViewController _applyStyleForCreateOrForgot:](self, "_applyStyleForCreateOrForgot:", v4);

  }
  else
  {
    -[AKInlineSignInViewController _setCreateButtonHidden:](self, "_setCreateButtonHidden:", 1);
  }
}

- (void)_setCreateButtonHidden:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[AKInlineSignInViewController createAppleIDButton](self, "createAppleIDButton");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", v3);

}

- (void)_setForgotButtonHidden:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[AKInlineSignInViewController iforgotButton](self, "iforgotButton");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", v3);

}

- (void)_setCreateButtonEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[AKInlineSignInViewController createAppleIDButton](self, "createAppleIDButton");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabled:", v3);

}

- (void)setSecondaryButtonTarget:(id)a3 action:(SEL)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[AKInlineSignInViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[AKInlineSignInViewController iforgotButton](self, "iforgotButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeTarget:action:forControlEvents:", self, sel_iForgotButtonWasTapped_, 64);

    -[AKInlineSignInViewController iforgotButton](self, "iforgotButton");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addTarget:action:forControlEvents:", v9, a4, 64);

  }
}

- (void)setTertiaryButtonTarget:(id)a3 action:(SEL)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[AKInlineSignInViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[AKInlineSignInViewController createAppleIDButton](self, "createAppleIDButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeTarget:action:forControlEvents:", self, sel_createAppleIDButtonWasTapped_, 64);

    -[AKInlineSignInViewController createAppleIDButton](self, "createAppleIDButton");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addTarget:action:forControlEvents:", v9, a4, 64);

  }
}

- (id)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  objc_storeStrong((id *)&self->_context, a3);
  -[AKAppleIDAuthenticationInAppContext _passwordDelegate](self->_context, "_passwordDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    -[AKAppleIDAuthenticationInAppContext _setPasswordDelegate:](self->_context, "_setPasswordDelegate:", self);
  -[AKInlineSignInViewController _prefillAuthFields](self, "_prefillAuthFields");
  -[AKInlineSignInViewController _updateSignInFieldStatuses](self, "_updateSignInFieldStatuses");

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
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
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  _BOOL8 v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  NSObject *v84;
  void *v85;
  uint8_t v86[16];
  objc_super v87;

  v87.receiver = self;
  v87.super_class = (Class)AKInlineSignInViewController;
  -[AKInlineSignInViewController viewDidLoad](&v87, sel_viewDidLoad);
  -[AKInlineSignInViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[AKInlineSignInViewController iforgotButton](self, "iforgotButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:forState:", self->_secondaryButtonTitle, 0);

  -[AKInlineSignInViewController iforgotButton](self, "iforgotButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKInlineSignInViewController _applyStyleForCreateOrForgot:](self, "_applyStyleForCreateOrForgot:", v5);

  -[AKInlineSignInViewController iforgotButton](self, "iforgotButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allTargets");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (!v8)
  {
    -[AKInlineSignInViewController iforgotButton](self, "iforgotButton");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addTarget:action:forControlEvents:", self, sel_iForgotButtonWasTapped_, 64);

  }
  if (!-[NSString length](self->_secondaryButtonTitle, "length"))
    -[AKInlineSignInViewController _setForgotButtonHidden:](self, "_setForgotButtonHidden:", 1);
  -[AKInlineSignInViewController refreshCreateAppleIDButton](self, "refreshCreateAppleIDButton");
  -[AKInlineSignInViewController createAppleIDButton](self, "createAppleIDButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "allTargets");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (!v12)
  {
    -[AKInlineSignInViewController createAppleIDButton](self, "createAppleIDButton");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addTarget:action:forControlEvents:", self, sel_createAppleIDButtonWasTapped_, 64);

  }
  -[AKInlineSignInViewController signInButton](self, "signInButton");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTitle:forState:", self->_primaryButtonTitle, 0);

  -[AKInlineSignInViewController signInButton](self, "signInButton");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addTarget:action:forControlEvents:", self, sel_signInButtonWasTapped_, 64);

  -[AKInlineSignInViewController signInButton](self, "signInButton");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setHidden:", -[AKInlineSignInViewController isPrimaryButtonHidden](self, "isPrimaryButtonHidden"));

  -[AKInlineSignInViewController signInButton](self, "signInButton");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKInlineSignInViewController _applyStyleForButton:](self, "_applyStyleForButton:", v17);

  -[AKInlineSignInViewController appleIDField](self, "appleIDField");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setRowIdentifier:", 3);

  -[AKInlineSignInViewController passwordField](self, "passwordField");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[AKInlineSignInViewController shouldPromptForPasswordOnly](self, "shouldPromptForPasswordOnly"))
    v20 = 3;
  else
    v20 = 1;
  objc_msgSend(v19, "setRowIdentifier:", v20);

  -[AKInlineSignInViewController appleIDField](self, "appleIDField");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "entryField");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("EMAIL_OR_PHONE_PLACEHOLDER"), &stru_1E7679C68, CFSTR("Localizable"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setPlaceholder:", v24);

  -[AKInlineSignInViewController appleIDField](self, "appleIDField");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "entryField");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setKeyboardType:", 7);

  -[AKInlineSignInViewController appleIDField](self, "appleIDField");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "entryField");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setAutocapitalizationType:", 0);

  -[AKInlineSignInViewController appleIDField](self, "appleIDField");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "entryField");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setAutocorrectionType:", 1);

  -[AKInlineSignInViewController appleIDField](self, "appleIDField");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "entryField");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setAdjustsFontSizeToFitWidth:", 1);

  -[AKInlineSignInViewController appleIDField](self, "appleIDField");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "entryField");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setReturnKeyType:", 11);

  -[AKInlineSignInViewController appleIDField](self, "appleIDField");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", self, sel__usernameFieldTapped);
  objc_msgSend(v35, "addGestureRecognizer:", v36);

  -[AKInlineSignInViewController appleIDField](self, "appleIDField");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "entryField");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "addTarget:action:forControlEvents:", self, sel__appleIDTextFieldDidChange_, 983040);

  -[AKInlineSignInViewController appleIDField](self, "appleIDField");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "entryField");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setDelegate:", self);

  -[AKInlineSignInViewController appleIDField](self, "appleIDField");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "entryField");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setTextContentType:", *MEMORY[0x1E0CEBD10]);

  -[AKInlineSignInViewController _updateFonts:](self, "_updateFonts:", 0);
  -[AKInlineSignInViewController _prefillAuthFields](self, "_prefillAuthFields");
  -[AKInlineSignInViewController passwordField](self, "passwordField");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "entryField");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "localizedStringForKey:value:table:", CFSTR("PASSWORD_PLACEHOLDER"), &stru_1E7679C68, CFSTR("Localizable"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setPlaceholder:", v46);

  -[AKInlineSignInViewController passwordField](self, "passwordField");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "entryField");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setSecureTextEntry:", 1);

  -[AKInlineSignInViewController passwordField](self, "passwordField");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "entryField");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setAdjustsFontSizeToFitWidth:", 1);

  -[AKInlineSignInViewController passwordField](self, "passwordField");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "entryField");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setAutocapitalizationType:", 0);

  -[AKInlineSignInViewController passwordField](self, "passwordField");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "entryField");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "setAutocorrectionType:", 1);

  -[AKInlineSignInViewController passwordField](self, "passwordField");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "entryField");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "setReturnKeyType:", 9);

  -[AKInlineSignInViewController passwordField](self, "passwordField");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "entryField");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "setEnablesReturnKeyAutomatically:", 1);

  -[AKInlineSignInViewController passwordField](self, "passwordField");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", self, sel__passwordFieldTapped);
  objc_msgSend(v59, "addGestureRecognizer:", v60);

  -[AKInlineSignInViewController passwordField](self, "passwordField");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "entryField");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "addTarget:action:forControlEvents:", self, sel__passwordTextFieldDidChange_, 983040);

  -[AKInlineSignInViewController passwordField](self, "passwordField");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "entryField");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "setDelegate:", self);

  -[AKInlineSignInViewController passwordField](self, "passwordField");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "entryField");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "setTextContentType:", *MEMORY[0x1E0CEBCD0]);

  -[AKInlineSignInViewController entryDescriptionTextColor](self, "entryDescriptionTextColor");
  v67 = (void *)objc_claimAutoreleasedReturnValue();

  if (v67)
  {
    -[AKInlineSignInViewController appleIDField](self, "appleIDField");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKInlineSignInViewController entryDescriptionTextColor](self, "entryDescriptionTextColor");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "setEntryDescriptionTextColor:", v69);

    -[AKInlineSignInViewController passwordField](self, "passwordField");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKInlineSignInViewController entryDescriptionTextColor](self, "entryDescriptionTextColor");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "setEntryDescriptionTextColor:", v71);

  }
  -[AKInlineSignInViewController entryFieldTextColor](self, "entryFieldTextColor");
  v72 = (void *)objc_claimAutoreleasedReturnValue();

  if (v72)
  {
    -[AKInlineSignInViewController appleIDField](self, "appleIDField");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKInlineSignInViewController entryFieldTextColor](self, "entryFieldTextColor");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "setEntryFieldTextColor:", v74);

    -[AKInlineSignInViewController passwordField](self, "passwordField");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKInlineSignInViewController entryFieldTextColor](self, "entryFieldTextColor");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "setEntryFieldTextColor:", v76);

  }
  v77 = -[AKInlineSignInViewController shouldPromptForPasswordOnly](self, "shouldPromptForPasswordOnly");
  -[AKInlineSignInViewController passwordField](self, "passwordField");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "setHidden:", -[AKInlineSignInViewController shouldPromptForPasswordOnly](self, "shouldPromptForPasswordOnly") ^ 1);

  -[AKInlineSignInViewController appleIDField](self, "appleIDField");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "setHidden:", v77);

  if (v77)
  {
    -[AKInlineSignInViewController passwordField](self, "passwordField");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "entryField");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "becomeFirstResponder");

  }
  -[AKInlineSignInViewController context](self, "context");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "_setPasswordDelegate:", self);

  -[AKInlineSignInViewController _updateVibrancyAndBlurInTextFields](self, "_updateVibrancyAndBlurInTextFields");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "addObserver:selector:name:object:", self, sel__updateFonts_, *MEMORY[0x1E0CEB3F0], 0);

  if (-[AKBaseSignInViewController _isAccountModificationRestricted](self, "_isAccountModificationRestricted"))
  {
    _AKLogSystem();
    v84 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v86 = 0;
      _os_log_impl(&dword_1BD795000, v84, OS_LOG_TYPE_DEFAULT, "MCFeatureAccountModificationAllowed is restricted. Disabling UI.", v86, 2u);
    }

    -[AKInlineSignInViewController iforgotButton](self, "iforgotButton");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "setEnabled:", 0);

    -[AKInlineSignInViewController _setCreateButtonEnabled:](self, "_setCreateButtonEnabled:", 0);
    -[AKInlineSignInViewController _updateSignInFieldStatuses](self, "_updateSignInFieldStatuses");
  }
  -[AKInlineSignInViewController _updateFonts:](self, "_updateFonts:", 0);
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AKInlineSignInViewController;
  -[AKInlineSignInViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[AKInlineSignInViewController _updateSignInButtonState](self, "_updateSignInButtonState");
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)_setButtonTitles
{
  void *v3;
  __CFString *v4;
  NSString *v5;
  NSString *primaryButtonTitle;
  void *v7;
  NSString *v8;
  NSString *secondaryButtonTitle;
  __CFString *v10;
  char v11;
  int v12;
  NSString *v13;
  NSString *tertiaryButtonTitle;
  id v15;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = &stru_1E7679C68;
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("SIGN_IN_BUTTON_TITLE"), &stru_1E7679C68, CFSTR("Localizable"));
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  primaryButtonTitle = self->_primaryButtonTitle;
  self->_primaryButtonTitle = v5;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("IFORGOT_BUTTON_TITLE"), &stru_1E7679C68, CFSTR("Localizable"));
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  secondaryButtonTitle = self->_secondaryButtonTitle;
  self->_secondaryButtonTitle = v8;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v10 = CFSTR("CREATE_APPLE_ID_BUTTON_TITLE");
  v11 = objc_msgSend(CFSTR("CREATE_APPLE_ID_BUTTON_TITLE"), "containsString:", CFSTR("REBRAND"));
  if ((v11 & 1) != 0)
  {
    v12 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D001E8], "sharedManager");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (-[__CFString isAABrandingEnabled](v4, "isAABrandingEnabled"))
    {
      objc_msgSend(CFSTR("CREATE_APPLE_ID_BUTTON_TITLE"), "stringByAppendingString:", CFSTR("_REBRAND"));
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v12 = 1;
    }
    else
    {
      v12 = 0;
    }
  }
  objc_msgSend(v15, "localizedStringForKey:value:table:", v10, &stru_1E7679C68, CFSTR("Localizable"));
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  tertiaryButtonTitle = self->_tertiaryButtonTitle;
  self->_tertiaryButtonTitle = v13;

  if (v12)
  if ((v11 & 1) == 0)

}

- (void)_updateSignInFieldStatuses
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  id v6;

  v3 = -[AKBaseSignInViewController _isSignInAllowed](self, "_isSignInAllowed");
  -[AKInlineSignInViewController appleIDField](self, "appleIDField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabled:", v3);

  -[AKInlineSignInViewController passwordField](self, "passwordField");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:", v3);

  -[AKInlineSignInViewController signInButton](self, "signInButton");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEnabled:", v3);

}

- (void)_prefillAuthFields
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[AKInlineSignInViewController appleIDField](self, "appleIDField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "entryField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKInlineSignInViewController context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "username");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setText:", v6);

  -[AKInlineSignInViewController context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "username");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[AKInlineSignInViewController appleIDField](self, "appleIDField");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    -[AKInlineSignInViewController context](self, "context");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setEnabled:", objc_msgSend(v9, "isUsernameEditable"));

  }
}

- (void)_updateVibrancyAndBlurInTextFields
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint8_t buf[16];

  -[AKInlineSignInViewController fieldBackgroundColor](self, "fieldBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    _AKLogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BD795000, v4, OS_LOG_TYPE_DEFAULT, "AKInlineSignInViewController - background color provided", buf, 2u);
    }

    -[AKInlineSignInViewController appleIDField](self, "appleIDField");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setUsesVibrancy:", 0);

    -[AKInlineSignInViewController passwordField](self, "passwordField");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setUsesVibrancy:", 0);

    -[AKInlineSignInViewController appleIDField](self, "appleIDField");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBlurEffectStyle:", 4);

    -[AKInlineSignInViewController passwordField](self, "passwordField");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBlurEffectStyle:", 4);

    -[AKInlineSignInViewController appleIDField](self, "appleIDField");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setFieldBackgroundColor:", self->_fieldBackgroundColor);

    -[AKInlineSignInViewController passwordField](self, "passwordField");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setFieldBackgroundColor:", self->_fieldBackgroundColor);

  }
  else
  {
    -[AKInlineSignInViewController appleIDField](self, "appleIDField");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setUsesVibrancy:", self->_usesVibrancy);

    -[AKInlineSignInViewController passwordField](self, "passwordField");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setUsesVibrancy:", self->_usesVibrancy);

    -[AKInlineSignInViewController appleIDField](self, "appleIDField");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setBlurEffectStyle:", self->_blurEffectStyle);

    -[AKInlineSignInViewController passwordField](self, "passwordField");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setBlurEffectStyle:", self->_blurEffectStyle);

  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = a3;
  -[AKInlineSignInViewController traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceStyle");
  v7 = objc_msgSend(v4, "userInterfaceStyle");

  if (v6 != v7)
    -[AKInlineSignInViewController _updateVibrancyAndBlurInTextFields](self, "_updateVibrancyAndBlurInTextFields");
}

- (void)signInButtonWasTapped:(id)a3
{
  -[AKInlineSignInViewController _beginAuthenticationIfPossibleWithOption:](self, "_beginAuthenticationIfPossibleWithOption:", 1);
}

- (void)iForgotButtonWasTapped:(id)a3
{
  void *v4;
  char v5;

  -[AKInlineSignInViewController iforgotButton](self, "iforgotButton", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isHidden");

  if ((v5 & 1) == 0)
    -[AKInlineSignInViewController _beginAuthenticationIfPossibleWithOption:](self, "_beginAuthenticationIfPossibleWithOption:", 2);
}

- (void)createAppleIDButtonWasTapped:(id)a3
{
  void *v4;
  char v5;

  -[AKInlineSignInViewController createAppleIDButton](self, "createAppleIDButton", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isHidden");

  if ((v5 & 1) == 0)
    -[AKInlineSignInViewController _beginAuthenticationIfPossibleWithOption:](self, "_beginAuthenticationIfPossibleWithOption:", 3);
}

- (void)_beginAuthenticationIfPossibleWithOption:(unint64_t)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void (**passwordRequiredCompletion)(id, void *, id);
  void *v14;
  void *v15;
  void *v16;
  id v17;

  if (self->_passwordRequiredCompletion)
  {
    -[AKInlineSignInViewController startAnimating](self, "startAnimating");
    if (a3 == 2)
    {
      v5 = -7017;
    }
    else
    {
      if (a3 != 3)
      {
        v17 = 0;
        goto LABEL_9;
      }
      v5 = -7016;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "ak_errorWithCode:", v5);
    v17 = (id)objc_claimAutoreleasedReturnValue();
LABEL_9:
    passwordRequiredCompletion = (void (**)(id, void *, id))self->_passwordRequiredCompletion;
    -[AKInlineSignInViewController passwordField](self, "passwordField");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "entryField");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "text");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    passwordRequiredCompletion[2](passwordRequiredCompletion, v16, v17);

    v6 = self->_passwordRequiredCompletion;
    self->_passwordRequiredCompletion = 0;
    goto LABEL_10;
  }
  -[AKInlineSignInViewController appleIDField](self, "appleIDField");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "entryField");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByTrimmingCharactersInSet:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKInlineSignInViewController passwordField](self, "passwordField");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "entryField");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "text");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKBaseSignInViewController _beginAuthenticationIfPossibleWithOption:withUsername:password:](self, "_beginAuthenticationIfPossibleWithOption:withUsername:password:", a3, v9, v12);

LABEL_10:
}

- (void)startAnimating
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (-[AKInlineSignInViewController wantsAuthenticationProgress](self, "wantsAuthenticationProgress"))
  {
    -[AKInlineSignInViewController spinner](self, "spinner");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "startAnimating");

    -[AKInlineSignInViewController signInButton](self, "signInButton");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setHidden:", 1);

    -[AKInlineSignInViewController _setCreateButtonHidden:](self, "_setCreateButtonHidden:", 1);
    -[AKInlineSignInViewController iforgotButton](self, "iforgotButton");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHidden:", 1);
  }
  else
  {
    -[AKInlineSignInViewController signInButton](self, "signInButton");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setEnabled:", 0);

    -[AKInlineSignInViewController _setCreateButtonEnabled:](self, "_setCreateButtonEnabled:", 0);
    -[AKInlineSignInViewController iforgotButton](self, "iforgotButton");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setEnabled:", 0);
  }

  -[AKInlineSignInViewController appleIDField](self, "appleIDField");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setEnabled:", 0);

  -[AKInlineSignInViewController passwordField](self, "passwordField");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEnabled:", 0);

}

- (void)stopAnimating
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if (-[AKInlineSignInViewController wantsAuthenticationProgress](self, "wantsAuthenticationProgress"))
  {
    -[AKInlineSignInViewController spinner](self, "spinner");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stopAnimating");

    -[AKInlineSignInViewController signInButton](self, "signInButton");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setHidden:", -[AKInlineSignInViewController isPrimaryButtonHidden](self, "isPrimaryButtonHidden"));

    -[AKInlineSignInViewController iforgotButton](self, "iforgotButton");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHidden:", 0);

    if (self->_createAppleIDAllowed)
      -[AKInlineSignInViewController _setCreateButtonHidden:](self, "_setCreateButtonHidden:", 0);
  }
  else
  {
    -[AKInlineSignInViewController _updateSignInButtonState](self, "_updateSignInButtonState");
    -[AKInlineSignInViewController _setCreateButtonEnabled:](self, "_setCreateButtonEnabled:", 1);
    -[AKInlineSignInViewController iforgotButton](self, "iforgotButton");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setEnabled:", 1);

  }
  -[AKInlineSignInViewController appleIDField](self, "appleIDField");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKInlineSignInViewController context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setEnabled:", objc_msgSend(v8, "isUsernameEditable"));

  -[AKInlineSignInViewController passwordField](self, "passwordField");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setEnabled:", 1);

}

- (void)_setPasswordFieldHidden:(BOOL)a3 animated:(BOOL)a4
{
  double v4;
  _QWORD v5[5];
  BOOL v6;
  _QWORD v7[5];
  BOOL v8;

  v4 = 0.7;
  v7[0] = MEMORY[0x1E0C809B0];
  if (!a4)
    v4 = 0.0;
  v7[1] = 3221225472;
  v7[2] = __65__AKInlineSignInViewController__setPasswordFieldHidden_animated___block_invoke;
  v7[3] = &unk_1E7678B30;
  v7[4] = self;
  v8 = a3;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __65__AKInlineSignInViewController__setPasswordFieldHidden_animated___block_invoke_2;
  v5[3] = &unk_1E7679030;
  v6 = a3;
  v5[4] = self;
  objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:completion:", v7, v5, v4);
}

void __65__AKInlineSignInViewController__setPasswordFieldHidden_animated___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "appleIDField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (*(_BYTE *)(a1 + 40))
    v4 = 3;
  else
    v4 = 0;
  objc_msgSend(v2, "setRowIdentifier:", v4);

  objc_msgSend(*(id *)(a1 + 32), "passwordField");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", *(unsigned __int8 *)(a1 + 40));

}

void __65__AKInlineSignInViewController__setPasswordFieldHidden_animated___block_invoke_2(uint64_t a1)
{
  int v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = *(unsigned __int8 *)(a1 + 40);
  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v3, "appleIDField");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "entryField");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "becomeFirstResponder");

    objc_msgSend(*(id *)(a1 + 32), "passwordField");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "entryField");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setText:", 0);
  }
  else
  {
    objc_msgSend(v3, "passwordField");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "entryField");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "becomeFirstResponder");
  }

}

- (void)_passwordFieldTapped
{
  void *v2;
  id v3;

  -[AKInlineSignInViewController passwordField](self, "passwordField");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "entryField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "becomeFirstResponder");

}

- (void)_usernameFieldTapped
{
  void *v2;
  id v3;

  -[AKInlineSignInViewController appleIDField](self, "appleIDField");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "entryField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "becomeFirstResponder");

}

- (void)_updateSignInButtonState
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  _BOOL8 v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  if (-[AKBaseSignInViewController _isSignInAllowed](self, "_isSignInAllowed"))
  {
    -[AKInlineSignInViewController appleIDField](self, "appleIDField");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "entryField");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "text");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByTrimmingCharactersInSet:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "length");

    -[AKInlineSignInViewController passwordField](self, "passwordField");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "isHidden") & 1) != 0)
    {
      v10 = 1;
    }
    else
    {
      -[AKInlineSignInViewController passwordField](self, "passwordField");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "entryField");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "text");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v15, "length") != 0;

    }
    -[AKInlineSignInViewController signInButton](self, "signInButton");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v11;
    if (v8)
      v12 = v10;
    else
      v12 = 0;
  }
  else
  {
    -[AKInlineSignInViewController signInButton](self, "signInButton");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v11;
    v12 = 0;
  }
  objc_msgSend(v11, "setEnabled:", v12);

}

- (void)_updateFonts:(id)a3
{
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
  id v14;

  objc_msgSend(MEMORY[0x1E0CEA5F0], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E0CEB558], 0, 2);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA5E8], "fontWithDescriptor:size:", v14, 0.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA5F0], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E0CEB5B8], 0, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA5E8], "fontWithDescriptor:size:", v5, 0.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKInlineSignInViewController createAppleIDButton](self, "createAppleIDButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "titleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFont:", v4);

  -[AKInlineSignInViewController iforgotButton](self, "iforgotButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "titleLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFont:", v4);

  -[AKInlineSignInViewController signInButton](self, "signInButton");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "titleLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFont:", v6);

  -[AKInlineSignInViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setNeedsUpdateConstraints");

}

- (void)setUsesVibrancy:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  _DWORD v6[2];
  uint64_t v7;

  v3 = a3;
  v7 = *MEMORY[0x1E0C80C00];
  self->_usesVibrancy = a3;
  _AKLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = v3;
    _os_log_impl(&dword_1BD795000, v5, OS_LOG_TYPE_DEFAULT, "AKInlineSignInViewController - setUsesVibrancy %d", (uint8_t *)v6, 8u);
  }

  -[AKInlineSignInViewController _updateVibrancyAndBlurInTextFields](self, "_updateVibrancyAndBlurInTextFields");
}

- (BOOL)usesVibrancy
{
  return self->_usesVibrancy;
}

- (void)setBlurEffectStyle:(int64_t)a3
{
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  self->_blurEffectStyle = a3;
  _AKLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_1BD795000, v5, OS_LOG_TYPE_DEFAULT, "AKInlineSignInViewController - setBlurEffectStyle %@", (uint8_t *)&v7, 0xCu);

  }
  -[AKInlineSignInViewController _updateVibrancyAndBlurInTextFields](self, "_updateVibrancyAndBlurInTextFields");
}

- (int64_t)blurEffectStyle
{
  return self->_blurEffectStyle;
}

- (void)setFieldBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_fieldBackgroundColor, a3);
  -[AKInlineSignInViewController _updateVibrancyAndBlurInTextFields](self, "_updateVibrancyAndBlurInTextFields");
}

- (id)_userFriendlyUsername:(id)a3
{
  id v3;
  id v4;
  void *v5;

  v3 = a3;
  if ((objc_msgSend(v3, "containsString:", CFSTR("@")) & 1) != 0)
  {
    v4 = v3;
  }
  else
  {
    v5 = (void *)objc_opt_new();
    objc_msgSend(v5, "displayFormatFor:", v3);
    v4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (void)context:(id)a3 needsPasswordWithCompletion:(id)a4
{
  void *v5;
  id passwordRequiredCompletion;

  v5 = (void *)MEMORY[0x1C3B760D8](a4, a2, a3);
  passwordRequiredCompletion = self->_passwordRequiredCompletion;
  self->_passwordRequiredCompletion = v5;

  -[AKInlineSignInViewController stopAnimating](self, "stopAnimating");
  -[AKInlineSignInViewController _setPasswordFieldHidden:animated:](self, "_setPasswordFieldHidden:animated:", 0, 1);
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  dispatch_time_t v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  BOOL v26;
  void *v27;
  char v28;
  dispatch_time_t v29;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _QWORD v35[5];
  _QWORD block[5];

  v4 = a3;
  -[AKInlineSignInViewController appleIDField](self, "appleIDField");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "entryField");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isEqual:", v6);

  if (v7)
  {
    -[AKInlineSignInViewController appleIDField](self, "appleIDField");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "entryField");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "text");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[AKInlineSignInViewController _userFriendlyUsername:](self, "_userFriendlyUsername:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKInlineSignInViewController appleIDField](self, "appleIDField");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "entryField");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setText:", v11);

    -[AKInlineSignInViewController appleIDField](self, "appleIDField");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "entryField");
    v15 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v15, "resignFirstResponder");

    -[AKInlineSignInViewController passwordField](self, "passwordField");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v15) = objc_msgSend(v16, "isHidden");

    if ((v15 & 1) != 0)
    {
      v17 = dispatch_time(0, 500000000);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __54__AKInlineSignInViewController_textFieldShouldReturn___block_invoke;
      block[3] = &unk_1E76789A0;
      block[4] = self;
      dispatch_after(v17, MEMORY[0x1E0C80D38], block);
    }
    else
    {
      -[AKInlineSignInViewController passwordField](self, "passwordField");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "entryField");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "becomeFirstResponder");

    }
    goto LABEL_9;
  }
  -[AKInlineSignInViewController passwordField](self, "passwordField");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "entryField");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v4, "isEqual:", v19);

  if (!v20)
  {
LABEL_12:
    v26 = 1;
    goto LABEL_13;
  }
  -[AKInlineSignInViewController appleIDField](self, "appleIDField");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "entryField");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "text");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v23, "length"))
  {

LABEL_11:
    v29 = dispatch_time(0, 500000000);
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __54__AKInlineSignInViewController_textFieldShouldReturn___block_invoke_2;
    v35[3] = &unk_1E76789A0;
    v35[4] = self;
    dispatch_after(v29, MEMORY[0x1E0C80D38], v35);
    goto LABEL_12;
  }
  -[AKInlineSignInViewController appleIDField](self, "appleIDField");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "isHidden");

  if ((v28 & 1) != 0)
    goto LABEL_11;
  -[AKInlineSignInViewController passwordField](self, "passwordField");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "entryField");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "resignFirstResponder");

  -[AKInlineSignInViewController appleIDField](self, "appleIDField");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "entryField");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "becomeFirstResponder");

LABEL_9:
  v26 = 0;
LABEL_13:

  return v26;
}

void __54__AKInlineSignInViewController_textFieldShouldReturn___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "signInButton");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "signInButtonWasTapped:", v2);

}

void __54__AKInlineSignInViewController_textFieldShouldReturn___block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "signInButton");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "signInButtonWasTapped:", v2);

}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  int v16;
  _BOOL4 v17;
  void (**passwordRequiredCompletion)(id, _QWORD, void *);
  void *v19;

  length = a4.length;
  location = a4.location;
  v9 = a3;
  v10 = a5;
  -[AKInlineSignInViewController appleIDField](self, "appleIDField");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "entryField");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "isEqual:", v12) & 1) == 0)
    goto LABEL_4;
  -[AKInlineSignInViewController passwordField](self, "passwordField");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "isHidden"))
  {

LABEL_4:
LABEL_5:

    goto LABEL_6;
  }
  objc_msgSend(v9, "text");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isEqualToString:", v10);
  v17 = (location | length) != 0;

  if (!v16 && v17)
  {
    -[AKInlineSignInViewController _setPasswordFieldHidden:animated:](self, "_setPasswordFieldHidden:animated:", 1, 0);
    passwordRequiredCompletion = (void (**)(id, _QWORD, void *))self->_passwordRequiredCompletion;
    if (passwordRequiredCompletion)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "ak_errorWithCode:", -7003);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      passwordRequiredCompletion[2](passwordRequiredCompletion, 0, v19);

      v11 = self->_passwordRequiredCompletion;
      self->_passwordRequiredCompletion = 0;
      goto LABEL_5;
    }
  }
LABEL_6:

  return 1;
}

- (BOOL)wantsAuthenticationProgress
{
  return self->_wantsAuthenticationProgress;
}

- (void)setWantsAuthenticationProgress:(BOOL)a3
{
  self->_wantsAuthenticationProgress = a3;
}

- (NSString)primaryButtonTitle
{
  return self->_primaryButtonTitle;
}

- (UIColor)fieldBackgroundColor
{
  return self->_fieldBackgroundColor;
}

- (UIColor)entryDescriptionTextColor
{
  return self->_entryDescriptionTextColor;
}

- (void)setEntryDescriptionTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_entryDescriptionTextColor, a3);
}

- (UIColor)entryFieldTextColor
{
  return self->_entryFieldTextColor;
}

- (void)setEntryFieldTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_entryFieldTextColor, a3);
}

- (BOOL)isPrimaryButtonHidden
{
  return self->_primaryButtonHidden;
}

- (void)setPrimaryButtonHidden:(BOOL)a3
{
  self->_primaryButtonHidden = a3;
}

- (BOOL)shouldPromptForPasswordOnly
{
  return self->_shouldPromptForPasswordOnly;
}

- (void)setShouldPromptForPasswordOnly:(BOOL)a3
{
  self->_shouldPromptForPasswordOnly = a3;
}

- (UIView)loginFieldsContainer
{
  return self->_loginFieldsContainer;
}

- (void)setLoginFieldsContainer:(id)a3
{
  objc_storeStrong((id *)&self->_loginFieldsContainer, a3);
}

- (AKTextField)appleIDField
{
  return self->_appleIDField;
}

- (void)setAppleIDField:(id)a3
{
  objc_storeStrong((id *)&self->_appleIDField, a3);
}

- (AKTextField)passwordField
{
  return self->_passwordField;
}

- (void)setPasswordField:(id)a3
{
  objc_storeStrong((id *)&self->_passwordField, a3);
}

- (UIButton)signInButton
{
  return self->_signInButton;
}

- (void)setSignInButton:(id)a3
{
  objc_storeStrong((id *)&self->_signInButton, a3);
}

- (UIButton)iforgotButton
{
  return self->_iforgotButton;
}

- (void)setIforgotButton:(id)a3
{
  objc_storeStrong((id *)&self->_iforgotButton, a3);
}

- (UIButton)createAppleIDButton
{
  return self->_createAppleIDButton;
}

- (void)setCreateAppleIDButton:(id)a3
{
  objc_storeStrong((id *)&self->_createAppleIDButton, a3);
}

- (UIActivityIndicatorView)spinner
{
  return self->_spinner;
}

- (void)setSpinner:(id)a3
{
  objc_storeStrong((id *)&self->_spinner, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_createAppleIDButton, 0);
  objc_storeStrong((id *)&self->_iforgotButton, 0);
  objc_storeStrong((id *)&self->_signInButton, 0);
  objc_storeStrong((id *)&self->_passwordField, 0);
  objc_storeStrong((id *)&self->_appleIDField, 0);
  objc_storeStrong((id *)&self->_loginFieldsContainer, 0);
  objc_storeStrong((id *)&self->_entryFieldTextColor, 0);
  objc_storeStrong((id *)&self->_entryDescriptionTextColor, 0);
  objc_storeStrong((id *)&self->_fieldBackgroundColor, 0);
  objc_storeStrong((id *)&self->_primaryButtonTitle, 0);
  objc_storeStrong(&self->_passwordRequiredCompletion, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_tertiaryButtonTitle, 0);
  objc_storeStrong((id *)&self->_secondaryButtonTitle, 0);
}

- (void)setUsesDarkMode:(BOOL)a3
{
  int64_t v3;

  if (self->_usesDarkMode != a3)
  {
    self->_usesDarkMode = a3;
    self->_usesVibrancy = a3;
    if (a3)
      v3 = 2;
    else
      v3 = 1;
    self->_blurEffectStyle = v3;
    -[AKInlineSignInViewController _updateVibrancyAndBlurInTextFields](self, "_updateVibrancyAndBlurInTextFields");
  }
}

- (BOOL)usesDarkMode
{
  return self->_usesDarkMode;
}

@end
