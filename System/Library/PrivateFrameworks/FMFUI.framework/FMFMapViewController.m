@implementation FMFMapViewController

+ (CGSize)annotationImageSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 72.0;
  v3 = 72.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (FMFMapViewController)init
{
  void *v3;
  uint64_t v4;
  __CFString *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  FMFMapViewController *v9;
  objc_super v11;

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  v5 = CFSTR("FMFMapViewController_iPhone");
  if (v4 == 1)
    v5 = CFSTR("FMFMapViewController_iPad");
  v6 = (void *)MEMORY[0x24BDD1488];
  v7 = v5;
  objc_msgSend(v6, "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11.receiver = self;
  v11.super_class = (Class)FMFMapViewController;
  v9 = -[FMFMapViewController initWithNibName:bundle:](&v11, sel_initWithNibName_bundle_, v7, v8);

  -[FMFMapViewController initializeDefaults](v9, "initializeDefaults");
  return v9;
}

- (id)initSimpleMapWithDelegate:(id)a3 handles:(id)a4
{
  id v5;
  id v6;
  FMFMapViewController *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  objc_super v12;
  uint8_t buf[4];
  FMFMapViewController *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  const __CFString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v12.receiver = self;
  v12.super_class = (Class)FMFMapViewController;
  v5 = a4;
  v6 = a3;
  v7 = -[FMFMapViewController init](&v12, sel_init);
  -[FMFMapViewController setDelegate:](v7, "setDelegate:", v6, v12.receiver, v12.super_class);

  -[FMFMapViewController set_preloadedHandles:](v7, "set_preloadedHandles:", v5);
  -[FMFMapViewController setIsSimpleMap:](v7, "setIsSimpleMap:", 1);
  -[FMFMapViewController initializeDefaults](v7, "initializeDefaults");
  -[FMFMapViewController _generateDebugContext](v7, "_generateDebugContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMFMapViewController setDebugContext:](v7, "setDebugContext:", v8);

  LogCategory_Daemon();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    -[FMFMapViewController debugContext](v7, "debugContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v14 = v7;
    v15 = 2112;
    v16 = v10;
    v17 = 2112;
    v18 = CFSTR("-E2E");
    _os_log_impl(&dword_20DD58000, v9, OS_LOG_TYPE_DEFAULT, "⛳️FMFUI %@ {context=#%@}: init (simple%@)", buf, 0x20u);

  }
  return v7;
}

- (FMFMapViewController)initWithDelegate:(id)a3 handles:(id)a4
{
  id v6;
  id v7;
  FMFMapViewController *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v13;
  FMFMapViewController *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  const __CFString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  v8 = -[FMFMapViewController init](self, "init");
  -[FMFMapViewController setDelegate:](v8, "setDelegate:", v7);

  -[FMFMapViewController set_preloadedHandles:](v8, "set_preloadedHandles:", v6);
  -[FMFMapViewController _generateDebugContext](v8, "_generateDebugContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMFMapViewController setDebugContext:](v8, "setDebugContext:", v9);

  LogCategory_Daemon();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    -[FMFMapViewController debugContext](v8, "debugContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412802;
    v14 = v8;
    v15 = 2112;
    v16 = v11;
    v17 = 2112;
    v18 = CFSTR(" (-E2E)");
    _os_log_impl(&dword_20DD58000, v10, OS_LOG_TYPE_DEFAULT, "⛳️FMFUI %@ {context=#%@}: init%@", (uint8_t *)&v13, 0x20u);

  }
  return v8;
}

- (id)_generateDebugContext
{
  void *v2;
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x24BDD17C8];
  v5 = objc_msgSend(v3, "length");
  v6 = v3;
  if (v5 >= 0x19)
  {
    objc_msgSend(v3, "substringFromIndex:", 24);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@-%d"), v6, getpid());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 >= 0x19)

  return v7;
}

- (void)dealloc
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;
  uint8_t buf[4];
  FMFMapViewController *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  LogCategory_Daemon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[FMFMapViewController debugContext](self, "debugContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v9 = self;
    v10 = 2112;
    v11 = v4;
    _os_log_impl(&dword_20DD58000, v3, OS_LOG_TYPE_DEFAULT, "⛳️FMFUI %@ {context=#%@}: deinit", buf, 0x16u);

  }
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", self);

  -[FMFMapViewController destroySession](self, "destroySession");
  -[FMFMapViewController mapView](self, "mapView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDelegate:", 0);

  v7.receiver = self;
  v7.super_class = (Class)FMFMapViewController;
  -[FMFMapViewController dealloc](&v7, sel_dealloc);
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@: %p>"), objc_opt_class(), self);
}

- (void)initializeDefaults
{
  void *v3;
  void *v4;
  void *v5;

  +[FMAnnotationView setLargeAnnotationBorderVisible:](FMFAnnotationView, "setLargeAnnotationBorderVisible:", 0);
  +[FMAnnotationView setThickAnnotationBorder:](FMFAnnotationView, "setThickAnnotationBorder:", 1);
  -[FMFMapViewController _authorizeMonitoringLocation](self, "_authorizeMonitoringLocation");
  -[FMFMapViewController setShouldZoomToFitNewLocations:](self, "setShouldZoomToFitNewLocations:", 1);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_applicationDidBecomeActive_, *MEMORY[0x24BDF7510], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel_updateAllAnnotationsDueToAddressBookUpdate, CFSTR("AB_CHANGED_NOTIFICATION"), 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_mapTypeChangedNotification_, CFSTR("MAP_TYPE_DEFAULT_KEY"), 0);

  -[FMFMapViewController setEdgeInsets:](self, "setEdgeInsets:", 60.0, 42.0, 60.0, 42.0);
}

- (void)_authorizeMonitoringLocation
{
  void *v2;
  id v3;
  void *v4;

  v2 = (void *)_authorizeMonitoringLocation__locationManager;
  if (!_authorizeMonitoringLocation__locationManager)
  {
    v3 = objc_alloc_init(MEMORY[0x24BDBFA88]);
    v4 = (void *)_authorizeMonitoringLocation__locationManager;
    _authorizeMonitoringLocation__locationManager = (uint64_t)v3;

    v2 = (void *)_authorizeMonitoringLocation__locationManager;
  }
  if (!objc_msgSend(v2, "authorizationStatus"))
    objc_msgSend((id)_authorizeMonitoringLocation__locationManager, "requestWhenInUseAuthorization");
}

- (void)loadView
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  FMFRefreshBarButtonItem *v10;
  void *v11;
  void *v12;
  FMFRefreshBarButtonItem *refreshButton;
  void *v14;
  void *v15;
  objc_super v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v16.receiver = self;
  v16.super_class = (Class)FMFMapViewController;
  -[FMFMapViewController loadView](&v16, sel_loadView);
  -[FMFMapViewController set_isRenderingInitialMap:](self, "set_isRenderingInitialMap:", 1);
  if (-[FMFMapViewController isSimpleMap](self, "isSimpleMap"))
  {
    v3 = objc_alloc(MEMORY[0x24BDDB130]);
    -[FMFMapViewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "frame");
    v5 = (void *)objc_msgSend(v3, "initWithFrame:");
    -[FMFMapViewController setMapView:](self, "setMapView:", v5);

    -[FMFMapViewController mapView](self, "mapView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setShowsUserLocation:", 1);

    -[MKMapView setAutoresizingMask:](self->_mapView, "setAutoresizingMask:", 18);
    -[FMFMapViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", self->_mapView);

    -[FMFMapViewController cachedMapView](self, "cachedMapView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LogCategory_Daemon();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v8;
      _os_log_impl(&dword_20DD58000, v9, OS_LOG_TYPE_DEFAULT, "cachedMapView = %@", buf, 0xCu);
    }

  }
  else
  {
    if (!self->_refreshButton)
    {
      v10 = -[FMFRefreshBarButtonItem initWithTarget:action:]([FMFRefreshBarButtonItem alloc], "initWithTarget:action:", self, sel_refreshButtonTapped_);
      -[FMFMapViewController setRefreshButton:](self, "setRefreshButton:", v10);

    }
    -[FMFMapViewController titleViewForSelectedHandle](self, "titleViewForSelectedHandle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMFMapViewController navigationItem](self, "navigationItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTitleView:", v11);

    refreshButton = self->_refreshButton;
    -[FMFMapViewController navigationItem](self, "navigationItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setRightBarButtonItem:", refreshButton);
  }

  -[FMFMapViewController mapView](self, "mapView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setShowsAttribution:", 0);

  if (-[FMFMapViewController isSimpleMap](self, "isSimpleMap"))
  {
    -[FMFMapViewController mapView](self, "mapView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_setEdgeInsets:", *MEMORY[0x24BDF7718], *(double *)(MEMORY[0x24BDF7718] + 8), *(double *)(MEMORY[0x24BDF7718] + 16), *(double *)(MEMORY[0x24BDF7718] + 24));

  }
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FMFMapViewController;
  -[FMFMapViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[FMFMapViewController loadDelegate](self, "loadDelegate");
  -[FMFMapViewController enablePreloadedHandles](self, "enablePreloadedHandles");
  -[FMFMapViewController setupToolbarItems](self, "setupToolbarItems");
}

- (void)setupToolbarItems
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[6];

  v12[5] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("DIRECTIONS"), &stru_24C878158, CFSTR("LocalizableUI"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithTitle:style:target:action:", v4, 0, self, sel_getDirections);
  -[FMFMapViewController setDirectionsBarButtonItem:](self, "setDirectionsBarButtonItem:", v5);

  objc_msgSend(MEMORY[0x24BDF6880], "buttonWithType:", 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addTarget:action:forControlEvents:", self, sel_infoButtonTapped_, 64);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithCustomView:", v6);
  -[FMFMapViewController setInfoBarButtonItem:](self, "setInfoBarButtonItem:", v7);

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
  -[FMFMapViewController userTrackingButtonItem](self, "userTrackingButtonItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v10;
  v12[1] = v8;
  v12[2] = self->_directionsBarButtonItem;
  v12[3] = v9;
  v12[4] = self->_infoBarButtonItem;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[FMFMapViewController setToolbarItems:](self, "setToolbarItems:", v11);
}

- (FMFNoLocationView)noLocationView
{
  FMFNoLocationView *noLocationView;
  NSObject *v4;
  FMFNoLocationView *v5;
  FMFNoLocationView *v6;
  void *v7;
  void *v8;
  void *v9;
  FMFNoLocationView *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  FMFNoLocationView *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  FMFNoLocationView *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  FMFNoLocationView *v25;
  void *v26;
  void *v27;
  uint8_t v29[16];

  noLocationView = self->_noLocationView;
  if (!noLocationView)
  {
    LogCategory_Daemon();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v29 = 0;
      _os_log_impl(&dword_20DD58000, v4, OS_LOG_TYPE_DEFAULT, "Creating no location view", v29, 2u);
    }

    v5 = [FMFNoLocationView alloc];
    v6 = -[FMFNoLocationView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    -[FMFMapViewController setNoLocationView:](self, "setNoLocationView:", v6);

    -[FMFNoLocationView setDelegate:](self->_noLocationView, "setDelegate:", self);
    -[FMFMapViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", self->_noLocationView);

    -[FMFNoLocationView setTranslatesAutoresizingMaskIntoConstraints:](self->_noLocationView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[FMFMapViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x24BDD1628];
    v10 = self->_noLocationView;
    -[FMFMapViewController mapView](self, "mapView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v10, 3, 0, v11, 3, 1.0, 0.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addConstraint:", v12);

    -[FMFMapViewController view](self, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x24BDD1628];
    v15 = self->_noLocationView;
    -[FMFMapViewController mapView](self, "mapView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v15, 4, 0, v16, 4, 1.0, 0.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addConstraint:", v17);

    -[FMFMapViewController view](self, "view");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)MEMORY[0x24BDD1628];
    v20 = self->_noLocationView;
    -[FMFMapViewController mapView](self, "mapView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v20, 1, 0, v21, 1, 1.0, 0.0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addConstraint:", v22);

    -[FMFMapViewController view](self, "view");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)MEMORY[0x24BDD1628];
    v25 = self->_noLocationView;
    -[FMFMapViewController mapView](self, "mapView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v25, 2, 0, v26, 2, 1.0, 0.0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addConstraint:", v27);

    noLocationView = self->_noLocationView;
  }
  return noLocationView;
}

- (void)setIsMapCenteringDisabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  self->_isMapCenteringDisabled = a3;
  -[FMFMapViewController mapViewDelegate](self, "mapViewDelegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsMapCenteringDisabled:", v3);

}

- (double)nonLiveAnimationDuration
{
  return 0.25;
}

- (double)liveAnimationDuration
{
  return 2.0;
}

- (void)setEdgeInsets:(UIEdgeInsets)a3
{
  FMFNoLocationView *noLocationView;

  self->_edgeInsets = a3;
  noLocationView = self->_noLocationView;
  if (noLocationView)
    -[FMFNoLocationView updateConstriantsForInsets](noLocationView, "updateConstriantsForInsets");
}

- (UIImageView)cachedMapView
{
  UIImageView *cachedMapView;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  UIImageView *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  UIImageView *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  UIImageView *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  UIImageView *v24;
  void *v25;
  void *v26;

  cachedMapView = self->_cachedMapView;
  if (!cachedMapView)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AE8]), "initWithImage:", 0);
    -[FMFMapViewController setCachedMapView:](self, "setCachedMapView:", v4);

    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setBackgroundColor:](self->_cachedMapView, "setBackgroundColor:", v5);

    -[FMFMapViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", self->_cachedMapView);

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_cachedMapView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[FMFMapViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x24BDD1628];
    v9 = self->_cachedMapView;
    -[FMFMapViewController view](self, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v9, 3, 0, v10, 3, 1.0, 0.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addConstraint:", v11);

    -[FMFMapViewController view](self, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x24BDD1628];
    v14 = self->_cachedMapView;
    -[FMFMapViewController view](self, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v14, 4, 0, v15, 4, 1.0, 0.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addConstraint:", v16);

    -[FMFMapViewController view](self, "view");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)MEMORY[0x24BDD1628];
    v19 = self->_cachedMapView;
    -[FMFMapViewController view](self, "view");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v19, 1, 0, v20, 1, 1.0, 0.0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addConstraint:", v21);

    -[FMFMapViewController view](self, "view");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)MEMORY[0x24BDD1628];
    v24 = self->_cachedMapView;
    -[FMFMapViewController view](self, "view");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v24, 2, 0, v25, 2, 1.0, 0.0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addConstraint:", v26);

    cachedMapView = self->_cachedMapView;
  }
  return cachedMapView;
}

- (UIBarButtonItem)userTrackingButtonItem
{
  UIBarButtonItem *userTrackingButtonItem;
  void *v4;
  UIBarButtonItem *v5;
  UIBarButtonItem *v6;

  userTrackingButtonItem = self->_userTrackingButtonItem;
  if (!userTrackingButtonItem)
  {
    objc_msgSend(MEMORY[0x24BDDB1F8], "buttonWithUserTrackingView:", self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMFMapViewController setUserTrackingButton:](self, "setUserTrackingButton:", v4);
    v5 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithCustomView:", v4);
    v6 = self->_userTrackingButtonItem;
    self->_userTrackingButtonItem = v5;

    -[FMFMapViewController _updateLocationButtonEnabled](self, "_updateLocationButtonEnabled");
    userTrackingButtonItem = self->_userTrackingButtonItem;
  }
  return userTrackingButtonItem;
}

- (id)openInAppURL
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  const __CFString *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("fmf1://friend/"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMFMapViewController _internalHandlesShowingLocations](self, "_internalHandlesShowingLocations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "valueForKey:", CFSTR("identifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "componentsJoinedByString:", CFSTR(","));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)MEMORY[0x24BDBCF48];
    v9 = (void *)MEMORY[0x24BDD17C8];
    v10 = objc_msgSend(v5, "count");
    v11 = CFSTR("fmf1://friends/");
    if (v10 == 1)
      v11 = CFSTR("fmf1://friend/");
    objc_msgSend(v9, "stringWithFormat:", CFSTR("%@%@"), v11, v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "URLWithString:", v12);
    v13 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v13;
  }
  LogCategory_Daemon();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v17 = v3;
    _os_log_impl(&dword_20DD58000, v14, OS_LOG_TYPE_DEFAULT, "open URL for handles: %@", buf, 0xCu);
  }

  return v3;
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v3 = a3;
  -[FMFMapViewController setViewWillAppearCalled:](self, "setViewWillAppearCalled:", 1);
  if (-[FMFMapViewController isSimpleMap](self, "isSimpleMap"))
  {
    -[FMFMapViewController cachedMapView](self, "cachedMapView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAlpha:", 1.0);

    +[FMFMapImageCache sharedInstance](FMFMapImageCache, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMFMapViewController handlesShowingLocations](self, "handlesShowingLocations");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cachedMapForHandles:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMFMapViewController cachedMapView](self, "cachedMapView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setImage:", v8);

  }
  else
  {
    -[FMFMapViewController navigationController](self, "navigationController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMFMapViewController setWasToolbarPreviouslyHidden:](self, "setWasToolbarPreviouslyHidden:", objc_msgSend(v10, "isToolbarHidden"));

    -[FMFMapViewController navigationController](self, "navigationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setToolbarHidden:animated:", 0, 1);
  }

  -[FMFMapViewController set_blockDidReceiveAnimation:](self, "set_blockDidReceiveAnimation:", 1);
  v11.receiver = self;
  v11.super_class = (Class)FMFMapViewController;
  -[FMFMapViewController viewWillAppear:](&v11, sel_viewWillAppear_, v3);
  -[FMFMapViewController viewWillAppearWillMoveToWindowSetup](self, "viewWillAppearWillMoveToWindowSetup");
}

- (void)viewWillAppearWillMoveToWindowSetup
{
  unint64_t v3;
  void *v4;
  _QWORD block[5];

  v3 = -[FMFMapViewController defaultMapType](self, "defaultMapType");
  -[FMFMapViewController mapView](self, "mapView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMapType:", v3);

  -[FMFMapViewController addHandlesToSession](self, "addHandlesToSession");
  -[FMFMapViewController loadCachedLocationsForHandles](self, "loadCachedLocationsForHandles");
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__FMFMapViewController_viewWillAppearWillMoveToWindowSetup__block_invoke;
  block[3] = &unk_24C877CC8;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  -[FMFMapViewController setViewWillAppearCalled:](self, "setViewWillAppearCalled:", 1);
  -[FMFMapViewController updateNoLocationView:](self, "updateNoLocationView:", 1);
}

void __59__FMFMapViewController_viewWillAppearWillMoveToWindowSetup__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "mapViewDelegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "mapView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "zoomToFitAnnotationsForMapView:includeMe:duration:", v2, objc_msgSend(*(id *)(a1 + 32), "shouldZoomToFitMeAndLocations"), 0.0);

}

- (void)applicationDidBecomeActive:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  LogCategory_Daemon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_20DD58000, v4, OS_LOG_TYPE_DEFAULT, "Received application did become active notification, adding handles to session to kick a refresh cycle", v5, 2u);
  }

  -[FMFMapViewController addHandlesToSession](self, "addHandlesToSession");
  -[FMFMapViewController _updateLocationButtonEnabled](self, "_updateLocationButtonEnabled");
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  dispatch_time_t v6;
  _QWORD block[5];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)FMFMapViewController;
  -[FMFMapViewController viewDidAppear:](&v8, sel_viewDidAppear_, a3);
  -[FMFMapViewController mapViewDelegate](self, "mapViewDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMFMapViewController mapView](self, "mapView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "zoomToFitAnnotationsForMapView:includeMe:duration:", v5, -[FMFMapViewController shouldZoomToFitMeAndLocations](self, "shouldZoomToFitMeAndLocations"), 0.0);

  -[FMFMapViewController set_blockDidReceiveAnimation:](self, "set_blockDidReceiveAnimation:", 0);
  if (-[FMFMapViewController isSimpleMap](self, "isSimpleMap"))
  {
    v6 = dispatch_time(0, 1500000000);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __38__FMFMapViewController_viewDidAppear___block_invoke;
    block[3] = &unk_24C877CC8;
    block[4] = self;
    dispatch_after(v6, MEMORY[0x24BDAC9B8], block);
  }
}

uint64_t __38__FMFMapViewController_viewDidAppear___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "hideCachedMap");
}

- (void)willMoveToParentViewController:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FMFMapViewController;
  -[FMFMapViewController willMoveToParentViewController:](&v5, sel_willMoveToParentViewController_, a3);
  -[FMFMapViewController noLocationView](self, "noLocationView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateConstriantsForInsets");

  -[FMFMapViewController viewWillAppearWillMoveToWindowSetup](self, "viewWillAppearWillMoveToWindowSetup");
}

- (void)didMoveToParentViewController:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FMFMapViewController;
  -[FMFMapViewController didMoveToParentViewController:](&v3, sel_didMoveToParentViewController_, a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  objc_super v9;
  uint8_t buf[16];

  v3 = a3;
  if (-[FMFMapViewController isSimpleMap](self, "isSimpleMap")
    && !-[FMFMapViewController _isRenderingInitialMap](self, "_isRenderingInitialMap"))
  {
    LogCategory_Daemon();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DD58000, v6, OS_LOG_TYPE_DEFAULT, "Saving cached map", buf, 2u);
    }

    +[FMFMapImageCache sharedInstance](FMFMapImageCache, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMFMapViewController mapView](self, "mapView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMFMapViewController handlesShowingLocations](self, "handlesShowingLocations");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cacheMap:forHandles:", v7, v8);

  }
  else
  {
    -[FMFMapViewController navigationController](self, "navigationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setToolbarHidden:animated:", -[FMFMapViewController wasToolbarPreviouslyHidden](self, "wasToolbarPreviouslyHidden"), 1);
  }

  -[FMFNoLocationView setBlockLabelUpdates:](self->_noLocationView, "setBlockLabelUpdates:", 1);
  v9.receiver = self;
  v9.super_class = (Class)FMFMapViewController;
  -[FMFMapViewController viewWillDisappear:](&v9, sel_viewWillDisappear_, v3);
  -[FMFMapViewController removeHandlesFromSession](self, "removeHandlesFromSession");
  -[FMFMapViewController destroySession](self, "destroySession");
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FMFMapViewController;
  -[FMFMapViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[FMFNoLocationView setBlockLabelUpdates:](self->_noLocationView, "setBlockLabelUpdates:", 0);
}

- (void)addHandlesToSession
{
  void *v3;
  id v4;

  if (!-[FMFMapViewController _refreshingIsPaused](self, "_refreshingIsPaused"))
  {
    -[FMFMapViewController fmfSession](self, "fmfSession");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[FMFMapViewController _internalHandlesShowingLocations](self, "_internalHandlesShowingLocations");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addHandles:", v3);

  }
}

- (void)removeHandlesFromSession
{
  void *v3;
  id v4;

  -[FMFMapViewController fmfSession](self, "fmfSession");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[FMFMapViewController _internalHandlesShowingLocations](self, "_internalHandlesShowingLocations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeHandles:", v3);

}

- (void)destroySession
{
  FMFSession *fmfSession;

  -[FMFSession invalidate](self->_fmfSession, "invalidate");
  -[FMFSession setDelegate:](self->_fmfSession, "setDelegate:", 0);
  fmfSession = self->_fmfSession;
  self->_fmfSession = 0;

}

- (void)loadDelegate
{
  void *v3;
  NSObject *v4;
  FMFMapViewDelegateInternal *v5;
  void *v6;
  FMFMapViewDelegateInternal *v7;
  FMFMapViewDelegateInternal *mapViewDelegate;
  void *v9;
  _BOOL8 v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (!self->_mapViewDelegate)
  {
    -[FMFMapViewController view](self, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LogCategory_Daemon();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412290;
      v13 = v3;
      _os_log_impl(&dword_20DD58000, v4, OS_LOG_TYPE_DEFAULT, "mapView = %@", (uint8_t *)&v12, 0xCu);
    }

    v5 = [FMFMapViewDelegateInternal alloc];
    -[FMFMapViewController mapView](self, "mapView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[FMFMapViewDelegateInternal initWithDelegate:mapView:](v5, "initWithDelegate:mapView:", self, v6);
    -[FMFMapViewController setMapViewDelegate:](self, "setMapViewDelegate:", v7);

    mapViewDelegate = self->_mapViewDelegate;
    -[FMFMapViewController mapView](self, "mapView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setDelegate:", mapViewDelegate);

    v10 = -[FMFMapViewController isMapCenteringDisabled](self, "isMapCenteringDisabled");
    -[FMFMapViewController mapViewDelegate](self, "mapViewDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setIsMapCenteringDisabled:", v10);

  }
}

- (void)enablePreloadedHandles
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  LogCategory_Daemon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[FMFMapViewController _preloadedHandles](self, "_preloadedHandles");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v11 = v4;
    _os_log_impl(&dword_20DD58000, v3, OS_LOG_TYPE_DEFAULT, "enablePreloadedHandles (%@)", buf, 0xCu);

  }
  -[FMFMapViewController _preloadedHandles](self, "_preloadedHandles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[FMFMapViewController fmfSession](self, "fmfSession");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "getHandlesSharingLocationsWithMe");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "count"))
    {
      -[FMFMapViewController _enablePreloadedHandles:](self, "_enablePreloadedHandles:", v7);
    }
    else
    {
      -[FMFMapViewController fmfSession](self, "fmfSession");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = __46__FMFMapViewController_enablePreloadedHandles__block_invoke;
      v9[3] = &unk_24C877FF0;
      v9[4] = self;
      objc_msgSend(v8, "getHandlesSharingLocationsWithMe:", v9);

    }
  }
}

uint64_t __46__FMFMapViewController_enablePreloadedHandles__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_enablePreloadedHandles:", a2);
}

- (void)_enablePreloadedHandles:(id)a3
{
  uint64_t i;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t j;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  FMFMapViewController *v15;
  id obj;
  id v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  _QWORD block[5];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v19 = a3;
  v17 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v15 = self;
  -[FMFMapViewController _preloadedHandles](self, "_preloadedHandles");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v20)
  {
    v18 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v27 != v18)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        v6 = v19;
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
        if (v7)
        {
          v8 = v7;
          v9 = *(_QWORD *)v23;
          while (2)
          {
            for (j = 0; j != v8; ++j)
            {
              if (*(_QWORD *)v23 != v9)
                objc_enumerationMutation(v6);
              v11 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * j);
              objc_msgSend(v5, "identifier");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "identifier");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v14 = objc_msgSend(v12, "isEqualToString:", v13);

              if (v14)
              {
                objc_msgSend(v17, "addObject:", v11);
                goto LABEL_16;
              }
            }
            v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
            if (v8)
              continue;
            break;
          }
        }
LABEL_16:

      }
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v20);
  }

  -[FMFMapViewController startShowingLocationsForHandles:](v15, "startShowingLocationsForHandles:", v17);
  -[FMFMapViewController set_internalHandlesShowingLocations:](v15, "set_internalHandlesShowingLocations:", v17);
  -[FMFMapViewController set_preloadedHandles:](v15, "set_preloadedHandles:", 0);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__FMFMapViewController__enablePreloadedHandles___block_invoke;
  block[3] = &unk_24C877CC8;
  block[4] = v15;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __48__FMFMapViewController__enablePreloadedHandles___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "loadCachedLocationsForHandles");
}

- (void)loadCachedLocationsForHandles
{
  void *v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  FMFMapViewController *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  void *v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[FMFMapViewController handlesShowingLocations](self, "handlesShowingLocations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v26, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v17;
    *(_QWORD *)&v5 = 138412802;
    v15 = v5;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v3);
        v9 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v8);
        -[FMFMapViewController fmfSession](self, "fmfSession", v15);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "cachedLocationForHandle:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        LogCategory_Daemon();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = v15;
          v21 = self;
          v22 = 2112;
          v23 = v9;
          v24 = 2112;
          v25 = v11;
          _os_log_impl(&dword_20DD58000, v12, OS_LOG_TYPE_INFO, "⛳️FMFUI %@: cached location for %@: %@", buf, 0x20u);
        }

        if (v11)
        {
          -[FMFMapViewController updateMapWithNewLocation:animated:](self, "updateMapWithNewLocation:animated:", v11, 0);
          -[FMFMapViewController updateRefreshForLocation:](self, "updateRefreshForLocation:", v11);
          -[FMFMapViewController _updateTitleViewLocation:](self, "_updateTitleViewLocation:", v11);
        }

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v26, 16);
    }
    while (v6);
  }

  -[FMFMapViewController mapViewDelegate](self, "mapViewDelegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMFMapViewController mapView](self, "mapView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "zoomToFitAnnotationsForMapView:includeMe:duration:", v14, -[FMFMapViewController shouldZoomToFitMeAndLocations](self, "shouldZoomToFitMeAndLocations"), 0.0);

}

- (void)didReceiveMemoryWarning
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)FMFMapViewController;
  -[FMFMapViewController didReceiveMemoryWarning](&v2, sel_didReceiveMemoryWarning);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FMFMapViewController;
  -[FMFMapViewController viewWillTransitionToSize:withTransitionCoordinator:](&v6, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, a3.width, a3.height);
  -[FMFMapViewController noLocationView](self, "noLocationView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateConstriantsForInsets");

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FMFMapViewController;
  -[FMFMapViewController viewWillLayoutSubviews](&v4, sel_viewWillLayoutSubviews);
  -[FMFMapViewController noLocationView](self, "noLocationView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateConstriantsForInsets");

}

- (void)updateNoLocationView:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  NSObject *v6;
  _BOOL4 v7;
  _BOOL4 v8;
  void *v9;
  double v10;
  void *v11;
  double v12;
  _BOOL4 v13;
  NSObject *v14;
  double v15;
  NSObject *v16;
  _BOOL4 v17;
  double v18;
  NSObject *v19;
  void *v20;
  _QWORD v21[6];
  _QWORD v22[6];
  uint8_t buf[4];
  _DWORD v24[7];

  v3 = a3;
  *(_QWORD *)&v24[5] = *MEMORY[0x24BDAC8D0];
  LogCategory_Daemon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    v24[0] = v3;
    LOWORD(v24[1]) = 1024;
    *(_DWORD *)((char *)&v24[1] + 2) = -[FMFMapViewController canShowNoLocation](self, "canShowNoLocation");
    _os_log_impl(&dword_20DD58000, v5, OS_LOG_TYPE_DEFAULT, "updateNoLocationView appearing(%d) canShowNoLocation (%d)", buf, 0xEu);
  }

  if (-[FMFMapViewController canShowNoLocation](self, "canShowNoLocation"))
  {
    LogCategory_Daemon();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = -[FMFMapViewController mapHasUserLocations](self, "mapHasUserLocations");
      *(_DWORD *)buf = 67109120;
      v24[0] = v7;
      _os_log_impl(&dword_20DD58000, v6, OS_LOG_TYPE_DEFAULT, "Setting no location view visible: %d", buf, 8u);
    }

    v8 = -[FMFMapViewController mapHasUserLocations](self, "mapHasUserLocations");
    -[FMFMapViewController noLocationView](self, "noLocationView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "alpha");
    if (v10 != 0.0 || v8)
    {
      -[FMFMapViewController noLocationView](self, "noLocationView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "alpha");
      v13 = v12 == 1.0 && v8;

      if (!v13)
      {
        LogCategory_Daemon();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_20DD58000, v19, OS_LOG_TYPE_DEFAULT, "FMFMapViewController : Not animating map", buf, 2u);
        }

        goto LABEL_30;
      }
    }
    else
    {

    }
    LogCategory_Daemon();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DD58000, v14, OS_LOG_TYPE_DEFAULT, "FMFMapViewController : Animating map", buf, 2u);
    }

    if (-[FMFMapViewController mapHasUserLocations](self, "mapHasUserLocations"))
      v15 = 0.0;
    else
      v15 = 1.0;
    LogCategory_Daemon();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v17)
      {
        *(_DWORD *)buf = 134217984;
        *(double *)v24 = v15;
        _os_log_impl(&dword_20DD58000, v16, OS_LOG_TYPE_DEFAULT, "FMFMapViewController : Appearing : Animating no location view %f", buf, 0xCu);
      }

      v22[0] = MEMORY[0x24BDAC760];
      v22[1] = 3221225472;
      v22[2] = __45__FMFMapViewController_updateNoLocationView___block_invoke;
      v22[3] = &unk_24C878018;
      v22[4] = self;
      *(double *)&v22[5] = v15;
      objc_msgSend(MEMORY[0x24BDF6F90], "performWithoutAnimation:", v22);
    }
    else
    {
      if (v17)
      {
        *(_DWORD *)buf = 134217984;
        *(double *)v24 = v15;
        _os_log_impl(&dword_20DD58000, v16, OS_LOG_TYPE_DEFAULT, "FMFMapViewController : Animating no location view %f", buf, 0xCu);
      }

      v18 = 0.75;
      if (!v8)
        -[FMFMapViewController nonLiveAnimationDuration](self, "nonLiveAnimationDuration", 0.75);
      v21[0] = MEMORY[0x24BDAC760];
      v21[1] = 3221225472;
      v21[2] = __45__FMFMapViewController_updateNoLocationView___block_invoke_94;
      v21[3] = &unk_24C878018;
      v21[4] = self;
      *(double *)&v21[5] = v15;
      objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:animations:", v21, v18);
    }
LABEL_30:
    -[FMFMapViewController noLocationView](self, "noLocationView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "updateLabel");

  }
}

void __45__FMFMapViewController_updateNoLocationView___block_invoke(uint64_t a1)
{
  double v1;
  id v2;

  v1 = *(double *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "noLocationView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", v1);

}

void __45__FMFMapViewController_updateNoLocationView___block_invoke_94(uint64_t a1)
{
  double v1;
  id v2;

  v1 = *(double *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "noLocationView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", v1);

}

- (BOOL)mapHasUserLocations
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[FMFMapViewController mapView](self, "mapView", 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "annotations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v3);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

- (void)updateMapWithNewLocation:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  BOOL v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  NSObject *v27;
  void *v28;
  double v29;
  void *v30;
  uint64_t v31;
  void *v32;
  _QWORD v33[6];
  _QWORD v34[4];
  id v35;
  id v36;
  FMFMapViewController *v37;
  _QWORD block[5];
  id v39;
  uint8_t buf[4];
  FMFMapViewController *v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v4 = a4;
  v44 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(v6, "handle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMFMapViewController locationOnMapForHandle:enforceServerId:](self, "locationOnMapForHandle:enforceServerId:", v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "location");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v8)
  {
    if (v9)
    {
      objc_msgSend(v6, "handle");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "serverId");
      v17 = objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        v18 = (void *)v17;
        v19 = -[FMFMapViewController isLocationAlreadyOnMap:](self, "isLocationAlreadyOnMap:", v6);

        if (!v19)
        {
          LogCategory_Daemon();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v6, "description");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v41 = self;
            v42 = 2112;
            v43 = v21;
            _os_log_impl(&dword_20DD58000, v20, OS_LOG_TYPE_DEFAULT, "⛳️FMFUI %@: update map (add annotation) with: %@", buf, 0x16u);

          }
          objc_msgSend(v6, "updateLocation:", v6);
          -[FMFMapViewController mapView](self, "mapView");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "addAnnotation:", v6);

          -[FMFMapViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_selectAnnotationIfSingleFriend_, v6, 0.5);
          block[0] = MEMORY[0x24BDAC760];
          block[1] = 3221225472;
          block[2] = __58__FMFMapViewController_updateMapWithNewLocation_animated___block_invoke;
          block[3] = &unk_24C877D90;
          block[4] = self;
          v39 = v6;
          dispatch_async(MEMORY[0x24BDAC9B8], block);
          v23 = v39;
          goto LABEL_26;
        }
      }
      else
      {

      }
    }
LABEL_18:
    if (!v4)
    {
      objc_msgSend(v8, "updateLocation:", v6);
      LogCategory_Daemon();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v8, "description");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v41 = self;
        v42 = 2112;
        v43 = v28;
        _os_log_impl(&dword_20DD58000, v27, OS_LOG_TYPE_DEFAULT, "⛳️FMFUI %@: update map with: %@", buf, 0x16u);

      }
      goto LABEL_27;
    }
    if (objc_msgSend(v6, "locationType") == 2)
      -[FMFMapViewController liveAnimationDuration](self, "liveAnimationDuration");
    else
      -[FMFMapViewController nonLiveAnimationDuration](self, "nonLiveAnimationDuration");
    v29 = v26;
    v30 = (void *)MEMORY[0x24BDF6F90];
    v31 = MEMORY[0x24BDAC760];
    v34[0] = MEMORY[0x24BDAC760];
    v34[1] = 3221225472;
    v34[2] = __58__FMFMapViewController_updateMapWithNewLocation_animated___block_invoke_98;
    v34[3] = &unk_24C877E80;
    v35 = v8;
    v36 = v6;
    v37 = self;
    v33[0] = v31;
    v33[1] = 3221225472;
    v33[2] = __58__FMFMapViewController_updateMapWithNewLocation_animated___block_invoke_99;
    v33[3] = &unk_24C878040;
    v33[4] = self;
    *(double *)&v33[5] = v29;
    objc_msgSend(v30, "animateWithDuration:delay:options:animations:completion:", 196614, v34, v33, v29, 0.0);

    v23 = v35;
LABEL_26:

LABEL_27:
    -[FMFMapViewController mapViewDelegate](self, "mapViewDelegate");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMFMapViewController mapView](self, "mapView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "updateOverlaysForAnnotationMove:mapView:", v6, v32);

    goto LABEL_28;
  }

  LogCategory_Daemon();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v12)
    {
      objc_msgSend(v6, "description");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v41 = self;
      v42 = 2112;
      v43 = v13;
      _os_log_impl(&dword_20DD58000, v11, OS_LOG_TYPE_DEFAULT, "⛳️FMFUI %@: update map (annotation) with: %@", buf, 0x16u);

    }
    -[FMFMapViewController mapView](self, "mapView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "viewForAnnotation:", v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v15, "updateWithLocation:", v6);

    goto LABEL_18;
  }
  if (v12)
  {
    objc_msgSend(v6, "description");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v41 = self;
    v42 = 2112;
    v43 = v24;
    _os_log_impl(&dword_20DD58000, v11, OS_LOG_TYPE_DEFAULT, "⛳️FMFUI %@: update map (remove annotation) with: %@", buf, 0x16u);

  }
  -[FMFMapViewController mapView](self, "mapView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "removeAnnotation:", v8);
LABEL_28:

  -[FMFMapViewController updateNoLocationView:](self, "updateNoLocationView:", !v4);
}

void __58__FMFMapViewController_updateMapWithNewLocation_animated___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "mapView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewForAnnotation:", *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v3, "updateWithLocation:", *(_QWORD *)(a1 + 40));

}

void __58__FMFMapViewController_updateMapWithNewLocation_animated___block_invoke_98(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "updateLocation:", *(_QWORD *)(a1 + 40));
  LogCategory_Daemon();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "description");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412546;
    v6 = v3;
    v7 = 2112;
    v8 = v4;
    _os_log_impl(&dword_20DD58000, v2, OS_LOG_TYPE_DEFAULT, "⛳️FMFUI %@: update map animated with: %@", (uint8_t *)&v5, 0x16u);

  }
}

void __58__FMFMapViewController_updateMapWithNewLocation_animated___block_invoke_99(uint64_t a1)
{
  void *v2;
  id v3;

  if (objc_msgSend(*(id *)(a1 + 32), "shouldZoomToFitNewLocations"))
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "_blockDidReceiveAnimation") & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "mapViewDelegate");
      v3 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "mapView");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "zoomToFitAnnotationsForMapView:includeMe:duration:", v2, objc_msgSend(*(id *)(a1 + 32), "shouldZoomToFitMeAndLocations"), *(double *)(a1 + 40));

    }
  }
}

- (void)recenterMap
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSObject *v13;
  double v14;
  double v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  FMFMapViewController *v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  -[FMFMapViewController mapView](self, "mapView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "annotations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
  v7 = v5;
  if (!v6)
  {
LABEL_14:

    goto LABEL_15;
  }
  v8 = v6;
  v9 = 0;
  v10 = *(_QWORD *)v18;
  do
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v18 != v10)
        objc_enumerationMutation(v5);
      v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v9 |= objc_msgSend(v12, "locationType", (_QWORD)v17) == 2;
    }
    v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
  }
  while (v8);

  if ((v9 & 1) != 0)
  {
    LogCategory_Daemon();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v22 = self;
      _os_log_impl(&dword_20DD58000, v13, OS_LOG_TYPE_DEFAULT, "⛳️FMFUI %@: recentering map", buf, 0xCu);
    }

    -[FMFMapViewController nonLiveAnimationDuration](self, "nonLiveAnimationDuration");
    v15 = v14;
    -[FMFMapViewController mapViewDelegate](self, "mapViewDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMFMapViewController mapView](self, "mapView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "zoomToFitAnnotationsForMapView:includeMe:duration:", v16, -[FMFMapViewController shouldZoomToFitMeAndLocations](self, "shouldZoomToFitMeAndLocations"), v15);

    goto LABEL_14;
  }
LABEL_15:

}

- (void)setupRecenterMapTimer
{
  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_recenterMap, self);
  -[FMFMapViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_recenterMap, self, 5.0);
}

- (BOOL)isLocationAlreadyOnMap:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v16 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[FMFMapViewController mapView](self, "mapView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "annotations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v9, "handle");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "serverId");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "handle");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "serverId");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v11, "isEqualToString:", v13);

          if ((v14 & 1) != 0)
          {
            LOBYTE(v6) = 1;
            goto LABEL_12;
          }
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_12:

  return v6;
}

- (BOOL)canSelectAnnotation:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[FMFMapViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v6 = objc_msgSend(v5, "canSelectAnnotation:", v4);
  else
    v6 = 1;

  return v6;
}

- (void)selectAnnotationIfSingleForMac
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (-[FMFMapViewController singleAnnotationOnMap](self, "singleAnnotationOnMap"))
  {
    -[FMFMapViewController mapView](self, "mapView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "annotations");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0
            && -[FMFMapViewController canSelectAnnotation:](self, "canSelectAnnotation:", v10, (_QWORD)v12))
          {
            -[FMFMapViewController mapViewDelegate](self, "mapViewDelegate");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "selectAnnotation:", v10);

            goto LABEL_14;
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v7)
          continue;
        break;
      }
    }
LABEL_14:

  }
  else
  {
    -[FMFMapViewController deselectAllAnnotations](self, "deselectAllAnnotations");
  }
}

- (void)deselectAllAnnotations
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[FMFMapViewController mapView](self, "mapView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "annotations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          -[FMFMapViewController mapView](self, "mapView", (_QWORD)v12);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "deselectAnnotation:animated:", v10, 0);

        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

}

- (void)selectAnnotationIfSingleFriend:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (!-[FMFMapViewController isSimpleMap](self, "isSimpleMap")
    && -[FMFMapViewController singleAnnotationOnMap](self, "singleAnnotationOnMap")
    && -[FMFMapViewController canSelectAnnotation:](self, "canSelectAnnotation:", v5))
  {
    -[FMFMapViewController mapViewDelegate](self, "mapViewDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "selectAnnotation:", v5);

  }
  else
  {
    -[FMFMapViewController deselectAllAnnotations](self, "deselectAllAnnotations");
  }

}

- (BOOL)singleAnnotationOnMap
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  int isKindOfClass;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[FMFMapViewController mapView](self, "mapView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "annotations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v13;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v13 != v8)
        objc_enumerationMutation(v4);
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      if ((isKindOfClass & v7 & 1) != 0)
        break;
      v7 |= isKindOfClass;
      if (v6 == ++v9)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v6)
          goto LABEL_3;
        goto LABEL_11;
      }
    }
  }
  LOBYTE(v7) = 0;
LABEL_11:

  return v7 & 1;
}

- (id)locationOnMapForHandle:(id)a3 enforceServerId:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  unint64_t v14;
  void *v15;
  _BOOL8 v16;
  void *v17;
  void *v18;
  int v19;
  id v20;
  void *v22;
  id obj;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v4 = a4;
  v30 = *MEMORY[0x24BDAC8D0];
  v24 = a3;
  -[FMFMapViewController mapView](self, "mapView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "annotations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = v7;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v26;
    v11 = 0x24BE2F000uLL;
    while (2)
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v26 != v10)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v12);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (!v4)
          {
            objc_msgSend(v13, "handle");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v22, "isEqual:", v24))
            {

LABEL_17:
              v20 = v13;
              goto LABEL_18;
            }
          }
          v14 = v11;
          objc_msgSend(v13, "handle");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "serverId");
          v16 = v4;
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "serverId");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v17, "isEqualToString:", v18);

          v4 = v16;
          if (v16)
          {
            v11 = v14;
            if (v19)
              goto LABEL_17;
          }
          else
          {

            v11 = v14;
            if ((v19 & 1) != 0)
              goto LABEL_17;
          }
        }
        ++v12;
      }
      while (v9 != v12);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v9)
        continue;
      break;
    }
  }
  v20 = 0;
LABEL_18:

  return v20;
}

- (void)removeAnnotationsFromMapForHandle:(id)a3
{
  void *v4;
  id v5;

  -[FMFMapViewController locationOnMapForHandle:enforceServerId:](self, "locationOnMapForHandle:enforceServerId:", a3, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[FMFMapViewController mapView](self, "mapView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeAnnotation:", v5);

    -[FMFMapViewController updateNoLocationView:](self, "updateNoLocationView:", 0);
  }

}

- (BOOL)sessionContainsHandle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  BOOL v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[FMFMapViewController fmfSession](self, "fmfSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handles");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if ((objc_msgSend(v12, "isEqual:", v4, (_QWORD)v18) & 1) == 0)
        {
          objc_msgSend(v12, "serverId");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "serverId");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v13, "isEqual:", v14);

          if ((v15 & 1) == 0)
            continue;
        }
        v16 = 1;
        goto LABEL_13;
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      v16 = 0;
      if (v9)
        continue;
      break;
    }
  }
  else
  {
    v16 = 0;
  }
LABEL_13:

  return v16;
}

- (void)refreshButtonTapped:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  -[FMFMapViewController handlesShowingLocations](self, "handlesShowingLocations", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    -[FMFMapViewController handlesShowingLocations](self, "handlesShowingLocations");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithSet:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[FMFMapViewController fmfSession](self, "fmfSession");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __44__FMFMapViewController_refreshButtonTapped___block_invoke;
    v11[3] = &unk_24C877ED0;
    v12 = v8;
    v10 = v8;
    objc_msgSend(v9, "refreshLocationForHandles:callerId:priority:completion:", v10, 0, 1, v11);

  }
}

void __44__FMFMapViewController_refreshButtonTapped___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    LogCategory_Daemon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = 138412546;
      v8 = v6;
      v9 = 2112;
      v10 = v4;
      _os_log_impl(&dword_20DD58000, v5, OS_LOG_TYPE_DEFAULT, "Error refreshing handles: %@ error: %@", (uint8_t *)&v7, 0x16u);
    }

  }
}

- (void)openInMapsButtonTapped:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  NSObject *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  -[FMFMapViewController fmfSession](self, "fmfSession", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v7 = (void *)MEMORY[0x24BDBCEF0];
    -[FMFMapViewController fmfSession](self, "fmfSession");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handles");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setWithCapacity:", objc_msgSend(v9, "count"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = dispatch_group_create();
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    -[FMFMapViewController fmfSession](self, "fmfSession");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handles");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v33;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v33 != v16)
            objc_enumerationMutation(v13);
          -[FMFMapViewController locationOnMapForHandle:enforceServerId:](self, "locationOnMapForHandle:enforceServerId:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v17), 0);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "location");
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (v19)
          {
            dispatch_group_enter(v11);
            objc_msgSend(v18, "coordinate");
            v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDB160]), "initWithCoordinate:addressDictionary:", 0, v20, v21);
            objc_msgSend(v18, "handle");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v28[0] = MEMORY[0x24BDAC760];
            v28[1] = 3221225472;
            v28[2] = __47__FMFMapViewController_openInMapsButtonTapped___block_invoke;
            v28[3] = &unk_24C878068;
            v29 = v22;
            v30 = v10;
            v31 = v11;
            v24 = v22;
            objc_msgSend(v23, "prettyNameWithCompletion:", v28);

          }
          ++v17;
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      }
      while (v15);
    }

    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __47__FMFMapViewController_openInMapsButtonTapped___block_invoke_2;
    v26[3] = &unk_24C877CC8;
    v27 = v10;
    v25 = v10;
    dispatch_group_notify(v11, MEMORY[0x24BDAC9B8], v26);

  }
}

void __47__FMFMapViewController_openInMapsButtonTapped___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;

  v3 = (objc_class *)MEMORY[0x24BDDB0F0];
  v4 = a2;
  v5 = (id)objc_msgSend([v3 alloc], "initWithPlacemark:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v5, "setName:", v4);

  objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

void __47__FMFMapViewController_openInMapsButtonTapped___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  LogCategory_Daemon();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v8 = 138412290;
    v9 = v3;
    _os_log_impl(&dword_20DD58000, v2, OS_LOG_TYPE_INFO, "Opening Map Items in Maps: %@", (uint8_t *)&v8, 0xCu);
  }

  v4 = (void *)MEMORY[0x24BDDB0F0];
  objc_msgSend(*(id *)(a1 + 32), "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v4, "openMapsWithItems:launchOptions:", v5, 0);

  if ((v4 & 1) == 0)
  {
    LogCategory_Daemon();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 138412290;
      v9 = v7;
      _os_log_impl(&dword_20DD58000, v6, OS_LOG_TYPE_INFO, "Error opening map items in maps: %@", (uint8_t *)&v8, 0xCu);
    }

  }
}

- (void)_updateDirectionsButtonEnabled
{
  void *v3;
  void *v4;
  id v5;

  -[FMFMapViewController titleView](self, "titleView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "location");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMFMapViewController directionsBarButtonItem](self, "directionsBarButtonItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabled:", v3 != 0);

}

- (void)getDirections
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  -[FMFMapViewController titleView](self, "titleView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "location");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "coordinate");
  v5 = v4;
  v7 = v6;
  objc_msgSend(MEMORY[0x24BDDB0F0], "mapItemForCurrentLocation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDB160]), "initWithCoordinate:addressDictionary:", 0, v5, v7);
  objc_msgSend(v3, "handle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __37__FMFMapViewController_getDirections__block_invoke;
  v13[3] = &unk_24C878090;
  v14 = v9;
  v15 = v8;
  v11 = v8;
  v12 = v9;
  objc_msgSend(v10, "prettyNameWithCompletion:", v13);

}

void __37__FMFMapViewController_getDirections__block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = (objc_class *)MEMORY[0x24BDDB0F0];
  v4 = a2;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithPlacemark:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v5, "setName:", v4);

  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", *MEMORY[0x24BDDAF50], *MEMORY[0x24BDDAF58], 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LogCategory_Daemon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138412546;
    v13 = v8;
    v14 = 2112;
    v15 = v5;
    _os_log_impl(&dword_20DD58000, v7, OS_LOG_TYPE_INFO, "Getting directions in Maps from %@ to %@", buf, 0x16u);
  }

  v9 = (void *)MEMORY[0x24BDDB0F0];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", *(_QWORD *)(a1 + 40), v5, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v9) = objc_msgSend(v9, "openMapsWithItems:launchOptions:", v10, v6);

  if ((v9 & 1) == 0)
  {
    LogCategory_Daemon();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DD58000, v11, OS_LOG_TYPE_DEFAULT, "Error opening map directions", buf, 2u);
    }

  }
}

- (BOOL)isCompact
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;

  -[FMFMapViewController traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 1;
  objc_msgSend(MEMORY[0x24BDF6F30], "traitCollectionWithVerticalSizeClass:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "containsTraitsInCollection:", v5) & 1) == 0)
  {
    -[FMFMapViewController traitCollection](self, "traitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6F30], "traitCollectionWithHorizontalSizeClass:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v6, "containsTraitsInCollection:", v7);

  }
  return v4;
}

- (void)presentMapOptionsModal:(id)a3
{
  FMFMapOptionsViewController *v4;
  _BOOL4 v5;
  FMFMapOptionsViewController *mapOptionsVC;
  void *v7;
  void *v8;
  id v9;

  v4 = objc_alloc_init(FMFMapOptionsViewController);
  -[FMFMapViewController setMapOptionsVC:](self, "setMapOptionsVC:", v4);

  -[FMFMapOptionsViewController setDelegate:](self->_mapOptionsVC, "setDelegate:", self);
  v5 = -[FMFMapViewController isCompact](self, "isCompact");
  mapOptionsVC = self->_mapOptionsVC;
  if (v5)
  {
    -[FMFMapOptionsViewController setModalPresentationStyle:](mapOptionsVC, "setModalPresentationStyle:", 6);
    -[UIViewController fmf_presentModalViewController:](self, "fmf_presentModalViewController:", self->_mapOptionsVC);
    -[FMFMapViewController navigationController](self, "navigationController");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setToolbarHidden:animated:", 1, 1);
  }
  else
  {
    -[FMFMapOptionsViewController setModalPresentationStyle:](mapOptionsVC, "setModalPresentationStyle:", 7);
    -[FMFMapViewController navigationController](self, "navigationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "presentViewController:animated:completion:", self->_mapOptionsVC, 1, 0);

    -[FMFMapOptionsViewController popoverPresentationController](self->_mapOptionsVC, "popoverPresentationController");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[FMFMapOptionsViewController paneSize](self->_mapOptionsVC, "paneSize");
    objc_msgSend(v9, "setPopoverContentSize:");
    -[FMFMapViewController infoBarButtonItem](self, "infoBarButtonItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setBarButtonItem:", v8);

  }
}

- (void)_dismiss:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  LogCategory_Daemon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = v4;
    _os_log_impl(&dword_20DD58000, v5, OS_LOG_TYPE_DEFAULT, "FMFMapViewController: dismiss %@", (uint8_t *)&v10, 0xCu);
  }

  v6 = -[FMFMapViewController isCompact](self, "isCompact");
  -[FMFMapViewController mapOptionsVC](self, "mapOptionsVC");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    -[UIViewController fmf_dismissModalViewController:](self, "fmf_dismissModalViewController:", v7);

    -[FMFMapViewController navigationController](self, "navigationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setToolbarHidden:animated:", 0, 1);
  }
  else
  {
    objc_msgSend(v7, "presentingViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dismissViewControllerAnimated:completion:", 1, 0);

  }
}

- (void)mapTypeChangedNotification:(id)a3
{
  unint64_t v4;
  id v5;

  -[FMFMapViewController setMapTypeLoaded:](self, "setMapTypeLoaded:", 0);
  v4 = -[FMFMapViewController defaultMapType](self, "defaultMapType");
  -[FMFMapViewController mapView](self, "mapView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMapType:", v4);

}

- (void)mapTypeChanged:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v9;
  unint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  -[FMFMapViewController setDefaultMapType:](self, "setDefaultMapType:");
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("MAP_TYPE_DEFAULT_KEY"));

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "synchronize");

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postNotificationName:object:", CFSTR("MAP_TYPE_DEFAULT_KEY"), 0);

  LogCategory_Daemon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 134217984;
    v10 = a3;
    _os_log_impl(&dword_20DD58000, v8, OS_LOG_TYPE_DEFAULT, "FMFMapViewController: mapTypeChanged %lu", (uint8_t *)&v9, 0xCu);
  }

}

- (unint64_t)defaultMapType
{
  void *v3;
  void *v4;
  uint64_t v5;

  if (!-[FMFMapViewController mapTypeLoaded](self, "mapTypeLoaded"))
  {
    -[FMFMapViewController setMapTypeLoaded:](self, "setMapTypeLoaded:", 1);
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", CFSTR("MAP_TYPE_DEFAULT_KEY"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    -[FMFMapViewController setDefaultMapType:](self, "setDefaultMapType:", objc_msgSend(v4, "unsignedIntegerValue"));
    if (-[FMFMapViewController defaultMapType](self, "defaultMapType") == 1)
    {
      v5 = 3;
    }
    else
    {
      if (-[FMFMapViewController defaultMapType](self, "defaultMapType") != 2)
      {
LABEL_7:

        return self->_defaultMapType;
      }
      v5 = 4;
    }
    -[FMFMapViewController setDefaultMapType:](self, "setDefaultMapType:", v5);
    -[FMFMapViewController mapTypeChanged:](self, "mapTypeChanged:", -[FMFMapViewController defaultMapType](self, "defaultMapType"));
    goto LABEL_7;
  }
  return self->_defaultMapType;
}

- (void)stopRefreshingLocations
{
  -[FMFMapViewController set_refreshingIsPaused:](self, "set_refreshingIsPaused:", 1);
  -[FMFMapViewController removeHandlesFromSession](self, "removeHandlesFromSession");
  -[FMFMapViewController deselectAllAnnotations](self, "deselectAllAnnotations");
}

- (void)resumeRefreshingLocations
{
  void *v3;

  -[FMFMapViewController set_refreshingIsPaused:](self, "set_refreshingIsPaused:", 0);
  -[FMFMapViewController addHandlesToSession](self, "addHandlesToSession");
  -[FMFMapViewController noLocationView](self, "noLocationView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateLabel");

  -[FMFMapViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_selectAnnotationIfSingleForMac, 0, 0.5);
}

- (void)setShowFloatingMapLocationButton:(BOOL)a3
{
  _BOOL4 v3;
  id v4;

  v3 = a3;
  self->_showFloatingMapLocationButton = a3;
  -[FMFMapViewController mapView](self, "mapView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShowsAttribution:", !v3);

}

- (NSSet)handlesShowingLocations
{
  void *v2;
  void *v3;

  -[FMFMapViewController fmfSession](self, "fmfSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handles");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v3;
}

- (void)setHandlesShowingLocations:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  pid_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  FMFMapViewController *v14;
  __int16 v15;
  pid_t v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    -[FMFMapViewController deselectAllAnnotations](self, "deselectAllAnnotations");
    -[FMFMapViewController _internalHandlesShowingLocations](self, "_internalHandlesShowingLocations");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "mutableCopy");

    objc_msgSend(v6, "minusSet:", v4);
    LogCategory_Daemon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = getpid();
      objc_msgSend(v4, "description");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[FMFMapViewController _internalHandlesShowingLocations](self, "_internalHandlesShowingLocations");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "description");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "description");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138413314;
      v14 = self;
      v15 = 1024;
      v16 = v8;
      v17 = 2112;
      v18 = v9;
      v19 = 2112;
      v20 = v11;
      v21 = 2112;
      v22 = v12;
      _os_log_impl(&dword_20DD58000, v7, OS_LOG_TYPE_DEFAULT, "⛳️FMFUI %@ {pid = %d}: want location for %@ (internal: %@, to remove: %@)", (uint8_t *)&v13, 0x30u);

    }
    -[FMFMapViewController stopShowingLocationsForHandles:](self, "stopShowingLocationsForHandles:", v6);
    -[FMFMapViewController startShowingLocationsForHandles:](self, "startShowingLocationsForHandles:", v4);
    -[FMFMapViewController set_internalHandlesShowingLocations:](self, "set_internalHandlesShowingLocations:", v4);

  }
}

- (void)startShowingLocationsForHandles:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  LogCategory_Daemon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_20DD58000, v5, OS_LOG_TYPE_DEFAULT, "Start showing location for handles: %@", (uint8_t *)&v7, 0xCu);
  }

  -[FMFMapViewController fmfSession](self, "fmfSession");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addHandles:", v4);

}

- (void)stopShowingLocationsForHandles:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t v18[128];
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  LogCategory_Daemon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v20 = v4;
    _os_log_impl(&dword_20DD58000, v5, OS_LOG_TYPE_DEFAULT, "Stop showing location for handles: %@", buf, 0xCu);
  }

  -[FMFMapViewController fmfSession](self, "fmfSession");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeHandles:", v4);

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        -[FMFMapViewController removeAnnotationsFromMapForHandle:](self, "removeAnnotationsFromMapForHandle:", v12, (_QWORD)v14);
        -[FMFMapViewController refreshButton](self, "refreshButton");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "removeLocationForHandle:", v12);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

}

- (void)zoomToFit
{
  double v3;
  double v4;
  void *v5;
  id v6;

  -[FMFMapViewController nonLiveAnimationDuration](self, "nonLiveAnimationDuration");
  v4 = v3;
  -[FMFMapViewController mapViewDelegate](self, "mapViewDelegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[FMFMapViewController mapView](self, "mapView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "zoomToFitAnnotationsForMapView:includeMe:duration:", v5, -[FMFMapViewController shouldZoomToFitMeAndLocations](self, "shouldZoomToFitMeAndLocations"), v4);

}

- (void)zoomToFit:(BOOL)a3
{
  double v4;
  double v5;
  void *v6;
  id v7;

  v4 = 0.0;
  if (a3)
  {
    -[FMFMapViewController nonLiveAnimationDuration](self, "nonLiveAnimationDuration");
    v4 = v5;
  }
  -[FMFMapViewController mapViewDelegate](self, "mapViewDelegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[FMFMapViewController mapView](self, "mapView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "zoomToFitAnnotationsForMapView:includeMe:duration:", v6, -[FMFMapViewController shouldZoomToFitMeAndLocations](self, "shouldZoomToFitMeAndLocations"), v4);

}

- (void)zoomAndSelectHandle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[FMFMapViewController locationOnMapForHandle:enforceServerId:](self, "locationOnMapForHandle:enforceServerId:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (-[FMFMapViewController canSelectAnnotation:](self, "canSelectAnnotation:", v5))
    {
      -[FMFMapViewController mapViewDelegate](self, "mapViewDelegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "selectAnnotation:", v5);

    }
    -[FMFMapViewController mapViewDelegate](self, "mapViewDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMFMapViewController mapView](self, "mapView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "zoomToFitLocation:forMapView:", v5, v8);

  }
  else
  {
    LogCategory_Daemon();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = 138412290;
      v11 = v4;
      _os_log_impl(&dword_20DD58000, v9, OS_LOG_TYPE_INFO, "zoomAndSelectHandle: location not found for handle: %@", (uint8_t *)&v10, 0xCu);
    }

  }
}

- (FMFSession)fmfSession
{
  FMFSession *fmfSession;
  void *v4;
  void *v5;
  void *v6;

  fmfSession = self->_fmfSession;
  if (!fmfSession)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE2FED0]), "initWithDelegate:", self);
    -[FMFMapViewController setFmfSession:](self, "setFmfSession:", v4);

    -[FMFMapViewController fmfSession](self, "fmfSession");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMFMapViewController debugContext](self, "debugContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDebugContext:", v6);

    fmfSession = self->_fmfSession;
  }
  return fmfSession;
}

- (void)didReceiveLocation:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __43__FMFMapViewController_didReceiveLocation___block_invoke;
  v6[3] = &unk_24C877D90;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

uint64_t __43__FMFMapViewController_didReceiveLocation___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  uint64_t v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "handle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = objc_msgSend(v2, "sessionContainsHandle:", v3);

  if ((_DWORD)v2)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "handle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "locationOnMapForHandle:enforceServerId:", v5, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = objc_msgSend(v6, "locationType");
      if (v7 == objc_msgSend(*(id *)(a1 + 40), "locationType"))
      {
        objc_msgSend(v6, "location");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "location");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "distanceFromLocation:", v9);
        v11 = v10;

        if (v11 < 1.0)
        {
LABEL_14:

          goto LABEL_15;
        }
      }
      v12 = objc_msgSend(*(id *)(a1 + 40), "locationType");
      v13 = *(void **)(a1 + 32);
      if (v12 == 2)
        objc_msgSend(v13, "liveAnimationDuration");
      else
        objc_msgSend(v13, "nonLiveAnimationDuration");
      v15 = v14;
    }
    else
    {
      v15 = 0.0;
    }
    objc_msgSend(*(id *)(a1 + 32), "updateMapWithNewLocation:animated:", *(_QWORD *)(a1 + 40), v15 > 0.0);
    if (objc_msgSend(*(id *)(a1 + 32), "shouldZoomToFitNewLocations")
      && (objc_msgSend(*(id *)(a1 + 32), "_blockDidReceiveAnimation") & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "mapViewDelegate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "mapView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "zoomToFitAnnotationsForMapView:includeMe:duration:", v17, objc_msgSend(*(id *)(a1 + 32), "shouldZoomToFitMeAndLocations"), v15);

    }
    objc_msgSend(*(id *)(a1 + 32), "updateRefreshForLocation:", *(_QWORD *)(a1 + 40));
    goto LABEL_14;
  }
LABEL_15:
  objc_msgSend(*(id *)(a1 + 32), "_updateTitleViewLocation:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "didReceiveLocationForDelegateCallback:", *(_QWORD *)(a1 + 40));
}

- (void)updateRefreshForLocation:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[FMFMapViewController refreshButton](self, "refreshButton");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addLocation:", v4);

}

- (void)didStopAbilityToGetLocationForHandle:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __61__FMFMapViewController_didStopAbilityToGetLocationForHandle___block_invoke;
  v6[3] = &unk_24C877D90;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

uint64_t __61__FMFMapViewController_didStopAbilityToGetLocationForHandle___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeAnnotationsFromMapForHandle:", *(_QWORD *)(a1 + 40));
}

- (void)removeAllFriendLocationsFromMap
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[6];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  -[FMFMapViewController mapView](self, "mapView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "annotations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    v9 = MEMORY[0x24BDAC9B8];
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v12[0] = MEMORY[0x24BDAC760];
          v12[1] = 3221225472;
          v12[2] = __55__FMFMapViewController_removeAllFriendLocationsFromMap__block_invoke;
          v12[3] = &unk_24C877D90;
          v12[4] = self;
          v12[5] = v11;
          dispatch_async(v9, v12);
        }
        ++v10;
      }
      while (v7 != v10);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

}

void __55__FMFMapViewController_removeAllFriendLocationsFromMap__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "mapView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAnnotation:", *(_QWORD *)(a1 + 40));

}

- (void)_setUserTrackingMode:(int64_t)a3 animated:(BOOL)a4 fromTrackingButton:(BOOL)a5
{
  void *v7;
  uint64_t v8;
  void *v9;

  if (a3 == 2)
  {
    -[FMFMapViewController userTrackingButton](self, "userTrackingButton", 2, a4, a5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_setState:", 3);
    v8 = 2;
  }
  else if (a3 == 1)
  {
    -[FMFMapViewController userTrackingButton](self, "userTrackingButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_setState:", 2);
    v8 = 1;
  }
  else
  {
    -[FMFMapViewController userTrackingButton](self, "userTrackingButton", a3, a4, a5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_setState:", 0);
    v8 = 0;
  }

  -[FMFMapViewController setCurrentTrackingMode:](self, "setCurrentTrackingMode:", v8);
  -[FMFMapViewController setShouldZoomToFitNewLocations:](self, "setShouldZoomToFitNewLocations:", a3 != 2);
  -[FMFMapViewController setShouldZoomToFitMeAndLocations:](self, "setShouldZoomToFitMeAndLocations:", a3 == 1);
  -[FMFMapViewController mapView](self, "mapView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setUserTrackingMode:animated:", 2 * (a3 == 2), 1);

  -[FMFMapViewController zoomToFit](self, "zoomToFit");
}

- (int64_t)userTrackingMode
{
  int64_t v2;

  v2 = -[FMFMapViewController currentTrackingMode](self, "currentTrackingMode");
  if (v2 == 1)
    return 1;
  else
    return 2 * (v2 == 2);
}

- (BOOL)canRotateForHeading
{
  return objc_msgSend(MEMORY[0x24BDBFA88], "headingAvailable");
}

- (BOOL)isCurrentlyRotated
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FMFMapViewController.m"), 1306, CFSTR("FIXME: Test this code path.  As of Whitetail MapKit was never calling this method and it was just added for protocol conformance."));

  -[FMFMapViewController mapView](self, "mapView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v5, "isCurrentlyRotated");

  return (char)self;
}

- (void)updateUserTrackingButtonState
{
  uint64_t v2;
  id v3;

  v2 = hasUserLocation;
  -[FMFMapViewController userTrackingButton](self, "userTrackingButton");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEnabled:", v2);

}

- (BOOL)hasUserLocation
{
  return hasUserLocation;
}

+ (BOOL)hasUserLocation
{
  return hasUserLocation;
}

- (void)didSelectLocation:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[FMFMapViewController _updateTitleViewLocation:](self, "_updateTitleViewLocation:");
  -[FMFMapViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "handle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fmfMapViewController:didSelectHandle:", self, v5);

  }
}

- (void)didDeselectLocation:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[FMFMapViewController _updateTitleViewLocation:](self, "_updateTitleViewLocation:");
  -[FMFMapViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "handle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fmfMapViewController:didDeselectHandle:", self, v5);

  }
}

- (void)regionWillChangeAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  -[FMFMapViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "fmfMapViewController:regionWillChangeAnimated:", self, v3);

}

- (void)regionDidChangeAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  -[FMFMapViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "fmfMapViewController:regionDidChangeAnimated:", self, v3);
  if (!v3 && !-[FMFMapViewController isSimpleMap](self, "isSimpleMap"))
    -[FMFMapViewController setupRecenterMapTimer](self, "setupRecenterMapTimer");

}

- (void)reZoomToFit
{
  double v3;
  double v4;
  void *v5;
  id v6;

  if (-[FMFMapViewController shouldZoomToFitNewLocations](self, "shouldZoomToFitNewLocations"))
  {
    -[FMFMapViewController nonLiveAnimationDuration](self, "nonLiveAnimationDuration");
    v4 = v3;
    -[FMFMapViewController mapViewDelegate](self, "mapViewDelegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[FMFMapViewController mapView](self, "mapView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "zoomToFitAnnotationsForMapView:includeMe:duration:", v5, -[FMFMapViewController shouldZoomToFitMeAndLocations](self, "shouldZoomToFitMeAndLocations"), v4);

  }
}

- (void)didUpdateUserLocation:(id)a3
{
  id v4;

  hasUserLocation = 1;
  v4 = a3;
  -[FMFMapViewController updateUserTrackingButtonState](self, "updateUserTrackingButtonState");
  -[FMFMapViewController didReceiveLocationForDelegateCallback:](self, "didReceiveLocationForDelegateCallback:", v4);

}

- (void)didReceiveLocationForDelegateCallback:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[FMFMapViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "fmfMapViewController:didReceiveLocation:", self, v5);

}

- (void)mapViewDidFinishRenderingMap
{
  NSObject *v3;
  uint8_t v4[16];

  LogCategory_Daemon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_20DD58000, v3, OS_LOG_TYPE_DEFAULT, "mapViewDidFinishRenderingMap", v4, 2u);
  }

  -[FMFMapViewController set_isRenderingInitialMap:](self, "set_isRenderingInitialMap:", 0);
  if (-[FMFMapViewController isSimpleMap](self, "isSimpleMap"))
    -[FMFMapViewController hideCachedMap](self, "hideCachedMap");
}

- (void)hideCachedMap
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __37__FMFMapViewController_hideCachedMap__block_invoke;
  v2[3] = &unk_24C877CC8;
  v2[4] = self;
  objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:animations:", v2, 0.5);
}

void __37__FMFMapViewController_hideCachedMap__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "cachedMapView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 0.0);

}

- (id)annotationImageForAnnotation:(id)a3 andHandle:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v19;

  v6 = a4;
  v7 = a3;
  -[FMFMapViewController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v8, "annotationContactForHandle:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  v19 = 0;
  +[FMFMapViewController annotationImageSize](FMFMapViewController, "annotationImageSize");
  v11 = v10;
  -[FMFMapViewController _internalAnnotationTintColor](self, "_internalAnnotationTintColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[FMFMonogramUtility monogramImageOfDiameter:forContact:useTintColor:useCustomFont:isPersonImage:](FMFMonogramUtility, "monogramImageOfDiameter:forContact:useTintColor:useCustomFont:isPersonImage:", v9, v12, 1, &v19, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setIsBorderEnabled:", v19 == 0);
  if (!v13)
  {
    v14 = (void *)MEMORY[0x24BDF6AC8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "imageNamed:inBundle:", CFSTR("person"), v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMFMapViewController _internalAnnotationTintColor](self, "_internalAnnotationTintColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "tintedImageWithColor:", v17);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v13;
}

- (id)titleViewForSelectedHandle
{
  void *v3;
  void *v4;

  -[FMFMapViewController titleView](self, "titleView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMFMapViewController _selectedHandleAnnotation](self, "_selectedHandleAnnotation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateLocation:", v4);

  return -[FMFMapViewController titleView](self, "titleView");
}

- (void)_updateTitleViewLocation:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;

  v15 = a3;
  -[FMFMapViewController handlesShowingLocations](self, "handlesShowingLocations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "containsObject:", v5) & 1) != 0)
  {
    -[FMFMapViewController handlesShowingLocations](self, "handlesShowingLocations");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count") == 1)
    {

LABEL_6:
      -[FMFMapViewController titleView](self, "titleView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      v13 = v15;
LABEL_10:
      objc_msgSend(v11, "updateLocation:", v13);
      goto LABEL_11;
    }
    -[FMFMapViewController _selectedHandleAnnotation](self, "_selectedHandleAnnotation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqual:", v9);

    if (v10)
      goto LABEL_6;
  }
  else
  {

  }
  -[FMFMapViewController handlesShowingLocations](self, "handlesShowingLocations");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v12, "count") < 2)
  {
LABEL_11:

    goto LABEL_12;
  }
  -[FMFMapViewController _selectedHandleAnnotation](self, "_selectedHandleAnnotation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    -[FMFMapViewController titleView](self, "titleView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    v13 = 0;
    goto LABEL_10;
  }
LABEL_12:
  -[FMFMapViewController _updateDirectionsButtonEnabled](self, "_updateDirectionsButtonEnabled");

}

- (id)_selectedHandleAnnotation
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[FMFMapViewController mapView](self, "mapView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "selectedAnnotations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  return v6;
}

- (id)_internalAnnotationTintColor
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  -[FMFMapViewController annotationTintColor](self, "annotationTintColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF6950], "fmfOrangeColor");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

- (void)updateAllAnnotationsDueToAddressBookUpdate
{
  _QWORD block[5];

  +[FMFMonogramUtility clearMonogramCache](FMFMonogramUtility, "clearMonogramCache");
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __66__FMFMapViewController_updateAllAnnotationsDueToAddressBookUpdate__block_invoke;
  block[3] = &unk_24C877CC8;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __66__FMFMapViewController_updateAllAnnotationsDueToAddressBookUpdate__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "noLocationView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updatePersonImageViewImage");

  objc_msgSend(*(id *)(a1 + 32), "mapView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "annotations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v11 = v10;
          objc_msgSend(v11, "handle", (_QWORD)v15);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addressBookDidChange");

          objc_msgSend(*(id *)(a1 + 32), "mapView");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "removeAnnotation:", v11);

          objc_msgSend(*(id *)(a1 + 32), "mapView");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addAnnotation:", v11);

        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

}

- (FMFTitleView)titleView
{
  FMFTitleView *titleView;
  id v4;

  titleView = self->_titleView;
  if (!titleView)
  {
    v4 = -[FMFTitleView initFromNib]([FMFTitleView alloc], "initFromNib");
    -[FMFMapViewController setTitleView:](self, "setTitleView:", v4);

    titleView = self->_titleView;
  }
  return titleView;
}

- (FMFMapViewControllerDelegate)delegate
{
  return (FMFMapViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)shouldZoomToFitNewLocations
{
  return self->_shouldZoomToFitNewLocations;
}

- (void)setShouldZoomToFitNewLocations:(BOOL)a3
{
  self->_shouldZoomToFitNewLocations = a3;
}

- (BOOL)shouldZoomToFitMeAndLocations
{
  return self->_shouldZoomToFitMeAndLocations;
}

- (void)setShouldZoomToFitMeAndLocations:(BOOL)a3
{
  self->_shouldZoomToFitMeAndLocations = a3;
}

- (BOOL)showFloatingMapLocationButton
{
  return self->_showFloatingMapLocationButton;
}

- (BOOL)isMapCenteringDisabled
{
  return self->_isMapCenteringDisabled;
}

- (UIEdgeInsets)edgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_edgeInsets.top;
  left = self->_edgeInsets.left;
  bottom = self->_edgeInsets.bottom;
  right = self->_edgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (MKMapView)mapView
{
  return self->_mapView;
}

- (void)setMapView:(id)a3
{
  objc_storeStrong((id *)&self->_mapView, a3);
}

- (UIColor)annotationTintColor
{
  return self->_annotationTintColor;
}

- (void)setAnnotationTintColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1000);
}

- (void)setFmfSession:(id)a3
{
  objc_storeStrong((id *)&self->_fmfSession, a3);
}

- (FMFMapViewDelegateInternal)mapViewDelegate
{
  return self->_mapViewDelegate;
}

- (void)setMapViewDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_mapViewDelegate, a3);
}

- (NSSet)_preloadedHandles
{
  return self->__preloadedHandles;
}

- (void)set_preloadedHandles:(id)a3
{
  objc_storeStrong((id *)&self->__preloadedHandles, a3);
}

- (BOOL)isSimpleMap
{
  return self->_isSimpleMap;
}

- (void)setIsSimpleMap:(BOOL)a3
{
  self->_isSimpleMap = a3;
}

- (void)setNoLocationView:(id)a3
{
  objc_storeStrong((id *)&self->_noLocationView, a3);
}

- (NSSet)_internalHandlesShowingLocations
{
  return self->__internalHandlesShowingLocations;
}

- (void)set_internalHandlesShowingLocations:(id)a3
{
  objc_storeStrong((id *)&self->__internalHandlesShowingLocations, a3);
}

- (BOOL)_refreshingIsPaused
{
  return self->__refreshingIsPaused;
}

- (void)set_refreshingIsPaused:(BOOL)a3
{
  self->__refreshingIsPaused = a3;
}

- (BOOL)_blockDidReceiveAnimation
{
  return self->__blockDidReceiveAnimation;
}

- (void)set_blockDidReceiveAnimation:(BOOL)a3
{
  self->__blockDidReceiveAnimation = a3;
}

- (BOOL)_isRenderingInitialMap
{
  return self->__isRenderingInitialMap;
}

- (void)set_isRenderingInitialMap:(BOOL)a3
{
  self->__isRenderingInitialMap = a3;
}

- (BOOL)viewWillAppearCalled
{
  return self->_viewWillAppearCalled;
}

- (void)setViewWillAppearCalled:(BOOL)a3
{
  self->_viewWillAppearCalled = a3;
}

- (BOOL)alwaysShowAccuracy
{
  return self->_alwaysShowAccuracy;
}

- (void)setAlwaysShowAccuracy:(BOOL)a3
{
  self->_alwaysShowAccuracy = a3;
}

- (BOOL)wasToolbarPreviouslyHidden
{
  return self->_wasToolbarPreviouslyHidden;
}

- (void)setWasToolbarPreviouslyHidden:(BOOL)a3
{
  self->_wasToolbarPreviouslyHidden = a3;
}

- (NSString)debugContext
{
  return self->_debugContext;
}

- (void)setDebugContext:(id)a3
{
  objc_storeStrong((id *)&self->_debugContext, a3);
}

- (FMFMapOptionsViewController)mapOptionsVC
{
  return self->_mapOptionsVC;
}

- (void)setMapOptionsVC:(id)a3
{
  objc_storeStrong((id *)&self->_mapOptionsVC, a3);
}

- (void)setTitleView:(id)a3
{
  objc_storeStrong((id *)&self->_titleView, a3);
}

- (void)setUserTrackingButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_userTrackingButtonItem, a3);
}

- (UIBarButtonItem)directionsBarButtonItem
{
  return self->_directionsBarButtonItem;
}

- (void)setDirectionsBarButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_directionsBarButtonItem, a3);
}

- (UIBarButtonItem)infoBarButtonItem
{
  return self->_infoBarButtonItem;
}

- (void)setInfoBarButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_infoBarButtonItem, a3);
}

- (FMFRefreshBarButtonItem)refreshButton
{
  return self->_refreshButton;
}

- (void)setRefreshButton:(id)a3
{
  objc_storeStrong((id *)&self->_refreshButton, a3);
}

- (void)setCachedMapView:(id)a3
{
  objc_storeStrong((id *)&self->_cachedMapView, a3);
}

- (void)setDefaultMapType:(unint64_t)a3
{
  self->_defaultMapType = a3;
}

- (BOOL)mapTypeLoaded
{
  return self->_mapTypeLoaded;
}

- (void)setMapTypeLoaded:(BOOL)a3
{
  self->_mapTypeLoaded = a3;
}

- (_MKUserTrackingButton)userTrackingButton
{
  return self->_userTrackingButton;
}

- (void)setUserTrackingButton:(id)a3
{
  objc_storeStrong((id *)&self->_userTrackingButton, a3);
}

- (int64_t)currentTrackingMode
{
  return self->_currentTrackingMode;
}

- (void)setCurrentTrackingMode:(int64_t)a3
{
  self->_currentTrackingMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userTrackingButton, 0);
  objc_storeStrong((id *)&self->_cachedMapView, 0);
  objc_storeStrong((id *)&self->_refreshButton, 0);
  objc_storeStrong((id *)&self->_infoBarButtonItem, 0);
  objc_storeStrong((id *)&self->_directionsBarButtonItem, 0);
  objc_storeStrong((id *)&self->_userTrackingButtonItem, 0);
  objc_storeStrong((id *)&self->_titleView, 0);
  objc_storeStrong((id *)&self->_mapOptionsVC, 0);
  objc_storeStrong((id *)&self->_debugContext, 0);
  objc_storeStrong((id *)&self->__internalHandlesShowingLocations, 0);
  objc_storeStrong((id *)&self->_noLocationView, 0);
  objc_storeStrong((id *)&self->__preloadedHandles, 0);
  objc_storeStrong((id *)&self->_mapViewDelegate, 0);
  objc_storeStrong((id *)&self->_fmfSession, 0);
  objc_storeStrong((id *)&self->_annotationTintColor, 0);
  objc_storeStrong((id *)&self->_mapView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
