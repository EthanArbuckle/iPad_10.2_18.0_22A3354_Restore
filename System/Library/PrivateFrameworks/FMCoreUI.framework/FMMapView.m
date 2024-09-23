@implementation FMMapView

- (FMMapView)init
{
  FMMapView *v2;
  FMMapView *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FMMapView;
  v2 = -[FMMapView init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[FMMapView initialize](v2, "initialize");
  return v3;
}

- (FMMapView)initWithCoder:(id)a3
{
  FMMapView *v3;
  FMMapView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FMMapView;
  v3 = -[FMMapView initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[FMMapView initialize](v3, "initialize");
  return v4;
}

- (void)didMoveToSuperview
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)FMMapView;
  -[FMMapView didMoveToSuperview](&v10, sel_didMoveToSuperview);
  -[FMMapView superview](self, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[FMMapView setupConstraints](self, "setupConstraints");
    -[FMMapView setupGestures](self, "setupGestures");
    -[FMMapView mapView](self, "mapView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDelegate:", self);

    objc_msgSend(MEMORY[0x24BDE5670], "displayLinkWithTarget:selector:", self, sel_synchronize);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMMapView setDisplayLink:](self, "setDisplayLink:", v5);

    -[FMMapView displayLink](self, "displayLink");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF18], "currentRunLoop");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addToRunLoop:forMode:", v7, *MEMORY[0x24BDBCB80]);

  }
  else
  {
    -[FMMapView displayLink](self, "displayLink");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[FMMapView displayLink](self, "displayLink");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "invalidate");

      -[FMMapView setDisplayLink:](self, "setDisplayLink:", 0);
      -[FMMapView setUserTrackingButton:](self, "setUserTrackingButton:", 0);
    }
    -[FMMapView invalidateLayoutTimer](self, "invalidateLayoutTimer");
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObserver:", self);
  }

}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  -[FMMapView displayLink](self, "displayLink");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[FMMapView displayLink](self, "displayLink");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invalidate");

    -[FMMapView setDisplayLink:](self, "setDisplayLink:", 0);
    -[FMMapView setUserTrackingButton:](self, "setUserTrackingButton:", 0);
  }
  -[FMMapView invalidateLayoutTimer](self, "invalidateLayoutTimer");
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", self);

  v6.receiver = self;
  v6.super_class = (Class)FMMapView;
  -[FMMapView dealloc](&v6, sel_dealloc);
}

- (void)initialize
{
  double v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v3 = *MEMORY[0x24BDBFB58];
  objc_msgSend(MEMORY[0x24BDDB0C0], "sharedLocationManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDesiredAccuracy:", v3);

  +[FMAnnotationView preloadAssets](FMAnnotationView, "preloadAssets");
  -[FMMapView setCurrentTrackingMode:](self, "setCurrentTrackingMode:", 0);
  -[FMMapView setCurrentSelectedState:](self, "setCurrentSelectedState:", 0);
  -[FMMapView setDoubleSelectionMode:](self, "setDoubleSelectionMode:", 0);
  -[FMMapView setRenderingMode:](self, "setRenderingMode:", 0);
  -[FMMapView setMaxZoomLevel:](self, "setMaxZoomLevel:", 0.100000001);
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.0, 0.478431374, 1.0, 1.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMMapView setUserLocationTintColor:](self, "setUserLocationTintColor:", v5);

  -[FMMapView setCanSelectUserAnnotation:](self, "setCanSelectUserAnnotation:", 1);
  -[FMMapView setCanChangeUserTrackingMode:](self, "setCanChangeUserTrackingMode:", 1);
  v6 = (void *)objc_opt_new();
  -[FMMapView setAccuracyOverlays:](self, "setAccuracyOverlays:", v6);

  -[FMMapView setTintAdjustmentMode:](self, "setTintAdjustmentMode:", 1);
  objc_msgSend(MEMORY[0x24BDBFA88], "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "location");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v8 = objc_alloc_init(MEMORY[0x24BDDB1B8]);
    v9 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(v8, "setLocation:", v9);

    -[FMMapView setUserLocation:](self, "setUserLocation:", v8);
    hasUserLocation = 1;

  }
  -[FMMapView createMKMapView](self, "createMKMapView");
  -[FMMapView createUserTrackingButton](self, "createUserTrackingButton");
  -[FMMapView setupCamera](self, "setupCamera");

}

- (void)createMKMapView
{
  MKMapView *v3;
  void *v4;
  MKMapView *mapView;

  v3 = (MKMapView *)objc_alloc_init(MEMORY[0x24BDDB130]);
  -[MKMapView setTranslatesAutoresizingMaskIntoConstraints:](v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[MKMapView setCompassEnabled:](v3, "setCompassEnabled:", 0);
  -[MKMapView setShowsUserLocation:](v3, "setShowsUserLocation:", 1);
  objc_msgSend(MEMORY[0x24BDDB170], "filterIncludingAllCategories");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKMapView setPointOfInterestFilter:](v3, "setPointOfInterestFilter:", v4);

  -[MKMapView setShowsBuildings:](v3, "setShowsBuildings:", 1);
  -[MKMapView setShowsAttribution:](v3, "setShowsAttribution:", 0);
  -[MKMapView _setShowsCurrentEnvironmentName:](v3, "_setShowsCurrentEnvironmentName:", 0);
  -[MKMapView _setShowsPressedLabelMarkerEffect:](v3, "_setShowsPressedLabelMarkerEffect:", 0);
  -[MKMapView setShowsTraffic:](v3, "setShowsTraffic:", 0);
  -[FMMapView addSubview:](self, "addSubview:", v3);
  mapView = self->_mapView;
  self->_mapView = v3;

}

- (void)createUserTrackingButton
{
  id v3;

  objc_msgSend(MEMORY[0x24BDDB1F8], "buttonWithUserTrackingView:", self);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[FMMapView setUserTrackingButton:](self, "setUserTrackingButton:", v3);

}

- (void)setupCamera
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  id v12;
  FMMapView *v13;
  id v14;

  -[FMMapView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("FMMapViewLastVisibleRect"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("FMMapViewLastVisibleInsets"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v7 = MEMORY[0x24BDAC760];
    v8 = 3221225472;
    v9 = __24__FMMapView_setupCamera__block_invoke;
    v10 = &unk_24C837068;
    v11 = v5;
    v12 = v6;
    v13 = self;
    v14 = v3;
    dispatch_async(MEMORY[0x24BDAC9B8], &v7);
    -[FMMapView setIsUserLocationUpdated:](self, "setIsUserLocationUpdated:", 1, v7, v8, v9, v10);

  }
}

void __24__FMMapView_setupCamera__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  id v47;

  objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), *(_QWORD *)(a1 + 32), 0);
  v47 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), *(_QWORD *)(a1 + 40), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("x"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  v5 = v4;
  objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("y"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValue");
  v8 = v7;
  objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("width"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "doubleValue");
  v11 = v10;
  objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("height"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "doubleValue");
  objc_msgSend(*(id *)(a1 + 48), "setLastVisibleMapRect:", v5, v8, v11, v13);

  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("top"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "doubleValue");
  v16 = v15;
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("left"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "doubleValue");
  v19 = v18;
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("bottom"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "doubleValue");
  v22 = v21;
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("right"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "doubleValue");
  objc_msgSend(*(id *)(a1 + 48), "setLastVisibleInsets:", v16, v19, v22, v24);

  if (*(_QWORD *)(a1 + 56) && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 56), "edgeInsetsForState:", objc_msgSend(*(id *)(a1 + 48), "currentSelectedState"));
    objc_msgSend(*(id *)(a1 + 48), "setLastVisibleInsets:");
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 56), "attributionInsetsForState:", objc_msgSend(*(id *)(a1 + 48), "currentSelectedState"));
    v26 = v25;
    v28 = v27;
    v30 = v29;
    v32 = v31;
  }
  else
  {
    v30 = 6.0;
    v26 = 0.0;
    v32 = -38.0;
    v28 = 0.0;
  }
  objc_msgSend(*(id *)(a1 + 48), "mapView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "lastVisibleMapRect");
  v35 = v34;
  v37 = v36;
  v39 = v38;
  v41 = v40;
  objc_msgSend(*(id *)(a1 + 48), "lastVisibleInsets");
  objc_msgSend(v33, "setVisibleMapRect:edgePadding:animated:", 0, v35, v37, v39, v41, v42, v43, v44, v45);

  objc_msgSend(*(id *)(a1 + 48), "mapView");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "_setAttributionInsets:", v26, v28, v30, v32);

}

- (void)setupConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v7 = CFSTR("mapView");
  -[FMMapView mapView](self, "mapView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-0-[mapView]-0-|"), 0, 0, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-0-[mapView]-0-|"), 0, 0, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMMapView addConstraints:](self, "addConstraints:", v5);
  -[FMMapView addConstraints:](self, "addConstraints:", v6);

}

- (void)setupGestures
{
  void *v3;
  FMMapGestureRecognizer *v4;

  v4 = objc_alloc_init(FMMapGestureRecognizer);
  -[FMMapGestureRecognizer setTouchDelegate:](v4, "setTouchDelegate:", self);
  -[FMMapView setMapGesture:](self, "setMapGesture:", v4);
  -[FMMapView mapView](self, "mapView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addGestureRecognizer:", v4);

}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  void *v5;
  objc_super v6;

  -[FMMapView mapView](self, "mapView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "mapType"))
    v4 = 0.5;
  else
    v4 = 0.35;

  v6.receiver = self;
  v6.super_class = (Class)FMMapView;
  -[FMMapView layoutSubviews](&v6, sel_layoutSubviews);
  -[FMMapView invalidateLayoutTimer](self, "invalidateLayoutTimer");
  objc_msgSend(MEMORY[0x24BDBCF40], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel_layoutMapView, 0, 0, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMMapView setLayoutTimer:](self, "setLayoutTimer:", v5);

}

- (void)layoutMapView
{
  void *v3;
  BOOL v4;
  id v5;

  -[FMMapView setLayoutTimer:](self, "setLayoutTimer:", 0);
  -[FMMapView selectedAnnotation](self, "selectedAnnotation");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[FMMapView mapView](self, "mapView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "userTrackingMode") == 2
    || -[FMMapView isPreventingMapUpdates](self, "isPreventingMapUpdates")
    || -[FMMapView isMapMoved](self, "isMapMoved"))
  {

  }
  else
  {
    v4 = -[FMMapView isMapPositioningDisabled](self, "isMapPositioningDisabled");

    if (!v4)
    {
      if (v5)
      {
        -[FMMapView updateCameraPositionForAnnotation:](self, "updateCameraPositionForAnnotation:");
      }
      else if (-[FMMapView isAllAnnotationsShown](self, "isAllAnnotationsShown"))
      {
        -[FMMapView setLastVisibleMapRect:](self, "setLastVisibleMapRect:", *MEMORY[0x24BDDAFE0], *(double *)(MEMORY[0x24BDDAFE0] + 8), *(double *)(MEMORY[0x24BDDAFE0] + 16), *(double *)(MEMORY[0x24BDDAFE0] + 24));
        -[FMMapView displayAllAnnotations](self, "displayAllAnnotations");
      }
      else
      {
        -[FMMapView recenterVisibleAnnotations](self, "recenterVisibleAnnotations");
      }
    }
  }

}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FMMapView;
  -[FMMapView traitCollectionDidChange:](&v5, sel_traitCollectionDidChange_, a3);
  -[FMMapView selectedAnnotation](self, "selectedAnnotation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    -[FMMapView setIsAllAnnotationsShown:](self, "setIsAllAnnotationsShown:", 1);
}

- (void)setUserLocationTintColor:(id)a3
{
  UIColor *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  UIColor *userLocationTintColor;

  v4 = (UIColor *)a3;
  -[FMMapView mapView](self, "mapView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMMapView mapView](self, "mapView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "userLocation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewForAnnotation:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTintColor:", v4);

  userLocationTintColor = self->_userLocationTintColor;
  self->_userLocationTintColor = v4;

}

- (void)addAnnotation:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[FMMapView mapView](self, "mapView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAnnotation:", v4);

}

- (void)addAnnotations:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[FMMapView mapView](self, "mapView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAnnotations:", v4);

}

- (void)removeAnnotation:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[FMMapView removeUserAnnotationIfNeeded:](self, "removeUserAnnotationIfNeeded:", v4);
  -[FMMapView mapView](self, "mapView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAnnotation:", v4);

}

- (void)removeAnnotations:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        -[FMMapView removeUserAnnotationIfNeeded:](self, "removeUserAnnotationIfNeeded:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }
  -[FMMapView mapView](self, "mapView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeAnnotations:", v4);

}

- (id)viewForAnnotation:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[FMMapView mapView](self, "mapView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewForAnnotation:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)deselectAllAnnotations
{
  void *v3;
  void *v4;
  void *v5;

  -[FMMapView mapView](self, "mapView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMMapView mapView](self, "mapView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "overlays");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeOverlays:", v5);

  -[FMMapView deselectAnnotationViewIfNeeded:](self, "deselectAnnotationViewIfNeeded:", 0);
}

- (void)selectAnnotation:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  -[FMMapView deselectAnnotationViewIfNeeded:](self, "deselectAnnotationViewIfNeeded:", 0);
  -[FMMapView delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMMapView viewForAnnotation:](self, "viewForAnnotation:", v16);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMMapView setCurrentSelectedState:](self, "setCurrentSelectedState:", 1);
  -[FMMapView setSelectedAnnotationView:](self, "setSelectedAnnotationView:", v5);
  -[FMMapView setSelectedAnnotation:](self, "setSelectedAnnotation:", v16);
  -[FMMapView selectedAnnotationView](self, "selectedAnnotationView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSelected:animated:delay:", 1, 1, 0.400000006);

  -[FMMapView _setUserTrackingMode:animated:fromTrackingButton:](self, "_setUserTrackingMode:animated:fromTrackingButton:", 0, 1, 0);
  -[FMMapView mapView](self, "mapView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "selectedAnnotations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMMapView userLocation](self, "userLocation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isEqual:", v10);

  if (v11)
  {
    -[FMMapView mapView](self, "mapView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMMapView mapView](self, "mapView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "userLocation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "deselectAnnotation:animated:", v14, 1);

  }
  if (v4 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "didSelectAnnotation:", v16);
  if (v16)
    -[FMMapView depthSortAnnotations](self, "depthSortAnnotations");
  -[FMMapView setIsMapAnimating:](self, "setIsMapAnimating:", 0);
  -[FMMapView setLastVisibleMapRect:](self, "setLastVisibleMapRect:", *MEMORY[0x24BDDAFE0], *(double *)(MEMORY[0x24BDDAFE0] + 8), *(double *)(MEMORY[0x24BDDAFE0] + 16), *(double *)(MEMORY[0x24BDDAFE0] + 24));
  -[FMMapView layoutTimer](self, "layoutTimer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "invalidate");

  -[FMMapView setLayoutTimer:](self, "setLayoutTimer:", 0);
  -[FMMapView repositionOnAnnotation:withZoom:](self, "repositionOnAnnotation:withZoom:", v16, 1);

}

- (void)invalidateLayoutTimer
{
  void *v3;
  void *v4;

  -[FMMapView layoutTimer](self, "layoutTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[FMMapView layoutTimer](self, "layoutTimer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invalidate");

    -[FMMapView setLayoutTimer:](self, "setLayoutTimer:", 0);
  }
}

- (void)doubleSelectAnnotation:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[FMMapView invalidateLayoutTimer](self, "invalidateLayoutTimer");
  -[FMMapView setIsMapPositioningDisabled:](self, "setIsMapPositioningDisabled:", 0);
  -[FMMapView selectedAnnotationView](self, "selectedAnnotationView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSelected:animated:", 0, 1);

  -[FMMapView didDoubleSelectAnnotation:](self, "didDoubleSelectAnnotation:", v5);
}

- (void)removeUserAnnotationIfNeeded:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[FMMapView userLocationView](self, "userLocationView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMMapView currentDeviceAnnotation](self, "currentDeviceAnnotation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqual:", v4))
  {
    -[FMMapView setUserLocationView:](self, "setUserLocationView:", 0);
  }
  else if (objc_msgSend(v6, "isEqual:", v5))
  {
    -[FMMapView setCurrentDeviceAnnotation:](self, "setCurrentDeviceAnnotation:", 0);
  }

}

- (void)deselectAnnotationViewIfNeeded:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = a3;
  -[FMMapView selectedAnnotationView](self, "selectedAnnotationView");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v6;
  if (v4 != v6)
  {
    -[FMMapView deselectAnnotationView:](self, "deselectAnnotationView:", v6);
    v5 = v6;
  }

}

- (void)deselectAnnotationView:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[FMMapView delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_opt_new();
  -[FMMapView selectedAnnotation](self, "selectedAnnotation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setOverlay:", v5);

  -[FMMapView setCurrentSelectedState:](self, "setCurrentSelectedState:", 0);
  -[FMMapView selectedAnnotationView](self, "selectedAnnotationView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSelected:animated:", 0, 1);

  -[FMMapView setSelectedAnnotationView:](self, "setSelectedAnnotationView:", 0);
  -[FMMapView setSelectedAnnotation:](self, "setSelectedAnnotation:", 0);
  objc_msgSend(v9, "annotation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMMapView updateOverlayForAnnotation:withForce:](self, "updateOverlayForAnnotation:withForce:", v8, 1);

  if (v4 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "didDeselectAnnotationView:", v9);

}

- (void)didSelectAnnotation:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  dispatch_time_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t);
  void *v21;
  FMMapView *v22;
  id v23;

  v4 = a3;
  -[FMMapView delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[FMMapView isAllAnnotationsShown](self, "isAllAnnotationsShown");
  -[FMMapView viewForAnnotation:](self, "viewForAnnotation:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMMapView setCurrentSelectedState:](self, "setCurrentSelectedState:", 1);
  -[FMMapView setSelectedAnnotationView:](self, "setSelectedAnnotationView:", v7);
  -[FMMapView setSelectedAnnotation:](self, "setSelectedAnnotation:", v4);
  -[FMMapView selectedAnnotationView](self, "selectedAnnotationView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v6)
    objc_msgSend(v8, "setSelected:animated:delay:", 1, 1, 0.400000006);
  else
    objc_msgSend(v8, "setSelected:animated:", 1, 1);

  -[FMMapView setCanSelectUserAnnotation:](self, "setCanSelectUserAnnotation:", 0);
  -[FMMapView userSelectionTimer](self, "userSelectionTimer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[FMMapView userSelectionTimer](self, "userSelectionTimer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "invalidate");

    -[FMMapView setUserSelectionTimer:](self, "setUserSelectionTimer:", 0);
  }
  objc_msgSend(MEMORY[0x24BDBCF40], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel_updateCanSelectUserAnnotation, 0, 0, 0.5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMMapView setUserSelectionTimer:](self, "setUserSelectionTimer:", v12);

  objc_msgSend(v7, "annotation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMMapView updateOverlayForAnnotation:withForce:](self, "updateOverlayForAnnotation:withForce:", v13, 1);

  if (v5 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "didSelectAnnotation:", v4);
  if (-[FMMapView showUserLocationCallout](self, "showUserLocationCallout"))
  {
    -[FMMapView mapView](self, "mapView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMMapView mapView](self, "mapView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "userLocation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "deselectAnnotation:animated:", v16, 1);

  }
  if (!-[FMMapView isMapPositioningDisabled](self, "isMapPositioningDisabled"))
  {
    -[FMMapView _setUserTrackingMode:animated:fromTrackingButton:](self, "_setUserTrackingMode:animated:fromTrackingButton:", 0, 1, 0);
    if (-[FMMapView isAllAnnotationsShown](self, "isAllAnnotationsShown"))
    {
      -[FMMapView recenterVisibleAnnotations](self, "recenterVisibleAnnotations");
      -[FMMapView setIsAllAnnotationsShown:](self, "setIsAllAnnotationsShown:", 0);
    }
  }
  if (-[FMMapView renderingMode](self, "renderingMode"))
  {
    -[FMMapView updateCameraPositionForAnnotation:](self, "updateCameraPositionForAnnotation:", v4);
  }
  else if (v6)
  {
    v17 = dispatch_time(0, 400000000);
    v18 = MEMORY[0x24BDAC760];
    v19 = 3221225472;
    v20 = __33__FMMapView_didSelectAnnotation___block_invoke;
    v21 = &unk_24C837090;
    v22 = self;
    v23 = v4;
    dispatch_after(v17, MEMORY[0x24BDAC9B8], &v18);

  }
  else
  {
    -[FMMapView slideAnnotationIntoViewIfNeeded:](self, "slideAnnotationIntoViewIfNeeded:", v4);
  }
  -[FMMapView depthSortAnnotations](self, "depthSortAnnotations", v18, v19, v20, v21, v22);

}

uint64_t __33__FMMapView_didSelectAnnotation___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "slideAnnotationIntoViewIfNeeded:", *(_QWORD *)(a1 + 40));
}

- (void)updateCanSelectUserAnnotation
{
  -[FMMapView setCanSelectUserAnnotation:](self, "setCanSelectUserAnnotation:", 1);
}

- (void)didDoubleSelectAnnotation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  dispatch_time_t v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[FMMapView delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMMapView viewForAnnotation:](self, "viewForAnnotation:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMMapView setIsMapPositioningDisabled:](self, "setIsMapPositioningDisabled:", 0);
  -[FMMapView _setUserTrackingMode:animated:fromTrackingButton:](self, "_setUserTrackingMode:animated:fromTrackingButton:", 0, 1, 0);
  -[FMMapView setCurrentSelectedState:](self, "setCurrentSelectedState:", 2);
  -[FMMapView setSelectedAnnotationView:](self, "setSelectedAnnotationView:", v6);
  -[FMMapView setSelectedAnnotation:](self, "setSelectedAnnotation:", v4);
  objc_msgSend(v6, "setSelected:animated:", 1, 1);
  if (v5 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "didDoubleSelectAnnotation:", v4);
  if (-[FMMapView doubleSelectionMode](self, "doubleSelectionMode"))
  {
    v7 = dispatch_time(0, 500000000);
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __39__FMMapView_didDoubleSelectAnnotation___block_invoke;
    v8[3] = &unk_24C837090;
    v8[4] = self;
    v9 = v6;
    dispatch_after(v7, MEMORY[0x24BDAC9B8], v8);

  }
  else
  {
    -[FMMapView repositionOnAnnotation:withZoom:](self, "repositionOnAnnotation:withZoom:", v4, 1);
  }

}

uint64_t __39__FMMapView_didDoubleSelectAnnotation___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "selectOrDeselectAnnotationView:", *(_QWORD *)(a1 + 40));
}

- (void)selectOrDeselectAnnotationView:(id)a3
{
  int64_t v4;
  void *v5;
  void *v6;
  int64_t v7;
  void *v8;
  id v9;

  v9 = a3;
  -[FMMapView deselectAnnotationViewIfNeeded:](self, "deselectAnnotationViewIfNeeded:");
  v4 = -[FMMapView currentSelectedState](self, "currentSelectedState");
  if (v4 == 2)
  {
    objc_msgSend(v9, "annotation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMMapView didSelectAnnotation:](self, "didSelectAnnotation:", v8);
LABEL_8:

    goto LABEL_9;
  }
  if (v4 == 1)
  {
    objc_msgSend(v9, "annotation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMMapView didDoubleSelectAnnotation:](self, "didDoubleSelectAnnotation:", v8);
    goto LABEL_8;
  }
  v5 = v9;
  if (!v4)
  {
    objc_msgSend(v9, "annotation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMMapView didSelectAnnotation:](self, "didSelectAnnotation:", v6);

    v7 = -[FMMapView renderingMode](self, "renderingMode");
    v5 = v9;
    if (!v7)
    {
      -[FMMapView setIsMapPositioningDisabled:](self, "setIsMapPositioningDisabled:", 1);
LABEL_9:
      v5 = v9;
    }
  }

}

- (void)addOverlay:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[FMMapView mapView](self, "mapView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addOverlay:", v4);

}

- (void)addOverlays:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[FMMapView mapView](self, "mapView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addOverlays:", v4);

}

- (void)removeOverlay:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[FMMapView mapView](self, "mapView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeOverlay:", v4);

}

- (void)removeOverlays:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[FMMapView mapView](self, "mapView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeOverlays:", v4);

}

- (void)updateOverlayForAnnotation:(id)a3 withForce:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  _BOOL4 v19;
  void *v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  int v28;
  void *v29;
  double v30;
  void *v31;
  double v32;
  id v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  double v39;
  double v40;
  id v41;

  v4 = a4;
  v41 = a3;
  if (objc_msgSend(v41, "hasKnownLocation"))
  {
    if ((objc_msgSend(v41, "isThisDevice") & 1) == 0)
    {
      -[FMMapView selectedAnnotation](self, "selectedAnnotation");
      v6 = (id)objc_claimAutoreleasedReturnValue();

      if (v6 == v41)
      {
        -[FMMapView mapView](self, "mapView");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "_zoomLevel");
        v9 = v8;

        objc_msgSend(v41, "coordinate");
        v11 = v10;
        v13 = v12;
        -[FMMapView viewForAnnotation:](self, "viewForAnnotation:", v41);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          -[FMMapView coordinateForAnnotationView:](self, "coordinateForAnnotationView:", v14);
          v11 = v15;
          v13 = v16;
        }
        v17 = v9 * 0.0000999999975;
        if (-[FMMapView isMapAnimating](self, "isMapAnimating")
          || -[FMMapView isFingerOnMap](self, "isFingerOnMap")
          || -[FMMapView isPreviewing](self, "isPreviewing"))
        {
LABEL_11:
          if (-[FMMapView shouldDisplayOverlay](self, "shouldDisplayOverlay"))
          {
            objc_msgSend(v41, "overlay");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = -[FMMapView isOverlayOnMap:](self, "isOverlayOnMap:", v18);

            if (v19 && !v4)
              goto LABEL_30;
          }
          objc_msgSend(v41, "overlay");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "coordinate");
          if (vabdd_f64(v21, v11) <= v17)
          {
            objc_msgSend(v41, "overlay");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "coordinate");
            if (vabdd_f64(v23, v13) <= v17)
            {
              objc_msgSend(v41, "horizontalAccuracy");
              v25 = v24;
              objc_msgSend(v41, "overlay");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "radius");
              if (v25 == v27 && !v4)
              {
                v28 = -[FMMapView shouldDisplayOverlay](self, "shouldDisplayOverlay");

                if ((v28 & 1) != 0)
                  goto LABEL_30;
                goto LABEL_28;
              }

            }
          }

LABEL_28:
          -[FMMapView setShouldDisplayOverlay:](self, "setShouldDisplayOverlay:", 1);
          objc_msgSend(v41, "coordinate");
          v33 = v41;
          v11 = v34;
          v13 = v35;
          goto LABEL_29;
        }
        objc_msgSend(v41, "overlay");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "coordinate");
        if (vabdd_f64(v30, v11) <= v17)
        {
          objc_msgSend(v41, "overlay");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "coordinate");
          if (vabdd_f64(v32, v13) <= v17)
          {
            objc_msgSend(v41, "horizontalAccuracy");
            v37 = v36;
            objc_msgSend(v41, "overlay");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "radius");
            v40 = v39;

            if (v37 == v40)
              goto LABEL_11;
LABEL_24:
            -[FMMapView setShouldDisplayOverlay:](self, "setShouldDisplayOverlay:", 0);
            v33 = v41;
LABEL_29:
            -[FMMapView refreshOverlayForAnnotation:andCoordinate:](self, "refreshOverlayForAnnotation:andCoordinate:", v33, v11, v13);
LABEL_30:

            goto LABEL_5;
          }

        }
        goto LABEL_24;
      }
    }
  }
  -[FMMapView removeAllOverlaysAndCurrentAnnotationOverlay:](self, "removeAllOverlaysAndCurrentAnnotationOverlay:", v41);
LABEL_5:

}

- (void)refreshOverlayForAnnotation:(id)a3 andCoordinate:(CLLocationCoordinate2D)a4
{
  double longitude;
  double latitude;
  id v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  longitude = a4.longitude;
  latitude = a4.latitude;
  v7 = a3;
  -[FMMapView removeAllOverlaysAndCurrentAnnotationOverlay:](self, "removeAllOverlaysAndCurrentAnnotationOverlay:", v7);
  objc_msgSend(v7, "horizontalAccuracy");
  +[MKCircle circleWithCenterCoordinate:radius:](FMAccuracyOverlay, "circleWithCenterCoordinate:radius:", latitude, longitude, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setOverlay:", v9);

  objc_msgSend(v7, "overlay");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setParentAnnotation:", v7);

  -[FMMapView mapView](self, "mapView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "overlay");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addOverlay:", v12);

  -[FMMapView accuracyOverlays](self, "accuracyOverlays");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "overlay");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "addObject:", v13);
}

- (void)removeAllOverlaysAndCurrentAnnotationOverlay:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[FMMapView mapView](self, "mapView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "overlay");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "removeOverlay:", v6);
  -[FMMapView mapView](self, "mapView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMMapView accuracyOverlays](self, "accuracyOverlays");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeOverlays:", v8);

  -[FMMapView accuracyOverlays](self, "accuracyOverlays");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeAllObjects");

}

- (BOOL)isOverlayOnMap:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[FMMapView mapView](self, "mapView", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "overlays");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v6);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "isEqual:", v4) & 1) != 0)
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

- (void)updateCameraPositionWithLocation:(CLLocationCoordinate2D)a3 andAltitude:(double)a4
{
  double longitude;
  double latitude;
  void *v8;
  id v9;

  longitude = a3.longitude;
  latitude = a3.latitude;
  if (!-[FMMapView isUserSwiping](self, "isUserSwiping"))
  {
    -[FMMapView mapView](self, "mapView");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDDB0D0], "cameraLookingAtCenterCoordinate:fromEyeCoordinate:eyeAltitude:", latitude, longitude, latitude, longitude, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setCamera:animated:", v8, 0);

  }
}

- (void)updateCameraPositionForAnnotation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  _QWORD v38[3];

  v38[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[FMMapView selectedAnnotation](self, "selectedAnnotation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMMapView currentDeviceAnnotation](self, "currentDeviceAnnotation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMMapView otherSelectedAnnotation](self, "otherSelectedAnnotation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMMapView userLocation](self, "userLocation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[FMMapView isUserSwiping](self, "isUserSwiping")
    && -[FMMapView currentTrackingMode](self, "currentTrackingMode") != 2
    && !-[FMMapView isPreventingMapUpdates](self, "isPreventingMapUpdates"))
  {
    if (objc_msgSend(v4, "isEqual:", v5) && !-[FMMapView isMapAnimating](self, "isMapAnimating"))
    {
      if (!-[FMMapView isMapPositioningDisabled](self, "isMapPositioningDisabled")
        && -[FMMapView currentTrackingMode](self, "currentTrackingMode") != 2)
      {
        if (-[FMMapView currentTrackingMode](self, "currentTrackingMode")
          || -[FMMapView isAllAnnotationsShown](self, "isAllAnnotationsShown"))
        {
          if (v5)
          {
            if (v8)
            {
              if ((objc_msgSend(v6, "isEqual:", v5) & 1) == 0)
              {
                v38[0] = v5;
                v38[1] = v8;
                objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v38, 2);
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                -[FMMapView mapRectForAnnotations:shouldIncludeRadius:](self, "mapRectForAnnotations:shouldIncludeRadius:", v20, 1);
                v22 = v21;
                v24 = v23;
                v26 = v25;
                v28 = v27;

                if (v22 != *MEMORY[0x24BDDAFE0] || v24 != *(double *)(MEMORY[0x24BDDAFE0] + 8))
                {
                  -[FMMapView mapView](self, "mapView");
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v29, "bounds");
                  v31 = v30 / v26;

                  -[FMMapView maxZoomLevel](self, "maxZoomLevel");
                  if (v31 > v32)
                  {
                    -[FMMapView maxZoomLevel](self, "maxZoomLevel");
                    -[FMMapView normalizeMapRect:toZoomScale:](self, "normalizeMapRect:toZoomScale:", v22, v24, v26, v28, v33);
                    v22 = v34;
                    v24 = v35;
                    v26 = v36;
                    v28 = v37;
                  }
                  -[FMMapView updateCameraPositionForMapRect:withZoom:](self, "updateCameraPositionForMapRect:withZoom:", 1, v22, v24, v26, v28);
                }
              }
            }
          }
        }
        else if (-[FMMapView currentSelectedState](self, "currentSelectedState") == 2
               || -[FMMapView currentSelectedState](self, "currentSelectedState") == 1
               || objc_msgSend(v4, "isEqual:", v6))
        {
          -[FMMapView repositionOnAnnotation:withZoom:](self, "repositionOnAnnotation:withZoom:", v5, 1);
        }
      }
      -[FMMapView updateOverlayForAnnotation:withForce:](self, "updateOverlayForAnnotation:withForce:", v4, 1);
    }
    else if (!-[FMMapView isAllAnnotationsShown](self, "isAllAnnotationsShown")
           || -[FMMapView currentSelectedState](self, "currentSelectedState")
           || v7)
    {
      if (-[FMMapView userTrackingMode](self, "userTrackingMode") == 1
        && v8
        && !v5
        && !-[FMMapView currentSelectedState](self, "currentSelectedState")
        && !v7)
      {
        -[FMMapView nearbyAnnotations](self, "nearbyAnnotations");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (void *)objc_msgSend(v18, "mutableCopy");

        objc_msgSend(v19, "addObject:", v8);
        -[FMMapView mapRectForAnnotations:shouldIncludeRadius:](self, "mapRectForAnnotations:shouldIncludeRadius:", v19, 1);
        -[FMMapView repositionOnMapRectIfNeeded:](self, "repositionOnMapRectIfNeeded:");

      }
    }
    else
    {
      -[FMMapView nearbyAnnotations](self, "nearbyAnnotations");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[FMMapView mapRectForAnnotations:shouldIncludeRadius:](self, "mapRectForAnnotations:shouldIncludeRadius:", v9, 1);
      v11 = v10;
      v13 = v12;
      v15 = v14;
      v17 = v16;

      -[FMMapView repositionOnMapRectIfNeeded:](self, "repositionOnMapRectIfNeeded:", v11, v13, v15, v17);
    }
  }

}

- (void)repositionOnMapRectIfNeeded:(id)a3
{
  double var1;
  double var0;
  double v5;
  double v6;
  double v8;
  double v9;
  double v10;
  double v12;

  var1 = a3.var1.var1;
  var0 = a3.var1.var0;
  v5 = a3.var0.var1;
  v6 = a3.var0.var0;
  -[FMMapView lastVisibleMapRect](self, "lastVisibleMapRect");
  v9 = v8;
  -[FMMapView lastVisibleMapRect](self, "lastVisibleMapRect");
  if (v6 != *MEMORY[0x24BDDAFE0] || v5 != *(double *)(MEMORY[0x24BDDAFE0] + 8))
  {
    v12 = var0 * var1 / (v9 * v10);
    if (v12 < 0.7 || v12 > 1.3)
      -[FMMapView repositionToMapRect:withZoom:](self, "repositionToMapRect:withZoom:", 1, v6, v5, var0, var1);
  }
}

- (void)setIsMapPositioningDisabled:(BOOL)a3
{
  self->_isMapPositioningDisabled = a3;
}

- (void)updateCameraPositionForNoLocation
{
  double v3;
  double v4;
  double v5;

  -[FMMapView lastVisibleMapRect](self, "lastVisibleMapRect");
  v5 = v4 + -10000.0;
  if (v3 + -10000.0 != *MEMORY[0x24BDDAFE0] || v5 != *(double *)(MEMORY[0x24BDDAFE0] + 8))
    -[FMMapView repositionToMapRect:withZoom:](self, "repositionToMapRect:withZoom:", 1);
}

- (void)displayAllAnnotations
{
  void *v3;
  void *v4;

  if (!-[FMMapView isPreventingMapUpdates](self, "isPreventingMapUpdates"))
  {
    -[FMMapView selectedAnnotation](self, "selectedAnnotation");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMMapView setIsGoingBackToAllAnnotation:](self, "setIsGoingBackToAllAnnotation:", v3 != 0);

    -[FMMapView deselectAllAnnotations](self, "deselectAllAnnotations");
    -[FMMapView setSelectedAnnotation:](self, "setSelectedAnnotation:", 0);
    -[FMMapView setSelectedAnnotationView:](self, "setSelectedAnnotationView:", 0);
    -[FMMapView setIsAllAnnotationsShown:](self, "setIsAllAnnotationsShown:", 1);
    -[FMMapView setIsMapPositioningDisabled:](self, "setIsMapPositioningDisabled:", 0);
    -[FMMapView layoutTimer](self, "layoutTimer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invalidate");

    -[FMMapView setLayoutTimer:](self, "setLayoutTimer:", 0);
    -[FMMapView animateToAllAnnotation](self, "animateToAllAnnotation");
    -[FMMapView setIsGoingBackToAllAnnotation:](self, "setIsGoingBackToAllAnnotation:", 0);
  }
}

- (void)animateToAllAnnotation
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  -[FMMapView setRenderingMode:](self, "setRenderingMode:", 0);
  -[FMMapView nearbyAnnotations](self, "nearbyAnnotations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMMapView mapRectForAnnotations:shouldIncludeRadius:](self, "mapRectForAnnotations:shouldIncludeRadius:", v3, 1);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[FMMapView _setUserTrackingMode:animated:fromTrackingButton:](self, "_setUserTrackingMode:animated:fromTrackingButton:", 0, 1, 0);
  if (v5 != *MEMORY[0x24BDDAFE0] || v7 != *(double *)(MEMORY[0x24BDDAFE0] + 8))
    -[FMMapView repositionToMapRect:withZoom:](self, "repositionToMapRect:withZoom:", 1, v5, v7, v9, v11);
}

- (void)setRenderingMode:(int64_t)a3
{
  if (self->_renderingMode != a3)
  {
    self->_renderingMode = a3;
    if (a3 == 1)
    {
      -[FMMapView setCurrentTrackingMode:](self, "setCurrentTrackingMode:", 0);
      -[FMMapView _setUserTrackingMode:animated:fromTrackingButton:](self, "_setUserTrackingMode:animated:fromTrackingButton:", 0, 0, 0);
    }
    -[FMMapView animateRenderingModeChange](self, "animateRenderingModeChange");
  }
}

- (void)animateRenderingModeChange
{
  id v3;

  -[FMMapView setIsMapAnimating:](self, "setIsMapAnimating:", 0);
  -[FMMapView setIsMapPositioningDisabled:](self, "setIsMapPositioningDisabled:", 0);
  -[FMMapView setIsAllAnnotationsShown:](self, "setIsAllAnnotationsShown:", 0);
  -[FMMapView selectedAnnotation](self, "selectedAnnotation");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[FMMapView updateCameraPositionForAnnotation:](self, "updateCameraPositionForAnnotation:", v3);

}

- (void)refreshCameraPosition
{
  if (!-[FMMapView isUserSwiping](self, "isUserSwiping"))
  {
    -[FMMapView lastVisibleMapRect](self, "lastVisibleMapRect");
    -[FMMapView updateCameraPositionForMapRect:withZoom:](self, "updateCameraPositionForMapRect:withZoom:", 1);
    -[FMMapView depthSortAnnotations](self, "depthSortAnnotations");
  }
}

- (void)updateCameraPositionForMapRect:(id)a3 withZoom:(BOOL)a4
{
  _BOOL8 v4;
  double var1;
  double var0;
  double v7;
  double v8;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  double v23;
  unint64_t v24;
  unint64_t v25;
  BOOL v26;
  BOOL v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  uint64_t v36;
  double v37;
  double v38;
  double v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  int64_t v43;
  uint64_t v44;
  UIEdgeInsets v45;

  v4 = a4;
  var1 = a3.var1.var1;
  var0 = a3.var1.var0;
  v7 = a3.var0.var1;
  v8 = a3.var0.var0;
  v44 = *MEMORY[0x24BDAC8D0];
  if (!-[FMMapView isMapPositioningDisabled](self, "isMapPositioningDisabled")
    && !-[FMMapView isUserSwiping](self, "isUserSwiping"))
  {
    -[FMMapView delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v10, "edgeInsetsForState:", -[FMMapView currentSelectedState](self, "currentSelectedState"));
      v12 = v11;
      v38 = v14;
      v39 = v13;
      v16 = v15;
      LogCategory_Unspecified();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v45.top = v12;
        v45.right = v38;
        v45.left = v39;
        v45.bottom = v16;
        NSStringFromUIEdgeInsets(v45);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v41 = v18;
        v42 = 2048;
        v43 = -[FMMapView currentSelectedState](self, "currentSelectedState");
        _os_log_impl(&dword_20DBDA000, v17, OS_LOG_TYPE_DEFAULT, "FMMapView: delegate insets %@ currentState: %ld", buf, 0x16u);

      }
    }
    else
    {
      v12 = 38.0;
      v38 = 38.0;
      v39 = 38.0;
      v16 = 38.0;
    }
    v37 = v16;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v10, "attributionInsetsForState:", -[FMMapView currentSelectedState](self, "currentSelectedState"));
      v36 = v19;
      v21 = v20;
      v23 = v22;
      v25 = v24;
    }
    else
    {
      v23 = 6.0;
      v36 = 0;
      v25 = 0xC043000000000000;
      v21 = 0;
    }
    v26 = v8 == *MEMORY[0x24BDDAFE0] && v7 == *(double *)(MEMORY[0x24BDDAFE0] + 8);
    if (!v26
      || (var0 == *(double *)(MEMORY[0x24BDDAFE0] + 16)
        ? (v27 = var1 == *(double *)(MEMORY[0x24BDDAFE0] + 24))
        : (v27 = 0),
          !v27))
    {
      -[FMMapView lastVisibleMapRect](self, "lastVisibleMapRect");
      if (v31 != v8
        || v28 != v7
        || v29 != var0
        || v30 != var1
        || (-[FMMapView lastVisibleInsets](self, "lastVisibleInsets"), v35 != v39)
        || v32 != v12
        || v34 != v38
        || v33 != v37
        || -[FMMapView isMapMoved](self, "isMapMoved"))
      {
        -[FMMapView animateMapToPosition:withInsets:attributionInsets:andZoom:](self, "animateMapToPosition:withInsets:attributionInsets:andZoom:", v4, v8, v7, var0, var1, v12, v39, v37, v38, v36, v21, *(_QWORD *)&v23, v25);
      }
    }

  }
}

- (void)animateMapToPosition:(double)a3 withInsets:(double)a4 attributionInsets:(double)a5 andZoom:(double)a6
{
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  NSObject *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  int v47;
  unsigned __int8 v48;
  void *v49;
  double v50;
  double v51;
  double v52;
  int v53;
  NSObject *v54;
  int v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  void *v69;
  void *v70;
  double v71;
  double v72;
  double v73;
  double v74;
  void *v75;
  void *v76;
  void *v77;
  double v78;
  double v79;
  double v80;
  double v81;
  void *v82;
  void *v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  int v91;
  int v92;
  NSObject *v93;
  uint64_t v94;
  double v95;
  double v96;
  _BOOL4 v97;
  void *v98;
  void *v99;
  void *v100;
  double v101;
  double v102;
  double v103;
  double v104;
  void *v105;
  void *v106;
  double v107;
  double v108;
  double v109;
  double v110;
  double v111;
  double v112;
  double v113;
  int v114;
  double v115;
  double v116;
  double v117;
  NSObject *v118;
  double v119;
  void *v120;
  double v121;
  void *v122;
  double v123;
  double v124;
  double v125;
  void *v126;
  double v127;
  void *v128;
  void *v129;
  double v130;
  double v131;
  void *v132;
  double v133;
  double v134;
  void *v135;
  void *v136;
  double v137;
  double v138;
  double v139;
  double v140;
  void *v141;
  double v142;
  double v143;
  double v144;
  int v145;
  void *v146;
  void *v147;
  void *v148;
  double v149;
  double v150;
  double v151;
  double v152;
  dispatch_time_t v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  double v158;
  double v159;
  double v161;
  double v162;
  double v163;
  double v164;
  double v165;
  CGFloat insets;
  double v168;
  _QWORD block[13];
  uint8_t buf[4];
  _BYTE v171[10];
  void *v172;
  _WORD v173[13];
  MKMapPoint v174;
  CGSize v175;
  MKMapPoint v176;
  CGRect v177;
  UIEdgeInsets v178;

  *(_QWORD *)&v173[9] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "selectedAnnotation");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "mapView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "visibleMapRect");
  v31 = v30;

  v168 = a4;
  v163 = a2;
  v164 = a3;
  v165 = a5;
  v32 = a3 + a5 * 0.5;
  objc_msgSend(a1, "mapView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "visibleMapRect");
  v36 = v35 + v34 * 0.5;
  objc_msgSend(a1, "mapView");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "visibleMapRect");
  v40 = v39 + v38 * 0.5;

  v174.x = a2 + a4 * 0.5;
  v174.y = v32;
  v176.x = v36;
  v176.y = v40;
  v41 = MKMetersBetweenMapPoints(v174, v176);
  LogCategory_Unspecified();
  v42 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
    -[FMMapView animateMapToPosition:withInsets:attributionInsets:andZoom:].cold.2(a1, v42, a6, a7, a8, a9);

  objc_msgSend(a1, "safeAreaInsets");
  v44 = v43;
  objc_msgSend(a1, "safeAreaInsets");
  v46 = v45;
  v47 = objc_msgSend(a1, "isAllAnnotationsShown");
  v48 = objc_msgSend(a1, "isAllAnnotationsShown");
  objc_msgSend(a1, "mapView");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "_zoomLevel");
  if (v41 <= 600000.0 / v50)
  {
    v52 = fmin(vabdd_f64(v31, v168) / 10000.0, 0.5);
    if (v52 < 0.4)
      v53 = 1;
    else
      v53 = v47;
    if (v53)
      v52 = 0.4;
    if ((v48 & (v28 != 0)) != 0)
      v52 = 0.5;
    if (a11)
      v51 = v52;
    else
      v51 = 0.4;

  }
  else
  {

    if (!objc_msgSend(a1, "isAllAnnotationsShown")
      || v28
      || objc_msgSend(a1, "isGoingBackToAllAnnotation"))
    {
      v51 = 0.0;
    }
    else
    {
      v51 = 0.4;
    }
  }
  LogCategory_Unspecified();
  v54 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
  {
    v55 = objc_msgSend(a1, "isMapAnimating");
    objc_msgSend(a1, "layoutTimer");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67109888;
    *(_DWORD *)v171 = v55;
    *(_WORD *)&v171[4] = 1024;
    *(_DWORD *)&v171[6] = v56 != 0;
    LOWORD(v172) = 1024;
    *(_DWORD *)((char *)&v172 + 2) = objc_msgSend(a1, "isPreventingMapUpdates");
    HIWORD(v172) = 2048;
    *(double *)v173 = v51;
    _os_log_impl(&dword_20DBDA000, v54, OS_LOG_TYPE_DEFAULT, "animateMapToPosition isMapAnimating(%d) layoutTimer(%d) isPreventingMapUpdates(%d) duration(%f)", buf, 0x1Eu);

  }
  if ((objc_msgSend(a1, "isMapAnimating") & 1) == 0)
  {
    objc_msgSend(a1, "layoutTimer");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v57 && !objc_msgSend(a1, "isPreventingMapUpdates"))
      goto LABEL_27;

  }
  if (v51 == 0.0)
  {
LABEL_27:
    insets = a7;
    v159 = a8;
    v161 = a6 + v44;
    v162 = a8 + v46;
    objc_msgSend(a1, "setIsMapAnimating:", 1, *(_QWORD *)&v51);
    objc_msgSend(a1, "setIsMapMoved:", 0);
    v58 = objc_msgSend(a1, "renderingMode");
    objc_msgSend(a1, "mapView");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = v59;
    if (v58)
    {
      objc_msgSend(v59, "_setEdgeInsets:", v161, a7, v162, a9);
      v62 = v164;
      v61 = v165;
      v63 = v168;
      v64 = v163;
    }
    else
    {
      objc_msgSend(v59, "mapRectThatFits:edgePadding:", a2, v164, v168, v165, v161, a7, v162, a9);
      v64 = v65;
      v62 = v66;
      v63 = v67;
      v61 = v68;

      objc_msgSend(a1, "mapView");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "_setEdgeInsets:", 38.0, 38.0, 38.0, 38.0);
    }

    objc_msgSend(a1, "mapView");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "_setAttributionInsets:", a12, a13, a14, a15);

    objc_msgSend(a1, "mapView");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "bounds");
    v72 = v71 - (a7 + a9);
    v74 = v73 - (v161 + v162);

    objc_msgSend(MEMORY[0x24BDDB0D0], "_cameraLookingAtMapRect:forViewSize:", v64, v62, v63, v61, v72, v74);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "mapView");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "camera");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "altitude");
    v79 = v78;
    objc_msgSend(v75, "altitude");
    v81 = vabdd_f64(v79, v80);
    objc_msgSend(a1, "mapView");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "camera");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "centerCoordinate");
    v85 = v84;
    v87 = v86;
    objc_msgSend(v75, "centerCoordinate");
    objc_msgSend(a1, "distanceBetweenOrigin:andDestination:", v85, v87, v88, v89);
    objc_msgSend(a1, "dampingForAltitude:andDistance:", v81, v90);
    v92 = v91;

    LogCategory_Unspecified();
    v93 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v93, OS_LOG_TYPE_DEBUG))
    {
      v175.width = v72;
      v175.height = v74;
      NSStringFromCGSize(v175);
      v154 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "mapView");
      v155 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v155, "bounds");
      NSStringFromCGRect(v177);
      v156 = (void *)objc_claimAutoreleasedReturnValue();
      v178.top = v161;
      v178.bottom = v162;
      v178.left = insets;
      v178.right = a9;
      NSStringFromUIEdgeInsets(v178);
      v157 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)v171 = v154;
      *(_WORD *)&v171[8] = 2112;
      v172 = v156;
      v173[0] = 2112;
      *(_QWORD *)&v173[1] = v157;
      _os_log_debug_impl(&dword_20DBDA000, v93, OS_LOG_TYPE_DEBUG, "FMMapView: viewSize: %@ bounds: %@ safeInsets: %@", buf, 0x20u);

    }
    v94 = objc_msgSend(a1, "renderingMode");
    objc_msgSend(v75, "centerCoordinate");
    v97 = v96 >= -180.0;
    if (v96 > 180.0)
      v97 = 0;
    if (v95 < -90.0)
      v97 = 0;
    if (v95 > 90.0)
      v97 = 0;
    if (v94)
    {
      if (v97)
      {
        objc_msgSend(MEMORY[0x24BDDB0D0], "cameraLookingAtCenterCoordinate:fromDistance:pitch:heading:");
        v98 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(a1, "mapView");
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v99, "camera");
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v100, "altitude");
        v102 = v101;
        objc_msgSend(v98, "altitude");
        v104 = vabdd_f64(v102, v103);
        objc_msgSend(a1, "mapView");
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v105, "camera");
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v106, "centerCoordinate");
        v108 = v107;
        v110 = v109;
        objc_msgSend(v98, "centerCoordinate");
        objc_msgSend(a1, "distanceBetweenOrigin:andDestination:", v108, v110, v111, v112);
        objc_msgSend(a1, "dampingForAltitude:andDistance:", v104, v113);
        v92 = v114;

        v75 = v98;
      }
      objc_msgSend(v75, "centerCoordinate");
      if (v116 >= -180.0 && v116 <= 180.0 && v115 >= -90.0 && v115 <= 90.0)
      {
        v117 = a9;
        LogCategory_Unspecified();
        v118 = objc_claimAutoreleasedReturnValue();
        v119 = insets;
        if (os_log_type_enabled(v118, OS_LOG_TYPE_DEBUG))
          -[FMMapView animateMapToPosition:withInsets:attributionInsets:andZoom:].cold.1((uint64_t)v75, v118);

        objc_msgSend(a1, "mapView");
        v120 = (void *)objc_claimAutoreleasedReturnValue();
        v122 = v120;
        LODWORD(v123) = 1128792064;
        LODWORD(v124) = 1.0;
        LODWORD(v125) = 0;
        v126 = v75;
        v127 = v158;
        goto LABEL_48;
      }
    }
    else if (v97)
    {
      v117 = a9;
      objc_msgSend(a1, "cameraBefore3DRendering");
      v128 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(a1, "mapView");
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      v122 = v120;
      v119 = insets;
      v127 = v158;
      if (v128)
      {
        objc_msgSend(v120, "camera");
        v129 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v129, "altitude");
        v131 = v130;
        objc_msgSend(a1, "cameraBefore3DRendering");
        v132 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v132, "altitude");
        v134 = vabdd_f64(v131, v133);
        objc_msgSend(a1, "mapView");
        v135 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v135, "camera");
        v136 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v136, "centerCoordinate");
        v138 = v137;
        v140 = v139;
        objc_msgSend(a1, "cameraBefore3DRendering");
        v141 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v141, "centerCoordinate");
        objc_msgSend(a1, "distanceBetweenOrigin:andDestination:", v138, v140, v142, v143);
        objc_msgSend(a1, "dampingForAltitude:andDistance:", v134, v144);
        LODWORD(v134) = v145;

        objc_msgSend(a1, "cameraBefore3DRendering");
        v146 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v146, "setPitch:", 0.0);

        objc_msgSend(a1, "mapView");
        v147 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "cameraBefore3DRendering");
        v148 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v149) = 1128792064;
        LODWORD(v150) = 1.0;
        LODWORD(v151) = 0;
        LODWORD(v152) = LODWORD(v134);
        v119 = insets;
        objc_msgSend(v147, "setCamera:duration:springMass:springStiffness:springDamping:springVelocity:", v148, v158, v150, v149, v152, v151);

        objc_msgSend(a1, "setCameraBefore3DRendering:", 0);
        goto LABEL_53;
      }
      LODWORD(v123) = 1128792064;
      LODWORD(v124) = 1.0;
      LODWORD(v125) = 0;
      v126 = v75;
LABEL_48:
      LODWORD(v121) = v92;
      objc_msgSend(v120, "setCamera:duration:springMass:springStiffness:springDamping:springVelocity:", v126, v127, v124, v123, v121, v125);

LABEL_53:
      objc_msgSend(a1, "setLastVisibleMapRect:", v163, v164, v168, v165);
      objc_msgSend(a1, "setLastVisibleInsets:", a6, v119, v159, v117);
      v153 = dispatch_time(0, (uint64_t)(v127 * 1000000000.0));
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __71__FMMapView_animateMapToPosition_withInsets_attributionInsets_andZoom___block_invoke;
      block[3] = &unk_24C8370D8;
      block[4] = a1;
      *(double *)&block[5] = v163;
      *(double *)&block[6] = v164;
      *(double *)&block[7] = v168;
      *(double *)&block[8] = v165;
      *(double *)&block[9] = a6;
      *(CGFloat *)&block[10] = insets;
      *(double *)&block[11] = v159;
      *(double *)&block[12] = v117;
      dispatch_after(v153, MEMORY[0x24BDAC9B8], block);

      goto LABEL_54;
    }
    v117 = a9;
    v119 = insets;
    v127 = v158;
    goto LABEL_53;
  }
LABEL_54:

}

void __71__FMMapView_animateMapToPosition_withInsets_attributionInsets_andZoom___block_invoke(uint64_t a1)
{
  __int128 v2;
  __int128 v3;
  _QWORD v4[4];
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;

  objc_msgSend(*(id *)(a1 + 32), "setIsMapAnimating:", 0);
  objc_msgSend(*(id *)(a1 + 32), "depthSortAnnotations");
  objc_msgSend(*(id *)(a1 + 32), "synchronize");
  if (objc_msgSend(*(id *)(a1 + 32), "isAllAnnotationsShown"))
  {
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __71__FMMapView_animateMapToPosition_withInsets_attributionInsets_andZoom___block_invoke_2;
    v4[3] = &__block_descriptor_96_e5_v8__0l;
    v2 = *(_OWORD *)(a1 + 56);
    v5 = *(_OWORD *)(a1 + 40);
    v6 = v2;
    v3 = *(_OWORD *)(a1 + 88);
    v7 = *(_OWORD *)(a1 + 72);
    v8 = v3;
    dispatch_async(MEMORY[0x24BDAC9B8], v4);
  }
}

void __71__FMMapView_animateMapToPosition_withInsets_attributionInsets_andZoom___block_invoke_2(double *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  id v32;
  _QWORD v33[4];
  _QWORD v34[4];
  _QWORD v35[4];
  _QWORD v36[5];

  v36[4] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = CFSTR("x");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a1[4]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v3;
  v35[1] = CFSTR("y");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a1[5]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v36[1] = v4;
  v35[2] = CFSTR("width");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a1[6]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v36[2] = v5;
  v35[3] = CFSTR("height");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a1[7]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v36[3] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v36, v35, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v33[0] = CFSTR("top");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a1[8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v8;
  v33[1] = CFSTR("left");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a1[9]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v34[1] = v9;
  v33[2] = CFSTR("bottom");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a1[10]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v34[2] = v10;
  v33[3] = CFSTR("right");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a1[11]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v34[3] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v34, v33, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v7, 1, &v32);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v32;
  objc_msgSend(v2, "setObject:forKey:", v13, CFSTR("FMMapViewLastVisibleRect"));

  if (v14)
  {
    LogCategory_Unspecified();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      __71__FMMapView_animateMapToPosition_withInsets_attributionInsets_andZoom___block_invoke_2_cold_2((uint64_t)v14, v15, v16, v17, v18, v19, v20, v21);

  }
  v31 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v12, 1, &v31);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v31;
  objc_msgSend(v2, "setObject:forKey:", v22, CFSTR("FMMapViewLastVisibleInsets"));

  if (v23)
  {
    LogCategory_Unspecified();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      __71__FMMapView_animateMapToPosition_withInsets_attributionInsets_andZoom___block_invoke_2_cold_1((uint64_t)v23, v24, v25, v26, v27, v28, v29, v30);

  }
}

- ($2A298E9A48029832219C371D8B4CA722)repositionOnAnnotation:(id)a3 withZoom:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v32;
  double v33;
  double v34;
  double v35;
  $2A298E9A48029832219C371D8B4CA722 result;

  v4 = a4;
  v6 = a3;
  v7 = *MEMORY[0x24BDDAFE0];
  v8 = *(double *)(MEMORY[0x24BDDAFE0] + 8);
  v9 = *(double *)(MEMORY[0x24BDDAFE0] + 16);
  v10 = *(double *)(MEMORY[0x24BDDAFE0] + 24);
  -[FMMapView delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v12 = v8;
    v13 = v7;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v11, "mapPositionForAnnotation:", v6);
      v13 = v14;
      v12 = v15;
      v9 = v16;
      v10 = v17;
    }
    if (v13 == v7 && v12 == v8)
    {
      -[FMMapView userLocation](self, "userLocation");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "coordinate");
      v21 = v20;
      v23 = v22;
      if (v19 && objc_msgSend(v6, "isThisDevice"))
      {
        objc_msgSend(v19, "coordinate");
        v21 = v24;
        v23 = v25;
      }
      objc_msgSend(v6, "horizontalAccuracy");
      -[FMMapView mapRectMakeWithRadialDistanceForCoordinate:andRadius:](self, "mapRectMakeWithRadialDistanceForCoordinate:andRadius:", v21, v23, v26);
      v13 = v27;
      v12 = v28;
      v9 = v29;
      v10 = v30;

    }
    if (v13 != v7 || v12 != v8)
    {
      -[FMMapView setIsAllAnnotationsShown:](self, "setIsAllAnnotationsShown:", 0);
      -[FMMapView setIsMapPositioningDisabled:](self, "setIsMapPositioningDisabled:", 0);
      -[FMMapView repositionToMapRect:withZoom:](self, "repositionToMapRect:withZoom:", v4, v13, v12, v9, v10);
    }
  }
  else
  {
    v12 = v8;
    v13 = v7;
  }

  v32 = v13;
  v33 = v12;
  v34 = v9;
  v35 = v10;
  result.var1.var1 = v35;
  result.var1.var0 = v34;
  result.var0.var1 = v33;
  result.var0.var0 = v32;
  return result;
}

- (void)repositionToMapRect:(id)a3 withZoom:(BOOL)a4
{
  double var1;
  double var0;
  _BOOL8 v7;
  double v8;
  double v9;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;

  var1 = a3.var0.var1;
  var0 = a3.var0.var0;
  if (a3.var0.var0 != *MEMORY[0x24BDDAFE0] || a3.var0.var1 != *(double *)(MEMORY[0x24BDDAFE0] + 8))
  {
    v7 = a4;
    v8 = a3.var1.var1;
    v9 = a3.var1.var0;
    -[FMMapView mapView](self, "mapView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bounds");
    v13 = v12 / v9;

    -[FMMapView maxZoomLevel](self, "maxZoomLevel");
    if (v13 > v14)
    {
      -[FMMapView maxZoomLevel](self, "maxZoomLevel");
      -[FMMapView normalizeMapRect:toZoomScale:](self, "normalizeMapRect:toZoomScale:", var0, var1, v9, v8, v15);
      var0 = v16;
      var1 = v17;
      v9 = v18;
      v8 = v19;
    }
    -[FMMapView updateCameraPositionForMapRect:withZoom:](self, "updateCameraPositionForMapRect:withZoom:", v7, var0, var1, v9, v8);
  }
}

- (void)recenterVisibleAnnotations
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;

  -[FMMapView nearbyAnnotations](self, "nearbyAnnotations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMMapView mapRectForAnnotations:shouldIncludeRadius:](self, "mapRectForAnnotations:shouldIncludeRadius:", v3, 0);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  if (v5 != *MEMORY[0x24BDDAFE0] || v7 != *(double *)(MEMORY[0x24BDDAFE0] + 8))
  {
    -[FMMapView mapView](self, "mapView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bounds");
    v15 = v14 / v9;

    -[FMMapView maxZoomLevel](self, "maxZoomLevel");
    if (v15 > v16)
    {
      -[FMMapView maxZoomLevel](self, "maxZoomLevel");
      -[FMMapView normalizeMapRect:toZoomScale:](self, "normalizeMapRect:toZoomScale:", v5, v7, v9, v11, v17);
      v5 = v18;
      v7 = v19;
      v9 = v20;
      v11 = v21;
    }
    -[FMMapView setIsMapPositioningDisabled:](self, "setIsMapPositioningDisabled:", 0);
    -[FMMapView repositionToMapRect:withZoom:](self, "repositionToMapRect:withZoom:", 0, v5, v7, v9, v11);
  }
}

- (void)slideAnnotationIntoViewIfNeeded:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  id v27;

  v27 = a3;
  -[FMMapView delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMMapView mapView](self, "mapView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "coordinate");
  v7 = v6;
  v9 = v8;
  -[FMMapView mapView](self, "mapView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "convertCoordinate:toPointToView:", v10, v7, v9);
  v12 = v11;
  v14 = v13;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "annotationOnScreenTopThresholdForState:", -[FMMapView currentSelectedState](self, "currentSelectedState"));
  else
    v15 = 185.0;
  v16 = v27;
  v17 = v15 - v14;
  if (v12 < 82.0)
  {
    v22 = 82.0 - v12;
LABEL_12:
    objc_msgSend(v16, "coordinate");
    -[FMMapView moveCenterByOffset:from:](self, "moveCenterByOffset:from:", v22, fmax(v17, 0.0), v25, v26);
    goto LABEL_13;
  }
  -[FMMapView mapView](self, "mapView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "frame");
  v20 = v19 + -82.0;

  if (v17 > 0.0 || v12 > v20)
  {
    v22 = 0.0;
    v16 = v27;
    if (v12 > v20)
    {
      -[FMMapView mapView](self, "mapView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "frame");
      v22 = v24 + -82.0 - v12;

      v16 = v27;
    }
    goto LABEL_12;
  }
LABEL_13:

}

- (void)moveCenterByOffset:(CGPoint)a3 from:(CLLocationCoordinate2D)a4
{
  double y;
  double x;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  id v24;
  CLLocationCoordinate2D v25;

  y = a3.y;
  x = a3.x;
  -[FMMapView mapView](self, "mapView", a3.x, a3.y, a4.latitude, a4.longitude);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMMapView mapView](self, "mapView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "centerCoordinate");
  v10 = v9;
  v12 = v11;
  -[FMMapView mapView](self, "mapView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "convertCoordinate:toPointToView:", v13, v10, v12);
  v15 = v14;
  v17 = v16;

  -[FMMapView mapView](self, "mapView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMMapView mapView](self, "mapView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "convertPoint:toCoordinateFromView:", v19, v15 - x, v17 - y);
  v21 = v20;
  v23 = v22;

  v25.latitude = v21;
  v25.longitude = v23;
  if (CLLocationCoordinate2DIsValid(v25))
  {
    -[FMMapView mapView](self, "mapView");
    v24 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setCenterCoordinate:animated:", 1, v21, v23);

  }
}

- ($2A298E9A48029832219C371D8B4CA722)mapRectForAnnotations:(id)a3 shouldIncludeRadius:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  double y;
  double x;
  double height;
  double width;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  uint64_t v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  int v54;
  char v55;
  void *v56;
  double v57;
  double v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  uint64_t v64;
  MKMapRect v65;
  MKMapRect v66;
  MKMapRect v67;
  MKMapRect v68;
  $2A298E9A48029832219C371D8B4CA722 result;
  MKMapRect v70;
  MKMapRect v71;

  v4 = a4;
  v64 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  x = *MEMORY[0x24BDDAFE0];
  y = *(double *)(MEMORY[0x24BDDAFE0] + 8);
  width = *(double *)(MEMORY[0x24BDDAFE0] + 16);
  height = *(double *)(MEMORY[0x24BDDAFE0] + 24);
  -[FMMapView selectedAnnotation](self, "selectedAnnotation");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v11 = v6;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v59, v63, 16);
  if (!v12)
  {

    goto LABEL_28;
  }
  v13 = v12;
  v54 = !v4;
  v55 = 0;
  v14 = *(_QWORD *)v60;
  do
  {
    v15 = 0;
    do
    {
      if (*(_QWORD *)v60 != v14)
        objc_enumerationMutation(v11);
      v16 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * v15);
      objc_msgSend(v16, "coordinate");
      if (-[FMMapView isValidLocation:](self, "isValidLocation:"))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          -[FMMapView otherSelectedAnnotation](self, "otherSelectedAnnotation");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v16, "isEqual:", v17))
          {

          }
          else
          {
            if ((objc_opt_respondsToSelector() & 1) == 0)
            {

              goto LABEL_18;
            }
            v18 = objc_msgSend(v16, "hasKnownLocation");

            if (!v18)
              goto LABEL_18;
          }
        }
        objc_msgSend(v16, "coordinate");
        v20 = v19;
        v22 = v21;
        v23 = 20.0;
        v57 = width;
        v58 = height;
        v24 = x;
        v25 = y;
        if ((objc_opt_respondsToSelector() & 1) != 0
          && ((-[FMMapView isAllAnnotationsShown](self, "isAllAnnotationsShown") | v54) & 1) == 0)
        {
          objc_msgSend(v16, "horizontalAccuracy");
          v23 = v26;
        }
        -[FMMapView mapRectMakeWithRadialDistanceForCoordinate:andRadius:](self, "mapRectMakeWithRadialDistanceForCoordinate:andRadius:", v20, v22, v23);
        v28 = v27;
        v30 = v29;
        v32 = v31;
        v34 = v33;
        if (objc_msgSend(v16, "isEqual:", v56))
        {
          -[FMMapView mapRectMakeWithRadialDistanceForCoordinate:andRadius:](self, "mapRectMakeWithRadialDistanceForCoordinate:andRadius:", v20, v22, 400.0);
          v28 = v35;
          v30 = v36;
          v32 = v37;
          v34 = v38;
          v55 = 1;
        }
        v65.origin.x = v24;
        v65.origin.y = v25;
        v65.size.width = v57;
        v65.size.height = v58;
        v70.origin.x = v28;
        v70.origin.y = v30;
        v70.size.width = v32;
        v70.size.height = v34;
        v66 = MKMapRectUnion(v65, v70);
        x = v66.origin.x;
        y = v66.origin.y;
        width = v66.size.width;
        height = v66.size.height;
      }
LABEL_18:
      ++v15;
    }
    while (v13 != v15);
    v39 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v59, v63, 16);
    v13 = v39;
  }
  while (v39);

  if ((v55 & 1) != 0)
  {
    if (width / *(double *)(MEMORY[0x24BDDAFF0] + 16) >= height / *(double *)(MEMORY[0x24BDDAFF0] + 24))
      v40 = width / *(double *)(MEMORY[0x24BDDAFF0] + 16);
    else
      v40 = height / *(double *)(MEMORY[0x24BDDAFF0] + 24);
    objc_msgSend(v56, "coordinate");
    v42 = v41;
    v44 = v43;
    objc_msgSend(v56, "horizontalAccuracy");
    -[FMMapView mapRectMakeWithRadialDistanceForCoordinate:andRadius:](self, "mapRectMakeWithRadialDistanceForCoordinate:andRadius:", v42, v44, v45);
    v71.origin.x = v46;
    v71.size.width = v47;
    v71.origin.y = v48 - v40 * 45000000.0;
    v71.size.height = v40 * 45000000.0 + v49;
    v67.origin.x = x;
    v67.origin.y = y;
    v67.size.width = width;
    v67.size.height = height;
    v68 = MKMapRectUnion(v67, v71);
    x = v68.origin.x;
    y = v68.origin.y;
    width = v68.size.width;
    height = v68.size.height;
  }
LABEL_28:

  v50 = x;
  v51 = y;
  v52 = width;
  v53 = height;
  result.var1.var1 = v53;
  result.var1.var0 = v52;
  result.var0.var1 = v51;
  result.var0.var0 = v50;
  return result;
}

- ($2A298E9A48029832219C371D8B4CA722)normalizeMapRect:(id)a3 toZoomScale:(double)a4
{
  double var1;
  double var0;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  MKMapRect v12;

  var1 = a3.var1.var1;
  var0 = a3.var1.var0;
  v7 = a3.var0.var1;
  v8 = a3.var0.var0;
  -[FMMapView mapView](self, "mapView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  v11 = var0 - v10 / a4;

  v12.origin.x = v8;
  v12.origin.y = v7;
  v12.size.width = var0;
  v12.size.height = var1;
  return ($2A298E9A48029832219C371D8B4CA722)MKMapRectInset(v12, v11 * 0.5, v11 * 0.5);
}

- (BOOL)isValidLocation:(CLLocationCoordinate2D)a3
{
  return a3.longitude != 0.0 && a3.latitude != 0.0;
}

- (void)flashMapInset:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  -[FMMapView mapView](self, "mapView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frame");
  v10 = left + v9;
  v12 = top + v11;
  v14 = v13 - (left + right);
  v16 = v15 - (top + bottom);

  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6F90]), "initWithFrame:", v10, v12, v14, v16);
  objc_msgSend(v17, "setUserInteractionEnabled:", 0);
  objc_msgSend(MEMORY[0x24BDF6950], "greenColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "colorWithAlphaComponent:", 0.5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setDebugHighlight:", v19);

  objc_msgSend(MEMORY[0x24BDF6950], "redColor");
  v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v21 = objc_msgSend(v20, "CGColor");
  objc_msgSend(v17, "layer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setBorderColor:", v21);

  objc_msgSend(v17, "layer");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setBorderWidth:", 1.0);

  -[FMMapView addSubview:](self, "addSubview:", v17);
  v24 = (void *)MEMORY[0x24BDF6F90];
  v25 = MEMORY[0x24BDAC760];
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __27__FMMapView_flashMapInset___block_invoke;
  v29[3] = &unk_24C837100;
  v30 = v17;
  v27[0] = v25;
  v27[1] = 3221225472;
  v27[2] = __27__FMMapView_flashMapInset___block_invoke_2;
  v27[3] = &unk_24C837128;
  v28 = v30;
  v26 = v30;
  objc_msgSend(v24, "animateWithDuration:animations:completion:", v29, v27, 6.0);

}

uint64_t __27__FMMapView_flashMapInset___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __27__FMMapView_flashMapInset___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

- (id)nearbyAnnotations
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  uint64_t i;
  void *v15;
  double v16;
  double v17;
  unint64_t v18;
  double v22;
  double v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  -[FMMapView userLocation](self, "userLocation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_new();
  -[FMMapView annotationsSortedByDistance](self, "annotationsSortedByDistance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[FMMapView isNearbyModeDisabled](self, "isNearbyModeDisabled"))
  {
LABEL_2:
    -[FMMapView mapView](self, "mapView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "annotations");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "mutableCopy");

    v4 = (void *)v8;
    goto LABEL_25;
  }
  if (objc_msgSend(v5, "count"))
  {
    v24 = v3;
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v9 = v5;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v26;
      v13 = 0.0;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v26 != v12)
            objc_enumerationMutation(v9);
          v15 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          if (objc_msgSend(v15, "conformsToProtocol:", &unk_254A0A820))
          {
            objc_msgSend(v15, "distanceFromUser");
            v17 = v16;
            if (v16 >= 16000.0)
            {
              v18 = objc_msgSend(v4, "count");
              if ((v17 >= 160000.0 || v18 >= 4) && (v17 >= 160000.0 || v17 + -100.0 > v13))
                goto LABEL_23;
            }
            objc_msgSend(v4, "addObject:", v15);
            v13 = v17;
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v11);
    }
LABEL_23:

    v3 = v24;
  }
  if (!objc_msgSend(v4, "count"))
  {
    if (v3)
    {
      objc_msgSend(v3, "coordinate");
      if (v22 != 0.0)
      {
        objc_msgSend(v3, "coordinate");
        if (v23 != 0.0)
        {
          objc_msgSend(v4, "addObject:", v3);
          goto LABEL_25;
        }
      }
    }
    goto LABEL_2;
  }
LABEL_25:

  return v4;
}

- (id)annotationsSortedByDistance
{
  void *v3;
  void *v4;
  id v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  -[FMMapView userLocation](self, "userLocation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_new();
  if (v3)
  {
    v5 = objc_alloc(MEMORY[0x24BDBFA80]);
    objc_msgSend(v3, "coordinate");
    v7 = v6;
    v25 = v3;
    objc_msgSend(v3, "coordinate");
    v8 = (void *)objc_msgSend(v5, "initWithLatitude:longitude:", v7);
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    -[FMMapView mapView](self, "mapView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "annotations");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v27 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          if (objc_msgSend(v15, "conformsToProtocol:", &unk_254A0A820))
          {
            objc_msgSend(v15, "coordinate");
            v17 = v16;
            v19 = v18;
            objc_msgSend(v15, "coordinate");
            if (v20 != -180.0)
            {
              objc_msgSend(v15, "coordinate");
              if (v21 != -180.0)
              {
                v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBFA80]), "initWithLatitude:longitude:", v17, v19);
                objc_msgSend(v8, "distanceFromLocation:", v22);
                objc_msgSend(v15, "setDistanceFromUser:");
                objc_msgSend(v4, "addObject:", v15);

              }
            }
          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v12);
    }

    objc_msgSend(v4, "sortedArrayUsingComparator:", &__block_literal_global_2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v3 = v25;
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

uint64_t __40__FMMapView_annotationsSortedByDistance__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;

  v4 = (void *)MEMORY[0x24BDD16E0];
  v5 = a3;
  objc_msgSend(a2, "distanceFromUser");
  objc_msgSend(v4, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v5, "distanceFromUser");
  v9 = v8;

  objc_msgSend(v7, "numberWithDouble:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v6, "compare:", v10);

  return v11;
}

- (CLLocationCoordinate2D)coordinateForAnnotationView:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double MidX;
  double MidY;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CLLocationCoordinate2D result;
  CGRect v25;
  CGRect v26;

  objc_msgSend(a3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presentationLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "frame");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v25.origin.x = v7;
  v25.origin.y = v9;
  v25.size.width = v11;
  v25.size.height = v13;
  MidX = CGRectGetMidX(v25);
  v26.origin.x = v7;
  v26.origin.y = v9;
  v26.size.width = v11;
  v26.size.height = v13;
  MidY = CGRectGetMidY(v26);
  -[FMMapView mapView](self, "mapView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMMapView mapView](self, "mapView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "convertPoint:toCoordinateFromView:", v17, MidX, MidY);
  v19 = v18;
  v21 = v20;

  v22 = v19;
  v23 = v21;
  result.longitude = v23;
  result.latitude = v22;
  return result;
}

- (id)mapView:(id)a3 viewForAnnotation:(id)a4
{
  FMMapView *v5;
  void *v6;
  FMUserLocationView *v7;
  char isKindOfClass;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  FMMapAnnotationGestureRecognizer *v14;
  FMAnnotationView *v15;
  void *v16;
  FMMapView *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  int64_t v22;

  v5 = (FMMapView *)a4;
  -[FMMapView delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (objc_msgSend(v6, "customViewForAnnotation:", v5),
        (v7 = (FMUserLocationView *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    -[FMMapView mapView](self, "mapView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v9, "dequeueReusableAnnotationViewWithIdentifier:", CFSTR("FMMKUserAnnotationReuseIdentifier"));
      v7 = (FMUserLocationView *)objc_claimAutoreleasedReturnValue();

      if (!v7)
      {
        v7 = -[MKUserLocationView initWithAnnotation:reuseIdentifier:]([FMUserLocationView alloc], "initWithAnnotation:reuseIdentifier:", v5, CFSTR("FMMKUserAnnotationReuseIdentifier"));
        -[MKAnnotationView setEnabled:](v7, "setEnabled:", 0);
        -[FMUserLocationView setUserInteractionEnabled:](v7, "setUserInteractionEnabled:", 0);
        -[MKUserLocationView setCanShowCallout:](v7, "setCanShowCallout:", -[FMMapView showUserLocationCallout](self, "showUserLocationCallout"));
        -[FMMapView userLocationTintColor](self, "userLocationTintColor");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[FMUserLocationView setTintColor:](v7, "setTintColor:", v11);

        -[FMMapView setUserLocationView:](self, "setUserLocationView:", v7);
        -[FMMapView setUserLocation:](self, "setUserLocation:", v5);
        if (-[FMMapView showUserLocationCallout](self, "showUserLocationCallout"))
        {
          objc_msgSend(MEMORY[0x24BDF6880], "buttonWithType:", 4);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[FMMapView tintColor](self, "tintColor");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setTintColor:", v13);

          -[MKAnnotationView setEnabled:](v7, "setEnabled:", 0);
          -[MKUserLocationView setRightCalloutAccessoryView:](v7, "setRightCalloutAccessoryView:", v12);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v6, "updateTitlesForAnnotation:", v5);

        }
      }
    }
    else
    {
      objc_msgSend(v9, "dequeueReusableAnnotationViewWithIdentifier:", CFSTR("FMAnnotationViewReuseIdentifier"));
      v7 = (FMUserLocationView *)objc_claimAutoreleasedReturnValue();

      if (!v7)
      {
        v14 = objc_alloc_init(FMMapAnnotationGestureRecognizer);
        v15 = [FMAnnotationView alloc];
        -[FMMapView tintColor](v5, "tintColor");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
          v17 = v5;
        else
          v17 = self;
        -[FMMapView tintColor](v17, "tintColor");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = -[FMAnnotationView initWithAnnotation:reuseIdentifier:tintColor:](v15, "initWithAnnotation:reuseIdentifier:tintColor:", v5, CFSTR("FMAnnotationViewReuseIdentifier"), v18);

        -[MKAnnotationView setEnabled:](v7, "setEnabled:", 0);
        -[FMMapAnnotationGestureRecognizer setTouchDelegate:](v14, "setTouchDelegate:", self);
        -[FMUserLocationView addGestureRecognizer:](v7, "addGestureRecognizer:", v14);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          -[FMMapView delegate](self, "delegate");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "annotationViewOfferedForLocationPreview:", v7);

        }
      }
      if (-[FMMapView isThisDevice](v5, "isThisDevice"))
        -[FMMapView setCurrentDeviceAnnotation:](self, "setCurrentDeviceAnnotation:", v5);
      -[FMMapView selectedAnnotation](self, "selectedAnnotation");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = -[FMMapView isEqual:](v5, "isEqual:", v20);

      if (v21)
      {
        v22 = -[FMMapView renderingMode](self, "renderingMode");
        if (-[FMMapView isFingerOnMap](self, "isFingerOnMap"))
          -[MKAnnotationView setSelected:animated:](v7, "setSelected:animated:", 1, 1);
        else
          -[FMUserLocationView setSelected:animated:delay:](v7, "setSelected:animated:delay:", 1, 1, dbl_20DBF32E0[v22 == 1]);
      }
      -[FMUserLocationView updateStyleForAnnotation:](v7, "updateStyleForAnnotation:", v5);
    }
  }

  return v7;
}

- (void)mapView:(id)a3 didAddAnnotationViews:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v10, "annotation");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[FMMapView selectedAnnotation](self, "selectedAnnotation");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "isEqual:", v12);

        if (v13)
          -[FMMapView setSelectedAnnotationView:](self, "setSelectedAnnotationView:", v10);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v10, "annotation");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "updateStyleForAnnotation:", v14);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }
  -[FMMapView depthSortAnnotations](self, "depthSortAnnotations");

}

- (id)mapView:(id)a3 rendererForOverlay:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  double v34;
  double v35;
  double v36;
  double v37;

  v5 = a4;
  -[FMMapView delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "customRendererForOverlay:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      goto LABEL_18;
  }
  if (!-[FMMapView shouldDisplayOverlay](self, "shouldDisplayOverlay"))
    goto LABEL_15;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v5;
    objc_msgSend(v8, "parentAnnotation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDB038]), "initWithCircle:", v8);
    if (objc_msgSend(v9, "conformsToProtocol:", &unk_254A0A820))
    {
      v10 = v9;
      -[FMMapView viewForAnnotation:](self, "viewForAnnotation:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[FMMapView mapView](self, "mapView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "mapType");

      if (v13)
      {
        v36 = 0.0;
        v37 = 0.0;
        v34 = 0.0;
        v35 = 0.0;
        objc_msgSend(v10, "tintColor");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "getHue:saturation:brightness:alpha:", &v37, &v36, &v35, &v34);

        objc_msgSend(MEMORY[0x24BDF6950], "colorWithHue:saturation:brightness:alpha:", v37, v36, v35 + 0.4, v34);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setFillColor:", v15);
        objc_msgSend(v7, "setAlpha:", 0.15);

      }
      else
      {
        objc_msgSend(v11, "tintColor");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setFillColor:", v24);

        objc_msgSend(v7, "setAlpha:", 0.2);
      }

    }
    if (!v7)
    {
LABEL_15:
      LogCategory_Unspecified();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        -[FMMapView mapView:rendererForOverlay:].cold.1(v25, v26, v27, v28, v29, v30, v31, v32);

      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDB148]), "initWithOverlay:", v5);
    }
  }
  else
  {
    LogCategory_Unspecified();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[FMMapView mapView:rendererForOverlay:].cold.2(v16, v17, v18, v19, v20, v21, v22, v23);

    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDB148]), "initWithOverlay:", v5);
    if (!v7)
      goto LABEL_15;
  }
LABEL_18:

  return v7;
}

- (void)mapView:(id)a3 didSelectAnnotationView:(id)a4
{
  id v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v11, "isUserInteractionEnabled") & 1) == 0)
  {
    if (-[FMMapView showUserLocationCallout](self, "showUserLocationCallout")
      && -[FMMapView canSelectUserAnnotation](self, "canSelectUserAnnotation"))
    {
      -[FMMapView selectedAnnotationView](self, "selectedAnnotationView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[FMMapView deselectAnnotationView:](self, "deselectAnnotationView:", v7);
      goto LABEL_11;
    }
    if (!-[FMMapView canSelectUserAnnotation](self, "canSelectUserAnnotation"))
    {
      -[FMMapView mapView](self, "mapView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "annotation");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "deselectAnnotation:animated:", v10, 0);

      objc_msgSend(v11, "setSelected:animated:", 0, 0);
    }
  }
  else
  {
    -[FMMapView selectedAnnotationView](self, "selectedAnnotationView");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (v5 == v11)
    {

    }
    else
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        -[FMMapView setPotentiallySelectedAnnotationView:](self, "setPotentiallySelectedAnnotationView:", v11);
        -[FMMapView potentiallySelectedAnnotationView](self, "potentiallySelectedAnnotationView");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[FMMapView selectOrDeselectAnnotationView:](self, "selectOrDeselectAnnotationView:", v7);
LABEL_11:

        goto LABEL_14;
      }
    }
    objc_msgSend(v11, "annotation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMMapView setOtherSelectedAnnotation:](self, "setOtherSelectedAnnotation:", v8);

    -[FMMapView setLastVisibleMapRect:](self, "setLastVisibleMapRect:", *MEMORY[0x24BDDAFE0], *(double *)(MEMORY[0x24BDDAFE0] + 8), *(double *)(MEMORY[0x24BDDAFE0] + 16), *(double *)(MEMORY[0x24BDDAFE0] + 24));
  }
LABEL_14:
  -[FMMapView depthSortAnnotations](self, "depthSortAnnotations");

}

- (void)mapView:(id)a3 didDeselectAnnotationView:(id)a4
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  int v10;
  id v11;

  v11 = a4;
  objc_msgSend(v11, "setSelected:animated:", 1, 0);
  objc_msgSend(v11, "annotation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMMapView userLocation](self, "userLocation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

  if (v7)
    objc_msgSend(v11, "setEnabled:", 0);
  objc_msgSend(v11, "annotation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMMapView otherSelectedAnnotation](self, "otherSelectedAnnotation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqual:", v9);

  if (v10)
    -[FMMapView setOtherSelectedAnnotation:](self, "setOtherSelectedAnnotation:", 0);
  -[FMMapView depthSortAnnotations](self, "depthSortAnnotations");

}

- (void)clearUserLocation
{
  id v3;

  hasUserLocation = 0;
  -[FMMapView setUserLocation:](self, "setUserLocation:", 0);
  -[FMMapView currentDeviceAnnotation](self, "currentDeviceAnnotation");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[FMMapView updateAnnotationStyle:](self, "updateAnnotationStyle:", v3);

}

- (void)depthSortAnnotations
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  FMMapView *v21;
  void *v22;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE2FE40], "stopwatchWithLabel:", CFSTR("depthSortAnnotations"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMMapView otherSelectedAnnotation](self, "otherSelectedAnnotation");
  v21 = self;
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[FMMapView mapView](self, "mapView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_annotationViews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v5)
  {
    v6 = v5;
    v24 = 0;
    v7 = 0;
    v8 = *(_QWORD *)v26;
    while (1)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v26 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v9);
        objc_msgSend(v10, "annotation");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v12 = v7;
          v7 = v10;
LABEL_8:

          goto LABEL_12;
        }
        if (objc_msgSend(v11, "conformsToProtocol:", &unk_254A0A820))
        {
          v12 = v11;
          if (objc_msgSend(v12, "isThisDevice"))
          {
            v13 = v10;

            v24 = v13;
          }
          else
          {
            objc_msgSend(v10, "_setZIndex:", 20);
          }
          goto LABEL_8;
        }
LABEL_12:

        ++v9;
      }
      while (v6 != v9);
      v14 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      v6 = v14;
      if (!v14)
        goto LABEL_18;
    }
  }
  v24 = 0;
  v7 = 0;
LABEL_18:

  objc_msgSend(v24, "_setZIndex:", 19);
  -[FMMapView selectedAnnotationView](v21, "selectedAnnotationView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v15, "isEqual:", v24) & 1) != 0)
  {

    v16 = 2147483645;
  }
  else
  {
    v17 = -[FMMapView currentTrackingMode](v21, "currentTrackingMode");

    if (v17)
      v16 = 2147483645;
    else
      v16 = 18;
  }
  objc_msgSend(v7, "setPreferredZIndex:", v16);
  objc_msgSend(v7, "_setZIndex:", v16);
  if (v24 && -[FMMapView currentTrackingMode](v21, "currentTrackingMode"))
  {
    objc_msgSend(v7, "setPreferredZIndex:", 2147483645);
    objc_msgSend(v7, "_setZIndex:", 2147483645);
    objc_msgSend(v24, "_setZIndex:", 0x7FFFFFFFLL);
  }
  if (-[FMMapView showUserLocationCallout](v21, "showUserLocationCallout")
    && v7
    && objc_msgSend(v7, "isSelected"))
  {
    objc_msgSend(v7, "setPreferredZIndex:", 2147483645);
    objc_msgSend(v7, "_setZIndex:", 2147483645);
  }
  -[FMMapView selectedAnnotationView](v21, "selectedAnnotationView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "_setZIndex:", 2147483646);

  if (v22)
  {
    -[FMMapView mapView](v21, "mapView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "viewForAnnotation:", v22);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
      objc_msgSend(v20, "_setZIndex:", 2147483646);

  }
  objc_msgSend(v23, "stop");

}

- (void)mapView:(id)a3 didChangeUserTrackingMode:(int64_t)a4 animated:(BOOL)a5
{
  if (-[FMMapView canChangeUserTrackingMode](self, "canChangeUserTrackingMode", a3, a4, a5))
  {
    -[FMMapView setCanChangeUserTrackingMode:](self, "setCanChangeUserTrackingMode:", 0);
    -[FMMapView updateAccordingToUserTrackingMode](self, "updateAccordingToUserTrackingMode");
  }
}

- (void)updateAccordingToUserTrackingMode
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  dispatch_time_t v39;
  _QWORD v40[9];
  _QWORD v41[3];

  v41[2] = *MEMORY[0x24BDAC8D0];
  -[FMMapView userLocation](self, "userLocation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMMapView lastSelectedAnnotationBeforeTracking](self, "lastSelectedAnnotationBeforeTracking");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMMapView selectedAnnotation](self, "selectedAnnotation");
  v5 = objc_claimAutoreleasedReturnValue();
  -[FMMapView otherSelectedAnnotation](self, "otherSelectedAnnotation");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x24BDDAFE0];
  v8 = *(double *)(MEMORY[0x24BDDAFE0] + 8);
  v9 = *(double *)(MEMORY[0x24BDDAFE0] + 16);
  v10 = *(double *)(MEMORY[0x24BDDAFE0] + 24);
  -[FMMapView setIsMapPositioningDisabled:](self, "setIsMapPositioningDisabled:", 0);
  -[FMMapView setIsAllAnnotationsShown:](self, "setIsAllAnnotationsShown:", 0);
  -[FMMapView setIsSwitchingTrackingMode:](self, "setIsSwitchingTrackingMode:", 1);
  -[FMMapView setLastVisibleMapRect:](self, "setLastVisibleMapRect:", v7, v8, v9, v10);
  -[FMMapView mapView](self, "mapView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "userTrackingMode");

  if (v12 == 2)
    goto LABEL_14;
  if (v12 != 1)
  {
    if (v4)
    {
      -[FMMapView updateCameraPositionForAnnotation:](self, "updateCameraPositionForAnnotation:", v4);
      -[FMMapView setLastSelectedAnnotationBeforeTracking:](self, "setLastSelectedAnnotationBeforeTracking:", 0);
    }
    else
    {
      -[FMMapView setIsMapMoved:](self, "setIsMapMoved:", 1);
      -[FMMapView displayAllAnnotations](self, "displayAllAnnotations");
    }
LABEL_14:
    v20 = v8;
    v18 = v7;
    goto LABEL_15;
  }
  -[FMMapView setLastSelectedAnnotationBeforeTracking:](self, "setLastSelectedAnnotationBeforeTracking:", v5);
  if (v5 | v6 && v3)
  {
    if (v5)
      v13 = (void *)v5;
    else
      v13 = (void *)v6;
    v41[0] = v13;
    v41[1] = v3;
    v14 = (void *)MEMORY[0x24BDBCE30];
    v15 = v13;
    objc_msgSend(v14, "arrayWithObjects:count:", v41, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[FMMapView mapRectForAnnotations:shouldIncludeRadius:](self, "mapRectForAnnotations:shouldIncludeRadius:", v16, 1);
    v18 = v17;
    v20 = v19;
    v9 = v21;
    v10 = v22;

  }
  else
  {
    v20 = v8;
    v18 = v7;
    if (v3)
    {
      -[FMMapView nearbyAnnotations](self, "nearbyAnnotations");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)objc_msgSend(v23, "mutableCopy");

      objc_msgSend(v24, "addObject:", v3);
      -[FMMapView mapRectForAnnotations:shouldIncludeRadius:](self, "mapRectForAnnotations:shouldIncludeRadius:", v24, 1);
      v18 = v25;
      v20 = v26;
      v9 = v27;
      v10 = v28;

    }
  }
LABEL_15:
  if (v18 == v7 && v20 == v8)
  {
    -[FMMapView setIsSwitchingTrackingMode:](self, "setIsSwitchingTrackingMode:", 0);
    -[FMMapView setCanChangeUserTrackingMode:](self, "setCanChangeUserTrackingMode:", 1);
  }
  else
  {
    -[FMMapView mapView](self, "mapView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "bounds");
    v32 = v31 / v9;

    -[FMMapView maxZoomLevel](self, "maxZoomLevel");
    if (v32 > v33)
    {
      -[FMMapView maxZoomLevel](self, "maxZoomLevel");
      -[FMMapView normalizeMapRect:toZoomScale:](self, "normalizeMapRect:toZoomScale:", v18, v20, v9, v10, v34);
      v18 = v35;
      v20 = v36;
      v9 = v37;
      v10 = v38;
    }
    v39 = dispatch_time(0, 30000000);
    v40[0] = MEMORY[0x24BDAC760];
    v40[1] = 3221225472;
    v40[2] = __46__FMMapView_updateAccordingToUserTrackingMode__block_invoke;
    v40[3] = &unk_24C837170;
    v40[4] = self;
    *(double *)&v40[5] = v18;
    *(double *)&v40[6] = v20;
    *(double *)&v40[7] = v9;
    *(double *)&v40[8] = v10;
    dispatch_after(v39, MEMORY[0x24BDAC9B8], v40);
  }

}

void __46__FMMapView_updateAccordingToUserTrackingMode__block_invoke(uint64_t a1)
{
  dispatch_time_t v2;
  _QWORD block[5];

  objc_msgSend(*(id *)(a1 + 32), "updateCameraPositionForMapRect:withZoom:", 1, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  objc_msgSend(*(id *)(a1 + 32), "setIsSwitchingTrackingMode:", 0);
  v2 = dispatch_time(0, 30000000);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__FMMapView_updateAccordingToUserTrackingMode__block_invoke_2;
  block[3] = &unk_24C837100;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_after(v2, MEMORY[0x24BDAC9B8], block);
}

uint64_t __46__FMMapView_updateAccordingToUserTrackingMode__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCanChangeUserTrackingMode:", 1);
}

- (void)_setUserTrackingMode:(int64_t)a3 animated:(BOOL)a4 fromTrackingButton:(BOOL)a5
{
  int64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v7 = -[FMMapView userTrackingMode](self, "userTrackingMode", a3, a4, a5);
  if (a3 == 2)
  {
    -[FMMapView setIsMapPositioningDisabled:](self, "setIsMapPositioningDisabled:", 0);
    -[FMMapView userTrackingButton](self, "userTrackingButton");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_setState:", 3);
    v9 = 2;
  }
  else
  {
    -[FMMapView userTrackingButton](self, "userTrackingButton");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (a3 == 1)
    {
      objc_msgSend(v8, "_setState:", 2);
      v9 = 1;
    }
    else
    {
      objc_msgSend(v8, "_setState:", 0);
      v9 = 0;
    }
  }

  -[FMMapView setCurrentTrackingMode:](self, "setCurrentTrackingMode:", v9);
  -[FMMapView mapView](self, "mapView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setUserTrackingMode:animated:", a3, 1);

  if (v7 != a3)
    -[FMMapView depthSortAnnotations](self, "depthSortAnnotations");
}

- (int64_t)userTrackingMode
{
  int64_t v2;

  v2 = -[FMMapView currentTrackingMode](self, "currentTrackingMode");
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
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FMMapView.m"), 1476, CFSTR("FIXME: Test this code path.  As of Whitetail MapKit was never calling this method and it was just added for protocol conformance."));

  -[FMMapView mapView](self, "mapView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v5, "isCurrentlyRotated");

  return (char)self;
}

- (void)updateUserTrackingButtonState
{
  uint64_t v2;
  id v3;

  v2 = hasUserLocation;
  -[FMMapView userTrackingButton](self, "userTrackingButton");
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

- (void)synchronize
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  objc_msgSend(MEMORY[0x24BE2FE40], "stopwatchWithLabel:", CFSTR("FMMapView.synchronize"));
  v22 = (id)objc_claimAutoreleasedReturnValue();
  -[FMMapView userLocation](self, "userLocation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMMapView userLocationView](self, "userLocationView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMMapView currentDeviceAnnotation](self, "currentDeviceAnnotation");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v3)
  {
    if (v5)
    {
      objc_msgSend(v4, "center");
      if (v4)
      {
        v9 = v7;
        v10 = v8;
        -[FMMapView viewForAnnotation:](self, "viewForAnnotation:", v6);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "center");
        v13 = v12;
        objc_msgSend(v4, "center");
        v15 = v14;
        objc_msgSend(v11, "center");
        v17 = v16;
        objc_msgSend(v11, "center");
        if (v11
          && llround(v13 * v15) != llround(v17 * v18)
          && !-[FMMapView isMapAnimating](self, "isMapAnimating")
          && hasUserLocation == 1)
        {
          objc_msgSend(v11, "setCenter:", v9, v10);
        }

      }
    }
  }
  -[FMMapView selectedAnnotationView](self, "selectedAnnotationView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    -[FMMapView selectedAnnotationView](self, "selectedAnnotationView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "annotation");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMMapView updateOverlayForAnnotation:withForce:](self, "updateOverlayForAnnotation:withForce:", v21, 0);

  }
  if (!-[FMMapView isMapAnimating](self, "isMapAnimating"))
    -[FMMapView updateUserTrackingButtonState](self, "updateUserTrackingButtonState");
  objc_msgSend(v22, "stop");

}

- (void)mapView:(id)a3 didUpdateUserLocation:(id)a4
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;

  v13 = a4;
  -[FMMapView currentDeviceAnnotation](self, "currentDeviceAnnotation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMMapView delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMMapView setUserLocation:](self, "setUserLocation:", v13);
  if (v13 && v5)
  {
    objc_msgSend(v13, "coordinate");
    v8 = v7;
    objc_msgSend(v5, "coordinate");
    if (vabdd_f64(v8, v9) >= 0.0001
      || (objc_msgSend(v13, "coordinate"), v11 = v10, objc_msgSend(v5, "coordinate"), vabdd_f64(v11, v12) >= 0.0001))
    {
      objc_msgSend(v13, "coordinate");
      objc_msgSend(v5, "setCoordinate:");
      -[FMMapView updateCameraPositionForAnnotation:](self, "updateCameraPositionForAnnotation:", v5);
      -[FMMapView setIsMapAnimating:](self, "setIsMapAnimating:", 0);
      -[FMMapView synchronize](self, "synchronize");
    }
LABEL_11:
    if (-[FMMapView showUserLocationCallout](self, "showUserLocationCallout")
      && (objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v6, "updateTitlesForAnnotation:", v13);
    }
    goto LABEL_14;
  }
  if (hasUserLocation == 1
    && -[FMMapView isAllAnnotationsShown](self, "isAllAnnotationsShown")
    && !-[FMMapView isMapPositioningDisabled](self, "isMapPositioningDisabled"))
  {
    -[FMMapView displayAllAnnotations](self, "displayAllAnnotations");
  }
  if (v13)
    goto LABEL_11;
LABEL_14:
  if ((hasUserLocation & 1) == 0)
  {
    hasUserLocation = 1;
    if (v5)
      -[FMMapView updateAnnotationStyle:](self, "updateAnnotationStyle:", v5);
    if (-[FMMapView isAllAnnotationsShown](self, "isAllAnnotationsShown")
      && !-[FMMapView isMapPositioningDisabled](self, "isMapPositioningDisabled"))
    {
      -[FMMapView setIsMapAnimating:](self, "setIsMapAnimating:", 0);
      -[FMMapView setIsUserLocationUpdated:](self, "setIsUserLocationUpdated:", 1);
      -[FMMapView displayAllAnnotations](self, "displayAllAnnotations");
    }
  }

}

- (void)updateAnnotationStyle:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[FMMapView viewForAnnotation:](self, "viewForAnnotation:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateStyleForAnnotation:", v4);

}

- (void)mapView:(id)a3 regionDidChangeAnimated:(BOOL)a4
{
  if (-[FMMapView isMapMoved](self, "isMapMoved", a3, a4))
    -[FMMapView setIsFingerOnMap:](self, "setIsFingerOnMap:", 0);
}

- (void)mapTouchBegan:(id)a3
{
  -[FMMapView setIsFingerOnMap:](self, "setIsFingerOnMap:", 1);
}

- (void)mapTouchEnded:(id)a3
{
  if (!-[FMMapView isMapMoved](self, "isMapMoved", a3))
    -[FMMapView setIsFingerOnMap:](self, "setIsFingerOnMap:", 0);
}

- (void)mapTouchMoved:(id)a3
{
  void *v4;
  uint64_t v5;
  int64_t v6;
  void *v7;
  char v8;
  void *v9;

  if (!-[FMMapView isPreviewing](self, "isPreviewing", a3))
  {
    -[FMMapView delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMMapView setIsMapPositioningDisabled:](self, "setIsMapPositioningDisabled:", 1);
    -[FMMapView setIsMapMoved:](self, "setIsMapMoved:", 1);
    -[FMMapView mapView](self, "mapView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "userTrackingMode");

    if (v5 != 2)
      -[FMMapView _setUserTrackingMode:animated:fromTrackingButton:](self, "_setUserTrackingMode:animated:fromTrackingButton:", 0, 1, 0);
    -[FMMapView depthSortAnnotations](self, "depthSortAnnotations");
    v6 = -[FMMapView renderingMode](self, "renderingMode");
    v7 = v9;
    if (!v6 && v9)
    {
      v8 = objc_opt_respondsToSelector();
      v7 = v9;
      if ((v8 & 1) != 0)
      {
        objc_msgSend(v9, "userDidMoveMap");
        v7 = v9;
      }
    }

  }
}

- (void)calloutButtonTapped:(id)a3
{
  id v4;

  -[FMMapView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (!-[FMMapView isFingerOnAnnotation](self, "isFingerOnAnnotation")
    && -[FMMapView showUserLocationCallout](self, "showUserLocationCallout")
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "userDidTapUserLocationCallOut");
  }

}

- (void)userLocationTapped:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  dispatch_time_t v10;
  id v11;
  _QWORD v12[4];
  id v13;
  FMMapView *v14;

  if (-[FMMapView showUserLocationCallout](self, "showUserLocationCallout", a3))
  {
    -[FMMapView mapView](self, "mapView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "userLocation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[FMMapView mapView](self, "mapView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[FMMapView mapView](self, "mapView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "userLocation");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "viewForAnnotation:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = dispatch_time(0, 500000000);
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __32__FMMapView_userLocationTapped___block_invoke;
      v12[3] = &unk_24C837090;
      v13 = v9;
      v14 = self;
      v11 = v9;
      dispatch_after(v10, MEMORY[0x24BDAC9B8], v12);

    }
  }
}

void __32__FMMapView_userLocationTapped___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "setEnabled:", 1);
  objc_msgSend(*(id *)(a1 + 40), "mapView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "selectedAnnotations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "annotation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  objc_msgSend(*(id *)(a1 + 40), "mapView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "mapView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "userLocation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v9, "deselectAnnotation:animated:", v8, 1);
  else
    objc_msgSend(v9, "selectAnnotation:animated:", v8, 1);

}

- (void)mapTapped:(id)a3
{
  char v4;
  void *v5;
  void *v6;
  id v7;

  if (!-[FMMapView isPreviewing](self, "isPreviewing", a3))
  {
    -[FMMapView delegate](self, "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v4 = objc_msgSend(v7, "shouldTapDeselectAnnotation") ^ 1;
    else
      v4 = 0;
    -[FMMapView setIsUserSwiping:](self, "setIsUserSwiping:", 0);
    if (!-[FMMapView renderingMode](self, "renderingMode") && (v4 & 1) == 0)
    {
      -[FMMapView _setUserTrackingMode:animated:fromTrackingButton:](self, "_setUserTrackingMode:animated:fromTrackingButton:", 0, 1, 0);
      -[FMMapView selectedAnnotationView](self, "selectedAnnotationView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        -[FMMapView setIsMapPositioningDisabled:](self, "setIsMapPositioningDisabled:", 1);
        -[FMMapView selectedAnnotationView](self, "selectedAnnotationView");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[FMMapView deselectAnnotationView:](self, "deselectAnnotationView:", v6);

      }
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v7, "userDidTapMap");
    if (!-[FMMapView renderingMode](self, "renderingMode")
      && !-[FMMapView isMapPositioningDisabled](self, "isMapPositioningDisabled"))
    {
      if (-[FMMapView isAllAnnotationsShown](self, "isAllAnnotationsShown"))
      {
        -[FMMapView setIsMapAnimating:](self, "setIsMapAnimating:", 0);
        -[FMMapView recenterVisibleAnnotations](self, "recenterVisibleAnnotations");
        -[FMMapView setIsMapPositioningDisabled:](self, "setIsMapPositioningDisabled:", 1);
        -[FMMapView setIsAllAnnotationsShown:](self, "setIsAllAnnotationsShown:", 0);
      }
    }

  }
}

- (void)mapDoubleTapped:(id)a3
{
  -[FMMapView setIsMapPositioningDisabled:](self, "setIsMapPositioningDisabled:", 1);
}

- (void)mapSwiped:(id)a3 withPercent:(double)a4
{
  id v6;

  -[FMMapView delegate](self, "delegate", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (!-[FMMapView renderingMode](self, "renderingMode") && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "userDidSwipeMapWithPercent:", fmin(a4, 1.0));
  -[FMMapView setIsUserSwiping:](self, "setIsUserSwiping:", 1);

}

- (void)mapSwipedBegin:(id)a3
{
  void *v4;

  -[FMMapView mapView](self, "mapView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUserInteractionEnabled:", 0);

  -[FMMapView setIsUserSwiping:](self, "setIsUserSwiping:", 1);
}

- (void)mapSwipedEnd:(id)a3 withPercent:(double)a4
{
  void *v6;
  void *v7;
  id v8;

  -[FMMapView delegate](self, "delegate", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[FMMapView setIsUserSwiping:](self, "setIsUserSwiping:", 0);
  -[FMMapView layoutTimer](self, "layoutTimer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "invalidate");

  -[FMMapView setLayoutTimer:](self, "setLayoutTimer:", 0);
  if (a4 < 1.0 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v8, "userDidSwipeCancel");
  -[FMMapView mapView](self, "mapView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setUserInteractionEnabled:", 1);

}

- (void)setIsSwipeGestureEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  self->_isSwipeGestureEnabled = a3;
  -[FMMapView mapGesture](self, "mapGesture");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsSwipeEnabled:", v3);

}

- (float)dampingForAltitude:(double)a3 andDistance:(double)a4
{
  float v4;
  float v5;
  void *v6;
  float v7;

  v4 = sqrt(a4 * a4 + a3 * a3);
  if (v4 <= 350000.0)
    v5 = 26.0;
  else
    v5 = 30.0;
  -[FMMapView selectedAnnotation](self, "selectedAnnotation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v7 = 2.0;
  else
    v7 = 0.0;

  return fminf((float)(powf(v4, v4 / 350000.0) + 17.0) + v7, v5);
}

- (double)distanceBetweenOrigin:(CLLocationCoordinate2D)a3 andDestination:(CLLocationCoordinate2D)a4
{
  CLLocationDegrees longitude;
  CLLocationDegrees latitude;
  MKMapPoint v6;
  CLLocationCoordinate2D v8;
  MKMapPoint v9;

  longitude = a4.longitude;
  latitude = a4.latitude;
  v6 = MKMapPointForCoordinate(a3);
  v8.latitude = latitude;
  v8.longitude = longitude;
  v9 = MKMapPointForCoordinate(v8);
  return MKMetersBetweenMapPoints(v6, v9);
}

- (void)fingerOnAnnotation:(id)a3
{
  _BOOL4 v4;
  void *v5;
  void *v6;

  -[FMMapView userLocationView](self, "userLocationView", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMMapView setPotentiallySelectedAnnotationView:](self, "setPotentiallySelectedAnnotationView:", 0);
  -[FMMapView setIsFingerOnAnnotation:](self, "setIsFingerOnAnnotation:", 1);
  v4 = -[FMMapView showUserLocationCallout](self, "showUserLocationCallout");
  v5 = v6;
  if (v4 && v6)
  {
    objc_msgSend(v6, "setSelected:", 0);
    v5 = v6;
  }

}

- (void)fingerOffAnnotation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD block[4];
  id v10;

  v4 = a3;
  -[FMMapView userLocationView](self, "userLocationView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[FMMapView isMapAnimating](self, "isMapAnimating"))
  {
    -[FMMapView potentiallySelectedAnnotationView](self, "potentiallySelectedAnnotationView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      objc_msgSend(v4, "view");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[FMMapView setPotentiallySelectedAnnotationView:](self, "setPotentiallySelectedAnnotationView:", v7);

    }
    -[FMMapView potentiallySelectedAnnotationView](self, "potentiallySelectedAnnotationView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMMapView selectOrDeselectAnnotationView:](self, "selectOrDeselectAnnotationView:", v8);

  }
  -[FMMapView setIsFingerOnAnnotation:](self, "setIsFingerOnAnnotation:", 0);
  if (-[FMMapView showUserLocationCallout](self, "showUserLocationCallout") && v5)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __33__FMMapView_fingerOffAnnotation___block_invoke;
    block[3] = &unk_24C837100;
    v10 = v5;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
}

uint64_t __33__FMMapView_fingerOffAnnotation___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setSelected:", 0);
}

- (void)updatePreviewLocationForAnnotation:(id)a3
{
  id v4;
  double v5;
  CLLocationDegrees v6;
  CLLocationDegrees v7;
  CLLocationCoordinate2D v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;

  v4 = a3;
  if (v4)
  {
    v12 = v4;
    objc_msgSend(v4, "coordinate");
    v6 = v5 + -0.0002;
    objc_msgSend(v12, "coordinate");
    v8 = CLLocationCoordinate2DMake(v6, v7);
    objc_msgSend(MEMORY[0x24BDDB0D0], "cameraLookingAtCenterCoordinate:fromDistance:pitch:heading:", v8.latitude, v8.longitude, 350.0, 50.0, 0.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x24BDF6F90];
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __48__FMMapView_updatePreviewLocationForAnnotation___block_invoke;
    v13[3] = &unk_24C837198;
    v13[4] = self;
    v14 = v9;
    v15 = v12;
    v11 = v9;
    objc_msgSend(v10, "performWithoutAnimation:", v13);

    v4 = v12;
  }

}

void __48__FMMapView_updatePreviewLocationForAnnotation___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "mapView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCamera:animated:", *(_QWORD *)(a1 + 40), 0);

  objc_msgSend(*(id *)(a1 + 32), "updateOverlayForAnnotation:withForce:", *(_QWORD *)(a1 + 48), 1);
  objc_msgSend(*(id *)(a1 + 32), "viewForAnnotation:", *(_QWORD *)(a1 + 48));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSelected:animated:", 1, 0);

}

- (void)updateAnnotationPositionAfterPreview:(id)a3
{
  void *v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  CLLocationCoordinate2D v39;
  void *v40;
  void *v41;
  double v42;
  void *v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  id v49;
  MKMapPoint v50;

  v49 = a3;
  -[FMMapView delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v5 = MEMORY[0x24BDDAFE0];
    v6 = *MEMORY[0x24BDDAFE0];
    v7 = *(double *)(MEMORY[0x24BDDAFE0] + 8);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v4, "mapPositionForAnnotation:", v49);
      v9 = v8;
      v11 = v10;
      v13 = v12;
      v15 = v14;
    }
    else
    {
      v13 = *(double *)(v5 + 16);
      v15 = *(double *)(v5 + 24);
      v11 = v7;
      v9 = v6;
    }
    if (v9 == v6 && v11 == v7)
    {
      -[FMMapView userLocation](self, "userLocation");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "coordinate");
      v19 = v18;
      v21 = v20;
      if (v17 && objc_msgSend(v49, "isThisDevice"))
      {
        objc_msgSend(v17, "coordinate");
        v19 = v22;
        v21 = v23;
      }
      objc_msgSend(v49, "horizontalAccuracy");
      -[FMMapView mapRectMakeWithRadialDistanceForCoordinate:andRadius:](self, "mapRectMakeWithRadialDistanceForCoordinate:andRadius:", v19, v21, v24);
      v9 = v25;
      v11 = v26;
      v13 = v27;
      v15 = v28;

    }
    if (v9 != v6 || v11 != v7)
    {
      -[FMMapView setIsAllAnnotationsShown:](self, "setIsAllAnnotationsShown:", 0);
      -[FMMapView setIsMapPositioningDisabled:](self, "setIsMapPositioningDisabled:", 0);
      -[FMMapView mapView](self, "mapView");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "bounds");
      v32 = v31 / v13;

      -[FMMapView maxZoomLevel](self, "maxZoomLevel");
      if (v32 > v33)
      {
        -[FMMapView maxZoomLevel](self, "maxZoomLevel");
        -[FMMapView normalizeMapRect:toZoomScale:](self, "normalizeMapRect:toZoomScale:", v9, v11, v13, v15, v34);
        v9 = v35;
        v11 = v36;
        v13 = v37;
        v15 = v38;
      }
      v50.x = v13 * 0.5 + v9;
      v50.y = v15 * 0.5 + v11;
      v39 = MKCoordinateForMapPoint(v50);
      -[FMMapView mapView](self, "mapView");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v40, "mapType"))
      {
        -[FMMapView traitCollection](self, "traitCollection");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = v39.latitude - dbl_20DBF32F0[objc_msgSend(v41, "verticalSizeClass") == 2];

      }
      else
      {
        v42 = v39.latitude + -0.0013;
      }

      if (v39.longitude >= -180.0 && v39.longitude <= 180.0 && v42 >= -90.0 && v42 <= 90.0)
      {
        objc_msgSend(MEMORY[0x24BDDB0D0], "cameraLookingAtCenterCoordinate:fromDistance:pitch:heading:", v42, v39.longitude, 400.0, 50.0, 0.0);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        -[FMMapView mapView](self, "mapView");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v45) = 1.0;
        LODWORD(v46) = 1.0;
        LODWORD(v47) = 20.0;
        LODWORD(v48) = 0;
        objc_msgSend(v44, "setCamera:duration:springMass:springStiffness:springDamping:springVelocity:", v43, 0.0, v45, v46, v47, v48);

      }
    }
  }

}

- (void)setIsPreviewing:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  self->_isPreviewing = a3;
  v3 = !a3;
  -[FMMapView mapGesture](self, "mapGesture");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabled:", v3);

}

- (void)selectAnnotationForPreview:(id)a3
{
  id v4;
  void *v5;
  dispatch_time_t v6;
  _QWORD block[5];

  v4 = a3;
  -[FMMapView deselectAnnotationViewIfNeeded:](self, "deselectAnnotationViewIfNeeded:", 0);
  -[FMMapView viewForAnnotation:](self, "viewForAnnotation:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMMapView setCurrentSelectedState:](self, "setCurrentSelectedState:", 1);
  -[FMMapView setSelectedAnnotationView:](self, "setSelectedAnnotationView:", v5);
  -[FMMapView setSelectedAnnotation:](self, "setSelectedAnnotation:", v4);
  -[FMMapView updatePreviewLocationForAnnotation:](self, "updatePreviewLocationForAnnotation:", v4);

  v6 = dispatch_time(0, 200000000);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __40__FMMapView_selectAnnotationForPreview___block_invoke;
  block[3] = &unk_24C837100;
  block[4] = self;
  dispatch_after(v6, MEMORY[0x24BDAC9B8], block);

}

void __40__FMMapView_selectAnnotationForPreview___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "selectedAnnotationView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setSelected:animated:", 1, 0);

}

- (FMMapViewDelegate)delegate
{
  return (FMMapViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (MKMapView)mapView
{
  return self->_mapView;
}

- (_MKUserTrackingButton)userTrackingButton
{
  return self->_userTrackingButton;
}

- (void)setUserTrackingButton:(id)a3
{
  objc_storeStrong((id *)&self->_userTrackingButton, a3);
}

- (UIColor)userLocationTintColor
{
  return self->_userLocationTintColor;
}

- (int64_t)currentTrackingMode
{
  return self->_currentTrackingMode;
}

- (void)setCurrentTrackingMode:(int64_t)a3
{
  self->_currentTrackingMode = a3;
}

- (int64_t)doubleSelectionMode
{
  return self->_doubleSelectionMode;
}

- (void)setDoubleSelectionMode:(int64_t)a3
{
  self->_doubleSelectionMode = a3;
}

- (int64_t)renderingMode
{
  return self->_renderingMode;
}

- (BOOL)isAllAnnotationsShown
{
  return self->_isAllAnnotationsShown;
}

- (void)setIsAllAnnotationsShown:(BOOL)a3
{
  self->_isAllAnnotationsShown = a3;
}

- (BOOL)isMapPositioningDisabled
{
  return self->_isMapPositioningDisabled;
}

- (BOOL)isSwipeGestureEnabled
{
  return self->_isSwipeGestureEnabled;
}

- (BOOL)isMapAnimating
{
  return self->_isMapAnimating;
}

- (void)setIsMapAnimating:(BOOL)a3
{
  self->_isMapAnimating = a3;
}

- (BOOL)isUserSwiping
{
  return self->_isUserSwiping;
}

- (void)setIsUserSwiping:(BOOL)a3
{
  self->_isUserSwiping = a3;
}

- (BOOL)isNearbyModeDisabled
{
  return self->_isNearbyModeDisabled;
}

- (void)setIsNearbyModeDisabled:(BOOL)a3
{
  self->_isNearbyModeDisabled = a3;
}

- (BOOL)showUserLocationCallout
{
  return self->_showUserLocationCallout;
}

- (void)setShowUserLocationCallout:(BOOL)a3
{
  self->_showUserLocationCallout = a3;
}

- (BOOL)isPreventingMapUpdates
{
  return self->_isPreventingMapUpdates;
}

- (void)setIsPreventingMapUpdates:(BOOL)a3
{
  self->_isPreventingMapUpdates = a3;
}

- (FMAnnotation)selectedAnnotation
{
  return (FMAnnotation *)objc_loadWeakRetained((id *)&self->_selectedAnnotation);
}

- (void)setSelectedAnnotation:(id)a3
{
  objc_storeWeak((id *)&self->_selectedAnnotation, a3);
}

- (BOOL)isPreviewing
{
  return self->_isPreviewing;
}

- (FMMapGestureRecognizer)mapGesture
{
  return self->_mapGesture;
}

- (void)setMapGesture:(id)a3
{
  objc_storeStrong((id *)&self->_mapGesture, a3);
}

- ($2A298E9A48029832219C371D8B4CA722)lastVisibleMapRect
{
  double x;
  double y;
  double width;
  double height;
  $2A298E9A48029832219C371D8B4CA722 result;

  x = self->_lastVisibleMapRect.origin.x;
  y = self->_lastVisibleMapRect.origin.y;
  width = self->_lastVisibleMapRect.size.width;
  height = self->_lastVisibleMapRect.size.height;
  result.var1.var1 = height;
  result.var1.var0 = width;
  result.var0.var1 = y;
  result.var0.var0 = x;
  return result;
}

- (void)setLastVisibleMapRect:(id)a3
{
  self->_lastVisibleMapRect = ($6A60F6B1D26F8A1963A84039ABF8840B)a3;
}

- (FMAnnotation)lastSelectedAnnotationBeforeTracking
{
  return (FMAnnotation *)objc_loadWeakRetained((id *)&self->_lastSelectedAnnotationBeforeTracking);
}

- (void)setLastSelectedAnnotationBeforeTracking:(id)a3
{
  objc_storeWeak((id *)&self->_lastSelectedAnnotationBeforeTracking, a3);
}

- (MKMapCamera)cameraBefore3DRendering
{
  return self->_cameraBefore3DRendering;
}

- (void)setCameraBefore3DRendering:(id)a3
{
  objc_storeStrong((id *)&self->_cameraBefore3DRendering, a3);
}

- (NSTimer)layoutTimer
{
  return self->_layoutTimer;
}

- (void)setLayoutTimer:(id)a3
{
  objc_storeStrong((id *)&self->_layoutTimer, a3);
}

- (double)maxZoomLevel
{
  return self->_maxZoomLevel;
}

- (void)setMaxZoomLevel:(double)a3
{
  self->_maxZoomLevel = a3;
}

- (UIEdgeInsets)lastVisibleInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_lastVisibleInsets.top;
  left = self->_lastVisibleInsets.left;
  bottom = self->_lastVisibleInsets.bottom;
  right = self->_lastVisibleInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setLastVisibleInsets:(UIEdgeInsets)a3
{
  self->_lastVisibleInsets = a3;
}

- (BOOL)isUserLocationUpdated
{
  return self->_isUserLocationUpdated;
}

- (void)setIsUserLocationUpdated:(BOOL)a3
{
  self->_isUserLocationUpdated = a3;
}

- (BOOL)canChangeUserTrackingMode
{
  return self->_canChangeUserTrackingMode;
}

- (void)setCanChangeUserTrackingMode:(BOOL)a3
{
  self->_canChangeUserTrackingMode = a3;
}

- (BOOL)isGoingBackToAllAnnotation
{
  return self->_isGoingBackToAllAnnotation;
}

- (void)setIsGoingBackToAllAnnotation:(BOOL)a3
{
  self->_isGoingBackToAllAnnotation = a3;
}

- (CADisplayLink)displayLink
{
  return self->_displayLink;
}

- (void)setDisplayLink:(id)a3
{
  objc_storeStrong((id *)&self->_displayLink, a3);
}

- (BOOL)isSwitchingTrackingMode
{
  return self->_isSwitchingTrackingMode;
}

- (void)setIsSwitchingTrackingMode:(BOOL)a3
{
  self->_isSwitchingTrackingMode = a3;
}

- (BOOL)shouldDisplayOverlay
{
  return self->_shouldDisplayOverlay;
}

- (void)setShouldDisplayOverlay:(BOOL)a3
{
  self->_shouldDisplayOverlay = a3;
}

- (BOOL)canSelectUserAnnotation
{
  return self->_canSelectUserAnnotation;
}

- (void)setCanSelectUserAnnotation:(BOOL)a3
{
  self->_canSelectUserAnnotation = a3;
}

- (NSTimer)userSelectionTimer
{
  return self->_userSelectionTimer;
}

- (void)setUserSelectionTimer:(id)a3
{
  objc_storeStrong((id *)&self->_userSelectionTimer, a3);
}

- (FMAnnotationView)potentiallySelectedAnnotationView
{
  return self->_potentiallySelectedAnnotationView;
}

- (void)setPotentiallySelectedAnnotationView:(id)a3
{
  objc_storeStrong((id *)&self->_potentiallySelectedAnnotationView, a3);
}

- (FMAnnotationView)selectedAnnotationView
{
  return self->_selectedAnnotationView;
}

- (void)setSelectedAnnotationView:(id)a3
{
  objc_storeStrong((id *)&self->_selectedAnnotationView, a3);
}

- (MKUserLocationView)userLocationView
{
  return (MKUserLocationView *)objc_loadWeakRetained((id *)&self->_userLocationView);
}

- (void)setUserLocationView:(id)a3
{
  objc_storeWeak((id *)&self->_userLocationView, a3);
}

- (MKUserLocation)userLocation
{
  return self->_userLocation;
}

- (void)setUserLocation:(id)a3
{
  objc_storeStrong((id *)&self->_userLocation, a3);
}

- (FMAnnotation)currentDeviceAnnotation
{
  return (FMAnnotation *)objc_loadWeakRetained((id *)&self->_currentDeviceAnnotation);
}

- (void)setCurrentDeviceAnnotation:(id)a3
{
  objc_storeWeak((id *)&self->_currentDeviceAnnotation, a3);
}

- (MKAnnotation)otherSelectedAnnotation
{
  return (MKAnnotation *)objc_loadWeakRetained((id *)&self->_otherSelectedAnnotation);
}

- (void)setOtherSelectedAnnotation:(id)a3
{
  objc_storeWeak((id *)&self->_otherSelectedAnnotation, a3);
}

- (int64_t)currentSelectedState
{
  return self->_currentSelectedState;
}

- (void)setCurrentSelectedState:(int64_t)a3
{
  self->_currentSelectedState = a3;
}

- (NSMutableArray)accuracyOverlays
{
  return self->_accuracyOverlays;
}

- (void)setAccuracyOverlays:(id)a3
{
  objc_storeStrong((id *)&self->_accuracyOverlays, a3);
}

- (BOOL)isFingerOnMap
{
  return self->_isFingerOnMap;
}

- (void)setIsFingerOnMap:(BOOL)a3
{
  self->_isFingerOnMap = a3;
}

- (BOOL)isFingerOnAnnotation
{
  return self->_isFingerOnAnnotation;
}

- (void)setIsFingerOnAnnotation:(BOOL)a3
{
  self->_isFingerOnAnnotation = a3;
}

- (BOOL)isMapMoved
{
  return self->_isMapMoved;
}

- (void)setIsMapMoved:(BOOL)a3
{
  self->_isMapMoved = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accuracyOverlays, 0);
  objc_destroyWeak((id *)&self->_otherSelectedAnnotation);
  objc_destroyWeak((id *)&self->_currentDeviceAnnotation);
  objc_storeStrong((id *)&self->_userLocation, 0);
  objc_destroyWeak((id *)&self->_userLocationView);
  objc_storeStrong((id *)&self->_selectedAnnotationView, 0);
  objc_storeStrong((id *)&self->_potentiallySelectedAnnotationView, 0);
  objc_storeStrong((id *)&self->_userSelectionTimer, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_layoutTimer, 0);
  objc_storeStrong((id *)&self->_cameraBefore3DRendering, 0);
  objc_destroyWeak((id *)&self->_lastSelectedAnnotationBeforeTracking);
  objc_storeStrong((id *)&self->_mapGesture, 0);
  objc_destroyWeak((id *)&self->_selectedAnnotation);
  objc_storeStrong((id *)&self->_userLocationTintColor, 0);
  objc_storeStrong((id *)&self->_userTrackingButton, 0);
  objc_storeStrong((id *)&self->_mapView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)animateMapToPosition:(uint64_t)a1 withInsets:(NSObject *)a2 attributionInsets:andZoom:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_20DBDA000, a2, OS_LOG_TYPE_DEBUG, "FMMapView: setting 3D camera %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_2();
}

- (void)animateMapToPosition:(double)a3 withInsets:(double)a4 attributionInsets:(double)a5 andZoom:(double)a6 .cold.2(void *a1, NSObject *a2, double a3, double a4, double a5, double a6)
{
  void *v8;
  uint64_t v9;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  NSStringFromUIEdgeInsets(*(UIEdgeInsets *)&a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "safeAreaInsets");
  v10 = 138412546;
  v11 = v8;
  v12 = 2048;
  v13 = v9;
  _os_log_debug_impl(&dword_20DBDA000, a2, OS_LOG_TYPE_DEBUG, "FMMapView: animateMapToPosition insets %@ safeArea: %f", (uint8_t *)&v10, 0x16u);

}

void __71__FMMapView_animateMapToPosition_withInsets_attributionInsets_andZoom___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_20DBDA000, a2, a3, "Error archiving FMMapViewLastVisibleInsets: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void __71__FMMapView_animateMapToPosition_withInsets_attributionInsets_andZoom___block_invoke_2_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_20DBDA000, a2, a3, "Error archiving FMMapViewLastVisibleRect: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)mapView:(uint64_t)a3 rendererForOverlay:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_20DBDA000, a1, a3, "No customRendererForOverlay!", a5, a6, a7, a8, 0);
}

- (void)mapView:(uint64_t)a3 rendererForOverlay:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_20DBDA000, a1, a3, "Expected overlay to be FMAccuracyOverlay!", a5, a6, a7, a8, 0);
}

@end
