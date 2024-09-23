@implementation BuddyMultilingualExpressViewController

+ (BOOL)controllerAffectedByTapFreeSetup
{
  return 1;
}

+ (id)cloudConfigSkipKey
{
  return 0;
}

+ (unint64_t)applicableDispositions
{
  return 14;
}

- (BuddyMultilingualExpressViewController)init
{
  NSBundle *v2;
  NSBundle *v3;
  id v4;
  id v5;
  BuddyMultilingualExpressViewController *v6;
  objc_super v8;
  id location;
  id v10[2];
  id v11;

  v11 = self;
  v10[1] = (id)a2;
  v2 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v10[0] = -[NSBundle localizedStringForKey:value:table:](v2, "localizedStringForKey:value:table:", CFSTR("MULTILINGUAL_EXPRESS_LANGUAGE_TITLE"), &stru_100284738, CFSTR("Localizable"));

  v3 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v4 = +[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", CFSTR("MULTILINGUAL_EXPRESS_LANGUAGE_SUBTEXT"));
  location = -[NSBundle localizedStringForKey:value:table:](v3, "localizedStringForKey:value:table:", v4, &stru_100284738, CFSTR("Localizable"));

  v5 = v11;
  v11 = 0;
  v8.receiver = v5;
  v8.super_class = (Class)BuddyMultilingualExpressViewController;
  v11 = -[BuddyMultilingualExpressViewController initWithTitle:detailText:symbolName:](&v8, "initWithTitle:detailText:symbolName:", v10[0], location, 0);
  v6 = (BuddyMultilingualExpressViewController *)v11;
  objc_storeStrong(&location, 0);
  objc_storeStrong(v10, 0);
  objc_storeStrong(&v11, 0);
  return v6;
}

- (void)viewDidLoad
{
  BuddyMultilingualDataModelProviderCollection *v2;
  BuddyMultilingualProvider *v3;
  id v4;
  BuddyMultilingualDataModelProviderCollection *v5;
  BuddyMultilingualProvider *v6;
  id v7;
  NSArray *v8;
  NSUInteger v9;
  uint64_t v10;
  BuddyMultilingualExpressViewController *v11;
  NSBundle *v12;
  NSString *v13;
  BuddyMultilingualExpressViewController *v14;
  NSArray *v15;
  id v16;
  NSObject *v17;
  os_log_type_t v18;
  NSArray *v19;
  NSUInteger v20;
  BuddyMultilingualExpressViewController *v21;
  NSBundle *v22;
  NSString *v23;
  BuddyMultilingualExpressViewController *v24;
  NSArray *v25;
  id v26;
  NSBundle *v27;
  NSString *v28;
  id v29;
  NSBundle *v30;
  NSString *v31;
  id v32;
  id v33;
  id location;
  uint8_t buf[7];
  char v36;
  os_log_t oslog;
  id v38;
  id v39;
  objc_super v40;
  SEL v41;
  BuddyMultilingualExpressViewController *v42;

  v42 = self;
  v41 = a2;
  v40.receiver = self;
  v40.super_class = (Class)BuddyMultilingualExpressViewController;
  -[BuddyMultilingualExpressViewController viewDidLoad](&v40, "viewDidLoad");
  v2 = -[BuddyMultilingualExpressViewController providerCollection](v42, "providerCollection");
  v3 = -[BuddyMultilingualDataModelProviderCollection keyboardProvider](v2, "keyboardProvider");
  v4 = -[BuddyMultilingualProvider createDataSourceForPreselectedItems](v3, "createDataSourceForPreselectedItems");
  -[BuddyMultilingualExpressViewController setKeyboardBackingStore:](v42, "setKeyboardBackingStore:", v4);

  v5 = -[BuddyMultilingualExpressViewController providerCollection](v42, "providerCollection");
  v6 = -[BuddyMultilingualDataModelProviderCollection dictationProvider](v5, "dictationProvider");
  v7 = -[BuddyMultilingualProvider createDataSourceForPreselectedItems](v6, "createDataSourceForPreselectedItems");
  -[BuddyMultilingualExpressViewController setDictationBackingStore:](v42, "setDictationBackingStore:", v7);

  v39 = +[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("Bullet-Icon-Keyboards"));
  v38 = +[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("Bullet-Icon-Dictation"));
  v8 = -[BuddyMultilingualExpressViewController keyboardBackingStore](v42, "keyboardBackingStore");
  v9 = -[NSArray count](v8, "count");

  if (v9)
  {
    v11 = v42;
    v12 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v13 = -[NSBundle localizedStringForKey:value:table:](v12, "localizedStringForKey:value:table:", CFSTR("MULTILINGUAL_KEYBOARDS_EXPRESS_TITLE"), &stru_100284738, CFSTR("Localizable"));
    v14 = v42;
    v15 = -[BuddyMultilingualExpressViewController keyboardBackingStore](v42, "keyboardBackingStore");
    v16 = -[BuddyMultilingualExpressViewController languageListForBackingStore:showDetailText:](v14, "languageListForBackingStore:showDetailText:", v15, 1);
    -[BuddyMultilingualExpressViewController addBulletedListItemWithTitle:description:image:](v11, "addBulletedListItemWithTitle:description:image:", v13, v16, v39);

  }
  else
  {
    oslog = (os_log_t)(id)_BYLoggingFacility(v10);
    v36 = 16;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      v17 = oslog;
      v18 = v36;
      sub_100038C3C(buf);
      _os_log_error_impl((void *)&_mh_execute_header, v17, v18, "BuddyMultilingualExpressViewController keyboardBackingStore count == 0\n", buf, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
  }
  v19 = -[BuddyMultilingualExpressViewController dictationBackingStore](v42, "dictationBackingStore");
  v20 = -[NSArray count](v19, "count");

  if (v20)
  {
    v21 = v42;
    v22 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v23 = -[NSBundle localizedStringForKey:value:table:](v22, "localizedStringForKey:value:table:", CFSTR("MULTILINGUAL_DICTATION_EXPRESS_TITLE"), &stru_100284738, CFSTR("Localizable"));
    v24 = v42;
    v25 = -[BuddyMultilingualExpressViewController dictationBackingStore](v42, "dictationBackingStore");
    v26 = -[BuddyMultilingualExpressViewController languageListForBackingStore:showDetailText:](v24, "languageListForBackingStore:showDetailText:", v25, 0);
    -[BuddyMultilingualExpressViewController addBulletedListItemWithTitle:description:image:](v21, "addBulletedListItemWithTitle:description:image:", v23, v26, v38);

  }
  location = +[OBBoldTrayButton boldButton](OBBoldTrayButton, "boldButton");
  objc_msgSend(location, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v27 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v28 = -[NSBundle localizedStringForKey:value:table:](v27, "localizedStringForKey:value:table:", CFSTR("MULTILINGUAL_EXPRESS_LANGUAGE_ACTIONTEXT"), &stru_100284738, CFSTR("Localizable"));
  objc_msgSend(location, "setTitle:forState:", v28, 0);

  objc_msgSend(location, "addTarget:action:forControlEvents:", v42, "customizeLanguagesButtonPressed", 64);
  v29 = -[BuddyMultilingualExpressViewController buttonTray](v42, "buttonTray");
  objc_msgSend(v29, "addButton:", location);

  v33 = +[OBLinkTrayButton linkButton](OBLinkTrayButton, "linkButton");
  objc_msgSend(v33, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v30 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v31 = -[NSBundle localizedStringForKey:value:table:](v30, "localizedStringForKey:value:table:", CFSTR("SET_UP_LATER_IN_SETTINGS"), &stru_100284738, CFSTR("Localizable"));
  objc_msgSend(v33, "setTitle:forState:", v31, 0);

  objc_msgSend(v33, "addTarget:action:forControlEvents:", v42, "continuePressed", 64);
  v32 = -[BuddyMultilingualExpressViewController buttonTray](v42, "buttonTray");
  objc_msgSend(v32, "addButton:", v33);

  objc_storeStrong(&v33, 0);
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v38, 0);
  objc_storeStrong(&v39, 0);
}

- (void)viewDidAppear:(BOOL)a3
{
  BuddyMultilingualDataModelProviderCollection *v3;
  objc_super v4;
  BOOL v5;
  SEL v6;
  BuddyMultilingualExpressViewController *v7;

  v7 = self;
  v6 = a2;
  v5 = a3;
  v4.receiver = self;
  v4.super_class = (Class)BuddyMultilingualExpressViewController;
  -[BuddyMultilingualExpressViewController viewDidAppear:](&v4, "viewDidAppear:", a3);
  v3 = -[BuddyMultilingualExpressViewController providerCollection](v7, "providerCollection");
  -[BuddyMultilingualDataModelProviderCollection setExpressFlowDidCustomize:](v3, "setExpressFlowDidCustomize:", 0);

}

- (id)languageListForBackingStore:(id)a3 showDetailText:(BOOL)a4
{
  id v5;
  id v6;
  void **v8;
  int v9;
  int v10;
  void (*v11)(uint64_t, void *, _BYTE *);
  void *v12;
  id v13;
  id v14;
  BOOL v15;
  id v16;
  BOOL v17;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v17 = a4;
  v16 = +[NSMutableString string](NSMutableString, "string");
  v5 = location[0];
  v8 = _NSConcreteStackBlock;
  v9 = -1073741824;
  v10 = 0;
  v11 = sub_100160C84;
  v12 = &unk_1002839F8;
  v15 = v17;
  v13 = v16;
  v14 = location[0];
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", &v8);
  v6 = v16;
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
  return v6;
}

- (void)continuePressed
{
  NSArray *v2;
  NSArray *v3;
  NSArray *v4;
  NSArray *v5;
  NSArray *v6;
  BYAnalyticsManager *v7;
  BFFFlowItemDelegate *v8;
  _QWORD v10[2];

  v2 = -[BuddyMultilingualExpressViewController keyboardBackingStore](self, "keyboardBackingStore");
  +[BuddyKeyboardLanguageOrderSelector writePreferredKeyboardLanguagesToSystem:](BuddyKeyboardLanguageOrderSelector, "writePreferredKeyboardLanguagesToSystem:", v2);

  v3 = -[BuddyMultilingualExpressViewController dictationBackingStore](self, "dictationBackingStore");
  +[BuddyDictationLanguageOrderSelector writePreferredDictationLanguagesToSystem:](BuddyDictationLanguageOrderSelector, "writePreferredDictationLanguagesToSystem:", v3);

  v4 = -[BuddyMultilingualExpressViewController keyboardBackingStore](self, "keyboardBackingStore");
  v10[0] = v4;
  v5 = -[BuddyMultilingualExpressViewController dictationBackingStore](self, "dictationBackingStore");
  v10[1] = v5;
  v6 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v10, 2);
  v7 = -[BuddyMultilingualExpressViewController analyticsManager](self, "analyticsManager");
  +[BYMultilingualAnalyticsEvent recordExpressPaneShownUserCustomized:withData:analyticsManager:](BYMultilingualAnalyticsEvent, "recordExpressPaneShownUserCustomized:withData:analyticsManager:", 0, v6, v7);

  v8 = -[BuddyWelcomeController delegate](self, "delegate");
  -[BFFFlowItemDelegate flowItemDone:](v8, "flowItemDone:", self);

}

- (void)customizeLanguagesButtonPressed
{
  BuddyMultilingualDataModelProviderCollection *v2;
  NSArray *v3;
  NSArray *v4;
  NSArray *v5;
  BYAnalyticsManager *v6;
  BFFFlowItemDelegate *v7;
  _QWORD v9[2];

  v2 = -[BuddyMultilingualExpressViewController providerCollection](self, "providerCollection");
  -[BuddyMultilingualDataModelProviderCollection setExpressFlowDidCustomize:](v2, "setExpressFlowDidCustomize:", 1);

  v3 = -[BuddyMultilingualExpressViewController keyboardBackingStore](self, "keyboardBackingStore");
  v9[0] = v3;
  v4 = -[BuddyMultilingualExpressViewController dictationBackingStore](self, "dictationBackingStore");
  v9[1] = v4;
  v5 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v9, 2);
  v6 = -[BuddyMultilingualExpressViewController analyticsManager](self, "analyticsManager");
  +[BYMultilingualAnalyticsEvent recordExpressPaneShownUserCustomized:withData:analyticsManager:](BYMultilingualAnalyticsEvent, "recordExpressPaneShownUserCustomized:withData:analyticsManager:", 1, v5, v6);

  v7 = -[BuddyWelcomeController delegate](self, "delegate");
  -[BFFFlowItemDelegate flowItemDone:nextItemClass:](v7, "flowItemDone:nextItemClass:", self, 0);

}

- (BuddyMultilingualDataModelProviderCollection)providerCollection
{
  return self->_providerCollection;
}

- (void)setProviderCollection:(id)a3
{
  objc_storeStrong((id *)&self->_providerCollection, a3);
}

- (BYAnalyticsManager)analyticsManager
{
  return self->_analyticsManager;
}

- (void)setAnalyticsManager:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsManager, a3);
}

- (NSArray)keyboardBackingStore
{
  return self->_keyboardBackingStore;
}

- (void)setKeyboardBackingStore:(id)a3
{
  objc_storeStrong((id *)&self->_keyboardBackingStore, a3);
}

- (NSArray)dictationBackingStore
{
  return self->_dictationBackingStore;
}

- (void)setDictationBackingStore:(id)a3
{
  objc_storeStrong((id *)&self->_dictationBackingStore, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictationBackingStore, 0);
  objc_storeStrong((id *)&self->_keyboardBackingStore, 0);
  objc_storeStrong((id *)&self->_analyticsManager, 0);
  objc_storeStrong((id *)&self->_providerCollection, 0);
}

@end
