@implementation BuddyLocaleController

- (BuddyLocaleController)init
{
  BuddyLocaleController *v2;
  objc_super v4;
  SEL v5;
  id location;

  v5 = a2;
  location = 0;
  v4.receiver = self;
  v4.super_class = (Class)BuddyLocaleController;
  location = -[BuddyLocaleController initWithTitle:detailText:symbolName:adoptTableViewScrollView:](&v4, "initWithTitle:detailText:symbolName:adoptTableViewScrollView:", &stru_100284738, &stru_100284738, 0, 1);
  v2 = (BuddyLocaleController *)location;
  objc_storeStrong(&location, 0);
  return v2;
}

- (void)loadView
{
  id v2;
  objc_super v3;
  SEL v4;
  BuddyLocaleController *v5;

  v5 = self;
  v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)BuddyLocaleController;
  -[BuddyLocaleController loadView](&v3, "loadView");
  v2 = -[BuddyLocaleController navigationItem](v5, "navigationItem");
  objc_msgSend(v2, "_setManualScrollEdgeAppearanceEnabled:", 1);

}

- (void)viewDidLoad
{
  id v2;
  UITableView *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  UITableView *v7;
  BuddyLocaleController *v8;
  UITableView *v9;
  BuddyLocaleController *v10;
  UITableView *v11;
  UITableView *v12;
  UITableView *v13;
  id v14;
  UITableView *v15;
  NSString *v16;
  NSWritingDirection v17;
  id v18;
  BuddyLocaleController *v19;
  UITableView *v20;
  id v21;
  BuddyLocaleController *v22;
  id v23;
  id v24;
  BuddyLocaleController *v25;
  id v26;
  id v27;
  BuddyLocaleController *v28;
  UITableView *v29;
  id v30;
  id v31;
  id v32;
  NSString *v33;
  id location;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  objc_super v39;
  SEL v40;
  BuddyLocaleController *v41;
  id v42;

  v41 = self;
  v40 = a2;
  v39.receiver = self;
  v39.super_class = (Class)BuddyLocaleController;
  -[BuddyLocaleController viewDidLoad](&v39, "viewDidLoad");
  v2 = objc_msgSend(objc_alloc((Class)UITableView), "initWithFrame:style:", 2, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  -[BuddyLocaleController setBuddyLocaleTableView:](v41, "setBuddyLocaleTableView:", v2);

  v3 = -[BuddyLocaleController buddyLocaleTableView](v41, "buddyLocaleTableView");
  -[UITableView registerClass:forCellReuseIdentifier:](v3, "registerClass:forCellReuseIdentifier:", objc_opt_class(BuddyLanguageLocaleCell), CFSTR("Cell"));

  *(_QWORD *)&v37 = sub_1000922AC();
  *((_QWORD *)&v37 + 1) = v4;
  *(_QWORD *)&v38 = v5;
  *((_QWORD *)&v38 + 1) = v6;
  v7 = -[BuddyLocaleController buddyLocaleTableView](v41, "buddyLocaleTableView");
  v36 = v38;
  v35 = v37;
  -[UITableView setDirectionalLayoutMargins:](v7, "setDirectionalLayoutMargins:", v37, v38);

  v8 = v41;
  v9 = -[BuddyLocaleController buddyLocaleTableView](v41, "buddyLocaleTableView");
  -[UITableView setDelegate:](v9, "setDelegate:", v8);

  v10 = v41;
  v11 = -[BuddyLocaleController buddyLocaleTableView](v41, "buddyLocaleTableView");
  -[UITableView setDataSource:](v11, "setDataSource:", v10);

  v12 = -[BuddyLocaleController buddyLocaleTableView](v41, "buddyLocaleTableView");
  -[UITableView setTranslatesAutoresizingMaskIntoConstraints:](v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v13 = -[BuddyLocaleController buddyLocaleTableView](v41, "buddyLocaleTableView");
  -[UITableView _setDrawsSeparatorAtTopOfSections:](v13, "_setDrawsSeparatorAtTopOfSections:", 1);

  v14 = -[BuddyLocaleController view](v41, "view");
  v15 = -[BuddyLocaleController buddyLocaleTableView](v41, "buddyLocaleTableView");
  objc_msgSend(v14, "addSubview:", v15);

  -[BuddyLocaleController _loadSavedStatePostLanguageReboot](v41, "_loadSavedStatePostLanguageReboot");
  v16 = -[BuddyLocaleController language](v41, "language");
  v17 = +[NSParagraphStyle defaultWritingDirectionForLanguage:](NSParagraphStyle, "defaultWritingDirectionForLanguage:", v16);

  if (v17 == NSWritingDirectionRightToLeft)
  {
    v18 = -[BuddyLocaleController view](v41, "view");
    objc_msgSend(v18, "buddy_setSemanticContentAttributeRecursively:", 4);
  }
  else
  {
    v18 = -[BuddyLocaleController view](v41, "view");
    objc_msgSend(v18, "buddy_setSemanticContentAttributeRecursively:", 3);
  }

  v19 = v41;
  v20 = -[BuddyLocaleController buddyLocaleTableView](v41, "buddyLocaleTableView");
  -[BuddyLocaleController setTableView:](v19, "setTableView:", v20);

  if (-[BuddyLocaleController isResumingFromLanguageReboot](v41, "isResumingFromLanguageReboot"))
  {
    v21 = objc_msgSend(objc_alloc((Class)OBAnimationState), "initWithStateName:darkStateName:transitionDuration:transitionSpeed:", CFSTR("State 2"), CFSTR("Dark 2"), 1.0, 0.5);
    v42 = v21;
    location = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v42, 1);

    v22 = v41;
    v23 = -[BuddyLocaleController _micaAssetName](v41, "_micaAssetName");
    v24 = -[BuddyLocaleController buddy_animationController:animatedStates:startAtFirstState:](v22, "buddy_animationController:animatedStates:startAtFirstState:", v23, location, 1);
    -[BuddyLocaleController setAnimationController:](v41, "setAnimationController:", v24);

    objc_storeStrong(&location, 0);
  }
  else
  {
    v25 = v41;
    v26 = -[BuddyLocaleController _micaAssetName](v41, "_micaAssetName");
    v27 = -[BuddyLocaleController buddy_animationController:](v25, "buddy_animationController:", v26);
    -[BuddyLocaleController setAnimationController:](v41, "setAnimationController:", v27);

  }
  v28 = v41;
  v29 = -[BuddyLocaleController buddyLocaleTableView](v41, "buddyLocaleTableView");
  -[UITableView setDelegate:](v29, "setDelegate:", v28);

  v30 = -[BuddyLocaleController headerView](v41, "headerView");
  v31 = -[BuddyLocaleController headerTitle](v41, "headerTitle");
  objc_msgSend(v30, "setTitle:", v31);

  v32 = -[BuddyLocaleController headerView](v41, "headerView");
  v33 = -[BuddyLocaleController language](v41, "language");
  objc_msgSend(v32, "setLanguage:", v33);

}

- (void)viewWillAppear:(BOOL)a3
{
  id v3;
  BuddyLocaleController *v4;
  UITableView *v5;
  OBAnimationController *v6;
  void **v7;
  uint64_t v8;
  void (*v9)(id *);
  void *v10;
  BuddyLocaleController *v11;
  objc_super v12;
  BOOL v13;
  SEL v14;
  BuddyLocaleController *v15;
  id location;
  dispatch_once_t *v17;

  v15 = self;
  v14 = a2;
  v13 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BuddyLocaleController;
  -[BuddyLocaleController viewWillAppear:](&v12, "viewWillAppear:", a3);
  v7 = _NSConcreteStackBlock;
  v8 = 3221225472;
  v9 = sub_100092498;
  v10 = &unk_100280730;
  v11 = v15;
  v17 = (dispatch_once_t *)&unk_1002EE8E8;
  location = 0;
  objc_storeStrong(&location, &v7);
  if (*v17 != -1)
    dispatch_once(v17, location);
  objc_storeStrong(&location, 0);
  v3 = -[BuddyLocaleController navigationItem](v15, "navigationItem", v7, v8, v9, v10);
  objc_msgSend(v3, "_setManualScrollEdgeAppearanceProgress:", 0.0);

  v4 = v15;
  v5 = -[BuddyLocaleController buddyLocaleTableView](v15, "buddyLocaleTableView");
  -[BuddyLocaleController _updateChromelessBar:](v4, "_updateChromelessBar:", v5);

  if (!-[BuddyLocaleController isResumingFromLanguageReboot](v15, "isResumingFromLanguageReboot"))
  {
    v6 = -[BuddyLocaleController animationController](v15, "animationController");
    -[OBAnimationController startAnimation](v6, "startAnimation");

  }
  objc_storeStrong((id *)&v11, 0);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  UITableView *v4;
  id v5;
  void *v6;
  void *v7;
  UITableView *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void **v15;
  int v16;
  int v17;
  void (*v18)(uint64_t, void *);
  void *v19;
  BuddyLocaleController *v20;
  id v21[7];
  id v22;
  objc_super v23;
  id location[2];
  BuddyLocaleController *v25;
  CGSize v26;

  v26 = a3;
  v25 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a4);
  v23.receiver = v25;
  v23.super_class = (Class)BuddyLocaleController;
  -[BuddyLocaleController viewWillTransitionToSize:withTransitionCoordinator:](&v23, "viewWillTransitionToSize:withTransitionCoordinator:", location[0], v26.width, v26.height);
  v4 = -[BuddyLocaleController buddyLocaleTableView](v25, "buddyLocaleTableView");
  v5 = -[BuddyLocaleController view](v25, "view");
  objc_msgSend(v5, "center");
  v21[3] = v6;
  v21[4] = v7;
  v8 = -[BuddyLocaleController buddyLocaleTableView](v25, "buddyLocaleTableView");
  -[UITableView contentOffset](v8, "contentOffset");
  v21[1] = v9;
  v21[2] = v10;
  sub_1000927E8();
  v21[5] = v11;
  v21[6] = v12;
  v22 = -[UITableView indexPathForRowAtPoint:](v4, "indexPathForRowAtPoint:", *(double *)&v11, *(double *)&v12);

  v13 = location[0];
  v14 = -[BuddyLocaleController view](v25, "view");
  v15 = _NSConcreteStackBlock;
  v16 = -1073741824;
  v17 = 0;
  v18 = sub_100092860;
  v19 = &unk_100281BA0;
  v20 = v25;
  v21[0] = v22;
  objc_msgSend(v13, "animateAlongsideTransitionInView:animation:completion:", v14, &stru_100281B78, &v15);

  objc_storeStrong(v21, 0);
  objc_storeStrong((id *)&v20, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(location, 0);
}

- (id)headerTitle
{
  NSString *v2;
  NSUInteger v3;
  NSBundle *v4;
  NSString *v5;
  NSString *v8;

  v2 = -[BuddyLocaleController language](self, "language");
  v3 = -[NSString length](v2, "length");

  v4 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  if (v3)
  {
    v5 = -[BuddyLocaleController language](self, "language");
    v8 = (NSString *)(id)SFLocalizedStringFromTableInBundleForLanguage(CFSTR("SELECT_COUNTRY_OR_REGION"), CFSTR("Localizable"));

  }
  else
  {
    v8 = -[NSBundle localizedStringForKey:value:table:](v4, "localizedStringForKey:value:table:", CFSTR("SELECT_COUNTRY_OR_REGION"), &stru_100284738, CFSTR("Localizable"));
  }

  return v8;
}

- (void)setShowLocalizedNames:(BOOL)a3
{
  UITableView *v3;

  self->_showLocalizedNames = a3;
  v3 = -[BuddyLocaleController buddyLocaleTableView](self, "buddyLocaleTableView");
  -[UITableView reloadData](v3, "reloadData");

}

- (BOOL)_postLanguageReboot
{
  BuddyLocaleComposite *v2;
  double v3;
  BOOL v4;

  v2 = -[BuddyLocaleController localeComposite](self, "localeComposite", a2, self);
  -[BuddyLocaleComposite scrollOffset](v2, "scrollOffset");
  v4 = v3 >= 0.0;

  return v4;
}

- (void)_loadSavedStatePostLanguageReboot
{
  UITableView *v2;
  UITableView *v3;
  BuddyLocaleComposite *v4;
  double v5;
  double v6;

  if (-[BuddyLocaleController _postLanguageReboot](self, "_postLanguageReboot"))
  {
    v2 = -[BuddyLocaleController buddyLocaleTableView](self, "buddyLocaleTableView");
    -[UITableView reloadData](v2, "reloadData");

    v3 = -[BuddyLocaleController buddyLocaleTableView](self, "buddyLocaleTableView");
    v4 = -[BuddyLocaleController localeComposite](self, "localeComposite");
    -[BuddyLocaleComposite scrollOffset](v4, "scrollOffset");
    sub_1000927E8();
    -[UITableView setContentOffset:animated:](v3, "setContentOffset:animated:", 0, v5, v6, *(_QWORD *)&v5, *(_QWORD *)&v6);

  }
}

- (void)_updateChromelessBar:(id)a3
{
  double v3;
  double v4;
  uint64_t v5;
  id v6;
  double v7;
  id location[2];
  BuddyLocaleController *v9;

  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_msgSend(location[0], "contentOffset");
  if (v3 <= 0.0)
  {
    v6 = -[BuddyLocaleController navigationItem](v9, "navigationItem", v3);
    objc_msgSend(v6, "_setManualScrollEdgeAppearanceProgress:", 0.0);
  }
  else
  {
    objc_msgSend(location[0], "contentOffset", v3);
    v7 = fmin(v4 * 10.0, 100.0) / 100.0;
    v6 = -[BuddyLocaleController navigationItem](v9, "navigationItem", v5, *(_QWORD *)&v4);
    objc_msgSend(v6, "_setManualScrollEdgeAppearanceProgress:", v7);
  }

  objc_storeStrong(location, 0);
}

- (void)selectCountry:(id)a3
{
  NSArray *v3;
  id v4;
  id v5;
  NSUserDefaults *v6;
  BuddyLanguageLocaleSelectionReceiver *v7;
  UITableView *v8;
  uint64_t v9;
  double v10;
  char v11;
  id WeakRetained;
  id v13;
  id v14;
  int v15;
  id location[2];
  BuddyLocaleController *v17;

  v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (location[0])
  {
    v14 = -[BuddyLocaleController language](v17, "language");
    if (!v14)
    {
      v3 = +[NSLocale preferredLanguages](NSLocale, "preferredLanguages");
      v14 = -[NSArray firstObject](v3, "firstObject");

    }
    v13 = objc_msgSend(location[0], "code");
    if (objc_msgSend(v14, "length") && objc_msgSend(v13, "length"))
    {
      v4 = +[IntlUtility languageIdentifierFromIdentifier:withRegion:](IntlUtility, "languageIdentifierFromIdentifier:withRegion:", v14, v13);
      v5 = v14;
      v14 = v4;

    }
    v6 = +[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults");
    -[NSUserDefaults setBool:forKey:](v6, "setBool:forKey:", 1, CFSTR("UserChoseLanguage"));

    v7 = -[BuddyLocaleController selectionReceiver](v17, "selectionReceiver");
    v8 = -[BuddyLocaleController buddyLocaleTableView](v17, "buddyLocaleTableView");
    -[UITableView contentOffset](v8, "contentOffset");
    v11 = -[BuddyLanguageLocaleSelectionReceiver userSelectedLanguageWithLocale:countryCode:localePaneScrollOffset:](v7, "userSelectedLanguageWithLocale:countryCode:localePaneScrollOffset:", v14, v13, v10, v9, *(_QWORD *)&v10) ^ 1;

    if ((v11 & 1) != 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)&v17->_delegate);
      objc_msgSend(WeakRetained, "flowItemDone:", v17);

    }
    objc_storeStrong(&v13, 0);
    objc_storeStrong(&v14, 0);
    v15 = 0;
  }
  else
  {
    v15 = 1;
  }
  objc_storeStrong(location, 0);
}

- (id)countryAtIndexPath:(id)a3
{
  BuddyLocaleComposite *v3;
  BYLocaleDataSource *v4;
  id v5;
  id v6;
  BuddyLocaleComposite *v7;
  BYLocaleDataSource *v8;
  id v9;
  id v10;
  id v11;
  id v13;
  id v14;
  id location[2];
  BuddyLocaleController *v16;

  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v14 = 0;
  v13 = objc_msgSend(location[0], "section");
  if (v13)
  {
    if (v13 == (id)1)
    {
      v7 = -[BuddyLocaleController localeComposite](v16, "localeComposite");
      v8 = -[BuddyLocaleComposite dataSource](v7, "dataSource");
      v9 = -[BYLocaleDataSource otherLocaleAtIndex:](v8, "otherLocaleAtIndex:", objc_msgSend(location[0], "row"));
      v10 = v14;
      v14 = v9;

    }
  }
  else
  {
    v3 = -[BuddyLocaleController localeComposite](v16, "localeComposite");
    v4 = -[BuddyLocaleComposite dataSource](v3, "dataSource");
    v5 = -[BYLocaleDataSource recommendedLocaleAtIndex:](v4, "recommendedLocaleAtIndex:", objc_msgSend(location[0], "row"));
    v6 = v14;
    v14 = v5;

  }
  v11 = v14;
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
  return v11;
}

- (void)setLocaleComposite:(id)a3
{
  id v3;
  id location[2];
  BuddyLocaleController *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong((id *)&v5->_localeComposite, location[0]);
  v3 = objc_msgSend(location[0], "language");
  -[BuddyLocaleController setLanguage:](v5, "setLanguage:", v3);

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

- (BOOL)controllerNeedsToRun
{
  NSString *v2;
  BYPreferencesController *v3;
  BYPreferencesController *v4;
  BYPreferencesController *v5;
  BOOL v6;
  BOOL v7;
  id v9;
  id location;
  id v11[2];
  BuddyLocaleController *v12;
  char v13;

  v12 = self;
  v11[1] = (id)a2;
  v2 = -[BuddyLocaleController language](self, "language");

  if (v2)
  {
    v13 = 1;
  }
  else if (-[BuddyLocaleController isResumingFromLanguageReboot](v12, "isResumingFromLanguageReboot"))
  {
    v13 = 1;
  }
  else
  {
    v3 = -[BuddyLocaleController buddyPreferences](v12, "buddyPreferences");
    v11[0] = -[BYPreferencesController objectForKey:](v3, "objectForKey:", CFSTR("LockdownSetLanguage"));

    v4 = -[BuddyLocaleController buddyPreferences](v12, "buddyPreferences");
    location = -[BYPreferencesController objectForKey:](v4, "objectForKey:", CFSTR("Locale"));

    v5 = -[BuddyLocaleController buddyPreferences](v12, "buddyPreferences");
    v9 = -[BYPreferencesController objectForKey:](v5, "objectForKey:", CFSTR("Language"));

    v6 = 0;
    if (!location)
    {
      v7 = 0;
      if (v11[0])
        v7 = v9 == 0;
      v6 = !v7;
    }
    v13 = v6;
    objc_storeStrong(&v9, 0);
    objc_storeStrong(&location, 0);
    objc_storeStrong(v11, 0);
  }
  return v13 & 1;
}

- (void)controllerWasPopped
{
  BYPreferencesController *v2;

  v2 = -[BuddyLocaleController buddyPreferences](self, "buddyPreferences", a2, self);
  -[BYPreferencesController removeObjectForKey:](v2, "removeObjectForKey:", CFSTR("Locale"));

}

- (id)displayLanguage
{
  return -[BuddyLocaleController language](self, "language", a2, self);
}

- (void)scrollViewDidScroll:(id)a3
{
  id location[2];
  BuddyLocaleController *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[BuddyLocaleController _updateChromelessBar:](v4, "_updateChromelessBar:", location[0]);
  objc_storeStrong(location, 0);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
  return 2;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  BuddyLocaleComposite *v5;
  BYLocaleDataSource *v6;
  BuddyLocaleComposite *v7;
  BYLocaleDataSource *v8;
  id location[2];
  BuddyLocaleController *v11;
  id v12;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (a4)
  {
    if (a4 == 1)
    {
      v7 = -[BuddyLocaleController localeComposite](v11, "localeComposite");
      v8 = -[BuddyLocaleComposite dataSource](v7, "dataSource");
      v12 = -[BYLocaleDataSource numberOfOtherLocales](v8, "numberOfOtherLocales");

    }
    else
    {
      v12 = 0;
    }
  }
  else
  {
    v5 = -[BuddyLocaleController localeComposite](v11, "localeComposite");
    v6 = -[BuddyLocaleComposite dataSource](v5, "dataSource");
    v12 = -[BYLocaleDataSource numberOfRecommendedLocales](v6, "numberOfRecommendedLocales");

  }
  objc_storeStrong(location, 0);
  return (int64_t)v12;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  UIFont *v5;
  id v6;
  NSString *v7;
  NSLocale *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  NSString *v16;
  uint64_t v17;
  id v18;
  id v19;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id location[2];
  BuddyLocaleController *v31;

  v31 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v29 = 0;
  objc_storeStrong(&v29, a4);
  v28 = objc_msgSend(location[0], "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("Cell"), v29);
  objc_msgSend(v28, "setAccessoryType:", 1);
  objc_msgSend(v28, "setMinimumHeight:", 60.0);
  v27 = +[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody);
  objc_msgSend(v27, "pointSize");
  v5 = +[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:");
  v6 = objc_msgSend(v28, "titleLabel");
  objc_msgSend(v6, "setFont:", v5);

  v26 = -[BuddyLocaleController countryAtIndexPath:](v31, "countryAtIndexPath:", v29);
  v25 = objc_msgSend(v26, "name");
  v7 = -[BuddyLocaleController language](v31, "language");
  v24 = sub_10012A4C4(v25, v7);

  if (-[BuddyLocaleController showLocalizedNames](v31, "showLocalizedNames"))
  {
    v8 = +[NSLocale currentLocale](NSLocale, "currentLocale");
    v9 = objc_msgSend(v26, "code");
    v23 = -[NSLocale localizedStringForRegion:context:short:](v8, "localizedStringForRegion:context:short:", v9, 4, 1);

    v10 = objc_msgSend(v26, "code");
    v22 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" (%@ - %@)"), v10, v23);

    v21 = objc_msgSend(v24, "mutableCopy");
    v11 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:", v22);
    objc_msgSend(v21, "appendAttributedString:", v11);

    v12 = objc_msgSend(v21, "copy");
    v13 = v24;
    v24 = v12;

    objc_storeStrong(&v21, 0);
    objc_storeStrong(&v22, 0);
    objc_storeStrong(&v23, 0);
  }
  v14 = v24;
  v15 = objc_msgSend(v28, "titleLabel");
  objc_msgSend(v15, "setAttributedText:", v14);

  v16 = -[BuddyLocaleController language](v31, "language");
  if ((id)+[NSParagraphStyle defaultWritingDirectionForLanguage:](NSParagraphStyle, "defaultWritingDirectionForLanguage:", v16) == (id)1)v17 = 2;
  else
    v17 = 0;
  v18 = objc_msgSend(v28, "titleLabel");
  objc_msgSend(v18, "setTextAlignment:", v17);

  v19 = v28;
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(&v27, 0);
  objc_storeStrong(&v28, 0);
  objc_storeStrong(&v29, 0);
  objc_storeStrong(location, 0);
  return v19;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  NSString *v5;
  NSUInteger v6;
  NSBundle *v7;
  NSString *v8;
  id location[2];
  BuddyLocaleController *v11;
  NSString *v12;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (a4 == 1)
  {
    v5 = -[BuddyLocaleController language](v11, "language");
    v6 = -[NSString length](v5, "length");

    v7 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    if (v6)
    {
      v8 = -[BuddyLocaleController language](v11, "language");
      v12 = (NSString *)(id)SFLocalizedStringFromTableInBundleForLanguage(CFSTR("MORE_COUNTRIES_AND_REGIONS"), CFSTR("Localizable"));

    }
    else
    {
      v12 = -[NSBundle localizedStringForKey:value:table:](v7, "localizedStringForKey:value:table:", CFSTR("MORE_COUNTRIES_AND_REGIONS"), &stru_100284738, CFSTR("Localizable"));
    }

  }
  else
  {
    v12 = 0;
  }
  objc_storeStrong(location, 0);
  return v12;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  BuddyLocaleController *v5;
  id v6;
  id v7;
  id location[2];
  BuddyLocaleController *v9;

  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7 = 0;
  objc_storeStrong(&v7, a4);
  objc_msgSend(location[0], "deselectRowAtIndexPath:animated:", v7, 1);
  v5 = v9;
  v6 = -[BuddyLocaleController countryAtIndexPath:](v9, "countryAtIndexPath:", v7);
  -[BuddyLocaleController selectCountry:](v5, "selectCountry:", v6);

  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
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

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  BuddyTableSectionHeaderView *v5;
  BOOL v6;
  void *v7;
  BuddyTableSectionHeaderView *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BuddyTableSectionHeaderView *v13;
  id v14;
  id v15;
  BuddyTableSectionHeaderView *v16;
  UILabel *v17;
  NSString *v18;
  id v19;
  id v20;
  BuddyTableSectionHeaderView *v21;
  UILabel *v22;
  NSString *v23;
  NSWritingDirection v24;
  BuddyTableSectionHeaderView *v25;
  UILabel *v26;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32[6];
  int v33;
  int64_t v34;
  id location[2];
  BuddyLocaleController *v36;
  BuddyTableSectionHeaderView *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  id v41;

  v36 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v34 = a4;
  if (a4)
  {
    v5 = -[BuddyLocaleController sectionHeader](v36, "sectionHeader");
    v6 = v5 == 0;

    if (v6)
    {
      -[BuddyLocaleController _topPaddingForSectionHeader](v36, "_topPaddingForSectionHeader");
      v32[5] = v7;
      v8 = [BuddyTableSectionHeaderView alloc];
      sub_100093EB0();
      v32[1] = v9;
      v32[2] = v10;
      v32[3] = v11;
      v32[4] = v12;
      v13 = -[BuddyTableSectionHeaderView initWithPadding:](v8, "initWithPadding:", *(double *)&v9, *(double *)&v10, *(double *)&v11, *(double *)&v12);
      -[BuddyLocaleController setSectionHeader:](v36, "setSectionHeader:", v13);

    }
    v32[0] = UIFontTextStyleTitle2;
    v14 = +[BYDevice currentDevice](BYDevice, "currentDevice");
    v15 = objc_msgSend(v14, "size");

    if (v15 == (id)2)
      objc_storeStrong(v32, UIFontTextStyleTitle3);
    v16 = -[BuddyLocaleController sectionHeader](v36, "sectionHeader");
    v17 = -[BuddyTableSectionHeaderView sectionLabel](v16, "sectionLabel");
    -[UILabel setLineBreakMode:](v17, "setLineBreakMode:", 0);

    v31 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:](UIFontDescriptor, "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", v32[0], 2, 0);
    v30 = +[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v31, 0.0);
    v29 = -[BuddyLocaleController tableView:titleForHeaderInSection:](v36, "tableView:titleForHeaderInSection:", location[0], v34);
    v18 = -[BuddyLocaleController language](v36, "language");
    v19 = sub_10012A4C4(v29, v18);
    v28 = objc_msgSend(v19, "mutableCopy");

    v20 = objc_msgSend(v28, "length");
    v39 = 0;
    v38 = v20;
    v40 = 0;
    v41 = v20;
    objc_msgSend(v28, "addAttribute:value:range:", NSFontAttributeName, v30, 0, v20, 0, v20);
    v21 = -[BuddyLocaleController sectionHeader](v36, "sectionHeader");
    v22 = -[BuddyTableSectionHeaderView sectionLabel](v21, "sectionLabel");
    -[UILabel setAttributedText:](v22, "setAttributedText:", v28);

    v23 = -[BuddyLocaleController language](v36, "language");
    v24 = +[NSParagraphStyle defaultWritingDirectionForLanguage:](NSParagraphStyle, "defaultWritingDirectionForLanguage:", v23);

    if (v24 == NSWritingDirectionRightToLeft)
    {
      v25 = -[BuddyLocaleController sectionHeader](v36, "sectionHeader");
      v26 = -[BuddyTableSectionHeaderView sectionLabel](v25, "sectionLabel");
      -[UILabel setTextAlignment:](v26, "setTextAlignment:", 2);
    }
    else
    {
      v25 = -[BuddyLocaleController sectionHeader](v36, "sectionHeader");
      v26 = -[BuddyTableSectionHeaderView sectionLabel](v25, "sectionLabel");
      -[UILabel setTextAlignment:](v26, "setTextAlignment:", 0);
    }

    v37 = -[BuddyLocaleController sectionHeader](v36, "sectionHeader");
    v33 = 1;
    objc_storeStrong(&v28, 0);
    objc_storeStrong(&v29, 0);
    objc_storeStrong(&v30, 0);
    objc_storeStrong(&v31, 0);
    objc_storeStrong(v32, 0);
  }
  else
  {
    v37 = 0;
    v33 = 1;
  }
  objc_storeStrong(location, 0);
  return v37;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v11[2];
  id location[2];
  BuddyLocaleController *v13;
  double v14;

  v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v11[1] = (id)a4;
  if (a4 == 1)
  {
    v11[0] = -[BuddyLocaleController tableView:viewForHeaderInSection:](v13, "tableView:viewForHeaderInSection:", location[0], 1);
    objc_msgSend(location[0], "bounds");
    objc_msgSend(location[0], "layoutMargins");
    objc_msgSend(location[0], "layoutMargins");
    v5 = sub_100094068();
    objc_msgSend(v11[0], "setFrame:", v5, v6, v7, v8);
    objc_msgSend(v11[0], "layoutIfNeeded");
    objc_msgSend(v11[0], "intrinsicContentSize");
    v14 = v9;
    objc_storeStrong(v11, 0);
  }
  else
  {
    v14 = 0.0;
  }
  objc_storeStrong(location, 0);
  return v14;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v7;
  id v8;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v8 = 0;
  objc_storeStrong(&v8, a4);
  v7 = 0;
  objc_storeStrong(&v7, a5);
  objc_msgSend(v8, "setSeparatorStyle:", 1);
  objc_msgSend(v8, "_setShouldHaveFullLengthTopSeparator:", 0);
  objc_msgSend(v8, "_setShouldHaveFullLengthBottomSeparator:", 0);
  objc_storeStrong(&v7, 0);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
}

- (id)internalMenuActions
{
  UIAlertAction *v2;
  UIAlertAction *v3;
  void **v5;
  uint64_t v6;
  void (*v7)(id *, void *);
  void *v8;
  BuddyLocaleController *v9;
  void **v10;
  int v11;
  int v12;
  void (*v13)(id *, void *);
  void *v14;
  id v15[2];
  BuddyLocaleController *v16;
  NSArray *v17;
  UIAlertAction *v18;
  UIAlertAction *v19;

  v16 = self;
  v15[1] = (id)a2;
  if (-[BuddyLocaleController showLocalizedNames](self, "showLocalizedNames"))
  {
    v10 = _NSConcreteStackBlock;
    v11 = -1073741824;
    v12 = 0;
    v13 = sub_100094344;
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
    v7 = sub_100094394;
    v8 = &unk_100280A28;
    v9 = v16;
    v3 = +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", CFSTR("Show Translated Languages/Countries"), 0, &v5);
    v18 = v3;
    v17 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v18, 1, v5, v6, v7, v8);

    objc_storeStrong((id *)&v9, 0);
  }
  return v17;
}

- (double)_topPaddingForSectionHeader
{
  UIScreen *v2;
  double v3;
  BOOL v4;
  double v5;
  double v6;
  char v8;
  UIScreen *v9;
  char v10;
  UIScreen *v11;
  id location;
  double v13;
  SEL v14;
  BuddyLocaleController *v15;
  double v16;

  v15 = self;
  v14 = a2;
  v13 = 37.0;
  location = +[BYDevice currentDevice](BYDevice, "currentDevice");
  if (objc_msgSend(location, "type") == (id)1)
  {
    v16 = v13;
  }
  else
  {
    switch((unint64_t)objc_msgSend(location, "size"))
    {
      case 0uLL:
      case 4uLL:
        v13 = 37.0;
        break;
      case 1uLL:
      case 3uLL:
      case 5uLL:
        v13 = 26.0;
        break;
      case 2uLL:
        v13 = 20.0;
        break;
      case 6uLL:
        v2 = +[UIScreen mainScreen](UIScreen, "mainScreen");
        -[UIScreen bounds](v2, "bounds");
        v10 = 0;
        v8 = 0;
        v4 = 0;
        if (v3 == 414.0)
        {
          v11 = +[UIScreen mainScreen](UIScreen, "mainScreen", v3);
          v10 = 1;
          -[UIScreen bounds](v11, "bounds");
          v4 = 0;
          if (v5 == 896.0)
          {
            v9 = +[UIScreen mainScreen](UIScreen, "mainScreen", v5);
            v8 = 1;
            -[UIScreen scale](v9, "scale");
            v4 = v6 == 3.0;
          }
        }
        if ((v8 & 1) != 0)

        if ((v10 & 1) != 0)
        if (v4)
          v13 = 37.0;
        else
          v13 = 26.0;
        break;
      default:
        break;
    }
    v16 = v13;
  }
  objc_storeStrong(&location, 0);
  return v16;
}

- (id)_micaAssetName
{
  NSString *v2;
  NSLocale *v3;
  BuddyLocaleComposite *v4;
  BYLocaleDataSource *v5;
  id v6;
  BuddyLocaleComposite *v7;
  BYLocaleDataSource *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id location[2];
  id v18[2];
  BuddyLocaleController *v19;
  id v20;

  v19 = self;
  v18[1] = (id)a2;
  v2 = -[BuddyLocaleController language](self, "language");
  v3 = +[NSLocale localeWithLocaleIdentifier:](NSLocale, "localeWithLocaleIdentifier:", v2);
  v18[0] = -[NSLocale countryCode](v3, "countryCode");

  v4 = -[BuddyLocaleController localeComposite](v19, "localeComposite");
  v5 = -[BuddyLocaleComposite dataSource](v4, "dataSource");
  v6 = -[BYLocaleDataSource numberOfRecommendedLocales](v5, "numberOfRecommendedLocales");

  if (v6)
  {
    v7 = -[BuddyLocaleController localeComposite](v19, "localeComposite");
    v8 = -[BuddyLocaleComposite dataSource](v7, "dataSource");
    v9 = -[BYLocaleDataSource recommendedLocaleAtIndex:](v8, "recommendedLocaleAtIndex:", 0);
    v10 = objc_msgSend(v9, "code");
    v11 = v18[0];
    v18[0] = v10;

  }
  v12 = +[NSLocale containingRegionOfRegion:](NSLocale, "containingRegionOfRegion:", v18[0]);
  v13 = objc_msgSend(v12, "integerValue");

  location[1] = v13;
  location[0] = -[BuddyLocaleController _micaAssetNameForRegion:](v19, "_micaAssetNameForRegion:", v13);
  if (!location[0])
  {
    v14 = +[NSLocale containingContinentOfRegion:](NSLocale, "containingContinentOfRegion:", v18[0], 0);
    v15 = objc_msgSend(v14, "integerValue");

    location[0] = -[BuddyLocaleController _micaAssetNameForRegion:](v19, "_micaAssetNameForRegion:", v15, v15);
    if (!location[0])
    {
      location[0] = -[BuddyLocaleController _micaAssetNameForRegion:](v19, "_micaAssetNameForRegion:", 19);

    }
  }
  v20 = location[0];
  objc_storeStrong(location, 0);
  objc_storeStrong(v18, 0);
  return v20;
}

- (id)_micaAssetNameForRegion:(int64_t)a3
{
  if (a3 == 2)
    return CFSTR("GlobeEUAfrica");
  if (a3 == 9)
    return CFSTR("GlobeAsiaOceania");
  if (a3 != 10 && a3 != 19)
  {
    if (a3 == 34)
      return CFSTR("GlobeSouthAsia");
    if (a3 != 142)
    {
      if (a3 != 150)
        return 0;
      return CFSTR("GlobeEUAfrica");
    }
    return CFSTR("GlobeAsiaOceania");
  }
  return CFSTR("GlobeAmericas");
}

- (BFFFlowItemDelegate)delegate
{
  return (BFFFlowItemDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BuddyLocaleComposite)localeComposite
{
  return self->_localeComposite;
}

- (BuddyLanguageLocaleSelectionReceiver)selectionReceiver
{
  return (BuddyLanguageLocaleSelectionReceiver *)objc_loadWeakRetained((id *)&self->_selectionReceiver);
}

- (void)setSelectionReceiver:(id)a3
{
  objc_storeWeak((id *)&self->_selectionReceiver, a3);
}

- (BOOL)showLocalizedNames
{
  return self->_showLocalizedNames;
}

- (BOOL)isResumingFromLanguageReboot
{
  return self->_resumingFromLanguageReboot;
}

- (void)setResumingFromLanguageReboot:(BOOL)a3
{
  self->_resumingFromLanguageReboot = a3;
}

- (BYPreferencesController)buddyPreferences
{
  return self->_buddyPreferences;
}

- (void)setBuddyPreferences:(id)a3
{
  objc_storeStrong((id *)&self->_buddyPreferences, a3);
}

- (UITableView)buddyLocaleTableView
{
  return self->_buddyLocaleTableView;
}

- (void)setBuddyLocaleTableView:(id)a3
{
  objc_storeStrong((id *)&self->_buddyLocaleTableView, a3);
}

- (OBAnimationController)animationController
{
  return self->_animationController;
}

- (void)setAnimationController:(id)a3
{
  objc_storeStrong((id *)&self->_animationController, a3);
}

- (BuddyTableSectionHeaderView)sectionHeader
{
  return self->_sectionHeader;
}

- (void)setSectionHeader:(id)a3
{
  objc_storeStrong((id *)&self->_sectionHeader, a3);
}

- (NSString)language
{
  return self->_language;
}

- (void)setLanguage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_sectionHeader, 0);
  objc_storeStrong((id *)&self->_animationController, 0);
  objc_storeStrong((id *)&self->_buddyLocaleTableView, 0);
  objc_storeStrong((id *)&self->_buddyPreferences, 0);
  objc_destroyWeak((id *)&self->_selectionReceiver);
  objc_storeStrong((id *)&self->_localeComposite, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
