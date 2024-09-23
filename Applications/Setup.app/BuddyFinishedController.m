@implementation BuddyFinishedController

- (BuddyFinishedController)init
{
  NSBundle *v3;
  id v4;
  NSString *v5;
  BuddyFinishedController *v6;
  id location;

  v3 = +[NSBundle mainBundle](NSBundle, "mainBundle", a2, self);
  v4 = +[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", CFSTR("WELCOME_TO"));
  v5 = -[NSBundle localizedStringForKey:value:table:](v3, "localizedStringForKey:value:table:", v4, &stru_100284738, CFSTR("Localizable"));
  location = -[BuddyFinishedController initWithTitle:](self, "initWithTitle:", v5);
  v6 = (BuddyFinishedController *)location;

  objc_storeStrong(&location, 0);
  return v6;
}

- (void)loadView
{
  id v2;
  objc_super v3;
  SEL v4;
  BuddyFinishedController *v5;

  v5 = self;
  v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)BuddyFinishedController;
  -[BuddyFinishedController loadView](&v3, "loadView");
  v2 = -[BuddyFinishedController navigationItem](v5, "navigationItem");
  objc_msgSend(v2, "setHidesBackButton:", 1);

  -[BuddyFinishedController _prepareContentView](v5, "_prepareContentView");
}

- (void)viewDidLoad
{
  BuddyFinishedController *v2;
  NSBundle *v3;
  NSString *v4;
  BuddyFinishedController *v5;
  NSBundle *v6;
  NSString *v7;
  id v8;
  MTLumaDodgePillView *v9;
  id v10;
  MTLumaDodgePillView *v11;
  SASWelcomeToDeviceViewControllerProvider *v12;
  unsigned __int8 v13;
  UIColor *v14;
  id v15;
  void **v16;
  int v17;
  int v18;
  void (*v19)(id *);
  void *v20;
  id v21;
  id location;
  objc_super v23;
  SEL v24;
  BuddyFinishedController *v25;

  v25 = self;
  v24 = a2;
  v23.receiver = self;
  v23.super_class = (Class)BuddyFinishedController;
  -[BuddyFinishedController viewDidLoad](&v23, "viewDidLoad");
  if (-[BuddyFinishedController _shouldShowGetStartedButton](v25, "_shouldShowGetStartedButton"))
  {
    objc_initWeak(&location, v25);
    v2 = v25;
    v3 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v4 = -[NSBundle localizedStringForKey:value:table:](v3, "localizedStringForKey:value:table:", CFSTR("GET_STARTED"), &stru_100284738, CFSTR("Localizable"));
    v16 = _NSConcreteStackBlock;
    v17 = -1073741824;
    v18 = 0;
    v19 = sub_100033680;
    v20 = &unk_1002806B8;
    objc_copyWeak(&v21, &location);
    -[BuddyFinishedController setButtonTitle:action:](v2, "setButtonTitle:action:", v4, &v16);

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
  else
  {
    v5 = v25;
    v6 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v7 = -[NSBundle localizedStringForKey:value:table:](v6, "localizedStringForKey:value:table:", CFSTR("GET_STARTED_IPHONE_X"), &stru_100284738, CFSTR("Localizable"));
    -[BuddyFinishedController setInstructionalText:](v5, "setInstructionalText:", v7);

  }
  if (-[BuddyFinishedController drawHomeAffordance](v25, "drawHomeAffordance"))
  {
    v8 = objc_msgSend(objc_alloc((Class)MTLumaDodgePillView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    -[BuddyFinishedController setHomeAffordanceView:](v25, "setHomeAffordanceView:", v8);

    v9 = -[BuddyFinishedController homeAffordanceView](v25, "homeAffordanceView");
    -[MTLumaDodgePillView setStyle:](v9, "setStyle:", 3);

    v10 = -[BuddyFinishedController view](v25, "view");
    v11 = -[BuddyFinishedController homeAffordanceView](v25, "homeAffordanceView");
    objc_msgSend(v10, "addSubview:", v11);

  }
  v12 = -[BuddyFinishedController welcomeGradientViewProvider](v25, "welcomeGradientViewProvider");
  v13 = 0;
  if (v12)
    v13 = -[BuddyFinishedController _welcomeGradientShouldAdjustBuddyColor](v25, "_welcomeGradientShouldAdjustBuddyColor");

  if ((v13 & 1) != 0)
  {
    v14 = +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.93, 0.93, 0.93, 1.0);
    v15 = -[BuddyFinishedController view](v25, "view");
    objc_msgSend(v15, "setBackgroundColor:", v14);

  }
}

- (void)viewDidLayoutSubviews
{
  MTLumaDodgePillView *v2;
  id v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  MTLumaDodgePillView *v8;
  id v9;
  double v10;
  MTLumaDodgePillView *v11;
  MTLumaDodgePillView *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  MTLumaDodgePillView *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  MTLumaDodgePillView *v22;
  double v23;
  double v24;
  MTLumaDodgePillView *v25;
  double v26;
  double v27;
  CGRect v28;
  objc_super v29;
  SEL v30;
  BuddyFinishedController *v31;

  v31 = self;
  v30 = a2;
  v29.receiver = self;
  v29.super_class = (Class)BuddyFinishedController;
  -[BuddyFinishedController viewDidLayoutSubviews](&v29, "viewDidLayoutSubviews");
  v2 = -[BuddyFinishedController homeAffordanceView](v31, "homeAffordanceView");

  if (v2)
  {
    v3 = -[BuddyFinishedController view](v31, "view");
    objc_msgSend(v3, "bounds");
    v28.origin.y = v4;
    v28.origin.x = v5;
    v28.size.height = v6;
    v28.size.width = v7;

    v8 = -[BuddyFinishedController homeAffordanceView](v31, "homeAffordanceView");
    v9 = -[BuddyFinishedController view](v31, "view");
    objc_msgSend(v9, "bounds");
    -[MTLumaDodgePillView suggestedSizeForContentWidth:](v8, "suggestedSizeForContentWidth:", v10);

    v11 = -[BuddyFinishedController homeAffordanceView](v31, "homeAffordanceView");
    -[MTLumaDodgePillView setFrame:](v11, "setFrame:", *(_OWORD *)&v28.origin, *(_OWORD *)&v28.size);

    v12 = -[BuddyFinishedController homeAffordanceView](v31, "homeAffordanceView");
    v13 = sub_100033958();
    -[MTLumaDodgePillView setBounds:](v12, "setBounds:", v13, v14, v15, v16);

    CGRectGetMidX(v28);
    CGRectGetHeight(v28);
    v17 = -[BuddyFinishedController homeAffordanceView](v31, "homeAffordanceView");
    -[MTLumaDodgePillView bounds](v17, "bounds");
    v22 = -[BuddyFinishedController homeAffordanceView](v31, "homeAffordanceView", v18, v19, v20, v21, 0, 0);
    -[MTLumaDodgePillView suggestedEdgeSpacing](v22, "suggestedEdgeSpacing");
    sub_1000339B0();
    v26 = v23;
    v27 = v24;

    v25 = -[BuddyFinishedController homeAffordanceView](v31, "homeAffordanceView");
    -[MTLumaDodgePillView setCenter:](v25, "setCenter:", v26, v27);

  }
}

- (id)contentView
{
  BuddyFinishedCursiveChildWelcomeView *v2;
  SASWelcomeToDeviceViewControllerProvider *v3;
  SASWelcomeToDeviceViewControllerProvider *v4;
  id v5;
  BuddyFinishedCursiveChildWelcomeView *v8;

  v2 = -[BuddyFinishedController cursiveWelcomeView](self, "cursiveWelcomeView");

  if (v2)
  {
    v8 = -[BuddyFinishedController cursiveWelcomeView](self, "cursiveWelcomeView");
  }
  else
  {
    v3 = -[BuddyFinishedController welcomeGradientViewProvider](self, "welcomeGradientViewProvider");

    if (v3)
    {
      v4 = -[BuddyFinishedController welcomeGradientViewProvider](self, "welcomeGradientViewProvider");
      v5 = -[SASWelcomeToDeviceViewControllerProvider viewController](v4, "viewController");
      v8 = (BuddyFinishedCursiveChildWelcomeView *)objc_msgSend(v5, "view");

    }
    else
    {
      v8 = 0;
    }
  }
  return v8;
}

- (void)viewDidAppear:(BOOL)a3
{
  BuddyFinishedCursiveChildWelcomeView *v3;
  SASWelcomeToDeviceViewControllerProvider *v4;
  NSBundle *v5;
  id v6;
  NSString *v7;
  BuddyFinishedCursiveChildWelcomeView *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  unint64_t i;
  id v15;
  NSBundle *v16;
  NSString *v17;
  id v18;
  NSBundle *v19;
  NSString *v20;
  id v21;
  NSBundle *v22;
  NSString *v23;
  UIAlertAction *v24;
  id location;
  id v26;
  id v27;
  _QWORD __b[8];
  id v29;
  id v30;
  id v31;
  objc_super v32;
  BOOL v33;
  SEL v34;
  BuddyFinishedController *v35;
  _BYTE v36[128];

  v35 = self;
  v34 = a2;
  v33 = a3;
  v32.receiver = self;
  v32.super_class = (Class)BuddyFinishedController;
  -[BuddyFinishedController viewDidAppear:](&v32, "viewDidAppear:", a3);
  v3 = -[BuddyFinishedController cursiveWelcomeView](v35, "cursiveWelcomeView");
  -[BuddyFinishedCursiveChildWelcomeView startAnimation](v3, "startAnimation");

  v4 = -[BuddyFinishedController welcomeGradientViewProvider](v35, "welcomeGradientViewProvider");
  -[SASWelcomeToDeviceViewControllerProvider startAnimation](v4, "startAnimation");

  v5 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v6 = +[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", CFSTR("WELCOME_TO"));
  v7 = -[NSBundle localizedStringForKey:value:table:](v5, "localizedStringForKey:value:table:", v6, &stru_100284738, CFSTR("Localizable"));
  v8 = -[BuddyFinishedController cursiveWelcomeView](v35, "cursiveWelcomeView");
  -[BuddyFinishedCursiveChildWelcomeView setAccessibilityLabel:](v8, "setAccessibilityLabel:", v7);

  v9 = +[ACAccountStore defaultStore](ACAccountStore, "defaultStore");
  v31 = objc_msgSend(v9, "aa_primaryAppleAccount");

  if (v31)
  {
    v10 = +[ACAccountStore defaultStore](ACAccountStore, "defaultStore");
    v30 = objc_msgSend(v10, "aa_accountsEnabledForDataclass:", kAccountDataclassDeviceLocator);

    memset(__b, 0, sizeof(__b));
    v11 = v30;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", __b, v36, 16);
    if (v12)
    {
      v13 = *(_QWORD *)__b[2];
      do
      {
        for (i = 0; i < (unint64_t)v12; ++i)
        {
          if (*(_QWORD *)__b[2] != v13)
            objc_enumerationMutation(v11);
          v29 = *(id *)(__b[1] + 8 * i);
          if ((objc_msgSend(v29, "aa_isAccountClass:", AAAccountClassPrimary) & 1) == 0)
          {
            objc_msgSend(v29, "setEnabled:forDataclass:", 0, kAccountDataclassDeviceLocator);
            v15 = +[ACAccountStore defaultStore](ACAccountStore, "defaultStore");
            objc_msgSend(v15, "saveAccount:withCompletionHandler:", v29, 0);

            v16 = +[NSBundle mainBundle](NSBundle, "mainBundle");
            v17 = -[NSBundle localizedStringForKey:value:table:](v16, "localizedStringForKey:value:table:", CFSTR("FMIP_ACCOUNT_DISABLE_TITLE"), &stru_100284738, CFSTR("Localizable"));
            v18 = objc_msgSend(v29, "aa_primaryEmail");
            v27 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v17, v18);

            v19 = +[NSBundle mainBundle](NSBundle, "mainBundle");
            v20 = -[NSBundle localizedStringForKey:value:table:](v19, "localizedStringForKey:value:table:", CFSTR("FMIP_ACCOUNT_DISABLE_MESSAGE"), &stru_100284738, CFSTR("Localizable"));
            v21 = objc_msgSend(v31, "aa_primaryEmail");
            v26 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v20, v21);

            location = +[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v27, v26, 1);
            v22 = +[NSBundle mainBundle](NSBundle, "mainBundle");
            v23 = -[NSBundle localizedStringForKey:value:table:](v22, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_100284738, CFSTR("Localizable"));
            v24 = +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v23, 0, 0);
            objc_msgSend(location, "addAction:", v24);

            -[BuddyFinishedController presentViewController:animated:completion:](v35, "presentViewController:animated:completion:", location, 1, 0);
            objc_storeStrong(&location, 0);
            objc_storeStrong(&v26, 0);
            objc_storeStrong(&v27, 0);
            goto LABEL_11;
          }
        }
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", __b, v36, 16);
      }
      while (v12);
    }
LABEL_11:

    objc_storeStrong(&v30, 0);
  }
  objc_storeStrong(&v31, 0);
}

+ (BOOL)controllerNeedsToRun
{
  return (+[DMCMultiUserModeUtilities inSharediPadUserSession](DMCMultiUserModeUtilities, "inSharediPadUserSession", a2, a1) ^ 1) & 1;
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  unsigned __int8 v3;
  char v4;
  BuddyFinishedController *v5;
  void **v6;
  int v7;
  int v8;
  uint64_t (*v9);
  void *v10;
  BuddyFinishedController *v11;
  id v12;
  char v13;
  id location[2];
  BuddyFinishedController *v15;

  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v13 = 0;
  v3 = +[DMCMultiUserModeUtilities inSharediPadUserSession](DMCMultiUserModeUtilities, "inSharediPadUserSession");
  v4 = 1;
  if ((v3 & 1) != 0)
    v4 = +[DMCMultiUserModeUtilities awaitUserConfigurationEnabled](DMCMultiUserModeUtilities, "awaitUserConfigurationEnabled") ^ 1;
  v13 = v4 & 1;
  if ((v4 & 1) != 0)
  {
    v5 = v15;
    v6 = _NSConcreteStackBlock;
    v7 = -1073741824;
    v8 = 0;
    v9 = sub_1000341C4;
    v10 = &unk_1002806E0;
    v11 = v15;
    v12 = location[0];
    -[BuddyFinishedController _determineStyleWithCompletion:](v5, "_determineStyleWithCompletion:", &v6);
    objc_storeStrong(&v12, 0);
    objc_storeStrong((id *)&v11, 0);
  }
  else
  {
    (*((void (**)(id, _QWORD))location[0] + 2))(location[0], 0);
  }
  objc_storeStrong(location, 0);
}

+ (id)cloudConfigSkipKey
{
  return kMCCCSkipSetupWelcome;
}

+ (unint64_t)applicableDispositions
{
  return 28;
}

- (BOOL)isEphemeral
{
  return 1;
}

- (unint64_t)allowedTerminationSources
{
  BuddySuspendTask *v2;
  NSURL *v3;
  unsigned __int8 v4;
  char v6;
  BYPreferencesController *v7;

  v2 = -[BuddyFinishedController suspendTask](self, "suspendTask");
  v3 = -[BuddySuspendTask launchURL](v2, "launchURL");
  v6 = 0;
  v4 = 0;
  if (v3)
  {
    v7 = -[BuddyFinishedController buddyPreferencesExcludedFromBackup](self, "buddyPreferencesExcludedFromBackup");
    v6 = 1;
    v4 = +[BuddySuspendTask hasSuspendTaskWithBuddyPreferencesExcludedFromBackup:](BuddySuspendTask, "hasSuspendTaskWithBuddyPreferencesExcludedFromBackup:");
  }
  if ((v6 & 1) != 0)

  if ((v4 & 1) != 0)
    return 0;
  else
    return 3;
}

- (void)_determineStyleWithCompletion:(id)a3
{
  BuddyFinishedController *v3;
  void **v4;
  int v5;
  int v6;
  uint64_t (*v7)(uint64_t, char);
  void *v8;
  BuddyFinishedController *v9;
  id v10;
  id location[2];
  BuddyFinishedController *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (-[BuddyFinishedController _shouldShowCursiveAnimation](v12, "_shouldShowCursiveAnimation"))
  {
    -[BuddyFinishedController setStyle:](v12, "setStyle:", 1);
    (*((void (**)(void))location[0] + 2))();
  }
  else
  {
    v3 = v12;
    v4 = _NSConcreteStackBlock;
    v5 = -1073741824;
    v6 = 0;
    v7 = sub_1000344F4;
    v8 = &unk_100280708;
    v9 = v12;
    v10 = location[0];
    -[BuddyFinishedController _shouldShowIntelligenceAnimationWithCompletion:](v3, "_shouldShowIntelligenceAnimationWithCompletion:", &v4);
    objc_storeStrong(&v10, 0);
    objc_storeStrong((id *)&v9, 0);
  }
  objc_storeStrong(location, 0);
}

- (void)_prepareContentView
{
  int64_t v2;
  BuddyFinishedCursiveChildWelcomeView *v3;
  BuddyFinishedCursiveChildWelcomeView *v4;
  id v5;
  NSBundle *v6;
  id v7;
  NSString *v8;
  UIColor *v9;
  id v10;
  SASWelcomeToDeviceViewControllerProvider *v11;
  id v12;
  id v13;
  UIColor *v14;
  SASWelcomeToDeviceViewControllerProvider *v15;
  id v16;
  id v17;

  v2 = -[BuddyFinishedController style](self, "style", a2);
  if (v2)
  {
    if (v2 == 1)
    {
      v3 = -[BuddyFinishedCursiveChildWelcomeView initWithFrame:]([BuddyFinishedCursiveChildWelcomeView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
      -[BuddyFinishedController setCursiveWelcomeView:](self, "setCursiveWelcomeView:", v3);

      v4 = -[BuddyFinishedController cursiveWelcomeView](self, "cursiveWelcomeView");
      -[BuddyFinishedCursiveChildWelcomeView setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    }
    else if (v2 == 2)
    {
      v5 = objc_alloc((Class)SASWelcomeToDeviceViewControllerProvider);
      v6 = +[NSBundle mainBundle](NSBundle, "mainBundle");
      v7 = +[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", CFSTR("WELCOME_TO"));
      v8 = -[NSBundle localizedStringForKey:value:table:](v6, "localizedStringForKey:value:table:", v7, &stru_100284738, CFSTR("Localizable"));
      v9 = +[UIColor labelColor](UIColor, "labelColor");
      v10 = objc_msgSend(v5, "initWithText:finalTextColor:onAnimationCompleteHandler:", v8, v9, 0);
      -[BuddyFinishedController setWelcomeGradientViewProvider:](self, "setWelcomeGradientViewProvider:", v10);

      v11 = -[BuddyFinishedController welcomeGradientViewProvider](self, "welcomeGradientViewProvider");
      v12 = -[SASWelcomeToDeviceViewControllerProvider viewController](v11, "viewController");
      v13 = objc_msgSend(v12, "view");
      objc_msgSend(v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

      v14 = +[UIColor clearColor](UIColor, "clearColor");
      v15 = -[BuddyFinishedController welcomeGradientViewProvider](self, "welcomeGradientViewProvider");
      v16 = -[SASWelcomeToDeviceViewControllerProvider viewController](v15, "viewController");
      v17 = objc_msgSend(v16, "view");
      objc_msgSend(v17, "setBackgroundColor:", v14);

    }
  }
}

- (BOOL)_welcomeGradientShouldAdjustBuddyColor
{
  UIScreen *v2;
  double v3;
  BOOL v4;
  id v5;
  BOOL v6;
  BOOL v7;
  BOOL v9;

  v2 = +[UIScreen mainScreen](UIScreen, "mainScreen");
  -[UIScreen potentialEDRHeadroom](v2, "potentialEDRHeadroom");
  v4 = v3 > 2.0;

  v9 = v4;
  v5 = -[BuddyFinishedController traitCollection](self, "traitCollection");
  v6 = objc_msgSend(v5, "userInterfaceStyle") == (id)2;

  v7 = 0;
  if (!v6)
    return !v9;
  return v7;
}

- (BOOL)_shouldShowCursiveAnimation
{
  BuddyFlowItemDispositionProvider *v2;
  BOOL v3;

  v2 = -[BuddyFinishedController flowItemDispositionProvider](self, "flowItemDispositionProvider", a2, self);
  v3 = (-[BuddyFlowItemDispositionProvider dispositions](v2, "dispositions") & 0x10) == 16;

  return v3;
}

- (void)_shouldShowIntelligenceAnimationWithCompletion:(id)a3
{
  _TtP5Setup20IntelligenceProvider_ *v3;
  id location[2];
  BuddyFinishedController *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyFinishedController intelligenceProvider](v5, "intelligenceProvider");
  -[IntelligenceProvider isIntelligenceEnabledWithCompletionHandler:](v3, "isIntelligenceEnabledWithCompletionHandler:", location[0]);

  objc_storeStrong(location, 0);
}

- (BOOL)_shouldShowGetStartedButton
{
  BYDeviceProvider *v2;
  unsigned __int8 v3;
  BOOL v4;
  char v6;
  BYDeviceProvider *v7;
  BOOL v9;

  v2 = -[BuddyFinishedController deviceProvider](self, "deviceProvider");
  v3 = -[BYDeviceProvider hasHomeButton](v2, "hasHomeButton");
  v6 = 0;
  v4 = 1;
  if ((v3 & 1) == 0)
  {
    v7 = -[BuddyFinishedController deviceProvider](self, "deviceProvider");
    v6 = 1;
    v4 = -[BYDeviceProvider type](v7, "type") == (id)1;
  }
  v9 = v4;
  if ((v6 & 1) != 0)

  return v9;
}

- (BFFFlowItemDelegate)delegate
{
  return (BFFFlowItemDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BYDeviceProvider)deviceProvider
{
  return self->_deviceProvider;
}

- (void)setDeviceProvider:(id)a3
{
  objc_storeStrong((id *)&self->_deviceProvider, a3);
}

- (BuddySuspendTask)suspendTask
{
  return self->_suspendTask;
}

- (void)setSuspendTask:(id)a3
{
  objc_storeStrong((id *)&self->_suspendTask, a3);
}

- (BYPreferencesController)buddyPreferences
{
  return self->_buddyPreferences;
}

- (void)setBuddyPreferences:(id)a3
{
  objc_storeStrong((id *)&self->_buddyPreferences, a3);
}

- (_TtP5Setup20IntelligenceProvider_)intelligenceProvider
{
  return self->_intelligenceProvider;
}

- (void)setIntelligenceProvider:(id)a3
{
  objc_storeStrong((id *)&self->_intelligenceProvider, a3);
}

- (BOOL)drawHomeAffordance
{
  return self->_drawHomeAffordance;
}

- (void)setDrawHomeAffordance:(BOOL)a3
{
  self->_drawHomeAffordance = a3;
}

- (BYPreferencesController)buddyPreferencesExcludedFromBackup
{
  return self->_buddyPreferencesExcludedFromBackup;
}

- (void)setBuddyPreferencesExcludedFromBackup:(id)a3
{
  objc_storeStrong((id *)&self->_buddyPreferencesExcludedFromBackup, a3);
}

- (BuddyFlowItemDispositionProvider)flowItemDispositionProvider
{
  return self->_flowItemDispositionProvider;
}

- (void)setFlowItemDispositionProvider:(id)a3
{
  objc_storeStrong((id *)&self->_flowItemDispositionProvider, a3);
}

- (MTLumaDodgePillView)homeAffordanceView
{
  return self->_homeAffordanceView;
}

- (void)setHomeAffordanceView:(id)a3
{
  objc_storeStrong((id *)&self->_homeAffordanceView, a3);
}

- (BuddyFinishedCursiveChildWelcomeView)cursiveWelcomeView
{
  return self->_cursiveWelcomeView;
}

- (void)setCursiveWelcomeView:(id)a3
{
  objc_storeStrong((id *)&self->_cursiveWelcomeView, a3);
}

- (SASWelcomeToDeviceViewControllerProvider)welcomeGradientViewProvider
{
  return self->_welcomeGradientViewProvider;
}

- (void)setWelcomeGradientViewProvider:(id)a3
{
  objc_storeStrong((id *)&self->_welcomeGradientViewProvider, a3);
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_welcomeGradientViewProvider, 0);
  objc_storeStrong((id *)&self->_cursiveWelcomeView, 0);
  objc_storeStrong((id *)&self->_homeAffordanceView, 0);
  objc_storeStrong((id *)&self->_flowItemDispositionProvider, 0);
  objc_storeStrong((id *)&self->_buddyPreferencesExcludedFromBackup, 0);
  objc_storeStrong((id *)&self->_intelligenceProvider, 0);
  objc_storeStrong((id *)&self->_buddyPreferences, 0);
  objc_storeStrong((id *)&self->_suspendTask, 0);
  objc_storeStrong((id *)&self->_deviceProvider, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
