@implementation LUIAppleIDSignInViewController

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  -[LUIAppleIDSignInViewController _clearTextFields](self, "_clearTextFields");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[LUIAppleIDSignInViewController progressView](self, "progressView"));
  objc_msgSend(v5, "setSignInButtonEnabled:", 0);

  v6.receiver = self;
  v6.super_class = (Class)LUIAppleIDSignInViewController;
  -[LUIMajorViewController viewWillAppear:](&v6, "viewWillAppear:", v3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[LUIAppleIDSignInViewController _clearTextFields](self, "_clearTextFields");
  v5.receiver = self;
  v5.super_class = (Class)LUIAppleIDSignInViewController;
  -[LUIAppleIDSignInViewController viewDidDisappear:](&v5, "viewDidDisappear:", v3);
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
  void *v10;
  void *v11;
  _QWORD handler[5];
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)LUIAppleIDSignInViewController;
  -[LUIAppleIDSignInViewController viewDidLoad](&v13, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LUIAppleIDSignInViewController view](self, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  objc_msgSend(v3, "setBackgroundColor:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[LUIAppleIDSignInViewController view](self, "view"));
  objc_msgSend(v5, "setAccessibilityIdentifier:", CFSTR("LUIAppleIDSignInView"));

  -[LUIAppleIDSignInViewController setHeaderTitle](self, "setHeaderTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[LUIAppleIDSignInViewController view](self, "view"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[LUIAppleIDSignInViewController tableView](self, "tableView"));
  objc_msgSend(v6, "addSubview:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[LUIPrivacyView defaultPrivacyView](LUIPrivacyView, "defaultPrivacyView"));
  -[LUIAppleIDSignInViewController setPrivacyView:](self, "setPrivacyView:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[LUIAppleIDSignInViewController privacyView](self, "privacyView"));
  objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[LUIAppleIDSignInViewController view](self, "view"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[LUIAppleIDSignInViewController privacyView](self, "privacyView"));
  objc_msgSend(v10, "addSubview:", v11);

  -[LUIAppleIDSignInViewController setIsUIUpdateAllowed:](self, "setIsUIUpdateAllowed:", 1);
  -[LUIAppleIDSignInViewController _activateLayoutConstraints](self, "_activateLayoutConstraints");
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100010D84;
  handler[3] = &unk_100069088;
  handler[4] = self;
  notify_register_dispatch((const char *)objc_msgSend(DMCSettingsChangedNotification, "UTF8String"), (int *)&unk_100088D60, (dispatch_queue_t)&_dispatch_main_q, handler);
  -[LUIAppleIDSignInViewController _updateDefaultDomainSetting](self, "_updateDefaultDomainSetting");
}

- (int64_t)preferredStatusBarStyle
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[LUIStyle sharedStyle](LUIStyle, "sharedStyle"));
  v3 = objc_msgSend(v2, "statusBarStyle");

  return (int64_t)v3;
}

- (UITableView)tableView
{
  UITableView *tableView;
  UITableView *v4;
  UITableView *v5;
  UITableView *v6;
  void *v7;
  UITableView *v8;
  void *v9;
  void *v10;
  UITableView *v11;
  void *v12;

  tableView = self->_tableView;
  if (!tableView)
  {
    v4 = (UITableView *)objc_msgSend(objc_alloc((Class)UITableView), "initWithFrame:style:", 0, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v5 = self->_tableView;
    self->_tableView = v4;

    -[UITableView setDataSource:](self->_tableView, "setDataSource:", self);
    -[UITableView setDelegate:](self->_tableView, "setDelegate:", self);
    v6 = self->_tableView;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[UITableView setBackgroundColor:](v6, "setBackgroundColor:", v7);

    -[UITableView setBackgroundView:](self->_tableView, "setBackgroundView:", 0);
    -[UITableView setAutoresizingMask:](self->_tableView, "setAutoresizingMask:", 18);
    -[UITableView setSeparatorStyle:](self->_tableView, "setSeparatorStyle:", 1);
    v8 = self->_tableView;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[LUIStyle sharedStyle](LUIStyle, "sharedStyle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "tableViewSeperatorColor"));
    -[UITableView setSeparatorColor:](v8, "setSeparatorColor:", v10);

    -[UITableView setShowsVerticalScrollIndicator:](self->_tableView, "setShowsVerticalScrollIndicator:", 0);
    -[UITableView setShowsHorizontalScrollIndicator:](self->_tableView, "setShowsHorizontalScrollIndicator:", 0);
    -[UITableView setClipsToBounds:](self->_tableView, "setClipsToBounds:", 0);
    -[UITableView _setHeaderAndFooterViewsFloat:](self->_tableView, "_setHeaderAndFooterViewsFloat:", 0);
    -[UITableView setScrollEnabled:](self->_tableView, "setScrollEnabled:", 0);
    -[UITableView setTranslatesAutoresizingMaskIntoConstraints:](self->_tableView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v11 = self->_tableView;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[LUIStyle sharedStyle](LUIStyle, "sharedStyle"));
    objc_msgSend(v12, "tableViewSeperatorInset");
    -[UITableView setSeparatorInset:](v11, "setSeparatorInset:");

    tableView = self->_tableView;
  }
  return tableView;
}

- (void)_activateLayoutConstraints
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LUIAppleIDSignInViewController _tableViewConstraints](self, "_tableViewConstraints"));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v3);

  v6 = (id)objc_claimAutoreleasedReturnValue(-[LUIAppleIDSignInViewController privacyView](self, "privacyView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[LUIAppleIDSignInViewController view](self, "view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[LUIPrivacyView bottomCenterConstraintsForPrivacyView:inView:](LUIPrivacyView, "bottomCenterConstraintsForPrivacyView:inView:", v6, v4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v5);

}

- (id)_tableViewConstraints
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
  id v14;
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
  _QWORD v25[4];

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[LUIAppleIDSignInViewController tableView](self, "tableView"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "widthAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[LUIStyle sharedStyle](LUIStyle, "sharedStyle"));
  objc_msgSend(v23, "fixedWidthForClassTable");
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToConstant:"));
  v25[0] = v21;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[LUIAppleIDSignInViewController tableView](self, "tableView"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "centerXAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[LUIAppleIDSignInViewController view](self, "view"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "centerXAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:", v17));
  v25[1] = v16;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[LUIAppleIDSignInViewController tableView](self, "tableView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "topAnchor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[LUIAppleIDSignInViewController view](self, "view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "topAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "constraintEqualToAnchor:constant:", v5, 20.0));
  v25[2] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[LUIAppleIDSignInViewController view](self, "view"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bottomAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[LUIAppleIDSignInViewController tableView](self, "tableView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bottomAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[LUIStyle sharedStyle](LUIStyle, "sharedStyle"));
  objc_msgSend(v11, "bottomInset");
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:constant:", v10));
  v25[3] = v12;
  v14 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v25, 4));

  return v14;
}

- (void)_fetchAuthMode
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  LKUser *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  void *v17;
  unsigned int v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[16];
  _BYTE v24[128];

  v3 = qword_100088F30;
  if (os_log_type_enabled((os_log_t)qword_100088F30, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Fetching authentication mode.", buf, 2u);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[LUIAppleIDSignInViewController usernameField](self, "usernameField"));
  objc_msgSend(v4, "resignFirstResponder");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[LUIAppleIDSignInViewController progressView](self, "progressView"));
  objc_msgSend(v5, "setSignInButtonEnabled:", 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[LUIAuthenticationController sharedController](LUIAuthenticationController, "sharedController"));
  objc_msgSend(v6, "setDelegate:", self);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[LUIAppleIDSignInViewController _username](self, "_username"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[LUISchoolManager sharedInstance](LUISchoolManager, "sharedInstance"));
  v9 = (LKUser *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "studentForUsername:", v7));

  if (!v9)
  {
    v9 = objc_opt_new(LKUser);
    -[LKUser setUsername:](v9, "setUsername:", v7);
  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserManager sharedManager](UMUserManager, "sharedManager", 0));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "allUsers"));

  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "username"));
        v18 = objc_msgSend(v17, "isEqualToString:", v7);

        if (v18)
        {
          -[LKUser setDiffUMUserPropertiesFromUMUser:](v9, "setDiffUMUserPropertiesFromUMUser:", v16);
          goto LABEL_15;
        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      if (v13)
        continue;
      break;
    }
  }
LABEL_15:

  objc_msgSend(v6, "startLoginFlowForUser:", v9);
}

- (LUIPaneFooterView)progressView
{
  LUIPaneFooterView *progressView;
  LUIPaneFooterView *v4;
  LUIPaneFooterView *v5;
  LUIPaneFooterView *v6;
  void *v7;

  progressView = self->_progressView;
  if (!progressView)
  {
    v4 = -[LUIPaneFooterView initWithFrame:]([LUIPaneFooterView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v5 = self->_progressView;
    self->_progressView = v4;

    -[LUIPaneFooterView setAutoresizingMask:](self->_progressView, "setAutoresizingMask:", 2);
    v6 = self->_progressView;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[LUIPaneFooterView setBackgroundColor:](v6, "setBackgroundColor:", v7);

    -[LUIPaneFooterView setDelegate:](self->_progressView, "setDelegate:", self);
    -[LUIPaneFooterView sizeToFit](self->_progressView, "sizeToFit");
    progressView = self->_progressView;
  }
  return progressView;
}

- (double)heightForFooterInTableView:(id)a3
{
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
  double v14;
  double v15;
  CGRect v17;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[LUIAppleIDSignInViewController progressView](self, "progressView"));
  objc_msgSend(v4, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v17.origin.x = v7;
  v17.origin.y = v9;
  v17.size.width = v11;
  v17.size.height = v13;
  objc_msgSend(v5, "sizeThatFits:", CGRectGetWidth(v17), 3.40282347e38);
  v15 = v14;

  return v15;
}

- (id)_bottomLeftButtonTitleForViewType:(int64_t)a3
{
  void *v3;
  void *v4;
  const __CFString *v5;
  __CFString *v6;

  if (a3 == 2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v4 = v3;
    v5 = CFSTR("CLASS_ROSTER_BUTTON_TITLE");
  }
  else
  {
    if (a3 != 1)
    {
      v6 = &stru_100069EB8;
      return v6;
    }
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v4 = v3;
    v5 = CFSTR("RECENTS_BUTTON_TITLE");
  }
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_100069EB8, 0));

  return v6;
}

- (BOOL)shouldShowBottomLeftVibrantButton
{
  return -[LUIAppleIDSignInViewController viewType](self, "viewType") != 0;
}

- (BOOL)shouldShowBottomRightVibrantButton
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[LUITemporarySessionSupport sharedInstance](LUITemporarySessionSupport, "sharedInstance"));
  v3 = objc_msgSend(v2, "isTemporarySessionAllowed");

  return v3;
}

- (int64_t)imageTypeForBottomLeftVibrantButton
{
  return 1;
}

- (int64_t)imageTypeForBottomRightVibrantButton
{
  return 4;
}

- (id)titleForBottomLeftVibrantButton
{
  return -[LUIAppleIDSignInViewController _bottomLeftButtonTitleForViewType:](self, "_bottomLeftButtonTitleForViewType:", -[LUIAppleIDSignInViewController viewType](self, "viewType"));
}

- (id)titleForBottomRightVibrantButton
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("GUEST"), &stru_100069EB8, 0));

  return v3;
}

- (void)bottomLeftVibrantButtonTapped:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[LUISetupController sharedController](LUISetupController, "sharedController", a3));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewControllerOnTopOfRootViewController"));

  if (v6)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[LUIAppleIDSignInViewController navigationController](self, "navigationController"));
    objc_msgSend(v5, "pushViewController:animated:", v6, 1);

  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  return -[LUIAppleIDSignInViewController usernameCell](self, "usernameCell", a3, a4);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v4;
  void *v5;
  double v6;
  double v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[LUIStyle sharedStyle](LUIStyle, "sharedStyle"));
  objc_msgSend(v5, "singleLineCellHeightForTable:", v4);
  v7 = v6;

  return v7;
}

- (double)heightForHeaderInTableView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  CGRect v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[LUIAppleIDSignInViewController headerView](self, "headerView"));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[LUIAppleIDSignInViewController headerView](self, "headerView"));
    objc_msgSend(v4, "bounds");
    objc_msgSend(v6, "sizeThatFits:", CGRectGetWidth(v10), 3.40282347e38);
    v8 = v7;

  }
  else
  {
    v8 = 0.0;
  }

  return v8;
}

- (LUIPaneHeaderView)headerView
{
  LUIPaneHeaderView *headerView;
  LUIPaneHeaderView *v4;
  LUIPaneHeaderView *v5;
  LUIPaneHeaderView *v6;
  void *v7;

  headerView = self->_headerView;
  if (!headerView)
  {
    v4 = -[LUIPaneHeaderView initWithFrame:]([LUIPaneHeaderView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v5 = self->_headerView;
    self->_headerView = v4;

    -[LUIPaneHeaderView setAutoresizingMask:](self->_headerView, "setAutoresizingMask:", 2);
    v6 = self->_headerView;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[LUIPaneHeaderView setBackgroundColor:](v6, "setBackgroundColor:", v7);

    -[LUIPaneHeaderView setEnableBottomSeperator:](self->_headerView, "setEnableBottomSeperator:", 1);
    headerView = self->_headerView;
  }
  return headerView;
}

- (void)setHeaderTitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[LUISchoolManager sharedInstance](LUISchoolManager, "sharedInstance"));
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "schoolName"));

  if (v7)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[LUIAppleIDSignInViewController headerView](self, "headerView"));
    objc_msgSend(v4, "setTitle:", v7);

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[LUIAppleIDSignInViewController headerView](self, "headerView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[LUIAppleIDSignInViewController _subtitleAttributedString](self, "_subtitleAttributedString"));
  objc_msgSend(v5, "setAttributedSubtitle:", v6);

}

- (id)_subtitleAttributedString
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  int v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  id v11;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 20.0));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithObject:forKey:](NSMutableDictionary, "dictionaryWithObject:forKey:", v2, NSFontAttributeName));
  v4 = objc_alloc_init((Class)NSMutableParagraphStyle);
  objc_msgSend(v4, "setAlignment:", 1);
  objc_msgSend(v3, "setObject:forKey:", v4, NSParagraphStyleAttributeName);
  v5 = objc_alloc((Class)NSMutableAttributedString);
  v6 = _os_feature_enabled_impl("AppleAccount", "AABranding");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = v7;
  if (v6)
    v9 = CFSTR("SIGN_IN_PROMPT_APPLE_ACCOUNT");
  else
    v9 = CFSTR("SIGN_IN_PROMPT_APPLE_ID");
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", v9, &stru_100069EB8, 0));
  v11 = objc_msgSend(v5, "initWithString:attributes:", v10, v3);

  return v11;
}

- (UITableViewCell)usernameCell
{
  UITableViewCell *usernameCell;
  UITableViewCell *v4;
  UITableViewCell *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  UITableViewCell *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  UITableViewCell *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  UITableViewCell *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  UITableViewCell *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;

  usernameCell = self->_usernameCell;
  if (!usernameCell)
  {
    v4 = (UITableViewCell *)objc_msgSend(objc_alloc((Class)UITableViewCell), "initWithStyle:reuseIdentifier:", 1, 0);
    v5 = self->_usernameCell;
    self->_usernameCell = v4;

    -[UITableViewCell setSelectionStyle:](self->_usernameCell, "setSelectionStyle:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[UITableViewCell textLabel](self->_usernameCell, "textLabel"));
    v7 = _os_feature_enabled_impl("AppleAccount", "AABranding");
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v9 = v8;
    if (v7)
      v10 = CFSTR("APPLE_ACCOUNT_LABEL");
    else
      v10 = CFSTR("APPLE_ID_LABEL");
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", v10, &stru_100069EB8, 0));
    objc_msgSend(v6, "setText:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[UITableViewCell textLabel](self->_usernameCell, "textLabel"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[LUIStyle sharedStyle](LUIStyle, "sharedStyle"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "tableCellFont"));
    objc_msgSend(v12, "setFont:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[UITableViewCell textLabel](self->_usernameCell, "textLabel"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[LUIStyle sharedStyle](LUIStyle, "sharedStyle"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "overallTextColor"));
    objc_msgSend(v15, "setTextColor:", v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[UITableViewCell textLabel](self->_usernameCell, "textLabel"));
    objc_msgSend(v18, "sizeToFit");

    v19 = self->_usernameCell;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[UITableViewCell setBackgroundColor:](v19, "setBackgroundColor:", v20);

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[UITableViewCell contentView](self->_usernameCell, "contentView"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[LUIAppleIDSignInViewController usernameField](self, "usernameField"));
    objc_msgSend(v21, "addSubview:", v22);

    -[LUIAppleIDSignInViewController _maxLabelWidth](self, "_maxLabelWidth");
    v24 = v23;
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[UITableViewCell textLabel](self->_usernameCell, "textLabel"));
    objc_msgSend(v25, "size");
    v27 = v24 - v26 + 20.0;

    v28 = self->_usernameCell;
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[LUIAppleIDSignInViewController usernameField](self, "usernameField"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "leadingAnchor"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[UITableViewCell textLabel](self->_usernameCell, "textLabel"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "trailingAnchor"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:constant:", v32, v27));
    -[UITableViewCell addConstraint:](v28, "addConstraint:", v33);

    v34 = self->_usernameCell;
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[LUIAppleIDSignInViewController usernameField](self, "usernameField"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "centerYAnchor"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[UITableViewCell textLabel](self->_usernameCell, "textLabel"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "centerYAnchor"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "constraintEqualToAnchor:", v38));
    -[UITableViewCell addConstraint:](v34, "addConstraint:", v39);

    v40 = self->_usernameCell;
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[LUIAppleIDSignInViewController usernameField](self, "usernameField"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "trailingAnchor"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[UITableViewCell contentView](self->_usernameCell, "contentView"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "trailingAnchor"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "constraintEqualToAnchor:constant:", v44, -15.0));
    -[UITableViewCell addConstraint:](v40, "addConstraint:", v45);

    usernameCell = self->_usernameCell;
  }
  return usernameCell;
}

- (void)setUsername:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[LUIAppleIDSignInViewController usernameField](self, "usernameField"));
  objc_msgSend(v5, "setText:", v4);

}

- (id)_username
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[LUIAppleIDSignInViewController usernameField](self, "usernameField"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "text"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceCharacterSet](NSCharacterSet, "whitespaceCharacterSet"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByTrimmingCharactersInSet:", v4));

  return v5;
}

- (UITextField_CustomEditMenu)usernameField
{
  UITextField_CustomEditMenu *usernameField;
  UITextField_CustomEditMenu *v4;
  UITextField_CustomEditMenu *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSAttributedStringKey v17;
  void *v18;

  usernameField = self->_usernameField;
  if (!usernameField)
  {
    v4 = objc_alloc_init(UITextField_CustomEditMenu);
    v5 = self->_usernameField;
    self->_usernameField = v4;

    -[UITextField_CustomEditMenu setAutoresizingMask:](self->_usernameField, "setAutoresizingMask:", 1);
    -[UITextField_CustomEditMenu setAutoresizingMask:](self->_usernameField, "setAutoresizingMask:", 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[LUIStyle sharedStyle](LUIStyle, "sharedStyle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "secondaryColor"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "colorWithAlphaComponent:", 0.5));

    v9 = objc_alloc((Class)NSAttributedString);
    v17 = NSForegroundColorAttributeName;
    v18 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1));
    v11 = objc_msgSend(v9, "initWithString:attributes:", CFSTR("example@icloud.com"), v10);

    -[UITextField_CustomEditMenu setAttributedPlaceholder:](self->_usernameField, "setAttributedPlaceholder:", v11);
    -[UITextField_CustomEditMenu setAutocapitalizationType:](self->_usernameField, "setAutocapitalizationType:", 0);
    -[UITextField_CustomEditMenu setDelegate:](self->_usernameField, "setDelegate:", self);
    -[UITextField_CustomEditMenu addTarget:action:forControlEvents:](self->_usernameField, "addTarget:action:forControlEvents:", self, "textFieldDidChange:", 0x20000);
    -[UITextField_CustomEditMenu setKeyboardType:](self->_usernameField, "setKeyboardType:", 7);
    -[UITextField_CustomEditMenu setAutocorrectionType:](self->_usernameField, "setAutocorrectionType:", 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[LUIStyle sharedStyle](LUIStyle, "sharedStyle"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "overallTextColor"));

    -[UITextField_CustomEditMenu setTextColor:](self->_usernameField, "setTextColor:", v13);
    -[UITextField_CustomEditMenu setTintColor:](self->_usernameField, "setTintColor:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[UITextField_CustomEditMenu inputAssistantItem](self->_usernameField, "inputAssistantItem"));
    objc_msgSend(v14, "setLeadingBarButtonGroups:", &__NSArray0__struct);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[UITextField_CustomEditMenu inputAssistantItem](self->_usernameField, "inputAssistantItem"));
    objc_msgSend(v15, "setTrailingBarButtonGroups:", &__NSArray0__struct);

    -[UITextField_CustomEditMenu setTranslatesAutoresizingMaskIntoConstraints:](self->_usernameField, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    usernameField = self->_usernameField;
  }
  return usernameField;
}

- (double)_maxLabelWidth
{
  int v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  NSAttributedStringKey v13;
  void *v14;

  v2 = _os_feature_enabled_impl("AppleAccount", "AABranding");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = v3;
  if (v2)
    v5 = CFSTR("APPLE_ACCOUNT_LABEL");
  else
    v5 = CFSTR("APPLE_ID_LABEL");
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_100069EB8, 0));
  v13 = NSFontAttributeName;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[LUIStyle sharedStyle](LUIStyle, "sharedStyle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "tableCellFont"));
  v14 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1));
  objc_msgSend(v6, "sizeWithAttributes:", v9);
  v11 = v10;

  return v11;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  void *v4;
  _BOOL4 v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "text"));
  v5 = -[LUIAppleIDSignInViewController _validateUsername:](self, "_validateUsername:", v4);

  if (v5)
    -[LUIAppleIDSignInViewController _fetchAuthMode](self, "_fetchAuthMode");
  return v5;
}

- (void)textFieldDidBeginEditing:(id)a3
{
  id v4;
  id v5;
  void *v6;
  unsigned __int8 v7;
  _QWORD block[4];
  unsigned __int8 v9;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[LUIAppleIDSignInViewController usernameField](self, "usernameField"));

  if (v5 == v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "text"));
    v7 = -[LUIAppleIDSignInViewController _validateUsername:](self, "_validateUsername:", v6);

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000123E8;
    block[3] = &unk_1000690A8;
    v9 = v7;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }

}

- (void)textFieldDidChange:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  NSMutableArray *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[LUIAppleIDSignInViewController usernameField](self, "usernameField"));

  if (v5 == v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "text"));
    v7 = -[LUIAppleIDSignInViewController _validateUsername:](self, "_validateUsername:", v6);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[LUIAppleIDSignInViewController progressView](self, "progressView"));
    objc_msgSend(v8, "setSignInButtonEnabled:", v7);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance"));
    objc_msgSend(v9, "setReturnKeyEnabled:", v7);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance"));
    v11 = objc_opt_respondsToSelector(v10, "setSuggestions:");

    if ((v11 & 1) != 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "text"));
      v13 = objc_opt_new(NSMutableArray);
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[LUIAppleIDSignInViewController defaultDomains](self, "defaultDomains"));
      if (objc_msgSend(v14, "count"))
      {
        v15 = objc_msgSend(v12, "length");

        if (!v15)
        {
LABEL_17:
          v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance"));
          objc_msgSend(v25, "performSelector:withObject:", "setSuggestions:", v13);

          goto LABEL_18;
        }
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "componentsSeparatedByString:", CFSTR("@")));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "firstObject"));

        v29 = 0u;
        v30 = 0u;
        v27 = 0u;
        v28 = 0u;
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[LUIAppleIDSignInViewController defaultDomains](self, "defaultDomains"));
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
        if (v18)
        {
          v19 = v18;
          v26 = v4;
          v20 = 0;
          v21 = *(_QWORD *)v28;
          do
          {
            v22 = 0;
            v23 = v20;
            do
            {
              if (*(_QWORD *)v28 != v21)
                objc_enumerationMutation(v17);
              v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "stringByAppendingFormat:", CFSTR("@%@"), *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)v22)));

              if (objc_msgSend(v20, "hasPrefix:", v12))
              {
                v24 = (void *)objc_claimAutoreleasedReturnValue(+[UITextSuggestion textSuggestionWithInputText:](UITextSuggestion, "textSuggestionWithInputText:", v20));
                -[NSMutableArray addObject:](v13, "addObject:", v24);

              }
              v22 = (char *)v22 + 1;
              v23 = v20;
            }
            while (v19 != v22);
            v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
          }
          while (v19);

          v4 = v26;
        }

      }
      goto LABEL_17;
    }
  }
LABEL_18:

}

- (int64_t)viewType
{
  void *v2;
  void *v3;
  unsigned __int8 v4;
  int64_t v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[LUISchoolManager sharedInstance](LUISchoolManager, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[LUISetupController sharedController](LUISetupController, "sharedController"));
  v4 = objc_msgSend(v3, "haveRecentUsers");

  if ((v4 & 1) != 0)
  {
    v5 = 1;
  }
  else if ((objc_msgSend(v2, "hasClasses") & 1) != 0)
  {
    v5 = 2;
  }
  else if (objc_msgSend(v2, "hasStudents"))
  {
    v5 = 2;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_clearTextFields
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[LUIAppleIDSignInViewController usernameField](self, "usernameField"));
  objc_msgSend(v2, "setText:", 0);

}

- (BOOL)_validateUsername:(id)a3
{
  id v3;
  void *v4;
  unsigned __int8 v5;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("SELF MATCHES %@"), CFSTR(".+@.+\\.[A-Za-z]+")));
    v5 = objc_msgSend(v4, "evaluateWithObject:", v3);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_updateDefaultDomainSetting
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001288C;
  block[3] = &unk_100068C58;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)authenticationCanceled
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LUIAppleIDSignInViewController usernameField](self, "usernameField"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "text"));
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[LUIAppleIDSignInViewController progressView](self, "progressView"));
    objc_msgSend(v6, "setSignInButtonEnabled:", 1);

  }
}

- (void)presentPasscodeViewControllerForUser:(id)a3 passcodeViewDidAppearAction:(id)a4 passcodeCanceledAction:(id)a5 passcodeEnteredAction:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = (id)objc_claimAutoreleasedReturnValue(-[LUIAppleIDSignInViewController navigationController](self, "navigationController"));
  +[LUIUserLoginPasswordViewController presentInNavigationController:user:passcodeViewDidAppearAction:passcodeCanceledAction:passcodeEnteredAction:](LUIUserLoginPasswordViewController, "presentInNavigationController:user:passcodeViewDidAppearAction:passcodeCanceledAction:passcodeEnteredAction:", v14, v13, v12, v11, v10);

}

- (LUILoginDelegate)delegate
{
  return (LUILoginDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setTableView:(id)a3
{
  objc_storeStrong((id *)&self->_tableView, a3);
}

- (void)setHeaderView:(id)a3
{
  objc_storeStrong((id *)&self->_headerView, a3);
}

- (LUIPrivacyView)privacyView
{
  return self->_privacyView;
}

- (void)setPrivacyView:(id)a3
{
  objc_storeStrong((id *)&self->_privacyView, a3);
}

- (void)setUsernameCell:(id)a3
{
  objc_storeStrong((id *)&self->_usernameCell, a3);
}

- (void)setUsernameField:(id)a3
{
  objc_storeStrong((id *)&self->_usernameField, a3);
}

- (void)setProgressView:(id)a3
{
  objc_storeStrong((id *)&self->_progressView, a3);
}

- (BOOL)isUIUpdateAllowed
{
  return self->_isUIUpdateAllowed;
}

- (void)setIsUIUpdateAllowed:(BOOL)a3
{
  self->_isUIUpdateAllowed = a3;
}

- (NSArray)defaultDomains
{
  return self->_defaultDomains;
}

- (void)setDefaultDomains:(id)a3
{
  objc_storeStrong((id *)&self->_defaultDomains, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultDomains, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_usernameField, 0);
  objc_storeStrong((id *)&self->_usernameCell, 0);
  objc_storeStrong((id *)&self->_privacyView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
