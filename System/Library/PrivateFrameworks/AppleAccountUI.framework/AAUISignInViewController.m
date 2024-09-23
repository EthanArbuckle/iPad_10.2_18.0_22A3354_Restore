@implementation AAUISignInViewController

- (AAUISignInViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  AAUISignInViewController *v4;
  AAUISignInViewController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AAUISignInViewController;
  v4 = -[AAUISignInViewController initWithNibName:bundle:](&v7, sel_initWithNibName_bundle_, a3, a4);
  v5 = v4;
  if (v4)
    _AAUISignInViewControllerCommonInit(v4);
  return v5;
}

- (AAUISignInViewController)initWithCoder:(id)a3
{
  AAUISignInViewController *v3;
  AAUISignInViewController *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AAUISignInViewController;
  v3 = -[AAUISignInViewController initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    _AAUISignInViewControllerCommonInit(v3);
  return v4;
}

- (void)loadView
{
  AAUIBuddyView *v3;
  AAUIBuddyView *v4;
  void *v5;
  id v6;

  v3 = [AAUIBuddyView alloc];
  v4 = -[AAUIBuddyView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[AAUISignInViewController setView:](self, "setView:", v4);

  -[AAUISignInViewController view](self, "view");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v5);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;
  double v19;
  void *v20;
  double v21;
  double v22;
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
  objc_super v45;
  _QWORD v46[6];

  v46[4] = *MEMORY[0x1E0C80C00];
  v45.receiver = self;
  v45.super_class = (Class)AAUISignInViewController;
  -[AAUISignInViewController viewDidLoad](&v45, sel_viewDidLoad);
  -[AAUISignInViewController authenticationContext](self, "authenticationContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "proxiedDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[AAUISignInViewController navigationItem](self, "navigationItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHidesBackButton:animated:", 0, 0);

    -[AAUISignInViewController navigationItem](self, "navigationItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setLeftBarButtonItem:animated:", 0, 0);
  }
  else if (-[AAUISignInViewController hidesBackOrCancelButton](self, "hidesBackOrCancelButton"))
  {
    -[AAUISignInViewController navigationItem](self, "navigationItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHidesBackButton:animated:", 1, 0);
  }
  else
  {
    if (-[AAUISignInViewController allowSkip](self, "allowSkip")
      || -[AAUISignInViewController shouldShowSystemBackButton](self, "shouldShowSystemBackButton"))
    {
      -[AAUISignInViewController navigationItem](self, "navigationItem");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[AAUISignInViewController _backBarButtonItem](self, "_backBarButtonItem");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setLeftBarButtonItem:", v7);
    }
    else
    {
      -[AAUISignInViewController navigationItem](self, "navigationItem");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[AAUISignInViewController _cancelBarButtonItem](self, "_cancelBarButtonItem");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setRightBarButtonItem:", v7);
    }

  }
  -[AAUISignInViewController _tableView](self, "_tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAUISignInViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSubview:", v8);

  -[AAUISignInViewController navigationController](self, "navigationController");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = 0.0;
  if (v10)
  {
    v12 = (void *)v10;
    -[AAUISignInViewController navigationController](self, "navigationController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "modalPresentationStyle"))
    {
      -[AAUISignInViewController navigationController](self, "navigationController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "modalPresentationStyle");

      if (v15 != 5)
        goto LABEL_18;
    }
    else
    {

    }
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "userInterfaceIdiom");

    if (v17 == 1)
    {
      v18 = objc_alloc_init(MEMORY[0x1E0DC3A28]);
      objc_msgSend(v18, "intrinsicContentSize");
      v11 = v19 + 0.0;

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "statusBarFrame");
      v22 = v21;

      v11 = v22 + 0.0;
    }
  }
LABEL_18:
  v36 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(v8, "topAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAUISignInViewController view](self, "view");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "topAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "constraintEqualToAnchor:constant:", v42, v11);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v46[0] = v41;
  objc_msgSend(v8, "leadingAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAUISignInViewController view](self, "view");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "contentLayoutGuide");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "leadingAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", v37, 0.0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v46[1] = v35;
  objc_msgSend(v8, "trailingAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAUISignInViewController view](self, "view");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "contentLayoutGuide");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "trailingAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", v25, 0.0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v46[2] = v26;
  objc_msgSend(v8, "bottomAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAUISignInViewController view](self, "view");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "contentLayoutGuide");
  v34 = v8;
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "bottomAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToAnchor:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v46[3] = v31;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 4);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "activateConstraints:", v32);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AAUISignInViewController;
  -[AAUISignInViewController viewWillAppear:](&v8, sel_viewWillAppear_, a3);
  -[AAUISignInViewController _beginObservingTextFieldDidChangeNotifications](self, "_beginObservingTextFieldDidChangeNotifications");
  -[AAUISignInViewController _beginObservingKeyboardWillShowNotifications](self, "_beginObservingKeyboardWillShowNotifications");
  -[AAUISignInViewController _beginObservingSizeCategoryNotification](self, "_beginObservingSizeCategoryNotification");
  -[AAUISignInViewController _setEnabled:](self, "_setEnabled:", 1);
  -[AAUISignInViewController _usernameCell](self, "_usernameCell");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cellTextField");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("SIGN_IN_USERNAME_PLACEHOLDER"), &stru_1EA2E2A18, CFSTR("Localizable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPlaceholder:", v7);

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AAUISignInViewController;
  -[AAUISignInViewController viewDidAppear:](&v3, sel_viewDidAppear_, a3);
}

- (void)viewWillLayoutSubviews
{
  _QWORD v3[5];
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AAUISignInViewController;
  -[AAUISignInViewController viewWillLayoutSubviews](&v4, sel_viewWillLayoutSubviews);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __50__AAUISignInViewController_viewWillLayoutSubviews__block_invoke;
  v3[3] = &unk_1EA2DB208;
  v3[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v3);
}

uint64_t __50__AAUISignInViewController_viewWillLayoutSubviews__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v4[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 968);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __50__AAUISignInViewController_viewWillLayoutSubviews__block_invoke_2;
  v4[3] = &unk_1EA2DB208;
  v4[4] = v1;
  return objc_msgSend(v2, "performBatchUpdates:completion:", v4, 0);
}

uint64_t __50__AAUISignInViewController_viewWillLayoutSubviews__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateExpandingViewInFooterForCellChange:", 0);
}

- (double)_initialHeight
{
  NSNumber *initialHeight;
  void *v4;
  void *v5;
  double v6;
  NSNumber *v7;
  NSNumber *v8;
  float v9;

  initialHeight = self->_initialHeight;
  if (!initialHeight)
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[AAUISignInViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "frame");
    objc_msgSend(v4, "numberWithDouble:", v6);
    v7 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v8 = self->_initialHeight;
    self->_initialHeight = v7;

    initialHeight = self->_initialHeight;
  }
  -[NSNumber floatValue](initialHeight, "floatValue");
  return v9;
}

- (void)_updateExpandingViewInFooterForCellChange:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  uint64_t v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  _BOOL4 v30;
  double v31;

  v3 = a3;
  -[AAUISignInViewController _navigationBarHeight](self, "_navigationBarHeight");
  v6 = v5;
  -[AAUIOBHeaderView topPadding](self->_obHeaderView, "topPadding");
  if (v6 >= v7)
    v8 = v6;
  else
    v8 = v7;
  -[AAUISignInViewControllerTableFooterView frame](self->_tableFooterView, "frame");
  v10 = v9;
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "sf_isiPad"))
  {

LABEL_7:
    -[AAUISignInViewController _initialHeight](self, "_initialHeight");
    v15 = v14;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "userInterfaceIdiom");

  if (v13 == 6)
    goto LABEL_7;
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "keyWindow");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "safeAreaInsets");
  v19 = v18;
  v21 = v20;
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "bounds");
  v24 = v23;

  v15 = v24 - v21 - v19;
LABEL_9:
  -[AAUISignInViewControllerTableFooterView naturalHeight](self->_tableFooterView, "naturalHeight");
  v26 = v25;
  v27 = v15 - v8 - v10;
  v28 = 0.0;
  if (v27 >= v26)
  {
    v29 = v27 - v26;
    v30 = -[AAUISignInViewController _isPasswordFieldVisible](self, "_isPasswordFieldVisible", 0.0);
    v31 = 44.0;
    if (v30)
      v31 = -44.0;
    if (!v3)
      v31 = 0.0;
    v28 = v29 + v31;
  }
  -[AAUISignInViewControllerTableFooterView setExpandableViewToHeight:](self->_tableFooterView, "setExpandableViewToHeight:", v28);
}

- (double)_navigationBarHeight
{
  void *v3;
  uint64_t v4;
  double navigationBarHeightPortrait;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  double v11;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "orientation");

  if ((unint64_t)(v4 - 1) > 1)
  {
    -[AAUISignInViewController navigationController](self, "navigationController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "navigationBar");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "frame");
    navigationBarHeightPortrait = v11;

  }
  else
  {
    navigationBarHeightPortrait = self->_navigationBarHeightPortrait;
    if (navigationBarHeightPortrait == 0.0)
    {
      -[AAUISignInViewController navigationController](self, "navigationController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "navigationBar");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "frame");
      self->_navigationBarHeightPortrait = v8;

      return self->_navigationBarHeightPortrait;
    }
  }
  return navigationBarHeightPortrait;
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AAUISignInViewController;
  -[AAUISignInViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[AAUISignInViewController _endObservingSizeCategoryNotification](self, "_endObservingSizeCategoryNotification");
  -[AAUISignInViewController _endObservingTextFieldDidChangeNotifications](self, "_endObservingTextFieldDidChangeNotifications");
  -[AAUISignInViewController _endObservingKeyboardWillShowNotifications](self, "_endObservingKeyboardWillShowNotifications");
}

- (void)dealloc
{
  objc_super v3;

  -[AAUISignInViewController _endObservingSizeCategoryNotification](self, "_endObservingSizeCategoryNotification");
  -[AAUISignInViewController _endObservingTextFieldDidChangeNotifications](self, "_endObservingTextFieldDidChangeNotifications");
  -[AAUISignInViewController _endObservingKeyboardWillShowNotifications](self, "_endObservingKeyboardWillShowNotifications");
  v3.receiver = self;
  v3.super_class = (Class)AAUISignInViewController;
  -[AAUISignInViewController dealloc](&v3, sel_dealloc);
}

- (id)authenticationContext
{
  void *v3;
  id v4;
  _BOOL4 v5;
  NSObject *v6;
  _BOOL4 v7;
  objc_class *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[AAUISignInViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "authenticationContext");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = objc_alloc_init(MEMORY[0x1E0D002F8]);
    objc_msgSend(v4, "setAuthenticationType:", 2);
    objc_msgSend(v4, "setFirstTimeLogin:", 1);
    objc_msgSend(v4, "setPresentingViewController:", self);
    objc_msgSend(v4, "setServiceType:", -[AAUISignInViewController _akServiceType](self, "_akServiceType"));
    objc_msgSend(v4, "setShouldOfferSecurityUpgrade:", 0);
    objc_msgSend(v4, "setShouldUpdatePersistentServiceTokens:", 1);
    v5 = -[AAUISignInViewController _shouldAnticipatePiggybacking](self, "_shouldAnticipatePiggybacking");
    _AAUILogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v7)
      {
        v8 = (objc_class *)objc_opt_class();
        NSStringFromClass(v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 138412290;
        v14 = v9;
        _os_log_impl(&dword_1DB4ED000, v6, OS_LOG_TYPE_DEFAULT, "%@ detected primary iCloud sign in.", (uint8_t *)&v13, 0xCu);

      }
      objc_msgSend(v4, "setAnticipateEscrowAttempt:", 1);
      objc_msgSend(v4, "setShouldOfferSecurityUpgrade:", 1);
      objc_msgSend(v4, "setSupportsPiggybacking:", 1);
    }
    else
    {
      if (v7)
      {
        v10 = (objc_class *)objc_opt_class();
        NSStringFromClass(v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 138412290;
        v14 = v11;
        _os_log_impl(&dword_1DB4ED000, v6, OS_LOG_TYPE_DEFAULT, "%@ detected non-primary iCloud sign in.", (uint8_t *)&v13, 0xCu);

      }
    }
  }

  return v4;
}

- (UIImageView)headerImageView
{
  return (UIImageView *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", self->_headerImage);
}

- (void)setHeaderImage:(id)a3
{
  AAUIOBHeaderView *obHeaderView;
  id v6;

  v6 = a3;
  objc_storeStrong((id *)&self->_headerImage, a3);
  obHeaderView = self->_obHeaderView;
  if (obHeaderView)
    -[AAUIOBHeaderView setIcon:accessibilityLabel:](obHeaderView, "setIcon:accessibilityLabel:", v6, 0);

}

- (id)_cancelBarButtonItem
{
  void *v2;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 24, self, sel__cancelButtonSelected_);
  objc_msgSend(v2, "setAccessibilityIdentifier:", CFSTR("cancel-button"));
  return v2;
}

- (id)_backBarButtonItem
{
  void *v2;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 101, self, sel__cancelButtonSelected_);
  objc_msgSend(v2, "setAccessibilityIdentifier:", CFSTR("back-button"));
  return v2;
}

- (id)_defaultHeaderImage
{
  void *v2;
  const __CFString *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[AAUISignInViewController _isRunningInBridge](AAUISignInViewController, "_isRunningInBridge"))
    v3 = CFSTR("AppleAccount_Icon_Orange");
  else
    v3 = CFSTR("AppleAccount_Icon_Blue");
  objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:inBundle:", v3, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_tableHeaderView
{
  UITableViewHeaderFooterView *tableHeaderView;
  AAUIBuddyView *v4;
  AAUIBuddyView *v5;
  void *v6;
  void *v7;
  UITableViewHeaderFooterView *v8;
  UITableViewHeaderFooterView *v9;
  UITableViewHeaderFooterView *v10;
  void *v11;

  tableHeaderView = self->_tableHeaderView;
  if (!tableHeaderView)
  {
    v4 = [AAUIBuddyView alloc];
    v5 = -[AAUIBuddyView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAUIBuddyView setBackgroundColor:](v5, "setBackgroundColor:", v6);

    -[AAUIBuddyView setTranslatesAutoresizingMaskIntoConstraints:](v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[AAUISignInViewController _prepareOBHeaderView](self, "_prepareOBHeaderView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (UITableViewHeaderFooterView *)objc_alloc_init(MEMORY[0x1E0DC3D78]);
    v9 = self->_tableHeaderView;
    self->_tableHeaderView = v8;

    v10 = self->_tableHeaderView;
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableViewHeaderFooterView setBackgroundColor:](v10, "setBackgroundColor:", v11);

    -[UITableViewHeaderFooterView setAccessibilityIdentifier:](self->_tableHeaderView, "setAccessibilityIdentifier:", CFSTR("header-view"));
    -[AAUISignInViewController constrainView:toFillHeaderFooterView:](self, "constrainView:toFillHeaderFooterView:", self->_obHeaderView, self->_tableHeaderView);
    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v7);
    -[AAUIOBHeaderView setNeedsLayout](self->_obHeaderView, "setNeedsLayout");
    -[AAUIOBHeaderView layoutIfNeeded](self->_obHeaderView, "layoutIfNeeded");

    tableHeaderView = self->_tableHeaderView;
  }
  return tableHeaderView;
}

- (AKAppleIDAuthenticationController)authenticationController
{
  AKAppleIDAuthenticationController *authenticationController;
  id v4;

  authenticationController = self->_authenticationController;
  if (authenticationController)
    return authenticationController;
  v4 = objc_alloc_init(MEMORY[0x1E0D00130]);
  return (AKAppleIDAuthenticationController *)v4;
}

- (id)_prepareOBHeaderView
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  int v9;
  void *v10;
  void *v11;
  UIImage *headerImage;
  AAUIOBHeaderView *v13;
  UIImage *v14;
  void *v15;
  void *v16;
  AAUIOBHeaderView *v17;
  AAUIOBHeaderView *obHeaderView;
  UIView *v19;
  UIView *logoContainerView;
  AAUIAppleLogoMicaView *v21;
  AAUIAppleLogoMicaView *appleLogoMicaView;
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
  void *v35;
  void *v36;
  uint64_t v37;
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
  _QWORD v54[10];

  v54[8] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[AAUISignInViewController authenticationContext](self, "authenticationContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
  {
    objc_msgSend(v4, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = CFSTR("SIGN_IN_TITLE");
    if ((objc_msgSend(CFSTR("SIGN_IN_TITLE"), "containsString:", CFSTR("REBRAND")) & 1) != 0
      || !_os_feature_enabled_impl())
    {
      v9 = 0;
    }
    else
    {
      objc_msgSend(CFSTR("SIGN_IN_TITLE"), "stringByAppendingString:", CFSTR("_REBRAND"));
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v9 = 1;
    }
    objc_msgSend(v7, "localizedStringForKey:value:table:", v8, &stru_1EA2E2A18, CFSTR("Localizable"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)

  }
  objc_msgSend(v4, "reason");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "length"))
    objc_msgSend(v4, "reason");
  else
    -[AAUISignInViewController messageLabel](self, "messageLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  headerImage = self->_headerImage;
  v13 = [AAUIOBHeaderView alloc];
  if (headerImage)
  {
    v14 = self->_headerImage;
    v15 = v6;
    v16 = v11;
  }
  else
  {
    v15 = v6;
    v16 = v11;
    v14 = 0;
  }
  v17 = -[AAUIOBHeaderView initWithTitle:detailText:icon:](v13, "initWithTitle:detailText:icon:", v15, v16, v14);
  obHeaderView = self->_obHeaderView;
  self->_obHeaderView = v17;

  -[AAUIOBHeaderView setTranslatesAutoresizingMaskIntoConstraints:](self->_obHeaderView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  if (!self->_headerImage && self->_showServiceIcons)
  {
    v19 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    logoContainerView = self->_logoContainerView;
    self->_logoContainerView = v19;

    -[UIView setFrame:](self->_logoContainerView, "setFrame:", 0.0, 50.0, 373.0, 373.0);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_logoContainerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v21 = objc_alloc_init(AAUIAppleLogoMicaView);
    appleLogoMicaView = self->_appleLogoMicaView;
    self->_appleLogoMicaView = v21;

    -[AAUIAppleLogoMicaView setTranslatesAutoresizingMaskIntoConstraints:](self->_appleLogoMicaView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView addSubview:](self->_logoContainerView, "addSubview:", self->_appleLogoMicaView);
    -[AAUIOBHeaderView animationView](self->_obHeaderView, "animationView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addSubview:", self->_logoContainerView);

    -[AAUIOBHeaderView animationView](self->_obHeaderView, "animationView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[AAUIOBHeaderView animationView](self->_obHeaderView, "animationView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setClipsToBounds:", 1);

    -[UIView centerXAnchor](self->_logoContainerView, "centerXAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAUIOBHeaderView animationView](self->_obHeaderView, "animationView");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "centerXAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "constraintEqualToAnchor:", v50);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v54[0] = v49;
    -[UIView centerYAnchor](self->_logoContainerView, "centerYAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAUIOBHeaderView animationView](self->_obHeaderView, "animationView");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "centerYAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "constraintEqualToAnchor:", v46);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v54[1] = v45;
    -[UIView heightAnchor](self->_logoContainerView, "heightAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "constraintEqualToConstant:", 373.0);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v54[2] = v43;
    -[UIView widthAnchor](self->_logoContainerView, "widthAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "constraintEqualToConstant:", 373.0);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v54[3] = v41;
    -[AAUIAppleLogoMicaView topAnchor](self->_appleLogoMicaView, "topAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](self->_logoContainerView, "topAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "constraintEqualToAnchor:", v39);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v54[4] = v38;
    -[AAUIAppleLogoMicaView bottomAnchor](self->_appleLogoMicaView, "bottomAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](self->_logoContainerView, "bottomAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintEqualToAnchor:", v35);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v54[5] = v26;
    -[AAUIAppleLogoMicaView leadingAnchor](self->_appleLogoMicaView, "leadingAnchor");
    v27 = v3;
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](self->_logoContainerView, "leadingAnchor");
    v53 = v6;
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v54[6] = v30;
    -[AAUIAppleLogoMicaView trailingAnchor](self->_appleLogoMicaView, "trailingAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](self->_logoContainerView, "trailingAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintEqualToAnchor:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v54[7] = v33;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 8);
    v37 = objc_claimAutoreleasedReturnValue();

    v6 = v53;
    v3 = (id)v37;
  }

  return v3;
}

- (void)setMessageLabel:(id)a3
{
  AAUIOBHeaderView *obHeaderView;
  id v5;
  void *v6;
  id v7;

  self->_messageLabel = (NSString *)a3;
  obHeaderView = self->_obHeaderView;
  v5 = a3;
  -[AAUIOBHeaderView title](obHeaderView, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v6, "copy");

  -[AAUIOBHeaderView setDetailText:](self->_obHeaderView, "setDetailText:", v5);
  -[AAUIOBHeaderView setTitle:](self->_obHeaderView, "setTitle:", v7);

}

- (id)_tableView
{
  UITableView *tableView;
  id v4;
  UITableView *v5;
  UITableView *v6;
  UITableView *v7;
  void *v8;

  tableView = self->_tableView;
  if (!tableView)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC3D48]);
    v5 = (UITableView *)objc_msgSend(v4, "initWithFrame:style:", self->_tableViewStyle, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v6 = self->_tableView;
    self->_tableView = v5;

    -[UITableView setAllowsSelection:](self->_tableView, "setAllowsSelection:", 0);
    v7 = self->_tableView;
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableView setBackgroundColor:](v7, "setBackgroundColor:", v8);

    -[UITableView setClipsToBounds:](self->_tableView, "setClipsToBounds:", 0);
    -[UITableView setDataSource:](self->_tableView, "setDataSource:", self);
    -[UITableView setDelegate:](self->_tableView, "setDelegate:", self);
    -[UITableView _setDrawsSeparatorAtTopOfSections:](self->_tableView, "_setDrawsSeparatorAtTopOfSections:", 1);
    -[UITableView setSeparatorStyle:](self->_tableView, "setSeparatorStyle:", 1);
    -[UITableView setTranslatesAutoresizingMaskIntoConstraints:](self->_tableView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UITableView setContentInsetAdjustmentBehavior:](self->_tableView, "setContentInsetAdjustmentBehavior:", 2);
    -[UITableView registerClass:forHeaderFooterViewReuseIdentifier:](self->_tableView, "registerClass:forHeaderFooterViewReuseIdentifier:", objc_opt_class(), CFSTR("AAUISignInViewControllerTableFooterView"));
    tableView = self->_tableView;
  }
  return tableView;
}

- (id)_usernameCell
{
  AKBasicLoginTableViewCell *usernameCell;
  AKBasicLoginTableViewCell *v4;
  AKBasicLoginTableViewCell *v5;
  void *v6;
  AKBasicLoginTableViewCell *v7;
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

  usernameCell = self->_usernameCell;
  if (!usernameCell)
  {
    v4 = (AKBasicLoginTableViewCell *)objc_msgSend(objc_alloc(MEMORY[0x1E0D00318]), "initWithStyle:reuseIdentifier:", 0, 0);
    v5 = self->_usernameCell;
    self->_usernameCell = v4;

    if (self->_cellBackgroundColor)
    {
      -[AKBasicLoginTableViewCell setBackgroundColor:](self->_usernameCell, "setBackgroundColor:");
      -[AKBasicLoginTableViewCell contentView](self->_usernameCell, "contentView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setBackgroundColor:", self->_cellBackgroundColor);

    }
    v7 = self->_usernameCell;
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel_usernameCellTapped_);
    -[AKBasicLoginTableViewCell addGestureRecognizer:](v7, "addGestureRecognizer:", v8);

    -[AKBasicLoginTableViewCell cellTextField](self->_usernameCell, "cellTextField");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setDelegate:", self);

    -[AKBasicLoginTableViewCell cellTextField](self->_usernameCell, "cellTextField");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setKeyboardType:", 7);

    -[AKBasicLoginTableViewCell cellTextField](self->_usernameCell, "cellTextField");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setReturnKeyType:", 11);

    -[AKBasicLoginTableViewCell cellTextField](self->_usernameCell, "cellTextField");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("SIGN_IN_USERNAME_PLACEHOLDER"), &stru_1EA2E2A18, CFSTR("Localizable"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setPlaceholder:", v14);

    -[AKBasicLoginTableViewCell cellTextField](self->_usernameCell, "cellTextField");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTextContentType:", *MEMORY[0x1E0DC54A0]);

    -[AKBasicLoginTableViewCell cellTextField](self->_usernameCell, "cellTextField");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setTextColor:", v17);

    if (self->_username)
    {
      -[AKBasicLoginTableViewCell cellTextField](self->_usernameCell, "cellTextField");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setText:", self->_username);

      if (!self->_canEditUsername)
      {
        -[AKBasicLoginTableViewCell cellTextField](self->_usernameCell, "cellTextField");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0DC3658], "lightGrayColor");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setTextColor:", v20);

        -[AKBasicLoginTableViewCell cellTextField](self->_usernameCell, "cellTextField");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setUserInteractionEnabled:", 0);

      }
      -[AAUISignInViewController _setContinueButtonEnabled:](self, "_setContinueButtonEnabled:", 1);
      -[AAUISignInViewController navigationItem](self, "navigationItem");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "rightBarButtonItem");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setEnabled:", 1);

    }
    -[AKBasicLoginTableViewCell cellTextField](self->_usernameCell, "cellTextField");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setAccessibilityIdentifier:", CFSTR("username-field"));

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
  AKBasicLoginTableViewCell *v7;
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

  passwordCell = self->_passwordCell;
  if (!passwordCell)
  {
    v4 = (AKBasicLoginTableViewCell *)objc_msgSend(objc_alloc(MEMORY[0x1E0D00318]), "initWithStyle:reuseIdentifier:", 0, 0);
    v5 = self->_passwordCell;
    self->_passwordCell = v4;

    if (self->_cellBackgroundColor)
    {
      -[AKBasicLoginTableViewCell setBackgroundColor:](self->_passwordCell, "setBackgroundColor:");
      -[AKBasicLoginTableViewCell contentView](self->_passwordCell, "contentView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setBackgroundColor:", self->_cellBackgroundColor);

    }
    v7 = self->_passwordCell;
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel_passwordCellTapped_);
    -[AKBasicLoginTableViewCell addGestureRecognizer:](v7, "addGestureRecognizer:", v8);

    -[AKBasicLoginTableViewCell cellTextField](self->_passwordCell, "cellTextField");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setDelegate:", self);

    -[AKBasicLoginTableViewCell cellTextField](self->_passwordCell, "cellTextField");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setReturnKeyType:", 9);

    -[AKBasicLoginTableViewCell cellTextField](self->_passwordCell, "cellTextField");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("SIGN_IN_PASSWORD_PLACEHOLDER"), &stru_1EA2E2A18, CFSTR("Localizable"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setPlaceholder:", v13);

    -[AKBasicLoginTableViewCell cellTextField](self->_passwordCell, "cellTextField");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setSecureTextEntry:", 1);

    -[AKBasicLoginTableViewCell cellTextField](self->_passwordCell, "cellTextField");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTextColor:", v16);

    -[AKBasicLoginTableViewCell cellTextField](self->_passwordCell, "cellTextField");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setTextContentType:", *MEMORY[0x1E0DC5468]);

    -[AKBasicLoginTableViewCell cellTextField](self->_passwordCell, "cellTextField");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setAccessibilityIdentifier:", CFSTR("password-field"));

    passwordCell = self->_passwordCell;
  }
  return passwordCell;
}

- (void)usernameCellTapped:(id)a3
{
  id v3;

  -[AKBasicLoginTableViewCell cellTextField](self->_usernameCell, "cellTextField", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "becomeFirstResponder");

}

- (void)passwordCellTapped:(id)a3
{
  id v3;

  -[AKBasicLoginTableViewCell cellTextField](self->_passwordCell, "cellTextField", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "becomeFirstResponder");

}

- (id)forgotButtonLocalizedString
{
  const __CFString *v2;
  void *v3;
  void *v4;

  if (-[AAUISignInViewController allowsAccountCreation](self, "allowsAccountCreation"))
    v2 = CFSTR("SIGN_IN_HELP_BUTTON_FORGOT_OR_CREATE");
  else
    v2 = CFSTR("SIGN_IN_HELP_BUTTON_FORGOT");
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", v2, &stru_1EA2E2A18, CFSTR("Localizable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setHideCreationAndForgotPasswordButton:(BOOL)a3
{
  _BOOL8 v4;
  id v5;

  self->_hideCreationAndForgotPasswordButton = a3;
  v4 = -[AAUISignInViewController hideCreationAndForgotPasswordButton](self, "hideCreationAndForgotPasswordButton");
  -[AAUISignInViewController forgotOrCreateButton](self, "forgotOrCreateButton");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", v4);

}

- (id)_accountHelpStackView
{
  UIStackView *accountHelpStackView;
  id v4;
  UIStackView *v5;
  BOOL v6;
  _QWORD *v7;
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
  UIStackView *v25;

  accountHelpStackView = self->_accountHelpStackView;
  if (!accountHelpStackView)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC3CA8]);
    v5 = (UIStackView *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[UIStackView setAxis:](v5, "setAxis:", 1);
    -[UIStackView setAlignment:](v5, "setAlignment:", 0);
    -[UIStackView setDistribution:](v5, "setDistribution:", 0);
    -[UIStackView setLayoutMarginsRelativeArrangement:](v5, "setLayoutMarginsRelativeArrangement:", 1);
    -[UIStackView setSpacing:](v5, "setSpacing:", 16.0);
    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v6 = -[AAUISignInViewController hideCreationAndForgotPasswordButton](self, "hideCreationAndForgotPasswordButton");
    v7 = (_QWORD *)MEMORY[0x1E0DC4A88];
    if (!v6)
    {
      +[AAUIButton buttonWithType:](AAUIButton, "buttonWithType:", 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[AAUISignInViewController setForgotOrCreateButton:](self, "setForgotOrCreateButton:", v8);
      objc_msgSend(v8, "addTarget:action:forControlEvents:", self, sel__actionButtonSelected_, 64);
      -[AAUISignInViewController forgotButtonLocalizedString](self, "forgotButtonLocalizedString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setTitle:forState:", v9, 0);

      objc_msgSend(v8, "titleLabel");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setAdjustsFontForContentSizeCategory:", 1);

      objc_msgSend(v8, "titleLabel");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setLineBreakMode:", 0);

      objc_msgSend(v8, "titleLabel");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setNumberOfLines:", 0);

      objc_msgSend(v8, "titleLabel");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setTextAlignment:", 1);

      objc_msgSend(v8, "titleLabel");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *v7);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setFont:", v15);

      objc_msgSend(v8, "setAccessibilityIdentifier:", CFSTR("footer-button"));
      -[UIStackView addArrangedSubview:](v5, "addArrangedSubview:", v8);

    }
    if (-[AAUISignInViewController _shouldShowChildSignButton](self, "_shouldShowChildSignButton"))
    {
      +[AAUIButton buttonWithType:](AAUIButton, "buttonWithType:", 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addTarget:action:forControlEvents:", self, sel__childSignInSelected_, 64);
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("SIGN_IN_FOR_CHILD_BUTTON_TITLE"), &stru_1EA2E2A18, CFSTR("Localizable"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setTitle:forState:", v18, 0);

      objc_msgSend(v16, "titleLabel");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setAdjustsFontForContentSizeCategory:", 1);

      objc_msgSend(v16, "titleLabel");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setLineBreakMode:", 0);

      objc_msgSend(v16, "titleLabel");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setNumberOfLines:", 0);

      objc_msgSend(v16, "titleLabel");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setTextAlignment:", 1);

      objc_msgSend(v16, "titleLabel");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *v7);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setFont:", v24);

      objc_msgSend(v16, "setAccessibilityIdentifier:", CFSTR("child-sign-in-button"));
      -[UIStackView addArrangedSubview:](v5, "addArrangedSubview:", v16);

    }
    v25 = self->_accountHelpStackView;
    self->_accountHelpStackView = v5;

    accountHelpStackView = self->_accountHelpStackView;
  }
  return accountHelpStackView;
}

- (id)_continueButton
{
  OBBoldTrayButton *continueButton;
  OBBoldTrayButton *v4;
  OBBoldTrayButton *v5;
  void *v6;
  void *v7;
  OBBoldTrayButton *v8;
  void *v9;
  void *v10;

  continueButton = self->_continueButton;
  if (!continueButton)
  {
    objc_msgSend(MEMORY[0x1E0D65140], "boldButton");
    v4 = (OBBoldTrayButton *)objc_claimAutoreleasedReturnValue();
    v5 = self->_continueButton;
    self->_continueButton = v4;

    objc_msgSend(MEMORY[0x1E0DC3520], "filledButtonConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setButtonSize:", 3);
    objc_msgSend(v6, "background");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCornerRadius:", 14.0);

    -[OBBoldTrayButton setConfiguration:](self->_continueButton, "setConfiguration:", v6);
    -[OBBoldTrayButton setTranslatesAutoresizingMaskIntoConstraints:](self->_continueButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v8 = self->_continueButton;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("SIGN_IN_BUTTON_CONTINUE"), &stru_1EA2E2A18, CFSTR("Localizable"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBBoldTrayButton setTitle:forState:](v8, "setTitle:forState:", v10, 0);

    -[OBBoldTrayButton addTarget:action:forControlEvents:](self->_continueButton, "addTarget:action:forControlEvents:", self, sel__continueButtonSelected_, 64);
    -[OBBoldTrayButton setAccessibilityIdentifier:](self->_continueButton, "setAccessibilityIdentifier:", CFSTR("continue-button"));

    continueButton = self->_continueButton;
  }
  return continueButton;
}

- (id)_otherOptionsButton
{
  UIButton *otherOptionsButton;
  UIButton *v4;
  void *v5;
  void *v6;
  void *v7;
  UIButton *v8;
  UIButton *v9;

  otherOptionsButton = self->_otherOptionsButton;
  if (!otherOptionsButton)
  {
    v4 = (UIButton *)objc_alloc_init(MEMORY[0x1E0DC3518]);
    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("SIGN_IN_OTHER_SIGN_IN_OPTIONS"), &stru_1EA2E2A18, CFSTR("Localizable"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitle:forState:](v4, "setTitle:forState:", v6, 0);

    -[UIButton addTarget:action:forControlEvents:](v4, "addTarget:action:forControlEvents:", self, sel__delegate_signInViewControllerDidSelectOtherOptions, 64);
    objc_msgSend(MEMORY[0x1E0DC3520], "plainButtonConfiguration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setButtonSize:", 0);
    -[UIButton setConfiguration:](v4, "setConfiguration:", v7);
    v8 = self->_otherOptionsButton;
    self->_otherOptionsButton = v4;
    v9 = v4;

    -[UIButton setAccessibilityIdentifier:](self->_otherOptionsButton, "setAccessibilityIdentifier:", CFSTR("other-options-button"));
    otherOptionsButton = self->_otherOptionsButton;
  }
  return otherOptionsButton;
}

- (void)constrainView:(id)a3 toFillHeaderFooterView:(id)a4
{
  id v5;
  id v6;
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
  id v18;
  uint64_t v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _QWORD v38[6];

  v38[4] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", v5);

  objc_msgSend(v5, "topAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "topAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToAnchor:", v28);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v27;
  objc_msgSend(v5, "leftAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "leftAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToAnchor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v38[1] = v9;
  objc_msgSend(v5, "bottomAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bottomAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v38[2] = v13;
  v32 = v5;
  objc_msgSend(v5, "rightAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v6;
  objc_msgSend(v6, "contentView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "rightAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v38[3] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 4);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v18 = v24;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v19)
  {
    v21 = v19;
    v22 = *(_QWORD *)v34;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v34 != v22)
          objc_enumerationMutation(v18);
        LODWORD(v20) = 1148829696;
        objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * v23++), "setPriority:", v20);
      }
      while (v21 != v23);
      v21 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v21);
  }

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v18);
}

- (BOOL)_hasValidCredentials
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  BOOL v8;

  -[AKBasicLoginTableViewCell cellTextField](self->_usernameCell, "cellTextField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (!v5)
    return 0;
  if (!-[AAUISignInViewController _isPasswordFieldVisible](self, "_isPasswordFieldVisible"))
    return 1;
  -[AKBasicLoginTableViewCell cellTextField](self->_passwordCell, "cellTextField");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length") != 0;

  return v8;
}

- (BOOL)_isPasswordFieldVisible
{
  return -[AAUISignInViewController _showOnlyPassword](self, "_showOnlyPassword") || self->_showingPasswordCell;
}

- (BOOL)_isGreenTeaCapable
{
  return MGGetBoolAnswer();
}

+ (BOOL)_isRunningInMuseBuddy
{
  if (_isRunningInMuseBuddy_onceToken != -1)
    dispatch_once(&_isRunningInMuseBuddy_onceToken, &__block_literal_global_2);
  return _isRunningInMuseBuddy_isRunningInMuseBuddy;
}

void __49__AAUISignInViewController__isRunningInMuseBuddy__block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "bundleIdentifier");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  _isRunningInMuseBuddy_isRunningInMuseBuddy = objc_msgSend(v0, "isEqualToString:", CFSTR("com.apple.MuseBuddy"));

}

+ (BOOL)_isRunningInSettings
{
  if (_isRunningInSettings_onceToken != -1)
    dispatch_once(&_isRunningInSettings_onceToken, &__block_literal_global_137);
  return _isRunningInSettings_isRunningInSettings;
}

void __48__AAUISignInViewController__isRunningInSettings__block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "bundleIdentifier");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  _isRunningInSettings_isRunningInSettings = objc_msgSend(v0, "isEqualToString:", CFSTR("com.apple.Preferences"));

}

+ (BOOL)_isRunningInBridge
{
  if (_isRunningInBridge_onceToken != -1)
    dispatch_once(&_isRunningInBridge_onceToken, &__block_literal_global_140);
  return _isRunningInBridge_isRunningInBridge;
}

void __46__AAUISignInViewController__isRunningInBridge__block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "bundleIdentifier");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  _isRunningInBridge_isRunningInBridge = objc_msgSend(v0, "isEqualToString:", CFSTR("com.apple.Bridge"));

}

- (BOOL)_shouldShowChildSignButton
{
  int v3;

  v3 = _os_feature_enabled_impl();
  if (v3)
    LOBYTE(v3) = -[AAUISignInViewController _showsChildSignIn](self, "_showsChildSignIn");
  return v3;
}

- (void)_setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id WeakRetained;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  UIButton *otherOptionsButton;
  void *v16;
  void *v17;
  UIColor *tintColor;
  void *v19;
  uint64_t v20;
  _BOOL8 v21;

  v3 = a3;
  -[AAUISignInViewController navigationItem](self, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "leftBarButtonItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEnabled:", v3);

  -[AKBasicLoginTableViewCell cellTextField](self->_usernameCell, "cellTextField");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setEnabled:", v3);

  -[AKBasicLoginTableViewCell cellTextField](self->_passwordCell, "cellTextField");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEnabled:", v3);

  WeakRetained = objc_loadWeakRetained((id *)&self->_forgotOrCreateButton);
  if (WeakRetained)
  {
    v10 = objc_loadWeakRetained((id *)&self->_forgotOrCreateButton);
    objc_msgSend(v10, "setEnabled:", v3);

  }
  v11 = objc_loadWeakRetained((id *)&self->_forgotButton);

  if (v11)
  {
    v12 = objc_loadWeakRetained((id *)&self->_forgotButton);
    objc_msgSend(v12, "setEnabled:", v3);

  }
  v13 = objc_loadWeakRetained((id *)&self->_createButton);

  if (v13)
  {
    v14 = objc_loadWeakRetained((id *)&self->_createButton);
    objc_msgSend(v14, "setEnabled:", v3);

  }
  otherOptionsButton = self->_otherOptionsButton;
  if (otherOptionsButton)
    -[UIButton setEnabled:](otherOptionsButton, "setEnabled:", v3);
  -[AAUISignInViewControllerTableFooterView privacyLinkController](self->_tableFooterView, "privacyLinkController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[AAUISignInViewControllerTableFooterView privacyLinkController](self->_tableFooterView, "privacyLinkController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setLinkEnabled:", v3);

    if (v3)
    {
      tintColor = self->_tintColor;
      if (tintColor)
      {
        -[AAUISignInViewControllerTableFooterView privacyLinkController](self->_tableFooterView, "privacyLinkController");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setCustomTintColor:", tintColor);

      }
      -[AAUISignInViewController _setUsernameCellWaiting:](self, "_setUsernameCellWaiting:", 0);
      goto LABEL_15;
    }
    -[AAUISignInViewController _setUsernameCellWaiting:](self, "_setUsernameCellWaiting:", 1);
LABEL_17:
    v21 = 0;
    goto LABEL_18;
  }
  v20 = v3 ^ 1;
  -[AAUISignInViewController _setUsernameCellWaiting:](self, "_setUsernameCellWaiting:", v20);
  if ((v20 & 1) != 0)
    goto LABEL_17;
LABEL_15:
  v21 = -[AAUISignInViewController _hasValidCredentials](self, "_hasValidCredentials");
LABEL_18:
  -[AAUISignInViewController _setContinueButtonEnabled:](self, "_setContinueButtonEnabled:", v21);
}

- (void)_setContinueButtonEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[AAUISignInViewController _continueButton](self, "_continueButton");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabled:", v3);

}

- (void)_continueButtonSelected:(id)a3
{
  if (-[AAUISignInViewController _hasValidCredentials](self, "_hasValidCredentials", a3))
  {
    -[AAUISignInViewController _attemptAuthentication](self, "_attemptAuthentication");
    -[AAUISignInViewController _prewarmSignInFlowIfApplicable](self, "_prewarmSignInFlowIfApplicable");
  }
}

- (void)_actionButtonSelected:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  const __CFString *v9;
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
  NSObject *v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id buf[2];
  _QWORD v33[5];
  _QWORD v34[5];
  _QWORD v35[6];

  v4 = a3;
  _AAUILogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1DB4ED000, v5, OS_LOG_TYPE_DEFAULT, "User selected the action button...", (uint8_t *)buf, 2u);
  }

  -[AAUISignInViewController _setEnabled:](self, "_setEnabled:", 0);
  if (-[AAUISignInViewController allowsAccountCreation](self, "allowsAccountCreation")
    || -[AAUISignInViewController allowSkip](self, "allowSkip"))
  {
    v29 = v4;
    -[AAUISignInViewController _resignFirstResponderForAppropriateTextField](self, "_resignFirstResponderForAppropriateTextField");
    v6 = -[AAUISignInViewController allowsAccountCreation](self, "allowsAccountCreation");
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v6)
      v9 = CFSTR("SIGN_IN_HELP_ALERT_TITLE_FORGOT_OR_CREATE");
    else
      v9 = CFSTR("SIGN_IN_HELP_ALERT_TITLE_FORGOT_PASSWORD");
    objc_msgSend(v7, "localizedStringForKey:value:table:", v9, &stru_1EA2E2A18, CFSTR("Localizable"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3450], "alertWithTitle:message:", v10, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x1E0DC3448];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("SIGN_IN_HELP_ALERT_BUTTON_FORGOT"), &stru_1EA2E2A18, CFSTR("Localizable"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __50__AAUISignInViewController__actionButtonSelected___block_invoke;
    v35[3] = &unk_1EA2DB868;
    v35[4] = self;
    objc_msgSend(v12, "actionWithTitle:style:handler:", v14, 0, v35);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addAction:", v15);

    if (-[AAUISignInViewController allowsAccountCreation](self, "allowsAccountCreation"))
    {
      v16 = (void *)MEMORY[0x1E0DC3448];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("SIGN_IN_HELP_ALERT_BUTTON_CREATE"), &stru_1EA2E2A18, CFSTR("Localizable"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __50__AAUISignInViewController__actionButtonSelected___block_invoke_2;
      v34[3] = &unk_1EA2DB868;
      v34[4] = self;
      objc_msgSend(v16, "actionWithTitle:style:handler:", v18, 0, v34);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addAction:", v19);

    }
    if (-[AAUISignInViewController allowSkip](self, "allowSkip"))
    {
      v20 = (void *)MEMORY[0x1E0DC3448];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("SIGN_IN_HELP_ALERT_BUTTON_LATER"), &stru_1EA2E2A18, CFSTR("Localizable"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = __50__AAUISignInViewController__actionButtonSelected___block_invoke_3;
      v33[3] = &unk_1EA2DB868;
      v33[4] = self;
      objc_msgSend(v20, "actionWithTitle:style:handler:", v22, 0, v33);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addAction:", v23);

    }
    objc_initWeak(buf, self);
    v24 = (void *)MEMORY[0x1E0DC3448];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("SIGN_IN_HELP_ALERT_BUTTON_CANCEL"), &stru_1EA2E2A18, CFSTR("Localizable"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __50__AAUISignInViewController__actionButtonSelected___block_invoke_4;
    v30[3] = &unk_1EA2DBA30;
    objc_copyWeak(&v31, buf);
    objc_msgSend(v24, "actionWithTitle:style:handler:", v26, 1, v30);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addAction:", v27);

    -[AAUISignInViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v11, 1, 0);
    objc_destroyWeak(&v31);
    objc_destroyWeak(buf);

    v4 = v29;
  }
  else
  {
    _AAUILogSystem();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1DB4ED000, v28, OS_LOG_TYPE_DEFAULT, "Not allowed to create account, presenting iForgot...", (uint8_t *)buf, 2u);
    }

    -[AAUISignInViewController _presentForgotAppleIDPane](self, "_presentForgotAppleIDPane");
  }

}

uint64_t __50__AAUISignInViewController__actionButtonSelected___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_presentForgotAppleIDPane");
}

uint64_t __50__AAUISignInViewController__actionButtonSelected___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_presentCreateAppleIDPane");
}

uint64_t __50__AAUISignInViewController__actionButtonSelected___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_delegate_signInViewControllerDidSkip");
}

void __50__AAUISignInViewController__actionButtonSelected___block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  uint8_t v3[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_setEnabled:", 1);

  _AAUILogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1DB4ED000, v2, OS_LOG_TYPE_DEFAULT, "User canceled the action alert.", v3, 2u);
  }

}

- (void)_resignFirstResponderForAppropriateTextField
{
  _BOOL4 v3;
  int *v4;
  id v5;

  v3 = -[AAUISignInViewController _isPasswordFieldVisible](self, "_isPasswordFieldVisible");
  v4 = &OBJC_IVAR___AAUISignInViewController__usernameCell;
  if (v3)
    v4 = &OBJC_IVAR___AAUISignInViewController__passwordCell;
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v4), "cellTextField");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resignFirstResponder");

}

- (void)_presentCreateAppleIDPane
{
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  _QWORD v13[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  -[AAUISignInViewController authenticationContext](self, "authenticationContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsCredentialRecovery:", 0);
  objc_msgSend(v3, "setNeedsNewAppleID:", 1);
  v14 = 0;
  v15 = &v14;
  v16 = 0x2050000000;
  v4 = (void *)getBYWarrantyClass_softClass;
  v17 = getBYWarrantyClass_softClass;
  if (!getBYWarrantyClass_softClass)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __getBYWarrantyClass_block_invoke;
    v13[3] = &unk_1EA2DB6E8;
    v13[4] = &v14;
    __getBYWarrantyClass_block_invoke((uint64_t)v13);
    v4 = (void *)v15[3];
  }
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v14, 8);
  if (objc_msgSend(v5, "shouldDisplay"))
  {
    _AAUILogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13[0]) = 0;
      _os_log_impl(&dword_1DB4ED000, v6, OS_LOG_TYPE_DEFAULT, "Device warranty needed", (uint8_t *)v13, 2u);
    }

    objc_msgSend(v3, "httpHeadersForRemoteUI");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "mutableCopy");
    v9 = v8;
    if (v8)
      v10 = v8;
    else
      v10 = (id)objc_opt_new();
    v11 = v10;

    objc_msgSend(v11, "setObject:forKey:", CFSTR("true"), CFSTR("X-MMe-Show-Warranty"));
    objc_msgSend(v3, "setHttpHeadersForRemoteUI:", v11);

  }
  _AAUILogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v13[0]) = 0;
    _os_log_impl(&dword_1DB4ED000, v12, OS_LOG_TYPE_DEFAULT, "User wants a new Apple ID, presenting AuthKit...", (uint8_t *)v13, 2u);
  }

  -[AAUISignInViewController _attemptAuthenticationWithContext:](self, "_attemptAuthenticationWithContext:", v3);
}

- (void)_presentForgotAppleIDPane
{
  void *v3;
  NSObject *v4;
  uint8_t v5[16];

  -[AAUISignInViewController authenticationContext](self, "authenticationContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsCredentialRecovery:", 1);
  objc_msgSend(v3, "setNeedsNewAppleID:", 0);
  _AAUILogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1DB4ED000, v4, OS_LOG_TYPE_DEFAULT, "User forgot their Apple ID, presenting AuthKit...", v5, 2u);
  }

  -[AAUISignInViewController _attemptAuthenticationWithContext:](self, "_attemptAuthenticationWithContext:", v3);
}

- (void)_childSignInSelected:(id)a3
{
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  _AAUILogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1DB4ED000, v4, OS_LOG_TYPE_DEFAULT, "User selected the child sign in button...", v6, 2u);
  }

  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[AAUISignInViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "signInViewControllerDidSelectChildSignIn:", self);

}

- (void)_prewarmSignInFlowIfApplicable
{
  id v2;

  if (-[AAUISignInViewController showServiceIcons](self, "showServiceIcons"))
  {
    v2 = objc_alloc_init(MEMORY[0x1E0CFAD28]);
    objc_msgSend(v2, "prewarmOperationsWithCompletion:", 0);

  }
}

- (void)_attemptAuthentication
{
  void (**passwordHandler)(id, void *, _QWORD);
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[AAUISignInViewController _formatUsernameAsPhoneNumberIfNeeded](self, "_formatUsernameAsPhoneNumberIfNeeded");
  if (self->_passwordHandler)
  {
    -[AAUISignInViewController _setEnabled:](self, "_setEnabled:", 0);
    passwordHandler = (void (**)(id, void *, _QWORD))self->_passwordHandler;
    -[AKBasicLoginTableViewCell cellTextField](self->_passwordCell, "cellTextField");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "text");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    passwordHandler[2](passwordHandler, v5, 0);

    v6 = self->_passwordHandler;
    self->_passwordHandler = 0;

  }
  else
  {
    -[AKBasicLoginTableViewCell cellTextField](self->_usernameCell, "cellTextField");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "text");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[AAUISignInViewController _serverFriendlyUsername:](self, "_serverFriendlyUsername:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[AAUISignInViewController _isPasswordFieldVisible](self, "_isPasswordFieldVisible"))
    {
      -[AKBasicLoginTableViewCell cellTextField](self->_passwordCell, "cellTextField");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "text");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v11 = 0;
    }
    -[AAUISignInViewController authenticationContext](self, "authenticationContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setNeedsCredentialRecovery:", 0);
    objc_msgSend(v12, "setNeedsNewAppleID:", 0);
    objc_msgSend(v12, "setUsername:", v9);
    objc_msgSend(v12, "_setPassword:", v11);
    objc_msgSend(v12, "_setPasswordDelegate:", self);
    if (+[AAUISignInViewController _isRunningInSettings](AAUISignInViewController, "_isRunningInSettings")&& !-[AAUISignInViewController isChildSetupFlow](self, "isChildSetupFlow"))
    {
      objc_msgSend(v12, "setAppProvidedContext:", *MEMORY[0x1E0CFFF28]);
    }
    _AAUILogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138543362;
      v15 = v9;
      _os_log_impl(&dword_1DB4ED000, v13, OS_LOG_TYPE_DEFAULT, "Attempting authentication for username '%{public}@'", (uint8_t *)&v14, 0xCu);
    }

    -[AAUISignInViewController _attemptAuthenticationWithContext:](self, "_attemptAuthenticationWithContext:", v12);
  }
}

- (void)_attemptAuthenticationWithContext:(id)a3
{
  id v4;
  id WeakRetained;
  char v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  -[AAUISignInViewController _setEnabled:](self, "_setEnabled:", 0);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v7, "willAuthenticateWithContext:", v4);

  }
  _AAUILogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[AAUISignInViewController _attemptAuthenticationWithContext:].cold.1(v8, v9, v10);

  objc_msgSend(MEMORY[0x1E0CFACE8], "verifyAndFixPersonaIfNeeded:desiredContext:", self->_originalPersona, self->_originalPersonaContext);
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__2;
  v17 = __Block_byref_object_dispose__2;
  -[AAUISignInViewController authenticationController](self, "authenticationController");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v14[5], "setDelegate:", self);
  v11 = (void *)v14[5];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __62__AAUISignInViewController__attemptAuthenticationWithContext___block_invoke;
  v12[3] = &unk_1EA2DBA58;
  v12[4] = self;
  v12[5] = &v13;
  objc_msgSend(v11, "authenticateWithContext:completion:", v4, v12);
  objc_msgSend(MEMORY[0x1E0CFACE8], "personaConsistencyCheck:", self->_originalPersona);
  _Block_object_dispose(&v13, 8);

}

void __62__AAUISignInViewController__attemptAuthenticationWithContext___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  _QWORD block[4];
  id v13;
  uint64_t v14;
  id v15;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__AAUISignInViewController__attemptAuthenticationWithContext___block_invoke_2;
  block[3] = &unk_1EA2DB818;
  v7 = *(_QWORD *)(a1 + 32);
  v13 = v5;
  v14 = v7;
  v15 = v6;
  v8 = v6;
  v9 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = 0;

}

void __62__AAUISignInViewController__attemptAuthenticationWithContext___block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  const __CFString *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[5];
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  const __CFString *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x1E0CFFF98]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    _AAUILogSystem();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB4ED000, v3, OS_LOG_TYPE_DEFAULT, "Server returned continuation data, attempting to repair account...", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 40), "_repairCloudAccountWithAuthenticationResults:", *(_QWORD *)(a1 + 32));
LABEL_5:
    objc_msgSend(*(id *)(a1 + 40), "_setEnabled:", 1);
    return;
  }
  v4 = *(void **)(a1 + 32);
  if (!v4)
  {
    _AAUILogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __62__AAUISignInViewController__attemptAuthenticationWithContext___block_invoke_2_cold_1(a1, v11, v12, v13, v14, v15, v16, v17);

    goto LABEL_5;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CFFFC8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x1E0CFFFA0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _AAUILogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = CFSTR("(*****)");
    if (!v6)
      v8 = CFSTR("(null)");
    *(_DWORD *)buf = 138543618;
    v20 = v5;
    v21 = 2114;
    v22 = v8;
    _os_log_impl(&dword_1DB4ED000, v7, OS_LOG_TYPE_DEFAULT, "Successfully authenticated account for username: %{public}@, password: %{public}@", buf, 0x16u);
  }

  v10 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(a1 + 40);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __62__AAUISignInViewController__attemptAuthenticationWithContext___block_invoke_175;
  v18[3] = &unk_1EA2DB208;
  v18[4] = v9;
  objc_msgSend(v9, "_delegate_signInViewControllerDidCompleteWithAuthenticationResults:completionHandler:", v10, v18);

}

uint64_t __62__AAUISignInViewController__attemptAuthenticationWithContext___block_invoke_175(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setEnabled:", 1);
}

- (void)_repairCloudAccountWithAuthenticationResults:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  _QWORD v15[5];
  uint8_t buf[16];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  AAUIRemoteUIController *v22;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CFAD58], "urlConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "repairCloudAccountUIURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A8]), "initWithURL:", v7);
  objc_msgSend(v8, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CFFF98]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:forHTTPHeaderField:", v9, CFSTR("X-Apple-AK-Continuation-Data"));

  -[AAUISignInViewController _authorizationValueForAuthenticationResults:](self, "_authorizationValueForAuthenticationResults:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:forHTTPHeaderField:", v10, CFSTR("Authorization"));

  objc_msgSend(v8, "ak_addCountryHeader");
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__2;
  v21 = __Block_byref_object_dispose__2;
  v22 = -[AAUIRemoteUIController initWithIdentifier:]([AAUIRemoteUIController alloc], "initWithIdentifier:", CFSTR("com.apple.AppleAccountUI.SignIn"));
  objc_msgSend((id)v18[5], "setDelegate:", self);
  v11 = (void *)v18[5];
  -[AAUISignInViewController navigationController](self, "navigationController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setNavigationController:", v12);

  _AAUILogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DB4ED000, v13, OS_LOG_TYPE_DEFAULT, "Calling out to server to repair account...", buf, 2u);
  }

  v14 = (void *)v18[5];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __73__AAUISignInViewController__repairCloudAccountWithAuthenticationResults___block_invoke;
  v15[3] = &unk_1EA2DBA80;
  v15[4] = &v17;
  objc_msgSend(v14, "loadRequest:completion:", v8, v15);
  _Block_object_dispose(&v17, 8);

}

void __73__AAUISignInViewController__repairCloudAccountWithAuthenticationResults___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  const __CFString *v7;
  uint64_t v8;
  void *v9;
  int v10;
  const __CFString *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _AAUILogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("NO");
    if (a2)
      v7 = CFSTR("YES");
    v10 = 138412546;
    v11 = v7;
    v12 = 2112;
    v13 = v5;
    _os_log_impl(&dword_1DB4ED000, v6, OS_LOG_TYPE_DEFAULT, "Request came back with success: %@, error: %@", (uint8_t *)&v10, 0x16u);
  }

  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = 0;

}

- (BOOL)_showOnlyPassword
{
  BOOL v2;
  void *v3;
  void *v4;

  if (!self->_username || self->_canEditUsername)
    return 0;
  -[AAUISignInViewController authenticationContext](self, "authenticationContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "proxiedDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v4 != 0;

  return v2;
}

- (id)_authorizationValueForAuthenticationResults:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = *MEMORY[0x1E0CFFF40];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CFFFA0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "length") && objc_msgSend(v6, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@"), v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dataUsingEncoding:", 4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "base64EncodedStringWithOptions:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Basic %@"), v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)_cancelPasswordDelegateIfNecessary
{
  void (**passwordHandler)(id, _QWORD, void *);
  void *v4;
  id v5;

  passwordHandler = (void (**)(id, _QWORD, void *))self->_passwordHandler;
  if (passwordHandler)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CFFF10], -7003, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    passwordHandler[2](passwordHandler, 0, v4);

    v5 = self->_passwordHandler;
    self->_passwordHandler = 0;

  }
}

- (void)_setPasswordFieldHidden:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL4 v5;
  void *v6;
  void *v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t);
  void *v12;
  AAUISignInViewController *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  AAUISignInViewController *v18;

  v3 = a3;
  v5 = -[AAUISignInViewController _isPasswordFieldVisible](self, "_isPasswordFieldVisible");
  if (v3)
  {
    if (!v5)
      return;
    -[AKBasicLoginTableViewCell cellTextField](self->_passwordCell, "cellTextField");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setText:", 0);

    self->_showingPasswordCell = 0;
    v7 = (void *)MEMORY[0x1E0DC3F10];
    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __52__AAUISignInViewController__setPasswordFieldHidden___block_invoke;
    v17 = &unk_1EA2DB208;
    v18 = self;
    v8 = &v14;
  }
  else
  {
    if (v5)
      return;
    self->_showingPasswordCell = 1;
    v7 = (void *)MEMORY[0x1E0DC3F10];
    v9 = MEMORY[0x1E0C809B0];
    v10 = 3221225472;
    v11 = __52__AAUISignInViewController__setPasswordFieldHidden___block_invoke_4;
    v12 = &unk_1EA2DB208;
    v13 = self;
    v8 = &v9;
  }
  objc_msgSend(v7, "animateWithDuration:animations:", v8, 0.2, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18);
}

uint64_t __52__AAUISignInViewController__setPasswordFieldHidden___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD v5[5];
  _QWORD v6[5];

  objc_msgSend(*(id *)(a1 + 32), "_updateExpandingViewInFooterForCellChange:", 1);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 968);
  v5[4] = v2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__AAUISignInViewController__setPasswordFieldHidden___block_invoke_2;
  v6[3] = &unk_1EA2DB208;
  v6[4] = v2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__AAUISignInViewController__setPasswordFieldHidden___block_invoke_3;
  v5[3] = &unk_1EA2DBAA8;
  return objc_msgSend(v3, "performBatchUpdates:completion:", v6, v5);
}

void __52__AAUISignInViewController__setPasswordFieldHidden___block_invoke_2(uint64_t a1)
{
  _QWORD *v1;
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD **)(a1 + 32);
  v2 = (void *)v1[121];
  objc_msgSend(v1, "_passwordFieldIndexPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deleteRowsAtIndexPaths:withRowAnimation:", v4, 3);

}

void __52__AAUISignInViewController__setPasswordFieldHidden___block_invoke_3(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "cellTextField");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "becomeFirstResponder");

}

uint64_t __52__AAUISignInViewController__setPasswordFieldHidden___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD v5[5];
  _QWORD v6[5];

  objc_msgSend(*(id *)(a1 + 32), "_updateExpandingViewInFooterForCellChange:", 1);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 968);
  v5[4] = v2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__AAUISignInViewController__setPasswordFieldHidden___block_invoke_5;
  v6[3] = &unk_1EA2DB208;
  v6[4] = v2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__AAUISignInViewController__setPasswordFieldHidden___block_invoke_6;
  v5[3] = &unk_1EA2DBAA8;
  return objc_msgSend(v3, "performBatchUpdates:completion:", v6, v5);
}

void __52__AAUISignInViewController__setPasswordFieldHidden___block_invoke_5(uint64_t a1)
{
  _QWORD *v1;
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD **)(a1 + 32);
  v2 = (void *)v1[121];
  objc_msgSend(v1, "_passwordFieldIndexPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "insertRowsAtIndexPaths:withRowAnimation:", v4, 4);

}

uint64_t __52__AAUISignInViewController__setPasswordFieldHidden___block_invoke_6(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 984), "cellTextField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "becomeFirstResponder");

  return objc_msgSend(*(id *)(a1 + 32), "_setContinueButtonEnabled:", objc_msgSend(*(id *)(a1 + 32), "_hasValidCredentials"));
}

- (void)_setUsernameCellWaiting:(BOOL)a3
{
  OBBoldTrayButton *continueButton;

  continueButton = self->_continueButton;
  if (a3)
    -[OBBoldTrayButton showsBusyIndicator](continueButton, "showsBusyIndicator");
  else
    -[OBBoldTrayButton hidesBusyIndicator](continueButton, "hidesBusyIndicator");
}

- (id)_passwordFieldIndexPath
{
  return (id)objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 1, 0);
}

- (void)_formatUsernameAsPhoneNumberIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[AKBasicLoginTableViewCell cellTextField](self->_usernameCell, "cellTextField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "text");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v7, "containsString:", CFSTR("@")) & 1) == 0)
  {
    v4 = (void *)objc_opt_new();
    objc_msgSend(v4, "displayFormatFor:", v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKBasicLoginTableViewCell cellTextField](self->_usernameCell, "cellTextField");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setText:", v5);

  }
}

- (id)_serverFriendlyUsername:(id)a3
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
    objc_msgSend(v5, "normalizedFormatFor:", v3);
    v4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (void)_beginObservingTextFieldDidChangeNotifications
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__textFieldDidChange_, *MEMORY[0x1E0DC54D0], 0);

}

- (void)_endObservingTextFieldDidChangeNotifications
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC54D0], 0);

}

- (void)_textFieldDidChange:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;

  objc_msgSend(a3, "object");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[AKBasicLoginTableViewCell cellTextField](self->_usernameCell, "cellTextField");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v7 == v4)
  {

LABEL_5:
    -[AAUISignInViewController _setContinueButtonEnabled:](self, "_setContinueButtonEnabled:", -[AAUISignInViewController _hasValidCredentials](self, "_hasValidCredentials"));
    v6 = v7;
    goto LABEL_6;
  }
  -[AKBasicLoginTableViewCell cellTextField](self->_passwordCell, "cellTextField");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v7;
  if (v7 == v5)
    goto LABEL_5;
LABEL_6:

}

- (void)_beginObservingKeyboardWillShowNotifications
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__keyboardWillShow_, *MEMORY[0x1E0DC4FE8], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__keyboardWillShow_, *MEMORY[0x1E0DC4FD8], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__keyboardWillHide_, *MEMORY[0x1E0DC4FE0], 0);

}

- (void)_endObservingKeyboardWillShowNotifications
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC4FE8], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x1E0DC4FD8], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:name:object:", self, *MEMORY[0x1E0DC4FE0], 0);

}

- (void)_keyboardWillShow:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double Height;
  double v23;
  void *v24;
  int v25;
  double v26;
  void *v27;
  double v28;
  void *v29;
  _QWORD v30[6];
  CGRect v31;
  CGRect v32;

  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0DC4E48]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0DC4E90]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[AAUISignInViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "CGRectValue");
  objc_msgSend(v9, "convertRect:fromView:", 0);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  if (+[AAUISignInViewController _isRunningInSettings](AAUISignInViewController, "_isRunningInSettings"))
  {
    -[AAUISignInViewController view](self, "view");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "safeAreaInsets");
    v20 = v19;

  }
  else
  {
    -[AAUISignInViewController view](self, "view");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "bounds");
    Height = CGRectGetHeight(v31);
    v32.origin.x = v11;
    v32.origin.y = v13;
    v32.size.width = v15;
    v32.size.height = v17;
    v23 = Height - CGRectGetMinY(v32);

    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "sf_isiPad");

    if (v25)
    {
      -[AAUISignInViewController _navigationBarHeight](self, "_navigationBarHeight");
      v23 = v23 - v26;
    }
    -[AAUISignInViewController view](self, "view");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "safeAreaInsets");
    v20 = v28;

    if (v20 < v23)
      v20 = v23;
  }
  v29 = (void *)MEMORY[0x1E0DC3F10];
  objc_msgSend(v6, "doubleValue");
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __46__AAUISignInViewController__keyboardWillShow___block_invoke;
  v30[3] = &unk_1EA2DBAD0;
  v30[4] = self;
  *(double *)&v30[5] = v20;
  objc_msgSend(v29, "animateWithDuration:animations:", v30);

}

uint64_t __46__AAUISignInViewController__keyboardWillShow___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateContentInsetWithHeight:", *(double *)(a1 + 40));
}

- (void)_keyboardWillHide:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0DC4E48]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0DC3F10];
  objc_msgSend(v5, "doubleValue");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__AAUISignInViewController__keyboardWillHide___block_invoke;
  v7[3] = &unk_1EA2DB208;
  v7[4] = self;
  objc_msgSend(v6, "animateWithDuration:animations:", v7);

}

void __46__AAUISignInViewController__keyboardWillHide___block_invoke(uint64_t a1)
{
  void *v1;
  double v2;
  id v3;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "view");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeAreaInsets");
  objc_msgSend(v1, "_updateContentInsetWithHeight:", v2);

}

- (void)_updateContentInsetWithHeight:(double)a3
{
  -[UITableView _setContentScrollInset:](self->_tableView, "_setContentScrollInset:", 0.0, 0.0, a3, 0.0);
  -[AAUISignInViewController _updateScrollIndicatorInsetWithHeight:](self, "_updateScrollIndicatorInsetWithHeight:", a3);
}

- (void)_updateScrollIndicatorInsetWithHeight:(double)a3
{
  double MaxX;
  void *v6;
  CGRect v7;
  CGRect v8;

  -[UITableView frame](self->_tableView, "frame");
  MaxX = CGRectGetMaxX(v7);
  -[AAUISignInViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  -[UITableView setScrollIndicatorInsets:](self->_tableView, "setScrollIndicatorInsets:", 0.0, 0.0, a3, MaxX - CGRectGetWidth(v8));

  -[UITableView setNeedsLayout](self->_tableView, "setNeedsLayout");
}

- (void)_beginObservingSizeCategoryNotification
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_sizeCategoryDidChange_, *MEMORY[0x1E0DC48E8], 0);

}

- (void)_endObservingSizeCategoryNotification
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC48E8], 0);

}

- (void)sizeCategoryDidChange:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__AAUISignInViewController_sizeCategoryDidChange___block_invoke;
  block[3] = &unk_1EA2DB208;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __50__AAUISignInViewController_sizeCategoryDidChange___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 976);
  *(_QWORD *)(v2 + 976) = 0;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 984);
  *(_QWORD *)(v4 + 984) = 0;

  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 1032);
  *(_QWORD *)(v6 + 1032) = 0;

  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 1040);
  *(_QWORD *)(v8 + 1040) = 0;

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "reloadData");
}

- (void)_delegate_signInViewControllerDidCompleteWithAuthenticationResults:(id)a3 completionHandler:(id)a4
{
  void (**v6)(_QWORD);
  void *v7;
  id v8;

  v8 = a3;
  v6 = (void (**)(_QWORD))a4;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[AAUISignInViewController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v7, "signInViewController:didCompleteWithAuthenticationResults:completionHandler:", self, v8, v6);
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v7, "signInViewController:didCompleteWithAuthenticationResults:", self, v8);
    if (v6)
      v6[2](v6);
  }
  else
  {
    if (v6)
      v6[2](v6);
    -[AAUISignInViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  }

}

- (void)_delegate_signInViewControllerDidCancel
{
  id v3;

  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[AAUISignInViewController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "signInViewControllerDidCancel:", self);
  else
    -[AAUISignInViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)_delegate_signInViewControllerDidSkip
{
  id v3;

  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[AAUISignInViewController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "signInViewControllerDidSkip:", self);
  else
    -[AAUISignInViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)_delegate_signInViewControllerDidSelectOtherOptions
{
  id v3;

  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[AAUISignInViewController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "signInViewControllerDidSelectOtherOptions:", self);
  else
    -[AAUISignInViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)context:(id)a3 needsPasswordWithCompletion:(id)a4
{
  void *v5;
  id passwordHandler;

  v5 = _Block_copy(a4);
  passwordHandler = self->_passwordHandler;
  self->_passwordHandler = v5;

  -[AAUISignInViewController _setPasswordFieldHidden:](self, "_setPasswordFieldHidden:", 0);
  -[AAUISignInViewController _setEnabled:](self, "_setEnabled:", 1);
}

- (void)authenticationController:(id)a3 shouldContinueWithAuthenticationResults:(id)a4 error:(id)a5 forContext:(id)a6 completion:(id)a7
{
  id v11;
  id v12;
  id v13;
  void (**v14)(id, _QWORD);
  NSObject *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint8_t v25[16];

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void (**)(id, _QWORD))a7;
  dispatch_assert_queue_not_V2(MEMORY[0x1E0C80D38]);
  _AAUILogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v25 = 0;
    _os_log_impl(&dword_1DB4ED000, v15, OS_LOG_TYPE_DEFAULT, "Authentication controller called back with auth results.", v25, 2u);
  }

  -[AAUISignInViewController delegate](self, "delegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    _AAUILogSystem();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      -[AAUISignInViewController authenticationController:shouldContinueWithAuthenticationResults:error:forContext:completion:].cold.1(v17);

    objc_msgSend(v16, "signInViewController:shouldContinueWithAuthenticationResults:error:forContext:completion:", self, v11, v12, v13, v14);
  }
  else if (v12)
  {
    _AAUILogSystem();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[AAUISignInViewController authenticationController:shouldContinueWithAuthenticationResults:error:forContext:completion:].cold.2((uint64_t)v12, v18, v19, v20, v21, v22, v23, v24);

    v14[2](v14, 0);
  }
  else
  {
    v14[2](v14, 1);
  }

}

- (BOOL)remoteUIController:(id)a3 shouldLoadRequest:(id)a4 redirectResponse:(id)a5
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a4;
  objc_msgSend(v5, "setValue:forHTTPHeaderField:", CFSTR("application/x-plist"), CFSTR("Content-Type"));
  objc_msgSend(MEMORY[0x1E0CFAC38], "userAgentHeader");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forHTTPHeaderField:", v6, CFSTR("User-Agent"));

  objc_msgSend(MEMORY[0x1E0CFAC38], "clientInfoHeader");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forHTTPHeaderField:", v7, CFSTR("X-MMe-Client-Info"));

  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0C997B0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "uppercaseString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forHTTPHeaderField:", v10, CFSTR("X-MMe-Country"));

  return 1;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (!self->_showingPasswordCell)
    return 1;
  if (-[AAUISignInViewController _showOnlyPassword](self, "_showOnlyPassword", a3, a4))
    return 1;
  return 2;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  id v13;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "section") || objc_msgSend(v7, "row"))
  {
    -[AAUISignInViewController _passwordFieldIndexPath](self, "_passwordFieldIndexPath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqual:", v8);

    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid index path (%@) for %@."), v7, self);
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], objc_claimAutoreleasedReturnValue(), 0);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v13);
    }
  }
  else if (!-[AAUISignInViewController _showOnlyPassword](self, "_showOnlyPassword"))
  {
    -[AAUISignInViewController _usernameCell](self, "_usernameCell");
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  -[AAUISignInViewController _passwordCell](self, "_passwordCell");
  v10 = objc_claimAutoreleasedReturnValue();
LABEL_5:
  v11 = (void *)v10;

  return v11;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v5;

  v5 = a4;
  objc_msgSend(v5, "setSeparatorStyle:", 1);
  objc_msgSend(v5, "_setShouldHaveFullLengthBottomSeparator:", 0);
  objc_msgSend(v5, "_setShouldHaveFullLengthTopSeparator:", 0);

}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  if (a4)
  {
    v6 = 0;
  }
  else
  {
    -[AAUISignInViewController _tableHeaderView](self, "_tableHeaderView", a3, v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  void *v4;

  if (a4)
  {
    v4 = 0;
  }
  else
  {
    -[AAUISignInViewController _tableFooterView](self, "_tableFooterView", a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setNeedsLayout");
    objc_msgSend(v4, "layoutIfNeeded");
  }
  return v4;
}

- (id)_tableFooterView
{
  AAUISignInViewControllerTableFooterView *tableFooterView;
  AAUISignInViewControllerTableFooterView *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  UIColor *tintColor;
  void *v11;
  AAUISignInViewControllerTableFooterView *v12;

  tableFooterView = self->_tableFooterView;
  if (!tableFooterView)
  {
    -[UITableView dequeueReusableHeaderFooterViewWithIdentifier:](self->_tableView, "dequeueReusableHeaderFooterViewWithIdentifier:", CFSTR("AAUISignInViewControllerTableFooterView"));
    v4 = (AAUISignInViewControllerTableFooterView *)objc_claimAutoreleasedReturnValue();
    -[AAUISignInViewControllerTableFooterView setParentForPrivacyController:](v4, "setParentForPrivacyController:", self);
    -[AAUISignInViewController privacyLinkIdentifiers](self, "privacyLinkIdentifiers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAUISignInViewControllerTableFooterView setPrivacyLinkIdentifiers:](v4, "setPrivacyLinkIdentifiers:", v5);

    -[AAUISignInViewController _accountHelpStackView](self, "_accountHelpStackView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAUISignInViewControllerTableFooterView addActionButtonStackView:](v4, "addActionButtonStackView:", v6);

    -[AAUISignInViewController _continueButton](self, "_continueButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAUISignInViewControllerTableFooterView addContinueButton:](v4, "addContinueButton:", v7);

    if (-[AAUISignInViewController showOtherOptions](self, "showOtherOptions"))
    {
      -[AAUISignInViewController _otherOptionsButton](self, "_otherOptionsButton");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[AAUISignInViewControllerTableFooterView addOtherButton:](v4, "addOtherButton:", v8);

    }
    -[AAUISignInViewControllerTableFooterView privacyLinkController](v4, "privacyLinkController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      tintColor = self->_tintColor;
      -[AAUISignInViewControllerTableFooterView privacyLinkController](v4, "privacyLinkController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setCustomTintColor:", tintColor);

    }
    v12 = self->_tableFooterView;
    self->_tableFooterView = v4;

    tableFooterView = self->_tableFooterView;
  }
  return tableFooterView;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;

  -[AAUISignInViewController _tableFooterView](self, "_tableFooterView", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNeedsLayout");

  objc_msgSend(v4, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layoutIfNeeded");

  objc_msgSend(v4, "totalHeight");
  v8 = v7;

  return v8;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  void *v4;
  NSString *v5;
  _BOOL4 IsAccessibilityCategory;
  double result;

  -[AAUISignInViewController traitCollection](self, "traitCollection", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSizeCategory");
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v5);

  result = *MEMORY[0x1E0DC53D8];
  if (!IsAccessibilityCategory)
    return 44.0;
  return result;
}

- (BOOL)tableView:(id)a3 shouldDrawTopSeparatorForSection:(int64_t)a4
{
  return 1;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  if (-[AAUISignInViewController _hasValidCredentials](self, "_hasValidCredentials", a3))
    -[AAUISignInViewController _attemptAuthentication](self, "_attemptAuthentication");
  return 1;
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  char v11;

  v7 = a3;
  v8 = a5;
  -[AKBasicLoginTableViewCell cellTextField](self->_usernameCell, "cellTextField");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (v9 == v7 && -[AAUISignInViewController _isPasswordFieldVisible](self, "_isPasswordFieldVisible"))
  {
    objc_msgSend(v7, "text");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", v8);

    if ((v11 & 1) == 0)
    {
      -[AAUISignInViewController _cancelPasswordDelegateIfNecessary](self, "_cancelPasswordDelegateIfNecessary");
      -[AAUISignInViewController _setPasswordFieldHidden:](self, "_setPasswordFieldHidden:", 1);
    }
  }
  else
  {

  }
  return 1;
}

- (int64_t)_akServiceType
{
  return self->_akServiceType;
}

- (void)_setAkServiceType:(int64_t)a3
{
  self->_akServiceType = a3;
}

- (BOOL)_shouldAnticipatePiggybacking
{
  return self->_shouldAnticipatePiggybacking;
}

- (void)_setShouldAnticipatePiggybacking:(BOOL)a3
{
  self->_shouldAnticipatePiggybacking = a3;
}

- (AAUISignInViewControllerDelegate)delegate
{
  return (AAUISignInViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)allowsAccountCreation
{
  return self->_allowsAccountCreation;
}

- (void)setAllowsAccountCreation:(BOOL)a3
{
  self->_allowsAccountCreation = a3;
}

- (BOOL)showServiceIcons
{
  return self->_showServiceIcons;
}

- (void)setShowServiceIcons:(BOOL)a3
{
  self->_showServiceIcons = a3;
}

- (int64_t)tableViewStyle
{
  return self->_tableViewStyle;
}

- (void)setTableViewStyle:(int64_t)a3
{
  self->_tableViewStyle = a3;
}

- (UIColor)cellBackgroundColor
{
  return self->_cellBackgroundColor;
}

- (void)setCellBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_cellBackgroundColor, a3);
}

- (NSString)footerText
{
  return self->_footerText;
}

- (void)setFooterText:(id)a3
{
  objc_storeStrong((id *)&self->_footerText, a3);
}

- (NSString)messageLabel
{
  return self->_messageLabel;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void)setTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_tintColor, a3);
}

- (NSString)username
{
  return self->_username;
}

- (void)setUsername:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1152);
}

- (BOOL)canEditUsername
{
  return self->_canEditUsername;
}

- (void)setCanEditUsername:(BOOL)a3
{
  self->_canEditUsername = a3;
}

- (BOOL)allowSkip
{
  return self->_allowSkip;
}

- (void)setAllowSkip:(BOOL)a3
{
  self->_allowSkip = a3;
}

- (BOOL)shouldShowSystemBackButton
{
  return self->_shouldShowSystemBackButton;
}

- (void)setShouldShowSystemBackButton:(BOOL)a3
{
  self->_shouldShowSystemBackButton = a3;
}

- (NSArray)privacyLinkIdentifiers
{
  return self->_privacyLinkIdentifiers;
}

- (void)setPrivacyLinkIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1160);
}

- (BOOL)isChildSetupFlow
{
  return self->_childSetupFlow;
}

- (void)setChildSetupFlow:(BOOL)a3
{
  self->_childSetupFlow = a3;
}

- (BOOL)showingPasswordCell
{
  return self->_showingPasswordCell;
}

- (void)setShowingPasswordCell:(BOOL)a3
{
  self->_showingPasswordCell = a3;
}

- (AAUIAppleLogoMicaView)appleLogoMicaView
{
  return self->_appleLogoMicaView;
}

- (void)setAppleLogoMicaView:(id)a3
{
  objc_storeStrong((id *)&self->_appleLogoMicaView, a3);
}

- (UIView)logoContainerView
{
  return self->_logoContainerView;
}

- (void)setLogoContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_logoContainerView, a3);
}

- (NSNumber)initialHeight
{
  return self->_initialHeight;
}

- (void)setInitialHeight:(id)a3
{
  objc_storeStrong((id *)&self->_initialHeight, a3);
}

- (UIButton)forgotOrCreateButton
{
  return (UIButton *)objc_loadWeakRetained((id *)&self->_forgotOrCreateButton);
}

- (void)setForgotOrCreateButton:(id)a3
{
  objc_storeWeak((id *)&self->_forgotOrCreateButton, a3);
}

- (AAUIButton)forgotButton
{
  return (AAUIButton *)objc_loadWeakRetained((id *)&self->_forgotButton);
}

- (void)setForgotButton:(id)a3
{
  objc_storeWeak((id *)&self->_forgotButton, a3);
}

- (AAUIButton)createButton
{
  return (AAUIButton *)objc_loadWeakRetained((id *)&self->_createButton);
}

- (void)setCreateButton:(id)a3
{
  objc_storeWeak((id *)&self->_createButton, a3);
}

- (BOOL)hideCreationAndForgotPasswordButton
{
  return self->_hideCreationAndForgotPasswordButton;
}

- (UIStackView)accountHelpStackView
{
  return self->_accountHelpStackView;
}

- (void)setAccountHelpStackView:(id)a3
{
  objc_storeStrong((id *)&self->_accountHelpStackView, a3);
}

- (BOOL)_showsChildSignIn
{
  return self->__showsChildSignIn;
}

- (void)setShowsChildSignIn:(BOOL)a3
{
  self->__showsChildSignIn = a3;
}

- (AKURLBag)akURLBag
{
  return self->_akURLBag;
}

- (void)setAKURLBag:(id)a3
{
  objc_storeStrong((id *)&self->_akURLBag, a3);
}

- (BOOL)showOtherOptions
{
  return self->_showOtherOptions;
}

- (void)setShowOtherOptions:(BOOL)a3
{
  self->_showOtherOptions = a3;
}

- (BOOL)hidesBackOrCancelButton
{
  return self->_hidesBackOrCancelButton;
}

- (void)setHidesBackOrCancelButton:(BOOL)a3
{
  self->_hidesBackOrCancelButton = a3;
}

- (void)setAuthenticationController:(id)a3
{
  objc_storeStrong((id *)&self->_authenticationController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authenticationController, 0);
  objc_storeStrong((id *)&self->_akURLBag, 0);
  objc_storeStrong((id *)&self->_accountHelpStackView, 0);
  objc_destroyWeak((id *)&self->_createButton);
  objc_destroyWeak((id *)&self->_forgotButton);
  objc_destroyWeak((id *)&self->_forgotOrCreateButton);
  objc_storeStrong((id *)&self->_initialHeight, 0);
  objc_storeStrong((id *)&self->_logoContainerView, 0);
  objc_storeStrong((id *)&self->_appleLogoMicaView, 0);
  objc_storeStrong((id *)&self->_privacyLinkIdentifiers, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_footerText, 0);
  objc_storeStrong((id *)&self->_cellBackgroundColor, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_originalPersonaContext, 0);
  objc_storeStrong((id *)&self->_originalPersona, 0);
  objc_storeStrong(&self->_passwordHandler, 0);
  objc_storeStrong((id *)&self->_tableFooterView, 0);
  objc_storeStrong((id *)&self->_tableHeaderView, 0);
  objc_storeStrong((id *)&self->_actionButtonsStackView, 0);
  objc_storeStrong((id *)&self->_otherOptionsButton, 0);
  objc_storeStrong((id *)&self->_continueButton, 0);
  objc_storeStrong((id *)&self->_headerImage, 0);
  objc_storeStrong((id *)&self->_obHeaderView, 0);
  objc_storeStrong((id *)&self->_passwordCell, 0);
  objc_storeStrong((id *)&self->_usernameCell, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
}

- (void)_attemptAuthenticationWithContext:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136315138;
  v4 = "-[AAUISignInViewController _attemptAuthenticationWithContext:]";
  OUTLINED_FUNCTION_2_0(&dword_1DB4ED000, a1, a3, "Verifying persona in %s", (uint8_t *)&v3);
  OUTLINED_FUNCTION_4();
}

void __62__AAUISignInViewController__attemptAuthenticationWithContext___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1DB4ED000, a2, a3, "Authentication failed with error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)authenticationController:(os_log_t)log shouldContinueWithAuthenticationResults:error:forContext:completion:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1DB4ED000, log, OS_LOG_TYPE_DEBUG, "Calling delegate for should continue", v1, 2u);
}

- (void)authenticationController:(uint64_t)a3 shouldContinueWithAuthenticationResults:(uint64_t)a4 error:(uint64_t)a5 forContext:(uint64_t)a6 completion:(uint64_t)a7 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1DB4ED000, a2, a3, "Bailing due to error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

@end
