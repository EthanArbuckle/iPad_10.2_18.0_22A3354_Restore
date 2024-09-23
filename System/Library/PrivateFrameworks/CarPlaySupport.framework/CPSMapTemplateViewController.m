@implementation CPSMapTemplateViewController

- (CPSMapTemplateViewController)initWithMapTemplate:(id)a3 templateDelegate:(id)a4 safeAreaDelegate:(id)a5 applicationStateMonitor:(id)a6 templateEnvironment:(id)a7
{
  CPSMapTemplateViewController *v7;
  BKSHIDEventDeliveryPolicyObserver *v8;
  BKSHIDEventDeliveryPolicyObserver *eventDeliveryPolicyObserver;
  NSMutableArray *v10;
  NSMutableArray *mapButtons;
  NSMutableDictionary *v12;
  NSMutableDictionary *lastTravelEstimatesByTrip;
  char v14;
  char v15;
  char v16;
  CPSNavigationAlertQueue *v17;
  uint64_t v18;
  CPSNavigationAlertQueue *navigationAlertQueue;
  char v20;
  UIColor *v21;
  UIColor *guidanceBackgroundColor;
  uint64_t v23;
  CPSMapTemplateViewController *v25;
  id v26;
  CPSNavigationAlertQueue *v27;
  BKSHIDEventDeliveryPolicyObserver *v28;
  id v29;
  id v30;
  BOOL v31;
  CPSMapTemplateViewController *v36;
  Boolean AppBooleanValue;
  Boolean keyExistsAndHasValidFormat;
  objc_super v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id location[2];
  CPSMapTemplateViewController *v45;

  v45 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v43 = 0;
  objc_storeStrong(&v43, a4);
  v42 = 0;
  objc_storeStrong(&v42, a5);
  v41 = 0;
  objc_storeStrong(&v41, a6);
  v40 = 0;
  objc_storeStrong(&v40, a7);
  v7 = v45;
  v45 = 0;
  v39.receiver = v7;
  v39.super_class = (Class)CPSMapTemplateViewController;
  v36 = -[CPSBaseTemplateViewController initWithTemplate:templateDelegate:templateEnvironment:](&v39, sel_initWithTemplate_templateDelegate_templateEnvironment_, location[0], v43, v40);
  v45 = v36;
  objc_storeStrong((id *)&v45, v36);
  if (v36)
  {
    v8 = (BKSHIDEventDeliveryPolicyObserver *)objc_alloc_init(MEMORY[0x24BE0B6A8]);
    eventDeliveryPolicyObserver = v45->_eventDeliveryPolicyObserver;
    v45->_eventDeliveryPolicyObserver = v8;

    v28 = v45->_eventDeliveryPolicyObserver;
    v29 = (id)objc_msgSend(MEMORY[0x24BE0B690], "keyboardFocusEnvironment");
    -[BKSHIDEventDeliveryPolicyObserver setDeferringEnvironment:](v28, "setDeferringEnvironment:");

    -[BKSHIDEventDeliveryPolicyObserver addObserver:](v45->_eventDeliveryPolicyObserver, "addObserver:", v45);
    v30 = (id)objc_msgSend(v40, "sessionStatus");
    objc_msgSend(v30, "addSessionObserver:", v45);

    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    mapButtons = v45->_mapButtons;
    v45->_mapButtons = v10;

    v45->_maximumMapButtonCount = 4;
    v12 = (NSMutableDictionary *)(id)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    lastTravelEstimatesByTrip = v45->_lastTravelEstimatesByTrip;
    v45->_lastTravelEstimatesByTrip = v12;

    v14 = objc_msgSend(location[0], "automaticallyHidesNavigationBar");
    v45->_autoHidesNavigationBar = v14 & 1;
    v15 = objc_msgSend(location[0], "hidesButtonsWithNavigationBar");
    v45->_hidesButtonsWithNavigationBar = v15 & 1;
    v16 = objc_msgSend(location[0], "hidesButtonsWithNavigationBar");
    v45->_hidesButtonsWithNavigationBar = v16 & 1;
    objc_storeStrong((id *)&v45->_tripPreviews, 0);
    keyExistsAndHasValidFormat = 0;
    AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("0-Demo Auto Hide Timer Disabled"), CFSTR("com.apple.internal.Neatline"), &keyExistsAndHasValidFormat);
    v31 = 0;
    if (keyExistsAndHasValidFormat)
      v31 = AppBooleanValue != 0;
    v45->_demoAutoHideTimerDisabled = v31;
    v17 = [CPSNavigationAlertQueue alloc];
    v18 = -[CPSNavigationAlertQueue initWithDelegate:applicationStateMonitor:](v17, "initWithDelegate:applicationStateMonitor:", v45, v41);
    navigationAlertQueue = v45->_navigationAlertQueue;
    v45->_navigationAlertQueue = (CPSNavigationAlertQueue *)v18;

    objc_storeWeak((id *)&v45->_safeAreaDelegate, v42);
    v20 = objc_msgSend(v40, "rightHandDrive");
    v45->_rightHandDrive = v20 & 1;
    v45->_applicationIsFrontmost = 1;
    objc_storeWeak((id *)&v45->_applicationStateMonitor, v41);
    objc_msgSend(v41, "addApplicationStateObserver:", v45);
    v26 = v41;
    v27 = -[CPSMapTemplateViewController navigationAlertQueue](v45, "navigationAlertQueue");
    objc_msgSend(v26, "addApplicationStateObserver:");

    v21 = (UIColor *)(id)objc_msgSend(location[0], "guidanceBackgroundColor");
    guidanceBackgroundColor = v45->_guidanceBackgroundColor;
    v45->_guidanceBackgroundColor = v21;

    v23 = objc_msgSend(location[0], "tripEstimateStyle");
    v45->_tripEstimateStyle = v23;
  }
  v25 = v45;
  objc_storeStrong(&v40, 0);
  objc_storeStrong(&v41, 0);
  objc_storeStrong(&v42, 0);
  objc_storeStrong(&v43, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v45, 0);
  return v25;
}

- (void)invalidate
{
  CPSNavigator *v2;
  CPSApplicationStateMonitor *v3;
  CPSNavigationAlertQueue *v4;
  CPSApplicationStateMonitor *v5;
  BKSHIDEventDeliveryPolicyObserver *v6;
  objc_super v7;
  SEL v8;
  CPSMapTemplateViewController *v9;

  v9 = self;
  v8 = a2;
  v2 = -[CPSMapTemplateViewController navigator](self, "navigator");
  -[CPSNavigator invalidate](v2, "invalidate");

  v3 = -[CPSMapTemplateViewController applicationStateMonitor](v9, "applicationStateMonitor");
  -[CPSApplicationStateMonitor removeApplicationStateObserver:](v3, "removeApplicationStateObserver:", v9);

  v5 = -[CPSMapTemplateViewController applicationStateMonitor](v9, "applicationStateMonitor");
  v4 = -[CPSMapTemplateViewController navigationAlertQueue](v9, "navigationAlertQueue");
  -[CPSApplicationStateMonitor removeApplicationStateObserver:](v5, "removeApplicationStateObserver:");

  v6 = -[CPSMapTemplateViewController eventDeliveryPolicyObserver](v9, "eventDeliveryPolicyObserver");
  -[BKSHIDEventDeliveryPolicyObserver removeObserver:](v6, "removeObserver:", v9);

  v7.receiver = v9;
  v7.super_class = (Class)CPSMapTemplateViewController;
  -[CPSBaseTemplateViewController invalidate](&v7, sel_invalidate);
}

- (void)dealloc
{
  objc_super v2;
  SEL v3;
  CPSMapTemplateViewController *v4;

  v4 = self;
  v3 = a2;
  -[CPSMapTemplateViewController invalidate](self, "invalidate");
  v2.receiver = v4;
  v2.super_class = (Class)CPSMapTemplateViewController;
  -[CPSBaseTemplateViewController dealloc](&v2, sel_dealloc);
}

- (void)setGuidanceBackgroundColor:(id)a3
{
  CPSNavigationCardViewController *v3;
  id location[2];
  CPSMapTemplateViewController *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (v5->_guidanceBackgroundColor != location[0])
  {
    objc_storeStrong((id *)&v5->_guidanceBackgroundColor, location[0]);
    v3 = -[CPSMapTemplateViewController navigationCardViewController](v5, "navigationCardViewController");
    -[CPSNavigationCardViewController setGuidanceBackgroundColor:](v3, "setGuidanceBackgroundColor:", v5->_guidanceBackgroundColor);

  }
  objc_storeStrong(location, 0);
}

- (void)traitCollectionDidChange:(id)a3
{
  CPSNavigationETAView *v3;
  id v4;
  BOOL v5;
  BOOL v6;
  char v7;
  CPSNavigationETAView *v8;
  objc_super v9;
  id location[2];
  CPSMapTemplateViewController *v11;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v9.receiver = v11;
  v9.super_class = (Class)CPSMapTemplateViewController;
  -[CPSMapTemplateViewController traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, location[0]);
  v7 = 0;
  v6 = 0;
  if (!-[CPSMapTemplateViewController hasSetTripEstimateStyle](v11, "hasSetTripEstimateStyle"))
  {
    v8 = -[CPSMapTemplateViewController navigationETAView](v11, "navigationETAView");
    v7 = 1;
    v6 = v8 != 0;
  }
  if ((v7 & 1) != 0)

  if (v6)
  {
    v4 = (id)-[CPSMapTemplateViewController traitCollection](v11, "traitCollection");
    v5 = objc_msgSend(v4, "userInterfaceStyle") != 1;

    v3 = -[CPSMapTemplateViewController navigationETAView](v11, "navigationETAView");
    -[CPSNavigationETAView setTripEstimateStyle:](v3, "setTripEstimateStyle:", v5);

  }
  -[CPSMapTemplateViewController _updatePanGestureForHiFiTouch](v11, "_updatePanGestureForHiFiTouch");
  objc_storeStrong(location, 0);
}

- (void)setTripEstimateStyle:(unint64_t)a3
{
  CPSNavigationETAView *v3;
  CPSNavigationETAView *v4;

  -[CPSMapTemplateViewController setHasSetTripEstimateStyle:](self, "setHasSetTripEstimateStyle:", 1);
  if (self->_tripEstimateStyle != a3)
  {
    self->_tripEstimateStyle = a3;
    v4 = -[CPSMapTemplateViewController navigationETAView](self, "navigationETAView");

    if (v4)
    {
      v3 = -[CPSMapTemplateViewController navigationETAView](self, "navigationETAView");
      -[CPSNavigationETAView setTripEstimateStyle:](v3, "setTripEstimateStyle:", self->_tripEstimateStyle);

    }
  }
}

- (CPMapTemplate)mapTemplate
{
  void *v3;
  CPTemplate *v4;
  id v5;

  v3 = (void *)objc_opt_class();
  v4 = -[CPSBaseTemplateViewController associatedTemplate](self, "associatedTemplate");
  v5 = CPSSafeCast_23(v3, v4);

  return (CPMapTemplate *)v5;
}

- (void)_viewDidLoad
{
  id v2;
  id v3;
  id v4;
  BOOL v5;
  double v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  CPSPanViewController *v28;
  CPSTemplateEnvironment *v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  NSLayoutConstraint *v42;
  id v43;
  id v44;
  id v45;
  id v46;
  NSLayoutConstraint *v47;
  void *v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  _CPSFocusHoldingButton *v70;
  id v71;
  id v72;
  id v73;
  id v74;
  _CPSFocusHoldingButton *v75;
  id v76;
  id v77;
  _CPSFocusHoldingButton *v78;
  id v79;
  id v80;
  _CPSFocusHoldingButton *v81;
  id v82;
  id v83;
  _CPSFocusHoldingButton *v84;
  id v85;
  UIFocusGuide *v86;
  id v87;
  id v88;
  _CPSFocusHoldingButton *v89;
  id v90;
  UIFocusGuide *v91;
  id v92;
  id v93;
  _CPSFocusHoldingButton *v94;
  id v95;
  UIFocusGuide *v96;
  id v97;
  id v98;
  UIFocusGuide *v99;
  id v100;
  id v101;
  _CPSFocusHoldingButton *v102;
  id v103;
  UIFocusGuide *v104;
  id v105;
  id v106;
  _CPSFocusHoldingButton *v107;
  id v108;
  UIFocusGuide *v109;
  id v110;
  id v111;
  _CPSFocusHoldingButton *v112;
  id v113;
  UIFocusGuide *v114;
  id v115;
  id v116;
  UIFocusGuide *v117;
  CPSMapTemplateViewController *v118;
  NSArray *v119;
  CPMapTemplate *v120;
  id v121;
  id v122;
  id v123;
  id v124[9];
  id v125;
  CPSPanViewController *v126;
  id v127;
  id v128;
  id v129;
  double v130;
  char v131;
  id v132;
  char v133;
  id v134;
  id v135;
  char v136;
  id v137;
  char v138;
  id v139;
  char v140;
  id v141;
  char v142;
  id v143;
  id v144;
  id v145;
  id v146;
  objc_super v147;
  SEL v148;
  CPSMapTemplateViewController *v149;
  _QWORD v150[16];
  _QWORD v151[4];
  _QWORD v152[4];

  v152[3] = *MEMORY[0x24BDAC8D0];
  v149 = self;
  v148 = a2;
  v147.receiver = self;
  v147.super_class = (Class)CPSMapTemplateViewController;
  -[CPSBaseTemplateViewController _viewDidLoad](&v147, sel__viewDidLoad);
  v146 = (id)-[CPSMapTemplateViewController view](v149, "view");
  v2 = objc_alloc(MEMORY[0x24BDF6DD0]);
  v145 = (id)objc_msgSend(v2, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  objc_msgSend(v145, "setAxis:", 1);
  objc_msgSend(v145, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v145, "setSpacing:", 8.0);
  objc_msgSend(v146, "addSubview:", v145);
  -[CPSMapTemplateViewController setTrailingBottomStackView:](v149, "setTrailingBottomStackView:", v145);
  v118 = v149;
  v120 = -[CPSMapTemplateViewController mapTemplate](v149, "mapTemplate");
  v119 = -[CPMapTemplate mapButtons](v120, "mapButtons");
  -[CPSMapTemplateViewController _updateMapButtonsWithButtons:](v118, "_updateMapButtonsWithButtons:");

  v142 = 0;
  v140 = 0;
  v138 = 0;
  v136 = 0;
  if (-[CPSMapTemplateViewController rightHandDrive](v149, "rightHandDrive"))
  {
    v143 = (id)objc_msgSend(v146, "safeAreaLayoutGuide");
    v142 = 1;
    v141 = (id)objc_msgSend(v143, "leftAnchor");
    v140 = 1;
    v3 = v141;
  }
  else
  {
    v139 = (id)objc_msgSend(v146, "safeAreaLayoutGuide");
    v138 = 1;
    v137 = (id)objc_msgSend(v139, "rightAnchor");
    v136 = 1;
    v3 = v137;
  }
  v144 = v3;
  if ((v136 & 1) != 0)

  if ((v138 & 1) != 0)
  if ((v140 & 1) != 0)

  if ((v142 & 1) != 0)
  v133 = 0;
  v131 = 0;
  if (-[CPSMapTemplateViewController rightHandDrive](v149, "rightHandDrive"))
  {
    v134 = (id)objc_msgSend(v145, "leftAnchor");
    v133 = 1;
    v4 = v134;
  }
  else
  {
    v132 = (id)objc_msgSend(v145, "rightAnchor");
    v131 = 1;
    v4 = v132;
  }
  v135 = v4;
  if ((v131 & 1) != 0)

  if ((v133 & 1) != 0)
  v130 = 0.0;
  v5 = -[CPSMapTemplateViewController rightHandDrive](v149, "rightHandDrive");
  v6 = -8.0;
  if (!v5)
    v6 = 8.0;
  v130 = v6;
  v24 = (id)objc_msgSend(v144, "constraintEqualToAnchor:constant:", v135, v6);
  v152[0] = v24;
  v23 = (id)objc_msgSend(v146, "safeAreaLayoutGuide");
  v22 = (id)objc_msgSend(v23, "bottomAnchor");
  v21 = (id)objc_msgSend(v145, "bottomAnchor");
  v20 = (id)objc_msgSend(v22, "constraintEqualToAnchor:constant:", 8.0);
  v152[1] = v20;
  v19 = (id)objc_msgSend(v145, "widthAnchor");
  v18 = (id)objc_msgSend(v19, "constraintEqualToConstant:", 30.0);
  v152[2] = v18;
  v129 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v152, 3);

  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v129);
  -[CPSMapTemplateViewController _reloadPreviewsView](v149, "_reloadPreviewsView");
  v7 = objc_alloc(MEMORY[0x24BDF6E80]);
  v128 = (id)objc_msgSend(v7, "initWithTarget:action:", v149, sel__handleTapGesture_);
  objc_msgSend(v128, "setDelegate:", v149);
  objc_msgSend(v146, "addGestureRecognizer:", v128);
  -[CPSMapTemplateViewController setHideTapGestureRecognizer:](v149, "setHideTapGestureRecognizer:", v128);
  v8 = objc_alloc(MEMORY[0x24BDF6E80]);
  v127 = (id)objc_msgSend(v8, "initWithTarget:action:", v149);
  objc_msgSend(v127, "setDelegate:", v149);
  v26 = (id)-[CPSMapTemplateViewController navigationController](v149, "navigationController");
  v25 = (id)objc_msgSend(v26, "navigationBar");
  objc_msgSend(v25, "addGestureRecognizer:", v127);

  -[CPSMapTemplateViewController setNavBarHideTapGestureRecognizer:](v149, "setNavBarHideTapGestureRecognizer:", v127);
  -[CPSMapTemplateViewController _updatePanGestureForHiFiTouch](v149, "_updatePanGestureForHiFiTouch");
  v27 = (id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  objc_msgSend(v27, "addObserver:selector:name:object:", v149, sel__nightModeChanged_, *MEMORY[0x24BE151C0], 0);

  -[CPSMapTemplateViewController _resetAutoHideTimerAndShowBarAnimated:allowFocusDeferral:](v149, "_resetAutoHideTimerAndShowBarAnimated:allowFocusDeferral:", 1, 1);
  v28 = [CPSPanViewController alloc];
  v29 = -[CPSBaseTemplateViewController templateEnvironment](v149, "templateEnvironment");
  v126 = -[CPSPanViewController initWithEnvironment:](v28, "initWithEnvironment:");

  -[CPSPanViewController setPanDelegate:](v126, "setPanDelegate:", v149);
  -[CPSMapTemplateViewController setPanViewController:](v149, "setPanViewController:", v126);
  v9 = objc_alloc(MEMORY[0x24BDF6F90]);
  v125 = (id)objc_msgSend(v9, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  objc_msgSend(v125, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v125, "setHidden:", 1);
  objc_msgSend(v146, "insertSubview:belowSubview:", v125, v145);
  v32 = (id)objc_msgSend(v125, "leftAnchor");
  v31 = (id)objc_msgSend(v146, "leftAnchor");
  objc_msgSend(v146, "safeAreaInsets");
  v124[5] = v10;
  v124[6] = v11;
  v124[7] = v12;
  v124[8] = v13;
  v30 = (id)objc_msgSend(v32, "constraintEqualToAnchor:constant:", v31, *(double *)&v11);
  -[CPSMapTemplateViewController setPanContainerLeftConstraint:](v149, "setPanContainerLeftConstraint:");

  v35 = (id)objc_msgSend(v125, "rightAnchor");
  v34 = (id)objc_msgSend(v146, "rightAnchor");
  objc_msgSend(v146, "safeAreaInsets");
  v124[1] = v14;
  v124[2] = v15;
  v124[3] = v16;
  v124[4] = v17;
  v33 = (id)objc_msgSend(v35, "constraintEqualToAnchor:constant:", v34, *(double *)&v17);
  -[CPSMapTemplateViewController setPanContainerRightConstraint:](v149, "setPanContainerRightConstraint:");

  v36 = v146;
  v47 = -[CPSMapTemplateViewController panContainerLeftConstraint](v149, "panContainerLeftConstraint");
  v151[0] = v47;
  v46 = (id)objc_msgSend(v125, "topAnchor");
  v45 = (id)objc_msgSend(v146, "safeAreaLayoutGuide");
  v44 = (id)objc_msgSend(v45, "topAnchor");
  v43 = (id)objc_msgSend(v46, "constraintEqualToAnchor:");
  v151[1] = v43;
  v42 = -[CPSMapTemplateViewController panContainerRightConstraint](v149, "panContainerRightConstraint");
  v151[2] = v42;
  v41 = (id)objc_msgSend(v125, "bottomAnchor");
  v40 = (id)objc_msgSend(v146, "safeAreaLayoutGuide");
  v39 = (id)objc_msgSend(v40, "bottomAnchor");
  v38 = (id)objc_msgSend(v41, "constraintEqualToAnchor:");
  v151[3] = v38;
  v37 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v151, 4);
  objc_msgSend(v36, "addConstraints:");

  -[CPSMapTemplateViewController setPanContainerView:](v149, "setPanContainerView:", v125);
  v124[0] = +[_CPSFocusHoldingButton buttonWithType:](_CPSFocusHoldingButton, "buttonWithType:", 0);
  objc_msgSend(v124[0], "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v124[0], "setEnabled:", 0);
  objc_msgSend(v124[0], "addTarget:action:forControlEvents:", v149, sel__handleFocusHolderSelect, 0x2000);
  objc_msgSend(v146, "addSubview:", v124[0]);
  -[CPSMapTemplateViewController setFocusHoldingButton:](v149, "setFocusHoldingButton:", v124[0]);
  v123 = objc_alloc_init(MEMORY[0x24BDF6A58]);
  objc_msgSend(v146, "addLayoutGuide:", v123);
  objc_msgSend(v123, "setEnabled:", 0);
  -[CPSMapTemplateViewController setFocusHolderLeftFocusGuide:](v149, "setFocusHolderLeftFocusGuide:", v123);
  v122 = objc_alloc_init(MEMORY[0x24BDF6A58]);
  objc_msgSend(v146, "addLayoutGuide:", v122);
  objc_msgSend(v122, "setEnabled:", 0);
  -[CPSMapTemplateViewController setFocusHolderRightFocusGuide:](v149, "setFocusHolderRightFocusGuide:", v122);
  v121 = objc_alloc_init(MEMORY[0x24BDF6A50]);
  objc_msgSend(v146, "addLayoutGuide:", v121);
  v48 = (void *)MEMORY[0x24BDD1628];
  v117 = -[CPSMapTemplateViewController focusHolderLeftFocusGuide](v149, "focusHolderLeftFocusGuide");
  v116 = (id)-[UIFocusGuide widthAnchor](v117, "widthAnchor");
  v115 = (id)objc_msgSend(v116, "constraintEqualToConstant:");
  v150[0] = v115;
  v114 = -[CPSMapTemplateViewController focusHolderLeftFocusGuide](v149, "focusHolderLeftFocusGuide");
  v113 = (id)-[UIFocusGuide rightAnchor](v114, "rightAnchor");
  v112 = -[CPSMapTemplateViewController focusHoldingButton](v149, "focusHoldingButton");
  v111 = (id)-[_CPSFocusHoldingButton leftAnchor](v112, "leftAnchor");
  v110 = (id)objc_msgSend(v113, "constraintEqualToAnchor:");
  v150[1] = v110;
  v109 = -[CPSMapTemplateViewController focusHolderLeftFocusGuide](v149, "focusHolderLeftFocusGuide");
  v108 = (id)-[UIFocusGuide bottomAnchor](v109, "bottomAnchor");
  v107 = -[CPSMapTemplateViewController focusHoldingButton](v149, "focusHoldingButton");
  v106 = (id)-[_CPSFocusHoldingButton bottomAnchor](v107, "bottomAnchor");
  v105 = (id)objc_msgSend(v108, "constraintEqualToAnchor:");
  v150[2] = v105;
  v104 = -[CPSMapTemplateViewController focusHolderLeftFocusGuide](v149, "focusHolderLeftFocusGuide");
  v103 = (id)-[UIFocusGuide topAnchor](v104, "topAnchor");
  v102 = -[CPSMapTemplateViewController focusHoldingButton](v149, "focusHoldingButton");
  v101 = (id)-[_CPSFocusHoldingButton topAnchor](v102, "topAnchor");
  v100 = (id)objc_msgSend(v103, "constraintEqualToAnchor:");
  v150[3] = v100;
  v99 = -[CPSMapTemplateViewController focusHolderRightFocusGuide](v149, "focusHolderRightFocusGuide");
  v98 = (id)-[UIFocusGuide widthAnchor](v99, "widthAnchor");
  v97 = (id)objc_msgSend(v98, "constraintEqualToConstant:", 1.0);
  v150[4] = v97;
  v96 = -[CPSMapTemplateViewController focusHolderRightFocusGuide](v149, "focusHolderRightFocusGuide");
  v95 = (id)-[UIFocusGuide leftAnchor](v96, "leftAnchor");
  v94 = -[CPSMapTemplateViewController focusHoldingButton](v149, "focusHoldingButton");
  v93 = (id)-[_CPSFocusHoldingButton rightAnchor](v94, "rightAnchor");
  v92 = (id)objc_msgSend(v95, "constraintEqualToAnchor:");
  v150[5] = v92;
  v91 = -[CPSMapTemplateViewController focusHolderRightFocusGuide](v149, "focusHolderRightFocusGuide");
  v90 = (id)-[UIFocusGuide bottomAnchor](v91, "bottomAnchor");
  v89 = -[CPSMapTemplateViewController focusHoldingButton](v149, "focusHoldingButton");
  v88 = (id)-[_CPSFocusHoldingButton bottomAnchor](v89, "bottomAnchor");
  v87 = (id)objc_msgSend(v90, "constraintEqualToAnchor:");
  v150[6] = v87;
  v86 = -[CPSMapTemplateViewController focusHolderRightFocusGuide](v149, "focusHolderRightFocusGuide");
  v85 = (id)-[UIFocusGuide topAnchor](v86, "topAnchor");
  v84 = -[CPSMapTemplateViewController focusHoldingButton](v149, "focusHoldingButton");
  v83 = (id)-[_CPSFocusHoldingButton topAnchor](v84, "topAnchor");
  v82 = (id)objc_msgSend(v85, "constraintEqualToAnchor:");
  v150[7] = v82;
  v81 = -[CPSMapTemplateViewController focusHoldingButton](v149, "focusHoldingButton");
  v80 = (id)-[_CPSFocusHoldingButton widthAnchor](v81, "widthAnchor");
  v79 = (id)objc_msgSend(v80, "constraintEqualToConstant:", 1.0);
  v150[8] = v79;
  v78 = -[CPSMapTemplateViewController focusHoldingButton](v149, "focusHoldingButton");
  v77 = (id)-[_CPSFocusHoldingButton heightAnchor](v78, "heightAnchor");
  v76 = (id)objc_msgSend(v77, "constraintEqualToConstant:", 1.0);
  v150[9] = v76;
  v75 = -[CPSMapTemplateViewController focusHoldingButton](v149, "focusHoldingButton");
  v74 = (id)-[_CPSFocusHoldingButton topAnchor](v75, "topAnchor");
  v73 = (id)objc_msgSend(v146, "safeAreaLayoutGuide");
  v72 = (id)objc_msgSend(v73, "topAnchor");
  v71 = (id)objc_msgSend(v74, "constraintEqualToAnchor:");
  v150[10] = v71;
  v70 = -[CPSMapTemplateViewController focusHoldingButton](v149, "focusHoldingButton");
  v69 = (id)-[_CPSFocusHoldingButton leftAnchor](v70, "leftAnchor");
  v68 = (id)objc_msgSend(v146, "safeAreaLayoutGuide");
  v67 = (id)objc_msgSend(v68, "leftAnchor");
  v66 = (id)objc_msgSend(v69, "constraintEqualToAnchor:");
  v150[11] = v66;
  v65 = (id)objc_msgSend(v121, "topAnchor");
  v64 = (id)objc_msgSend(v146, "safeAreaLayoutGuide");
  v63 = (id)objc_msgSend(v64, "topAnchor");
  v62 = (id)objc_msgSend(v65, "constraintEqualToAnchor:");
  v150[12] = v62;
  v61 = (id)objc_msgSend(v121, "bottomAnchor");
  v60 = (id)objc_msgSend(v146, "safeAreaLayoutGuide");
  v59 = (id)objc_msgSend(v60, "bottomAnchor");
  v58 = (id)objc_msgSend(v61, "constraintEqualToAnchor:");
  v150[13] = v58;
  v57 = (id)objc_msgSend(v121, "leftAnchor");
  v56 = (id)objc_msgSend(v146, "safeAreaLayoutGuide");
  v55 = (id)objc_msgSend(v56, "leftAnchor");
  v54 = (id)objc_msgSend(v57, "constraintEqualToAnchor:");
  v150[14] = v54;
  v53 = (id)objc_msgSend(v121, "rightAnchor");
  v52 = (id)objc_msgSend(v146, "safeAreaLayoutGuide");
  v51 = (id)objc_msgSend(v52, "rightAnchor");
  v50 = (id)objc_msgSend(v53, "constraintEqualToAnchor:");
  v150[15] = v50;
  v49 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v150, 16);
  objc_msgSend(v48, "activateConstraints:");

  -[CPSMapTemplateViewController _createNavigationCardViewController](v149, "_createNavigationCardViewController");
  -[CPSMapTemplateViewController _createNavigationCardViewLayoutHelperView](v149, "_createNavigationCardViewLayoutHelperView");
  -[CPSMapTemplateViewController _updateSafeArea](v149, "_updateSafeArea");
  objc_storeStrong(&v121, 0);
  objc_storeStrong(&v122, 0);
  objc_storeStrong(&v123, 0);
  objc_storeStrong(v124, 0);
  objc_storeStrong(&v125, 0);
  objc_storeStrong((id *)&v126, 0);
  objc_storeStrong(&v127, 0);
  objc_storeStrong(&v128, 0);
  objc_storeStrong(&v129, 0);
  objc_storeStrong(&v135, 0);
  objc_storeStrong(&v144, 0);
  objc_storeStrong(&v145, 0);
  objc_storeStrong(&v146, 0);
}

- (void)_setMaximumVisibleMapButtons:(unint64_t)a3
{
  unint64_t v3;

  v3 = a3;
  if (a3 > 4)
    v3 = 4;
  if (v3 != -[CPSMapTemplateViewController maximumMapButtonCount](self, "maximumMapButtonCount"))
  {
    -[CPSMapTemplateViewController setMaximumMapButtonCount:](self, "setMaximumMapButtonCount:", v3);
    -[CPSMapTemplateViewController _updateMapButtonVisibility](self, "_updateMapButtonVisibility");
  }
}

- (void)_updateMapButtonVisibility
{
  void *v2;
  void *v3;
  NSMutableArray *v4;
  unint64_t v5;
  uint64_t v6;
  int v7;
  int v8;
  unint64_t (*v9)(uint64_t);
  void *v10;
  id v11[3];
  unint64_t v12;
  void *v13;
  void *v14;
  SEL v15;
  CPSMapTemplateViewController *v16;

  v16 = self;
  v15 = a2;
  v14 = 0;
  v4 = -[CPSMapTemplateViewController mapButtons](self, "mapButtons");
  v5 = -[NSMutableArray count](v4, "count");

  v13 = (void *)v5;
  v12 = -[CPSMapTemplateViewController maximumMapButtonCount](v16, "maximumMapButtonCount");
  if (v5 >= v12)
    v3 = (void *)v12;
  else
    v3 = v13;
  v11[2] = v3;
  v14 = v3;
  v2 = (void *)MEMORY[0x24BDF6F90];
  v6 = MEMORY[0x24BDAC760];
  v7 = -1073741824;
  v8 = 0;
  v9 = __58__CPSMapTemplateViewController__updateMapButtonVisibility__block_invoke;
  v10 = &unk_24E26FB48;
  v11[0] = v16;
  v11[1] = v14;
  objc_msgSend(v2, "performWithoutAnimation:", &v6);
  objc_storeStrong(v11, 0);
}

unint64_t __58__CPSMapTemplateViewController__updateMapButtonVisibility__block_invoke(uint64_t a1)
{
  unint64_t result;
  id v2;
  id v3;
  id v4;
  BOOL v5;
  id v6;
  id v7;
  id v8;
  BOOL v9;
  id v11;
  unint64_t v12;
  unint64_t j;
  unint64_t i;

  v11 = (id)objc_msgSend(*(id *)(a1 + 32), "mapButtons");
  v12 = objc_msgSend(v11, "count") - *(_QWORD *)(a1 + 40);

  for (i = 0; i < v12; ++i)
  {
    v8 = (id)objc_msgSend(*(id *)(a1 + 32), "mapButtons");
    v9 = i >= objc_msgSend(v8, "count");

    if (!v9)
    {
      v7 = (id)objc_msgSend(*(id *)(a1 + 32), "mapButtons");
      v6 = (id)objc_msgSend(v7, "objectAtIndexedSubscript:", i);
      objc_msgSend(v6, "setHidden:", 1);

    }
  }
  for (j = v12; ; ++j)
  {
    result = objc_msgSend(*(id *)(a1 + 32), "maximumMapButtonCount");
    if (j >= result)
      break;
    v4 = (id)objc_msgSend(*(id *)(a1 + 32), "mapButtons");
    v5 = j >= objc_msgSend(v4, "count");

    if (!v5)
    {
      v3 = (id)objc_msgSend(*(id *)(a1 + 32), "mapButtons");
      v2 = (id)objc_msgSend(v3, "objectAtIndexedSubscript:", j);
      objc_msgSend(v2, "setHidden:", 0);

    }
  }
  return result;
}

- (void)_updateMapButtonsWithButtons:(id)a3
{
  id v3;
  id v4;
  NSArray *v5;
  UIStackView *v6;
  NSMutableArray *v7;
  id v8;
  id v9;
  CPMapTemplate *v10;
  BOOL v11;
  uint64_t v12;
  int v13;
  int v14;
  void (*v15)(id *, void *, char *, void *);
  void *v16;
  CPSMapTemplateViewController *v17;
  int v18;
  id location[2];
  CPSMapTemplateViewController *v20;

  v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = (id)-[CPSMapTemplateViewController viewIfLoaded](v20, "viewIfLoaded");
  v11 = v3 != 0;

  if (v11)
  {
    v6 = -[CPSMapTemplateViewController trailingBottomStackView](v20, "trailingBottomStackView");
    v5 = -[UIStackView arrangedSubviews](v6, "arrangedSubviews");
    v4 = (id)-[NSArray copy](v5, "copy");
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", &__block_literal_global_17);

    v7 = -[CPSMapTemplateViewController mapButtons](v20, "mapButtons");
    -[NSMutableArray removeAllObjects](v7, "removeAllObjects");

    v8 = location[0];
    v12 = MEMORY[0x24BDAC760];
    v13 = -1073741824;
    v14 = 0;
    v15 = __61__CPSMapTemplateViewController__updateMapButtonsWithButtons___block_invoke_2;
    v16 = &unk_24E271438;
    v17 = v20;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", &v12);
    -[CPSMapTemplateViewController _updateMapButtonVisibility](v20, "_updateMapButtonVisibility");
    -[CPSMapTemplateViewController _updateSafeArea](v20, "_updateSafeArea");
    objc_storeStrong((id *)&v17, 0);
    v18 = 0;
  }
  else
  {
    v9 = location[0];
    v10 = -[CPSMapTemplateViewController mapTemplate](v20, "mapTemplate");
    -[CPMapTemplate setMapButtons:](v10, "setMapButtons:", v9);

    v18 = 1;
  }
  objc_storeStrong(location, 0);
}

void __61__CPSMapTemplateViewController__updateMapButtonsWithButtons___block_invoke(void *a1, void *a2)
{
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  objc_msgSend(location[0], "removeFromSuperview");
  objc_storeStrong(location, 0);
}

void __61__CPSMapTemplateViewController__updateMapButtonsWithButtons___block_invoke_2(id *a1, void *a2, char *a3, void *a4)
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v17;
  id v18[4];
  id location[2];
  _QWORD v20[2];
  _QWORD v21[6];

  v21[5] = *MEMORY[0x24BDAC8D0];
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v18[3] = a3;
  v18[2] = a4;
  v18[1] = a1;
  v18[0] = +[CPSMapButton buttonWithCPMapButton:](CPSMapButton, "buttonWithCPMapButton:", location[0]);
  objc_msgSend(v18[0], "setDelegate:", a1[4]);
  v17 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("CPSMapButton%lu"), a3 + 1);
  objc_msgSend(v18[0], "setAccessibilityLabel:");

  if ((unint64_t)a3 <= 3)
    __asm { BR              X8 }
  v13 = CPSLocalizedStringForKey(CFSTR("ACCESSIBILITY_MAP_BUTTON"));
  v21[0] = v13;
  v12 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 1);
  objc_msgSend(v18[0], "setAccessibilityUserInputLabels:");

  v4 = v18[0];
  v9 = (id)objc_msgSend(v18[0], "widthAnchor");
  v8 = (id)objc_msgSend(v9, "constraintEqualToConstant:");
  v20[0] = v8;
  v7 = (id)objc_msgSend(v18[0], "heightAnchor");
  v6 = (id)objc_msgSend(v7, "constraintEqualToConstant:", 30.0);
  v20[1] = v6;
  v5 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 2);
  objc_msgSend(v4, "addConstraints:");

  v10 = (id)objc_msgSend(a1[4], "trailingBottomStackView");
  objc_msgSend(v10, "addArrangedSubview:", v18[0]);

  v11 = (id)objc_msgSend(a1[4], "mapButtons");
  objc_msgSend(v11, "addObject:", v18[0]);

  objc_storeStrong(v18, 0);
  objc_storeStrong(location, 0);
}

- (void)viewDidAppear:(BOOL)a3
{
  CPSNavigationAlertQueue *v3;
  void *v4;
  id v5;
  id v6;
  UITapGestureRecognizer *v7;
  CPSNavigationAlertQueue *v8;
  CPNavigationAlert *v9;
  id location;
  objc_super v11;
  BOOL v12;
  SEL v13;
  CPSMapTemplateViewController *v14;

  v14 = self;
  v13 = a2;
  v12 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CPSMapTemplateViewController;
  -[CPSBaseTemplateViewController viewDidAppear:](&v11, sel_viewDidAppear_, a3);
  v4 = (void *)objc_opt_class();
  v6 = (id)-[CPSMapTemplateViewController view](v14, "view");
  v5 = (id)objc_msgSend(v6, "window");
  location = CPSSafeCast_23(v4, v5);

  objc_msgSend(location, "addEventObserver:", v14);
  -[CPSMapTemplateViewController _setFocusHoldersEnabled:](v14, "_setFocusHoldersEnabled:", 0);
  -[CPSMapTemplateViewController _setAutoHideDisabled:forRequester:](v14, "_setAutoHideDisabled:forRequester:", 0, CFSTR("MapTemplateRequester"));
  v7 = -[CPSMapTemplateViewController navBarHideTapGestureRecognizer](v14, "navBarHideTapGestureRecognizer");
  -[UITapGestureRecognizer setEnabled:](v7, "setEnabled:", 1);

  -[CPSMapTemplateViewController _resetAutoHideTimerAndShowBarAnimated:allowFocusDeferral:](v14, "_resetAutoHideTimerAndShowBarAnimated:allowFocusDeferral:", 1, 1);
  -[CPSMapTemplateViewController _updateSafeArea](v14, "_updateSafeArea");
  v8 = -[CPSMapTemplateViewController navigationAlertQueue](v14, "navigationAlertQueue");
  v9 = -[CPSNavigationAlertQueue currentAlert](v8, "currentAlert");

  if (v9)
  {
    v3 = -[CPSMapTemplateViewController navigationAlertQueue](v14, "navigationAlertQueue");
    -[CPSNavigationAlertQueue beginAnimatingAlertIfPossible](v3, "beginAnimatingAlertIfPossible");

  }
  objc_storeStrong(&location, 0);
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v3;
  id v4;
  id v5;
  UITapGestureRecognizer *v6;
  NSTimer *v7;
  id v8;
  objc_super v9;
  BOOL v10;
  SEL v11;
  CPSMapTemplateViewController *v12;

  v12 = self;
  v11 = a2;
  v10 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CPSMapTemplateViewController;
  -[CPSBaseTemplateViewController viewWillDisappear:](&v9, sel_viewWillDisappear_, a3);
  v3 = (void *)objc_opt_class();
  v5 = (id)-[CPSMapTemplateViewController view](v12, "view");
  v4 = (id)objc_msgSend(v5, "window");
  v8 = CPSSafeCast_23(v3, v4);

  objc_msgSend(v8, "removeEventObserver:", v12);
  -[CPSMapTemplateViewController _setAutoHideDisabled:forRequester:](v12, "_setAutoHideDisabled:forRequester:", 1, CFSTR("MapTemplateRequester"));
  v6 = -[CPSMapTemplateViewController navBarHideTapGestureRecognizer](v12, "navBarHideTapGestureRecognizer");
  -[UITapGestureRecognizer setEnabled:](v6, "setEnabled:", 0);

  v7 = -[CPSMapTemplateViewController autoHideTimer](v12, "autoHideTimer");
  -[NSTimer invalidate](v7, "invalidate");

  -[CPSMapTemplateViewController setAutoHideTimer:](v12, "setAutoHideTimer:");
  objc_storeStrong(&v8, 0);
}

- (void)viewDidLayoutSubviews
{
  objc_super v2;
  SEL v3;
  CPSMapTemplateViewController *v4;

  v4 = self;
  v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)CPSMapTemplateViewController;
  -[CPSMapTemplateViewController viewDidLayoutSubviews](&v2, sel_viewDidLayoutSubviews);
  -[CPSMapTemplateViewController _calculateAndUpdateCardWidthConstraint](v4, "_calculateAndUpdateCardWidthConstraint");
}

- (void)setPreviewsView:(id)a3
{
  CPSTripPreviewsCardView *v3;
  id location[2];
  CPSMapTemplateViewController *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (v5->_previewsView != location[0])
  {
    v3 = -[CPSMapTemplateViewController previewsView](v5, "previewsView");
    -[CPSTripPreviewsCardView removeFromSuperview](v3, "removeFromSuperview");

    objc_storeStrong((id *)&v5->_previewsView, location[0]);
    if (v5->_previewsView)
      -[CPSMapTemplateViewController _setAutoHideDisabled:forRequester:](v5, "_setAutoHideDisabled:forRequester:", 1, CFSTR("PreviewCardRequester"));
    else
      -[CPSMapTemplateViewController _setAutoHideDisabled:forRequester:](v5, "_setAutoHideDisabled:forRequester:", 0, CFSTR("PreviewCardRequester"));
  }
  objc_storeStrong(location, 0);
}

- (void)_reloadPreviewsView
{
  CPSRoutePreviewsCardView *v2;
  id v3;
  CPSPagingTripPreviewsCardView *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  BOOL v12;
  double v13;
  double v14;
  double v15;
  CPSNavigationCardViewController *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  CPSNavigationCardViewController *v33;
  BOOL v34;
  id v35;
  id v36;
  id v37;
  CGFloat v38;
  CPSNavigationCardViewController *v39;
  CPSNavigationAlertView *v40;
  CPSNavigationAlertQueue *v41;
  CPSTripPreviewsCardView *v42;
  CPSTripPreviewsCardView *v43;
  id v44;
  uint64_t v45;
  void *v46;
  CPSTripPreviewsCardView *v47;
  id v48;
  unint64_t v49;
  CPSMapTemplateViewController *v50;
  CPSPagingTripPreviewsCardView *v51;
  CPTripPreviewTextConfiguration *v52;
  CPSMapTemplateViewController *v53;
  CPSRoutePreviewsCardView *v54;
  CPTripPreviewTextConfiguration *v55;
  NSObject *log;
  os_log_type_t type;
  id v58;
  uint64_t v59;
  int v60;
  int v61;
  void (*v62)(id *);
  void *v63;
  id v64;
  CPSMapTemplateViewController *v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  CGRect v71;
  id v72;
  id v73;
  double v74;
  char v75;
  id v76;
  char v77;
  id v78;
  id v79;
  char v80;
  id v81;
  char v82;
  id v83;
  char v84;
  id v85;
  char v86;
  id v87;
  char v88;
  id v89;
  char v90;
  id v91;
  id v92;
  CGRect rect;
  double v94;
  uint64_t v95;
  int v96;
  int v97;
  uint64_t (*v98)(uint64_t);
  void *v99;
  CPSMapTemplateViewController *v100;
  id v101;
  uint64_t v102;
  int v103;
  int v104;
  uint64_t (*v105)(uint64_t);
  void *v106;
  id v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  id v112;
  id v114;
  id v115;
  uint8_t v116[15];
  char v117;
  id location[2];
  CPSMapTemplateViewController *v119;
  _QWORD v120[7];
  CGRect v121;
  CGRect v122;

  v120[6] = *MEMORY[0x24BDAC8D0];
  v119 = self;
  location[1] = (id)a2;
  location[0] = CarPlaySupportGeneralLogging();
  v117 = 2;
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEBUG))
  {
    log = location[0];
    type = v117;
    __os_log_helper_16_0_0(v116);
    _os_log_debug_impl(&dword_21E389000, log, type, "_setupPreviewsView", v116, 2u);
  }
  objc_storeStrong(location, 0);
  v115 = 0;
  v114 = -[CPSMapTemplateViewController tripPreviews](v119, "tripPreviews");
  if (objc_msgSend(v114, "count") != 0)
  {
    if (-[CPSMapTemplateViewController previewOnlyRouteChoices](v119, "previewOnlyRouteChoices"))
    {
      v54 = [CPSRoutePreviewsCardView alloc];
      v53 = v119;
      v55 = -[CPSMapTemplateViewController tripPreviewTextConfiguration](v119, "tripPreviewTextConfiguration");
      v2 = -[CPSRoutePreviewsCardView initWithTripDelegate:trips:textConfiguration:](v54, "initWithTripDelegate:trips:textConfiguration:", v53, v114);
      v3 = v115;
      v115 = v2;

    }
    else
    {
      v51 = [CPSPagingTripPreviewsCardView alloc];
      v50 = v119;
      v52 = -[CPSMapTemplateViewController tripPreviewTextConfiguration](v119, "tripPreviewTextConfiguration");
      v4 = -[CPSPagingTripPreviewsCardView initWithTripDelegate:trips:textConfiguration:](v51, "initWithTripDelegate:trips:textConfiguration:", v50, v114);
      v5 = v115;
      v115 = v4;

      -[CPSMapTemplateViewController previewSelectedIndex](v119, "previewSelectedIndex");
      v49 = objc_msgSend(v114, "count");
      if (v49 > -[CPSMapTemplateViewController previewSelectedIndex](v119, "previewSelectedIndex"))
      {
        v48 = (id)objc_msgSend(v114, "objectAtIndex:", -[CPSMapTemplateViewController previewSelectedIndex](v119, "previewSelectedIndex"));
        objc_msgSend(v115, "setSelectedTrip:");

      }
    }
  }
  else
  {
    v47 = -[CPSMapTemplateViewController previewsView](v119, "previewsView");

    if (v47)
    {
      v42 = -[CPSMapTemplateViewController previewsView](v119, "previewsView");
      v112 = (id)-[CPSTripPreviewsCardView snapshotViewAfterScreenUpdates:](v42, "snapshotViewAfterScreenUpdates:", 1);

      v110 = 0u;
      v111 = 0u;
      v43 = -[CPSMapTemplateViewController previewsView](v119, "previewsView");
      -[CPSTripPreviewsCardView frame](v43, "frame");
      *(_QWORD *)&v110 = v6;
      *((_QWORD *)&v110 + 1) = v7;
      *(_QWORD *)&v111 = v8;
      *((_QWORD *)&v111 + 1) = v9;

      v44 = (id)-[CPSMapTemplateViewController view](v119, "view");
      objc_msgSend(v44, "addSubview:", v112);

      objc_msgSend(v112, "setFrame:", v110, v111);
      v46 = (void *)MEMORY[0x24BDF6F90];
      v45 = MEMORY[0x24BDAC760];
      v102 = MEMORY[0x24BDAC760];
      v103 = -1073741824;
      v104 = 0;
      v105 = __51__CPSMapTemplateViewController__reloadPreviewsView__block_invoke;
      v106 = &unk_24E26F140;
      v107 = v112;
      v108 = v110;
      v109 = v111;
      v95 = v45;
      v96 = -1073741824;
      v97 = 0;
      v98 = __51__CPSMapTemplateViewController__reloadPreviewsView__block_invoke_2;
      v99 = &unk_24E2712D8;
      v100 = v119;
      v101 = v112;
      objc_msgSend(v46, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 4, &v102, &v95, 0.4, 0.0, 10.0);
      objc_storeStrong(&v101, 0);
      objc_storeStrong((id *)&v100, 0);
      objc_storeStrong(&v107, 0);
      objc_storeStrong(&v112, 0);
    }
    else
    {
      v39 = -[CPSMapTemplateViewController navigationCardViewController](v119, "navigationCardViewController");
      -[CPSNavigationCardViewController setNavigationCardHidden:forRequester:animated:completion:](v39, "setNavigationCardHidden:forRequester:animated:completion:", 0);

      -[CPSMapTemplateViewController _setETAViewHidden:forRequester:animated:](v119, "_setETAViewHidden:forRequester:animated:", 0, CFSTR("PreviewCardRequester"), 1);
      v41 = -[CPSMapTemplateViewController navigationAlertQueue](v119, "navigationAlertQueue");
      v40 = -[CPSNavigationAlertQueue currentAlertView](v41, "currentAlertView");
      -[CPSNavigationAlertView setHidden:](v40, "setHidden:", 0);

    }
  }
  -[CPSMapTemplateViewController setPreviewsView:](v119, "setPreviewsView:", v115);
  if (v115)
  {
    v35 = (id)-[CPSMapTemplateViewController view](v119, "view");
    objc_msgSend(v35, "addSubview:", v115);

    v37 = (id)-[CPSMapTemplateViewController view](v119, "view");
    v36 = (id)objc_msgSend(v37, "safeAreaLayoutGuide");
    objc_msgSend(v36, "layoutFrame");
    rect = v121;
    v38 = CGRectGetHeight(v121) - 16.0;

    v94 = v38;
    v90 = 0;
    v88 = 0;
    v86 = 0;
    v84 = 0;
    v82 = 0;
    v80 = 0;
    if (-[CPSMapTemplateViewController rightHandDrive](v119, "rightHandDrive"))
    {
      v91 = (id)-[CPSMapTemplateViewController view](v119, "view");
      v90 = 1;
      v89 = (id)objc_msgSend(v91, "safeAreaLayoutGuide");
      v88 = 1;
      v87 = (id)objc_msgSend(v89, "rightAnchor");
      v86 = 1;
      v10 = v87;
    }
    else
    {
      v85 = (id)-[CPSMapTemplateViewController view](v119, "view");
      v84 = 1;
      v83 = (id)objc_msgSend(v85, "safeAreaLayoutGuide");
      v82 = 1;
      v81 = (id)objc_msgSend(v83, "leftAnchor");
      v80 = 1;
      v10 = v81;
    }
    v92 = v10;
    if ((v80 & 1) != 0)

    if ((v82 & 1) != 0)
    if ((v84 & 1) != 0)

    if ((v86 & 1) != 0)
    if ((v88 & 1) != 0)

    if ((v90 & 1) != 0)
    v77 = 0;
    v75 = 0;
    if (-[CPSMapTemplateViewController rightHandDrive](v119, "rightHandDrive"))
    {
      v78 = (id)objc_msgSend(v115, "rightAnchor");
      v77 = 1;
      v11 = v78;
    }
    else
    {
      v76 = (id)objc_msgSend(v115, "leftAnchor");
      v75 = 1;
      v11 = v76;
    }
    v79 = v11;
    if ((v75 & 1) != 0)

    if ((v77 & 1) != 0)
    v74 = 0.0;
    v12 = -[CPSMapTemplateViewController rightHandDrive](v119, "rightHandDrive");
    v13 = -8.0;
    if (!v12)
      v13 = 8.0;
    v74 = v13;
    v18 = (id)-[CPSMapTemplateViewController view](v119, "view");
    v17 = (id)objc_msgSend(v18, "safeAreaLayoutGuide");
    v73 = (id)objc_msgSend(v17, "bottomAnchor");

    v20 = (id)objc_msgSend(v115, "bottomAnchor");
    v19 = (id)-[CPSMapTemplateViewController view](v119, "view");
    objc_msgSend(v19, "bounds");
    v71 = v122;
    v72 = (id)objc_msgSend(v20, "constraintEqualToAnchor:constant:", v73, -CGRectGetHeight(v122));

    v21 = (id)objc_msgSend(v115, "widthAnchor");
    v70 = (id)objc_msgSend(v21, "constraintGreaterThanOrEqualToConstant:", 140.0);

    objc_msgSend(v70, "setPriority:");
    v22 = (id)objc_msgSend(v115, "widthAnchor");
    v69 = (id)objc_msgSend(v22, "constraintLessThanOrEqualToConstant:", 213.0);

    LODWORD(v14) = 1148846080;
    objc_msgSend(v69, "setPriority:", v14);
    v26 = (id)objc_msgSend(v115, "widthAnchor");
    v25 = (id)-[CPSMapTemplateViewController view](v119, "view");
    v24 = (id)objc_msgSend(v25, "safeAreaLayoutGuide");
    v23 = (id)objc_msgSend(v24, "widthAnchor");
    v68 = (id)objc_msgSend(v26, "constraintEqualToAnchor:multiplier:", 0.4);

    LODWORD(v15) = 1148829696;
    objc_msgSend(v68, "setPriority:", v15);
    v27 = (void *)MEMORY[0x24BDD1628];
    v31 = (id)objc_msgSend(v79, "constraintEqualToAnchor:constant:", v92, v74);
    v120[0] = v31;
    v120[1] = v68;
    v120[2] = v70;
    v120[3] = v69;
    v30 = (id)objc_msgSend(v115, "heightAnchor");
    v29 = (id)objc_msgSend(v30, "constraintEqualToConstant:", v94);
    v120[4] = v29;
    v120[5] = v72;
    v28 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v120, 6);
    objc_msgSend(v27, "activateConstraints:");

    v32 = (id)-[CPSMapTemplateViewController view](v119, "view");
    objc_msgSend(v32, "layoutIfNeeded");

    v59 = MEMORY[0x24BDAC760];
    v60 = -1073741824;
    v61 = 0;
    v62 = __51__CPSMapTemplateViewController__reloadPreviewsView__block_invoke_3;
    v63 = &unk_24E270310;
    v64 = v72;
    v65 = v119;
    v66 = v115;
    v67 = (id)MEMORY[0x2207AE654](&v59);
    v33 = -[CPSMapTemplateViewController navigationCardViewController](v119, "navigationCardViewController");
    v34 = -[CPSNavigationCardViewController navigationCardHidden](v33, "navigationCardHidden");

    if (v34)
    {
      -[CPSMapTemplateViewController _setETAViewHidden:forRequester:animated:](v119, "_setETAViewHidden:forRequester:animated:", 1, CFSTR("PreviewCardRequester"), 1);
      (*((void (**)(void))v67 + 2))();
    }
    else
    {
      v16 = -[CPSMapTemplateViewController navigationCardViewController](v119, "navigationCardViewController");
      v58 = v67;
      -[CPSNavigationCardViewController setNavigationCardHidden:forRequester:animated:completion:](v16, "setNavigationCardHidden:forRequester:animated:completion:", 1);

      -[CPSMapTemplateViewController _setETAViewHidden:forRequester:animated:](v119, "_setETAViewHidden:forRequester:animated:", 1, CFSTR("PreviewCardRequester"), 1);
      objc_storeStrong(&v58, 0);
    }
    objc_storeStrong(&v67, 0);
    objc_storeStrong(&v66, 0);
    objc_storeStrong((id *)&v65, 0);
    objc_storeStrong(&v64, 0);
    objc_storeStrong(&v68, 0);
    objc_storeStrong(&v69, 0);
    objc_storeStrong(&v70, 0);
    objc_storeStrong(&v72, 0);
    objc_storeStrong(&v73, 0);
    objc_storeStrong(&v79, 0);
    objc_storeStrong(&v92, 0);
  }
  -[CPSMapTemplateViewController _updateSafeArea](v119, "_updateSafeArea");
  objc_storeStrong(&v114, 0);
  objc_storeStrong(&v115, 0);
}

uint64_t __51__CPSMapTemplateViewController__reloadPreviewsView__block_invoke(uint64_t a1)
{
  CGFloat v1;
  void *v4;
  CGRect v5;

  v4 = *(void **)(a1 + 32);
  v1 = -CGRectGetHeight(*(CGRect *)(a1 + 40)) - 44.0;
  v5 = CGRectOffset(*(CGRect *)(a1 + 40), 0.0, v1);
  return objc_msgSend(v4, "setFrame:", v5.origin.x, v5.origin.y, v5.size.width, v5.size.height);
}

uint64_t __51__CPSMapTemplateViewController__reloadPreviewsView__block_invoke_2(uint64_t a1)
{
  id v2;
  id v3;
  id v4;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "navigationCardViewController");
  objc_msgSend(v2, "setNavigationCardHidden:forRequester:animated:completion:", 0);

  objc_msgSend(*(id *)(a1 + 32), "_setETAViewHidden:forRequester:animated:", 0, CFSTR("PreviewCardRequester"), 1);
  v4 = (id)objc_msgSend(*(id *)(a1 + 32), "navigationAlertQueue");
  v3 = (id)objc_msgSend(v4, "currentAlertView");
  objc_msgSend(v3, "setHidden:", 0);

  return objc_msgSend(*(id *)(a1 + 40), "removeFromSuperview");
}

void __51__CPSMapTemplateViewController__reloadPreviewsView__block_invoke_3(id *a1)
{
  uint64_t v1;
  void *v3;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t (*v7)(uint64_t);
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  int v12;
  int v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16[3];

  v16[2] = a1;
  v16[1] = a1;
  objc_msgSend(a1[4], "setConstant:", -8.0);
  v3 = (void *)MEMORY[0x24BDF6F90];
  v1 = MEMORY[0x24BDAC760];
  v11 = MEMORY[0x24BDAC760];
  v12 = -1073741824;
  v13 = 0;
  v14 = __51__CPSMapTemplateViewController__reloadPreviewsView__block_invoke_4;
  v15 = &unk_24E26F1B8;
  v16[0] = a1[5];
  v4 = v1;
  v5 = -1073741824;
  v6 = 0;
  v7 = __51__CPSMapTemplateViewController__reloadPreviewsView__block_invoke_5;
  v8 = &unk_24E2712D8;
  v9 = a1[5];
  v10 = a1[6];
  objc_msgSend(v3, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 4, &v11, 0.4, 0.0, 10.0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(v16, 0);
}

void __51__CPSMapTemplateViewController__reloadPreviewsView__block_invoke_4(uint64_t a1)
{
  id v1;

  v1 = (id)objc_msgSend(*(id *)(a1 + 32), "view");
  objc_msgSend(v1, "layoutIfNeeded");

}

uint64_t __51__CPSMapTemplateViewController__reloadPreviewsView__block_invoke_5(uint64_t a1)
{
  id v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "setLastFocusedItem:", *(_QWORD *)(a1 + 40));
  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "navigationAlertQueue");
  v2 = (id)objc_msgSend(v3, "currentAlertView");
  objc_msgSend(v2, "setHidden:", 1);

  return objc_msgSend(*(id *)(a1 + 32), "setNeedsFocusUpdate");
}

uint64_t __51__CPSMapTemplateViewController__reloadPreviewsView__block_invoke_6(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2);
}

- (void)_updatePanGestureForHiFiTouch
{
  UIPanGestureRecognizer *v2;
  UIPanGestureRecognizer *v3;
  id v4;
  UIPanGestureRecognizer *v5;
  id v6;
  UITapGestureRecognizer *v7;
  BOOL v8;
  id v9;
  BOOL v10;
  id v11[2];
  CPSMapTemplateViewController *v12;

  v12 = self;
  v11[1] = (id)a2;
  v9 = (id)-[CPSMapTemplateViewController traitCollection](self, "traitCollection");
  v10 = objc_msgSend(v9, "touchLevel") != 0;

  if (v10)
  {
    v5 = -[CPSMapTemplateViewController panGestureRecognizer](v12, "panGestureRecognizer");

    if (v5)
    {
      v4 = (id)-[CPSMapTemplateViewController view](v12, "view");
      v3 = -[CPSMapTemplateViewController panGestureRecognizer](v12, "panGestureRecognizer");
      objc_msgSend(v4, "removeGestureRecognizer:");

      -[CPSMapTemplateViewController setPanGestureRecognizer:](v12, "setPanGestureRecognizer:", 0);
    }
  }
  else
  {
    v2 = -[CPSMapTemplateViewController panGestureRecognizer](v12, "panGestureRecognizer");
    v8 = v2 != 0;

    if (!v8)
    {
      v11[0] = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDF6C38]), "initWithTarget:action:", v12, sel__handlePanGesture_);
      objc_msgSend(v11[0], "setDelegate:", v12);
      objc_msgSend(v11[0], "setAllowedTouchTypes:", &unk_24E29A920);
      objc_msgSend(v11[0], "setDelaysTouchesEnded:", 0);
      v6 = (id)-[CPSMapTemplateViewController view](v12, "view");
      objc_msgSend(v6, "addGestureRecognizer:", v11[0]);

      -[CPSMapTemplateViewController setPanGestureRecognizer:](v12, "setPanGestureRecognizer:", v11[0]);
      v7 = -[CPSMapTemplateViewController hideTapGestureRecognizer](v12, "hideTapGestureRecognizer");
      -[UITapGestureRecognizer requireGestureRecognizerToFail:](v7, "requireGestureRecognizerToFail:", v11[0]);

      objc_storeStrong(v11, 0);
    }
  }
}

- (void)showNavigationAlert:(id)a3 animated:(BOOL)a4
{
  NSObject *queue;
  uint64_t v6;
  int v7;
  int v8;
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  CPSMapTemplateViewController *v12;
  BOOL v13;
  BOOL v14;
  id location[2];
  CPSMapTemplateViewController *v16;

  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v14 = a4;
  queue = MEMORY[0x24BDAC9B8];
  v6 = MEMORY[0x24BDAC760];
  v7 = -1073741824;
  v8 = 0;
  v9 = __61__CPSMapTemplateViewController_showNavigationAlert_animated___block_invoke;
  v10 = &unk_24E270068;
  v11 = location[0];
  v12 = v16;
  v13 = v14;
  dispatch_async(queue, &v6);

  objc_storeStrong((id *)&v12, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
}

void __61__CPSMapTemplateViewController_showNavigationAlert_animated___block_invoke(uint64_t a1)
{
  void *v1;
  NSObject *log;
  os_log_type_t type;
  id v5;
  char v6;
  uint64_t v7;
  int v8;
  int v9;
  uint64_t (*v10)(uint64_t);
  void *v11;
  id v12;
  uint8_t v13[7];
  os_log_type_t v14;
  id location;
  uint64_t v16;
  int v17;
  int v18;
  void (*v19)(uint64_t);
  void *v20;
  id v21;
  id v22;
  char v23;
  id v24[3];

  v24[2] = (id)a1;
  v24[1] = (id)a1;
  v16 = MEMORY[0x24BDAC760];
  v17 = -1073741824;
  v18 = 0;
  v19 = __61__CPSMapTemplateViewController_showNavigationAlert_animated___block_invoke_2;
  v20 = &unk_24E270068;
  v21 = *(id *)(a1 + 32);
  v22 = *(id *)(a1 + 40);
  v23 = *(_BYTE *)(a1 + 48) & 1;
  v24[0] = (id)MEMORY[0x2207AE654](&v16);
  v5 = (id)objc_msgSend(*(id *)(a1 + 40), "navigationAlertQueue");
  v6 = objc_msgSend(v5, "isDisplayingAlert");

  if ((v6 & 1) != 0)
  {
    location = CarPlaySupportGeneralLogging();
    v14 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEFAULT))
    {
      log = location;
      type = v14;
      __os_log_helper_16_0_0(v13);
      _os_log_impl(&dword_21E389000, log, type, "Alert already displayed, dismissing", v13, 2u);
    }
    objc_storeStrong(&location, 0);
    v1 = *(void **)(a1 + 40);
    v7 = MEMORY[0x24BDAC760];
    v8 = -1073741824;
    v9 = 0;
    v10 = __61__CPSMapTemplateViewController_showNavigationAlert_animated___block_invoke_123;
    v11 = &unk_24E270788;
    v12 = v24[0];
    objc_msgSend(v1, "dismissNavigationAlertAnimated:completion:", 1, &v7);
    objc_storeStrong(&v12, 0);
  }
  else
  {
    (*((void (**)(void))v24[0] + 2))();
  }
  objc_storeStrong(v24, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v21, 0);
}

void __61__CPSMapTemplateViewController_showNavigationAlert_animated___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;
  id v3;
  id location[3];
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  location[2] = (id)a1;
  location[1] = (id)a1;
  location[0] = CarPlaySupportGeneralLogging();
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_INFO))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v6, *(_QWORD *)(a1 + 32));
    _os_log_impl(&dword_21E389000, (os_log_t)location[0], OS_LOG_TYPE_INFO, "Presenting navigation alert %@", v6, 0xCu);
  }
  objc_storeStrong(location, 0);
  v3 = (id)objc_msgSend(*(id *)(a1 + 40), "navigationAlertQueue");
  v1 = *(_QWORD *)(a1 + 32);
  v2 = (id)objc_msgSend(*(id *)(a1 + 40), "templateDelegate");
  objc_msgSend(v3, "prepareNavigationAlert:templateDelegate:animated:", v1);

}

uint64_t __61__CPSMapTemplateViewController_showNavigationAlert_animated___block_invoke_123(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)dismissNavigationAlertAnimated:(BOOL)a3 completion:(id)a4
{
  NSObject *queue;
  uint64_t v5;
  int v6;
  int v7;
  void (*v8)(uint64_t);
  void *v9;
  CPSMapTemplateViewController *v10;
  id v11;
  BOOL v12;
  id location;
  BOOL v14;
  SEL v15;
  CPSMapTemplateViewController *v16;

  v16 = self;
  v15 = a2;
  v14 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  queue = MEMORY[0x24BDAC9B8];
  v5 = MEMORY[0x24BDAC760];
  v6 = -1073741824;
  v7 = 0;
  v8 = __74__CPSMapTemplateViewController_dismissNavigationAlertAnimated_completion___block_invoke;
  v9 = &unk_24E271460;
  v10 = v16;
  v12 = v14;
  v11 = location;
  dispatch_async(queue, &v5);

  objc_storeStrong(&v11, 0);
  objc_storeStrong((id *)&v10, 0);
  objc_storeStrong(&location, 0);
}

void __74__CPSMapTemplateViewController_dismissNavigationAlertAnimated_completion___block_invoke(uint64_t a1)
{
  char v1;
  id v2;
  id v3;
  id v5;
  uint64_t v6;
  int v7;
  int v8;
  uint64_t (*v9)(uint64_t);
  void *v10;
  id v11;
  id v12;
  id v13[3];

  v13[2] = (id)a1;
  v13[1] = (id)a1;
  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "navigationAlertQueue");
  v13[0] = (id)objc_msgSend(v3, "currentAlert");

  v5 = (id)objc_msgSend(*(id *)(a1 + 32), "navigationAlertQueue");
  v12 = (id)objc_msgSend(v5, "currentAlertView");

  if (v13[0] && v12)
  {
    v2 = (id)objc_msgSend(*(id *)(a1 + 32), "navigationAlertQueue");
    v1 = *(_BYTE *)(a1 + 48);
    v6 = MEMORY[0x24BDAC760];
    v7 = -1073741824;
    v8 = 0;
    v9 = __74__CPSMapTemplateViewController_dismissNavigationAlertAnimated_completion___block_invoke_2;
    v10 = &unk_24E270CE0;
    v11 = *(id *)(a1 + 40);
    objc_msgSend(v2, "dismissCurrentNavigationAlertAnimated:context:completion:", v1 & 1, 2, &v6);

    objc_storeStrong(&v11, 0);
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  objc_storeStrong(&v12, 0);
  objc_storeStrong(v13, 0);
}

uint64_t __74__CPSMapTemplateViewController_dismissNavigationAlertAnimated_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 1);
}

- (double)_widthForNavigationAlert
{
  double v2;
  id v4;
  id v5;
  double v6;
  double v7;

  v5 = (id)-[CPSMapTemplateViewController view](self, "view");
  v4 = (id)objc_msgSend(v5, "safeAreaLayoutGuide");
  objc_msgSend(v4, "layoutFrame");
  v6 = v2 * 0.4;

  v7 = v6;
  if (v6 < 140.0)
    return 140.0;
  if (v6 > 213.0)
    return 213.0;
  return v7;
}

- (void)_performAlertSizingForAlert:(id)a3 animated:(BOOL)a4
{
  double v4;
  double v5;
  double v6;
  uint64_t v7;
  double v8;
  id v9;
  id v10;
  BOOL v11;
  double v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  NSLayoutConstraint *v18;
  id v19;
  double v20;
  id v22;
  id v23;
  NSLayoutConstraint *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  char v29;
  id v30;
  char v31;
  id v32;
  char v33;
  id v34;
  char v35;
  id v36;
  char v37;
  id v38;
  char v39;
  id v40;
  id v41;
  char v42;
  id v43;
  char v44;
  id v45;
  id v46;
  CGRect v47;
  double v48;
  double v49;
  uint64_t v50;
  double v51;
  double v52;
  BOOL v53;
  id location[2];
  CPSMapTemplateViewController *v55;
  _QWORD v56[4];
  CGRect v57;

  v56[3] = *MEMORY[0x24BDAC8D0];
  v55 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v53 = a4;
  -[CPSMapTemplateViewController _widthForNavigationAlert](v55, "_widthForNavigationAlert");
  v52 = v4;
  v22 = location[0];
  v23 = (id)-[CPSMapTemplateViewController view](v55, "view");
  objc_msgSend(v23, "bounds");
  v47 = v57;
  CGRectGetHeight(v57);
  CGSizeMake_15();
  v48 = v5;
  v49 = v6;
  objc_msgSend(v22, "sizeThatFits:", v5, v6);
  v50 = v7;
  v51 = v8;

  v24 = -[CPSMapTemplateViewController navigationAlertBottomConstraint](v55, "navigationAlertBottomConstraint");
  -[NSLayoutConstraint setActive:](v24, "setActive:", 0);

  v25 = (id)objc_msgSend(location[0], "bottomAnchor");
  v26 = (id)-[CPSMapTemplateViewController view](v55, "view");
  v27 = (id)objc_msgSend(v26, "safeAreaLayoutGuide");
  v28 = (id)objc_msgSend(v27, "bottomAnchor");
  if (a4)
    v20 = v51;
  else
    v20 = -8.0;
  v19 = (id)objc_msgSend(v25, "constraintEqualToAnchor:constant:", v28, v20);
  -[CPSMapTemplateViewController setNavigationAlertBottomConstraint:](v55, "setNavigationAlertBottomConstraint:");

  v44 = 0;
  v42 = 0;
  if (-[CPSMapTemplateViewController rightHandDrive](v55, "rightHandDrive"))
  {
    v45 = (id)objc_msgSend(location[0], "rightAnchor");
    v44 = 1;
    v9 = v45;
  }
  else
  {
    v43 = (id)objc_msgSend(location[0], "leftAnchor");
    v42 = 1;
    v9 = v43;
  }
  v46 = v9;
  if ((v42 & 1) != 0)

  if ((v44 & 1) != 0)
  v39 = 0;
  v37 = 0;
  v35 = 0;
  v33 = 0;
  v31 = 0;
  v29 = 0;
  if (-[CPSMapTemplateViewController rightHandDrive](v55, "rightHandDrive"))
  {
    v40 = (id)-[CPSMapTemplateViewController view](v55, "view");
    v39 = 1;
    v38 = (id)objc_msgSend(v40, "safeAreaLayoutGuide");
    v37 = 1;
    v36 = (id)objc_msgSend(v38, "rightAnchor");
    v35 = 1;
    v10 = v36;
  }
  else
  {
    v34 = (id)-[CPSMapTemplateViewController view](v55, "view");
    v33 = 1;
    v32 = (id)objc_msgSend(v34, "safeAreaLayoutGuide");
    v31 = 1;
    v30 = (id)objc_msgSend(v32, "leftAnchor");
    v29 = 1;
    v10 = v30;
  }
  v41 = v10;
  if ((v29 & 1) != 0)

  if ((v31 & 1) != 0)
  if ((v33 & 1) != 0)

  if ((v35 & 1) != 0)
  if ((v37 & 1) != 0)

  if ((v39 & 1) != 0)
  v13 = (void *)MEMORY[0x24BDD1628];
  v18 = -[CPSMapTemplateViewController navigationAlertBottomConstraint](v55, "navigationAlertBottomConstraint");
  v56[0] = v18;
  v11 = -[CPSMapTemplateViewController rightHandDrive](v55, "rightHandDrive");
  v12 = -8.0;
  if (!v11)
    v12 = 8.0;
  v17 = (id)objc_msgSend(v46, "constraintEqualToAnchor:constant:", v41, v12);
  v56[1] = v17;
  v16 = (id)objc_msgSend(location[0], "widthAnchor");
  v15 = (id)objc_msgSend(v16, "constraintEqualToConstant:", v52);
  v56[2] = v15;
  v14 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v56, 3);
  objc_msgSend(v13, "activateConstraints:");

  objc_msgSend(location[0], "setNeedsLayout");
  objc_storeStrong(&v41, 0);
  objc_storeStrong(&v46, 0);
  objc_storeStrong(location, 0);
}

- (void)updateNavigationAlert:(id)a3
{
  NSObject *queue;
  uint64_t v4;
  int v5;
  int v6;
  void (*v7)(uint64_t);
  void *v8;
  CPSMapTemplateViewController *v9;
  id v10;
  id location[2];
  CPSMapTemplateViewController *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  queue = MEMORY[0x24BDAC9B8];
  v4 = MEMORY[0x24BDAC760];
  v5 = -1073741824;
  v6 = 0;
  v7 = __54__CPSMapTemplateViewController_updateNavigationAlert___block_invoke;
  v8 = &unk_24E26EF28;
  v9 = v12;
  v10 = location[0];
  dispatch_async(queue, &v4);

  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

void __54__CPSMapTemplateViewController_updateNavigationAlert___block_invoke(uint64_t a1)
{
  double v1;
  void *v2;
  id v4;
  uint64_t v5;
  int v6;
  int v7;
  void (*v8)(uint64_t);
  void *v9;
  id v10;
  int v11;
  id v12[3];

  v12[2] = (id)a1;
  v12[1] = (id)a1;
  v4 = (id)objc_msgSend(*(id *)(a1 + 32), "navigationAlertQueue");
  v12[0] = (id)objc_msgSend(v4, "currentAlertView");

  if (v12[0])
  {
    objc_msgSend(v12[0], "updateNavigationAlert:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "_performAlertSizingForAlert:animated:", v12[0], 0);
    v2 = (void *)MEMORY[0x24BDF6F90];
    v1 = *MEMORY[0x24BDF7BD8];
    v5 = MEMORY[0x24BDAC760];
    v6 = -1073741824;
    v7 = 0;
    v8 = __54__CPSMapTemplateViewController_updateNavigationAlert___block_invoke_2;
    v9 = &unk_24E26F1B8;
    v10 = *(id *)(a1 + 32);
    objc_msgSend(v2, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 4, &v5, v1, 0.0, 4.0, 20.0);
    objc_storeStrong(&v10, 0);
    v11 = 0;
  }
  else
  {
    v11 = 1;
  }
  objc_storeStrong(v12, 0);
}

void __54__CPSMapTemplateViewController_updateNavigationAlert___block_invoke_2(uint64_t a1)
{
  id v1;

  v1 = (id)objc_msgSend(*(id *)(a1 + 32), "view");
  objc_msgSend(v1, "layoutIfNeeded");

}

- (void)_setNavigationAlertView:(id)a3 visible:(BOOL)a4 animated:(BOOL)a5 completion:(id)a6
{
  double v6;
  double v7;
  double v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  NSLayoutConstraint *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  CPSLayoutHelperView *v20;
  NSLayoutConstraint *v21;
  void *v22;
  id v23;
  NSLayoutConstraint *v24;
  double v25;
  id v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  id v31;
  NSLayoutConstraint *v32;
  id v33;
  id v34;
  id v35;
  CPSLayoutHelperView *v36;
  NSLayoutConstraint *v37;
  void *v38;
  id v39;
  NSLayoutConstraint *v40;
  uint64_t v41;
  uint64_t v45;
  int v46;
  int v47;
  uint64_t (*v48)(uint64_t);
  void *v49;
  id v50;
  uint64_t v51;
  int v52;
  int v53;
  uint64_t (*v54)(uint64_t);
  void *v55;
  id v56;
  CPSMapTemplateViewController *v57;
  id v58;
  id v59;
  uint64_t v60;
  int v61;
  int v62;
  void (*v63)(uint64_t);
  void *v64;
  CPSMapTemplateViewController *v65;
  id v66;
  uint64_t v67;
  int v68;
  int v69;
  uint64_t (*v70)(uint64_t);
  void *v71;
  id v72;
  uint64_t v73;
  int v74;
  int v75;
  uint64_t (*v76)(uint64_t);
  void *v77;
  CPSMapTemplateViewController *v78;
  id v79;
  id v80;
  id v81;
  uint64_t v82;
  int v83;
  int v84;
  void (*v85)(uint64_t);
  void *v86;
  CPSMapTemplateViewController *v87;
  id v88;
  id v89;
  BOOL v90;
  BOOL v91;
  id location[2];
  CPSMapTemplateViewController *v93;
  NSLayoutConstraint *v94;
  NSLayoutConstraint *v95;
  NSLayoutConstraint *v96;
  _QWORD v97[2];

  v97[1] = *MEMORY[0x24BDAC8D0];
  v93 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v91 = a4;
  v90 = a5;
  v89 = 0;
  objc_storeStrong(&v89, a6);
  if (v91)
  {
    v28 = (id)-[CPSMapTemplateViewController view](v93, "view");
    objc_msgSend(v28, "addSubview:", location[0]);

    -[CPSMapTemplateViewController _performAlertSizingForAlert:animated:](v93, "_performAlertSizingForAlert:animated:", location[0], v90);
    v29 = (id)-[CPSMapTemplateViewController view](v93, "view");
    objc_msgSend(v29, "layoutIfNeeded");

    -[CPSMapTemplateViewController _performAlertSizingForAlert:animated:](v93, "_performAlertSizingForAlert:animated:", location[0], v90);
    v30 = (void *)MEMORY[0x24BDD1628];
    v32 = -[CPSMapTemplateViewController navigationCardViewLayoutViewBottomConstraint](v93, "navigationCardViewLayoutViewBottomConstraint");
    v97[0] = v32;
    v31 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v97);
    objc_msgSend(v30, "deactivateConstraints:");

    v36 = -[CPSMapTemplateViewController navigationCardViewLayoutHelperView](v93, "navigationCardViewLayoutHelperView");
    v35 = (id)-[CPSLayoutHelperView bottomAnchor](v36, "bottomAnchor");
    v34 = (id)objc_msgSend(location[0], "topAnchor");
    v33 = (id)objc_msgSend(v35, "constraintEqualToAnchor:constant:", -8.0);
    -[CPSMapTemplateViewController setNavigationCardViewLayoutViewBottomConstraint:](v93, "setNavigationCardViewLayoutViewBottomConstraint:");

    v37 = -[CPSMapTemplateViewController navigationCardViewLayoutViewBottomConstraint](v93, "navigationCardViewLayoutViewBottomConstraint");
    LODWORD(v6) = 1148846080;
    -[NSLayoutConstraint setPriority:](v37, "setPriority:", v6);

    v38 = (void *)MEMORY[0x24BDD1628];
    v40 = -[CPSMapTemplateViewController navigationCardViewLayoutViewBottomConstraint](v93, "navigationCardViewLayoutViewBottomConstraint");
    v96 = v40;
    v39 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v96, 1);
    objc_msgSend(v38, "activateConstraints:");

    v41 = MEMORY[0x24BDAC760];
    v82 = MEMORY[0x24BDAC760];
    v83 = -1073741824;
    v84 = 0;
    v85 = __84__CPSMapTemplateViewController__setNavigationAlertView_visible_animated_completion___block_invoke;
    v86 = &unk_24E26F1B8;
    v87 = v93;
    v88 = (id)MEMORY[0x2207AE654](&v82);
    v73 = v41;
    v74 = -1073741824;
    v75 = 0;
    v76 = __84__CPSMapTemplateViewController__setNavigationAlertView_visible_animated_completion___block_invoke_2;
    v77 = &unk_24E26FA58;
    v78 = v93;
    v80 = v89;
    v79 = location[0];
    v81 = (id)MEMORY[0x2207AE654](&v73);
    if (v90)
    {
      v27 = (void *)MEMORY[0x24BDF6F90];
      v25 = *MEMORY[0x24BDF7BD8];
      v26 = v88;
      v67 = MEMORY[0x24BDAC760];
      v68 = -1073741824;
      v69 = 0;
      v70 = __84__CPSMapTemplateViewController__setNavigationAlertView_visible_animated_completion___block_invoke_3;
      v71 = &unk_24E270788;
      v72 = v81;
      objc_msgSend(v27, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 4, v26, &v67, v25, 0.0, 4.0, 20.0);
      objc_storeStrong(&v72, 0);
    }
    else
    {
      (*((void (**)(void))v88 + 2))();
      (*((void (**)(void))v81 + 2))();
    }
    objc_storeStrong(&v81, 0);
    objc_storeStrong(&v79, 0);
    objc_storeStrong(&v80, 0);
    objc_storeStrong((id *)&v78, 0);
    objc_storeStrong(&v88, 0);
    objc_storeStrong((id *)&v87, 0);
  }
  else
  {
    v11 = MEMORY[0x24BDAC760];
    v60 = MEMORY[0x24BDAC760];
    v61 = -1073741824;
    v62 = 0;
    v63 = __84__CPSMapTemplateViewController__setNavigationAlertView_visible_animated_completion___block_invoke_4;
    v64 = &unk_24E26F1B8;
    v65 = v93;
    v66 = (id)MEMORY[0x2207AE654](&v60);
    v51 = v11;
    v52 = -1073741824;
    v53 = 0;
    v54 = __84__CPSMapTemplateViewController__setNavigationAlertView_visible_animated_completion___block_invoke_5;
    v55 = &unk_24E26FAD0;
    v56 = location[0];
    v57 = v93;
    v58 = v89;
    v59 = (id)MEMORY[0x2207AE654](&v51);
    objc_msgSend(location[0], "setUserInteractionEnabled:", 0);
    v12 = (void *)MEMORY[0x24BDD1628];
    v14 = -[CPSMapTemplateViewController navigationCardViewLayoutViewBottomConstraint](v93, "navigationCardViewLayoutViewBottomConstraint");
    v95 = v14;
    v13 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v95);
    objc_msgSend(v12, "deactivateConstraints:");

    v20 = -[CPSMapTemplateViewController navigationCardViewLayoutHelperView](v93, "navigationCardViewLayoutHelperView");
    v19 = (id)-[CPSLayoutHelperView bottomAnchor](v20, "bottomAnchor");
    v18 = (id)-[CPSMapTemplateViewController view](v93, "view");
    v17 = (id)objc_msgSend(v18, "safeAreaLayoutGuide");
    v16 = (id)objc_msgSend(v17, "bottomAnchor");
    v15 = (id)objc_msgSend(v19, "constraintEqualToAnchor:constant:", -8.0);
    -[CPSMapTemplateViewController setNavigationCardViewLayoutViewBottomConstraint:](v93, "setNavigationCardViewLayoutViewBottomConstraint:");

    v21 = -[CPSMapTemplateViewController navigationCardViewLayoutViewBottomConstraint](v93, "navigationCardViewLayoutViewBottomConstraint");
    LODWORD(v7) = 1148846080;
    -[NSLayoutConstraint setPriority:](v21, "setPriority:", v7);

    v22 = (void *)MEMORY[0x24BDD1628];
    v24 = -[CPSMapTemplateViewController navigationCardViewLayoutViewBottomConstraint](v93, "navigationCardViewLayoutViewBottomConstraint");
    v94 = v24;
    v23 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v94, 1);
    objc_msgSend(v22, "activateConstraints:");

    if (v90)
    {
      objc_msgSend(location[0], "setNeedsLayout");
      v10 = (void *)MEMORY[0x24BDF6F90];
      v8 = *MEMORY[0x24BDF7BD8];
      v9 = v66;
      v45 = MEMORY[0x24BDAC760];
      v46 = -1073741824;
      v47 = 0;
      v48 = __84__CPSMapTemplateViewController__setNavigationAlertView_visible_animated_completion___block_invoke_6;
      v49 = &unk_24E270788;
      v50 = v59;
      objc_msgSend(v10, "animateWithDuration:delay:options:animations:completion:", 0x10000, v9, &v45, v8, 0.0);
      objc_storeStrong(&v50, 0);
    }
    else
    {
      (*((void (**)(void))v66 + 2))();
      (*((void (**)(void))v59 + 2))();
    }
    objc_storeStrong(&v59, 0);
    objc_storeStrong(&v58, 0);
    objc_storeStrong((id *)&v57, 0);
    objc_storeStrong(&v56, 0);
    objc_storeStrong(&v66, 0);
    objc_storeStrong((id *)&v65, 0);
  }
  objc_storeStrong(&v89, 0);
  objc_storeStrong(location, 0);
}

void __84__CPSMapTemplateViewController__setNavigationAlertView_visible_animated_completion___block_invoke(uint64_t a1)
{
  id v1;
  id v3;

  v1 = (id)objc_msgSend(*(id *)(a1 + 32), "navigationAlertBottomConstraint");
  objc_msgSend(v1, "setConstant:", -8.0);

  objc_msgSend(*(id *)(a1 + 32), "_setETAViewHidden:forRequester:animated:", 1, CFSTR("NavigationAlertRequester"), 0);
  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "view");
  objc_msgSend(v3, "layoutIfNeeded");

}

uint64_t __84__CPSMapTemplateViewController__setNavigationAlertView_visible_animated_completion___block_invoke_2(uint64_t a1)
{
  id v2;
  id v3;

  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "navigationAlertQueue");
  objc_msgSend(v3, "beginAnimatingAlertIfPossible");

  if (*(_QWORD *)(a1 + 48))
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "_updateSafeArea");
  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "lastFocusedItem");
  objc_msgSend(*(id *)(a1 + 32), "setItemFocusedBeforeNavAlert:");

  objc_msgSend(*(id *)(a1 + 32), "setLastFocusedItem:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setShouldRestoreFocusToNavigationBar:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "setNeedsFocusUpdate");
}

uint64_t __84__CPSMapTemplateViewController__setNavigationAlertView_visible_animated_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __84__CPSMapTemplateViewController__setNavigationAlertView_visible_animated_completion___block_invoke_4(uint64_t a1)
{
  double Height;
  id v2;
  id v3;
  id v5;
  CGRect v6;

  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "view");
  objc_msgSend(v3, "bounds");
  Height = CGRectGetHeight(v6);
  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "navigationAlertBottomConstraint");
  objc_msgSend(v2, "setConstant:", Height);

  v5 = (id)objc_msgSend(*(id *)(a1 + 32), "view");
  objc_msgSend(v5, "layoutIfNeeded");

}

uint64_t __84__CPSMapTemplateViewController__setNavigationAlertView_visible_animated_completion___block_invoke_5(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  objc_msgSend(*(id *)(a1 + 40), "_setETAViewHidden:forRequester:animated:", 0, CFSTR("NavigationAlertRequester"), 1);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return objc_msgSend(*(id *)(a1 + 40), "_updateSafeArea");
}

uint64_t __84__CPSMapTemplateViewController__setNavigationAlertView_visible_animated_completion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)navigationAlertQueue:(id)a3 shouldDisplayAlertView:(id)a4 animated:(BOOL)a5
{
  id v5;
  BOOL v6;
  CPSMapTemplateViewController *v7;
  id v8;
  CPMapClientTemplateDelegate *v9;
  CPMapClientTemplateDelegate *v12;
  char v13;
  uint64_t v14;
  int v15;
  int v16;
  void (*v17)(id *);
  void *v18;
  id v19;
  id v20;
  id v21;
  BOOL v22;
  id v23;
  id location[2];
  CPSMapTemplateViewController *v25;

  v25 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v23 = 0;
  objc_storeStrong(&v23, a4);
  v22 = a5;
  v12 = -[CPSMapTemplateViewController mapTemplateDelegate](v25, "mapTemplateDelegate");
  v13 = -[CPMapClientTemplateDelegate conformsToProtocol:](v12, "conformsToProtocol:", &unk_2554528E0);

  if ((v13 & 1) != 0)
  {
    v9 = -[CPSMapTemplateViewController mapTemplateDelegate](v25, "mapTemplateDelegate");
    v8 = (id)objc_msgSend(v23, "navigationAlert");
    -[CPMapClientTemplateDelegate clientNavigationAlertWillAppear:](v9, "clientNavigationAlertWillAppear:");

  }
  objc_initWeak(&v21, v25);
  v7 = v25;
  v5 = v23;
  v6 = v22;
  v14 = MEMORY[0x24BDAC760];
  v15 = -1073741824;
  v16 = 0;
  v17 = __85__CPSMapTemplateViewController_navigationAlertQueue_shouldDisplayAlertView_animated___block_invoke;
  v18 = &unk_24E2704E8;
  objc_copyWeak(&v20, &v21);
  v19 = v23;
  -[CPSMapTemplateViewController _setNavigationAlertView:visible:animated:completion:](v7, "_setNavigationAlertView:visible:animated:completion:", v5, 1, v6, &v14);
  objc_storeStrong(&v19, 0);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&v21);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(location, 0);
}

void __85__CPSMapTemplateViewController_navigationAlertQueue_shouldDisplayAlertView_animated___block_invoke(id *a1)
{
  id v1;
  id v2;
  id v4;
  char v5;
  id location[3];

  location[2] = a1;
  location[1] = a1;
  location[0] = objc_loadWeakRetained(a1 + 5);
  v4 = (id)objc_msgSend(location[0], "mapTemplateDelegate");
  v5 = objc_msgSend(v4, "conformsToProtocol:", &unk_2554528E0);

  if ((v5 & 1) != 0)
  {
    v2 = (id)objc_msgSend(location[0], "mapTemplateDelegate");
    v1 = (id)objc_msgSend(a1[4], "navigationAlert");
    objc_msgSend(v2, "clientNavigationAlertDidAppear:");

  }
  objc_storeStrong(location, 0);
}

- (void)navigationAlertQueue:(id)a3 shouldRemoveAlertView:(id)a4 animated:(BOOL)a5 dismissalContext:(unint64_t)a6 completion:(id)a7
{
  id v7;
  BOOL v8;
  CPSMapTemplateViewController *v9;
  id v10;
  CPMapClientTemplateDelegate *v11;
  CPMapClientTemplateDelegate *v16;
  char v17;
  uint64_t v18;
  int v19;
  int v20;
  void (*v21)(uint64_t);
  void *v22;
  id v23;
  id v24;
  id v25[2];
  id v26;
  id v27;
  void *v28;
  BOOL v29;
  id v30;
  id location[2];
  CPSMapTemplateViewController *v32;

  v32 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v30 = 0;
  objc_storeStrong(&v30, a4);
  v29 = a5;
  v28 = (void *)a6;
  v27 = 0;
  objc_storeStrong(&v27, a7);
  v16 = -[CPSMapTemplateViewController mapTemplateDelegate](v32, "mapTemplateDelegate");
  v17 = -[CPMapClientTemplateDelegate conformsToProtocol:](v16, "conformsToProtocol:", &unk_2554528E0);

  if ((v17 & 1) != 0)
  {
    v11 = -[CPSMapTemplateViewController mapTemplateDelegate](v32, "mapTemplateDelegate");
    v10 = (id)objc_msgSend(v30, "navigationAlert");
    -[CPMapClientTemplateDelegate clientNavigationAlertWillDisappear:context:](v11, "clientNavigationAlertWillDisappear:context:");

  }
  objc_initWeak(&v26, v32);
  v9 = v32;
  v7 = v30;
  v8 = v29;
  v18 = MEMORY[0x24BDAC760];
  v19 = -1073741824;
  v20 = 0;
  v21 = __112__CPSMapTemplateViewController_navigationAlertQueue_shouldRemoveAlertView_animated_dismissalContext_completion___block_invoke;
  v22 = &unk_24E271488;
  objc_copyWeak(v25, &v26);
  v23 = v30;
  v25[1] = v28;
  v24 = v27;
  -[CPSMapTemplateViewController _setNavigationAlertView:visible:animated:completion:](v9, "_setNavigationAlertView:visible:animated:completion:", v7, 0, v8, &v18);
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&v23, 0);
  objc_destroyWeak(v25);
  objc_destroyWeak(&v26);
  objc_storeStrong(&v27, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(location, 0);
}

void __112__CPSMapTemplateViewController_navigationAlertQueue_shouldRemoveAlertView_animated_dismissalContext_completion___block_invoke(uint64_t a1)
{
  id v1;
  id v2;
  id v3;
  id v4;
  char isKindOfClass;
  id v6;
  id v7;
  id v9;
  char v10;
  char v11;
  id v12;
  id location[3];

  location[2] = (id)a1;
  location[1] = (id)a1;
  location[0] = objc_loadWeakRetained((id *)(a1 + 48));
  v9 = (id)objc_msgSend(location[0], "mapTemplateDelegate");
  v10 = objc_msgSend(v9, "conformsToProtocol:", &unk_2554528E0);

  if ((v10 & 1) != 0)
  {
    v7 = (id)objc_msgSend(location[0], "mapTemplateDelegate");
    v6 = (id)objc_msgSend(*(id *)(a1 + 32), "navigationAlert");
    objc_msgSend(v7, "clientNavigationAlertDidDisappear:context:");

  }
  v1 = (id)objc_msgSend(location[0], "itemFocusedBeforeNavAlert");
  objc_msgSend(location[0], "setLastFocusedItem:");

  v2 = (id)objc_msgSend(location[0], "navigationController");
  v3 = (id)objc_msgSend(v2, "navigationBar");
  v4 = (id)objc_msgSend(location[0], "lastFocusedItem");
  v11 = 0;
  isKindOfClass = 1;
  if ((objc_msgSend(v3, "containsView:") & 1) == 0)
  {
    v12 = (id)objc_msgSend(location[0], "lastFocusedItem");
    v11 = 1;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }
  if ((v11 & 1) != 0)

  if ((isKindOfClass & 1) != 0)
    objc_msgSend(location[0], "setShouldRestoreFocusToNavigationBar:", 1);
  objc_msgSend(location[0], "setItemFocusedBeforeNavAlert:", 0);
  objc_msgSend(location[0], "setNeedsFocusUpdate");
  if (*(_QWORD *)(a1 + 40))
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_storeStrong(location, 0);
}

- (BOOL)canAnimateNavigationAlert
{
  CPSMapTemplateViewController *v2;
  id v4;
  BOOL v5;

  v4 = (id)-[CPSMapTemplateViewController navigationController](self, "navigationController");
  v2 = (CPSMapTemplateViewController *)(id)objc_msgSend(v4, "visibleViewController");
  v5 = v2 == self;

  return v5;
}

- (id)_tripDidBegin:(id)a3 withEstimates:(id)a4 forIdentifier:(id)a5
{
  id v5;
  BOOL v6;
  double v7;
  id v8;
  double v9;
  double v10;
  double v11;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  NSLayoutConstraint *v22;
  id v23;
  id v24;
  CPSNavigationCardViewController *v25;
  dispatch_time_t when;
  NSObject *queue;
  CPSNavigator *v28;
  CPSNavigationETAView *v29;
  CPSNavigationETAView *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  BOOL v38;
  CPSNavigationCardViewController *v39;
  id v40;
  CPSNavigator *v41;
  id v42;
  CARSessionStatus *v43;
  CPSTemplateEnvironment *v44;
  CPSNavigatorObserving *v45;
  CPSMapTemplateViewController *v46;
  CPSLayoutHelperView *v47;
  CPSNavigationETAView *v48;
  uint64_t v51;
  int v52;
  int v53;
  uint64_t (*v54)(uint64_t);
  void *v55;
  CPSMapTemplateViewController *v56;
  id v57;
  id v58;
  id v59;
  id v60;
  char v61;
  id v62;
  char v63;
  id v64;
  char v65;
  id v66;
  char v67;
  id v68;
  id v69;
  CPSNavigationETAView *v70;
  _BOOL8 v71;
  CPSNavigator *v72;
  double v73;
  char v74;
  id v75;
  char v76;
  id v77;
  char v78;
  id v79;
  char v80;
  id v81;
  char v82;
  id v83;
  char v84;
  id v85;
  id v86;
  id v87;
  id v88;
  id location[2];
  CPSMapTemplateViewController *v90;
  _QWORD v91[7];

  v91[6] = *MEMORY[0x24BDAC8D0];
  v90 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v88 = 0;
  objc_storeStrong(&v88, a4);
  v87 = 0;
  objc_storeStrong(&v87, a5);
  v84 = 0;
  v82 = 0;
  v80 = 0;
  v78 = 0;
  v76 = 0;
  v74 = 0;
  if (-[CPSMapTemplateViewController rightHandDrive](v90, "rightHandDrive"))
  {
    v85 = (id)-[CPSMapTemplateViewController view](v90, "view");
    v84 = 1;
    v83 = (id)objc_msgSend(v85, "safeAreaLayoutGuide");
    v82 = 1;
    v81 = (id)objc_msgSend(v83, "rightAnchor");
    v80 = 1;
    v5 = v81;
  }
  else
  {
    v79 = (id)-[CPSMapTemplateViewController view](v90, "view");
    v78 = 1;
    v77 = (id)objc_msgSend(v79, "safeAreaLayoutGuide");
    v76 = 1;
    v75 = (id)objc_msgSend(v77, "leftAnchor");
    v74 = 1;
    v5 = v75;
  }
  v86 = v5;
  if ((v74 & 1) != 0)

  if ((v76 & 1) != 0)
  if ((v78 & 1) != 0)

  if ((v80 & 1) != 0)
  if ((v82 & 1) != 0)

  if ((v84 & 1) != 0)
  v73 = 0.0;
  v6 = -[CPSMapTemplateViewController rightHandDrive](v90, "rightHandDrive");
  v7 = -8.0;
  if (!v6)
    v7 = 8.0;
  v73 = v7;
  v39 = -[CPSMapTemplateViewController navigationCardViewController](v90, "navigationCardViewController");
  -[CPSNavigationCardViewController setNavigatingBundleIdentifier:](v39, "setNavigatingBundleIdentifier:", v87);

  v41 = [CPSNavigator alloc];
  v40 = v87;
  v44 = -[CPSBaseTemplateViewController templateEnvironment](v90, "templateEnvironment");
  v43 = -[CPSTemplateEnvironment sessionStatus](v44, "sessionStatus");
  v42 = (id)-[CARSessionStatus currentSession](v43, "currentSession");
  v72 = -[CPSNavigator initWithIdentifier:currentSession:forTrip:](v41, "initWithIdentifier:currentSession:forTrip:", v40);

  v45 = -[CPSMapTemplateViewController navigatorObserver](v90, "navigatorObserver");
  -[CPSNavigatorObserving didCreateNavigator:](v45, "didCreateNavigator:", v72);

  -[CPSNavigator setNavigationOwnershipDelegate:](v72, "setNavigationOwnershipDelegate:", v90);
  -[CPSNavigator addDisplayDelegate:](v72, "addDisplayDelegate:", v90);
  v46 = v90;
  v47 = -[CPSMapTemplateViewController navigationCardViewLayoutHelperView](v90, "navigationCardViewLayoutHelperView");
  -[CPSMapTemplateViewController didChangeLayout:](v46, "didChangeLayout:");

  v48 = -[CPSMapTemplateViewController navigationETAView](v90, "navigationETAView");
  -[CPSNavigationETAView removeFromSuperview](v48, "removeFromSuperview");

  if (!-[CPSMapTemplateViewController hasSetTripEstimateStyle](v90, "hasSetTripEstimateStyle"))
  {
    v37 = (id)-[CPSMapTemplateViewController traitCollection](v90, "traitCollection");
    v38 = objc_msgSend(v37, "userInterfaceStyle") != 1;

    v71 = v38;
    -[CPSMapTemplateViewController setTripEstimateStyle:](v90, "setTripEstimateStyle:", v71);
  }
  v29 = [CPSNavigationETAView alloc];
  v70 = -[CPSNavigationETAView initWithTrip:style:](v29, "initWithTrip:style:", location[0], -[CPSMapTemplateViewController tripEstimateStyle](v90, "tripEstimateStyle"));
  -[CPSNavigationETAView updateEstimates:forManeuver:](v70, "updateEstimates:forManeuver:", v88, 0);
  -[CPSMapTemplateViewController setNavigationETAView:](v90, "setNavigationETAView:", v70);
  v31 = (id)-[CPSMapTemplateViewController view](v90, "view");
  v30 = -[CPSMapTemplateViewController navigationETAView](v90, "navigationETAView");
  objc_msgSend(v31, "addSubview:");

  v36 = (id)-[CPSNavigationETAView bottomAnchor](v70, "bottomAnchor");
  v35 = (id)-[CPSMapTemplateViewController view](v90, "view");
  v34 = (id)objc_msgSend(v35, "safeAreaLayoutGuide");
  v33 = (id)objc_msgSend(v34, "bottomAnchor");
  v32 = (id)objc_msgSend(v36, "constraintEqualToAnchor:constant:", 44.0);
  -[CPSMapTemplateViewController setNavigationETAViewBottomConstraint:](v90, "setNavigationETAViewBottomConstraint:");

  v67 = 0;
  v65 = 0;
  v63 = 0;
  v61 = 0;
  if (-[CPSMapTemplateViewController rightHandDrive](v90, "rightHandDrive"))
  {
    v68 = -[CPSMapTemplateViewController navigationETAView](v90, "navigationETAView");
    v67 = 1;
    v66 = (id)objc_msgSend(v68, "rightAnchor");
    v65 = 1;
    v8 = v66;
  }
  else
  {
    v64 = -[CPSMapTemplateViewController navigationETAView](v90, "navigationETAView");
    v63 = 1;
    v62 = (id)objc_msgSend(v64, "leftAnchor");
    v61 = 1;
    v8 = v62;
  }
  v69 = v8;
  if ((v61 & 1) != 0)

  if ((v63 & 1) != 0)
  if ((v65 & 1) != 0)

  if ((v67 & 1) != 0)
  v13 = (id)-[CPSNavigationETAView heightAnchor](v70, "heightAnchor");
  v60 = (id)objc_msgSend(v13, "constraintEqualToConstant:", 44.0);

  objc_msgSend(v60, "setPriority:");
  v14 = (id)-[CPSNavigationETAView widthAnchor](v70, "widthAnchor");
  v59 = (id)objc_msgSend(v14, "constraintLessThanOrEqualToConstant:", 213.0);

  LODWORD(v9) = 1148846080;
  objc_msgSend(v59, "setPriority:", v9);
  v15 = (id)-[CPSNavigationETAView widthAnchor](v70, "widthAnchor");
  v58 = (id)objc_msgSend(v15, "constraintGreaterThanOrEqualToConstant:", 140.0);

  LODWORD(v10) = 1148846080;
  objc_msgSend(v58, "setPriority:", v10);
  v19 = (id)-[CPSNavigationETAView widthAnchor](v70, "widthAnchor");
  v18 = (id)-[CPSMapTemplateViewController view](v90, "view");
  v17 = (id)objc_msgSend(v18, "safeAreaLayoutGuide");
  v16 = (id)objc_msgSend(v17, "widthAnchor");
  v57 = (id)objc_msgSend(v19, "constraintEqualToAnchor:multiplier:", 0.4);

  LODWORD(v11) = 1148829696;
  objc_msgSend(v57, "setPriority:", v11);
  v20 = (void *)MEMORY[0x24BDD1628];
  v23 = (id)objc_msgSend(v69, "constraintEqualToAnchor:constant:", v86, v73);
  v91[0] = v23;
  v22 = -[CPSMapTemplateViewController navigationETAViewBottomConstraint](v90, "navigationETAViewBottomConstraint");
  v91[1] = v22;
  v91[2] = v60;
  v91[3] = v57;
  v91[4] = v59;
  v91[5] = v58;
  v21 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v91, 6);
  objc_msgSend(v20, "activateConstraints:");

  -[CPSMapTemplateViewController setNavigator:](v90, "setNavigator:", v72);
  -[CPSNavigationETAView layoutIfNeeded](v70, "layoutIfNeeded");
  v24 = (id)-[CPSMapTemplateViewController view](v90, "view");
  objc_msgSend(v24, "layoutIfNeeded");

  -[CPSMapTemplateViewController _setETAViewHidden:forRequester:animated:](v90, "_setETAViewHidden:forRequester:animated:", 1, CFSTR("InitialTripRequester"), 0);
  -[CPSMapTemplateViewController _setETAViewHidden:forRequester:animated:](v90, "_setETAViewHidden:forRequester:animated:", 0);
  v25 = -[CPSMapTemplateViewController navigationCardViewController](v90, "navigationCardViewController");
  -[CPSNavigationCardViewController setNavigationCardHidden:forRequester:animated:completion:](v25, "setNavigationCardHidden:forRequester:animated:completion:", 0, CFSTR("TripEndedRequester"), 1);

  when = dispatch_time(0, 1000000000);
  queue = MEMORY[0x24BDAC9B8];
  v51 = MEMORY[0x24BDAC760];
  v52 = -1073741824;
  v53 = 0;
  v54 = __74__CPSMapTemplateViewController__tripDidBegin_withEstimates_forIdentifier___block_invoke;
  v55 = &unk_24E26F1B8;
  v56 = v90;
  dispatch_after(when, queue, &v51);

  v28 = v72;
  objc_storeStrong((id *)&v56, 0);
  objc_storeStrong(&v57, 0);
  objc_storeStrong(&v58, 0);
  objc_storeStrong(&v59, 0);
  objc_storeStrong(&v60, 0);
  objc_storeStrong(&v69, 0);
  objc_storeStrong((id *)&v70, 0);
  objc_storeStrong((id *)&v72, 0);
  objc_storeStrong(&v86, 0);
  objc_storeStrong(&v87, 0);
  objc_storeStrong(&v88, 0);
  objc_storeStrong(location, 0);
  return v28;
}

uint64_t __74__CPSMapTemplateViewController__tripDidBegin_withEstimates_forIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setETAViewHidden:forRequester:animated:", 0, CFSTR("InitialTripRequester"), 1, a1, a1);
}

- (void)viewSafeAreaInsetsDidChange
{
  double v2;
  void *v3;
  uint64_t v4;
  int v5;
  int v6;
  void (*v7)(uint64_t);
  void *v8;
  id v9[3];

  v9[2] = self;
  v9[1] = (id)a2;
  v3 = (void *)MEMORY[0x24BDF6F90];
  v2 = *MEMORY[0x24BDF7BD8];
  v4 = MEMORY[0x24BDAC760];
  v5 = -1073741824;
  v6 = 0;
  v7 = __59__CPSMapTemplateViewController_viewSafeAreaInsetsDidChange__block_invoke;
  v8 = &unk_24E26F1B8;
  v9[0] = self;
  objc_msgSend(v3, "animateWithDuration:animations:", v2);
  objc_storeStrong(v9, 0);
}

void __59__CPSMapTemplateViewController_viewSafeAreaInsetsDidChange__block_invoke(uint64_t a1)
{
  id v2;
  objc_super v3;
  uint64_t v4;
  uint64_t v5;

  v5 = a1;
  v4 = a1;
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)CPSMapTemplateViewController;
  objc_msgSendSuper2(&v3, sel_viewSafeAreaInsetsDidChange);
  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "view");
  objc_msgSend(v2, "layoutIfNeeded");

}

- (void)navigator:(id)a3 didEndTrip:(BOOL)a4
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  CPSTripPreviewsCardView *v10;
  CPSNavigator *v11;
  CPSNavigationCardViewController *v12;
  CPSTripPreviewsCardView *v13;
  id v14;
  CPSTripPreviewsCardView *v15;
  uint64_t v16;
  double v17;
  void *v18;
  CPSNavigationCardViewController *v20;
  CPSTripPreviewsCardView *v21;
  uint64_t v22;
  int v23;
  int v24;
  uint64_t (*v25)(uint64_t);
  void *v26;
  id v27;
  CPSMapTemplateViewController *v28;
  uint64_t v29;
  int v30;
  int v31;
  void (*v32)(uint64_t);
  void *v33;
  id v34;
  CPSMapTemplateViewController *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  id v40;
  BOOL v41;
  id location[2];
  CPSMapTemplateViewController *v43;

  v43 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v41 = a4;
  v20 = -[CPSMapTemplateViewController navigationCardViewController](v43, "navigationCardViewController");
  -[CPSNavigationCardViewController navigator:didEndTrip:](v20, "navigator:didEndTrip:", location[0], a4);

  v40 = 0;
  v21 = -[CPSMapTemplateViewController previewsView](v43, "previewsView");

  if (v21)
  {
    v13 = -[CPSMapTemplateViewController previewsView](v43, "previewsView");
    v4 = (id)-[CPSTripPreviewsCardView snapshotViewAfterScreenUpdates:](v13, "snapshotViewAfterScreenUpdates:", 0);
    v5 = v40;
    v40 = v4;

    v14 = (id)-[CPSMapTemplateViewController view](v43, "view");
    objc_msgSend(v14, "addSubview:", v40);

    v15 = -[CPSMapTemplateViewController previewsView](v43, "previewsView");
    -[CPSTripPreviewsCardView frame](v15, "frame");
    *(_QWORD *)&v38 = v6;
    *((_QWORD *)&v38 + 1) = v7;
    *(_QWORD *)&v39 = v8;
    *((_QWORD *)&v39 + 1) = v9;

    objc_msgSend(v40, "setFrame:", v38, v39);
    v18 = (void *)MEMORY[0x24BDF6F90];
    v17 = *MEMORY[0x24BDF7BD8];
    v16 = MEMORY[0x24BDAC760];
    v29 = MEMORY[0x24BDAC760];
    v30 = -1073741824;
    v31 = 0;
    v32 = __53__CPSMapTemplateViewController_navigator_didEndTrip___block_invoke;
    v33 = &unk_24E271178;
    v34 = v40;
    v36 = v38;
    v37 = v39;
    v35 = v43;
    v22 = v16;
    v23 = -1073741824;
    v24 = 0;
    v25 = __53__CPSMapTemplateViewController_navigator_didEndTrip___block_invoke_2;
    v26 = &unk_24E2712D8;
    v27 = v40;
    v28 = v43;
    objc_msgSend(v18, "animateWithDuration:delay:options:animations:completion:", 65540, &v29, &v22, v17, 0.0);
    objc_storeStrong((id *)&v28, 0);
    objc_storeStrong(&v27, 0);
    objc_storeStrong((id *)&v35, 0);
    objc_storeStrong(&v34, 0);
  }
  else
  {
    -[CPSMapTemplateViewController _updateSafeArea](v43, "_updateSafeArea");
  }
  v10 = -[CPSMapTemplateViewController previewsView](v43, "previewsView");
  -[CPSTripPreviewsCardView setHidden:](v10, "setHidden:", 1);

  v11 = -[CPSMapTemplateViewController navigator](v43, "navigator");
  -[CPSNavigator invalidate](v11, "invalidate");

  -[CPSMapTemplateViewController setNavigator:](v43, "setNavigator:");
  -[CPSMapTemplateViewController _setETAViewHidden:forRequester:animated:](v43, "_setETAViewHidden:forRequester:animated:", 1);
  v12 = -[CPSMapTemplateViewController navigationCardViewController](v43, "navigationCardViewController");
  -[CPSNavigationCardViewController setNavigationCardHidden:forRequester:animated:completion:](v12, "setNavigationCardHidden:forRequester:animated:completion:", 1, CFSTR("TripEndedRequester"), 1, 0);

  objc_storeStrong(&v40, 0);
  objc_storeStrong(location, 0);
}

void __53__CPSMapTemplateViewController_navigator_didEndTrip___block_invoke(uint64_t a1)
{
  CGFloat v1;
  void *v2;
  id v4;
  CGRect v5;

  v2 = *(void **)(a1 + 32);
  v1 = -CGRectGetHeight(*(CGRect *)(a1 + 48)) - 44.0;
  v5 = CGRectOffset(*(CGRect *)(a1 + 48), 0.0, v1);
  objc_msgSend(v2, "setFrame:", v5.origin.x, v5.origin.y, v5.size.width, v5.size.height);
  v4 = (id)objc_msgSend(*(id *)(a1 + 40), "view");
  objc_msgSend(v4, "layoutIfNeeded");

}

uint64_t __53__CPSMapTemplateViewController_navigator_didEndTrip___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  return objc_msgSend(*(id *)(a1 + 40), "_updateSafeArea");
}

- (void)showManeuvers:(id)a3 usingDisplayStyles:(id)a4
{
  CPSMapTemplateViewController *v5;
  CPSLayoutHelperView *v6;
  CPSNavigationCardViewController *v7;
  id v8;
  id location[2];
  CPSMapTemplateViewController *v10;

  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v8 = 0;
  objc_storeStrong(&v8, a4);
  -[CPSMapTemplateViewController _setETAViewHidden:forRequester:animated:](v10, "_setETAViewHidden:forRequester:animated:", 0, CFSTR("InitialTripRequester"), 1);
  v5 = v10;
  v6 = -[CPSMapTemplateViewController navigationCardViewLayoutHelperView](v10, "navigationCardViewLayoutHelperView");
  -[CPSMapTemplateViewController didChangeLayout:](v5, "didChangeLayout:");

  v7 = -[CPSMapTemplateViewController navigationCardViewController](v10, "navigationCardViewController");
  -[CPSNavigationCardViewController showManeuvers:usingDisplayStyles:](v7, "showManeuvers:usingDisplayStyles:", location[0], v8);

  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
}

- (void)navigator:(id)a3 pausedTripForReason:(unint64_t)a4 description:(id)a5 usingColor:(id)a6
{
  CPSMapTemplateViewController *v9;
  CPSLayoutHelperView *v10;
  CPSNavigationCardViewController *v11;
  id v12;
  id v13;
  unint64_t v14;
  id location[2];
  CPSMapTemplateViewController *v16;

  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v14 = a4;
  v13 = 0;
  objc_storeStrong(&v13, a5);
  v12 = 0;
  objc_storeStrong(&v12, a6);
  -[CPSMapTemplateViewController _setETAViewHidden:forRequester:animated:](v16, "_setETAViewHidden:forRequester:animated:", 0, CFSTR("InitialTripRequester"), 1);
  v9 = v16;
  v10 = -[CPSMapTemplateViewController navigationCardViewLayoutHelperView](v16, "navigationCardViewLayoutHelperView");
  -[CPSMapTemplateViewController didChangeLayout:](v9, "didChangeLayout:");

  v11 = -[CPSMapTemplateViewController navigationCardViewController](v16, "navigationCardViewController");
  -[CPSNavigationCardViewController navigator:pausedTripForReason:description:usingColor:](v11, "navigator:pausedTripForReason:description:usingColor:", location[0], v14, v13, v12);

  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
}

- (void)updateEstimates:(id)a3 forManeuver:(id)a4
{
  CPSNavigationCardViewController *v5;
  id v6;
  id location[2];
  CPSMapTemplateViewController *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = 0;
  objc_storeStrong(&v6, a4);
  v5 = -[CPSMapTemplateViewController navigationCardViewController](v8, "navigationCardViewController");
  -[CPSNavigationCardViewController updateEstimates:forManeuver:](v5, "updateEstimates:forManeuver:", location[0], v6);

  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (void)didSelectButton:(id)a3
{
  CPTemplateDelegate *v3;
  CPTemplateDelegate *v4;
  char v5;
  os_log_t oslog;
  id v7;
  id location[2];
  CPSMapTemplateViewController *v9;
  uint8_t v10[24];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7 = (id)objc_msgSend(location[0], "identifier");
  oslog = (os_log_t)CarPlaySupportGeneralLogging();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_2_8_64_8_64((uint64_t)v10, (uint64_t)v9, (uint64_t)v7);
    _os_log_impl(&dword_21E389000, oslog, OS_LOG_TYPE_DEFAULT, "%@: button selected with UUID: %@", v10, 0x16u);
  }
  objc_storeStrong((id *)&oslog, 0);
  v4 = -[CPSBaseTemplateViewController templateDelegate](v9, "templateDelegate");
  v5 = -[CPTemplateDelegate conformsToProtocol:](v4, "conformsToProtocol:", &unk_25544C5F8);

  if ((v5 & 1) != 0)
  {
    v3 = -[CPSBaseTemplateViewController templateDelegate](v9, "templateDelegate");
    -[CPTemplateDelegate handleActionForControlIdentifier:](v3, "handleActionForControlIdentifier:", v7);

  }
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

- (id)_buttons
{
  return -[CPSMapTemplateViewController mapButtons](self, "mapButtons", a2, self);
}

- (id)_buttonForIdentifier:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  int v7;
  int v8;
  void (*v9)(_QWORD *, void *, uint64_t, _BYTE *);
  void *v10;
  id v11[4];
  uint64_t v12;
  uint64_t *v13;
  int v14;
  int v15;
  void (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  id location[2];
  CPSMapTemplateViewController *v20;

  v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v12 = 0;
  v13 = &v12;
  v14 = 838860800;
  v15 = 48;
  v16 = __Block_byref_object_copy__5;
  v17 = __Block_byref_object_dispose__5;
  v18 = 0;
  v5 = -[CPSMapTemplateViewController _buttons](v20, "_buttons");
  v6 = MEMORY[0x24BDAC760];
  v7 = -1073741824;
  v8 = 0;
  v9 = __53__CPSMapTemplateViewController__buttonForIdentifier___block_invoke;
  v10 = &unk_24E2714B0;
  v11[0] = location[0];
  v11[1] = &v12;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", &v6);

  v4 = (id)v13[5];
  objc_storeStrong(v11, 0);
  _Block_object_dispose(&v12, 8);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(location, 0);
  return v4;
}

void __53__CPSMapTemplateViewController__buttonForIdentifier___block_invoke(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  char v7;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v6 = (id)objc_msgSend(location[0], "identifier");
  v7 = objc_msgSend(v6, "isEqual:", a1[4]);

  if ((v7 & 1) != 0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), location[0]);
    *a4 = 1;
  }
  objc_storeStrong(location, 0);
}

- (void)tripView:(id)a3 selectedTrip:(id)a4 routeChoice:(id)a5
{
  id v7;
  id v8;
  CPTemplateDelegate *v9;
  id v10;
  id v11;
  id location[2];
  CPSMapTemplateViewController *v13;

  v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v11 = 0;
  objc_storeStrong(&v11, a4);
  v10 = 0;
  objc_storeStrong(&v10, a5);
  v9 = -[CPSBaseTemplateViewController templateDelegate](v13, "templateDelegate");
  v8 = (id)objc_msgSend(v11, "identifier");
  v7 = (id)objc_msgSend(v10, "identifier");
  -[CPTemplateDelegate previewTripIdentifier:usingRouteIdentifier:](v9, "previewTripIdentifier:usingRouteIdentifier:", v8);

  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
}

- (void)tripView:(id)a3 startedTrip:(id)a4 routeChoice:(id)a5
{
  id v7;
  id v8;
  CPTemplateDelegate *v9;
  id v10;
  id v11;
  id location[2];
  CPSMapTemplateViewController *v13;

  v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v11 = 0;
  objc_storeStrong(&v11, a4);
  v10 = 0;
  objc_storeStrong(&v10, a5);
  v9 = -[CPSBaseTemplateViewController templateDelegate](v13, "templateDelegate");
  v8 = (id)objc_msgSend(v11, "identifier");
  v7 = (id)objc_msgSend(v10, "identifier");
  -[CPTemplateDelegate startTripIdentifier:usingRouteIdentifier:](v9, "startTripIdentifier:usingRouteIdentifier:", v8);

  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
}

- (void)sessionDidConnect:(id)a3
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
}

- (void)_nightModeChanged:(id)a3
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
}

- (void)setControl:(id)a3 enabled:(BOOL)a4
{
  NSObject *queue;
  uint64_t v6;
  int v7;
  int v8;
  void (*v9)(uint64_t);
  void *v10;
  CPSMapTemplateViewController *v11;
  id v12;
  BOOL v13;
  objc_super v14;
  BOOL v15;
  id location[2];
  CPSMapTemplateViewController *v17;

  v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v15 = a4;
  v14.receiver = v17;
  v14.super_class = (Class)CPSMapTemplateViewController;
  -[CPSBaseTemplateViewController setControl:enabled:](&v14, sel_setControl_enabled_, location[0], a4);
  queue = MEMORY[0x24BDAC9B8];
  v6 = MEMORY[0x24BDAC760];
  v7 = -1073741824;
  v8 = 0;
  v9 = __51__CPSMapTemplateViewController_setControl_enabled___block_invoke;
  v10 = &unk_24E270068;
  v11 = v17;
  v12 = location[0];
  v13 = v15;
  dispatch_async(queue, &v6);

  objc_storeStrong(&v12, 0);
  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(location, 0);
}

void __51__CPSMapTemplateViewController_setControl_enabled___block_invoke(uint64_t a1)
{
  id v2[3];

  v2[2] = (id)a1;
  v2[1] = (id)a1;
  v2[0] = (id)objc_msgSend(*(id *)(a1 + 32), "_buttonForIdentifier:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v2[0], "setEnabled:", *(_BYTE *)(a1 + 48) & 1);
  objc_storeStrong(v2, 0);
}

- (void)setHostGuidanceBackgroundColor:(id)a3
{
  NSObject *queue;
  uint64_t v4;
  int v5;
  int v6;
  void (*v7)(id *);
  void *v8;
  id v9;
  CPSMapTemplateViewController *v10;
  id location[2];
  CPSMapTemplateViewController *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  queue = MEMORY[0x24BDAC9B8];
  v4 = MEMORY[0x24BDAC760];
  v5 = -1073741824;
  v6 = 0;
  v7 = __63__CPSMapTemplateViewController_setHostGuidanceBackgroundColor___block_invoke;
  v8 = &unk_24E26EF28;
  v9 = location[0];
  v10 = v12;
  dispatch_async(queue, &v4);

  objc_storeStrong((id *)&v10, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

void __63__CPSMapTemplateViewController_setHostGuidanceBackgroundColor___block_invoke(id *a1)
{
  id v2[3];

  v2[2] = a1;
  v2[1] = a1;
  v2[0] = a1[4];
  objc_msgSend(a1[5], "setGuidanceBackgroundColor:", v2[0]);
  objc_storeStrong(v2, 0);
}

- (void)setHostTripEstimateStyle:(unint64_t)a3
{
  NSObject *queue;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t (*v7)(uint64_t);
  void *v8;
  id v9[2];
  void *v10;
  SEL v11;
  CPSMapTemplateViewController *v12;

  v12 = self;
  v11 = a2;
  v10 = (void *)a3;
  queue = MEMORY[0x24BDAC9B8];
  v4 = MEMORY[0x24BDAC760];
  v5 = -1073741824;
  v6 = 0;
  v7 = __57__CPSMapTemplateViewController_setHostTripEstimateStyle___block_invoke;
  v8 = &unk_24E26FB48;
  v9[0] = v12;
  v9[1] = v10;
  dispatch_async(queue, &v4);

  objc_storeStrong(v9, 0);
}

uint64_t __57__CPSMapTemplateViewController_setHostTripEstimateStyle___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setTripEstimateStyle:", *(_QWORD *)(a1 + 40), a1, a1);
}

- (void)setHostAutoHidesNavigationBar:(BOOL)a3
{
  NSObject *queue;
  id v4;
  uint64_t v5;
  int v6;
  int v7;
  uint64_t (*v8)(uint64_t);
  void *v9;
  CPSMapTemplateViewController *v10;
  BOOL v11;
  os_log_type_t v12;
  id location;
  BOOL v14;
  SEL v15;
  CPSMapTemplateViewController *v16;
  uint8_t v17[24];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v16 = self;
  v15 = a2;
  v14 = a3;
  location = CarPlaySupportGeneralLogging();
  v12 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v14);
    __os_log_helper_16_2_1_8_64((uint64_t)v17, (uint64_t)v4);
    _os_log_impl(&dword_21E389000, (os_log_t)location, v12, "setHostAutoHidesNavigationBar %@", v17, 0xCu);

  }
  objc_storeStrong(&location, 0);
  queue = MEMORY[0x24BDAC9B8];
  v5 = MEMORY[0x24BDAC760];
  v6 = -1073741824;
  v7 = 0;
  v8 = __62__CPSMapTemplateViewController_setHostAutoHidesNavigationBar___block_invoke;
  v9 = &unk_24E26FF88;
  v10 = v16;
  v11 = v14;
  dispatch_async(queue, &v5);

  objc_storeStrong((id *)&v10, 0);
}

uint64_t __62__CPSMapTemplateViewController_setHostAutoHidesNavigationBar___block_invoke(uint64_t a1)
{
  char v1;
  uint64_t result;

  v1 = objc_msgSend(*(id *)(a1 + 32), "autoHidesNavigationBar");
  result = a1;
  if ((v1 & 1) != (*(_BYTE *)(a1 + 40) & 1))
  {
    objc_msgSend(*(id *)(a1 + 32), "setAutoHidesNavigationBar:", *(_BYTE *)(a1 + 40) & 1);
    return objc_msgSend(*(id *)(a1 + 32), "_resetAutoHideTimerAndShowBarAnimated:allowFocusDeferral:", 1, 1);
  }
  return result;
}

- (void)setHostHidesButtonsWithNavigationBar:(BOOL)a3
{
  NSObject *queue;
  id v4;
  uint64_t v5;
  int v6;
  int v7;
  uint64_t (*v8)(uint64_t);
  void *v9;
  CPSMapTemplateViewController *v10;
  BOOL v11;
  os_log_type_t v12;
  id location;
  BOOL v14;
  SEL v15;
  CPSMapTemplateViewController *v16;
  uint8_t v17[24];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v16 = self;
  v15 = a2;
  v14 = a3;
  location = CarPlaySupportGeneralLogging();
  v12 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v14);
    __os_log_helper_16_2_1_8_64((uint64_t)v17, (uint64_t)v4);
    _os_log_impl(&dword_21E389000, (os_log_t)location, v12, "setHostHidesButtonsWithNavigationBar %@", v17, 0xCu);

  }
  objc_storeStrong(&location, 0);
  queue = MEMORY[0x24BDAC9B8];
  v5 = MEMORY[0x24BDAC760];
  v6 = -1073741824;
  v7 = 0;
  v8 = __69__CPSMapTemplateViewController_setHostHidesButtonsWithNavigationBar___block_invoke;
  v9 = &unk_24E26FF88;
  v10 = v16;
  v11 = v14;
  dispatch_async(queue, &v5);

  objc_storeStrong((id *)&v10, 0);
}

uint64_t __69__CPSMapTemplateViewController_setHostHidesButtonsWithNavigationBar___block_invoke(uint64_t a1)
{
  char v1;
  uint64_t result;

  v1 = objc_msgSend(*(id *)(a1 + 32), "hidesButtonsWithNavigationBar");
  result = a1;
  if ((v1 & 1) != (*(_BYTE *)(a1 + 40) & 1))
  {
    objc_msgSend(*(id *)(a1 + 32), "setHidesButtonsWithNavigationBar:", *(_BYTE *)(a1 + 40) & 1);
    return objc_msgSend(*(id *)(a1 + 32), "_resetAutoHideTimerAndShowBarAnimated:allowFocusDeferral:", 1, 1);
  }
  return result;
}

- (void)setHostTripPreviews:(id)a3 textConfiguration:(id)a4 previewOnlyRouteChoices:(BOOL)a5 selectedIndex:(unint64_t)a6
{
  NSObject *queue;
  uint64_t v10;
  int v11;
  int v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  CPSMapTemplateViewController *v16;
  id v17[2];
  BOOL v18;
  void *v19;
  BOOL v20;
  id v21;
  id location[2];
  CPSMapTemplateViewController *v23;

  v23 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v21 = 0;
  objc_storeStrong(&v21, a4);
  v20 = a5;
  v19 = (void *)a6;
  queue = MEMORY[0x24BDAC9B8];
  v10 = MEMORY[0x24BDAC760];
  v11 = -1073741824;
  v12 = 0;
  v13 = __108__CPSMapTemplateViewController_setHostTripPreviews_textConfiguration_previewOnlyRouteChoices_selectedIndex___block_invoke;
  v14 = &unk_24E2714D8;
  v15 = location[0];
  v16 = v23;
  v17[0] = v21;
  v18 = v20;
  v17[1] = v19;
  dispatch_async(queue, &v10);

  objc_storeStrong(v17, 0);
  objc_storeStrong((id *)&v16, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(location, 0);
}

void __108__CPSMapTemplateViewController_setHostTripPreviews_textConfiguration_previewOnlyRouteChoices_selectedIndex___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;
  id v3;
  id v5;
  os_log_type_t type;
  os_log_t oslog[7];
  uint8_t v8[24];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  oslog[2] = (os_log_t)a1;
  oslog[1] = (os_log_t)a1;
  oslog[0] = (os_log_t)CarPlaySupportGeneralLogging();
  type = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v8, *(_QWORD *)(a1 + 32));
    _os_log_debug_impl(&dword_21E389000, oslog[0], type, "setHostTripPreviews %@", v8, 0xCu);
  }
  objc_storeStrong((id *)oslog, 0);
  v5 = *(id *)(a1 + 32);
  if ((unint64_t)objc_msgSend(*(id *)(a1 + 32), "count") > 0xC)
  {
    v1 = *(void **)(a1 + 32);
    oslog[4] = 0;
    oslog[3] = (os_log_t)12;
    oslog[5] = 0;
    oslog[6] = (os_log_t)12;
    v2 = (id)objc_msgSend(v1, "subarrayWithRange:", 0, 12);
    v3 = v5;
    v5 = v2;

  }
  objc_msgSend(*(id *)(a1 + 40), "setTripPreviews:", v5);
  objc_msgSend(*(id *)(a1 + 40), "setTripPreviewTextConfiguration:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 40), "setPreviewOnlyRouteChoices:", *(_BYTE *)(a1 + 64) & 1);
  objc_msgSend(*(id *)(a1 + 40), "setPreviewSelectedIndex:", *(_QWORD *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 40), "_reloadPreviewsView");
  objc_storeStrong(&v5, 0);
}

- (void)hostUpdateTravelEstimates:(id)a3 forTripIdentifier:(id)a4
{
  NSObject *queue;
  uint64_t v6;
  int v7;
  int v8;
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  CPSMapTemplateViewController *v12;
  id v13;
  id v14;
  id location[2];
  CPSMapTemplateViewController *v16;

  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v14 = 0;
  objc_storeStrong(&v14, a4);
  queue = MEMORY[0x24BDAC9B8];
  v6 = MEMORY[0x24BDAC760];
  v7 = -1073741824;
  v8 = 0;
  v9 = __76__CPSMapTemplateViewController_hostUpdateTravelEstimates_forTripIdentifier___block_invoke;
  v10 = &unk_24E270310;
  v11 = v14;
  v12 = v16;
  v13 = location[0];
  dispatch_async(queue, &v6);

  objc_storeStrong(&v13, 0);
  objc_storeStrong((id *)&v12, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

void __76__CPSMapTemplateViewController_hostUpdateTravelEstimates_forTripIdentifier___block_invoke(uint64_t a1)
{
  id v1;
  id v2;
  id v3;
  id v4;
  char v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  char v13;

  if (*(_QWORD *)(a1 + 32))
  {
    v7 = *(_QWORD *)(a1 + 48);
    v8 = (id)objc_msgSend(*(id *)(a1 + 40), "lastTravelEstimatesByTrip");
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, *(_QWORD *)(a1 + 32));

    v9 = (id)objc_msgSend(*(id *)(a1 + 40), "previewsView");
    objc_msgSend(v9, "updateEstimates:forTripIdentifier:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));

    v12 = (id)objc_msgSend(*(id *)(a1 + 40), "navigationETAView");
    v11 = (id)objc_msgSend(v12, "trip");
    v10 = (id)objc_msgSend(v11, "identifier");
    v13 = objc_msgSend(v10, "isEqual:", *(_QWORD *)(a1 + 32));

    if ((v13 & 1) != 0)
    {
      v6 = (id)objc_msgSend(*(id *)(a1 + 40), "navigationETAView");
      objc_msgSend(v6, "updateEstimates:forManeuver:", *(_QWORD *)(a1 + 48), 0);

    }
    v4 = (id)objc_msgSend(*(id *)(a1 + 40), "navigator");
    v3 = (id)objc_msgSend(v4, "trip");
    v2 = (id)objc_msgSend(v3, "identifier");
    v5 = objc_msgSend(v2, "isEqual:", *(_QWORD *)(a1 + 32));

    if ((v5 & 1) != 0)
    {
      v1 = (id)objc_msgSend(*(id *)(a1 + 40), "navigator");
      objc_msgSend(v1, "updateTripTravelEstimates:", *(_QWORD *)(a1 + 48));

    }
  }
}

- (void)hostStartNavigationSessionForTrip:(id)a3 reply:(id)a4
{
  NSObject *queue;
  NSObject *v5;
  os_log_type_t v6;
  CPSAnalytics *v7;
  id v8;
  CPMapClientTemplateDelegate *v9;
  CPSNavigator *v10;
  uint64_t v12;
  int v13;
  int v14;
  void (*v15)(uint64_t);
  void *v16;
  CPSMapTemplateViewController *v17;
  id v18;
  id v19[2];
  _QWORD v20[2];
  int v21;
  int v22;
  void (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint8_t v26[7];
  char v27;
  id v28;
  os_log_type_t v29;
  id v30;
  id v31;
  int v32;
  id v33;
  id location[2];
  CPSMapTemplateViewController *v35;
  uint8_t v36[24];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v35 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v33 = 0;
  objc_storeStrong(&v33, a4);
  v10 = -[CPSMapTemplateViewController navigator](v35, "navigator");

  if (v10)
  {
    v9 = -[CPSMapTemplateViewController mapTemplateDelegate](v35, "mapTemplateDelegate");
    -[CPMapClientTemplateDelegate clientTripAlreadyStartedException](v9, "clientTripAlreadyStartedException");

    v32 = 1;
  }
  else
  {
    v8 = (id)objc_msgSend(MEMORY[0x24BDD1988], "currentConnection");
    v31 = (id)objc_msgSend(v8, "cp_bundleIdentifier");

    if (v31)
    {
      v7 = +[CPSAnalytics sharedInstance](CPSAnalytics, "sharedInstance");
      -[CPSAnalytics navigationStartedWithBundleIdentifier:](v7, "navigationStartedWithBundleIdentifier:", v31);

    }
    if (-[NSArray count](v35->_tripPreviews, "count"))
    {
      v30 = CarPlaySupportGeneralLogging();
      v29 = OS_LOG_TYPE_DEBUG;
      if (os_log_type_enabled((os_log_t)v30, OS_LOG_TYPE_DEBUG))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v36, (uint64_t)location[0]);
        _os_log_debug_impl(&dword_21E389000, (os_log_t)v30, v29, "Dismissing trip preview cards for trip: %@.", v36, 0xCu);
      }
      objc_storeStrong(&v30, 0);
      -[CPSMapTemplateViewController setHostTripPreviews:textConfiguration:previewOnlyRouteChoices:selectedIndex:](v35, "setHostTripPreviews:textConfiguration:previewOnlyRouteChoices:selectedIndex:", MEMORY[0x24BDBD1A8], 0, 0, 0);
    }
    v28 = CarPlaySupportGeneralLogging();
    v27 = 2;
    if (os_log_type_enabled((os_log_t)v28, OS_LOG_TYPE_DEBUG))
    {
      v5 = v28;
      v6 = v27;
      __os_log_helper_16_0_0(v26);
      _os_log_debug_impl(&dword_21E389000, v5, v6, "navigation session provider requested", v26, 2u);
    }
    objc_storeStrong(&v28, 0);
    v20[0] = 0;
    v20[1] = v20;
    v21 = 838860800;
    v22 = 48;
    v23 = __Block_byref_object_copy__5;
    v24 = __Block_byref_object_dispose__5;
    v25 = 0;
    queue = MEMORY[0x24BDAC9B8];
    v12 = MEMORY[0x24BDAC760];
    v13 = -1073741824;
    v14 = 0;
    v15 = __72__CPSMapTemplateViewController_hostStartNavigationSessionForTrip_reply___block_invoke;
    v16 = &unk_24E271500;
    v19[1] = v20;
    v17 = v35;
    v18 = location[0];
    v19[0] = v31;
    dispatch_sync(queue, &v12);

    (*((void (**)(void))v33 + 2))();
    objc_storeStrong(v19, 0);
    objc_storeStrong(&v18, 0);
    objc_storeStrong((id *)&v17, 0);
    _Block_object_dispose(v20, 8);
    objc_storeStrong(&v25, 0);
    objc_storeStrong(&v31, 0);
    v32 = 0;
  }
  objc_storeStrong(&v33, 0);
  objc_storeStrong(location, 0);
}

void __72__CPSMapTemplateViewController_hostStartNavigationSessionForTrip_reply___block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v10;

  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v8 = (id)objc_msgSend(v5, "lastTravelEstimatesByTrip");
  v7 = (id)objc_msgSend(*(id *)(a1 + 40), "identifier");
  v6 = (id)objc_msgSend(v8, "objectForKeyedSubscript:");
  v1 = (id)objc_msgSend(v5, "_tripDidBegin:withEstimates:forIdentifier:", v4);
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = v1;

  v10 = (id)objc_msgSend(*(id *)(a1 + 32), "lastTravelEstimatesByTrip");
  objc_msgSend(v10, "removeAllObjects");

}

- (void)setMapButton:(id)a3 hidden:(BOOL)a4
{
  NSObject *queue;
  uint64_t v6;
  int v7;
  int v8;
  void (*v9)(uint64_t);
  void *v10;
  CPSMapTemplateViewController *v11;
  id v12;
  BOOL v13;
  BOOL v14;
  id location[2];
  CPSMapTemplateViewController *v16;

  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v14 = a4;
  queue = MEMORY[0x24BDAC9B8];
  v6 = MEMORY[0x24BDAC760];
  v7 = -1073741824;
  v8 = 0;
  v9 = __52__CPSMapTemplateViewController_setMapButton_hidden___block_invoke;
  v10 = &unk_24E270068;
  v11 = v16;
  v12 = location[0];
  v13 = v14;
  dispatch_async(queue, &v6);

  objc_storeStrong(&v12, 0);
  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(location, 0);
}

void __52__CPSMapTemplateViewController_setMapButton_hidden___block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "_buttonForIdentifier:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v2, "setHidden:", *(_BYTE *)(a1 + 48) & 1);

}

- (void)hostSetMapButton:(id)a3 imageSet:(id)a4
{
  NSObject *queue;
  uint64_t v6;
  int v7;
  int v8;
  void (*v9)(uint64_t);
  void *v10;
  CPSMapTemplateViewController *v11;
  id v12;
  id v13;
  id v14;
  id location[2];
  CPSMapTemplateViewController *v16;

  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v14 = 0;
  objc_storeStrong(&v14, a4);
  queue = MEMORY[0x24BDAC9B8];
  v6 = MEMORY[0x24BDAC760];
  v7 = -1073741824;
  v8 = 0;
  v9 = __58__CPSMapTemplateViewController_hostSetMapButton_imageSet___block_invoke;
  v10 = &unk_24E270310;
  v11 = v16;
  v12 = location[0];
  v13 = v14;
  dispatch_async(queue, &v6);

  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

void __58__CPSMapTemplateViewController_hostSetMapButton_imageSet___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  id v4[3];

  v4[2] = (id)a1;
  v4[1] = (id)a1;
  v4[0] = (id)objc_msgSend(*(id *)(a1 + 32), "_buttonForIdentifier:", *(_QWORD *)(a1 + 40));
  v2 = v4[0];
  v3 = (id)objc_msgSend(*(id *)(a1 + 48), "image");
  objc_msgSend(v2, "setImage:forState:");

  objc_storeStrong(v4, 0);
}

- (void)setMapButton:(id)a3 focusedImage:(id)a4
{
  NSObject *queue;
  uint64_t v6;
  int v7;
  int v8;
  void (*v9)(uint64_t);
  void *v10;
  CPSMapTemplateViewController *v11;
  id v12;
  id v13;
  id v14;
  id location[2];
  CPSMapTemplateViewController *v16;

  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v14 = 0;
  objc_storeStrong(&v14, a4);
  queue = MEMORY[0x24BDAC9B8];
  v6 = MEMORY[0x24BDAC760];
  v7 = -1073741824;
  v8 = 0;
  v9 = __58__CPSMapTemplateViewController_setMapButton_focusedImage___block_invoke;
  v10 = &unk_24E270310;
  v11 = v16;
  v12 = location[0];
  v13 = v14;
  dispatch_async(queue, &v6);

  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

void __58__CPSMapTemplateViewController_setMapButton_focusedImage___block_invoke(uint64_t a1)
{
  id v2[3];

  v2[2] = (id)a1;
  v2[1] = (id)a1;
  v2[0] = (id)objc_msgSend(*(id *)(a1 + 32), "_buttonForIdentifier:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v2[0], "setImage:forState:", *(_QWORD *)(a1 + 48), 8);
  objc_storeStrong(v2, 0);
}

- (void)hostSetPanInterfaceVisible:(BOOL)a3 animated:(BOOL)a4
{
  NSObject *queue;
  uint64_t v5;
  int v6;
  int v7;
  uint64_t (*v8)(uint64_t);
  void *v9;
  CPSMapTemplateViewController *v10;
  BOOL v11;
  BOOL v12;
  BOOL v13;
  BOOL v14;
  SEL v15;
  CPSMapTemplateViewController *v16;

  v16 = self;
  v15 = a2;
  v14 = a3;
  v13 = a4;
  queue = MEMORY[0x24BDAC9B8];
  v5 = MEMORY[0x24BDAC760];
  v6 = -1073741824;
  v7 = 0;
  v8 = __68__CPSMapTemplateViewController_hostSetPanInterfaceVisible_animated___block_invoke;
  v9 = &unk_24E271528;
  v10 = v16;
  v11 = v14;
  v12 = v13;
  dispatch_async(queue, &v5);

  objc_storeStrong((id *)&v10, 0);
}

uint64_t __68__CPSMapTemplateViewController_hostSetPanInterfaceVisible_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setPanInterfaceVisible:animated:", *(_BYTE *)(a1 + 40) & 1, *(_BYTE *)(a1 + 41) & 1, a1, a1);
}

- (void)hostSetMapButtons:(id)a3
{
  NSObject *queue;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t (*v7)(uint64_t);
  void *v8;
  CPSMapTemplateViewController *v9;
  id v10;
  id location[2];
  CPSMapTemplateViewController *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  queue = MEMORY[0x24BDAC9B8];
  v4 = MEMORY[0x24BDAC760];
  v5 = -1073741824;
  v6 = 0;
  v7 = __50__CPSMapTemplateViewController_hostSetMapButtons___block_invoke;
  v8 = &unk_24E26EF28;
  v9 = v12;
  v10 = location[0];
  dispatch_async(queue, &v4);

  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

uint64_t __50__CPSMapTemplateViewController_hostSetMapButtons___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateMapButtonsWithButtons:", *(_QWORD *)(a1 + 40), a1, a1);
}

- (void)hostPanInterfaceVisible:(id)a3
{
  NSObject *queue;
  uint64_t v4;
  int v5;
  int v6;
  void (*v7)(uint64_t);
  void *v8;
  CPSMapTemplateViewController *v9;
  id v10;
  id location[2];
  CPSMapTemplateViewController *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  queue = MEMORY[0x24BDAC9B8];
  v4 = MEMORY[0x24BDAC760];
  v5 = -1073741824;
  v6 = 0;
  v7 = __56__CPSMapTemplateViewController_hostPanInterfaceVisible___block_invoke;
  v8 = &unk_24E26FA30;
  v10 = location[0];
  v9 = v12;
  dispatch_async(queue, &v4);

  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
}

void __56__CPSMapTemplateViewController_hostPanInterfaceVisible___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "panContainerView");
  (*(void (**)(uint64_t, _QWORD))(v1 + 16))(v1, (objc_msgSend(v2, "isHidden") ^ 1) & 1);

}

- (BOOL)_isAutoHideEnabled
{
  NSMutableSet *v3;
  BOOL v4;

  v3 = -[CPSMapTemplateViewController autoHideDisabledReasons](self, "autoHideDisabledReasons");
  v4 = 0;
  if (!-[NSMutableSet count](v3, "count"))
    v4 = -[CPSMapTemplateViewController autoHidesNavigationBar](self, "autoHidesNavigationBar");

  return v4;
}

- (void)_setAutoHideDisabled:(BOOL)a3 forRequester:(id)a4
{
  NSMutableSet *v4;
  os_log_t v5;
  NSMutableSet *v6;
  NSMutableSet *v7;
  char v8;
  NSMutableSet *v9;
  id v10;
  BOOL v11;
  os_log_t oslog;
  os_log_type_t v13;
  id v14;
  id location;
  BOOL v16;
  SEL v17;
  CPSMapTemplateViewController *v18;
  uint8_t v19[16];
  uint8_t v20[24];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v18 = self;
  v17 = a2;
  v16 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  if (v16)
  {
    v4 = -[CPSMapTemplateViewController autoHideDisabledReasons](v18, "autoHideDisabledReasons");
    v11 = v4 != 0;

    if (!v11)
    {
      v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithCapacity:", 1);
      -[CPSMapTemplateViewController setAutoHideDisabledReasons:](v18, "setAutoHideDisabledReasons:");

    }
    v9 = -[CPSMapTemplateViewController autoHideDisabledReasons](v18, "autoHideDisabledReasons");
    -[NSMutableSet addObject:](v9, "addObject:", location);

    v14 = CarPlaySupportGeneralLogging();
    v13 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_1_8_66((uint64_t)v20, (uint64_t)location);
      _os_log_debug_impl(&dword_21E389000, (os_log_t)v14, v13, "Disabling auto hide for requester: %{public}@", v20, 0xCu);
    }
    objc_storeStrong(&v14, 0);
  }
  else
  {
    v7 = -[CPSMapTemplateViewController autoHideDisabledReasons](v18, "autoHideDisabledReasons");
    v8 = -[NSMutableSet containsObject:](v7, "containsObject:", location);

    if ((v8 & 1) != 0)
    {
      v6 = -[CPSMapTemplateViewController autoHideDisabledReasons](v18, "autoHideDisabledReasons");
      -[NSMutableSet removeObject:](v6, "removeObject:", location);

      oslog = (os_log_t)CarPlaySupportGeneralLogging();
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
      {
        v5 = oslog;
        __os_log_helper_16_2_1_8_66((uint64_t)v19, (uint64_t)location);
        _os_log_debug_impl(&dword_21E389000, oslog, OS_LOG_TYPE_DEBUG, "Enabling auto hide for requester: %{public}@", v19, 0xCu);
      }
      objc_storeStrong((id *)&oslog, 0);
    }
  }
  -[CPSMapTemplateViewController _resetAutoHideTimerAndShowBarAnimated:allowFocusDeferral:](v18, "_resetAutoHideTimerAndShowBarAnimated:allowFocusDeferral:", 1, 1, v5);
  objc_storeStrong(&location, 0);
}

- (void)_resetAutoHideTimerAndShowBarAnimated:(BOOL)a3 allowFocusDeferral:(BOOL)a4
{
  id v4;
  NSTimer *v5;

  -[CPSMapTemplateViewController _showBarAnimated:allowFocusDeferral:](self, "_showBarAnimated:allowFocusDeferral:", a3, a4);
  v5 = -[CPSMapTemplateViewController autoHideTimer](self, "autoHideTimer");
  -[NSTimer invalidate](v5, "invalidate");

  if (-[CPSMapTemplateViewController _isAutoHideEnabled](self, "_isAutoHideEnabled")
    && !-[CPSMapTemplateViewController demoAutoHideTimerDisabled](self, "demoAutoHideTimerDisabled"))
  {
    v4 = (id)objc_msgSend(MEMORY[0x24BDBCF40], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__hideBar_, 0, 0, 5.0);
    -[CPSMapTemplateViewController setAutoHideTimer:](self, "setAutoHideTimer:");

  }
}

- (void)_setButtonsHidden:(BOOL)a3 animated:(BOOL)a4
{
  double v4;
  UIStackView *v5;
  uint64_t v6;
  double v7;
  void *v8;
  uint64_t v9;
  int v10;
  int v11;
  uint64_t (*v12)(uint64_t);
  void *v13;
  CPSMapTemplateViewController *v14;
  uint64_t v15;
  int v16;
  int v17;
  void (*v18)(uint64_t);
  void *v19;
  id v20[2];
  double v21;
  BOOL v22;
  BOOL v23;
  SEL v24;
  CPSMapTemplateViewController *v25;

  v25 = self;
  v24 = a2;
  v23 = a3;
  v22 = a4;
  v4 = 0.0;
  v21 = 0.0;
  if (!a3)
    v4 = 1.0;
  v21 = v4;
  if (v22)
  {
    v8 = (void *)MEMORY[0x24BDF6F90];
    v7 = *MEMORY[0x24BDF7BD8];
    v6 = MEMORY[0x24BDAC760];
    v15 = MEMORY[0x24BDAC760];
    v16 = -1073741824;
    v17 = 0;
    v18 = __59__CPSMapTemplateViewController__setButtonsHidden_animated___block_invoke;
    v19 = &unk_24E26FB48;
    v20[0] = v25;
    v20[1] = *(id *)&v21;
    v9 = v6;
    v10 = -1073741824;
    v11 = 0;
    v12 = __59__CPSMapTemplateViewController__setButtonsHidden_animated___block_invoke_2;
    v13 = &unk_24E26F168;
    v14 = v25;
    objc_msgSend(v8, "animateWithDuration:animations:completion:", &v15, &v9, v7);
    objc_storeStrong((id *)&v14, 0);
    objc_storeStrong(v20, 0);
  }
  else
  {
    v5 = -[CPSMapTemplateViewController trailingBottomStackView](v25, "trailingBottomStackView");
    -[UIStackView setAlpha:](v5, "setAlpha:", v21);

  }
  -[CPSMapTemplateViewController _updateSafeArea](v25, "_updateSafeArea");
}

void __59__CPSMapTemplateViewController__setButtonsHidden_animated___block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "trailingBottomStackView");
  objc_msgSend(v2, "setAlpha:", *(double *)(a1 + 40));

}

uint64_t __59__CPSMapTemplateViewController__setButtonsHidden_animated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateSafeArea");
}

- (void)_setFocusHoldersEnabled:(BOOL)a3
{
  UIFocusGuide *v3;
  UIFocusGuide *v4;
  _CPSFocusHoldingButton *v5;
  BOOL v6;

  v6 = a3;
  v3 = -[CPSMapTemplateViewController focusHolderLeftFocusGuide](self, "focusHolderLeftFocusGuide");
  -[UIFocusGuide setEnabled:](v3, "setEnabled:", v6);

  v4 = -[CPSMapTemplateViewController focusHolderRightFocusGuide](self, "focusHolderRightFocusGuide");
  -[UIFocusGuide setEnabled:](v4, "setEnabled:", v6);

  v5 = -[CPSMapTemplateViewController focusHoldingButton](self, "focusHoldingButton");
  -[_CPSFocusHoldingButton setEnabled:](v5, "setEnabled:", v6);

}

- (void)_showBarAnimated:(BOOL)a3 allowFocusDeferral:(BOOL)a4
{
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  char v10;
  id v11;
  id v12;
  uint64_t v13;
  int v14;
  int v15;
  void (*v16)(id *);
  void *v17;
  CPSMapTemplateViewController *v18;
  BOOL v19;
  BOOL v20;
  SEL v21;
  CPSMapTemplateViewController *v22;

  v22 = self;
  v21 = a2;
  v20 = a3;
  v19 = a4;
  v9 = (id)-[CPSMapTemplateViewController navigationController](self, "navigationController");
  v10 = objc_msgSend(v9, "isNavigationBarHidden");

  if ((v10 & 1) != 0)
  {
    -[CPSMapTemplateViewController _setFocusHoldersEnabled:](v22, "_setFocusHoldersEnabled:", 0);
    v7 = (void *)MEMORY[0x24BDE57D8];
    v13 = MEMORY[0x24BDAC760];
    v14 = -1073741824;
    v15 = 0;
    v16 = __68__CPSMapTemplateViewController__showBarAnimated_allowFocusDeferral___block_invoke;
    v17 = &unk_24E26F1B8;
    v18 = v22;
    objc_msgSend(v7, "setCompletionBlock:", &v13);
    objc_msgSend(MEMORY[0x24BDE57D8], "begin");
    v8 = (id)-[CPSMapTemplateViewController navigationController](v22, "navigationController");
    objc_msgSend(v8, "setNavigationBarHidden:animated:", 0, v20);

    objc_msgSend(MEMORY[0x24BDE57D8], "commit");
    -[CPSMapTemplateViewController _setButtonsHidden:animated:](v22, "_setButtonsHidden:animated:", 0, v20);
    if (-[CPSMapTemplateViewController shouldRestoreFocusToNavigationBar](v22, "shouldRestoreFocusToNavigationBar"))
    {
      -[CPSMapTemplateViewController setShouldRestoreFocusToNavigationBar:](v22, "setShouldRestoreFocusToNavigationBar:", 0);
      v6 = (id)-[CPSMapTemplateViewController navigationController](v22, "navigationController");
      v5 = (id)objc_msgSend(v6, "navigationBar");
      -[CPSMapTemplateViewController setLastFocusedItem:](v22, "setLastFocusedItem:");

      v4 = objc_alloc(MEMORY[0x24BDF70D0]);
      v12 = (id)objc_msgSend(v4, "initWithEnvironment:", v22);
      objc_msgSend(v12, "setAllowsDeferral:", v19);
      v11 = (id)objc_msgSend(MEMORY[0x24BDF6A68], "focusSystemForEnvironment:", v22);
      objc_msgSend(v11, "_requestFocusUpdate:", v12);
      objc_storeStrong(&v11, 0);
      objc_storeStrong(&v12, 0);
    }
    objc_storeStrong((id *)&v18, 0);
  }
}

void __68__CPSMapTemplateViewController__showBarAnimated_allowFocusDeferral___block_invoke(id *a1)
{
  NSObject *queue;
  uint64_t v3;
  int v4;
  int v5;
  uint64_t (*v6)(uint64_t);
  void *v7;
  id v8[3];

  v8[2] = a1;
  v8[1] = a1;
  queue = MEMORY[0x24BDAC9B8];
  v3 = MEMORY[0x24BDAC760];
  v4 = -1073741824;
  v5 = 0;
  v6 = __68__CPSMapTemplateViewController__showBarAnimated_allowFocusDeferral___block_invoke_2;
  v7 = &unk_24E26F1B8;
  v8[0] = a1[4];
  dispatch_async(queue, &v3);

  objc_storeStrong(v8, 0);
}

uint64_t __68__CPSMapTemplateViewController__showBarAnimated_allowFocusDeferral___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateSafeArea", a1, a1);
}

- (void)_hideBar:(id)a3
{
  char v3;
  NSTimer *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  int v12;
  int v13;
  void (*v14)(id *);
  void *v15;
  CPSMapTemplateViewController *v16;
  id v17;
  id v18;
  id v19;
  id location[2];
  CPSMapTemplateViewController *v21;

  v21 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (-[CPSMapTemplateViewController _isAutoHideEnabled](v21, "_isAutoHideEnabled"))
  {
    v4 = -[CPSMapTemplateViewController autoHideTimer](v21, "autoHideTimer");
    -[NSTimer invalidate](v4, "invalidate");

    -[CPSMapTemplateViewController _setFocusHoldersEnabled:](v21, "_setFocusHoldersEnabled:", 1);
    v19 = (id)objc_msgSend(MEMORY[0x24BDF6A68], "focusSystemForEnvironment:", v21);
    v5 = (void *)objc_opt_class();
    v6 = (id)objc_msgSend(v19, "focusedItem");
    v18 = CPSSafeCast_23(v5, v6);

    v8 = (id)-[CPSMapTemplateViewController navigationController](v21, "navigationController");
    v7 = (id)objc_msgSend(v8, "navigationBar");
    v3 = objc_msgSend(v18, "isDescendantOfView:");
    -[CPSMapTemplateViewController setShouldRestoreFocusToNavigationBar:](v21, "setShouldRestoreFocusToNavigationBar:", v3 & 1);

    v9 = (void *)MEMORY[0x24BDE57D8];
    v11 = MEMORY[0x24BDAC760];
    v12 = -1073741824;
    v13 = 0;
    v14 = __41__CPSMapTemplateViewController__hideBar___block_invoke;
    v15 = &unk_24E26EF28;
    v16 = v21;
    v17 = v19;
    objc_msgSend(v9, "setCompletionBlock:", &v11);
    objc_msgSend(MEMORY[0x24BDE57D8], "begin");
    v10 = (id)-[CPSMapTemplateViewController navigationController](v21, "navigationController");
    objc_msgSend(v10, "setNavigationBarHidden:animated:", 1, 1);

    objc_msgSend(MEMORY[0x24BDE57D8], "commit");
    if (-[CPSMapTemplateViewController hidesButtonsWithNavigationBar](v21, "hidesButtonsWithNavigationBar"))
      -[CPSMapTemplateViewController _setButtonsHidden:animated:](v21, "_setButtonsHidden:animated:", 1, 1);
    -[CPSMapTemplateViewController _updateSafeArea](v21, "_updateSafeArea");
    objc_storeStrong(&v17, 0);
    objc_storeStrong((id *)&v16, 0);
    objc_storeStrong(&v18, 0);
    objc_storeStrong(&v19, 0);
  }
  objc_storeStrong(location, 0);
}

void __41__CPSMapTemplateViewController__hideBar___block_invoke(id *a1)
{
  NSObject *queue;
  uint64_t v3;
  int v4;
  int v5;
  uint64_t (*v6)(id *);
  void *v7;
  id v8;
  id v9[3];

  v9[2] = a1;
  v9[1] = a1;
  queue = MEMORY[0x24BDAC9B8];
  v3 = MEMORY[0x24BDAC760];
  v4 = -1073741824;
  v5 = 0;
  v6 = __41__CPSMapTemplateViewController__hideBar___block_invoke_2;
  v7 = &unk_24E26EF28;
  v8 = a1[4];
  v9[0] = a1[5];
  dispatch_async(queue, &v3);

  objc_storeStrong(v9, 0);
  objc_storeStrong(&v8, 0);
}

uint64_t __41__CPSMapTemplateViewController__hideBar___block_invoke_2(id *a1)
{
  id v2;
  id v4[3];

  v4[2] = a1;
  v4[1] = a1;
  if ((objc_msgSend(a1[4], "shouldRestoreFocusToNavigationBar") & 1) != 0)
  {
    v2 = (id)objc_msgSend(a1[4], "focusHoldingButton");
    objc_msgSend(a1[4], "setLastFocusedItem:");

    v4[0] = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDF70D0]), "initWithEnvironment:", a1[4]);
    objc_msgSend(v4[0], "setAllowsDeferral:", 0);
    objc_msgSend(a1[5], "_requestFocusUpdate:", v4[0]);
    objc_storeStrong(v4, 0);
  }
  return objc_msgSend(a1[4], "_updateSafeArea");
}

- (void)_handleTapGesture:(id)a3
{
  NSObject *log;
  os_log_type_t type;
  id v5;
  char v6;
  uint8_t v7[15];
  char v8;
  id v9;
  id location[2];
  CPSMapTemplateViewController *v11;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (-[CPSMapTemplateViewController autoHidesNavigationBar](v11, "autoHidesNavigationBar"))
  {
    v5 = (id)-[CPSMapTemplateViewController navigationController](v11, "navigationController");
    v6 = objc_msgSend(v5, "isNavigationBarHidden");

    if ((v6 & 1) != 0)
    {
      v9 = CarPlaySupportGeneralLogging();
      v8 = 2;
      if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_DEBUG))
      {
        log = v9;
        type = v8;
        __os_log_helper_16_0_0(v7);
        _os_log_debug_impl(&dword_21E389000, log, type, "Showing navigation bar with reason: tap gesture", v7, 2u);
      }
      objc_storeStrong(&v9, 0);
      -[CPSMapTemplateViewController _resetAutoHideTimerAndShowBarAnimated:allowFocusDeferral:](v11, "_resetAutoHideTimerAndShowBarAnimated:allowFocusDeferral:", 1, 1);
    }
    else
    {
      -[CPSMapTemplateViewController _hideBar:](v11, "_hideBar:", 0);
    }
  }
  objc_storeStrong(location, 0);
}

- (void)_handlePanGesture:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;
  id v12;
  CPMapClientTemplateDelegate *v13;
  id v14;
  id v15;
  CPMapClientTemplateDelegate *v16;
  CPMapClientTemplateDelegate *v17;
  id v18;
  id v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  double v24;
  id location[2];
  CPSMapTemplateViewController *v26;

  v26 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v18 = location[0];
  v19 = (id)-[CPSMapTemplateViewController view](v26, "view");
  objc_msgSend(v18, "locationInView:");
  v23 = v3;
  v24 = v4;

  v20 = objc_msgSend(location[0], "state");
  switch(v20)
  {
    case 1:
      -[CPSMapTemplateViewController setLastPanGesturePoint:](v26, "setLastPanGesturePoint:", v23, v24);
      v17 = -[CPSMapTemplateViewController mapTemplateDelegate](v26, "mapTemplateDelegate");
      -[CPMapClientTemplateDelegate clientPanGestureBegan](v17, "clientPanGestureBegan");

      break;
    case 2:
      -[CPSMapTemplateViewController lastPanGesturePoint](v26, "lastPanGesturePoint");
      -[CPSMapTemplateViewController lastPanGesturePoint](v26, "lastPanGesturePoint");
      CGPointMake_1();
      v21 = v5;
      v22 = v6;
      v16 = -[CPSMapTemplateViewController mapTemplateDelegate](v26, "mapTemplateDelegate");
      v14 = location[0];
      v15 = (id)-[CPSMapTemplateViewController view](v26, "view");
      objc_msgSend(v14, "velocityInView:");
      -[CPMapClientTemplateDelegate clientPanGestureWithDeltaPoint:velocity:](v16, "clientPanGestureWithDeltaPoint:velocity:", v21, v22, v7, v8);

      -[CPSMapTemplateViewController setLastPanGesturePoint:](v26, "setLastPanGesturePoint:", v23, v24);
      break;
    case 3:
      v13 = -[CPSMapTemplateViewController mapTemplateDelegate](v26, "mapTemplateDelegate");
      v11 = location[0];
      v12 = (id)-[CPSMapTemplateViewController view](v26, "view");
      objc_msgSend(v11, "velocityInView:");
      -[CPMapClientTemplateDelegate clientPanGestureEndedWithVelocity:](v13, "clientPanGestureEndedWithVelocity:", v9, v10);

      break;
  }
  objc_storeStrong(location, 0);
}

- (void)_handleFocusHolderSelect
{
  NSObject *log;
  os_log_type_t type;
  uint8_t v4[7];
  char v5;
  id location[2];
  CPSMapTemplateViewController *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = CarPlaySupportGeneralLogging();
  v5 = 2;
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEBUG))
  {
    log = location[0];
    type = v5;
    __os_log_helper_16_0_0(v4);
    _os_log_debug_impl(&dword_21E389000, log, type, "Showing navigation bar with reason: focus holding button select press", v4, 2u);
  }
  objc_storeStrong(location, 0);
  -[CPSMapTemplateViewController _resetAutoHideTimerAndShowBarAnimated:allowFocusDeferral:](v7, "_resetAutoHideTimerAndShowBarAnimated:allowFocusDeferral:", 1, 1);
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  UITapGestureRecognizer *v4;
  UITapGestureRecognizer *v6;
  BOOL v7;
  NSObject *log;
  os_log_type_t type;
  int v11;
  uint8_t v12[15];
  char v13;
  id v14;
  char v15;
  id v16;
  id v17;
  id location[2];
  CPSMapTemplateViewController *v19;
  BOOL v20;

  v19 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v17 = 0;
  objc_storeStrong(&v17, a4);
  v15 = 0;
  LOBYTE(v11) = 0;
  if (-[CPSMapTemplateViewController autoHidesNavigationBar](v19, "autoHidesNavigationBar"))
  {
    v16 = (id)-[CPSMapTemplateViewController navigationController](v19, "navigationController");
    v15 = 1;
    v11 = objc_msgSend(v16, "isNavigationBarHidden") ^ 1;
  }
  if ((v15 & 1) != 0)

  if ((v11 & 1) != 0)
  {
    v14 = CarPlaySupportGeneralLogging();
    v13 = 2;
    if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_DEBUG))
    {
      log = v14;
      type = v13;
      __os_log_helper_16_0_0(v12);
      _os_log_debug_impl(&dword_21E389000, log, type, "Showing navigation bar with reason: gesture recognized touch", v12, 2u);
    }
    objc_storeStrong(&v14, 0);
    -[CPSMapTemplateViewController _resetAutoHideTimerAndShowBarAnimated:allowFocusDeferral:](v19, "_resetAutoHideTimerAndShowBarAnimated:allowFocusDeferral:", 1, 1);
  }
  v6 = (UITapGestureRecognizer *)location[0];
  v4 = -[CPSMapTemplateViewController navBarHideTapGestureRecognizer](v19, "navBarHideTapGestureRecognizer");
  v7 = v6 != v4;

  v20 = v7;
  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);
  return v20;
}

- (void)_setPanInterfaceVisible:(BOOL)a3 animated:(BOOL)a4
{
  uint64_t v4;
  void *v5;
  CPMapClientTemplateDelegate *v6;
  UIView *v7;
  UIView *v8;
  UIView *v9;
  UIView *v10;
  uint64_t v11;
  void *v12;
  UITapGestureRecognizer *v13;
  uint64_t v14;
  int v15;
  int v16;
  uint64_t (*v17)(uint64_t);
  void *v18;
  id v19;
  uint64_t v20;
  int v21;
  int v22;
  uint64_t (*v23)(uint64_t);
  void *v24;
  CPSMapTemplateViewController *v25;
  uint64_t v26;
  int v27;
  int v28;
  uint64_t (*v29)(uint64_t);
  void *v30;
  CPSMapTemplateViewController *v31;
  id v32;
  uint64_t v33;
  int v34;
  int v35;
  uint64_t (*v36)(uint64_t);
  void *v37;
  id v38;
  uint64_t v39;
  int v40;
  int v41;
  uint64_t (*v42)(uint64_t);
  void *v43;
  CPSMapTemplateViewController *v44;
  uint64_t v45;
  int v46;
  int v47;
  uint64_t (*v48)(uint64_t);
  void *v49;
  CPSMapTemplateViewController *v50;
  id v51;
  BOOL v52;
  BOOL v53;
  SEL v54;
  CPSMapTemplateViewController *v55;

  v55 = self;
  v54 = a2;
  v53 = a3;
  v52 = a4;
  if (a3)
  {
    -[CPSMapTemplateViewController _addPanControllerAsChild](v55, "_addPanControllerAsChild");
    v13 = -[CPSMapTemplateViewController navBarHideTapGestureRecognizer](v55, "navBarHideTapGestureRecognizer");
    -[UITapGestureRecognizer setEnabled:](v13, "setEnabled:", 0);

    -[CPSMapTemplateViewController _setAutoHideDisabled:forRequester:](v55, "_setAutoHideDisabled:forRequester:", 1, CFSTR("PanModeRequester"));
    v45 = MEMORY[0x24BDAC760];
    v46 = -1073741824;
    v47 = 0;
    v48 = __65__CPSMapTemplateViewController__setPanInterfaceVisible_animated___block_invoke;
    v49 = &unk_24E26F1B8;
    v50 = v55;
    v51 = (id)MEMORY[0x2207AE654](&v45);
    if (v52)
    {
      v9 = -[CPSMapTemplateViewController panContainerView](v55, "panContainerView");
      -[UIView setAlpha:](v9, "setAlpha:", 0.0);

      v10 = -[CPSMapTemplateViewController panContainerView](v55, "panContainerView");
      -[UIView setHidden:](v10, "setHidden:", 0);

      v12 = (void *)MEMORY[0x24BDF6F90];
      v11 = MEMORY[0x24BDAC760];
      v39 = MEMORY[0x24BDAC760];
      v40 = -1073741824;
      v41 = 0;
      v42 = __65__CPSMapTemplateViewController__setPanInterfaceVisible_animated___block_invoke_2;
      v43 = &unk_24E26F1B8;
      v44 = v55;
      v33 = v11;
      v34 = -1073741824;
      v35 = 0;
      v36 = __65__CPSMapTemplateViewController__setPanInterfaceVisible_animated___block_invoke_3;
      v37 = &unk_24E270788;
      v38 = v51;
      objc_msgSend(v12, "animateWithDuration:animations:completion:", &v39, &v33, 0.35);
      objc_storeStrong(&v38, 0);
      objc_storeStrong((id *)&v44, 0);
    }
    else
    {
      v7 = -[CPSMapTemplateViewController panContainerView](v55, "panContainerView");
      -[UIView setAlpha:](v7, "setAlpha:", 1.0);

      v8 = -[CPSMapTemplateViewController panContainerView](v55, "panContainerView");
      -[UIView setHidden:](v8, "setHidden:", 0);

      -[CPSMapTemplateViewController _setMaximumVisibleMapButtons:](v55, "_setMaximumVisibleMapButtons:", 2);
      (*((void (**)(void))v51 + 2))();
    }
    objc_storeStrong(&v51, 0);
    objc_storeStrong((id *)&v50, 0);
  }
  else
  {
    v6 = -[CPSMapTemplateViewController mapTemplateDelegate](v55, "mapTemplateDelegate");
    -[CPMapClientTemplateDelegate clientPanViewWillDisappear](v6, "clientPanViewWillDisappear");

    v26 = MEMORY[0x24BDAC760];
    v27 = -1073741824;
    v28 = 0;
    v29 = __65__CPSMapTemplateViewController__setPanInterfaceVisible_animated___block_invoke_4;
    v30 = &unk_24E26F1B8;
    v31 = v55;
    v32 = (id)MEMORY[0x2207AE654](&v26);
    if (v52)
    {
      v5 = (void *)MEMORY[0x24BDF6F90];
      v4 = MEMORY[0x24BDAC760];
      v20 = MEMORY[0x24BDAC760];
      v21 = -1073741824;
      v22 = 0;
      v23 = __65__CPSMapTemplateViewController__setPanInterfaceVisible_animated___block_invoke_5;
      v24 = &unk_24E26F1B8;
      v25 = v55;
      v14 = v4;
      v15 = -1073741824;
      v16 = 0;
      v17 = __65__CPSMapTemplateViewController__setPanInterfaceVisible_animated___block_invoke_6;
      v18 = &unk_24E270788;
      v19 = v32;
      objc_msgSend(v5, "animateWithDuration:animations:completion:", &v20, &v14, 0.35);
      objc_storeStrong(&v19, 0);
      objc_storeStrong((id *)&v25, 0);
    }
    else
    {
      -[CPSMapTemplateViewController _setMaximumVisibleMapButtons:](v55, "_setMaximumVisibleMapButtons:", 4);
      (*((void (**)(void))v32 + 2))();
    }
    objc_storeStrong(&v32, 0);
    objc_storeStrong((id *)&v31, 0);
  }
  -[CPSMapTemplateViewController setNeedsFocusUpdate](v55, "setNeedsFocusUpdate");
}

uint64_t __65__CPSMapTemplateViewController__setPanInterfaceVisible_animated___block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "mapTemplateDelegate");
  objc_msgSend(v2, "clientPanViewDidAppear");

  objc_msgSend(*(id *)(a1 + 32), "_updateInterestingArea");
  objc_msgSend(*(id *)(a1 + 32), "setLastFocusedItem:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "setNeedsFocusUpdate");
}

uint64_t __65__CPSMapTemplateViewController__setPanInterfaceVisible_animated___block_invoke_2(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "panContainerView");
  objc_msgSend(v2, "setAlpha:", 1.0);

  return objc_msgSend(*(id *)(a1 + 32), "_setMaximumVisibleMapButtons:", 2);
}

uint64_t __65__CPSMapTemplateViewController__setPanInterfaceVisible_animated___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __65__CPSMapTemplateViewController__setPanInterfaceVisible_animated___block_invoke_4(uint64_t a1)
{
  id v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_removePanController");
  objc_msgSend(*(id *)(a1 + 32), "_setAutoHideDisabled:forRequester:", 0, CFSTR("PanModeRequester"));
  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "navBarHideTapGestureRecognizer");
  objc_msgSend(v2, "setEnabled:", 1);

  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "mapTemplateDelegate");
  objc_msgSend(v3, "clientPanViewDidDisappear");

  return objc_msgSend(*(id *)(a1 + 32), "_updateInterestingArea");
}

uint64_t __65__CPSMapTemplateViewController__setPanInterfaceVisible_animated___block_invoke_5(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "panContainerView");
  objc_msgSend(v2, "setAlpha:", 0.0);

  return objc_msgSend(*(id *)(a1 + 32), "_setMaximumVisibleMapButtons:", 4);
}

uint64_t __65__CPSMapTemplateViewController__setPanInterfaceVisible_animated___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_addPanControllerAsChild
{
  CPSPanViewController *v2;
  CPSPanViewController *v3;
  id v4;
  CPSPanViewController *v5;
  UIView *v6;
  id v7;
  id v8;
  NSLayoutXAxisAnchor *v9;
  UIView *v10;
  id v11;
  id v12;
  CPSPanViewController *v13;
  id v14;
  NSLayoutXAxisAnchor *v15;
  UIView *v16;
  id v17;
  id v18;
  CPSPanViewController *v19;
  id v20;
  NSLayoutYAxisAnchor *v21;
  UIView *v22;
  id v23;
  id v24;
  CPSPanViewController *v25;
  id v26;
  NSLayoutYAxisAnchor *v27;
  UIView *v28;
  id v29;
  id v30;
  CPSPanViewController *v31;
  UIView *v32;
  CPSPanViewController *v33;
  _QWORD v35[5];

  v35[4] = *MEMORY[0x24BDAC8D0];
  v2 = -[CPSMapTemplateViewController panViewController](self, "panViewController");
  -[CPSPanViewController willMoveToParentViewController:](v2, "willMoveToParentViewController:", self);

  v3 = -[CPSMapTemplateViewController panViewController](self, "panViewController");
  -[CPSMapTemplateViewController addChildViewController:](self, "addChildViewController:");

  v6 = -[CPSMapTemplateViewController panContainerView](self, "panContainerView");
  v5 = -[CPSMapTemplateViewController panViewController](self, "panViewController");
  v4 = (id)-[CPSPanViewController view](v5, "view");
  -[UIView addSubview:](v6, "addSubview:");

  v32 = -[CPSMapTemplateViewController panContainerView](self, "panContainerView");
  v31 = -[CPSMapTemplateViewController panViewController](self, "panViewController");
  v30 = (id)-[CPSPanViewController view](v31, "view");
  v29 = (id)objc_msgSend(v30, "topAnchor");
  v28 = -[CPSMapTemplateViewController panContainerView](self, "panContainerView");
  v27 = -[UIView topAnchor](v28, "topAnchor");
  v26 = (id)objc_msgSend(v29, "constraintEqualToAnchor:");
  v35[0] = v26;
  v25 = -[CPSMapTemplateViewController panViewController](self, "panViewController");
  v24 = (id)-[CPSPanViewController view](v25, "view");
  v23 = (id)objc_msgSend(v24, "bottomAnchor");
  v22 = -[CPSMapTemplateViewController panContainerView](self, "panContainerView");
  v21 = -[UIView bottomAnchor](v22, "bottomAnchor");
  v20 = (id)objc_msgSend(v23, "constraintEqualToAnchor:");
  v35[1] = v20;
  v19 = -[CPSMapTemplateViewController panViewController](self, "panViewController");
  v18 = (id)-[CPSPanViewController view](v19, "view");
  v17 = (id)objc_msgSend(v18, "leftAnchor");
  v16 = -[CPSMapTemplateViewController panContainerView](self, "panContainerView");
  v15 = -[UIView leftAnchor](v16, "leftAnchor");
  v14 = (id)objc_msgSend(v17, "constraintEqualToAnchor:");
  v35[2] = v14;
  v13 = -[CPSMapTemplateViewController panViewController](self, "panViewController");
  v12 = (id)-[CPSPanViewController view](v13, "view");
  v11 = (id)objc_msgSend(v12, "rightAnchor");
  v10 = -[CPSMapTemplateViewController panContainerView](self, "panContainerView");
  v9 = -[UIView rightAnchor](v10, "rightAnchor");
  v8 = (id)objc_msgSend(v11, "constraintEqualToAnchor:");
  v35[3] = v8;
  v7 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v35, 4);
  -[UIView addConstraints:](v32, "addConstraints:");

  v33 = -[CPSMapTemplateViewController panViewController](self, "panViewController");
  -[CPSPanViewController didMoveToParentViewController:](v33, "didMoveToParentViewController:", self);

}

- (void)_removePanController
{
  UIView *v2;
  CPSPanViewController *v3;
  id v4;
  CPSPanViewController *v5;
  CPSPanViewController *v6;

  v2 = -[CPSMapTemplateViewController panContainerView](self, "panContainerView");
  -[UIView setHidden:](v2, "setHidden:", 1);

  v3 = -[CPSMapTemplateViewController panViewController](self, "panViewController");
  -[CPSPanViewController willMoveToParentViewController:](v3, "willMoveToParentViewController:", 0);

  v5 = -[CPSMapTemplateViewController panViewController](self, "panViewController");
  v4 = (id)-[CPSPanViewController view](v5, "view");
  objc_msgSend(v4, "removeFromSuperview");

  v6 = -[CPSMapTemplateViewController panViewController](self, "panViewController");
  -[CPSPanViewController removeFromParentViewController](v6, "removeFromParentViewController");

}

- (void)panWithDirection:(int64_t)a3
{
  CPMapClientTemplateDelegate *v3;
  id v4;
  os_log_t oslog;
  int64_t v6;
  SEL v7;
  CPSMapTemplateViewController *v8;
  uint8_t v9[24];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v8 = self;
  v7 = a2;
  v6 = a3;
  oslog = (os_log_t)CarPlaySupportGeneralLogging();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v6);
    __os_log_helper_16_2_2_8_64_8_64((uint64_t)v9, (uint64_t)v8, (uint64_t)v4);
    _os_log_impl(&dword_21E389000, oslog, OS_LOG_TYPE_DEFAULT, "%@: Pan button pressed with direction: %@", v9, 0x16u);

  }
  objc_storeStrong((id *)&oslog, 0);
  v3 = -[CPSMapTemplateViewController mapTemplateDelegate](v8, "mapTemplateDelegate");
  -[CPMapClientTemplateDelegate clientPanWithDirection:](v3, "clientPanWithDirection:", v6);

}

- (void)panBeganWithDirection:(int64_t)a3
{
  CPMapClientTemplateDelegate *v3;
  id v4;
  os_log_t oslog;
  int64_t v6;
  SEL v7;
  CPSMapTemplateViewController *v8;
  uint8_t v9[24];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v8 = self;
  v7 = a2;
  v6 = a3;
  oslog = (os_log_t)CarPlaySupportGeneralLogging();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v6);
    __os_log_helper_16_2_2_8_64_8_64((uint64_t)v9, (uint64_t)v8, (uint64_t)v4);
    _os_log_impl(&dword_21E389000, oslog, OS_LOG_TYPE_DEFAULT, "%@: Pan began with direction: %@", v9, 0x16u);

  }
  objc_storeStrong((id *)&oslog, 0);
  v3 = -[CPSMapTemplateViewController mapTemplateDelegate](v8, "mapTemplateDelegate");
  -[CPMapClientTemplateDelegate clientPanBeganWithDirection:](v3, "clientPanBeganWithDirection:", v6);

}

- (void)panEndedWithDirection:(int64_t)a3
{
  CPMapClientTemplateDelegate *v3;
  id v4;
  os_log_t oslog;
  int64_t v6;
  SEL v7;
  CPSMapTemplateViewController *v8;
  uint8_t v9[24];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v8 = self;
  v7 = a2;
  v6 = a3;
  oslog = (os_log_t)CarPlaySupportGeneralLogging();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v6);
    __os_log_helper_16_2_2_8_64_8_64((uint64_t)v9, (uint64_t)v8, (uint64_t)v4);
    _os_log_impl(&dword_21E389000, oslog, OS_LOG_TYPE_DEFAULT, "%@: Pan ended with direction: %@", v9, 0x16u);

  }
  objc_storeStrong((id *)&oslog, 0);
  v3 = -[CPSMapTemplateViewController mapTemplateDelegate](v8, "mapTemplateDelegate");
  -[CPMapClientTemplateDelegate clientPanEndedWithDirection:](v3, "clientPanEndedWithDirection:", v6);

}

- (CPMapClientTemplateDelegate)mapTemplateDelegate
{
  return -[CPSBaseTemplateViewController templateDelegate](self, "templateDelegate", a2, self);
}

- (void)navigationOwnershipChangedToOwner:(unint64_t)a3
{
  CPMapClientTemplateDelegate *v3;
  NSObject *log;
  os_log_type_t type;
  __CFString *v6;
  os_log_t oslog;
  __CFString *v8;
  os_log_type_t v9;
  id v10;
  unint64_t v11;
  SEL v12;
  CPSMapTemplateViewController *v13;
  uint8_t v14[16];
  uint8_t v15[24];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v13 = self;
  v12 = a2;
  v11 = a3;
  v10 = CarPlaySupportGeneralLogging();
  v9 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEFAULT))
  {
    log = v10;
    type = v9;
    v6 = NSStringFromNavigationOwner_1(v11);
    v8 = v6;
    __os_log_helper_16_2_2_8_64_8_64((uint64_t)v15, (uint64_t)v13, (uint64_t)v8);
    _os_log_impl(&dword_21E389000, log, type, "%@: Navigation ownership changed to %@", v15, 0x16u);

    objc_storeStrong((id *)&v8, 0);
  }
  objc_storeStrong(&v10, 0);
  if (v11 == 2)
  {
    oslog = (os_log_t)CarPlaySupportGeneralLogging();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v14, (uint64_t)v13);
      _os_log_impl(&dword_21E389000, oslog, OS_LOG_TYPE_DEFAULT, "%@: car owns navigation, requesting client cancel trip", v14, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
    v3 = -[CPSMapTemplateViewController mapTemplateDelegate](v13, "mapTemplateDelegate");
    -[CPMapClientTemplateDelegate clientTripCanceledByExternalNavigation](v3, "clientTripCanceledByExternalNavigation");

  }
}

- (void)_updateInterestingArea
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CPSSafeAreaDelegate *v10;
  id v11;
  id v12;
  UIStackView *v13;
  double v14;
  double v15;
  UIStackView *v16;
  id v17;
  id v18;
  double v19;
  double v20;
  double v21;
  double v22;

  -[CPSMapTemplateViewController _navBarInsets](self, "_navBarInsets");
  v22 = v2;
  -[CPSMapTemplateViewController _mapButtonsEdgeInsets](self, "_mapButtonsEdgeInsets");
  v21 = v3;
  UIEdgeInsetsMake_6();
  if (-[CPSMapTemplateViewController rightHandDrive](self, "rightHandDrive"))
  {
    v17 = (id)-[CPSMapTemplateViewController view](self, "view");
    objc_msgSend(v17, "frame");
    v14 = v4;
    v16 = -[CPSMapTemplateViewController trailingBottomStackView](self, "trailingBottomStackView");
    -[UIStackView frame](v16, "frame");
    v15 = v5;
    v13 = -[CPSMapTemplateViewController trailingBottomStackView](self, "trailingBottomStackView");
    -[UIStackView bounds](v13, "bounds");
    v20 = v14 - (v15 + v6);

    v18 = (id)-[CPSMapTemplateViewController view](self, "view");
    objc_msgSend(v18, "safeAreaInsets");
    v19 = v7 + 8.0;

  }
  else
  {
    v11 = (id)-[CPSMapTemplateViewController view](self, "view");
    objc_msgSend(v11, "safeAreaInsets");
    v20 = v8 + 8.0;

    v12 = (id)-[CPSMapTemplateViewController view](self, "view");
    objc_msgSend(v12, "bounds");
    v19 = v9 - 38.0;

  }
  v10 = -[CPSMapTemplateViewController safeAreaDelegate](self, "safeAreaDelegate");
  -[CPSSafeAreaDelegate updateInterestingInsets:](v10, "updateInterestingInsets:", v22, v19, v21, v20);

}

- (void)_updateSafeArea
{
  double v2;
  double v3;
  double v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSLayoutConstraint *v22;
  CPSSafeAreaDelegate *v23;
  double v24;
  NSLayoutConstraint *v25;
  double v26;
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;

  v27 = (id)-[CPSMapTemplateViewController view](self, "view");
  objc_msgSend(v27, "setNeedsLayout");

  v28 = (id)-[CPSMapTemplateViewController view](self, "view");
  objc_msgSend(v28, "layoutIfNeeded");

  v29 = (id)-[CPSMapTemplateViewController view](self, "view");
  objc_msgSend(v29, "safeAreaInsets");
  v32 = v2;
  v33 = v3;
  v35 = v4;
  v36 = v5;

  -[CPSMapTemplateViewController _cardViewEdgeInsets](self, "_cardViewEdgeInsets");
  v30 = v6;
  v31 = v7;
  -[CPSMapTemplateViewController _mapButtonsEdgeInsets](self, "_mapButtonsEdgeInsets");
  -[CPSMapTemplateViewController _previewEdgeInsets](self, "_previewEdgeInsets");
  -[CPSMapTemplateViewController _navBarInsets](self, "_navBarInsets");
  -[CPSMapTemplateViewController _navigationAlertInsets](self, "_navigationAlertInsets");
  v34 = v33 + CPSMaxCGFloat(5uLL, v8, v9, v10, v11, v12, v13, v14, v30);
  v37 = v36 + CPSMaxCGFloat(5uLL, v15, v16, v17, v18, v19, v20, v21, v31);
  if (-[CPSMapTemplateViewController rightHandDrive](self, "rightHandDrive"))
    v26 = 0.0;
  else
    v26 = v34;
  v25 = -[CPSMapTemplateViewController panContainerLeftConstraint](self, "panContainerLeftConstraint");
  -[NSLayoutConstraint setConstant:](v25, "setConstant:", v26);

  if (-[CPSMapTemplateViewController rightHandDrive](self, "rightHandDrive"))
    v24 = v37;
  else
    v24 = 0.0;
  v22 = -[CPSMapTemplateViewController panContainerRightConstraint](self, "panContainerRightConstraint");
  -[NSLayoutConstraint setConstant:](v22, "setConstant:", -v24);

  v23 = -[CPSMapTemplateViewController safeAreaDelegate](self, "safeAreaDelegate");
  -[CPSSafeAreaDelegate viewController:didUpdateSafeAreaInsets:](v23, "viewController:didUpdateSafeAreaInsets:", self, v32, v34, v35, v37);

  -[CPSMapTemplateViewController _updateInterestingArea](self, "_updateInterestingArea");
}

- (UIEdgeInsets)_mapButtonsEdgeInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CPSPanViewController *v14;
  CPSPanViewController *v15;
  char v16;
  id v17;
  UIStackView *v18;
  double v19;
  id v20;
  UIStackView *v21;
  double v22;
  UIStackView *v23;
  UIStackView *v24;
  double v25;
  id v26;
  char v27;
  UIStackView *v28;
  NSMutableArray *v29;
  char v30;
  UIStackView *v31;
  uint64_t v32;
  int v33;
  int v34;
  void (*v35)(_QWORD *, void *, uint64_t, _BYTE *);
  void *v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t *v39;
  int v40;
  int v41;
  char v42;
  SEL v43;
  CPSMapTemplateViewController *v44;
  __int128 v45;
  __int128 v46;
  UIEdgeInsets result;

  v44 = self;
  v43 = a2;
  v45 = 0u;
  v46 = 0u;
  v45 = *MEMORY[0x24BDF7718];
  v46 = *(_OWORD *)(MEMORY[0x24BDF7718] + 16);
  v38 = 0;
  v39 = &v38;
  v40 = 0x20000000;
  v41 = 32;
  v42 = 0;
  v29 = -[CPSMapTemplateViewController mapButtons](self, "mapButtons");
  v32 = MEMORY[0x24BDAC760];
  v33 = -1073741824;
  v34 = 0;
  v35 = __53__CPSMapTemplateViewController__mapButtonsEdgeInsets__block_invoke;
  v36 = &unk_24E271550;
  v37 = &v38;
  -[NSMutableArray enumerateObjectsUsingBlock:](v29, "enumerateObjectsUsingBlock:", &v32);

  v30 = 0;
  v28 = -[CPSMapTemplateViewController trailingBottomStackView](v44, "trailingBottomStackView");
  v27 = 0;
  if ((-[UIStackView isHidden](v28, "isHidden") & 1) == 0)
  {
    v31 = -[CPSMapTemplateViewController trailingBottomStackView](v44, "trailingBottomStackView");
    v30 = 1;
    -[UIStackView alpha](v31, "alpha");
    v27 = 0;
    if (v2 > 0.0)
      v27 = *((_BYTE *)v39 + 24);
  }
  if ((v30 & 1) != 0)

  if ((v27 & 1) != 0)
  {
    v26 = (id)-[CPSMapTemplateViewController view](v44, "view");
    objc_msgSend(v26, "bounds");
    v25 = v3;
    v24 = -[CPSMapTemplateViewController trailingBottomStackView](v44, "trailingBottomStackView");
    -[UIStackView frame](v24, "frame");
    *(double *)&v45 = v25 - v4;

    if (-[CPSMapTemplateViewController rightHandDrive](v44, "rightHandDrive"))
    {
      v23 = -[CPSMapTemplateViewController trailingBottomStackView](v44, "trailingBottomStackView");
      -[UIStackView frame](v23, "frame");
      v22 = v5;
      v21 = -[CPSMapTemplateViewController trailingBottomStackView](v44, "trailingBottomStackView");
      -[UIStackView frame](v21, "frame");
      *((double *)&v45 + 1) = v22 + v6;

    }
    else
    {
      v20 = (id)-[CPSMapTemplateViewController view](v44, "view");
      objc_msgSend(v20, "bounds");
      v19 = v7;
      v18 = -[CPSMapTemplateViewController trailingBottomStackView](v44, "trailingBottomStackView");
      -[UIStackView frame](v18, "frame");
      *((double *)&v46 + 1) = v19 - v8;

    }
  }
  else
  {
    v17 = (id)-[CPSMapTemplateViewController childViewControllers](v44, "childViewControllers");
    v15 = -[CPSMapTemplateViewController panViewController](v44, "panViewController");
    v16 = objc_msgSend(v17, "containsObject:");

    if ((v16 & 1) != 0)
    {
      v14 = -[CPSMapTemplateViewController panViewController](v44, "panViewController");
      -[CPSPanViewController sideButtonTopInset](v14, "sideButtonTopInset");
      *(_QWORD *)&v45 = v9;

    }
  }
  _Block_object_dispose(&v38, 8);
  v11 = *((double *)&v45 + 1);
  v10 = *(double *)&v45;
  v13 = *((double *)&v46 + 1);
  v12 = *(double *)&v46;
  result.right = v13;
  result.bottom = v12;
  result.left = v11;
  result.top = v10;
  return result;
}

void __53__CPSMapTemplateViewController__mapButtonsEdgeInsets__block_invoke(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  if ((objc_msgSend(location[0], "isHidden") & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = 1;
    *a4 = 1;
  }
  objc_storeStrong(location, 0);
}

- (UIEdgeInsets)_cardViewEdgeInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;
  double v14;
  id v15;
  CPSNavigationCardViewController *v16;
  id v17;
  CPSNavigationCardViewController *v18;
  double v19;
  id v20;
  double v21;
  id v22;
  CPSNavigationCardViewController *v23;
  id v24;
  CPSNavigationCardViewController *v25;
  BOOL v26;
  __int128 v28;
  __int128 v29;
  UIEdgeInsets result;

  v28 = *MEMORY[0x24BDF7718];
  v29 = *(_OWORD *)(MEMORY[0x24BDF7718] + 16);
  v25 = -[CPSMapTemplateViewController navigationCardViewController](self, "navigationCardViewController");
  v26 = -[CPSNavigationCardViewController navigationCardHidden](v25, "navigationCardHidden");

  if (!v26)
  {
    if (-[CPSMapTemplateViewController rightHandDrive](self, "rightHandDrive"))
    {
      v24 = (id)-[CPSMapTemplateViewController view](self, "view");
      objc_msgSend(v24, "bounds");
      v19 = v2;
      v23 = -[CPSMapTemplateViewController navigationCardViewController](self, "navigationCardViewController");
      v22 = (id)-[CPSNavigationCardViewController view](v23, "view");
      objc_msgSend(v22, "frame");
      v21 = v19 - v3;
      v20 = (id)-[CPSMapTemplateViewController view](self, "view");
      objc_msgSend(v20, "safeAreaInsets");
      *((double *)&v29 + 1) = v21 - v4;

    }
    else
    {
      v18 = -[CPSMapTemplateViewController navigationCardViewController](self, "navigationCardViewController");
      v17 = (id)-[CPSNavigationCardViewController view](v18, "view");
      objc_msgSend(v17, "frame");
      v12 = v5;
      v16 = -[CPSMapTemplateViewController navigationCardViewController](self, "navigationCardViewController");
      v15 = (id)-[CPSNavigationCardViewController view](v16, "view");
      objc_msgSend(v15, "frame");
      v14 = v12 + v6;
      v13 = (id)-[CPSMapTemplateViewController view](self, "view");
      objc_msgSend(v13, "safeAreaInsets");
      *((double *)&v28 + 1) = v14 - v7;

    }
  }
  v9 = *((double *)&v28 + 1);
  v8 = *(double *)&v28;
  v11 = *((double *)&v29 + 1);
  v10 = *(double *)&v29;
  result.right = v11;
  result.bottom = v10;
  result.left = v9;
  result.top = v8;
  return result;
}

- (UIEdgeInsets)_previewEdgeInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;
  double v15;
  CPSTripPreviewsCardView *v16;
  CPSTripPreviewsCardView *v17;
  double v18;
  id v19;
  double v20;
  CPSTripPreviewsCardView *v21;
  id v22;
  CPSTripPreviewsCardView *v23;
  BOOL v24;
  char v25;
  CPSTripPreviewsCardView *v26;
  char v27;
  CPSTripPreviewsCardView *v28;
  __int128 v30;
  __int128 v31;
  UIEdgeInsets result;

  v30 = *MEMORY[0x24BDF7718];
  v31 = *(_OWORD *)(MEMORY[0x24BDF7718] + 16);
  v23 = -[CPSMapTemplateViewController previewsView](self, "previewsView");
  v27 = 0;
  v25 = 0;
  v24 = 0;
  if (v23)
  {
    v28 = -[CPSMapTemplateViewController previewsView](self, "previewsView");
    v27 = 1;
    v24 = 0;
    if ((-[CPSTripPreviewsCardView isHidden](v28, "isHidden") & 1) == 0)
    {
      v26 = -[CPSMapTemplateViewController previewsView](self, "previewsView");
      v25 = 1;
      -[CPSTripPreviewsCardView frame](v26, "frame");
      v24 = v2 > 0.0;
    }
  }
  if ((v25 & 1) != 0)

  if ((v27 & 1) != 0)
  if (v24)
  {
    if (-[CPSMapTemplateViewController rightHandDrive](self, "rightHandDrive"))
    {
      v22 = (id)-[CPSMapTemplateViewController view](self, "view");
      objc_msgSend(v22, "bounds");
      v18 = v3;
      v21 = -[CPSMapTemplateViewController previewsView](self, "previewsView");
      -[CPSTripPreviewsCardView frame](v21, "frame");
      v20 = v18 - v4;
      v19 = (id)-[CPSMapTemplateViewController view](self, "view");
      objc_msgSend(v19, "safeAreaInsets");
      *((double *)&v31 + 1) = v20 - v5;

    }
    else
    {
      v17 = -[CPSMapTemplateViewController previewsView](self, "previewsView");
      -[CPSTripPreviewsCardView frame](v17, "frame");
      v13 = v6;
      v16 = -[CPSMapTemplateViewController previewsView](self, "previewsView");
      -[CPSTripPreviewsCardView frame](v16, "frame");
      v15 = v13 + v7;
      v14 = (id)-[CPSMapTemplateViewController view](self, "view");
      objc_msgSend(v14, "safeAreaInsets");
      *((double *)&v30 + 1) = v15 - v8;

    }
  }
  v10 = *((double *)&v30 + 1);
  v9 = *(double *)&v30;
  v12 = *((double *)&v31 + 1);
  v11 = *(double *)&v31;
  result.right = v12;
  result.bottom = v11;
  result.left = v10;
  result.top = v9;
  return result;
}

- (UIEdgeInsets)_navBarInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  id v8;
  double v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  char v15;
  __int128 v17;
  __int128 v18;
  UIEdgeInsets result;

  v17 = *MEMORY[0x24BDF7718];
  v18 = *(_OWORD *)(MEMORY[0x24BDF7718] + 16);
  v14 = (id)-[CPSMapTemplateViewController navigationController](self, "navigationController");
  v13 = (id)objc_msgSend(v14, "navigationBar");
  v15 = objc_msgSend(v13, "isHidden");

  if ((v15 & 1) == 0)
  {
    v12 = (id)-[CPSMapTemplateViewController navigationController](self, "navigationController");
    v11 = (id)objc_msgSend(v12, "navigationBar");
    objc_msgSend(v11, "frame");
    v9 = v2;
    v10 = (id)-[CPSMapTemplateViewController navigationController](self, "navigationController");
    v8 = (id)objc_msgSend(v10, "navigationBar");
    objc_msgSend(v8, "frame");
    *(double *)&v17 = v9 + v3;

  }
  v5 = *((double *)&v17 + 1);
  v4 = *(double *)&v17;
  v7 = *((double *)&v18 + 1);
  v6 = *(double *)&v18;
  result.right = v7;
  result.bottom = v6;
  result.left = v5;
  result.top = v4;
  return result;
}

- (UIEdgeInsets)_navigationAlertInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;
  double v14;
  double v15;
  id v16;
  double v17;
  id v18;
  CPSNavigationAlertQueue *v19;
  id location[2];
  CPSMapTemplateViewController *v21;
  __int128 v22;
  __int128 v23;
  UIEdgeInsets result;

  v21 = self;
  location[1] = (id)a2;
  v22 = 0u;
  v23 = 0u;
  v22 = *MEMORY[0x24BDF7718];
  v23 = *(_OWORD *)(MEMORY[0x24BDF7718] + 16);
  v19 = -[CPSMapTemplateViewController navigationAlertQueue](self, "navigationAlertQueue");
  location[0] = -[CPSNavigationAlertQueue currentAlertView](v19, "currentAlertView");

  if (location[0])
  {
    if (-[CPSMapTemplateViewController rightHandDrive](v21, "rightHandDrive"))
    {
      v18 = (id)-[CPSMapTemplateViewController view](v21, "view");
      objc_msgSend(v18, "bounds");
      v15 = v2;
      objc_msgSend(location[0], "frame");
      v17 = v15 - v3;
      v16 = (id)-[CPSMapTemplateViewController view](v21, "view");
      objc_msgSend(v16, "safeAreaInsets");
      *((double *)&v23 + 1) = v17 - v4;

    }
    else
    {
      objc_msgSend(location[0], "frame");
      v12 = v5;
      objc_msgSend(location[0], "frame");
      v14 = v12 + v6;
      v13 = (id)-[CPSMapTemplateViewController view](v21, "view");
      objc_msgSend(v13, "safeAreaInsets");
      *((double *)&v22 + 1) = v14 - v7;

    }
  }
  objc_storeStrong(location, 0);
  v9 = *((double *)&v22 + 1);
  v8 = *(double *)&v22;
  v11 = *((double *)&v23 + 1);
  v10 = *(double *)&v23;
  result.right = v11;
  result.bottom = v10;
  result.left = v9;
  result.top = v8;
  return result;
}

- (BOOL)shouldUpdateFocusInContext:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  BOOL v9;
  objc_super v10;
  int v11;
  char v12;
  id v13;
  char v14;
  id v15;
  id location[2];
  CPSMapTemplateViewController *v17;
  char v18;

  v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7 = (id)objc_msgSend(location[0], "previouslyFocusedView");
  v6 = (id)-[CPSMapTemplateViewController navigationController](v17, "navigationController");
  v8 = (id)objc_msgSend(v6, "navigationBar");
  v14 = 0;
  v12 = 0;
  v9 = 0;
  if ((objc_msgSend(v7, "isDescendantOfView:") & 1) != 0)
  {
    v9 = 0;
    if (objc_msgSend(location[0], "focusHeading") == 16)
    {
      v15 = -[CPSMapTemplateViewController _linearFocusItems](v17, "_linearFocusItems");
      v14 = 1;
      v13 = (id)objc_msgSend(location[0], "nextFocusedView");
      v12 = 1;
      v9 = objc_msgSend(v15, "indexOfObject:") != 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  if ((v12 & 1) != 0)

  if ((v14 & 1) != 0)
  if (v9)
  {
    v5 = -[CPSMapTemplateViewController _linearFocusItems](v17, "_linearFocusItems");
    v4 = (id)objc_msgSend(location[0], "nextFocusedView");
    v18 = objc_msgSend(v5, "indexOfObject:") == 0;

  }
  else
  {
    v10.receiver = v17;
    v10.super_class = (Class)CPSMapTemplateViewController;
    v18 = -[CPSMapTemplateViewController shouldUpdateFocusInContext:](&v10, sel_shouldUpdateFocusInContext_, location[0]);
  }
  v11 = 1;
  objc_storeStrong(location, 0);
  return v18 & 1;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v4;
  char v5;
  id v6;
  id v7;
  UIFocusItem *v8;
  UIFocusGuide *v9;
  id v10;
  UIFocusItem *v11;
  UIFocusGuide *v12;
  id v14;
  char v15;
  char v16;
  id v17;
  char v18;
  id v19;
  char v20;
  id v21;
  char v22;
  id v23;
  char v24;
  id v25;
  id v26;
  id location[2];
  CPSMapTemplateViewController *v28;
  UIFocusItem *v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x24BDAC8D0];
  v28 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v26 = 0;
  objc_storeStrong(&v26, a4);
  v14 = (id)objc_msgSend(location[0], "nextFocusedView");
  v24 = 0;
  v22 = 0;
  v15 = 0;
  if (v14)
  {
    v25 = (id)objc_msgSend(location[0], "nextFocusedView");
    v24 = 1;
    v23 = (id)-[CPSMapTemplateViewController view](v28, "view");
    v22 = 1;
    v15 = objc_msgSend(v25, "isDescendantOfView:");
  }
  if ((v22 & 1) != 0)

  if ((v24 & 1) != 0)
  if ((v15 & 1) != 0)
  {
    v6 = (id)objc_msgSend(location[0], "nextFocusedItem");
    -[CPSMapTemplateViewController setLastFocusedItem:](v28, "setLastFocusedItem:");

    v9 = -[CPSMapTemplateViewController focusHolderLeftFocusGuide](v28, "focusHolderLeftFocusGuide");
    v8 = -[CPSMapTemplateViewController lastFocusedItem](v28, "lastFocusedItem");
    v30[0] = v8;
    v7 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v30);
    -[UIFocusGuide setPreferredFocusEnvironments:](v9, "setPreferredFocusEnvironments:");

    v12 = -[CPSMapTemplateViewController focusHolderRightFocusGuide](v28, "focusHolderRightFocusGuide");
    v11 = -[CPSMapTemplateViewController lastFocusedItem](v28, "lastFocusedItem");
    v29 = v11;
    v10 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v29, 1);
    -[UIFocusGuide setPreferredFocusEnvironments:](v12, "setPreferredFocusEnvironments:");

  }
  else
  {
    v4 = (id)objc_msgSend(location[0], "nextFocusedItem");
    v20 = 0;
    v18 = 0;
    v16 = 0;
    v5 = 0;
    if (v4)
    {
      v21 = (id)objc_msgSend(location[0], "nextFocusedView");
      v20 = 1;
      v19 = (id)-[CPSMapTemplateViewController parentViewController](v28, "parentViewController");
      v18 = 1;
      v17 = (id)objc_msgSend(v19, "view");
      v16 = 1;
      v5 = objc_msgSend(v21, "isDescendantOfView:");
    }
    if ((v16 & 1) != 0)

    if ((v18 & 1) != 0)
    if ((v20 & 1) != 0)

    if ((v5 & 1) != 0)
      -[CPSMapTemplateViewController setLastFocusedItem:](v28, "setLastFocusedItem:", 0);
  }
  objc_storeStrong(&v26, 0);
  objc_storeStrong(location, 0);
}

- (id)preferredFocusEnvironments
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  CPSNavigationAlertView *v8;
  CPSNavigationAlertQueue *v9;
  CPSNavigationAlertQueue *v10;
  CPSNavigationAlertView *v11;
  CPSPanViewController *v12;
  CPSPanViewController *v13;
  int v14;
  CPSTripPreviewsCardView *v15;
  CPSTripPreviewsCardView *v16;
  UIFocusItem *v17;
  UIFocusItem *v18;
  char v19;
  UIView *v20;
  id v21[2];
  CPSMapTemplateViewController *v22;

  v22 = self;
  v21[1] = (id)a2;
  v21[0] = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v18 = -[CPSMapTemplateViewController lastFocusedItem](v22, "lastFocusedItem");

  if (v18)
  {
    v17 = -[CPSMapTemplateViewController lastFocusedItem](v22, "lastFocusedItem");
    objc_msgSend(v21[0], "addObject:");

  }
  v16 = -[CPSMapTemplateViewController previewsView](v22, "previewsView");

  if (v16)
  {
    v15 = -[CPSMapTemplateViewController previewsView](v22, "previewsView");
    objc_msgSend(v21[0], "addObject:");

  }
  v13 = -[CPSMapTemplateViewController panViewController](v22, "panViewController");
  v19 = 0;
  LOBYTE(v14) = 0;
  if (v13)
  {
    v20 = -[CPSMapTemplateViewController panContainerView](v22, "panContainerView");
    v19 = 1;
    v14 = !-[UIView isHidden](v20, "isHidden");
  }
  if ((v19 & 1) != 0)

  if ((v14 & 1) != 0)
  {
    v12 = -[CPSMapTemplateViewController panViewController](v22, "panViewController");
    objc_msgSend(v21[0], "addObject:");

  }
  v10 = -[CPSMapTemplateViewController navigationAlertQueue](v22, "navigationAlertQueue");
  v11 = -[CPSNavigationAlertQueue currentAlertView](v10, "currentAlertView");

  if (v11)
  {
    v9 = -[CPSMapTemplateViewController navigationAlertQueue](v22, "navigationAlertQueue");
    v8 = -[CPSNavigationAlertQueue currentAlertView](v9, "currentAlertView");
    objc_msgSend(v21[0], "addObject:");

  }
  v6 = (id)-[CPSMapTemplateViewController navigationController](v22, "navigationController");
  v7 = (id)objc_msgSend(v6, "navigationBar");

  if (v7)
  {
    v5 = (id)-[CPSMapTemplateViewController navigationController](v22, "navigationController");
    v4 = (id)objc_msgSend(v5, "navigationBar");
    objc_msgSend(v21[0], "addObject:");

  }
  v3 = (id)objc_msgSend(v21[0], "copy");
  objc_storeStrong(v21, 0);
  return v3;
}

- (id)_linearFocusItems
{
  id v3;
  id v4;
  id v5;
  CPSPanViewController *v6;
  id v7;
  id v8;
  CPSNavigationAlertView *v9;
  CPSNavigationAlertQueue *v10;
  CPSNavigationAlertQueue *v11;
  CPSNavigationAlertView *v12;
  id v13;
  id v14;
  CPSTripPreviewsCardView *v15;
  CPSTripPreviewsCardView *v16;
  id v17;
  id v18;
  CPSTripPreviewsCardView *v19;
  CPSTripPreviewsCardView *v20;
  id v21;
  id v22;
  CPSNavigationAlertView *v23;
  CPSNavigationAlertQueue *v24;
  id v25;
  id v26;
  CPSPanViewController *v27;
  CPSNavigationAlertQueue *v28;
  CPSNavigationAlertView *v29;
  id v30;
  id v31;
  CPSNavigationAlertView *v32;
  CPSNavigationAlertQueue *v33;
  CPSNavigationAlertQueue *v34;
  CPSNavigationAlertView *v35;
  id v36;
  id v37;
  CPSTripPreviewsCardView *v38;
  CPSTripPreviewsCardView *v39;
  id v40;
  id v41;
  CPSNavigationAlertView *v42;
  CPSNavigationAlertQueue *v43;
  CPSNavigationAlertQueue *v44;
  CPSNavigationAlertView *v45;
  id v46;
  id v47;
  CPSTripPreviewsCardView *v48;
  CPSTripPreviewsCardView *v49;
  UIView *v50;
  BOOL v51;
  NSMutableArray *v52;
  NSMutableArray *v53;
  BOOL v54;
  uint64_t v55;
  int v56;
  int v57;
  void (*v58)(id *, void *);
  void *v59;
  id v60;
  id location;
  id v62[2];
  CPSMapTemplateViewController *v63;

  v63 = self;
  v62[1] = (id)a2;
  v62[0] = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  location = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v53 = -[CPSMapTemplateViewController mapButtons](v63, "mapButtons");
  v54 = -[NSMutableArray count](v53, "count") == 0;

  if (!v54)
  {
    v52 = -[CPSMapTemplateViewController mapButtons](v63, "mapButtons");
    v55 = MEMORY[0x24BDAC760];
    v56 = -1073741824;
    v57 = 0;
    v58 = __49__CPSMapTemplateViewController__linearFocusItems__block_invoke;
    v59 = &unk_24E271578;
    v60 = location;
    -[NSMutableArray enumerateObjectsUsingBlock:](v52, "enumerateObjectsUsingBlock:", &v55);

    objc_storeStrong(&v60, 0);
  }
  v50 = -[CPSMapTemplateViewController panContainerView](v63, "panContainerView");
  v51 = -[UIView isHidden](v50, "isHidden");

  if (v51)
  {
    if (-[CPSMapTemplateViewController rightHandDrive](v63, "rightHandDrive"))
    {
      objc_msgSend(v62[0], "addObjectsFromArray:", location);
      v49 = -[CPSMapTemplateViewController previewsView](v63, "previewsView");

      if (v49)
      {
        v46 = v62[0];
        v48 = -[CPSMapTemplateViewController previewsView](v63, "previewsView");
        v47 = -[CPSTripPreviewsCardView _linearFocusItems](v48, "_linearFocusItems");
        objc_msgSend(v46, "addObjectsFromArray:");

      }
      v44 = -[CPSMapTemplateViewController navigationAlertQueue](v63, "navigationAlertQueue");
      v45 = -[CPSNavigationAlertQueue currentAlertView](v44, "currentAlertView");

      if (v45)
      {
        v40 = v62[0];
        v43 = -[CPSMapTemplateViewController navigationAlertQueue](v63, "navigationAlertQueue");
        v42 = -[CPSNavigationAlertQueue currentAlertView](v43, "currentAlertView");
        v41 = -[CPSNavigationAlertView _linearFocusItems](v42, "_linearFocusItems");
        objc_msgSend(v40, "addObjectsFromArray:");

      }
    }
    else
    {
      v39 = -[CPSMapTemplateViewController previewsView](v63, "previewsView");

      if (v39)
      {
        v36 = v62[0];
        v38 = -[CPSMapTemplateViewController previewsView](v63, "previewsView");
        v37 = -[CPSTripPreviewsCardView _linearFocusItems](v38, "_linearFocusItems");
        objc_msgSend(v36, "addObjectsFromArray:");

      }
      v34 = -[CPSMapTemplateViewController navigationAlertQueue](v63, "navigationAlertQueue");
      v35 = -[CPSNavigationAlertQueue currentAlertView](v34, "currentAlertView");

      if (v35)
      {
        v30 = v62[0];
        v33 = -[CPSMapTemplateViewController navigationAlertQueue](v63, "navigationAlertQueue");
        v32 = -[CPSNavigationAlertQueue currentAlertView](v33, "currentAlertView");
        v31 = -[CPSNavigationAlertView _linearFocusItems](v32, "_linearFocusItems");
        objc_msgSend(v30, "addObjectsFromArray:");

      }
      objc_msgSend(v62[0], "addObjectsFromArray:", location);
    }
  }
  else if (-[CPSMapTemplateViewController rightHandDrive](v63, "rightHandDrive"))
  {
    v25 = v62[0];
    v27 = -[CPSMapTemplateViewController panViewController](v63, "panViewController");
    v26 = -[CPSPanViewController _linearFocusItemsWithPresentedMapButtons:](v27, "_linearFocusItemsWithPresentedMapButtons:", location);
    objc_msgSend(v25, "addObjectsFromArray:");

    v28 = -[CPSMapTemplateViewController navigationAlertQueue](v63, "navigationAlertQueue");
    v29 = -[CPSNavigationAlertQueue currentAlertView](v28, "currentAlertView");

    if (v29)
    {
      v21 = v62[0];
      v24 = -[CPSMapTemplateViewController navigationAlertQueue](v63, "navigationAlertQueue");
      v23 = -[CPSNavigationAlertQueue currentAlertView](v24, "currentAlertView");
      v22 = -[CPSNavigationAlertView _linearFocusItems](v23, "_linearFocusItems");
      objc_msgSend(v21, "addObjectsFromArray:");

    }
    v20 = -[CPSMapTemplateViewController previewsView](v63, "previewsView");

    if (v20)
    {
      v17 = v62[0];
      v19 = -[CPSMapTemplateViewController previewsView](v63, "previewsView");
      v18 = -[CPSTripPreviewsCardView _linearFocusItems](v19, "_linearFocusItems");
      objc_msgSend(v17, "addObjectsFromArray:");

    }
  }
  else
  {
    v16 = -[CPSMapTemplateViewController previewsView](v63, "previewsView");

    if (v16)
    {
      v13 = v62[0];
      v15 = -[CPSMapTemplateViewController previewsView](v63, "previewsView");
      v14 = -[CPSTripPreviewsCardView _linearFocusItems](v15, "_linearFocusItems");
      objc_msgSend(v13, "addObjectsFromArray:");

    }
    v11 = -[CPSMapTemplateViewController navigationAlertQueue](v63, "navigationAlertQueue");
    v12 = -[CPSNavigationAlertQueue currentAlertView](v11, "currentAlertView");

    if (v12)
    {
      v7 = v62[0];
      v10 = -[CPSMapTemplateViewController navigationAlertQueue](v63, "navigationAlertQueue");
      v9 = -[CPSNavigationAlertQueue currentAlertView](v10, "currentAlertView");
      v8 = -[CPSNavigationAlertView _linearFocusItems](v9, "_linearFocusItems");
      objc_msgSend(v7, "addObjectsFromArray:");

    }
    v4 = v62[0];
    v6 = -[CPSMapTemplateViewController panViewController](v63, "panViewController");
    v5 = -[CPSPanViewController _linearFocusItemsWithPresentedMapButtons:](v6, "_linearFocusItemsWithPresentedMapButtons:", location);
    objc_msgSend(v4, "addObjectsFromArray:");

  }
  v3 = v62[0];
  objc_storeStrong(&location, 0);
  objc_storeStrong(v62, 0);
  return v3;
}

void __49__CPSMapTemplateViewController__linearFocusItems__block_invoke(id *a1, void *a2)
{
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  if ((objc_msgSend(location[0], "isHidden") & 1) == 0)
    objc_msgSend(a1[4], "addObject:", location[0]);
  objc_storeStrong(location, 0);
}

- (BOOL)shouldForwardEventForWindow:(id)a3 eventType:(int64_t)a4
{
  char v5;
  NSObject *v6;
  os_log_type_t v7;
  CPSNavigationAlertQueue *v8;
  int v9;
  NSObject *log;
  os_log_type_t type;
  id v12;
  uint8_t v14[15];
  char v15;
  id v16;
  char v17;
  UIFocusItem *v18;
  id v19;
  uint8_t v20[15];
  char v21;
  id v22;
  char v23;
  int64_t v24;
  id location[2];
  CPSMapTemplateViewController *v26;

  v26 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v24 = a4;
  v23 = 1;
  if (a4 == 7)
  {
    v12 = (id)-[CPSMapTemplateViewController navigationController](v26, "navigationController");
    v23 = (objc_msgSend(v12, "isNavigationBarHidden") ^ 1) & 1;

    v22 = CarPlaySupportGeneralLogging();
    v21 = 2;
    if (os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_DEBUG))
    {
      log = v22;
      type = v21;
      __os_log_helper_16_0_0(v20);
      _os_log_debug_impl(&dword_21E389000, log, type, "Showing navigation bar with reason: wheel event", v20, 2u);
    }
    objc_storeStrong(&v22, 0);
    -[CPSMapTemplateViewController _resetAutoHideTimerAndShowBarAnimated:allowFocusDeferral:](v26, "_resetAutoHideTimerAndShowBarAnimated:allowFocusDeferral:", 1, 0);
  }
  else if (!v24)
  {
    v8 = -[CPSMapTemplateViewController navigationAlertQueue](v26, "navigationAlertQueue");
    v19 = -[CPSNavigationAlertQueue currentAlertView](v8, "currentAlertView");

    v17 = 0;
    LOBYTE(v9) = 1;
    if (v19)
    {
      v18 = -[CPSMapTemplateViewController lastFocusedItem](v26, "lastFocusedItem");
      v17 = 1;
      v9 = objc_msgSend(v19, "containsView:") ^ 1;
    }
    if ((v17 & 1) != 0)

    if ((v9 & 1) != 0)
    {
      v16 = CarPlaySupportGeneralLogging();
      v15 = 2;
      if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_DEBUG))
      {
        v6 = v16;
        v7 = v15;
        __os_log_helper_16_0_0(v14);
        _os_log_debug_impl(&dword_21E389000, v6, v7, "Showing navigation bar with reason: touchpad touch", v14, 2u);
      }
      objc_storeStrong(&v16, 0);
      -[CPSMapTemplateViewController _resetAutoHideTimerAndShowBarAnimated:allowFocusDeferral:](v26, "_resetAutoHideTimerAndShowBarAnimated:allowFocusDeferral:", 1, 1);
    }
    objc_storeStrong(&v19, 0);
  }
  v5 = v23;
  objc_storeStrong(location, 0);
  return v5 & 1;
}

- (void)applicationStateMonitor:(id)a3 didBecomeActive:(BOOL)a4
{
  NSObject *queue;
  uint64_t v6;
  int v7;
  int v8;
  uint64_t (*v9)(uint64_t);
  void *v10;
  CPSMapTemplateViewController *v11;
  BOOL v12;
  BOOL v13;
  id location[2];
  CPSMapTemplateViewController *v15;

  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v13 = a4;
  queue = MEMORY[0x24BDAC9B8];
  v6 = MEMORY[0x24BDAC760];
  v7 = -1073741824;
  v8 = 0;
  v9 = __72__CPSMapTemplateViewController_applicationStateMonitor_didBecomeActive___block_invoke;
  v10 = &unk_24E26FF88;
  v11 = v15;
  v12 = v13;
  dispatch_async(queue, &v6);

  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(location, 0);
}

uint64_t __72__CPSMapTemplateViewController_applicationStateMonitor_didBecomeActive___block_invoke(uint64_t a1)
{
  uint64_t result;
  NSObject *log;
  os_log_type_t type;
  uint8_t v5[7];
  char v6;
  id location[3];

  location[2] = (id)a1;
  location[1] = (id)a1;
  objc_msgSend(*(id *)(a1 + 32), "setApplicationIsFrontmost:", *(_BYTE *)(a1 + 40) & 1);
  result = a1;
  if ((*(_BYTE *)(a1 + 40) & 1) != 0)
  {
    location[0] = CarPlaySupportGeneralLogging();
    v6 = 2;
    if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEBUG))
    {
      log = location[0];
      type = v6;
      __os_log_helper_16_0_0(v5);
      _os_log_debug_impl(&dword_21E389000, log, type, "Showing navigation bar with reason: app coming frontmost", v5, 2u);
    }
    objc_storeStrong(location, 0);
    return objc_msgSend(*(id *)(a1 + 32), "_resetAutoHideTimerAndShowBarAnimated:allowFocusDeferral:", 0, 1);
  }
  return result;
}

- (void)didChangeLayout:(id)a3
{
  CPSLayoutHelperView *v3;
  double v4;
  CPSNavigationCardViewController *v5;
  CPSLayoutHelperView *v6;
  BOOL v7;
  id location[2];
  CPSMapTemplateViewController *v9;

  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = (CPSLayoutHelperView *)location[0];
  v3 = -[CPSMapTemplateViewController navigationCardViewLayoutHelperView](v9, "navigationCardViewLayoutHelperView");
  v7 = v6 != v3;

  if (!v7)
  {
    v5 = -[CPSMapTemplateViewController navigationCardViewController](v9, "navigationCardViewController");
    objc_msgSend(location[0], "frame");
    -[CPSNavigationCardViewController availableHeightChangedTo:](v5, "availableHeightChangedTo:", v4);

  }
  -[CPSMapTemplateViewController _checkNavigationCardHelperViewForETAFit](v9, "_checkNavigationCardHelperViewForETAFit");
  objc_storeStrong(location, 0);
}

- (void)_checkNavigationCardHelperViewForETAFit
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  NSObject *v20;
  os_log_type_t v21;
  NSObject *v22;
  os_log_type_t v23;
  NSObject *log;
  os_log_type_t type;
  NSString *v26;
  id v27;
  CPSLayoutHelperView *v28;
  CPSNavigationCardViewController *v29;
  CPSLayoutHelperView *v30;
  CPSNavigationCardViewController *v31;
  id v32;
  CPSNavigationETAView *v33;
  double MaxY_0;
  id v35;
  id v36;
  double v37;
  uint64_t v38;
  int v39;
  int v40;
  void (*v41)(uint64_t);
  void *v42;
  CPSMapTemplateViewController *v43;
  uint8_t v44[7];
  os_log_type_t v45;
  os_log_t v46;
  uint8_t v47[15];
  os_log_type_t v48;
  os_log_t oslog;
  NSString *v50;
  CGRect rect;
  char v52;
  id v53[9];
  double v54;
  uint64_t v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  SEL v64;
  CPSMapTemplateViewController *v65;
  uint8_t v66[40];
  uint64_t v67;
  CGRect v68;

  v67 = *MEMORY[0x24BDAC8D0];
  v65 = self;
  v64 = a2;
  v32 = (id)-[CPSMapTemplateViewController view](self, "view");
  v31 = -[CPSMapTemplateViewController navigationCardViewController](v65, "navigationCardViewController");
  v30 = -[CPSNavigationCardViewController layoutHelperView](v31, "layoutHelperView");
  -[CPSLayoutHelperView bounds](v30, "bounds");
  v56 = v2;
  v57 = v3;
  v58 = v4;
  v59 = v5;
  v29 = -[CPSMapTemplateViewController navigationCardViewController](v65, "navigationCardViewController");
  v28 = -[CPSNavigationCardViewController layoutHelperView](v29, "layoutHelperView");
  objc_msgSend(v32, "convertRect:fromView:", v56, v57, v58, v59);
  v60 = v6;
  v61 = v7;
  v62 = v8;
  v63 = v9;

  *(double *)&v55 = UIRectGetMaxY_0(v60, v61, v62, v63);
  v36 = (id)-[CPSMapTemplateViewController view](v65, "view");
  v35 = (id)objc_msgSend(v36, "safeAreaLayoutGuide");
  objc_msgSend(v35, "layoutFrame");
  v53[5] = v10;
  v53[6] = v11;
  v53[7] = v12;
  v53[8] = v13;
  MaxY_0 = UIRectGetMaxY_0(*(double *)&v10, *(double *)&v11, *(double *)&v12, *(double *)&v13);
  v33 = -[CPSMapTemplateViewController navigationETAView](v65, "navigationETAView");
  -[CPSNavigationETAView frame](v33, "frame");
  v53[1] = v14;
  v53[2] = v15;
  v53[3] = v16;
  v53[4] = v17;
  v37 = MaxY_0 - *(double *)&v17 - 8.0;

  v54 = v37;
  v53[0] = CarPlaySupportGeneralLogging();
  v52 = 1;
  if (os_log_type_enabled((os_log_t)v53[0], OS_LOG_TYPE_INFO))
  {
    log = v53[0];
    type = v52;
    v27 = (id)-[CPSMapTemplateViewController view](v65, "view");
    objc_msgSend(v27, "bounds");
    rect = v68;
    v26 = NSStringFromCGRect(v68);
    v50 = v26;
    __os_log_helper_16_2_3_8_0_8_0_8_64((uint64_t)v66, v55, *(uint64_t *)&v54, (uint64_t)v50);
    _os_log_impl(&dword_21E389000, log, type, "Navigation card max Y: %f, eta min Y: %f, view size: %@", v66, 0x20u);

    objc_storeStrong((id *)&v50, 0);
  }
  objc_storeStrong(v53, 0);
  if (*(double *)&v55 >= v54)
  {
    v46 = (os_log_t)CarPlaySupportGeneralLogging();
    v45 = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
    {
      v20 = v46;
      v21 = v45;
      __os_log_helper_16_0_0(v44);
      _os_log_impl(&dword_21E389000, v20, v21, "Hiding ETA view if necessary", v44, 2u);
    }
    objc_storeStrong((id *)&v46, 0);
    -[CPSMapTemplateViewController _setETAViewHidden:forRequester:animated:](v65, "_setETAViewHidden:forRequester:animated:", 1, CFSTR("ManeuversCardRequester"), 0);
  }
  else
  {
    oslog = (os_log_t)CarPlaySupportGeneralLogging();
    v48 = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
    {
      v22 = oslog;
      v23 = v48;
      __os_log_helper_16_0_0(v47);
      _os_log_impl(&dword_21E389000, v22, v23, "Showing ETA view if necessary", v47, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
    -[CPSMapTemplateViewController _setETAViewHidden:forRequester:animated:](v65, "_setETAViewHidden:forRequester:animated:", 0, CFSTR("ManeuversCardRequester"), 0);
  }
  v19 = (void *)MEMORY[0x24BDF6F90];
  v18 = *MEMORY[0x24BDF7BD8];
  v38 = MEMORY[0x24BDAC760];
  v39 = -1073741824;
  v40 = 0;
  v41 = __71__CPSMapTemplateViewController__checkNavigationCardHelperViewForETAFit__block_invoke;
  v42 = &unk_24E26F1B8;
  v43 = v65;
  objc_msgSend(v19, "animateWithDuration:delay:options:animations:completion:", 0, &v38, &__block_literal_global_223, v18, 0.0);
  objc_storeStrong((id *)&v43, 0);
}

void __71__CPSMapTemplateViewController__checkNavigationCardHelperViewForETAFit__block_invoke(uint64_t a1)
{
  id v1;

  v1 = (id)objc_msgSend(*(id *)(a1 + 32), "view");
  objc_msgSend(v1, "layoutIfNeeded");

}

- (void)observerDeliveryPolicyDidChange:(id)a3
{
  NSObject *queue;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t (*v7)(id *);
  void *v8;
  CPSMapTemplateViewController *v9;
  id location[2];
  CPSMapTemplateViewController *v11;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if ((objc_msgSend(location[0], "canReceiveEvents") & 1) != 0)
  {
    queue = MEMORY[0x24BDAC9B8];
    v4 = MEMORY[0x24BDAC760];
    v5 = -1073741824;
    v6 = 0;
    v7 = __64__CPSMapTemplateViewController_observerDeliveryPolicyDidChange___block_invoke;
    v8 = &unk_24E26F1B8;
    v9 = v11;
    dispatch_async(queue, &v4);

    objc_storeStrong((id *)&v9, 0);
  }
  objc_storeStrong(location, 0);
}

uint64_t __64__CPSMapTemplateViewController_observerDeliveryPolicyDidChange___block_invoke(id *a1)
{
  NSObject *log;
  os_log_type_t type;
  uint8_t v5[7];
  char v6;
  id location[3];

  location[2] = a1;
  location[1] = a1;
  location[0] = CarPlaySupportGeneralLogging();
  v6 = 2;
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEBUG))
  {
    log = location[0];
    type = v6;
    __os_log_helper_16_0_0(v5);
    _os_log_debug_impl(&dword_21E389000, log, type, "Showing navigation bar with reason: event delivery policy changed", v5, 2u);
  }
  objc_storeStrong(location, 0);
  return objc_msgSend(a1[4], "_resetAutoHideTimerAndShowBarAnimated:allowFocusDeferral:", 1, 0);
}

- (void)_setETAViewHidden:(BOOL)a3 forRequester:(id)a4 animated:(BOOL)a5
{
  NSMutableSet *v5;
  NSMutableSet *etaViewHiddenRequesters;
  uint64_t v7;
  void *v8;
  NSMutableSet *v9;
  NSMutableSet *v10;
  uint64_t v12;
  int v13;
  int v14;
  uint64_t (*v15)(uint64_t);
  void *v16;
  CPSMapTemplateViewController *v17;
  uint64_t v18;
  int v19;
  int v20;
  void (*v21)(uint64_t);
  void *v22;
  CPSMapTemplateViewController *v23;
  os_log_type_t v24;
  id v25;
  os_log_type_t v26;
  id v27;
  BOOL v28;
  id location;
  BOOL v30;
  SEL v31;
  CPSMapTemplateViewController *v32;
  uint8_t v33[16];
  uint8_t v34[24];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v32 = self;
  v31 = a2;
  v30 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  v28 = a5;
  if (v30)
  {
    if (!v32->_etaViewHiddenRequesters)
    {
      v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
      etaViewHiddenRequesters = v32->_etaViewHiddenRequesters;
      v32->_etaViewHiddenRequesters = v5;

    }
    v27 = CarPlaySupportGeneralLogging();
    v26 = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled((os_log_t)v27, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v34, (uint64_t)location);
      _os_log_impl(&dword_21E389000, (os_log_t)v27, v26, "Adding ETA hidden requester: %@", v34, 0xCu);
    }
    objc_storeStrong(&v27, 0);
    v10 = -[CPSMapTemplateViewController etaViewHiddenRequesters](v32, "etaViewHiddenRequesters");
    -[NSMutableSet addObject:](v10, "addObject:", location);

  }
  else
  {
    v25 = CarPlaySupportGeneralLogging();
    v24 = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled((os_log_t)v25, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v33, (uint64_t)location);
      _os_log_impl(&dword_21E389000, (os_log_t)v25, v24, "Removing ETA hidden requester: %@", v33, 0xCu);
    }
    objc_storeStrong(&v25, 0);
    v9 = -[CPSMapTemplateViewController etaViewHiddenRequesters](v32, "etaViewHiddenRequesters");
    -[NSMutableSet removeObject:](v9, "removeObject:", location);

  }
  -[CPSMapTemplateViewController _updateETAViewHidden](v32, "_updateETAViewHidden");
  if (v28)
  {
    v8 = (void *)MEMORY[0x24BDF6F90];
    v7 = MEMORY[0x24BDAC760];
    v18 = MEMORY[0x24BDAC760];
    v19 = -1073741824;
    v20 = 0;
    v21 = __72__CPSMapTemplateViewController__setETAViewHidden_forRequester_animated___block_invoke;
    v22 = &unk_24E26F1B8;
    v23 = v32;
    v12 = v7;
    v13 = -1073741824;
    v14 = 0;
    v15 = __72__CPSMapTemplateViewController__setETAViewHidden_forRequester_animated___block_invoke_2;
    v16 = &unk_24E26F168;
    v17 = v32;
    objc_msgSend(v8, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, &v18, &v12, 0.4, 0.0, 10.0);
    objc_storeStrong((id *)&v17, 0);
    objc_storeStrong((id *)&v23, 0);
  }
  objc_storeStrong(&location, 0);
}

void __72__CPSMapTemplateViewController__setETAViewHidden_forRequester_animated___block_invoke(uint64_t a1)
{
  id v1;

  v1 = (id)objc_msgSend(*(id *)(a1 + 32), "view");
  objc_msgSend(v1, "layoutIfNeeded");

}

uint64_t __72__CPSMapTemplateViewController__setETAViewHidden_forRequester_animated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateSafeArea");
}

- (void)_updateETAViewHidden
{
  NSLayoutConstraint *v2;
  NSObject *v3;
  os_log_type_t v4;
  NSLayoutConstraint *v5;
  NSMutableSet *v6;
  NSMutableSet *v7;
  BOOL v8;
  uint8_t v9[15];
  char v10;
  id v11[2];
  os_log_type_t v12;
  id location[2];
  CPSMapTemplateViewController *v14;
  uint8_t v15[24];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v14 = self;
  location[1] = (id)a2;
  v7 = -[CPSMapTemplateViewController etaViewHiddenRequesters](self, "etaViewHiddenRequesters");
  v8 = -[NSMutableSet count](v7, "count") == 0;

  if (v8)
  {
    if (-[CPSMapTemplateViewController etaViewHidden](v14, "etaViewHidden"))
    {
      v11[0] = CarPlaySupportGeneralLogging();
      v10 = 1;
      if (os_log_type_enabled((os_log_t)v11[0], OS_LOG_TYPE_INFO))
      {
        v3 = v11[0];
        v4 = v10;
        __os_log_helper_16_0_0(v9);
        _os_log_impl(&dword_21E389000, v3, v4, "Showing ETA view", v9, 2u);
      }
      objc_storeStrong(v11, 0);
      -[CPSMapTemplateViewController setEtaViewHidden:](v14, "setEtaViewHidden:", 0);
      v2 = -[CPSMapTemplateViewController navigationETAViewBottomConstraint](v14, "navigationETAViewBottomConstraint");
      -[NSLayoutConstraint setConstant:](v2, "setConstant:", 0.0);

    }
  }
  else if (!-[CPSMapTemplateViewController etaViewHidden](v14, "etaViewHidden"))
  {
    location[0] = CarPlaySupportGeneralLogging();
    v12 = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_INFO))
    {
      v6 = -[CPSMapTemplateViewController etaViewHiddenRequesters](v14, "etaViewHiddenRequesters");
      __os_log_helper_16_2_1_8_64((uint64_t)v15, (uint64_t)v6);
      _os_log_impl(&dword_21E389000, (os_log_t)location[0], v12, "Hiding ETA view for requesters: %@", v15, 0xCu);

    }
    objc_storeStrong(location, 0);
    -[CPSMapTemplateViewController setEtaViewHidden:](v14, "setEtaViewHidden:", 1);
    *(double *)&v11[1] = 44.0 + 1.0;
    v5 = -[CPSMapTemplateViewController navigationETAViewBottomConstraint](v14, "navigationETAViewBottomConstraint");
    -[NSLayoutConstraint setConstant:](v5, "setConstant:", 44.0 + 1.0);

  }
}

- (void)_createNavigationCardViewController
{
  id v2;
  id v3;
  BOOL v4;
  double v5;
  double v6;
  id v7;
  id v8;
  CPSNavigationCardViewController *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  CPSNavigationCardViewController *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  CPSNavigationCardViewController *v26;
  CPSNavigationCardViewController *v27;
  CPSLayoutHelperView *v28;
  CPSNavigationCardViewController *v29;
  CPSNavigationCardViewController *v30;
  CPSNavigationCardViewController *v31;
  CPSNavigationCardViewController *v32;
  id v33;
  CPSNavigationCardViewController *v34;
  id v35;
  id v36;
  CPSNavigationCardViewController *v37;
  id v38;
  double v39;
  char v40;
  id v41;
  char v42;
  id v43;
  char v44;
  CPSNavigationCardViewController *v45;
  char v46;
  id v47;
  char v48;
  id v49;
  char v50;
  CPSNavigationCardViewController *v51;
  id v52;
  char v53;
  id v54;
  char v55;
  id v56;
  char v57;
  id v58;
  char v59;
  id v60;
  char v61;
  id v62;
  char v63;
  id v64;
  id v65;
  id v66[2];
  CPSMapTemplateViewController *v67;
  _QWORD v68[5];

  v68[4] = *MEMORY[0x24BDAC8D0];
  v67 = self;
  v66[1] = (id)a2;
  v66[0] = objc_alloc_init(CPSNavigationCardViewController);
  objc_msgSend(v66[0], "setGuidanceBackgroundColor:", v67->_guidanceBackgroundColor);
  -[CPSMapTemplateViewController setNavigationCardViewController:](v67, "setNavigationCardViewController:", v66[0]);
  v31 = -[CPSMapTemplateViewController navigationCardViewController](v67, "navigationCardViewController");
  -[CPSNavigationCardViewController willMoveToParentViewController:](v31, "willMoveToParentViewController:", v67);

  v32 = -[CPSMapTemplateViewController navigationCardViewController](v67, "navigationCardViewController");
  -[CPSMapTemplateViewController addChildViewController:](v67, "addChildViewController:");

  v35 = (id)-[CPSMapTemplateViewController view](v67, "view");
  v34 = -[CPSMapTemplateViewController navigationCardViewController](v67, "navigationCardViewController");
  v33 = (id)-[CPSNavigationCardViewController view](v34, "view");
  objc_msgSend(v35, "addSubview:");

  v37 = -[CPSMapTemplateViewController navigationCardViewController](v67, "navigationCardViewController");
  v36 = (id)-[CPSNavigationCardViewController view](v37, "view");
  objc_msgSend(v36, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v63 = 0;
  v61 = 0;
  v59 = 0;
  v57 = 0;
  v55 = 0;
  v53 = 0;
  if (-[CPSMapTemplateViewController rightHandDrive](v67, "rightHandDrive"))
  {
    v64 = (id)-[CPSMapTemplateViewController view](v67, "view");
    v63 = 1;
    v62 = (id)objc_msgSend(v64, "safeAreaLayoutGuide");
    v61 = 1;
    v60 = (id)objc_msgSend(v62, "rightAnchor");
    v59 = 1;
    v2 = v60;
  }
  else
  {
    v58 = (id)-[CPSMapTemplateViewController view](v67, "view");
    v57 = 1;
    v56 = (id)objc_msgSend(v58, "safeAreaLayoutGuide");
    v55 = 1;
    v54 = (id)objc_msgSend(v56, "leftAnchor");
    v53 = 1;
    v2 = v54;
  }
  v65 = v2;
  if ((v53 & 1) != 0)

  if ((v55 & 1) != 0)
  if ((v57 & 1) != 0)

  if ((v59 & 1) != 0)
  if ((v61 & 1) != 0)

  if ((v63 & 1) != 0)
  v50 = 0;
  v48 = 0;
  v46 = 0;
  v44 = 0;
  v42 = 0;
  v40 = 0;
  if (-[CPSMapTemplateViewController rightHandDrive](v67, "rightHandDrive"))
  {
    v51 = -[CPSMapTemplateViewController navigationCardViewController](v67, "navigationCardViewController");
    v50 = 1;
    v49 = (id)-[CPSNavigationCardViewController view](v51, "view");
    v48 = 1;
    v47 = (id)objc_msgSend(v49, "rightAnchor");
    v46 = 1;
    v3 = v47;
  }
  else
  {
    v45 = -[CPSMapTemplateViewController navigationCardViewController](v67, "navigationCardViewController");
    v44 = 1;
    v43 = (id)-[CPSNavigationCardViewController view](v45, "view");
    v42 = 1;
    v41 = (id)objc_msgSend(v43, "leftAnchor");
    v40 = 1;
    v3 = v41;
  }
  v52 = v3;
  if ((v40 & 1) != 0)

  if ((v42 & 1) != 0)
  if ((v44 & 1) != 0)

  if ((v46 & 1) != 0)
  if ((v48 & 1) != 0)

  if ((v50 & 1) != 0)
  v39 = 0.0;
  v4 = -[CPSMapTemplateViewController rightHandDrive](v67, "rightHandDrive");
  v5 = -8.0;
  if (!v4)
    v5 = 8.0;
  v39 = v5;
  v9 = -[CPSMapTemplateViewController navigationCardViewController](v67, "navigationCardViewController");
  v8 = (id)-[CPSNavigationCardViewController view](v9, "view");
  v7 = (id)objc_msgSend(v8, "widthAnchor");
  v38 = (id)objc_msgSend(v7, "constraintEqualToConstant:", 0.0);

  LODWORD(v6) = 1148846080;
  objc_msgSend(v38, "setPriority:", v6);
  -[CPSMapTemplateViewController setCardWidthConstraint:](v67, "setCardWidthConstraint:", v38);
  -[CPSMapTemplateViewController _calculateAndUpdateCardWidthConstraint](v67, "_calculateAndUpdateCardWidthConstraint");
  v10 = (void *)MEMORY[0x24BDD1628];
  v26 = -[CPSMapTemplateViewController navigationCardViewController](v67, "navigationCardViewController");
  v25 = (id)-[CPSNavigationCardViewController view](v26, "view");
  v24 = (id)objc_msgSend(v25, "topAnchor");
  v23 = (id)-[CPSMapTemplateViewController view](v67, "view");
  v22 = (id)objc_msgSend(v23, "safeAreaLayoutGuide");
  v21 = (id)objc_msgSend(v22, "topAnchor");
  v20 = (id)objc_msgSend(v24, "constraintEqualToAnchor:constant:", 8.0);
  v68[0] = v20;
  v19 = (id)objc_msgSend(v52, "constraintEqualToAnchor:constant:", v65, v39);
  v68[1] = v19;
  v68[2] = v38;
  v18 = -[CPSMapTemplateViewController navigationCardViewController](v67, "navigationCardViewController");
  v17 = (id)-[CPSNavigationCardViewController view](v18, "view");
  v16 = (id)objc_msgSend(v17, "bottomAnchor");
  v15 = (id)-[CPSMapTemplateViewController view](v67, "view");
  v14 = (id)objc_msgSend(v15, "safeAreaLayoutGuide");
  v13 = (id)objc_msgSend(v14, "bottomAnchor");
  v12 = (id)objc_msgSend(v16, "constraintEqualToAnchor:constant:", -8.0);
  v68[3] = v12;
  v11 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v68, 4);
  objc_msgSend(v10, "activateConstraints:");

  v27 = -[CPSMapTemplateViewController navigationCardViewController](v67, "navigationCardViewController");
  -[CPSNavigationCardViewController didMoveToParentViewController:](v27, "didMoveToParentViewController:", v67);

  v29 = -[CPSMapTemplateViewController navigationCardViewController](v67, "navigationCardViewController");
  v28 = -[CPSNavigationCardViewController layoutHelperView](v29, "layoutHelperView");
  -[CPSLayoutHelperView setLayoutDelegate:](v28, "setLayoutDelegate:", v67);

  v30 = -[CPSMapTemplateViewController navigationCardViewController](v67, "navigationCardViewController");
  -[CPSNavigationCardViewController setNavigationCardHidden:forRequester:animated:completion:](v30, "setNavigationCardHidden:forRequester:animated:completion:", 1, CFSTR("TripEndedRequester"), 0);

  objc_storeStrong(&v38, 0);
  objc_storeStrong(&v52, 0);
  objc_storeStrong(&v65, 0);
  objc_storeStrong(v66, 0);
}

- (void)_calculateAndUpdateCardWidthConstraint
{
  double v2;
  NSLayoutConstraint *v3;
  id v4;
  id v5;
  double v6;
  double v7;

  v5 = (id)-[CPSMapTemplateViewController view](self, "view");
  v4 = (id)objc_msgSend(v5, "safeAreaLayoutGuide");
  objc_msgSend(v4, "layoutFrame");
  v6 = v2 * 0.4;

  v7 = v6;
  if (v6 >= 140.0)
  {
    if (v6 > 213.0)
      v7 = 213.0;
  }
  else
  {
    v7 = 140.0;
  }
  v3 = -[CPSMapTemplateViewController cardWidthConstraint](self, "cardWidthConstraint");
  -[NSLayoutConstraint setConstant:](v3, "setConstant:", v7);

}

- (void)_createNavigationCardViewLayoutHelperView
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSLayoutConstraint *v17;
  id v18[2];
  CPSMapTemplateViewController *v19;
  _QWORD v20[4];

  v20[3] = *MEMORY[0x24BDAC8D0];
  v19 = self;
  v18[1] = (id)a2;
  v18[0] = objc_alloc_init(CPSLayoutHelperView);
  objc_msgSend(v18[0], "setLayoutDelegate:", v19);
  v2 = (id)-[CPSMapTemplateViewController view](v19, "view");
  objc_msgSend(v2, "addSubview:", v18[0]);

  -[CPSMapTemplateViewController setNavigationCardViewLayoutHelperView:](v19, "setNavigationCardViewLayoutHelperView:", v18[0]);
  v7 = (id)objc_msgSend(v18[0], "bottomAnchor");
  v6 = (id)-[CPSMapTemplateViewController view](v19, "view");
  v5 = (id)objc_msgSend(v6, "safeAreaLayoutGuide");
  v4 = (id)objc_msgSend(v5, "bottomAnchor");
  v3 = (id)objc_msgSend(v7, "constraintEqualToAnchor:constant:", -8.0);
  -[CPSMapTemplateViewController setNavigationCardViewLayoutViewBottomConstraint:](v19, "setNavigationCardViewLayoutViewBottomConstraint:");

  v8 = (void *)MEMORY[0x24BDD1628];
  v17 = -[CPSMapTemplateViewController navigationCardViewLayoutViewBottomConstraint](v19, "navigationCardViewLayoutViewBottomConstraint");
  v20[0] = v17;
  v16 = (id)objc_msgSend(v18[0], "topAnchor");
  v15 = (id)-[CPSMapTemplateViewController view](v19, "view");
  v14 = (id)objc_msgSend(v15, "safeAreaLayoutGuide");
  v13 = (id)objc_msgSend(v14, "topAnchor");
  v12 = (id)objc_msgSend(v16, "constraintEqualToAnchor:constant:", 8.0);
  v20[1] = v12;
  v11 = (id)objc_msgSend(v18[0], "widthAnchor");
  v10 = (id)objc_msgSend(v11, "constraintEqualToConstant:", 1.0);
  v20[2] = v10;
  v9 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 3);
  objc_msgSend(v8, "activateConstraints:");

  objc_storeStrong(v18, 0);
}

- (CPSNavigatorObserving)navigatorObserver
{
  return (CPSNavigatorObserving *)objc_loadWeakRetained((id *)&self->_navigatorObserver);
}

- (void)setNavigatorObserver:(id)a3
{
  objc_storeWeak((id *)&self->_navigatorObserver, a3);
}

- (UIStackView)trailingBottomStackView
{
  return self->_trailingBottomStackView;
}

- (void)setTrailingBottomStackView:(id)a3
{
  objc_storeStrong((id *)&self->_trailingBottomStackView, a3);
}

- (unint64_t)maximumMapButtonCount
{
  return self->_maximumMapButtonCount;
}

- (void)setMaximumMapButtonCount:(unint64_t)a3
{
  self->_maximumMapButtonCount = a3;
}

- (NSMutableArray)mapButtons
{
  return self->_mapButtons;
}

- (void)setMapButtons:(id)a3
{
  objc_storeStrong((id *)&self->_mapButtons, a3);
}

- (CPSLayoutHelperView)navigationCardViewLayoutHelperView
{
  return self->_navigationCardViewLayoutHelperView;
}

- (void)setNavigationCardViewLayoutHelperView:(id)a3
{
  objc_storeStrong((id *)&self->_navigationCardViewLayoutHelperView, a3);
}

- (NSLayoutConstraint)navigationCardViewLayoutViewBottomConstraint
{
  return self->_navigationCardViewLayoutViewBottomConstraint;
}

- (void)setNavigationCardViewLayoutViewBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_navigationCardViewLayoutViewBottomConstraint, a3);
}

- (CPSTripPreviewsCardView)previewsView
{
  return self->_previewsView;
}

- (BOOL)previewOnlyRouteChoices
{
  return self->_previewOnlyRouteChoices;
}

- (void)setPreviewOnlyRouteChoices:(BOOL)a3
{
  self->_previewOnlyRouteChoices = a3;
}

- (unint64_t)previewSelectedIndex
{
  return self->_previewSelectedIndex;
}

- (void)setPreviewSelectedIndex:(unint64_t)a3
{
  self->_previewSelectedIndex = a3;
}

- (CPSNavigator)navigator
{
  return self->_navigator;
}

- (void)setNavigator:(id)a3
{
  objc_storeStrong((id *)&self->_navigator, a3);
}

- (UITapGestureRecognizer)hideTapGestureRecognizer
{
  return self->_hideTapGestureRecognizer;
}

- (void)setHideTapGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_hideTapGestureRecognizer, a3);
}

- (UITapGestureRecognizer)navBarHideTapGestureRecognizer
{
  return self->_navBarHideTapGestureRecognizer;
}

- (void)setNavBarHideTapGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_navBarHideTapGestureRecognizer, a3);
}

- (UIPanGestureRecognizer)panGestureRecognizer
{
  return self->_panGestureRecognizer;
}

- (void)setPanGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_panGestureRecognizer, a3);
}

- (NSTimer)autoHideTimer
{
  return self->_autoHideTimer;
}

- (void)setAutoHideTimer:(id)a3
{
  objc_storeStrong((id *)&self->_autoHideTimer, a3);
}

- (BOOL)autoHidesNavigationBar
{
  return self->_autoHidesNavigationBar;
}

- (void)setAutoHidesNavigationBar:(BOOL)a3
{
  self->_autoHidesNavigationBar = a3;
}

- (BOOL)hidesButtonsWithNavigationBar
{
  return self->_hidesButtonsWithNavigationBar;
}

- (void)setHidesButtonsWithNavigationBar:(BOOL)a3
{
  self->_hidesButtonsWithNavigationBar = a3;
}

- (NSMutableSet)autoHideDisabledReasons
{
  return self->_autoHideDisabledReasons;
}

- (void)setAutoHideDisabledReasons:(id)a3
{
  objc_storeStrong((id *)&self->_autoHideDisabledReasons, a3);
}

- (NSArray)tripPreviews
{
  return self->_tripPreviews;
}

- (void)setTripPreviews:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1152);
}

- (CPTripPreviewTextConfiguration)tripPreviewTextConfiguration
{
  return self->_tripPreviewTextConfiguration;
}

- (void)setTripPreviewTextConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_tripPreviewTextConfiguration, a3);
}

- (CPSPanViewController)panViewController
{
  return self->_panViewController;
}

- (void)setPanViewController:(id)a3
{
  objc_storeStrong((id *)&self->_panViewController, a3);
}

- (UIView)panContainerView
{
  return self->_panContainerView;
}

- (void)setPanContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_panContainerView, a3);
}

- (NSLayoutConstraint)panContainerLeftConstraint
{
  return self->_panContainerLeftConstraint;
}

- (void)setPanContainerLeftConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_panContainerLeftConstraint, a3);
}

- (NSLayoutConstraint)panContainerRightConstraint
{
  return self->_panContainerRightConstraint;
}

- (void)setPanContainerRightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_panContainerRightConstraint, a3);
}

- (BOOL)demoAutoHideTimerDisabled
{
  return self->_demoAutoHideTimerDisabled;
}

- (void)setDemoAutoHideTimerDisabled:(BOOL)a3
{
  self->_demoAutoHideTimerDisabled = a3;
}

- (CPSNavigationAlertQueue)navigationAlertQueue
{
  return self->_navigationAlertQueue;
}

- (void)setNavigationAlertQueue:(id)a3
{
  objc_storeStrong((id *)&self->_navigationAlertQueue, a3);
}

- (NSLayoutConstraint)navigationAlertBottomConstraint
{
  return self->_navigationAlertBottomConstraint;
}

- (void)setNavigationAlertBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_navigationAlertBottomConstraint, a3);
}

- (BOOL)applicationIsFrontmost
{
  return self->_applicationIsFrontmost;
}

- (void)setApplicationIsFrontmost:(BOOL)a3
{
  self->_applicationIsFrontmost = a3;
}

- (CPSApplicationStateMonitor)applicationStateMonitor
{
  return (CPSApplicationStateMonitor *)objc_loadWeakRetained((id *)&self->_applicationStateMonitor);
}

- (void)setApplicationStateMonitor:(id)a3
{
  objc_storeWeak((id *)&self->_applicationStateMonitor, a3);
}

- (CPSNavigationETAView)navigationETAView
{
  return self->_navigationETAView;
}

- (void)setNavigationETAView:(id)a3
{
  objc_storeStrong((id *)&self->_navigationETAView, a3);
}

- (NSLayoutConstraint)navigationETAViewBottomConstraint
{
  return self->_navigationETAViewBottomConstraint;
}

- (void)setNavigationETAViewBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_navigationETAViewBottomConstraint, a3);
}

- (NSMutableDictionary)lastTravelEstimatesByTrip
{
  return self->_lastTravelEstimatesByTrip;
}

- (void)setLastTravelEstimatesByTrip:(id)a3
{
  objc_storeStrong((id *)&self->_lastTravelEstimatesByTrip, a3);
}

- (BOOL)rightHandDrive
{
  return self->_rightHandDrive;
}

- (void)setRightHandDrive:(BOOL)a3
{
  self->_rightHandDrive = a3;
}

- (CPSSafeAreaDelegate)safeAreaDelegate
{
  return (CPSSafeAreaDelegate *)objc_loadWeakRetained((id *)&self->_safeAreaDelegate);
}

- (void)setSafeAreaDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_safeAreaDelegate, a3);
}

- (UIFocusItem)lastFocusedItem
{
  return (UIFocusItem *)objc_loadWeakRetained((id *)&self->_lastFocusedItem);
}

- (void)setLastFocusedItem:(id)a3
{
  objc_storeWeak((id *)&self->_lastFocusedItem, a3);
}

- (UIFocusItem)itemFocusedBeforeNavAlert
{
  return (UIFocusItem *)objc_loadWeakRetained((id *)&self->_itemFocusedBeforeNavAlert);
}

- (void)setItemFocusedBeforeNavAlert:(id)a3
{
  objc_storeWeak((id *)&self->_itemFocusedBeforeNavAlert, a3);
}

- (CGPoint)lastPanGesturePoint
{
  double x;
  double y;
  CGPoint result;

  y = self->_lastPanGesturePoint.y;
  x = self->_lastPanGesturePoint.x;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setLastPanGesturePoint:(CGPoint)a3
{
  self->_lastPanGesturePoint = a3;
}

- (UIColor)guidanceBackgroundColor
{
  return self->_guidanceBackgroundColor;
}

- (unint64_t)tripEstimateStyle
{
  return self->_tripEstimateStyle;
}

- (BOOL)hasSetTripEstimateStyle
{
  return self->_hasSetTripEstimateStyle;
}

- (void)setHasSetTripEstimateStyle:(BOOL)a3
{
  self->_hasSetTripEstimateStyle = a3;
}

- (_CPSFocusHoldingButton)focusHoldingButton
{
  return self->_focusHoldingButton;
}

- (void)setFocusHoldingButton:(id)a3
{
  objc_storeStrong((id *)&self->_focusHoldingButton, a3);
}

- (UIFocusGuide)focusHolderLeftFocusGuide
{
  return self->_focusHolderLeftFocusGuide;
}

- (void)setFocusHolderLeftFocusGuide:(id)a3
{
  objc_storeStrong((id *)&self->_focusHolderLeftFocusGuide, a3);
}

- (UIFocusGuide)focusHolderRightFocusGuide
{
  return self->_focusHolderRightFocusGuide;
}

- (void)setFocusHolderRightFocusGuide:(id)a3
{
  objc_storeStrong((id *)&self->_focusHolderRightFocusGuide, a3);
}

- (BOOL)shouldRestoreFocusToNavigationBar
{
  return self->_shouldRestoreFocusToNavigationBar;
}

- (void)setShouldRestoreFocusToNavigationBar:(BOOL)a3
{
  self->_shouldRestoreFocusToNavigationBar = a3;
}

- (BKSHIDEventDeliveryPolicyObserver)eventDeliveryPolicyObserver
{
  return self->_eventDeliveryPolicyObserver;
}

- (void)setEventDeliveryPolicyObserver:(id)a3
{
  objc_storeStrong((id *)&self->_eventDeliveryPolicyObserver, a3);
}

- (CPSNavigationCardViewController)navigationCardViewController
{
  return self->_navigationCardViewController;
}

- (void)setNavigationCardViewController:(id)a3
{
  objc_storeStrong((id *)&self->_navigationCardViewController, a3);
}

- (NSMutableSet)etaViewHiddenRequesters
{
  return self->_etaViewHiddenRequesters;
}

- (void)setEtaViewHiddenRequesters:(id)a3
{
  objc_storeStrong((id *)&self->_etaViewHiddenRequesters, a3);
}

- (BOOL)etaViewHidden
{
  return self->_etaViewHidden;
}

- (void)setEtaViewHidden:(BOOL)a3
{
  self->_etaViewHidden = a3;
}

- (NSLayoutConstraint)cardWidthConstraint
{
  return self->_cardWidthConstraint;
}

- (void)setCardWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_cardWidthConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cardWidthConstraint, 0);
  objc_storeStrong((id *)&self->_etaViewHiddenRequesters, 0);
  objc_storeStrong((id *)&self->_navigationCardViewController, 0);
  objc_storeStrong((id *)&self->_eventDeliveryPolicyObserver, 0);
  objc_storeStrong((id *)&self->_focusHolderRightFocusGuide, 0);
  objc_storeStrong((id *)&self->_focusHolderLeftFocusGuide, 0);
  objc_storeStrong((id *)&self->_focusHoldingButton, 0);
  objc_storeStrong((id *)&self->_guidanceBackgroundColor, 0);
  objc_destroyWeak((id *)&self->_itemFocusedBeforeNavAlert);
  objc_destroyWeak((id *)&self->_lastFocusedItem);
  objc_destroyWeak((id *)&self->_safeAreaDelegate);
  objc_storeStrong((id *)&self->_lastTravelEstimatesByTrip, 0);
  objc_storeStrong((id *)&self->_navigationETAViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_navigationETAView, 0);
  objc_destroyWeak((id *)&self->_applicationStateMonitor);
  objc_storeStrong((id *)&self->_navigationAlertBottomConstraint, 0);
  objc_storeStrong((id *)&self->_navigationAlertQueue, 0);
  objc_storeStrong((id *)&self->_panContainerRightConstraint, 0);
  objc_storeStrong((id *)&self->_panContainerLeftConstraint, 0);
  objc_storeStrong((id *)&self->_panContainerView, 0);
  objc_storeStrong((id *)&self->_panViewController, 0);
  objc_storeStrong((id *)&self->_tripPreviewTextConfiguration, 0);
  objc_storeStrong((id *)&self->_tripPreviews, 0);
  objc_storeStrong((id *)&self->_autoHideDisabledReasons, 0);
  objc_storeStrong((id *)&self->_autoHideTimer, 0);
  objc_storeStrong((id *)&self->_panGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_navBarHideTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_hideTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_navigator, 0);
  objc_storeStrong((id *)&self->_previewsView, 0);
  objc_storeStrong((id *)&self->_navigationCardViewLayoutViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_navigationCardViewLayoutHelperView, 0);
  objc_storeStrong((id *)&self->_mapButtons, 0);
  objc_storeStrong((id *)&self->_trailingBottomStackView, 0);
  objc_destroyWeak((id *)&self->_navigatorObserver);
}

@end
