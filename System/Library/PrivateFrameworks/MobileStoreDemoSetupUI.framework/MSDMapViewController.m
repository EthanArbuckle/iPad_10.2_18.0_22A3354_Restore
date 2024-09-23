@implementation MSDMapViewController

- (MSDMapViewController)initWithDelegate:(id)a3
{
  id v4;
  MSDMapViewController *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MSDMapViewController;
  v5 = -[MSDMapViewController init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDF6880], "buttonWithType:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSDMapViewController setRecenterButton:](v5, "setRecenterButton:", v6);

    -[MSDMapViewController recenterButton](v5, "recenterButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setHidden:", 1);

    -[MSDMapViewController setUserLocation:](v5, "setUserLocation:", 0);
    -[MSDMapViewController setDelegate:](v5, "setDelegate:", v4);
    v8 = (void *)objc_opt_new();
    -[MSDMapViewController setMapView:](v5, "setMapView:", v8);

    -[MSDMapViewController mapView](v5, "mapView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setDelegate:", v5);

    -[MSDMapViewController mapView](v5, "mapView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setShowsUserLocation:", 1);

    -[MSDMapViewController mapView](v5, "mapView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[MSDMapViewController mapView](v5, "mapView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "registerClass:forAnnotationViewWithReuseIdentifier:", objc_opt_class(), CFSTR("StoreAnnotation"));

    -[MSDMapViewController mapView](v5, "mapView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "registerClass:forAnnotationViewWithReuseIdentifier:", objc_opt_class(), CFSTR("StoreClusterAnnotation"));

  }
  return v5;
}

- (void)viewDidLoad
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
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
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
  objc_super v37;
  _QWORD v38[3];

  v38[2] = *MEMORY[0x24BDAC8D0];
  v37.receiver = self;
  v37.super_class = (Class)MSDMapViewController;
  -[MSDMapViewController viewDidLoad](&v37, sel_viewDidLoad);
  -[MSDMapViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSDMapViewController mapView](self, "mapView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addSubview:", v4);

  objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("location"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSDMapViewController recenterButton](self, "recenterButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImage:forState:", v36, 0);

  objc_msgSend(MEMORY[0x24BDF6950], "systemBlueColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSDMapViewController recenterButton](self, "recenterButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTintColor:", v6);

  objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSDMapViewController recenterButton](self, "recenterButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBackgroundColor:", v8);

  -[MSDMapViewController recenterButton](self, "recenterButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setCornerRadius:", 10.0);

  -[MSDMapViewController recenterButton](self, "recenterButton");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setBorderWidth:", 1.0);

  objc_msgSend(MEMORY[0x24BDF6950], "systemBlueColor");
  v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v15 = objc_msgSend(v14, "CGColor");
  -[MSDMapViewController recenterButton](self, "recenterButton");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "layer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setBorderColor:", v15);

  -[MSDMapViewController recenterButton](self, "recenterButton");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setContentEdgeInsets:", 5.0, 5.0, 5.0, 5.0);

  -[MSDMapViewController recenterButton](self, "recenterButton");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addTarget:action:forControlEvents:", self, sel__recenter_, 64);

  -[MSDMapViewController recenterButton](self, "recenterButton");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[MSDMapViewController view](self, "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSDMapViewController recenterButton](self, "recenterButton");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addSubview:", v22);

  -[MSDMapViewController recenterButton](self, "recenterButton");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "trailingAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSDMapViewController view](self, "view");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "safeAreaLayoutGuide");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "trailingAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "constraintEqualToAnchor:constant:", v24, -15.0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v25;
  -[MSDMapViewController recenterButton](self, "recenterButton");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "topAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSDMapViewController view](self, "view");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "safeAreaLayoutGuide");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "topAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToAnchor:constant:", v30, 15.0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v38[1] = v31;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v38, 2);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v32);
}

- (void)viewDidLayoutSubviews
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
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  objc_super v24;
  _QWORD v25[5];

  v25[4] = *MEMORY[0x24BDAC8D0];
  v24.receiver = self;
  v24.super_class = (Class)MSDMapViewController;
  -[MSDMapViewController viewDidLayoutSubviews](&v24, sel_viewDidLayoutSubviews);
  -[MSDMapViewController mapView](self, "mapView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "topAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSDMapViewController view](self, "view");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "topAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToAnchor:", v20);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v19;
  -[MSDMapViewController mapView](self, "mapView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "bottomAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSDMapViewController view](self, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "bottomAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:", v15);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v14;
  -[MSDMapViewController mapView](self, "mapView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "leftAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSDMapViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "leftAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "constraintEqualToAnchor:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2] = v6;
  -[MSDMapViewController mapView](self, "mapView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "rightAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSDMapViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "rightAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v25[3] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v12);
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MSDMapViewController;
  -[MSDMapViewController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  -[MSDMapViewController stopUpdatingUserLocation](self, "stopUpdatingUserLocation");
}

- (void)zoomToStore:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  int v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  defaultLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 138543362;
    v19 = v4;
    _os_log_impl(&dword_22A6E6000, v5, OS_LOG_TYPE_DEFAULT, "Zooming to store %{public}@...", (uint8_t *)&v18, 0xCu);
  }

  -[MSDMapViewController _getAnnotationWithStoreInfo:](self, "_getAnnotationWithStoreInfo:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSDMapViewController mapView](self, "mapView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "selectedAnnotations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9 != 1)
    goto LABEL_8;
  -[MSDMapViewController mapView](self, "mapView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "selectedAnnotations");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v12, "memberAnnotations");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "firstObject");
    v14 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)v14;
  }
  if ((objc_msgSend(v6, "isSameLocation:", v12) & 1) == 0)
  {

LABEL_8:
    if (v6)
    {
      -[MSDMapViewController mapView](self, "mapView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "selectAnnotation:animated:", v6, 1);
    }
    else
    {
      defaultLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[MSDMapViewController zoomToStore:].cold.1((uint64_t)v4, v15);

      objc_msgSend(v4, "storeLocation");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "coordinate");
      -[MSDMapViewController _zoomToCoordinate:withRadius:allowZoomOut:](self, "_zoomToCoordinate:withRadius:allowZoomOut:", 0);
    }
    goto LABEL_13;
  }
  defaultLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "storeInfo");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138543362;
    v19 = v17;
    _os_log_impl(&dword_22A6E6000, v16, OS_LOG_TYPE_DEFAULT, "Store %{public}@ have coordinate already zoomed, skipping", (uint8_t *)&v18, 0xCu);

  }
LABEL_13:

}

- (void)deselectAnnotation
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  -[MSDMapViewController mapView](self, "mapView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectedAnnotations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    -[MSDMapViewController mapView](self, "mapView", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "selectedAnnotations");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v15;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v11);
          -[MSDMapViewController mapView](self, "mapView");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "deselectAnnotation:animated:", v12, 1);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v9);
    }

  }
}

- (void)annotateStores:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  MSDMapAnnotation *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "count"))
  {
    -[MSDMapViewController _removeAllStoreAnnotations](self, "_removeAllStoreAnnotations");
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10);
          -[MSDMapViewController mapView](self, "mapView", (_QWORD)v14);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = -[MSDMapAnnotation initWithStoreInfo:]([MSDMapAnnotation alloc], "initWithStoreInfo:", v11);
          objc_msgSend(v12, "addAnnotation:", v13);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v8);
    }

    -[MSDMapViewController _zoomToAnnotation](self, "_zoomToAnnotation");
  }

}

- (void)stopUpdatingUserLocation
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  defaultLogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_22A6E6000, v3, OS_LOG_TYPE_DEFAULT, "Stopping User Location Update...", v5, 2u);
  }

  -[MSDMapViewController mapView](self, "mapView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShowsUserLocation:", 0);

}

- (void)mapView:(id)a3 didUpdateUserLocation:(id)a4
{
  id v6;
  MSDMapViewController *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  -[MSDMapViewController userLocation](v7, "userLocation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    -[MSDMapViewController recenterButton](v7, "recenterButton");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setHidden:", 0);

    objc_msgSend(v6, "location");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "coordinate");
    -[MSDMapViewController _zoomToCoordinate:withRadius:allowZoomOut:](v7, "_zoomToCoordinate:withRadius:allowZoomOut:", 0);

  }
  objc_msgSend(v6, "location");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSDMapViewController setUserLocation:](v7, "setUserLocation:", v11);

  -[MSDMapViewController delegate](v7, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSDMapViewController userLocation](v7, "userLocation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "userLocationDidChange:", v13);

  objc_sync_exit(v7);
}

- (id)mapView:(id)a3 viewForAnnotation:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  id v19;
  int v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    -[MSDMapViewController mapView](self, "mapView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dequeueReusableAnnotationViewWithIdentifier:forAnnotation:", CFSTR("StoreClusterAnnotation"), v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setGlyphTintColor:", v9);

    objc_msgSend(MEMORY[0x24BDF6950], "systemRedColor");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setMarkerTintColor:", v10);
LABEL_8:

    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = v5;
    -[MSDMapViewController mapView](self, "mapView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dequeueReusableAnnotationViewWithIdentifier:", CFSTR("StoreAnnotation"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "setClusteringIdentifier:", *MEMORY[0x24BDDAFF8]);
    objc_msgSend(v10, "storeInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isHQ");

    if (v13)
      v14 = CFSTR("building.2.fill");
    else
      v14 = CFSTR("mappin");
    objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setGlyphImage:", v15);

    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setGlyphTintColor:", v16);

    objc_msgSend(MEMORY[0x24BDF6950], "systemRedColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setMarkerTintColor:", v17);

    goto LABEL_8;
  }
  defaultLogHandle();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v21 = 138543362;
    v22 = (id)objc_opt_class();
    v19 = v22;
    _os_log_impl(&dword_22A6E6000, v18, OS_LOG_TYPE_DEFAULT, "Unrecognized annotation class: %{public}@, ignoring...", (uint8_t *)&v21, 0xCu);

  }
  v8 = 0;
LABEL_12:

  return v8;
}

- (void)mapView:(id)a3 didSelectAnnotationView:(id)a4
{
  id v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  void *v37;
  _BYTE v38[128];
  _QWORD v39[3];

  v39[1] = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  objc_msgSend(v5, "annotation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  objc_msgSend(v5, "annotation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((isKindOfClass & 1) != 0)
  {
    v9 = objc_alloc(MEMORY[0x24BDDB040]);
    v39[0] = v8;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v39, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initWithMemberAnnotations:", v10);

    if (!v11)
      goto LABEL_23;
  }
  else
  {
    objc_opt_class();
    v12 = objc_opt_isKindOfClass();

    if ((v12 & 1) == 0)
      goto LABEL_23;
    objc_msgSend(v5, "annotation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
      goto LABEL_23;
  }
  if ((objc_msgSend(v11, "isSameCoordinate") & 1) != 0 || objc_msgSend(v11, "isInCloseProximity"))
  {
    v13 = (void *)objc_opt_new();
    objc_msgSend(v11, "memberAnnotations");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "firstObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "storeInfo");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "storeLocation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "coordinate");
    v19 = v18;
    v21 = v20;

    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    objc_msgSend(v11, "memberAnnotations", 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v31;
      do
      {
        v26 = 0;
        do
        {
          if (*(_QWORD *)v31 != v25)
            objc_enumerationMutation(v22);
          objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * v26), "storeInfo");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObject:", v27);

          ++v26;
        }
        while (v24 != v26);
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
      }
      while (v24);
    }

    defaultLogHandle();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v35 = "-[MSDMapViewController mapView:didSelectAnnotationView:]";
      v36 = 2112;
      v37 = v13;
      _os_log_impl(&dword_22A6E6000, v28, OS_LOG_TYPE_DEFAULT, "%s - stores %@ selected", buf, 0x16u);
    }

    if (objc_msgSend(v11, "isSameCoordinate"))
      -[MSDMapViewController _zoomToCoordinate:withRadius:allowZoomOut:](self, "_zoomToCoordinate:withRadius:allowZoomOut:", 0, v19, v21, 300.0);
    else
      -[MSDMapViewController _recenterToCoordinate:](self, "_recenterToCoordinate:", v19, v21);
    -[MSDMapViewController delegate](self, "delegate");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "didSelectStores:forViewController:", v13, self);

  }
  else
  {
    -[MSDMapViewController mapView](self, "mapView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "memberAnnotations");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "showAnnotations:animated:", v15, 1);
  }

LABEL_23:
}

- (void)mapView:(id)a3 didDeselectAnnotationView:(id)a4
{
  id v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  void *v28;
  void *v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  objc_msgSend(v5, "annotation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  objc_msgSend(v5, "annotation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((isKindOfClass & 1) != 0)
  {
    defaultLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v8, "storeInfo");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v10;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v29, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v31 = "-[MSDMapViewController mapView:didDeselectAnnotationView:]";
      v32 = 2114;
      v33 = v11;
      _os_log_impl(&dword_22A6E6000, v9, OS_LOG_TYPE_DEFAULT, "%s - stores %{public}@ de-selected", buf, 0x16u);

    }
    -[MSDMapViewController delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "storeInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v13;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v28, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "didDeselectStores:forViewController:", v14, self);

    goto LABEL_18;
  }
  objc_opt_class();
  v15 = objc_opt_isKindOfClass();

  if ((v15 & 1) != 0)
  {
    v8 = (void *)objc_opt_new();
    objc_msgSend(v5, "annotation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v12, "isSameCoordinate") & 1) == 0 && !objc_msgSend(v12, "isInCloseProximity"))
      goto LABEL_19;
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    objc_msgSend(v12, "memberAnnotations", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v24;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v24 != v19)
            objc_enumerationMutation(v16);
          objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v20), "storeInfo");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v21);

          ++v20;
        }
        while (v18 != v20);
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v18);
    }

    defaultLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v31 = "-[MSDMapViewController mapView:didDeselectAnnotationView:]";
      v32 = 2112;
      v33 = v8;
      _os_log_impl(&dword_22A6E6000, v22, OS_LOG_TYPE_DEFAULT, "%s - stores %@ de-selected", buf, 0x16u);
    }

    -[MSDMapViewController delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "didDeselectStores:forViewController:", v8, self);
LABEL_18:

LABEL_19:
  }

}

- (void)_zoomToAnnotation
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  -[MSDMapViewController deselectAnnotation](self, "deselectAnnotation");
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[MSDMapViewController mapView](self, "mapView", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "annotations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v10, "storeInfo");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v11, "isNearby"))
            objc_msgSend(v3, "addObject:", v10);

        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  -[MSDMapViewController mapView](self, "mapView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "showAnnotations:animated:", v3, 1);

}

- (void)_recenter:(id)a3
{
  void *v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  -[MSDMapViewController userLocation](self, "userLocation", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    defaultLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_22A6E6000, v5, OS_LOG_TYPE_DEFAULT, "Recentering to current user location...", v7, 2u);
    }

    -[MSDMapViewController userLocation](self, "userLocation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "coordinate");
    -[MSDMapViewController _zoomToCoordinate:withRadius:allowZoomOut:](self, "_zoomToCoordinate:withRadius:allowZoomOut:", 1);

    -[MSDMapViewController deselectAnnotation](self, "deselectAnnotation");
  }
}

- (void)_zoomToCoordinate:(CLLocationCoordinate2D)a3 withRadius:(double)a4 allowZoomOut:(BOOL)a5
{
  double v7;
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
  double v18;
  id v19;

  v7 = MEMORY[0x22E2DFFD8](self, a2, (__n128)a3, *(__n128 *)&a3.longitude, a4 + a4, a4 + a4);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  if (!a5)
  {
    -[MSDMapViewController mapView](self, "mapView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "region");
    v16 = v15;
    v18 = v17;

    if (v16 < v11)
      v11 = v16;
    if (v18 < v13)
      v13 = v18;
  }
  -[MSDMapViewController mapView](self, "mapView");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setRegion:animated:", 1, v7, v9, v11, v13);

}

- (void)_recenterToCoordinate:(CLLocationCoordinate2D)a3
{
  double longitude;
  double latitude;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;

  longitude = a3.longitude;
  latitude = a3.latitude;
  -[MSDMapViewController mapView](self, "mapView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "region");
  v8 = v7;
  v10 = v9;

  -[MSDMapViewController mapView](self, "mapView");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setRegion:animated:", 1, latitude, longitude, v8, v10);

}

- (id)_getAnnotationWithStoreInfo:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v17 = a3;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[MSDMapViewController mapView](self, "mapView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "annotations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v11 = v10;
          objc_msgSend(v11, "storeInfo");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "appleID");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "appleID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v13, "isEqual:", v14);

          if ((v15 & 1) != 0)
            goto LABEL_12;

        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v7);
  }
  v11 = 0;
LABEL_12:

  return v11;
}

- (void)_removeAllStoreAnnotations
{
  void *v3;
  void *v4;
  id v5;

  -[MSDMapViewController mapView](self, "mapView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[MSDMapViewController mapView](self, "mapView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "annotations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAnnotations:", v4);

}

- (MKMapView)mapView
{
  return self->_mapView;
}

- (void)setMapView:(id)a3
{
  objc_storeStrong((id *)&self->_mapView, a3);
}

- (MSDMapViewControllerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_delegate, a3);
}

- (UIButton)recenterButton
{
  return self->_recenterButton;
}

- (void)setRecenterButton:(id)a3
{
  objc_storeStrong((id *)&self->_recenterButton, a3);
}

- (CLLocation)userLocation
{
  return self->_userLocation;
}

- (void)setUserLocation:(id)a3
{
  objc_storeStrong((id *)&self->_userLocation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userLocation, 0);
  objc_storeStrong((id *)&self->_recenterButton, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_mapView, 0);
}

- (void)zoomToStore:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_22A6E6000, a2, OS_LOG_TYPE_ERROR, "Unable to find annotation for store: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
