@implementation CPSLocationConsentViewController

- (CPSLocationConsentViewController)initWithRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  CPSLocationConsentViewController *v8;
  uint64_t v9;
  NSString *appName;
  uint64_t v11;
  NSString *clipBundleID;
  void *v13;
  char isKindOfClass;
  uint64_t v15;
  CLCircularRegion *region;
  void *v17;
  CLLocationDegrees v18;
  CLLocationDegrees v19;
  __CFString *v20;
  CPSLocationConsentViewController *v21;
  objc_super v23;

  v4 = a3;
  _CPSLocalizedString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithScale:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA638], "_systemImageNamed:withConfiguration:", CFSTR("location.fill.appclip"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23.receiver = self;
  v23.super_class = (Class)CPSLocationConsentViewController;
  v8 = -[CPSLocationConsentViewController initWithTitle:detailText:icon:contentLayout:](&v23, sel_initWithTitle_detailText_icon_contentLayout_, v5, 0, v7, 2);
  if (v8)
  {
    objc_msgSend(v4, "applicationName");
    v9 = objc_claimAutoreleasedReturnValue();
    appName = v8->_appName;
    v8->_appName = (NSString *)v9;

    objc_msgSend(v4, "clipBundleID");
    v11 = objc_claimAutoreleasedReturnValue();
    clipBundleID = v8->_clipBundleID;
    v8->_clipBundleID = (NSString *)v11;

    objc_msgSend(v4, "expectedRegion");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v4, "expectedRegion");
      v15 = objc_claimAutoreleasedReturnValue();
      region = v8->_region;
      v8->_region = (CLCircularRegion *)v15;

    }
    objc_msgSend(v4, "deviceLocation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "coordinate");
    v8->_deviceLocationCoordinate.latitude = v18;
    v8->_deviceLocationCoordinate.longitude = v19;

    if (objc_msgSend(v4, "requestState") == 2)
      v20 = CFSTR("wave.3.right");
    else
      v20 = CFSTR("qrcode");
    objc_storeStrong((id *)&v8->_deviceLocationSymbolName, v20);
    v21 = v8;
  }

  return v8;
}

- (void)viewDidLoad
{
  OBBoldTrayButton *v3;
  OBBoldTrayButton *allowForAllButton;
  OBBoldTrayButton *v5;
  void *v6;
  void *v7;
  OBLinkTrayButton *v8;
  OBLinkTrayButton *allowOnceButton;
  OBLinkTrayButton *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)CPSLocationConsentViewController;
  -[OBBaseWelcomeController viewDidLoad](&v18, sel_viewDidLoad);
  -[CPSLocationConsentViewController _setupContentView](self, "_setupContentView");
  objc_msgSend(MEMORY[0x1E0D65140], "boldButton");
  v3 = (OBBoldTrayButton *)objc_claimAutoreleasedReturnValue();
  allowForAllButton = self->_allowForAllButton;
  self->_allowForAllButton = v3;

  v5 = self->_allowForAllButton;
  _CPSLocalizedString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBBoldTrayButton setTitle:forState:](v5, "setTitle:forState:", v6, 0);

  -[OBBoldTrayButton addTarget:action:forControlEvents:](self->_allowForAllButton, "addTarget:action:forControlEvents:", self, sel__buttonActionTriggered_, 0x2000);
  -[OBBoldTrayButton titleLabel](self->_allowForAllButton, "titleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setNumberOfLines:", 0);

  objc_msgSend(MEMORY[0x1E0D65170], "linkButton");
  v8 = (OBLinkTrayButton *)objc_claimAutoreleasedReturnValue();
  allowOnceButton = self->_allowOnceButton;
  self->_allowOnceButton = v8;

  v10 = self->_allowOnceButton;
  _CPSLocalizedString();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBLinkTrayButton setTitle:forState:](v10, "setTitle:forState:", v11, 0);

  -[OBLinkTrayButton addTarget:action:forControlEvents:](self->_allowOnceButton, "addTarget:action:forControlEvents:", self, sel__buttonActionTriggered_, 0x2000);
  -[OBLinkTrayButton titleLabel](self->_allowOnceButton, "titleLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setNumberOfLines:", 0);

  objc_msgSend(MEMORY[0x1E0D65170], "linkButton");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "systemRedColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTitleColor:forState:", v14, 0);

  _CPSLocalizedString();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTitle:forState:", v15, 0);

  objc_msgSend(v13, "addTarget:action:forControlEvents:", self, sel__buttonActionTriggered_, 0x2000);
  objc_msgSend(v13, "titleLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setNumberOfLines:", 0);

  -[CPSLocationConsentViewController buttonTray](self, "buttonTray");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addButton:", self->_allowForAllButton);
  objc_msgSend(v17, "addButton:", self->_allowOnceButton);
  objc_msgSend(v17, "addButton:", v13);

}

- (void)_setupContentView
{
  MKMapView *v3;
  MKMapView *mapView;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  MKPointAnnotation *v10;
  MKPointAnnotation *deviceLocationAnnotation;
  CLCircularRegion *region;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  MKCircle *v19;
  MKCircle *circleOverlay;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  _QWORD v59[10];

  v59[8] = *MEMORY[0x1E0C80C00];
  v3 = (MKMapView *)objc_alloc_init(MEMORY[0x1E0CC1870]);
  mapView = self->_mapView;
  self->_mapView = v3;

  -[MKMapView setUserInteractionEnabled:](self->_mapView, "setUserInteractionEnabled:", 0);
  -[MKMapView setShowsAttribution:](self->_mapView, "setShowsAttribution:", 0);
  -[MKMapView setDelegate:](self->_mapView, "setDelegate:", self);
  -[MKMapView setTranslatesAutoresizingMaskIntoConstraints:](self->_mapView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[MKMapView _setContinuousCornerRadius:](self->_mapView, "_setContinuousCornerRadius:", 8.0);
  objc_msgSend(MEMORY[0x1E0CEA478], "separatorColor");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = objc_msgSend(v5, "CGColor");
  -[MKMapView layer](self->_mapView, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBorderColor:", v6);

  -[MKMapView layer](self->_mapView, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBorderWidth:", 1.0);

  -[CPSLocationConsentViewController contentView](self, "contentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSubview:", self->_mapView);

  v10 = (MKPointAnnotation *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC1908]), "initWithCoordinate:", self->_deviceLocationCoordinate.latitude, self->_deviceLocationCoordinate.longitude);
  deviceLocationAnnotation = self->_deviceLocationAnnotation;
  self->_deviceLocationAnnotation = v10;

  -[MKMapView addAnnotation:](self->_mapView, "addAnnotation:", self->_deviceLocationAnnotation);
  region = self->_region;
  if (region)
  {
    v13 = (void *)MEMORY[0x1E0CC1768];
    -[CLCircularRegion center](region, "center");
    v15 = v14;
    v17 = v16;
    -[CLCircularRegion radius](self->_region, "radius");
    objc_msgSend(v13, "circleWithCenterCoordinate:radius:", v15, v17, v18);
    v19 = (MKCircle *)objc_claimAutoreleasedReturnValue();
    circleOverlay = self->_circleOverlay;
    self->_circleOverlay = v19;

    -[MKMapView addOverlay:](self->_mapView, "addOverlay:", self->_circleOverlay);
    -[MKMapView addAnnotation:](self->_mapView, "addAnnotation:", self->_circleOverlay);
  }
  v21 = objc_alloc_init(MEMORY[0x1E0CEA700]);
  objc_msgSend(v21, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB590]);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setFont:", v22);

  objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setTextColor:", v23);

  objc_msgSend(v21, "setAdjustsFontForContentSizeCategory:", 1);
  objc_msgSend(v21, "setTextAlignment:", 1);
  objc_msgSend(v21, "setNumberOfLines:", 0);
  v24 = (void *)MEMORY[0x1E0CB3940];
  _CPSLocalizedString();
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "stringWithFormat:", v25, self->_appName);
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "setText:", v58);
  -[CPSLocationConsentViewController contentView](self, "contentView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addSubview:", v21);

  v45 = (void *)MEMORY[0x1E0CB3718];
  -[MKMapView topAnchor](self->_mapView, "topAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSLocationConsentViewController contentView](self, "contentView");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "topAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "constraintEqualToAnchor:", v55);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v59[0] = v54;
  -[MKMapView leadingAnchor](self->_mapView, "leadingAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSLocationConsentViewController contentView](self, "contentView");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "leadingAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "constraintEqualToAnchor:", v51);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v59[1] = v50;
  -[MKMapView trailingAnchor](self->_mapView, "trailingAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSLocationConsentViewController contentView](self, "contentView");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "trailingAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "constraintEqualToAnchor:", v47);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v59[2] = v46;
  -[MKMapView heightAnchor](self->_mapView, "heightAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "constraintEqualToConstant:", 158.0);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v59[3] = v43;
  objc_msgSend(v21, "topAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKMapView bottomAnchor](self->_mapView, "bottomAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v41, 1.0);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v59[4] = v40;
  objc_msgSend(v21, "centerXAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSLocationConsentViewController contentView](self, "contentView");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "centerXAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraintEqualToAnchor:", v37);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v59[5] = v36;
  -[CPSLocationConsentViewController contentView](self, "contentView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "widthAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "widthAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:constant:", v29, 8.0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v59[6] = v30;
  -[CPSLocationConsentViewController contentView](self, "contentView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "bottomAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "bottomAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintEqualToAnchor:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v59[7] = v34;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v59, 8);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "activateConstraints:", v35);

}

- (void)viewWillAppear:(BOOL)a3
{
  MKMapPoint v4;
  MKMapView *mapView;
  void *v6;
  objc_super v7;
  _QWORD v8[2];
  MKMapRect v9;
  MKMapRect v10;
  MKMapRect v11;

  v8[1] = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)CPSLocationConsentViewController;
  -[CPSLocationConsentViewController viewWillAppear:](&v7, sel_viewWillAppear_, a3);
  if (self->_circleOverlay)
  {
    v4 = MKMapPointForCoordinate(self->_deviceLocationCoordinate);
    -[MKCircle boundingMapRect](self->_circleOverlay, "boundingMapRect");
    v11.size.width = 0.0;
    v11.size.height = 0.0;
    v11.origin.x = v4.x;
    v11.origin.y = v4.y;
    v10 = MKMapRectUnion(v9, v11);
    -[MKMapView setVisibleMapRect:edgePadding:animated:](self->_mapView, "setVisibleMapRect:edgePadding:animated:", 0, v10.origin.x, v10.origin.y, v10.size.width, v10.size.height, 40.0, 40.0, 40.0, 40.0);
  }
  else
  {
    mapView = self->_mapView;
    v8[0] = self->_deviceLocationAnnotation;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKMapView showAnnotations:animated:](mapView, "showAnnotations:animated:", v6, 0);

  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  void (**actionHandler)(id, _QWORD);
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CPSLocationConsentViewController;
  -[CPSLocationConsentViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, a3);
  actionHandler = (void (**)(id, _QWORD))self->_actionHandler;
  if (actionHandler)
    actionHandler[2](actionHandler, 0);
}

- (void)_buttonActionTriggered:(id)a3
{
  OBLinkTrayButton *v4;
  void (**actionHandler)(id, uint64_t);
  uint64_t v6;
  void *v7;
  id v8;
  OBLinkTrayButton *v9;

  v4 = (OBLinkTrayButton *)a3;
  actionHandler = (void (**)(id, uint64_t))self->_actionHandler;
  if (actionHandler)
  {
    v9 = v4;
    if (self->_allowForAllButton == v4)
    {
      v6 = 1;
    }
    else if (self->_allowOnceButton == v4)
    {
      v6 = 2;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D10808], "setLocationServiceEnabled:", 0);
      actionHandler = (void (**)(id, uint64_t))self->_actionHandler;
      v6 = 3;
    }
    actionHandler[2](actionHandler, v6);
    objc_msgSend(MEMORY[0x1E0D107D0], "sharedLogger");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "recordDidShowLocationConsentWithBundleID:response:", self->_clipBundleID, v6);

    v8 = self->_actionHandler;
    self->_actionHandler = 0;

    v4 = v9;
  }

}

- (void)mapViewDidChangeVisibleRegion:(id)a3
{
  MKCircle *circleOverlay;
  id v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  id v14;
  MKMapRect v15;
  MKCoordinateRegion v16;
  CGRect v17;

  circleOverlay = self->_circleOverlay;
  if (circleOverlay)
  {
    v5 = a3;
    -[MKCircle boundingMapRect](circleOverlay, "boundingMapRect");
    v16 = MKCoordinateRegionForMapRect(v15);
    objc_msgSend(v5, "convertRegion:toRectToView:", v5, v16.center.latitude, v16.center.longitude, v16.span.latitudeDelta, v16.span.longitudeDelta);
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    objc_msgSend(v5, "viewForAnnotation:", self->_circleOverlay);
    v14 = (id)objc_claimAutoreleasedReturnValue();

    v17.origin.x = v7;
    v17.origin.y = v9;
    v17.size.width = v11;
    v17.size.height = v13;
    objc_msgSend(v14, "setHidden:", CGRectGetWidth(v17) > 10.0);

  }
}

- (id)mapView:(id)a3 viewForAnnotation:(id)a4
{
  id v6;
  MKPointAnnotation *v7;
  MKPointAnnotation *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  CGRect v16;

  v6 = a3;
  v7 = (MKPointAnnotation *)a4;
  v8 = v7;
  if (self->_deviceLocationAnnotation == v7)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC1878]), "initWithAnnotation:reuseIdentifier:", v7, 0);
    objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setMarkerTintColor:", v10);

    objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setGlyphTintColor:", v11);

    objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", self->_deviceLocationSymbolName);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setGlyphImage:", v12);

    LODWORD(v13) = 1148846080;
LABEL_6:
    objc_msgSend(v9, "setDisplayPriority:", v13);
    goto LABEL_7;
  }
  if ((MKPointAnnotation *)self->_circleOverlay == v7)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC1748]), "initWithSize:", 18.0, 18.0);
    objc_msgSend(v9, "bounds");
    objc_msgSend(v9, "_setContinuousCornerRadius:", CGRectGetHeight(v16) * 0.5);
    objc_msgSend(MEMORY[0x1E0CEA478], "systemBlueColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setBackgroundColor:", v14);

    objc_msgSend(v9, "setAlpha:", 0.45);
    LODWORD(v13) = 1144750080;
    goto LABEL_6;
  }
  v9 = 0;
LABEL_7:

  return v9;
}

- (id)mapView:(id)a3 rendererForOverlay:(id)a4
{
  objc_class *v4;
  id v5;
  void *v6;
  objc_class *v7;
  id v8;
  void *v9;

  if (self->_circleOverlay == a4)
  {
    v7 = (objc_class *)MEMORY[0x1E0CC1770];
    v8 = a4;
    v6 = (void *)objc_msgSend([v7 alloc], "initWithCircle:", v8);

    objc_msgSend(MEMORY[0x1E0CEA478], "systemBlueColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFillColor:", v9);

    objc_msgSend(v6, "setAlpha:", 0.15);
  }
  else
  {
    v4 = (objc_class *)MEMORY[0x1E0CC18A0];
    v5 = a4;
    v6 = (void *)objc_msgSend([v4 alloc], "initWithOverlay:", v5);

  }
  return v6;
}

- (id)actionHandler
{
  return self->_actionHandler;
}

- (void)setActionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1264);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_actionHandler, 0);
  objc_storeStrong((id *)&self->_allowOnceButton, 0);
  objc_storeStrong((id *)&self->_allowForAllButton, 0);
  objc_storeStrong((id *)&self->_deviceLocationAnnotation, 0);
  objc_storeStrong((id *)&self->_circleOverlay, 0);
  objc_storeStrong((id *)&self->_mapView, 0);
  objc_storeStrong((id *)&self->_deviceLocationSymbolName, 0);
  objc_storeStrong((id *)&self->_region, 0);
  objc_storeStrong((id *)&self->_clipBundleID, 0);
  objc_storeStrong((id *)&self->_appName, 0);
}

@end
