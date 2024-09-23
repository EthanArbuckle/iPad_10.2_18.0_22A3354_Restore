@implementation BuddyProximityIntentController

- (BuddyProximityIntentController)init
{
  NSBundle *v3;
  NSString *v4;
  NSBundle *v5;
  NSString *v6;
  BuddyProximityIntentController *v7;
  objc_super v9;
  SEL v10;
  id location;

  v10 = a2;
  v3 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v4 = -[NSBundle localizedStringForKey:value:table:](v3, "localizedStringForKey:value:table:", CFSTR("PROXIMITY_INTENT_TITLE_IPHONE"), &stru_100284738, CFSTR("Localizable"));
  v5 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v6 = -[NSBundle localizedStringForKey:value:table:](v5, "localizedStringForKey:value:table:", CFSTR("PROXIMITY_INTENT_DETAIL_OTHER_IPHONE"), &stru_100284738, CFSTR("Localizable"));
  location = 0;
  v9.receiver = self;
  v9.super_class = (Class)BuddyProximityIntentController;
  location = -[BuddyProximityIntentController initWithTitle:detailText:icon:](&v9, "initWithTitle:detailText:icon:", v4, v6, 0);
  objc_storeStrong(&location, location);

  v7 = (BuddyProximityIntentController *)location;
  objc_storeStrong(&location, 0);
  return v7;
}

- (void)viewDidLoad
{
  id v2;
  ProximitySetupController *v3;
  SASProximityInformation *v4;
  id v5;
  NSBundle *v6;
  id v7;
  NSString *v8;
  id v9;
  NSBundle *v10;
  id v11;
  NSString *v12;
  id v13;
  id v14;
  UIActivityIndicatorView *v15;
  UIActivityIndicatorView *v16;
  double v17;
  id v18;
  UIActivityIndicatorView *v19;
  id location;
  objc_super v21;
  SEL v22;
  BuddyProximityIntentController *v23;

  v23 = self;
  v22 = a2;
  v21.receiver = self;
  v21.super_class = (Class)BuddyProximityIntentController;
  -[BuddyProximityIntentController viewDidLoad](&v21, "viewDidLoad");
  v2 = -[BuddyProximityIntentController navigationItem](v23, "navigationItem");
  objc_msgSend(v2, "setHidesBackButton:animated:", 1, 0);

  v3 = -[BuddyProximityIntentController proximitySetupController](v23, "proximitySetupController");
  v4 = -[ProximitySetupController information](v3, "information");
  location = -[SASProximityInformation deviceClass](v4, "deviceClass");

  v5 = -[BuddyProximityIntentController headerView](v23, "headerView");
  v6 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v7 = +[BuddyLocalizationUtilities siblingDeviceSpecificLocalizedStringKeyForKey:deviceClass:](BuddyLocalizationUtilities, "siblingDeviceSpecificLocalizedStringKeyForKey:deviceClass:", CFSTR("PROXIMITY_INTENT_TITLE"), location);
  v8 = -[NSBundle localizedStringForKey:value:table:](v6, "localizedStringForKey:value:table:", v7, &stru_100284738, CFSTR("Localizable"));
  objc_msgSend(v5, "setTitle:", v8);

  v9 = -[BuddyProximityIntentController headerView](v23, "headerView");
  v10 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v11 = +[BuddyLocalizationUtilities siblingPairDeviceSpecificLocalizedStringKeyForKey:deviceClass:](BuddyLocalizationUtilities, "siblingPairDeviceSpecificLocalizedStringKeyForKey:deviceClass:", CFSTR("PROXIMITY_INTENT_DETAIL"), location);
  v12 = -[NSBundle localizedStringForKey:value:table:](v10, "localizedStringForKey:value:table:", v11, &stru_100284738, CFSTR("Localizable"));
  objc_msgSend(v9, "setDetailText:", v12);

  v13 = objc_alloc((Class)UIActivityIndicatorView);
  v14 = objc_msgSend(v13, "initWithActivityIndicatorStyle:", -[BuddyProximityIntentController _activityIndicatorViewStyle](v23, "_activityIndicatorViewStyle"));
  -[BuddyProximityIntentController setActivityIndicator:](v23, "setActivityIndicator:", v14);

  v15 = -[BuddyProximityIntentController activityIndicator](v23, "activityIndicator");
  -[UIActivityIndicatorView setTranslatesAutoresizingMaskIntoConstraints:](v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v16 = -[BuddyProximityIntentController activityIndicator](v23, "activityIndicator");
  LODWORD(v17) = 1148846080;
  -[UIActivityIndicatorView setContentCompressionResistancePriority:forAxis:](v16, "setContentCompressionResistancePriority:forAxis:", 1, v17);

  v18 = -[BuddyProximityIntentController contentView](v23, "contentView");
  v19 = -[BuddyProximityIntentController activityIndicator](v23, "activityIndicator");
  objc_msgSend(v18, "addSubview:", v19);

  -[BuddyProximityIntentController _updateLayout](v23, "_updateLayout");
  objc_storeStrong(&location, 0);
}

- (void)viewWillAppear:(BOOL)a3
{
  UIActivityIndicatorView *v3;
  objc_super v4;
  BOOL v5;
  SEL v6;
  BuddyProximityIntentController *v7;

  v7 = self;
  v6 = a2;
  v5 = a3;
  v4.receiver = self;
  v4.super_class = (Class)BuddyProximityIntentController;
  -[BuddyProximityIntentController viewWillAppear:](&v4, "viewWillAppear:", a3);
  v3 = -[BuddyProximityIntentController activityIndicator](v7, "activityIndicator");
  -[UIActivityIndicatorView startAnimating](v3, "startAnimating");

}

- (void)viewDidAppear:(BOOL)a3
{
  dispatch_time_t v3;
  void *v4;
  void **v5;
  int v6;
  int v7;
  void (*v8)(uint64_t);
  void *v9;
  BuddyProximityIntentController *v10;
  objc_super v11;
  BOOL v12;
  SEL v13;
  BuddyProximityIntentController *v14;

  v14 = self;
  v13 = a2;
  v12 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BuddyProximityIntentController;
  -[BuddyProximityIntentController viewDidAppear:](&v11, "viewDidAppear:", a3);
  if (-[BuddyProximityIntentController hasIntent](v14, "hasIntent"))
  {
    v3 = dispatch_time(0, 1000000000);
    v4 = &_dispatch_main_q;
    v5 = _NSConcreteStackBlock;
    v6 = -1073741824;
    v7 = 0;
    v8 = sub_10003564C;
    v9 = &unk_100280730;
    v10 = v14;
    dispatch_after(v3, (dispatch_queue_t)v4, &v5);

    objc_storeStrong((id *)&v10, 0);
  }
  else
  {
    -[BuddyProximityIntentController setDidAppear:](v14, "setDidAppear:", 1);
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id location[2];
  BuddyProximityIntentController *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[BuddyProximityIntentController _updateLayout](v4, "_updateLayout");
  objc_storeStrong(location, 0);
}

- (void)_updateLayout
{
  UIActivityIndicatorView *v2;
  id v3;
  UIActivityIndicatorView *v4;
  id v5;
  UIActivityIndicatorView *v6;
  id v7;
  id v8;
  UIActivityIndicatorView *v9;
  id v10;
  double v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  UIActivityIndicatorView *v18;
  id v19;
  id v20;
  NSArray *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  UIActivityIndicatorView *v28;
  id v29;
  id v30;
  NSArray *v31;
  UIActivityIndicatorView *v32;
  UIActivityIndicatorView *v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  UIActivityIndicatorView *v40;
  UIActivityIndicatorView *v41;
  id v42;
  id v43;
  id location[2];
  BuddyProximityIntentController *v45;
  _QWORD v46[4];
  _QWORD v47[4];

  v45 = self;
  location[1] = (id)a2;
  v2 = -[BuddyProximityIntentController activityIndicator](self, "activityIndicator");
  -[UIActivityIndicatorView removeFromSuperview](v2, "removeFromSuperview");

  v3 = -[BuddyProximityIntentController contentView](v45, "contentView");
  v4 = -[BuddyProximityIntentController activityIndicator](v45, "activityIndicator");
  objc_msgSend(v3, "addSubview:", v4);

  v5 = -[BuddyProximityIntentController _activityIndicatorViewStyle](v45, "_activityIndicatorViewStyle");
  v6 = -[BuddyProximityIntentController activityIndicator](v45, "activityIndicator");
  -[UIActivityIndicatorView setActivityIndicatorViewStyle:](v6, "setActivityIndicatorViewStyle:", v5);

  v7 = -[BuddyProximityIntentController view](v45, "view");
  v8 = objc_msgSend(v7, "centerYAnchor");
  v9 = -[BuddyProximityIntentController activityIndicator](v45, "activityIndicator");
  v10 = -[UIActivityIndicatorView centerYAnchor](v9, "centerYAnchor");
  location[0] = objc_msgSend(v8, "constraintEqualToAnchor:", v10);

  LODWORD(v11) = 1132068864;
  objc_msgSend(location[0], "setPriority:", v11);
  if ((-[BuddyProximityIntentController isContentCenterAligned](v45, "isContentCenterAligned") & 1) != 0)
  {
    v42 = -[BuddyProximityIntentController contentView](v45, "contentView");
    v38 = objc_msgSend(v42, "centerXAnchor");
    v40 = -[BuddyProximityIntentController activityIndicator](v45, "activityIndicator");
    v36 = -[UIActivityIndicatorView centerXAnchor](v40, "centerXAnchor");
    v34 = objc_msgSend(v38, "constraintEqualToAnchor:");
    v47[0] = v34;
    v47[1] = location[0];
    v32 = -[BuddyProximityIntentController activityIndicator](v45, "activityIndicator");
    v12 = -[UIActivityIndicatorView topAnchor](v32, "topAnchor");
    v13 = -[BuddyProximityIntentController contentView](v45, "contentView");
    v14 = objc_msgSend(v13, "topAnchor");
    v15 = objc_msgSend(v12, "constraintGreaterThanOrEqualToAnchor:", v14);
    v47[2] = v15;
    v16 = -[BuddyProximityIntentController contentView](v45, "contentView");
    v17 = objc_msgSend(v16, "bottomAnchor");
    v18 = -[BuddyProximityIntentController activityIndicator](v45, "activityIndicator");
    v19 = -[UIActivityIndicatorView bottomAnchor](v18, "bottomAnchor");
    v20 = objc_msgSend(v17, "constraintEqualToAnchor:", v19);
    v47[3] = v20;
    v21 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v47, 4);
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v21);

  }
  else
  {
    v43 = -[BuddyProximityIntentController contentView](v45, "contentView");
    v39 = objc_msgSend(v43, "leadingAnchor");
    v41 = -[BuddyProximityIntentController activityIndicator](v45, "activityIndicator");
    v37 = -[UIActivityIndicatorView leadingAnchor](v41, "leadingAnchor");
    v35 = objc_msgSend(v39, "constraintEqualToAnchor:");
    v46[0] = v35;
    v46[1] = location[0];
    v33 = -[BuddyProximityIntentController activityIndicator](v45, "activityIndicator");
    v22 = -[UIActivityIndicatorView topAnchor](v33, "topAnchor");
    v23 = -[BuddyProximityIntentController contentView](v45, "contentView");
    v24 = objc_msgSend(v23, "topAnchor");
    v25 = objc_msgSend(v22, "constraintGreaterThanOrEqualToAnchor:", v24);
    v46[2] = v25;
    v26 = -[BuddyProximityIntentController contentView](v45, "contentView");
    v27 = objc_msgSend(v26, "bottomAnchor");
    v28 = -[BuddyProximityIntentController activityIndicator](v45, "activityIndicator");
    v29 = -[UIActivityIndicatorView bottomAnchor](v28, "bottomAnchor");
    v30 = objc_msgSend(v27, "constraintEqualToAnchor:", v29);
    v46[3] = v30;
    v31 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v46, 4);
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v31);

  }
  objc_storeStrong(location, 0);
}

- (int64_t)_activityIndicatorViewStyle
{
  if ((-[BuddyProximityIntentController isContentCenterAligned](self, "isContentCenterAligned") & 1) != 0)
    return 100;
  else
    return 101;
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
  ProximitySetupController *v2;
  unsigned __int8 v3;
  unsigned __int8 v4;
  char v6;
  ProximitySetupController *v7;
  char v9;

  v2 = -[BuddyProximityIntentController proximitySetupController](self, "proximitySetupController");
  v3 = -[ProximitySetupController supportsIntent](v2, "supportsIntent");
  v6 = 0;
  v4 = 0;
  if ((v3 & 1) != 0)
  {
    v7 = -[BuddyProximityIntentController proximitySetupController](self, "proximitySetupController");
    v6 = 1;
    v4 = -[ProximitySetupController hasConnection](v7, "hasConnection");
  }
  v9 = v4 & 1;
  if ((v6 & 1) != 0)

  return v9 & 1;
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  ProximitySetupController *v3;
  void **v4;
  int v5;
  int v6;
  void (*v7)(id *, void *);
  void *v8;
  BuddyProximityIntentController *v9;
  id location[2];
  BuddyProximityIntentController *v11;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyProximityIntentController proximitySetupController](v11, "proximitySetupController");
  v4 = _NSConcreteStackBlock;
  v5 = -1073741824;
  v6 = 0;
  v7 = sub_100035EB0;
  v8 = &unk_100280758;
  v9 = v11;
  -[ProximitySetupController waitForIntent:](v3, "waitForIntent:", &v4);

  if (location[0])
    (*((void (**)(id, uint64_t))location[0] + 2))(location[0], 1);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

- (BOOL)isEphemeral
{
  return 1;
}

- (BOOL)shouldAllowStartOver
{
  return 0;
}

- (BOOL)shouldSuppressExtendedInitializationActivityIndicator
{
  return 1;
}

- (ProximitySetupController)proximitySetupController
{
  return self->_proximitySetupController;
}

- (void)setProximitySetupController:(id)a3
{
  objc_storeStrong((id *)&self->_proximitySetupController, a3);
}

- (BOOL)didAppear
{
  return self->_didAppear;
}

- (void)setDidAppear:(BOOL)a3
{
  self->_didAppear = a3;
}

- (BOOL)hasIntent
{
  return self->_hasIntent;
}

- (void)setHasIntent:(BOOL)a3
{
  self->_hasIntent = a3;
}

- (UIActivityIndicatorView)activityIndicator
{
  return self->_activityIndicator;
}

- (void)setActivityIndicator:(id)a3
{
  objc_storeStrong((id *)&self->_activityIndicator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_proximitySetupController, 0);
}

@end
