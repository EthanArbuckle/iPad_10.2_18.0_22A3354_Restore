@implementation CNFRegSignInController

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)CNFRegSignInController;
  -[CNFRegFirstRunController dealloc](&v4, sel_dealloc);
}

- (id)specifierList
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  objc_class *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _BOOL4 v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  void *v39;
  int v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  const __CFString *v47;
  void *v48;
  void *v49;
  NSUInteger v50;
  NSUInteger v51;
  NSUInteger v52;
  objc_class *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  PSSpecifier *createAccountButtonSpecifier;
  void *v60;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  uint8_t buf[16];
  NSRange v71;
  NSRange v72;

  v69 = (int)*MEMORY[0x24BE756E0];
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v69);
  if (!v3)
  {
    v4 = _os_feature_enabled_impl();
    -[CNFRegListController regController](self, "regController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "refreshSystemAccount");

    -[CNFRegListController regController](self, "regController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "hasSystemAccount");

    if (v7)
    {
      OSLogHandleForIDSCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2138BA000, v8, OS_LOG_TYPE_DEFAULT, "We have a system account available, using it", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
        IMLogString();
      self->_useSystemAccount = 1;
    }
    CNFRegLoadSpecifiersFromPlist(self, CFSTR("CNFRegSignIn"), self);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "specifierForID:", CFSTR("FACETIME_SIGNIN_USERNAME_ID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    CommunicationsSetupUIBundle();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    CNFRegStringTableName();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      v13 = CFSTR("FACETIME_USERNAME_DESCRIPTION_LABEL_APPLEACCOUNT");
    else
      v13 = CFSTR("FACETIME_USERNAME_DESCRIPTION_LABEL");
    if (v4)
      v14 = CFSTR("FACETIME_SIGNIN_FORGOT_BUTTON_LABEL_APPLEACCOUNT");
    else
      v14 = CFSTR("FACETIME_SIGNIN_FORGOT_BUTTON_LABEL");
    objc_msgSend(v11, "localizedStringForKey:value:table:", v13, &stru_24D077260, v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setName:", v15);

    objc_msgSend(v9, "specifierForID:", CFSTR("FACETIME_SIGNIN_PASSWORD_ID"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    CommunicationsSetupUIBundle();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    CNFRegStringTableName();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("FACETIME_PASSWORD_DESCRIPTION_LABEL"), &stru_24D077260, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setName:", v19);

    objc_msgSend(v9, "specifierForID:", CFSTR("FACETIME_SIGNIN_BUTTON_GROUP_ID"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    CommunicationsSetupUIBundle();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    CNFRegStringTableName();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "localizedStringForKey:value:table:", v14, &stru_24D077260, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = (objc_class *)objc_opt_class();
    NSStringFromClass(v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = *MEMORY[0x24BE75A30];
    objc_msgSend(v20, "setProperty:forKey:", v25);

    v66 = *MEMORY[0x24BE75A58];
    objc_msgSend(v20, "setProperty:forKey:", v23);
    CNFRegiForgotURL();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = *MEMORY[0x24BE75A60];
    objc_msgSend(v20, "setProperty:forKey:", v26);

    v68 = v23;
    v71.length = objc_msgSend(v23, "length");
    v71.location = 0;
    NSStringFromRange(v71);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = *MEMORY[0x24BE75A40];
    objc_msgSend(v20, "setProperty:forKey:", v27);

    objc_msgSend(MEMORY[0x24BDD1968], "valueWithNonretainedObject:", self);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = *MEMORY[0x24BE75A50];
    objc_msgSend(v20, "setProperty:forKey:", v28);

    -[CNFRegListController regController](self, "regController");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v29, "hasSystemAccount") & 1) != 0)
    {
      v30 = 1;
    }
    else
    {
      -[CNFRegListController regController](self, "regController");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "guessedAccountName");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v32 != 0;

    }
    objc_msgSend(v9, "specifierForID:", CFSTR("FACETIME_SIGNIN_CREATE_ACCOUNT_ID"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (v33)
      v34 = v4;
    else
      v34 = 0;
    if (v34 == 1)
    {
      CommunicationsSetupUIBundle();
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      CNFRegStringTableName();
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "localizedStringForKey:value:table:", CFSTR("FACETIME_SIGNIN_CREATE_ACCOUNT_BUTTON_LABEL_APPLEACCOUNT"), &stru_24D077260, v36);
      v37 = v4;
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v33, "setProperty:forKey:", v38, *MEMORY[0x24BE75D50]);
      objc_msgSend(v33, "setName:", v38);

      v4 = v37;
    }
    objc_msgSend(v9, "specifierForID:", CFSTR("FACETIME_SIGNIN_CREATE_ACCOUNT_GROUP_ID"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (v30)
    {
      objc_msgSend(v9, "removeObject:", v39);

      objc_msgSend(v9, "specifierForID:", CFSTR("FACETIME_SIGNIN_CREATE_ACCOUNT_ID"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "removeObject:", v39);
    }
    else
    {
      CommunicationsSetupUIBundle();
      v62 = v33;
      v40 = v4;
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      CNFRegStringTableName();
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "localizedStringForKey:value:table:", CFSTR("FACETIME_SIGNIN_CREATE_ACCOUNT_FOOTER_LEARN_MORE"), &stru_24D077260, v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();

      v44 = (void *)MEMORY[0x24BDD17C8];
      CommunicationsSetupUIBundle();
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      CNFRegStringTableName();
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      if (v40)
        v47 = CFSTR("FACETIME_SIGNIN_CREATE_ACCOUNT_FOOTER_FORMAT_APPLEACCOUNT");
      else
        v47 = CFSTR("FACETIME_SIGNIN_CREATE_ACCOUNT_FOOTER_FORMAT");
      objc_msgSend(v45, "localizedStringForKey:value:table:", v47, &stru_24D077260, v46);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "stringWithFormat:", v48, v43);
      v49 = (void *)objc_claimAutoreleasedReturnValue();

      v33 = v62;
      v50 = objc_msgSend(v49, "rangeOfString:", v43);
      v52 = v51;
      v53 = (objc_class *)objc_opt_class();
      NSStringFromClass(v53);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "setProperty:forKey:", v54, v67);

      objc_msgSend(v39, "setProperty:forKey:", v49, v66);
      CNFRegAppleIDLearnMoreURL();
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "setProperty:forKey:", v55, v65);

      v72.location = v50;
      v72.length = v52;
      NSStringFromRange(v72);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "setProperty:forKey:", v56, v64);

      objc_msgSend(MEMORY[0x24BDD1968], "valueWithNonretainedObject:", self);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "setProperty:forKey:", v57, v63);

    }
    -[CNFRegSignInController _buildSpecifierCache:](self, "_buildSpecifierCache:", v9);
    -[CNFRegSignInController presentingViewController](self, "presentingViewController");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    if (v58)
    {
      createAccountButtonSpecifier = self->_createAccountButtonSpecifier;

      if (createAccountButtonSpecifier)
        *(_QWORD *)((char *)self->_createAccountButtonSpecifier + (int)*MEMORY[0x24BE75738]) = 2;
    }
    v60 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v69);
    *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v69) = (Class)v9;

    -[CNFRegFirstRunController _stopValidationModeAnimated:](self, "_stopValidationModeAnimated:", 0);
    v3 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v69);
  }
  return v3;
}

- (void)loadView
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CNFRegSignInController;
  -[CNFRegListController loadView](&v3, sel_loadView);
  -[CNFRegSignInController _layoutLearnMoreButton](self, "_layoutLearnMoreButton");
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CNFRegSignInController;
  -[CNFRegSignInController viewDidLoad](&v4, sel_viewDidLoad);
  -[CNFRegSignInController table](self, "table");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setShowsVerticalScrollIndicator:", 0);

}

- (void)setHideLearnMoreButton:(BOOL)a3
{
  if (self->_hideLearnMoreButton != a3)
  {
    self->_hideLearnMoreButton = a3;
    if (-[CNFRegSignInController isViewLoaded](self, "isViewLoaded"))
      -[CNFRegSignInController _layoutLearnMoreButton](self, "_layoutLearnMoreButton");
  }
}

- (void)_layoutLearnMoreButton
{
  CNFRegLearnMoreButton *learnMoreButton;
  void *v4;
  CNFRegLearnMoreButton *v5;
  CNFRegLearnMoreButton *v6;
  CNFRegLearnMoreButton *v7;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double MidX;
  double MaxY;
  CGRect v19;
  CGRect v20;
  CGRect v21;

  learnMoreButton = self->_learnMoreButton;
  if (learnMoreButton)
  {
    if (!self->_hideLearnMoreButton)
      goto LABEL_7;
    -[CNFRegLearnMoreButton removeTarget:forEvents:](learnMoreButton, "removeTarget:forEvents:", self, 64);
    -[CNFRegLearnMoreButton removeFromSuperview](self->_learnMoreButton, "removeFromSuperview");
    v4 = self->_learnMoreButton;
    self->_learnMoreButton = 0;
  }
  else
  {
    if (self->_hideLearnMoreButton)
      goto LABEL_7;
    v5 = [CNFRegLearnMoreButton alloc];
    v6 = -[CNFRegLearnMoreButton initWithFrame:style:](v5, "initWithFrame:style:", 0, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    v7 = self->_learnMoreButton;
    self->_learnMoreButton = v6;

    -[CNFRegLearnMoreButton setAutoresizingMask:](self->_learnMoreButton, "setAutoresizingMask:", 13);
    -[CNFRegLearnMoreButton addTarget:action:forEvents:](self->_learnMoreButton, "addTarget:action:forEvents:", self, sel_learnMorePressed_, 64);
    -[CNFRegSignInController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addSubview:", self->_learnMoreButton);
  }

LABEL_7:
  if (!self->_hideLearnMoreButton)
  {
    if (self->_learnMoreButton)
    {
      -[CNFRegSignInController view](self, "view");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "bounds");
      v10 = v9;
      v12 = v11;
      v14 = v13;
      v16 = v15;

      -[CNFRegLearnMoreButton sizeToFit](self->_learnMoreButton, "sizeToFit");
      v19.origin.x = v10;
      v19.origin.y = v12;
      v19.size.width = v14;
      v19.size.height = v16;
      MidX = CGRectGetMidX(v19);
      v20.origin.x = v10;
      v20.origin.y = v12;
      v20.size.width = v14;
      v20.size.height = v16;
      MaxY = CGRectGetMaxY(v20);
      -[CNFRegLearnMoreButton bounds](self->_learnMoreButton, "bounds");
      -[CNFRegLearnMoreButton setCenter:](self->_learnMoreButton, "setCenter:", MidX, MaxY + CGRectGetHeight(v21) * -0.5 + -17.0);
    }
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CNFRegSignInController;
  -[CNFRegFirstRunController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[CNFRegSignInController _updateUI](self, "_updateUI");
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CNFRegSignInController;
  -[CNFRegFirstRunController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[CNFRegSignInController _updateUI](self, "_updateUI");
  -[CNFRegListController _showWiFiAlertIfNecessary](self, "_showWiFiAlertIfNecessary");
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CNFRegSignInController;
  -[CNFRegFirstRunController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  -[CNFRegSignInController _resignFirstResponders](self, "_resignFirstResponders");
}

- (void)setSpecifier:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  objc_super v8;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CNFRegSignInController;
  -[CNFRegFirstRunController setSpecifier:](&v8, sel_setSpecifier_, v4);
  objc_msgSend(v4, "propertyForKey:", CFSTR("cnf-hideLearnMoreButton"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    OSLogHandleForIDSCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v10 = v5;
      _os_log_impl(&dword_2138BA000, v6, OS_LOG_TYPE_DEFAULT, "Setting hide learn more button to : %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    {
      v7 = v5;
      IMLogString();
    }
    -[CNFRegSignInController setHideLearnMoreButton:](self, "setHideLearnMoreButton:", objc_msgSend(v5, "BOOLValue", v7));
  }

}

- (void)systemApplicationWillEnterForeground
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CNFRegSignInController;
  -[CNFRegFirstRunController systemApplicationWillEnterForeground](&v3, sel_systemApplicationWillEnterForeground);
  -[CNFRegSignInController _updateUI](self, "_updateUI");
}

- (void)systemApplicationDidEnterBackground
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CNFRegSignInController;
  -[CNFRegFirstRunController systemApplicationDidEnterBackground](&v2, sel_systemApplicationDidEnterBackground);
}

- (void)applicationDidResume
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[CNFRegFirstRunController account](self, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[CNFRegListController regController](self, "regController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accounts");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNFRegFirstRunController setAccount:](self, "setAccount:", v6);

  }
  -[CNFRegSignInController _updateControllerState](self, "_updateControllerState");
}

- (id)_rightButtonItem
{
  return 0;
}

- (id)logName
{
  return CFSTR("Signin");
}

- (id)validationString
{
  void *v2;
  void *v3;
  void *v4;

  CommunicationsSetupUIBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  CNFRegStringTableName();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("SIGNING_IN"), &stru_24D077260, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_resignFirstResponders
{
  void *v3;
  id v4;

  -[CNFRegSignInController usernameTextField](self, "usernameTextField");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CNFRegSignInController passwordTextField](self, "passwordTextField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isFirstResponder"))
    objc_msgSend(v4, "resignFirstResponder");
  if (objc_msgSend(v3, "isFirstResponder"))
    objc_msgSend(v3, "resignFirstResponder");

}

- (id)getUserNameForSpecifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (self->_useSystemAccount)
  {
    -[CNFRegListController regController](self, "regController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "systemAccount");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    OSLogHandleForIDSCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v6;
      _os_log_impl(&dword_2138BA000, v7, OS_LOG_TYPE_DEFAULT, "Using system account for username field: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    {
      v13 = v6;
      IMLogString();
    }
    -[CNFRegListController regController](self, "regController", v13);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "loginForAccount:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9 || !objc_msgSend(v9, "length"))
    {
      OSLogHandleForIDSCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v15 = v6;
        _os_log_impl(&dword_2138BA000, v10, OS_LOG_TYPE_DEFAULT, "** WARNING ** We are using a system account but it has no login: %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
        IMLogString();
    }

  }
  else
  {
    -[CNFRegSignInController pendingUsername](self, "pendingUsername");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      -[CNFRegListController regController](self, "regController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "guessedAccountName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v9;
}

- (id)getPasswordForSpecifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  void *v10;

  v4 = a3;
  if (self->_useSystemAccount)
  {
    -[CNFRegListController regController](self, "regController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "systemAccount");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNFRegListController regController](self, "regController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "loginForAccount:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      if (objc_msgSend(v8, "length"))
        v9 = CFSTR("•••••••");
      else
        v9 = 0;
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  -[CNFRegSignInController pendingPassword](self, "pendingPassword");
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    -[CNFRegSignInController getUserNameForSpecifier:](self, "getUserNameForSpecifier:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNFRegListController regController](self, "regController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "accountWithLogin:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v8, "password");
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_10:

      goto LABEL_11;
    }
LABEL_9:
    v9 = 0;
    goto LABEL_10;
  }
LABEL_11:

  return v9;
}

- (id)usernameTextField
{
  void *v2;
  void *v3;

  -[CNFRegSignInController cachedCellForSpecifier:](self, "cachedCellForSpecifier:", self->_usernameSpecifier);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "editableTextField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setUsernameText:(id)a3
{
  PSSpecifier *usernameSpecifier;
  id v5;
  void *v6;
  id v7;

  usernameSpecifier = self->_usernameSpecifier;
  v5 = a3;
  -[CNFRegSignInController cachedCellForSpecifier:](self, "cachedCellForSpecifier:", usernameSpecifier);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "editableTextField");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v5);

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "textFieldChangedExternally");

}

- (BOOL)usernameIsEmpty
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  -[CNFRegSignInController usernameTextField](self, "usernameTextField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[CNFRegSignInController getUserNameForSpecifier:](self, "getUserNameForSpecifier:", self->_usernameSpecifier);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      goto LABEL_3;
LABEL_5:
    v6 = 1;
    goto LABEL_6;
  }
  -[CNFRegSignInController usernameTextField](self, "usernameTextField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    goto LABEL_5;
LABEL_3:
  v6 = objc_msgSend(v5, "length") == 0;
LABEL_6:

  return v6;
}

- (id)passwordTextField
{
  void *v2;
  void *v3;

  -[CNFRegSignInController cachedCellForSpecifier:](self, "cachedCellForSpecifier:", self->_passwordSpecifier);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "editableTextField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setPasswordText:(id)a3
{
  PSSpecifier *passwordSpecifier;
  id v5;
  void *v6;
  id v7;

  passwordSpecifier = self->_passwordSpecifier;
  v5 = a3;
  -[CNFRegSignInController cachedCellForSpecifier:](self, "cachedCellForSpecifier:", passwordSpecifier);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "editableTextField");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v5);

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "textFieldChangedExternally");

}

- (BOOL)passwordIsEmpty
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  -[CNFRegSignInController passwordTextField](self, "passwordTextField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[CNFRegSignInController getPasswordForSpecifier:](self, "getPasswordForSpecifier:", self->_passwordSpecifier);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      goto LABEL_3;
LABEL_5:
    v6 = 1;
    goto LABEL_6;
  }
  -[CNFRegSignInController passwordTextField](self, "passwordTextField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    goto LABEL_5;
LABEL_3:
  v6 = objc_msgSend(v5, "length") == 0;
LABEL_6:

  return v6;
}

- (void)usernameFieldEmptyStateChanged:(id)a3 forSpecifier:(id)a4
{
  _BOOL8 v5;

  v5 = (objc_msgSend(a3, "BOOLValue") & 1) == 0 && !-[CNFRegSignInController passwordIsEmpty](self, "passwordIsEmpty");
  -[CNFRegSignInController setSignInButtonEnabled:animated:](self, "setSignInButtonEnabled:animated:", v5, 1);
}

- (void)passwordFieldEmptyStateChanged:(id)a3 forSpecifier:(id)a4
{
  _BOOL8 v5;

  v5 = (objc_msgSend(a3, "BOOLValue") & 1) == 0 && !-[CNFRegSignInController usernameIsEmpty](self, "usernameIsEmpty");
  -[CNFRegSignInController setSignInButtonEnabled:animated:](self, "setSignInButtonEnabled:animated:", v5, 1);
}

- (void)__userTappedTextField
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  if (self->_useSystemAccount)
  {
    OSLogHandleForIDSCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_2138BA000, v3, OS_LOG_TYPE_DEFAULT, "User tapped a text field and we were using a system account, clearing password and going to normal mode", v5, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (IMShouldLog())
        IMLogString();
    }
    self->_useSystemAccount = 0;
    -[CNFRegSignInController passwordTextField](self, "passwordTextField");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setClearsOnBeginEditing:", 0);

    -[CNFRegSignInController setPasswordText:](self, "setPasswordText:", 0);
  }
}

- (void)showCreateAccountController
{
  NSObject *v3;
  CNFRegCreateAccountController *v4;
  void *v5;
  CNFRegCreateAccountController *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint8_t v14[16];

  if (!-[CNFRegListController _showWiFiAlertIfNecessary](self, "_showWiFiAlertIfNecessary"))
  {
    OSLogHandleForIDSCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_2138BA000, v3, OS_LOG_TYPE_DEFAULT, "Show create account controller", v14, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (IMShouldLog())
        IMLogString();
    }
    -[CNFRegListController setShowingChildController:](self, "setShowingChildController:", 1);
    -[CNFRegSignInController _resignFirstResponders](self, "_resignFirstResponders");
    v4 = [CNFRegCreateAccountController alloc];
    -[CNFRegListController regController](self, "regController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[CNFRegAccountWebViewController initWithRegController:](v4, "initWithRegController:", v5);

    -[CNFRegCreateAccountController setDelegate:](v6, "setDelegate:", self);
    -[CNFRegCreateAccountController setEdgesForExtendedLayout:](v6, "setEdgesForExtendedLayout:", 0);
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD7A0]), "initWithRootViewController:", v6);
    +[CNFRegAppearanceController globalAppearanceController](CNFRegAppearanceController, "globalAppearanceController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setModalPresentationStyle:", objc_msgSend(v8, "modalPresentationStyle"));
    v9 = objc_msgSend(v8, "navigationBarStyle");
    objc_msgSend(v7, "navigationBar");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setBarStyle:", v9);

    v11 = objc_msgSend(v8, "navigationBarIsTranslucent");
    objc_msgSend(v7, "navigationBar");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTranslucent:", v11);

    -[CNFRegSignInController navigationController](self, "navigationController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "presentViewController:animated:completion:", v7, 1, 0);

  }
}

- (void)forgotIDButtonTapped
{
  if (!-[CNFRegListController _showWiFiAlertIfNecessary](self, "_showWiFiAlertIfNecessary"))
    -[CNFRegSignInController _launchForgotPasswordUrl](self, "_launchForgotPasswordUrl");
}

- (void)createAccountControllerDidFinish:(id)a3 withAppleId:(id)a4 authID:(id)a5 authToken:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  int v14;
  uint64_t v15;
  id v16;
  NSObject *v17;
  void (**v18)(_QWORD);
  id v19;
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  CNFRegSignInController *v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (v11)
  {
    -[CNFRegSignInController setUsernameText:](self, "setUsernameText:", v11);
    v14 = 0;
    if (v12 && v13)
    {
      -[CNFRegSignInController setPasswordText:](self, "setPasswordText:", 0);
      v14 = 1;
    }
  }
  else
  {
    v14 = 0;
  }
  v15 = MEMORY[0x24BDAC760];
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __88__CNFRegSignInController_createAccountControllerDidFinish_withAppleId_authID_authToken___block_invoke;
  v26[3] = &unk_24D075680;
  v16 = v10;
  v27 = v16;
  v28 = self;
  -[CNFRegFirstRunController _executeDismissBlock:](self, "_executeDismissBlock:", v26);
  if (v14)
  {
    OSLogHandleForIDSCategory();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v30 = v11;
      v31 = 2112;
      v32 = v12;
      v33 = 2112;
      v34 = v13;
      _os_log_impl(&dword_2138BA000, v17, OS_LOG_TYPE_DEFAULT, "Signing in with username (new account): %@  profileID: %@ token: %@", buf, 0x20u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    {
      v20 = v12;
      v21 = v13;
      v19 = v11;
      IMLogString();
    }
    -[CNFRegSignInController setPendingUsername:](self, "setPendingUsername:", v11, v19, v20, v21);
    -[CNFRegSignInController setPendingPassword:](self, "setPendingPassword:", 0);
    v22[0] = v15;
    v22[1] = 3221225472;
    v22[2] = __88__CNFRegSignInController_createAccountControllerDidFinish_withAppleId_authID_authToken___block_invoke_118;
    v22[3] = &unk_24D075D60;
    v22[4] = self;
    v23 = v11;
    v24 = v12;
    v25 = v13;
    v18 = (void (**)(_QWORD))MEMORY[0x2199B8E98](v22);
    if (-[CNFRegListController appeared](self, "appeared"))
      v18[2](v18);
    else
      -[CNFRegListController setAppearBlock:](self, "setAppearBlock:", v18);

  }
}

uint64_t __88__CNFRegSignInController_createAccountControllerDidFinish_withAppleId_authID_authToken___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setDelegate:", 0);
  return objc_msgSend(*(id *)(a1 + 40), "dismissViewControllerAnimated:completion:", 1, 0);
}

uint64_t __88__CNFRegSignInController_createAccountControllerDidFinish_withAppleId_authID_authToken___block_invoke_118(uint64_t a1)
{
  void *v2;
  void *v3;
  char v5;

  v5 = 0;
  objc_msgSend(*(id *)(a1 + 32), "_startValidationModeAnimated:", 0);
  objc_msgSend(*(id *)(a1 + 32), "regController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "beginAccountSetupWithLogin:authID:authToken:regionInfo:foundExisting:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), 0, &v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setAccount:", v3);

  if (!v5)
    objc_msgSend(*(id *)(a1 + 32), "_resetSigninFailureCount");
  objc_msgSend(*(id *)(a1 + 32), "_startTimeout");
  return objc_msgSend(*(id *)(a1 + 32), "_loadRegionsIfNecessary");
}

- (void)_updateUI
{
  _BOOL8 v3;

  if (!self->super._showingActivityIndicator)
  {
    v3 = !-[CNFRegSignInController passwordIsEmpty](self, "passwordIsEmpty")
      && !-[CNFRegSignInController usernameIsEmpty](self, "usernameIsEmpty");
    -[CNFRegSignInController setSignInButtonEnabled:animated:](self, "setSignInButtonEnabled:animated:", v3, 0);
  }
  -[CNFRegSignInController _layoutLearnMoreButton](self, "_layoutLearnMoreButton");
}

- (void)_updateControllerState
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  __objc2_class *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CNFRegSignInController;
  -[CNFRegFirstRunController _updateControllerState](&v14, sel__updateControllerState);
  -[CNFRegListController regController](self, "regController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNFRegFirstRunController account](self, "account");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "accountStateForAccount:", v4);

  if ((v5 & 1) != 0)
  {
    -[CNFRegSignInController navigationController](self, "navigationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "visibleViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if ((v5 & 2) != 0)
    {
      if ((v5 & 4) != 0)
      {
        if (-[CNFRegFirstRunController pushCompletionControllerIfPossible](self, "pushCompletionControllerIfPossible"))
          v13 = 1;
        else
          v13 = -[CNFRegFirstRunController dismissWithState:](self, "dismissWithState:", v5);
        CNFAssert(v13, 7, CFSTR("Finished signin but no action was taken"));
        goto LABEL_13;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v8 = CNFRegEmailController;
        goto LABEL_8;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v8 = CNFRegLocaleController;
LABEL_8:
        v9 = [v8 alloc];
        -[CNFRegFirstRunController account](self, "account");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)objc_msgSend(v9, "initWithParentController:account:", self, v10);

        objc_msgSend(v11, "setCompletionControllerClass:", -[CNFRegFirstRunController completionControllerClass](self, "completionControllerClass"));
        -[CNFRegFirstRunController delegate](self, "delegate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setDelegate:", v12);

        -[CNFRegSignInController showController:animate:](self, "showController:animate:", v11, 1);
      }
    }
LABEL_13:

  }
}

- (void)_setFieldsEnabled:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  _BOOL8 v7;
  objc_super v8;

  v4 = a4;
  v5 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CNFRegSignInController;
  -[CNFRegListController _setFieldsEnabled:animated:](&v8, sel__setFieldsEnabled_animated_);
  -[CNFRegSignInController setUsernameEnabled:animated:](self, "setUsernameEnabled:animated:", v5, v4);
  -[CNFRegSignInController setPasswordEnabled:animated:](self, "setPasswordEnabled:animated:", v5, v4);
  -[CNFRegSignInController setCreateAccountButtonEnabled:animated:](self, "setCreateAccountButtonEnabled:animated:", v5, v4);
  v7 = v5
    && !-[CNFRegSignInController passwordIsEmpty](self, "passwordIsEmpty")
    && !-[CNFRegSignInController usernameIsEmpty](self, "usernameIsEmpty");
  -[CNFRegSignInController setSignInButtonEnabled:animated:](self, "setSignInButtonEnabled:animated:", v7, v4);
}

- (void)_finishSignInWithAccount:(id)a3 animated:(BOOL)a4
{
  -[CNFRegFirstRunController _stopValidationModeAnimated:](self, "_stopValidationModeAnimated:", 1, a4);
  -[CNFRegSignInController _updateControllerState](self, "_updateControllerState");
}

- (void)_returnKeyPressed
{
  void *v3;
  int v4;
  id v5;

  if (!-[CNFRegSignInController usernameIsEmpty](self, "usernameIsEmpty"))
  {
    if (-[CNFRegSignInController passwordIsEmpty](self, "passwordIsEmpty"))
    {
      -[CNFRegSignInController usernameTextField](self, "usernameTextField");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v3, "isFirstResponder");

      if (v4)
      {
        -[CNFRegSignInController passwordTextField](self, "passwordTextField");
        v5 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "becomeFirstResponder");

      }
    }
    else
    {
      -[CNFRegSignInController signInTapped:](self, "signInTapped:", self->_signInButtonSpecifier);
    }
  }
}

- (void)signInWithUsername:(id)a3 password:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  OSLogHandleForIDSCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v13 = v6;
    _os_log_impl(&dword_2138BA000, v8, OS_LOG_TYPE_DEFAULT, "Signing in with username (password entered): %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
  {
    v11 = v6;
    IMLogString();
  }
  -[CNFRegSignInController setPendingUsername:](self, "setPendingUsername:", v6, v11);
  -[CNFRegSignInController setPendingPassword:](self, "setPendingPassword:", v7);
  -[CNFRegFirstRunController _startValidationModeAnimated:](self, "_startValidationModeAnimated:", 0);
  buf[0] = 0;
  -[CNFRegListController regController](self, "regController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "beginAccountSetupWithLogin:password:foundExisting:", v6, v7, buf);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNFRegFirstRunController setAccount:](self, "setAccount:", v10);

  if (!buf[0])
    -[CNFRegSignInController _resetSigninFailureCount](self, "_resetSigninFailureCount");
  -[CNFRegSignInController _startTimeout](self, "_startTimeout");
  -[CNFRegSignInController _loadRegionsIfNecessary](self, "_loadRegionsIfNecessary");

}

- (void)signInTapped:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void (**v13)(_QWORD, _QWORD);
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[5];
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  OSLogHandleForIDSCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2138BA000, v5, OS_LOG_TYPE_DEFAULT, "signInTapped", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    IMLogString();
  if (!-[CNFRegListController _showWiFiAlertIfNecessary](self, "_showWiFiAlertIfNecessary"))
  {
    if (!self->_useSystemAccount)
    {
      objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNFRegSignInController usernameTextField](self, "usernameTextField");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "text");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "stringByTrimmingCharactersInSet:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      -[CNFRegSignInController passwordTextField](self, "passwordTextField");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "text");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v23[0] = MEMORY[0x24BDAC760];
      v23[1] = 3221225472;
      v23[2] = __39__CNFRegSignInController_signInTapped___block_invoke;
      v23[3] = &unk_24D076250;
      v23[4] = self;
      v13 = (void (**)(_QWORD, _QWORD))MEMORY[0x2199B8E98](v23);
      if (v8 && objc_msgSend(v8, "length"))
      {
        if (v9 && objc_msgSend(v9, "length"))
        {
          OSLogHandleForIDSCategory();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v25 = v8;
            _os_log_impl(&dword_2138BA000, v14, OS_LOG_TYPE_DEFAULT, "Signing in with username (password entered): %@", buf, 0xCu);
          }

          if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
          {
            v22 = v8;
            IMLogString();
          }
          -[CNFRegSignInController setPendingUsername:](self, "setPendingUsername:", v8, v22);
          -[CNFRegSignInController setPendingPassword:](self, "setPendingPassword:", v9);
          -[CNFRegFirstRunController _startValidationModeAnimated:](self, "_startValidationModeAnimated:", 0);
          buf[0] = 0;
          -[CNFRegListController regController](self, "regController");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "beginAccountSetupWithLogin:password:foundExisting:", v8, v9, buf);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[CNFRegFirstRunController setAccount:](self, "setAccount:", v16);

          if (!buf[0])
            -[CNFRegSignInController _resetSigninFailureCount](self, "_resetSigninFailureCount");

          goto LABEL_10;
        }
        v20 = (void *)MEMORY[0x24BDD17C8];
        CommunicationsSetupUIBundle();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        CNFRegStringTableName();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("FACETIME_SIGNIN_ERROR_INVALID_CREDENTIALS_FOR_%@"), &stru_24D077260, v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "stringWithFormat:", v19, v8);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v13)[2](v13, v21);

      }
      else
      {
        CommunicationsSetupUIBundle();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        CNFRegStringTableName();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("FACETIME_SIGNIN_ERROR_BLANK_USERNAME"), &stru_24D077260, v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v13)[2](v13, v19);
      }

      goto LABEL_26;
    }
    -[CNFRegListController regController](self, "regController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "systemAccount");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[CNFRegFirstRunController _startValidationModeAnimated:](self, "_startValidationModeAnimated:", 0);
      -[CNFRegListController regController](self, "regController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "beginAccountSetupWithAccount:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNFRegFirstRunController setAccount:](self, "setAccount:", v9);
LABEL_10:

      -[CNFRegSignInController _startTimeout](self, "_startTimeout");
      -[CNFRegSignInController _loadRegionsIfNecessary](self, "_loadRegionsIfNecessary");
    }
  }
LABEL_26:

}

void __39__CNFRegSignInController_signInTapped___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = a2;
  CommunicationsSetupUIBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  CNFRegStringTableName();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("FACETIME_ACTIVATION_ERROR_TITLE"), &stru_24D077260, v5);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  CommunicationsSetupUIBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  CNFRegStringTableName();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("FACETIME_ALERT_OK"), &stru_24D077260, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", v11, v3, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD3A8], "actionWithTitle:style:handler:", v8, 0, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addAction:", v10);

  objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v9, 1, 0);
}

- (void)learnMorePressed:(id)a3
{
  void *v3;
  id v4;

  v3 = (void *)*MEMORY[0x24BEBDF78];
  CNFRegLocalizedSplashScreenURL();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "openURL:withCompletionHandler:", v4, 0);

}

- (void)_loadRegionsIfNecessary
{
  id v2;

  objc_msgSend(MEMORY[0x24BE30370], "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isLoaded") & 1) == 0)
    objc_msgSend(v2, "startLoading");

}

- (void)_startTimeout
{
  -[CNFRegFirstRunController _startTimeoutWithDuration:](self, "_startTimeoutWithDuration:", 30.0);
}

- (void)_handleTimeout
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
  id v13;

  -[CNFRegFirstRunController _stopValidationModeAnimated:](self, "_stopValidationModeAnimated:", 1);
  CommunicationsSetupUIBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CNFRegStringTableName();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("FACETIME_ACTIVATION_ERROR_TITLE"), &stru_24D077260, v4);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  CommunicationsSetupUIBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  CNFRegStringTableName();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("FACETIME_SIGNIN_ERROR_TIMEOUT"), &stru_24D077260, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  CommunicationsSetupUIBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  CNFRegStringTableName();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("FACETIME_ALERT_OK"), &stru_24D077260, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", v13, v7, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD3A8], "actionWithTitle:style:handler:", v10, 0, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addAction:", v12);

  -[CNFRegSignInController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v11, 1, 0);
}

- (void)cancelButtonTapped
{
  NSObject *v3;
  void *v4;
  unint64_t v5;
  id WeakRetained;
  uint8_t v7[16];

  OSLogHandleForIDSCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_2138BA000, v3, OS_LOG_TYPE_DEFAULT, "Cancel button tapped", v7, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    IMLogString();
  -[CNFRegListController regController](self, "regController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "accountState");

  WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.super.super.super.super.isa
                                            + (int)*MEMORY[0x24BE75790]));
  objc_msgSend(WeakRetained, "dismissFinished:", (v5 >> 30) & 1);

}

- (void)setUsernameEnabled:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  NSObject *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  uint8_t buf[4];
  const __CFString *v12;
  uint64_t v13;

  v4 = a4;
  v5 = a3;
  v13 = *MEMORY[0x24BDAC8D0];
  OSLogHandleForIDSCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = CFSTR("NO");
    if (v5)
      v8 = CFSTR("YES");
    *(_DWORD *)buf = 138412290;
    v12 = v8;
    _os_log_impl(&dword_2138BA000, v7, OS_LOG_TYPE_DEFAULT, "Setting username enabled to :%@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
  {
    v9 = CFSTR("NO");
    if (v5)
      v9 = CFSTR("YES");
    v10 = v9;
    IMLogString();
  }
  -[CNFRegListController _setSpecifierEnabled:enabled:animated:](self, "_setSpecifierEnabled:enabled:animated:", self->_usernameSpecifier, v5, v4, v10);
}

- (void)setPasswordEnabled:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  NSObject *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  uint8_t buf[4];
  const __CFString *v12;
  uint64_t v13;

  v4 = a4;
  v5 = a3;
  v13 = *MEMORY[0x24BDAC8D0];
  OSLogHandleForIDSCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = CFSTR("NO");
    if (v5)
      v8 = CFSTR("YES");
    *(_DWORD *)buf = 138412290;
    v12 = v8;
    _os_log_impl(&dword_2138BA000, v7, OS_LOG_TYPE_DEFAULT, "Setting password enabled to :%@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
  {
    v9 = CFSTR("NO");
    if (v5)
      v9 = CFSTR("YES");
    v10 = v9;
    IMLogString();
  }
  -[CNFRegListController _setSpecifierEnabled:enabled:animated:](self, "_setSpecifierEnabled:enabled:animated:", self->_passwordSpecifier, v5, v4, v10);
}

- (void)setCreateAccountButtonEnabled:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  NSObject *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  uint8_t buf[4];
  const __CFString *v12;
  uint64_t v13;

  v4 = a4;
  v5 = a3;
  v13 = *MEMORY[0x24BDAC8D0];
  OSLogHandleForIDSCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = CFSTR("NO");
    if (v5)
      v8 = CFSTR("YES");
    *(_DWORD *)buf = 138412290;
    v12 = v8;
    _os_log_impl(&dword_2138BA000, v7, OS_LOG_TYPE_DEFAULT, "Setting account button enabled to :%@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
  {
    v9 = CFSTR("NO");
    if (v5)
      v9 = CFSTR("YES");
    v10 = v9;
    IMLogString();
  }
  -[CNFRegListController _setSpecifierEnabled:enabled:animated:](self, "_setSpecifierEnabled:enabled:animated:", self->_createAccountButtonSpecifier, v5, v4, v10);
}

- (void)setSignInButtonEnabled:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  NSObject *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  uint8_t buf[4];
  const __CFString *v12;
  uint64_t v13;

  v4 = a4;
  v5 = a3;
  v13 = *MEMORY[0x24BDAC8D0];
  OSLogHandleForIDSCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = CFSTR("NO");
    if (v5)
      v8 = CFSTR("YES");
    *(_DWORD *)buf = 138412290;
    v12 = v8;
    _os_log_impl(&dword_2138BA000, v7, OS_LOG_TYPE_DEFAULT, "Setting signin button enabled to :%@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
  {
    v9 = CFSTR("NO");
    if (v5)
      v9 = CFSTR("YES");
    v10 = v9;
    IMLogString();
  }
  -[CNFRegListController _setSpecifierEnabled:enabled:animated:](self, "_setSpecifierEnabled:enabled:animated:", self->_signInButtonSpecifier, v5, v4, v10);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CNFRegSignInController;
  -[CNFRegSignInController tableView:cellForRowAtIndexPath:](&v9, sel_tableView_cellForRowAtIndexPath_, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNFRegSignInController cachedCellForSpecifierID:](self, "cachedCellForSpecifierID:", CFSTR("FACETIME_SIGNIN_PASSWORD_ID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v6 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "textField");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "conformsToProtocol:", &unk_254D4D6F0))
      objc_msgSend(v7, "setReturnKeyType:", 1);
    if (self->_useSystemAccount)
      objc_msgSend(v7, "setClearsOnBeginEditing:", 1);

  }
  return v5;
}

- (void)_buildCreateAccountButtonSpecifierCache:(id)a3
{
  PSSpecifier *v4;
  PSSpecifier *createAccountButtonSpecifier;

  objc_msgSend(a3, "specifierForID:", CFSTR("FACETIME_SIGNIN_CREATE_ACCOUNT_ID"));
  v4 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
  createAccountButtonSpecifier = self->_createAccountButtonSpecifier;
  self->_createAccountButtonSpecifier = v4;

}

- (void)_buildSignInGroupSpecifierCache:(id)a3
{
  id v4;
  PSSpecifier *v5;
  PSSpecifier *actionGroupSpecifier;
  PSSpecifier *v7;
  PSSpecifier *signInButtonSpecifier;

  v4 = a3;
  objc_msgSend(v4, "specifierForID:", CFSTR("FACETIME_SIGNIN_BUTTON_GROUP_ID"));
  v5 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
  actionGroupSpecifier = self->_actionGroupSpecifier;
  self->_actionGroupSpecifier = v5;

  objc_msgSend(v4, "specifierForID:", CFSTR("FACETIME_SIGNIN_BUTTON_ID"));
  v7 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();

  signInButtonSpecifier = self->_signInButtonSpecifier;
  self->_signInButtonSpecifier = v7;

}

- (void)_buildCredentialSpecifierCache:(id)a3
{
  id v4;
  PSSpecifier *v5;
  PSSpecifier *usernameSpecifier;
  PSSpecifier *v7;
  PSSpecifier *passwordSpecifier;

  v4 = a3;
  objc_msgSend(v4, "specifierForID:", CFSTR("FACETIME_SIGNIN_USERNAME_ID"));
  v5 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
  usernameSpecifier = self->_usernameSpecifier;
  self->_usernameSpecifier = v5;

  objc_msgSend(v4, "specifierForID:", CFSTR("FACETIME_SIGNIN_PASSWORD_ID"));
  v7 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();

  passwordSpecifier = self->_passwordSpecifier;
  self->_passwordSpecifier = v7;

}

- (void)_buildSpecifierCache:(id)a3
{
  id v4;

  v4 = a3;
  -[CNFRegSignInController _buildCreateAccountButtonSpecifierCache:](self, "_buildCreateAccountButtonSpecifierCache:", v4);
  -[CNFRegSignInController _buildSignInGroupSpecifierCache:](self, "_buildSignInGroupSpecifierCache:", v4);
  -[CNFRegSignInController _buildCredentialSpecifierCache:](self, "_buildCredentialSpecifierCache:", v4);

}

- (void)_showRegistrationFailureWithError:(id)a3
{
  id v4;
  NSObject *v5;
  unint64_t v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  _QWORD v36[4];
  id v37;
  CNFRegSignInController *v38;
  _QWORD v39[6];
  uint8_t buf[4];
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    OSLogHandleForIDSCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v41 = v4;
      _os_log_impl(&dword_2138BA000, v5, OS_LOG_TYPE_DEFAULT, "Received sign in error : %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    {
      v34 = v4;
      IMLogString();
    }
    v6 = objc_msgSend(v4, "code", v34);
  }
  else
  {
    v6 = -1;
  }
  -[CNFRegListController regController](self, "regController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "shouldShowAlertForError:", v4);

  if (v8 && (v6 > 0x1A || ((1 << v6) & 0x4100C00) == 0))
  {
    objc_msgSend(v4, "userInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", CFSTR("cnf-customTitle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      v35 = v10;
    }
    else
    {
      CommunicationsSetupUIBundle();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      CNFRegStringTableName();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("FACETIME_ACTIVATION_ERROR_TITLE"), &stru_24D077260, v13);
      v35 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v4, "localizedDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      v16 = v14;
    }
    else
    {
      CommunicationsSetupUIBundle();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      CNFRegStringTableName();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("FACETIME_SIGNIN_ERROR_GENERIC"), &stru_24D077260, v18);
      v16 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v4, "userInfo");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKey:", CFSTR("cnf-customButton"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v20)
    {
      v22 = v20;
    }
    else
    {
      CommunicationsSetupUIBundle();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      CNFRegStringTableName();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("FACETIME_ALERT_OK"), &stru_24D077260, v24);
      v22 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", v35, v16, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = MEMORY[0x24BDAC760];
    v39[0] = MEMORY[0x24BDAC760];
    v39[1] = 3221225472;
    v39[2] = __60__CNFRegSignInController__showRegistrationFailureWithError___block_invoke;
    v39[3] = &unk_24D076278;
    v39[4] = self;
    v39[5] = v6;
    objc_msgSend(MEMORY[0x24BEBD3A8], "actionWithTitle:style:handler:", v22, 0, v39);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addAction:", v27);

    objc_msgSend(v4, "userInfo");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "objectForKey:", CFSTR("cnf-customActionTitle"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      v30 = (void *)MEMORY[0x24BEBD3A8];
      objc_msgSend(v4, "userInfo");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "objectForKey:", CFSTR("cnf-customActionTitle"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v36[0] = v26;
      v36[1] = 3221225472;
      v36[2] = __60__CNFRegSignInController__showRegistrationFailureWithError___block_invoke_2;
      v36[3] = &unk_24D075BA0;
      v37 = v4;
      v38 = self;
      objc_msgSend(v30, "actionWithTitle:style:handler:", v32, 0, v36);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "addAction:", v33);

    }
    -[CNFRegSignInController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v25, 1, 0);

  }
}

unint64_t __60__CNFRegSignInController__showRegistrationFailureWithError___block_invoke(unint64_t result)
{
  unint64_t v1;

  if (*(_QWORD *)(result + 40) == 3)
  {
    v1 = result;
    objc_msgSend(*(id *)(result + 32), "_incrementSigninFailureCount");
    result = objc_msgSend(*(id *)(v1 + 32), "signinFailureCount");
    if (result >= 3)
      return objc_msgSend(*(id *)(v1 + 32), "_showSigninFailureAlert");
  }
  return result;
}

void __60__CNFRegSignInController__showRegistrationFailureWithError___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("cnf-customActionURLString"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      OSLogHandleForIDSCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v11 = v6;
        _os_log_impl(&dword_2138BA000, v7, OS_LOG_TYPE_DEFAULT, "Launching URL : %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
      {
        v9 = v6;
        IMLogString();
      }
      objc_msgSend(*(id *)(a1 + 40), "regController", v9);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "openURL:", v6);

    }
  }

}

- (void)_showSigninFailureAlert
{
  int v3;
  void *v4;
  void *v5;
  const __CFString *v6;
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
  _QWORD v20[5];

  v3 = _os_feature_enabled_impl();
  CommunicationsSetupUIBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  CNFRegStringTableName();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v6 = CFSTR("FACETIME_FORGOT_PASSWORD_ALERT_TITLE_APPLEACCOUNT");
  else
    v6 = CFSTR("FACETIME_FORGOT_PASSWORD_ALERT_TITLE");
  objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_24D077260, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  CommunicationsSetupUIBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  CNFRegStringTableName();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("FACETIME_FORGOT_PASSWORD_ALERT_MESSAGE"), &stru_24D077260, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  CommunicationsSetupUIBundle();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  CNFRegStringTableName();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("FACETIME_ALERT_CANCEL"), &stru_24D077260, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  CommunicationsSetupUIBundle();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  CNFRegStringTableName();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("FACETIME_FORGOT_PASSWORD_ALERT_OK"), &stru_24D077260, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", v7, v10, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD3A8], "actionWithTitle:style:handler:", v13, 1, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addAction:", v18);

  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __49__CNFRegSignInController__showSigninFailureAlert__block_invoke;
  v20[3] = &unk_24D075A28;
  v20[4] = self;
  objc_msgSend(MEMORY[0x24BEBD3A8], "actionWithTitle:style:handler:", v16, 0, v20);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addAction:", v19);

  -[CNFRegSignInController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v17, 1, 0);
}

uint64_t __49__CNFRegSignInController__showSigninFailureAlert__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_launchForgotPasswordUrl");
}

- (void)_resetSigninFailureCount
{
  -[CNFRegSignInController setSigninFailureCount:](self, "setSigninFailureCount:", 0);
}

- (void)_incrementSigninFailureCount
{
  if (-[CNFRegSignInController signinFailureCount](self, "signinFailureCount") != -1)
    -[CNFRegSignInController setSigninFailureCount:](self, "setSigninFailureCount:", -[CNFRegSignInController signinFailureCount](self, "signinFailureCount") + 1);
}

- (void)_launchForgotPasswordUrl
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  CNFRegiForgotURL();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "openURL:withCompletionHandler:", v2, 0);

}

- (void)_showNewPasswordNeededSheetWithAppleID:(id)a3
{
  id v4;
  CNFRegChangeAccountPasswordController *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  CNFRegChangeAccountPasswordController *v14;

  v4 = a3;
  v5 = [CNFRegChangeAccountPasswordController alloc];
  -[CNFRegListController regController](self, "regController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[CNFRegChangeAccountPasswordController initWithRegController:appleID:](v5, "initWithRegController:appleID:", v6, v4);

  -[CNFRegChangeAccountPasswordController setDelegate:](v14, "setDelegate:", self);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD7A0]), "initWithRootViewController:", v14);
  +[CNFRegAppearanceController globalAppearanceController](CNFRegAppearanceController, "globalAppearanceController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setModalPresentationStyle:", objc_msgSend(v8, "modalPresentationStyle"));
  v9 = objc_msgSend(v8, "navigationBarStyle");
  objc_msgSend(v7, "navigationBar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBarStyle:", v9);

  v11 = objc_msgSend(v8, "navigationBarIsTranslucent");
  objc_msgSend(v7, "navigationBar");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTranslucent:", v11);

  -[CNFRegSignInController navigationController](self, "navigationController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "presentViewController:animated:completion:", v7, 1, 0);

}

- (void)_setupAppearBlockForNewPasswordWithAppleID:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __69__CNFRegSignInController__setupAppearBlockForNewPasswordWithAppleID___block_invoke;
  v6[3] = &unk_24D0762A0;
  objc_copyWeak(&v8, &location);
  v5 = v4;
  v7 = v5;
  -[CNFRegListController setAppearBlock:](self, "setAppearBlock:", v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

void __69__CNFRegSignInController__setupAppearBlockForNewPasswordWithAppleID___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_showNewPasswordNeededSheetWithAppleID:", *(_QWORD *)(a1 + 32));

}

- (void)_showAccountNotAuthorizedSheetWithAuthID:(id)a3 token:(id)a4
{
  id v6;
  id v7;
  CNFRegAccountAuthorizationController *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  CNFRegAccountAuthorizationController *v17;

  v6 = a4;
  v7 = a3;
  v8 = [CNFRegAccountAuthorizationController alloc];
  -[CNFRegListController regController](self, "regController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[CNFRegAccountAuthorizationController initWithRegController:authID:token:](v8, "initWithRegController:authID:token:", v9, v7, v6);

  -[CNFRegAccountAuthorizationController setDelegate:](v17, "setDelegate:", self);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD7A0]), "initWithRootViewController:", v17);
  +[CNFRegAppearanceController globalAppearanceController](CNFRegAppearanceController, "globalAppearanceController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setModalPresentationStyle:", objc_msgSend(v11, "modalPresentationStyle"));
  v12 = objc_msgSend(v11, "navigationBarStyle");
  objc_msgSend(v10, "navigationBar");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setBarStyle:", v12);

  v14 = objc_msgSend(v11, "navigationBarIsTranslucent");
  objc_msgSend(v10, "navigationBar");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTranslucent:", v14);

  -[CNFRegSignInController navigationController](self, "navigationController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "presentViewController:animated:completion:", v10, 1, 0);

}

- (void)_setupAppearBlockForAccountAuthorizeWithAuthID:(id)a3 token:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __79__CNFRegSignInController__setupAppearBlockForAccountAuthorizeWithAuthID_token___block_invoke;
  v10[3] = &unk_24D0762C8;
  objc_copyWeak(&v13, &location);
  v8 = v6;
  v11 = v8;
  v9 = v7;
  v12 = v9;
  -[CNFRegListController setAppearBlock:](self, "setAppearBlock:", v10);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

void __79__CNFRegSignInController__setupAppearBlockForAccountAuthorizeWithAuthID_token___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_showAccountNotAuthorizedSheetWithAuthID:token:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_setupEventHandlers
{
  void *v3;
  _QWORD v4[5];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CNFRegSignInController;
  -[CNFRegFirstRunController _setupEventHandlers](&v5, sel__setupEventHandlers);
  -[CNFRegListController regController](self, "regController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __45__CNFRegSignInController__setupEventHandlers__block_invoke;
  v4[3] = &unk_24D075CB8;
  v4[4] = self;
  objc_msgSend(v3, "setAccountRegistrationBlock:", v4);

}

void __45__CNFRegSignInController__setupEventHandlers__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  id v8;

  v8 = a2;
  v5 = a3;
  v6 = objc_msgSend(v8, "registrationStatus");
  objc_msgSend(*(id *)(a1 + 32), "account");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v8)
  {
    if ((unint64_t)(v6 - 3) >= 3)
    {
      if (v6 == -1)
      {
        objc_msgSend(*(id *)(a1 + 32), "_stopTimeout");
        if ((objc_msgSend(*(id *)(a1 + 32), "timedOut") & 1) == 0)
        {
          objc_msgSend(*(id *)(a1 + 32), "_showRegistrationFailureWithError:", v5);
          objc_msgSend(*(id *)(a1 + 32), "_stopValidationModeAnimated:", 1);
        }
      }
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "_stopTimeout");
      objc_msgSend(*(id *)(a1 + 32), "_resetSigninFailureCount");
      objc_msgSend(*(id *)(a1 + 32), "_finishSignInWithAccount:animated:", v8, 1);
    }
  }

}

- (NSString)pendingUsername
{
  return self->_pendingUsername;
}

- (void)setPendingUsername:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1520);
}

- (NSString)pendingPassword
{
  return self->_pendingPassword;
}

- (void)setPendingPassword:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1528);
}

- (unint64_t)signinFailureCount
{
  return self->_signinFailureCount;
}

- (void)setSigninFailureCount:(unint64_t)a3
{
  self->_signinFailureCount = a3;
}

- (BOOL)hideLearnMoreButton
{
  return self->_hideLearnMoreButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_learnMoreButton, 0);
  objc_storeStrong((id *)&self->_pendingPassword, 0);
  objc_storeStrong((id *)&self->_pendingUsername, 0);
  objc_storeStrong((id *)&self->_createAccountButtonSpecifier, 0);
  objc_storeStrong((id *)&self->_signInButtonSpecifier, 0);
  objc_storeStrong((id *)&self->_actionGroupSpecifier, 0);
  objc_storeStrong((id *)&self->_passwordSpecifier, 0);
  objc_storeStrong((id *)&self->_usernameSpecifier, 0);
}

@end
