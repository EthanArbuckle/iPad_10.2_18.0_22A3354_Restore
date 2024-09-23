@implementation HKWorkoutRouteViewController

- (HKWorkoutRouteViewController)initWithLocationReadings:(id)a3 title:(id)a4 sharingEnabled:(BOOL)a5 shareText:(id)a6 excludedActivityTypes:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  HKWorkoutRouteViewController *v17;
  uint64_t v18;
  HKWorkout *workout;
  objc_super v21;

  v13 = a3;
  v14 = a4;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)HKWorkoutRouteViewController;
  v17 = -[HKWorkoutRouteViewController init](&v21, sel_init);
  if (v17)
  {
    objc_msgSend(v13, "workout");
    v18 = objc_claimAutoreleasedReturnValue();
    workout = v17->_workout;
    v17->_workout = (HKWorkout *)v18;

    objc_storeStrong((id *)&v17->_locationReadings, a3);
    v17->_sharingEnabled = a5;
    objc_storeStrong((id *)&v17->_shareText, a6);
    objc_storeStrong((id *)&v17->_excludedActivityTypes, a7);
    -[HKWorkoutRouteViewController setTitle:](v17, "setTitle:", v14);
  }

  return v17;
}

- (void)viewDidLoad
{
  HKRouteView *v3;
  HKRouteView *routeView;
  void *v5;
  HKRouteView *v6;
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
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)HKWorkoutRouteViewController;
  -[HKWorkoutRouteViewController viewDidLoad](&v22, sel_viewDidLoad);
  v3 = objc_alloc_init(HKRouteView);
  routeView = self->_routeView;
  self->_routeView = v3;

  if (self->_locationReadings)
    -[HKRouteView setLocationReadings:](self->_routeView, "setLocationReadings:");
  -[HKWorkoutRouteViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", self->_routeView);

  v6 = self->_routeView;
  -[HKWorkoutRouteViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView hk_alignConstraintsWithView:](v6, "hk_alignConstraintsWithView:", v7);

  -[HKRouteView toggleMapTypeButton](self->_routeView, "toggleMapTypeButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addTarget:action:forControlEvents:", self, sel__toggleRouteViewMapType_, 64);

  if (self->_sharingEnabled)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 9, self, sel__shareButtonPressed_);
    -[HKWorkoutRouteViewController navigationItem](self, "navigationItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setRightBarButtonItem:", v9);

  }
  if (objc_msgSend(MEMORY[0x1E0CB6F18], "isAppleInternalInstall"))
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel__internalDebuggingOnly_toggleUnsmoothedLocations_);
    objc_msgSend(v11, "setNumberOfTapsRequired:", 4);
    objc_msgSend(v11, "setNumberOfTouchesRequired:", 2);
    -[HKWorkoutRouteViewController navigationController](self, "navigationController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "navigationBar");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addGestureRecognizer:", v11);

  }
  -[HKWorkoutRouteViewController routeView](self, "routeView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKWorkoutRouteViewController routeView](self, "routeView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "toggleMapTypeButton");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bringSubviewToFront:", v16);

  v17 = objc_alloc_init(MEMORY[0x1E0DC3A30]);
  objc_msgSend(v17, "configureWithDefaultBackground");
  -[HKWorkoutRouteViewController navigationItem](self, "navigationItem");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setScrollEdgeAppearance:", v17);

  -[HKWorkoutRouteViewController navigationItem](self, "navigationItem");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setStandardAppearance:", v17);

  -[HKWorkoutRouteViewController navigationItem](self, "navigationItem");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setCompactAppearance:", v17);

  -[HKWorkoutRouteViewController navigationItem](self, "navigationItem");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setCompactScrollEdgeAppearance:", v17);

}

- (void)viewWillAppear:(BOOL)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HKWorkoutRouteViewController;
  -[HKWorkoutRouteViewController viewWillAppear:](&v8, sel_viewWillAppear_, a3);
  v4 = objc_alloc_init(MEMORY[0x1E0DC3D30]);
  objc_msgSend(v4, "configureWithDefaultBackground");
  -[HKWorkoutRouteViewController tabBarController](self, "tabBarController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tabBar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "selectedItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setStandardAppearance:", v4);
  objc_msgSend(v7, "setScrollEdgeAppearance:", v4);

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HKWorkoutRouteViewController;
  -[HKWorkoutRouteViewController viewWillDisappear:](&v7, sel_viewWillDisappear_, a3);
  -[HKWorkoutRouteViewController tabBarController](self, "tabBarController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tabBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selectedItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setStandardAppearance:", 0);
  objc_msgSend(v6, "setScrollEdgeAppearance:", 0);

}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (void)_internalDebuggingOnly_toggleUnsmoothedLocations:(id)a3
{
  NSObject *v4;
  _BOOL4 showUnsmoothedRoute;
  HKRouteView *routeView;
  HKLocationReadings *locationReadings;
  void *v8;
  void *v9;
  void *v10;
  uint8_t v11[16];

  _HKInitializeLogging();
  v4 = *MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_1D7813000, v4, OS_LOG_TYPE_DEFAULT, "[routes] Apple internal: toggle unsmoothed locations.", v11, 2u);
  }
  showUnsmoothedRoute = self->_showUnsmoothedRoute;
  self->_showUnsmoothedRoute = !showUnsmoothedRoute;
  if (showUnsmoothedRoute)
  {
    routeView = self->_routeView;
    locationReadings = self->_locationReadings;
  }
  else
  {
    locationReadings = self->_unsmoothedLocationReadings;
    if (!locationReadings)
    {
      -[HKWorkoutRouteViewController _internalDebuggingOnly_fetchUnsmoothedRoutesFromDatabase](self, "_internalDebuggingOnly_fetchUnsmoothedRoutesFromDatabase");
      goto LABEL_8;
    }
    routeView = self->_routeView;
  }
  -[HKRouteView setLocationReadings:](routeView, "setLocationReadings:", locationReadings);
LABEL_8:
  -[HKWorkoutRouteViewController routeView](self, "routeView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKWorkoutRouteViewController routeView](self, "routeView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "toggleMapTypeButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bringSubviewToFront:", v10);

}

- (void)_internalDebuggingOnly_fetchUnsmoothedRoutesFromDatabase
{
  HKHealthStore *v3;
  HKHealthStore *healthStore;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  id location;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  if (!self->_healthStore)
  {
    v3 = (HKHealthStore *)objc_alloc_init(MEMORY[0x1E0CB6780]);
    healthStore = self->_healthStore;
    self->_healthStore = v3;

  }
  v5 = (void *)MEMORY[0x1E0CB6A78];
  -[HKWorkout UUID](self->_workout, "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateForObjectsWithMetadataKey:allowedValues:", *MEMORY[0x1E0CB7358], v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB6B00], "dataTypeWithCode:", 102);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v11 = objc_alloc(MEMORY[0x1E0CB6AF8]);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __88__HKWorkoutRouteViewController__internalDebuggingOnly_fetchUnsmoothedRoutesFromDatabase__block_invoke;
  v13[3] = &unk_1E9C44938;
  objc_copyWeak(&v14, &location);
  v13[4] = self;
  v12 = (void *)objc_msgSend(v11, "initWithSampleType:predicate:limit:sortDescriptors:resultsHandler:", v10, v9, 0, 0, v13);
  -[HKHealthStore executeQuery:](self->_healthStore, "executeQuery:", v12);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

void __88__HKWorkoutRouteViewController__internalDebuggingOnly_fetchUnsmoothedRoutesFromDatabase__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id WeakRetained;
  void *v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v9 || !objc_msgSend(v8, "count"))
  {
    _HKInitializeLogging();
    v10 = *MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v9;
      _os_log_impl(&dword_1D7813000, v10, OS_LOG_TYPE_DEFAULT, "[routes] No unsmoothed series, error: %@", buf, 0xCu);
    }
  }
  else
  {
    v11 = objc_alloc(MEMORY[0x1E0CB7060]);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "healthStore");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v11, "initWithHealthStore:", v13);

    objc_msgSend(v14, "setWorkoutRoutes:", v8);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __88__HKWorkoutRouteViewController__internalDebuggingOnly_fetchUnsmoothedRoutesFromDatabase__block_invoke_372;
    v15[3] = &unk_1E9C44910;
    v15[4] = *(_QWORD *)(a1 + 32);
    objc_copyWeak(&v16, (id *)(a1 + 40));
    objc_msgSend(v14, "fetchAllLocationsWithCompletion:", v15);
    objc_destroyWeak(&v16);

  }
}

void __88__HKWorkoutRouteViewController__internalDebuggingOnly_fetchUnsmoothedRoutesFromDatabase__block_invoke_372(uint64_t a1, void *a2)
{
  id v3;
  HKLocationReadings *v4;
  id WeakRetained;
  HKLocationReadings *v6;
  _QWORD v7[4];
  HKLocationReadings *v8;
  id v9;

  v3 = a2;
  v4 = -[HKLocationReadings initWithLocations:workout:isSmoothed:]([HKLocationReadings alloc], "initWithLocations:workout:isSmoothed:", v3, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 976), 0);

  a1 += 40;
  WeakRetained = objc_loadWeakRetained((id *)a1);
  objc_msgSend(WeakRetained, "setUnsmoothedLocationReadings:", v4);

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __88__HKWorkoutRouteViewController__internalDebuggingOnly_fetchUnsmoothedRoutesFromDatabase__block_invoke_2;
  v7[3] = &unk_1E9C412F0;
  objc_copyWeak(&v9, (id *)a1);
  v8 = v4;
  v6 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

  objc_destroyWeak(&v9);
}

void __88__HKWorkoutRouteViewController__internalDebuggingOnly_fetchUnsmoothedRoutesFromDatabase__block_invoke_2(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "routeView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLocationReadings:", *(_QWORD *)(a1 + 32));

}

- (void)_shareButtonPressed:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  BOOL v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HKRouteView routeImageForSharing](self->_routeView, "routeImageForSharing");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (self->_shareText)
    v7 = v5 == 0;
  else
    v7 = 1;
  if (!v7)
  {
    v8 = objc_alloc(MEMORY[0x1E0D96D28]);
    v12[0] = self;
    v12[1] = v6;
    v12[2] = self->_shareText;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithActivityItems:applicationActivities:", v9, 0);

    objc_msgSend(v10, "popoverPresentationController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setSourceItem:", v4);

    objc_msgSend(v10, "setExcludedActivityTypes:", self->_excludedActivityTypes);
    -[HKWorkoutRouteViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v10, 1, 0);

  }
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  void *v4;
  double MaxY;
  void *v6;
  double v7;
  double v8;
  void *v9;
  objc_super v10;
  CGRect v11;

  v10.receiver = self;
  v10.super_class = (Class)HKWorkoutRouteViewController;
  -[HKWorkoutRouteViewController viewWillLayoutSubviews](&v10, sel_viewWillLayoutSubviews);
  -[HKWorkoutRouteViewController navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "navigationBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  MaxY = CGRectGetMaxY(v11);

  -[HKWorkoutRouteViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v7 + -45.0 + -12.0;

  -[HKRouteView toggleMapTypeButton](self->_routeView, "toggleMapTypeButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFrame:", v8, MaxY + 12.0, 45.0, 45.0);

}

- (void)_toggleRouteViewMapType:(id)a3
{
  -[HKRouteView _toggleMapType](self->_routeView, "_toggleMapType", a3);
}

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  return &stru_1E9C4C428;
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  return 0;
}

- (id)activityViewControllerLinkPresentationMetadata:(id)a3
{
  id v4;
  UIImage *v5;
  id v6;
  void *v7;
  void *v8;

  v4 = objc_alloc_init(MEMORY[0x1E0CC11A8]);
  -[HKRouteView routeImageForSharing](self->_routeView, "routeImageForSharing");
  v5 = (UIImage *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0CC1178]);
    UIImagePNGRepresentation(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithData:MIMEType:", v7, CFSTR("image/png"));
    objc_msgSend(v4, "setImage:", v8);

  }
  return v4;
}

- (HKRouteView)routeView
{
  return self->_routeView;
}

- (void)setRouteView:(id)a3
{
  objc_storeStrong((id *)&self->_routeView, a3);
}

- (HKLocationReadings)unsmoothedLocationReadings
{
  return self->_unsmoothedLocationReadings;
}

- (void)setUnsmoothedLocationReadings:(id)a3
{
  objc_storeStrong((id *)&self->_unsmoothedLocationReadings, a3);
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void)setHealthStore:(id)a3
{
  objc_storeStrong((id *)&self->_healthStore, a3);
}

- (BOOL)sharingEnabled
{
  return self->_sharingEnabled;
}

- (void)setSharingEnabled:(BOOL)a3
{
  self->_sharingEnabled = a3;
}

- (NSString)shareText
{
  return self->_shareText;
}

- (void)setShareText:(id)a3
{
  objc_storeStrong((id *)&self->_shareText, a3);
}

- (NSArray)excludedActivityTypes
{
  return self->_excludedActivityTypes;
}

- (void)setExcludedActivityTypes:(id)a3
{
  objc_storeStrong((id *)&self->_excludedActivityTypes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_excludedActivityTypes, 0);
  objc_storeStrong((id *)&self->_shareText, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_unsmoothedLocationReadings, 0);
  objc_storeStrong((id *)&self->_routeView, 0);
  objc_storeStrong((id *)&self->_workout, 0);
  objc_storeStrong((id *)&self->_locationReadings, 0);
}

@end
