@implementation CPSInstrumentClusterCardViewController

- (CPSInstrumentClusterCardViewController)init
{
  UIViewController *v2;
  UIViewController *platterViewController;
  CPSClusterEstimatesViewController *v4;
  CPSClusterEstimatesViewController *estimatesViewController;
  CPSInstrumentClusterCardViewController *v7;
  objc_super v8;
  SEL v9;
  CPSInstrumentClusterCardViewController *v10;

  v9 = a2;
  v10 = 0;
  v8.receiver = self;
  v8.super_class = (Class)CPSInstrumentClusterCardViewController;
  v10 = -[CPSInstrumentClusterCardViewController init](&v8, sel_init);
  objc_storeStrong((id *)&v10, v10);
  if (v10)
  {
    v2 = (UIViewController *)objc_alloc_init(MEMORY[0x24BDF6F98]);
    platterViewController = v10->_platterViewController;
    v10->_platterViewController = v2;

    v4 = objc_alloc_init(CPSClusterEstimatesViewController);
    estimatesViewController = v10->_estimatesViewController;
    v10->_estimatesViewController = v4;

    -[CPSDashboardEstimatesViewController setSafeAreaDelegate:](v10->_estimatesViewController, "setSafeAreaDelegate:", v10);
    v10->_shouldUpdateContent = 0;
    v10->_isMapContentOnly = 0;
  }
  v7 = v10;
  objc_storeStrong((id *)&v10, 0);
  return v7;
}

- (id)initForMapContent
{
  CPSInstrumentClusterCardViewController *v3;
  CPSInstrumentClusterCardViewController *v4;

  v4 = 0;
  v4 = -[CPSInstrumentClusterCardViewController init](self, "init");
  objc_storeStrong((id *)&v4, v4);
  if (v4)
    v4->_isMapContentOnly = 1;
  v3 = v4;
  objc_storeStrong((id *)&v4, 0);
  return v3;
}

- (void)viewDidLoad
{
  objc_super v2;
  SEL v3;
  CPSInstrumentClusterCardViewController *v4;

  v4 = self;
  v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)CPSInstrumentClusterCardViewController;
  -[CPSInstrumentClusterCardViewController viewDidLoad](&v2, sel_viewDidLoad);
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v3;
  BOOL v4;
  SEL v5;
  CPSInstrumentClusterCardViewController *v6;

  v6 = self;
  v5 = a2;
  v4 = a3;
  v3.receiver = self;
  v3.super_class = (Class)CPSInstrumentClusterCardViewController;
  -[CPSInstrumentClusterCardViewController viewDidAppear:](&v3, sel_viewDidAppear_, a3);
  v6->_shouldUpdateContent = 1;
  -[CPSInstrumentClusterCardViewController _evaluateLayout](v6, "_evaluateLayout");
  -[CPSInstrumentClusterCardViewController _updateClientSafeArea](v6, "_updateClientSafeArea");
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v3;
  BOOL v4;
  SEL v5;
  CPSInstrumentClusterCardViewController *v6;

  v6 = self;
  v5 = a2;
  v4 = a3;
  v3.receiver = self;
  v3.super_class = (Class)CPSInstrumentClusterCardViewController;
  -[CPSInstrumentClusterCardViewController viewDidDisappear:](&v3, sel_viewDidDisappear_, a3);
  -[CPSInstrumentClusterCardViewController _updateClientSafeAreaWithInsets:](v6, "_updateClientSafeAreaWithInsets:", *MEMORY[0x24BDF7718], *(double *)(MEMORY[0x24BDF7718] + 8), *(double *)(MEMORY[0x24BDF7718] + 16), *(double *)(MEMORY[0x24BDF7718] + 24));
  v6->_shouldUpdateContent = 0;
}

- (void)viewDidLayoutSubviews
{
  CGFloat v2;
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  id v18;
  _BOOL4 v19;
  CARScreenInfo *v20;
  CPSInstrumentClusterCardLayout *v21;
  CPSInstrumentClusterCardLayout *v22;
  os_log_t oslog;
  CGRect rect2;
  char v25;
  id v26;
  CGRect rect1;
  CGRect v28;
  CGRect v29;
  objc_super v30;
  SEL v31;
  CPSInstrumentClusterCardViewController *v32;
  uint8_t v33[24];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v32 = self;
  v31 = a2;
  v30.receiver = self;
  v30.super_class = (Class)CPSInstrumentClusterCardViewController;
  -[CPSInstrumentClusterCardViewController viewDidLayoutSubviews](&v30, sel_viewDidLayoutSubviews);
  v22 = -[CPSInstrumentClusterCardViewController layout](v32, "layout");

  if (!v22)
    goto LABEL_13;
  if (-[CPSInstrumentClusterCardViewController layoutOverride](v32, "layoutOverride"))
  {
    v21 = -[CPSInstrumentClusterCardLayout initWithLayout:]([CPSInstrumentClusterCardLayout alloc], "initWithLayout:", -[CPSInstrumentClusterCardViewController layoutOverride](v32, "layoutOverride"));
    -[CPSInstrumentClusterCardViewController setLayout:](v32, "setLayout:");

LABEL_13:
    -[CPSInstrumentClusterCardViewController _updateClientSafeArea](v32, "_updateClientSafeArea");
    return;
  }
  v20 = -[CPSInstrumentClusterCardViewController carScreenInfo](v32, "carScreenInfo");

  if (!v20)
    goto LABEL_13;
  v18 = (id)-[CARScreenInfo currentViewArea](v32->_carScreenInfo, "currentViewArea");
  objc_msgSend(v18, "visibleFrame");
  v29.origin.x = v2;
  v29.origin.y = v3;
  v29.size.width = v4;
  v29.size.height = v5;
  -[CPSInstrumentClusterCardLayout viewArea](v32->_layout, "viewArea");
  v28.origin.x = v6;
  v28.origin.y = v7;
  v28.size.width = v8;
  v28.size.height = v9;
  v25 = 0;
  LOBYTE(v19) = 1;
  if (CGRectEqualToRect(v29, v28))
  {
    v26 = (id)-[CARScreenInfo currentViewArea](v32->_carScreenInfo, "currentViewArea");
    v25 = 1;
    objc_msgSend(v26, "safeFrame");
    rect1.origin.x = v10;
    rect1.origin.y = v11;
    rect1.size.width = v12;
    rect1.size.height = v13;
    -[CPSInstrumentClusterCardLayout safeArea](v32->_layout, "safeArea");
    rect2.origin.x = v14;
    rect2.origin.y = v15;
    rect2.size.width = v16;
    rect2.size.height = v17;
    v19 = !CGRectEqualToRect(rect1, rect2);
  }
  if ((v25 & 1) != 0)

  if (!v19)
    goto LABEL_13;
  oslog = (os_log_t)CarPlaySupportGeneralLogging();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v33, (uint64_t)v32);
    _os_log_impl(&dword_21E389000, oslog, OS_LOG_TYPE_INFO, "%@: view area or safe area changed. Reevaluating Layout.", v33, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  -[CPSInstrumentClusterCardViewController _evaluateLayout](v32, "_evaluateLayout");
}

- (void)setLayout:(id)a3
{
  NSArray *v3;
  CPSClusterManeuversCardView *v4;
  CPSClusterManeuversCardView *v5;
  CPSInstrumentClusterCardViewController *v6;
  id v7;
  id v8;
  os_log_type_t v9;
  id v10;
  id location[2];
  CPSInstrumentClusterCardViewController *v12;
  uint8_t v13[24];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v10 = CarPlaySupportGeneralLogging();
  v9 = OS_LOG_TYPE_INFO;
  if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_INFO))
  {
    v6 = v12;
    v7 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(location[0], "layoutForCard"));
    __os_log_helper_16_2_2_8_64_8_64((uint64_t)v13, (uint64_t)v6, (uint64_t)v7);
    _os_log_impl(&dword_21E389000, (os_log_t)v10, v9, "%@: Setting Layout: %@", v13, 0x16u);

  }
  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v12->_layout, location[0]);
  -[CPSInstrumentClusterCardViewController _setupConstraintsForPlatterView](v12, "_setupConstraintsForPlatterView");
  -[CPSInstrumentClusterCardViewController _setupConstraintsForETACard](v12, "_setupConstraintsForETACard");
  v5 = -[CPSInstrumentClusterCardViewController currentManeuversCardView](v12, "currentManeuversCardView");

  if (v5)
  {
    v4 = -[CPSInstrumentClusterCardViewController currentManeuversCardView](v12, "currentManeuversCardView");
    v3 = -[CPSManeuversCardView maneuvers](v4, "maneuvers");
    v8 = (id)-[NSArray copy](v3, "copy");

    objc_storeStrong((id *)&v12->_currentManeuversCardView, 0);
    -[CPSInstrumentClusterCardViewController showManeuvers:usingDisplayStyles:](v12, "showManeuvers:usingDisplayStyles:", v8, MEMORY[0x24BDBD1A8]);
    objc_storeStrong(&v8, 0);
  }
  -[CPSInstrumentClusterCardViewController _setupConstraintsForPauseCard](v12, "_setupConstraintsForPauseCard");
  -[CPSInstrumentClusterCardViewController _updateClientSafeArea](v12, "_updateClientSafeArea");
  objc_storeStrong(location, 0);
}

- (void)setCARScreenInfo:(id)a3 isRightHandDrive:(BOOL)a4 supportsVehicleData:(BOOL)a5
{
  id location[2];
  CPSInstrumentClusterCardViewController *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong((id *)&v8->_carScreenInfo, location[0]);
  v8->_isRightHandDrive = a4;
  v8->_supportsVehicleData = a5;
  -[CPSInstrumentClusterCardViewController _evaluateLayout](v8, "_evaluateLayout");
  objc_storeStrong(location, 0);
}

- (void)setSafeAreaDelegate:(id)a3
{
  id WeakRetained;
  BOOL v4;
  id location[2];
  CPSInstrumentClusterCardViewController *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  WeakRetained = objc_loadWeakRetained((id *)&v6->_safeAreaDelegate);
  v4 = WeakRetained == location[0];

  if (!v4)
  {
    objc_storeWeak((id *)&v6->_safeAreaDelegate, location[0]);
    -[CPSInstrumentClusterCardViewController _updateClientSafeArea](v6, "_updateClientSafeArea");
  }
  objc_storeStrong(location, 0);
}

- (void)_evaluateLayout
{
  double v2;
  double v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  double v10;
  double v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  CPSInstrumentClusterCardLayout *v29;
  CPSInstrumentClusterCardLayout *v30;
  CARScreenInfo *v31;
  CPSInstrumentClusterCardViewController *v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  double v38;
  CARScreenInfo *v39;
  double v40;
  CARScreenInfo *v41;
  double v42;
  CPSInstrumentClusterCardViewController *v43;
  CPSInstrumentClusterCardLayout *v44;
  CPSInstrumentClusterCardViewController *v45;
  id v46;
  id v47;
  id v48;
  id v49;
  CPSInstrumentClusterCardLayout *v50;
  os_log_type_t v51;
  os_log_t oslog;
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint64_t v58;
  uint64_t v59;
  double v60;
  double v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  double v66;
  uint64_t v67;
  double v68;
  uint64_t v69;
  double v70;
  double v71;
  os_log_type_t v72;
  id v73;
  double v74;
  double v75;
  double v76;
  uint64_t v77;
  double v78;
  double v79;
  uint64_t v80;
  uint64_t v81;
  os_log_type_t v82;
  id v83;
  os_log_type_t v84;
  id location[2];
  CPSInstrumentClusterCardViewController *v86;
  uint8_t v87[32];
  uint8_t v88[32];
  uint8_t v89[16];
  uint8_t v90[24];
  uint64_t v91;

  v91 = *MEMORY[0x24BDAC8D0];
  v86 = self;
  location[1] = (id)a2;
  location[0] = CarPlaySupportGeneralLogging();
  v84 = OS_LOG_TYPE_INFO;
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_INFO))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v90, (uint64_t)v86);
    _os_log_impl(&dword_21E389000, (os_log_t)location[0], v84, "%@: Evaluating Layout", v90, 0xCu);
  }
  objc_storeStrong(location, 0);
  if (-[CPSInstrumentClusterCardViewController supportsVehicleData](v86, "supportsVehicleData"))
  {
    v83 = CarPlaySupportGeneralLogging();
    v82 = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled((os_log_t)v83, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v89, (uint64_t)v86);
      _os_log_impl(&dword_21E389000, (os_log_t)v83, v82, "%@: Supports vehicle data", v89, 0xCu);
    }
    objc_storeStrong(&v83, 0);
    v47 = (id)-[CPSInstrumentClusterCardViewController view](v86, "view");
    objc_msgSend(v47, "frame");
    v78 = v2;
    v79 = v3;
    v80 = v4;
    v81 = v5;

    v49 = (id)-[CPSInstrumentClusterCardViewController view](v86, "view");
    v48 = (id)objc_msgSend(v49, "safeAreaLayoutGuide");
    objc_msgSend(v48, "layoutFrame");
    v74 = v6;
    v75 = v7;
    v76 = v8;
    v77 = v9;

    if (v76 > 300.0)
    {
      v37 = (id)-[CPSInstrumentClusterCardViewController view](v86, "view");
      v36 = (id)objc_msgSend(v37, "window");
      v35 = (id)objc_msgSend(v36, "screen");
      v34 = (id)objc_msgSend(v35, "displayConfiguration");
      objc_msgSend(v34, "pointScale");
      v38 = v10;

      v71 = v38;
      v41 = -[CPSInstrumentClusterCardViewController carScreenInfo](v86, "carScreenInfo");
      -[CARScreenInfo physicalSize](v41, "physicalSize");
      v68 = v11;
      v69 = v12;
      v40 = v11;
      v39 = -[CPSInstrumentClusterCardViewController carScreenInfo](v86, "carScreenInfo");
      -[CARScreenInfo pixelSize](v39, "pixelSize");
      v66 = v13;
      v67 = v14;
      v42 = v40 / v13;

      v70 = v42;
      CGSizeMake_14();
      v64 = v15;
      v65 = v16;
      CGSizeMake_14();
      v62 = v17;
      v63 = v18;
      v61 = (v74 - v78) * v38;
      v60 = (v75 - v79) * v38;
      CGPointMake_0();
      v58 = v19;
      v59 = v20;
      CGRectMake_6();
      *(_QWORD *)&v56 = v21;
      *((_QWORD *)&v56 + 1) = v22;
      *(_QWORD *)&v57 = v23;
      *((_QWORD *)&v57 + 1) = v24;
      CGRectMake_6();
      *(_QWORD *)&v54 = v25;
      *((_QWORD *)&v54 + 1) = v26;
      *(_QWORD *)&v55 = v27;
      *((_QWORD *)&v55 + 1) = v28;
      v29 = [CPSInstrumentClusterCardLayout alloc];
      v53 = -[CPSInstrumentClusterCardLayout initWithSafeAreaFrame:viewAreaFrame:displayFrame:physicalPixelWidth:isRightHandDrive:](v29, "initWithSafeAreaFrame:viewAreaFrame:displayFrame:physicalPixelWidth:isRightHandDrive:", v86->_isRightHandDrive, v56, v57, v54, v55, v54, v55, *(_QWORD *)&v42);
      -[CPSInstrumentClusterCardViewController setLayout:](v86, "setLayout:", v53);
      oslog = (os_log_t)CarPlaySupportGeneralLogging();
      v51 = OS_LOG_TYPE_INFO;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
      {
        v32 = v86;
        v33 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v76);
        __os_log_helper_16_2_2_8_64_8_64((uint64_t)v87, (uint64_t)v32, (uint64_t)v33);
        _os_log_impl(&dword_21E389000, oslog, v51, "%@: Cluster safe area width %@ greater than 300. Showing ETA.", v87, 0x16u);

      }
      objc_storeStrong((id *)&oslog, 0);
      -[CPSInstrumentClusterCardViewController setShowETA:](v86, "setShowETA:", 1);
      objc_storeStrong(&v53, 0);
    }
    else
    {
      v73 = CarPlaySupportGeneralLogging();
      v72 = OS_LOG_TYPE_INFO;
      if (os_log_type_enabled((os_log_t)v73, OS_LOG_TYPE_INFO))
      {
        v45 = v86;
        v46 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v76);
        __os_log_helper_16_2_2_8_64_8_64((uint64_t)v88, (uint64_t)v45, (uint64_t)v46);
        _os_log_impl(&dword_21E389000, (os_log_t)v73, v72, "%@: Cluster safe area width %@ less/equal to 300. Using center layout.", v88, 0x16u);

      }
      objc_storeStrong(&v73, 0);
      -[CPSInstrumentClusterCardViewController setShowETA:](v86, "setShowETA:", 0);
      v43 = v86;
      v44 = +[CPSInstrumentClusterCardLayout layoutWithLayoutType:](CPSInstrumentClusterCardLayout, "layoutWithLayoutType:", 1);
      -[CPSInstrumentClusterCardViewController setLayout:](v43, "setLayout:");

    }
  }
  else
  {
    v30 = [CPSInstrumentClusterCardLayout alloc];
    v31 = -[CPSInstrumentClusterCardViewController carScreenInfo](v86, "carScreenInfo");
    v50 = -[CPSInstrumentClusterCardLayout initWithCarScreenInfo:isRightHandDrive:](v30, "initWithCarScreenInfo:isRightHandDrive:", v31, -[CPSInstrumentClusterCardViewController isRightHandDrive](v86, "isRightHandDrive"));

    -[CPSInstrumentClusterCardViewController setLayout:](v86, "setLayout:", v50);
    objc_storeStrong((id *)&v50, 0);
  }
}

- (void)_updateClientSafeArea
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;
  CPSClusterPausedCardView *v11;
  int v12;
  char v13;
  UIView *v14;
  char v15;
  CPSClusterEstimatesViewController *v16;
  char v17;
  CPSClusterManeuversCardView *v18;

  v11 = -[CPSInstrumentClusterCardViewController currentPausedCardView](self, "currentPausedCardView");
  v17 = 0;
  v15 = 0;
  v13 = 0;
  LOBYTE(v12) = 1;
  if (!v11)
  {
    v18 = -[CPSInstrumentClusterCardViewController currentManeuversCardView](self, "currentManeuversCardView");
    v17 = 1;
    LOBYTE(v12) = 1;
    if (!v18)
    {
      v16 = -[CPSInstrumentClusterCardViewController estimatesViewController](self, "estimatesViewController");
      v15 = 1;
      v14 = -[CPSDashboardEstimatesViewController platterView](v16, "platterView");
      v13 = 1;
      v12 = !-[UIView isHidden](v14, "isHidden");
    }
  }
  if ((v13 & 1) != 0)

  if ((v15 & 1) != 0)
  if ((v17 & 1) != 0)

  if ((v12 & 1) != 0)
  {
    -[CPSInstrumentClusterCardViewController _layoutGuideForClient](self, "_layoutGuideForClient");
    -[CPSInstrumentClusterCardViewController _updateClientSafeAreaWithInsets:](self, "_updateClientSafeAreaWithInsets:", v2, v3, v4, v5);
  }
  else
  {
    v10 = (id)-[CPSInstrumentClusterCardViewController view](self, "view");
    objc_msgSend(v10, "safeAreaInsets");
    -[CPSInstrumentClusterCardViewController _updateClientSafeAreaWithInsets:](self, "_updateClientSafeAreaWithInsets:", v6, v7, v8, v9);

  }
}

- (UIEdgeInsets)_layoutGuideForClient
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIView *v6;
  UIView *v7;
  UIViewController *v8;
  UIView *v9;
  UIViewController *v10;
  UIView *v11;
  UIViewController *v12;
  id v13;
  id v14;
  id v15;
  UIEdgeInsets result;

  v12 = -[CPSInstrumentClusterCardViewController platterViewController](self, "platterViewController");
  v11 = -[UIViewController view](v12, "view");
  -[UIView layoutIfNeeded](v11, "layoutIfNeeded");

  v14 = (id)-[CPSInstrumentClusterCardViewController view](self, "view");
  v13 = (id)objc_msgSend(v14, "safeAreaLayoutGuide");
  objc_msgSend(v13, "layoutFrame");

  v15 = (id)-[CPSInstrumentClusterCardViewController view](self, "view");
  objc_msgSend(v15, "safeAreaInsets");

  if (!-[CPSInstrumentClusterCardViewController isMapContentOnly](self, "isMapContentOnly")
    || !-[CPSInstrumentClusterCardViewController showETA](self, "showETA"))
  {
    if (-[CPSInstrumentClusterCardLayout layoutForCard](self->_layout, "layoutForCard") == 1 && self->_layout)
    {
      -[CPSInstrumentClusterCardViewController showETA](self, "showETA");
    }
    else if (-[CPSInstrumentClusterCardLayout layoutForCard](self->_layout, "layoutForCard") == 2)
    {
      v10 = -[CPSInstrumentClusterCardViewController platterViewController](self, "platterViewController");
      v9 = -[UIViewController view](v10, "view");
      -[UIView bounds](v9, "bounds");
      v8 = -[CPSInstrumentClusterCardViewController platterViewController](self, "platterViewController");
      v7 = -[UIViewController view](v8, "view");
      -[UIView frame](v7, "frame");

    }
    else
    {
      v6 = -[UIViewController view](self->_platterViewController, "view");
      -[UIView bounds](v6, "bounds");

    }
  }
  UIEdgeInsetsMake_5();
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)_updateClientSafeAreaWithInsets:(UIEdgeInsets)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id WeakRetained;

  if (self->_shouldUpdateContent)
  {
    -[CPSInstrumentClusterCardViewController currentClientInsets](self, "currentClientInsets");
    if (!UIEdgeInsetsEqualToEdgeInsets_0(a3.top, a3.left, a3.bottom, a3.right, v3, v4, v5, v6))
    {
      -[CPSInstrumentClusterCardViewController setCurrentClientInsets:](self, "setCurrentClientInsets:", a3.top, a3.left, a3.bottom, a3.right);
      WeakRetained = objc_loadWeakRetained((id *)&self->_safeAreaDelegate);
      -[CPSInstrumentClusterCardViewController currentClientInsets](self, "currentClientInsets");
      objc_msgSend(WeakRetained, "viewController:didUpdateSafeAreaInsets:", self, v7, v8, v9, v10);

    }
  }
}

- (void)_setupConstraintsForPlatterView
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  id v28;
  id v29;
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
  void *v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  UIView *v57;
  id v58;
  UIView *v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68[3];
  double v69;
  double v70;
  id v71;
  os_log_type_t v72;
  id location[2];
  CPSInstrumentClusterCardViewController *v74;
  _QWORD v75[6];
  _QWORD v76[6];
  _QWORD v77[6];
  uint8_t v78[24];
  uint64_t v79;

  v79 = *MEMORY[0x24BDAC8D0];
  v74 = self;
  location[1] = (id)a2;
  location[0] = CarPlaySupportGeneralLogging();
  v72 = OS_LOG_TYPE_INFO;
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_INFO))
  {
    v62 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[CPSInstrumentClusterCardLayout layoutForCard](v74->_layout, "layoutForCard"));
    __os_log_helper_16_2_2_8_64_8_64((uint64_t)v78, (uint64_t)v74, (uint64_t)v62);
    _os_log_impl(&dword_21E389000, (os_log_t)location[0], v72, "%@ Setting constraints for platter view with layout: %@", v78, 0x16u);

  }
  objc_storeStrong(location, 0);
  v71 = objc_alloc_init(MEMORY[0x24BDF6F90]);
  v56 = (id)-[CPSInstrumentClusterCardViewController view](v74, "view");
  v55 = (id)objc_msgSend(v56, "safeAreaLayoutGuide");
  objc_msgSend(v55, "layoutFrame");
  v68[1] = v2;
  v68[2] = v3;
  v69 = v4;
  v70 = v5;

  -[UIViewController setView:](v74->_platterViewController, "setView:", v71);
  -[UIViewController willMoveToParentViewController:](v74->_platterViewController, "willMoveToParentViewController:", v74);
  -[CPSInstrumentClusterCardViewController addChildViewController:](v74, "addChildViewController:", v74->_platterViewController);
  v58 = (id)-[CPSInstrumentClusterCardViewController view](v74, "view");
  v57 = -[UIViewController view](v74->_platterViewController, "view");
  objc_msgSend(v58, "addSubview:");

  -[UIViewController didMoveToParentViewController:](v74->_platterViewController, "didMoveToParentViewController:", v74);
  v59 = -[UIViewController view](v74->_platterViewController, "view");
  -[UIView setClipsToBounds:](v59, "setClipsToBounds:", 1);

  v68[0] = -[UIViewController view](v74->_platterViewController, "view");
  objc_msgSend(v68[0], "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v60 = (id)objc_msgSend(v68[0], "widthAnchor");
  v67 = (id)objc_msgSend(v60, "constraintGreaterThanOrEqualToConstant:", 140.0);

  objc_msgSend(v67, "setPriority:");
  v61 = (id)objc_msgSend(v68[0], "widthAnchor");
  v66 = (id)objc_msgSend(v61, "constraintLessThanOrEqualToConstant:", 213.0);

  LODWORD(v6) = 1148846080;
  objc_msgSend(v66, "setPriority:", v6);
  if (-[CPSInstrumentClusterCardLayout layoutForCard](v74->_layout, "layoutForCard") == 1 && v74->_layout)
  {
    v40 = (id)objc_msgSend(v68[0], "widthAnchor");
    v65 = (id)objc_msgSend(v40, "constraintEqualToConstant:", v69 - 8.0);

    LODWORD(v7) = 1144750080;
    objc_msgSend(v65, "setPriority:", v7);
    v41 = (void *)MEMORY[0x24BDD1628];
    v54 = (id)objc_msgSend(v68[0], "centerXAnchor");
    v53 = (id)-[CPSInstrumentClusterCardViewController view](v74, "view");
    v52 = (id)objc_msgSend(v53, "safeAreaLayoutGuide");
    v51 = (id)objc_msgSend(v52, "centerXAnchor");
    v50 = (id)objc_msgSend(v54, "constraintEqualToAnchor:");
    v77[0] = v50;
    v49 = (id)objc_msgSend(v68[0], "centerYAnchor");
    v48 = (id)-[CPSInstrumentClusterCardViewController view](v74, "view");
    v47 = (id)objc_msgSend(v48, "safeAreaLayoutGuide");
    v46 = (id)objc_msgSend(v47, "centerYAnchor");
    v45 = (id)objc_msgSend(v49, "constraintEqualToAnchor:");
    v77[1] = v45;
    v44 = (id)objc_msgSend(v68[0], "heightAnchor");
    v43 = (id)objc_msgSend(v44, "constraintEqualToConstant:", v70 - 8.0);
    v77[2] = v43;
    v77[3] = v65;
    v77[4] = v67;
    v77[5] = v66;
    v42 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v77, 6);
    objc_msgSend(v41, "activateConstraints:");

    objc_storeStrong(&v65, 0);
  }
  else if (-[CPSInstrumentClusterCardLayout layoutForCard](v74->_layout, "layoutForCard") == 2)
  {
    v25 = (id)objc_msgSend(v68[0], "widthAnchor");
    v64 = (id)objc_msgSend(v25, "constraintEqualToConstant:", v69 * 0.4);

    LODWORD(v8) = 1144750080;
    objc_msgSend(v64, "setPriority:", v8);
    v26 = (void *)MEMORY[0x24BDD1628];
    v39 = (id)objc_msgSend(v68[0], "leftAnchor");
    v38 = (id)-[CPSInstrumentClusterCardViewController view](v74, "view");
    v37 = (id)objc_msgSend(v38, "safeAreaLayoutGuide");
    v36 = (id)objc_msgSend(v37, "leftAnchor");
    v35 = (id)objc_msgSend(v39, "constraintEqualToAnchor:constant:");
    v76[0] = v35;
    v34 = (id)objc_msgSend(v68[0], "topAnchor");
    v33 = (id)-[CPSInstrumentClusterCardViewController view](v74, "view");
    v32 = (id)objc_msgSend(v33, "safeAreaLayoutGuide");
    v31 = (id)objc_msgSend(v32, "topAnchor");
    v30 = (id)objc_msgSend(v34, "constraintEqualToAnchor:constant:", 4.0);
    v76[1] = v30;
    v29 = (id)objc_msgSend(v68[0], "heightAnchor");
    v28 = (id)objc_msgSend(v29, "constraintEqualToConstant:", v70 - 8.0);
    v76[2] = v28;
    v76[3] = v64;
    v76[4] = v67;
    v76[5] = v66;
    v27 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v76, 6);
    objc_msgSend(v26, "activateConstraints:");

    objc_storeStrong(&v64, 0);
  }
  else if (-[CPSInstrumentClusterCardLayout layoutForCard](v74->_layout, "layoutForCard") == 3)
  {
    v10 = (id)objc_msgSend(v68[0], "widthAnchor");
    v63 = (id)objc_msgSend(v10, "constraintEqualToConstant:", v69 * 0.4);

    LODWORD(v9) = 1144750080;
    objc_msgSend(v63, "setPriority:", v9);
    v11 = (void *)MEMORY[0x24BDD1628];
    v24 = (id)objc_msgSend(v68[0], "rightAnchor");
    v23 = (id)-[CPSInstrumentClusterCardViewController view](v74, "view");
    v22 = (id)objc_msgSend(v23, "safeAreaLayoutGuide");
    v21 = (id)objc_msgSend(v22, "rightAnchor");
    v20 = (id)objc_msgSend(v24, "constraintEqualToAnchor:constant:", -8.0);
    v75[0] = v20;
    v19 = (id)objc_msgSend(v68[0], "topAnchor");
    v18 = (id)-[CPSInstrumentClusterCardViewController view](v74, "view");
    v17 = (id)objc_msgSend(v18, "safeAreaLayoutGuide");
    v16 = (id)objc_msgSend(v17, "topAnchor");
    v15 = (id)objc_msgSend(v19, "constraintEqualToAnchor:constant:", 4.0);
    v75[1] = v15;
    v14 = (id)objc_msgSend(v68[0], "heightAnchor");
    v13 = (id)objc_msgSend(v14, "constraintEqualToConstant:", v70 - 8.0);
    v75[2] = v13;
    v75[3] = v63;
    v75[4] = v67;
    v75[5] = v66;
    v12 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v75, 6);
    objc_msgSend(v11, "activateConstraints:");

    objc_storeStrong(&v63, 0);
  }
  objc_storeStrong(&v66, 0);
  objc_storeStrong(&v67, 0);
  objc_storeStrong(v68, 0);
  objc_storeStrong(&v71, 0);
}

- (void)_setupConstraintsForETACard
{
  id v2;
  UIView *v3;
  void *v4;
  id v5;
  id v6;
  NSLayoutYAxisAnchor *v7;
  UIView *v8;
  UIViewController *v9;
  id v10;
  id v11;
  NSLayoutXAxisAnchor *v12;
  UIView *v13;
  UIViewController *v14;
  id v15;
  id v16;
  NSLayoutXAxisAnchor *v17;
  UIView *v18;
  UIViewController *v19;
  id v20;
  id v21;
  id v22;
  os_log_type_t v23;
  id location[2];
  CPSInstrumentClusterCardViewController *v25;
  _QWORD v26[3];
  uint8_t v27[24];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v25 = self;
  location[1] = (id)a2;
  location[0] = CarPlaySupportGeneralLogging();
  v23 = OS_LOG_TYPE_INFO;
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_INFO))
  {
    v21 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[CPSInstrumentClusterCardLayout layoutForCard](v25->_layout, "layoutForCard"));
    __os_log_helper_16_2_2_8_64_8_64((uint64_t)v27, (uint64_t)v25, (uint64_t)v21);
    _os_log_impl(&dword_21E389000, (os_log_t)location[0], v23, "%@ Setting constraints for ETA Card with layout: %@", v27, 0x16u);

  }
  objc_storeStrong(location, 0);
  -[CPSClusterEstimatesViewController willMoveToParentViewController:](v25->_estimatesViewController, "willMoveToParentViewController:", v25->_platterViewController);
  -[UIViewController addChildViewController:](v25->_platterViewController, "addChildViewController:", v25->_estimatesViewController);
  v3 = -[UIViewController view](v25->_platterViewController, "view");
  v2 = (id)-[CPSClusterEstimatesViewController view](v25->_estimatesViewController, "view");
  -[UIView addSubview:](v3, "addSubview:");

  -[CPSClusterEstimatesViewController didMoveToParentViewController:](v25->_estimatesViewController, "didMoveToParentViewController:", v25->_platterViewController);
  v22 = (id)-[CPSClusterEstimatesViewController view](v25->_estimatesViewController, "view");
  objc_msgSend(v22, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v4 = (void *)MEMORY[0x24BDD1628];
  v20 = (id)objc_msgSend(v22, "leftAnchor");
  v19 = -[CPSInstrumentClusterCardViewController platterViewController](v25, "platterViewController");
  v18 = -[UIViewController view](v19, "view");
  v17 = -[UIView leftAnchor](v18, "leftAnchor");
  v16 = (id)objc_msgSend(v20, "constraintEqualToAnchor:");
  v26[0] = v16;
  v15 = (id)objc_msgSend(v22, "rightAnchor");
  v14 = -[CPSInstrumentClusterCardViewController platterViewController](v25, "platterViewController");
  v13 = -[UIViewController view](v14, "view");
  v12 = -[UIView rightAnchor](v13, "rightAnchor");
  v11 = (id)objc_msgSend(v15, "constraintEqualToAnchor:");
  v26[1] = v11;
  v10 = (id)objc_msgSend(v22, "bottomAnchor");
  v9 = -[CPSInstrumentClusterCardViewController platterViewController](v25, "platterViewController");
  v8 = -[UIViewController view](v9, "view");
  v7 = -[UIView bottomAnchor](v8, "bottomAnchor");
  v6 = (id)objc_msgSend(v10, "constraintEqualToAnchor:");
  v26[2] = v6;
  v5 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 3);
  objc_msgSend(v4, "activateConstraints:");

  objc_storeStrong(&v22, 0);
}

- (void)_setupConstraintsForTurnCard
{
  UIView *v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  NSLayoutDimension *v11;
  UIView *v12;
  UIViewController *v13;
  id v14;
  id v15;
  NSLayoutYAxisAnchor *v16;
  UIView *v17;
  UIViewController *v18;
  id v19;
  id v20;
  NSLayoutXAxisAnchor *v21;
  UIView *v22;
  UIViewController *v23;
  id v24;
  id v25[2];
  CPSInstrumentClusterCardViewController *v26;
  _QWORD v27[5];

  v27[4] = *MEMORY[0x24BDAC8D0];
  v26 = self;
  v25[1] = (id)a2;
  if (self->_currentManeuversCardView && v26->_shouldUpdateContent && !v26->_isMapContentOnly)
  {
    v25[0] = v26->_currentManeuversCardView;
    v2 = -[UIViewController view](v26->_platterViewController, "view");
    -[UIView addSubview:](v2, "addSubview:", v26->_currentManeuversCardView);

    v3 = (void *)MEMORY[0x24BDD1628];
    v24 = (id)objc_msgSend(v25[0], "leftAnchor");
    v23 = -[CPSInstrumentClusterCardViewController platterViewController](v26, "platterViewController");
    v22 = -[UIViewController view](v23, "view");
    v21 = -[UIView leftAnchor](v22, "leftAnchor");
    v20 = (id)objc_msgSend(v24, "constraintEqualToAnchor:");
    v27[0] = v20;
    v19 = (id)objc_msgSend(v25[0], "topAnchor");
    v18 = -[CPSInstrumentClusterCardViewController platterViewController](v26, "platterViewController");
    v17 = -[UIViewController view](v18, "view");
    v16 = -[UIView topAnchor](v17, "topAnchor");
    v15 = (id)objc_msgSend(v19, "constraintEqualToAnchor:");
    v27[1] = v15;
    v14 = (id)objc_msgSend(v25[0], "widthAnchor");
    v13 = -[CPSInstrumentClusterCardViewController platterViewController](v26, "platterViewController");
    v12 = -[UIViewController view](v13, "view");
    v11 = -[UIView widthAnchor](v12, "widthAnchor");
    v10 = (id)objc_msgSend(v14, "constraintEqualToAnchor:");
    v27[2] = v10;
    v9 = (id)objc_msgSend(v25[0], "heightAnchor");
    v8 = (id)-[CPSInstrumentClusterCardViewController view](v26, "view");
    v7 = (id)objc_msgSend(v8, "safeAreaLayoutGuide");
    v6 = (id)objc_msgSend(v7, "heightAnchor");
    v5 = (id)objc_msgSend(v9, "constraintLessThanOrEqualToAnchor:");
    v27[3] = v5;
    v4 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 4);
    objc_msgSend(v3, "activateConstraints:");

    objc_storeStrong(v25, 0);
  }
}

- (void)_setupConstraintsForPauseCard
{
  UIView *v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  NSLayoutDimension *v11;
  UIView *v12;
  UIViewController *v13;
  id v14;
  id v15;
  NSLayoutYAxisAnchor *v16;
  UIView *v17;
  UIViewController *v18;
  id v19;
  id v20;
  NSLayoutXAxisAnchor *v21;
  UIView *v22;
  UIViewController *v23;
  id v24;
  id v25[2];
  CPSInstrumentClusterCardViewController *v26;
  _QWORD v27[5];

  v27[4] = *MEMORY[0x24BDAC8D0];
  v26 = self;
  v25[1] = (id)a2;
  if (self->_currentPausedCardView && v26->_shouldUpdateContent && !v26->_isMapContentOnly)
  {
    v25[0] = v26->_currentPausedCardView;
    v2 = -[UIViewController view](v26->_platterViewController, "view");
    -[UIView addSubview:](v2, "addSubview:", v26->_currentPausedCardView);

    v3 = (void *)MEMORY[0x24BDD1628];
    v24 = (id)objc_msgSend(v25[0], "leftAnchor");
    v23 = -[CPSInstrumentClusterCardViewController platterViewController](v26, "platterViewController");
    v22 = -[UIViewController view](v23, "view");
    v21 = -[UIView leftAnchor](v22, "leftAnchor");
    v20 = (id)objc_msgSend(v24, "constraintEqualToAnchor:");
    v27[0] = v20;
    v19 = (id)objc_msgSend(v25[0], "topAnchor");
    v18 = -[CPSInstrumentClusterCardViewController platterViewController](v26, "platterViewController");
    v17 = -[UIViewController view](v18, "view");
    v16 = -[UIView topAnchor](v17, "topAnchor");
    v15 = (id)objc_msgSend(v19, "constraintEqualToAnchor:");
    v27[1] = v15;
    v14 = (id)objc_msgSend(v25[0], "widthAnchor");
    v13 = -[CPSInstrumentClusterCardViewController platterViewController](v26, "platterViewController");
    v12 = -[UIViewController view](v13, "view");
    v11 = -[UIView widthAnchor](v12, "widthAnchor");
    v10 = (id)objc_msgSend(v14, "constraintEqualToAnchor:");
    v27[2] = v10;
    v9 = (id)objc_msgSend(v25[0], "heightAnchor");
    v8 = (id)-[CPSInstrumentClusterCardViewController view](v26, "view");
    v7 = (id)objc_msgSend(v8, "safeAreaLayoutGuide");
    v6 = (id)objc_msgSend(v7, "heightAnchor");
    v5 = (id)objc_msgSend(v9, "constraintEqualToAnchor:multiplier:", 0.35);
    v27[3] = v5;
    v4 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 4);
    objc_msgSend(v3, "activateConstraints:");

    objc_storeStrong(v25, 0);
  }
}

- (void)showManeuvers:(id)a3 usingDisplayStyles:(id)a4
{
  CPSClusterManeuversCardView *v4;
  CPSClusterManeuversCardView *v5;
  CPSClusterManeuversCardView *v6;
  id v7;
  id v8;
  CPSCardPlatterView *v9;
  id v10;
  id v11;
  CPSClusterPausedCardView *v12;
  CPSClusterPausedCardView *v13;
  CPSClusterManeuversCardView *v14;
  CPSClusterManeuversCardView *v15;
  CPSClusterManeuversCardView *v16;
  char v17;
  id v19;
  CPSClusterManeuversCardView *v20;
  char v21;
  NSArray *v22;
  char v23;
  CPSClusterManeuversCardView *v24;
  char v25;
  int v26;
  id v27;
  id location[2];
  CPSInstrumentClusterCardViewController *v29;

  v29 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v27 = 0;
  objc_storeStrong(&v27, a4);
  if ((-[CPSInstrumentClusterCardViewController isViewLoaded](v29, "isViewLoaded") & 1) != 0 && !v29->_isMapContentOnly)
  {
    v25 = 0;
    v16 = -[CPSInstrumentClusterCardViewController currentManeuversCardView](v29, "currentManeuversCardView");
    v23 = 0;
    v21 = 0;
    v17 = 0;
    if (v16)
    {
      v24 = -[CPSInstrumentClusterCardViewController currentManeuversCardView](v29, "currentManeuversCardView");
      v23 = 1;
      v22 = -[CPSManeuversCardView maneuvers](v24, "maneuvers");
      v21 = 1;
      v17 = BSEqualObjects();
    }
    if ((v21 & 1) != 0)

    if ((v23 & 1) != 0)
    v25 = v17 & 1;
    if ((v17 & 1) != 0)
    {
      v26 = 1;
    }
    else
    {
      v20 = 0;
      v19 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v15 = -[CPSInstrumentClusterCardViewController currentManeuversCardView](v29, "currentManeuversCardView");

      if (v15)
      {
        v14 = -[CPSInstrumentClusterCardViewController currentManeuversCardView](v29, "currentManeuversCardView");
        objc_msgSend(v19, "addObject:");

      }
      v13 = -[CPSInstrumentClusterCardViewController currentPausedCardView](v29, "currentPausedCardView");

      if (v13)
      {
        v12 = -[CPSInstrumentClusterCardViewController currentPausedCardView](v29, "currentPausedCardView");
        objc_msgSend(v19, "addObject:");

      }
      -[CPSInstrumentClusterCardViewController setCurrentManeuversCardView:](v29, "setCurrentManeuversCardView:");
      -[CPSInstrumentClusterCardViewController setCurrentPausedCardView:](v29, "setCurrentPausedCardView:", 0);
      if (objc_msgSend(location[0], "count"))
      {
        v4 = [CPSClusterManeuversCardView alloc];
        v5 = -[CPSManeuversCardView initWithManeuvers:](v4, "initWithManeuvers:", location[0]);
        v6 = v20;
        v20 = v5;

        -[CPSManeuversCardView setUsesCustomBackgroundColor:](v20, "setUsesCustomBackgroundColor:", 1);
        v10 = (id)objc_msgSend(location[0], "firstObject");
        v11 = (id)objc_msgSend(v10, "cardBackgroundColor");

        if (v11)
        {
          v9 = -[CPSManeuversCardView cardPlatterView](v20, "cardPlatterView");
          v8 = (id)objc_msgSend(location[0], "firstObject");
          v7 = (id)objc_msgSend(v8, "cardBackgroundColor");
          -[CPSCardPlatterView setBackgroundColor:](v9, "setBackgroundColor:");

        }
        -[CPSInstrumentClusterCardViewController setCurrentManeuversCardView:](v29, "setCurrentManeuversCardView:", v20);
        -[CPSInstrumentClusterCardViewController _setupConstraintsForTurnCard](v29, "_setupConstraintsForTurnCard");
      }
      -[CPSInstrumentClusterCardViewController _transitionFromViews:inView:horizontalSlideAnimation:](v29, "_transitionFromViews:inView:horizontalSlideAnimation:", v19, v20, 0);
      objc_storeStrong(&v19, 0);
      objc_storeStrong((id *)&v20, 0);
      v26 = 0;
    }
  }
  else
  {
    v26 = 1;
  }
  objc_storeStrong(&v27, 0);
  objc_storeStrong(location, 0);
}

- (void)updateEstimates:(id)a3 forManeuver:(id)a4
{
  CPSClusterManeuversCardView *v4;
  CPSClusterManeuversCardView *v6;
  id v7;
  id location[2];
  CPSInstrumentClusterCardViewController *v9;

  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7 = 0;
  objc_storeStrong(&v7, a4);
  v6 = -[CPSInstrumentClusterCardViewController currentManeuversCardView](v9, "currentManeuversCardView");

  if (v6)
  {
    v4 = -[CPSInstrumentClusterCardViewController currentManeuversCardView](v9, "currentManeuversCardView");
    -[CPSManeuversCardView updateEstimates:forManeuver:](v4, "updateEstimates:forManeuver:", location[0], v7);

  }
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

- (void)navigator:(id)a3 pausedTripForReason:(unint64_t)a4 description:(id)a5 usingColor:(id)a6
{
  id v6;
  CPSInstrumentClusterCardViewController *v7;
  CPSClusterPausedCardView *v8;
  CPSClusterPausedCardView *v9;
  id v10;
  CPSClusterPausedCardView *v11;
  unint64_t v12;
  id v13;
  CPSClusterPausedCardView *v14;
  CPSClusterPausedCardView *v15;
  CPSClusterManeuversCardView *v16;
  CPSClusterManeuversCardView *v17;
  char v21;
  id v22;
  id v23;
  int v24;
  id v25;
  id v26;
  unint64_t v27;
  id location[2];
  CPSInstrumentClusterCardViewController *v29;

  v29 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v27 = a4;
  v26 = 0;
  objc_storeStrong(&v26, a5);
  v25 = 0;
  objc_storeStrong(&v25, a6);
  if ((-[CPSInstrumentClusterCardViewController isViewLoaded](v29, "isViewLoaded") & 1) != 0 && !v29->_isMapContentOnly)
  {
    v23 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v17 = -[CPSInstrumentClusterCardViewController currentManeuversCardView](v29, "currentManeuversCardView");

    if (v17)
    {
      v16 = -[CPSInstrumentClusterCardViewController currentManeuversCardView](v29, "currentManeuversCardView");
      objc_msgSend(v23, "addObject:");

    }
    v15 = -[CPSInstrumentClusterCardViewController currentPausedCardView](v29, "currentPausedCardView");

    if (v15)
    {
      v14 = -[CPSInstrumentClusterCardViewController currentPausedCardView](v29, "currentPausedCardView");
      objc_msgSend(v23, "addObject:");

    }
    -[CPSInstrumentClusterCardViewController setCurrentManeuversCardView:](v29, "setCurrentManeuversCardView:");
    -[CPSInstrumentClusterCardViewController setCurrentPausedCardView:](v29, "setCurrentPausedCardView:", 0);
    v11 = [CPSClusterPausedCardView alloc];
    v12 = v27;
    v13 = v26;
    v21 = 0;
    if (v25)
    {
      v10 = v25;
    }
    else
    {
      v22 = (id)objc_msgSend(MEMORY[0x24BDF6950], "tableBackgroundColor");
      v21 = 1;
      v10 = v22;
    }
    v9 = -[CPSPausedCardView initWithReason:title:backgroundColor:](v11, "initWithReason:title:backgroundColor:", v12, v13, v10);
    -[CPSInstrumentClusterCardViewController setCurrentPausedCardView:](v29, "setCurrentPausedCardView:");

    if ((v21 & 1) != 0)
    -[CPSInstrumentClusterCardViewController _setupConstraintsForPauseCard](v29, "_setupConstraintsForPauseCard");
    v7 = v29;
    v6 = v23;
    v8 = -[CPSInstrumentClusterCardViewController currentPausedCardView](v29, "currentPausedCardView");
    -[CPSInstrumentClusterCardViewController _transitionFromViews:inView:horizontalSlideAnimation:](v7, "_transitionFromViews:inView:horizontalSlideAnimation:", v6);

    objc_storeStrong(&v23, 0);
    v24 = 0;
  }
  else
  {
    v24 = 1;
  }
  objc_storeStrong(&v25, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(location, 0);
}

- (void)updateTripEstimates:(id)a3
{
  id location[2];
  CPSInstrumentClusterCardViewController *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[CPSInstrumentClusterCardViewController _updateClientSafeArea](v4, "_updateClientSafeArea");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[CPSDashboardEstimatesViewController updateTripEstimates:](v4->_estimatesViewController, "updateTripEstimates:", location[0]);
  objc_storeStrong(location, 0);
}

- (void)navigator:(id)a3 didEndTrip:(BOOL)a4
{
  CPSClusterManeuversCardView *v5;
  CPSClusterPausedCardView *v6;
  id location[2];
  CPSInstrumentClusterCardViewController *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[CPSDashboardEstimatesViewController navigator:didEndTrip:](v8->_estimatesViewController, "navigator:didEndTrip:", location[0], a4);
  v5 = -[CPSInstrumentClusterCardViewController currentManeuversCardView](v8, "currentManeuversCardView");
  -[CPSClusterManeuversCardView removeFromSuperview](v5, "removeFromSuperview");

  v6 = -[CPSInstrumentClusterCardViewController currentPausedCardView](v8, "currentPausedCardView");
  -[CPSClusterPausedCardView removeFromSuperview](v6, "removeFromSuperview");

  -[CPSInstrumentClusterCardViewController setCurrentManeuversCardView:](v8, "setCurrentManeuversCardView:", 0);
  -[CPSInstrumentClusterCardViewController setCurrentPausedCardView:](v8, "setCurrentPausedCardView:", 0);
  -[CPSInstrumentClusterCardViewController _updateClientSafeArea](v8, "_updateClientSafeArea");
  objc_storeStrong(location, 0);
}

- (void)setShowETA:(BOOL)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  CPSInstrumentClusterCardLayout *v7;
  id v8;
  id v9;
  char v10;
  char v11;
  os_log_t oslog;
  char v13;
  CPSInstrumentClusterCardLayout *v14;
  unsigned __int8 v15;
  BOOL v16;
  SEL v17;
  CPSInstrumentClusterCardViewController *v18;
  uint8_t v19[56];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v18 = self;
  v17 = a2;
  v16 = a3;
  v15 = 0;
  v13 = 0;
  v11 = 0;
  if (a3)
  {
    v10 = 1;
    if (!v18->_isMapContentOnly)
    {
      v14 = -[CPSInstrumentClusterCardViewController layout](v18, "layout");
      v13 = 1;
      v10 = -[CPSInstrumentClusterCardLayout showETAWithTurnCard](v14, "showETAWithTurnCard");
    }
    v11 = v10;
  }
  if ((v13 & 1) != 0)

  v15 = v11 & 1;
  oslog = (os_log_t)CarPlaySupportGeneralLogging();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
  {
    v9 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v16);
    v8 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v18->_isMapContentOnly);
    v4 = (void *)MEMORY[0x24BDD16E0];
    v7 = -[CPSInstrumentClusterCardViewController layout](v18, "layout");
    v6 = (id)objc_msgSend(v4, "numberWithBool:", -[CPSInstrumentClusterCardLayout showETAWithTurnCard](v7, "showETAWithTurnCard"));
    v5 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v15 & 1);
    __os_log_helper_16_2_5_8_64_8_64_8_64_8_64_8_64((uint64_t)v19, (uint64_t)v18, (uint64_t)v9, (uint64_t)v8, (uint64_t)v6, (uint64_t)v5);
    _os_log_impl(&dword_21E389000, oslog, OS_LOG_TYPE_INFO, "%@: showETA %@, mapOnly: %@, layout specified show ETA: %@, shouldShowETA: %@", v19, 0x34u);

  }
  objc_storeStrong((id *)&oslog, 0);
  v18->_showETA = v15 & 1;
  v3 = (id)-[CPSClusterEstimatesViewController view](v18->_estimatesViewController, "view");
  objc_msgSend(v3, "setHidden:", (v15 ^ 1) & 1);

  -[CPSInstrumentClusterCardViewController _updateClientSafeArea](v18, "_updateClientSafeArea");
}

- (void)_transitionFromViews:(id)a3 inView:(id)a4 horizontalSlideAnimation:(BOOL)a5
{
  uint64_t v5;
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
  double v17;
  double v18;
  double v19;
  double v20;
  UIView *v21;
  UIViewController *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  UIViewController *v27;
  id v28;
  uint64_t v31;
  int v32;
  int v33;
  uint64_t (*v34)(uint64_t);
  void *v35;
  CPSInstrumentClusterCardViewController *v36;
  uint64_t v37;
  int v38;
  int v39;
  uint64_t (*v40)(uint64_t);
  void *v41;
  id v42;
  __int128 v43;
  __int128 v44;
  double v45;
  double v46;
  double v47;
  double v48;
  __int128 v49;
  __int128 v50;
  uint64_t v51;
  int v52;
  int v53;
  uint64_t (*v54)(uint64_t);
  void *v55;
  CPSInstrumentClusterCardViewController *v56;
  uint64_t v57;
  int v58;
  int v59;
  uint64_t (*v60)(uint64_t);
  void *v61;
  id v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  uint64_t v69;
  int v70;
  int v71;
  void (*v72)(uint64_t, void *, void *, void *);
  void *v73;
  id v74;
  CPSInstrumentClusterCardViewController *v75;
  BOOL v76;
  BOOL v77;
  id v78;
  BOOL v79;
  BOOL v80;
  id v81;
  id location[2];
  CPSInstrumentClusterCardViewController *v83;

  v83 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v81 = 0;
  objc_storeStrong(&v81, a4);
  v80 = a5;
  if (objc_msgSend(location[0], "count") && v83->_shouldUpdateContent)
  {
    v79 = v81 == 0;
    v27 = -[CPSInstrumentClusterCardViewController platterViewController](v83, "platterViewController");
    v78 = -[UIViewController view](v27, "view");

    v28 = location[0];
    v69 = MEMORY[0x24BDAC760];
    v70 = -1073741824;
    v71 = 0;
    v72 = __95__CPSInstrumentClusterCardViewController__transitionFromViews_inView_horizontalSlideAnimation___block_invoke;
    v73 = &unk_24E271300;
    v74 = v78;
    v76 = v79;
    v77 = v80;
    v75 = v83;
    objc_msgSend(v28, "enumerateObjectsUsingBlock:", &v69);
    if (v81 && v80)
    {
      objc_msgSend(v78, "layoutIfNeeded");
      objc_msgSend(v81, "frame");
      *(_QWORD *)&v67 = v5;
      *((_QWORD *)&v67 + 1) = v6;
      *(_QWORD *)&v68 = v7;
      *((_QWORD *)&v68 + 1) = v8;
      objc_msgSend(v81, "frame");
      *(_QWORD *)&v65 = v9;
      *((_QWORD *)&v65 + 1) = v10;
      *(_QWORD *)&v66 = v11;
      *((_QWORD *)&v66 + 1) = v12;
      *(double *)&v67 = *(double *)&v67 + *(double *)&v68 + 8.0;
      objc_msgSend(v81, "setFrame:", v67, v68);
      v26 = (void *)MEMORY[0x24BDF6F90];
      v25 = MEMORY[0x24BDAC760];
      v57 = MEMORY[0x24BDAC760];
      v58 = -1073741824;
      v59 = 0;
      v60 = __95__CPSInstrumentClusterCardViewController__transitionFromViews_inView_horizontalSlideAnimation___block_invoke_4;
      v61 = &unk_24E26F140;
      v62 = v81;
      v63 = v65;
      v64 = v66;
      v51 = v25;
      v52 = -1073741824;
      v53 = 0;
      v54 = __95__CPSInstrumentClusterCardViewController__transitionFromViews_inView_horizontalSlideAnimation___block_invoke_5;
      v55 = &unk_24E26F168;
      v56 = v83;
      objc_msgSend(v26, "animateWithDuration:delay:options:animations:completion:", 0, &v57, &v51, 0.4, 0.0);
      objc_storeStrong((id *)&v56, 0);
      objc_storeStrong(&v62, 0);
    }
    objc_storeStrong((id *)&v75, 0);
    objc_storeStrong(&v74, 0);
    objc_storeStrong(&v78, 0);
  }
  else if (v81 && v83->_shouldUpdateContent)
  {
    v22 = -[CPSInstrumentClusterCardViewController platterViewController](v83, "platterViewController");
    v21 = -[UIViewController view](v22, "view");
    -[UIView layoutIfNeeded](v21, "layoutIfNeeded");

    objc_msgSend(v81, "frame");
    *(_QWORD *)&v49 = v13;
    *((_QWORD *)&v49 + 1) = v14;
    *(_QWORD *)&v50 = v15;
    *((_QWORD *)&v50 + 1) = v16;
    objc_msgSend(v81, "frame");
    v45 = v17;
    v47 = v18;
    v48 = v19;
    v46 = v20 - v19;
    objc_msgSend(v81, "setFrame:", v17, v20 - v19, v18, v19);
    v24 = (void *)MEMORY[0x24BDF6F90];
    v23 = MEMORY[0x24BDAC760];
    v37 = MEMORY[0x24BDAC760];
    v38 = -1073741824;
    v39 = 0;
    v40 = __95__CPSInstrumentClusterCardViewController__transitionFromViews_inView_horizontalSlideAnimation___block_invoke_6;
    v41 = &unk_24E26F140;
    v42 = v81;
    v43 = v49;
    v44 = v50;
    v31 = v23;
    v32 = -1073741824;
    v33 = 0;
    v34 = __95__CPSInstrumentClusterCardViewController__transitionFromViews_inView_horizontalSlideAnimation___block_invoke_7;
    v35 = &unk_24E26F168;
    v36 = v83;
    objc_msgSend(v24, "animateWithDuration:animations:completion:", &v37, &v31, 0.35);
    objc_storeStrong((id *)&v36, 0);
    objc_storeStrong(&v42, 0);
  }
  objc_storeStrong(&v81, 0);
  objc_storeStrong(location, 0);
}

void __95__CPSInstrumentClusterCardViewController__transitionFromViews_inView_horizontalSlideAnimation___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  double v4;
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v17;
  int v18;
  int v19;
  uint64_t (*v20)(uint64_t);
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  int v25;
  int v26;
  uint64_t (*v27)(uint64_t);
  void *v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  double v34;
  double v35;
  double v36;
  double v37;
  id v38[4];
  id location[2];

  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v38[3] = a3;
  v38[2] = a4;
  v38[1] = (id)a1;
  v38[0] = (id)objc_msgSend(location[0], "snapshotViewAfterScreenUpdates:", 0);
  objc_msgSend(*(id *)(a1 + 32), "addSubview:", v38[0]);
  objc_msgSend(location[0], "frame");
  v34 = v4;
  v35 = v5;
  v36 = v6;
  v37 = v7;
  objc_msgSend(v38[0], "setFrame:", v4, v5, v6, v7);
  objc_msgSend(location[0], "removeFromSuperview");
  objc_msgSend(v38[0], "frame");
  *(_QWORD *)&v32 = v8;
  *((_QWORD *)&v32 + 1) = v9;
  *(_QWORD *)&v33 = v10;
  *((_QWORD *)&v33 + 1) = v11;
  if ((*(_BYTE *)(a1 + 48) & 1) != 0)
    *((double *)&v32 + 1) = *((double *)&v32 + 1) - *((double *)&v33 + 1) - 8.0;
  else
    *(double *)&v32 = *(double *)&v32 - *(double *)&v33 - 8.0;
  if ((*(_BYTE *)(a1 + 48) & 1) != 0 || (*(_BYTE *)(a1 + 49) & 1) != 0)
  {
    v13 = (void *)MEMORY[0x24BDF6F90];
    v12 = MEMORY[0x24BDAC760];
    v24 = MEMORY[0x24BDAC760];
    v25 = -1073741824;
    v26 = 0;
    v27 = __95__CPSInstrumentClusterCardViewController__transitionFromViews_inView_horizontalSlideAnimation___block_invoke_2;
    v28 = &unk_24E26F140;
    v29 = v38[0];
    v30 = v32;
    v31 = v33;
    v17 = v12;
    v18 = -1073741824;
    v19 = 0;
    v20 = __95__CPSInstrumentClusterCardViewController__transitionFromViews_inView_horizontalSlideAnimation___block_invoke_3;
    v21 = &unk_24E2712D8;
    v22 = v38[0];
    v23 = *(id *)(a1 + 40);
    objc_msgSend(v13, "animateWithDuration:animations:completion:", &v24, &v17, 0.35);
    objc_storeStrong(&v23, 0);
    objc_storeStrong(&v22, 0);
    objc_storeStrong(&v29, 0);
  }
  else
  {
    objc_msgSend(v38[0], "removeFromSuperview");
    objc_msgSend(*(id *)(a1 + 40), "_updateClientSafeArea");
  }
  objc_storeStrong(v38, 0);
  objc_storeStrong(location, 0);
}

uint64_t __95__CPSInstrumentClusterCardViewController__transitionFromViews_inView_horizontalSlideAnimation___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), a1, a1);
}

uint64_t __95__CPSInstrumentClusterCardViewController__transitionFromViews_inView_horizontalSlideAnimation___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  return objc_msgSend(*(id *)(a1 + 40), "_updateClientSafeArea");
}

uint64_t __95__CPSInstrumentClusterCardViewController__transitionFromViews_inView_horizontalSlideAnimation___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), a1, a1);
}

uint64_t __95__CPSInstrumentClusterCardViewController__transitionFromViews_inView_horizontalSlideAnimation___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateClientSafeArea");
}

uint64_t __95__CPSInstrumentClusterCardViewController__transitionFromViews_inView_horizontalSlideAnimation___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), a1, a1);
}

uint64_t __95__CPSInstrumentClusterCardViewController__transitionFromViews_inView_horizontalSlideAnimation___block_invoke_7(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateClientSafeArea");
}

- (void)setLayoutOverride:(unint64_t)a3
{
  CPSClusterPausedCardView *v3;
  BOOL v4;
  CPSInstrumentClusterCardLayout *v5;
  BOOL shouldUpdateContent;
  CPSInstrumentClusterCardLayout *v7;
  BOOL v8;
  char v9;
  CPSClusterManeuversCardView *v10;
  id location;
  unint64_t v12;
  SEL v13;
  CPSInstrumentClusterCardViewController *v14;

  v14 = self;
  v13 = a2;
  v12 = a3;
  self->_layoutOverride = a3;
  v7 = -[CPSInstrumentClusterCardViewController layout](v14, "layout");
  v8 = -[CPSInstrumentClusterCardLayout layoutForCard](v7, "layoutForCard") == v12;

  if (!v8)
  {
    v5 = -[CPSInstrumentClusterCardViewController layout](v14, "layout");
    shouldUpdateContent = 0;
    if (v5)
      shouldUpdateContent = v14->_shouldUpdateContent;

    if (shouldUpdateContent)
    {
      location = -[CPSInstrumentClusterCardViewController layout](v14, "layout");
      objc_msgSend(location, "setLayoutForCard:", v12);
      -[CPSInstrumentClusterCardViewController setLayout:](v14, "setLayout:", location);
      v3 = -[CPSInstrumentClusterCardViewController currentPausedCardView](v14, "currentPausedCardView");
      v9 = 0;
      v4 = 1;
      if (!v3)
      {
        v10 = -[CPSInstrumentClusterCardViewController currentManeuversCardView](v14, "currentManeuversCardView");
        v9 = 1;
        v4 = v10 != 0;
      }
      if ((v9 & 1) != 0)

      if (v4)
        -[CPSInstrumentClusterCardViewController _updateClientSafeArea](v14, "_updateClientSafeArea");
      objc_storeStrong(&location, 0);
    }
  }
}

- (void)viewController:(id)a3 didUpdateSafeAreaInsets:(UIEdgeInsets)a4
{
  CPSClusterEstimatesViewController *v4;
  CPSClusterEstimatesViewController *v5;
  BOOL v6;
  id location[2];
  CPSInstrumentClusterCardViewController *v8;
  UIEdgeInsets v9;

  v9 = a4;
  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = (CPSClusterEstimatesViewController *)location[0];
  v4 = -[CPSInstrumentClusterCardViewController estimatesViewController](v8, "estimatesViewController");
  v6 = v5 != v4;

  if (!v6)
    -[CPSInstrumentClusterCardViewController _updateClientSafeArea](v8, "_updateClientSafeArea");
  objc_storeStrong(location, 0);
}

- (CARScreenInfo)carScreenInfo
{
  return self->_carScreenInfo;
}

- (CPSInstrumentClusterCardLayout)layout
{
  return self->_layout;
}

- (BOOL)shouldUpdateContent
{
  return self->_shouldUpdateContent;
}

- (CPSSafeAreaDelegate)safeAreaDelegate
{
  return (CPSSafeAreaDelegate *)objc_loadWeakRetained((id *)&self->_safeAreaDelegate);
}

- (unint64_t)layoutOverride
{
  return self->_layoutOverride;
}

- (BOOL)showETA
{
  return self->_showETA;
}

- (UIEdgeInsets)currentClientInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  left = self->_currentClientInsets.left;
  top = self->_currentClientInsets.top;
  right = self->_currentClientInsets.right;
  bottom = self->_currentClientInsets.bottom;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setCurrentClientInsets:(UIEdgeInsets)a3
{
  self->_currentClientInsets = a3;
}

- (UIViewController)platterViewController
{
  return self->_platterViewController;
}

- (void)setPlatterViewController:(id)a3
{
  objc_storeStrong((id *)&self->_platterViewController, a3);
}

- (CPSClusterEstimatesViewController)estimatesViewController
{
  return self->_estimatesViewController;
}

- (void)setEstimatesViewController:(id)a3
{
  objc_storeStrong((id *)&self->_estimatesViewController, a3);
}

- (CPSClusterManeuversCardView)currentManeuversCardView
{
  return self->_currentManeuversCardView;
}

- (void)setCurrentManeuversCardView:(id)a3
{
  objc_storeStrong((id *)&self->_currentManeuversCardView, a3);
}

- (CPSClusterPausedCardView)currentPausedCardView
{
  return self->_currentPausedCardView;
}

- (void)setCurrentPausedCardView:(id)a3
{
  objc_storeStrong((id *)&self->_currentPausedCardView, a3);
}

- (BOOL)isMapContentOnly
{
  return self->_isMapContentOnly;
}

- (void)setIsMapContentOnly:(BOOL)a3
{
  self->_isMapContentOnly = a3;
}

- (BOOL)isRightHandDrive
{
  return self->_isRightHandDrive;
}

- (void)setIsRightHandDrive:(BOOL)a3
{
  self->_isRightHandDrive = a3;
}

- (BOOL)supportsVehicleData
{
  return self->_supportsVehicleData;
}

- (void)setSupportsVehicleData:(BOOL)a3
{
  self->_supportsVehicleData = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentPausedCardView, 0);
  objc_storeStrong((id *)&self->_currentManeuversCardView, 0);
  objc_storeStrong((id *)&self->_estimatesViewController, 0);
  objc_storeStrong((id *)&self->_platterViewController, 0);
  objc_destroyWeak((id *)&self->_safeAreaDelegate);
  objc_storeStrong((id *)&self->_layout, 0);
  objc_storeStrong((id *)&self->_carScreenInfo, 0);
}

@end
