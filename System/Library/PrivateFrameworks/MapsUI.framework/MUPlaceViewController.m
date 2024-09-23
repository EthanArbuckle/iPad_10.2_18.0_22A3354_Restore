@implementation MUPlaceViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)shouldStubPlacecard
{
  void *v2;
  char BOOL;

  objc_msgSend(MEMORY[0x1E0D27368], "sharedPlatform");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isInternalInstall"))
  {
    BOOL = GEOConfigGetBOOL();

    if ((BOOL & 1) != 0)
      return 1;
  }
  else
  {

  }
  return 0;
}

- (MUPlaceViewController)initWithConfiguration:(id)a3
{
  id v4;
  MUPlaceViewController *v5;
  MUPlaceViewController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MUPlaceViewController;
  v5 = -[MUPlaceViewController initWithNibName:bundle:](&v8, sel_initWithNibName_bundle_, 0, 0);
  v6 = v5;
  if (v5)
    -[MUPlaceViewController _commonInitWithConfiguration:](v5, "_commonInitWithConfiguration:", v4);

  return v6;
}

- (MUPlaceViewController)initWithMapItem:(id)a3
{
  id v4;
  MUPlaceViewController *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v17;
  id v18;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)MUPlaceViewController;
  v5 = -[MUPlaceViewController initWithNibName:bundle:](&v19, sel_initWithNibName_bundle_, 0, 0);
  if (v5)
  {
    v6 = (void *)objc_opt_new();
    -[MUPlaceViewController _commonInitWithConfiguration:](v5, "_commonInitWithConfiguration:", v6);

    if (GEOConfigGetBOOL())
    {
      NSTemporaryDirectory();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringByAppendingPathComponent:", CFSTR("SavedMapItem.json"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v9, "fileExistsAtPath:", v8) & 1) != 0)
      {
        v18 = 0;
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:options:error:", v8, 4, &v18);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v18;
        v17 = v11;
        objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v10, 0, &v17);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v17;

        v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D271E8]), "initWithJSON:", v12);
        v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC1828]), "initWithGeoMapItem:isPlaceHolderPlace:", v14, 0);
        -[MUPlaceViewController setMapItem:](v5, "setMapItem:", v15);

      }
      else
      {
        -[MUPlaceViewController setMapItem:](v5, "setMapItem:", v4);
      }

    }
    else
    {
      -[MUPlaceViewController setMapItem:](v5, "setMapItem:", v4);
    }
  }

  return v5;
}

- (NSArray)analyticModules
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSArray count](self->_sectionControllers, "count"));
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_sectionControllers;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "analyticsModule", (_QWORD)v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  v10 = (void *)objc_msgSend(v3, "copy");
  return (NSArray *)v10;
}

- (NSArray)revealedModules
{
  return (NSArray *)MUMap(self->_sectionControllers, &__block_literal_global_7);
}

id __40__MUPlaceViewController_revealedModules__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  if (objc_msgSend(v2, "isImpressionable"))
  {
    objc_msgSend(v2, "revealedAnalyticsModule");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)requestHostToLogFeedbackTypeIfNeeded:(int)a3
{
  uint64_t v3;
  void *v5;
  char v6;
  id v7;

  v3 = *(_QWORD *)&a3;
  -[MUPlaceViewController placeViewFeedbackDelegate](self, "placeViewFeedbackDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[MUPlaceViewController placeViewFeedbackDelegate](self, "placeViewFeedbackDelegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "placeViewController:shouldLogFeedbackOfType:", self, v3);

  }
}

- (void)_commonInitWithConfiguration:(id)a3
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t initialAppearanceSignpostID;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  MUPlaceCardAnalyticsController *v14;
  MUPlaceCardAnalyticsController *analyticsController;
  MUPlaceItemActionDataProvider *v16;
  MUPlaceItemActionDataProvider *actionDataProvider;
  MUPlaceActionManager *v18;
  MUPlaceActionManager *actionManager;
  MUPersonalizedSuggestionSectionArbiter *v20;
  MUPersonalizedSuggestionSectionArbiter *personalizedSuggestionSectionArbiter;
  MULockScreenCoordinator *v22;
  MULockScreenCoordinator *v23;
  MULockScreenCoordinator *lockScreenCoordinator;
  _TtC6MapsUI23MUPlaceActionDispatcher *v25;
  _TtC6MapsUI23MUPlaceActionDispatcher *actionDispatcher;
  _QWORD v27[4];
  id v28;
  id buf[2];

  v5 = a3;
  MUGetPlaceCardLog();
  v6 = objc_claimAutoreleasedReturnValue();
  self->_initialAppearanceSignpostID = os_signpost_id_generate(v6);

  MUGetPlaceCardLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  initialAppearanceSignpostID = self->_initialAppearanceSignpostID;
  if (initialAppearanceSignpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    LOWORD(buf[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_191DB8000, v8, OS_SIGNPOST_INTERVAL_BEGIN, initialAppearanceSignpostID, "PlacecardInitialAppearance", ", (uint8_t *)buf, 2u);
  }

  objc_storeStrong((id *)&self->_configuration, a3);
  self->_options = objc_msgSend(v5, "options");
  -[MUPlaceViewControllerConfiguration effectiveBundleIdentifier](self->_configuration, "effectiveBundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "length");

  if (v11)
  {
    -[MUPlaceViewControllerConfiguration effectiveBundleIdentifier](self->_configuration, "effectiveBundleIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CC1810], "sharedLocationManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setEffectiveBundleIdentifier:", v12);

  }
  self->_myPlacesEnabled = MapsFeature_IsEnabled_MyPlacesFeatures();
  self->_showNewUI = 1;
  v14 = -[MUPlaceCardAnalyticsController initWithAnalyticsProvider:]([MUPlaceCardAnalyticsController alloc], "initWithAnalyticsProvider:", self);
  analyticsController = self->_analyticsController;
  self->_analyticsController = v14;

  v16 = objc_alloc_init(MUPlaceItemActionDataProvider);
  actionDataProvider = self->_actionDataProvider;
  self->_actionDataProvider = v16;

  v18 = (MUPlaceActionManager *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC1A00]), "initWithDataProvider:", self->_actionDataProvider);
  actionManager = self->_actionManager;
  self->_actionManager = v18;

  -[MUPlaceActionManager setPlaceCardDelegate:](self->_actionManager, "setPlaceCardDelegate:", self);
  -[MUPlaceActionManager setAnalyticsDelegate:](self->_actionManager, "setAnalyticsDelegate:", self->_analyticsController);
  if (GEOConfigGetBOOL())
  {
    v20 = objc_alloc_init(MUPersonalizedSuggestionSectionArbiter);
    personalizedSuggestionSectionArbiter = self->_personalizedSuggestionSectionArbiter;
    self->_personalizedSuggestionSectionArbiter = v20;

  }
  objc_initWeak(buf, self);
  v22 = [MULockScreenCoordinator alloc];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __54__MUPlaceViewController__commonInitWithConfiguration___block_invoke;
  v27[3] = &unk_1E2E01920;
  objc_copyWeak(&v28, buf);
  v23 = -[MULockScreenCoordinator initWithPasscodeProvider:](v22, "initWithPasscodeProvider:", v27);
  lockScreenCoordinator = self->_lockScreenCoordinator;
  self->_lockScreenCoordinator = v23;

  v25 = -[MUPlaceActionDispatcher initWithActionManager:]([_TtC6MapsUI23MUPlaceActionDispatcher alloc], "initWithActionManager:", self->_actionManager);
  actionDispatcher = self->_actionDispatcher;
  self->_actionDispatcher = v25;

  -[MUPlaceActionDispatcher setDelegate:](self->_actionDispatcher, "setDelegate:", self);
  if ((GEOConfigGetBOOL() & 1) != 0
    || +[MapsUIUtilities isParsecProcess](MapsUIUtilities, "isParsecProcess"))
  {
    +[MUInfoCardStyle setInfoCardContainerStyle:](MUInfoCardStyle, "setInfoCardContainerStyle:", 1);
  }
  -[MUPlaceViewController _setupViews](self, "_setupViews");
  objc_destroyWeak(&v28);
  objc_destroyWeak(buf);

}

void __54__MUPlaceViewController__commonInitWithConfiguration___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void (**v8)(id, _QWORD);

  v8 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "placeViewControllerDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      objc_msgSend(v4, "placeViewControllerDelegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "placeViewController:requestPasscodeUnlockWithCompletion:", v4, v8);

    }
    else
    {
      v8[2](v8, 0);
    }
  }

}

- (void)_setupViews
{
  _QWORD v3[5];
  _QWORD v4[5];

  v3[4] = self;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __36__MUPlaceViewController__setupViews__block_invoke;
  v4[3] = &unk_1E2E01970;
  v4[4] = self;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __36__MUPlaceViewController__setupViews__block_invoke_3;
  v3[3] = &unk_1E2E01970;
  -[MUPlaceViewController _performWithNewUIBlock:oldUIBlock:](self, "_performWithNewUIBlock:oldUIBlock:", v4, v3);
  -[MUPlaceViewController setScrollEnabled:](self, "setScrollEnabled:", 1);
}

void __36__MUPlaceViewController__setupViews__block_invoke(uint64_t a1)
{
  MUScrollableStackView *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  MUPlaceCardImpressionsLogger *v6;
  MUImpressionsCalculatorConfiguration *v7;
  uint64_t v8;
  MUImpressionsCalculatorConfiguration *v9;
  MUScrollViewImpressionsCalculator *v10;
  uint64_t v11;
  void *v12;
  double v13;
  id *v14;
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
  _QWORD v35[4];
  id v36;
  id location;
  _QWORD v38[6];

  v38[4] = *MEMORY[0x1E0C80C00];
  v2 = [MUScrollableStackView alloc];
  v3 = -[MUScrollableStackView initWithFrame:](v2, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 984);
  *(_QWORD *)(v4 + 984) = v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 984), "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 984), "setAxis:", 1);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 984), "setSpacing:", 16.0);
  if (GEOConfigGetBOOL()
    && (MapKitIdiomIsMacCatalyst() & 1) == 0
    && +[MapsUIUtilities isMapsProcess](MapsUIUtilities, "isMapsProcess"))
  {
    v6 = objc_alloc_init(MUPlaceCardImpressionsLogger);
    objc_initWeak(&location, *(id *)(a1 + 32));
    v7 = [MUImpressionsCalculatorConfiguration alloc];
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 984);
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __36__MUPlaceViewController__setupViews__block_invoke_2;
    v35[3] = &unk_1E2E01948;
    objc_copyWeak(&v36, &location);
    v9 = -[MUImpressionsCalculatorConfiguration initWithLogger:contentScrollView:containerViewProvider:](v7, "initWithLogger:contentScrollView:containerViewProvider:", v6, v8, v35);
    v10 = -[MUScrollViewImpressionsCalculator initWithConfiguration:visibleItemsProvider:]([MUScrollViewImpressionsCalculator alloc], "initWithConfiguration:visibleItemsProvider:", v9, *(_QWORD *)(a1 + 32));
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(void **)(v11 + 1224);
    *(_QWORD *)(v11 + 1224) = v10;

    objc_destroyWeak(&v36);
    objc_destroyWeak(&location);

  }
  if (+[MUInfoCardStyle containerStyle](MUInfoCardStyle, "containerStyle") == 1)
    v13 = 0.0;
  else
    v13 = 16.0;
  v15 = *(_QWORD *)(a1 + 32);
  v14 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(v15 + 984), "setContentEdgeInsets:", 0.0, 0.0, v13, 0.0);
  objc_msgSend(*((id *)*v14 + 123), "setDelegate:");
  objc_msgSend(*((id *)*v14 + 123), "setAlwaysBounceVertical:", 1);
  objc_msgSend(*v14, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addSubview:", *((_QWORD *)*v14 + 123));

  v27 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(*((id *)*v14 + 123), "leadingAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*v14, "view");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "leadingAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "constraintEqualToAnchor:", v32);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v31;
  objc_msgSend(*((id *)*v14 + 123), "trailingAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*v14, "view");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "trailingAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToAnchor:", v28);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v38[1] = v17;
  objc_msgSend(*((id *)*v14 + 123), "topAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*v14, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "topAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v38[2] = v21;
  objc_msgSend(*((id *)*v14 + 123), "bottomAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*v14, "view");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "bottomAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v38[3] = v25;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 4);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "activateConstraints:", v26);

}

id __36__MUPlaceViewController__setupViews__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "superview");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

void __36__MUPlaceViewController__setupViews__block_invoke_3(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
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
  _QWORD v37[5];

  v37[4] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CC1A48]);
  objc_msgSend(*(id *)(a1 + 32), "mapItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "initWithMapItem:options:", v3, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1320));
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 976);
  *(_QWORD *)(v5 + 976) = v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "setPlaceViewFeedbackDelegate:");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_mapsui_setBackgroundColor:", 0);

  objc_msgSend(*(id *)(a1 + 32), "addChildViewController:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 976));
  objc_msgSend(*(id *)(a1 + 32), "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSubview:", v10);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "didMoveToParentViewController:");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1432), "headerViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(void **)(v12 + 976);
    objc_msgSend(*(id *)(v12 + 1432), "headerViewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addAdditionalViewController:atPosition:", v14, 0);

  }
  v28 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "view");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "leadingAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "view");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "leadingAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintEqualToAnchor:", v33);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v32;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "view");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "trailingAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "view");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "trailingAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToAnchor:", v27);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v37[1] = v26;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "view");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "topAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "topAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v37[2] = v18;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "bottomAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "bottomAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v37[3] = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 4);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "activateConstraints:", v24);

}

- (void)updateHeaderTrailingConstant
{
  id v2;

  -[MUPlaceViewController headerSectionController](self, "headerSectionController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadTrailingConstraint");

}

- (void)setScrollEnabled:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;
  _QWORD v5[5];
  BOOL v6;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42__MUPlaceViewController_setScrollEnabled___block_invoke;
  v5[3] = &unk_1E2E01998;
  v5[4] = self;
  v6 = a3;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __42__MUPlaceViewController_setScrollEnabled___block_invoke_2;
  v3[3] = &unk_1E2E01998;
  v3[4] = self;
  v4 = a3;
  -[MUPlaceViewController _performWithNewUIBlock:oldUIBlock:](self, "_performWithNewUIBlock:oldUIBlock:", v5, v3);
}

uint64_t __42__MUPlaceViewController_setScrollEnabled___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 984), "setScrollEnabled:", *(unsigned __int8 *)(a1 + 40));
}

uint64_t __42__MUPlaceViewController_setScrollEnabled___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "setScrollEnabled:", *(unsigned __int8 *)(a1 + 40));
}

- (BOOL)scrollEnabled
{
  char v2;
  _QWORD v4[6];
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v4[5] = &v6;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __38__MUPlaceViewController_scrollEnabled__block_invoke;
  v5[3] = &unk_1E2E019C0;
  v5[4] = self;
  v5[5] = &v6;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __38__MUPlaceViewController_scrollEnabled__block_invoke_2;
  v4[3] = &unk_1E2E019C0;
  v4[4] = self;
  -[MUPlaceViewController _performWithNewUIBlock:oldUIBlock:](self, "_performWithNewUIBlock:oldUIBlock:", v5, v4);
  v2 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v2;
}

uint64_t __38__MUPlaceViewController_scrollEnabled__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 984), "isScrollEnabled");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __38__MUPlaceViewController_scrollEnabled__block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "isScrollEnabled");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MUPlaceViewController;
  -[MUPlaceViewController viewWillAppear:](&v6, sel_viewWillAppear_, a3);
  if ((self->_options & 0x10) != 0)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 2, self, sel__showEditSheet_);
    -[MUPlaceViewController navigationItem](self, "navigationItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setRightBarButtonItem:", v4);

  }
  -[MUPlaceViewController _activateSections](self, "_activateSections");
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  os_signpost_id_t initialAppearanceSignpostID;
  void *v9;
  uint8_t v10[16];
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MUPlaceViewController;
  -[MUPlaceViewController viewDidAppear:](&v11, sel_viewDidAppear_, a3);
  if (+[MapsUIUtilities isSiriProcess](MapsUIUtilities, "isSiriProcess"))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CC1810], "sharedLocationManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setEffectiveBundle:", v4);

  }
  -[MUPlaceCardAnalyticsController instrumentDailyUsageCount](self->_analyticsController, "instrumentDailyUsageCount");
  -[MUPlaceViewController becomeActive](self, "becomeActive");
  if (self->_initialAppearanceSignpostID != -1)
  {
    MUGetPlaceCardLog();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v6;
    initialAppearanceSignpostID = self->_initialAppearanceSignpostID;
    if (initialAppearanceSignpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      *(_WORD *)v10 = 0;
      _os_signpost_emit_with_name_impl(&dword_191DB8000, v7, OS_SIGNPOST_INTERVAL_END, initialAppearanceSignpostID, "PlacecardInitialAppearance", ", v10, 2u);
    }

    self->_initialAppearanceSignpostID = -1;
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "postNotificationName:object:", *MEMORY[0x1E0CC16C0], self);

}

- (BOOL)shouldMoveLookAroundStorefrontViewForPlacePhotoSectionController:(id)a3
{
  void *v4;
  char v5;
  void *v6;

  -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "shouldMoveLookAroundStorefrontViewForPlaceViewController:", self);

  }
  return 0;
}

- (void)setContentVisibility:(int64_t)a3
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MUPlaceViewController;
  -[MUPlaceViewController setContentVisibility:](&v6, sel_setContentVisibility_);
  -[MUPlaceViewController photoSectionController](self, "photoSectionController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateWithContentVisibility:", a3);

}

- (void)viewDidLoad
{
  objc_class *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MUPlaceViewController;
  -[MUPlaceViewController viewDidLoad](&v10, sel_viewDidLoad);
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceViewController setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", v4);

  if ((self->_options & 0x8000000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CC1970], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "userInterfaceIdiom");

    if (v7 == 3)
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.168627456, 0.168627456, 0.168627456, 1.0);
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "_mapsui_colorNamed:", CFSTR("DeveloperPlaceCardFullBackgroundColor"));
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGroupedBackgroundColor");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v5;
  -[MUPlaceViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBackgroundColor:", v8);

  self->_contentAlpha = 1.0;
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  int v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MUPlaceViewController;
  -[MUPlaceViewController viewWillDisappear:](&v10, sel_viewWillDisappear_, a3);
  if ((-[MUPlaceViewController isMovingFromParentViewController](self, "isMovingFromParentViewController") & 1) != 0
    || (objc_msgSend(MEMORY[0x1E0CC1970], "sharedInstance"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "userInterfaceIdiom"),
        v4,
        v5))
  {
    -[MUPlaceViewController placeViewControllerDelegate](self, "placeViewControllerDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      -[MUPlaceViewController placeViewControllerDelegate](self, "placeViewControllerDelegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "placeViewControllerDidDismiss:", self);

    }
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeObserver:name:object:", self, *MEMORY[0x1E0DC4860], 0);
  objc_msgSend(v9, "removeObserver:name:object:", self, *MEMORY[0x1E0DC4768], 0);

}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MUPlaceViewController;
  -[MUPlaceViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[MUPlaceViewController resignActive](self, "resignActive");
}

- (void)becomeActive
{
  if (!self->_active)
  {
    self->_active = 1;
    -[MKETAProvider restart](self->_etaProvider, "restart");
    if (-[MUPlaceViewController forceCaptureRevealEventOnNextBecomeActive](self, "forceCaptureRevealEventOnNextBecomeActive")|| !+[MapsUIUtilities isMapsProcess](MapsUIUtilities, "isMapsProcess"))
    {
      -[MUPlaceViewController setForceCaptureRevealEventOnNextBecomeActive:](self, "setForceCaptureRevealEventOnNextBecomeActive:", 0);
      -[MUPlaceViewController _captureRevealEventIfNeeded](self, "_captureRevealEventIfNeeded");
    }
    -[MUImpressionsCalculator setActive:](self->_impressionsCalculator, "setActive:", self->_active);
    if (self->_needsImpressionsLoggedOnAppearance)
    {
      self->_needsImpressionsLoggedOnAppearance = 0;
      -[MUScrollViewImpressionsCalculator logImpressions](self->_impressionsCalculator, "logImpressions");
    }
  }
}

- (void)resignActive
{
  if (self->_active)
  {
    self->_active = 0;
    self->_needsImpressionsLoggedOnAppearance = 1;
    -[MKETAProvider pause](self->_etaProvider, "pause");
    -[MUEVChargerAvailabilityProvider setIsActive:](self->_evChargerAvailabilityProvider, "setIsActive:", 0);
    -[MUImpressionsCalculator setActive:](self->_impressionsCalculator, "setActive:", self->_active);
    -[MUPlaceCardAnalyticsController instrumentConceal](self->_analyticsController, "instrumentConceal");
  }
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)resetAnalyticsState
{
  -[MUPlaceViewController setMapItemIdentifierIntrumentedForReveal:](self, "setMapItemIdentifierIntrumentedForReveal:", 0);
  -[MUPlaceCardAnalyticsController disableDeferLoggingUntilRefinementWithShouldInvokeReveal:](self->_analyticsController, "disableDeferLoggingUntilRefinementWithShouldInvokeReveal:", 0);
}

- (void)viewWillLayoutSubviews
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)MUPlaceViewController;
  -[MUPlaceViewController viewWillLayoutSubviews](&v2, sel_viewWillLayoutSubviews);
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  char v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MUPlaceViewController;
  -[MUPlaceViewController viewDidLayoutSubviews](&v6, sel_viewDidLayoutSubviews);
  -[MULoadingOverlayController updateLayoutForBoundsChange](self->_loadingOverlayController, "updateLayoutForBoundsChange");
  -[MUPlaceViewController placeViewControllerDelegate](self, "placeViewControllerDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[MUPlaceViewController placeViewControllerDelegate](self, "placeViewControllerDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "placeViewControllerDidUpdateHeight:", self);

  }
  -[MUPlaceViewController showContentIfLoaded](self, "showContentIfLoaded");
}

- (id)_firstSectionControllerOfClass:(Class)a3
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = self->_sectionControllers;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v7);
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v9 = v8;
          goto LABEL_11;
        }
        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_11:

  return v9;
}

- (id)_sectionControllersForClass:(Class)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_sectionControllers;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
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
        v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9);
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v4, "addObject:", v10, (_QWORD)v13);
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  v11 = (void *)objc_msgSend(v4, "copy");
  return v11;
}

- (MUPlaceHeaderButtonsSectionController)headerButtonsSectionController
{
  return (MUPlaceHeaderButtonsSectionController *)-[MUPlaceViewController _firstSectionControllerOfClass:](self, "_firstSectionControllerOfClass:", objc_opt_class());
}

- (MUPersonalGuidesSectionController)personalGuidesSectionController
{
  return (MUPersonalGuidesSectionController *)-[MUPlaceViewController _firstSectionControllerOfClass:](self, "_firstSectionControllerOfClass:", objc_opt_class());
}

- (MUCuratedGuidesSectionController)curatedGuidesSectionController
{
  return (MUCuratedGuidesSectionController *)-[MUPlaceViewController _firstSectionControllerOfClass:](self, "_firstSectionControllerOfClass:", objc_opt_class());
}

- (MUPlaceActionRowSectionController)actionRowSectionController
{
  return (MUPlaceActionRowSectionController *)-[MUPlaceViewController _firstSectionControllerOfClass:](self, "_firstSectionControllerOfClass:", objc_opt_class());
}

- (MUPlaceUnifiedActionRowSectionController)unifiedActionRowSectionController
{
  return (MUPlaceUnifiedActionRowSectionController *)-[MUPlaceViewController _firstSectionControllerOfClass:](self, "_firstSectionControllerOfClass:", objc_opt_class());
}

- (MUPlaceHeaderSectionController)headerSectionController
{
  return (MUPlaceHeaderSectionController *)-[MUPlaceViewController _firstSectionControllerOfClass:](self, "_firstSectionControllerOfClass:", objc_opt_class());
}

- (MUPlacePhotoSectionController)photoSectionController
{
  return (MUPlacePhotoSectionController *)-[MUPlaceViewController _firstSectionControllerOfClass:](self, "_firstSectionControllerOfClass:", objc_opt_class());
}

- (MUPlaceInfoSectionController)placeInfoSectionController
{
  return (MUPlaceInfoSectionController *)-[MUPlaceViewController _firstSectionControllerOfClass:](self, "_firstSectionControllerOfClass:", objc_opt_class());
}

- (MUPlaceEnrichmentSectionController)placeEnrichmentSectionController
{
  return (MUPlaceEnrichmentSectionController *)-[MUPlaceViewController _firstSectionControllerOfClass:](self, "_firstSectionControllerOfClass:", objc_opt_class());
}

- (id)ribbonSectionController
{
  return -[MUPlaceViewController _firstSectionControllerOfClass:](self, "_firstSectionControllerOfClass:", objc_opt_class());
}

- (id)notesSectionController
{
  return -[MUPlaceViewController _firstSectionControllerOfClass:](self, "_firstSectionControllerOfClass:", objc_opt_class());
}

- (MUWebBasedPlacecardSectionController)webPlacecardSectionController
{
  return (MUWebBasedPlacecardSectionController *)-[MUPlaceViewController _firstSectionControllerOfClass:](self, "_firstSectionControllerOfClass:", objc_opt_class());
}

- (MUPlaceInlineMapSectionController)inlineMapSectionController
{
  return (MUPlaceInlineMapSectionController *)-[MUPlaceViewController _firstSectionControllerOfClass:](self, "_firstSectionControllerOfClass:", objc_opt_class());
}

- (void)setMapItem:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  _QWORD v9[5];
  id v10;
  _QWORD v11[4];
  id v12;
  MUPlaceViewController *v13;
  uint8_t buf[16];

  v4 = a3;
  MUGetPlaceCardLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_191DB8000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SetMapItem", ", buf, 2u);
  }

  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __36__MUPlaceViewController_setMapItem___block_invoke;
  v11[3] = &unk_1E2E01730;
  v12 = v4;
  v13 = self;
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __36__MUPlaceViewController_setMapItem___block_invoke_2;
  v9[3] = &unk_1E2E01730;
  v9[4] = self;
  v10 = v12;
  v7 = v12;
  -[MUPlaceViewController _performWithNewUIBlock:oldUIBlock:](self, "_performWithNewUIBlock:oldUIBlock:", v11, v9);
  MUGetPlaceCardLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_191DB8000, v8, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SetMapItem", ", buf, 2u);
  }

}

void __36__MUPlaceViewController_setMapItem___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  if (v2)
    objc_msgSend(v2, "_placeCardContact");
  else
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1000), "contact");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_setMapItem:contact:updateOriginalContact:", *(_QWORD *)(a1 + 32), v3, 0);

}

uint64_t __36__MUPlaceViewController_setMapItem___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "setMapItem:", *(_QWORD *)(a1 + 40));
}

- (MKMapItem)mapItem
{
  return (MKMapItem *)-[_MKPlaceItem mapItem](self->_placeItem, "mapItem");
}

- (id)contact
{
  CNContact *contact;
  void *v4;
  void *v5;
  CNContact *v6;
  void *v7;
  CNContact *v8;
  CNContact *v9;

  contact = self->_contact;
  if (!contact)
  {
    -[_MKPlaceItem contact](self->_placeItem, "contact");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      v6 = v4;
      v7 = self->_contact;
      self->_contact = v6;
    }
    else
    {
      -[_MKPlaceItem mapItem](self->_placeItem, "mapItem");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_placeCardContact");
      v8 = (CNContact *)objc_claimAutoreleasedReturnValue();
      v9 = self->_contact;
      self->_contact = v8;

    }
    contact = self->_contact;
  }
  return contact;
}

- (_MKPlaceItem)placeItem
{
  return self->_placeItem;
}

- (BOOL)_hasSerializedMapItemFile
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  NSTemporaryDirectory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("SavedMapItem.json"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "fileExistsAtPath:", v3);

  return v5;
}

- (id)mapItemFromSerialized
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v11;
  id v12;

  NSTemporaryDirectory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("SavedMapItem.json"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = 0;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:options:error:", v3, 4, &v12);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v12;
  v11 = v5;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v4, 0, &v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v11;

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D271E8]), "initWithJSON:", v6);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC1828]), "initWithGeoMapItem:isPlaceHolderPlace:", v8, 0);

  return v9;
}

- (void)_setMapItem:(id)a3 contact:(id)a4 updateOriginalContact:(BOOL)a5
{
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  _QWORD v13[5];
  id v14;
  BOOL v15;
  _QWORD v16[5];
  id v17;
  BOOL v18;

  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CC1A18], "placeItemWithMapItem:contact:options:", a3, a4, 16 * (a3 == 0));
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0CC1A38];
    v9 = a3;
    objc_msgSend(v8, "placeItemWithMapItem:options:", v9, objc_msgSend(v9, "isCurrentLocation"));
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __67__MUPlaceViewController__setMapItem_contact_updateOriginalContact___block_invoke;
  v16[3] = &unk_1E2E019E8;
  v16[4] = self;
  v17 = v10;
  v18 = a5;
  v13[0] = v11;
  v13[1] = 3221225472;
  v13[2] = __67__MUPlaceViewController__setMapItem_contact_updateOriginalContact___block_invoke_2;
  v13[3] = &unk_1E2E019E8;
  v13[4] = self;
  v14 = v17;
  v15 = a5;
  v12 = v17;
  -[MUPlaceViewController _performWithNewUIBlock:oldUIBlock:](self, "_performWithNewUIBlock:oldUIBlock:", v16, v13);

}

uint64_t __67__MUPlaceViewController__setMapItem_contact_updateOriginalContact___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setPlaceItem:updateOriginalContact:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

uint64_t __67__MUPlaceViewController__setMapItem_contact_updateOriginalContact___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "setPlaceItem:updateOriginalContact:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

- (void)_setPlaceItem:(id)a3 updateOriginalContact:(BOOL)a4
{
  void *v4;
  _BOOL4 v5;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _BOOL8 v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  BOOL v25;
  void *v26;
  void *v27;
  _MKPlaceItem *v28;
  _MKPlaceActionButtonController *headerSecondaryButtonController;
  _MKPlaceActionButtonController *headerAlternatePrimaryButtonController;
  CNContact *contact;
  MUFeatureDiscoveryAnnotationView *offlineFeatureDiscoveryView;
  void *v33;
  _MKPlaceItem *v34;
  _MKPlaceItem *placeItem;
  _MKPlaceItem *v36;
  MKETAProvider *v37;
  MKETAProvider *etaProvider;
  CLLocation *v39;
  CLLocation *location;
  void *v41;
  BOOL v42;
  void *v43;
  void *v44;
  void *v45;
  char v46;
  void *v47;
  _MKPlaceActionButtonController *v48;
  _MKPlaceActionButtonController *v49;
  void *v50;
  char v51;
  void *v52;
  _MKPlaceActionButtonController *v53;
  _MKPlaceActionButtonController *v54;
  void *v55;
  MUPlaceActionManager **p_actionManager;
  uint64_t v57;
  void *v58;
  char v59;
  char v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  _TtC6MapsUI31MUEVChargerAvailabilityProvider *v65;
  _TtC6MapsUI31MUEVChargerAvailabilityProvider *evChargerAvailabilityProvider;
  int v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  BOOL v72;
  void *v73;
  _QWORD v74[4];
  id v75;
  uint8_t buf[4];
  void *v77;
  __int16 v78;
  void *v79;
  __int16 v80;
  int v81;
  uint64_t v82;

  v5 = a4;
  v82 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  objc_msgSend(v7, "mapItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKPlaceItem mapItem](self->_placeItem, "mapItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 != v9)
    goto LABEL_2;
  objc_msgSend(v7, "mapItem");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v58)
  {
    objc_msgSend(v7, "contact");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKPlaceItem contact](self->_placeItem, "contact");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4 != v73)
    {

      v9 = v8;
LABEL_2:

      goto LABEL_3;
    }
  }
  v59 = objc_msgSend(v7, "isIntermediateMapItem");
  v60 = v59 ^ -[_MKPlaceItem isIntermediateMapItem](self->_placeItem, "isIntermediateMapItem");
  if (v58)
  {

  }
  else
  {

  }
  if ((v60 & 1) == 0)
  {
    v67 = 0;
    goto LABEL_40;
  }
LABEL_3:
  MUGetPlaceCardLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v7, "mapItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "contact");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v77 = v11;
    v78 = 2112;
    v79 = v12;
    v80 = 1024;
    v81 = objc_msgSend(v7, "isIntermediateMapItem");
    _os_log_impl(&dword_191DB8000, v10, OS_LOG_TYPE_DEBUG, "Setting placeItem with mapItem %@, contact %@, isIntermediateMapItem %d", buf, 0x1Cu);

  }
  if (v5)
  {
    MUGetPlaceCardLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v7, "contact");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v77 = v14;
      _os_log_impl(&dword_191DB8000, v13, OS_LOG_TYPE_DEBUG, "Updating original contact with contact %@", buf, 0xCu);

    }
    objc_msgSend(v7, "contact");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUPlaceViewController setOriginalContact:](self, "setOriginalContact:", v15);

  }
  objc_msgSend(v7, "mapItem");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
    goto LABEL_12;
  objc_msgSend(v7, "contact");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17 == 0;

  if (!v18)
  {
    v19 = objc_alloc(MEMORY[0x1E0CC1828]);
    objc_msgSend(v7, "contact");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v19, "initWithContact:", v20);

    v21 = (void *)MEMORY[0x1E0CC1A18];
    objc_msgSend(v7, "contact");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "placeItemWithMapItem:contact:options:", v16, v22, 16);
    v23 = objc_claimAutoreleasedReturnValue();

    v7 = (id)v23;
LABEL_12:

  }
  -[_MKPlaceItem mapItem](self->_placeItem, "mapItem");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v24 == 0;

  if (!v25)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKPlaceItem mapItem](self->_placeItem, "mapItem");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "removeObserver:name:object:", self, *MEMORY[0x1E0CC1A88], v27);

  }
  v28 = self->_placeItem;
  if (v28 && !v5 && self->_active)
    -[MUPlaceCardAnalyticsController instrumentConceal](self->_analyticsController, "instrumentConceal");
  headerSecondaryButtonController = self->_headerSecondaryButtonController;
  self->_headerSecondaryButtonController = 0;

  headerAlternatePrimaryButtonController = self->_headerAlternatePrimaryButtonController;
  self->_headerAlternatePrimaryButtonController = 0;

  contact = self->_contact;
  self->_contact = 0;

  offlineFeatureDiscoveryView = self->_offlineFeatureDiscoveryView;
  self->_offlineFeatureDiscoveryView = 0;

  if (GEOConfigGetBOOL()
    && -[MUPlaceViewController _hasSerializedMapItemFile](self, "_hasSerializedMapItemFile"))
  {
    -[MUPlaceViewController mapItemFromSerialized](self, "mapItemFromSerialized");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CC1A38], "placeItemWithMapItem:options:", v33, 0);
    v34 = (_MKPlaceItem *)objc_claimAutoreleasedReturnValue();
    placeItem = self->_placeItem;
    self->_placeItem = v34;

  }
  else
  {
    v36 = (_MKPlaceItem *)v7;
    v33 = self->_placeItem;
    self->_placeItem = v36;
  }

  -[MUPlaceViewController setPlaceInCollections:](self, "setPlaceInCollections:", 0);
  -[MUPlaceViewController setPlaceInShortcuts:](self, "setPlaceInShortcuts:", 0);
  -[MUPlaceViewController updateAddToLibraryActionState](self, "updateAddToLibraryActionState");
  -[MUPlaceViewController updateAddNoteActionState](self, "updateAddNoteActionState");
  -[MUPlaceViewController setOfflineMapProvider:](self, "setOfflineMapProvider:", 0);
  objc_initWeak((id *)buf, self);
  v74[0] = MEMORY[0x1E0C809B0];
  v74[1] = 3221225472;
  v74[2] = __61__MUPlaceViewController__setPlaceItem_updateOriginalContact___block_invoke;
  v74[3] = &unk_1E2E01A10;
  objc_copyWeak(&v75, (id *)buf);
  -[MUPlaceViewController _calculateShowingContactActionsWithCompletion:](self, "_calculateShowingContactActionsWithCompletion:", v74);
  -[MKPlaceItemActionDataProvider updateWithPlaceItem:options:](self->_actionDataProvider, "updateWithPlaceItem:options:", self->_placeItem, self->_options);
  -[MKETAProvider cancel](self->_etaProvider, "cancel");
  v37 = (MKETAProvider *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC17A8]), "initWithPlaceItem:", self->_placeItem);
  etaProvider = self->_etaProvider;
  self->_etaProvider = v37;

  -[MKETAProvider setDelegate:](self->_etaProvider, "setDelegate:", self);
  -[MKETAProvider addObserver:](self->_etaProvider, "addObserver:", self);
  -[MKETAProvider currentLocation](self->_etaProvider, "currentLocation");
  v39 = (CLLocation *)objc_claimAutoreleasedReturnValue();
  location = self->_location;
  self->_location = v39;

  -[_MKPlaceItem mapItem](self->_placeItem, "mapItem");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v41 == 0;

  if (!v42)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKPlaceItem mapItem](self->_placeItem, "mapItem");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "addObserver:selector:name:object:", self, sel__didResolveAttribution_, *MEMORY[0x1E0CC1A88], v44);

  }
  -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = objc_opt_respondsToSelector();

  if ((v46 & 1) != 0)
  {
    -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "secondaryButtonControllerForPlaceViewController:", self);
    v48 = (_MKPlaceActionButtonController *)objc_claimAutoreleasedReturnValue();
    v49 = self->_headerSecondaryButtonController;
    self->_headerSecondaryButtonController = v48;

  }
  -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = objc_opt_respondsToSelector();

  if ((v51 & 1) != 0)
  {
    -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "alternatePrimaryButtonControllerForPlaceViewController:", self);
    v53 = (_MKPlaceActionButtonController *)objc_claimAutoreleasedReturnValue();
    v54 = self->_headerAlternatePrimaryButtonController;
    self->_headerAlternatePrimaryButtonController = v53;

  }
  -[MUPlaceViewController mapItem](self, "mapItem");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  if (v55
    && (p_actionManager = &self->_actionManager,
        -[MUPlaceActionManager setIsCurrentLocation:](self->_actionManager, "setIsCurrentLocation:", 0),
        (-[_MKPlaceItem options](self->_placeItem, "options") & 1) != 0))
  {
    v57 = 1;
  }
  else
  {
    v57 = 0;
    p_actionManager = &self->_actionManager;
  }
  -[MUPlaceActionManager setIsCurrentLocation:](*p_actionManager, "setIsCurrentLocation:", v57);
  -[MUPlaceViewController mapItem](self, "mapItem");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "_enrichmentInfo");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "showcaseId");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D263F0], "sharedData");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "setPlaceCardPlaceActionDetailsShowcaseId:", v63);

  -[MUEVChargerAvailabilityProvider setIsActive:](self->_evChargerAvailabilityProvider, "setIsActive:", 0);
  v65 = -[MUEVChargerAvailabilityProvider initWithPlaceItem:canAccessVirtualGarage:]([_TtC6MapsUI31MUEVChargerAvailabilityProvider alloc], "initWithPlaceItem:canAccessVirtualGarage:", self->_placeItem, +[MapsUIUtilities isMapsProcess](MapsUIUtilities, "isMapsProcess"));
  evChargerAvailabilityProvider = self->_evChargerAvailabilityProvider;
  self->_evChargerAvailabilityProvider = v65;

  -[MUPlaceViewController scrollToTopAnimated:](self, "scrollToTopAnimated:", 0);
  -[MUPlaceViewController _updateSections](self, "_updateSections");
  if (-[_MKPlaceItem isIntermediateMapItem](v28, "isIntermediateMapItem"))
    v67 = -[_MKPlaceItem isIntermediateMapItem](self->_placeItem, "isIntermediateMapItem") ^ 1;
  else
    v67 = 0;

  objc_destroyWeak(&v75);
  objc_destroyWeak((id *)buf);

LABEL_40:
  -[MUPlaceViewController mapItemIdentifierIntrumentedForReveal](self, "mapItemIdentifierIntrumentedForReveal");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  if (v68)
  {
    -[MUPlaceViewController mapItemIdentifierIntrumentedForReveal](self, "mapItemIdentifierIntrumentedForReveal");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKPlaceItem mapItem](self->_placeItem, "mapItem");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "_identifier");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v69, "isEqual:", v71) ^ 1 | v67) != 1)
    {

      goto LABEL_47;
    }
    v72 = +[MapsUIUtilities isMapsProcess](MapsUIUtilities, "isMapsProcess");

    if (!v72)
      goto LABEL_47;
    goto LABEL_45;
  }
  if (+[MapsUIUtilities isMapsProcess](MapsUIUtilities, "isMapsProcess"))
  {
LABEL_45:
    -[MUImpressionsCalculator setActive:](self->_impressionsCalculator, "setActive:", 0);
    -[MUPlaceViewController _captureRevealEventIfNeeded](self, "_captureRevealEventIfNeeded");
    -[MUImpressionsCalculator setActive:](self->_impressionsCalculator, "setActive:", self->_active);
  }
LABEL_47:

}

void __61__MUPlaceViewController__setPlaceItem_updateOriginalContact___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "setShowContactActions:", a2);
    WeakRetained = v4;
  }

}

- (void)_captureRevealEventIfNeeded
{
  NSUUID *v3;
  NSUUID *impressionsSessionIdentifier;
  void *v5;
  id v6;

  if (self->_impressionsCalculator)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v3 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    impressionsSessionIdentifier = self->_impressionsSessionIdentifier;
    self->_impressionsSessionIdentifier = v3;

    -[MUImpressionsCalculator setSessionIdentifier:](self->_impressionsCalculator, "setSessionIdentifier:", self->_impressionsSessionIdentifier);
  }
  if (-[MUPlaceCardAnalyticsController instrumentRevealIfNeededWithImpressionsSessionId:](self->_analyticsController, "instrumentRevealIfNeededWithImpressionsSessionId:", self->_impressionsSessionIdentifier))
  {
    -[_MKPlaceItem mapItem](self->_placeItem, "mapItem");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUPlaceViewController setMapItemIdentifierIntrumentedForReveal:](self, "setMapItemIdentifierIntrumentedForReveal:", v5);

  }
}

- (int)mapTypeForETAProvider:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  int v7;

  -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) == 0)
    return 0;
  -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "mapTypeForPlaceViewController:", self);

  return v7;
}

- (void)ETAProviderLocationUpdated:(id)a3
{
  id v4;

  objc_msgSend(a3, "currentLocation");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[MUPlaceViewController setLocation:](self, "setLocation:", v4);

}

- (void)_didResolveAttribution:(id)a3
{
  NSObject *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  MUGetPlaceCardLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v4))
  {
    LOWORD(v7) = 0;
    _os_signpost_emit_with_name_impl(&dword_191DB8000, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "MUPlaceAttributionFinishedResolving", ", (uint8_t *)&v7, 2u);
  }

  MUGetPlaceCardLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    -[MUPlaceViewController mapItem](self, "mapItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_191DB8000, v5, OS_LOG_TYPE_DEBUG, "Attribution for mapItem %@ finished resolving", (uint8_t *)&v7, 0xCu);

  }
  -[MUPlaceViewController _updateSections](self, "_updateSections");
}

- (id)contactStore
{
  MUContactStore *contactStore;
  MUContactStore *v4;
  MUContactStore *v5;
  MUContactStore *v6;

  if ((self->_options & 0x8000000000) != 0)
  {
    v6 = 0;
  }
  else
  {
    contactStore = self->_contactStore;
    if (!contactStore)
    {
      v4 = objc_alloc_init(MUContactStore);
      v5 = self->_contactStore;
      self->_contactStore = v4;

      -[MUContactStore registerObserver:queue:](self->_contactStore, "registerObserver:queue:", self, MEMORY[0x1E0C80D38]);
      contactStore = self->_contactStore;
    }
    v6 = contactStore;
  }
  return v6;
}

- (id)_contactForEditOperations
{
  void *v3;
  void *v4;

  -[MUPlaceViewController originalContact](self, "originalContact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    -[MUPlaceViewController originalContact](self, "originalContact");
  else
    -[MUPlaceViewController contact](self, "contact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_calculateShowingContactActionsWithCompletion:(id)a3
{
  void *v3;
  id v5;
  _MKPlaceItem *placeItem;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;

  v5 = a3;
  if ((self->_options & 0x8000000000) != 0)
    goto LABEL_11;
  placeItem = self->_placeItem;
  if (!placeItem)
    goto LABEL_11;
  -[_MKPlaceItem contact](placeItem, "contact");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[_MKPlaceItem contact](self->_placeItem, "contact");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v3, "hasBeenPersisted") & 1) != 0)
      goto LABEL_10;
  }
  if ((-[_MKPlaceItem options](self->_placeItem, "options") & 8) != 0)
  {
    if (!v7)
      goto LABEL_11;
LABEL_10:

    goto LABEL_11;
  }
  -[MUPlaceViewController contactStore](self, "contactStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isGuardianRestrictedCNContainer");

  if (v7)
  {

    if ((v9 & 1) != 0)
      goto LABEL_11;
  }
  else if (v9)
  {
    goto LABEL_11;
  }
  if ((-[_MKPlaceItem options](self->_placeItem, "options") & 2) != 0)
    goto LABEL_18;
  -[_MKPlaceItem mapItem](self->_placeItem, "mapItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_geoMapItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "_placeType") == 10)
  {

    goto LABEL_18;
  }
  -[_MKPlaceItem mapItem](self->_placeItem, "mapItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_geoMapItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "_placeType");

  if (v14 == 17)
  {
LABEL_18:
    -[_MKPlaceItem mapItem](self->_placeItem, "mapItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v15, "_hasMUID") & 1) != 0)
    {
      -[MUPlaceViewController contactStore](self, "contactStore");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "hasContactAccess");

      if (v17)
      {
        -[MUPlaceViewController contactStore](self, "contactStore");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[_MKPlaceItem mapItem](self->_placeItem, "mapItem");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20[0] = MEMORY[0x1E0C809B0];
        v20[1] = 3221225472;
        v20[2] = __71__MUPlaceViewController__calculateShowingContactActionsWithCompletion___block_invoke;
        v20[3] = &unk_1E2E01A38;
        v21 = v5;
        objc_msgSend(v18, "fetchStoredContactForMatchingMapItem:callbackQueue:completion:", v19, MEMORY[0x1E0C80D38], v20);

        goto LABEL_12;
      }
    }
    else
    {

    }
    (*((void (**)(id, uint64_t))v5 + 2))(v5, 1);
    goto LABEL_12;
  }
LABEL_11:
  (*((void (**)(id, _QWORD))v5 + 2))(v5, 0);
LABEL_12:

}

uint64_t __71__MUPlaceViewController__calculateShowingContactActionsWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2 == 0);
}

- (void)setShowContactActions:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL4 v5;
  void *v6;
  char v7;
  id v8;

  v3 = a3;
  v5 = -[MUPlaceViewController showContactActions](self, "showContactActions");
  if (self->_showContactActions != v3)
  {
    self->_showContactActions = v3;
    if (v5 != -[MUPlaceViewController showContactActions](self, "showContactActions"))
    {
      if (self->_placeItem)
      {
        -[MUPlaceActionManager setShowContactActions:](self->_actionManager, "setShowContactActions:", self->_showContactActions);
        -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_opt_respondsToSelector();

        if ((v7 & 1) != 0)
        {
          -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate");
          v8 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "placeViewControllerDidUpdateContactActionsAvailability:", self);

        }
      }
    }
  }
}

- (void)setMapItem:(id)a3 contact:(id)a4
{
  -[MUPlaceViewController _setMapItem:contact:updateOriginalContact:](self, "_setMapItem:contact:updateOriginalContact:", a3, a4, 0);
}

- (void)setOptions:(unint64_t)a3
{
  _QWORD v3[6];
  _QWORD v4[6];

  v3[5] = a3;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __36__MUPlaceViewController_setOptions___block_invoke;
  v4[3] = &unk_1E2E01A60;
  v4[4] = self;
  v4[5] = a3;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __36__MUPlaceViewController_setOptions___block_invoke_2;
  v3[3] = &unk_1E2E01A60;
  v3[4] = self;
  -[MUPlaceViewController _performWithNewUIBlock:oldUIBlock:](self, "_performWithNewUIBlock:oldUIBlock:", v4, v3);
}

_QWORD *__36__MUPlaceViewController_setOptions___block_invoke(_QWORD *result)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = result[4];
  v2 = result[5];
  if (*(_QWORD *)(v1 + 1320) != v2)
  {
    v3 = result;
    *(_QWORD *)(v1 + 1320) = v2;
    objc_msgSend(*(id *)(result[4] + 1032), "updateWithPlaceItem:options:", *(_QWORD *)(result[4] + 1000), *(_QWORD *)(result[4] + 1320));
    result = (_QWORD *)v3[4];
    if (result[125])
      return (_QWORD *)objc_msgSend(result, "_updateSections");
  }
  return result;
}

uint64_t __36__MUPlaceViewController_setOptions___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "setOptions:", *(_QWORD *)(a1 + 40));
}

- (unint64_t)options
{
  unint64_t options;
  _QWORD v5[6];
  _QWORD v6[6];
  _QWORD v7[4];

  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x2020000000;
  v7[3] = 0;
  v5[5] = v7;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __32__MUPlaceViewController_options__block_invoke;
  v6[3] = &unk_1E2E019C0;
  v6[4] = self;
  v6[5] = v7;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __32__MUPlaceViewController_options__block_invoke_2;
  v5[3] = &unk_1E2E019C0;
  v5[4] = self;
  -[MUPlaceViewController _performWithNewUIBlock:oldUIBlock:](self, "_performWithNewUIBlock:oldUIBlock:", v6, v5);
  options = self->_options;
  _Block_object_dispose(v7, 8);
  return options;
}

uint64_t __32__MUPlaceViewController_options__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 1320);
  return result;
}

uint64_t __32__MUPlaceViewController_options__block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "options");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (id)_buildStaticSectionsWithAvailability:(id)a3
{
  id v4;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int IsMacCatalyst;
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
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint8_t buf[8];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (MapsFeature_IsEnabled_Maps102())
  {
    -[MUPlaceViewController _webBasedPlacecardViewController](self, "_webBasedPlacecardViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      objc_msgSend(v5, "addObject:", v6);
    MUGetPlaceCardLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_191DB8000, v7, OS_LOG_TYPE_INFO, "End building web-based placecard", buf, 2u);
    }

    v8 = (void *)objc_msgSend(v5, "copy");
  }
  else
  {
    IsMacCatalyst = MapKitIdiomIsMacCatalyst();
    if (IsMacCatalyst)
      -[MUPlaceViewController _headerButtonsSectionControllerForModuleConfiguration:](self, "_headerButtonsSectionControllerForModuleConfiguration:", 0);
    else
      -[MUPlaceViewController _unifiedActionRowSectionControllerWithButtonModuleConfiguration:](self, "_unifiedActionRowSectionControllerWithButtonModuleConfiguration:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      objc_msgSend(v5, "addObject:", v10);

    -[MUPlaceViewController _placeRibbonSectionControllerForAvailability:placeRibbonConfiguration:](self, "_placeRibbonSectionControllerForAvailability:placeRibbonConfiguration:", v4, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
      objc_msgSend(v5, "addObject:", v11);

    -[MUPlaceViewController _callToActionSuggestionSectionControllerForAvailability:](self, "_callToActionSuggestionSectionControllerForAvailability:", v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      objc_msgSend(v5, "addObject:", v12);

    if (self->_myPlacesEnabled)
    {
      -[MUPlaceViewController _notesSectionControllerForAvailability:](self, "_notesSectionControllerForAvailability:", v4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
        objc_msgSend(v5, "addObject:", v13);

    }
    -[MUPlaceViewController _transitDeparturesSectionControllerForAvailability:](self, "_transitDeparturesSectionControllerForAvailability:", v4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
      objc_msgSend(v5, "addObject:", v14);

    -[MUPlaceViewController _browseCategorySectionControllerForAvailability:](self, "_browseCategorySectionControllerForAvailability:", v4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
      objc_msgSend(v5, "addObject:", v15);

    -[MUPlaceViewController _venueInfoSectionControllerForAvailability:](self, "_venueInfoSectionControllerForAvailability:", v4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
      objc_msgSend(v5, "addObject:", v16);

    -[MUPlaceViewController _photoSectionControllerForAvailability:](self, "_photoSectionControllerForAvailability:", v4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
      objc_msgSend(v5, "addObject:", v17);

    -[MUPlaceViewController _placeEnrichmentSectionControllerForAvailability:](self, "_placeEnrichmentSectionControllerForAvailability:", v4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
      objc_msgSend(v5, "addObject:", v18);

    -[MUPlaceViewController _hikingTipSectionControllerForAvailability:](self, "_hikingTipSectionControllerForAvailability:", v4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
      objc_msgSend(v5, "addObject:", v19);

    -[MUPlaceViewController _contactSharedLocationSectionControllerForAvailability:](self, "_contactSharedLocationSectionControllerForAvailability:", v4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
      objc_msgSend(v5, "addObject:", v20);

    if (IsMacCatalyst)
    {
      -[MUPlaceViewController _actionRowSectionControllerClientOverrideWithAvailability:buttonModuleConfiguration:](self, "_actionRowSectionControllerClientOverrideWithAvailability:buttonModuleConfiguration:", v4, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (v21)
        objc_msgSend(v5, "addObject:", v21);

    }
    -[MUPlaceViewController _inlineMapSectionControllerForAvailability:](self, "_inlineMapSectionControllerForAvailability:", v4);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
      objc_msgSend(v5, "addObject:", v22);

    -[MUPlaceViewController _personalGuidesSectionController](self, "_personalGuidesSectionController");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
      objc_msgSend(v5, "addObject:", v23);

    -[MUPlaceViewController _annotatedItemSectionControllerForAvailability:](self, "_annotatedItemSectionControllerForAvailability:", v4);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
      objc_msgSend(v5, "addObject:", v24);

    -[MUPlaceViewController _curatedGuidesSectionControllerForAvailability:](self, "_curatedGuidesSectionControllerForAvailability:", v4);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25)
      objc_msgSend(v5, "addObject:", v25);

    -[MUPlaceViewController _placeDescriptionSectionControllerForAvailability:](self, "_placeDescriptionSectionControllerForAvailability:", v4);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
      objc_msgSend(v5, "addObject:", v26);

    -[MUPlaceViewController _encyclopedicSectionControllerForAvailability:](self, "_encyclopedicSectionControllerForAvailability:", v4);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (v27)
      objc_msgSend(v5, "addObject:", v27);

    -[MUPlaceViewController _amenitiesSectionControllerForAvailability:moduleConfiguration:](self, "_amenitiesSectionControllerForAvailability:moduleConfiguration:", v4, 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v28)
      objc_msgSend(v5, "addObject:", v28);

    -[MUPlaceViewController _ratingsAndReviewsSectionControllerForAvailability:](self, "_ratingsAndReviewsSectionControllerForAvailability:", v4);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
      objc_msgSend(v5, "addObject:", v29);

    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    -[MUPlaceViewController mapItem](self, "mapItem", 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "_relatedPlaceLists");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
    if (v32)
    {
      v33 = v32;
      v34 = *(_QWORD *)v43;
      do
      {
        for (i = 0; i != v33; ++i)
        {
          if (*(_QWORD *)v43 != v34)
            objc_enumerationMutation(v31);
          -[MUPlaceViewController _relatedPlaceSectionControllerForAvailability:relatedPlaceList:](self, "_relatedPlaceSectionControllerForAvailability:relatedPlaceList:", v4, *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * i));
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          if (v36)
            objc_msgSend(v5, "addObject:", v36);

        }
        v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
      }
      while (v33);
    }

    -[MUPlaceViewController _hikingTrailsSectionControllerForAvailability:](self, "_hikingTrailsSectionControllerForAvailability:", v4);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (v37)
      objc_msgSend(v5, "addObject:", v37);

    -[MUPlaceViewController _officialAppSectionControllerForAvailability:](self, "_officialAppSectionControllerForAvailability:", v4);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (v38)
      objc_msgSend(v5, "addObject:", v38);

    -[MUPlaceViewController _placeInfoSectionControllerForAvailability:moduleConfiguration:](self, "_placeInfoSectionControllerForAvailability:moduleConfiguration:", v4, 0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (v39)
      objc_msgSend(v5, "addObject:", v39);

    -[MUPlaceViewController _placeFooterSectionController](self, "_placeFooterSectionController");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (v40)
      objc_msgSend(v5, "addObject:", v40);

    v8 = (void *)objc_msgSend(v5, "copy");
  }

  return v8;
}

- (id)_buildBrandCardSectionsWithAvailability:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[MUPlaceViewController _actionRowSectionControllerWithButtonModuleConfiguration:](self, "_actionRowSectionControllerWithButtonModuleConfiguration:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v5, "addObject:", v6);

  -[MUPlaceViewController _placeInfoSectionControllerForAvailability:moduleConfiguration:](self, "_placeInfoSectionControllerForAvailability:moduleConfiguration:", v4, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(v5, "addObject:", v7);

  -[MUPlaceViewController _inlineMapSectionControllerForAvailability:](self, "_inlineMapSectionControllerForAvailability:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(v5, "addObject:", v8);

  -[MUPlaceViewController _placeFooterSectionController](self, "_placeFooterSectionController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    objc_msgSend(v5, "addObject:", v9);

  v10 = (void *)objc_msgSend(v5, "copy");
  return v10;
}

- (id)_buildShortCardSections
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[MUPlaceViewController _headerButtonsSectionControllerForModuleConfiguration:](self, "_headerButtonsSectionControllerForModuleConfiguration:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v3, "addObject:", v4);

  -[MUPlaceViewController _actionRowSectionControllerWithButtonModuleConfiguration:](self, "_actionRowSectionControllerWithButtonModuleConfiguration:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v3, "addObject:", v5);

  -[MUPlaceViewController _placeFooterSectionController](self, "_placeFooterSectionController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v3, "addObject:", v6);

  v7 = (void *)objc_msgSend(v3, "copy");
  return v7;
}

- (id)_buildDeveloperPlaceCardSectionsWithAvailability:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[MUPlaceViewController _inlineMapSectionControllerForAvailability:](self, "_inlineMapSectionControllerForAvailability:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v5, "addObject:", v6);

  -[MUPlaceViewController _placeInfoSectionControllerForAvailability:moduleConfiguration:](self, "_placeInfoSectionControllerForAvailability:moduleConfiguration:", v4, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(v5, "addObject:", v7);

  -[MUPlaceViewController _placeFooterSectionController](self, "_placeFooterSectionController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(v5, "addObject:", v8);

  v9 = (void *)objc_msgSend(v5, "copy");
  return v9;
}

- (id)_buildForLayoutWithAvailability:(id)a3
{
  id v4;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  NSObject *v17;
  unsigned int v18;
  const __CFString *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  const __CFString *v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (MapsFeature_IsEnabled_Maps102())
  {
    -[MUPlaceViewController _webBasedPlacecardViewController](self, "_webBasedPlacecardViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      objc_msgSend(v5, "addObject:", v6);
    MUGetPlaceCardLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_191DB8000, v7, OS_LOG_TYPE_INFO, "End building web-based placecard", buf, 2u);
    }
  }
  else
  {
    -[MUPlaceViewController mapItem](self, "mapItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_placecardLayout");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    MUGetPlaceCardLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_191DB8000, v10, OS_LOG_TYPE_INFO, "Building placecard from dynamic layout", buf, 2u);
    }

    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v29 = v9;
    objc_msgSend(v9, "modules");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v32;
      v30 = v5;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v32 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
          MUGetPlaceCardLog();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            v18 = objc_msgSend(v16, "type") - 1;
            v19 = CFSTR("MODULE_TYPE_UNKNOWN");
            if (v18 <= 0x2C)
              v19 = off_1E2E01E38[v18];
            *(_DWORD *)buf = 138412290;
            v36 = v19;
            _os_log_impl(&dword_191DB8000, v17, OS_LOG_TYPE_INFO, "Building module %@", buf, 0xCu);
          }

          switch(objc_msgSend(v16, "type"))
          {
            case 2u:
              objc_msgSend(v16, "configuration");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "headerButtonConfig");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              -[MUPlaceViewController _headerButtonsSectionControllerForModuleConfiguration:](self, "_headerButtonsSectionControllerForModuleConfiguration:", v22);
              v23 = objc_claimAutoreleasedReturnValue();
              goto LABEL_40;
            case 3u:
              -[MUPlaceViewController _inlineMapSectionControllerForAvailability:](self, "_inlineMapSectionControllerForAvailability:", v4);
              v20 = objc_claimAutoreleasedReturnValue();
              goto LABEL_49;
            case 4u:
              -[MUPlaceViewController _photoSectionControllerForAvailability:](self, "_photoSectionControllerForAvailability:", v4);
              v20 = objc_claimAutoreleasedReturnValue();
              goto LABEL_49;
            case 5u:
              objc_msgSend(v16, "configuration");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "placeDetailsConfig");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              -[MUPlaceViewController _placeInfoSectionControllerForAvailability:moduleConfiguration:](self, "_placeInfoSectionControllerForAvailability:moduleConfiguration:", v4, v22);
              v23 = objc_claimAutoreleasedReturnValue();
              goto LABEL_40;
            case 6u:
              -[MUPlaceViewController _transitDeparturesSectionControllerForAvailability:](self, "_transitDeparturesSectionControllerForAvailability:", v4);
              v20 = objc_claimAutoreleasedReturnValue();
              goto LABEL_49;
            case 8u:
              -[MUPlaceViewController _encyclopedicSectionControllerForAvailability:](self, "_encyclopedicSectionControllerForAvailability:", v4);
              v20 = objc_claimAutoreleasedReturnValue();
              goto LABEL_49;
            case 0xAu:
              objc_msgSend(v16, "configuration");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "businessInfoConfig");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              -[MUPlaceViewController _amenitiesSectionControllerForAvailability:moduleConfiguration:](self, "_amenitiesSectionControllerForAvailability:moduleConfiguration:", v4, v22);
              v23 = objc_claimAutoreleasedReturnValue();
              goto LABEL_40;
            case 0xBu:
            case 0x21u:
            case 0x24u:
              -[MUPlaceViewController _ratingsAndReviewsSectionControllerForAvailability:](self, "_ratingsAndReviewsSectionControllerForAvailability:", v4);
              v20 = objc_claimAutoreleasedReturnValue();
              goto LABEL_49;
            case 0xCu:
              objc_msgSend(v16, "configuration");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "actionButtonConfig");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              -[MUPlaceViewController _actionRowSectionControllerWithButtonModuleConfiguration:](self, "_actionRowSectionControllerWithButtonModuleConfiguration:", v22);
              v23 = objc_claimAutoreleasedReturnValue();
              goto LABEL_40;
            case 0xFu:
              -[MUPlaceViewController _officialAppSectionControllerForAvailability:](self, "_officialAppSectionControllerForAvailability:", v4);
              v20 = objc_claimAutoreleasedReturnValue();
              goto LABEL_49;
            case 0x10u:
            case 0x1Eu:
              -[MUPlaceViewController _browseCategorySectionControllerForAvailability:](self, "_browseCategorySectionControllerForAvailability:", v4);
              v20 = objc_claimAutoreleasedReturnValue();
              goto LABEL_49;
            case 0x11u:
              -[MUPlaceViewController _venueInfoSectionControllerForAvailability:](self, "_venueInfoSectionControllerForAvailability:", v4);
              v20 = objc_claimAutoreleasedReturnValue();
              goto LABEL_49;
            case 0x13u:
            case 0x14u:
              -[MUPlaceViewController _annotatedItemSectionControllerForAvailability:](self, "_annotatedItemSectionControllerForAvailability:", v4);
              v20 = objc_claimAutoreleasedReturnValue();
              goto LABEL_49;
            case 0x17u:
              -[MUPlaceViewController _placeFooterSectionController](self, "_placeFooterSectionController");
              v20 = objc_claimAutoreleasedReturnValue();
              goto LABEL_49;
            case 0x19u:
              objc_msgSend(v16, "configuration");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "webContentConfig");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              -[MUPlaceViewController _webContentSectionControllerForConfiguration:](self, "_webContentSectionControllerForConfiguration:", v25);
              v26 = (void *)objc_claimAutoreleasedReturnValue();

              v5 = v30;
              if (!v26)
                continue;
              goto LABEL_50;
            case 0x1Au:
            case 0x26u:
              objc_msgSend(v16, "configuration");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "relatedPlaceConfig");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              -[MUPlaceViewController _relatedPlaceSectionControllerForAvailability:config:](self, "_relatedPlaceSectionControllerForAvailability:config:", v4, v22);
              v23 = objc_claimAutoreleasedReturnValue();
              goto LABEL_40;
            case 0x1Du:
              -[MUPlaceViewController _personalGuidesSectionController](self, "_personalGuidesSectionController");
              v20 = objc_claimAutoreleasedReturnValue();
              goto LABEL_49;
            case 0x1Fu:
              -[MUPlaceViewController _curatedGuidesSectionControllerForAvailability:](self, "_curatedGuidesSectionControllerForAvailability:", v4);
              v20 = objc_claimAutoreleasedReturnValue();
              goto LABEL_49;
            case 0x23u:
              objc_msgSend(v16, "configuration");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "placeRibbonConfig");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              -[MUPlaceViewController _placeRibbonSectionControllerForAvailability:placeRibbonConfiguration:](self, "_placeRibbonSectionControllerForAvailability:placeRibbonConfiguration:", v4, v22);
              v23 = objc_claimAutoreleasedReturnValue();
              goto LABEL_40;
            case 0x25u:
              -[MUPlaceViewController _placeDescriptionSectionControllerForAvailability:](self, "_placeDescriptionSectionControllerForAvailability:", v4);
              v20 = objc_claimAutoreleasedReturnValue();
              goto LABEL_49;
            case 0x27u:
              objc_msgSend(v16, "configuration");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "unifiedActionConfig");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              -[MUPlaceViewController _unifiedActionRowSectionControllerWithButtonModuleConfiguration:](self, "_unifiedActionRowSectionControllerWithButtonModuleConfiguration:", v22);
              v23 = objc_claimAutoreleasedReturnValue();
LABEL_40:
              v26 = (void *)v23;

              goto LABEL_41;
            case 0x28u:
              -[MUPlaceViewController _placeEnrichmentSectionControllerForAvailability:](self, "_placeEnrichmentSectionControllerForAvailability:", v4);
              v20 = objc_claimAutoreleasedReturnValue();
              goto LABEL_49;
            case 0x29u:
              -[MUPlaceViewController _callToActionSuggestionSectionControllerForAvailability:](self, "_callToActionSuggestionSectionControllerForAvailability:", v4);
              v20 = objc_claimAutoreleasedReturnValue();
              goto LABEL_49;
            case 0x2Au:
              -[MUPlaceViewController mapItem](self, "mapItem");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              -[MUPlaceViewController _evChargingSectionControllerForForAvailability:mapItem:](self, "_evChargingSectionControllerForForAvailability:mapItem:", v4, v21);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_41:

              v5 = v30;
              if (!v26)
                continue;
              goto LABEL_50;
            case 0x2Bu:
              -[MUPlaceViewController _hikingTrailsSectionControllerForAvailability:](self, "_hikingTrailsSectionControllerForAvailability:", v4);
              v20 = objc_claimAutoreleasedReturnValue();
              goto LABEL_49;
            case 0x2Cu:
              -[MUPlaceViewController _hikingTipSectionControllerForAvailability:](self, "_hikingTipSectionControllerForAvailability:", v4);
              v20 = objc_claimAutoreleasedReturnValue();
              goto LABEL_49;
            case 0x2Du:
              -[MUPlaceViewController _notesSectionControllerForAvailability:](self, "_notesSectionControllerForAvailability:", v4);
              v20 = objc_claimAutoreleasedReturnValue();
LABEL_49:
              v26 = (void *)v20;
              if (v20)
              {
LABEL_50:
                objc_msgSend(v5, "addObject:", v26);

              }
              break;
            default:
              continue;
          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
      }
      while (v13);
    }

    MUGetPlaceCardLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_191DB8000, v7, OS_LOG_TYPE_INFO, "End building placecard from dynamic layout", buf, 2u);
    }
    v6 = v29;
  }

  v27 = (void *)objc_msgSend(v5, "copy");
  return v27;
}

- (void)_buildSections
{
  uint64_t v3;
  uint64_t i;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t j;
  void *v10;
  MUPlaceActionManager **p_actionManager;
  uint64_t v12;
  MUPlaceDataAvailability *v13;
  void *v14;
  MUPlaceViewControllerSectionController *v15;
  void *v16;
  void *v17;
  MUPlaceViewControllerSectionController *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  uint64_t v23;
  void *v24;
  NSArray *v25;
  NSArray *sectionControllers;
  void *v27;
  void *v28;
  int v29;
  unint64_t options;
  uint64_t v31;
  void *v32;
  int v33;
  int v34;
  void *v35;
  _BOOL4 v36;
  void *v37;
  void *v38;
  _MKPlaceActionButtonController *headerSecondaryButtonController;
  void *v40;
  _MKPlaceActionButtonController *headerAlternatePrimaryButtonController;
  void *v42;
  CLLocation *v43;
  void *v44;
  NSArray *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t k;
  void *v49;
  void *v50;
  void *v51;
  int v52;
  void *v53;
  NSArray *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t m;
  void *v58;
  void *v59;
  BOOL v60;
  void *v61;
  MUScrollableStackView *contentStackView;
  void *v63;
  void *v64;
  int v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  id v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  BOOL v79;
  id v80;
  uint64_t v81;
  void *v82;
  void *v83;
  MUPlaceDataAvailability *v84;
  id v85;
  NSArray *obj;
  id obja;
  uint64_t v88;
  id v89;
  _QWORD v90[4];
  id v91;
  _QWORD v92[4];
  id v93;
  id location;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  _BYTE v111[128];
  _BYTE v112[128];
  _BYTE v113[128];
  _BYTE v114[128];
  uint64_t v115;

  v115 = *MEMORY[0x1E0C80C00];
  if (-[MUPlaceViewController shouldStubPlacecard](self, "shouldStubPlacecard"))
    return;
  v109 = 0u;
  v110 = 0u;
  v107 = 0u;
  v108 = 0u;
  obj = self->_sectionControllers;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v107, v114, 16);
  if (v3)
  {
    v88 = *(_QWORD *)v108;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v108 != v88)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v107 + 1) + 8 * i);
        v103 = 0u;
        v104 = 0u;
        v105 = 0u;
        v106 = 0u;
        objc_msgSend(v5, "sectionViews");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v103, v113, 16);
        if (v7)
        {
          v8 = *(_QWORD *)v104;
          do
          {
            for (j = 0; j != v7; ++j)
            {
              if (*(_QWORD *)v104 != v8)
                objc_enumerationMutation(v6);
              -[MUScrollableStackView removeArrangedSubview:](self->_contentStackView, "removeArrangedSubview:", *(_QWORD *)(*((_QWORD *)&v103 + 1) + 8 * j));
            }
            v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v103, v113, 16);
          }
          while (v7);
        }

        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v5, "sectionViewController");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "removeFromParentViewController");

        }
      }
      v3 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v107, v114, 16);
    }
    while (v3);
  }

  -[MUPlaceViewController mapItem](self, "mapItem");
  obja = (id)objc_claimAutoreleasedReturnValue();
  if (obja
    && (p_actionManager = &self->_actionManager,
        -[MUPlaceActionManager setIsCurrentLocation:](self->_actionManager, "setIsCurrentLocation:", 0),
        (-[_MKPlaceItem options](self->_placeItem, "options") & 1) != 0))
  {
    v12 = 1;
  }
  else
  {
    v12 = 0;
    p_actionManager = &self->_actionManager;
  }
  -[MUPlaceActionManager setIsCurrentLocation:](*p_actionManager, "setIsCurrentLocation:", v12);
  v85 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v13 = [MUPlaceDataAvailability alloc];
  -[MUPlaceViewController mapItem](self, "mapItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = -[MUPlaceDataAvailability initWithMapItem:options:](v13, "initWithMapItem:options:", v14, self->_options);

  v15 = [MUPlaceViewControllerSectionController alloc];
  -[MUPlaceViewController mapItem](self, "mapItem");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceViewControllerConfiguration headerViewController](self->_configuration, "headerViewController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[MUPlaceViewControllerSectionController initWithMapItem:viewController:](v15, "initWithMapItem:viewController:", v16, v17);
  if (v18)
    objc_msgSend(v85, "addObject:", v18);

  -[MUPlaceViewController _headerSectionControllerWithAvailability:](self, "_headerSectionControllerWithAvailability:", v84);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
    objc_msgSend(v85, "addObject:", v19);

  -[MUPlaceViewController placeItem](self, "placeItem");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    -[MUPlaceViewController placeItem](self, "placeItem");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "isIntermediateMapItem");

    if ((v22 & 1) == 0)
    {
      if ((self->_options & 0x8000000000) != 0)
      {
        -[MUPlaceViewController _buildDeveloperPlaceCardSectionsWithAvailability:](self, "_buildDeveloperPlaceCardSectionsWithAvailability:", v84);
        v23 = objc_claimAutoreleasedReturnValue();
      }
      else if (-[MUPlaceViewController supportsDynamicLayout](self, "supportsDynamicLayout"))
      {
        -[MUPlaceViewController _buildForLayoutWithAvailability:](self, "_buildForLayoutWithAvailability:", v84);
        v23 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(obja, "_isMapItemTypeBrand"))
      {
        -[MUPlaceViewController _buildBrandCardSectionsWithAvailability:](self, "_buildBrandCardSectionsWithAvailability:", v84);
        v23 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (objc_msgSend(obja, "_placeDisplayStyle") == 2)
          -[MUPlaceViewController _buildShortCardSections](self, "_buildShortCardSections");
        else
          -[MUPlaceViewController _buildStaticSectionsWithAvailability:](self, "_buildStaticSectionsWithAvailability:", v84);
        v23 = objc_claimAutoreleasedReturnValue();
      }
      v24 = (void *)v23;
      objc_msgSend(v85, "addObjectsFromArray:", v23);

    }
  }
  v25 = (NSArray *)objc_msgSend(v85, "copy");
  sectionControllers = self->_sectionControllers;
  self->_sectionControllers = v25;

  -[MUPlaceViewController placeItem](self, "placeItem");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v27, "isIntermediateMapItem") & 1) != 0 || (self->_options & 8) != 0)
  {
    v29 = 0;
  }
  else
  {
    -[MUPlaceViewController mapItem](self, "mapItem");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "_canGetDirections");

  }
  options = self->_options;
  if ((-[_MKPlaceItem options](self->_placeItem, "options") & 1) != 0)
  {
    -[MUPlaceActionManager setIsCurrentLocation:](self->_actionManager, "setIsCurrentLocation:", 1);
    -[MUPlaceViewController headerButtonsSectionController](self, "headerButtonsSectionController");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setPrimaryButtonType:", 3);
    goto LABEL_42;
  }
  v31 = (options >> 20) & 1;
  if ((options & 0x200000000) != 0 && v29 | v31)
  {
    -[MUPlaceViewController headerButtonsSectionController](self, "headerButtonsSectionController");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setPrimaryButtonType:", 4);
LABEL_42:
    v33 = 0;
    goto LABEL_43;
  }
  -[_MKPlaceItem mapItem](self->_placeItem, "mapItem");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "_detourInfo");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v38)
    LODWORD(v31) = 0;

  if ((_DWORD)v31)
  {
    -[MUPlaceViewController headerButtonsSectionController](self, "headerButtonsSectionController");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setPrimaryButtonType:", 2);
    goto LABEL_42;
  }
  if (!v29)
  {
    v33 = 0;
    goto LABEL_44;
  }
  -[MUPlaceViewController headerButtonsSectionController](self, "headerButtonsSectionController");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setPrimaryButtonType:", 1);
  v33 = 1;
LABEL_43:

LABEL_44:
  v34 = objc_msgSend(obja, "_isMapItemTypeBrand");
  if ((options & 0x800000000) != 0)
  {
    objc_msgSend(obja, "_detourInfo");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v35 == 0;

    if (v36)
    {
      -[MKETAProvider setAllowsDistantETA:](self->_etaProvider, "setAllowsDistantETA:", 1);
LABEL_53:
      -[MKETAProvider start](self->_etaProvider, "start");
      goto LABEL_54;
    }
  }
  if (v33 | v34)
    goto LABEL_53;
LABEL_54:
  headerSecondaryButtonController = self->_headerSecondaryButtonController;
  -[MUPlaceViewController headerButtonsSectionController](self, "headerButtonsSectionController");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setSecondaryButtonController:", headerSecondaryButtonController);

  headerAlternatePrimaryButtonController = self->_headerAlternatePrimaryButtonController;
  -[MUPlaceViewController headerButtonsSectionController](self, "headerButtonsSectionController");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setAlternatePrimaryButtonController:", headerAlternatePrimaryButtonController);

  -[MUPlaceViewController _updatePersonalizedSuggestionSectionArbiterWithSections](self, "_updatePersonalizedSuggestionSectionArbiterWithSections");
  v43 = self->_location;
  -[MUPlaceViewController inlineMapSectionController](self, "inlineMapSectionController");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setLocation:", v43);

  v89 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v101 = 0u;
  v102 = 0u;
  v99 = 0u;
  v100 = 0u;
  v45 = self->_sectionControllers;
  v46 = -[NSArray countByEnumeratingWithState:objects:count:](v45, "countByEnumeratingWithState:objects:count:", &v99, v112, 16);
  if (!v46)
    goto LABEL_69;
  v47 = *(_QWORD *)v100;
  do
  {
    for (k = 0; k != v46; ++k)
    {
      if (*(_QWORD *)v100 != v47)
        objc_enumerationMutation(v45);
      v49 = *(void **)(*((_QWORD *)&v99 + 1) + 8 * k);
      objc_msgSend(v49, "setDelegate:", self);
      objc_msgSend(v49, "setAnalyticsDelegate:", self->_analyticsController);
      -[MUPlaceViewController personalizedSuggestionSectionArbiter](self, "personalizedSuggestionSectionArbiter");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "setPersonalizedSuggestionsArbiterDelegate:", v50);

      objc_msgSend(v49, "sectionViews");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v51, "count"))
      {
        v52 = objc_msgSend(v49, "hasContent");

        if (!v52)
          goto LABEL_63;
        objc_msgSend(v49, "sectionViews");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v89, "addObjectsFromArray:", v51);
      }

LABEL_63:
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v49, "sectionViewController");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        if (v53)
        {
          -[MUPlaceViewController addChildViewController:](self, "addChildViewController:", v53);
          objc_msgSend(v53, "didMoveToParentViewController:", self);
        }

      }
    }
    v46 = -[NSArray countByEnumeratingWithState:objects:count:](v45, "countByEnumeratingWithState:objects:count:", &v99, v112, 16);
  }
  while (v46);
LABEL_69:

  if (-[_MKPlaceItem isIntermediateMapItem](self->_placeItem, "isIntermediateMapItem"))
  {
    v98 = 0u;
    v96 = 0u;
    v97 = 0u;
    v95 = 0u;
    v54 = self->_sectionControllers;
    v55 = -[NSArray countByEnumeratingWithState:objects:count:](v54, "countByEnumeratingWithState:objects:count:", &v95, v111, 16);
    if (v55)
    {
      v56 = *(_QWORD *)v96;
      do
      {
        for (m = 0; m != v55; ++m)
        {
          if (*(_QWORD *)v96 != v56)
            objc_enumerationMutation(v54);
          v58 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * m);
          -[MUPlaceViewController headerSectionController](self, "headerSectionController");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          v60 = v58 == v59;

          if (!v60)
          {
            objc_msgSend(v58, "sectionView");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v61, "setAlpha:", 0.0);

          }
        }
        v55 = -[NSArray countByEnumeratingWithState:objects:count:](v54, "countByEnumeratingWithState:objects:count:", &v95, v111, 16);
      }
      while (v55);
    }

  }
  contentStackView = self->_contentStackView;
  v63 = (void *)objc_msgSend(v89, "copy");
  -[MUScrollableStackView setArrangedSubviews:](contentStackView, "setArrangedSubviews:", v63);

  -[MUPlaceViewController _applyCustomSpacings](self, "_applyCustomSpacings");
  -[MUPlaceViewController _updateContentAlpha](self, "_updateContentAlpha");
  -[MUPlaceViewController hideContentIfLoading](self, "hideContentIfLoading");
  -[MUPlaceViewController inlineMapSectionController](self, "inlineMapSectionController");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  if (v64)
  {
    v65 = objc_msgSend(obja, "_hasResolvablePartialInformation");

    if (v65)
    {
      objc_msgSend(MEMORY[0x1E0CC1848], "sharedService");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(obja, "_addressFormattedAsSinglelineAddress");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "ticketForForwardGeocodeString:traits:", v67, 0);
      v68 = (void *)objc_claimAutoreleasedReturnValue();

      objc_initWeak(&location, self);
      v92[0] = MEMORY[0x1E0C809B0];
      v92[1] = 3221225472;
      v92[2] = __39__MUPlaceViewController__buildSections__block_invoke;
      v92[3] = &unk_1E2E01A88;
      objc_copyWeak(&v93, &location);
      objc_msgSend(v68, "submitWithHandler:networkActivity:", v92, 0);
      objc_destroyWeak(&v93);
      objc_destroyWeak(&location);
      goto LABEL_91;
    }
  }
  -[MUPlaceViewController inlineMapSectionController](self, "inlineMapSectionController");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  if (v68)
  {
    -[MUPlaceViewController mapItem](self, "mapItem");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "url");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v70)
    {

      goto LABEL_91;
    }
    v71 = (void *)MEMORY[0x1E0CC1A58];
    -[MUPlaceViewController mapItem](self, "mapItem");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "url");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v71) = objc_msgSend(v71, "isValidMapURL:", v73);

    if ((_DWORD)v71)
    {
      v74 = objc_alloc(MEMORY[0x1E0CC1A58]);
      -[MUPlaceViewController mapItem](self, "mapItem");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "url");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = (void *)objc_msgSend(v74, "initWithURL:", v76);

      objc_msgSend(v68, "parseIncludingCustomParameters:", 1);
      -[MUPlaceViewController mapItem](self, "mapItem");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "_identifier");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      if (v78)
        goto LABEL_89;
      v79 = objc_msgSend(v68, "searchUID") == 0;

      if (!v79)
      {
        v80 = objc_alloc(MEMORY[0x1E0CC1830]);
        v81 = objc_msgSend(v68, "searchUID");
        objc_msgSend(v68, "centerCoordinate");
        v77 = (void *)objc_msgSend(v80, "initWithMUID:resultProviderID:coordinate:", v81, 0);
        objc_msgSend(MEMORY[0x1E0CC1848], "sharedService");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "contentProviderID");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v82, "ticketForNonExpiredIdentifier:resultProviderID:contentProvider:traits:", v77, 0, v83, 0);
        v78 = (void *)objc_claimAutoreleasedReturnValue();

        objc_initWeak(&location, self);
        v90[0] = MEMORY[0x1E0C809B0];
        v90[1] = 3221225472;
        v90[2] = __39__MUPlaceViewController__buildSections__block_invoke_2;
        v90[3] = &unk_1E2E01A88;
        objc_copyWeak(&v91, &location);
        objc_msgSend(v78, "submitWithHandler:networkActivity:", v90, 0);
        objc_destroyWeak(&v91);
        objc_destroyWeak(&location);
LABEL_89:

      }
LABEL_91:

    }
  }

}

void __39__MUPlaceViewController__buildSections__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  _BYTE *WeakRetained;
  _BYTE *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (!a3 && WeakRetained && objc_msgSend(v12, "count"))
  {
    objc_msgSend(v12, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if ((v6[1320] & 1) == 0)
    {
      objc_msgSend(v7, "_displayMapRegion");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        objc_msgSend(v6, "inlineMapSectionController");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "updateWithMapItem:", v8);

      }
    }
    objc_msgSend(v6, "contact");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_setMapItem:contact:updateOriginalContact:", v8, v11, 0);

  }
}

void __39__MUPlaceViewController__buildSections__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  _BYTE *WeakRetained;
  _BYTE *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (!a3 && WeakRetained && objc_msgSend(v12, "count"))
  {
    objc_msgSend(v12, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if ((v6[1320] & 1) == 0)
    {
      objc_msgSend(v7, "_displayMapRegion");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        objc_msgSend(v6, "inlineMapSectionController");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "updateWithMapItem:", v8);

      }
    }
    if (v8)
      objc_msgSend(v8, "_placeCardContact");
    else
      objc_msgSend(v6, "contact");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_setMapItem:contact:updateOriginalContact:", v8, v11, 0);

  }
}

- (void)setLocation:(id)a3
{
  CLLocation *v5;
  CLLocation *location;
  void *v7;
  CLLocation *v8;

  v5 = (CLLocation *)a3;
  if (self->_location != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->_location, a3);
    location = self->_location;
    -[MUPlaceViewController inlineMapSectionController](self, "inlineMapSectionController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setLocation:", location);

    v5 = v8;
  }

}

- (BOOL)supportsDynamicLayout
{
  void *v3;
  void *v4;
  BOOL v5;

  if (!GEOConfigGetBOOL())
    return 0;
  -[MUPlaceViewController mapItem](self, "mapItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_placecardLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

- (id)_headerSectionControllerWithAvailability:(id)a3
{
  id v4;
  MUPlaceHeaderSectionController *v5;
  MUPlaceHeaderSectionControllerConfiguration *v6;
  unint64_t options;
  unsigned int v8;
  uint64_t v9;
  uint64_t BOOL;
  void *v11;
  void *v12;
  unsigned int v13;
  _BOOL8 v14;

  v4 = a3;
  if ((MapsFeature_IsEnabled_Maps102() & 1) == 0)
  {
    v6 = objc_alloc_init(MUPlaceHeaderSectionControllerConfiguration);
    -[MUPlaceHeaderSectionControllerConfiguration setSuppressContainmentPunchout:](v6, "setSuppressContainmentPunchout:", (self->_options & 0x20000000) == 0);
    options = self->_options;
    if ((options & 0x20000000) != 0)
    {
      v9 = 0;
    }
    else
    {
      v8 = objc_msgSend(v4, "supportsSharing");
      if ((options & 0x8000000000) != 0)
        v9 = 0;
      else
        v9 = v8;
    }
    -[MUPlaceHeaderSectionControllerConfiguration setShowShareButton:](v6, "setShowShareButton:", v9);
    if (-[MUPlaceViewController supportsDynamicLayout](self, "supportsDynamicLayout"))
      BOOL = GEOConfigGetBOOL();
    else
      BOOL = 0;
    -[MUPlaceHeaderSectionControllerConfiguration setDrawDynamicPlacecardDebugBackground:](v6, "setDrawDynamicPlacecardDebugBackground:", BOOL);
    -[MUPlaceHeaderSectionControllerConfiguration setIsDeveloperPlaceCard:](v6, "setIsDeveloperPlaceCard:", (options >> 39) & 1);
    -[MUPlaceViewControllerConfiguration developerPlaceCardAuditToken](self->_configuration, "developerPlaceCardAuditToken");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUPlaceHeaderSectionControllerConfiguration setDeveloperPlaceCardAuditToken:](v6, "setDeveloperPlaceCardAuditToken:", v11);

    objc_msgSend(MEMORY[0x1E0CC1970], "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "userInterfaceIdiom");

    if (v13 >= 2)
    {
      if (v13 == 2)
      {
        -[MUPlaceHeaderSectionControllerConfiguration setAlwaysShowExpandedVerifiedBusinessHeader:](v6, "setAlwaysShowExpandedVerifiedBusinessHeader:", 1);
        v14 = 0;
        goto LABEL_16;
      }
      if (v13 != 3)
      {
LABEL_17:
        v5 = -[MUPlaceHeaderSectionController initWithPlaceItem:configuration:]([MUPlaceHeaderSectionController alloc], "initWithPlaceItem:configuration:", self->_placeItem, v6);
        -[MUPlaceHeaderSectionController setHeaderDelegate:](v5, "setHeaderDelegate:", self);
        -[MUPlaceHeaderSectionController setCardExpansionProgress:](v5, "setCardExpansionProgress:", self->_verifiedHeaderExpansionProgress);

        goto LABEL_18;
      }
    }
    v14 = (options & 0x8020000000) == 0;
    -[MUPlaceHeaderSectionControllerConfiguration setAlwaysShowExpandedVerifiedBusinessHeader:](v6, "setAlwaysShowExpandedVerifiedBusinessHeader:", (options & 0x8020000000) != 0x20000000);
LABEL_16:
    -[MUPlaceHeaderSectionControllerConfiguration setShouldInsetRoundCoverPhoto:](v6, "setShouldInsetRoundCoverPhoto:", v14);
    goto LABEL_17;
  }
  v5 = 0;
LABEL_18:

  return v5;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[MKETAProvider cancel](self->_etaProvider, "cancel");
  if ((self->_options & 0x20000000) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CC1750], "sharedImageManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "clearImageCache");

  }
  v5.receiver = self;
  v5.super_class = (Class)MUPlaceViewController;
  -[MUPlaceViewController dealloc](&v5, sel_dealloc);
}

- (id)_headerButtonsSectionControllerForModuleConfiguration:(id)a3
{
  id v4;
  uint64_t v5;
  MUPlaceHeaderButtonsSectionControllerConfiguration *v6;
  MUPlaceHeaderButtonsSectionController *v7;

  v4 = a3;
  if ((MapKitIdiomIsMacCatalyst() & 1) != 0)
    v5 = 1;
  else
    v5 = (BYTE3(self->_options) >> 5) & 1;
  v6 = objc_alloc_init(MUPlaceHeaderButtonsSectionControllerConfiguration);
  -[MUPlaceHeaderButtonsSectionControllerConfiguration setButtonModuleConfiguration:](v6, "setButtonModuleConfiguration:", v4);

  -[MUPlaceHeaderButtonsSectionControllerConfiguration setShowMoreButton:](v6, "setShowMoreButton:", v5);
  -[MUPlaceHeaderButtonsSectionControllerConfiguration setEtaProvider:](v6, "setEtaProvider:", self->_etaProvider);
  -[MUPlaceHeaderButtonsSectionControllerConfiguration setCanShowDetourTime:](v6, "setCanShowDetourTime:", (self->_options >> 20) & 1);
  -[MUPlaceHeaderButtonsSectionControllerConfiguration setMenuProvider:](v6, "setMenuProvider:", self);
  v7 = -[MUPlaceHeaderButtonsSectionController initWithPlaceItem:configuration:]([MUPlaceHeaderButtonsSectionController alloc], "initWithPlaceItem:configuration:", self->_placeItem, v6);
  -[MUPlaceHeaderButtonsSectionController setSecondaryButtonController:](v7, "setSecondaryButtonController:", 0);
  -[MUPlaceHeaderButtonsSectionController setHeaderDelegate:](v7, "setHeaderDelegate:", self);

  return v7;
}

- (id)_actionRowSectionControllerClientOverrideWithAvailability:(id)a3 buttonModuleConfiguration:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  if (objc_msgSend(a3, "supportsPhotoSlider"))
  {
    -[MUPlaceViewController _actionRowSectionControllerWithButtonModuleConfiguration:](self, "_actionRowSectionControllerWithButtonModuleConfiguration:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_actionRowSectionControllerWithButtonModuleConfiguration:(id)a3
{
  MUPlaceActionRowSectionController *v4;
  MUPlaceActionRowSectionController *v5;
  void *v6;

  if (-[_MKPlaceItem options](self->_placeItem, "options", a3))
  {
    v4 = 0;
  }
  else
  {
    v5 = [MUPlaceActionRowSectionController alloc];
    -[MUPlaceViewController mapItem](self, "mapItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[MUPlaceActionRowSectionController initWithMapItem:actionManager:menuProvider:](v5, "initWithMapItem:actionManager:menuProvider:", v6, self->_actionManager, self);

  }
  return v4;
}

- (id)_unifiedActionRowSectionControllerWithButtonModuleConfiguration:(id)a3
{
  id v4;
  MUPlaceUnifiedActionRowSectionControllerConfiguration *v5;
  void *v6;
  void *v7;
  int v8;
  unint64_t options;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int16 v14;
  MUTimeExpirableLRUCache *quickActionTrayArtworkCache;
  MUTimeExpirableLRUCache *v16;
  uint64_t UInteger;
  MUTimeExpirableLRUCache *v18;
  MUTimeExpirableLRUCache *v19;
  void *v20;
  MUPlaceUnifiedActionRowSectionController *v21;
  void *v22;
  MUPlaceUnifiedActionRowSectionController *v23;
  void *v24;

  v4 = a3;
  v5 = objc_alloc_init(MUPlaceUnifiedActionRowSectionControllerConfiguration);
  -[MUPlaceUnifiedActionRowSectionControllerConfiguration setActionManager:](v5, "setActionManager:", self->_actionManager);
  -[MUPlaceUnifiedActionRowSectionControllerConfiguration setMoreActionsProvider:](v5, "setMoreActionsProvider:", self);
  -[MUPlaceUnifiedActionRowSectionControllerConfiguration setEtaProvider:](v5, "setEtaProvider:", self->_etaProvider);
  -[MUPlaceUnifiedActionRowSectionControllerConfiguration setExternalActionHandler:](v5, "setExternalActionHandler:", self);
  -[MUPlaceUnifiedActionRowSectionControllerConfiguration setButtonModuleConfiguration:](v5, "setButtonModuleConfiguration:", v4);

  -[MUPlaceUnifiedActionRowSectionControllerConfiguration setSecondaryActionButtonController:](v5, "setSecondaryActionButtonController:", self->_headerSecondaryButtonController);
  -[MUPlaceUnifiedActionRowSectionControllerConfiguration setIsSearchAlongRoute:](v5, "setIsSearchAlongRoute:", (self->_options >> 35) & 1);
  -[MUPlaceUnifiedActionRowSectionControllerConfiguration setShowMoreButtonIfAvailable:](v5, "setShowMoreButtonIfAvailable:", (self->_options >> 29) & 1);
  -[MUPlaceUnifiedActionRowSectionControllerConfiguration setCanShowDownloadOffline:](v5, "setCanShowDownloadOffline:", (self->_options & 0x1000000000) == 0);
  -[MUPlaceUnifiedActionRowSectionControllerConfiguration setShouldPromoteDownloadOffline:](v5, "setShouldPromoteDownloadOffline:", (-[_MKPlaceItem options](self->_placeItem, "options") & 2 | -[_MKPlaceItem options](self->_placeItem, "options") & 8) != 0);
  -[MUPlaceUnifiedActionRowSectionControllerConfiguration setShouldShowContactsAction:](v5, "setShouldShowContactsAction:", (self->_options & 0x6000000000) != 0);
  if (MapKitIdiomIsMacCatalyst())
    -[MUPlaceUnifiedActionRowSectionControllerConfiguration setActionRowMenuProvider:](v5, "setActionRowMenuProvider:", self);
  -[MUPlaceViewController placeItem](self, "placeItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isIntermediateMapItem") & 1) != 0 || (self->_options & 8) != 0)
  {
    v8 = 0;
  }
  else
  {
    -[MUPlaceViewController mapItem](self, "mapItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "_canGetDirections");

  }
  options = self->_options;
  v10 = (options >> 20) & 1;
  -[MUPlaceUnifiedActionRowSectionControllerConfiguration setCanShowDetourTime:](v5, "setCanShowDetourTime:", v10);
  if ((options & 0x200000000) != 0 && ((v8 | v10) & 1) != 0)
  {
    v11 = 4;
  }
  else
  {
    -[_MKPlaceItem mapItem](self->_placeItem, "mapItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_detourInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13 != 0;

    if ((*(_DWORD *)&v14 & (options >> 20)) != 0)
      v11 = 2;
    else
      v11 = 1;
    if ((*(_DWORD *)&v14 & (options >> 20) | v8) != 1)
      goto LABEL_15;
  }
  -[MUPlaceUnifiedActionRowSectionControllerConfiguration setPrimaryButtonType:](v5, "setPrimaryButtonType:", v11);
LABEL_15:
  quickActionTrayArtworkCache = self->_quickActionTrayArtworkCache;
  if (!quickActionTrayArtworkCache)
  {
    v16 = [MUTimeExpirableLRUCache alloc];
    UInteger = GEOConfigGetUInteger();
    v18 = -[MUTimeExpirableLRUCache initWithMaxSize:timeToLive:](v16, "initWithMaxSize:timeToLive:", UInteger, (double)(unint64_t)GEOConfigGetUInteger());
    v19 = self->_quickActionTrayArtworkCache;
    self->_quickActionTrayArtworkCache = v18;

    quickActionTrayArtworkCache = self->_quickActionTrayArtworkCache;
  }
  -[MUPlaceUnifiedActionRowSectionControllerConfiguration setArtworkCache:](v5, "setArtworkCache:", quickActionTrayArtworkCache);
  -[MUPlaceViewController amsResultProvider](self, "amsResultProvider");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceUnifiedActionRowSectionControllerConfiguration setAmsResultProvider:](v5, "setAmsResultProvider:", v20);

  v21 = [MUPlaceUnifiedActionRowSectionController alloc];
  -[MUPlaceViewController mapItem](self, "mapItem");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[MUPlaceUnifiedActionRowSectionController initWithMapItem:configuration:](v21, "initWithMapItem:configuration:", v22, v5);

  -[MUPlaceUnifiedActionRowSectionController setActionDelegate:](v23, "setActionDelegate:", self);
  -[MUPlaceViewController offlineMapProvider](self, "offlineMapProvider");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceUnifiedActionRowSectionController setOfflineMapProvider:](v23, "setOfflineMapProvider:", v24);

  return v23;
}

- (void)sectionController:(id)a3 didSelectPrimaryButtonType:(unint64_t)a4
{
  id v6;
  MUPresentationOptions *v7;

  v6 = a3;
  v7 = objc_alloc_init(MUPresentationOptions);
  -[MUPlaceViewController _placeSectionController:didSelectPrimaryType:withPresentationOptions:](self, "_placeSectionController:didSelectPrimaryType:withPresentationOptions:", v6, a4, v7);

}

- (void)sectionControllerDidSelectViewContactButton:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "placeViewControllerDidSelectViewContact:", self);

  }
}

- (id)_browseCategorySectionControllerForAvailability:(id)a3
{
  MUBrowseCategorySectionController *v4;
  void *v5;
  MUBrowseCategorySectionController *v6;

  if (objc_msgSend(a3, "supportsBrowseCategory"))
  {
    v4 = [MUBrowseCategorySectionController alloc];
    -[MUPlaceViewController mapItem](self, "mapItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[MUBrowseCategorySectionController initWithMapItem:](v4, "initWithMapItem:", v5);

    -[MUBrowseCategorySectionController setBrowseCategoryDelegate:](v6, "setBrowseCategoryDelegate:", self);
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)_ratingsAndReviewsSectionControllerForAvailability:(id)a3
{
  id v4;
  MUInlineRatingsSectionController *v5;
  void *v6;
  MUInlineRatingsSectionController *v7;
  MURatingsAndReviewsSectionController *v8;
  void *v9;

  v4 = a3;
  if (objc_msgSend(v4, "supportsInlineRatings"))
  {
    v5 = [MUInlineRatingsSectionController alloc];
    -[MUPlaceViewController mapItem](self, "mapItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[MUInlineRatingsSectionController initWithMapItem:inlineRatingsViewProvider:](v5, "initWithMapItem:inlineRatingsViewProvider:", v6, self);

  }
  else if (objc_msgSend(v4, "shouldShowRatingsAndReviewsModule"))
  {
    v8 = [MURatingsAndReviewsSectionController alloc];
    -[MUPlaceViewController mapItem](self, "mapItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[MURatingsAndReviewsSectionController initWithMapItem:](v8, "initWithMapItem:", v9);

    -[MUInlineRatingsSectionController setActionDelegate:](v7, "setActionDelegate:", self);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_venueInfoSectionControllerForAvailability:(id)a3
{
  MUPlaceVenueInfoSectionController *v4;
  void *v5;
  MUPlaceVenueInfoSectionController *v6;

  if (objc_msgSend(a3, "supportsVenueTextInfo"))
  {
    v4 = [MUPlaceVenueInfoSectionController alloc];
    -[MUPlaceViewController mapItem](self, "mapItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[MUPlaceVenueInfoSectionController initWithMapItem:](v4, "initWithMapItem:", v5);

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)_annotatedItemSectionControllerForAvailability:(id)a3
{
  id v4;
  MUPlacePictureItemSectionController *v5;
  void *v6;
  void *v7;
  void *v8;
  MUPlacePictureItemSectionController *v9;
  MUPlaceListItemSectionController *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  if (objc_msgSend(v4, "supportsAnnotatedPhotos"))
  {
    v5 = [MUPlacePictureItemSectionController alloc];
    -[MUPlaceViewController mapItem](self, "mapItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUPlaceViewController mapItem](self, "mapItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_annotatedItemList");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[MUPlacePictureItemSectionController initWithMapItem:annotatedList:presentingViewController:](v5, "initWithMapItem:annotatedList:presentingViewController:", v6, v8, self);

    -[MUPlacePictureItemSectionController setPictureItemDelegate:](v9, "setPictureItemDelegate:", self);
  }
  else if (objc_msgSend(v4, "supportsAnnotatedTextList"))
  {
    v10 = [MUPlaceListItemSectionController alloc];
    -[MUPlaceViewController mapItem](self, "mapItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUPlaceViewController mapItem](self, "mapItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_annotatedItemList");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[MUPlaceListItemSectionController initWithMapItem:annotatedList:](v10, "initWithMapItem:annotatedList:", v11, v13);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_officialAppSectionControllerForAvailability:(id)a3
{
  MUTimeExpirableLRUCache *v4;
  uint64_t UInteger;
  MUTimeExpirableLRUCache *v6;
  MUTimeExpirableLRUCache *officialAppMediaResultCache;
  MUOfficialAppSectionController *v8;
  void *v9;
  MUOfficialAppSectionController *v10;

  if (objc_msgSend(a3, "suportsOfficialApp"))
  {
    if (!self->_officialAppMediaResultCache)
    {
      v4 = [MUTimeExpirableLRUCache alloc];
      UInteger = GEOConfigGetUInteger();
      v6 = -[MUTimeExpirableLRUCache initWithMaxSize:timeToLive:](v4, "initWithMaxSize:timeToLive:", UInteger, (double)(unint64_t)GEOConfigGetUInteger());
      officialAppMediaResultCache = self->_officialAppMediaResultCache;
      self->_officialAppMediaResultCache = v6;

    }
    v8 = [MUOfficialAppSectionController alloc];
    -[MUPlaceViewController mapItem](self, "mapItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[MUOfficialAppSectionController initWithMapItem:usingCachedMediaResults:](v8, "initWithMapItem:usingCachedMediaResults:", v9, self->_officialAppMediaResultCache);

  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (id)_placeRibbonSectionControllerForAvailability:(id)a3 placeRibbonConfiguration:(id)a4
{
  id v6;
  id v7;
  MUPlaceRibbonSectionControllerConfiguration *v8;
  MUPlaceRibbonSectionController *v9;
  void *v10;
  MUPlaceRibbonSectionController *v11;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(MUPlaceRibbonSectionControllerConfiguration);
  -[MUPlaceRibbonSectionControllerConfiguration setAvailability:](v8, "setAvailability:", v7);

  -[MUPlaceRibbonSectionControllerConfiguration setRibbonConfiguration:](v8, "setRibbonConfiguration:", v6);
  -[MUPlaceRibbonSectionControllerConfiguration setEtaProvider:](v8, "setEtaProvider:", self->_etaProvider);
  -[MUPlaceRibbonSectionControllerConfiguration setEvChargerAvailabilityProvider:](v8, "setEvChargerAvailabilityProvider:", self->_evChargerAvailabilityProvider);
  v9 = [MUPlaceRibbonSectionController alloc];
  -[MUPlaceViewController mapItem](self, "mapItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[MUPlaceRibbonSectionController initWithMapItem:configuration:](v9, "initWithMapItem:configuration:", v10, v8);

  -[MUPlaceRibbonSectionController setRibbonDelegate:](v11, "setRibbonDelegate:", self);
  return v11;
}

- (id)_transitDeparturesSectionControllerForAvailability:(id)a3
{
  id v4;
  MUTransitDeparturesSectionController *v5;
  void *v6;
  MUTransitDeparturesSectionController *v7;

  v4 = a3;
  if (objc_msgSend(v4, "isTransitItem"))
  {
    v5 = [MUTransitDeparturesSectionController alloc];
    -[MUPlaceViewController mapItem](self, "mapItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[MUTransitDeparturesSectionController initWithMapItem:allowTransitLineSelection:departuresDelegate:](v5, "initWithMapItem:allowTransitLineSelection:departuresDelegate:", v6, objc_msgSend(v4, "allowTransitLineSelection"), self);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_photoSectionControllerForAvailability:(id)a3
{
  id v4;
  MUPlacePhotoSectionControllerConfiguration *v5;
  uint64_t v6;
  MUPlacePhotoSectionController *v7;
  void *v8;
  MUPlacePhotoSectionController *v9;

  v4 = a3;
  v5 = objc_alloc_init(MUPlacePhotoSectionControllerConfiguration);
  v6 = objc_msgSend(v4, "supportsCallToAction");

  -[MUPlacePhotoSectionControllerConfiguration setSupportsARPCallToAction:](v5, "setSupportsARPCallToAction:", v6);
  -[MUPlacePhotoSectionControllerConfiguration setPresentingViewController:](v5, "setPresentingViewController:", self);
  if (MapKitIdiomIsMacCatalyst())
    -[MUPlacePhotoSectionControllerConfiguration setShowLookAround:](v5, "setShowLookAround:", 1);
  v7 = [MUPlacePhotoSectionController alloc];
  -[MUPlaceViewController mapItem](self, "mapItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[MUPlacePhotoSectionController initWithMapItem:configuration:](v7, "initWithMapItem:configuration:", v8, v5);

  -[MUPlacePhotoSectionController setPhotoSectionControllerDelegate:](v9, "setPhotoSectionControllerDelegate:", self);
  -[MUPlacePhotoSectionController setLookAroundDelegate:](v9, "setLookAroundDelegate:", self);

  return v9;
}

- (id)_curatedGuidesSectionControllerForAvailability:(id)a3
{
  MUCuratedGuidesSectionController *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  MUCuratedGuidesSectionController *v13;
  void *v15;

  if (objc_msgSend(a3, "supportsCuratedGuidesCarousel"))
  {
    v4 = [MUCuratedGuidesSectionController alloc];
    -[MUPlaceViewController mapItem](self, "mapItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_placeCollections");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "curatedCollectionSyncCoordinator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUPlaceViewController mapItem](self, "mapItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUPlaceViewController mapItem](self, "mapItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_placeCollectionIds");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUPlaceViewController mapItem](self, "mapItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_exploreGuides");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[MUCuratedGuidesSectionController initWithDelegate:withPlaceCollections:usingSyncCoordinator:usingMapItem:usingCollectionIds:exploreGuides:](v4, "initWithDelegate:withPlaceCollections:usingSyncCoordinator:usingMapItem:usingCollectionIds:exploreGuides:", self, v5, v7, v8, v10, v12);

  }
  else
  {
    v13 = 0;
  }
  return v13;
}

- (id)_placeDescriptionSectionControllerForAvailability:(id)a3
{
  MUPlaceDescriptionConfiguration *v4;
  void *v5;
  void *v6;
  void *v7;
  MUPlaceDescriptionConfiguration *v8;
  MUPlaceDescriptionSectionController *v9;
  void *v10;
  MUPlaceDescriptionSectionController *v11;

  if (objc_msgSend(a3, "supportsPlaceDescription"))
  {
    v4 = [MUPlaceDescriptionConfiguration alloc];
    -[MUPlaceViewController mapItem](self, "mapItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_geoMapItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_placeDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[MUPlaceDescriptionConfiguration initWithTitle:descriptionText:attribution:](v4, "initWithTitle:descriptionText:attribution:", 0, v7, 0);

    v9 = [MUPlaceDescriptionSectionController alloc];
    -[_MKPlaceItem mapItem](self->_placeItem, "mapItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[MUPlaceDescriptionSectionController initWithMapItem:configuration:](v9, "initWithMapItem:configuration:", v10, v8);

    -[MUPlaceDescriptionSectionController setActionDelegate:](v11, "setActionDelegate:", self);
  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (id)_placeFooterSectionController
{
  MUPlaceFooterActionsSectionController *v3;
  void *v4;
  MUPlaceFooterActionsSectionController *v5;

  v3 = [MUPlaceFooterActionsSectionController alloc];
  -[MUPlaceViewController mapItem](self, "mapItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MUPlaceFooterActionsSectionController initWithMapItem:actionManager:](v3, "initWithMapItem:actionManager:", v4, self->_actionManager);

  return v5;
}

- (id)_passiveCallToActionSectionControllerForAvailability:(id)a3
{
  MUPassiveCallToActionSectionController *v4;
  void *v5;
  MUPassiveCallToActionSectionController *v6;

  if (objc_msgSend(a3, "supportsCallToAction"))
  {
    v4 = [MUPassiveCallToActionSectionController alloc];
    -[MUPlaceViewController mapItem](self, "mapItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[MUPlaceSectionController initWithMapItem:](v4, "initWithMapItem:", v5);

    -[MUCallToActionSectionController setCallToActionDelegate:](v6, "setCallToActionDelegate:", self);
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)_callToActionSuggestionSectionControllerForAvailability:(id)a3
{
  MUPassiveCallToActionSectionController *v4;
  void *v5;
  MUPassiveCallToActionSectionController *v6;

  if (objc_msgSend(a3, "supportsCallToAction"))
  {
    v4 = [MUPassiveCallToActionSectionController alloc];
    -[MUPlaceViewController mapItem](self, "mapItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[MUPlaceSectionController initWithMapItem:](v4, "initWithMapItem:", v5);

    -[MUCallToActionSectionController setCallToActionDelegate:](v6, "setCallToActionDelegate:", self);
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)_encyclopedicSectionControllerForAvailability:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  MUPlaceDescriptionSectionController *v7;
  void *v8;
  MUPlaceDescriptionSectionController *v9;

  if (objc_msgSend(a3, "supportsEncyclopedicDescription"))
  {
    -[MUPlaceViewController mapItem](self, "mapItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_encyclopedicInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[MUPlaceDescriptionConfiguration configurationWithEncyclopedicInfo:](MUPlaceDescriptionConfiguration, "configurationWithEncyclopedicInfo:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = [MUPlaceDescriptionSectionController alloc];
    -[_MKPlaceItem mapItem](self->_placeItem, "mapItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[MUPlaceDescriptionSectionController initWithMapItem:configuration:](v7, "initWithMapItem:configuration:", v8, v6);

    -[MUPlaceDescriptionSectionController setActionDelegate:](v9, "setActionDelegate:", self);
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (id)_personalGuidesSectionController
{
  MUPersonalGuidesSectionController *v3;
  void *v4;
  MUPersonalGuidesSectionController *v5;

  v3 = [MUPersonalGuidesSectionController alloc];
  -[MUPlaceViewController mapItem](self, "mapItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MUPersonalGuidesSectionController initWithMapItem:collectionViewProvider:](v3, "initWithMapItem:collectionViewProvider:", v4, self);

  return v5;
}

- (id)_placeEnrichmentSectionControllerForAvailability:(id)a3
{
  id v4;
  MUPlaceEnrichmentSectionController *v5;
  void *v6;
  MUPlaceActionManager *actionManager;
  void *v8;
  MUPlaceEnrichmentSectionController *v9;

  v4 = a3;
  if (MapsFeature_IsEnabled_PlaceCardShowcase()
    && objc_msgSend(v4, "supportsPlaceEnrichment"))
  {
    v5 = [MUPlaceEnrichmentSectionController alloc];
    -[MUPlaceViewController mapItem](self, "mapItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    actionManager = self->_actionManager;
    -[MUPlaceViewController amsResultProvider](self, "amsResultProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[MUPlaceEnrichmentSectionController initWithMapItem:actionManager:dataAvailability:amsResultProvider:callToActionDelegate:externalActionHandler:rapActionHandler:](v5, "initWithMapItem:actionManager:dataAvailability:amsResultProvider:callToActionDelegate:externalActionHandler:rapActionHandler:", v6, actionManager, v4, v8, self, self, self);

    -[MUPlaceEnrichmentSectionController setPlaceEnrichmentDelegate:](v9, "setPlaceEnrichmentDelegate:", self);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_contactSharedLocationSectionControllerForAvailability:(id)a3
{
  id v4;
  void *v5;
  MUContactSharedLocationSectionController *v6;

  v4 = a3;
  if (MapsFeature_IsEnabled_MapsWally()
    && -[_MKPlaceItem representsPerson](self->_placeItem, "representsPerson"))
  {
    -[_MKPlaceItem contact](self->_placeItem, "contact");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "_mapkit_isSharedLocationContact"))
    {
      v6 = -[MUContactSharedLocationSectionController initWithPlaceItem:availability:]([MUContactSharedLocationSectionController alloc], "initWithPlaceItem:availability:", self->_placeItem, v4);
      -[MUContactSharedLocationSectionController setContactSharedLocationSectionDelegate:](v6, "setContactSharedLocationSectionDelegate:", self);
    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_amenitiesSectionControllerForAvailability:(id)a3 moduleConfiguration:(id)a4
{
  id v6;
  MUAmenitiesSectionController *v7;
  void *v8;
  MUAmenitiesSectionController *v9;

  v6 = a4;
  if (objc_msgSend(a3, "supportsAmenities"))
  {
    v7 = [MUAmenitiesSectionController alloc];
    -[MUPlaceViewController mapItem](self, "mapItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[MUAmenitiesSectionController initWithMapItem:moduleConiguration:](v7, "initWithMapItem:moduleConiguration:", v8, v6);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_relatedPlaceSectionControllerForAvailability:(id)a3 relatedPlaceList:(id)a4
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  MURelatedPlacesSectionController *v10;
  void *v11;
  MURelatedPlacesSectionController *v12;

  v6 = a4;
  if (!objc_msgSend(a3, "supportsRelatedPlaces")
    || MapsFeature_IsEnabled_MapsWally()
    && -[_MKPlaceItem representsPerson](self->_placeItem, "representsPerson")
    && (-[_MKPlaceItem contact](self->_placeItem, "contact"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "_mapkit_isSharedLocationContact"),
        v7,
        !v8))
  {
    v12 = 0;
  }
  else
  {
    -[MUPlaceViewController _relatedPlaceConfigurationForRelatedPlaceList:moduleConfiguration:](self, "_relatedPlaceConfigurationForRelatedPlaceList:moduleConfiguration:", v6, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = [MURelatedPlacesSectionController alloc];
    -[MUPlaceViewController mapItem](self, "mapItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[MURelatedPlacesSectionController initWithMapItem:configuration:](v10, "initWithMapItem:configuration:", v11, v9);

    -[MURelatedPlacesSectionController setRelatedPlacesDelegate:](v12, "setRelatedPlacesDelegate:", self);
  }

  return v12;
}

- (id)_relatedPlaceSectionControllerForAvailability:(id)a3 config:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  MURelatedPlacesSectionController *v12;
  void *v13;
  MURelatedPlacesSectionController *v14;
  void *v15;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "supportsRelatedPlaces"))
  {
    -[MUPlaceViewController mapItem](self, "mapItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v7)
    {
      objc_msgSend(v8, "_relatedPlaceListForComponentIdentifier:", objc_msgSend(v7, "componentIdentifier"));
      v10 = objc_claimAutoreleasedReturnValue();

      if (!v10)
      {
        v9 = 0;
        v14 = 0;
        goto LABEL_9;
      }
      -[MUPlaceViewController _relatedPlaceConfigurationForRelatedPlaceList:moduleConfiguration:](self, "_relatedPlaceConfigurationForRelatedPlaceList:moduleConfiguration:", v10, v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = [MURelatedPlacesSectionController alloc];
      -[MUPlaceViewController mapItem](self, "mapItem");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[MURelatedPlacesSectionController initWithMapItem:configuration:](v12, "initWithMapItem:configuration:", v13, v11);

      -[MURelatedPlacesSectionController setRelatedPlacesDelegate:](v14, "setRelatedPlacesDelegate:", self);
      v9 = (void *)v10;
    }
    else
    {
      objc_msgSend(v8, "_relatedPlaceLists");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "firstObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[MUPlaceViewController _relatedPlaceSectionControllerForAvailability:relatedPlaceList:](self, "_relatedPlaceSectionControllerForAvailability:relatedPlaceList:", v6, v15);
      v14 = (MURelatedPlacesSectionController *)objc_claimAutoreleasedReturnValue();

    }
LABEL_9:

    goto LABEL_10;
  }
  v14 = 0;
LABEL_10:

  return v14;
}

- (id)_relatedPlaceConfigurationForRelatedPlaceList:(id)a3 moduleConfiguration:(id)a4
{
  id v6;
  id v7;
  MURelatedPlaceSectionControllerConfiguration *v8;
  _BOOL8 v9;

  v6 = a4;
  v7 = a3;
  v8 = -[MURelatedPlaceSectionControllerConfiguration initWithRelatedPlaceList:]([MURelatedPlaceSectionControllerConfiguration alloc], "initWithRelatedPlaceList:", v7);

  v9 = (self->_options & 0x20000000) == 0;
  -[MURelatedPlaceSectionControllerConfiguration setSuppressSeeAllButton:](v8, "setSuppressSeeAllButton:", v9);
  -[MURelatedPlaceSectionControllerConfiguration setModuleConfiguration:](v8, "setModuleConfiguration:", v6);

  -[MURelatedPlaceSectionControllerConfiguration setSuppressItemSelection:](v8, "setSuppressItemSelection:", v9);
  return v8;
}

- (id)_inlineMapSectionControllerForAvailability:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  MUPlaceInlineMapSectionController *v8;
  void *v9;
  MUPlaceInlineMapSectionController *v10;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CC18F0], "configurationForPlaceViewControllerOptions:", self->_options);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if ((self->_options & 0x8000000000) != 0)
  {
    objc_msgSend(v5, "setSuppressLookAround:", 1);
    objc_msgSend(v6, "setSuppressSectionHeader:", 1);
    objc_msgSend(v6, "setShowMapAttribution:", 1);
    -[MUPlaceViewControllerConfiguration developerPlaceCardAuditToken](self->_configuration, "developerPlaceCardAuditToken");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setMapSnapshotAuditToken:", v7);

  }
  if ((objc_msgSend(v4, "supportsInlineMap") & 1) != 0 || objc_msgSend(v4, "supportsInlinePOIMap"))
  {
    v8 = [MUPlaceInlineMapSectionController alloc];
    -[MUPlaceViewController mapItem](self, "mapItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[MUPlaceInlineMapSectionController initWithMapItem:configuration:](v8, "initWithMapItem:configuration:", v9, v6);

    -[MUPlaceInlineMapSectionController setLocation:](v10, "setLocation:", self->_location);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_placeInfoSectionControllerForAvailability:(id)a3 moduleConfiguration:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  MUPlaceInfoSectionControllerConfiguration *v11;
  MUPlaceInfoSectionController *v12;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "supportsHours"))
  {
    -[_MKPlaceItem mapItem](self->_placeItem, "mapItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[MUPlaceHoursSectionViewConfiguration configurationForMapItem:](MUPlaceHoursSectionViewConfiguration, "configurationForMapItem:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v6, "supportsMessageHours"))
    {
      v10 = 0;
      goto LABEL_7;
    }
    -[_MKPlaceItem mapItem](self->_placeItem, "mapItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[MUPlaceHoursSectionViewConfiguration configurationForMessagesMapItem:](MUPlaceHoursSectionViewConfiguration, "configurationForMessagesMapItem:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v9;

LABEL_7:
  v11 = objc_alloc_init(MUPlaceInfoSectionControllerConfiguration);
  -[MUPlaceInfoSectionControllerConfiguration setModuleConfiguration:](v11, "setModuleConfiguration:", v7);

  -[MUPlaceInfoSectionControllerConfiguration setAvailability:](v11, "setAvailability:", v6);
  -[MUPlaceInfoSectionControllerConfiguration setActionDelegate:](v11, "setActionDelegate:", self->_actionManager);
  -[MUPlaceInfoSectionControllerConfiguration setHoursConfiguration:](v11, "setHoursConfiguration:", v10);
  -[MUPlaceInfoSectionControllerConfiguration setDeveloperPlaceCard:](v11, "setDeveloperPlaceCard:", (self->_options >> 39) & 1);
  v12 = -[MUPlaceInfoSectionController initWithPlaceItem:configuration:]([MUPlaceInfoSectionController alloc], "initWithPlaceItem:configuration:", self->_placeItem, v11);
  -[MUPlaceInfoSectionController setPlaceInfoDelegate:](v12, "setPlaceInfoDelegate:", self);
  -[MUPlaceInfoSectionController setUserInfoProvider:](v12, "setUserInfoProvider:", self);

  return v12;
}

- (id)_webContentSectionControllerForConfiguration:(id)a3
{
  id v4;
  MUPlaceWebContentSectionController *v5;
  void *v6;
  MUPlaceWebContentSectionController *v7;

  v4 = a3;
  v5 = [MUPlaceWebContentSectionController alloc];
  -[MUPlaceViewController mapItem](self, "mapItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MUPlaceWebContentSectionController initWithMapItem:configuration:](v5, "initWithMapItem:configuration:", v6, v4);

  -[MUPlaceWebContentSectionController setWebContentDelegate:](v7, "setWebContentDelegate:", self);
  return v7;
}

- (id)_webBasedPlacecardViewController
{
  MUWebBasedPlacecardSectionControllerConfiguration *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  MUTimeExpirableLRUCache *quickActionTrayArtworkCache;
  MUTimeExpirableLRUCache *v12;
  uint64_t UInteger;
  MUTimeExpirableLRUCache *v14;
  MUTimeExpirableLRUCache *v15;
  void *v16;
  MUWebBasedPlacecardSectionController *v17;
  void *v18;
  MUWebBasedPlacecardSectionController *v19;

  if (MapsFeature_IsEnabled_Maps102())
  {
    v3 = objc_alloc_init(MUWebBasedPlacecardSectionControllerConfiguration);
    -[MUWebBasedPlacecardSectionControllerConfiguration setExternalActionHandler:](v3, "setExternalActionHandler:", self);
    -[MUPlaceViewController webPlacecardGuides](self, "webPlacecardGuides");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUWebBasedPlacecardSectionControllerConfiguration setUserGuides:](v3, "setUserGuides:", v4);

    -[MUWebBasedPlacecardSectionControllerConfiguration setPlaceInShortcuts:](v3, "setPlaceInShortcuts:", -[MUPlaceViewController placeInShortcuts](self, "placeInShortcuts"));
    -[MUWebBasedPlacecardSectionControllerConfiguration setNumberOfReportsInReview:](v3, "setNumberOfReportsInReview:", -[MUPlaceViewController placeNumberOfReportsInReview](self, "placeNumberOfReportsInReview"));
    -[MUPlaceViewController userIcon](self, "userIcon");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUWebBasedPlacecardSectionControllerConfiguration setUserIcon:](v3, "setUserIcon:", v5);

    -[MUPlaceViewController placeItem](self, "placeItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "contact");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      -[MUPlaceViewController mapItem](self, "mapItem");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_placeCardContact");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    -[MUWebBasedPlacecardSectionControllerConfiguration setContact:](v3, "setContact:", v7);
    -[MUPlaceViewController placeItem](self, "placeItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "options");
    MKPlaceItemOptionsAsString();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUWebBasedPlacecardSectionControllerConfiguration setOptions:](v3, "setOptions:", v10);

    -[MUWebBasedPlacecardSectionControllerConfiguration setUserCanEdit:](v3, "setUserCanEdit:", (self->_options >> 4) & 1);
    -[MUWebBasedPlacecardSectionControllerConfiguration setCanShowOpenFindMyAction:](v3, "setCanShowOpenFindMyAction:", (self->_options >> 37) & 1);
    -[MUWebBasedPlacecardSectionControllerConfiguration setCanShowRequestLocation:](v3, "setCanShowRequestLocation:", (self->_options >> 38) & 1);
    -[MUWebBasedPlacecardSectionControllerConfiguration setShowMoreButton:](v3, "setShowMoreButton:", (self->_options >> 29) & 1);
    -[MUWebBasedPlacecardSectionControllerConfiguration setCanShowDownloadOffline:](v3, "setCanShowDownloadOffline:", (self->_options & 0x1000000000) == 0);
    quickActionTrayArtworkCache = self->_quickActionTrayArtworkCache;
    if (!quickActionTrayArtworkCache)
    {
      v12 = [MUTimeExpirableLRUCache alloc];
      UInteger = GEOConfigGetUInteger();
      v14 = -[MUTimeExpirableLRUCache initWithMaxSize:timeToLive:](v12, "initWithMaxSize:timeToLive:", UInteger, (double)(unint64_t)GEOConfigGetUInteger());
      v15 = self->_quickActionTrayArtworkCache;
      self->_quickActionTrayArtworkCache = v14;

      quickActionTrayArtworkCache = self->_quickActionTrayArtworkCache;
    }
    -[MUWebBasedPlacecardSectionControllerConfiguration setArtworkCache:](v3, "setArtworkCache:", quickActionTrayArtworkCache);
    -[MUPlaceViewController amsResultProvider](self, "amsResultProvider");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUWebBasedPlacecardSectionControllerConfiguration setAmsResultProvider:](v3, "setAmsResultProvider:", v16);

    v17 = [MUWebBasedPlacecardSectionController alloc];
    -[MUPlaceViewController mapItem](self, "mapItem");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[MUWebBasedPlacecardSectionController initWithMapItem:placeActionDispatcher:configuration:](v17, "initWithMapItem:placeActionDispatcher:configuration:", v18, self->_actionDispatcher, v3);

    -[MUWebBasedPlacecardSectionController setWebContentDelegate:](v19, "setWebContentDelegate:", self);
  }
  else
  {
    v19 = 0;
  }
  return v19;
}

- (id)_evChargingSectionControllerForForAvailability:(id)a3 mapItem:(id)a4
{
  id v6;
  MUEVChargingSectionController *v7;

  v6 = a4;
  if (objc_msgSend(a3, "supportsEVCharging") && self->_evChargerAvailabilityProvider)
    v7 = -[MUEVChargingSectionController initWithMapItem:availabilityProvider:]([MUEVChargingSectionController alloc], "initWithMapItem:availabilityProvider:", v6, self->_evChargerAvailabilityProvider);
  else
    v7 = 0;

  return v7;
}

- (id)_hikingTrailsSectionControllerForAvailability:(id)a3
{
  MURelatedPlaceSectionControllerConfiguration *v4;
  void *v5;
  void *v6;
  MURelatedPlaceSectionControllerConfiguration *v7;
  MURelatedPlacesSectionController *v8;
  void *v9;
  MURelatedPlacesSectionController *v10;

  if (objc_msgSend(a3, "supportsHikingTrails"))
  {
    v4 = [MURelatedPlaceSectionControllerConfiguration alloc];
    -[MUPlaceViewController mapItem](self, "mapItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_trailHead");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[MURelatedPlaceSectionControllerConfiguration initWithTrailHead:](v4, "initWithTrailHead:", v6);

    v8 = [MURelatedPlacesSectionController alloc];
    -[MUPlaceViewController mapItem](self, "mapItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[MURelatedPlacesSectionController initWithMapItem:configuration:](v8, "initWithMapItem:configuration:", v9, v7);

    -[MURelatedPlacesSectionController setRelatedPlacesDelegate:](v10, "setRelatedPlacesDelegate:", self);
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (id)_hikingTipSectionControllerForAvailability:(id)a3
{
  unint64_t options;
  MUHikingTipSectionController *v5;
  MUHikingTipSectionController *v6;
  void *v7;

  options = self->_options;
  v5 = 0;
  if (objc_msgSend(a3, "supportsHikingTip") && (options & 0x40000000000) != 0)
  {
    v6 = [MUHikingTipSectionController alloc];
    -[MUPlaceViewController placeItem](self, "placeItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[MUHikingTipSectionController initWithPlaceItem:tipDelegate:](v6, "initWithPlaceItem:tipDelegate:", v7, self);

  }
  return v5;
}

- (id)_notesSectionControllerForAvailability:(id)a3
{
  _TtC6MapsUI29MUPlaceNotesSectionController *v4;
  void *v5;
  void *v6;
  _TtC6MapsUI29MUPlaceNotesSectionController *v7;

  if (objc_msgSend(a3, "supportsPlaceNotes"))
  {
    v4 = [_TtC6MapsUI29MUPlaceNotesSectionController alloc];
    -[MUPlaceViewController mapItem](self, "mapItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUPlaceViewController libraryAccessProvider](self, "libraryAccessProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[MUPlaceNotesSectionController initWithMapItem:userInfoProvider:libraryAccessProvider:](v4, "initWithMapItem:userInfoProvider:libraryAccessProvider:", v5, self, v6);

    -[MUPlaceNotesSectionController setNotesSectionDelegate:](v7, "setNotesSectionDelegate:", self);
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (void)_updateSections
{
  NSObject *v3;
  NSObject *v4;
  uint8_t v5[16];
  uint8_t buf[16];

  MUGetPlaceCardLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_191DB8000, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "UpdateSections", ", buf, 2u);
  }

  -[MUPlaceViewController _deactivateSections](self, "_deactivateSections");
  -[MUPlaceViewController _buildSections](self, "_buildSections");
  -[MUPlaceViewController _activateSections](self, "_activateSections");
  -[MUPlaceViewController showContentIfLoaded](self, "showContentIfLoaded");
  MUGetPlaceCardLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)v5 = 0;
    _os_signpost_emit_with_name_impl(&dword_191DB8000, v4, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "UpdateSections", ", v5, 2u);
  }

}

- (void)_activateSections
{
  NSObject *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint8_t buf[8];
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  MUGetPlaceCardLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_191DB8000, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "ActivateSections", ", buf, 2u);
  }

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = self->_sectionControllers;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8++), "setActive:", 1, (_QWORD)v10);
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    }
    while (v6);
  }

  -[MUPlaceViewController _updateSectionsForSubmissionStatusChange](self, "_updateSectionsForSubmissionStatusChange");
  -[MUEVChargerAvailabilityProvider setIsActive:](self->_evChargerAvailabilityProvider, "setIsActive:", 1);
  MUGetPlaceCardLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_191DB8000, v9, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "ActivateSections", ", buf, 2u);
  }

}

- (void)_deactivateSections
{
  NSObject *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint8_t buf[8];
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  MUGetPlaceCardLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_191DB8000, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "DeactivateSections", ", buf, 2u);
  }

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = self->_sectionControllers;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8++), "setActive:", 0, (_QWORD)v10);
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    }
    while (v6);
  }

  -[MUEVChargerAvailabilityProvider setIsActive:](self->_evChargerAvailabilityProvider, "setIsActive:", 0);
  MUGetPlaceCardLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_191DB8000, v9, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "DeactivateSections", ", buf, 2u);
  }

}

- (void)_updateSectionsForAttributionChange
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = self->_sectionControllers;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "updateForAttributionChange", (_QWORD)v8);
        ++v6;
      }
      while (v4 != v6);
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (void)_updateSectionsForActionRowInfoChange
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = self->_sectionControllers;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "updateForActionRowInfoChange", (_QWORD)v8);
        ++v6;
      }
      while (v4 != v6);
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (void)_updateSectionsForSubmissionStatusChange
{
  MUPlaceDataAvailability *v3;
  void *v4;
  MUPlaceDataAvailability *v5;
  BOOL v6;
  NSObject *v7;
  NSObject *v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[8];
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = [MUPlaceDataAvailability alloc];
  -[MUPlaceViewController mapItem](self, "mapItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MUPlaceDataAvailability initWithMapItem:options:](v3, "initWithMapItem:options:", v4, self->_options);

  v6 = -[MUPlaceDataAvailability supportsCallToAction](v5, "supportsCallToAction");
  MUGetPlaceCardLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_signpost_enabled(v7))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_191DB8000, v8, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "UpdateSectionsForSubmissionStatus", ", buf, 2u);
    }

    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v9 = self->_sectionControllers;
    v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v15;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v15 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v13++), "setSubmissionStatus:", self->_submissionStatus, (_QWORD)v14);
        }
        while (v11 != v13);
        v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
      }
      while (v11);
    }

    MUGetPlaceCardLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v8))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_191DB8000, v8, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "UpdateSectionsForSubmissionStatus", ", buf, 2u);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_191DB8000, v8, OS_LOG_TYPE_INFO, "Do not support ARP call to action so not updating sections", buf, 2u);
  }

}

- (void)_updatePersonalizedSuggestionSectionArbiterWithSections
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[MUPlaceViewController notesSectionController](self, "notesSectionController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceViewController personalizedSuggestionSectionArbiter](self, "personalizedSuggestionSectionArbiter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPlaceNotesSectionController:", v3);

  -[MUPlaceViewController _firstSectionControllerOfClass:](self, "_firstSectionControllerOfClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceViewController personalizedSuggestionSectionArbiter](self, "personalizedSuggestionSectionArbiter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPlaceCallToActionSectionController:", v5);

  -[MUPlaceViewController _firstSectionControllerOfClass:](self, "_firstSectionControllerOfClass:", objc_opt_class());
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[MUPlaceViewController personalizedSuggestionSectionArbiter](self, "personalizedSuggestionSectionArbiter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHikingTipSectionController:", v8);

}

- (void)_updateWebPlacecardForSubmissionStatusChange:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  MUUGCRatingViewModel *v7;
  void *v8;
  MUUGCRatingViewModel *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(a3, "ratingState");
  v5 = &unk_1E2E551A0;
  if (v4 != 1)
    v5 = 0;
  if (v4 == 2)
    v6 = &unk_1E2E551B8;
  else
    v6 = v5;
  v7 = [MUUGCRatingViewModel alloc];
  _MULocalizedStringFromThisBundle(CFSTR("Overall [Placecard]"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[MUUGCRatingViewModel initWithCategory:value:](v7, "initWithCategory:value:", v8, v6);

  v17[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceViewController webPlacecardSectionController](self, "webPlacecardSectionController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "configuration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setUserARPRatings:", v10);

  -[MUPlaceViewController userIcon](self, "userIcon");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceViewController webPlacecardSectionController](self, "webPlacecardSectionController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "configuration");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setUserIcon:", v13);

  -[MUPlaceViewController webPlacecardSectionController](self, "webPlacecardSectionController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "updateUserData");

}

- (void)_updateWebPlacecardForPhotoSubmissionWithURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[MUPlaceViewController webPlacecardSectionController](self, "webPlacecardSectionController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUserARPPhoto:", v4);

  -[MUPlaceViewController webPlacecardSectionController](self, "webPlacecardSectionController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updateUserData");

}

- (void)updateActionRowView
{
  _QWORD v2[5];
  _QWORD v3[5];

  v2[4] = self;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __44__MUPlaceViewController_updateActionRowView__block_invoke;
  v3[3] = &unk_1E2E01970;
  v3[4] = self;
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __44__MUPlaceViewController_updateActionRowView__block_invoke_2;
  v2[3] = &unk_1E2E01970;
  -[MUPlaceViewController _performWithNewUIBlock:oldUIBlock:](self, "_performWithNewUIBlock:oldUIBlock:", v3, v2);
}

void __44__MUPlaceViewController_updateActionRowView__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "actionRowSectionController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "updateForActionRowInfoChange");

}

void __44__MUPlaceViewController_updateActionRowView__block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "actionRowSectionController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "updateForActionRowInfoChange");

}

- (void)updateViewsWithSubmissionStatus:(id)a3 animated:(BOOL)a4
{
  id v6;
  unint64_t v7;
  unint64_t v8;
  BOOL v9;
  NSObject *v10;
  uint8_t v11[16];

  v6 = a3;
  v7 = self->_submissionStatus;
  v8 = (unint64_t)v6;
  if (v8 | v7 && (v9 = objc_msgSend((id)v7, "isEqual:", v8), (id)v8, (id)v7, !v9))
  {
    objc_storeStrong((id *)&self->_submissionStatus, a3);
    -[MUPlaceViewController _updateSectionsForSubmissionStatusChange](self, "_updateSectionsForSubmissionStatusChange");
    -[MUPlaceViewController _updateWebPlacecardForSubmissionStatusChange:](self, "_updateWebPlacecardForSubmissionStatusChange:", v8);
  }
  else
  {
    MUGetPlaceCardLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_191DB8000, v10, OS_LOG_TYPE_DEBUG, "Neither the submission status or proactive status has changed so not updating.", v11, 2u);
    }

  }
}

- (void)updateUserSubmissionWithPhotoURL:(id)a3 photoID:(id)a4 numberOfPhotos:(int64_t)a5
{
  id v8;
  MUUserSubmittedPhoto *v9;
  void *v10;
  MUUserSubmittedPhoto *v11;
  uint64_t v12;
  MUUserSubmittedPhoto *v13;
  id v14;

  v14 = a3;
  v8 = a4;
  v9 = -[MUUserSubmittedPhoto initWithPhotoURL:]([MUUserSubmittedPhoto alloc], "initWithPhotoURL:", v14);
  -[MUUserSubmittedPhoto setPhotoID:](v9, "setPhotoID:", v8);

  -[MUPlaceViewController _firstSectionControllerOfClass:](self, "_firstSectionControllerOfClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "userSubmittedPhoto");
  v11 = (MUUserSubmittedPhoto *)objc_claimAutoreleasedReturnValue();
  if (v11 == v9)
  {
    v12 = objc_msgSend(v10, "numberOfUserSubmittedPhotos");

    if (v12 == a5)
      goto LABEL_8;
  }
  else
  {

  }
  if (v14)
    v13 = v9;
  else
    v13 = 0;
  objc_msgSend(v10, "setUserSubmittedPhoto:", v13);
  objc_msgSend(v10, "setUserInfoProvider:", self);
  objc_msgSend(v10, "setNumberOfUserSubmittedPhotos:", a5);
  objc_msgSend(v10, "updateWithUserSubmittedPhotos:", 1);
  -[MUPlaceViewController _updateWebPlacecardForPhotoSubmissionWithURL:](self, "_updateWebPlacecardForPhotoSubmissionWithURL:", v14);
LABEL_8:

}

- (void)updateCuratedCollectionsView
{
  id v2;

  -[MUPlaceViewController curatedGuidesSectionController](self, "curatedGuidesSectionController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "refreshCollections");

}

- (void)updateSuggestionView
{
  id v2;

  -[MUPlaceViewController _firstSectionControllerOfClass:](self, "_firstSectionControllerOfClass:", objc_opt_class());
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateSuggestionView");

}

- (void)updateWebPlacecardSuggestionViewWithViewModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[MUPlaceViewController webPlacecardSectionController](self, "webPlacecardSectionController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUserARPSuggestion:", v4);

  -[MUPlaceViewController userIcon](self, "userIcon");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceViewController webPlacecardSectionController](self, "webPlacecardSectionController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "configuration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setUserIcon:", v7);

  -[MUPlaceViewController webPlacecardSectionController](self, "webPlacecardSectionController");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "updateUserData");

}

- (void)updateCollectionViewsAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[MUPlaceViewController personalGuidesSectionController](self, "personalGuidesSectionController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reloadCollectionsAnimated:", v3);

}

- (void)updatePlaceInfo
{
  id v2;

  -[MUPlaceViewController placeInfoSectionController](self, "placeInfoSectionController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "refreshContents");

}

- (void)updatePlaceEnrichment
{
  id v2;

  -[MUPlaceViewController placeEnrichmentSectionController](self, "placeEnrichmentSectionController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "refreshPlaceEnrichment");

}

- (void)setPlaceNumberOfReportsInReview:(unint64_t)a3
{
  id v4;

  self->_placeNumberOfReportsInReview = a3;
  -[MUPlaceViewController placeInfoSectionController](self, "placeInfoSectionController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPlaceNumberOfReportsInReview:", a3);

}

- (void)setOfflineMapProvider:(id)a3
{
  MUOfflineMapProvider **p_offlineMapProvider;
  id v5;
  id v6;

  p_offlineMapProvider = &self->_offlineMapProvider;
  v5 = a3;
  objc_storeWeak((id *)p_offlineMapProvider, v5);
  -[MUPlaceViewController unifiedActionRowSectionController](self, "unifiedActionRowSectionController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setOfflineMapProvider:", v5);

}

- (void)setOfflineFeatureDiscoveryView:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_offlineFeatureDiscoveryView, a3);
  v5 = a3;
  -[MUPlaceViewController unifiedActionRowSectionController](self, "unifiedActionRowSectionController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setOfflineFeatureDiscoveryView:", v5);

}

- (void)setLibraryAccessProvider:(id)a3
{
  MULibraryAccessProviding *v4;
  MULibraryAccessProviding *libraryAccessProvider;
  MULibraryAccessProviding *v6;
  id v7;

  v4 = (MULibraryAccessProviding *)a3;
  -[MULibraryAccessProviding unregisterObserver:](self->_libraryAccessProvider, "unregisterObserver:", self);
  libraryAccessProvider = self->_libraryAccessProvider;
  self->_libraryAccessProvider = v4;
  v6 = v4;

  -[MULibraryAccessProviding registerObserver:](self->_libraryAccessProvider, "registerObserver:", self);
  -[MUPlaceViewController notesSectionController](self, "notesSectionController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLibraryAccessProvider:", v6);

}

- (MKLookAroundView)lookAroundView
{
  return (MKLookAroundView *)-[MKLookAroundContainerView lookAroundViewIfPresent](self->_lookAroundView, "lookAroundViewIfPresent");
}

- (id)lookAroundContainerForPlacePhotoSectionController:(id)a3
{
  MKLookAroundContainerView *v4;
  MKLookAroundContainerView *lookAroundView;
  void *v6;

  if (!self->_lookAroundView)
  {
    v4 = (MKLookAroundContainerView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC1818]), "initWithPhotosDimmingStyle:", 1);
    lookAroundView = self->_lookAroundView;
    self->_lookAroundView = v4;

  }
  -[MUPlaceViewController mapItem](self, "mapItem", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKLookAroundContainerView setMapItem:](self->_lookAroundView, "setMapItem:", v6);

  return self->_lookAroundView;
}

- (void)placePhotoSectionController:(id)a3 enterLookAroundForMapItem:(id)a4 lookAroundView:(id)a5
{
  id v7;
  void *v8;
  char v9;
  void *v10;
  id v11;

  v11 = a4;
  v7 = a5;
  -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "placeViewController:enterLookAroundForMapItem:lookAroundView:", self, v11, v7);

  }
}

- (void)performAction:(id)a3 options:(id)a4 completion:(id)a5
{
  -[MUPlaceActionManager performAction:options:completion:](self->_actionManager, "performAction:options:completion:", a3, a4, a5);
}

- (id)draggableContent
{
  id v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = self->_sectionControllers;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v8);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v9, "draggableContent", (_QWORD)v13);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v10, "count"))
            objc_msgSend(v3, "addObjectsFromArray:", v10);

        }
        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  v11 = (void *)objc_msgSend(v3, "copy");
  return v11;
}

- (id)createMenuActions
{
  return (id)-[MUPlaceActionManager createMenuActions](self->_actionManager, "createMenuActions");
}

- (UIView)draggableHeaderView
{
  void *v2;
  void *v3;

  -[MUPlaceViewController headerSectionController](self, "headerSectionController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIView *)v3;
}

- (UIView)viewForHeaderContainmentString
{
  void *v2;
  void *v3;

  -[MUPlaceViewController headerSectionController](self, "headerSectionController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewForContainmentString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIView *)v3;
}

- (UILayoutGuide)headerViewTitleLabelToTopLayoutGuide
{
  void *v2;
  void *v3;

  -[MUPlaceViewController headerSectionController](self, "headerSectionController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "headerViewTitleLabelToTopLayoutGuide");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UILayoutGuide *)v3;
}

- (void)setVerifiedHeaderExpansionProgress:(double)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  MUWebBasedPlacecardExpansionContext *v11;

  if (self->_verifiedHeaderExpansionProgress != a3)
  {
    self->_verifiedHeaderExpansionProgress = a3;
    -[MUPlaceViewController headerSectionController](self, "headerSectionController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setCardExpansionProgress:", self->_verifiedHeaderExpansionProgress);

    v11 = objc_alloc_init(MUWebBasedPlacecardExpansionContext);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_verifiedHeaderExpansionProgress);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUWebBasedPlacecardExpansionContext setProgress:](v11, "setProgress:", v5);

    v6 = (void *)MEMORY[0x1E0CB37E8];
    -[MUPlaceViewController headerSectionController](self, "headerSectionController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "verifiedBusinessHeaderHeight");
    objc_msgSend(v6, "numberWithDouble:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUWebBasedPlacecardExpansionContext setHeight:](v11, "setHeight:", v8);

    -[MUPlaceViewController webPlacecardSectionController](self, "webPlacecardSectionController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUWebBasedPlacecardExpansionContext context](v11, "context");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "callBridgeMethod:arguments:", CFSTR("handleCardExpansion"), v10);

  }
}

- (void)performShareActionWithPresentationOptions:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[MUPlaceViewController headerSectionController](self, "headerSectionController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "analyticsModule");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceViewController _invokeShareActionWithPresentationOptions:analyticsModuleMetadata:](self, "_invokeShareActionWithPresentationOptions:analyticsModuleMetadata:", v4, v5);

}

- (UIScrollView)scrollView
{
  return (UIScrollView *)self->_contentStackView;
}

+ (double)headerHeightInMinimalMode
{
  double result;

  +[MUPlaceHeaderSectionController minimalModeHeight](MUPlaceHeaderSectionController, "minimalModeHeight");
  return result;
}

- (void)hideTitle:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __35__MUPlaceViewController_hideTitle___block_invoke;
  v3[3] = &unk_1E2E01998;
  v3[4] = self;
  v4 = a3;
  -[MUPlaceViewController _performWithNewUIBlock:oldUIBlock:](self, "_performWithNewUIBlock:oldUIBlock:", v3, 0);
}

void __35__MUPlaceViewController_hideTitle___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "headerSectionController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hideTitle:", *(unsigned __int8 *)(a1 + 40));

}

- (double)heightForContentAboveTitle
{
  void *v2;
  double v3;
  double v4;

  -[MUPlaceViewController headerSectionController](self, "headerSectionController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "verifiedBusinessHeaderHeight");
  v4 = v3;

  return v4;
}

- (void)contentAboveTitleScrollPositionChanged:(double)a3
{
  id v4;

  -[MUPlaceViewController headerSectionController](self, "headerSectionController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "verifiedBusinessHeaderScrollPositionChanged:", a3);

}

- (void)setPlaceItem:(id)a3 updateOriginalContact:(BOOL)a4
{
  id v6;
  uint64_t v7;
  id v8;
  _QWORD v9[5];
  id v10;
  BOOL v11;
  _QWORD v12[5];
  id v13;
  BOOL v14;

  v6 = a3;
  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __60__MUPlaceViewController_setPlaceItem_updateOriginalContact___block_invoke;
  v12[3] = &unk_1E2E019E8;
  v12[4] = self;
  v13 = v6;
  v14 = a4;
  v9[0] = v7;
  v9[1] = 3221225472;
  v9[2] = __60__MUPlaceViewController_setPlaceItem_updateOriginalContact___block_invoke_2;
  v9[3] = &unk_1E2E019E8;
  v9[4] = self;
  v10 = v13;
  v11 = a4;
  v8 = v13;
  -[MUPlaceViewController _performWithNewUIBlock:oldUIBlock:](self, "_performWithNewUIBlock:oldUIBlock:", v12, v9);

}

uint64_t __60__MUPlaceViewController_setPlaceItem_updateOriginalContact___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setPlaceItem:updateOriginalContact:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

uint64_t __60__MUPlaceViewController_setPlaceItem_updateOriginalContact___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "setPlaceItem:updateOriginalContact:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

- (double)currentHeight
{
  double v2;
  _QWORD v4[6];
  _QWORD v5[6];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  v4[5] = &v6;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __38__MUPlaceViewController_currentHeight__block_invoke;
  v5[3] = &unk_1E2E019C0;
  v5[4] = self;
  v5[5] = &v6;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __38__MUPlaceViewController_currentHeight__block_invoke_2;
  v4[3] = &unk_1E2E019C0;
  v4[4] = self;
  -[MUPlaceViewController _performWithNewUIBlock:oldUIBlock:](self, "_performWithNewUIBlock:oldUIBlock:", v5, v4);
  v2 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v2;
}

uint64_t __38__MUPlaceViewController_currentHeight__block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 984), "contentSize");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

uint64_t __38__MUPlaceViewController_currentHeight__block_invoke_2(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "currentHeight");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (void)updateHeaderTitle
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __42__MUPlaceViewController_updateHeaderTitle__block_invoke;
  v2[3] = &unk_1E2E01970;
  v2[4] = self;
  -[MUPlaceViewController _performWithNewUIBlock:oldUIBlock:](self, "_performWithNewUIBlock:oldUIBlock:", 0, v2);
}

uint64_t __42__MUPlaceViewController_updateHeaderTitle__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "updateHeaderTitle");
}

- (void)scrollToTopAnimated:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;
  _QWORD v5[5];
  BOOL v6;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__MUPlaceViewController_scrollToTopAnimated___block_invoke;
  v5[3] = &unk_1E2E01998;
  v5[4] = self;
  v6 = a3;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __45__MUPlaceViewController_scrollToTopAnimated___block_invoke_2;
  v3[3] = &unk_1E2E01998;
  v3[4] = self;
  v4 = a3;
  -[MUPlaceViewController _performWithNewUIBlock:oldUIBlock:](self, "_performWithNewUIBlock:oldUIBlock:", v5, v3);
}

uint64_t __45__MUPlaceViewController_scrollToTopAnimated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 984), "_mapsui_scrollToTopAnimated:", *(unsigned __int8 *)(a1 + 40));
}

uint64_t __45__MUPlaceViewController_scrollToTopAnimated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "scrollToTopAnimated:", *(unsigned __int8 *)(a1 + 40));
}

- (double)headerSecondaryNameLabelPadding
{
  double v2;
  _QWORD v4[6];
  uint64_t v5;
  double *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = (double *)&v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __56__MUPlaceViewController_headerSecondaryNameLabelPadding__block_invoke;
  v4[3] = &unk_1E2E019C0;
  v4[4] = self;
  v4[5] = &v5;
  -[MUPlaceViewController _performWithNewUIBlock:oldUIBlock:](self, "_performWithNewUIBlock:oldUIBlock:", 0, v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __56__MUPlaceViewController_headerSecondaryNameLabelPadding__block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "headerSecondaryNameLabelPadding");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (void)_performWithNewUIBlock:(id)a3 oldUIBlock:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  v7 = v6;
  if (!self->_showNewUI)
  {
    if (!v6)
      goto LABEL_4;
    goto LABEL_3;
  }
  v6 = v8;
  if (v8)
LABEL_3:
    (*((void (**)(void))v6 + 2))();
LABEL_4:

}

- (double)contentAlpha
{
  double v2;
  _QWORD v4[6];
  _QWORD v5[6];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0x3FF0000000000000;
  v4[5] = &v6;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __37__MUPlaceViewController_contentAlpha__block_invoke;
  v5[3] = &unk_1E2E019C0;
  v5[4] = self;
  v5[5] = &v6;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __37__MUPlaceViewController_contentAlpha__block_invoke_2;
  v4[3] = &unk_1E2E019C0;
  v4[4] = self;
  -[MUPlaceViewController _performWithNewUIBlock:oldUIBlock:](self, "_performWithNewUIBlock:oldUIBlock:", v5, v4);
  v2 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v2;
}

double __37__MUPlaceViewController_contentAlpha__block_invoke(uint64_t a1)
{
  double result;

  result = *(double *)(*(_QWORD *)(a1 + 32) + 1048);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __37__MUPlaceViewController_contentAlpha__block_invoke_2(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "contentAlpha");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (void)setContentAlpha:(double)a3
{
  _QWORD v3[6];
  _QWORD v4[6];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __41__MUPlaceViewController_setContentAlpha___block_invoke;
  v4[3] = &unk_1E2E01A60;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __41__MUPlaceViewController_setContentAlpha___block_invoke_2;
  v3[3] = &unk_1E2E01A60;
  v3[4] = self;
  *(double *)&v3[5] = a3;
  -[MUPlaceViewController _performWithNewUIBlock:oldUIBlock:](self, "_performWithNewUIBlock:oldUIBlock:", v4, v3);
}

uint64_t __41__MUPlaceViewController_setContentAlpha___block_invoke(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1048) = *(_QWORD *)(a1 + 40);
  return objc_msgSend(*(id *)(a1 + 32), "_updateContentAlpha");
}

uint64_t __41__MUPlaceViewController_setContentAlpha___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "setContentAlpha:", *(double *)(a1 + 40));
}

- (void)_updateContentAlpha
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v3 = self->_sectionControllers;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v20;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v20 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v7);
        -[MUPlaceViewController headerSectionController](self, "headerSectionController");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8 != v9)
        {
          v17 = 0u;
          v18 = 0u;
          v15 = 0u;
          v16 = 0u;
          objc_msgSend(v8, "sectionViews", 0);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
          if (v11)
          {
            v12 = v11;
            v13 = *(_QWORD *)v16;
            do
            {
              v14 = 0;
              do
              {
                if (*(_QWORD *)v16 != v13)
                  objc_enumerationMutation(v10);
                objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v14++), "setAlpha:", self->_contentAlpha);
              }
              while (v12 != v14);
              v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
            }
            while (v12);
          }

        }
        ++v7;
      }
      while (v7 != v5);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v5);
  }

}

- (void)relatedPlaceSectionController:(id)a3 showSeeAllWithTitle:(id)a4 relatedMapItems:(id)a5 originalMapItem:(id)a6
{
  id v9;
  id v10;
  void *v11;
  char v12;
  void *v13;
  id v14;

  v14 = a4;
  v9 = a5;
  v10 = a6;
  -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0)
  {
    -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "placeViewController:showRelatedMapItems:withTitle:originalMapItem:analyticsDelegate:", self, v9, v14, v10, self->_analyticsController);

  }
}

- (void)relatedPlaceSectionController:(id)a3 itemSelected:(id)a4
{
  -[MUPlaceViewController _handleRoutingToPlaceWithMapItem:](self, "_handleRoutingToPlaceWithMapItem:", a4);
}

- (void)placePhotoSectionController:(id)a3 didSelectViewPhoto:(id)a4 withID:(id)a5 presentingViewController:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a4;
  v9 = a5;
  v10 = a6;
  -[MUPlaceViewController mapItem](self, "mapItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "length"))
  {
    objc_msgSend(v14, "attribution");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "urlsForPhotoWithIdentifier:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUPlaceViewController _presentStoreProductScreenWithMapItem:attribution:bundleIdentifier:attributionURLs:presentingViewController:](self, "_presentStoreProductScreenWithMapItem:attribution:bundleIdentifier:attributionURLs:presentingViewController:", v11, v12, v9, v13, v10);

  }
  else
  {
    -[MUPlaceViewController placeCardActionControllerDidSelectViewAllPhotos:presentingViewController:](self, "placeCardActionControllerDidSelectViewAllPhotos:presentingViewController:", 0, v10);
  }

}

- (void)_presentStoreProductScreenWithMapItem:(id)a3 attribution:(id)a4 bundleIdentifier:(id)a5 attributionURLs:(id)a6 presentingViewController:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  v15 = a4;
  if (+[MUPlaceAttributionUtilities shouldPresentStoreProductViewControllerWithAttribution:](MUPlaceAttributionUtilities, "shouldPresentStoreProductViewControllerWithAttribution:", v15))
  {
    objc_msgSend(v15, "appAdamID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "providerID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    +[MUPlaceAttributionUtilities presentStoreProductViewControllerWithAppAdamID:bundleIdentifier:presentingViewController:](MUPlaceAttributionUtilities, "presentStoreProductViewControllerWithAppAdamID:bundleIdentifier:presentingViewController:", v16, v17, v14);
    -[MUPlaceCardAnalyticsController infoCardAnalyticsDidSelectAction:target:eventValue:feedbackDelegateSelector:actionRichProviderId:](self->_analyticsController, "infoCardAnalyticsDidSelectAction:target:eventValue:feedbackDelegateSelector:actionRichProviderId:", 45, 733, v12, 0, 0);
  }
  else
  {
    -[MUPlaceViewController placeViewFeedbackAppLaunchHandler](self, "placeViewFeedbackAppLaunchHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUPlaceViewController _launchAttributionURLs:withAttribution:mapItem:completionHandler:](self, "_launchAttributionURLs:withAttribution:mapItem:completionHandler:", v13, v15, v19, v18);

  }
}

- (void)placePhotoSectionControllerDidOpenFullscreenPhotos:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "placeViewControllerDidOpenFullscreenPhotos:", self);

  }
}

- (void)placePhotoSectionControllerDidCloseFullscreenPhotos:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "placeViewControllerDidCloseFullscreenPhotos:", self);

  }
}

- (void)placePhotoSectionController:(id)a3 didSelectPhotoToReport:(id)a4 withPhotoGalleryViewController:(id)a5
{
  id v7;
  void *v8;
  char v9;
  void *v10;
  id v11;

  v11 = a4;
  v7 = a5;
  -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "placeViewController:didSelectPhotoToReport:withPhotoGalleryViewController:", self, v11, v7);

  }
}

- (void)placePhotoSectionController:(id)a3 didSelectPhotoCategoryAtIndex:(unint64_t)a4
{
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[2];
  _QWORD v16[2];
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "placeViewController:didSelectPhotoCategoryAtIndex:", self, a4);

  }
  else
  {
    v8 = (void *)MEMORY[0x1E0CC1828];
    -[MUPlaceViewController mapItem](self, "mapItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *MEMORY[0x1E0CC15C8];
    v15[0] = *MEMORY[0x1E0CC15A0];
    v15[1] = v11;
    v16[0] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16[1] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "openMapsWithItems:launchOptions:completionHandler:", v10, v13, 0);

  }
}

- (void)placePhotoSectionController:(id)a3 requestsSceneActivationForPhotoGalleryViewController:(id)a4
{
  void *v5;
  char v6;
  void *v7;
  id v8;

  v8 = a4;
  -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "placeViewController:didRequestSceneActivationForPhotoGalleryViewController:", self, v8);

  }
}

- (void)ribbonSectionControllerDidTapAddRatings:(id)a3 initialRatingState:(int64_t)a4 withPresentationOptions:(id)a5
{
  void *v7;
  char v8;
  void *v9;
  id v10;

  v10 = a5;
  -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "placeViewController:didSelectAddRatingsWithPresentationOptions:overallState:originTarget:", self, v10, a4, CFSTR("PLACECARD_TITLE_CONTEXT"));

  }
}

- (void)ribbonSectionControllerDidTapHours:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[MUPlaceViewController placeInfoSectionController](self, "placeInfoSectionController", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hoursConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = v6;
  if (v6 && v4)
  {
    objc_msgSend(v6, "impressionsFrame");
    -[UIScrollView _mapsui_scrollToContentOffset:animated:](self->_contentStackView, "_mapsui_scrollToContentOffset:animated:", 1);
    v5 = v6;
  }

}

- (void)routeToCuratedCollection:(id)a3
{
  id v4;
  void *v5;
  char v6;
  MULockScreenCoordinator *lockScreenCoordinator;
  _QWORD v8[5];
  id v9;
  id v10;
  id location;

  v4 = a3;
  -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    objc_initWeak(&location, self);
    lockScreenCoordinator = self->_lockScreenCoordinator;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __50__MUPlaceViewController_routeToCuratedCollection___block_invoke;
    v8[3] = &unk_1E2E01610;
    objc_copyWeak(&v10, &location);
    v8[4] = self;
    v9 = v4;
    -[MULockScreenCoordinator performActionIfSuccessfullyAuthenticated:](lockScreenCoordinator, "performActionIfSuccessfullyAuthenticated:", v8);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }

}

void __50__MUPlaceViewController_routeToCuratedCollection___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "mapsAppDelegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "placeViewController:selectCuratedCollection:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

    WeakRetained = v4;
  }

}

- (void)routeToGuidesHomeFromExploreGuides:(id)a3
{
  id v4;
  void *v5;
  char v6;
  MULockScreenCoordinator *lockScreenCoordinator;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;

  v4 = a3;
  -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    objc_initWeak(&location, self);
    lockScreenCoordinator = self->_lockScreenCoordinator;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __60__MUPlaceViewController_routeToGuidesHomeFromExploreGuides___block_invoke;
    v8[3] = &unk_1E2E01AB0;
    objc_copyWeak(&v10, &location);
    v9 = v4;
    -[MULockScreenCoordinator performActionIfSuccessfullyAuthenticated:](lockScreenCoordinator, "performActionIfSuccessfullyAuthenticated:", v8);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }

}

void __60__MUPlaceViewController_routeToGuidesHomeFromExploreGuides___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(WeakRetained, "mapsAppDelegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "guideLocation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "placeViewController:selectExploreGuidesWithGuideLocation:", v5, v4);

    WeakRetained = v5;
  }

}

- (void)showAllCollections:(id)a3 usingTitle:(id)a4 usingCollectionIds:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  MULockScreenCoordinator *lockScreenCoordinator;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;
  id v18;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0)
  {
    objc_initWeak(&location, self);
    lockScreenCoordinator = self->_lockScreenCoordinator;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __74__MUPlaceViewController_showAllCollections_usingTitle_usingCollectionIds___block_invoke;
    v14[3] = &unk_1E2E01AD8;
    objc_copyWeak(&v18, &location);
    v14[4] = self;
    v15 = v8;
    v16 = v9;
    v17 = v10;
    -[MULockScreenCoordinator performActionIfSuccessfullyAuthenticated:](lockScreenCoordinator, "performActionIfSuccessfullyAuthenticated:", v14);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

}

void __74__MUPlaceViewController_showAllCollections_usingTitle_usingCollectionIds___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "mapsAppDelegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "placeViewController:seeAllCollections:usingTitle:usingCollectionIds:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

    WeakRetained = v4;
  }

}

- (id)collectionViews
{
  void *v3;
  char v4;
  void *v5;
  void *v6;

  -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "placeViewController:collectionViewsForPlaceItem:", self, self->_placeItem);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C9AA70];
  }
  return v6;
}

- (void)collectionIdentifierSelected:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "placeViewController:selectCollectionIdentifier:", self, v7);

  }
}

- (id)webPlacecardGuides
{
  void *v3;
  char v4;
  void *v5;
  void *v6;

  -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "placeViewController:webPlacecardGuidesForPlaceItem:", self, self->_placeItem);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C9AA60];
  }
  return v6;
}

- (UIImage)userIcon
{
  void *v3;
  char v4;
  void *v5;
  void *v6;

  -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "placeViewControllerUserIcon:", self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return (UIImage *)v6;
}

- (void)_showEditSheet:(id)a3
{
  CNContactViewController *v4;
  CNContactViewController *editingContactController;
  CNContactViewController *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  -[MUPlaceViewController _contactForEditOperations](self, "_contactForEditOperations", a3);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C974D8], "viewControllerForContact:", v10);
  v4 = (CNContactViewController *)objc_claimAutoreleasedReturnValue();
  -[CNContactViewController setEditMode:](v4, "setEditMode:", 2);
  -[CNContactViewController setActions:](v4, "setActions:", -[CNContactViewController actions](v4, "actions") | 0x100);
  -[CNContactViewController setDisplayMode:](v4, "setDisplayMode:", 1);
  -[CNContactViewController setDelegate:](v4, "setDelegate:", self);
  editingContactController = self->_editingContactController;
  self->_editingContactController = v4;
  v6 = v4;

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v6);
  objc_msgSend(v7, "setModalPresentationStyle:", 2);
  v8 = objc_alloc_init(MEMORY[0x1E0CC18B8]);
  objc_msgSend(MEMORY[0x1E0D26EB0], "moduleFromModuleType:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setAnalyticsModuleMetadata:", v9);
  -[MUPlaceViewController _presentModalViewController:withEnvironment:](self, "_presentModalViewController:withEnvironment:", v7, v8);

}

- (void)placeDescriptionSectionControllerDidTapAttribution:(id)a3
{
  void *v4;
  id v5;

  -[MUPlaceViewController mapItem](self, "mapItem", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_encyclopedicInfoAttribution");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceViewController _launchAttribution:withMapItem:](self, "_launchAttribution:withMapItem:", v4, v5);

}

- (void)_launchAttribution:(id)a3 withMapItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "attributionURLs");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[MUPlaceViewController placeViewFeedbackAppLaunchHandler](self, "placeViewFeedbackAppLaunchHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceViewController _launchAttributionURLs:withAttribution:mapItem:completionHandler:](self, "_launchAttributionURLs:withAttribution:mapItem:completionHandler:", v9, v7, v6, v8);

}

- (void)placeSectionControllerDidUpdateContent:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t initialAppearanceSignpostID;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  id v11;
  NSArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  MUScrollableStackView *contentStackView;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  os_signpost_id_t v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t v31[128];
  uint8_t buf[4];
  id v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  MUGetPlaceCardLog();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  initialAppearanceSignpostID = self->_initialAppearanceSignpostID;
  if (initialAppearanceSignpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_191DB8000, v6, OS_SIGNPOST_INTERVAL_BEGIN, initialAppearanceSignpostID, "PlacecardUpdateContent", ", buf, 2u);
  }

  MUGetPlaceCardLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v33 = v4;
    v34 = 2112;
    v35 = v10;
    _os_log_impl(&dword_191DB8000, v8, OS_LOG_TYPE_INFO, "%@ of type %@ requests update", buf, 0x16u);

  }
  v26 = v4;

  v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v12 = self->_sectionControllers;
  v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v28 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        if (objc_msgSend(v17, "hasContent"))
        {
          objc_msgSend(v17, "sectionViews");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "count");

          if (v19)
          {
            objc_msgSend(v17, "sectionViews");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "addObjectsFromArray:", v20);

          }
        }
      }
      v14 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v14);
  }

  contentStackView = self->_contentStackView;
  v22 = (void *)objc_msgSend(v11, "copy");
  -[MUScrollableStackView setArrangedSubviews:](contentStackView, "setArrangedSubviews:", v22);

  -[MUPlaceViewController _applyCustomSpacings](self, "_applyCustomSpacings");
  -[MUPlaceViewController showContentIfLoaded](self, "showContentIfLoaded");
  MUGetPlaceCardLog();
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = v23;
  v25 = self->_initialAppearanceSignpostID;
  if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_191DB8000, v24, OS_SIGNPOST_INTERVAL_END, v25, "PlacecardUpdateContent", ", buf, 2u);
  }

}

- (void)_applyCustomSpacings
{
  void *v3;
  NSUInteger v4;
  MUScrollableStackView *contentStackView;
  void *v6;
  id v7;

  if (MapKitIdiomIsMacCatalyst())
  {
    -[MUPlaceViewController headerSectionController](self, "headerSectionController");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[MUPlaceViewController actionRowSectionController](self, "actionRowSectionController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 && v3)
    {
      v4 = -[NSArray indexOfObject:](self->_sectionControllers, "indexOfObject:", v7);
      if (v4 + 1 == -[NSArray indexOfObject:](self->_sectionControllers, "indexOfObject:", v3))
      {
        contentStackView = self->_contentStackView;
        objc_msgSend(v7, "sectionView");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[MUScrollableStackView setCustomSpacing:afterView:](contentStackView, "setCustomSpacing:afterView:", v6, 8.0);

      }
    }

  }
}

- (void)placeSectionControllerRequestsLayoutChange:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[MUPlaceViewController placeViewControllerDelegate](self, "placeViewControllerDelegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[MUPlaceViewController placeViewControllerDelegate](self, "placeViewControllerDelegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "placeViewControllerDidUpdateHeight:", self);

  }
}

- (int)getPlaceCardTypeForAnalytics
{
  MUPlaceDataAvailability *v3;
  void *v4;
  MUPlaceDataAvailability *v5;
  void *v6;
  void *v7;
  char v8;
  int v9;
  void *v10;
  uint64_t v11;
  void *v12;
  char v13;
  void *v14;
  char v15;
  _BOOL4 v16;
  void *v17;
  void *v18;

  v3 = [MUPlaceDataAvailability alloc];
  -[MUPlaceViewController mapItem](self, "mapItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MUPlaceDataAvailability initWithMapItem:options:](v3, "initWithMapItem:options:", v4, self->_options);

  -[MUPlaceViewController placeItem](self, "placeItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mapItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "_hasFlyover");

  if ((v8 & 1) != 0)
  {
    v9 = 9;
  }
  else
  {
    -[MUPlaceViewController headerButtonsSectionController](self, "headerButtonsSectionController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "primaryButtonType");

    if (v11 == 2)
    {
      v9 = 10;
    }
    else
    {
      objc_msgSend(v6, "mapItem");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "_hasTransit");

      if ((v13 & 1) != 0)
      {
        v9 = 7;
      }
      else if ((objc_msgSend(v6, "options") & 1) != 0)
      {
        v9 = 5;
      }
      else if ((objc_msgSend(v6, "options") & 2) != 0)
      {
        v9 = 3;
      }
      else
      {
        objc_msgSend(v6, "mapItem");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "_isMapItemTypeBrand");

        if ((v15 & 1) != 0)
        {
          v9 = 11;
        }
        else
        {
          v16 = -[MUPlaceDataAvailability supportsBrowseCategory](v5, "supportsBrowseCategory");
          objc_msgSend(v6, "mapItem");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v17;
          if (v16)
          {
            v9 = objc_msgSend(v17, "_browseCategory_placeCardType");
          }
          else if (objc_msgSend(v17, "_hasMUID"))
          {
            v9 = 2;
          }
          else
          {
            v9 = 1;
          }

        }
      }
    }
  }

  return v9;
}

- (id)generateAvailableActionForAnalytics
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_sectionControllers;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "conformsToProtocol:", &unk_1EE252410, (_QWORD)v12))
        {
          objc_msgSend(v9, "infoCardChildPossibleActions");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v10, "count"))
            objc_msgSend(v3, "addObjectsFromArray:", v10);

        }
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)generateUnactionableUIElementsForAnalytics
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_sectionControllers;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "conformsToProtocol:", &unk_1EE252410, (_QWORD)v12))
        {
          objc_msgSend(v9, "infoCardChildUnactionableUIElements");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v10, "count"))
            objc_msgSend(v3, "addObjectsFromArray:", v10);

        }
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  return v3;
}

- (int)defaultTargetForPlaceCardAnalytics
{
  return 201;
}

- (void)placeCardWillCloseFromClientType:(unint64_t)a3
{
  -[MUPlaceCardAnalyticsController instrumentCloseUsingClientType:](self->_analyticsController, "instrumentCloseUsingClientType:", a3);
}

- (int)currentUITargetForAnalytics
{
  return 201;
}

- (int)currentMapViewTargetForAnalytics
{
  return 501;
}

- (void)setAutomobileOptions:(id)a3
{
  GEOAutomobileOptions *v5;
  GEOAutomobileOptions *v6;

  v5 = (GEOAutomobileOptions *)a3;
  if (self->_automobileOptions != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_automobileOptions, a3);
    -[MKETAProvider setAutomobileOptions:](self->_etaProvider, "setAutomobileOptions:", self->_automobileOptions);
    v5 = v6;
  }

}

- (void)setWalkingOptions:(id)a3
{
  GEOWalkingOptions *v5;
  GEOWalkingOptions *v6;

  v5 = (GEOWalkingOptions *)a3;
  if (self->_walkingOptions != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_walkingOptions, a3);
    -[MKETAProvider setWalkingOptions:](self->_etaProvider, "setWalkingOptions:", self->_walkingOptions);
    v5 = v6;
  }

}

- (void)setTransitOptions:(id)a3
{
  GEOTransitOptions *v5;
  GEOTransitOptions *v6;

  v5 = (GEOTransitOptions *)a3;
  if (self->_transitOptions != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_transitOptions, a3);
    -[MKETAProvider setTransitOptions:](self->_etaProvider, "setTransitOptions:", self->_transitOptions);
    v5 = v6;
  }

}

- (void)setCyclingOptions:(id)a3
{
  GEOCyclingOptions *v5;
  GEOCyclingOptions *v6;

  v5 = (GEOCyclingOptions *)a3;
  if (self->_cyclingOptions != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_cyclingOptions, a3);
    -[MKETAProvider setCyclingOptions:](self->_etaProvider, "setCyclingOptions:", self->_cyclingOptions);
    v5 = v6;
  }

}

- (void)setPlaceInCollections:(BOOL)a3
{
  self->_placeInCollections = a3;
  -[MUPlaceActionManager setPlaceInCollections:](self->_actionManager, "setPlaceInCollections:");
}

- (void)setPlaceInShortcuts:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL8 placeInShortcuts;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  self->_placeInShortcuts = a3;
  -[MUPlaceActionManager setPlaceInShortcuts:](self->_actionManager, "setPlaceInShortcuts:");
  if (v3)
  {
    placeInShortcuts = self->_placeInShortcuts;
    -[MUPlaceViewController webPlacecardSectionController](self, "webPlacecardSectionController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "configuration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPlaceInShortcuts:", placeInShortcuts);

    -[MUPlaceViewController webPlacecardSectionController](self, "webPlacecardSectionController");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "updateUserData");

  }
}

- (void)updateAddToLibraryActionState
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  -[MUPlaceViewController libraryAccessProvider](self, "libraryAccessProvider");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3
    && (v4 = (void *)v3,
        -[MUPlaceViewController libraryAccessProvider](self, "libraryAccessProvider"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "savedStateOfPlace"),
        v5,
        v4,
        v6))
  {
    -[MUPlaceViewController libraryAccessProvider](self, "libraryAccessProvider");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "savedStateOfPlace") == 1)
      v7 = 1;
    else
      v7 = 2;
    -[MUPlaceActionManager setPlaceInLibrary:](self->_actionManager, "setPlaceInLibrary:", v7);

  }
  else
  {
    -[MUPlaceActionManager setPlaceInLibrary:](self->_actionManager, "setPlaceInLibrary:", 0);
  }
}

- (void)updateAddNoteActionState
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;

  -[MUPlaceViewController libraryAccessProvider](self, "libraryAccessProvider");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3
    && (v4 = (void *)v3,
        -[MUPlaceViewController libraryAccessProvider](self, "libraryAccessProvider"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "savedStateOfPlace"),
        v5,
        v4,
        v6))
  {
    -[MUPlaceViewController libraryAccessProvider](self, "libraryAccessProvider");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "placeNote");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "length"))
      v8 = 1;
    else
      v8 = 2;
    -[MUPlaceActionManager setPlaceHasNote:](self->_actionManager, "setPlaceHasNote:", v8);

  }
  else
  {
    -[MUPlaceActionManager setPlaceHasNote:](self->_actionManager, "setPlaceHasNote:", 0);
  }
}

- (void)_placeSectionController:(id)a3 didSelectPrimaryType:(unint64_t)a4 withPresentationOptions:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  _QWORD v34[4];
  id v35;
  id v36;
  id location;
  _QWORD v38[5];
  uint64_t v39;
  uint64_t v40;
  _QWORD v41[2];
  _QWORD v42[2];
  _QWORD v43[3];

  v43[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  objc_msgSend(v9, "sourceView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  switch(a4)
  {
    case 1uLL:
      v11 = v8;
      v12 = 6003;
      v13 = 12;
      goto LABEL_8;
    case 2uLL:
      v11 = v8;
      v12 = 3001;
      goto LABEL_7;
    case 3uLL:
      v14 = objc_alloc_init(MEMORY[0x1E0CC18B8]);
      objc_msgSend(v14, "setSourceView:", v10);
      objc_msgSend(v8, "analyticsModule");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setAnalyticsModuleMetadata:", v15);

      -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_opt_respondsToSelector();

      if ((v17 & 1) != 0)
      {
        objc_initWeak(&location, self);
        -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v34[0] = MEMORY[0x1E0C809B0];
        v34[1] = 3221225472;
        v34[2] = __94__MUPlaceViewController__placeSectionController_didSelectPrimaryType_withPresentationOptions___block_invoke_2;
        v34[3] = &unk_1E2E01B68;
        objc_copyWeak(&v36, &location);
        v35 = v14;
        objc_msgSend(v18, "placeViewController:didSelectShareCurrentLocationWithCompletion:", self, v34);

        objc_destroyWeak(&v36);
        objc_destroyWeak(&location);
      }
      else
      {
        -[MUPlaceViewController _showShareSheetWithEnvironment:](self, "_showShareSheetWithEnvironment:", v14);
      }

      goto LABEL_18;
    case 4uLL:
      v11 = v8;
      v12 = 6097;
LABEL_7:
      v13 = 0;
LABEL_8:
      objc_msgSend(v11, "captureInfoCardAction:eventValue:feedbackType:", v12, 0, v13);
      -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_opt_respondsToSelector();

      if ((v20 & 1) != 0)
      {
        -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[MKETAProvider transportTypePreferenceNumber](self->_etaProvider, "transportTypePreferenceNumber");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "placeViewController:didSelectRouteToCurrentSearchResultWithTransportTypePreference:", self, v22);

LABEL_12:
        goto LABEL_18;
      }
      -[MUPlaceViewController placeViewControllerDelegate](self, "placeViewControllerDelegate");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_opt_respondsToSelector();

      if ((v24 & 1) != 0)
      {
        -[MUPlaceViewController placeViewControllerDelegate](self, "placeViewControllerDelegate");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "placeViewControllerDidSelectDirectionsToAddress:", self);
        goto LABEL_12;
      }
      -[MUPlaceViewController mapItem](self, "mapItem");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (v25)
      {
        if ((self->_options & 0x100000000) != 0)
        {
          -[MUPlaceViewController mapItem](self, "mapItem");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = *MEMORY[0x1E0CC15D8];
          v42[0] = *MEMORY[0x1E0CC1A80];
          v42[1] = v32;
          v43[0] = MEMORY[0x1E0C9AAB0];
          v43[1] = &unk_1E2E551D0;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, v42, 2);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v38[0] = MEMORY[0x1E0C809B0];
          v38[1] = 3221225472;
          v38[2] = __94__MUPlaceViewController__placeSectionController_didSelectPrimaryType_withPresentationOptions___block_invoke;
          v38[3] = &unk_1E2E01B00;
          v38[4] = self;
          objc_msgSend(v31, "openInMapsWithLaunchOptions:completionHandler:", v33, v38);

        }
        else
        {
          v26 = (void *)MEMORY[0x1E0CC1828];
          objc_msgSend(MEMORY[0x1E0CC1828], "mapItemForCurrentLocation");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v41[0] = v27;
          -[MUPlaceViewController mapItem](self, "mapItem");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v41[1] = v28;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 2);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = *MEMORY[0x1E0CC1598];
          v40 = *MEMORY[0x1E0CC1590];
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "openMapsWithItems:launchOptions:completionHandler:", v29, v30, &__block_literal_global_305);

        }
      }
LABEL_18:

      return;
    default:
      goto LABEL_18;
  }
}

void __94__MUPlaceViewController__placeSectionController_didSelectPrimaryType_withPresentationOptions___block_invoke(uint64_t a1, int a2)
{
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  const char *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  MUGetPlaceCardLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (a2)
  {
    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 32), "mapItem");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "name");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412290;
      v10 = v7;
      v8 = "Successfully launched Maps in SAR mode for mapItem: %@";
LABEL_6:
      _os_log_impl(&dword_191DB8000, v4, OS_LOG_TYPE_DEBUG, v8, (uint8_t *)&v9, 0xCu);

    }
  }
  else if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "mapItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412290;
    v10 = v7;
    v8 = "Failed to launched Maps in SAR mode for mapItem: %@";
    goto LABEL_6;
  }

}

void __94__MUPlaceViewController__placeSectionController_didSelectPrimaryType_withPresentationOptions___block_invoke_2(uint64_t a1, int a2)
{
  id WeakRetained;
  id v4;

  if (a2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    if (WeakRetained)
    {
      v4 = WeakRetained;
      objc_msgSend(WeakRetained, "_showShareSheetWithEnvironment:", *(_QWORD *)(a1 + 32));
      WeakRetained = v4;
    }

  }
}

- (void)_showShareSheetWithEnvironment:(id)a3
{
  id v4;
  MULockScreenCoordinator *lockScreenCoordinator;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  lockScreenCoordinator = self->_lockScreenCoordinator;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__MUPlaceViewController__showShareSheetWithEnvironment___block_invoke;
  v7[3] = &unk_1E2E01AB0;
  objc_copyWeak(&v9, &location);
  v6 = v4;
  v8 = v6;
  -[MULockScreenCoordinator performActionIfSuccessfullyAuthenticated:](lockScreenCoordinator, "performActionIfSuccessfullyAuthenticated:", v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __56__MUPlaceViewController__showShareSheetWithEnvironment___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_showShareSheetNoDeviceLockCheckWithEnvironment:", *(_QWORD *)(a1 + 32));
    WeakRetained = v3;
  }

}

- (void)_showShareSheetNoDeviceLockCheckWithEnvironment:(id)a3
{
  id v5;
  void *v6;
  MUShareSheetPresenter *v7;
  MUShareSheetPresenter *shareSheetPresenter;
  MUPresentationOptions *v9;

  objc_storeStrong((id *)&self->_currentEnvironmentForPresentedViewController, a3);
  v5 = a3;
  v9 = objc_alloc_init(MUPresentationOptions);
  -[MUPresentationOptions setPresentingViewController:](v9, "setPresentingViewController:", self);
  objc_msgSend(v5, "sourceView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPresentationOptions setSourceView:](v9, "setSourceView:", v6);

  v7 = -[MUShareSheetPresenter initWithPlaceItem:presentationOptions:]([MUShareSheetPresenter alloc], "initWithPlaceItem:presentationOptions:", self->_placeItem, v9);
  shareSheetPresenter = self->_shareSheetPresenter;
  self->_shareSheetPresenter = v7;

  -[MUShareSheetPresenter setDelegate:](self->_shareSheetPresenter, "setDelegate:", self);
  -[MUShareSheetPresenter present](self->_shareSheetPresenter, "present");

}

- (void)placeActionManager:(id)a3 didSelectShareWithEnvironment:(id)a4
{
  -[MUPlaceViewController _showShareSheetWithEnvironment:](self, "_showShareSheetWithEnvironment:", a4);
}

- (void)placeCardActionControllerDidSelectReportAProblem:(id)a3 fromView:(id)a4 isQuickAction:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  _QWORD v17[2];

  v5 = a5;
  v17[1] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "placeViewControllerDidSelectReportAProblem:fromView:isQuickAction:", self, v7, v5);

  }
  else
  {
    v11 = (void *)MEMORY[0x1E0CC1828];
    -[MUPlaceViewController mapItem](self, "mapItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *MEMORY[0x1E0CC15A8];
    v17[0] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "urlForMapItem:options:", v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CC1970], "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "openURL:completionHandler:", v14, 0);

  }
}

- (void)placeCardActionControllerDidSelectPlaceEnrichementReportAProblem
{
  void *v3;
  char v4;
  id v5;

  -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "placeViewControllerDidSelectPlaceEnrichmentRAP:", self);

  }
}

- (void)placeActionManager:(id)a3 didSelectDirectionsWithEnvironment:(id)a4
{
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(a4, "analyticsModuleMetadata", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "type") == 40)
    -[MUPlaceViewController placeEnrichmentSectionController](self, "placeEnrichmentSectionController");
  else
    -[MUPlaceViewController placeInfoSectionController](self, "placeInfoSectionController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_opt_new();
  -[MUPlaceViewController _placeSectionController:didSelectPrimaryType:withPresentationOptions:](self, "_placeSectionController:didSelectPrimaryType:withPresentationOptions:", v5, 1, v6);

}

- (void)placeActionManager:(id)a3 didSelectAddToGuidesWithEnvironment:(id)a4
{
  void *v5;
  char v6;
  void *v7;
  id v8;

  v8 = a4;
  -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "placeViewController:didSelectAddToCollectionWithPlaceActionEnvironment:", self, v8);

  }
}

- (void)placeActionManager:(id)a3 didSelectAddOrRemoveFromLibraryWithEnvironment:(id)a4 selectedAdd:(BOOL)a5
{
  _BOOL8 v5;
  void *v7;
  char v8;
  id v9;

  v5 = a5;
  -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate", a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "placeViewController:didRequestAddOrRemovePlaceFromLibrary:", self, v5);

  }
}

- (void)placeActionManager:(id)a3 didSelectAddOrEditNoteWithEnvironment:(id)a4 selectedAdd:(BOOL)a5
{
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  -[MUPlaceViewController libraryAccessProvider](self, "libraryAccessProvider", a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      -[MUPlaceViewController libraryAccessProvider](self, "libraryAccessProvider");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "placeNote");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[MUPlaceViewController libraryAccessProvider](self, "libraryAccessProvider");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "placeViewController:didRequestEditingNoteWithInitialText:libraryAccessProvider:completion:", self, v10, v11, &__block_literal_global_320);

    }
  }
}

- (void)placeCardActionController:(id)a3 openURL:(id)a4 fromView:(id)a5
{
  -[MUPlaceViewController _openWebURL:forcePunchout:](self, "_openWebURL:forcePunchout:", a4, 0, a5);
}

- (void)placeActionManager:(id)a3 didSelectAddToContactsUsingEnvironment:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  uint64_t v11;
  void *v12;
  MULockScreenCoordinator *lockScreenCoordinator;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD aBlock[4];
  id v18;
  id v19;
  id location;

  v6 = a3;
  v7 = a4;
  -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "placeViewControllerDidSelectAddToContacts:", self);

  }
  else
  {
    objc_initWeak(&location, self);
    v11 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __83__MUPlaceViewController_placeActionManager_didSelectAddToContactsUsingEnvironment___block_invoke;
    aBlock[3] = &unk_1E2E01AB0;
    objc_copyWeak(&v19, &location);
    v18 = v7;
    v12 = _Block_copy(aBlock);
    lockScreenCoordinator = self->_lockScreenCoordinator;
    v15[0] = v11;
    v15[1] = 3221225472;
    v15[2] = __83__MUPlaceViewController_placeActionManager_didSelectAddToContactsUsingEnvironment___block_invoke_4;
    v15[3] = &unk_1E2E017C8;
    v14 = v12;
    v16 = v14;
    -[MULockScreenCoordinator performActionIfSuccessfullyAuthenticated:](lockScreenCoordinator, "performActionIfSuccessfullyAuthenticated:", v15);

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }

}

void __83__MUPlaceViewController_placeActionManager_didSelectAddToContactsUsingEnvironment___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id *v12;
  id *v13;
  uint64_t v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "contact");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contactStore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "hasContactAccess");

    objc_msgSend(v4, "contactStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v5, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = MEMORY[0x1E0C80D38];
      v11 = MEMORY[0x1E0C80D38];
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __83__MUPlaceViewController_placeActionManager_didSelectAddToContactsUsingEnvironment___block_invoke_2;
      v19[3] = &unk_1E2E01BD0;
      v12 = &v22;
      objc_copyWeak(&v22, v2);
      v20 = v5;
      v21 = *(id *)(a1 + 32);
      objc_msgSend(v8, "fetchUnifiedContactForIdentifier:callbackQueue:completion:", v9, v10, v19);
      v13 = &v20;

      v8 = v21;
    }
    else
    {
      v14 = MEMORY[0x1E0C80D38];
      v15 = MEMORY[0x1E0C80D38];
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __83__MUPlaceViewController_placeActionManager_didSelectAddToContactsUsingEnvironment___block_invoke_3;
      v16[3] = &unk_1E2E01BF8;
      v12 = &v18;
      objc_copyWeak(&v18, v2);
      v17 = *(id *)(a1 + 32);
      objc_msgSend(v8, "removeMapsDataFromContact:callbackQueue:completion:", v5, v14, v16);
      v13 = &v17;

    }
    objc_destroyWeak(v12);

  }
}

void __83__MUPlaceViewController_placeActionManager_didSelectAddToContactsUsingEnvironment___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6;
  void **WeakRetained;
  void **v8;
  void **v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a2;
  v6 = a3;
  WeakRetained = (void **)objc_loadWeakRetained((id *)(a1 + 48));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    v9 = WeakRetained + 144;
    objc_storeStrong(WeakRetained + 144, a2);
    if (v6 && objc_msgSend(v6, "code") == 200)
    {
      v10 = objc_msgSend(*(id *)(a1 + 32), "copy");
      v11 = *v9;
      *v9 = (void *)v10;

    }
    objc_msgSend(v8, "_presentAddNewContactPickerForContact:withEnvironment:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  }

}

void __83__MUPlaceViewController_placeActionManager_didSelectAddToContactsUsingEnvironment___block_invoke_3(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "_presentAddNewContactPickerForContact:withEnvironment:", v5, *(_QWORD *)(a1 + 32));

}

uint64_t __83__MUPlaceViewController_placeActionManager_didSelectAddToContactsUsingEnvironment___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_presentAddNewContactPickerForContact:(id)a3 withEnvironment:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char IsMacCatalyst;
  void *v12;
  void *v13;
  char v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id location;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C974D8], "viewControllerForNewContact:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDisplayMode:", 1);
  objc_msgSend(v8, "setDelegate:", self);
  objc_storeStrong((id *)&self->_creatingContactController, v8);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v8);
  objc_msgSend(v9, "setModalPresentationStyle:", 2);
  objc_msgSend(MEMORY[0x1E0CC1970], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v10, "userInterfaceIdiom"))
  {
LABEL_8:

    goto LABEL_9;
  }
  IsMacCatalyst = MapKitIdiomIsMacCatalyst();

  if ((IsMacCatalyst & 1) == 0)
  {
    objc_msgSend(v9, "setModalPresentationStyle:", 7);
    objc_msgSend(v9, "popoverPresentationController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sourceView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v10, "setBarButtonItem:", v12);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v10, "setSourceView:", v12);
        objc_msgSend(v12, "bounds");
        objc_msgSend(v10, "setSourceRect:");
      }
    }
    objc_msgSend(v10, "setPermittedArrowDirections:", 15);

    goto LABEL_8;
  }
LABEL_9:
  if (MapKitIdiomIsMacCatalyst()
    && (-[MUPlaceViewController placeViewControllerDelegate](self, "placeViewControllerDelegate"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v14 = objc_opt_respondsToSelector(),
        v13,
        (v14 & 1) != 0))
  {
    objc_initWeak(&location, self);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __79__MUPlaceViewController__presentAddNewContactPickerForContact_withEnvironment___block_invoke;
    v15[3] = &unk_1E2E01AB0;
    objc_copyWeak(&v17, &location);
    v16 = v9;
    -[MUPlaceViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v15);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  else
  {
    -[MUPlaceViewController _presentModalViewController:withEnvironment:](self, "_presentModalViewController:withEnvironment:", v9, v7);
  }

}

void __79__MUPlaceViewController__presentAddNewContactPickerForContact_withEnvironment___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "mapsAppDelegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "placeViewControllerPresentContactsController:", *(_QWORD *)(a1 + 32));

    WeakRetained = v4;
  }

}

- (void)placeCardActionControllerDidSelectAddToMapsHome:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "placeViewControllerDidSelectAddShortcut:", self);

  }
}

- (void)placeCardActionControllerDidSelectRemoveFromMapsHome:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "placeViewControllerDidSelectRemoveShortcut:", self);

  }
}

- (void)placeCardActionControllerDidSelectRefineLocation:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "placeViewControllerDidSelectRefineLocation:", self);

  }
}

- (void)placeCardActionControllerDidSelectChangeAddress:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "placeViewControllerDidSelectChangeAddress:", self);

  }
}

- (void)placeCardActionControllerDidSelectAddPhoto:(id)a3 presentingViewController:(id)a4 sourceView:(id)a5
{
  id v7;
  MUPresentationOptions *v8;
  id v9;

  v9 = a5;
  v7 = a4;
  v8 = objc_alloc_init(MUPresentationOptions);
  -[MUPresentationOptions setSourceView:](v8, "setSourceView:", v9);
  -[MUPresentationOptions setPresentingViewController:](v8, "setPresentingViewController:", v7);

  if (objc_msgSend(v9, "conformsToProtocol:", &unk_1EE269908))
    -[MUPresentationOptions setProgressObserver:](v8, "setProgressObserver:", v9);
  -[MUPlaceViewController presentAddPhotosWithPresentationOptions:entryPoint:originTarget:](self, "presentAddPhotosWithPresentationOptions:entryPoint:originTarget:", v8, 0, 0);

}

- (void)placeActionManager:(id)a3 didSelectAddToExistingContactWithEnvironment:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  MULockScreenCoordinator *lockScreenCoordinator;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD aBlock[4];
  id v19;
  id v20;
  id v21;
  id location;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "sourceView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v9 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __89__MUPlaceViewController_placeActionManager_didSelectAddToExistingContactWithEnvironment___block_invoke;
  aBlock[3] = &unk_1E2E01610;
  objc_copyWeak(&v21, &location);
  v10 = v8;
  v19 = v10;
  v11 = v7;
  v20 = v11;
  v12 = _Block_copy(aBlock);
  lockScreenCoordinator = self->_lockScreenCoordinator;
  v15[0] = v9;
  v15[1] = 3221225472;
  v15[2] = __89__MUPlaceViewController_placeActionManager_didSelectAddToExistingContactWithEnvironment___block_invoke_2;
  v15[3] = &unk_1E2E01C20;
  objc_copyWeak(&v17, &location);
  v14 = v12;
  v16 = v14;
  -[MULockScreenCoordinator performActionIfSuccessfullyAuthenticated:](lockScreenCoordinator, "performActionIfSuccessfullyAuthenticated:", v15);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

}

void __89__MUPlaceViewController_placeActionManager_didSelectAddToExistingContactWithEnvironment___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  id v11;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v11 = WeakRetained;
    v3 = objc_alloc_init(MEMORY[0x1E0C974B0]);
    objc_msgSend(v3, "setDelegate:", v11);
    objc_msgSend(v11, "contactStore");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "hasContactAccess"))
      v5 = 2;
    else
      v5 = 1;
    objc_msgSend(v3, "setMode:", v5);

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setPredicateForSelectionOfContact:", v6);

    objc_msgSend(v3, "setModalPresentationStyle:", 2);
    objc_msgSend(MEMORY[0x1E0CC1970], "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "userInterfaceIdiom");

    if (v8)
    {
      objc_msgSend(v3, "setModalPresentationStyle:", 7);
      objc_msgSend(v3, "popoverPresentationController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v9, "setBarButtonItem:", *(_QWORD *)(a1 + 32));
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v9, "setSourceView:", *(_QWORD *)(a1 + 32));
          objc_msgSend(*(id *)(a1 + 32), "bounds");
          objc_msgSend(v9, "setSourceRect:");
        }
      }
      objc_msgSend(v9, "setPermittedArrowDirections:", 15);

    }
    objc_msgSend(v3, "setAutocloses:", 0);
    objc_msgSend(v11, "_presentModalViewController:withEnvironment:", v3, *(_QWORD *)(a1 + 40));
    objc_msgSend(v11, "contact");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "scrollToClosestContactMatching:", v10);

    WeakRetained = v11;
  }

}

void __89__MUPlaceViewController_placeActionManager_didSelectAddToExistingContactWithEnvironment___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    WeakRetained = v3;
  }

}

- (void)placeCardActionControllerDidSelectRemoveMarker:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "placeViewControllerDidSelectRemoveMarker:", self);

  }
}

- (void)placeCardActionControllerDidSelectReportAProblemAddNewPlace:(id)a3 isQuickAction:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  char v7;
  id v8;

  v4 = a4;
  -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "placeViewControllerDidSelectAddAPlace:isQuickAction:", self, v4);

  }
}

- (void)placeCardActionControllerDidSelectReportAProblemViewReport:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "placeViewControllerDidSelectRAPViewReport:", self);

  }
}

- (void)placeCardActionControllerDidSelectDownloadOffline:(id)a3 isQuickAction:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  char v7;
  id v8;

  v4 = a4;
  -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "placeViewControllerDidSelectDownloadOffline:isQuickAction:", self, v4);

  }
}

- (void)placeCardActionControllerDidSelectPauseOfflineDownload:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "placeViewControllerDidSelectPauseOfflineDownload:", self);

  }
}

- (void)placeCardActionControllerDidSelectOfflineManagement:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "placeViewControllerDidSelectOfflineManagement:", self);

  }
}

- (void)placeCardActionControllerDidRequestCopy:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "placeViewControllerDidRequestCopy:", self);

  }
}

- (void)placeCardActionControllerDidSelectSimulateLocation:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  int v11;
  id v12;
  void *v18;
  id v19;
  int v20;
  double v21;
  double v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  double v30;
  double v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  int v35;
  uint64_t v36;
  uint64_t v37;

  objc_msgSend(MEMORY[0x1E0D27368], "sharedPlatform", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isInternalInstall");

  if (v5)
  {
    -[MUPlaceViewController mapItem](self, "mapItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_coordinate");
    v8 = v7;
    v10 = v9;

    if (v10 >= -180.0 && v10 <= 180.0 && v8 >= -90.0 && v8 <= 90.0)
    {
      if (objc_msgSend(MEMORY[0x1E0D27178], "isLocationShiftRequiredForCoordinate:", v8, v10))
        v11 = 2;
      else
        v11 = 1;
      v12 = objc_alloc(MEMORY[0x1E0C9E3B8]);
      v20 = 0;
      v21 = v8;
      v22 = v10;
      v23 = 0x4014000000000000;
      v24 = 0u;
      v25 = 0u;
      __asm { FMOV            V0.2D, #-1.0 }
      v26 = _Q0;
      v27 = 0;
      v28 = 0;
      v29 = 0x100000000;
      v30 = v8;
      v31 = v10;
      v32 = 0;
      v33 = 0;
      v34 = v11;
      v35 = v11;
      v37 = 0;
      v36 = 0;
      v18 = (void *)objc_msgSend(v12, "initWithClientLocation:", &v20);
      v19 = objc_alloc_init(MEMORY[0x1E0C9E418]);
      objc_msgSend(v19, "setLocationRepeatBehavior:", 1);
      objc_msgSend(v19, "clearSimulatedLocations");
      objc_msgSend(v19, "appendSimulatedLocation:", v18);
      objc_msgSend(v19, "startLocationSimulation");

    }
  }
}

- (void)placeCardActionControllerDidSelectCreateCustomRoute:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "placeViewControllerDidTapHikingTip:", self);

  }
}

- (void)pictureItemSectionController:(id)a3 requestsSceneActivationWithPhotoGallery:(id)a4
{
  void *v5;
  char v6;
  void *v7;
  id v8;

  v8 = a4;
  -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "placeViewController:didRequestSceneActivationForPhotoGalleryViewController:", self, v8);

  }
}

- (void)browseCategorySectionController:(id)a3 didTapOnSearchCategory:(id)a4
{
  void *v5;
  char v6;
  void *v7;
  id v8;

  v8 = a4;
  -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "placeViewController:didSelectSearchCategory:", self, v8);

  }
}

- (void)placePhotoSectionControllerRequestsToOpenThumbnailGallery:(id)a3 withStartingIndex:(unint64_t)a4
{
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "placeViewControllerDidSelectSeeMorePhotos:withStartingIndex:", self, a4);

  }
  else
  {
    v8 = (void *)MEMORY[0x1E0CC1828];
    -[MUPlaceViewController mapItem](self, "mapItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *MEMORY[0x1E0CC15A0];
    v14 = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "openMapsWithItems:launchOptions:completionHandler:", v10, v11, 0);

  }
}

- (void)placePhotoSectionController:(id)a3 requestsToOpenPhotoAttribution:(id)a4 presentationOptions:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a5;
  v7 = a4;
  objc_msgSend(v13, "presentingViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    objc_msgSend(v13, "setPresentingViewController:", self);
  -[MUPlaceViewController mapItem](self, "mapItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "providerID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "attributionURLs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "presentingViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceViewController _presentStoreProductScreenWithMapItem:attribution:bundleIdentifier:attributionURLs:presentingViewController:](self, "_presentStoreProductScreenWithMapItem:attribution:bundleIdentifier:attributionURLs:presentingViewController:", v9, v7, v10, v11, v12);

}

- (void)placePhotoSectionController:(id)a3 requestsAddPhotosToMapsWithEntryPoint:(int64_t)a4 options:(id)a5
{
  void *v7;
  id v8;

  v8 = a5;
  objc_msgSend(v8, "presentingViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    objc_msgSend(v8, "setPresentingViewController:", self);
  -[MUPlaceViewController presentAddPhotosWithPresentationOptions:entryPoint:originTarget:](self, "presentAddPhotosWithPresentationOptions:entryPoint:originTarget:", v8, a4, CFSTR("PLACECARD_PHOTO_VIEWER_GALLERY"));

}

- (BOOL)transitDeparturesSectionController:(id)a3 canSelectDepartureSequence:(id)a4 usingMapItem:(id)a5
{
  id v7;
  id v8;
  void *v9;
  char v10;
  void *v11;
  char v12;

  v7 = a4;
  v8 = a5;
  -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "placeViewController:canSelectDepartureSequence:mapItem:", self, v7, v8);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)transitDeparturesSectionController:(id)a3 didSelectConnectionInformation:(id)a4
{
  id v5;
  void *v6;
  char v7;
  uint64_t v8;
  id v9;

  v5 = a4;
  -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "placeViewController:didSelectTransitConnectionInformation:", self, v5);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CC1970], "sharedInstance");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "urlToOpen");
    v8 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "openURL:completionHandler:", v8, 0);
    v5 = (id)v8;
  }

}

- (void)transitDeparturesSectionController:(id)a3 didSelectDepartureSequence:(id)a4 usingMapItem:(id)a5
{
  id v7;
  void *v8;
  char v9;
  void *v10;
  id v11;

  v11 = a4;
  v7 = a5;
  -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "placeViewController:didSelectDepartureSequence:mapItem:", self, v11, v7);

  }
}

- (void)transitDeparturesSectionController:(id)a3 didSelectTransitLine:(id)a4 usingPresentationOptions:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  _QWORD v38[4];
  id v39;
  _QWORD v40[4];
  id v41;
  id v42;
  _QWORD v43[4];
  id v44;
  id v45;
  id location[2];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_opt_respondsToSelector();

  if ((v15 & 1) != 0)
  {
    if (MapKitIdiomIsMacCatalyst())
    {
      -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "placeViewController:didSelectTransitLine:", self, v11);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", 0, 0, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "sourceView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "popoverPresentationController");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setSourceView:", v17);

      objc_msgSend(v12, "sourceRect");
      v20 = v19;
      v22 = v21;
      v24 = v23;
      v26 = v25;
      objc_msgSend(v16, "popoverPresentationController");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setSourceRect:", v20, v22, v24, v26);

      objc_initWeak(location, self);
      v28 = (void *)MEMORY[0x1E0DC3448];
      _MULocalizedStringFromThisBundle(CFSTR("View on Map [Placecard]"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = MEMORY[0x1E0C809B0];
      v43[0] = MEMORY[0x1E0C809B0];
      v43[1] = 3221225472;
      v43[2] = __117__MUPlaceViewController_transitDeparturesSectionController_didSelectTransitLine_usingPresentationOptions_completion___block_invoke;
      v43[3] = &unk_1E2E01C48;
      objc_copyWeak(&v45, location);
      v44 = v11;
      objc_msgSend(v28, "actionWithTitle:style:handler:", v29, 0, v43);
      v31 = objc_claimAutoreleasedReturnValue();

      v32 = (void *)MEMORY[0x1E0DC3448];
      _MULocalizedStringFromThisBundle(CFSTR("Cancel [Placeecard]"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v40[0] = v30;
      v40[1] = 3221225472;
      v40[2] = __117__MUPlaceViewController_transitDeparturesSectionController_didSelectTransitLine_usingPresentationOptions_completion___block_invoke_2;
      v40[3] = &unk_1E2E01C70;
      objc_copyWeak(&v42, location);
      v41 = v13;
      v38[0] = v30;
      v38[1] = 3221225472;
      v38[2] = __117__MUPlaceViewController_transitDeparturesSectionController_didSelectTransitLine_usingPresentationOptions_completion___block_invoke_3;
      v38[3] = &unk_1E2E01C98;
      v39 = v41;
      objc_msgSend(v32, "_actionWithTitle:image:style:handler:shouldDismissHandler:", v33, 0, 1, v40, v38);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      v35 = (void *)v31;
      objc_msgSend(v16, "addAction:", v31);
      objc_msgSend(v16, "addAction:", v34);
      v36 = objc_alloc_init(MEMORY[0x1E0CC18B8]);
      objc_msgSend(MEMORY[0x1E0D26EB0], "moduleFromModuleType:", 6);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setAnalyticsModuleMetadata:", v37);

      -[MUPlaceViewController _presentModalViewController:withEnvironment:](self, "_presentModalViewController:withEnvironment:", v16, v36);
      objc_destroyWeak(&v42);

      objc_destroyWeak(&v45);
      objc_destroyWeak(location);
    }

  }
}

void __117__MUPlaceViewController_transitDeparturesSectionController_didSelectTransitLine_usingPresentationOptions_completion___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  id *v4;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained[176], "infoCardAnalyticsDidSelectAction:eventValue:feedbackDelegateSelector:", 7004, 0, 0);
    objc_msgSend(v4, "mapsAppDelegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "placeViewController:didSelectTransitLine:", v4, *(_QWORD *)(a1 + 32));

    WeakRetained = v4;
  }

}

void __117__MUPlaceViewController_transitDeparturesSectionController_didSelectTransitLine_usingPresentationOptions_completion___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained[176], "infoCardAnalyticsDidSelectAction:eventValue:feedbackDelegateSelector:", 7005, 0, 0);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    WeakRetained = v3;
  }

}

uint64_t __117__MUPlaceViewController_transitDeparturesSectionController_didSelectTransitLine_usingPresentationOptions_completion___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return 1;
}

- (void)transitDeparturesSectionController:(id)a3 showIncidents:(id)a4
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;

  v5 = a4;
  -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "placeViewController:showTransitIncidents:", self, v5);
  }
  else
  {
    v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CC17E0]), "initWithTransitIncidents:", v5);

    v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v12);
    objc_msgSend(v5, "setModalPresentationStyle:", -2);
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 0, self, sel__dismissModalViewController);
    objc_msgSend(v12, "navigationItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setLeftBarButtonItem:", v8);

    v10 = objc_alloc_init(MEMORY[0x1E0CC18B8]);
    objc_msgSend(MEMORY[0x1E0D26EB0], "moduleFromModuleType:", 6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAnalyticsModuleMetadata:", v11);

    -[MUPlaceViewController _presentModalViewController:withEnvironment:](self, "_presentModalViewController:withEnvironment:", v5, v10);
  }

}

- (void)transitDeparturesSectionController:(id)a3 didSelectAttribution:(id)a4
{
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a4, "url", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v7 = v5;
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUPlaceViewController _openWebURL:forcePunchout:](self, "_openWebURL:forcePunchout:", v6, 0);

    v5 = v7;
  }

}

- (id)_traits
{
  void *v3;
  char v4;
  void *v5;
  void *v6;

  -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "traitsForPlaceViewController:", self);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CC1848], "sharedService");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "defaultTraits");
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_presentModalViewController:(id)a3 withEnvironment:(id)a4
{
  id v6;

  objc_storeStrong((id *)&self->_currentEnvironmentForPresentedViewController, a4);
  v6 = a3;
  -[MUPlaceViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, 0);

}

- (void)_dismissModalViewController
{
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  uint64_t v7;
  id v8;

  LODWORD(v7) = 0;
  -[MUPlaceCardAnalyticsController infoCardAnalyticsDidSelectAction:target:eventValue:actionURL:photoID:moduleMetadata:feedbackDelegateSelector:actionRichProviderId:](self->_analyticsController, "infoCardAnalyticsDidSelectAction:target:eventValue:actionURL:photoID:moduleMetadata:feedbackDelegateSelector:actionRichProviderId:", 4, 628, 0, 0, 0, 0, v7, 0);
  -[MUPlaceViewController presentedViewController](self, "presentedViewController");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v8 = (id)v3;
    -[MUPlaceViewController presentedViewController](self, "presentedViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isBeingDismissed"))
    {

    }
    else
    {
      -[MUPlaceViewController presentedViewController](self, "presentedViewController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "isBeingPresented");

      if ((v6 & 1) == 0)
        -[MUPlaceViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
    }
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[MUScrollViewImpressionsCalculator logImpressions](self->_impressionsCalculator, "logImpressions");
  -[MUPlaceViewController scrollViewDelegate](self, "scrollViewDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[MUPlaceViewController scrollViewDelegate](self, "scrollViewDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "scrollViewDidScroll:", v7);

  }
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  CGFloat v4;
  CGFloat v5;
  void *v6;
  char v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "contentOffset");
  self->_beginAnalyticsScrollingPoint.x = v4;
  self->_beginAnalyticsScrollingPoint.y = v5;
  -[MUPlaceViewController scrollViewDelegate](self, "scrollViewDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[MUPlaceViewController scrollViewDelegate](self, "scrollViewDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "scrollViewWillBeginDragging:", v9);

  }
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y;
  double x;
  void *v9;
  char v10;
  void *v11;
  id v12;

  y = a4.y;
  x = a4.x;
  v12 = a3;
  -[MUPlaceCardAnalyticsController instrumentVerticalScrollWithBeginningPoint:targetContentOffset:velocity:](self->_analyticsController, "instrumentVerticalScrollWithBeginningPoint:targetContentOffset:velocity:", a5, self->_beginAnalyticsScrollingPoint.x, self->_beginAnalyticsScrollingPoint.y, x, y);
  -[MUPlaceViewController scrollViewDelegate](self, "scrollViewDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    -[MUPlaceViewController scrollViewDelegate](self, "scrollViewDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "scrollViewWillEndDragging:withVelocity:targetContentOffset:", v12, a5, x, y);

  }
}

- (void)contactViewController:(id)a3 didCompleteWithContact:(id)a4
{
  CNContactViewController *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  CNContact *originalContactCopy;
  void *v14;
  uint64_t v15;
  id v16;
  id *v17;
  CNContactViewController *v18;
  CNContactViewController *v19;
  void *v20;
  uint64_t v21;
  id v22;
  _QWORD v23[4];
  CNContactViewController *v24;
  id v25;
  _QWORD v26[4];
  CNContactViewController *v27;
  MUPlaceViewController *v28;
  id v29;
  _QWORD v30[4];
  CNContactViewController *v31;
  id v32;
  id location;

  v6 = (CNContactViewController *)a3;
  v7 = a4;
  v8 = v7;
  if (self->_editingContactController == v6)
  {
    if (v7)
    {
      objc_initWeak(&location, self);
      -[MUPlaceViewController contactStore](self, "contactStore");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = MEMORY[0x1E0C80D38];
      v11 = MEMORY[0x1E0C80D38];
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __70__MUPlaceViewController_contactViewController_didCompleteWithContact___block_invoke;
      v30[3] = &unk_1E2E01BF8;
      objc_copyWeak(&v32, &location);
      v31 = v6;
      objc_msgSend(v9, "removeMapsDataFromContact:callbackQueue:completion:", v8, v10, v30);

      objc_destroyWeak(&v32);
      objc_destroyWeak(&location);
    }
    goto LABEL_9;
  }
  if (!v7)
  {
LABEL_6:
    -[MUPlaceCardAnalyticsController infoCardAnalyticsDidSelectAction:target:eventValue:feedbackDelegateSelector:actionRichProviderId:](self->_analyticsController, "infoCardAnalyticsDidSelectAction:target:eventValue:feedbackDelegateSelector:actionRichProviderId:", 4, 624, 0, 0, 0);
LABEL_9:
    -[MUPlaceViewController _tearDownContactPickersForCompletionWithViewController:](self, "_tearDownContactPickersForCompletionWithViewController:", v6);
    goto LABEL_10;
  }
  -[MUPlaceCardAnalyticsController infoCardAnalyticsDidSelectAction:target:eventValue:feedbackDelegateSelector:actionRichProviderId:](self->_analyticsController, "infoCardAnalyticsDidSelectAction:target:eventValue:feedbackDelegateSelector:actionRichProviderId:", 17, 624, 0, 0, 0);
  if (self->_creatingContactController != v6)
  {
    if (self->_updatingContactController != v6)
    {
      -[MUPlaceViewController setShowContactActions:](self, "setShowContactActions:", 1);
      -[MUPlaceViewController _tearDownContactPickersForCompletionWithViewController:](self, "_tearDownContactPickersForCompletionWithViewController:", v6);
      goto LABEL_6;
    }
    objc_initWeak(&location, self);
    -[MUPlaceViewController contactStore](self, "contactStore");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = MEMORY[0x1E0C80D38];
    v22 = MEMORY[0x1E0C80D38];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __70__MUPlaceViewController_contactViewController_didCompleteWithContact___block_invoke_4;
    v23[3] = &unk_1E2E01BF8;
    v17 = &v25;
    objc_copyWeak(&v25, &location);
    v24 = v6;
    objc_msgSend(v20, "removeMapsDataFromContact:callbackQueue:completion:", v8, v21, v23);

    v19 = v24;
LABEL_15:

    objc_destroyWeak(v17);
    objc_destroyWeak(&location);
    goto LABEL_10;
  }
  -[MUPlaceViewController contactStore](self, "contactStore");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v12, "hasContactAccess"))
  {

    goto LABEL_10;
  }
  originalContactCopy = self->_originalContactCopy;

  if (originalContactCopy)
  {
    objc_initWeak(&location, self);
    -[MUPlaceViewController contactStore](self, "contactStore");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = MEMORY[0x1E0C80D38];
    v16 = MEMORY[0x1E0C80D38];
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __70__MUPlaceViewController_contactViewController_didCompleteWithContact___block_invoke_2;
    v26[3] = &unk_1E2E01BD0;
    v17 = &v29;
    objc_copyWeak(&v29, &location);
    v18 = v6;
    v27 = v18;
    v28 = self;
    objc_msgSend(v14, "fetchContactForPickerDisplayUsingContact:callbackQueue:completion:", v8, v15, v26);

    -[MUPlaceViewController setShowContactActions:](self, "setShowContactActions:", 0);
    -[MUPlaceViewController _tearDownContactPickersForCompletionWithViewController:](self, "_tearDownContactPickersForCompletionWithViewController:", v18);
    v19 = v27;
    goto LABEL_15;
  }
LABEL_10:

}

void __70__MUPlaceViewController_contactViewController_didCompleteWithContact___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  v9 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = (void *)*((_QWORD *)WeakRetained + 136);
    *((_QWORD *)WeakRetained + 136) = 0;

    objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, 0);
    objc_msgSend(v4, "contactsNavigationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (id)objc_msgSend(v6, "popViewControllerAnimated:", 0);

    objc_msgSend(v4, "contactsNavigationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "showCardForContact:animated:", v9, 0);

    objc_msgSend(v4, "_tearDownContactPickersForCompletionWithViewController:", *(_QWORD *)(a1 + 32));
  }

}

void __70__MUPlaceViewController_contactViewController_didCompleteWithContact___block_invoke_2(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id *WeakRetained;
  id *v8;
  void *v9;
  uint64_t v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  WeakRetained = (id *)objc_loadWeakRetained(a1 + 6);
  v8 = WeakRetained;
  if (WeakRetained)
  {
    if (v6 || (objc_msgSend(WeakRetained[144], "_maps_isEqualToContact:", v5) & 1) != 0)
    {
      objc_msgSend(v8, "setShowContactActions:", 0);
      objc_msgSend(v8, "_tearDownContactPickersForCompletionWithViewController:", a1[4]);
    }
    else
    {
      objc_msgSend(a1[5], "contactStore");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = MEMORY[0x1E0C80D38];
      v11 = MEMORY[0x1E0C80D38];
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __70__MUPlaceViewController_contactViewController_didCompleteWithContact___block_invoke_3;
      v12[3] = &unk_1E2E01BF8;
      objc_copyWeak(&v14, a1 + 6);
      v13 = a1[4];
      objc_msgSend(v9, "removeMapsDataFromContact:callbackQueue:completion:", v5, v10, v12);

      objc_destroyWeak(&v14);
    }
  }

}

void __70__MUPlaceViewController_contactViewController_didCompleteWithContact___block_invoke_3(uint64_t a1, void *a2)
{
  id *WeakRetained;
  id *v5;
  id v6;

  v6 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_storeStrong(WeakRetained + 126, a2);
    objc_msgSend(v5, "setShowContactActions:", 0);
    objc_msgSend(v5, "_tearDownContactPickersForCompletionWithViewController:", *(_QWORD *)(a1 + 32));
  }

}

void __70__MUPlaceViewController_contactViewController_didCompleteWithContact___block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "setShowContactActions:", 1);
    objc_msgSend(v3, "_tearDownContactPickersForCompletionWithViewController:", *(_QWORD *)(a1 + 32));
    WeakRetained = v3;
  }

}

- (void)_tearDownContactPickersForCompletionWithViewController:(id)a3
{
  id v4;
  CNContactViewController *editingContactController;
  CNContactViewController *updatingContactController;
  CNContactViewController *creatingContactController;
  void *v8;
  int v9;
  void *v10;
  char v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id location;

  v4 = a3;
  editingContactController = self->_editingContactController;
  self->_editingContactController = 0;

  updatingContactController = self->_updatingContactController;
  self->_updatingContactController = 0;

  creatingContactController = self->_creatingContactController;
  self->_creatingContactController = 0;

  objc_msgSend(MEMORY[0x1E0CC1970], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "userInterfaceIdiom");

  if (v9
    && MapKitIdiomIsMacCatalyst()
    && (-[MUPlaceViewController placeViewControllerDelegate](self, "placeViewControllerDelegate"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_opt_respondsToSelector(),
        v10,
        (v11 & 1) != 0))
  {
    objc_initWeak(&location, self);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __80__MUPlaceViewController__tearDownContactPickersForCompletionWithViewController___block_invoke;
    v12[3] = &unk_1E2E01610;
    objc_copyWeak(&v14, &location);
    v12[4] = self;
    v13 = v4;
    objc_msgSend(v13, "dismissViewControllerAnimated:completion:", 1, v12);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  else
  {
    objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, 0);
  }

}

void __80__MUPlaceViewController__tearDownContactPickersForCompletionWithViewController___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(*(id *)(a1 + 32), "mapsAppDelegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "placeViewControllerContactsDidComplete:", *(_QWORD *)(a1 + 40));

    WeakRetained = v4;
  }

}

- (void)contactViewController:(id)a3 didDeleteContact:(id)a4
{
  CNContactViewController *v5;
  CNContactViewController *editingContactController;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  CNContactViewController *v11;

  v5 = (CNContactViewController *)a3;
  if (self->_editingContactController == v5)
  {
    v11 = v5;
    -[CNContactViewController dismissViewControllerAnimated:completion:](v5, "dismissViewControllerAnimated:completion:", 1, 0);
    editingContactController = self->_editingContactController;
    self->_editingContactController = 0;

    -[MUPlaceViewController contactsNavigationController](self, "contactsNavigationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_respondsToSelector();

    v5 = v11;
    if ((v8 & 1) != 0)
    {
      -[MUPlaceViewController contactsNavigationController](self, "contactsNavigationController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[MUPlaceViewController _contactForEditOperations](self, "_contactForEditOperations");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "contactViewController:didDeleteContact:", v11, v10);

      v5 = v11;
    }
  }

}

- (void)contactPickerDidCancel:(id)a3
{
  objc_msgSend(a3, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)contactPicker:(id)a3 didSelectContact:(id)a4
{
  id v6;
  void *v7;
  int v8;
  id v9;

  v6 = a4;
  v9 = a3;
  -[MUPlaceViewController contactStore](self, "contactStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hasContactAccess");

  if (v8)
    -[MUPlaceViewController _authorized_contactPicker:didSelectContact:](self, "_authorized_contactPicker:didSelectContact:", v9, v6);
  else
    -[MUPlaceViewController _unauthorized_contactPicker:didSelectContact:](self, "_unauthorized_contactPicker:didSelectContact:", v9, v6);

}

- (void)_unauthorized_contactPicker:(id)a3 didSelectContact:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  MUPlaceViewController *v11;
  id v12;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __70__MUPlaceViewController__unauthorized_contactPicker_didSelectContact___block_invoke;
  v9[3] = &unk_1E2E01610;
  objc_copyWeak(&v12, &location);
  v8 = v7;
  v10 = v8;
  v11 = self;
  objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, v9);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

void __70__MUPlaceViewController__unauthorized_contactPicker_didSelectContact___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  void *v11;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "contactStore");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "contact");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __70__MUPlaceViewController__unauthorized_contactPicker_didSelectContact___block_invoke_2;
    v8[3] = &unk_1E2E01CC0;
    v6 = *(id *)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 40);
    v9 = v6;
    v10 = v7;
    v11 = v3;
    objc_msgSend(v4, "removeMapsDataFromContact:callbackQueue:completion:", v5, MEMORY[0x1E0C80D38], v8);

  }
}

void __70__MUPlaceViewController__unauthorized_contactPicker_didSelectContact___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0C974D8], "viewControllerForUpdatingContact:withPropertiesFromContact:", *(_QWORD *)(a1 + 32), a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDisplayMode:", 1);
  objc_msgSend(v3, "setDelegate:", *(_QWORD *)(a1 + 40));
  v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v3);
  objc_msgSend(v6, "setModalPresentationStyle:", 2);
  objc_msgSend(*(id *)(a1 + 48), "_presentModalViewController:withEnvironment:", v6, *(_QWORD *)(*(_QWORD *)(a1 + 48) + 1248));
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(void **)(v4 + 1072);
  *(_QWORD *)(v4 + 1072) = v3;

}

- (void)_authorized_contactPicker:(id)a3 didSelectContact:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  MUPlaceViewController *v16;
  id v17;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  -[MUPlaceViewController contactStore](self, "contactStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C80D38];
  v10 = MEMORY[0x1E0C80D38];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __68__MUPlaceViewController__authorized_contactPicker_didSelectContact___block_invoke;
  v13[3] = &unk_1E2E01CE8;
  v11 = v7;
  v14 = v11;
  v12 = v6;
  v15 = v12;
  objc_copyWeak(&v17, &location);
  v16 = self;
  objc_msgSend(v8, "fetchContactForPickerDisplayUsingContact:callbackQueue:completion:", v11, v9, v13);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

void __68__MUPlaceViewController__authorized_contactPicker_didSelectContact___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  _QWORD *WeakRetained;
  _QWORD *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  if (a3)
  {
    NSLog(CFSTR("Failed to refetch contact with error %@, contact %@"), a3, *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 40), "dismissViewControllerAnimated:completion:", 1, 0);
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    v6 = WeakRetained;
    if (WeakRetained)
    {
      v7 = (void *)MEMORY[0x1E0C974D8];
      objc_msgSend(WeakRetained, "contact");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "viewControllerForUpdatingContact:withPropertiesFromContact:", v12, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "setDisplayMode:", 1);
      objc_msgSend(v9, "setDelegate:", *(_QWORD *)(a1 + 48));
      objc_msgSend(*(id *)(a1 + 40), "navigationController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "pushViewController:animated:", v9, 1);

      v11 = (void *)v6[134];
      v6[134] = v9;

    }
  }

}

- (id)contactsNavigationController
{
  void *v2;
  void *v3;

  -[MUPlaceViewController configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contactsNavigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)createHeaderMenuSortOrderWithPromotedActionTypes:(id)a3 excludedActionTypes:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _QWORD v25[12];
  _QWORD v26[13];

  v26[12] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (id)*MEMORY[0x1E0CC1680];
  -[MUPlaceViewController actionRowSectionController](self, "actionRowSectionController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (-[_MKPlaceItem representsPerson](self->_placeItem, "representsPerson"))
    objc_msgSend(v10, "addObject:", &unk_1E2E551E8);
  if (objc_msgSend(v6, "count"))
    objc_msgSend(v10, "addObjectsFromArray:", v6);
  if (!v9)
  {
    v26[0] = &unk_1E2E55200;
    v26[1] = &unk_1E2E55218;
    v26[2] = &unk_1E2E55230;
    v26[3] = &unk_1E2E55248;
    v26[4] = &unk_1E2E55260;
    v26[5] = &unk_1E2E55278;
    v26[6] = &unk_1E2E55290;
    v26[7] = &unk_1E2E552A8;
    v26[8] = &unk_1E2E552C0;
    v26[9] = &unk_1E2E552D8;
    v26[10] = &unk_1E2E552F0;
    v26[11] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObjectsFromArray:", v11);

  }
  v25[0] = &unk_1E2E55308;
  v25[1] = &unk_1E2E55320;
  v25[2] = v8;
  v25[3] = &unk_1E2E55338;
  v25[4] = v8;
  v25[5] = &unk_1E2E55350;
  v25[6] = &unk_1E2E55368;
  v25[7] = &unk_1E2E55380;
  v25[8] = &unk_1E2E55308;
  v25[9] = &unk_1E2E55320;
  v25[10] = v8;
  v25[11] = &unk_1E2E55398;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 12);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObjectsFromArray:", v12);

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v13 = v7;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v21;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v21 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(v10, "removeObject:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v17++), (_QWORD)v20);
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v15);
  }

  v18 = (void *)objc_msgSend(v10, "copy");
  return v18;
}

- (id)createHeaderButtonsMenuWithPresentationOptions:(id)a3
{
  return -[MUPlaceViewController createHeaderButtonsMenuWithPromotedSystemActionTypes:excludedSystemActionTypes:presentationOptions:](self, "createHeaderButtonsMenuWithPromotedSystemActionTypes:excludedSystemActionTypes:presentationOptions:", MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], a3);
}

- (id)createHeaderButtonsMenuWithPromotedSystemActionTypes:(id)a3 excludedSystemActionTypes:(id)a4 presentationOptions:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  id v21;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[MUPlaceActionManager createMenuActions](self->_actionManager, "createMenuActions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_alloc(MEMORY[0x1E0CC18D0]);
  -[MUPlaceViewController createHeaderMenuSortOrderWithPromotedActionTypes:excludedActionTypes:](self, "createHeaderMenuSortOrderWithPromotedActionTypes:excludedActionTypes:", v8, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithRequestedActionTypes:", v13);

  objc_msgSend(v14, "setAddMismatchedItems:", 0);
  objc_initWeak(&location, self);
  v15 = (void *)MEMORY[0x1E0CC18C8];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __124__MUPlaceViewController_createHeaderButtonsMenuWithPromotedSystemActionTypes_excludedSystemActionTypes_presentationOptions___block_invoke;
  v19[3] = &unk_1E2E01D58;
  objc_copyWeak(&v21, &location);
  v16 = v10;
  v20 = v16;
  objc_msgSend(v15, "buildActionMenuForItems:buildingOptions:menuElementCreationBlock:", v11, v14, v19);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

  return v17;
}

id __124__MUPlaceViewController_createHeaderButtonsMenuWithPromotedSystemActionTypes_excludedSystemActionTypes_presentationOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  __CFString *v25;
  id v26;
  _QWORD v27[4];
  id v28;
  __CFString *v29;
  id v30[2];

  v3 = a2;
  objc_msgSend(v3, "resolvedActionItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "titleForDisplayStyle:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0DC3870];
  objc_msgSend(v4, "symbolForDisplayStyle:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_systemImageNamed:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v4, "type");
  v10 = MEMORY[0x1E0C809B0];
  if (v9 != 9)
    goto LABEL_5;
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __124__MUPlaceViewController_createHeaderButtonsMenuWithPromotedSystemActionTypes_excludedSystemActionTypes_presentationOptions___block_invoke_2;
  v27[3] = &unk_1E2E01610;
  objc_copyWeak(v30, (id *)(a1 + 40));
  v28 = *(id *)(a1 + 32);
  v29 = CFSTR("PLACECARD_QUICK_ACTION_TRAY");
  v23[0] = v10;
  v23[1] = 3221225472;
  v23[2] = __124__MUPlaceViewController_createHeaderButtonsMenuWithPromotedSystemActionTypes_excludedSystemActionTypes_presentationOptions___block_invoke_3;
  v23[3] = &unk_1E2E01610;
  objc_copyWeak(&v26, (id *)(a1 + 40));
  v24 = *(id *)(a1 + 32);
  v25 = CFSTR("PLACECARD_QUICK_ACTION_TRAY");
  +[MUPhotoOptionsMenuButton menuForPhotoOptionsMenuButtonWithTitle:symbol:cameraCompletion:libraryCompletion:](MUPhotoOptionsMenuButton, "menuForPhotoOptionsMenuButtonWithTitle:symbol:cameraCompletion:libraryCompletion:", v5, v8, v27, v23);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
    v13 = v11;

  objc_destroyWeak(&v26);
  objc_destroyWeak(v30);
  if (!v12)
  {
LABEL_5:
    v14 = (void *)MEMORY[0x1E0DC3428];
    v19[0] = v10;
    v19[1] = 3221225472;
    v19[2] = __124__MUPlaceViewController_createHeaderButtonsMenuWithPromotedSystemActionTypes_excludedSystemActionTypes_presentationOptions___block_invoke_4;
    v19[3] = &unk_1E2E01D30;
    objc_copyWeak(&v22, (id *)(a1 + 40));
    v20 = *(id *)(a1 + 32);
    v15 = v4;
    v21 = v15;
    objc_msgSend(v14, "actionWithTitle:image:identifier:handler:", v5, v8, 0, v19);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "isDestructiveForDisplayStyle:", 1))
      objc_msgSend(v12, "setAttributes:", objc_msgSend(v12, "attributes") | 2);
    if ((objc_msgSend(v15, "enabled") & 1) == 0)
      objc_msgSend(v12, "setAttributes:", objc_msgSend(v12, "attributes") | 1);
    objc_msgSend(v15, "type");
    MKPlaceCardActionTypeAsString();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringByAppendingString:", CFSTR("MenuAction"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAccessibilityIdentifier:", v17);

    objc_destroyWeak(&v22);
  }

  return v12;
}

void __124__MUPlaceViewController_createHeaderButtonsMenuWithPromotedSystemActionTypes_excludedSystemActionTypes_presentationOptions___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "presentAddPhotosWithPresentationOptions:entryPoint:originTarget:", *(_QWORD *)(a1 + 32), 1, *(_QWORD *)(a1 + 40));
    objc_msgSend(v3[176], "infoCardAnalyticsDidSelectAction:target:eventValue:feedbackDelegateSelector:actionRichProviderId:", 2147, 30, 0, 174, 0);
    WeakRetained = v3;
  }

}

void __124__MUPlaceViewController_createHeaderButtonsMenuWithPromotedSystemActionTypes_excludedSystemActionTypes_presentationOptions___block_invoke_3(uint64_t a1)
{
  id *WeakRetained;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "presentAddPhotosWithPresentationOptions:entryPoint:originTarget:", *(_QWORD *)(a1 + 32), 2, *(_QWORD *)(a1 + 40));
    objc_msgSend(v3[176], "infoCardAnalyticsDidSelectAction:target:eventValue:feedbackDelegateSelector:actionRichProviderId:", 2147, 30, 0, 174, 0);
    WeakRetained = v3;
  }

}

void __124__MUPlaceViewController_createHeaderButtonsMenuWithPromotedSystemActionTypes_excludedSystemActionTypes_presentationOptions___block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0D26EB0], "moduleFromModuleType:", 39);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = *MEMORY[0x1E0CC16A8];
    objc_msgSend(*(id *)(a1 + 32), "sourceView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *MEMORY[0x1E0CC1698];
    v9[0] = v4;
    v9[1] = MEMORY[0x1E0C9AAB0];
    v6 = *MEMORY[0x1E0CC16A0];
    v8[1] = v5;
    v8[2] = v6;
    v9[2] = v3;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(WeakRetained, "performAction:options:completion:", *(_QWORD *)(a1 + 40), v7, &__block_literal_global_432);
  }

}

- (void)ratingsAndReviewsSectionController:(id)a3 didSelectViewReview:(id)a4
{
  -[MUPlaceViewController _ratingsAndReviewsDidSelectViewReview:](self, "_ratingsAndReviewsDidSelectViewReview:", a4);
}

- (void)_ratingsAndReviewsDidSelectViewReview:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[MUPlaceViewController mapItem](self, "mapItem");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_reviewsAttribution");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "urlsForReview:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count"))
  {
    -[MUPlaceViewController placeViewFeedbackAppLaunchHandler](self, "placeViewFeedbackAppLaunchHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUPlaceViewController _launchAttributionURLs:withAttribution:mapItem:completionHandler:](self, "_launchAttributionURLs:withAttribution:mapItem:completionHandler:", v6, v5, v8, v7);

  }
}

- (void)ratingsAndReviewsSectionControllerDidSelectViewAllReviews:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[MUPlaceViewController mapItem](self, "mapItem", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_reviewsAttribution");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attributionURLs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceViewController placeViewFeedbackAppLaunchHandler](self, "placeViewFeedbackAppLaunchHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceViewController _launchAttributionURLs:withAttribution:mapItem:completionHandler:](self, "_launchAttributionURLs:withAttribution:mapItem:completionHandler:", v5, v4, v7, v6);

}

- (void)ratingsAndReviewsSectionController:(id)a3 didSelectPlaceCollection:(id)a4
{
  -[MUPlaceViewController routeToCuratedCollection:](self, "routeToCuratedCollection:", a4);
}

- (id)inlineRatingsSectionControllerRequestsContentViewController:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;

  -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "inlineRatingViewControllerForPlaceViewController:", self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (double)placeHeaderSectionControllerRequestsTrailingConstant:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  double v7;
  double v8;

  -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) == 0)
    return 0.0;
  -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "placeViewControllerPlaceCardHeaderTitleTrailingConstant:", self);
  v8 = v7;

  return v8;
}

- (void)placeHeaderSectionController:(id)a3 didTapMapItem:(id)a4
{
  -[MUPlaceViewController _handleRoutingToPlaceWithMapItem:](self, "_handleRoutingToPlaceWithMapItem:", a4);
}

- (void)_handleRoutingToPlaceWithMapItem:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "placeViewController:didSelectParent:", self, v7);

  }
  else
  {
    objc_msgSend(v7, "openInMapsWithLaunchOptions:", 0);
  }

}

- (void)placeHeaderSectionController:(id)a3 didSelectShareWithPresentationOptions:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  objc_msgSend(a3, "analyticsModule");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[MUPlaceViewController _invokeShareActionWithPresentationOptions:analyticsModuleMetadata:](self, "_invokeShareActionWithPresentationOptions:analyticsModuleMetadata:", v6, v7);

}

- (void)_invokeShareActionWithPresentationOptions:(id)a3 analyticsModuleMetadata:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v6 = (objc_class *)MEMORY[0x1E0CC18C8];
  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_msgSend([v6 alloc], "initWithType:displayString:glyph:enabled:", 16, 0, 0, 1);
  v12[0] = *MEMORY[0x1E0CC16A8];
  objc_msgSend(v8, "sourceView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v12[1] = *MEMORY[0x1E0CC16A0];
  v13[0] = v10;
  v13[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[MUPlaceActionManager performAction:options:completion:](self->_actionManager, "performAction:options:completion:", v9, v11, 0);
}

- (void)contactSharedLocationSectionController:(id)a3 selectedDirectionsWithAddress:(id)a4 forContact:(id)a5 options:(id)a6
{
  id v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a4;
  v8 = a5;
  -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKETAProvider transportTypePreferenceNumber](self->_etaProvider, "transportTypePreferenceNumber");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "placeViewController:didSelectDirectionsForDestinationAddress:contact:transportType:", self, v13, v8, v12);

  }
}

- (void)placeInfoSectionController:(id)a3 selectedViewPlaceWithMapItem:(id)a4 options:(id)a5
{
  -[MUPlaceViewController _handleRoutingToPlaceWithMapItem:](self, "_handleRoutingToPlaceWithMapItem:", a4);
}

- (void)placeInfoSectionController:(id)a3 selectedDirectionsWithMapItem:(id)a4 options:(id)a5
{
  void *v6;
  char v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKETAProvider transportTypePreferenceNumber](self->_etaProvider, "transportTypePreferenceNumber");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "placeViewController:didSelectDirectionsForDestinationMapItem:transportType:", self, v10, v9);

  }
}

- (void)placeInfoSectionController:(id)a3 selectedDirectionsWithAddress:(id)a4 forContact:(id)a5 options:(id)a6
{
  id v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a4;
  v8 = a5;
  -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKETAProvider transportTypePreferenceNumber](self->_etaProvider, "transportTypePreferenceNumber");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "placeViewController:didSelectDirectionsForDestinationAddress:contact:transportType:", self, v13, v8, v12);

  }
}

- (void)placeInfoSectionController:(id)a3 didTapAttribution:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[MUPlaceViewController mapItem](self, "mapItem");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[MUPlaceViewController _launchAttribution:withMapItem:](self, "_launchAttribution:withMapItem:", v5, v6);

}

- (void)placeInfoSectionController:(id)a3 didSelectAddMissingDataOfType:(int64_t)a4
{
  -[MUPlaceViewController _inlineRAPDidSelectAddMissingDataOfType:](self, "_inlineRAPDidSelectAddMissingDataOfType:", a4);
}

- (void)_inlineRAPDidSelectAddMissingDataOfType:(int64_t)a3
{
  MUPlaceCardAnalyticsController *analyticsController;
  const __CFString *v6;
  void *v7;
  char v8;
  id v9;

  analyticsController = self->_analyticsController;
  if ((unint64_t)(a3 - 1) > 4)
    v6 = CFSTR("Unknown");
  else
    v6 = off_1E2E01FA0[a3 - 1];
  -[MUPlaceCardAnalyticsController infoCardAnalyticsDidSelectAction:eventValue:feedbackDelegateSelector:](analyticsController, "infoCardAnalyticsDidSelectAction:eventValue:feedbackDelegateSelector:", 286, v6, 62);
  -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "placeViewController:didSelectAddMissingDataOfType:", self, a3);

  }
}

- (void)placeInfoSectionController:(id)a3 didSelectEditPlaceDetailsOfType:(int64_t)a4
{
  MUPlaceCardAnalyticsController *analyticsController;
  const __CFString *v7;
  void *v8;
  char v9;
  id v10;

  analyticsController = self->_analyticsController;
  if ((unint64_t)(a4 - 1) > 4)
    v7 = CFSTR("Unknown");
  else
    v7 = off_1E2E01FA0[a4 - 1];
  -[MUPlaceCardAnalyticsController infoCardAnalyticsDidSelectAction:target:eventValue:feedbackDelegateSelector:actionRichProviderId:](analyticsController, "infoCardAnalyticsDidSelectAction:target:eventValue:feedbackDelegateSelector:actionRichProviderId:", 289, 65, v7, 62, 0);
  -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "placeViewController:didSelectEditPlaceDetailsOfType:", self, a4);

  }
}

- (void)_launchAttributionURLs:(id)a3 withAttribution:(id)a4 mapItem:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  MUPlaceCardAnalyticsController *analyticsController;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  id v25;

  v9 = a3;
  v10 = a4;
  v11 = a6;
  if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CC1938], "punchoutOptionsForURLStrings:withAttribution:", v9, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "strategy") == 1)
    {
      analyticsController = self->_analyticsController;
      objc_msgSend(v12, "urlToOpen");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "absoluteString");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "providerID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[MUPlaceCardAnalyticsController instrumentPunchoutActionWithURL:providerId:](analyticsController, "instrumentPunchoutActionWithURL:providerId:", v15, v16);

      objc_msgSend(MEMORY[0x1E0CC1970], "sharedInstance");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "urlToOpen");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "appBundleIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __90__MUPlaceViewController__launchAttributionURLs_withAttribution_mapItem_completionHandler___block_invoke;
      v23[3] = &unk_1E2E01D80;
      v25 = v11;
      v24 = v12;
      objc_msgSend(v17, "openURL:bundleIdentifier:completionHandler:", v18, v19, v23);

    }
    else
    {
      -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_opt_respondsToSelector();

      if ((v21 & 1) != 0)
      {
        -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "placeViewController:launchAttributionURLs:withAttribution:completionHandler:", self, v9, v10, v11);

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CC1758], "launchAttributionURLs:withAttribution:completionHandler:", v9, v10, v11);
      }
    }

  }
}

void __90__MUPlaceViewController__launchAttributionURLs_withAttribution_mapItem_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  id v4;

  v1 = *(_QWORD *)(a1 + 40);
  if (v1)
  {
    objc_msgSend(*(id *)(a1 + 32), "urlToOpen");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "appBundleIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, void *))(v1 + 16))(v1, v4, v3);

  }
}

- (void)shareSheetPresenter:(id)a3 preCompletedActivityOfType:(id)a4 completed:(BOOL)a5
{
  _BOOL8 v5;
  void *v7;
  char v8;
  void *v9;
  id v10;

  v5 = a5;
  v10 = a4;
  -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "placeViewController:didSelectActivityOfType:completed:", self, v10, v5);

  }
}

- (id)shareSheetPresenterRequestsOverridenActivityViewController:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;

  -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "activityViewControllerForPlaceViewController:", self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)createShareSheetFooterActions
{
  void *v3;
  MUPlaceActionManager *actionManager;
  void *v5;
  void *v6;
  void *v7;

  -[MUPlaceActionManager createContactActions](self->_actionManager, "createContactActions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  actionManager = self->_actionManager;
  -[MUShareSheetPresenter presentationOptions](self->_shareSheetPresenter, "presentationOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKPlaceActionEnvironment analyticsModuleMetadata](self->_currentEnvironmentForPresentedViewController, "analyticsModuleMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[MUBlockActivity createBlockActivitiesFromPlaceActionItems:usingActionManager:presentationOptions:analyticsModuleMetadata:](MUBlockActivity, "createBlockActivitiesFromPlaceActionItems:usingActionManager:presentationOptions:analyticsModuleMetadata:", v3, actionManager, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)shouldBlurChromeHeaderButtons
{
  void *v2;
  char v3;

  -[MUPlaceViewController headerSectionController](self, "headerSectionController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldBlurChromeHeaderButtons");

  return v3;
}

- (void)placeViewController:(id)a3 shouldLogFeedbackOfType:(int)a4
{
  uint64_t v4;
  void *v6;
  char v7;
  id v8;

  v4 = *(_QWORD *)&a4;
  -[MUPlaceViewController placeViewFeedbackDelegate](self, "placeViewFeedbackDelegate", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[MUPlaceViewController placeViewFeedbackDelegate](self, "placeViewFeedbackDelegate");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "placeViewController:shouldLogFeedbackOfType:", self, v4);

  }
}

- (BOOL)isLoading
{
  void *v2;
  char v3;

  -[MUPlaceViewController placeItem](self, "placeItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isIntermediateMapItem");

  return v3;
}

- (void)addLoadingView
{
  MULoadingOverlayController *loadingOverlayController;
  MULoadingOverlayController *v4;
  void *v5;
  MULoadingOverlayController *v6;
  MULoadingOverlayController *v7;

  loadingOverlayController = self->_loadingOverlayController;
  if (!loadingOverlayController)
  {
    v4 = [MULoadingOverlayController alloc];
    -[MUPlaceViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[MULoadingOverlayController initWithParentView:contentView:](v4, "initWithParentView:contentView:", v5, self->_contentStackView);
    v7 = self->_loadingOverlayController;
    self->_loadingOverlayController = v6;

    loadingOverlayController = self->_loadingOverlayController;
  }
  -[MULoadingOverlayController attachLoadingOverlay](loadingOverlayController, "attachLoadingOverlay");
}

- (void)removeLoadingViewAnimated:(BOOL)a3
{
  _BOOL8 v3;
  MULoadingOverlayController *loadingOverlayController;
  _QWORD v6[4];
  id v7;
  id location;

  v3 = a3;
  objc_initWeak(&location, self);
  loadingOverlayController = self->_loadingOverlayController;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __51__MUPlaceViewController_removeLoadingViewAnimated___block_invoke;
  v6[3] = &unk_1E2E01DA8;
  objc_copyWeak(&v7, &location);
  -[MULoadingOverlayController removeLoadingOverlayAnimated:completion:](loadingOverlayController, "removeLoadingOverlayAnimated:completion:", v3, v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __51__MUPlaceViewController_removeLoadingViewAnimated___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_updateContentAlpha");
    WeakRetained = v2;
  }

}

- (void)hideContentIfLoading
{
  if (-[MUPlaceViewController isLoading](self, "isLoading"))
    -[MUPlaceViewController addLoadingView](self, "addLoadingView");
}

- (void)showContentIfLoaded
{
  _MKPlaceItem *placeItem;

  if (!-[MUPlaceViewController isLoading](self, "isLoading"))
  {
    -[MUPlaceViewController removeLoadingViewAnimated:](self, "removeLoadingViewAnimated:", 1);
    placeItem = self->_placeItem;
    if (placeItem)
    {
      if ((-[_MKPlaceItem isIntermediateMapItem](placeItem, "isIntermediateMapItem") & 1) == 0)
      {
        -[MUScrollViewImpressionsCalculator logImpressions](self->_impressionsCalculator, "logImpressions");
        if (!self->_active && !self->_needsImpressionsLoggedOnAppearance)
          self->_needsImpressionsLoggedOnAppearance = 1;
      }
    }
  }
}

- (void)didSelectAddMissingDataWithActionDispatcher:(id)a3 missingDataType:(int64_t)a4
{
  -[MUPlaceViewController _inlineRAPDidSelectAddMissingDataOfType:](self, "_inlineRAPDidSelectAddMissingDataOfType:", a4);
}

- (void)didSelectViewReviewWithActionDispatcher:(id)a3 review:(id)a4
{
  -[MUPlaceViewController _ratingsAndReviewsDidSelectViewReview:](self, "_ratingsAndReviewsDidSelectViewReview:", a4);
}

- (CGSize)preferredContentSize
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[6];
  _QWORD v7[6];
  uint64_t v8;
  double *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  CGSize result;

  v8 = 0;
  v9 = (double *)&v8;
  v10 = 0x3010000000;
  v12 = 0;
  v13 = 0;
  v11 = "";
  v6[5] = &v8;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__MUPlaceViewController_preferredContentSize__block_invoke;
  v7[3] = &unk_1E2E019C0;
  v7[4] = self;
  v7[5] = &v8;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __45__MUPlaceViewController_preferredContentSize__block_invoke_2;
  v6[3] = &unk_1E2E019C0;
  v6[4] = self;
  -[MUPlaceViewController _performWithNewUIBlock:oldUIBlock:](self, "_performWithNewUIBlock:oldUIBlock:", v7, v6);
  v2 = v9[4];
  v3 = v9[5];
  _Block_object_dispose(&v8, 8);
  v4 = v2;
  v5 = v3;
  result.height = v5;
  result.width = v4;
  return result;
}

uint64_t __45__MUPlaceViewController_preferredContentSize__block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 984), "intrinsicContentSize");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  *(_QWORD *)(v3 + 32) = v4;
  *(_QWORD *)(v3 + 40) = v5;
  return result;
}

uint64_t __45__MUPlaceViewController_preferredContentSize__block_invoke_2(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "preferredContentSize");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  *(_QWORD *)(v3 + 32) = v4;
  *(_QWORD *)(v3 + 40) = v5;
  return result;
}

- (CGSize)_systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double v5;
  double v6;
  double v7;
  double v8;
  _QWORD v9[6];
  CGSize v10;
  float v11;
  float v12;
  _QWORD v13[6];
  CGSize v14;
  float v15;
  float v16;
  uint64_t v17;
  double *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  CGSize result;

  v17 = 0;
  v18 = (double *)&v17;
  v19 = 0x3010000000;
  v21 = 0;
  v22 = 0;
  v20 = "";
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __108__MUPlaceViewController__systemLayoutSizeFittingSize_withHorizontalFittingPriority_verticalFittingPriority___block_invoke;
  v13[3] = &unk_1E2E01DD0;
  v13[4] = self;
  v13[5] = &v17;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __108__MUPlaceViewController__systemLayoutSizeFittingSize_withHorizontalFittingPriority_verticalFittingPriority___block_invoke_2;
  v9[3] = &unk_1E2E01DD0;
  v9[4] = self;
  v9[5] = &v17;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  -[MUPlaceViewController _performWithNewUIBlock:oldUIBlock:](self, "_performWithNewUIBlock:oldUIBlock:", v13, v9);
  v5 = v18[4];
  v6 = v18[5];
  _Block_object_dispose(&v17, 8);
  v7 = v5;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

uint64_t __108__MUPlaceViewController__systemLayoutSizeFittingSize_withHorizontalFittingPriority_verticalFittingPriority___block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  LODWORD(a4) = *(_DWORD *)(a1 + 64);
  LODWORD(a5) = *(_DWORD *)(a1 + 68);
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 984), "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", *(double *)(a1 + 48), *(double *)(a1 + 56), a4, a5);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  *(_QWORD *)(v7 + 32) = v8;
  *(_QWORD *)(v7 + 40) = v9;
  return result;
}

void __108__MUPlaceViewController__systemLayoutSizeFittingSize_withHorizontalFittingPriority_verticalFittingPriority___block_invoke_2(uint64_t a1)
{
  double v2;
  double v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "view");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = *(_DWORD *)(a1 + 64);
  LODWORD(v3) = *(_DWORD *)(a1 + 68);
  objc_msgSend(v7, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", *(double *)(a1 + 48), *(double *)(a1 + 56), v2, v3);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  *(_QWORD *)(v4 + 32) = v5;
  *(_QWORD *)(v4 + 40) = v6;

}

- (id)menuElementForActionItem:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "menuElementForActionItem:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)presentAddPhotosWithPresentationOptions:(id)a3 entryPoint:(int64_t)a4 originTarget:(id)a5
{
  id v8;
  void *v9;
  char v10;
  void *v11;
  id v12;

  v12 = a3;
  v8 = a5;
  -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "placeViewController:didSelectAddPhotosWithPresentationOptions:entryPoint:originTarget:", self, v12, a4, v8);

  }
}

- (void)presentPOIEnrichmentWithPresentationOptions:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "placeViewController:didSelectAddRatingsWithPresentationOptions:overallState:originTarget:", self, v7, 0, 0);

  }
}

- (id)suggestionViewForCallToActionSectionController:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;

  -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "suggestionViewForPlaceViewController:", self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (void)setPlaceInBookmarks:(BOOL)a3
{
  self->_placeInBookmarks = a3;
  -[MUPlaceActionManager setPlaceInBookmarks:](self->_actionManager, "setPlaceInBookmarks:");
}

- (void)handleAppClip:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  MUPlaceCardAnalyticsController *analyticsController;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id location;

  v6 = a3;
  v7 = a4;
  analyticsController = self->_analyticsController;
  objc_msgSend(v7, "analyticsEventValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceCardAnalyticsController instrumentAction:target:eventValue:moduleType:feedbackType:](analyticsController, "instrumentAction:target:eventValue:moduleType:feedbackType:", 6105, 670, v9, objc_msgSend(v7, "analyticsModuleType"), 0);

  objc_msgSend(v6, "appClipURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0CC1778], "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __47__MUPlaceViewController_handleAppClip_options___block_invoke;
  v13[3] = &unk_1E2E01DF8;
  v12 = v10;
  v14 = v12;
  objc_copyWeak(&v15, &location);
  objc_msgSend(v11, "requestAppClip:completion:", v6, v13);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

void __47__MUPlaceViewController_handleAppClip_options___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id WeakRetained;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) != 0)
    goto LABEL_9;
  MUGetPlaceCardLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
  if (v5)
  {
    if (v7)
    {
      v8 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v5, "description");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138412546;
      v16 = v8;
      v17 = 2112;
      v18 = v9;
      _os_log_impl(&dword_191DB8000, v6, OS_LOG_TYPE_ERROR, "AppClip request for URL: %@ failed with error: %@", (uint8_t *)&v15, 0x16u);

    }
  }
  else if (v7)
  {
    v10 = *(_QWORD *)(a1 + 32);
    v15 = 138412290;
    v16 = v10;
    _os_log_impl(&dword_191DB8000, v6, OS_LOG_TYPE_ERROR, "AppClip request for URL: %@ failed", (uint8_t *)&v15, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v12 = WeakRetained;
    objc_msgSend(WeakRetained, "_openWebURL:forcePunchout:", *(_QWORD *)(a1 + 32), 0);

LABEL_9:
    MUGetPlaceCardLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = *(_QWORD *)(a1 + 32);
      v15 = 138412290;
      v16 = v14;
      _os_log_impl(&dword_191DB8000, v13, OS_LOG_TYPE_INFO, "AppClip of url %@ is available", (uint8_t *)&v15, 0xCu);
    }

  }
}

- (void)handleQuickLink:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  MUPlaceCardAnalyticsController *analyticsController;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "URLString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "length"))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v8);
    if (v9)
    {
      analyticsController = self->_analyticsController;
      v11 = objc_msgSend(v7, "analyticsTarget");
      objc_msgSend(v7, "analyticsEventValue");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[MUPlaceCardAnalyticsController instrumentAction:target:eventValue:moduleType:feedbackType:](analyticsController, "instrumentAction:target:eventValue:moduleType:feedbackType:", 6050, v11, v12, objc_msgSend(v7, "analyticsModuleType"), 0);

      -[MUPlaceViewController _openWebURL:forcePunchout:](self, "_openWebURL:forcePunchout:", v9, 0);
    }
    else
    {
      MUGetPlaceCardLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v14 = 138412290;
        v15 = v6;
        _os_log_impl(&dword_191DB8000, v13, OS_LOG_TYPE_ERROR, "The URL associated with quicklink %@ is nil", (uint8_t *)&v14, 0xCu);
      }

    }
  }

}

- (void)handleWebLink:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  MUPlaceCardAnalyticsController *analyticsController;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  uint8_t v14[16];

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "absoluteString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");

  if (v9)
  {
    analyticsController = self->_analyticsController;
    v11 = objc_msgSend(v7, "analyticsTarget");
    objc_msgSend(v7, "analyticsEventValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUPlaceCardAnalyticsController instrumentAction:target:eventValue:moduleType:feedbackType:](analyticsController, "instrumentAction:target:eventValue:moduleType:feedbackType:", 6050, v11, v12, objc_msgSend(v7, "analyticsModuleType"), 0);

    -[MUPlaceViewController _openWebURL:forcePunchout:](self, "_openWebURL:forcePunchout:", v6, objc_msgSend(v7, "forcePunchout"));
  }
  else
  {
    MUGetPlaceCardLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_191DB8000, v13, OS_LOG_TYPE_ERROR, "The URL is empty", v14, 2u);
    }

  }
}

- (void)_openWebURL:(id)a3 forcePunchout:(BOOL)a4
{
  void *v6;
  char v7;
  void *v8;
  id v9;

  v9 = a3;
  if (a4
    || (-[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_opt_respondsToSelector(),
        v6,
        (v7 & 1) == 0))
  {
    objc_msgSend(MEMORY[0x1E0CC1970], "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "openURL:completionHandler:", v9, 0);
  }
  else
  {
    -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "placeViewController:openURL:", self, v9);
  }

}

- (void)handleMapsExtension:(id)a3 usingAppStoreApp:(id)a4 options:(id)a5
{
  id v7;
  id v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "placeViewController:didSelectMapsExtension:usingAppStoreApp:", self, v7, v8);

  }
  else
  {
    -[MUPlaceViewController mapItem](self, "mapItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *MEMORY[0x1E0CC15B0];
    v15[0] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "openInMapsWithLaunchOptions:completionHandler:", v13, &__block_literal_global_475);

  }
}

void __70__MUPlaceViewController_handleMapsExtension_usingAppStoreApp_options___block_invoke(uint64_t a1, char a2)
{
  NSObject *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if ((a2 & 1) == 0)
  {
    MUGetPlaceCardLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "bundleIdentifier");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = 138412290;
      v6 = v4;
      _os_log_impl(&dword_191DB8000, v2, OS_LOG_TYPE_INFO, "Couldn't launch Maps from Reservation button in %@", (uint8_t *)&v5, 0xCu);

    }
  }
}

- (id)visibleImpressionElements
{
  void *v3;
  void *v4;
  uint64_t v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSArray count](self->_sectionControllers, "count"));
  -[MUPlaceViewController placeEnrichmentSectionController](self, "placeEnrichmentSectionController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hasContent");

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = self->_sectionControllers;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if (objc_msgSend(v12, "hasContent", (_QWORD)v17)
          && objc_msgSend(v12, "isImpressionable"))
        {
          objc_msgSend(v12, "impressionElement");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "impressionsFrame");
          objc_msgSend(v13, "setFrame:");
          objc_msgSend(v13, "setSessionIdentifier:", self->_impressionsSessionIdentifier);
          objc_msgSend(v13, "customData");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setModuleIndex:", v9);
          objc_msgSend(v14, "setEnriched:", v5);
          objc_msgSend(v3, "addObject:", v13);
          ++v9;

        }
      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  v15 = (void *)objc_msgSend(v3, "copy");
  return v15;
}

- (MUAMSResultProvider)amsResultProvider
{
  MUAMSResultProvider *amsResultProvider;
  MUAMSResultCache *v4;
  uint64_t UInteger;
  uint64_t v6;
  uint64_t v7;
  MUAMSResultCache *v8;
  MUAMSResultProvider *v9;
  MUAMSResultProvider *v10;

  amsResultProvider = self->_amsResultProvider;
  if (!amsResultProvider)
  {
    v4 = [MUAMSResultCache alloc];
    UInteger = GEOConfigGetUInteger();
    v6 = GEOConfigGetUInteger();
    v7 = GEOConfigGetUInteger();
    v8 = -[MUAMSResultCache initWithAppAdamIdCacheCount:appAdamIdTimeToLive:bundleIdCacheCount:bundleIdTimeToLive:](v4, "initWithAppAdamIdCacheCount:appAdamIdTimeToLive:bundleIdCacheCount:bundleIdTimeToLive:", UInteger, v6, v7, GEOConfigGetUInteger());
    v9 = -[MUAMSResultProvider initWithCache:]([MUAMSResultProvider alloc], "initWithCache:", v8);
    v10 = self->_amsResultProvider;
    self->_amsResultProvider = v9;

    amsResultProvider = self->_amsResultProvider;
  }
  return amsResultProvider;
}

- (void)contactStoreDidChange:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __47__MUPlaceViewController_contactStoreDidChange___block_invoke;
  v5[3] = &unk_1E2E01A10;
  objc_copyWeak(&v6, &location);
  -[MUPlaceViewController _calculateShowingContactActionsWithCompletion:](self, "_calculateShowingContactActionsWithCompletion:", v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

}

void __47__MUPlaceViewController_contactStoreDidChange___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "setShowContactActions:", a2);
    WeakRetained = v4;
  }

}

- (void)placeNotesSectionController:(id)a3 didRequestEditingNoteWithInitialText:(id)a4 completion:(id)a5
{
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a4;
  v7 = a5;
  -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUPlaceViewController libraryAccessProvider](self, "libraryAccessProvider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "placeViewController:didRequestEditingNoteWithInitialText:libraryAccessProvider:completion:", self, v12, v11, v7);

  }
}

- (void)libraryAccessProvider:(id)a3 savedStateOfPlaceDidChange:(BOOL)a4
{
  -[MUPlaceViewController updateAddToLibraryActionState](self, "updateAddToLibraryActionState", a3, a4);
  -[MUPlaceViewController updateAddNoteActionState](self, "updateAddNoteActionState");
}

- (void)requestHikingToolTipRegionIDForLocationCoordinate:(CLLocationCoordinate2D)a3
{
  double longitude;
  double latitude;
  void *v6;
  char v7;
  id v8;

  longitude = a3.longitude;
  latitude = a3.latitude;
  -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "placeViewController:didRequestHikingToolTipRegionIDForLocation:", self, latitude, longitude);

  }
}

- (id)hikingTipViewForHikingTipSectionController:(id)a3 viewModel:(id)a4
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;

  v5 = a4;
  -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "placeViewController:hikingTipViewForTipModel:", self, v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)didTapHikingTip:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[MUPlaceViewController mapsAppDelegate](self, "mapsAppDelegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "placeViewControllerDidTapHikingTip:", self);

  }
}

- (UIScrollViewDelegate)scrollViewDelegate
{
  return (UIScrollViewDelegate *)objc_loadWeakRetained((id *)&self->_scrollViewDelegate);
}

- (void)setScrollViewDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_scrollViewDelegate, a3);
}

- (GEOAutomobileOptions)automobileOptions
{
  return self->_automobileOptions;
}

- (GEOWalkingOptions)walkingOptions
{
  return self->_walkingOptions;
}

- (GEOCyclingOptions)cyclingOptions
{
  return self->_cyclingOptions;
}

- (GEOTransitOptions)transitOptions
{
  return self->_transitOptions;
}

- (BOOL)placeInBookmarks
{
  return self->_placeInBookmarks;
}

- (BOOL)placeInCollections
{
  return self->_placeInCollections;
}

- (BOOL)placeInShortcuts
{
  return self->_placeInShortcuts;
}

- (unint64_t)placeNumberOfReportsInReview
{
  return self->_placeNumberOfReportsInReview;
}

- (MUPlaceViewControllerDelegate)placeViewControllerDelegate
{
  return (MUPlaceViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_placeViewControllerDelegate);
}

- (void)setPlaceViewControllerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_placeViewControllerDelegate, a3);
}

- (double)verifiedHeaderExpansionProgress
{
  return self->_verifiedHeaderExpansionProgress;
}

- (MUOfflineMapProvider)offlineMapProvider
{
  return (MUOfflineMapProvider *)objc_loadWeakRetained((id *)&self->_offlineMapProvider);
}

- (MUFeatureDiscoveryAnnotationView)offlineFeatureDiscoveryView
{
  return self->_offlineFeatureDiscoveryView;
}

- (CNContact)originalContact
{
  return self->_originalContact;
}

- (void)setOriginalContact:(id)a3
{
  objc_storeStrong((id *)&self->_originalContact, a3);
}

- (MUPersonalizedSuggestionSectionArbiter)personalizedSuggestionSectionArbiter
{
  return self->_personalizedSuggestionSectionArbiter;
}

- (void)setPersonalizedSuggestionSectionArbiter:(id)a3
{
  objc_storeStrong((id *)&self->_personalizedSuggestionSectionArbiter, a3);
}

- (BOOL)showContactActions
{
  return self->_showContactActions;
}

- (MKMapItemIdentifier)mapItemIdentifierIntrumentedForReveal
{
  return self->_mapItemIdentifierIntrumentedForReveal;
}

- (void)setMapItemIdentifierIntrumentedForReveal:(id)a3
{
  objc_storeStrong((id *)&self->_mapItemIdentifierIntrumentedForReveal, a3);
}

- (MUPlaceViewControllerMapsAppDelegate)mapsAppDelegate
{
  return (MUPlaceViewControllerMapsAppDelegate *)objc_loadWeakRetained((id *)&self->_mapsAppDelegate);
}

- (void)setMapsAppDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_mapsAppDelegate, a3);
}

- (id)placeViewFeedbackAppLaunchHandler
{
  return self->_placeViewFeedbackAppLaunchHandler;
}

- (void)setPlaceViewFeedbackAppLaunchHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1392);
}

- (CLLocation)location
{
  return self->_location;
}

- (MULibraryAccessProviding)libraryAccessProvider
{
  return self->_libraryAccessProvider;
}

- (MUImpressionsCalculator)impressionsCalculator
{
  return &self->_impressionsCalculator->super;
}

- (MUPlaceCardAnalyticsController)analyticsController
{
  return self->_analyticsController;
}

- (BOOL)forceCaptureRevealEventOnNextBecomeActive
{
  return self->_forceCaptureRevealEventOnNextBecomeActive;
}

- (void)setForceCaptureRevealEventOnNextBecomeActive:(BOOL)a3
{
  self->_forceCaptureRevealEventOnNextBecomeActive = a3;
}

- (UIView)linkView
{
  return self->_linkView;
}

- (MUPlaceViewControllerFeedbackDelegate)placeViewFeedbackDelegate
{
  return (MUPlaceViewControllerFeedbackDelegate *)objc_loadWeakRetained((id *)&self->_placeViewFeedbackDelegate);
}

- (void)setPlaceViewFeedbackDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_placeViewFeedbackDelegate, a3);
}

- (MUPlaceViewControllerConfiguration)configuration
{
  return self->_configuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_destroyWeak((id *)&self->_placeViewFeedbackDelegate);
  objc_storeStrong((id *)&self->_linkView, 0);
  objc_storeStrong((id *)&self->_analyticsController, 0);
  objc_storeStrong((id *)&self->_libraryAccessProvider, 0);
  objc_storeStrong(&self->_placeViewFeedbackAppLaunchHandler, 0);
  objc_destroyWeak((id *)&self->_mapsAppDelegate);
  objc_storeStrong((id *)&self->_mapItemIdentifierIntrumentedForReveal, 0);
  objc_storeStrong((id *)&self->_personalizedSuggestionSectionArbiter, 0);
  objc_storeStrong((id *)&self->_originalContact, 0);
  objc_storeStrong((id *)&self->_offlineFeatureDiscoveryView, 0);
  objc_destroyWeak((id *)&self->_offlineMapProvider);
  objc_destroyWeak((id *)&self->_placeViewControllerDelegate);
  objc_storeStrong((id *)&self->_transitOptions, 0);
  objc_storeStrong((id *)&self->_cyclingOptions, 0);
  objc_storeStrong((id *)&self->_walkingOptions, 0);
  objc_storeStrong((id *)&self->_automobileOptions, 0);
  objc_storeStrong((id *)&self->_amsResultProvider, 0);
  objc_destroyWeak((id *)&self->_scrollViewDelegate);
  objc_storeStrong((id *)&self->_currentEnvironmentForPresentedViewController, 0);
  objc_storeStrong((id *)&self->_impressionsSessionIdentifier, 0);
  objc_storeStrong((id *)&self->_impressionsCalculator, 0);
  objc_storeStrong((id *)&self->_officialAppMediaResultCache, 0);
  objc_storeStrong((id *)&self->_quickActionTrayArtworkCache, 0);
  objc_storeStrong((id *)&self->_headerAlternatePrimaryButtonController, 0);
  objc_storeStrong((id *)&self->_headerSecondaryButtonController, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_submissionStatus, 0);
  objc_storeStrong((id *)&self->_originalContactCopy, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_actionDispatcher, 0);
  objc_storeStrong((id *)&self->_evChargerAvailabilityProvider, 0);
  objc_storeStrong((id *)&self->_lockScreenCoordinator, 0);
  objc_storeStrong((id *)&self->_lookAroundView, 0);
  objc_storeStrong((id *)&self->_loadingOverlayController, 0);
  objc_storeStrong((id *)&self->_shareSheetPresenter, 0);
  objc_storeStrong((id *)&self->_editingContactController, 0);
  objc_storeStrong((id *)&self->_creatingContactController, 0);
  objc_storeStrong((id *)&self->_updatingContactController, 0);
  objc_storeStrong((id *)&self->_etaProvider, 0);
  objc_storeStrong((id *)&self->_actionDataProvider, 0);
  objc_storeStrong((id *)&self->_actionManager, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_placeItem, 0);
  objc_storeStrong((id *)&self->_sectionControllers, 0);
  objc_storeStrong((id *)&self->_contentStackView, 0);
  objc_storeStrong((id *)&self->_legacyPlacecard, 0);
}

@end
