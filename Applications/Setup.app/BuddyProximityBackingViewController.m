@implementation BuddyProximityBackingViewController

- (BuddyProximityBackingViewController)initWithStringProvider:(id)a3
{
  id v3;
  id v4;
  void *v5;
  BuddyProximityBackingViewController *v6;
  objc_super v8;
  id location[2];
  id v10;

  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v10;
  v10 = 0;
  v8.receiver = v3;
  v8.super_class = (Class)BuddyProximityBackingViewController;
  v10 = -[BuddyProximityBackingViewController initWithTitle:detailText:icon:](&v8, "initWithTitle:detailText:icon:", &stru_100284738, 0, 0);
  objc_storeStrong(&v10, v10);
  if (v10)
  {
    objc_storeStrong((id *)v10 + 10, location[0]);
    *((_BYTE *)v10 + 9) = 1;
    v4 = objc_alloc_init((Class)BrightnessSystemClient);
    v5 = (void *)*((_QWORD *)v10 + 11);
    *((_QWORD *)v10 + 11) = v4;

  }
  v6 = (BuddyProximityBackingViewController *)v10;
  objc_storeStrong(location, 0);
  objc_storeStrong(&v10, 0);
  return v6;
}

- (BuddyProximityBackingViewControllerDelegate)delegate
{
  id WeakRetained;
  uint64_t v3;
  objc_class *v4;
  id location;
  os_log_type_t v7;
  os_log_t oslog[2];
  BuddyProximityBackingViewController *v9;
  uint8_t buf[24];

  v9 = self;
  oslog[1] = (os_log_t)a2;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (!WeakRetained)
  {
    oslog[0] = (os_log_t)(id)_BYLoggingFacility(v3);
    v7 = OS_LOG_TYPE_FAULT;
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_FAULT))
    {
      v4 = (objc_class *)objc_opt_class(v9);
      location = NSStringFromClass(v4);
      sub_100039500((uint64_t)buf, (uint64_t)location);
      _os_log_fault_impl((void *)&_mh_execute_header, oslog[0], v7, "%{public}@ failed to receive a delegate", buf, 0xCu);

      objc_storeStrong(&location, 0);
    }
    objc_storeStrong((id *)oslog, 0);
  }
  return (BuddyProximityBackingViewControllerDelegate *)objc_loadWeakRetained((id *)&v9->_delegate);
}

- (void)viewDidLoad
{
  id v2;
  BFFProximityVisualPairingViewController *v3;
  BFFProximityVisualPairingViewController *v4;
  id v5;
  id v6;
  UILabel *v7;
  id v8;
  UILabel *v9;
  id v10;
  UILabel *v11;
  UIFont *v12;
  UILabel *v13;
  UILabel *v14;
  UILabel *v15;
  UILabel *v16;
  double v17;
  BuddyProximityBackingStringProviding *v18;
  NSString *v19;
  id v20;
  id v21;
  UIView *v22;
  id v23;
  UIView *v24;
  BuddyProximityBackingViewController *v25;
  UIView *v26;
  void **v27;
  int v28;
  int v29;
  id (*v30)(id *, void *, id);
  void *v31;
  id v32[3];
  id from;
  id location;
  objc_super v35;
  SEL v36;
  BuddyProximityBackingViewController *v37;

  v37 = self;
  v36 = a2;
  v35.receiver = self;
  v35.super_class = (Class)BuddyProximityBackingViewController;
  -[BuddyProximityBackingViewController viewDidLoad](&v35, "viewDidLoad");
  v2 = -[BuddyProximityBackingViewController view](v37, "view");
  objc_msgSend(v2, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v3 = objc_alloc_init(BFFProximityVisualPairingViewController);
  -[BuddyProximityBackingViewController setVisualPairingViewController:](v37, "setVisualPairingViewController:", v3);

  v4 = -[BuddyProximityBackingViewController visualPairingViewController](v37, "visualPairingViewController");
  v5 = -[BFFProximityVisualPairingViewController view](v4, "view");
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v6 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  -[BuddyProximityBackingViewController setPinCodeLabel:](v37, "setPinCodeLabel:", v6);

  v7 = -[BuddyProximityBackingViewController pinCodeLabel](v37, "pinCodeLabel");
  -[UILabel setNumberOfLines:](v7, "setNumberOfLines:", 0);

  v8 = +[UIColor _labelColor](UIColor, "_labelColor");
  v9 = -[BuddyProximityBackingViewController pinCodeLabel](v37, "pinCodeLabel");
  -[UILabel setTextColor:](v9, "setTextColor:", v8);

  v10 = +[UIColor _systemBackgroundColor](UIColor, "_systemBackgroundColor");
  v11 = -[BuddyProximityBackingViewController pinCodeLabel](v37, "pinCodeLabel");
  -[UILabel setBackgroundColor:](v11, "setBackgroundColor:", v10);

  v12 = +[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleTitle0);
  v13 = -[BuddyProximityBackingViewController pinCodeLabel](v37, "pinCodeLabel");
  -[UILabel setFont:](v13, "setFont:", v12);

  v14 = -[BuddyProximityBackingViewController pinCodeLabel](v37, "pinCodeLabel");
  -[UILabel setTextAlignment:](v14, "setTextAlignment:", 1);

  v15 = -[BuddyProximityBackingViewController pinCodeLabel](v37, "pinCodeLabel");
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v16 = -[BuddyProximityBackingViewController pinCodeLabel](v37, "pinCodeLabel");
  LODWORD(v17) = 1148846080;
  -[UILabel setContentHuggingPriority:forAxis:](v16, "setContentHuggingPriority:forAxis:", 1, v17);

  if (-[BuddyProximityBackingViewController isShowingVisualPairing](v37, "isShowingVisualPairing")
    && -[BuddyProximityBackingViewController showPairingStyleToggle](v37, "showPairingStyleToggle"))
  {
    location = +[OBLinkTrayButton linkButton](OBLinkTrayButton, "linkButton");
    objc_msgSend(location, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v18 = -[BuddyProximityBackingViewController stringProvider](v37, "stringProvider");
    v19 = -[BuddyProximityBackingViewController language](v37, "language");
    v20 = -[BuddyProximityBackingStringProviding textualPairingButtonTitleWithLanguage:](v18, "textualPairingButtonTitleWithLanguage:", v19);
    objc_msgSend(location, "setTitle:forState:", v20, 0);

    objc_msgSend(location, "addTarget:action:forControlEvents:", v37, "pairingStyleToggleTapped:", 0x2000);
    -[BuddyProximityBackingViewController setPairingStyleToggleButton:](v37, "setPairingStyleToggleButton:", location);
    objc_storeStrong(&location, 0);
  }
  v21 = objc_alloc_init((Class)UIView);
  -[BuddyProximityBackingViewController setContainerView:](v37, "setContainerView:", v21);

  v22 = -[BuddyProximityBackingViewController containerView](v37, "containerView");
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v22, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v23 = +[UIColor _systemBackgroundColor](UIColor, "_systemBackgroundColor");
  v24 = -[BuddyProximityBackingViewController containerView](v37, "containerView");
  -[UIView setBackgroundColor:](v24, "setBackgroundColor:", v23);

  objc_initWeak(&from, v37);
  v25 = v37;
  v26 = -[BuddyProximityBackingViewController containerView](v37, "containerView");
  v27 = _NSConcreteStackBlock;
  v28 = -1073741824;
  v29 = 0;
  v30 = sub_1000CD538;
  v31 = &unk_100282600;
  objc_copyWeak(v32, &from);
  -[BuddyProximityBackingViewController addContentSubView:heightConstraintForLayout:](v25, "addContentSubView:heightConstraintForLayout:", v26, &v27);

  -[BuddyProximityBackingViewController updateView](v37, "updateView");
  objc_destroyWeak(v32);
  objc_destroyWeak(&from);
}

- (void)viewDidLayoutSubviews
{
  BFFProximityVisualPairingViewController *v2;
  objc_super v3;
  SEL v4;
  BuddyProximityBackingViewController *v5;

  v5 = self;
  v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)BuddyProximityBackingViewController;
  -[BuddyProximityBackingViewController viewDidLayoutSubviews](&v3, "viewDidLayoutSubviews");
  if (-[BuddyProximityBackingViewController isShowingVisualPairing](v5, "isShowingVisualPairing"))
  {
    v2 = -[BuddyProximityBackingViewController visualPairingViewController](v5, "visualPairingViewController");
    -[BFFProximityVisualPairingViewController start](v2, "start");

  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  BFFProximityVisualPairingViewController *v3;
  double v4;
  BuddyProximityBackingViewControllerDelegate *v5;
  objc_super v6;
  BOOL v7;
  SEL v8;
  BuddyProximityBackingViewController *v9;

  v9 = self;
  v8 = a2;
  v7 = a3;
  v3 = -[BuddyProximityBackingViewController visualPairingViewController](self, "visualPairingViewController");
  -[BFFProximityVisualPairingViewController stop](v3, "stop");

  LODWORD(v4) = 0;
  -[BuddyProximityBackingViewController setMinimumBrightness:](v9, "setMinimumBrightness:", v4);
  if (!-[BuddyProximityBackingViewController nonUserInitiatedDismissal](v9, "nonUserInitiatedDismissal")
    && (-[BuddyProximityBackingViewController isMovingFromParentViewController](v9, "isMovingFromParentViewController") & 1) != 0)
  {
    v5 = -[BuddyProximityBackingViewController delegate](v9, "delegate");
    -[BuddyProximityBackingViewControllerDelegate pairingEndedByUser](v5, "pairingEndedByUser");

  }
  v6.receiver = v9;
  v6.super_class = (Class)BuddyProximityBackingViewController;
  -[BuddyProximityBackingViewController viewWillDisappear:](&v6, "viewWillDisappear:", v7);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  id v4;
  objc_super v5;
  id location[2];
  BuddyProximityBackingViewController *v7;
  CGSize v8;

  v8 = a3;
  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a4);
  v5.receiver = v7;
  v5.super_class = (Class)BuddyProximityBackingViewController;
  -[BuddyProximityBackingViewController viewWillTransitionToSize:withTransitionCoordinator:](&v5, "viewWillTransitionToSize:withTransitionCoordinator:", location[0], v8.width, v8.height);
  v4 = -[BuddyProximityBackingViewController view](v7, "view");
  objc_msgSend(v4, "setNeedsLayout");

  objc_storeStrong(location, 0);
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v3;
  id location[2];
  BuddyProximityBackingViewController *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)BuddyProximityBackingViewController;
  -[BuddyProximityBackingViewController traitCollectionDidChange:](&v3, "traitCollectionDidChange:", location[0]);
  -[BuddyProximityBackingViewController updateView](v5, "updateView");
  objc_storeStrong(location, 0);
}

- (void)showVisualPairing
{
  BFFProximityVisualPairingViewController *v2;

  -[BuddyProximityBackingViewController setShowingVisualPairing:](self, "setShowingVisualPairing:", 1, a2);
  -[BuddyProximityBackingViewController updateView](self, "updateView");
  v2 = -[BuddyProximityBackingViewController visualPairingViewController](self, "visualPairingViewController");
  -[BFFProximityVisualPairingViewController start](v2, "start");

}

- (void)showPairingCode
{
  BFFProximityVisualPairingViewController *v2;

  -[BuddyProximityBackingViewController setShowingVisualPairing:](self, "setShowingVisualPairing:", 0, a2);
  -[BuddyProximityBackingViewController updateView](self, "updateView");
  v2 = -[BuddyProximityBackingViewController visualPairingViewController](self, "visualPairingViewController");
  -[BFFProximityVisualPairingViewController stop](v2, "stop");

}

- (void)prepareForLanguageChange:(id)a3
{
  void **v3;
  int v4;
  int v5;
  id (*v6)(uint64_t);
  void *v7;
  BuddyProximityBackingViewController *v8;
  id v9;
  void **v10;
  int v11;
  int v12;
  void (*v13)(uint64_t);
  void *v14;
  BuddyProximityBackingViewController *v15;
  id location[2];
  BuddyProximityBackingViewController *v17;

  v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v10 = _NSConcreteStackBlock;
  v11 = -1073741824;
  v12 = 0;
  v13 = sub_1000CDAD0;
  v14 = &unk_100280730;
  v15 = v17;
  v3 = _NSConcreteStackBlock;
  v4 = -1073741824;
  v5 = 0;
  v6 = sub_1000CDB3C;
  v7 = &unk_100280708;
  v8 = v17;
  v9 = location[0];
  +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", &v10, &v3, 0.1);
  objc_storeStrong(&v9, 0);
  objc_storeStrong((id *)&v8, 0);
  objc_storeStrong((id *)&v15, 0);
  objc_storeStrong(location, 0);
}

- (void)updateView
{
  id v2;
  BuddyProximityBackingViewControllerDelegate *v3;
  double v4;
  BuddyProximityBackingStringProviding *v5;
  BuddyProximityBackingStringProviding *v6;
  id v7;
  id v8;
  id v9;
  BFFProximityVisualPairingViewController *v10;
  NSString *v11;
  UILabel *v12;
  UIView *v13;
  BFFProximityVisualPairingViewController *v14;
  id v15;
  OBLinkTrayButton *v16;
  BuddyProximityBackingStringProviding *v17;
  id v18;
  UIView *v19;
  NSLayoutYAxisAnchor *v20;
  BFFProximityVisualPairingViewController *v21;
  id v22;
  id v23;
  id v24;
  BFFProximityVisualPairingViewController *v25;
  id v26;
  UIView *v27;
  BFFProximityVisualPairingViewController *v28;
  id v29;
  BFFProximityVisualPairingViewController *v30;
  id v31;
  UIView *v32;
  BuddyProximityBackingStringProviding *v33;
  BuddyProximityBackingStringProviding *v34;
  id v35;
  id v36;
  id v37;
  id v38;
  double v39;
  UILabel *v40;
  NSString *v41;
  BFFProximityVisualPairingViewController *v42;
  id v43;
  UIView *v44;
  UILabel *v45;
  UILabel *v46;
  UIView *v47;
  UILabel *v48;
  id v49;
  UIView *v50;
  NSLayoutYAxisAnchor *v51;
  uint64_t v52;
  char v53;
  double v54;
  id v55;
  OBLinkTrayButton *v56;
  BuddyProximityBackingStringProviding *v57;
  id v58;
  UILabel *v59;
  UIView *v60;
  NSLayoutYAxisAnchor *v61;
  UILabel *v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  int v68;
  id location;
  id v70;
  id v71;
  id v72[2];
  BuddyProximityBackingViewController *v73;

  v73 = self;
  v72[1] = (id)a2;
  v2 = -[BuddyProximityBackingViewController view](self, "view");
  objc_msgSend(v2, "layoutIfNeeded");

  v3 = -[BuddyProximityBackingViewController delegate](v73, "delegate");
  v72[0] = -[BuddyProximityBackingViewControllerDelegate deviceClass](v3, "deviceClass");

  v71 = -[BuddyProximityBackingViewController language](v73, "language");
  if (-[BuddyProximityBackingViewController isShowingVisualPairing](v73, "isShowingVisualPairing"))
  {
    LODWORD(v4) = 1140457472;
    -[BuddyProximityBackingViewController setMinimumBrightness:](v73, "setMinimumBrightness:", v4);
    if (-[BuddyProximityBackingViewController _largeAXMode](v73, "_largeAXMode"))
      -[BuddyProximityBackingViewController resetLayoutTo:](v73, "resetLayoutTo:", 1);
    else
      -[BuddyProximityBackingViewController resetLayoutTo:](v73, "resetLayoutTo:", 2);
    v5 = -[BuddyProximityBackingViewController stringProvider](v73, "stringProvider");
    v70 = -[BuddyProximityBackingStringProviding visualTitleWithDeviceClass:language:](v5, "visualTitleWithDeviceClass:language:", v72[0], v71);

    v6 = -[BuddyProximityBackingViewController stringProvider](v73, "stringProvider");
    location = -[BuddyProximityBackingStringProviding visualDescriptionWithDeviceClass:language:](v6, "visualDescriptionWithDeviceClass:language:", v72[0], v71);

    v7 = -[BuddyProximityBackingViewController headerView](v73, "headerView");
    objc_msgSend(v7, "setTitle:", v70);

    v8 = -[BuddyProximityBackingViewController headerView](v73, "headerView");
    objc_msgSend(v8, "setDetailText:", location);

    v9 = -[BuddyProximityBackingViewController headerView](v73, "headerView");
    objc_msgSend(v9, "setLanguage:", v71);

    v10 = -[BuddyProximityBackingViewController visualPairingViewController](v73, "visualPairingViewController");
    v11 = -[BuddyProximityBackingViewController pairingCode](v73, "pairingCode");
    -[BFFProximityVisualPairingViewController setPairingCode:](v10, "setPairingCode:", v11);

    v12 = -[BuddyProximityBackingViewController pinCodeLabel](v73, "pinCodeLabel");
    -[UILabel removeFromSuperview](v12, "removeFromSuperview");

    v13 = -[BuddyProximityBackingViewController containerView](v73, "containerView");
    v14 = -[BuddyProximityBackingViewController visualPairingViewController](v73, "visualPairingViewController");
    v15 = -[BFFProximityVisualPairingViewController view](v14, "view");
    -[UIView addSubview:](v13, "addSubview:", v15);

    if (-[BuddyProximityBackingViewController showPairingStyleToggle](v73, "showPairingStyleToggle"))
    {
      v16 = -[BuddyProximityBackingViewController pairingStyleToggleButton](v73, "pairingStyleToggleButton");
      v17 = -[BuddyProximityBackingViewController stringProvider](v73, "stringProvider");
      v18 = -[BuddyProximityBackingStringProviding textualPairingButtonTitleWithLanguage:](v17, "textualPairingButtonTitleWithLanguage:", v71);
      -[OBLinkTrayButton setTitle:forState:](v16, "setTitle:forState:", v18, 0);

      v19 = -[BuddyProximityBackingViewController containerView](v73, "containerView");
      v20 = -[UIView topAnchor](v19, "topAnchor");
      v21 = -[BuddyProximityBackingViewController visualPairingViewController](v73, "visualPairingViewController");
      v22 = -[BFFProximityVisualPairingViewController view](v21, "view");
      v23 = objc_msgSend(v22, "topAnchor");
      v24 = -[NSLayoutYAxisAnchor constraintEqualToAnchor:](v20, "constraintEqualToAnchor:", v23);
      objc_msgSend(v24, "setActive:", 1);

      v25 = -[BuddyProximityBackingViewController visualPairingViewController](v73, "visualPairingViewController");
      v26 = -[BFFProximityVisualPairingViewController view](v25, "view");
      v27 = -[BuddyProximityBackingViewController containerView](v73, "containerView");
      objc_msgSend(v26, "pinToHorizontalEdges:", v27);

      v28 = -[BuddyProximityBackingViewController visualPairingViewController](v73, "visualPairingViewController");
      v29 = -[BFFProximityVisualPairingViewController view](v28, "view");
      -[BuddyProximityBackingViewController addPairingStyleToggleButtonBelowView:](v73, "addPairingStyleToggleButtonBelowView:", v29);

    }
    else
    {
      v30 = -[BuddyProximityBackingViewController visualPairingViewController](v73, "visualPairingViewController");
      v31 = -[BFFProximityVisualPairingViewController view](v30, "view");
      v32 = -[BuddyProximityBackingViewController containerView](v73, "containerView");
      objc_msgSend(v31, "pinToEdges:", v32);

    }
    v68 = 1;
    objc_storeStrong(&location, 0);
    objc_storeStrong(&v70, 0);
  }
  else
  {
    LODWORD(v4) = 0;
    -[BuddyProximityBackingViewController setMinimumBrightness:](v73, "setMinimumBrightness:", v4);
    -[BuddyProximityBackingViewController resetLayoutTo:](v73, "resetLayoutTo:", 2);
    v33 = -[BuddyProximityBackingViewController stringProvider](v73, "stringProvider");
    v67 = -[BuddyProximityBackingStringProviding textualTitleWithDeviceClass:language:](v33, "textualTitleWithDeviceClass:language:", v72[0], v71);

    v34 = -[BuddyProximityBackingViewController stringProvider](v73, "stringProvider");
    v66 = -[BuddyProximityBackingStringProviding textualDescriptionWithDeviceClass:language:](v34, "textualDescriptionWithDeviceClass:language:", v72[0], v71);

    v35 = -[BuddyProximityBackingViewController headerView](v73, "headerView");
    objc_msgSend(v35, "setTitle:", v67);

    v36 = -[BuddyProximityBackingViewController headerView](v73, "headerView");
    objc_msgSend(v36, "setDetailText:", v66);

    v37 = -[BuddyProximityBackingViewController headerView](v73, "headerView");
    objc_msgSend(v37, "setLanguage:", v71);

    v38 = -[BuddyProximityBackingViewController headerView](v73, "headerView");
    LODWORD(v39) = 1045220557;
    objc_msgSend(v38, "setTitleHyphenationFactor:", v39);

    v40 = -[BuddyProximityBackingViewController pinCodeLabel](v73, "pinCodeLabel");
    v41 = -[BuddyProximityBackingViewController pairingCode](v73, "pairingCode");
    -[UILabel setText:](v40, "setText:", v41);

    v42 = -[BuddyProximityBackingViewController visualPairingViewController](v73, "visualPairingViewController");
    v43 = -[BFFProximityVisualPairingViewController view](v42, "view");
    objc_msgSend(v43, "removeFromSuperview");

    v44 = -[BuddyProximityBackingViewController containerView](v73, "containerView");
    v45 = -[BuddyProximityBackingViewController pinCodeLabel](v73, "pinCodeLabel");
    -[UIView addSubview:](v44, "addSubview:", v45);

    v46 = -[BuddyProximityBackingViewController pinCodeLabel](v73, "pinCodeLabel");
    v47 = -[BuddyProximityBackingViewController containerView](v73, "containerView");
    -[UILabel pinToHorizontalEdges:](v46, "pinToHorizontalEdges:", v47);

    v48 = -[BuddyProximityBackingViewController pinCodeLabel](v73, "pinCodeLabel");
    v49 = -[UILabel lastBaselineAnchor](v48, "lastBaselineAnchor");
    v50 = -[BuddyProximityBackingViewController containerView](v73, "containerView");
    v51 = -[UIView topAnchor](v50, "topAnchor");
    v53 = BFFIsiPad(v51, v52);
    v54 = 106.0;
    if ((v53 & 1) == 0)
      v54 = 96.0;
    v55 = objc_msgSend(v49, "constraintEqualToAnchor:constant:", v51, v54);
    objc_msgSend(v55, "setActive:", 1);

    if (-[BuddyProximityBackingViewController showPairingStyleToggle](v73, "showPairingStyleToggle"))
    {
      v56 = -[BuddyProximityBackingViewController pairingStyleToggleButton](v73, "pairingStyleToggleButton");
      v57 = -[BuddyProximityBackingViewController stringProvider](v73, "stringProvider");
      v58 = -[BuddyProximityBackingStringProviding visualPairingButtonTitleWithLanguage:](v57, "visualPairingButtonTitleWithLanguage:", v71);
      -[OBLinkTrayButton setTitle:forState:](v56, "setTitle:forState:", v58, 0);

      v59 = -[BuddyProximityBackingViewController pinCodeLabel](v73, "pinCodeLabel");
      -[BuddyProximityBackingViewController addPairingStyleToggleButtonBelowView:](v73, "addPairingStyleToggleButtonBelowView:", v59);

    }
    else
    {
      v60 = -[BuddyProximityBackingViewController containerView](v73, "containerView");
      v61 = -[UIView bottomAnchor](v60, "bottomAnchor");
      v62 = -[BuddyProximityBackingViewController pinCodeLabel](v73, "pinCodeLabel");
      v63 = -[UILabel bottomAnchor](v62, "bottomAnchor");
      v64 = -[NSLayoutYAxisAnchor constraintGreaterThanOrEqualToAnchor:](v61, "constraintGreaterThanOrEqualToAnchor:", v63);
      objc_msgSend(v64, "setActive:", 1);

    }
    v65 = -[BuddyProximityBackingViewController view](v73, "view");
    objc_msgSend(v65, "setNeedsLayout");

    objc_storeStrong(&v66, 0);
    objc_storeStrong(&v67, 0);
    v68 = 0;
  }
  objc_storeStrong(&v71, 0);
  objc_storeStrong(v72, 0);
}

- (void)addPairingStyleToggleButtonBelowView:(id)a3
{
  OBLinkTrayButton *v3;
  UIView *v4;
  OBLinkTrayButton *v5;
  UIView *v6;
  OBLinkTrayButton *v7;
  id v8;
  id v9;
  UIView *v10;
  NSLayoutXAxisAnchor *v11;
  OBLinkTrayButton *v12;
  id v13;
  id v14;
  NSArray *v15;
  NSLayoutYAxisAnchor *v16;
  UIView *v17;
  id v18;
  id v19;
  id v20;
  OBLinkTrayButton *v21;
  id location[2];
  BuddyProximityBackingViewController *v23;
  _QWORD v24[3];

  v23 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyProximityBackingViewController pairingStyleToggleButton](v23, "pairingStyleToggleButton");
  -[OBLinkTrayButton removeFromSuperview](v3, "removeFromSuperview");

  v4 = -[BuddyProximityBackingViewController containerView](v23, "containerView");
  v5 = -[BuddyProximityBackingViewController pairingStyleToggleButton](v23, "pairingStyleToggleButton");
  -[UIView addSubview:](v4, "addSubview:", v5);

  v6 = -[BuddyProximityBackingViewController containerView](v23, "containerView");
  v20 = objc_msgSend(location[0], "bottomAnchor");
  v21 = -[BuddyProximityBackingViewController pairingStyleToggleButton](v23, "pairingStyleToggleButton");
  v19 = -[OBLinkTrayButton topAnchor](v21, "topAnchor");
  v18 = objc_msgSend(v20, "constraintEqualToAnchor:");
  v24[0] = v18;
  v17 = -[BuddyProximityBackingViewController containerView](v23, "containerView");
  v16 = -[UIView bottomAnchor](v17, "bottomAnchor");
  v7 = -[BuddyProximityBackingViewController pairingStyleToggleButton](v23, "pairingStyleToggleButton");
  v8 = -[OBLinkTrayButton bottomAnchor](v7, "bottomAnchor");
  v9 = -[NSLayoutYAxisAnchor constraintEqualToAnchor:](v16, "constraintEqualToAnchor:", v8);
  v24[1] = v9;
  v10 = -[BuddyProximityBackingViewController containerView](v23, "containerView");
  v11 = -[UIView centerXAnchor](v10, "centerXAnchor");
  v12 = -[BuddyProximityBackingViewController pairingStyleToggleButton](v23, "pairingStyleToggleButton");
  v13 = -[OBLinkTrayButton centerXAnchor](v12, "centerXAnchor");
  v14 = -[NSLayoutXAxisAnchor constraintEqualToAnchor:](v11, "constraintEqualToAnchor:", v13);
  v24[2] = v14;
  v15 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v24, 3);
  -[UIView addConstraints:](v6, "addConstraints:", v15);

  objc_storeStrong(location, 0);
}

- (void)setMinimumBrightness:(float)a3
{
  NSNumber *v3;
  uint64_t v4;
  BrightnessSystemClient *v5;
  char v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  _WORD v10[3];
  char v11;
  os_log_t v12;
  os_log_type_t v13;
  os_log_t oslog;
  id location;
  float v16;
  SEL v17;
  BuddyProximityBackingViewController *v18;
  uint8_t buf[24];
  _QWORD v20[2];
  _QWORD v21[2];

  v18 = self;
  v17 = a2;
  v16 = a3;
  v20[0] = CFSTR("nits");
  v3 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", *(double *)&a3);
  v21[0] = v3;
  v20[1] = CFSTR("period");
  v21[1] = &off_100290FD0;
  location = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v21, v20, 2);

  oslog = (os_log_t)(id)_BYLoggingFacility(v4);
  v13 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
  {
    sub_100038C28((uint64_t)buf, (uint64_t)location);
    _os_log_debug_impl((void *)&_mh_execute_header, oslog, v13, "Setting brightness to: %@", buf, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  v5 = -[BuddyProximityBackingViewController brightnessClient](v18, "brightnessClient");
  v6 = -[BrightnessSystemClient setProperty:forKey:](v5, "setProperty:forKey:", location, CFSTR("MinNits")) ^ 1;

  if ((v6 & 1) != 0)
  {
    v12 = (os_log_t)(id)_BYLoggingFacility(v7);
    v11 = 16;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v8 = v12;
      v9 = v11;
      sub_100038C3C(v10);
      _os_log_error_impl((void *)&_mh_execute_header, v8, v9, "Failed to set brightness!", (uint8_t *)v10, 2u);
    }
    objc_storeStrong((id *)&v12, 0);
  }
  objc_storeStrong(&location, 0);
}

- (BOOL)_largeAXMode
{
  UIApplication *v2;
  NSString *v3;
  BOOL v4;

  v2 = +[UIApplication sharedApplication](UIApplication, "sharedApplication", a2, self);
  v3 = -[UIApplication preferredContentSizeCategory](v2, "preferredContentSizeCategory");
  v4 = UIContentSizeCategoryCompareToCategory(UIContentSizeCategoryExtraLarge, v3) == NSOrderedAscending;

  return v4;
}

- (BOOL)showPairingStyleToggle
{
  BuddyProximityBackingStringProviding *v2;
  char v3;
  BuddyProximityBackingStringProviding *v4;
  BuddyProximityBackingStringProviding *v5;
  id v6;
  BOOL v7;
  id v9;
  id location;
  id v11;
  char v12;
  id v13;
  SEL v14;
  BuddyProximityBackingViewController *v15;
  BOOL v16;

  v15 = self;
  v14 = a2;
  v2 = -[BuddyProximityBackingViewController stringProvider](self, "stringProvider");
  v12 = 0;
  v3 = 1;
  if ((objc_opt_respondsToSelector(v2, "visualPairingButtonTitleWithLanguage:") & 1) != 0)
  {
    v13 = -[BuddyProximityBackingViewController stringProvider](v15, "stringProvider");
    v12 = 1;
    v3 = objc_opt_respondsToSelector(v13, "textualPairingButtonTitleWithLanguage:") ^ 1;
  }
  if ((v12 & 1) != 0)

  if ((v3 & 1) != 0)
  {
    return 0;
  }
  else
  {
    v11 = -[BuddyProximityBackingViewController language](v15, "language");
    v4 = -[BuddyProximityBackingViewController stringProvider](v15, "stringProvider");
    location = -[BuddyProximityBackingStringProviding visualPairingButtonTitleWithLanguage:](v4, "visualPairingButtonTitleWithLanguage:", v11);

    v5 = -[BuddyProximityBackingViewController stringProvider](v15, "stringProvider");
    v9 = -[BuddyProximityBackingStringProviding textualPairingButtonTitleWithLanguage:](v5, "textualPairingButtonTitleWithLanguage:", v11);

    v6 = objc_msgSend(location, "length");
    v7 = 0;
    if (v6)
      v7 = objc_msgSend(v9, "length") != 0;
    v16 = v7;
    objc_storeStrong(&v9, 0);
    objc_storeStrong(&location, 0);
    objc_storeStrong(&v11, 0);
  }
  return v16;
}

- (void)pairingStyleToggleTapped:(id)a3
{
  id location[2];
  BuddyProximityBackingViewController *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (-[BuddyProximityBackingViewController isShowingVisualPairing](v4, "isShowingVisualPairing"))
    -[BuddyProximityBackingViewController showPairingCode](v4, "showPairingCode");
  else
    -[BuddyProximityBackingViewController showVisualPairing](v4, "showVisualPairing");
  objc_storeStrong(location, 0);
}

- (NSString)pairingCode
{
  return self->_pairingCode;
}

- (void)setPairingCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)language
{
  return self->_language;
}

- (void)setLanguage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)nonUserInitiatedDismissal
{
  return self->_nonUserInitiatedDismissal;
}

- (void)setNonUserInitiatedDismissal:(BOOL)a3
{
  self->_nonUserInitiatedDismissal = a3;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isShowingVisualPairing
{
  return self->_showingVisualPairing;
}

- (void)setShowingVisualPairing:(BOOL)a3
{
  self->_showingVisualPairing = a3;
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_containerView, a3);
}

- (BFFProximityVisualPairingViewController)visualPairingViewController
{
  return self->_visualPairingViewController;
}

- (void)setVisualPairingViewController:(id)a3
{
  objc_storeStrong((id *)&self->_visualPairingViewController, a3);
}

- (UILabel)pinCodeLabel
{
  return self->_pinCodeLabel;
}

- (void)setPinCodeLabel:(id)a3
{
  objc_storeStrong((id *)&self->_pinCodeLabel, a3);
}

- (OBLinkTrayButton)pairingStyleToggleButton
{
  return self->_pairingStyleToggleButton;
}

- (void)setPairingStyleToggleButton:(id)a3
{
  objc_storeStrong((id *)&self->_pairingStyleToggleButton, a3);
}

- (NSLayoutConstraint)heightConstraint
{
  return self->_heightConstraint;
}

- (void)setHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_heightConstraint, a3);
}

- (BuddyProximityBackingStringProviding)stringProvider
{
  return self->_stringProvider;
}

- (BrightnessSystemClient)brightnessClient
{
  return self->_brightnessClient;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_brightnessClient, 0);
  objc_storeStrong((id *)&self->_stringProvider, 0);
  objc_storeStrong((id *)&self->_heightConstraint, 0);
  objc_storeStrong((id *)&self->_pairingStyleToggleButton, 0);
  objc_storeStrong((id *)&self->_pinCodeLabel, 0);
  objc_storeStrong((id *)&self->_visualPairingViewController, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_pairingCode, 0);
}

@end
