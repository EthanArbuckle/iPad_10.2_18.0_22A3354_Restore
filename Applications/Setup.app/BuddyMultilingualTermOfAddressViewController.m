@implementation BuddyMultilingualTermOfAddressViewController

- (BuddyMultilingualTermOfAddressViewController)init
{
  NSBundle *v2;
  NSBundle *v3;
  id v4;
  id v5;
  BuddyMultilingualTermOfAddressViewController *v6;
  objc_super v8;
  id location;
  id v10[2];
  id v11;

  v11 = self;
  v10[1] = (id)a2;
  v2 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v10[0] = -[NSBundle localizedStringForKey:value:table:](v2, "localizedStringForKey:value:table:", CFSTR("MULTILINGUAL_TERM_OF_ADDRESS_TITLE"), &stru_100284738, CFSTR("Localizable"));

  v3 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v4 = +[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", CFSTR("MULTILINGUAL_TERM_OF_ADDRESS_DETAIL_TEXT"));
  location = -[NSBundle localizedStringForKey:value:table:](v3, "localizedStringForKey:value:table:", v4, &stru_100284738, CFSTR("Localizable"));

  v5 = v11;
  v11 = 0;
  v8.receiver = v5;
  v8.super_class = (Class)BuddyMultilingualTermOfAddressViewController;
  v11 = -[BuddyMultilingualTermOfAddressViewController initWithTitle:detailText:symbolName:adoptTableViewScrollView:](&v8, "initWithTitle:detailText:symbolName:adoptTableViewScrollView:", v10[0], location, 0, 1);
  v6 = (BuddyMultilingualTermOfAddressViewController *)v11;
  objc_storeStrong(&location, 0);
  objc_storeStrong(v10, 0);
  objc_storeStrong(&v11, 0);
  return v6;
}

- (void)viewDidLoad
{
  id v2;
  id v3;
  id v4;
  id v5;
  BuddyMultilingualTermOfAddressViewController *v6;
  id v7;
  BuddyMultilingualTermOfAddressViewController *v8;
  id v9;
  id v10;
  id v11;
  UIColor *v12;
  id v13;
  id v14;
  OBTrayButton *v15;
  OBTrayButton *v16;
  NSBundle *v17;
  OBTrayButton *v18;
  id v19;
  OBTrayButton *v20;
  id location;
  objc_super v22;
  SEL v23;
  BuddyMultilingualTermOfAddressViewController *v24;

  v24 = self;
  v23 = a2;
  v22.receiver = self;
  v22.super_class = (Class)BuddyMultilingualTermOfAddressViewController;
  -[BuddyMultilingualTermOfAddressViewController viewDidLoad](&v22, "viewDidLoad");
  v2 = +[_NSAttributedStringGrammarInflection presetInflections](_NSAttributedStringGrammarInflection, "presetInflections");
  -[BuddyMultilingualTermOfAddressViewController setGenderBackingStore:](v24, "setGenderBackingStore:", v2);

  v3 = -[BuddyMultilingualTermOfAddressViewController buddy_animationController:](v24, "buddy_animationController:", CFSTR("Language"));
  -[BuddyMultilingualTermOfAddressViewController setAnimationController:](v24, "setAnimationController:", v3);

  v4 = objc_msgSend(objc_alloc((Class)UITableView), "initWithFrame:style:", 2, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  -[BuddyMultilingualTermOfAddressViewController setTableView:](v24, "setTableView:", v4);

  v5 = -[BuddyMultilingualTermOfAddressViewController tableView](v24, "tableView");
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v6 = v24;
  v7 = -[BuddyMultilingualTermOfAddressViewController tableView](v24, "tableView");
  objc_msgSend(v7, "setDelegate:", v6);

  v8 = v24;
  v9 = -[BuddyMultilingualTermOfAddressViewController tableView](v24, "tableView");
  objc_msgSend(v9, "setDataSource:", v8);

  v10 = -[BuddyMultilingualTermOfAddressViewController tableView](v24, "tableView");
  objc_msgSend(v10, "setRowHeight:", UITableViewAutomaticDimension);

  v11 = -[BuddyMultilingualTermOfAddressViewController tableView](v24, "tableView");
  objc_msgSend(v11, "setEstimatedRowHeight:", 0.0);

  v12 = +[UIColor clearColor](UIColor, "clearColor");
  v13 = -[BuddyMultilingualTermOfAddressViewController tableView](v24, "tableView");
  objc_msgSend(v13, "setBackgroundColor:", v12);

  v14 = +[OBLinkTrayButton linkButton](OBLinkTrayButton, "linkButton");
  -[BuddyMultilingualTermOfAddressViewController setSkipButton:](v24, "setSkipButton:", v14);

  v15 = -[BuddyMultilingualTermOfAddressViewController skipButton](v24, "skipButton");
  -[OBTrayButton setTranslatesAutoresizingMaskIntoConstraints:](v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v16 = -[BuddyMultilingualTermOfAddressViewController skipButton](v24, "skipButton");
  -[OBTrayButton addTarget:action:forControlEvents:](v16, "addTarget:action:forControlEvents:", v24, "_selectionSkipped:", 64);

  v17 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  location = -[NSBundle localizedStringForKey:value:table:](v17, "localizedStringForKey:value:table:", CFSTR("SET_UP_LATER_IN_SETTINGS"), &stru_100284738, CFSTR("Localizable"));

  v18 = -[BuddyMultilingualTermOfAddressViewController skipButton](v24, "skipButton");
  -[OBTrayButton setTitle:forState:](v18, "setTitle:forState:", location, 0);

  v19 = -[BuddyMultilingualTermOfAddressViewController buttonTray](v24, "buttonTray");
  v20 = -[BuddyMultilingualTermOfAddressViewController skipButton](v24, "skipButton");
  objc_msgSend(v19, "addButton:", v20);

  objc_storeStrong(&location, 0);
}

- (void)viewWillAppear:(BOOL)a3
{
  OBAnimationController *v3;
  objc_super v4;
  BOOL v5;
  SEL v6;
  BuddyMultilingualTermOfAddressViewController *v7;

  v7 = self;
  v6 = a2;
  v5 = a3;
  v4.receiver = self;
  v4.super_class = (Class)BuddyMultilingualTermOfAddressViewController;
  -[BuddyMultilingualTermOfAddressViewController viewWillAppear:](&v4, "viewWillAppear:", a3);
  v3 = -[BuddyMultilingualTermOfAddressViewController animationController](v7, "animationController");
  -[OBAnimationController startAnimation](v3, "startAnimation");

}

- (void)_selectionSkipped:(id)a3
{
  id v3;
  BFFFlowItemDelegate *v4;
  id v5;
  id location[2];
  BuddyMultilingualTermOfAddressViewController *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = objc_alloc_init((Class)_NSAttributedStringGrammarInflection);
  objc_msgSend(v3, "_setAsGlobalUserInflection", v3);
  v4 = -[BuddyMultilingualTermOfAddressViewController delegate](v7, "delegate");
  -[BFFFlowItemDelegate flowItemDone:](v4, "flowItemDone:", v7);

  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  NSArray *v5;
  id v6;
  BFFFlowItemDelegate *v7;
  id v8;
  id location[2];
  BuddyMultilingualTermOfAddressViewController *v10;

  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v8 = 0;
  objc_storeStrong(&v8, a4);
  objc_msgSend(location[0], "deselectRowAtIndexPath:animated:", v8, 1);
  v5 = -[BuddyMultilingualTermOfAddressViewController genderBackingStore](v10, "genderBackingStore");
  v6 = -[NSArray objectAtIndexedSubscript:](v5, "objectAtIndexedSubscript:", objc_msgSend(v8, "row"));
  objc_msgSend(v6, "_setAsGlobalUserInflection");

  v7 = -[BuddyMultilingualTermOfAddressViewController delegate](v10, "delegate");
  -[BFFFlowItemDelegate flowItemDone:](v7, "flowItemDone:", v10);

  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  NSArray *v5;
  NSUInteger v6;
  id location[2];
  BuddyMultilingualTermOfAddressViewController *v9;

  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = -[BuddyMultilingualTermOfAddressViewController genderBackingStore](v9, "genderBackingStore", a4);
  v6 = -[NSArray count](v5, "count");

  objc_storeStrong(location, 0);
  return v6;
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

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  NSArray *v5;
  id v6;
  id v7;
  UIColor *v8;
  NSBundle *v9;
  id v10;
  NSString *v11;
  id v12;
  id v13;
  id v15;
  id v16;
  id v17;
  id v18;
  id location[2];
  BuddyMultilingualTermOfAddressViewController *v20;

  v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v18 = 0;
  objc_storeStrong(&v18, a4);
  v17 = objc_msgSend(location[0], "dequeueReusableCellWithIdentifier:", CFSTR("com.apple.setupassistant.ios.termofaddress"));
  v5 = -[BuddyMultilingualTermOfAddressViewController genderBackingStore](v20, "genderBackingStore");
  v16 = -[NSArray objectAtIndexedSubscript:](v5, "objectAtIndexedSubscript:", objc_msgSend(v18, "row"));

  if (!v17)
  {
    v17 = objc_msgSend(objc_alloc((Class)UITableViewCell), "initWithStyle:reuseIdentifier:", 3, CFSTR("com.apple.setupassistant.ios.termofaddress"));

  }
  v6 = objc_msgSend(v16, "localizedShortDescription");
  v7 = objc_msgSend(v17, "textLabel");
  objc_msgSend(v7, "setText:", v6);

  objc_msgSend(v17, "setAccessoryType:", 1);
  v8 = +[UIColor secondarySystemBackgroundColor](UIColor, "secondarySystemBackgroundColor");
  objc_msgSend(v17, "setBackgroundColor:", v8);

  v15 = 0;
  switch((unint64_t)objc_msgSend(v16, "gender"))
  {
    case 1uLL:
      objc_storeStrong(&v15, CFSTR("MULTILINGUAL_TERM_OF_ADDRESS_EXEMPLAR_PHRASE_MASCULINE"));
      break;
    case 2uLL:
      objc_storeStrong(&v15, CFSTR("MULTILINGUAL_TERM_OF_ADDRESS_EXEMPLAR_PHRASE_FEMININE"));
      break;
    case 3uLL:
      objc_storeStrong(&v15, CFSTR("MULTILINGUAL_TERM_OF_ADDRESS_EXEMPLAR_PHRASE_NEUTER"));
      break;
    default:
      break;
  }
  v9 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v10 = +[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", v15);
  v11 = -[NSBundle localizedStringForKey:value:table:](v9, "localizedStringForKey:value:table:", v10, &stru_100284738, CFSTR("Localizable"));
  v12 = objc_msgSend(v17, "detailTextLabel");
  objc_msgSend(v12, "setText:", v11);

  v13 = v17;
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(location, 0);
  return v13;
}

+ (BOOL)controllerAffectedByTapFreeSetup
{
  return 1;
}

+ (BOOL)controllerNeedsToRun
{
  unsigned __int8 v2;
  char v3;

  v2 = +[_NSAttributedStringGrammarInflection canSelectUserInflection](_NSAttributedStringGrammarInflection, "canSelectUserInflection", a2, a1);
  v3 = 0;
  if ((v2 & 1) != 0)
    v3 = +[DMCMultiUserModeUtilities shouldSkipLanguageAndLocaleSetupForNewUsers](DMCMultiUserModeUtilities, "shouldSkipLanguageAndLocaleSetupForNewUsers") ^ 1;
  return v3 & 1;
}

+ (unint64_t)applicableDispositions
{
  return 14;
}

+ (id)cloudConfigSkipKey
{
  return kMCCCSkipSetupTermsOfAddress;
}

- (BFFFlowItemDelegate)delegate
{
  return (BFFFlowItemDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BYAnalyticsManager)analyticsManager
{
  return self->_analyticsManager;
}

- (void)setAnalyticsManager:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsManager, a3);
}

- (OBAnimationController)animationController
{
  return self->_animationController;
}

- (void)setAnimationController:(id)a3
{
  objc_storeStrong((id *)&self->_animationController, a3);
}

- (OBTrayButton)skipButton
{
  return self->_skipButton;
}

- (void)setSkipButton:(id)a3
{
  objc_storeStrong((id *)&self->_skipButton, a3);
}

- (NSArray)genderBackingStore
{
  return self->_genderBackingStore;
}

- (void)setGenderBackingStore:(id)a3
{
  objc_storeStrong((id *)&self->_genderBackingStore, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_genderBackingStore, 0);
  objc_storeStrong((id *)&self->_skipButton, 0);
  objc_storeStrong((id *)&self->_animationController, 0);
  objc_storeStrong((id *)&self->_analyticsManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
