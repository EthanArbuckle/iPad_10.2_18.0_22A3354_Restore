@implementation BuddyAppleIDChoiceController

- (BuddyAppleIDChoiceController)init
{
  NSBundle *v3;
  NSString *v4;
  BuddyAppleIDChoiceController *v5;
  objc_super v7;
  SEL v8;
  id location;

  v8 = a2;
  v3 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v4 = -[NSBundle localizedStringForKey:value:table:](v3, "localizedStringForKey:value:table:", CFSTR("APPLEID_TITLE_LABEL"), &stru_100284738, CFSTR("Localizable"));
  location = 0;
  v7.receiver = self;
  v7.super_class = (Class)BuddyAppleIDChoiceController;
  location = -[BuddyAppleIDChoiceController initWithTitle:detailText:icon:adoptTableViewScrollView:](&v7, "initWithTitle:detailText:icon:adoptTableViewScrollView:", v4, 0, 0, 1);
  objc_storeStrong(&location, location);

  v5 = (BuddyAppleIDChoiceController *)location;
  objc_storeStrong(&location, 0);
  return v5;
}

- (void)viewDidLoad
{
  id v2;
  BuddyAppleIDChoiceController *v3;
  id v4;
  objc_super v5;
  SEL v6;
  BuddyAppleIDChoiceController *v7;

  v7 = self;
  v6 = a2;
  v5.receiver = self;
  v5.super_class = (Class)BuddyAppleIDChoiceController;
  -[BuddyAppleIDChoiceController viewDidLoad](&v5, "viewDidLoad");
  v2 = objc_msgSend(objc_alloc((Class)UITableView), "initWithFrame:style:", 2, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  -[BuddyAppleIDChoiceController setTableView:](v7, "setTableView:", v2);

  v3 = v7;
  v4 = -[BuddyAppleIDChoiceController tableView](v7, "tableView");
  objc_msgSend(v4, "setDataSource:", v3);

  -[BuddyAppleIDChoiceController _createServiceHeader](v7, "_createServiceHeader");
}

- (void)didMoveToParentViewController:(id)a3
{
  BuddyAppleIDController *v3;
  id v4;
  id location[2];
  BuddyAppleIDChoiceController *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyAppleIDChoiceController appleIDController](v6, "appleIDController");
  v4 = -[BuddyAppleIDChoiceController navigationController](v6, "navigationController");
  -[BuddyAppleIDController setNavigationController:](v3, "setNavigationController:", v4);

  objc_storeStrong(location, 0);
}

- (void)viewDidAppear:(BOOL)a3
{
  id v3;
  id v4;
  id v5;
  BuddyNetworkProvider *v6;
  unsigned __int8 v7;
  NSBundle *v8;
  NSString *v9;
  NSBundle *v10;
  id v11;
  NSString *v12;
  id v13;
  NSBundle *v14;
  id v15;
  NSString *v16;
  UIAlertAction *v17;
  id v18;
  NSBundle *v19;
  NSString *v20;
  UIAlertAction *v21;
  void **v22;
  int v23;
  int v24;
  void (*v25)(id *, void *);
  void *v26;
  BuddyAppleIDChoiceController *v27;
  void **v28;
  int v29;
  int v30;
  void (*v31)(id *, void *);
  void *v32;
  BuddyAppleIDChoiceController *v33;
  id location;
  char v35;
  id v36;
  id v37;
  objc_super v38;
  BOOL v39;
  SEL v40;
  BuddyAppleIDChoiceController *v41;

  v41 = self;
  v40 = a2;
  v39 = a3;
  v38.receiver = self;
  v38.super_class = (Class)BuddyAppleIDChoiceController;
  -[BuddyAppleIDChoiceController viewDidAppear:](&v38, "viewDidAppear:", a3);
  v3 = -[BuddyAppleIDChoiceController tableView](v41, "tableView");
  v37 = objc_msgSend(v3, "indexPathForSelectedRow");

  if (v37)
  {
    v4 = -[BuddyAppleIDChoiceController tableView](v41, "tableView");
    objc_msgSend(v4, "deselectRowAtIndexPath:animated:", v37, 1);

  }
  v5 = +[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace");
  objc_msgSend(v5, "enumerateBundlesOfType:block:", 1, &stru_1002827A8);

  v6 = -[BuddyAppleIDChoiceController networkProvider](v41, "networkProvider");
  v35 = 0;
  v7 = 0;
  if (!-[BuddyNetworkProvider networkReachable](v6, "networkReachable"))
  {
    v7 = 0;
    if (!-[BuddyAppleIDChoiceController didShowWifiAlert](v41, "didShowWifiAlert"))
    {
      v36 = -[BuddyAppleIDChoiceController networkProvider](v41, "networkProvider");
      v35 = 1;
      v7 = objc_msgSend(v36, "supportsWiFi");
    }
  }
  if ((v35 & 1) != 0)

  if ((v7 & 1) != 0)
  {
    -[BuddyAppleIDChoiceController setDidShowWifiAlert:](v41, "setDidShowWifiAlert:", 1);
    v8 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v9 = -[NSBundle localizedStringForKey:value:table:](v8, "localizedStringForKey:value:table:", CFSTR("APPLEID_NO_NETWORK_TITLE"), &stru_100284738, CFSTR("Localizable"));
    v10 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v11 = (id)SFLocalizableWAPIStringKeyForKey(CFSTR("APPLEID_WIFI_BODY"));
    v12 = -[NSBundle localizedStringForKey:value:table:](v10, "localizedStringForKey:value:table:", v11, &stru_100284738, CFSTR("Localizable"));
    location = +[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v9, v12, 1);

    v13 = location;
    v14 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v15 = (id)SFLocalizableWAPIStringKeyForKey(CFSTR("NEW_WIFI"));
    v16 = -[NSBundle localizedStringForKey:value:table:](v14, "localizedStringForKey:value:table:", v15, &stru_100284738, CFSTR("Localizable"));
    v28 = _NSConcreteStackBlock;
    v29 = -1073741824;
    v30 = 0;
    v31 = sub_1000DA1BC;
    v32 = &unk_100280A28;
    v33 = v41;
    v17 = +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v16, 0, &v28);
    objc_msgSend(v13, "addAction:", v17);

    v18 = location;
    v19 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v20 = -[NSBundle localizedStringForKey:value:table:](v19, "localizedStringForKey:value:table:", CFSTR("CONTINUE"), &stru_100284738, CFSTR("Localizable"));
    v22 = _NSConcreteStackBlock;
    v23 = -1073741824;
    v24 = 0;
    v25 = sub_1000DA228;
    v26 = &unk_100280A28;
    v27 = v41;
    v21 = +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v20, 0, &v22);
    objc_msgSend(v18, "addAction:", v21);

    -[BuddyAppleIDChoiceController presentViewController:animated:completion:](v41, "presentViewController:animated:completion:", location, 1, 0);
    objc_storeStrong((id *)&v27, 0);
    objc_storeStrong((id *)&v33, 0);
    objc_storeStrong(&location, 0);
  }
  objc_storeStrong(&v37, 0);
}

- (void)viewWillAppear:(BOOL)a3
{
  id v3;
  BYPaneFeatureAnalyticsManager *v4;
  objc_super v5;
  BOOL v6;
  SEL v7;
  BuddyAppleIDChoiceController *v8;

  v8 = self;
  v7 = a2;
  v6 = a3;
  v3 = -[BuddyAppleIDChoiceController tableView](self, "tableView");
  objc_msgSend(v3, "selectRowAtIndexPath:animated:scrollPosition:", 0, 0, 0);

  -[BuddyAppleIDChoiceController setAllowBack:](v8, "setAllowBack:", 1);
  v4 = -[BuddyAppleIDChoiceController paneFeatureAnalyticsManager](v8, "paneFeatureAnalyticsManager");
  -[BYPaneFeatureAnalyticsManager clearActionForFeature:](v4, "clearActionForFeature:", 14);

  v5.receiver = v8;
  v5.super_class = (Class)BuddyAppleIDChoiceController;
  -[BuddyAppleIDChoiceController viewWillAppear:](&v5, "viewWillAppear:", v6);
}

- (void)dealloc
{
  BuddyAppleIDController *v2;
  objc_super v3;
  SEL v4;
  BuddyAppleIDChoiceController *v5;

  v5 = self;
  v4 = a2;
  v2 = -[BuddyAppleIDChoiceController appleIDController](self, "appleIDController");
  -[BuddyAppleIDController setDelegate:](v2, "setDelegate:", 0);

  v3.receiver = v5;
  v3.super_class = (Class)BuddyAppleIDChoiceController;
  -[BuddyAppleIDChoiceController dealloc](&v3, "dealloc");
}

- (void)_createServiceHeader
{
  UIImage *v2;
  id v3;
  UIImage *v4;
  id v5;
  UIImage *v6;
  id v7;
  UIImage *v8;
  id v9;
  UIImage *v10;
  NSArray *v11;
  NSString *v12;
  NSBundle *v13;
  NSString *v14;
  NSBundle *v15;
  NSString *v16;
  NSBundle *v17;
  NSString *v18;
  NSBundle *v19;
  NSString *v20;
  NSArray *v21;
  id v22;
  id v23;
  id v24;
  _BOOL8 v25;
  NSAssertionHandler *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  NSBundle *v31;
  NSString *v32;
  UIFontDescriptor *v33;
  UIFontDescriptor *v34;
  UIFont *v35;
  UIColor *v36;
  NSBundle *v37;
  NSString *v38;
  UIFontDescriptor *v39;
  UIFont *v40;
  UIColor *v41;
  id v42;
  id v43;
  id v44;
  id v45;
  uint64_t v46;
  char v47;
  double v48;
  id v49;
  UIView *v50;
  double v51;
  double v52;
  id v53;
  NSBundle *v54;
  UIImage *v55;
  id v56;
  NSString *v57;
  NSBundle *v58;
  UIImage *v59;
  id v60;
  NSString *v61;
  NSBundle *v62;
  id location;
  id v64;
  void **v65;
  int v66;
  int v67;
  id (*v68)(id *, void *);
  void *v69;
  BuddyAppleIDChoiceController *v70;
  id v71;
  SEL v72;
  id v73;
  _QWORD v74[7];
  _QWORD v75[7];

  v73 = self;
  v72 = a2;
  v65 = _NSConcreteStackBlock;
  v66 = -1073741824;
  v67 = 0;
  v68 = sub_1000DAF04;
  v69 = &unk_1002827D0;
  v70 = self;
  v71 = objc_retainBlock(&v65);
  v60 = (id)(*((uint64_t (**)(id, const __CFString *))v71 + 2))(v71, CFSTR("iCloud"));
  v59 = +[UIImage imageNamed:](UIImage, "imageNamed:");
  v75[0] = v59;
  v56 = (id)(*((uint64_t (**)(id, const __CFString *))v71 + 2))(v71, CFSTR("App_Store"));
  v55 = +[UIImage imageNamed:](UIImage, "imageNamed:");
  v75[1] = v55;
  v53 = (id)(*((uint64_t (**)(id, const __CFString *))v71 + 2))(v71, CFSTR("iMovies"));
  v2 = +[UIImage imageNamed:](UIImage, "imageNamed:");
  v75[2] = v2;
  v3 = (id)(*((uint64_t (**)(id, const __CFString *))v71 + 2))(v71, CFSTR("Photos"));
  v4 = +[UIImage imageNamed:](UIImage, "imageNamed:", v3);
  v75[3] = v4;
  v5 = (id)(*((uint64_t (**)(id, const __CFString *))v71 + 2))(v71, CFSTR("Messages"));
  v6 = +[UIImage imageNamed:](UIImage, "imageNamed:", v5);
  v75[4] = v6;
  v7 = (id)(*((uint64_t (**)(id, const __CFString *))v71 + 2))(v71, CFSTR("Facetime"));
  v8 = +[UIImage imageNamed:](UIImage, "imageNamed:", v7);
  v75[5] = v8;
  v9 = (id)(*((uint64_t (**)(id, const __CFString *))v71 + 2))(v71, CFSTR("Books"));
  v10 = +[UIImage imageNamed:](UIImage, "imageNamed:", v9);
  v75[6] = v10;
  v11 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v75, 7);
  objc_msgSend(v73, "setItemIcons:", v11);

  v62 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v61 = -[NSBundle localizedStringForKey:value:table:](v62, "localizedStringForKey:value:table:", CFSTR("APPLEID_WHAT_IS_ICLOUD"), &stru_100284738, CFSTR("Localizable"));
  v74[0] = v61;
  v58 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v57 = -[NSBundle localizedStringForKey:value:table:](v58, "localizedStringForKey:value:table:", CFSTR("APPLEID_WHAT_IS_APP_STORE"), &stru_100284738, CFSTR("Localizable"));
  v74[1] = v57;
  v54 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v12 = -[NSBundle localizedStringForKey:value:table:](v54, "localizedStringForKey:value:table:", CFSTR("APPLEID_WHAT_IS_ITUNES_STORE"), &stru_100284738, CFSTR("Localizable"));
  v74[2] = v12;
  v13 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v14 = -[NSBundle localizedStringForKey:value:table:](v13, "localizedStringForKey:value:table:", CFSTR("APPLEID_WHAT_IS_PHOTOS"), &stru_100284738, CFSTR("Localizable"));
  v74[3] = v14;
  v15 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v16 = -[NSBundle localizedStringForKey:value:table:](v15, "localizedStringForKey:value:table:", CFSTR("APPLEID_WHAT_IS_MESSAGES"), &stru_100284738, CFSTR("Localizable"));
  v74[4] = v16;
  v17 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v18 = -[NSBundle localizedStringForKey:value:table:](v17, "localizedStringForKey:value:table:", CFSTR("APPLEID_WHAT_IS_FACETIME"), &stru_100284738, CFSTR("Localizable"));
  v74[5] = v18;
  v19 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v20 = -[NSBundle localizedStringForKey:value:table:](v19, "localizedStringForKey:value:table:", CFSTR("APPLEID_WHAT_IS_IBOOKS"), &stru_100284738, CFSTR("Localizable"));
  v74[6] = v20;
  v21 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v74, 7);
  objc_msgSend(v73, "setItemDescriptions:", v21);

  v22 = objc_msgSend(v73, "itemIcons");
  v23 = objc_msgSend(v22, "count");
  v24 = objc_msgSend(v73, "itemDescriptions");
  v25 = v23 != objc_msgSend(v24, "count");

  if (v25)
  {
    v26 = +[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler");
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](v26, "handleFailureInMethod:object:file:lineNumber:description:", v72, v73, CFSTR("BuddyAppleIDChoiceController.m"), 170, CFSTR("items count not the same!"));

  }
  v27 = objc_msgSend(objc_alloc((Class)UIStackView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  objc_msgSend(v73, "setServiceHeaderView:", v27);

  v28 = objc_msgSend(v73, "serviceHeaderView");
  objc_msgSend(v28, "setAxis:", 1);

  v29 = objc_msgSend(v73, "serviceHeaderView");
  objc_msgSend(v29, "setDistribution:", 0);

  v30 = objc_msgSend(v73, "serviceHeaderView");
  objc_msgSend(v30, "setAlignment:", 0);

  v64 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  objc_msgSend(v64, "setNumberOfLines:", 0);
  v31 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v32 = -[NSBundle localizedStringForKey:value:table:](v31, "localizedStringForKey:value:table:", CFSTR("APPLEID_WHAT_IS"), &stru_100284738, CFSTR("Localizable"));
  objc_msgSend(v64, "setText:", v32);

  v33 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:](UIFontDescriptor, "preferredFontDescriptorWithTextStyle:", UIFontTextStyleTitle3);
  v34 = -[UIFontDescriptor fontDescriptorWithSymbolicTraits:](v33, "fontDescriptorWithSymbolicTraits:", 2);
  v35 = +[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v34, 0.0);
  objc_msgSend(v64, "setFont:", v35);

  v36 = +[UIColor labelColor](UIColor, "labelColor");
  objc_msgSend(v64, "setTextColor:", v36);

  location = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  objc_msgSend(location, "setNumberOfLines:", 0);
  v37 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v38 = -[NSBundle localizedStringForKey:value:table:](v37, "localizedStringForKey:value:table:", CFSTR("APPLEID_WHAT_IS_DETAIL"), &stru_100284738, CFSTR("Localizable"));
  objc_msgSend(location, "setText:", v38);

  v39 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:](UIFontDescriptor, "preferredFontDescriptorWithTextStyle:", UIFontTextStyleBody);
  v40 = +[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v39, 0.0);
  objc_msgSend(location, "setFont:", v40);

  v41 = +[UIColor labelColor](UIColor, "labelColor");
  objc_msgSend(location, "setTextColor:", v41);

  v42 = objc_msgSend(v73, "serviceHeaderView");
  objc_msgSend(v42, "addArrangedSubview:", v64);

  v43 = objc_msgSend(v73, "serviceHeaderView");
  objc_msgSend(v43, "setCustomSpacing:afterView:", v64, 10.0);

  v44 = objc_msgSend(v73, "serviceHeaderView");
  objc_msgSend(v44, "addArrangedSubview:", location);

  v45 = objc_msgSend(v73, "serviceHeaderView");
  v47 = BFFIsiPad(v45, v46);
  v48 = 39.0;
  if ((v47 & 1) == 0)
    v48 = 30.0;
  objc_msgSend(v45, "setCustomSpacing:afterView:", location, v48);

  v49 = objc_msgSend(v73, "serviceHeaderView");
  v50 = objc_opt_new(UIView);
  objc_msgSend(v49, "addArrangedSubview:", v50);

  LODWORD(v51) = 1148846080;
  objc_msgSend(v64, "setContentCompressionResistancePriority:forAxis:", 1, v51);
  LODWORD(v52) = 1148846080;
  objc_msgSend(location, "setContentCompressionResistancePriority:forAxis:", 1, v52);
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v64, 0);
  objc_storeStrong(&v71, 0);
  objc_storeStrong((id *)&v70, 0);
}

- (void)_skipPressed:(id)a3
{
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  BuddyNetworkProvider *v6;
  unsigned __int8 v7;
  id v8;
  id v9;
  id v10;
  id v11;
  NSBundle *v12;
  NSBundle *v13;
  NSString *v14;
  id v15;
  NSBundle *v16;
  NSString *v17;
  UIAlertAction *v18;
  id v19;
  NSBundle *v20;
  NSString *v21;
  UIAlertAction *v22;
  BuddyCombinedTermsProvider *v23;
  BFFFlowItemDelegate *v24;
  void **v25;
  int v26;
  int v27;
  void (*v28)(NSObject *, void *);
  void *v29;
  BuddyAppleIDChoiceController *v30;
  void **v31;
  int v32;
  int v33;
  void (*v34)(NSObject *, void *);
  void *v35;
  BuddyAppleIDChoiceController *v36;
  id v37;
  id v38;
  id v39;
  uint8_t buf[15];
  os_log_type_t v41;
  id v42;
  id location[2];
  BuddyAppleIDChoiceController *v44;

  v44 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v42 = (id)_BYLoggingFacility(v3);
  v41 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v42, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v42;
    v5 = v41;
    sub_100038C3C(buf);
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "User specified skip Apple ID setup", buf, 2u);
  }
  objc_storeStrong(&v42, 0);
  v6 = -[BuddyAppleIDChoiceController networkProvider](v44, "networkProvider");
  v7 = -[BuddyNetworkProvider networkReachable](v6, "networkReachable");

  if ((v7 & 1) != 0)
  {
    v39 = CFSTR("NO_ACCOUNT_SKIP_APPLEID_ALERT_BODY_STOCKHOLM");
    v8 = +[SSAccountStore defaultStore](SSAccountStore, "defaultStore");
    v9 = objc_msgSend(v8, "activeAccount");
    v10 = objc_msgSend(v9, "accountName");
    v11 = objc_msgSend(v10, "length");

    if (v11)
      objc_storeStrong(&v39, CFSTR("HAS_STORE_ACCOUNT_SKIP_APPLEID_ALERT_BODY_STOCKHOLM"));
    v12 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v38 = -[NSBundle localizedStringForKey:value:table:](v12, "localizedStringForKey:value:table:", v39, &stru_100284738, CFSTR("Localizable"));

    v13 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v14 = -[NSBundle localizedStringForKey:value:table:](v13, "localizedStringForKey:value:table:", CFSTR("NO_ACCOUNT_SKIP_APPLEID_ALERT_TITLE"), &stru_100284738, CFSTR("Localizable"));
    v37 = +[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v14, v38, 1);

    v15 = v37;
    v16 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v17 = -[NSBundle localizedStringForKey:value:table:](v16, "localizedStringForKey:value:table:", CFSTR("DONT_USE"), &stru_100284738, CFSTR("Localizable"));
    v31 = _NSConcreteStackBlock;
    v32 = -1073741824;
    v33 = 0;
    v34 = sub_1000DB490;
    v35 = &unk_100280A28;
    v36 = v44;
    v18 = +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v17, 0, &v31);
    objc_msgSend(v15, "addAction:", v18);

    v19 = v37;
    v20 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v21 = -[NSBundle localizedStringForKey:value:table:](v20, "localizedStringForKey:value:table:", CFSTR("DONT_SKIP_APPLEID"), &stru_100284738, CFSTR("Localizable"));
    v25 = _NSConcreteStackBlock;
    v26 = -1073741824;
    v27 = 0;
    v28 = sub_1000DB568;
    v29 = &unk_100280A28;
    v30 = v44;
    v22 = +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v21, 1, &v25);
    objc_msgSend(v19, "addAction:", v22);

    -[BuddyAppleIDChoiceController presentViewController:animated:completion:](v44, "presentViewController:animated:completion:", v37, 1, 0);
    v23 = -[BuddyAppleIDChoiceController combinedTermsProvider](v44, "combinedTermsProvider");
    -[BuddyCombinedTermsProvider prefetchTerms](v23, "prefetchTerms");

    objc_storeStrong((id *)&v30, 0);
    objc_storeStrong((id *)&v36, 0);
    objc_storeStrong(&v37, 0);
    objc_storeStrong(&v38, 0);
    objc_storeStrong(&v39, 0);
  }
  else
  {
    v24 = -[BuddyAppleIDChoiceController delegate](v44, "delegate");
    -[BFFFlowItemDelegate flowItemDone:](v24, "flowItemDone:", v44);

  }
  objc_storeStrong(location, 0);
}

- (void)_reallySkip
{
  id v2;
  id v3;
  BYFlowSkipController *v4;
  BYPaneFeatureAnalyticsManager *v5;
  BFFFlowItemDelegate *v6;

  v2 = +[BuddyAccountTools sharedBuddyAccountTools](BuddyAccountTools, "sharedBuddyAccountTools", a2);
  objc_msgSend(v2, "primaryAccountIsChildAccount:", 0);

  v3 = +[BuddyAccountTools sharedBuddyAccountTools](BuddyAccountTools, "sharedBuddyAccountTools");
  objc_msgSend(v3, "getConfigurationInfoWithCompletion:", 0);

  v4 = -[BuddyAppleIDChoiceController flowSkipController](self, "flowSkipController");
  -[BYFlowSkipController didSkipFlow:](v4, "didSkipFlow:", BYFlowSkipIdentifierAppleID);

  v5 = -[BuddyAppleIDChoiceController paneFeatureAnalyticsManager](self, "paneFeatureAnalyticsManager");
  -[BYPaneFeatureAnalyticsManager recordActionWithValue:forFeature:](v5, "recordActionWithValue:forFeature:", &__kCFBooleanFalse, 14);

  v6 = -[BuddyAppleIDChoiceController delegate](self, "delegate");
  -[BFFFlowItemDelegate flowItemDone:](v6, "flowItemDone:", self);

}

+ (id)cloudConfigSkipKey
{
  return kMCCCSkipSetupAppleID;
}

+ (unint64_t)applicableDispositions
{
  return 12;
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  BuddyAppleIDController *v3;
  BYPasscodeCacheManager *v4;
  BYAnalyticsManager *v5;
  BYRunState *v6;
  id v7;
  BuddyAppleIDController *v8;
  BFFFlowItemDelegate *v9;
  ProximitySetupController *v10;
  unsigned __int8 v11;
  BuddyNetworkProvider *v12;
  id v13;
  void **v14;
  int v15;
  int v16;
  void (*v17)(uint64_t, void *);
  void *v18;
  BuddyAppleIDChoiceController *v19;
  id v20;
  id location[2];
  BuddyAppleIDChoiceController *v22;

  v22 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = [BuddyAppleIDController alloc];
  v4 = -[BuddyAppleIDChoiceController passcodeCacheManager](v22, "passcodeCacheManager");
  v5 = -[BuddyAppleIDChoiceController analyticsManager](v22, "analyticsManager");
  v6 = -[BuddyAppleIDChoiceController runState](v22, "runState");
  v7 = +[BuddyFeatureFlags currentFlags](BuddyFeatureFlags, "currentFlags");
  v8 = -[BuddyAppleIDController initWithAccount:passcodeCacheManager:analyticsManager:runState:featureFlags:](v3, "initWithAccount:passcodeCacheManager:analyticsManager:runState:featureFlags:", 0, v4, v5, v6, v7);
  -[BuddyAppleIDChoiceController setAppleIDController:](v22, "setAppleIDController:", v8);

  -[BuddyAppleIDController setDelegate:](v22->_appleIDController, "setDelegate:", v22);
  v9 = -[BuddyAppleIDChoiceController delegate](v22, "delegate");
  -[BuddyAppleIDController setFlowItemDelegate:](v22->_appleIDController, "setFlowItemDelegate:", v9);

  v10 = -[BuddyAppleIDChoiceController proximitySetupController](v22, "proximitySetupController");
  v11 = -[ProximitySetupController hasConnection](v10, "hasConnection");
  -[BuddyAppleIDController setHasProximityConnection:](v22->_appleIDController, "setHasProximityConnection:", v11 & 1);

  v12 = -[BuddyAppleIDChoiceController networkProvider](v22, "networkProvider");
  LOBYTE(v8) = -[BuddyNetworkProvider networkReachable](v12, "networkReachable");

  if ((v8 & 1) != 0)
  {
    v13 = +[BuddyAppleIDConfigurationManager sharedManager](BuddyAppleIDConfigurationManager, "sharedManager");
    v14 = _NSConcreteStackBlock;
    v15 = -1073741824;
    v16 = 0;
    v17 = sub_1000DBA74;
    v18 = &unk_1002827F8;
    v19 = v22;
    v20 = location[0];
    objc_msgSend(v13, "getURLConfigurationWithHandler:", &v14);

    objc_storeStrong(&v20, 0);
    objc_storeStrong((id *)&v19, 0);
  }
  else if (location[0])
  {
    (*((void (**)(id, uint64_t))location[0] + 2))(location[0], 1);
  }
  objc_storeStrong(location, 0);
}

- (void)startOver
{
  self->_didShowWifiAlert = 0;
}

- (BOOL)shouldAllowStartOver
{
  BuddyAppleIDController *v2;
  char v3;

  v2 = -[BuddyAppleIDChoiceController appleIDController](self, "appleIDController");
  v3 = !-[BuddyAppleIDController shouldAllowStartOver](v2, "shouldAllowStartOver");

  return (v3 & 1) == 0;
}

- (BOOL)controllerAllowsNavigatingBack
{
  return -[BuddyAppleIDChoiceController allowBack](self, "allowBack", a2, self);
}

- (void)setDelegate:(id)a3
{
  id v3;
  BuddyAppleIDController *v4;
  id location[2];
  BuddyAppleIDChoiceController *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeWeak((id *)&v6->_delegate, location[0]);
  v3 = location[0];
  v4 = -[BuddyAppleIDChoiceController appleIDController](v6, "appleIDController");
  -[BuddyAppleIDController setFlowItemDelegate:](v4, "setFlowItemDelegate:", v3);

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
  int64_t v6;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = 0;
  if (a4)
  {
    if (a4 == 1)
      v6 = 1;
  }
  else
  {
    v6 = 3;
  }
  objc_storeStrong(location, 0);
  return v6;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5;
  UITableViewCell *v6;
  BOOL v7;
  BuddySetupTableViewCell *v8;
  NSBundle *v9;
  NSString *v10;
  UITableViewCell *v11;
  UILabel *v12;
  UITableViewCell *v13;
  id v14;
  UITableViewCell *v15;
  BOOL v16;
  BuddySetupTableViewCell *v17;
  NSBundle *v18;
  NSString *v19;
  UITableViewCell *v20;
  UILabel *v21;
  UITableViewCell *v22;
  id v23;
  UITableViewCell *v24;
  BOOL v25;
  BuddySetupTableViewCell *v26;
  NSBundle *v27;
  NSString *v28;
  UITableViewCell *v29;
  UILabel *v30;
  UITableViewCell *v31;
  id v32;
  UIColor *v33;
  id v34;
  id v35;
  UIColor *v36;
  unint64_t v37;
  id v38;
  id v40;
  id v41;
  id v42;
  char *v43;
  id v44;
  id v45;
  unint64_t i;
  id v47;
  uint64_t v48;
  int v49;
  id v50;
  id v51;
  id v52;
  id location[2];
  BuddyAppleIDChoiceController *v54;
  id v55;

  v54 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v52 = 0;
  objc_storeStrong(&v52, a4);
  v51 = objc_msgSend(v52, "row");
  v5 = objc_msgSend(v52, "section");
  if (v5)
  {
    if (v5 == (id)1)
    {
      v48 = 1;
      v34 = +[BYDevice currentDevice](BYDevice, "currentDevice");
      v35 = objc_msgSend(v34, "type");

      if (v35 == (id)1)
        v48 = 2;
      v47 = objc_msgSend(location[0], "dequeueReusableCellWithIdentifier:", CFSTR("CELL"));
      if (!v47)
      {
        v47 = -[BuddyAppleIDTableCell initWithStyle:reuseIdentifier:columnCount:]([BuddyAppleIDTableCell alloc], "initWithStyle:reuseIdentifier:columnCount:", 0, CFSTR("CELL"), v48);

        v36 = +[UIColor clearColor](UIColor, "clearColor");
        objc_msgSend(v47, "setBackgroundColor:", v36);

        for (i = 0; ; ++i)
        {
          v37 = i;
          if (v37 >= -[NSArray count](v54->_itemIcons, "count"))
            break;
          v45 = -[NSArray objectAtIndexedSubscript:](v54->_itemIcons, "objectAtIndexedSubscript:", i);
          v44 = -[NSArray objectAtIndexedSubscript:](v54->_itemDescriptions, "objectAtIndexedSubscript:", i);
          v38 = objc_msgSend(v47, "addService:description:", v45, v44);
          objc_storeStrong(&v44, 0);
          objc_storeStrong(&v45, 0);
        }
        if (v48 == 2 && (-[NSArray count](v54->_itemIcons, "count") & 1) != 0)
        {
          v43 = 0;
          v43 = (char *)-[NSArray count](v54->_itemIcons, "count") - 1;
          v42 = -[NSArray objectAtIndexedSubscript:](v54->_itemIcons, "objectAtIndexedSubscript:", v43);
          v41 = -[NSArray objectAtIndexedSubscript:](v54->_itemDescriptions, "objectAtIndexedSubscript:", v43);
          v40 = objc_msgSend(v47, "addService:description:", v42, v41);
          objc_msgSend(v40, "setAlpha:", 0.0);
          objc_storeStrong(&v40, 0);
          objc_storeStrong(&v41, 0);
          objc_storeStrong(&v42, 0);
        }
      }
      v55 = v47;
      v49 = 1;
      objc_storeStrong(&v47, 0);
    }
    else
    {
      v49 = 0;
    }
  }
  else
  {
    v50 = 0;
    if (v51)
    {
      if (v51 == (id)1)
      {
        v15 = -[BuddyAppleIDChoiceController createNewCell](v54, "createNewCell");
        v16 = v15 == 0;

        if (v16)
        {
          v17 = -[BuddySetupTableViewCell initWithStyle:reuseIdentifier:]([BuddySetupTableViewCell alloc], "initWithStyle:reuseIdentifier:", 0, 0);
          -[BuddyAppleIDChoiceController setCreateNewCell:](v54, "setCreateNewCell:", v17);

          v18 = +[NSBundle mainBundle](NSBundle, "mainBundle");
          v19 = -[NSBundle localizedStringForKey:value:table:](v18, "localizedStringForKey:value:table:", CFSTR("CREATE_NEW_APPLEID"), &stru_100284738, CFSTR("Localizable"));
          v20 = -[BuddyAppleIDChoiceController createNewCell](v54, "createNewCell");
          v21 = -[UITableViewCell textLabel](v20, "textLabel");
          -[UILabel setText:](v21, "setText:", v19);

        }
        v22 = -[BuddyAppleIDChoiceController createNewCell](v54, "createNewCell");
        v23 = v50;
        v50 = v22;

      }
      else if (v51 == (id)2)
      {
        v24 = -[BuddyAppleIDChoiceController skipCell](v54, "skipCell");
        v25 = v24 == 0;

        if (v25)
        {
          v26 = -[BuddySetupTableViewCell initWithStyle:reuseIdentifier:]([BuddySetupTableViewCell alloc], "initWithStyle:reuseIdentifier:", 0, 0);
          -[BuddyAppleIDChoiceController setSkipCell:](v54, "setSkipCell:", v26);

          v27 = +[NSBundle mainBundle](NSBundle, "mainBundle");
          v28 = -[NSBundle localizedStringForKey:value:table:](v27, "localizedStringForKey:value:table:", CFSTR("SKIP_ENTER_APPLEID"), &stru_100284738, CFSTR("Localizable"));
          v29 = -[BuddyAppleIDChoiceController skipCell](v54, "skipCell");
          v30 = -[UITableViewCell textLabel](v29, "textLabel");
          -[UILabel setText:](v30, "setText:", v28);

        }
        v31 = -[BuddyAppleIDChoiceController skipCell](v54, "skipCell");
        v32 = v50;
        v50 = v31;

      }
    }
    else
    {
      v6 = -[BuddyAppleIDChoiceController forgotCell](v54, "forgotCell");
      v7 = v6 == 0;

      if (v7)
      {
        v8 = -[BuddySetupTableViewCell initWithStyle:reuseIdentifier:]([BuddySetupTableViewCell alloc], "initWithStyle:reuseIdentifier:", 0, 0);
        -[BuddyAppleIDChoiceController setForgotCell:](v54, "setForgotCell:", v8);

        v9 = +[NSBundle mainBundle](NSBundle, "mainBundle");
        v10 = -[NSBundle localizedStringForKey:value:table:](v9, "localizedStringForKey:value:table:", CFSTR("FORGOT_PASSWORD"), &stru_100284738, CFSTR("Localizable"));
        v11 = -[BuddyAppleIDChoiceController forgotCell](v54, "forgotCell");
        v12 = -[UITableViewCell textLabel](v11, "textLabel");
        -[UILabel setText:](v12, "setText:", v10);

      }
      v13 = -[BuddyAppleIDChoiceController forgotCell](v54, "forgotCell");
      v14 = v50;
      v50 = v13;

    }
    v33 = +[UIColor secondarySystemBackgroundColor](UIColor, "secondarySystemBackgroundColor");
    objc_msgSend(v50, "setBackgroundColor:", v33);

    v55 = v50;
    v49 = 1;
    objc_storeStrong(&v50, 0);
  }
  objc_storeStrong(&v52, 0);
  objc_storeStrong(location, 0);
  return v55;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v7;
  id v8;
  id v9;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v9 = 0;
  objc_storeStrong(&v9, a4);
  v8 = 0;
  objc_storeStrong(&v8, a5);
  if (objc_msgSend(v8, "section") == (id)1)
  {
    objc_msgSend(v9, "setSeparatorStyle:", 0);
  }
  else
  {
    objc_msgSend(v9, "setSeparatorStyle:", 1);
    objc_msgSend(v9, "_setShouldHaveFullLengthTopSeparator:", 0);
    objc_msgSend(v9, "_setShouldHaveFullLengthBottomSeparator:", 0);
  }
  if (objc_msgSend(v8, "section") == (id)1)
  {
    v7 = objc_msgSend(v9, "layer");
    objc_msgSend(v7, "setMasksToBounds:", 0);

  }
  objc_storeStrong(&v8, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v5;
  id v6;
  double v7;
  double v8;
  double v10;
  id v11;
  id location[2];
  BuddyAppleIDChoiceController *v13;

  v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v11 = 0;
  objc_storeStrong(&v11, a4);
  v10 = 0.0;
  v5 = objc_msgSend(v11, "section");
  if (v5)
  {
    if (v5 == (id)1)
      v10 = UITableViewAutomaticDimension;
  }
  else
  {
    v10 = 60.0;
    v6 = -[BuddyAppleIDChoiceController tableView:cellForRowAtIndexPath:](v13, "tableView:cellForRowAtIndexPath:", location[0], v11);
    objc_msgSend(v6, "systemLayoutSizeFittingSize:", UILayoutFittingCompressedSize.width, UILayoutFittingCompressedSize.height);
    v8 = v7;

    if (v8 > 60.0)
      v10 = UITableViewAutomaticDimension;
  }
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
  return v10;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5;
  AASetupAssistantConfigResponse *v6;
  unsigned __int8 v7;
  BuddyAppleIDController *v8;
  NSBundle *v9;
  NSString *v10;
  NSBundle *v11;
  NSString *v12;
  NSBundle *v13;
  NSString *v14;
  UIAlertAction *v15;
  AASetupAssistantConfigResponse *v16;
  unsigned __int8 v17;
  BuddyAppleIDController *v18;
  NSBundle *v19;
  NSString *v20;
  NSBundle *v21;
  NSString *v22;
  NSBundle *v23;
  NSString *v24;
  UIAlertAction *v25;
  id v26;
  id v27;
  int v28;
  id v29;
  id location[2];
  BuddyAppleIDChoiceController *v31;

  v31 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v29 = 0;
  objc_storeStrong(&v29, a4);
  if (objc_msgSend(v29, "section"))
  {
    v28 = 1;
  }
  else
  {
    v5 = objc_msgSend(v29, "row");
    if (v5)
    {
      if (v5 == (id)1)
      {
        v16 = -[BuddyAppleIDChoiceController urlConfiguration](v31, "urlConfiguration");
        v17 = -[AASetupAssistantConfigResponse setupAssistantServerEnabled](v16, "setupAssistantServerEnabled");

        if ((v17 & 1) != 0)
        {
          v18 = -[BuddyAppleIDChoiceController appleIDController](v31, "appleIDController");
          -[BuddyAppleIDController showCreateAppleID](v18, "showCreateAppleID");

        }
        else
        {
          v19 = +[NSBundle mainBundle](NSBundle, "mainBundle");
          v20 = -[NSBundle localizedStringForKey:value:table:](v19, "localizedStringForKey:value:table:", CFSTR("CANT_CREATE_APPLEID_TITLE"), &stru_100284738, CFSTR("Localizable"));
          v21 = +[NSBundle mainBundle](NSBundle, "mainBundle");
          v22 = -[NSBundle localizedStringForKey:value:table:](v21, "localizedStringForKey:value:table:", CFSTR("CANT_CREATE_APPLEID"), &stru_100284738, CFSTR("Localizable"));
          v26 = +[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v20, v22, 1);

          v23 = +[NSBundle mainBundle](NSBundle, "mainBundle");
          v24 = -[NSBundle localizedStringForKey:value:table:](v23, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_100284738, CFSTR("Localizable"));
          v25 = +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v24, 0, 0);
          objc_msgSend(v26, "addAction:", v25);

          -[BuddyAppleIDChoiceController presentViewController:animated:completion:](v31, "presentViewController:animated:completion:", v26, 1, 0);
          objc_storeStrong(&v26, 0);
        }
      }
      else if (v5 == (id)2)
      {
        -[BuddyAppleIDChoiceController _skipPressed:](v31, "_skipPressed:", 0);
        objc_msgSend(location[0], "deselectRowAtIndexPath:animated:", v29, 1);
      }
    }
    else
    {
      v6 = -[BuddyAppleIDChoiceController urlConfiguration](v31, "urlConfiguration");
      v7 = -[AASetupAssistantConfigResponse setupAssistantServerEnabled](v6, "setupAssistantServerEnabled");

      if ((v7 & 1) != 0)
      {
        v8 = -[BuddyAppleIDChoiceController appleIDController](v31, "appleIDController");
        -[BuddyAppleIDController showCredentialRecovery](v8, "showCredentialRecovery");

      }
      else
      {
        v9 = +[NSBundle mainBundle](NSBundle, "mainBundle");
        v10 = -[NSBundle localizedStringForKey:value:table:](v9, "localizedStringForKey:value:table:", CFSTR("CANT_LOGIN_APPLEID_GENERIC_TITLE"), &stru_100284738, CFSTR("Localizable"));
        v11 = +[NSBundle mainBundle](NSBundle, "mainBundle");
        v12 = -[NSBundle localizedStringForKey:value:table:](v11, "localizedStringForKey:value:table:", CFSTR("CANT_LOGIN_APPLEID_UNKNOWN_ERROR"), &stru_100284738, CFSTR("Localizable"));
        v27 = +[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v10, v12, 1);

        v13 = +[NSBundle mainBundle](NSBundle, "mainBundle");
        v14 = -[NSBundle localizedStringForKey:value:table:](v13, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_100284738, CFSTR("Localizable"));
        v15 = +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v14, 0, 0);
        objc_msgSend(v27, "addAction:", v15);

        -[BuddyAppleIDChoiceController presentViewController:animated:completion:](v31, "presentViewController:animated:completion:", v27, 1, 0);
        objc_storeStrong(&v27, 0);
      }
    }
    v28 = 0;
  }
  objc_storeStrong(&v29, 0);
  objc_storeStrong(location, 0);
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  UIStackView *v5;
  id v6;
  id v7;
  id v9[2];
  id location[2];
  BuddyAppleIDChoiceController *v11;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v9[1] = (id)a4;
  v9[0] = 0;
  if (a4 == 1)
  {
    v5 = -[BuddyAppleIDChoiceController serviceHeaderView](v11, "serviceHeaderView");
    v6 = v9[0];
    v9[0] = v5;

  }
  v7 = v9[0];
  objc_storeStrong(v9, 0);
  objc_storeStrong(location, 0);
  return v7;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  UIStackView *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v12;
  id location[2];
  BuddyAppleIDChoiceController *v14;

  v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v12 = 0.0;
  if (a4 == 1)
  {
    v5 = -[BuddyAppleIDChoiceController serviceHeaderView](v14, "serviceHeaderView");
    objc_msgSend(location[0], "bounds");
    objc_msgSend(location[0], "layoutMargins");
    objc_msgSend(location[0], "layoutMargins");
    sub_1000DCCDC();
    LODWORD(v6) = 1148846080;
    LODWORD(v7) = 1112014848;
    -[UIStackView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](v5, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v8, v9, v6, v7);
    v12 = v10;

  }
  objc_storeStrong(location, 0);
  return v12;
}

- (int64_t)tableView:(id)a3 titleAlignmentForFooterInSection:(int64_t)a4
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
  return 4;
}

- (void)appleIDControllerFinished:(id)a3
{
  BYPreferencesController *v3;
  BYPaneFeatureAnalyticsManager *v4;
  BFFFlowItemDelegate *v5;
  id location[2];
  BuddyAppleIDChoiceController *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[BuddyAppleIDChoiceController setAllowBack:](v7, "setAllowBack:", 0);
  v3 = -[BuddyAppleIDChoiceController buddyPreferences](v7, "buddyPreferences");
  -[BYPreferencesController setObject:forKey:](v3, "setObject:forKey:", &__kCFBooleanTrue, CFSTR("AppleIDPB10Presented"));

  v4 = -[BuddyAppleIDChoiceController paneFeatureAnalyticsManager](v7, "paneFeatureAnalyticsManager");
  -[BYPaneFeatureAnalyticsManager recordActionWithValue:forFeature:](v4, "recordActionWithValue:forFeature:", &__kCFBooleanTrue, 14);

  v5 = -[BuddyAppleIDChoiceController delegate](v7, "delegate");
  -[BFFFlowItemDelegate flowItemDone:](v5, "flowItemDone:", v7);

  objc_storeStrong(location, 0);
}

- (void)appleIDController:(id)a3 failedWithError:(id)a4
{
  id v5;
  id v6;
  id v7;
  id location[2];
  BuddyAppleIDChoiceController *v9;

  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7 = 0;
  objc_storeStrong(&v7, a4);
  v5 = -[BuddyAppleIDChoiceController navigationController](v9, "navigationController");
  v6 = objc_msgSend(v5, "popToViewController:animated:", v9, 1);

  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

- (BFFFlowItemDelegate)delegate
{
  return (BFFFlowItemDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BuddyNetworkProvider)networkProvider
{
  return self->_networkProvider;
}

- (void)setNetworkProvider:(id)a3
{
  objc_storeStrong((id *)&self->_networkProvider, a3);
}

- (id)showModalWiFiSettingsBlock
{
  return self->_showModalWiFiSettingsBlock;
}

- (void)setShowModalWiFiSettingsBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BYPreferencesController)buddyPreferences
{
  return self->_buddyPreferences;
}

- (void)setBuddyPreferences:(id)a3
{
  objc_storeStrong((id *)&self->_buddyPreferences, a3);
}

- (BYPasscodeCacheManager)passcodeCacheManager
{
  return self->_passcodeCacheManager;
}

- (void)setPasscodeCacheManager:(id)a3
{
  objc_storeStrong((id *)&self->_passcodeCacheManager, a3);
}

- (BuddyCombinedTermsProvider)combinedTermsProvider
{
  return self->_combinedTermsProvider;
}

- (void)setCombinedTermsProvider:(id)a3
{
  objc_storeStrong((id *)&self->_combinedTermsProvider, a3);
}

- (BYAnalyticsManager)analyticsManager
{
  return self->_analyticsManager;
}

- (void)setAnalyticsManager:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsManager, a3);
}

- (BYFlowSkipController)flowSkipController
{
  return self->_flowSkipController;
}

- (void)setFlowSkipController:(id)a3
{
  objc_storeStrong((id *)&self->_flowSkipController, a3);
}

- (BYRunState)runState
{
  return self->_runState;
}

- (void)setRunState:(id)a3
{
  objc_storeStrong((id *)&self->_runState, a3);
}

- (ProximitySetupController)proximitySetupController
{
  return self->_proximitySetupController;
}

- (void)setProximitySetupController:(id)a3
{
  objc_storeStrong((id *)&self->_proximitySetupController, a3);
}

- (BYPaneFeatureAnalyticsManager)paneFeatureAnalyticsManager
{
  return self->_paneFeatureAnalyticsManager;
}

- (void)setPaneFeatureAnalyticsManager:(id)a3
{
  objc_storeStrong((id *)&self->_paneFeatureAnalyticsManager, a3);
}

- (UITableViewCell)forgotCell
{
  return self->_forgotCell;
}

- (void)setForgotCell:(id)a3
{
  objc_storeStrong((id *)&self->_forgotCell, a3);
}

- (UITableViewCell)createNewCell
{
  return self->_createNewCell;
}

- (void)setCreateNewCell:(id)a3
{
  objc_storeStrong((id *)&self->_createNewCell, a3);
}

- (UITableViewCell)skipCell
{
  return self->_skipCell;
}

- (void)setSkipCell:(id)a3
{
  objc_storeStrong((id *)&self->_skipCell, a3);
}

- (NSArray)itemIcons
{
  return self->_itemIcons;
}

- (void)setItemIcons:(id)a3
{
  objc_storeStrong((id *)&self->_itemIcons, a3);
}

- (NSArray)itemDescriptions
{
  return self->_itemDescriptions;
}

- (void)setItemDescriptions:(id)a3
{
  objc_storeStrong((id *)&self->_itemDescriptions, a3);
}

- (UIStackView)serviceHeaderView
{
  return self->_serviceHeaderView;
}

- (void)setServiceHeaderView:(id)a3
{
  objc_storeStrong((id *)&self->_serviceHeaderView, a3);
}

- (BuddyAppleIDController)appleIDController
{
  return self->_appleIDController;
}

- (void)setAppleIDController:(id)a3
{
  objc_storeStrong((id *)&self->_appleIDController, a3);
}

- (BOOL)allowBack
{
  return self->_allowBack;
}

- (void)setAllowBack:(BOOL)a3
{
  self->_allowBack = a3;
}

- (BOOL)didShowWifiAlert
{
  return self->_didShowWifiAlert;
}

- (void)setDidShowWifiAlert:(BOOL)a3
{
  self->_didShowWifiAlert = a3;
}

- (BOOL)shouldShowWifiIfCancellingSkipAlert
{
  return self->_shouldShowWifiIfCancellingSkipAlert;
}

- (void)setShouldShowWifiIfCancellingSkipAlert:(BOOL)a3
{
  self->_shouldShowWifiIfCancellingSkipAlert = a3;
}

- (AASetupAssistantConfigResponse)urlConfiguration
{
  return self->_urlConfiguration;
}

- (void)setUrlConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_urlConfiguration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlConfiguration, 0);
  objc_storeStrong((id *)&self->_appleIDController, 0);
  objc_storeStrong((id *)&self->_serviceHeaderView, 0);
  objc_storeStrong((id *)&self->_itemDescriptions, 0);
  objc_storeStrong((id *)&self->_itemIcons, 0);
  objc_storeStrong((id *)&self->_skipCell, 0);
  objc_storeStrong((id *)&self->_createNewCell, 0);
  objc_storeStrong((id *)&self->_forgotCell, 0);
  objc_storeStrong((id *)&self->_paneFeatureAnalyticsManager, 0);
  objc_storeStrong((id *)&self->_proximitySetupController, 0);
  objc_storeStrong((id *)&self->_runState, 0);
  objc_storeStrong((id *)&self->_flowSkipController, 0);
  objc_storeStrong((id *)&self->_analyticsManager, 0);
  objc_storeStrong((id *)&self->_combinedTermsProvider, 0);
  objc_storeStrong((id *)&self->_passcodeCacheManager, 0);
  objc_storeStrong((id *)&self->_buddyPreferences, 0);
  objc_storeStrong(&self->_showModalWiFiSettingsBlock, 0);
  objc_storeStrong((id *)&self->_networkProvider, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
