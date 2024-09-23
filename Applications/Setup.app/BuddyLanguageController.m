@implementation BuddyLanguageController

- (BuddyLanguageController)init
{
  NSNotificationCenter *v2;
  NSNotificationCenter *v3;
  BuddyLanguageController *v4;
  objc_super v6;
  SEL v7;
  id location;

  v7 = a2;
  location = 0;
  v6.receiver = self;
  v6.super_class = (Class)BuddyLanguageController;
  location = -[BuddyLanguageController initWithTitle:detailText:icon:adoptTableViewScrollView:](&v6, "initWithTitle:detailText:icon:adoptTableViewScrollView:", &stru_100284738, &stru_100284738, 0, 1);
  objc_storeStrong(&location, location);
  if (location)
  {
    v2 = +[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter");
    -[NSNotificationCenter addObserver:selector:name:object:](v2, "addObserver:selector:name:object:", location, "_didBecomeActive:", UIApplicationDidBecomeActiveNotification, 0);

    v3 = +[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter");
    -[NSNotificationCenter addObserver:selector:name:object:](v3, "addObserver:selector:name:object:", location, "_didResignActive:", UIApplicationWillResignActiveNotification, 0);

  }
  v4 = (BuddyLanguageController *)location;
  objc_storeStrong(&location, 0);
  return v4;
}

- (UITableView)languageTableView
{
  UITableView *v2;
  UITableView *languageTableView;
  double v4;
  double v5;
  double v6;
  double v7;

  if (!self->_languageTableView)
  {
    v2 = (UITableView *)objc_msgSend(objc_alloc((Class)UITableView), "initWithFrame:style:", 2, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    languageTableView = self->_languageTableView;
    self->_languageTableView = v2;

    -[UITableView registerClass:forCellReuseIdentifier:](self->_languageTableView, "registerClass:forCellReuseIdentifier:", objc_opt_class(BuddyLanguageLocaleCell), CFSTR("Cell"));
    v4 = sub_100090174();
    -[UITableView setDirectionalLayoutMargins:](self->_languageTableView, "setDirectionalLayoutMargins:", v4, v5, v6, v7, *(_QWORD *)&v4, *(_QWORD *)&v5, *(_QWORD *)&v6, *(_QWORD *)&v7, *(_QWORD *)&v4, *(_QWORD *)&v5, *(_QWORD *)&v6, *(_QWORD *)&v7, a2);
    -[UITableView setDelegate:](self->_languageTableView, "setDelegate:", self);
    -[UITableView setDataSource:](self->_languageTableView, "setDataSource:", self);
    -[UITableView setTranslatesAutoresizingMaskIntoConstraints:](self->_languageTableView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UITableView _setDrawsSeparatorAtTopOfSections:](self->_languageTableView, "_setDrawsSeparatorAtTopOfSections:", 1);
    -[UITableView setEstimatedRowHeight:](self->_languageTableView, "setEstimatedRowHeight:", 60.0);
  }
  return self->_languageTableView;
}

- (void)dealloc
{
  NSNotificationCenter *v2;
  objc_super v3;
  SEL v4;
  BuddyLanguageController *v5;

  v5 = self;
  v4 = a2;
  v2 = +[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter");
  -[NSNotificationCenter removeObserver:](v2, "removeObserver:", v5);

  v3.receiver = v5;
  v3.super_class = (Class)BuddyLanguageController;
  -[BuddyLanguageController dealloc](&v3, "dealloc");
}

- (void)viewDidLoad
{
  BuddyLanguageController *v2;
  UITableView *v3;
  id v4;
  id v5;
  objc_super v6;
  SEL v7;
  BuddyLanguageController *v8;

  v8 = self;
  v7 = a2;
  v6.receiver = self;
  v6.super_class = (Class)BuddyLanguageController;
  -[BuddyLanguageController viewDidLoad](&v6, "viewDidLoad");
  v2 = v8;
  v3 = -[BuddyLanguageController languageTableView](v8, "languageTableView");
  -[BuddyLanguageController setTableView:](v2, "setTableView:", v3);

  v4 = -[BuddyLanguageController buddy_animationController:](v8, "buddy_animationController:", CFSTR("Language"));
  -[BuddyLanguageController setAnimationController:](v8, "setAnimationController:", v4);

  v5 = -[BuddyLanguageController view](v8, "view");
  objc_msgSend(v5, "layoutIfNeeded");

}

- (void)setShowLocalizedNames:(BOOL)a3
{
  id v3;

  self->_showLocalizedNames = a3;
  v3 = -[BuddyLanguageController tableView](self, "tableView");
  objc_msgSend(v3, "reloadData");

}

- (BOOL)showLocalizedNames
{
  return self->_showLocalizedNames;
}

- (void)viewDidLayoutSubviews
{
  objc_super v2;
  SEL v3;
  BuddyLanguageController *v4;

  v4 = self;
  v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)BuddyLanguageController;
  -[BuddyLanguageController viewDidLayoutSubviews](&v2, "viewDidLayoutSubviews");
}

- (void)viewWillAppear:(BOOL)a3
{
  BuddyLanguageComposite *v3;
  NSArray *v4;
  NSArray *languageCodes;
  BuddyLanguageComposite *v6;
  NSDictionary *v7;
  NSDictionary *languageStrings;
  id v9;
  id v10;
  objc_super v11;
  BOOL v12;
  SEL v13;
  BuddyLanguageController *v14;

  v14 = self;
  v13 = a2;
  v12 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BuddyLanguageController;
  -[BuddyLanguageController viewWillAppear:](&v11, "viewWillAppear:", a3);
  if ((-[BuddyLanguageController isMovingToParentViewController](v14, "isMovingToParentViewController") & 1) != 0)
  {
    v3 = -[BuddyLanguageController languageComposite](v14, "languageComposite");
    v4 = -[BuddyLanguageComposite languageCodes](v3, "languageCodes");
    languageCodes = v14->_languageCodes;
    v14->_languageCodes = v4;

    v6 = -[BuddyLanguageController languageComposite](v14, "languageComposite");
    v7 = -[BuddyLanguageComposite languageStrings](v6, "languageStrings");
    languageStrings = v14->_languageStrings;
    v14->_languageStrings = v7;

    v9 = -[BuddyLanguageController tableView](v14, "tableView");
    objc_msgSend(v9, "reloadData");

  }
  v10 = -[BuddyLanguageController view](v14, "view");
  objc_msgSend(v10, "layoutIfNeeded");

}

- (void)_didBecomeActive:(id)a3
{
  OBAnimationController *v3;
  id v4;
  BuddyLanguageController *v5;
  BuddyLanguageController *v6;
  NSUserDefaults *v7;
  id v8;
  BOOL v9;
  _BOOL8 v10;
  NSObject *v11;
  os_log_type_t v12;
  BFFFlowItemDelegate *v13;
  _WORD v14[3];
  os_log_type_t v15;
  os_log_t oslog;
  BOOL v17;
  int v18;
  id location[2];
  BuddyLanguageController *v20;

  v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[BuddyLanguageController setHasBeenShown:](v20, "setHasBeenShown:", 1);
  v3 = -[BuddyLanguageController animationController](v20, "animationController");
  -[OBAnimationController startAnimation](v3, "startAnimation");

  v4 = -[BuddyLanguageController navigationController](v20, "navigationController");
  v5 = (BuddyLanguageController *)objc_msgSend(v4, "topViewController");
  v6 = v20;

  if (v5 == v6)
  {
    v7 = +[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults");
    v8 = -[NSUserDefaults objectForKey:](v7, "objectForKey:", CFSTR("LockdownSetLanguage"));
    v9 = v8 != 0;

    v17 = v9;
    if (v9)
    {
      v10 = -[BuddyLanguageController ignoreForceLanguagePushes](v20, "ignoreForceLanguagePushes");
      if (!v10)
      {
        oslog = (os_log_t)(id)_BYLoggingFacility(v10);
        v15 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
        {
          v11 = oslog;
          v12 = v15;
          sub_100038C3C(v14);
          _os_log_impl((void *)&_mh_execute_header, v11, v12, "Language override on first unlock; skipping language pane...",
            (uint8_t *)v14,
            2u);
        }
        objc_storeStrong((id *)&oslog, 0);
        v13 = -[BuddyLanguageController delegate](v20, "delegate");
        -[BFFFlowItemDelegate flowItemDone:](v13, "flowItemDone:", v20);

      }
    }
    v18 = 0;
  }
  else
  {
    v18 = 1;
  }
  objc_storeStrong(location, 0);
}

- (void)_didResignActive:(id)a3
{
  id v3;
  BuddyLanguageController *v4;
  BuddyLanguageController *v5;
  id v6;
  NSUserDefaults *v7;
  id v8;
  BOOL v9;
  id location[2];
  BuddyLanguageController *v11;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyLanguageController navigationController](v11, "navigationController");
  v4 = (BuddyLanguageController *)objc_msgSend(v3, "topViewController");
  v5 = v11;

  if (v4 == v5)
  {
    v6 = -[BuddyLanguageController buddy_animationController:](v11, "buddy_animationController:", CFSTR("Language"));
    -[BuddyLanguageController setAnimationController:](v11, "setAnimationController:", v6);

    v7 = +[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults");
    v8 = -[NSUserDefaults objectForKey:](v7, "objectForKey:", CFSTR("LockdownSetLanguage"));
    v9 = v8 != 0;

    if (v9)
      -[BuddyLanguageController setIgnoreForceLanguagePushes:](v11, "setIgnoreForceLanguagePushes:", 1);
  }
  objc_storeStrong(location, 0);
}

- (void)_selectLanguage:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  NSBundle *v7;
  NSString *v8;
  id v9;
  id v10;
  BuddyLanguageLocaleSelectionReceiver *v11;
  BFFFlowItemDelegate *v12;
  id v13;
  id v14;
  id location[2];
  BuddyLanguageController *v16;

  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = +[BYLocationController sharedBuddyLocationController](BYLocationController, "sharedBuddyLocationController");
  v4 = objc_msgSend(v3, "guessedCountries");
  v14 = objc_msgSend(v4, "firstObject");

  v13 = location[0];
  if (objc_msgSend(v14, "length"))
  {
    v5 = +[IntlUtility languageIdentifierFromIdentifier:withRegion:](IntlUtility, "languageIdentifierFromIdentifier:withRegion:", location[0], v14);
    v6 = v13;
    v13 = v5;

  }
  +[NSLocale setLocaleAfterLanguageChange:](NSLocale, "setLocaleAfterLanguageChange:", v13);
  v7 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v8 = -[NSBundle localizedStringForKey:value:table:](v7, "localizedStringForKey:value:table:", CFSTR("SELECT_YOUR_LANGUAGE"), &stru_100284738, CFSTR("Localizable"));
  v9 = -[BuddyLanguageController navigationItem](v16, "navigationItem");
  objc_msgSend(v9, "setBackButtonTitle:", v8);

  v10 = -[BuddyLanguageController navigationItem](v16, "navigationItem");
  objc_msgSend(v10, "setBackButtonDisplayMode:", 2);

  v11 = -[BuddyLanguageController selectionReceiver](v16, "selectionReceiver");
  -[BuddyLanguageLocaleSelectionReceiver userSelectedLanguage:](v11, "userSelectedLanguage:", v13);

  v12 = -[BuddyLanguageController delegate](v16, "delegate");
  -[BFFFlowItemDelegate flowItemDone:](v12, "flowItemDone:", v16);

  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

- (void)_updateLanguageList
{
  id v2;

  v2 = -[BuddyLanguageController tableView](self, "tableView", a2, self);
  objc_msgSend(v2, "reloadData");

}

- (void)setLanguageComposite:(id)a3
{
  NSUInteger v3;
  NSObject *v4;
  os_log_type_t v5;
  NSArray *v6;
  NSArray *languageCodes;
  NSDictionary *v8;
  NSDictionary *languageStrings;
  uint8_t buf[15];
  char v11;
  os_log_t oslog;
  id location[2];
  BuddyLanguageController *v14;

  v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (-[BuddyLanguageController hasBeenShown](v14, "hasBeenShown")
    && (v3 = -[NSArray count](v14->_languageCodes, "count")) != 0)
  {
    oslog = (os_log_t)(id)_BYLoggingFacility(v3);
    v11 = 2;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      v4 = oslog;
      v5 = v11;
      sub_100038C3C(buf);
      _os_log_debug_impl((void *)&_mh_execute_header, v4, v5, "Language pane was presented; not updating language list...",
        buf,
        2u);
    }
    objc_storeStrong((id *)&oslog, 0);
  }
  else
  {
    objc_storeStrong((id *)&v14->_languageComposite, location[0]);
    v6 = (NSArray *)objc_msgSend(location[0], "languageCodes");
    languageCodes = v14->_languageCodes;
    v14->_languageCodes = v6;

    v8 = (NSDictionary *)objc_msgSend(location[0], "languageStrings");
    languageStrings = v14->_languageStrings;
    v14->_languageStrings = v8;

    -[BuddyLanguageController _updateLanguageList](v14, "_updateLanguageList");
  }
  objc_storeStrong(location, 0);
}

+ (id)cloudConfigSkipKey
{
  return 0;
}

+ (unint64_t)applicableDispositions
{
  return 14;
}

- (void)startOver
{
  -[BuddyLanguageController _updateLanguageList](self, "_updateLanguageList", a2, self);
}

- (BOOL)shouldAllowStartOver
{
  return 1;
}

- (BOOL)shouldStopInactivityTimer
{
  return 1;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  NSArray *v5;
  NSUInteger v6;
  id location[2];
  BuddyLanguageController *v9;

  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = -[BuddyLanguageController languageCodes](v9, "languageCodes", a4);
  v6 = -[NSArray count](v5, "count");

  objc_storeStrong(location, 0);
  return v6;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  UIFont *v5;
  id v6;
  NSArray *v7;
  NSDictionary *v8;
  NSLocale *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v17;
  id v18;
  id v19;
  id v20;
  id obj;
  id v22;
  id v23;
  id v24;
  id v25;
  id location[2];
  BuddyLanguageController *v27;

  v27 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v25 = 0;
  objc_storeStrong(&v25, a4);
  v24 = objc_msgSend(location[0], "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("Cell"), v25);
  objc_msgSend(v24, "setAccessoryType:", 1);
  objc_msgSend(v24, "setMinimumHeight:", 60.0);
  v23 = +[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody);
  objc_msgSend(v23, "pointSize");
  v5 = +[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:");
  v6 = objc_msgSend(v24, "titleLabel");
  objc_msgSend(v6, "setFont:", v5);

  v7 = -[BuddyLanguageController languageCodes](v27, "languageCodes");
  v22 = -[NSArray objectAtIndex:](v7, "objectAtIndex:", objc_msgSend(v25, "row"));

  v8 = -[BuddyLanguageController languageStrings](v27, "languageStrings");
  obj = -[NSDictionary objectForKey:](v8, "objectForKey:", v22);

  v20 = sub_10012A4C4(obj, v22);
  if (-[BuddyLanguageController showLocalizedNames](v27, "showLocalizedNames"))
  {
    v9 = +[NSLocale currentLocale](NSLocale, "currentLocale");
    v19 = -[NSLocale localizedStringForLanguage:context:](v9, "localizedStringForLanguage:context:", v22, 4);

    v18 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", CFSTR(" (%@ - %@)"), v22, v19);
    v17 = objc_msgSend(v20, "mutableCopy");
    v10 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:", v18);
    objc_msgSend(v17, "appendAttributedString:", v10);

    v11 = objc_msgSend(v17, "copy");
    v12 = v20;
    v20 = v11;

    objc_storeStrong(&v17, 0);
    objc_storeStrong(&v18, 0);
    objc_storeStrong(&v19, 0);
  }
  v13 = v20;
  v14 = objc_msgSend(v24, "titleLabel");
  objc_msgSend(v14, "setAttributedText:", v13);

  v15 = v24;
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&obj, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(location, 0);
  return v15;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  NSArray *v5;
  uint64_t v6;
  os_log_t oslog;
  id v8;
  id v9;
  id location[2];
  BuddyLanguageController *v11;
  uint8_t buf[24];

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v9 = 0;
  objc_storeStrong(&v9, a4);
  objc_msgSend(location[0], "deselectRowAtIndexPath:animated:", v9, 1);
  v5 = -[BuddyLanguageController languageCodes](v11, "languageCodes");
  v8 = -[NSArray objectAtIndexedSubscript:](v5, "objectAtIndexedSubscript:", objc_msgSend(v9, "row"));

  oslog = (os_log_t)(id)_BYLoggingFacility(v6);
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_100038C28((uint64_t)buf, (uint64_t)v8);
    _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "Tapped language %@", buf, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  -[BuddyLanguageController _selectLanguage:](v11, "_selectLanguage:", v8);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
  return 0.0;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
  return 0.0;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
  return 0;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
  return 0;
}

- (id)internalMenuActions
{
  UIAlertAction *v2;
  UIAlertAction *v3;
  void **v5;
  uint64_t v6;
  void (*v7)(id *, void *);
  void *v8;
  BuddyLanguageController *v9;
  void **v10;
  int v11;
  int v12;
  void (*v13)(id *, void *);
  void *v14;
  id v15[2];
  BuddyLanguageController *v16;
  NSArray *v17;
  UIAlertAction *v18;
  UIAlertAction *v19;

  v16 = self;
  v15[1] = (id)a2;
  if (-[BuddyLanguageController showLocalizedNames](self, "showLocalizedNames"))
  {
    v10 = _NSConcreteStackBlock;
    v11 = -1073741824;
    v12 = 0;
    v13 = sub_10009153C;
    v14 = &unk_100280A28;
    v15[0] = v16;
    v2 = +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", CFSTR("Hide Translated Languages/Countries"), 0, &v10);
    v19 = v2;
    v17 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v19, 1);

    objc_storeStrong(v15, 0);
  }
  else
  {
    v5 = _NSConcreteStackBlock;
    v6 = 3221225472;
    v7 = sub_10009158C;
    v8 = &unk_100280A28;
    v9 = v16;
    v3 = +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", CFSTR("Show Translated Languages/Countries"), 0, &v5);
    v18 = v3;
    v17 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v18, 1, v5, v6, v7, v8);

    objc_storeStrong((id *)&v9, 0);
  }
  return v17;
}

- (BFFFlowItemDelegate)delegate
{
  return (BFFFlowItemDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BuddyLanguageComposite)languageComposite
{
  return self->_languageComposite;
}

- (BuddyLanguageLocaleSelectionReceiver)selectionReceiver
{
  return (BuddyLanguageLocaleSelectionReceiver *)objc_loadWeakRetained((id *)&self->_selectionReceiver);
}

- (void)setSelectionReceiver:(id)a3
{
  objc_storeWeak((id *)&self->_selectionReceiver, a3);
}

- (void)setLanguageTableView:(id)a3
{
  objc_storeStrong((id *)&self->_languageTableView, a3);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animationController, 0);
  objc_storeStrong((id *)&self->_languageCodes, 0);
  objc_storeStrong((id *)&self->_languageStrings, 0);
  objc_storeStrong((id *)&self->_languageTableView, 0);
  objc_destroyWeak((id *)&self->_selectionReceiver);
  objc_storeStrong((id *)&self->_languageComposite, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
