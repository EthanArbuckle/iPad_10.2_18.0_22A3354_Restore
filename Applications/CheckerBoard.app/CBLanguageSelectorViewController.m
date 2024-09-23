@implementation CBLanguageSelectorViewController

- (CBLanguageSelectorViewController)init
{
  void *v3;
  void *v4;
  CBLanguageSelectorViewController *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("LANGUAGE_SELECTION"), &stru_1000769A0, 0));
  v10.receiver = self;
  v10.super_class = (Class)CBLanguageSelectorViewController;
  v5 = -[CBLanguageSelectorViewController initWithTitle:detailText:icon:adoptTableViewScrollView:](&v10, "initWithTitle:detailText:icon:adoptTableViewScrollView:", v4, &stru_1000769A0, 0, 1);

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v6, "addObserver:selector:name:object:", v5, "_didBecomeActive:", UIApplicationDidBecomeActiveNotification, 0);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v7, "addObserver:selector:name:object:", v5, "_didResignActive:", UIApplicationWillResignActiveNotification, 0);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v8, "addObserver:selector:name:object:", v5, "_languageSelectorScanComplete:", CFSTR("CBLanguageCompositeWifiScanComplete"), 0);

  }
  return v5;
}

- (UITableView)languageTableView
{
  UITableView *languageTableView;
  UITableView *v4;
  UITableView *v5;
  uint64_t v6;
  void *v7;

  languageTableView = self->_languageTableView;
  if (!languageTableView)
  {
    v4 = (UITableView *)objc_msgSend(objc_alloc((Class)UITableView), "initWithFrame:style:", 2, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v5 = self->_languageTableView;
    self->_languageTableView = v4;

    -[UITableView registerClass:forCellReuseIdentifier:](self->_languageTableView, "registerClass:forCellReuseIdentifier:", objc_opt_class(CBLanguageSelectorCell, v6), CFSTR("Cell"));
    -[UITableView setDirectionalLayoutMargins:](self->_languageTableView, "setDirectionalLayoutMargins:", 1.0, 1.0, 1.0, 1.0);
    -[UITableView setDelegate:](self->_languageTableView, "setDelegate:", self);
    -[UITableView setDataSource:](self->_languageTableView, "setDataSource:", self);
    -[UITableView setTranslatesAutoresizingMaskIntoConstraints:](self->_languageTableView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UITableView _setDrawsSeparatorAtTopOfSections:](self->_languageTableView, "_setDrawsSeparatorAtTopOfSections:", 1);
    -[UITableView setEstimatedRowHeight:](self->_languageTableView, "setEstimatedRowHeight:", 60.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[UITableView setBackgroundColor:](self->_languageTableView, "setBackgroundColor:", v7);

    languageTableView = self->_languageTableView;
  }
  return languageTableView;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)CBLanguageSelectorViewController;
  -[CBLanguageSelectorViewController dealloc](&v4, "dealloc");
}

- (void)viewDidLoad
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CBLanguageSelectorViewController;
  -[CBLanguageSelectorViewController viewDidLoad](&v7, "viewDidLoad");
  -[CBLanguageSelectorViewController setModalPresentationStyle:](self, "setModalPresentationStyle:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CBLanguageSelectorViewController languageTableView](self, "languageTableView"));
  -[CBLanguageSelectorViewController setTableView:](self, "setTableView:", v3);

  v4 = objc_msgSend(objc_alloc((Class)UIActivityIndicatorView), "initWithActivityIndicatorStyle:", 100);
  -[CBLanguageSelectorViewController setActivityView:](self, "setActivityView:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CBLanguageSelectorViewController animationController:](self, "animationController:", CFSTR("Language")));
  -[CBLanguageSelectorViewController setAnimationController:](self, "setAnimationController:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CBLanguageSelectorViewController view](self, "view"));
  objc_msgSend(v6, "layoutIfNeeded");

}

- (void)viewDidLayoutSubviews
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CBLanguageSelectorViewController;
  -[CBLanguageSelectorViewController viewDidLayoutSubviews](&v2, "viewDidLayoutSubviews");
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CBLanguageSelectorViewController;
  -[CBLanguageSelectorViewController viewWillAppear:](&v7, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CBLanguageSelectorViewController view](self, "view"));
  objc_msgSend(v5, "setBackgroundColor:", v4);

  if (-[CBLanguageSelectorViewController isMovingToParentViewController](self, "isMovingToParentViewController"))-[CBLanguageSelectorViewController _refreshLanguageStrings](self, "_refreshLanguageStrings");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CBLanguageSelectorViewController view](self, "view"));
  objc_msgSend(v6, "layoutIfNeeded");

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CBLanguageSelectorViewController;
  -[CBLanguageSelectorViewController viewDidAppear:](&v5, "viewDidAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CBLanguageSelectorViewController animationController](self, "animationController"));
  objc_msgSend(v4, "startAnimation");

}

- (void)_didBecomeActive:(id)a3
{
  void *v4;
  CBLanguageSelectorViewController *v5;
  id v6;

  -[CBLanguageSelectorViewController setHasBeenShown:](self, "setHasBeenShown:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CBLanguageSelectorViewController navigationController](self, "navigationController"));
  v5 = (CBLanguageSelectorViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "topViewController"));

  if (v5 == self)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[CBLanguageSelectorViewController animationController](self, "animationController"));
    objc_msgSend(v6, "startAnimation");

  }
}

- (void)_didResignActive:(id)a3
{
  void *v4;
  CBLanguageSelectorViewController *v5;
  id v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CBLanguageSelectorViewController navigationController](self, "navigationController", a3));
  v5 = (CBLanguageSelectorViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "topViewController"));

  if (v5 == self)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[CBLanguageSelectorViewController animationController:](self, "animationController:", CFSTR("Language")));
    -[CBLanguageSelectorViewController setAnimationController:](self, "setAnimationController:", v6);

  }
}

- (void)_refreshLanguageStrings
{
  void *v3;
  NSArray *v4;
  NSArray *languageCodes;
  void *v6;
  NSDictionary *v7;
  NSDictionary *languageStrings;
  _QWORD v9[4];
  id v10;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CBLanguageSelectorViewController languageComposite](self, "languageComposite"));
  v4 = (NSArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "languageCodes"));
  languageCodes = self->_languageCodes;
  self->_languageCodes = v4;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CBLanguageSelectorViewController languageComposite](self, "languageComposite"));
  v7 = (NSDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "languageStrings"));
  languageStrings = self->_languageStrings;
  self->_languageStrings = v7;

  objc_initWeak(&location, self);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100038804;
  v9[3] = &unk_100075510;
  objc_copyWeak(&v10, &location);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v9);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)_selectLanguage:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10003891C;
  v5[3] = &unk_1000753E8;
  v6 = a3;
  v4 = v6;
  -[CBLanguageSelectorViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v5);

}

- (void)_showActivityView
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
  _QWORD v18[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CBLanguageSelectorViewController view](self, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CBLanguageSelectorViewController activityView](self, "activityView"));
  objc_msgSend(v3, "addSubview:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CBLanguageSelectorViewController activityView](self, "activityView"));
  objc_msgSend(v5, "startAnimating");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CBLanguageSelectorViewController activityView](self, "activityView"));
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CBLanguageSelectorViewController activityView](self, "activityView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "topAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CBLanguageSelectorViewController headerView](self, "headerView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bottomAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "constraintEqualToAnchor:constant:", v9, 64.0));
  v18[0] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CBLanguageSelectorViewController activityView](self, "activityView"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "centerXAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CBLanguageSelectorViewController view](self, "view"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "centerXAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:constant:", v14, 0.0));
  v18[1] = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v18, 2));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v16);

}

- (void)_hideActivityView
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CBLanguageSelectorViewController activityView](self, "activityView"));
  objc_msgSend(v3, "stopAnimating");

  v4 = (id)objc_claimAutoreleasedReturnValue(-[CBLanguageSelectorViewController activityView](self, "activityView"));
  objc_msgSend(v4, "removeFromSuperview");

}

- (void)setLanguageComposite:(id)a3
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  NSString *v9;
  NSString *currentLocaleCode;
  uint8_t v11[16];

  v5 = a3;
  if (-[CBLanguageSelectorViewController hasBeenShown](self, "hasBeenShown")
    && -[NSArray count](self->_languageCodes, "count"))
  {
    v6 = CheckerBoardLogHandleForCategory(0);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Language pane was presented; not updating language list...",
        v11,
        2u);
    }

  }
  else
  {
    objc_storeStrong((id *)&self->_languageComposite, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](NSLocale, "currentLocale"));
    v9 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localeIdentifier"));
    currentLocaleCode = self->_currentLocaleCode;
    self->_currentLocaleCode = v9;

    -[CBLanguageSelectorViewController _refreshLanguageStrings](self, "_refreshLanguageStrings");
  }

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CBLanguageSelectorViewController languageCodes](self, "languageCodes", a3, a4));
  v5 = objc_msgSend(v4, "count");

  return (int64_t)v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("Cell"), v6));
  objc_msgSend(v7, "setMinimumHeight:", 60.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
  objc_msgSend(v8, "pointSize");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "titleLabel"));
  objc_msgSend(v10, "setFont:", v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CBLanguageSelectorViewController languageCodes](self, "languageCodes"));
  v12 = objc_msgSend(v6, "row");

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndex:", v12));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CBLanguageSelectorViewController languageStrings](self, "languageStrings"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKey:", v13));

  v16 = sub_100038E60(v15, v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "titleLabel"));
  objc_msgSend(v18, "setAttributedText:", v17);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CBLanguageSelectorViewController currentLocaleCode](self, "currentLocaleCode"));
  if (objc_msgSend(v19, "hasPrefix:", v13))
    v20 = 3;
  else
    v20 = 0;
  objc_msgSend(v7, "setAccessoryType:", v20);

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  int v12;
  void *v13;

  v6 = a4;
  objc_msgSend(a3, "deselectRowAtIndexPath:animated:", v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CBLanguageSelectorViewController languageCodes](self, "languageCodes"));
  v8 = objc_msgSend(v6, "row");

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", v8));
  v10 = CheckerBoardLogHandleForCategory(0);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412290;
    v13 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Tapped language %@", (uint8_t *)&v12, 0xCu);
  }

  -[CBLanguageSelectorViewController _selectLanguage:](self, "_selectLanguage:", v9);
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  return 0.0;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  return 0.0;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  return 0;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  return 0;
}

- (CBLanguageComposite)languageComposite
{
  return self->_languageComposite;
}

- (void)setLanguageTableView:(id)a3
{
  objc_storeStrong((id *)&self->_languageTableView, a3);
}

- (UIActivityIndicatorView)activityView
{
  return self->_activityView;
}

- (void)setActivityView:(id)a3
{
  objc_storeStrong((id *)&self->_activityView, a3);
}

- (NSDictionary)languageStrings
{
  return self->_languageStrings;
}

- (NSArray)languageCodes
{
  return self->_languageCodes;
}

- (BOOL)hasBeenShown
{
  return self->_hasBeenShown;
}

- (void)setHasBeenShown:(BOOL)a3
{
  self->_hasBeenShown = a3;
}

- (BOOL)ignoreForceLanguagePushes
{
  return self->_ignoreForceLanguagePushes;
}

- (void)setIgnoreForceLanguagePushes:(BOOL)a3
{
  self->_ignoreForceLanguagePushes = a3;
}

- (OBAnimationController)animationController
{
  return self->_animationController;
}

- (void)setAnimationController:(id)a3
{
  objc_storeStrong((id *)&self->_animationController, a3);
}

- (NSString)currentLocaleCode
{
  return self->_currentLocaleCode;
}

- (void)setCurrentLocaleCode:(id)a3
{
  objc_storeStrong((id *)&self->_currentLocaleCode, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentLocaleCode, 0);
  objc_storeStrong((id *)&self->_animationController, 0);
  objc_storeStrong((id *)&self->_languageCodes, 0);
  objc_storeStrong((id *)&self->_languageStrings, 0);
  objc_storeStrong((id *)&self->_activityView, 0);
  objc_storeStrong((id *)&self->_languageTableView, 0);
  objc_storeStrong((id *)&self->_languageComposite, 0);
}

@end
