@implementation BuddyUserInterfaceStyleSelector

- (BuddyUserInterfaceStyleSelector)init
{
  NSBundle *v3;
  NSString *v4;
  NSBundle *v5;
  id v6;
  NSString *v7;
  id v8;
  id v9;
  void *v10;
  BuddyUserInterfaceStyleSelector *v11;
  objc_super v13;
  SEL v14;
  id location;

  v14 = a2;
  v3 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v4 = -[NSBundle localizedStringForKey:value:table:](v3, "localizedStringForKey:value:table:", CFSTR("APPEARANCE_TITLE"), &stru_100284738, CFSTR("Localizable"));
  v5 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v6 = +[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", CFSTR("APPEARANCE_DETAIL"));
  v7 = -[NSBundle localizedStringForKey:value:table:](v5, "localizedStringForKey:value:table:", v6, &stru_100284738, CFSTR("Localizable"));
  location = 0;
  v13.receiver = self;
  v13.super_class = (Class)BuddyUserInterfaceStyleSelector;
  location = -[BuddyUserInterfaceStyleSelector initWithTitle:detailText:symbolName:](&v13, "initWithTitle:detailText:symbolName:", v4, v7, 0);
  objc_storeStrong(&location, location);

  if (location)
  {
    v8 = objc_alloc((Class)UISUserInterfaceStyleMode);
    v9 = objc_msgSend(v8, "initWithDelegate:", location);
    v10 = (void *)*((_QWORD *)location + 8);
    *((_QWORD *)location + 8) = v9;

  }
  v11 = (BuddyUserInterfaceStyleSelector *)location;
  objc_storeStrong(&location, 0);
  return v11;
}

- (void)loadView
{
  id v2;
  id v3;
  double v4;
  double v5;
  double v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSBundle *v12;
  NSString *v13;
  NSBundle *v14;
  NSString *v15;
  NSBundle *v16;
  NSString *v17;
  BuddyPosedDeviceSelectionView *v18;
  BuddyUserInterfaceStyleSelector *v19;
  NSBundle *v20;
  NSString *v21;
  BuddyUserInterfaceStyleSelector *v22;
  BuddyPosedDeviceSelectionView *v23;
  BuddyPosedDeviceSelectionItemView *v24;
  UIView *v25;
  BuddyUserInterfaceStyleSelector *v26;
  BuddyPosedDeviceSelectionView *v27;
  BuddyPosedDeviceSelectionItemView *v28;
  UIView *v29;
  BuddyUserInterfaceStyleSelector *v30;
  BuddyPosedDeviceSelectionView *v31;
  BuddyPosedDeviceSelectionItemView *v32;
  UIView *v33;
  void **v34;
  int v35;
  int v36;
  void (*v37)(id *, double);
  void *v38;
  id v39;
  id location;
  id v41;
  id v42;
  id v43;
  __int128 v44;
  __int128 v45;
  double v46;
  double v47;
  double v48;
  objc_super v49;
  SEL v50;
  BuddyUserInterfaceStyleSelector *v51;

  v51 = self;
  v50 = a2;
  v49.receiver = self;
  v49.super_class = (Class)BuddyUserInterfaceStyleSelector;
  -[BuddyUserInterfaceStyleSelector loadView](&v49, "loadView");
  v2 = +[NSMutableArray array](NSMutableArray, "array");
  -[BuddyUserInterfaceStyleSelector setTimeLabelWidthConstraints:](v51, "setTimeLabelWidthConstraints:", v2);

  v3 = +[NSMutableArray array](NSMutableArray, "array");
  -[BuddyUserInterfaceStyleSelector setTimeLabelCenterYConstraints:](v51, "setTimeLabelCenterYConstraints:", v3);

  -[BuddyUserInterfaceStyleSelector _contentDisplayModel](v51, "_contentDisplayModel");
  v47 = v4;
  v48 = v5;
  +[BuddyPosedDeviceSelectionView posedDevicesPadding](BuddyPosedDeviceSelectionView, "posedDevicesPadding");
  v46 = v6;
  v7 = -[BuddyUserInterfaceStyleSelector view](v51, "view");
  objc_msgSend(v7, "directionalLayoutMargins");
  *(_QWORD *)&v44 = v8;
  *((_QWORD *)&v44 + 1) = v9;
  *(_QWORD *)&v45 = v10;
  *((_QWORD *)&v45 + 1) = v11;

  v12 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v13 = -[NSBundle localizedStringForKey:value:table:](v12, "localizedStringForKey:value:table:", CFSTR("APPEARANCE_CHOICE_LIGHT"), &stru_100284738, CFSTR("Localizable"));
  v43 = +[BuddyPosedDeviceSelectionView selectionItemWithImageName:symbolName:segment:text:hostViewLayoutMargins:posedDevicesPadding:](BuddyPosedDeviceSelectionView, "selectionItemWithImageName:symbolName:segment:text:hostViewLayoutMargins:posedDevicesPadding:", CFSTR("Appearance"), CFSTR("checkmark.circle.fill"), 0, v13, v44, v45, v46);

  v14 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v15 = -[NSBundle localizedStringForKey:value:table:](v14, "localizedStringForKey:value:table:", CFSTR("APPEARANCE_CHOICE_DARK"), &stru_100284738, CFSTR("Localizable"));
  v42 = +[BuddyPosedDeviceSelectionView selectionItemWithImageName:symbolName:segment:text:hostViewLayoutMargins:posedDevicesPadding:](BuddyPosedDeviceSelectionView, "selectionItemWithImageName:symbolName:segment:text:hostViewLayoutMargins:posedDevicesPadding:", CFSTR("Appearance-Dark"), CFSTR("checkmark.circle.fill"), 1, v15, v44, v45, v46);

  v16 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v17 = -[NSBundle localizedStringForKey:value:table:](v16, "localizedStringForKey:value:table:", CFSTR("APPEARANCE_CHOICE_AUTO"), &stru_100284738, CFSTR("Localizable"));
  v41 = +[BuddyPosedDeviceSelectionView selectionItemWithImageName:symbolName:segment:text:hostViewLayoutMargins:posedDevicesPadding:](BuddyPosedDeviceSelectionView, "selectionItemWithImageName:symbolName:segment:text:hostViewLayoutMargins:posedDevicesPadding:", CFSTR("Appearance-Auto"), CFSTR("checkmark.circle.fill"), 2, v17, v44, v45, v46);

  v18 = -[BuddyPosedDeviceSelectionView initWithLeftView:centerView:rightView:]([BuddyPosedDeviceSelectionView alloc], "initWithLeftView:centerView:rightView:", v43, v42, v41);
  -[BuddyPosedDeviceSelectionController setSelectionView:](v51, "setSelectionView:", v18);

  objc_initWeak(&location, v51);
  v34 = _NSConcreteStackBlock;
  v35 = -1073741824;
  v36 = 0;
  v37 = sub_1000DEBB8;
  v38 = &unk_100282858;
  objc_copyWeak(&v39, &location);
  -[BuddyPosedDeviceSelectionController setSelectionViewHeightChangeBlock:](v51, "setSelectionViewHeightChangeBlock:", &v34);
  v19 = v51;
  v20 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v21 = -[NSBundle localizedStringForKey:value:table:](v20, "localizedStringForKey:value:table:", CFSTR("APPEARANCE_CONTINUE"), &stru_100284738, CFSTR("Localizable"));
  -[BuddyWelcomeController addBoldButton:action:](v19, "addBoldButton:action:", v21, "_continuePressed");

  v22 = v51;
  v23 = -[BuddyPosedDeviceSelectionController selectionView](v51, "selectionView");
  v24 = -[BuddyPosedDeviceSelectionView leftPosedView](v23, "leftPosedView");
  v25 = -[BuddyPosedDeviceSelectionItemView contentContainer](v24, "contentContainer");
  -[BuddyUserInterfaceStyleSelector _decorateComposedItemView:displayModel:](v22, "_decorateComposedItemView:displayModel:", v25, v47, v48);

  v26 = v51;
  v27 = -[BuddyPosedDeviceSelectionController selectionView](v51, "selectionView");
  v28 = -[BuddyPosedDeviceSelectionView centerPosedView](v27, "centerPosedView");
  v29 = -[BuddyPosedDeviceSelectionItemView contentContainer](v28, "contentContainer");
  -[BuddyUserInterfaceStyleSelector _decorateComposedItemView:displayModel:](v26, "_decorateComposedItemView:displayModel:", v29, v47, v48);

  v30 = v51;
  v31 = -[BuddyPosedDeviceSelectionController selectionView](v51, "selectionView");
  v32 = -[BuddyPosedDeviceSelectionView rightPosedView](v31, "rightPosedView");
  v33 = -[BuddyPosedDeviceSelectionItemView contentContainer](v32, "contentContainer");
  -[BuddyUserInterfaceStyleSelector _decorateComposedItemView:displayModel:](v30, "_decorateComposedItemView:displayModel:", v33, v47, v48);

  objc_destroyWeak(&v39);
  objc_destroyWeak(&location);
  objc_storeStrong(&v41, 0);
  objc_storeStrong(&v42, 0);
  objc_storeStrong(&v43, 0);
}

- (void)viewWillAppear:(BOOL)a3
{
  id v3;
  BuddyPosedDeviceSelectionView *v4;
  BYPreferencesController *v5;
  BYPaneFeatureAnalyticsManager *v6;
  uint64_t v7;
  id location;
  objc_super v9;
  BOOL v10;
  SEL v11;
  BuddyUserInterfaceStyleSelector *v12;

  v12 = self;
  v11 = a2;
  v10 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BuddyUserInterfaceStyleSelector;
  -[BuddyPosedDeviceSelectionController viewWillAppear:](&v9, "viewWillAppear:", a3);
  location = objc_msgSend(objc_alloc((Class)UISUserInterfaceStyleMode), "initWithDelegate:", 0);
  v3 = objc_msgSend(location, "modeValue");
  if (v3 == (id)1)
  {
    v7 = 0;
  }
  else if (v3 == (id)2)
  {
    v7 = 1;
  }
  else
  {
    v7 = 2;
  }
  v4 = -[BuddyPosedDeviceSelectionController selectionView](v12, "selectionView");
  -[BuddyPosedDeviceSelectionView selectSegment:](v4, "selectSegment:", v7);

  v5 = -[BuddyUserInterfaceStyleSelector buddyPreferences](v12, "buddyPreferences");
  -[BYPreferencesController setObject:forKey:](v5, "setObject:forKey:", &__kCFBooleanFalse, CFSTR("UserInterfaceStyleModePresented"));

  v6 = -[BuddyUserInterfaceStyleSelector paneFeatureAnalyticsManager](v12, "paneFeatureAnalyticsManager");
  -[BYPaneFeatureAnalyticsManager clearActionForFeature:](v6, "clearActionForFeature:", 9);

  objc_storeStrong(&location, 0);
}

+ (void)setUserInterfaceStyleModeValue:(int64_t)a3 presented:(BOOL)a4 buddyPreferences:(id)a5
{
  id v5;
  id v6;
  NSNumber *v7;
  id v8;
  id location;
  BOOL v10;
  int64_t v11;
  SEL v12;
  id v13;

  v13 = a1;
  v12 = a2;
  v11 = a3;
  v10 = a4;
  location = 0;
  objc_storeStrong(&location, a5);
  v5 = objc_msgSend(objc_alloc((Class)UISUserInterfaceStyleMode), "initWithDelegate:", 0);
  objc_msgSend(v5, "setModeValue:", v11, v5);
  v6 = location;
  v7 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v10);
  objc_msgSend(v6, "setObject:forKey:", v7, CFSTR("UserInterfaceStyleModePresented"));

  objc_storeStrong(&v8, 0);
  objc_storeStrong(&location, 0);
}

+ (void)clearUserInterfaceStyleMode:(id)a3
{
  void *v3;
  id location[2];
  id v5;

  v5 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = (void *)objc_opt_class(v5);
  objc_msgSend(v3, "setUserInterfaceStyleModeValue:presented:buddyPreferences:", 1, 0, location[0]);
  objc_storeStrong(location, 0);
}

- (BOOL)controllerNeedsToRun
{
  BYPreferencesController *v2;
  char v3;

  v2 = -[BuddyUserInterfaceStyleSelector buddyPreferences](self, "buddyPreferences", a2, self);
  v3 = -[BYPreferencesController BOOLForKey:](v2, "BOOLForKey:", CFSTR("UserInterfaceStyleModePresented")) ^ 1;

  return v3 & 1;
}

+ (id)cloudConfigSkipKey
{
  return kMCCCSkipSetupAppearance;
}

+ (unint64_t)applicableDispositions
{
  return 20;
}

- (void)_decorateComposedItemView:(id)a3 displayModel:(_SelectionContentDisplayModel)a4
{
  UIFont *v4;
  NSBundle *v5;
  NSString *v6;
  id v7;
  id v8;
  double var1;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSMutableArray *v23;
  NSMutableArray *v24;
  id v25[5];
  id v26;
  id v27;
  id location[2];
  BuddyUserInterfaceStyleSelector *v29;
  _SelectionContentDisplayModel v30;

  v30 = a4;
  v29 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v27 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  objc_msgSend(v27, "setNumberOfLines:", 1);
  v4 = +[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:", 60.5, UIFontWeightMedium);
  objc_msgSend(v27, "setFont:", v4);

  objc_msgSend(v27, "setAdjustsFontSizeToFitWidth:", 1);
  objc_msgSend(v27, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v5 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v6 = -[NSBundle localizedStringForKey:value:table:](v5, "localizedStringForKey:value:table:", CFSTR("APPEARANCE_CHOICE_POSED_TIME"), &stru_100284738, CFSTR("Localizable"));
  objc_msgSend(v27, "setText:", v6);

  objc_msgSend(v27, "setBaselineAdjustment:", 1);
  objc_msgSend(v27, "setTextAlignment:", 1);
  v7 = +[UIColor systemWhiteColor](UIColor, "systemWhiteColor");
  objc_msgSend(v27, "setTextColor:", v7);

  objc_msgSend(location[0], "addSubview:", v27);
  v8 = objc_msgSend(v27, "widthAnchor");
  var1 = v30.var1;
  objc_msgSend(location[0], "bounds");
  v25[2] = v10;
  v25[1] = v11;
  v25[4] = v12;
  v25[3] = v13;
  v26 = objc_msgSend(v8, "constraintEqualToConstant:", var1 * *(double *)&v12);

  objc_msgSend(v26, "setActive:", 1);
  v14 = objc_msgSend(v27, "centerXAnchor");
  v15 = objc_msgSend(location[0], "centerXAnchor");
  v16 = objc_msgSend(v14, "constraintEqualToAnchor:constant:", v15, 2.0);
  objc_msgSend(v16, "setActive:", 1);

  v17 = objc_msgSend(v27, "centerYAnchor");
  v18 = objc_msgSend(location[0], "centerYAnchor");
  objc_msgSend(location[0], "bounds");
  v25[0] = objc_msgSend(v17, "constraintEqualToAnchor:constant:", v18, -(v19 * v30.var0), v20, v21, v22, *(_QWORD *)&v19);

  objc_msgSend(v25[0], "setActive:", 1);
  v23 = -[BuddyUserInterfaceStyleSelector timeLabelCenterYConstraints](v29, "timeLabelCenterYConstraints");
  -[NSMutableArray addObject:](v23, "addObject:", v25[0]);

  v24 = -[BuddyUserInterfaceStyleSelector timeLabelWidthConstraints](v29, "timeLabelWidthConstraints");
  -[NSMutableArray addObject:](v24, "addObject:", v26);

  objc_storeStrong(v25, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(&v27, 0);
  objc_storeStrong(location, 0);
}

- (_SelectionContentDisplayModel)_contentDisplayModel
{
  UIScreen *v2;
  double v3;
  BOOL v4;
  double v5;
  double v6;
  double v7;
  char v8;
  UIScreen *v9;
  id location;
  uint64_t v11;
  double v12;
  SEL v13;
  BuddyUserInterfaceStyleSelector *v14;
  double v15;
  double v16;
  _SelectionContentDisplayModel result;

  v14 = self;
  v13 = a2;
  v12 = 0.256222486;
  v11 = 0x3FC99999A0000000;
  location = +[BYDevice currentDevice](BYDevice, "currentDevice");
  if (objc_msgSend(location, "type") == (id)1)
  {
    if ((objc_msgSend(location, "hasHomeButton") & 1) != 0)
    {
      v12 = 0.239999995;
      v11 = 0x3FCB851EC0000000;
    }
    else
    {
      v12 = 0.256229997;
      v11 = 0x3FC99999A0000000;
    }
  }
  else
  {
    switch((unint64_t)objc_msgSend(location, "size"))
    {
      case 0uLL:
      case 4uLL:
        if (objc_msgSend(location, "mainScreenClass") == 22
          || objc_msgSend(location, "mainScreenClass") == 24
          || objc_msgSend(location, "mainScreenClass") == 25)
        {
          v12 = 0.263000011;
          v11 = 0x3FCCCCCCC0000000;
        }
        else
        {
          v12 = 0.230000004;
          v11 = 0x3FD051EB80000000;
        }
        break;
      case 1uLL:
      case 2uLL:
        v12 = 0.239999995;
        v11 = 0x3FD051EB80000000;
        break;
      case 3uLL:
        v12 = 0.263000011;
        v11 = 0x3FCCCCCCC0000000;
        break;
      case 5uLL:
        v12 = 0.272000015;
        v11 = 0x3FCCCCCCC0000000;
        break;
      case 6uLL:
        v2 = +[UIScreen mainScreen](UIScreen, "mainScreen");
        -[UIScreen bounds](v2, "bounds");
        v8 = 0;
        v4 = 0;
        if (v3 >= 414.0)
        {
          v9 = +[UIScreen mainScreen](UIScreen, "mainScreen", v3);
          v8 = 1;
          -[UIScreen bounds](v9, "bounds");
          v4 = v5 >= 896.0;
        }
        if ((v8 & 1) != 0)

        if (v4)
          v12 = 0.272000015;
        else
          v12 = 0.263000011;
        v11 = 0x3FCCCCCCC0000000;
        break;
      default:
        break;
    }
  }
  v15 = v12 * 1.2;
  v16 = *(double *)&v11;
  objc_storeStrong(&location, 0);
  v6 = v15;
  v7 = v16;
  result.var1 = v7;
  result.var0 = v6;
  return result;
}

- (id)_darkImageNameForImageName:(id)a3
{
  id v3;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = objc_msgSend(location[0], "stringByAppendingString:", CFSTR("_dark"));
  objc_storeStrong(location, 0);
  return v3;
}

- (void)_continuePressed
{
  BFFSettingsManager *v2;
  UISUserInterfaceStyleMode *v3;
  BYPreferencesController *v4;
  BYPaneFeatureAnalyticsManager *v5;
  UISUserInterfaceStyleMode *v6;
  NSNumber *v7;
  BFFFlowItemDelegate *v8;

  v2 = -[BuddyUserInterfaceStyleSelector settingsManager](self, "settingsManager", a2);
  v3 = -[BuddyUserInterfaceStyleSelector styleMode](self, "styleMode");
  -[BFFSettingsManager setUserInterfaceStyleMode:](v2, "setUserInterfaceStyleMode:", -[UISUserInterfaceStyleMode modeValue](v3, "modeValue"));

  v4 = -[BuddyUserInterfaceStyleSelector buddyPreferences](self, "buddyPreferences");
  -[BYPreferencesController setObject:forKey:](v4, "setObject:forKey:", &__kCFBooleanTrue, CFSTR("UserInterfaceStyleModePresented"));

  v5 = -[BuddyUserInterfaceStyleSelector paneFeatureAnalyticsManager](self, "paneFeatureAnalyticsManager");
  v6 = -[BuddyUserInterfaceStyleSelector styleMode](self, "styleMode");
  v7 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[UISUserInterfaceStyleMode modeValue](v6, "modeValue"));
  -[BYPaneFeatureAnalyticsManager recordActionWithValue:forFeature:](v5, "recordActionWithValue:forFeature:", v7, 9);

  v8 = -[BuddyWelcomeController delegate](self, "delegate");
  -[BFFFlowItemDelegate flowItemDone:nextItemClass:](v8, "flowItemDone:nextItemClass:", self, 0);

}

- (void)userInterfaceStyleModeDidChange:(id)a3
{
  UIColor *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  char v8;
  id v9;
  char v10;
  id v11;
  id v12;
  id location[2];
  BuddyUserInterfaceStyleSelector *v14;

  v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v10 = 0;
  v8 = 0;
  if (objc_msgSend(location[0], "modeValue") == (id)2)
  {
    v3 = +[UIColor blackColor](UIColor, "blackColor");
    v11 = v3;
    v10 = 1;
  }
  else
  {
    v3 = +[UIColor whiteColor](UIColor, "whiteColor");
    v9 = v3;
    v8 = 1;
  }
  v12 = v3;
  if ((v8 & 1) != 0)

  if ((v10 & 1) != 0)
  v4 = objc_msgSend(v12, "colorWithAlphaComponent:", 0.96);
  v7 = (id)BFFPointImageOfColor(v4);

  v5 = -[BuddyUserInterfaceStyleSelector navigationController](v14, "navigationController");
  v6 = objc_msgSend(v5, "navigationBar");
  objc_msgSend(v6, "setBackgroundImage:forBarMetrics:", v7, 0);

  objc_storeStrong(&v7, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
}

- (void)didSelectSegment:(int64_t)a3
{
  UISUserInterfaceStyleMode *v3;
  UISUserInterfaceStyleMode *v4;
  UISUserInterfaceStyleMode *v5;

  if (a3)
  {
    if (a3 == 1)
    {
      v4 = -[BuddyUserInterfaceStyleSelector styleMode](self, "styleMode");
      -[UISUserInterfaceStyleMode setModeValue:](v4, "setModeValue:", 2);

    }
    else if (a3 == 2)
    {
      v5 = -[BuddyUserInterfaceStyleSelector styleMode](self, "styleMode");
      -[UISUserInterfaceStyleMode setModeValue:](v5, "setModeValue:", 100);

    }
  }
  else
  {
    v3 = -[BuddyUserInterfaceStyleSelector styleMode](self, "styleMode");
    -[UISUserInterfaceStyleMode setModeValue:](v3, "setModeValue:", 1);

  }
}

- (BFFSettingsManager)settingsManager
{
  return self->_settingsManager;
}

- (void)setSettingsManager:(id)a3
{
  objc_storeStrong((id *)&self->_settingsManager, a3);
}

- (BYPreferencesController)buddyPreferences
{
  return self->_buddyPreferences;
}

- (void)setBuddyPreferences:(id)a3
{
  objc_storeStrong((id *)&self->_buddyPreferences, a3);
}

- (BYPaneFeatureAnalyticsManager)paneFeatureAnalyticsManager
{
  return self->_paneFeatureAnalyticsManager;
}

- (void)setPaneFeatureAnalyticsManager:(id)a3
{
  objc_storeStrong((id *)&self->_paneFeatureAnalyticsManager, a3);
}

- (UISUserInterfaceStyleMode)styleMode
{
  return self->_styleMode;
}

- (void)setStyleMode:(id)a3
{
  objc_storeStrong((id *)&self->_styleMode, a3);
}

- (NSLayoutConstraint)leftLabelVerticalConstraint
{
  return self->_leftLabelVerticalConstraint;
}

- (void)setLeftLabelVerticalConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_leftLabelVerticalConstraint, a3);
}

- (NSLayoutConstraint)rightLabelVerticalConstraint
{
  return self->_rightLabelVerticalConstraint;
}

- (void)setRightLabelVerticalConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_rightLabelVerticalConstraint, a3);
}

- (NSMutableArray)timeLabelCenterYConstraints
{
  return self->_timeLabelCenterYConstraints;
}

- (void)setTimeLabelCenterYConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_timeLabelCenterYConstraints, a3);
}

- (NSMutableArray)timeLabelWidthConstraints
{
  return self->_timeLabelWidthConstraints;
}

- (void)setTimeLabelWidthConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_timeLabelWidthConstraints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeLabelWidthConstraints, 0);
  objc_storeStrong((id *)&self->_timeLabelCenterYConstraints, 0);
  objc_storeStrong((id *)&self->_rightLabelVerticalConstraint, 0);
  objc_storeStrong((id *)&self->_leftLabelVerticalConstraint, 0);
  objc_storeStrong((id *)&self->_styleMode, 0);
  objc_storeStrong((id *)&self->_paneFeatureAnalyticsManager, 0);
  objc_storeStrong((id *)&self->_buddyPreferences, 0);
  objc_storeStrong((id *)&self->_settingsManager, 0);
}

@end
