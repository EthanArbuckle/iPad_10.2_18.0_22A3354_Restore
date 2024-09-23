@implementation MRURoutingViewController

- (void)playingSessionsDidChangeNotification:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__MRURoutingViewController_playingSessionsDidChangeNotification___block_invoke;
  block[3] = &unk_1E5818C88;
  block[4] = self;
  dispatch_async(v4, block);

}

void __65__MRURoutingViewController_playingSessionsDidChangeNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  _QWORD block[5];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D48560], "sharedAVSystemController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributeForKey:", *MEMORY[0x1E0D48060]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    MCLogCategoryDeviceAccess();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v3;
      _os_log_impl(&dword_1AA991000, v4, OS_LOG_TYPE_DEFAULT, "sessions: %@", buf, 0xCu);
    }

    MCLogCategoryDeviceAccess();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 1148);
      *(_DWORD *)buf = 67109120;
      LODWORD(v24) = v6;
      _os_log_impl(&dword_1AA991000, v5, OS_LOG_TYPE_DEFAULT, "presentingAppPID: %d", buf, 8u);
    }

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v16 = v3;
    v7 = v3;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v19;
      v11 = (_QWORD *)MEMORY[0x1E0D48078];
      v12 = MEMORY[0x1E0C80D38];
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v19 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v13), "objectForKeyedSubscript:", *v11, v16);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 1148);
          if (v15 == objc_msgSend(v14, "intValue"))
          {
            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = __65__MRURoutingViewController_playingSessionsDidChangeNotification___block_invoke_181;
            block[3] = &unk_1E5818C88;
            block[4] = *(_QWORD *)(a1 + 32);
            dispatch_async(v12, block);
          }

          ++v13;
        }
        while (v9 != v13);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v9);
    }

    v3 = v16;
  }

}

- (MRURoutingViewController)init
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  MRURoutingViewController *v7;

  v3 = objc_alloc(MEMORY[0x1E0CC2318]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithName:", v5);

  v7 = -[MRURoutingViewController initWithRoutingController:](self, "initWithRoutingController:", v6);
  return v7;
}

- (MRURoutingViewController)initWithRoutingController:(id)a3
{
  id v5;
  MRURoutingViewController *v6;
  MRURoutingViewController *v7;
  uint64_t v8;
  NSMutableSet *expandedGroupUIDs;
  uint64_t v10;
  NSMutableSet *expandedItemUIDs;
  uint64_t v12;
  NSMutableSet *expandedRouteUIDs;
  uint64_t v14;
  NSMutableSet *collapsedVendorSpecificGroupUIDs;
  uint64_t v16;
  NSMutableSet *expandedVendorSpecificGroupUIDs;
  uint64_t v18;
  NSMutableDictionary *vendorSpecificGroupDisplayedSubroutes;
  MRURoutingViewController *v20;
  uint64_t v21;
  NSMutableArray *staticCustomRowItems;
  void *v23;
  void *v24;
  _QWORD v26[4];
  MRURoutingViewController *v27;
  objc_super v28;

  v5 = a3;
  v28.receiver = self;
  v28.super_class = (Class)MRURoutingViewController;
  v6 = -[MRURoutingViewController init](&v28, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_routingController, a3);
    -[MPAVRoutingController setDelegate:](v7->_routingController, "setDelegate:", v7);
    v7->_discoveryMode = 0;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v8 = objc_claimAutoreleasedReturnValue();
    expandedGroupUIDs = v7->_expandedGroupUIDs;
    v7->_expandedGroupUIDs = (NSMutableSet *)v8;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v10 = objc_claimAutoreleasedReturnValue();
    expandedItemUIDs = v7->_expandedItemUIDs;
    v7->_expandedItemUIDs = (NSMutableSet *)v10;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v12 = objc_claimAutoreleasedReturnValue();
    expandedRouteUIDs = v7->_expandedRouteUIDs;
    v7->_expandedRouteUIDs = (NSMutableSet *)v12;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v14 = objc_claimAutoreleasedReturnValue();
    collapsedVendorSpecificGroupUIDs = v7->_collapsedVendorSpecificGroupUIDs;
    v7->_collapsedVendorSpecificGroupUIDs = (NSMutableSet *)v14;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v16 = objc_claimAutoreleasedReturnValue();
    expandedVendorSpecificGroupUIDs = v7->_expandedVendorSpecificGroupUIDs;
    v7->_expandedVendorSpecificGroupUIDs = (NSMutableSet *)v16;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v18 = objc_claimAutoreleasedReturnValue();
    vendorSpecificGroupDisplayedSubroutes = v7->_vendorSpecificGroupDisplayedSubroutes;
    v7->_vendorSpecificGroupDisplayedSubroutes = (NSMutableDictionary *)v18;

    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __54__MRURoutingViewController_initWithRoutingController___block_invoke;
    v26[3] = &unk_1E58193D8;
    v20 = v7;
    v27 = v20;
    v20->_stateHandle = __54__MRURoutingViewController_initWithRoutingController___block_invoke((uint64_t)v26);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v21 = objc_claimAutoreleasedReturnValue();
    staticCustomRowItems = v20->_staticCustomRowItems;
    v20->_staticCustomRowItems = (NSMutableArray *)v21;

    v20->_didExpandVendorSpecificSpeakerGroup = 0;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addObserver:selector:name:object:", v20, sel_routeRecommenderDidUpdateRecommendations_, MRURouteRecommenderDidUpdateRecommendationsNotification, 0);

    +[MRURouteRecommender sharedInstance](MRURouteRecommender, "sharedInstance");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "updateRecommendations");

  }
  return v7;
}

uint64_t __54__MRURoutingViewController_initWithRoutingController___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %p"), objc_opt_class(), *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__MRURoutingViewController_initWithRoutingController___block_invoke_2;
  v5[3] = &unk_1E58193B0;
  objc_copyWeak(&v6, &location);
  v3 = MCLogAddStateHandlerWithName(v2, v5);
  objc_destroyWeak(&v6);

  objc_destroyWeak(&location);
  return v3;
}

id __54__MRURoutingViewController_initWithRoutingController___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  void *v3;
  void *v4;

  if (*(_DWORD *)(a2 + 16) == 3)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v3 = WeakRetained;
    if (WeakRetained)
    {
      objc_msgSend(WeakRetained, "_fullStateDumpObject");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = 0;
    }

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)setRoutingController:(id)a3
{
  MPAVRoutingController *v4;
  MPAVRoutingController *routingController;
  MPAVRoutingController *v6;
  void *v7;
  id v8;

  v4 = (MPAVRoutingController *)a3;
  -[MPAVRoutingController setDelegate:](self->_routingController, "setDelegate:", 0);
  routingController = self->_routingController;
  self->_routingController = v4;
  v6 = v4;

  -[MPAVRoutingController setDelegate:](self->_routingController, "setDelegate:", self);
  -[MRURoutingViewController _setNeedsRouteDiscoveryModeUpdate](self, "_setNeedsRouteDiscoveryModeUpdate");
  -[MRURoutingViewController _setNeedsDisplayedRoutesUpdate](self, "_setNeedsDisplayedRoutesUpdate");
  -[MRURoutingViewController updateMetadata](self, "updateMetadata");
  -[MRURoutingViewController updateSubtitle](self, "updateSubtitle");
  -[MRURoutingViewController view](self, "view");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reloadData");

}

- (void)dealloc
{
  objc_super v3;

  os_state_remove_handler();
  notify_cancel(self->_airPlayPasswordAlertDidAppearToken);
  notify_cancel(self->_airPlayPasswordAlertDidCancelToken);
  -[MPWeakTimer invalidate](self->_updateTimer, "invalidate");
  -[MPWeakTimer invalidate](self->_subtitleUpdateTimer, "invalidate");
  -[NSTimer invalidate](self->_collapseTimer, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)MRURoutingViewController;
  -[MRURoutingViewController dealloc](&v3, sel_dealloc);
}

- (void)loadView
{
  MRURoutingView *v3;

  v3 = objc_alloc_init(MRURoutingView);
  -[MRURoutingViewController setView:](self, "setView:", v3);

}

- (void)viewDidLoad
{
  double top;
  double left;
  double bottom;
  double right;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  objc_class *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  objc_class *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  objc_class *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  uint64_t v34;
  CARSessionStatus *v35;
  CARSessionStatus *carPlaySessionStatus;
  NSNumberFormatter *v37;
  NSNumberFormatter *percentageFormatter;
  MediaControlsInteractionRecognizer *v39;
  void *v40;
  NSObject *v41;
  id v42;
  _QWORD handler[4];
  id v44;
  id location;
  _QWORD block[5];
  objc_super v47;

  v47.receiver = self;
  v47.super_class = (Class)MRURoutingViewController;
  -[MRURoutingViewController viewDidLoad](&v47, sel_viewDidLoad);
  top = self->_contentEdgeInsets.top;
  left = self->_contentEdgeInsets.left;
  bottom = self->_contentEdgeInsets.bottom;
  right = self->_contentEdgeInsets.right;
  -[MRURoutingViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setContentEdgeInsets:", top, left, bottom, right);

  v8 = self->_scrollIndicatorInsets.top;
  v9 = self->_scrollIndicatorInsets.left;
  v10 = self->_scrollIndicatorInsets.bottom;
  v11 = self->_scrollIndicatorInsets.right;
  -[MRURoutingViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "tableView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setScrollIndicatorInsets:", v8, v9, v10, v11);

  -[MRURoutingViewController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "tableView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_opt_class();
  v17 = (objc_class *)objc_opt_class();
  NSStringFromClass(v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "registerClass:forHeaderFooterViewReuseIdentifier:", v16, v18);

  -[MRURoutingViewController view](self, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "tableView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_opt_class();
  v22 = (objc_class *)objc_opt_class();
  NSStringFromClass(v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "registerClass:forHeaderFooterViewReuseIdentifier:", v21, v23);

  -[MRURoutingViewController view](self, "view");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "tableView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_opt_class();
  v27 = (objc_class *)objc_opt_class();
  NSStringFromClass(v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "registerClass:forCellReuseIdentifier:", v26, v28);

  -[MRURoutingViewController view](self, "view");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "tableView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setDataSource:", self);

  -[MRURoutingViewController view](self, "view");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "tableView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setDelegate:", self);

  -[MRURoutingViewController _updateGroupSessionDiscovery](self, "_updateGroupSessionDiscovery");
  dispatch_get_global_queue(0, 0);
  v33 = objc_claimAutoreleasedReturnValue();
  v34 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__MRURoutingViewController_viewDidLoad__block_invoke;
  block[3] = &unk_1E5818C88;
  block[4] = self;
  dispatch_async(v33, block);

  v35 = (CARSessionStatus *)objc_alloc_init(MEMORY[0x1E0D0D340]);
  carPlaySessionStatus = self->_carPlaySessionStatus;
  self->_carPlaySessionStatus = v35;

  -[CARSessionStatus addSessionObserver:](self->_carPlaySessionStatus, "addSessionObserver:", self);
  v37 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x1E0CB37F0]);
  percentageFormatter = self->_percentageFormatter;
  self->_percentageFormatter = v37;

  -[NSNumberFormatter setNumberStyle:](self->_percentageFormatter, "setNumberStyle:", 3);
  -[NSNumberFormatter setUsesSignificantDigits:](self->_percentageFormatter, "setUsesSignificantDigits:", 0);
  -[NSNumberFormatter setUsesGroupingSeparator:](self->_percentageFormatter, "setUsesGroupingSeparator:", 0);
  v39 = -[MediaControlsInteractionRecognizer initWithTarget:action:]([MediaControlsInteractionRecognizer alloc], "initWithTarget:action:", self, sel_didReceiveInteraction_);
  -[MediaControlsInteractionRecognizer setCancelsTouchesInView:](v39, "setCancelsTouchesInView:", 0);
  -[MRURoutingViewController view](self, "view");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "addGestureRecognizer:", v39);

  -[MediaControlsInteractionRecognizer setDelegate:](v39, "setDelegate:", self);
  objc_initWeak(&location, self);
  v41 = MEMORY[0x1E0C80D38];
  v42 = MEMORY[0x1E0C80D38];
  handler[0] = v34;
  handler[1] = 3221225472;
  handler[2] = __39__MRURoutingViewController_viewDidLoad__block_invoke_2;
  handler[3] = &unk_1E581A290;
  objc_copyWeak(&v44, &location);
  notify_register_dispatch("com.apple.mediaplayer.airPlayPasswordAlertDidCancel", &self->_airPlayPasswordAlertDidCancelToken, v41, handler);

  self->_didLastPickNativeRoute = 0;
  objc_destroyWeak(&v44);
  objc_destroyWeak(&location);

}

void __39__MRURoutingViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD *v3;
  void *v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D48560], "sharedAVSystemController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (_QWORD *)MEMORY[0x1E0D48270];
  v6[0] = *MEMORY[0x1E0D48270];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAttribute:forKey:error:", v4, *MEMORY[0x1E0D48280], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel_playingSessionsDidChangeNotification_, *v3, 0);

}

void __39__MRURoutingViewController_viewDidLoad__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "routingController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "clearCachedRoutes");

    objc_msgSend(v3, "_setNeedsDisplayedRoutesUpdate");
    WeakRetained = v3;
  }

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MRURoutingViewController;
  -[MRURoutingViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[MRURoutingViewController setOnScreen:](self, "setOnScreen:", 1);
  -[MRURoutingViewController playingSessionsDidChangeNotification:](self, "playingSessionsDidChangeNotification:", 0);
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MRURoutingViewController;
  -[MRURoutingViewController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  -[MRURoutingViewController setOnScreen:](self, "setOnScreen:", 0);
}

- (void)viewDidDisappear:(BOOL)a3
{
  MPWeakTimer *updateTimer;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MRURoutingViewController;
  -[MRURoutingViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, a3);
  -[MPWeakTimer invalidate](self->_updateTimer, "invalidate");
  updateTimer = self->_updateTimer;
  self->_updateTimer = 0;

  -[NSTimer invalidate](self->_collapseTimer, "invalidate");
  -[MRURoutingViewController _collapseAllGroups](self, "_collapseAllGroups");
  -[MRURoutingViewController resetDisplayedRoutes](self, "resetDisplayedRoutes");
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  MPWeakTimer *updateTimer;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MRURoutingViewController;
  -[MRURoutingViewController viewDidMoveToWindow:shouldAppearOrDisappear:](&v6, sel_viewDidMoveToWindow_shouldAppearOrDisappear_, a3, a4);
  if (!self->_onScreen)
  {
    -[MPWeakTimer invalidate](self->_updateTimer, "invalidate");
    updateTimer = self->_updateTimer;
    self->_updateTimer = 0;

  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setDiscoveryMode:(int64_t)a3
{
  if (self->_discoveryMode != a3)
  {
    self->_discoveryMode = a3;
    -[MRURoutingViewController _setNeedsRouteDiscoveryModeUpdate](self, "_setNeedsRouteDiscoveryModeUpdate");
  }
}

- (void)setOnScreen:(BOOL)a3
{
  void *v4;
  id v5;

  if (self->_onScreen != a3)
  {
    self->_onScreen = a3;
    -[MRURoutingViewController _setNeedsRouteDiscoveryModeUpdate](self, "_setNeedsRouteDiscoveryModeUpdate");
    -[MRURoutingViewController _setNeedsDisplayedRoutesUpdate](self, "_setNeedsDisplayedRoutesUpdate");
    -[MRURoutingViewController updateMetadata](self, "updateMetadata");
    -[MRURoutingViewController updateSubtitle](self, "updateSubtitle");
    if (self->_onScreen)
    {
      -[MRURoutingViewController view](self, "view");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "tableView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "reloadData");

    }
  }
}

- (void)setVolumeGroupCoordinator:(id)a3
{
  MRUVolumeGroupCoordinator *v5;
  MRUVolumeGroupCoordinator *volumeGroupCoordinator;
  NSDictionary *outputDeviceVolumeControllers;
  MRUVolumeGroupCoordinator *v8;

  v5 = (MRUVolumeGroupCoordinator *)a3;
  volumeGroupCoordinator = self->_volumeGroupCoordinator;
  v8 = v5;
  if (volumeGroupCoordinator != v5)
  {
    -[MRUVolumeGroupCoordinator setVolumeControllers:](volumeGroupCoordinator, "setVolumeControllers:", 0);
    objc_storeStrong((id *)&self->_volumeGroupCoordinator, a3);
    outputDeviceVolumeControllers = self->_outputDeviceVolumeControllers;
    self->_outputDeviceVolumeControllers = 0;

  }
  -[MRURoutingViewController _reloadDisplayedRoutes](self, "_reloadDisplayedRoutes");

}

- (void)setNowPlayingControllers:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  char v21;
  id v22;
  void *v23;
  void *v24;
  MRURoutingViewController *v25;
  id obj;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  void *v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_storeStrong((id *)&self->_nowPlayingControllers, a3);
  v25 = self;
  v6 = (void *)-[NSArray mutableCopy](self->_cachedDisplayableAvailableRoutes, "mutableCopy");
  v7 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(v6, "msv_compactMap:", &__block_literal_global_27);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = v5;
  v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
  if (v28)
  {
    v27 = *(_QWORD *)v36;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v36 != v27)
          objc_enumerationMutation(obj);
        v30 = v10;
        objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * v10), "endpointController");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "route");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "endpointObject");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        v33 = 0u;
        v34 = 0u;
        v31 = 0u;
        v32 = 0u;
        v29 = v13;
        objc_msgSend(v13, "outputDevices");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v32;
          do
          {
            for (i = 0; i != v16; ++i)
            {
              if (*(_QWORD *)v32 != v17)
                objc_enumerationMutation(v14);
              v19 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
              objc_msgSend(v19, "uid");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v21 = objc_msgSend(v9, "containsObject:", v20);

              if ((v21 & 1) == 0)
              {
                v22 = objc_alloc(MEMORY[0x1E0CC22F8]);
                v39 = v19;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v39, 1);
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                v24 = (void *)objc_msgSend(v22, "initWithOutputDevices:", v23);
                objc_msgSend(v6, "addObject:", v24);

              }
            }
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
          }
          while (v16);
        }

        v10 = v30 + 1;
      }
      while (v30 + 1 != v28);
      v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
    }
    while (v28);
  }

  -[MRURoutingViewController updateNowPlayingControllersForRoutes:](v25, "updateNowPlayingControllersForRoutes:", v6);
  -[MRURoutingViewController updateMetadata](v25, "updateMetadata");

}

uint64_t __53__MRURoutingViewController_setNowPlayingControllers___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "routeUID");
}

- (void)setPresentingAppBundleID:(id)a3
{
  NSString *v5;
  NSString *v6;
  char v7;
  NSString *v8;

  v8 = (NSString *)a3;
  v5 = self->_presentingAppBundleID;
  if (v5 == v8)
  {

  }
  else
  {
    v6 = v5;
    v7 = -[NSString isEqual:](v5, "isEqual:", v8);

    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_presentingAppBundleID, a3);
      -[MRURoutingViewController _updateGroupSessionDiscovery](self, "_updateGroupSessionDiscovery");
    }
  }

}

- (void)setGroupSessionDiscovery:(id)a3
{
  MRGroupSessionDiscovery *v5;
  MRGroupSessionDiscovery *v6;
  MRGroupSessionDiscovery *v7;
  char v8;
  NSObject *v9;
  _BOOL4 v10;
  NSString *presentingAppBundleID;
  _DWORD v12[2];
  __int16 v13;
  NSString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = (MRGroupSessionDiscovery *)a3;
  v6 = self->_groupSessionDiscovery;
  if (v6 == v5)
  {

  }
  else
  {
    v7 = v6;
    v8 = -[MRGroupSessionDiscovery isEqual:](v5, "isEqual:", v6);

    if ((v8 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_groupSessionDiscovery, a3);
      MCLogCategoryDefault();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = self->_groupSessionDiscovery != 0;
        presentingAppBundleID = self->_presentingAppBundleID;
        v12[0] = 67109378;
        v12[1] = v10;
        v13 = 2114;
        v14 = presentingAppBundleID;
        _os_log_impl(&dword_1AA991000, v9, OS_LOG_TYPE_DEFAULT, "[MRURoutingViewController] GroupSession discovery enabled: %{BOOL}u. PresentingBundle: %{public}@", (uint8_t *)v12, 0x12u);
      }

      -[MRURoutingViewController _updateDisplayedRoutes](self, "_updateDisplayedRoutes");
    }
  }

}

- (BOOL)isInCarPlay
{
  void *v2;
  BOOL v3;

  -[CARSessionStatus currentSession](self->_carPlaySessionStatus, "currentSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)hasCarKitRoute
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[MPAVRoutingController availableRoutes](self->_routingController, "availableRoutes", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "routeSubtype") == 19)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)isInVehicle
{
  return -[MRURoutingViewController isInCarPlay](self, "isInCarPlay")
      || -[MRURoutingViewController hasCarKitRoute](self, "hasCarKitRoute");
}

- (BOOL)canUseUncoalescedResults
{
  void *v2;
  BOOL v3;

  -[MRUVendorSpecificDeviceManager devices](self->_vendorSpecificManager, "devices");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") == 0;

  return v3;
}

- (BOOL)shouldSuppressNativeRoutesStatusDisplay
{
  void *v3;
  BOOL v4;
  void *v5;

  -[MRUVendorSpecificDeviceManager activatedDeviceIDs](self->_vendorSpecificManager, "activatedDeviceIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3 || self->_presentingAppHasActiveAVSession)
    return 0;
  -[MRUVendorSpecificDeviceManager activatedDeviceIDs](self->_vendorSpecificManager, "activatedDeviceIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
    v4 = !self->_didLastPickNativeRoute;
  else
    v4 = 0;

  return v4;
}

- (void)resetDisplayedRoutes
{
  self->_hasUserSelections = 0;
  self->_didSelectShowMore = 0;
  -[MRURoutingViewController _updateDisplayedRoutes](self, "_updateDisplayedRoutes");
}

- (void)setStylingProvider:(id)a3
{
  objc_storeStrong((id *)&self->_stylingProvider, a3);
  -[MRURoutingViewController _setNeedsDisplayedRoutesUpdate](self, "_setNeedsDisplayedRoutesUpdate");
}

- (void)setContentEdgeInsets:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;
  void *v8;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  self->_contentEdgeInsets = a3;
  -[MRURoutingViewController viewIfLoaded](self, "viewIfLoaded");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setContentEdgeInsets:", top, left, bottom, right);

  -[MRURoutingViewController _reloadDisplayedRoutes](self, "_reloadDisplayedRoutes");
}

- (void)setScrollIndicatorInsets:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;
  void *v7;
  id v8;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  self->_scrollIndicatorInsets = a3;
  -[MRURoutingViewController view](self, "view");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setScrollIndicatorInsets:", top, left, bottom, right);

}

- (void)setVendorSpecificManager:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a3;
  if (v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->_vendorSpecificManager, a3);
    -[MRUVendorSpecificDeviceManager setDelegate:](self->_vendorSpecificManager, "setDelegate:", self);
    -[MRURoutingViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "tableView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "reloadData");

    v5 = v8;
  }

}

- (void)setCustomRows:(id)a3
{
  id v5;
  NSMutableArray *v6;
  NSMutableArray *staticCustomRowItems;
  id v8;
  __int128 v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  char v28;
  uint64_t v29;
  NSObject *v30;
  void *v31;
  NSMutableArray *v32;
  void *v33;
  void *v34;
  void *v35;
  __int128 v36;
  uint64_t v37;
  id v38;
  MRURoutingViewController *v39;
  id v40;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  void *v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_storeStrong((id *)&self->_customRows, a3);
  v39 = self;
  if (!self->_staticCustomRowItems)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    v6 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    staticCustomRowItems = self->_staticCustomRowItems;
    self->_staticCustomRowItems = v6;

  }
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v8 = v5;
  v41 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
  if (v41)
  {
    v10 = *(_QWORD *)v43;
    v11 = 0x1E0D3A000uLL;
    *(_QWORD *)&v9 = 138412546;
    v36 = v9;
    v37 = *(_QWORD *)v43;
    v38 = v8;
    do
    {
      for (i = 0; i != v41; ++i)
      {
        if (*(_QWORD *)v43 != v10)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
        objc_msgSend(v13, "type", v36);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = *(void **)(v11 + 2104);
        objc_msgSend(v14, "identifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "symbolForTypeIdentifier:error:", v16, 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17)
        {
          objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "scale");
          objc_msgSend(v17, "imageForSize:scale:", 20.0, 20.0, v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCGImage:", objc_msgSend(v20, "CGImage"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "imageWithRenderingMode:", 2);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (v22)
          {
            v40 = v22;
            objc_msgSend(v14, "localizedDescription");
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            if (v23)
            {
              objc_msgSend(v14, "localizedDescription");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "titleOverride");
              v25 = objc_claimAutoreleasedReturnValue();
              if (v25)
              {
                v26 = (void *)v25;
                objc_msgSend(v13, "titleOverride");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                v28 = objc_msgSend(v27, "isEqualToString:", &stru_1E581FBA8);

                if ((v28 & 1) == 0)
                {
                  objc_msgSend(v13, "titleOverride");
                  v29 = objc_claimAutoreleasedReturnValue();

                  v24 = (void *)v29;
                }
              }
              MCLogCategoryDeviceAccess();
              v30 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v13, "identifier");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = v36;
                v47 = v24;
                v48 = 2112;
                v49 = v31;
                _os_log_impl(&dword_1AA991000, v30, OS_LOG_TYPE_DEFAULT, "MRURoutingViewController - Adding Custom Row with title: %@, identifier: %@", buf, 0x16u);

              }
              v32 = v39->_staticCustomRowItems;
              v33 = (void *)MEMORY[0x1E0CC2320];
              objc_msgSend(v13, "identifier");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "itemWithVendorSpecificCustomRowTitle:icon:identifier:", v24, v40, v34);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableArray addObject:](v32, "addObject:", v35);

              v10 = v37;
              v8 = v38;
              v11 = 0x1E0D3A000;
            }
          }

        }
      }
      v41 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
    }
    while (v41);
  }

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return -[MPSectionedCollection numberOfSections](self->_routingViewItems, "numberOfSections", a3);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return -[MPSectionedCollection numberOfItemsInSection:](self->_routingViewItems, "numberOfItemsInSection:", a4);
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  _BOOL4 v4;
  double result;

  if (!a4)
    return 0.0;
  v4 = +[MRUFeatureFlagProvider isNewControlsEnabled](MRUFeatureFlagProvider, "isNewControlsEnabled", a3);
  result = *MEMORY[0x1E0DC53D8];
  if (v4)
    return 4.5;
  return result;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  return 52.0;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;

  objc_msgSend(MEMORY[0x1E0DC1350], "mru_routingTitleFont", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lineHeight");

  objc_msgSend(MEMORY[0x1E0DC1350], "mru_routingSubtitleFont");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lineHeight");

  -[MRURoutingViewController traitCollection](self, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "displayScale");
  UIRoundToScale();
  v9 = v8;

  return v9;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a4;
  v7 = a3;
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dequeueReusableCellWithIdentifier:forIndexPath:", v9, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setAccessibilityIdentifier:", 0);
  -[MPSectionedCollection itemAtIndexPath:](self->_routingViewItems, "itemAtIndexPath:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  switch(objc_msgSend(v11, "type"))
  {
    case 3:
    case 4:
      objc_msgSend(v10, "setIsVendorSpecific:", 1);
      -[MRURoutingViewController updateVendorSpecificCell:forIndexPath:](self, "updateVendorSpecificCell:forIndexPath:", v10, v6);
      break;
    case 5:
      objc_msgSend(v10, "setIsVendorSpecific:", 1);
      -[MRURoutingViewController updateVendorSpecificSubRouteCell:forIndexPath:](self, "updateVendorSpecificSubRouteCell:forIndexPath:", v10, v6);
      break;
    case 6:
      objc_msgSend(v10, "setIsVendorSpecific:", 1);
      -[MRURoutingViewController updateVendorSpecificCustomRowCell:forIndexPath:](self, "updateVendorSpecificCustomRowCell:forIndexPath:", v10, v6);
      break;
    case 7:
      objc_msgSend(v10, "setIsVendorSpecific:", 1);
      -[MRURoutingViewController updateVendorSpecificSpeakerGroupCell:forIndexPath:](self, "updateVendorSpecificSpeakerGroupCell:forIndexPath:", v10, v6);
      break;
    default:
      objc_msgSend(v10, "setIsVendorSpecific:", 0);
      -[MRURoutingViewController updateCell:forIndexPath:](self, "updateCell:forIndexPath:", v10, v6);
      break;
  }

  return v10;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6;
  objc_class *v7;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;

  v6 = a3;
  if (a4)
  {
    if (+[MRUFeatureFlagProvider isNewControlsEnabled](MRUFeatureFlagProvider, "isNewControlsEnabled"))
    {
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "dequeueReusableHeaderFooterViewWithIdentifier:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "setStylingProvider:", self->_stylingProvider);
    }
    else
    {
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "dequeueReusableHeaderFooterViewWithIdentifier:", v11);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      -[MRURoutingViewController updateHeaderView:forSection:](self, "updateHeaderView:forSection:", v9, a4);
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  int v12;
  uint64_t v13;
  char isKindOfClass;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  int v20;
  NSObject *v21;
  _BOOL4 v22;
  int v23;
  NSObject *v24;
  void *v25;
  void *v26;
  int v27;
  NSObject *v28;
  MRUVendorSpecificDeviceManager *vendorSpecificManager;
  id v30;
  void *v31;
  NSObject *v32;
  NSObject *v33;
  id v34;
  int v35;
  NSObject *v36;
  _BOOL4 v37;
  NSObject *v38;
  NSObject *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  NSObject *v45;
  id v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t i;
  void *v52;
  NSArray *cachedActivatedVendorSpecificDeviceIDs;
  void *v54;
  MRUVendorSpecificDeviceManager *v55;
  MRUVendorSpecificDeviceManager *v56;
  void *v57;
  id v58;
  NSString *v59;
  NSString *mostRecentlyInteractedVendorSpecificGroupRouteID;
  NSMutableDictionary *vendorSpecificGroupDisplayedSubroutes;
  void *v62;
  MRURoutingViewController *v63;
  void *v64;
  int v65;
  NSObject *v66;
  _BOOL4 v67;
  void *v68;
  id WeakRetained;
  void *v70;
  void *v71;
  id v72;
  id v73;
  void *v74;
  void *v75;
  uint64_t v76;
  uint64_t v77;
  id obj;
  MRURoutingViewController *v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  _BYTE v88[128];
  uint8_t v89[128];
  uint8_t buf[4];
  void *v91;
  uint64_t v92;

  v92 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v7, 1);
  -[MPSectionedCollection itemAtIndexPath:](self->_routingViewItems, "itemAtIndexPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "mainRoute");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[MPAVRoutingController routeIsPendingPick:](self->_routingController, "routeIsPendingPick:", v9) & 1) != 0)
    v10 = 0;
  else
    v10 = objc_msgSend(v9, "isPicked") ^ 1;
  v11 = -[MPAVRoutingController routeIsPendingPick:](self->_routingController, "routeIsPendingPick:", v9);
  if (v11)
    v11 = objc_msgSend(v9, "isPicked");
  v12 = v10 | v11;
  if (v10 | v11)
    v13 = 1;
  else
    v13 = 2;
  objc_msgSend(v6, "cellForRowAtIndexPath:", v7);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v75 = v9;
  isKindOfClass = objc_opt_isKindOfClass();
  if (v12)
  {
    if ((isKindOfClass & 1) != 0)
    {
      v15 = v9;
      objc_msgSend(v9, "connect");
      v16 = v74;
      objc_msgSend(v74, "routingAccessoryView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      v19 = 2;
LABEL_14:
      objc_msgSend(v17, "setState:", v19);

      goto LABEL_91;
    }
  }
  else
  {
    if ((isKindOfClass & 1) != 0)
    {
      v15 = v9;
      objc_msgSend(v9, "disconnect");
      v16 = v74;
      objc_msgSend(v74, "routingAccessoryView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      v19 = 0;
      goto LABEL_14;
    }
    if (objc_msgSend(v9, "isHearingDeviceRoute"))
    {
      +[MRUVirtualHearingAidRoute disconnect](MRUVirtualHearingAidRoute, "disconnect");
      v15 = v9;
      goto LABEL_90;
    }
  }
  v79 = self;
  switch(objc_msgSend(v8, "type"))
  {
    case 0:
    case 1:
      v20 = objc_msgSend(v8, "isPickable");
      MCLogCategoryDeviceAccess();
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
      if (v20)
      {
        if (v22)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1AA991000, v21, OS_LOG_TYPE_DEFAULT, "selected native routes", buf, 2u);
        }

        v23 = -[MRURoutingViewController handleSelectedRoutingViewItem:operation:](self, "handleSelectedRoutingViewItem:operation:", v8, v13);
        goto LABEL_71;
      }
      v15 = v9;
      if (v22)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AA991000, v21, OS_LOG_TYPE_DEFAULT, "selected unpickable native route", buf, 2u);
      }

      goto LABEL_75;
    case 2:
      MCLogCategoryDefault();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v8, "actionIdentifier");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v91 = v25;
        _os_log_impl(&dword_1AA991000, v24, OS_LOG_TYPE_DEFAULT, "[MRURoutingViewController] RCS user selected: %{public}@", buf, 0xCu);

      }
      objc_msgSend(v8, "actionIdentifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "isEqualToString:", CFSTR("Show more"));

      v15 = v9;
      if (v27)
        -[MRURoutingViewController showMoreAction](self, "showMoreAction");
LABEL_75:
      v23 = 1;
      goto LABEL_85;
    case 3:
      MCLogCategoryDeviceAccess();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AA991000, v28, OS_LOG_TYPE_DEFAULT, "selected vendor specific route", buf, 2u);
      }

      v23 = 1;
      self->_hasUserSelections = 1;
      self->_didLastPickNativeRoute = 0;
      vendorSpecificManager = self->_vendorSpecificManager;
      v15 = v9;
      v30 = v9;
      -[MRUVendorSpecificDeviceManager resolverSetLastSelectedRoute:](vendorSpecificManager, "resolverSetLastSelectedRoute:", v30);
      objc_msgSend(v30, "device");
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      -[MRUVendorSpecificDeviceManager setDevice:picked:](self->_vendorSpecificManager, "setDevice:picked:", v31, 1);
      goto LABEL_85;
    case 4:
      MCLogCategoryDeviceAccess();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AA991000, v32, OS_LOG_TYPE_DEFAULT, "selected vendor specific group", buf, 2u);
      }

      v16 = v74;
      if (objc_msgSend(v74, "showChevronExpanded"))
      {
        objc_msgSend(v74, "setShowChevronExpanded:", objc_msgSend(v74, "showChevronExpanded") ^ 1);
        -[MRURoutingViewController vendorSpecificCellDidTapToExpand:](self, "vendorSpecificCellDidTapToExpand:", v74);
        v23 = 1;
        v15 = v9;
        if (v8)
          goto LABEL_86;
      }
      else
      {
        v58 = v9;
        objc_msgSend(v58, "routeUID");
        v59 = (NSString *)objc_claimAutoreleasedReturnValue();
        mostRecentlyInteractedVendorSpecificGroupRouteID = self->_mostRecentlyInteractedVendorSpecificGroupRouteID;
        self->_mostRecentlyInteractedVendorSpecificGroupRouteID = v59;

        vendorSpecificGroupDisplayedSubroutes = self->_vendorSpecificGroupDisplayedSubroutes;
        objc_msgSend(v58, "routeUID");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](vendorSpecificGroupDisplayedSubroutes, "objectForKeyedSubscript:", v62);
        v63 = self;
        v64 = (void *)objc_claimAutoreleasedReturnValue();

        if (v64)
        {
          v63->_hasUserSelections = 1;
          -[MRUVendorSpecificDeviceManager resolverSetLastSelectedRoute:](v63->_vendorSpecificManager, "resolverSetLastSelectedRoute:", v64);
          v65 = objc_msgSend(v64, "isAirPlayRoute");
          MCLogCategoryDeviceAccess();
          v66 = objc_claimAutoreleasedReturnValue();
          v67 = os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT);
          if (v65)
          {
            if (v67)
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1AA991000, v66, OS_LOG_TYPE_DEFAULT, "group row tap -- act on AirPlay subroute", buf, 2u);
            }

            v23 = -[MRURoutingViewController handleSelectedRoutingViewItem:operation:](v79, "handleSelectedRoutingViewItem:operation:", v8, v13);
          }
          else
          {
            if (v67)
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1AA991000, v66, OS_LOG_TYPE_DEFAULT, "group row tap -- act on Vendor Specific subroute", buf, 2u);
            }

            v79->_didLastPickNativeRoute = 0;
            objc_msgSend(v64, "device");
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = 1;
            -[MRUVendorSpecificDeviceManager setDevice:picked:](v79->_vendorSpecificManager, "setDevice:picked:", v70, 1);

          }
          v16 = v74;
          v15 = v9;
        }
        else
        {
          v16 = v74;
          objc_msgSend(v74, "setShowChevronExpanded:", objc_msgSend(v74, "showChevronExpanded") ^ 1);
          -[MRURoutingViewController vendorSpecificCellDidTapToExpand:](v63, "vendorSpecificCellDidTapToExpand:", v74);
          v23 = 1;
          v15 = v9;
        }

        self = v79;
        if (v8)
          goto LABEL_86;
      }
      goto LABEL_91;
    case 5:
      MCLogCategoryDeviceAccess();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AA991000, v33, OS_LOG_TYPE_DEFAULT, "selected vendor specific sub route", buf, 2u);
      }

      self->_hasUserSelections = 1;
      v34 = v9;
      -[MRUVendorSpecificDeviceManager resolverSetLastSelectedRoute:](self->_vendorSpecificManager, "resolverSetLastSelectedRoute:", v34);
      v35 = objc_msgSend(v34, "isAirPlayRoute");
      MCLogCategoryDeviceAccess();
      v36 = objc_claimAutoreleasedReturnValue();
      v37 = os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT);
      if (v35)
      {
        if (v37)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1AA991000, v36, OS_LOG_TYPE_DEFAULT, "sub route is AirPlay", buf, 2u);
        }

        v23 = -[MRURoutingViewController handleSelectedRoutingViewItem:operation:](self, "handleSelectedRoutingViewItem:operation:", v8, v13);
      }
      else
      {
        if (v37)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1AA991000, v36, OS_LOG_TYPE_DEFAULT, "sub route is not AirPlay", buf, 2u);
        }

        self->_didLastPickNativeRoute = 0;
        objc_msgSend(v34, "device");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 1;
        -[MRUVendorSpecificDeviceManager setDevice:picked:](self->_vendorSpecificManager, "setDevice:picked:", v68, 1);

      }
      v15 = v9;

      goto LABEL_85;
    case 6:
      MCLogCategoryDeviceAccess();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AA991000, v38, OS_LOG_TYPE_DEFAULT, "selected vendor specific custom row", buf, 2u);
      }

      goto LABEL_43;
    case 7:
      v72 = v7;
      v73 = v6;
      MCLogCategoryDeviceAccess();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AA991000, v39, OS_LOG_TYPE_DEFAULT, "selected vendor specific speaker group", buf, 2u);
      }

      self->_hasUserSelections = 1;
      v84 = 0u;
      v85 = 0u;
      v86 = 0u;
      v87 = 0u;
      v71 = v8;
      objc_msgSend(v8, "routes");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v84, v89, 16);
      if (!v40)
        goto LABEL_70;
      v41 = v40;
      v42 = *(_QWORD *)v85;
      v76 = *(_QWORD *)v85;
      break;
    default:
LABEL_43:
      v23 = 1;
      goto LABEL_71;
  }
  do
  {
    v43 = 0;
    v77 = v41;
    do
    {
      if (*(_QWORD *)v85 != v42)
        objc_enumerationMutation(obj);
      v44 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * v43);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        MCLogCategoryDeviceAccess();
        v45 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v91 = v44;
          _os_log_impl(&dword_1AA991000, v45, OS_LOG_TYPE_DEFAULT, "Error: VS speaker group contains bad class object: %@", buf, 0xCu);
        }

      }
      v46 = v44;
      if (objc_msgSend(v46, "isGroup"))
      {
        v82 = 0u;
        v83 = 0u;
        v80 = 0u;
        v81 = 0u;
        objc_msgSend(v46, "subroutes");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v80, v88, 16);
        if (v48)
        {
          v49 = v48;
          v50 = *(_QWORD *)v81;
          while (2)
          {
            for (i = 0; i != v49; ++i)
            {
              if (*(_QWORD *)v81 != v50)
                objc_enumerationMutation(v47);
              v52 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * i);
              cachedActivatedVendorSpecificDeviceIDs = self->_cachedActivatedVendorSpecificDeviceIDs;
              objc_msgSend(v52, "routeUID");
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              LODWORD(cachedActivatedVendorSpecificDeviceIDs) = -[NSArray containsObject:](cachedActivatedVendorSpecificDeviceIDs, "containsObject:", v54);

              if ((_DWORD)cachedActivatedVendorSpecificDeviceIDs)
              {
                self = v79;
                v56 = v79->_vendorSpecificManager;
                objc_msgSend(v52, "device");
                v57 = (void *)objc_claimAutoreleasedReturnValue();
                -[MRUVendorSpecificDeviceManager setDevice:picked:](v56, "setDevice:picked:", v57, 1);

                goto LABEL_67;
              }
              self = v79;
            }
            v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v80, v88, 16);
            if (v49)
              continue;
            break;
          }
LABEL_67:
          v42 = v76;
          v41 = v77;
        }
      }
      else
      {
        v55 = self->_vendorSpecificManager;
        objc_msgSend(v46, "device");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        -[MRUVendorSpecificDeviceManager setDevice:picked:](v55, "setDevice:picked:", v47, 1);
      }

      ++v43;
    }
    while (v43 != v41);
    v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v84, v89, 16);
  }
  while (v41);
LABEL_70:

  v23 = 1;
  v7 = v72;
  v6 = v73;
  v8 = v71;
LABEL_71:
  v15 = v75;
LABEL_85:
  v16 = v74;
  if (v8)
  {
LABEL_86:
    if (!v23)
      goto LABEL_91;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "routingViewController:didSelectRoutingViewItem:", self, v8);

LABEL_90:
    v16 = v74;
  }
LABEL_91:

}

- (BOOL)tableView:(id)a3 shouldHaveFullLengthBottomSeparatorForSection:(int64_t)a4
{
  id v5;
  BOOL v6;

  v5 = a3;
  v6 = +[MRUFeatureFlagProvider isNewControlsEnabled](MRUFeatureFlagProvider, "isNewControlsEnabled")
    || objc_msgSend(v5, "numberOfSections") - 1 == a4;

  return v6;
}

- (void)vendorSpecificManagerDeviceListDidChange:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  MCLogCategoryDeviceAccess();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1AA991000, v4, OS_LOG_TYPE_DEFAULT, "DA device list did change - vendorSpecificManagerDeviceListDidChange", v5, 2u);
  }

  -[MRURoutingViewController _refreshDisplayedRoutes](self, "_refreshDisplayedRoutes");
}

- (void)vendorSpecificManager:(id)a3 deviceStateDidChange:(id)a4
{
  NSObject *v5;
  uint8_t v6[16];

  MCLogCategoryDeviceAccess();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1AA991000, v5, OS_LOG_TYPE_DEFAULT, "DA - deviceStateDidChange", v6, 2u);
  }

  -[MRURoutingViewController _updateDisplayedRoutes](self, "_updateDisplayedRoutes");
}

- (void)vendorSpecificManager:(id)a3 deviceNowPlayingInfoDidChange:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  MRURoutingViewController *v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  char v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  id obj;
  MRURoutingViewController *v41;
  uint64_t v42;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[MRURoutingViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "indexPathsForVisibleRows");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = self;
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  obj = v8;
  v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
  if (v43)
  {
    v41 = self;
    v42 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v43; ++i)
      {
        if (*(_QWORD *)v45 != v42)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * i);
        -[MPSectionedCollection safeItemAtIndexPath:](v9->_routingViewItems, "safeItemAtIndexPath:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "type") == 5)
        {
          objc_msgSend(v12, "mainRoute");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "device");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "identifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "identifier");
          v16 = v5;
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v15, "isEqualToString:", v17);

          if (v18)
          {
            -[MRURoutingViewController view](v9, "view");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "tableView");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "cellForRowAtIndexPath:", v11);
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            v22 = objc_msgSend(v16, "mediaPlaybackState");
            objc_msgSend(v21, "subtitleStateController");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "nowPlayingSubtitle");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            if (v22 == 2)
              v25 = 2;
            else
              v25 = 1;
            objc_msgSend(v23, "setText:forState:accessory:", v24, 3, v25);
            v5 = v16;
            goto LABEL_24;
          }
          v5 = v16;
LABEL_26:

          goto LABEL_27;
        }
        if (objc_msgSend(v12, "type") == 3 || objc_msgSend(v12, "type") == 4)
        {
          objc_msgSend(v12, "mainRoute");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v13, "isGroup"))
          {
            objc_msgSend(v13, "preferredSubroute");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "device");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "identifier");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "identifier");
            v29 = v5;
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = objc_msgSend(v28, "isEqualToString:", v30);

            v5 = v29;
            if ((v31 & 1) == 0)
            {
LABEL_25:
              v9 = v41;
              goto LABEL_26;
            }
          }
          else
          {
            objc_msgSend(v13, "device");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "identifier");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "identifier");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = objc_msgSend(v33, "isEqualToString:", v34);

            if (!v35)
              goto LABEL_25;
          }
          -[MRURoutingViewController view](v41, "view");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "tableView");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "cellForRowAtIndexPath:", v11);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v21)
            goto LABEL_25;
          v38 = objc_msgSend(v5, "mediaPlaybackState");
          objc_msgSend(v21, "subtitleStateController");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "nowPlayingSubtitle");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          if (v38 == 2)
            v39 = 2;
          else
            v39 = 1;
          objc_msgSend(v23, "setText:forState:accessory:", v24, 3, v39);
          v9 = v41;
LABEL_24:

          goto LABEL_26;
        }
LABEL_27:

      }
      v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
    }
    while (v43);
  }

}

- (void)vendorSpecificCellDidTapToExpand:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSString *v9;
  NSString *mostRecentlyInteractedVendorSpecificGroupRouteID;
  id obj;

  v4 = a3;
  -[MRURoutingViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "indexPathForCell:", v4);
  obj = (id)objc_claimAutoreleasedReturnValue();

  -[MPSectionedCollection itemAtIndexPath:](self->_routingViewItems, "itemAtIndexPath:", obj);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "mainRoute");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "routeUID");
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  mostRecentlyInteractedVendorSpecificGroupRouteID = self->_mostRecentlyInteractedVendorSpecificGroupRouteID;
  self->_mostRecentlyInteractedVendorSpecificGroupRouteID = v9;

  objc_msgSend(v8, "setExpanded:", objc_msgSend(v4, "showChevronExpanded"));
  -[MRURoutingViewController updateVendorSpecificGroupExpandedRecordFor:](self, "updateVendorSpecificGroupExpandedRecordFor:", v8);
  LODWORD(v7) = objc_msgSend(v4, "showChevronExpanded");

  if ((_DWORD)v7)
    objc_storeStrong((id *)&self->_vendorSpecificGroupThatWasJustExpanded, obj);
  -[MRURoutingViewController _refreshDisplayedRoutes](self, "_refreshDisplayedRoutes");

}

- (void)routingControllerAvailableRoutesDidChange:(id)a3
{
  unint64_t updatesSincePresentation;

  updatesSincePresentation = self->_updatesSincePresentation;
  self->_updatesSincePresentation = updatesSincePresentation + 1;
  if (updatesSincePresentation > 4)
    -[MRURoutingViewController _setNeedsDisplayedRoutesUpdate](self, "_setNeedsDisplayedRoutesUpdate", a3);
  else
    -[MRURoutingViewController _updateDisplayedRoutes](self, "_updateDisplayedRoutes", a3);
}

- (void)routingController:(id)a3 shouldHijackRoute:(id)a4 alertStyle:(int64_t)a5 busyRouteName:(id)a6 presentingAppName:(id)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  MRURoutingViewController *v33;
  void *v34;
  _QWORD v35[4];
  id v36;
  _QWORD v37[4];
  id v38;

  v14 = a3;
  v15 = a4;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v34 = v14;
  v32 = v16;
  v33 = self;
  if (!a5)
  {
    if (objc_msgSend(v15, "isTVRoute"))
    {
      +[MRUStringsProvider routingHijackTVTitle](MRUStringsProvider, "routingHijackTVTitle");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      +[MRUStringsProvider routingHijackTVMessage](MRUStringsProvider, "routingHijackTVMessage");
    }
    else
    {
      +[MRUStringsProvider routingHijackSpeakerTitle](MRUStringsProvider, "routingHijackSpeakerTitle");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      +[MRUStringsProvider routingHijackSpeakerMessage](MRUStringsProvider, "routingHijackSpeakerMessage");
    }
    v20 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  if (a5 == 1)
  {
    +[MRUStringsProvider routingHijackLocalTitle:](MRUStringsProvider, "routingHijackLocalTitle:", v16);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[MRUStringsProvider routingHijackLocalMessagePresentingApp:busyRouteName:](MRUStringsProvider, "routingHijackLocalMessagePresentingApp:busyRouteName:", v17, v16);
    v20 = objc_claimAutoreleasedReturnValue();
LABEL_9:
    v21 = (void *)v20;
    goto LABEL_10;
  }
  v21 = 0;
  v19 = 0;
LABEL_10:
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v19, v21, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)MEMORY[0x1E0DC3448];
  +[MRUStringsProvider routingHijackCancelTitle](MRUStringsProvider, "routingHijackCancelTitle");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = MEMORY[0x1E0C809B0];
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __118__MRURoutingViewController_routingController_shouldHijackRoute_alertStyle_busyRouteName_presentingAppName_completion___block_invoke;
  v37[3] = &unk_1E581A6A0;
  v26 = v18;
  v38 = v26;
  objc_msgSend(v23, "actionWithTitle:style:handler:", v24, 1, v37);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addAction:", v27);

  v28 = (void *)MEMORY[0x1E0DC3448];
  +[MRUStringsProvider routingHijackConfirmTitle](MRUStringsProvider, "routingHijackConfirmTitle");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v25;
  v35[1] = 3221225472;
  v35[2] = __118__MRURoutingViewController_routingController_shouldHijackRoute_alertStyle_busyRouteName_presentingAppName_completion___block_invoke_2;
  v35[3] = &unk_1E581A6A0;
  v36 = v26;
  v30 = v26;
  objc_msgSend(v28, "actionWithTitle:style:handler:", v29, 0, v35);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addAction:", v31);

  -[MRURoutingViewController showViewController:sender:](v33, "showViewController:sender:", v22, v33);
}

uint64_t __118__MRURoutingViewController_routingController_shouldHijackRoute_alertStyle_busyRouteName_presentingAppName_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __118__MRURoutingViewController_routingController_shouldHijackRoute_alertStyle_busyRouteName_presentingAppName_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)routingCellDidTapToExpand:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSMutableSet *expandedRouteUIDs;
  void *v12;
  void *v13;
  int v14;
  NSMutableSet *v15;
  void *v16;
  id v17;

  v17 = a3;
  -[MRURoutingViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indexPathForCell:", v17);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPSectionedCollection itemAtIndexPath:](self->_routingViewItems, "itemAtIndexPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v7, "isExpandable");
  v8 = objc_msgSend(v7, "type");
  if ((_DWORD)v5)
  {
    if (v8 == 1)
    {
      objc_msgSend(v7, "mainRoute");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRURoutingViewController groupUIDForRoute:](self, "groupUIDForRoute:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      -[NSMutableSet addObject:](self->_expandedGroupUIDs, "addObject:", v10);
    }
    else
    {
      expandedRouteUIDs = self->_expandedRouteUIDs;
      objc_msgSend(v7, "mainRoute");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "routeUID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[NSMutableSet containsObject:](expandedRouteUIDs, "containsObject:", v13);

      v15 = self->_expandedRouteUIDs;
      objc_msgSend(v7, "mainRoute");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "routeUID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
        -[NSMutableSet removeObject:](v15, "removeObject:", v16);
      else
        -[NSMutableSet addObject:](v15, "addObject:", v16);

    }
    goto LABEL_13;
  }
  if (v8 == 4)
  {
    -[MRURoutingViewController vendorSpecificCellDidTapToExpand:](self, "vendorSpecificCellDidTapToExpand:", v17);
  }
  else if (objc_msgSend(v7, "type") == 7)
  {
    self->_didExpandVendorSpecificSpeakerGroup = 1;
    self->_hasUserSelections = 0;
LABEL_13:
    -[MRURoutingViewController _updateDisplayedRoutes](self, "_updateDisplayedRoutes");
  }

}

- (BOOL)nowPlayingControllerShouldAutomaticallyUpdateResponse:(id)a3
{
  return self->_onScreen;
}

- (void)sessionDidConnect:(id)a3
{
  NSObject *v4;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  MCLogCategoryDefault();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5[0] = 67109120;
    v5[1] = -[MRURoutingViewController isInCarPlay](self, "isInCarPlay");
    _os_log_impl(&dword_1AA991000, v4, OS_LOG_TYPE_INFO, "[MRURoutingViewController] CarPlay connected: %{BOOL}u", (uint8_t *)v5, 8u);
  }

  -[MRURoutingViewController _refreshDisplayedRoutes](self, "_refreshDisplayedRoutes");
}

- (void)sessionDidDisconnect:(id)a3
{
  NSObject *v4;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  MCLogCategoryDefault();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5[0] = 67109120;
    v5[1] = -[MRURoutingViewController isInCarPlay](self, "isInCarPlay");
    _os_log_impl(&dword_1AA991000, v4, OS_LOG_TYPE_INFO, "[MRURoutingViewController] CarPlay disconnected: %{BOOL}u", (uint8_t *)v5, 8u);
  }

  -[MRURoutingViewController _refreshDisplayedRoutes](self, "_refreshDisplayedRoutes");
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

uint64_t __65__MRURoutingViewController_playingSessionsDidChangeNotification___block_invoke_181(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1144) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "_refreshDisplayedRoutes");
}

- (void)setEndpointRoute:(id)a3
{
  MPAVEndpointRoute *v5;

  v5 = (MPAVEndpointRoute *)a3;
  if (self->_endpointRoute != v5)
  {
    objc_storeStrong((id *)&self->_endpointRoute, a3);
    msv_dispatch_on_main_queue();
  }

}

void __45__MRURoutingViewController_setEndpointRoute___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  MRURoutingViewControllerUpdate *v4;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 1256);
  *(_QWORD *)(v2 + 1256) = 0;

  v4 = objc_alloc_init(MRURoutingViewControllerUpdate);
  -[MRURoutingViewControllerUpdate setShouldReload:](v4, "setShouldReload:", 1);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1121) = 0;
  objc_msgSend(*(id *)(a1 + 32), "_enqueueUpdate:", v4);

}

- (BOOL)_operationRequiresOptimisticState:(int64_t)a3 routes:(id)a4
{
  id v5;
  int v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  BOOL v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v16 = 0u;
  v17 = 0u;
  v6 = (unint64_t)objc_msgSend(v5, "count") > 1;
  v18 = 0u;
  v19 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        v10 |= objc_msgSend(v13, "isDeviceRoute", (_QWORD)v16);
        v6 &= objc_msgSend(v13, "isSmartAudio");
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);

    if (((a3 == 1) & v10) == 1 && objc_msgSend(v7, "count") == 1)
    {
      v14 = 1;
      goto LABEL_15;
    }
  }
  else
  {

  }
  if (a3 == 2)
    v14 = v6;
  else
    v14 = 0;
LABEL_15:

  return v14;
}

- (void)updateVendorSpecificSubRouteCell:(id)a3 forIndexPath:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  _BOOL4 v17;
  int64_t v18;
  uint64_t v19;
  _BOOL4 v20;
  BOOL v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  int v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  MCLogCategoryDeviceAccess();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v32 = 138412290;
    v33 = v7;
    _os_log_impl(&dword_1AA991000, v8, OS_LOG_TYPE_DEFAULT, "updateVendorSpecificSubRouteCell forIndexPath: %@", (uint8_t *)&v32, 0xCu);
  }

  -[MPSectionedCollection itemAtIndexPath:](self->_routingViewItems, "itemAtIndexPath:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "mainRoute");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "protocolIcon");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setProtocolIcon:", v11);

  objc_msgSend(v10, "protocolName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setProtocolName:", v12);

  objc_msgSend(v10, "protocolIcon");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setIconImage:", v13);

  objc_msgSend(v10, "protocolName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitle:", v14);

  objc_msgSend(v6, "setIndentationLevel:", 1);
  if (objc_msgSend(v10, "isAirPlayRoute"))
  {
    objc_msgSend(v10, "underlyingNativeRoute");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "supportsAirPlayGrouping"))
      v16 = -[MRURoutingViewController routesContainAirPlayGroupableRoute:](self, "routesContainAirPlayGroupableRoute:", self->_cachedDisplayAsPickedRoutes);
    else
      v16 = 0;
    v20 = -[NSArray containsObject:](self->_cachedDisplayAsPickedRoutes, "containsObject:", v15);
    v21 = -[NSArray containsObject:](self->_cachedPendingPickedRoutes, "containsObject:", v15);
    objc_msgSend(v6, "routingAccessoryView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v21)
    {
      v24 = 2;
    }
    else if (v20)
    {
      if (v16)
        v24 = 4;
      else
        v24 = 3;
    }
    else
    {
      v24 = v16;
    }
    objc_msgSend(v22, "setState:", v24);
  }
  else
  {
    objc_msgSend(v10, "device");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[MRUVendorSpecificDeviceManager isGroupingAvailableForDevice:](self->_vendorSpecificManager, "isGroupingAvailableForDevice:", v15);
    v18 = -[MRUVendorSpecificDeviceManager latestStateForDevice:](self->_vendorSpecificManager, "latestStateForDevice:", v15);
    if (v18 == 10 || v18 == 30)
    {
      objc_msgSend(v6, "routingAccessoryView");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v25;
      v27 = 2;
    }
    else
    {
      if (v18 == 20)
      {
        if (v17)
          v19 = 4;
        else
          v19 = 3;
      }
      else
      {
        v19 = v17;
      }
      objc_msgSend(v6, "routingAccessoryView");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v25;
      v27 = v19;
    }
    objc_msgSend(v25, "setState:", v27);

    v28 = objc_msgSend(v15, "mediaPlaybackState");
    objc_msgSend(v6, "subtitleStateController");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "nowPlayingSubtitle");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v28 == 2)
      v30 = 2;
    else
      v30 = 1;
    objc_msgSend(v23, "setText:forState:accessory:", v29, 3, v30);

  }
  -[MRURoutingViewController contentEdgeInsets](self, "contentEdgeInsets");
  objc_msgSend(v6, "setContentEdgeInsets:");
  -[MRURoutingViewController stylingProvider](self, "stylingProvider");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setStylingProvider:", v31);

}

- (void)updateVendorSpecificCell:(id)a3 forIndexPath:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSMutableSet *expandedVendorSpecificGroupUIDs;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  char v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  void *v39;
  MRUVendorSpecificDeviceManager *vendorSpecificManager;
  void *v41;
  unsigned int v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  _BOOL4 v51;
  int64_t v52;
  uint64_t v53;
  void *v54;
  void *v55;
  uint64_t v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t j;
  void *v62;
  id v63;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  uint64_t v70;
  void *v71;
  id v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t k;
  void *v77;
  id v78;
  NSMutableDictionary *vendorSpecificGroupDisplayedSubroutes;
  void *v80;
  void *v81;
  void *v82;
  int v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  uint64_t v88;
  void *v89;
  void *v90;
  NSDictionary *outputDeviceVolumeControllers;
  void *v92;
  void *v93;
  void *v94;
  uint64_t v95;
  void *v96;
  void *v97;
  uint64_t v98;
  id v99;
  void *v100;
  void *v101;
  NSDictionary *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  uint64_t v109;
  uint64_t v110;
  void *v111;
  void *v112;
  void *v113;
  id v114;
  void *v115;
  id v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  _QWORD v133[5];
  _QWORD v134[4];
  id v135;
  MRURoutingViewController *v136;
  _BYTE v137[128];
  _BYTE v138[128];
  uint8_t v139[128];
  uint8_t buf[4];
  id v141;
  uint64_t v142;

  v142 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  MCLogCategoryDeviceAccess();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v141 = v7;
    _os_log_impl(&dword_1AA991000, v8, OS_LOG_TYPE_DEFAULT, "updateVendorSpecificCell forIndexPath: %@", buf, 0xCu);
  }

  -[MPSectionedCollection itemAtIndexPath:](self->_routingViewItems, "itemAtIndexPath:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "mainRoute");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  MCLogCategoryDeviceAccess();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v10, "routeName");
    v12 = v10;
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v141 = v13;
    _os_log_impl(&dword_1AA991000, v11, OS_LOG_TYPE_DEFAULT, "updateVendorSpecificCell device: %@", buf, 0xCu);

    v10 = v12;
  }

  objc_msgSend(v10, "device");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "isGroup") & 1) != 0)
  {
    objc_msgSend(v6, "setEnabled:", 1);
    objc_msgSend(v6, "setShowChevron:", 1);
    expandedVendorSpecificGroupUIDs = self->_expandedVendorSpecificGroupUIDs;
    objc_msgSend(v10, "routeUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setShowChevronExpanded:", -[NSMutableSet containsObject:](expandedVendorSpecificGroupUIDs, "containsObject:", v15));

    v16 = (void *)MEMORY[0x1E0DC3870];
    -[MRURoutingViewController symbolNameForVendorSpecificRoute:](self, "symbolNameForVendorSpecificRoute:", v10);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "systemImageNamed:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setIconImage:", v18);

    objc_msgSend(v10, "routeName");
    v19 = objc_claimAutoreleasedReturnValue();
    v112 = v9;
    v114 = v7;
    if (v19
      && (v20 = (void *)v19,
          objc_msgSend(v10, "routeName"),
          v21 = (void *)objc_claimAutoreleasedReturnValue(),
          v22 = objc_msgSend(v21, "isEqualToString:", &stru_1E581FBA8),
          v21,
          v20,
          (v22 & 1) == 0))
    {
      objc_msgSend(v10, "routeName");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setTitle:", v30);

    }
    else
    {
      objc_msgSend(v6, "setTitle:", CFSTR("Unknown Device"), v9, v7);
    }
    objc_msgSend(v10, "subroutes", v112, v114);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = MEMORY[0x1E0C809B0];
    v134[0] = MEMORY[0x1E0C809B0];
    v134[1] = 3221225472;
    v134[2] = __66__MRURoutingViewController_updateVendorSpecificCell_forIndexPath___block_invoke;
    v134[3] = &unk_1E581A6C8;
    v116 = v6;
    v135 = v116;
    v136 = self;
    objc_msgSend(v31, "msv_compactMap:", v134);
    v117 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "subroutes");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v133[0] = v32;
    v133[1] = 3221225472;
    v133[2] = __66__MRURoutingViewController_updateVendorSpecificCell_forIndexPath___block_invoke_2;
    v133[3] = &unk_1E581A6F0;
    v133[4] = self;
    objc_msgSend(v33, "msv_compactMap:", v133);
    v118 = (void *)objc_claimAutoreleasedReturnValue();

    v131 = 0u;
    v132 = 0u;
    v129 = 0u;
    v130 = 0u;
    v119 = v10;
    objc_msgSend(v10, "subroutes");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v129, v139, 16);
    if (v35)
    {
      v36 = v35;
      v37 = *(_QWORD *)v130;
      while (2)
      {
        for (i = 0; i != v36; ++i)
        {
          if (*(_QWORD *)v130 != v37)
            objc_enumerationMutation(v34);
          v39 = *(void **)(*((_QWORD *)&v129 + 1) + 8 * i);
          if (objc_msgSend(v39, "isAirPlayRoute"))
          {
            if (-[MRURoutingViewController routesContainAirPlayGroupableRoute:](self, "routesContainAirPlayGroupableRoute:", self->_cachedDisplayAsPickedRoutes))
            {
              goto LABEL_25;
            }
          }
          else
          {
            vendorSpecificManager = self->_vendorSpecificManager;
            objc_msgSend(v39, "device");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            LOBYTE(vendorSpecificManager) = -[MRUVendorSpecificDeviceManager isGroupingAvailableForDevice:](vendorSpecificManager, "isGroupingAvailableForDevice:", v41);

            if ((vendorSpecificManager & 1) != 0)
            {
LABEL_25:
              objc_msgSend(v119, "setTempPreferredSubrouteOverride:", v39);

              v42 = 1;
              goto LABEL_26;
            }
          }
        }
        v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v129, v139, 16);
        if (v36)
          continue;
        break;
      }
    }

    objc_msgSend(v119, "setTempPreferredSubrouteOverride:", 0);
    v42 = 0;
LABEL_26:
    v43 = v117;
    v44 = v120;
    v45 = v118;
    if (objc_msgSend(v117, "count"))
    {
      if (objc_msgSend(v117, "count") == 1)
      {
        objc_msgSend(v117, "firstObject");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = 3;
        goto LABEL_75;
      }
      v123 = 0u;
      v124 = 0u;
      v121 = 0u;
      v122 = 0u;
      v57 = v117;
      v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v121, v137, 16);
      if (v58)
      {
        v59 = v58;
        v46 = 0;
        v60 = *(_QWORD *)v122;
        do
        {
          for (j = 0; j != v59; ++j)
          {
            if (*(_QWORD *)v122 != v60)
              objc_enumerationMutation(v57);
            v62 = *(void **)(*((_QWORD *)&v121 + 1) + 8 * j);
            if ((objc_msgSend(v62, "isAirPlayRoute") & 1) == 0)
            {
              v63 = v62;

              v46 = v63;
            }
          }
          v59 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v121, v137, 16);
        }
        while (v59);
      }
      else
      {
        v46 = 0;
      }

      v47 = 3;
    }
    else
    {
      if (!objc_msgSend(v118, "count"))
      {
        objc_msgSend(v119, "preferredSubroute");
        v71 = (void *)objc_claimAutoreleasedReturnValue();

        if (v71)
        {
          objc_msgSend(v119, "preferredSubroute");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = 1;
        }
        else
        {
          v47 = 0;
          v46 = 0;
        }
        v44 = v120;
LABEL_75:
        vendorSpecificGroupDisplayedSubroutes = self->_vendorSpecificGroupDisplayedSubroutes;
        objc_msgSend(v119, "routeUID");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](vendorSpecificGroupDisplayedSubroutes, "setObject:forKeyedSubscript:", v46, v80);

        if (!v46)
          goto LABEL_110;
        objc_msgSend(v46, "protocolIcon");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v116, "setProtocolIcon:", v81);

        objc_msgSend(v46, "protocolName");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v116, "setProtocolName:", v82);

        if ((objc_msgSend(v116, "showChevronExpanded") & 1) != 0)
          goto LABEL_110;
        v83 = objc_msgSend(v46, "isAirPlayRoute");
        objc_msgSend(v116, "subtitleStateController");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v116, "protocolName");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        if (v83)
        {
          objc_msgSend(v84, "setText:forState:", v85, 6);
        }
        else
        {
          objc_msgSend(v116, "protocolIcon");
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v84, "setText:icon:forState:", v85, v86, 6);

        }
        if (v47 == 3)
        {
          if (v42)
            v88 = 4;
          else
            v88 = 3;
          objc_msgSend(v116, "routingAccessoryView");
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v89, "setState:", v88);

          if (objc_msgSend(v46, "isAirPlayRoute"))
          {
            objc_msgSend(v46, "underlyingNativeRoute");
            v90 = (void *)objc_claimAutoreleasedReturnValue();
            if (-[NSArray containsObject:](self->_cachedVolumeCapableRoutes, "containsObject:", v90))
            {
              outputDeviceVolumeControllers = self->_outputDeviceVolumeControllers;
              objc_msgSend(v90, "routeUID");
              v92 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSDictionary objectForKeyedSubscript:](outputDeviceVolumeControllers, "objectForKeyedSubscript:", v92);
              v93 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v116, "setVolumeController:", v93);

            }
            goto LABEL_96;
          }
        }
        else
        {
          if (v47 == 2)
          {
            objc_msgSend(v116, "routingAccessoryView");
            v90 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v90, "setState:", 2);
LABEL_96:

            goto LABEL_97;
          }
          if (v47 != 1
            || (objc_msgSend(v116, "routingAccessoryView"),
                v87 = (void *)objc_claimAutoreleasedReturnValue(),
                objc_msgSend(v87, "setState:", v42),
                v87,
                (objc_msgSend(v46, "isAirPlayRoute") & 1) != 0))
          {
LABEL_97:
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v99 = v119;
              objc_msgSend(v99, "setHearingAidDelegate:", self);
              if (objc_msgSend(v99, "isConnecting"))
              {
                objc_msgSend(v116, "routingAccessoryView");
                v100 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v100, "setState:", 2);

              }
            }
            if (objc_msgSend(v46, "isAirPlayRoute"))
            {
              objc_msgSend(v46, "underlyingNativeRoute");
              v101 = (void *)objc_claimAutoreleasedReturnValue();
              v44 = v120;
              if (!-[NSArray containsObject:](self->_cachedVolumeCapableRoutes, "containsObject:", v101))
              {
LABEL_109:

                v45 = v118;
LABEL_110:

                v68 = v135;
                v9 = v113;
                v7 = v115;
                v10 = v119;
                goto LABEL_111;
              }
              v102 = self->_outputDeviceVolumeControllers;
              objc_msgSend(v101, "routeUID");
              v103 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSDictionary objectForKeyedSubscript:](v102, "objectForKeyedSubscript:", v103);
              v104 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v116, "setVolumeController:", v104);
            }
            else
            {
              objc_msgSend(v116, "subtitleStateController");
              v105 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v116, "protocolName");
              v106 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v116, "protocolIcon");
              v107 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v105, "setText:icon:forState:", v106, v107, 6);

              objc_msgSend(v46, "device");
              v108 = (void *)objc_claimAutoreleasedReturnValue();
              v109 = objc_msgSend(v108, "mediaPlaybackState");

              objc_msgSend(v116, "subtitleStateController");
              v101 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v46, "device");
              v103 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v103, "nowPlayingSubtitle");
              v104 = (void *)objc_claimAutoreleasedReturnValue();
              if (v109 == 2)
                v110 = 2;
              else
                v110 = 1;
              objc_msgSend(v101, "setText:forState:accessory:", v104, 3, v110);
              v44 = v120;
            }

            goto LABEL_109;
          }
        }
        objc_msgSend(v46, "device");
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        v95 = objc_msgSend(v94, "mediaPlaybackState");

        objc_msgSend(v116, "subtitleStateController");
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "device");
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v96, "nowPlayingSubtitle");
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        if (v95 == 2)
          v98 = 2;
        else
          v98 = 1;
        objc_msgSend(v90, "setText:forState:accessory:", v97, 3, v98);

        goto LABEL_96;
      }
      if (objc_msgSend(v118, "count") == 1)
      {
        objc_msgSend(v118, "firstObject");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = 2;
        goto LABEL_75;
      }
      v127 = 0u;
      v128 = 0u;
      v125 = 0u;
      v126 = 0u;
      v72 = v118;
      v73 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v125, v138, 16);
      if (v73)
      {
        v74 = v73;
        v46 = 0;
        v75 = *(_QWORD *)v126;
        do
        {
          for (k = 0; k != v74; ++k)
          {
            if (*(_QWORD *)v126 != v75)
              objc_enumerationMutation(v72);
            v77 = *(void **)(*((_QWORD *)&v125 + 1) + 8 * k);
            if ((objc_msgSend(v77, "isAirPlayRoute") & 1) == 0)
            {
              v78 = v77;

              v46 = v78;
            }
          }
          v74 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v125, v138, 16);
        }
        while (v74);
      }
      else
      {
        v46 = 0;
      }

      v47 = 2;
    }
    v44 = v120;
    v43 = v117;
    v45 = v118;
    goto LABEL_75;
  }
  objc_msgSend(v6, "setShowChevron:", 0);
  v23 = (void *)MEMORY[0x1E0DC3870];
  -[MRURoutingViewController symbolNameForVendorSpecificRoute:](self, "symbolNameForVendorSpecificRoute:", v10);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "systemImageNamed:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setIconImage:", v25);

  objc_msgSend(v10, "routeName");
  v26 = objc_claimAutoreleasedReturnValue();
  if (v26
    && (v27 = (void *)v26,
        objc_msgSend(v10, "routeName"),
        v28 = (void *)objc_claimAutoreleasedReturnValue(),
        v29 = objc_msgSend(v28, "isEqualToString:", &stru_1E581FBA8),
        v28,
        v27,
        (v29 & 1) == 0))
  {
    objc_msgSend(v10, "routeName");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTitle:", v48);

  }
  else
  {
    objc_msgSend(v6, "setTitle:", CFSTR("Unknown Device"));
  }
  objc_msgSend(v10, "protocolIcon");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setProtocolIcon:", v49);

  objc_msgSend(v10, "protocolName");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setProtocolName:", v50);

  v51 = -[MRUVendorSpecificDeviceManager isGroupingAvailableForDevice:](self->_vendorSpecificManager, "isGroupingAvailableForDevice:", v120);
  v44 = v120;
  v52 = -[MRUVendorSpecificDeviceManager latestStateForDevice:](self->_vendorSpecificManager, "latestStateForDevice:", v120);
  if (v52 == 10 || v52 == 30)
  {
    objc_msgSend(v6, "routingAccessoryView");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = v54;
    v56 = 2;
  }
  else
  {
    if (v52 == 20)
    {
      if (v51)
        v53 = 4;
      else
        v53 = 3;
    }
    else
    {
      v53 = v51;
    }
    objc_msgSend(v6, "routingAccessoryView");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = v54;
    v56 = v53;
  }
  objc_msgSend(v54, "setState:", v56);

  objc_msgSend(v6, "subtitleStateController");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "protocolName");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "protocolIcon");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "setText:icon:forState:", v65, v66, 6);

  v67 = objc_msgSend(v120, "mediaPlaybackState");
  objc_msgSend(v6, "subtitleStateController");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v120, "nowPlayingSubtitle");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  if (v67 == 2)
    v70 = 2;
  else
    v70 = 1;
  objc_msgSend(v68, "setText:forState:accessory:", v69, 3, v70);

LABEL_111:
  objc_msgSend(v6, "setDelegate:", self);
  -[MRURoutingViewController contentEdgeInsets](self, "contentEdgeInsets");
  objc_msgSend(v6, "setContentEdgeInsets:");
  -[MRURoutingViewController stylingProvider](self, "stylingProvider");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setStylingProvider:", v111);

}

id __66__MRURoutingViewController_updateVendorSpecificCell_forIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;

  v3 = a2;
  if (objc_msgSend(v3, "isAirPlayRoute"))
  {
    objc_msgSend(v3, "underlyingNativeRoute");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isMacRoute");

    if (v5)
    {
      v6 = (void *)MEMORY[0x1E0CC2318];
      objc_msgSend(v3, "underlyingNativeRoute");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "_symbolImageForRoute:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setIconImage:", v8);

    }
    v9 = *(void **)(*(_QWORD *)(a1 + 40) + 1032);
    objc_msgSend(v3, "underlyingNativeRoute");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v9) = objc_msgSend(v9, "containsObject:", v10);

    if ((v9 & 1) == 0)
      goto LABEL_5;
LABEL_7:
    v11 = v3;
    goto LABEL_8;
  }
  v12 = *(void **)(*(_QWORD *)(a1 + 40) + 1080);
  objc_msgSend(v3, "routeUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v12) = objc_msgSend(v12, "containsObject:", v13);

  if ((_DWORD)v12)
    goto LABEL_7;
LABEL_5:
  v11 = 0;
LABEL_8:

  return v11;
}

id __66__MRURoutingViewController_updateVendorSpecificCell_forIndexPath___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  v3 = a2;
  v4 = objc_msgSend(v3, "isAirPlayRoute");
  v5 = *(_QWORD *)(a1 + 32);
  if (!v4)
  {
    v9 = *(void **)(v5 + 1088);
    objc_msgSend(v3, "routeUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v9) = objc_msgSend(v9, "containsObject:", v10);

    if (!(_DWORD)v9)
      goto LABEL_3;
LABEL_5:
    v8 = v3;
    goto LABEL_6;
  }
  v6 = *(void **)(v5 + 1024);
  objc_msgSend(v3, "underlyingNativeRoute");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = objc_msgSend(v6, "containsObject:", v7);

  if ((v6 & 1) != 0)
    goto LABEL_5;
LABEL_3:
  v8 = 0;
LABEL_6:

  return v8;
}

- (void)updateVendorSpecificCustomRowCell:(id)a3 forIndexPath:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  MCLogCategoryDeviceAccess();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412290;
    v14 = v6;
    _os_log_impl(&dword_1AA991000, v8, OS_LOG_TYPE_DEFAULT, "updateVendorSpecificCustomRowCell forIndexPath: %@", (uint8_t *)&v13, 0xCu);
  }

  -[MPSectionedCollection itemAtIndexPath:](self->_routingViewItems, "itemAtIndexPath:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "image");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setIconImage:", v10);

  objc_msgSend(v9, "localizedTitle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTitle:", v11);

  -[MRURoutingViewController contentEdgeInsets](self, "contentEdgeInsets");
  objc_msgSend(v7, "setContentEdgeInsets:");
  -[MRURoutingViewController stylingProvider](self, "stylingProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setStylingProvider:", v12);

}

- (void)updateVendorSpecificSpeakerGroupCell:(id)a3 forIndexPath:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
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
  int v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  MCLogCategoryDeviceAccess();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v19 = 138412290;
    v20 = v6;
    _os_log_impl(&dword_1AA991000, v8, OS_LOG_TYPE_DEFAULT, "updateVendorSpecificSpeakerGroupCell forIndexPath: %@", (uint8_t *)&v19, 0xCu);
  }

  -[MPSectionedCollection itemAtIndexPath:](self->_routingViewItems, "itemAtIndexPath:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setEnabled:", 1);
  objc_msgSend(v7, "setShowChevron:", 1);
  objc_msgSend(v7, "setShowChevronExpanded:", self->_didExpandVendorSpecificSpeakerGroup);
  objc_msgSend(v9, "leader");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0DC3870];
  -[MRURoutingViewController symbolNameForVendorSpecificRoute:](self, "symbolNameForVendorSpecificRoute:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "systemImageNamed:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setIconImage:", v13);

  objc_msgSend(v7, "setDelegate:", self);
  objc_msgSend(v9, "localizedTitle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTitle:", v14);

  objc_msgSend(v7, "subtitleStateController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedSubtitle");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setText:forState:", v16, 4);

  objc_msgSend(v7, "routingAccessoryView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setState:", 4);

  -[MRURoutingViewController contentEdgeInsets](self, "contentEdgeInsets");
  objc_msgSend(v7, "setContentEdgeInsets:");
  -[MRURoutingViewController stylingProvider](self, "stylingProvider");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setStylingProvider:", v18);

}

- (void)updateCell:(id)a3 forIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
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
  int64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  uint64_t v40;
  void *v41;
  __CFString *v42;
  __CFString *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  _BOOL4 v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  int v59;
  int v60;
  uint64_t v61;
  uint64_t i;
  uint64_t v63;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  int v70;
  void *v71;
  void *v72;
  uint64_t v73;
  void *v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  _BYTE v79[128];
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[MPSectionedCollection itemAtIndexPath:](self->_routingViewItems, "itemAtIndexPath:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "mainRoute");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "routeUID");
  v9 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "image");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {

LABEL_3:
    objc_msgSend(v7, "image");
    v11 = objc_claimAutoreleasedReturnValue();
    goto LABEL_4;
  }
  objc_msgSend(v7, "mainRoute");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v33)
    goto LABEL_3;
  v34 = objc_msgSend(v7, "type");
  v35 = (void *)MEMORY[0x1E0CC2318];
  if (v34 == 1)
  {
    objc_msgSend(v7, "routes");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "_symbolImageForRoutes:", v12);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setIconImage:", v36);

    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CC2318], "_symbolImageForRoute:", v8);
  v11 = objc_claimAutoreleasedReturnValue();
LABEL_4:
  v12 = (void *)v11;
  objc_msgSend(v6, "setIconImage:", v11);
LABEL_5:

  if (!-[MRURoutingViewController routesContainMultipleBuiltIn:](self, "routesContainMultipleBuiltIn:", self->_cachedDisplayableAvailableRoutes)&& (objc_msgSend(v8, "routeSubtype") == 1 || objc_msgSend(v8, "routeSubtype") == 3))
  {
    v13 = MSVCopyLocalizedModelName();
  }
  else
  {
    objc_msgSend(v7, "localizedTitle");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v14 = (void *)v13;
  objc_msgSend(v6, "setTitle:", v13);

  objc_msgSend(v6, "subtitleStateController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "routingBatteryTextWithFormatter:", self->_percentageFormatter);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setText:forState:", v16, 1);

  objc_msgSend(v6, "subtitleStateController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "routingPairedDeviceText");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setText:forState:", v18, 2);

  objc_msgSend(v6, "subtitleStateController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedSubtitle");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setText:forState:", v20, 4);

  if (v9)
  {
    -[NSDictionary objectForKeyedSubscript:](self->_indexedNowPlayingControllers, "objectForKeyedSubscript:", v9);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "metadataController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "nowPlayingInfo");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = -[MRURoutingViewController subtitleAccessoryForItem:nowPlayingInfo:](self, "subtitleAccessoryForItem:nowPlayingInfo:", v7, v23);
    objc_msgSend(v6, "subtitleStateController");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "stringForComponents:", 59);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setText:forState:accessory:", v26, 3, v24);

  }
  objc_msgSend(v7, "mainRoute");
  v27 = objc_claimAutoreleasedReturnValue();
  v74 = (void *)v9;
  if (v27)
  {
    v28 = (void *)v27;
    objc_msgSend(MEMORY[0x1E0D4C650], "currentSettings");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "addDebugBadgeToRecommendedRoutes");

    if (v30)
    {
      objc_msgSend(v7, "mainRoute");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v31, "outputDevice");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v32 = 0;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v37 = v32;
      else
        v37 = 0;
      v38 = v37;
      objc_msgSend(v38, "recommendation");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "reason");
      v40 = objc_claimAutoreleasedReturnValue();
      v41 = (void *)v40;
      v42 = CFSTR("(no reason provided)");
      if (v40)
        v42 = (__CFString *)v40;
      v43 = v42;

      objc_msgSend(v38, "recommendation");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "sortingHint");
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      if (v45)
      {
        v46 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v38, "recommendation");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "sortingHint");
        v72 = v32;
        v48 = v31;
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "stringWithFormat:", CFSTR("Hint: %@, %@"), v49, v43);
        v50 = objc_claimAutoreleasedReturnValue();

        v31 = v48;
        v32 = v72;

        v43 = (__CFString *)v50;
      }
      objc_msgSend(v6, "subtitleStateController");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "setText:forState:", v43, 5);

    }
  }
  objc_msgSend(v7, "mainRoute");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "routeUID");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityIdentifier:", v53);

  if (objc_msgSend(v8, "isSplitterCapable"))
  {
    v54 = -[MRURoutingViewController routesContainSplitterCapableRoute:](self, "routesContainSplitterCapableRoute:", self->_cachedDisplayAsPickedRoutes);
LABEL_32:
    LODWORD(v55) = v54;
    goto LABEL_34;
  }
  if (objc_msgSend(v8, "supportsAirPlayGrouping"))
  {
    v54 = -[MRURoutingViewController routesContainAirPlayGroupableRoute:](self, "routesContainAirPlayGroupableRoute:", self->_cachedDisplayAsPickedRoutes);
    goto LABEL_32;
  }
  LODWORD(v55) = 0;
LABEL_34:
  v73 = objc_msgSend(v7, "type");
  v75 = 0u;
  v76 = 0u;
  v77 = 0u;
  v78 = 0u;
  objc_msgSend(v7, "routes");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v75, v79, 16);
  if (!v57)
  {

    if (!-[MRURoutingViewController shouldSuppressNativeRoutesStatusDisplay](self, "shouldSuppressNativeRoutesStatusDisplay"))goto LABEL_50;
LABEL_45:
    objc_msgSend(v6, "routingAccessoryView");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "setState:", 0);
    v68 = v74;
LABEL_56:

    goto LABEL_57;
  }
  v58 = v57;
  v70 = v55;
  v71 = v6;
  v59 = 0;
  v60 = 0;
  v61 = *(_QWORD *)v76;
  do
  {
    for (i = 0; i != v58; ++i)
    {
      if (*(_QWORD *)v76 != v61)
        objc_enumerationMutation(v56);
      v63 = *(_QWORD *)(*((_QWORD *)&v75 + 1) + 8 * i);
      v59 |= -[NSArray containsObject:](self->_cachedDisplayAsPickedRoutes, "containsObject:", v63);
      v60 |= -[NSArray containsObject:](self->_cachedPendingPickedRoutes, "containsObject:", v63);
    }
    v58 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v75, v79, 16);
  }
  while (v58);

  v6 = v71;
  LODWORD(v55) = v70;
  if (-[MRURoutingViewController shouldSuppressNativeRoutesStatusDisplay](self, "shouldSuppressNativeRoutesStatusDisplay"))
  {
    goto LABEL_45;
  }
  if ((v60 & 1) == 0)
  {
    if ((v59 & 1) != 0)
    {
      if (v70)
        v55 = 4;
      else
        v55 = 3;
      goto LABEL_51;
    }
LABEL_50:
    v55 = v55;
LABEL_51:
    objc_msgSend(v6, "routingAccessoryView");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = v64;
    v66 = v55;
    goto LABEL_52;
  }
  objc_msgSend(v71, "routingAccessoryView");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = v64;
  v66 = 2;
LABEL_52:
  objc_msgSend(v64, "setState:", v66);
  v68 = v74;

  if (-[NSArray containsObject:](self->_cachedVolumeCapableRoutes, "containsObject:", v8) && v74 && v73 != 1)
  {
    -[NSDictionary objectForKey:](self->_outputDeviceVolumeControllers, "objectForKey:", v74);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setVolumeController:", v67);
    goto LABEL_56;
  }
LABEL_57:
  objc_msgSend(v6, "setDelegate:", self);
  objc_msgSend(v6, "setShowChevron:", objc_msgSend(v7, "isExpandable"));
  objc_msgSend(v6, "setShowChevronExpanded:", -[NSMutableSet containsObject:](self->_expandedRouteUIDs, "containsObject:", v68));
  objc_msgSend(v6, "setIndentationLevel:", objc_msgSend(v7, "nestedLevel"));
  objc_msgSend(v6, "setEnabled:", objc_msgSend(v7, "enabled"));
  -[MRURoutingViewController contentEdgeInsets](self, "contentEdgeInsets");
  objc_msgSend(v6, "setContentEdgeInsets:");
  -[MRURoutingViewController stylingProvider](self, "stylingProvider");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setStylingProvider:", v69);

}

- (void)updateHeaderView:(id)a3 forSection:(int64_t)a4
{
  MPSectionedCollection *routingViewItems;
  id v7;
  void *v8;
  id v9;

  routingViewItems = self->_routingViewItems;
  v7 = a3;
  -[MPSectionedCollection sectionAtIndex:](routingViewItems, "sectionAtIndex:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTitle:", v8);

  -[MRURoutingViewController contentEdgeInsets](self, "contentEdgeInsets");
  objc_msgSend(v7, "setContentEdgeInsets:");
  -[MRURoutingViewController stylingProvider](self, "stylingProvider");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setStylingProvider:", v9);

}

- (void)showMoreAction
{
  self->_didSelectShowMore = 1;
  -[MRURoutingViewController _updateDisplayedRoutes](self, "_updateDisplayedRoutes");
}

- (void)updateNowPlayingControllersForRoutes:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  MRURoutingViewController *v21;
  void *v22;
  void *v23;
  void *v24;
  NSDictionary *v25;
  NSDictionary *indexedNowPlayingControllers;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  id obj;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  NSArray *v34;
  _BOOL4 showMetadataForEndpointRoute;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  obj = v4;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v41;
    v28 = *(_QWORD *)v41;
    do
    {
      v8 = 0;
      v29 = v6;
      do
      {
        if (*(_QWORD *)v41 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v31 = v8;
          v38 = 0u;
          v39 = 0u;
          v36 = 0u;
          v37 = 0u;
          v34 = self->_nowPlayingControllers;
          v10 = -[NSArray countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
          if (v10)
          {
            v11 = v10;
            v12 = *(_QWORD *)v37;
            v32 = v9;
            while (2)
            {
              v13 = 0;
              v33 = v11;
              do
              {
                if (*(_QWORD *)v37 != v12)
                  objc_enumerationMutation(v34);
                v14 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v13);
                objc_msgSend(v14, "identifier", v27);
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v14, "endpointController");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v9, "routeUID");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v16, "containsOutputDeviceWithRouteUID:", v17)
                  && (objc_msgSend(v9, "routeUID"), (v18 = objc_claimAutoreleasedReturnValue()) != 0))
                {
                  v19 = (void *)v18;
                  v20 = v12;
                  -[MRURoutingViewController endpointRoute](self, "endpointRoute");
                  v21 = self;
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v22, "routeUID");
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  if (!objc_msgSend(v23, "isEqualToString:", v15))
                  {

                    self = v21;
                    v9 = v32;
LABEL_22:
                    objc_msgSend(v9, "routeUID");
                    v24 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v27, "setObject:forKeyedSubscript:", v14, v24);

                    objc_msgSend(v14, "addObserver:", self);
                    objc_msgSend(v14, "updateAutomaticResponseLoading");

                    goto LABEL_23;
                  }
                  showMetadataForEndpointRoute = v21->_showMetadataForEndpointRoute;

                  self = v21;
                  v12 = v20;
                  v9 = v32;
                  v11 = v33;
                  if (showMetadataForEndpointRoute)
                    goto LABEL_22;
                }
                else
                {

                }
                ++v13;
              }
              while (v11 != v13);
              v11 = -[NSArray countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
              if (v11)
                continue;
              break;
            }
          }
LABEL_23:

          v7 = v28;
          v6 = v29;
          v8 = v31;
        }
        ++v8;
      }
      while (v8 != v6);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    }
    while (v6);
  }

  v25 = (NSDictionary *)objc_msgSend(v27, "copy");
  indexedNowPlayingControllers = self->_indexedNowPlayingControllers;
  self->_indexedNowPlayingControllers = v25;

}

- (void)updateMetadata
{
  MRURoutingViewController *v2;
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int *v14;
  uint64_t j;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSDictionary *indexedNowPlayingControllers;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  MRURoutingViewController *v33;
  int *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  id obj;
  void *v40;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v2 = self;
  v52 = *MEMORY[0x1E0C80C00];
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v3 = self->_nowPlayingControllers;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v47;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v47 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * i), "updateAutomaticResponseLoading");
      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
    }
    while (v5);
  }

  if (v2->_onScreen)
  {
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    -[MRURoutingViewController view](v2, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "tableView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "indexPathsForVisibleRows");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    obj = v10;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v43;
      v14 = &OBJC_IVAR___MRUNowPlayingLabelView__subtitleMarqueeView;
      do
      {
        for (j = 0; j != v12; ++j)
        {
          if (*(_QWORD *)v43 != v13)
            objc_enumerationMutation(obj);
          v16 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * j);
          objc_msgSend(*(id *)((char *)&v2->super.super.super.isa + v14[211]), "safeItemAtIndexPath:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "type");
          v19 = objc_msgSend(v17, "type");
          v20 = objc_msgSend(v17, "type");
          v21 = objc_msgSend(v17, "type");
          if (v18 != 3 && v19 != 4 && v20 != 5 && v21 != 6)
          {
            indexedNowPlayingControllers = v2->_indexedNowPlayingControllers;
            objc_msgSend(v17, "mainRoute");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "routeUID");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSDictionary objectForKeyedSubscript:](indexedNowPlayingControllers, "objectForKeyedSubscript:", v27);
            v41 = (void *)objc_claimAutoreleasedReturnValue();

            -[MRURoutingViewController view](v2, "view");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "tableView");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "cellForRowAtIndexPath:", v16);
            v40 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v41, "metadataController");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "nowPlayingInfo");
            v31 = (void *)objc_claimAutoreleasedReturnValue();

            v32 = -[MRURoutingViewController subtitleAccessoryForItem:nowPlayingInfo:](v2, "subtitleAccessoryForItem:nowPlayingInfo:", v17, v31);
            objc_msgSend(v40, "subtitleStateController");
            v33 = v2;
            v34 = v14;
            v35 = v13;
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "stringForComponents:", 59);
            v37 = v12;
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "setText:forState:accessory:", v38, 3, v32);

            v12 = v37;
            v13 = v35;
            v14 = v34;
            v2 = v33;

          }
        }
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
      }
      while (v12);
    }

  }
}

- (void)updateMetadataForNowPlayingController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  char isKindOfClass;
  NSDictionary *indexedNowPlayingControllers;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  id v29;
  void *v30;
  MRURoutingViewController *v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MRURoutingViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "indexPathsForVisibleRows");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v8 = v7;
  v32 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v32)
  {
    v9 = *(_QWORD *)v34;
    v31 = self;
    do
    {
      for (i = 0; i != v32; ++i)
      {
        if (*(_QWORD *)v34 != v9)
          objc_enumerationMutation(v8);
        v11 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
        -[MPSectionedCollection safeItemAtIndexPath:](self->_routingViewItems, "safeItemAtIndexPath:", v11, v31);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "mainRoute");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) == 0)
        {
          indexedNowPlayingControllers = self->_indexedNowPlayingControllers;
          objc_msgSend(v12, "mainRoute");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "routeUID");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSDictionary objectForKeyedSubscript:](indexedNowPlayingControllers, "objectForKeyedSubscript:", v17);
          v18 = (id)objc_claimAutoreleasedReturnValue();

          if (v18 == v4)
          {
            -[MRURoutingViewController view](self, "view");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "tableView");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "cellForRowAtIndexPath:", v11);
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v4, "metadataController");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "nowPlayingInfo");
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            v24 = -[MRURoutingViewController subtitleAccessoryForItem:nowPlayingInfo:](self, "subtitleAccessoryForItem:nowPlayingInfo:", v12, v23);
            v25 = v21;
            objc_msgSend(v21, "subtitleStateController");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "stringForComponents:", 59);
            v27 = v9;
            v28 = v8;
            v29 = v4;
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "setText:forState:accessory:", v30, 3, v24);

            v4 = v29;
            v8 = v28;
            v9 = v27;

            self = v31;
          }
        }

      }
      v32 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v32);
  }

}

- (void)updateSubtitle
{
  _BOOL4 onScreen;
  MPWeakTimer *subtitleUpdateTimer;
  id v5;
  MPWeakTimer *v6;
  MPWeakTimer *v7;
  MPWeakTimer *v8;
  _QWORD v9[5];

  onScreen = self->_onScreen;
  subtitleUpdateTimer = self->_subtitleUpdateTimer;
  if (onScreen)
  {
    if (!subtitleUpdateTimer)
    {
      v5 = objc_alloc(MEMORY[0x1E0CC2558]);
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __42__MRURoutingViewController_updateSubtitle__block_invoke;
      v9[3] = &unk_1E5818C88;
      v9[4] = self;
      v6 = (MPWeakTimer *)objc_msgSend(v5, "initWithInterval:queue:block:", MEMORY[0x1E0C80D38], v9, 0.24 * 2.0 + 4.0);
      v7 = self->_subtitleUpdateTimer;
      self->_subtitleUpdateTimer = v6;

    }
  }
  else
  {
    -[MPWeakTimer invalidate](subtitleUpdateTimer, "invalidate");
    v8 = self->_subtitleUpdateTimer;
    self->_subtitleUpdateTimer = 0;

  }
}

void __42__MRURoutingViewController_updateSubtitle__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
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

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "view", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "indexPathsForVisibleRows");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
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
        v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v8);
        objc_msgSend(*(id *)(a1 + 32), "view");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "tableView");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "cellForRowAtIndexPath:", v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v12, "transitionToNextVisibleStateWithDuration:", 0.24);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

}

- (int64_t)subtitleAccessoryForItem:(id)a3 nowPlayingInfo:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  int64_t v9;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "type");
  if (v7 == 1)
  {
    if (objc_msgSend(v6, "isPlaying"))
      v9 = 2;
    else
      v9 = 1;
  }
  else if (v7)
  {
    v9 = 0;
  }
  else if (objc_msgSend(v6, "isPlaying"))
  {
    objc_msgSend(v5, "mainRoute");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isProxyGroupPlayer"))
      v9 = 1;
    else
      v9 = 2;

  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (BOOL)_wouldShareAudioForPickedRoute:(id)a3 operation:(int64_t)a4 pickedRoutes:(id)a5
{
  id v7;
  id v8;
  void *v9;
  char v10;

  v7 = a3;
  v8 = a5;
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4 == 1 && objc_msgSend(v8, "count") == 1 && objc_msgSend(v7, "supportsGrouping"))
    v10 = objc_msgSend(v9, "supportsGrouping");
  else
    v10 = 0;

  return v10;
}

- (BOOL)_wouldEndGroupSessionForViewItem:(id)a3 operation:(int64_t)a4 pickedRoutes:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int v18;
  id v19;
  uint64_t v20;
  void *v21;
  BOOL v22;
  _QWORD v24[4];
  id v25;

  v7 = a5;
  objc_msgSend(a3, "routes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "mutableCopy");
  switch(a4)
  {
    case 0:
      goto LABEL_9;
    case 1:
      objc_msgSend(v7, "firstObject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v16, "supportsGrouping") & 1) != 0)
      {
        objc_msgSend(v8, "firstObject");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "supportsGrouping");

        if (v18)
        {
          v19 = (id)objc_msgSend(v7, "arrayByAddingObjectsFromArray:", v8);
          break;
        }
      }
      else
      {

      }
LABEL_9:
      v20 = objc_msgSend(v8, "mutableCopy");

      v9 = (void *)v20;
      break;
    case 2:
      v10 = (void *)MEMORY[0x1E0C99E60];
      objc_msgSend(v8, "msv_map:", &__block_literal_global_195);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setWithArray:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __84__MRURoutingViewController__wouldEndGroupSessionForViewItem_operation_pickedRoutes___block_invoke_2;
      v24[3] = &unk_1E581A758;
      v25 = v12;
      v13 = v12;
      objc_msgSend(v9, "msv_filter:", v24);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "mutableCopy");

      v9 = (void *)v15;
      break;
  }
  objc_msgSend(v9, "msv_compactMap:", &__block_literal_global_198);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = MRGroupSessionRouteTypeForOutputDevices() == 0;

  return v22;
}

uint64_t __84__MRURoutingViewController__wouldEndGroupSessionForViewItem_operation_pickedRoutes___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "routeUID");
}

uint64_t __84__MRURoutingViewController__wouldEndGroupSessionForViewItem_operation_pickedRoutes___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "routeUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3) ^ 1;

  return v4;
}

uint64_t __84__MRURoutingViewController__wouldEndGroupSessionForViewItem_operation_pickedRoutes___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "outputDevice");
}

- (void)handleGroupSessionJoinWithPickedRoute:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = *MEMORY[0x1E0D4BCA0];
  v11[0] = &unk_1E5878238;
  v5 = *MEMORY[0x1E0D4BC98];
  v10[0] = v4;
  v10[1] = v5;
  objc_msgSend(v3, "discoveredGroupSession");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = *MEMORY[0x1E0D4BCA8];
  v11[1] = v7;
  v11[2] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v3;
  MRGroupSessionSendEvent();

}

void __66__MRURoutingViewController_handleGroupSessionJoinWithPickedRoute___block_invoke(int8x16_t *a1, uint64_t a2)
{
  NSObject *v3;
  uint64_t v4;
  id v5;
  int8x16_t v6;
  _QWORD block[4];
  int8x16_t v8;
  uint8_t buf[4];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    MCLogCategoryDefault();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = a1[2].i64[0];
      *(_DWORD *)buf = 138543362;
      v10 = v4;
      _os_log_impl(&dword_1AA991000, v3, OS_LOG_TYPE_ERROR, "[MRURoutingViewController] Failed to launch Music for group session: %{public}@", buf, 0xCu);
    }

  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__MRURoutingViewController_handleGroupSessionJoinWithPickedRoute___block_invoke_201;
  block[3] = &unk_1E5818CB0;
  v6 = a1[2];
  v5 = (id)v6.i64[0];
  v8 = vextq_s8(v6, v6, 8uLL);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __66__MRURoutingViewController_handleGroupSessionJoinWithPickedRoute___block_invoke_201(uint64_t a1)
{
  void *v2;
  char v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CC2320], "itemWithRoute:", *(_QWORD *)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "routingViewController:didSelectRoutingViewItem:", v4, v5);

  }
}

- (void)_displayShareAudioDisabledAlertForReason:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", 0, a3, 1);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0DC3448];
  +[MRUStringsProvider ok](MRUStringsProvider, "ok");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actionWithTitle:style:handler:", v5, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAction:", v6);

  -[MRURoutingViewController showViewController:sender:](self, "showViewController:sender:", v7, self);
}

- (void)_displayEndGroupSessionWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  +[MRUStringsProvider groupSessionEndTitle](MRUStringsProvider, "groupSessionEndTitle");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  +[MRUStringsProvider groupSessionEndBody](MRUStringsProvider, "groupSessionEndBody");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[MRUStringsProvider groupSessionEndConfirm](MRUStringsProvider, "groupSessionEndConfirm");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[MRUStringsProvider groupSessionEndCancel](MRUStringsProvider, "groupSessionEndCancel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRURoutingViewController _displayGroupSessionAlertWithTitle:body:confirmTitle:cancelTitle:completion:](self, "_displayGroupSessionAlertWithTitle:body:confirmTitle:cancelTitle:completion:", v8, v5, v6, v7, v4);

}

- (void)_displayGroupSessionAlertWithTitle:(id)a3 body:(id)a4 confirmTitle:(id)a5 cancelTitle:(id)a6 completion:(id)a7
{
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t);
  void *v27;
  id v28;
  _QWORD v29[4];
  id v30;

  v12 = a7;
  v13 = (void *)MEMORY[0x1E0DC3450];
  v14 = a6;
  v15 = a5;
  objc_msgSend(v13, "alertControllerWithTitle:message:preferredStyle:", a3, a4, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)MEMORY[0x1E0DC3448];
  v18 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __104__MRURoutingViewController__displayGroupSessionAlertWithTitle_body_confirmTitle_cancelTitle_completion___block_invoke;
  v29[3] = &unk_1E581A6A0;
  v19 = v12;
  v30 = v19;
  objc_msgSend(v17, "actionWithTitle:style:handler:", v15, 2, v29);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "addAction:", v20);
  v21 = (void *)MEMORY[0x1E0DC3448];
  v24 = v18;
  v25 = 3221225472;
  v26 = __104__MRURoutingViewController__displayGroupSessionAlertWithTitle_body_confirmTitle_cancelTitle_completion___block_invoke_2;
  v27 = &unk_1E581A6A0;
  v28 = v19;
  v22 = v19;
  objc_msgSend(v21, "actionWithTitle:style:handler:", v14, 0, &v24);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "addAction:", v23, v24, v25, v26, v27);
  -[MRURoutingViewController showViewController:sender:](self, "showViewController:sender:", v16, self);

}

uint64_t __104__MRURoutingViewController__displayGroupSessionAlertWithTitle_body_confirmTitle_cancelTitle_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __104__MRURoutingViewController__displayGroupSessionAlertWithTitle_body_confirmTitle_cancelTitle_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_setNeedsRouteDiscoveryModeUpdate
{
  int64_t discoveryMode;

  if (self->_onScreen)
    discoveryMode = self->_discoveryMode;
  else
    discoveryMode = 0;
  if (-[MPAVRoutingController discoveryMode](self->_routingController, "discoveryMode") != discoveryMode)
  {
    -[MPAVRoutingController setDiscoveryMode:](self->_routingController, "setDiscoveryMode:", discoveryMode);
    notify_post("com.apple.airplay.startlogging");
  }
}

- (void)_setNeedsDisplayedRoutesUpdate
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__MRURoutingViewController__setNeedsDisplayedRoutesUpdate__block_invoke;
  block[3] = &unk_1E5818C88;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __58__MRURoutingViewController__setNeedsDisplayedRoutesUpdate__block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1143) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "_setupUpdateTimerIfNecessary");
}

- (void)_setupUpdateTimerIfNecessary
{
  id v3;
  id v4;
  MPWeakTimer *v5;
  MPWeakTimer *updateTimer;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  id location;

  if (self->_onScreen && !self->_updateTimer)
  {
    v3 = MEMORY[0x1E0C80D38];
    objc_initWeak(&location, self);
    v4 = objc_alloc(MEMORY[0x1E0CC2558]);
    v7 = MEMORY[0x1E0C809B0];
    v8 = 3221225472;
    v9 = __56__MRURoutingViewController__setupUpdateTimerIfNecessary__block_invoke;
    v10 = &unk_1E5818E18;
    objc_copyWeak(&v11, &location);
    v5 = (MPWeakTimer *)objc_msgSend(v4, "initWithInterval:queue:block:", MEMORY[0x1E0C80D38], &v7, 2.0);
    updateTimer = self->_updateTimer;
    self->_updateTimer = v5;

    -[MRURoutingViewController _updateDisplayedRoutes](self, "_updateDisplayedRoutes", v7, v8, v9, v10);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);

  }
}

void __56__MRURoutingViewController__setupUpdateTimerIfNecessary__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (objc_msgSend(WeakRetained, "needsDisplayedRoutesUpdate"))
    objc_msgSend(WeakRetained, "_updateDisplayedRoutes");

}

- (void)_updateGroupSessionDiscovery
{
  NSString *presentingAppBundleID;
  NSString *v4;
  void *v5;
  char v6;
  MRGroupSessionDiscovery *groupSessionDiscovery;
  void *v8;
  NSString *v9;
  NSString *v10;

  presentingAppBundleID = self->_presentingAppBundleID;
  if (presentingAppBundleID)
  {
    v4 = presentingAppBundleID;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleIdentifier");
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();

    v4 = v9;
  }
  v10 = v4;
  v6 = MRBundlePermittedForGroupSessions();
  groupSessionDiscovery = self->_groupSessionDiscovery;
  if ((v6 & 1) != 0)
  {
    if (!groupSessionDiscovery)
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4C560]), "initWithDelegate:", self);
      -[MRURoutingViewController setGroupSessionDiscovery:](self, "setGroupSessionDiscovery:", v8);

    }
  }
  else if (groupSessionDiscovery)
  {
    -[MRURoutingViewController setGroupSessionDiscovery:](self, "setGroupSessionDiscovery:", 0);
  }

}

- (id)_displayableRoutesInRoutes:(id)a3
{
  id v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, void *);
  uint64_t *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  _QWORD v21[6];
  uint64_t v22;
  uint64_t v23;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D4C650], "currentSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "supportRouteRecommendations");

  if (v6)
  {
    -[MRURoutingViewController _recommendedRoutesFromRoutes:](self, "_recommendedRoutesFromRoutes:", v4);
    v7 = objc_claimAutoreleasedReturnValue();

    v4 = (id)v7;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D4C650], "currentSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "routePickerAirPlayAllowList");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D4C650], "currentSettings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "routePickerAirPlayDenyList");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v10, "count");
  v14 = MEMORY[0x1E0C809B0];
  if (v13)
  {
    v23 = MEMORY[0x1E0C809B0];
    v15 = __55__MRURoutingViewController__displayableRoutesInRoutes___block_invoke;
    v16 = &v23;
    v17 = v10;
LABEL_7:
    v16[1] = 3221225472;
    v16[2] = (uint64_t)v15;
    v16[3] = (uint64_t)&unk_1E581A758;
    v16[4] = (uint64_t)v17;
    objc_msgSend(v4, "msv_filter:", v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "mutableCopy");

    v8 = (void *)v19;
    goto LABEL_8;
  }
  if (objc_msgSend(v12, "count"))
  {
    v22 = v14;
    v15 = __55__MRURoutingViewController__displayableRoutesInRoutes___block_invoke_2;
    v16 = &v22;
    v17 = v12;
    goto LABEL_7;
  }
LABEL_8:
  v21[0] = v14;
  v21[1] = 3221225472;
  v21[2] = __55__MRURoutingViewController__displayableRoutesInRoutes___block_invoke_3;
  v21[3] = &unk_1E581A7E8;
  v21[4] = self;
  v21[5] = 577;
  objc_msgSend(v8, "sortUsingComparator:", v21);

  return v8;
}

uint64_t __55__MRURoutingViewController__displayableRoutesInRoutes___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = a2;
  if (objc_msgSend(v3, "isAirPlayRoute"))
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v3, "routeUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "containsObject:", v5);

  }
  else
  {
    v6 = 1;
  }

  return v6;
}

uint64_t __55__MRURoutingViewController__displayableRoutesInRoutes___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = a2;
  if (objc_msgSend(v3, "isAirPlayRoute"))
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v3, "routeUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "containsObject:", v5) ^ 1;

  }
  else
  {
    v6 = 1;
  }

  return v6;
}

uint64_t __55__MRURoutingViewController__displayableRoutesInRoutes___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  int v12;
  void *v13;
  void *v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  int v26;
  int v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
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
  int v42;
  void *v43;
  int v44;
  void *v45;
  int v46;
  int v47;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  int v53;
  int v54;
  int v55;
  int v56;
  int v57;
  int v58;
  int v59;
  int v60;
  int v61;
  int v62;
  int v63;
  int v64;
  int v65;
  int v66;
  int v67;
  int v68;
  int v69;
  void *v70;
  void *v71;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v7 + 1121))
  {
    v8 = objc_msgSend(*(id *)(v7 + 1016), "indexOfObject:", v5);
    v9 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1016), "indexOfObject:", v6);
    v10 = v8 < v9 ? -1 : 1;
    if (v8 != 0x7FFFFFFFFFFFFFFFLL && v9 != 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_87;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1152), "dataSource");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = objc_msgSend(v13, "routeIsLeaderOfEndpoint:", v5);

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1152), "dataSource");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = objc_msgSend(v14, "routeIsLeaderOfEndpoint:", v6);

      v58 = objc_msgSend(v5, "supportsGrouping");
      v57 = objc_msgSend(v6, "supportsGrouping");
      v56 = objc_msgSend(v5, "isHomePodRoute");
      v55 = objc_msgSend(v6, "isHomePodRoute");
      v15 = objc_msgSend(v5, "isW1Route");
      v16 = objc_msgSend(v6, "isW1Route");
      v17 = objc_msgSend(v5, "isH1Route");
      v18 = objc_msgSend(v6, "isH1Route");
      v19 = objc_msgSend(v5, "isDisplayedAsPicked");
      v68 = objc_msgSend(v6, "isDisplayedAsPicked");
      if ((objc_msgSend(v5, "isAppleTVRoute") & 1) != 0 || (objc_msgSend(v5, "isTVRoute") & 1) != 0)
        v62 = 1;
      else
        v62 = objc_msgSend(v5, "containsDeviceWithSubtype:", 18);
      v64 = v16;
      v65 = v15;
      v66 = v18;
      v67 = v17;
      v69 = v19;
      if ((objc_msgSend(v6, "isAppleTVRoute") & 1) != 0 || (objc_msgSend(v6, "isTVRoute") & 1) != 0)
        v61 = 1;
      else
        v61 = objc_msgSend(v6, "containsDeviceWithSubtype:", 18);
      v60 = objc_msgSend(v5, "supportsGrouping");
      v59 = objc_msgSend(v6, "supportsGrouping");
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v32 = v5;
      else
        v32 = 0;
      v30 = v32;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v33 = v6;
      else
        v33 = 0;
      v31 = v33;
      objc_msgSend(v30, "outputDevice");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "recommendation");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "sortingHint");
      v71 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v31, "outputDevice");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "recommendation");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "sortingHint");
      v70 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v30, "outputDevice");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "recommendation");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = objc_msgSend(v39, "isConservativelyFiltered");

      objc_msgSend(v31, "outputDevice");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "recommendation");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v41, "isConservativelyFiltered");

      objc_msgSend(v30, "outputDevice");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = objc_msgSend(v43, "isActivatedForContinuityScreen");

      objc_msgSend(v31, "outputDevice");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = objc_msgSend(v45, "isActivatedForContinuityScreen");

      if ((objc_msgSend(*(id *)(a1 + 32), "sortByIsVideoRoute") & 1) != 0)
        v47 = 1;
      else
        v47 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1152), "representsLongFormVideoContent");
      if (!objc_msgSend(v5, "pickableRouteType") && objc_msgSend(v6, "pickableRouteType"))
        goto LABEL_82;
      if (!objc_msgSend(v6, "pickableRouteType") && objc_msgSend(v5, "pickableRouteType"))
      {
LABEL_84:
        v10 = 1;
        goto LABEL_85;
      }
      if ((v44 ^ 1 | v46) == 1)
      {
        if ((v46 ^ 1 | v44) != 1)
          goto LABEL_84;
        if ((v69 ^ 1 | v68) == 1)
        {
          if ((v68 ^ 1 | v69) != 1)
            goto LABEL_84;
          if ((v67 ^ 1 | v66) == 1)
          {
            if ((v66 ^ 1 | v67) != 1)
              goto LABEL_84;
            if ((v65 ^ 1 | v64) == 1)
            {
              if ((v64 ^ 1 | v65) != 1)
                goto LABEL_84;
              if (!objc_msgSend(v5, "isKnown") || objc_msgSend(v6, "isKnown"))
              {
                if ((objc_msgSend(v5, "isKnown") & 1) == 0 && (objc_msgSend(v6, "isKnown") & 1) != 0)
                  goto LABEL_84;
                if ((v63 | v42 ^ 1) == 1)
                {
                  if ((v63 ^ 1 | v42) != 1)
                    goto LABEL_84;
                  if (!objc_msgSend(v5, "isNearby") || objc_msgSend(v6, "isNearby"))
                  {
                    if ((objc_msgSend(v5, "isNearby") & 1) == 0 && (objc_msgSend(v6, "isNearby") & 1) != 0)
                      goto LABEL_84;
                    if (!v71 || v70)
                    {
                      if (!v71 && v70)
                        goto LABEL_84;
                      if (v71 && v70)
                      {
                        v10 = objc_msgSend(v71, "compare:", v70);
LABEL_85:

                        goto LABEL_86;
                      }
                      if ((v47 & v60 & v62 ^ 1 | v59 & v61) == 1)
                      {
                        if ((v47 & v59 & v61 ^ 1 | v60 & v62) != 1)
                          goto LABEL_84;
                        if ((v58 ^ 1 | v57) == 1)
                        {
                          if ((v57 ^ 1 | v58) != 1)
                            goto LABEL_84;
                          if ((v47 & v62 ^ 1 | v61) == 1)
                          {
                            if ((v47 & v61 ^ 1 | v62) != 1)
                              goto LABEL_84;
                            if ((v56 ^ 1 | v55) == 1)
                            {
                              if ((v55 ^ 1 | v56) != 1)
                                goto LABEL_84;
                              if ((v54 ^ 1 | v53) == 1)
                              {
                                if ((v53 ^ 1 | v54) == 1)
                                {
                                  objc_msgSend(v5, "routeName");
                                  v49 = (void *)objc_claimAutoreleasedReturnValue();
                                  objc_msgSend(v6, "routeName");
                                  v50 = (void *)objc_claimAutoreleasedReturnValue();
                                  v10 = objc_msgSend(v49, "compare:options:", v50, *(_QWORD *)(a1 + 40));

                                  if (!v10)
                                  {
                                    objc_msgSend(v5, "routeUID");
                                    v51 = (void *)objc_claimAutoreleasedReturnValue();
                                    objc_msgSend(v6, "routeUID");
                                    v52 = (void *)objc_claimAutoreleasedReturnValue();
                                    v10 = objc_msgSend(v51, "compare:options:", v52, *(_QWORD *)(a1 + 40));

                                  }
                                  goto LABEL_85;
                                }
                                goto LABEL_84;
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
LABEL_82:
      v10 = -1;
      goto LABEL_85;
    }
  }
  if ((objc_msgSend(*(id *)(a1 + 32), "sortByIsVideoRoute") & 1) == 0
    && !objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1152), "representsLongFormVideoContent"))
  {
    goto LABEL_32;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = objc_msgSend(v5, "routeType") == 1;
  }
  else if ((objc_msgSend(v5, "isAppleTVRoute") & 1) != 0 || (objc_msgSend(v5, "isTVRoute") & 1) != 0)
  {
    v12 = 1;
  }
  else
  {
    v12 = objc_msgSend(v5, "containsDeviceWithSubtype:", 18);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v20 = objc_msgSend(v6, "routeType") == 1;
  }
  else
  {
    if ((objc_msgSend(v6, "isAppleTVRoute") & 1) != 0 || (objc_msgSend(v6, "isTVRoute") & 1) != 0)
    {
      if ((v12 & 1) == 0)
        goto LABEL_32;
      goto LABEL_30;
    }
    v20 = objc_msgSend(v6, "containsDeviceWithSubtype:", 18);
  }
  if (v12 != v20)
    goto LABEL_32;
LABEL_30:
  objc_msgSend(v5, "routeName");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "routeName");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v21, "compare:options:", v22, *(_QWORD *)(a1 + 40));

  if (!v23)
  {
    objc_msgSend(v5, "routeUID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "routeUID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "compare:options:", v25, *(_QWORD *)(a1 + 40));

  }
LABEL_32:
  v26 = objc_msgSend(v5, "isDisplayedAsPicked");
  v27 = objc_msgSend(v6, "isDisplayedAsPicked");
  if (v26 && !v27)
  {
    v10 = -1;
    goto LABEL_87;
  }
  if ((v27 ^ 1 | v26) != 1)
  {
    v10 = 1;
    goto LABEL_87;
  }
  objc_msgSend(v5, "routeName");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "routeName");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v28, "compare:options:", v29, *(_QWORD *)(a1 + 40));

  if (!v10)
  {
    objc_msgSend(v5, "routeUID");
    v30 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "routeUID");
    v31 = (id)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v30, "compare:options:", v31, *(_QWORD *)(a1 + 40));
LABEL_86:

  }
LABEL_87:

  return v10;
}

- (id)_recommendedRoutesFromRoutes:(id)a3
{
  id v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__MRURoutingViewController__recommendedRoutesFromRoutes___block_invoke_3;
  v7[3] = &unk_1E581A8B8;
  v8 = v3;
  v9 = &__block_literal_global_208;
  v4 = v3;
  objc_msgSend(v4, "msv_compactMap:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __57__MRURoutingViewController__recommendedRoutesFromRoutes___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a2;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __57__MRURoutingViewController__recommendedRoutesFromRoutes___block_invoke_2;
  v8[3] = &unk_1E581A850;
  v9 = v4;
  v5 = v4;
  objc_msgSend(a3, "msv_compactMap:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __57__MRURoutingViewController__recommendedRoutesFromRoutes___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a2;
  if (objc_msgSend(v3, "isAirPlayRoute"))
  {
    objc_msgSend(v3, "groupUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "groupUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "isEqualToString:", v5) & 1) != 0
      || objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32)))
    {
      v6 = v3;
    }
    else
    {
      v6 = 0;
    }
    v7 = v6;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

id __57__MRURoutingViewController__recommendedRoutesFromRoutes___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v3, "isAirPlayRoute"))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "msv_flatMap:", &__block_literal_global_210);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
    {
      +[MRURouteRecommender sharedInstance](MRURouteRecommender, "sharedInstance");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "recommendationForGroupedOutputDevices:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v7)
      {
        +[MRURouteRecommender sharedInstance](MRURouteRecommender, "sharedInstance");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "donateGroupedOutputDevices:", v5);

      }
      v17 = 0u;
      v18 = 0u;
      v15 = 0u;
      v16 = 0u;
      v9 = v5;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v16;
        do
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v16 != v12)
              objc_enumerationMutation(v9);
            objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v13++), "setRecommendation:", v7, (_QWORD)v15);
          }
          while (v11 != v13);
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        }
        while (v11);
      }

    }
  }
  return v3;
}

id __57__MRURoutingViewController__recommendedRoutesFromRoutes___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(a2, "outputDevices");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = (void *)MEMORY[0x1E0C9AA60];
  v4 = v2;

  return v4;
}

- (id)_displayAsPickedRoutesInRoutes:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v10, "isDisplayedAsPicked", (_QWORD)v12))
          objc_msgSend(v4, "addObject:", v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)_airPlayRoutesInRoutes:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
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
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v10, "isAirPlayRoute", (_QWORD)v12))
          objc_msgSend(v4, "addObject:", v10);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)_mergeRoutes:(id)a3 withCoalescedResult:(id)a4
{
  id v6;
  id v7;
  __objc2_class **p_superclass;
  uint64_t v9;
  void *v10;
  void *v11;
  unint64_t v12;
  id v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  int v58;
  NSObject *v59;
  NSObject *v60;
  void *v61;
  unint64_t v62;
  NSObject *v63;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  NSObject *v71;
  void *v72;
  void *v73;
  void *v74;
  id v75;
  void *v76;
  void *v77;
  void *v78;
  NSObject *v79;
  void *v80;
  void *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t i;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  int v92;
  uint64_t v93;
  id v94;
  NSObject *v95;
  void *v96;
  void *v98;
  id obj;
  void *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  void *v105;
  void *v106;
  MRURoutingViewController *v107;
  void *v108;
  uint64_t v109;
  id v110;
  id v111;
  uint64_t v112;
  id v113;
  void *v114;
  void *v115;
  _QWORD v116[4];
  id v117;
  MRURoutingViewController *v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  _BYTE v135[128];
  _BYTE v136[128];
  uint8_t v137[128];
  uint8_t buf[4];
  uint64_t v139;
  __int16 v140;
  id v141;
  _BYTE v142[128];
  uint64_t v143;

  v143 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "count") + objc_msgSend(v6, "count"));
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  v108 = v6;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  v131 = 0u;
  v132 = 0u;
  v133 = 0u;
  v134 = 0u;
  obj = v7;
  v102 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v131, v142, 16);
  if (!v102)
    goto LABEL_72;
  v101 = *(_QWORD *)v132;
  p_superclass = &OBJC_METACLASS___MRUSpatialAccessibilityObserver.superclass;
  v107 = self;
  do
  {
    v9 = 0;
    do
    {
      if (*(_QWORD *)v132 != v101)
        objc_enumerationMutation(obj);
      v10 = *(void **)(*((_QWORD *)&v131 + 1) + 8 * v9);
      objc_msgSend(v10, "endpoints");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "count");

      if (v12 >= 2)
      {
        v13 = (id)objc_msgSend(objc_alloc((Class)(p_superclass + 59)), "initWithDevice:", v10);
        MCLogCategoryDeviceAccess();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v10, "endpoints");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "count");
          *(_DWORD *)buf = 134218242;
          v139 = v16;
          v140 = 2112;
          v141 = v13;
          _os_log_impl(&dword_1AA991000, v14, OS_LOG_TYPE_DEFAULT, "_mergeRoutes - Found a route group with %lu endpoints: %@", buf, 0x16u);

        }
        v103 = v9;
        if (-[MRURoutingViewController isVendorSpecificGroupStatusRecorded:](self, "isVendorSpecificGroupStatusRecorded:", v13))
        {
          -[MRURoutingViewController applyVendorSpecificGroupExpandedRecord:](self, "applyVendorSpecificGroupExpandedRecord:", v13);
        }
        else
        {
          -[MRURoutingViewController updateVendorSpecificGroupExpandedRecordFor:](self, "updateVendorSpecificGroupExpandedRecordFor:", v13);
        }
        v129 = 0u;
        v130 = 0u;
        v127 = 0u;
        v128 = 0u;
        objc_msgSend(v10, "endpoints");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "allValues");
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        v113 = v37;
        v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v127, v137, 16);
        if (v38)
        {
          v39 = v38;
          v40 = *(_QWORD *)v128;
          v109 = *(_QWORD *)v128;
          v110 = v13;
          do
          {
            v41 = 0;
            v112 = v39;
            do
            {
              if (*(_QWORD *)v128 != v40)
                objc_enumerationMutation(v113);
              v42 = *(void **)(*((_QWORD *)&v127 + 1) + 8 * v41);
              v43 = objc_alloc((Class)(p_superclass + 59));
              objc_msgSend(v42, "underlyingDADevice");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              v45 = (void *)objc_msgSend(v43, "initWithDevice:", v44);

              v46 = v45;
              objc_msgSend(v45, "setIsPreferredRoute:", objc_msgSend(v42, "selected"));
              objc_msgSend(v45, "device");
              v47 = (void *)objc_claimAutoreleasedReturnValue();

              if (v47)
              {
                -[MRUVendorSpecificDeviceManager activatedDeviceIDs](self->_vendorSpecificManager, "activatedDeviceIDs");
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v46, "routeUID");
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v46, "setIsPicked:", objc_msgSend(v48, "containsObject:", v49));

                objc_msgSend(v13, "addSubRoute:", v46);
              }
              else
              {
                v115 = v45;
                v125 = 0u;
                v126 = 0u;
                v123 = 0u;
                v124 = 0u;
                v50 = v108;
                v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v123, v136, 16);
                if (v51)
                {
                  v52 = v51;
                  v53 = *(_QWORD *)v124;
LABEL_26:
                  v54 = 0;
                  while (1)
                  {
                    if (*(_QWORD *)v124 != v53)
                      objc_enumerationMutation(v50);
                    v55 = *(void **)(*((_QWORD *)&v123 + 1) + 8 * v54);
                    objc_msgSend(v55, "routeUID");
                    v56 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v42, "airplayDeviceID");
                    v57 = (void *)objc_claimAutoreleasedReturnValue();
                    v58 = objc_msgSend(v56, "isEqualToString:", v57);

                    if (v58)
                      break;
                    if (v52 == ++v54)
                    {
                      v52 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v123, v136, 16);
                      if (v52)
                        goto LABEL_26;
                      goto LABEL_32;
                    }
                  }
                  MCLogCategoryDeviceAccess();
                  v59 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    v139 = (uint64_t)v55;
                    _os_log_impl(&dword_1AA991000, v59, OS_LOG_TYPE_DEFAULT, "_mergeRoutes - Native route that was grouped: %@", buf, 0xCu);
                  }

                  v60 = v55;
                  v46 = v115;
                  objc_msgSend(v115, "setUnderlyingNativeRoute:", v60);

                  v40 = v109;
                  v13 = v110;
                  if (v60)
                  {
                    objc_msgSend(v105, "addObject:", v60);
                    objc_msgSend(v106, "addObject:", v60);
                    objc_msgSend(v110, "addSubRoute:", v115);
                    self = v107;
                    p_superclass = (__objc2_class **)(&OBJC_METACLASS___MRUSpatialAccessibilityObserver + 8);
                    v39 = v112;
                    goto LABEL_40;
                  }
                }
                else
                {
LABEL_32:

                  v40 = v109;
                  v13 = v110;
                  v46 = v115;
                }
                MCLogCategoryDeviceAccess();
                v60 = objc_claimAutoreleasedReturnValue();
                v39 = v112;
                if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1AA991000, v60, OS_LOG_TYPE_DEFAULT, "Was unable to find a current native route that matches the record in DA coalesced result", buf, 2u);
                }
                self = v107;
                p_superclass = &OBJC_METACLASS___MRUSpatialAccessibilityObserver.superclass;
LABEL_40:

              }
              ++v41;
            }
            while (v41 != v39);
            v39 = objc_msgSend(v113, "countByEnumeratingWithState:objects:count:", &v127, v137, 16);
          }
          while (v39);
        }

        objc_msgSend(v13, "subroutes");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = objc_msgSend(v61, "count");

        if (v62 >= 2)
        {
          objc_msgSend(v100, "addObject:", v13);
LABEL_66:
          v9 = v103;
          goto LABEL_67;
        }
        objc_msgSend(v13, "subroutes");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        v67 = objc_msgSend(v66, "count");

        if (v67)
        {
          objc_msgSend(v13, "subroutes");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v68, "firstObject");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v69, "device");
          v70 = (void *)objc_claimAutoreleasedReturnValue();

          if (v70)
          {
            MCLogCategoryDeviceAccess();
            v71 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v13, "subroutes");
              v72 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v72, "firstObject");
              v73 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v73, "device");
              v74 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v139 = (uint64_t)v74;
              _os_log_impl(&dword_1AA991000, v71, OS_LOG_TYPE_DEFAULT, "Changing group route to single route instead with device: %@", buf, 0xCu);

            }
            v75 = objc_alloc((Class)(p_superclass + 59));
            objc_msgSend(v13, "subroutes");
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v76, "firstObject");
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v77, "device");
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            v79 = objc_msgSend(v75, "initWithDevice:", v78);

            -[MRUVendorSpecificDeviceManager activatedDeviceIDs](self->_vendorSpecificManager, "activatedDeviceIDs");
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject routeUID](v79, "routeUID");
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject setIsPicked:](v79, "setIsPicked:", objc_msgSend(v80, "containsObject:", v81));

            objc_msgSend(v100, "addObject:", v79);
            goto LABEL_64;
          }
        }
        else
        {
          MCLogCategoryDeviceAccess();
          v79 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1AA991000, v79, OS_LOG_TYPE_DEFAULT, "Weird situation, DA coalesced route contains only airplay routes and they have disappeared?", buf, 2u);
          }
LABEL_64:

        }
        -[MRURoutingViewController clearVendorSpecificGroupExpandedRecordFor:](self, "clearVendorSpecificGroupExpandedRecordFor:", v13);
        goto LABEL_66;
      }
      objc_msgSend(v10, "endpoints");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "count");

      if (v18 == 1)
      {
        objc_msgSend(v10, "endpoints");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "allValues");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "firstObject");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "underlyingDADevice");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        v114 = v10;
        if (v22)
        {
          v23 = v9;
          MCLogCategoryDeviceAccess();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v10, "endpoints");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "allValues");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "firstObject");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "underlyingDADevice");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v139 = (uint64_t)v28;
            _os_log_impl(&dword_1AA991000, v24, OS_LOG_TYPE_DEFAULT, "_mergeRoutes - Single Underlying DA route found: %@", buf, 0xCu);

            v10 = v114;
          }

          v29 = objc_alloc((Class)(p_superclass + 59));
          objc_msgSend(v10, "endpoints");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "allValues");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "firstObject");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "underlyingDADevice");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = (id)objc_msgSend(v29, "initWithDevice:", v33);

          -[MRUVendorSpecificDeviceManager activatedDeviceIDs](self->_vendorSpecificManager, "activatedDeviceIDs");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "routeUID");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setIsPicked:", objc_msgSend(v34, "containsObject:", v35));

          objc_msgSend(v100, "addObject:", v13);
          v9 = v23;
        }
        else
        {
          v121 = 0u;
          v122 = 0u;
          v119 = 0u;
          v120 = 0u;
          v13 = v108;
          v82 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v119, v135, 16);
          if (v82)
          {
            v83 = v82;
            v111 = v13;
            v104 = v9;
            v84 = *(_QWORD *)v120;
            while (2)
            {
              for (i = 0; i != v83; ++i)
              {
                if (*(_QWORD *)v120 != v84)
                  objc_enumerationMutation(v111);
                v86 = *(void **)(*((_QWORD *)&v119 + 1) + 8 * i);
                objc_msgSend(v86, "routeUID");
                v87 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v10, "endpoints");
                v88 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v88, "allValues");
                v89 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v89, "firstObject");
                v90 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v90, "airplayDeviceID");
                v91 = (void *)objc_claimAutoreleasedReturnValue();
                v92 = objc_msgSend(v87, "isEqualToString:", v91);

                if (v92)
                {
                  objc_msgSend(v106, "addObject:", v86);
                  goto LABEL_70;
                }
                v10 = v114;
              }
              v83 = objc_msgSend(v111, "countByEnumeratingWithState:objects:count:", &v119, v135, 16);
              if (v83)
                continue;
              break;
            }
LABEL_70:
            self = v107;
            p_superclass = (__objc2_class **)(&OBJC_METACLASS___MRUSpatialAccessibilityObserver + 8);
            v9 = v104;
            v13 = v111;
          }
        }
      }
      else
      {
        MCLogCategoryDeviceAccess();
        v63 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v139 = (uint64_t)v10;
          _os_log_impl(&dword_1AA991000, v63, OS_LOG_TYPE_DEFAULT, "_mergeRoutes - Single and UnCoalesced DA route found: %@", buf, 0xCu);
        }

        v13 = (id)objc_msgSend(objc_alloc((Class)(p_superclass + 59)), "initWithDevice:", v10);
        -[MRUVendorSpecificDeviceManager activatedDeviceIDs](self->_vendorSpecificManager, "activatedDeviceIDs");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "routeUID");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setIsPicked:", objc_msgSend(v64, "containsObject:", v65));

        objc_msgSend(v100, "addObject:", v13);
      }
LABEL_67:

      ++v9;
    }
    while (v9 != v102);
    v93 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v131, v142, 16);
    v102 = v93;
  }
  while (v93);
LABEL_72:

  if (-[MRURoutingViewController canUseUncoalescedResults](self, "canUseUncoalescedResults"))
  {
    v94 = v108;
  }
  else
  {
    v116[0] = MEMORY[0x1E0C809B0];
    v116[1] = 3221225472;
    v116[2] = __61__MRURoutingViewController__mergeRoutes_withCoalescedResult___block_invoke;
    v116[3] = &unk_1E581A8E0;
    v117 = v106;
    v118 = self;
    objc_msgSend(v108, "msv_compactMap:", v116);
    v94 = (id)objc_claimAutoreleasedReturnValue();

  }
  MCLogCategoryDeviceAccess();
  v95 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v139 = (uint64_t)v94;
    _os_log_impl(&dword_1AA991000, v95, OS_LOG_TYPE_DEFAULT, "nativeRoutesThatCanBeDisplayed: %@", buf, 0xCu);
  }

  objc_msgSend(v98, "addObjectsFromArray:", v94);
  objc_msgSend(v98, "addObjectsFromArray:", v100);
  v96 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4D0B8]), "initWithFirst:second:", v98, v105);

  return v96;
}

id __61__MRURoutingViewController__mergeRoutes_withCoalescedResult___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  NSObject *v7;
  id v8;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!objc_msgSend(v3, "isAirPlayRoute"))
    goto LABEL_8;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_8;
  if (!objc_msgSend(*(id *)(a1 + 32), "containsObject:", v3)
    && (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1160), "resolverManagedAirPlayRouteIDs"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v3, "routeUID"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v4, "containsObject:", v5),
        v5,
        v4,
        (v6 & 1) != 0))
  {
    MCLogCategoryDeviceAccess();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412290;
      v11 = v3;
      _os_log_impl(&dword_1AA991000, v7, OS_LOG_TYPE_DEFAULT, "Merge routes: skipping native route because it has not gone through the resolver yet: %@", (uint8_t *)&v10, 0xCu);
    }

    v8 = 0;
  }
  else
  {
LABEL_8:
    v8 = v3;
  }

  return v8;
}

- (void)_createUpdateWithRefreshOnly:(BOOL)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  BOOL v10;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __68__MRURoutingViewController__createUpdateWithRefreshOnly_completion___block_invoke;
  v8[3] = &unk_1E581A908;
  v10 = a3;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[MRURoutingViewController fetchAvailableRoutesWithCompletionHandler:](self, "fetchAvailableRoutesWithCompletionHandler:", v8);

}

void __68__MRURoutingViewController__createUpdateWithRefreshOnly_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  MRURoutingViewControllerUpdate *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  uint64_t v30;
  void *v31;
  char v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t j;
  uint64_t v38;
  void *v39;
  id v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  id v50;
  id v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  id v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _BYTE v69[128];
  uint8_t v70[128];
  uint8_t buf[4];
  uint64_t v72;
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_alloc_init(MRURoutingViewControllerUpdate);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1152), "pickedRoutes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  -[MRURoutingViewControllerUpdate setPickedRoutes:](v4, "setPickedRoutes:", v6);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1152), "pendingPickedRoutes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRURoutingViewControllerUpdate setPendingPickedRoutes:](v4, "setPendingPickedRoutes:", v8);

  -[MRURoutingViewControllerUpdate setNativeRoutes:](v4, "setNativeRoutes:", v3);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1160), "activatedDeviceIDs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRURoutingViewControllerUpdate setActivatedVendorSpecificDeviceIDs:](v4, "setActivatedVendorSpecificDeviceIDs:", v9);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1160), "activatingDeviceIDs");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1160), "invalidatingDeviceIDs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "arrayByAddingObjectsFromArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRURoutingViewControllerUpdate setPendingVendorSpecificDeviceIDs:](v4, "setPendingVendorSpecificDeviceIDs:", v12);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1160), "availableDeviceIDs");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRURoutingViewControllerUpdate setAvailableVendorSpecificDeviceIDs:](v4, "setAvailableVendorSpecificDeviceIDs:", v13);

  v14 = *(id **)(a1 + 32);
  objc_msgSend(v14[145], "coalescedDevices");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "_mergeRoutes:withCoalescedResult:", v3, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "first");
  v17 = objc_claimAutoreleasedReturnValue();
  v57 = v16;
  objc_msgSend(v16, "second");
  v18 = objc_claimAutoreleasedReturnValue();
  MCLogCategoryDeviceAccess();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v72 = v18;
    _os_log_impl(&dword_1AA991000, v19, OS_LOG_TYPE_DEFAULT, "nativeRoutesInVendorSpecificGroup: %@", buf, 0xCu);
  }

  -[MRURoutingViewControllerUpdate setNativeRoutesInVendorSpecificGroup:](v4, "setNativeRoutesInVendorSpecificGroup:", v18);
  v56 = (void *)v17;
  objc_msgSend(*(id *)(a1 + 32), "_displayableRoutesInRoutes:", v17);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRURoutingViewControllerUpdate setDisplayableAvailableRoutes:](v4, "setDisplayableAvailableRoutes:", v20);

  v55 = (void *)v18;
  if ((objc_msgSend(*(id *)(a1 + 32), "shouldSuppressNativeRoutesStatusDisplay") & 1) != 0)
  {
    -[MRURoutingViewControllerUpdate setDisplayAsPickedRoutes:](v4, "setDisplayAsPickedRoutes:", MEMORY[0x1E0C9AA60]);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_displayAsPickedRoutesInRoutes:", v3);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRURoutingViewControllerUpdate setDisplayAsPickedRoutes:](v4, "setDisplayAsPickedRoutes:", v21);

  }
  -[MRURoutingViewControllerUpdate setCanGroup:](v4, "setCanGroup:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1152), "supportsMultipleSelection"));
  -[MRURoutingViewControllerUpdate setHasPendingPickedRoutes:](v4, "setHasPendingPickedRoutes:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1152), "hasPendingPickedRoutes"));
  objc_msgSend(*(id *)(a1 + 32), "_airPlayRoutesInRoutes:", v3);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRURoutingViewControllerUpdate setAirPlayRoutes:](v4, "setAirPlayRoutes:", v22);

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1056), "count"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)MEMORY[0x1E0C99DE8];
  -[MRURoutingViewControllerUpdate airPlayRoutes](v4, "airPlayRoutes");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "arrayWithCapacity:", objc_msgSend(v24, "count"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  v25 = *(id *)(*(_QWORD *)(a1 + 32) + 1056);
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v65, v70, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v66;
    do
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v66 != v28)
          objc_enumerationMutation(v25);
        v30 = *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * i);
        -[MRURoutingViewControllerUpdate airPlayRoutes](v4, "airPlayRoutes");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "containsObject:", v30);

        if ((v32 & 1) == 0)
          objc_msgSend(v58, "addObject:", v30);
      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v65, v70, 16);
    }
    while (v27);
  }

  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  -[MRURoutingViewControllerUpdate airPlayRoutes](v4, "airPlayRoutes");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v61, v69, 16);
  if (v34)
  {
    v35 = v34;
    v36 = *(_QWORD *)v62;
    do
    {
      for (j = 0; j != v35; ++j)
      {
        if (*(_QWORD *)v62 != v36)
          objc_enumerationMutation(v33);
        v38 = *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * j);
        if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1056), "containsObject:", v38) & 1) == 0)
          objc_msgSend(v54, "addObject:", v38);
      }
      v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v61, v69, 16);
    }
    while (v35);
  }

  if (!*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1160), "resolverRemoveNativeRoutes:", v58);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1160), "resolverAddNativeRoutes:", v54);
  }
  v39 = *(void **)(a1 + 32);
  v59 = 0;
  v60 = 0;
  objc_msgSend(v39, "_configureVolumeForUpdate:volumeCapableRoutes:volumeController:", v4, &v60, &v59);
  v40 = v60;
  v41 = v59;
  v42 = objc_msgSend(v41, "copy");
  v43 = *(_QWORD *)(a1 + 32);
  v44 = *(void **)(v43 + 1256);
  *(_QWORD *)(v43 + 1256) = v42;

  objc_msgSend(v41, "allValues");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1184), "setVolumeControllers:", v45);

  v46 = (void *)objc_msgSend(v40, "copy");
  -[MRURoutingViewControllerUpdate setVolumeCapableRoutes:](v4, "setVolumeCapableRoutes:", v46);

  v47 = *(void **)(a1 + 32);
  -[MRURoutingViewControllerUpdate displayableAvailableRoutes](v4, "displayableAvailableRoutes");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "updateNowPlayingControllersForRoutes:", v48);

  v49 = *(_QWORD *)(a1 + 32);
  v50 = *(id *)(v49 + 992);
  v51 = *(id *)(v49 + 1200);
  v52 = v51;
  if (v51 == v50)
    v53 = 0;
  else
    v53 = objc_msgSend(v51, "isEqual:", v50) ^ 1;

  -[MRURoutingViewControllerUpdate setShouldReload:](v4, "setShouldReload:", v53);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)_updateDisplayedRoutes
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __50__MRURoutingViewController__updateDisplayedRoutes__block_invoke;
  v2[3] = &unk_1E581A930;
  v2[4] = self;
  -[MRURoutingViewController _createUpdateWithRefreshOnly:completion:](self, "_createUpdateWithRefreshOnly:completion:", 0, v2);
}

uint64_t __50__MRURoutingViewController__updateDisplayedRoutes__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_enqueueUpdate:", a2);
}

- (void)_refreshDisplayedRoutes
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __51__MRURoutingViewController__refreshDisplayedRoutes__block_invoke;
  v2[3] = &unk_1E581A930;
  v2[4] = self;
  -[MRURoutingViewController _createUpdateWithRefreshOnly:completion:](self, "_createUpdateWithRefreshOnly:completion:", 1, v2);
}

uint64_t __51__MRURoutingViewController__refreshDisplayedRoutes__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_enqueueUpdate:", a2);
}

- (void)_reloadDisplayedRoutes
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __50__MRURoutingViewController__reloadDisplayedRoutes__block_invoke;
  v2[3] = &unk_1E581A930;
  v2[4] = self;
  -[MRURoutingViewController _createUpdateWithRefreshOnly:completion:](self, "_createUpdateWithRefreshOnly:completion:", 1, v2);
}

void __50__MRURoutingViewController__reloadDisplayedRoutes__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setShouldReload:", 1);
  objc_msgSend(*(id *)(a1 + 32), "_enqueueUpdate:", v3);

}

- (void)setOptimisticUpdate:(id)a3
{
  id v5;
  MRURoutingViewControllerUpdate *optimisticUpdate;
  id v7;

  v5 = a3;
  v7 = v5;
  if (v5)
  {
    -[MRURoutingViewController _enqueueUpdate:](self, "_enqueueUpdate:", v5);
    objc_storeStrong((id *)&self->_optimisticUpdate, a3);
  }
  else
  {
    optimisticUpdate = self->_optimisticUpdate;
    self->_optimisticUpdate = 0;

    -[MRURoutingViewController _updateDisplayedRoutes](self, "_updateDisplayedRoutes");
  }

}

- (void)didReceiveInteraction:(id)a3
{
  if (self->_collapseTimer)
    -[MRURoutingViewController _collapseAllGroupsAfterDelay](self, "_collapseAllGroupsAfterDelay", a3);
}

- (void)_enqueueUpdate:(id)a3
{
  id v5;

  v5 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if (!self->_optimisticUpdate)
  {
    if (self->_isAnimatingUpdate)
      objc_storeStrong((id *)&self->_pendingUpdate, a3);
    else
      -[MRURoutingViewController _applyUpdate:](self, "_applyUpdate:", v5);
  }

}

- (void)_configureVolumeForUpdate:(id)a3 volumeCapableRoutes:(id *)a4 volumeController:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void (**v17)(void *, void *);
  id v18;
  unsigned int (**v19)(void);
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  MRURoutingViewController *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  unsigned int (**v35)(void);
  id v36;
  id v37;
  id *v38;
  id *v39;
  uint64_t v40;
  id obj;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _QWORD v50[4];
  id v51;
  MRURoutingViewController *v52;
  _QWORD aBlock[5];
  id v54;
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(v8, "displayAsPickedRoutes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "arrayWithCapacity:", objc_msgSend(v10, "count"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_alloc(MEMORY[0x1E0C99E08]);
  objc_msgSend(v8, "displayAsPickedRoutes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithCapacity:", objc_msgSend(v13, "count"));

  v15 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __91__MRURoutingViewController__configureVolumeForUpdate_volumeCapableRoutes_volumeController___block_invoke;
  aBlock[3] = &unk_1E581A958;
  aBlock[4] = self;
  v16 = v14;
  v54 = v16;
  v17 = (void (**)(void *, void *))_Block_copy(aBlock);
  v50[0] = v15;
  v50[1] = 3221225472;
  v50[2] = __91__MRURoutingViewController__configureVolumeForUpdate_volumeCapableRoutes_volumeController___block_invoke_2;
  v50[3] = &unk_1E581A980;
  v18 = v8;
  v51 = v18;
  v52 = self;
  v19 = (unsigned int (**)(void))_Block_copy(v50);
  if (v19[2]())
  {
    v35 = v19;
    v36 = v18;
    v37 = v16;
    v38 = a4;
    v39 = a5;
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    objc_msgSend(v18, "displayAsPickedRoutes");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v47;
      v23 = &OBJC_IVAR___MRUNowPlayingLabelView__subtitleMarqueeView;
      do
      {
        v24 = 0;
        v40 = v21;
        do
        {
          if (*(_QWORD *)v47 != v22)
            objc_enumerationMutation(obj);
          v25 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * v24);
          v26 = *(Class *)((char *)&self->super.super.super.isa + v23[181]);
          objc_msgSend(v25, "routeUID");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v26) = objc_msgSend(v26, "containsObject:", v27);

          if ((_DWORD)v26)
          {
            v28 = self;
            v44 = 0u;
            v45 = 0u;
            v42 = 0u;
            v43 = 0u;
            objc_msgSend(v25, "subRoutes");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v42, v55, 16);
            if (v30)
            {
              v31 = v30;
              v32 = *(_QWORD *)v43;
              do
              {
                for (i = 0; i != v31; ++i)
                {
                  if (*(_QWORD *)v43 != v32)
                    objc_enumerationMutation(v29);
                  v34 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
                  v17[2](v17, v34);
                  if (objc_msgSend(v34, "isPicked"))
                    objc_msgSend(v11, "addObject:", v34);
                }
                v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v42, v55, 16);
              }
              while (v31);
            }

            self = v28;
            v23 = &OBJC_IVAR___MRUNowPlayingLabelView__subtitleMarqueeView;
            v21 = v40;
          }
          else
          {
            v17[2](v17, v25);
            objc_msgSend(v11, "addObject:", v25);
          }
          ++v24;
        }
        while (v24 != v21);
        v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
      }
      while (v21);
    }

    a4 = v38;
    a5 = v39;
    v18 = v36;
    v16 = v37;
    v19 = v35;
  }
  if (a4)
    *a4 = objc_retainAutorelease(v11);
  if (a5)
    *a5 = objc_retainAutorelease(v16);

}

void __91__MRURoutingViewController__configureVolumeForUpdate_volumeCapableRoutes_volumeController___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  MRUVolumeController *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "routeUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1256), "objectForKey:", v3);
    v4 = (MRUVolumeController *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      v5 = objc_alloc(MEMORY[0x1E0CC2538]);
      objc_msgSend(*(id *)(a1 + 32), "endpointRoute");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend(v5, "initWithGroupRoute:outputDeviceRoute:", v6, v8);

      v4 = -[MPVolumeController initWithDataSource:]([MRUVolumeController alloc], "initWithDataSource:", v7);
    }
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v4, v3);

  }
}

uint64_t __91__MRURoutingViewController__configureVolumeForUpdate_volumeCapableRoutes_volumeController___block_invoke_2(uint64_t a1)
{
  void *v2;
  unint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  objc_msgSend(*(id *)(a1 + 32), "displayAsPickedRoutes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (v3 > 1)
    return 1;
  v5 = *(void **)(a1 + 32);
  v6 = *(void **)(*(_QWORD *)(a1 + 40) + 1288);
  objc_msgSend(v5, "displayAsPickedRoutes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "routeUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "containsObject:", v9);

  return v10;
}

- (id)endpointGroupUID
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[MPAVEndpointRoute endpoint](self->_endpointRoute, "endpoint");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "designatedGroupLeader");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "groupID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D4C4E8], "localDeviceUID");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

- (void)updateExpandedGroups
{
  void *v3;
  void *v4;
  NSMutableSet *expandedGroupUIDs;
  void *v6;
  id v7;

  v3 = (void *)MEMORY[0x1E0C99E60];
  -[NSDictionary allKeys](self->_cachedRouteGrouping, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[NSMutableSet intersectSet:](self->_expandedGroupUIDs, "intersectSet:", v7);
  if (-[NSArray count](self->_cachedPickedRoutes, "count") == 1)
  {
    expandedGroupUIDs = self->_expandedGroupUIDs;
    -[MRURoutingViewController endpointGroupUID](self, "endpointGroupUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableSet addObject:](expandedGroupUIDs, "addObject:", v6);

  }
}

- (BOOL)wasVendorSpecificGroupDisplayedAsExpanded:(id)a3
{
  NSMutableSet *expandedVendorSpecificGroupUIDs;
  void *v4;

  expandedVendorSpecificGroupUIDs = self->_expandedVendorSpecificGroupUIDs;
  objc_msgSend(a3, "routeUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(expandedVendorSpecificGroupUIDs) = -[NSMutableSet containsObject:](expandedVendorSpecificGroupUIDs, "containsObject:", v4);

  return (char)expandedVendorSpecificGroupUIDs;
}

- (BOOL)isVendorSpecificGroupStatusRecorded:(id)a3
{
  id v4;
  NSMutableSet *expandedVendorSpecificGroupUIDs;
  void *v6;
  char v7;
  NSMutableSet *collapsedVendorSpecificGroupUIDs;
  void *v9;

  v4 = a3;
  expandedVendorSpecificGroupUIDs = self->_expandedVendorSpecificGroupUIDs;
  objc_msgSend(v4, "routeUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[NSMutableSet containsObject:](expandedVendorSpecificGroupUIDs, "containsObject:", v6) & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    collapsedVendorSpecificGroupUIDs = self->_collapsedVendorSpecificGroupUIDs;
    objc_msgSend(v4, "routeUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[NSMutableSet containsObject:](collapsedVendorSpecificGroupUIDs, "containsObject:", v9);

  }
  return v7;
}

- (void)applyVendorSpecificGroupExpandedRecord:(id)a3
{
  NSMutableSet *expandedVendorSpecificGroupUIDs;
  id v4;
  id v5;

  expandedVendorSpecificGroupUIDs = self->_expandedVendorSpecificGroupUIDs;
  v4 = a3;
  objc_msgSend(v4, "routeUID");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setExpanded:", -[NSMutableSet containsObject:](expandedVendorSpecificGroupUIDs, "containsObject:", v5));

}

- (void)updateVendorSpecificGroupExpandedRecordFor:(id)a3
{
  id v4;
  int v5;
  NSMutableSet *expandedVendorSpecificGroupUIDs;
  void *v7;
  NSMutableSet *collapsedVendorSpecificGroupUIDs;
  NSMutableSet *v9;
  id v10;

  v4 = a3;
  v5 = objc_msgSend(v4, "expanded");
  expandedVendorSpecificGroupUIDs = self->_expandedVendorSpecificGroupUIDs;
  objc_msgSend(v4, "routeUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[NSMutableSet addObject:](expandedVendorSpecificGroupUIDs, "addObject:", v7);

    collapsedVendorSpecificGroupUIDs = self->_collapsedVendorSpecificGroupUIDs;
    objc_msgSend(v4, "routeUID");
    v10 = (id)objc_claimAutoreleasedReturnValue();

    -[NSMutableSet removeObject:](collapsedVendorSpecificGroupUIDs, "removeObject:", v10);
  }
  else
  {
    -[NSMutableSet removeObject:](expandedVendorSpecificGroupUIDs, "removeObject:", v7);

    v9 = self->_collapsedVendorSpecificGroupUIDs;
    objc_msgSend(v4, "routeUID");
    v10 = (id)objc_claimAutoreleasedReturnValue();

    -[NSMutableSet addObject:](v9, "addObject:", v10);
  }

}

- (void)clearVendorSpecificGroupExpandedRecordFor:(id)a3
{
  NSMutableSet *expandedVendorSpecificGroupUIDs;
  id v5;
  void *v6;
  NSMutableSet *collapsedVendorSpecificGroupUIDs;
  id v8;

  expandedVendorSpecificGroupUIDs = self->_expandedVendorSpecificGroupUIDs;
  v5 = a3;
  objc_msgSend(v5, "routeUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet removeObject:](expandedVendorSpecificGroupUIDs, "removeObject:", v6);

  collapsedVendorSpecificGroupUIDs = self->_collapsedVendorSpecificGroupUIDs;
  objc_msgSend(v5, "routeUID");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[NSMutableSet removeObject:](collapsedVendorSpecificGroupUIDs, "removeObject:", v8);
}

- (void)_applyUpdate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void (**v17)(_QWORD);
  id v18;
  id v19;
  id v20;
  id v21;
  MRURoutingViewControllerUpdate *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  id WeakRetained;
  char v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  _QWORD block[5];
  _QWORD v35[5];
  _QWORD v36[4];
  id v37;
  MRURoutingViewController *v38;
  void (**v39)(_QWORD);
  _QWORD v40[4];
  id v41;
  id v42;
  MRURoutingViewControllerUpdate *v43;
  MRURoutingViewController *v44;
  id v45;
  _QWORD v46[4];
  id v47;
  id v48;
  _QWORD aBlock[5];
  id v50;
  id v51;
  id v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[MRURoutingViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    goto LABEL_16;
  v7 = (void *)-[MPSectionedCollection copy](self->_routingViewItems, "copy");
  v8 = v7;
  if (v7)
    v9 = v7;
  else
    v9 = objc_alloc_init(MEMORY[0x1E0CC2500]);
  v10 = v9;

  -[MRURoutingViewController _createRoutingViewItemsForUpdate:](self, "_createRoutingViewItemsForUpdate:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "routeGrouping");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pickedRoutes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRURoutingViewController _createSectionedCollection:withPickedRoutes:](self, "_createSectionedCollection:withPickedRoutes:", v11, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __41__MRURoutingViewController__applyUpdate___block_invoke;
  aBlock[3] = &unk_1E581A9A8;
  aBlock[4] = self;
  v15 = v4;
  v50 = v15;
  v16 = v14;
  v51 = v16;
  v31 = v12;
  v52 = v31;
  v17 = (void (**)(_QWORD))_Block_copy(aBlock);
  v46[0] = MEMORY[0x1E0C809B0];
  v46[1] = 3221225472;
  v46[2] = __41__MRURoutingViewController__applyUpdate___block_invoke_3;
  v46[3] = &unk_1E581AA10;
  v18 = v10;
  v47 = v18;
  v19 = v16;
  v48 = v19;
  v32 = _Block_copy(v46);
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __41__MRURoutingViewController__applyUpdate___block_invoke_4;
  v40[3] = &unk_1E581AA38;
  v20 = v18;
  v41 = v20;
  v21 = v19;
  v42 = v21;
  v45 = &__block_literal_global_221;
  v22 = (MRURoutingViewControllerUpdate *)v15;
  v43 = v22;
  v44 = self;
  v33 = _Block_copy(v40);
  if (!-[MRURoutingViewControllerUpdate shouldReload](v22, "shouldReload"))
  {
    objc_msgSend(v20, "changeDetailsToSectionedCollection:isEqualBlock:isUpdatedBlock:", v21, v32, v33);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      self->_isAnimatingUpdate = 1;
      -[MRURoutingViewController view](self, "view");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "tableView");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v36[0] = MEMORY[0x1E0C809B0];
      v36[1] = 3221225472;
      v36[2] = __41__MRURoutingViewController__applyUpdate___block_invoke_223;
      v36[3] = &unk_1E581AA60;
      v39 = v17;
      v26 = v23;
      v37 = v26;
      v38 = self;
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = __41__MRURoutingViewController__applyUpdate___block_invoke_3_226;
      v35[3] = &unk_1E581AA88;
      v35[4] = self;
      objc_msgSend(v25, "performBatchUpdates:completion:", v36, v35);

      v27 = v39;
LABEL_10:

      goto LABEL_11;
    }
  }
  v17[2](v17);
  objc_storeStrong((id *)&self->_displayedEndpointRoute, self->_endpointRoute);
  if (-[MRURoutingViewControllerUpdate shouldReload](v22, "shouldReload"))
  {
    -[MRURoutingViewController view](self, "view");
    v26 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "tableView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "reloadData");
    goto LABEL_10;
  }
LABEL_11:
  self->_needsDisplayedRoutesUpdate = 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v29 = objc_opt_respondsToSelector();

  if ((v29 & 1) != 0)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __41__MRURoutingViewController__applyUpdate___block_invoke_231;
    block[3] = &unk_1E5818C88;
    block[4] = self;
    v30 = (void *)MEMORY[0x1E0C80D38];
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  if (self->_pendingUpdate == v22)
  {
    self->_pendingUpdate = 0;

  }
LABEL_16:

}

uint64_t __41__MRURoutingViewController__applyUpdate___block_invoke(id *a1)
{
  uint64_t v2;
  _QWORD *v3;
  void *v4;
  uint64_t v5;
  _QWORD *v6;
  void *v7;
  uint64_t v8;
  _QWORD *v9;
  void *v10;
  uint64_t v11;
  _QWORD *v12;
  void *v13;
  uint64_t v14;
  _QWORD *v15;
  void *v16;
  uint64_t v17;
  _QWORD *v18;
  void *v19;
  uint64_t v20;
  _QWORD *v21;
  void *v22;
  uint64_t v23;
  _QWORD *v24;
  void *v25;
  uint64_t v26;
  _QWORD *v27;
  void *v28;
  uint64_t v29;
  _QWORD *v30;
  void *v31;
  uint64_t v32;
  _QWORD *v33;
  void *v34;

  objc_msgSend(a1[5], "displayableAvailableRoutes");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = a1[4];
  v4 = (void *)v3[127];
  v3[127] = v2;

  objc_msgSend(a1[5], "pickedRoutes");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = a1[4];
  v7 = (void *)v6[126];
  v6[126] = v5;

  objc_msgSend(a1[5], "pendingPickedRoutes");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = a1[4];
  v10 = (void *)v9[128];
  v9[128] = v8;

  objc_msgSend(a1[5], "displayAsPickedRoutes");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = a1[4];
  v13 = (void *)v12[129];
  v12[129] = v11;

  objc_msgSend(a1[5], "volumeCapableRoutes");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = a1[4];
  v16 = (void *)v15[130];
  v15[130] = v14;

  objc_storeStrong((id *)a1[4] + 125, a1[6]);
  objc_storeStrong((id *)a1[4] + 131, a1[7]);
  objc_msgSend(a1[5], "airPlayRoutes");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = a1[4];
  v19 = (void *)v18[132];
  v18[132] = v17;

  objc_msgSend(a1[5], "nativeRoutes");
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = a1[4];
  v22 = (void *)v21[133];
  v21[133] = v20;

  objc_msgSend(a1[5], "nativeRoutesInVendorSpecificGroup");
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = a1[4];
  v25 = (void *)v24[134];
  v24[134] = v23;

  objc_msgSend(a1[5], "activatedVendorSpecificDeviceIDs");
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = a1[4];
  v28 = (void *)v27[135];
  v27[135] = v26;

  objc_msgSend(a1[5], "pendingVendorSpecificDeviceIDs");
  v29 = objc_claimAutoreleasedReturnValue();
  v30 = a1[4];
  v31 = (void *)v30[136];
  v30[136] = v29;

  objc_msgSend(a1[5], "availableVendorSpecificDeviceIDs");
  v32 = objc_claimAutoreleasedReturnValue();
  v33 = a1[4];
  v34 = (void *)v33[137];
  v33[137] = v32;

  return objc_msgSend(a1[4], "updateExpandedGroups");
}

BOOL __41__MRURoutingViewController__applyUpdate___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  char v4;
  _BOOL8 v5;

  v2 = a2;
  v5 = 0;
  if (objc_msgSend(v2, "type") == 5)
  {
    objc_msgSend(v2, "mainRoute");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isAirPlayRoute");

    if ((v4 & 1) != 0)
      v5 = 1;
  }

  return v5;
}

uint64_t __41__MRURoutingViewController__applyUpdate___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;

  v5 = a3;
  v6 = a2;
  v7 = objc_msgSend(v6, "length");
  v8 = *(void **)(a1 + 32);
  if (v7 == 1)
  {
    v9 = objc_msgSend(v6, "section");

    objc_msgSend(v8, "sectionAtIndex:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(void **)(a1 + 40);
    v12 = objc_msgSend(v5, "section");

    objc_msgSend(v11, "sectionAtIndex:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v10, "isEqualToString:", v13);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "itemAtIndexPath:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "itemAtIndexPath:", v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_msgSend(v10, "isEqual:", v13);
  }
  v15 = v14;

  return v15;
}

uint64_t __41__MRURoutingViewController__applyUpdate___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  char v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  int v17;
  int v18;
  void *i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  uint64_t v39;
  int v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  char v45;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  char v54;
  void *v55;
  void *v56;
  char v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  int v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  int v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  int v72;
  int v73;
  uint64_t v74;
  uint64_t k;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  int v82;
  void *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  char v88;
  int v89;
  char v90;
  char v91;
  char v92;
  char v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  int v99;
  void *v100;
  int v101;
  void *v102;
  int v103;
  int v104;
  int v105;
  uint64_t v106;
  int v107;
  int v108;
  void *v109;
  void *v110;
  int v111;
  uint64_t j;
  void *v113;
  void *v114;
  int v115;
  void *v116;
  void *v117;
  int v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  int v123;
  void *v124;
  int v125;
  void *v126;
  uint64_t v127;
  int v128;
  uint64_t v129;
  uint64_t v130;
  void *v131;
  uint64_t v132;
  char v133;
  char v134;
  void *v135;
  void *v136;
  int v137;
  uint64_t v138;
  void *v139;
  uint64_t v140;
  uint64_t v141;
  int v142;
  int v143;
  uint64_t m;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t n;
  uint64_t v155;
  void *v156;
  void *v157;
  void *v158;
  NSObject *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  char v164;
  void *v165;
  void *v166;
  char v167;
  char v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t ii;
  uint64_t v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  uint64_t v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  int v189;
  int v190;
  void *v191;
  int v192;
  int v193;
  int v194;
  int v195;
  int v196;
  char v197;
  char v198;
  void *v199;
  char v200;
  char v201;
  char v202;
  void *v203;
  char v204;
  char v205;
  id v206;
  id v207;
  void *v208;
  void *v209;
  void *v210;
  int v211;
  id v212;
  void *v213;
  uint64_t v214;
  int v215;
  id obj;
  int obja;
  int objb;
  int v219;
  void *v220;
  void *v221;
  int v222;
  int v223;
  char v224;
  int v225;
  int v226;
  int v227;
  char v228;
  int v229;
  int v230;
  int v231;
  int v232;
  char v233;
  char v234;
  uint64_t v235;
  int v236;
  void *v237;
  uint64_t v238;
  void *v239;
  void *v240;
  uint64_t v241;
  uint64_t v242;
  void *v243;
  id v244;
  int v245;
  id v246;
  id v247;
  id v248;
  id v249;
  int v250;
  int v251;
  void *v252;
  int v253;
  uint64_t v254;
  uint64_t v255;
  int v256;
  int v257;
  uint64_t v258;
  int v259;
  __int128 v260;
  __int128 v261;
  __int128 v262;
  __int128 v263;
  __int128 v264;
  __int128 v265;
  __int128 v266;
  __int128 v267;
  uint8_t buf[16];
  __int128 v269;
  __int128 v270;
  __int128 v271;
  __int128 v272;
  __int128 v273;
  __int128 v274;
  __int128 v275;
  __int128 v276;
  __int128 v277;
  __int128 v278;
  __int128 v279;
  __int128 v280;
  __int128 v281;
  __int128 v282;
  __int128 v283;
  __int128 v284;
  _BYTE v285[128];
  _BYTE v286[128];
  _BYTE v287[128];
  _BYTE v288[128];
  _BYTE v289[128];
  _BYTE v290[128];
  uint64_t v291;

  v291 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v5, "length") != 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "itemAtIndexPath:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v206 = v6;
    objc_msgSend(*(id *)(a1 + 40), "itemAtIndexPath:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "type");
    v208 = v9;
    v207 = v5;
    if (v10 != objc_msgSend(v9, "type") || (v11 = objc_msgSend(v8, "type"), v11 == 6))
    {
LABEL_28:
      v7 = 0;
LABEL_29:
      v13 = v208;
      goto LABEL_30;
    }
    v12 = v11;
    if (v11 == 2)
    {
      v7 = objc_msgSend(v8, "isEqual:", v9) ^ 1;
      v13 = v9;
LABEL_30:

      v6 = v206;
      v5 = v207;
      goto LABEL_31;
    }
    v209 = v8;
    v258 = a1;
    if ((unint64_t)(v11 - 3) < 2)
    {
      if (v11 != 3)
      {
        v283 = 0u;
        v284 = 0u;
        v281 = 0u;
        v282 = 0u;
        objc_msgSend(v9, "mainRoute");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "subroutes");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        obj = v15;
        v244 = (id)objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v281, v290, 16);
        v16 = 0;
        if (!v244)
        {
          LOBYTE(v211) = 0;
          LOBYTE(v17) = 0;
          LOBYTE(v18) = 0;
          LOBYTE(v219) = 0;
          goto LABEL_54;
        }
        LOBYTE(v211) = 0;
        v17 = 0;
        v18 = 0;
        v219 = 0;
        v238 = *(_QWORD *)v282;
        while (1)
        {
          for (i = 0; i != v244; i = (char *)i + 1)
          {
            if (*(_QWORD *)v282 != v238)
              objc_enumerationMutation(obj);
            v20 = *(void **)(*((_QWORD *)&v281 + 1) + 8 * (_QWORD)i);
            if (objc_msgSend(v20, "isAirPlayRoute"))
            {
              objc_msgSend(v20, "underlyingNativeRoute");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(a1 + 48), "displayAsPickedRoutes");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v219 |= objc_msgSend(v22, "containsObject:", v21);

              objc_msgSend(*(id *)(a1 + 48), "pickedRoutes");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v251 = objc_msgSend(v23, "containsObject:", v21);

              objc_msgSend(*(id *)(a1 + 48), "pendingPickedRoutes");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = objc_msgSend(v24, "containsObject:", v21);

              objc_msgSend(*(id *)(a1 + 48), "volumeCapableRoutes");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v27 = objc_msgSend(v26, "containsObject:", v21);
              v211 = v27 ^ objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 1040), "containsObject:", v21);

              if (objc_msgSend(v20, "supportsAirPlayGrouping"))
              {
                v232 = v17;
                v28 = *(void **)(a1 + 56);
                objc_msgSend(*(id *)(a1 + 48), "displayAsPickedRoutes");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                LODWORD(v28) = objc_msgSend(v28, "routesContainAirPlayGroupableRoute:", v29);
                v30 = v28 ^ objc_msgSend(*(id *)(a1 + 56), "routesContainAirPlayGroupableRoute:", *(_QWORD *)(*(_QWORD *)(a1 + 56) + 1032));
                goto LABEL_19;
              }
              goto LABEL_20;
            }
            v227 = v16;
            objc_msgSend(*(id *)(a1 + 48), "activatedVendorSpecificDeviceIDs");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "routeUID");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = objc_msgSend(v31, "containsObject:", v32);

            objc_msgSend(*(id *)(a1 + 48), "pendingVendorSpecificDeviceIDs");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "routeUID");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v223 = objc_msgSend(v34, "containsObject:", v35);

            if (objc_msgSend(v20, "supportsGrouping"))
            {
              v251 = v33;
              v232 = v17;
              objc_msgSend(*(id *)(a1 + 56), "vendorSpecificManager");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(a1 + 48), "availableVendorSpecificDeviceIDs");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(a1 + 48), "activatedVendorSpecificDeviceIDs");
              v213 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "protocolIdentifier");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              v37 = objc_msgSend(v21, "isGroupingAvailableFor:activatedIDs:forProtocolID:", v29, v213, v36);
              objc_msgSend(*(id *)(a1 + 56), "vendorSpecificManager");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              v39 = *(_QWORD *)(v258 + 56);
              v40 = v18;
              v41 = *(_QWORD *)(v39 + 1096);
              v42 = *(_QWORD *)(v39 + 1080);
              objc_msgSend(v20, "protocolIdentifier");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              v44 = v41;
              v18 = v40;
              v30 = v37 ^ objc_msgSend(v38, "isGroupingAvailableFor:activatedIDs:forProtocolID:", v44, v42, v43);

              a1 = v258;
              v25 = v223;
              v16 = v227;
LABEL_19:
              v16 |= v30;

              v17 = v232;
LABEL_20:

              v33 = v251;
              goto LABEL_22;
            }
            v25 = v223;
            v16 = v227;
LABEL_22:
            v17 |= v25;
            v18 |= v33;
          }
          v244 = (id)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v281, v290, 16);
          if (!v244)
          {
LABEL_54:
            v205 = v18;

            v279 = 0u;
            v280 = 0u;
            v277 = 0u;
            v278 = 0u;
            v8 = v209;
            objc_msgSend(v209, "mainRoute");
            v109 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v109, "subroutes");
            v110 = (void *)objc_claimAutoreleasedReturnValue();

            v212 = v110;
            v241 = objc_msgSend(v110, "countByEnumeratingWithState:objects:count:", &v277, v289, 16);
            v234 = v17;
            v111 = 0;
            v89 = 0;
            if (!v241)
            {
              LOBYTE(obja) = 0;
              goto LABEL_71;
            }
            obja = 0;
            v214 = *(_QWORD *)v278;
            while (1)
            {
              for (j = 0; j != v241; ++j)
              {
                if (*(_QWORD *)v278 != v214)
                  objc_enumerationMutation(v212);
                v113 = *(void **)(*((_QWORD *)&v277 + 1) + 8 * j);
                if (objc_msgSend(v113, "isAirPlayRoute"))
                {
                  objc_msgSend(v113, "underlyingNativeRoute");
                  v114 = (void *)objc_claimAutoreleasedReturnValue();
                  obja |= objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 1032), "containsObject:", v114);
                  v115 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 1008), "containsObject:", v114);
                  v245 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 1024), "containsObject:", v114);
                  if (objc_msgSend(v113, "supportsAirPlayGrouping"))
                  {
                    v253 = v115;
                    v225 = v89;
                    v116 = *(void **)(a1 + 56);
                    objc_msgSend(*(id *)(a1 + 48), "displayAsPickedRoutes");
                    v117 = (void *)objc_claimAutoreleasedReturnValue();
                    LODWORD(v116) = objc_msgSend(v116, "routesContainAirPlayGroupableRoute:", v117);
                    v118 = v116 ^ objc_msgSend(*(id *)(a1 + 56), "routesContainAirPlayGroupableRoute:", *(_QWORD *)(*(_QWORD *)(a1 + 56) + 1032));
                    goto LABEL_64;
                  }
                  goto LABEL_65;
                }
                v229 = v111;
                v119 = *(void **)(*(_QWORD *)(a1 + 56) + 1080);
                objc_msgSend(v113, "routeUID");
                v120 = (void *)objc_claimAutoreleasedReturnValue();
                v253 = objc_msgSend(v119, "containsObject:", v120);

                v121 = *(void **)(*(_QWORD *)(a1 + 56) + 1088);
                objc_msgSend(v113, "routeUID");
                v122 = (void *)objc_claimAutoreleasedReturnValue();
                v123 = objc_msgSend(v121, "containsObject:", v122);

                if (objc_msgSend(v113, "supportsGrouping"))
                {
                  v245 = v123;
                  v225 = v89;
                  objc_msgSend(*(id *)(a1 + 56), "vendorSpecificManager");
                  v114 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(*(id *)(a1 + 48), "availableVendorSpecificDeviceIDs");
                  v117 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(*(id *)(a1 + 48), "activatedVendorSpecificDeviceIDs");
                  v210 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v113, "protocolIdentifier");
                  v124 = (void *)objc_claimAutoreleasedReturnValue();
                  v125 = objc_msgSend(v114, "isGroupingAvailableFor:activatedIDs:forProtocolID:", v117, v210, v124);
                  objc_msgSend(*(id *)(v258 + 56), "vendorSpecificManager");
                  v126 = (void *)objc_claimAutoreleasedReturnValue();
                  v127 = *(_QWORD *)(v258 + 56);
                  v128 = v16;
                  v129 = *(_QWORD *)(v127 + 1096);
                  v130 = *(_QWORD *)(v127 + 1080);
                  objc_msgSend(v113, "protocolIdentifier");
                  v131 = (void *)objc_claimAutoreleasedReturnValue();
                  v132 = v129;
                  v16 = v128;
                  v118 = v125 ^ objc_msgSend(v126, "isGroupingAvailableFor:activatedIDs:forProtocolID:", v132, v130, v131);

                  v8 = v209;
                  a1 = v258;

                  v111 = v229;
LABEL_64:
                  v16 |= v118;

                  v89 = v225;
                  v115 = v253;
LABEL_65:

                  v123 = v245;
                  goto LABEL_67;
                }
                v115 = v253;
LABEL_67:
                v111 |= v123;
                v89 |= v115;
              }
              v241 = objc_msgSend(v212, "countByEnumeratingWithState:objects:count:", &v277, v289, 16);
              if (!v241)
              {
LABEL_71:
                v228 = v111;

                if (*(_QWORD *)(*(_QWORD *)(a1 + 56) + 1344))
                {
                  v133 = v89;
                  v134 = v16;
                  objc_msgSend(v208, "mainRoute");
                  v135 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v135, "routeUID");
                  v136 = (void *)objc_claimAutoreleasedReturnValue();
                  v137 = objc_msgSend(v136, "isEqualToString:", *(_QWORD *)(*(_QWORD *)(a1 + 56) + 1344));

                  v93 = v205;
                  if (v137)
                  {
                    v138 = *(_QWORD *)(a1 + 56);
                    v139 = *(void **)(v138 + 1344);
                    *(_QWORD *)(v138 + 1344) = 0;

                    LOBYTE(v16) = 1;
                    v13 = v208;
                    v88 = v234;
                  }
                  else
                  {
                    v13 = v208;
                    v88 = v234;
                    LOBYTE(v16) = v134;
                  }
                  v91 = v219;
                  v90 = v211;
                  LOBYTE(v89) = v133;
                }
                else
                {
                  v13 = v208;
                  v93 = v205;
                  v88 = v234;
                  v91 = v219;
                  v90 = v211;
                }
                v92 = obja;
                goto LABEL_78;
              }
            }
          }
        }
      }
LABEL_32:
      objc_msgSend(v8, "mainRoute");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "mainRoute");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "activatedVendorSpecificDeviceIDs");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "routeUID");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v204 = objc_msgSend(v49, "containsObject:", v50);

      v51 = a1;
      v52 = *(void **)(*(_QWORD *)(a1 + 56) + 1080);
      objc_msgSend(v47, "routeUID");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = objc_msgSend(v52, "containsObject:", v53);

      objc_msgSend(*(id *)(a1 + 48), "pendingVendorSpecificDeviceIDs");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "routeUID");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = objc_msgSend(v55, "containsObject:", v56);

      v58 = *(void **)(*(_QWORD *)(a1 + 56) + 1088);
      objc_msgSend(v47, "routeUID");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v228 = objc_msgSend(v58, "containsObject:", v59);

      v224 = v54;
      v233 = v57;
      v252 = v48;
      if (objc_msgSend(v48, "supportsGrouping"))
      {
        objc_msgSend(*(id *)(a1 + 56), "vendorSpecificManager");
        v239 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 48), "availableVendorSpecificDeviceIDs");
        v220 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 48), "activatedVendorSpecificDeviceIDs");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "protocolIdentifier");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = objc_msgSend(v239, "isGroupingAvailableFor:activatedIDs:forProtocolID:", v220, v60, v61);
        objc_msgSend(*(id *)(v51 + 56), "vendorSpecificManager");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = *(_QWORD *)(v51 + 56);
        v65 = *(_QWORD *)(v64 + 1096);
        v66 = *(_QWORD *)(v64 + 1080);
        objc_msgSend(v48, "protocolIdentifier");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        v68 = v62 ^ objc_msgSend(v63, "isGroupingAvailableFor:activatedIDs:forProtocolID:", v65, v66, v67);

      }
      else
      {
        v68 = 0;
      }
      if (objc_msgSend(v47, "supportsGrouping"))
      {
        objc_msgSend(*(id *)(v258 + 56), "vendorSpecificManager");
        v240 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v258 + 48), "availableVendorSpecificDeviceIDs");
        v221 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v258 + 48), "activatedVendorSpecificDeviceIDs");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "protocolIdentifier");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        v82 = objc_msgSend(v240, "isGroupingAvailableFor:activatedIDs:forProtocolID:", v221, v80, v81);
        objc_msgSend(*(id *)(v258 + 56), "vendorSpecificManager");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        v84 = *(_QWORD *)(v258 + 56);
        v85 = *(_QWORD *)(v84 + 1096);
        v86 = *(_QWORD *)(v84 + 1080);
        objc_msgSend(v47, "protocolIdentifier");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        v68 |= v82 ^ objc_msgSend(v83, "isGroupingAvailableFor:activatedIDs:forProtocolID:", v85, v86, v87);

      }
      v88 = v233;
      LOBYTE(v89) = v224;

      v90 = 0;
      v91 = 0;
      v92 = 0;
      LOBYTE(v16) = v68 != 0;
      v13 = v208;
      v93 = v204;
LABEL_78:
      v7 = v91 ^ v92 | v93 ^ v89 | v88 ^ v228 | v90 | v16;
      goto LABEL_30;
    }
    v45 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    if (v12 == 5 && (v45 & 1) == 0)
    {
      if (((*(uint64_t (**)(void))(*(_QWORD *)(a1 + 64) + 16))() & 1) == 0)
        goto LABEL_32;
      goto LABEL_28;
    }
    if (v12 == 7)
    {
      v275 = 0u;
      v276 = 0u;
      v273 = 0u;
      v274 = 0u;
      objc_msgSend(v9, "routes");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v70 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v273, v288, 16);
      if (v70)
      {
        v71 = v70;
        v72 = 0;
        v73 = 0;
        v74 = *(_QWORD *)v274;
        while (2)
        {
          for (k = 0; k != v71; ++k)
          {
            if (*(_QWORD *)v274 != v74)
              objc_enumerationMutation(v69);
            v76 = *(void **)(*((_QWORD *)&v273 + 1) + 8 * k);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {

LABEL_99:
              v7 = 1;
              goto LABEL_100;
            }
            objc_msgSend(*(id *)(v258 + 48), "activatedVendorSpecificDeviceIDs");
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v76, "routeUID");
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            v72 |= objc_msgSend(v77, "containsObject:", v78);

            objc_msgSend(*(id *)(v258 + 48), "pendingPickedRoutes");
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            v73 |= objc_msgSend(v79, "containsObject:", v76);

          }
          v71 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v273, v288, 16);
          if (v71)
            continue;
          break;
        }
      }
      else
      {
        LOBYTE(v72) = 0;
        LOBYTE(v73) = 0;
      }

      v271 = 0u;
      v272 = 0u;
      v269 = 0u;
      v270 = 0u;
      objc_msgSend(v209, "routes");
      v246 = (id)objc_claimAutoreleasedReturnValue();
      v140 = objc_msgSend(v246, "countByEnumeratingWithState:objects:count:", &v269, v287, 16);
      if (v140)
      {
        v141 = v140;
        v142 = 0;
        v143 = 0;
        v254 = *(_QWORD *)v270;
        while (2)
        {
          for (m = 0; m != v141; ++m)
          {
            if (*(_QWORD *)v270 != v254)
              objc_enumerationMutation(v246);
            v145 = *(void **)(*((_QWORD *)&v269 + 1) + 8 * m);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {

              goto LABEL_99;
            }
            v146 = *(void **)(*(_QWORD *)(v258 + 56) + 1080);
            objc_msgSend(v145, "routeUID");
            v147 = (void *)objc_claimAutoreleasedReturnValue();
            v142 |= objc_msgSend(v146, "containsObject:", v147);

            v148 = *(void **)(*(_QWORD *)(v258 + 56) + 1088);
            objc_msgSend(v145, "routeUID");
            v149 = (void *)objc_claimAutoreleasedReturnValue();
            v143 |= objc_msgSend(v148, "containsObject:", v149);

          }
          v141 = objc_msgSend(v246, "countByEnumeratingWithState:objects:count:", &v269, v287, 16);
          if (v141)
            continue;
          break;
        }
      }
      else
      {
        LOBYTE(v142) = 0;
        LOBYTE(v143) = 0;
      }

      objc_msgSend(v208, "localizedTitle");
      v162 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v209, "localizedTitle");
      v163 = (void *)objc_claimAutoreleasedReturnValue();
      v164 = objc_msgSend(v162, "isEqualToString:", v163);

      objc_msgSend(v208, "localizedSubtitle");
      v165 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v209, "localizedSubtitle");
      v166 = (void *)objc_claimAutoreleasedReturnValue();
      v167 = objc_msgSend(v165, "isEqualToString:", v166);

      v7 = 1;
      if (((v72 ^ v142) & 1) == 0)
      {
        v168 = v73 ^ v143;
        v13 = v208;
        v8 = v209;
        if ((v168 & 1) == 0)
          v7 = v164 & v167 ^ 1;
        goto LABEL_30;
      }
LABEL_100:
      v8 = v209;
      goto LABEL_29;
    }
    if (v12 >= 2 && !(*(unsigned int (**)(void))(*(_QWORD *)(a1 + 64) + 16))())
      goto LABEL_28;
    if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 64) + 16))())
    {
      if (((*(uint64_t (**)(void))(*(_QWORD *)(a1 + 64) + 16))() & 1) == 0)
      {
        MCLogCategoryDeviceAccess();
        v159 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v159, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1AA991000, v159, OS_LOG_TYPE_DEFAULT, "is update check: weird", buf, 2u);
        }

        v160 = 0;
        v161 = 0;
        v7 = 0;
        goto LABEL_140;
      }
      objc_msgSend(v8, "mainRoute");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v94, "underlyingNativeRoute");
      v95 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "mainRoute");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v96, "underlyingNativeRoute");
      v97 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 48), "displayAsPickedRoutes");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      v99 = objc_msgSend(v98, "containsObject:", v97);

      objc_msgSend(*(id *)(a1 + 48), "pickedRoutes");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      v101 = objc_msgSend(v100, "containsObject:", v97);

      objc_msgSend(*(id *)(a1 + 48), "pendingPickedRoutes");
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      v103 = objc_msgSend(v102, "containsObject:", v97);

      v104 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 1032), "containsObject:", v95);
      v105 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 1008), "containsObject:", v95);
      v106 = a1;
      v107 = v105;
      v108 = objc_msgSend(*(id *)(*(_QWORD *)(v106 + 56) + 1024), "containsObject:", v95);
    }
    else
    {
      objc_msgSend(v8, "mainRoute");
      v242 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "mainRoute");
      v235 = objc_claimAutoreleasedReturnValue();
      v264 = 0u;
      v265 = 0u;
      v266 = 0u;
      v267 = 0u;
      objc_msgSend(v9, "routes");
      v150 = (void *)objc_claimAutoreleasedReturnValue();
      v151 = objc_msgSend(v150, "countByEnumeratingWithState:objects:count:", &v264, v286, 16);
      if (v151)
      {
        v152 = v151;
        v99 = 0;
        v101 = 0;
        v103 = 0;
        v153 = *(_QWORD *)v265;
        do
        {
          for (n = 0; n != v152; ++n)
          {
            if (*(_QWORD *)v265 != v153)
              objc_enumerationMutation(v150);
            v155 = *(_QWORD *)(*((_QWORD *)&v264 + 1) + 8 * n);
            objc_msgSend(*(id *)(v258 + 48), "displayAsPickedRoutes");
            v156 = (void *)objc_claimAutoreleasedReturnValue();
            v99 |= objc_msgSend(v156, "containsObject:", v155);

            objc_msgSend(*(id *)(v258 + 48), "pickedRoutes");
            v157 = (void *)objc_claimAutoreleasedReturnValue();
            v101 |= objc_msgSend(v157, "containsObject:", v155);

            objc_msgSend(*(id *)(v258 + 48), "pendingPickedRoutes");
            v158 = (void *)objc_claimAutoreleasedReturnValue();
            v103 |= objc_msgSend(v158, "containsObject:", v155);

          }
          v152 = objc_msgSend(v150, "countByEnumeratingWithState:objects:count:", &v264, v286, 16);
        }
        while (v152);
      }
      else
      {
        v99 = 0;
        v101 = 0;
        v103 = 0;
      }

      v262 = 0u;
      v263 = 0u;
      v260 = 0u;
      v261 = 0u;
      objc_msgSend(v209, "routes");
      v247 = (id)objc_claimAutoreleasedReturnValue();
      v169 = objc_msgSend(v247, "countByEnumeratingWithState:objects:count:", &v260, v285, 16);
      if (v169)
      {
        v170 = v169;
        v104 = 0;
        v107 = 0;
        v108 = 0;
        v255 = *(_QWORD *)v261;
        do
        {
          for (ii = 0; ii != v170; ++ii)
          {
            if (*(_QWORD *)v261 != v255)
              objc_enumerationMutation(v247);
            v172 = *(_QWORD *)(*((_QWORD *)&v260 + 1) + 8 * ii);
            v104 |= objc_msgSend(*(id *)(*(_QWORD *)(v258 + 56) + 1032), "containsObject:", v172);
            v107 |= objc_msgSend(*(id *)(*(_QWORD *)(v258 + 56) + 1008), "containsObject:", v172);
            v108 |= objc_msgSend(*(id *)(*(_QWORD *)(v258 + 56) + 1024), "containsObject:", v172);
          }
          v170 = objc_msgSend(v247, "countByEnumeratingWithState:objects:count:", &v260, v285, 16);
        }
        while (v170);
      }
      else
      {
        v104 = 0;
        v107 = 0;
        v108 = 0;
      }

      v97 = (void *)v235;
      v95 = (void *)v242;
    }
    objc_msgSend(*(id *)(v258 + 48), "volumeCapableRoutes");
    v173 = (void *)objc_claimAutoreleasedReturnValue();
    v230 = objc_msgSend(v173, "containsObject:", v97);
    v256 = objc_msgSend(*(id *)(*(_QWORD *)(v258 + 56) + 1040), "containsObject:", v97);

    objc_msgSend(v95, "batteryLevel");
    v174 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v97, "batteryLevel");
    v175 = v97;
    v176 = (void *)objc_claimAutoreleasedReturnValue();
    v243 = v95;
    if (v174 == v176)
    {
      v222 = 0;
    }
    else
    {
      objc_msgSend(v95, "batteryLevel");
      v248 = v174;
      v177 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v175, "batteryLevel");
      v178 = (void *)objc_claimAutoreleasedReturnValue();
      v236 = objc_msgSend(v177, "isEqual:", v178);

      v95 = v243;
      v174 = v248;
      v222 = v236 ^ 1;
    }

    objc_msgSend(v95, "routeName");
    v179 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v175, "routeName");
    v180 = (void *)objc_claimAutoreleasedReturnValue();
    v249 = (id)v179;
    v237 = v175;
    if ((void *)v179 == v180)
    {
      objb = 0;
    }
    else
    {
      objc_msgSend(v95, "routeName");
      v181 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v175, "routeName");
      v182 = (void *)objc_claimAutoreleasedReturnValue();
      objb = objc_msgSend(v181, "isEqual:", v182) ^ 1;

    }
    objc_msgSend(v209, "localizedSubtitle");
    v183 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v208, "localizedSubtitle");
    v184 = (void *)objc_claimAutoreleasedReturnValue();
    if (v183 == v184)
      v215 = 0;
    else
      v215 = objc_msgSend(v183, "isEqual:", v184) ^ 1;
    v185 = v243;
    v250 = v104 ^ v99;

    v257 = v230 ^ v256;
    v226 = v108 ^ v103;
    v231 = v107 ^ v101;
    if ((objc_msgSend(v243, "isSplitterCapable") & 1) != 0 || objc_msgSend(v237, "isSplitterCapable"))
    {
      v186 = *(void **)(v258 + 56);
      objc_msgSend(*(id *)(v258 + 48), "displayAsPickedRoutes");
      v187 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v186) = objc_msgSend(v186, "routesContainSplitterCapableRoute:", v187);
      v259 = v186 ^ objc_msgSend(*(id *)(v258 + 56), "routesContainSplitterCapableRoute:", *(_QWORD *)(*(_QWORD *)(v258 + 56) + 1032));
      v188 = v209;
    }
    else
    {
      v188 = v209;
      if ((objc_msgSend(v243, "supportsAirPlayGrouping") & 1) == 0
        && !objc_msgSend(v237, "supportsAirPlayGrouping"))
      {
        LOBYTE(v259) = 0;
LABEL_132:
        v189 = objc_msgSend(v185, "isNearby");
        v190 = objc_msgSend(v237, "isNearby");
        v191 = v185;
        v192 = v190;
        v193 = objc_msgSend(v191, "isKnown");
        v194 = objc_msgSend(v237, "isKnown");
        v195 = objc_msgSend(v188, "isExpanded");
        v196 = objc_msgSend(v208, "isExpanded");
        v197 = objc_msgSend(v188, "isExpandable");
        v198 = objc_msgSend(v208, "isExpandable");
        v199 = v188;
        v200 = v198;
        v201 = objc_msgSend(v199, "isPickable");
        v202 = objc_msgSend(v208, "isPickable");
        v7 = 1;
        if (((v250 | v231 | v226 | v222 | objb | v215 | v257) & 1) != 0 || (v259 & 1) != 0 || ((v189 ^ v192) & 1) != 0)
        {
          v8 = v209;
          v160 = v243;
        }
        else
        {
          v160 = v243;
          if (((v193 ^ v194) & 1) == 0 && ((v195 ^ v196) & 1) == 0)
            v7 = v197 ^ v200 | v201 ^ v202;
          v8 = v209;
        }
        v161 = v237;
LABEL_140:

        goto LABEL_29;
      }
      v203 = *(void **)(v258 + 56);
      objc_msgSend(*(id *)(v258 + 48), "displayAsPickedRoutes");
      v187 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v203) = objc_msgSend(v203, "routesContainAirPlayGroupableRoute:", v187);
      v259 = v203 ^ objc_msgSend(*(id *)(v258 + 56), "routesContainAirPlayGroupableRoute:", *(_QWORD *)(*(_QWORD *)(v258 + 56) + 1032));
    }

    v185 = v243;
    goto LABEL_132;
  }
  v7 = 0;
LABEL_31:

  return v7 & 1;
}

void __41__MRURoutingViewController__applyUpdate___block_invoke_223(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[5];

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "deletedSections");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "tableView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "deletedSections");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "deleteSections:withRowAnimation:", v6, 0);

  }
  objc_msgSend(*(id *)(a1 + 32), "insertedSections");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 40), "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "tableView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "insertedSections");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "insertSections:withRowAnimation:", v11, 0);

  }
  objc_msgSend(*(id *)(a1 + 32), "deletedItemIndexPaths");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (v13)
  {
    objc_msgSend(*(id *)(a1 + 40), "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "tableView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "deletedItemIndexPaths");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "deleteRowsAtIndexPaths:withRowAnimation:", v16, 0);

  }
  objc_msgSend(*(id *)(a1 + 32), "insertedItemIndexPaths");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "count");

  if (v18)
  {
    objc_msgSend(*(id *)(a1 + 40), "view");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "tableView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "insertedItemIndexPaths");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "insertRowsAtIndexPaths:withRowAnimation:", v21, 0);

  }
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __41__MRURoutingViewController__applyUpdate___block_invoke_2_224;
  v28[3] = &unk_1E58194C8;
  v22 = *(void **)(a1 + 32);
  v28[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v22, "enumerateItemMovesWithBlock:", v28);
  objc_msgSend(*(id *)(a1 + 32), "updatedItemIndexPaths");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "count");

  if (v24)
  {
    objc_msgSend(*(id *)(a1 + 40), "view");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "tableView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "updatedItemIndexPaths");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "reloadRowsAtIndexPaths:withRowAnimation:", v27, 0);

  }
}

void __41__MRURoutingViewController__applyUpdate___block_invoke_2_224(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  v6 = a2;
  objc_msgSend(v4, "view");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "moveRowAtIndexPath:toIndexPath:", v6, v5);

}

void __41__MRURoutingViewController__applyUpdate___block_invoke_3_226(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__MRURoutingViewController__applyUpdate___block_invoke_4_227;
  block[3] = &unk_1E5818C88;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

_QWORD *__41__MRURoutingViewController__applyUpdate___block_invoke_4_227(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD *result;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 1336))
  {
    objc_msgSend((id)v2, "ensureVendorSpecificGroupTreeIsVisible:");
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 1336);
    *(_QWORD *)(v3 + 1336) = 0;

    v2 = *(_QWORD *)(a1 + 32);
  }
  *(_BYTE *)(v2 + 984) = 0;
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 992), *(id *)(*(_QWORD *)(a1 + 32) + 1200));
  result = *(_QWORD **)(a1 + 32);
  if (result[121])
    return (_QWORD *)objc_msgSend(result, "_applyUpdate:");
  return result;
}

void __41__MRURoutingViewController__applyUpdate___block_invoke_231(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1168));
  objc_msgSend(WeakRetained, "routingViewControllerDidUpdateItems:", *(_QWORD *)(a1 + 32));

}

- (id)groupUIDForRoute:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;

  v3 = a3;
  MRAVEndpointGetLocalEndpoint();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "outputDeviceUIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "routeUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "containsObject:", v6);

  if (v7)
    objc_msgSend(MEMORY[0x1E0D4C4E8], "localDeviceUID");
  else
    objc_msgSend(v3, "groupUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_createRoutingViewItemsForUpdate:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  NSMutableSet *expandedItemUIDs;
  void *v26;
  char v27;
  void *v28;
  void *v29;
  unsigned int v30;
  BOOL v32;
  BOOL v33;
  BOOL v34;
  BOOL v35;
  uint64_t v36;
  id v37;
  id v38;
  BOOL didSelectShowMore;
  BOOL allRoutesAreUnknown;
  void (**v41)(void *, void *);
  void *v42;
  id v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t k;
  void *v55;
  void *v56;
  id v57;
  id v58;
  void *v59;
  char v60;
  void *v61;
  void *v62;
  char v63;
  char v64;
  uint64_t v65;
  int v66;
  void *v67;
  void *v68;
  int v69;
  id v70;
  id v71;
  void *v72;
  void *v73;
  char v74;
  NSObject *v75;
  void *v76;
  void *v77;
  char v78;
  char v79;
  uint64_t v80;
  void *v81;
  void *v82;
  char v83;
  void *v84;
  NSMutableSet *expandedRouteUIDs;
  void *v86;
  void *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t j;
  void *v92;
  NSObject *v93;
  void *v94;
  void *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t m;
  void *v100;
  void *v101;
  NSObject *v102;
  void *v103;
  uint64_t v104;
  MRURoutingViewControllerItems *v105;
  id v107;
  id v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  uint64_t v114;
  void *v115;
  id obj;
  id v117;
  int v118;
  void *v119;
  uint64_t v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  uint64_t v125;
  id v126;
  uint64_t v127;
  void *v128;
  void *v129;
  void *v130;
  unint64_t v131;
  id v132;
  unint64_t v133;
  void *v134;
  void *v135;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  _QWORD v153[4];
  id v154;
  _QWORD aBlock[4];
  id v156;
  id v157;
  BOOL v158;
  BOOL v159;
  BOOL v160;
  BOOL v161;
  _QWORD v162[4];
  id v163;
  id v164;
  id v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  _BYTE v170[128];
  _BYTE v171[128];
  uint8_t v172[128];
  uint8_t buf[4];
  NSObject *v174;
  __int16 v175;
  void *v176;
  _BYTE v177[128];
  _BYTE v178[128];
  uint64_t v179;

  v179 = *MEMORY[0x1E0C80C00];
  v126 = a3;
  objc_msgSend(v126, "displayableAvailableRoutes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v124 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v122 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  MRAVEndpointGetLocalEndpoint();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v5, "outputDeviceUIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v7);
  v135 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D4C4E8], "localDeviceUID");
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  v109 = v5;
  objc_msgSend(v5, "outputDevices");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "uid");
  v112 = (void *)objc_claimAutoreleasedReturnValue();

  v119 = (void *)objc_msgSend(v3, "mutableCopy");
  v166 = 0u;
  v167 = 0u;
  v168 = 0u;
  v169 = 0u;
  v10 = v3;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v166, v178, 16);
  v110 = v10;
  if (!v11)
  {
    v131 = 0;
    v133 = 0;
    v13 = 0;
    goto LABEL_32;
  }
  v12 = v11;
  v131 = 0;
  v133 = 0;
  v13 = 0;
  v14 = *(_QWORD *)v167;
  do
  {
    for (i = 0; i != v12; ++i)
    {
      if (*(_QWORD *)v167 != v14)
        objc_enumerationMutation(v10);
      v16 = *(void **)(*((_QWORD *)&v166 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v16, "isDeviceSpeakerRoute") & 1) == 0)
      {
        v17 = v16;
        -[MRURoutingViewController groupUIDForRoute:](self, "groupUIDForRoute:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "routeUID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "isEqualToString:", v112);

        if (v20)
        {
          v21 = v4;
          v22 = v17;
          v23 = v121;
          goto LABEL_10;
        }
        if (objc_msgSend(v17, "isGroupLeader") && v18 && v18 != v121)
        {
          objc_msgSend(v4, "objectForKeyedSubscript:", v18);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v24)
          {
            v21 = v4;
            v22 = v17;
            v23 = v18;
LABEL_10:
            objc_msgSend(v21, "setObject:forKeyedSubscript:", v22, v23);
LABEL_23:
            if ((objc_msgSend(v17, "isLocalDeviceOrHeadphone") & 1) == 0)
            {
              if ((objc_msgSend(v17, "isKnown") & 1) == 0)
              {
                ++v133;
                objc_msgSend(v17, "outputDevice");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v28, "recommendation");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                v30 = objc_msgSend(v29, "isConservativelyFiltered");

                v131 += v30;
                v10 = v110;
              }
              ++v13;
            }

            continue;
          }
        }
        else if (!v18)
        {
          goto LABEL_23;
        }
        expandedItemUIDs = self->_expandedItemUIDs;
        objc_msgSend(v17, "routeUID");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (!-[NSMutableSet containsObject:](expandedItemUIDs, "containsObject:", v26))
        {
          v27 = objc_msgSend(v17, "isHeadphonesRoute");

          if ((v27 & 1) != 0)
            goto LABEL_23;
          objc_msgSend(v128, "objectForKeyedSubscript:", v18);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v26)
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v128, "setObject:forKeyedSubscript:", v26, v18);
          }
          objc_msgSend(v26, "addObject:", v17);
        }

        goto LABEL_23;
      }
    }
    v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v166, v178, 16);
  }
  while (v12);
LABEL_32:

  self->_allRoutesAreUnknown = v133 == v13;
  if (v131)
    v32 = v133 == v13 && v131 < v133;
  else
    v32 = 0;
  v33 = v13 < 4;
  if (v13 >= 4)
  {
    if (v133)
      v35 = v133 >= v13;
    else
      v35 = 1;
    v34 = !v35 || v32;
  }
  else
  {
    v34 = 0;
  }
  self->_someRoutesAreFiltered = v34;
  v36 = MEMORY[0x1E0C809B0];
  v162[0] = MEMORY[0x1E0C809B0];
  v162[1] = 3221225472;
  v162[2] = __61__MRURoutingViewController__createRoutingViewItemsForUpdate___block_invoke;
  v162[3] = &unk_1E581AAB0;
  v37 = v4;
  v163 = v37;
  v164 = v128;
  v38 = v119;
  v165 = v38;
  v132 = v164;
  objc_msgSend(v164, "enumerateKeysAndObjectsUsingBlock:", v162);
  didSelectShowMore = self->_didSelectShowMore;
  allRoutesAreUnknown = self->_allRoutesAreUnknown;
  aBlock[0] = v36;
  aBlock[1] = 3221225472;
  aBlock[2] = __61__MRURoutingViewController__createRoutingViewItemsForUpdate___block_invoke_2;
  aBlock[3] = &unk_1E581AAD8;
  v108 = v124;
  v156 = v108;
  v158 = allRoutesAreUnknown;
  v159 = v32;
  v160 = v33;
  v161 = didSelectShowMore;
  v107 = v122;
  v157 = v107;
  v41 = (void (**)(void *, void *))_Block_copy(aBlock);
  v134 = v37;
  v123 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v37, "count"));
  v153[0] = v36;
  v153[1] = 3221225472;
  v153[2] = __61__MRURoutingViewController__createRoutingViewItemsForUpdate___block_invoke_3;
  v153[3] = &unk_1E581A850;
  v117 = v126;
  v154 = v117;
  objc_msgSend(v38, "msv_compactMap:", v153);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v111 = v42;
  if ((unint64_t)objc_msgSend(v42, "count") < 2)
  {
    v43 = 0;
  }
  else
  {
    objc_msgSend(v42, "objectAtIndexedSubscript:", 0);
    v43 = (id)objc_claimAutoreleasedReturnValue();
  }
  v151 = 0u;
  v152 = 0u;
  v149 = 0u;
  v150 = 0u;
  obj = v38;
  v120 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v149, v177, 16);
  if (v120)
  {
    v44 = *(_QWORD *)v150;
    v45 = 0x1E0CC2000uLL;
    v114 = *(_QWORD *)v150;
    v115 = v43;
    do
    {
      v46 = 0;
      do
      {
        if (*(_QWORD *)v150 != v44)
          objc_enumerationMutation(obj);
        v125 = v46;
        v47 = *(void **)(*((_QWORD *)&v149 + 1) + 8 * v46);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (objc_msgSend(v47, "isGroupSession"))
            {
              objc_msgSend(*(id *)(v45 + 800), "itemWithRoute:", v47);
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              v41[2](v41, v49);
              goto LABEL_133;
            }
            goto LABEL_134;
          }
          v70 = v47;
          -[MRURoutingViewController groupUIDForRoute:](self, "groupUIDForRoute:", v70);
          v71 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v70, "routeUID");
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v135, "containsObject:", v72))
          {
            v73 = v70;
            v74 = objc_msgSend(v70, "isHeadphonesRoute");

            if ((v74 & 1) == 0)
            {
              v72 = v71;
              v71 = v121;
              goto LABEL_92;
            }
          }
          else
          {
            v73 = v70;
LABEL_92:

          }
          objc_msgSend(v134, "objectForKeyedSubscript:", v71);
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v132, "objectForKeyedSubscript:", v71);
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          v78 = -[NSMutableSet containsObject:](self->_expandedGroupUIDs, "containsObject:", v71);
          if (v76
            && (v79 = v78, v80 = objc_msgSend(v77, "count"), v71)
            && v80
            && (objc_msgSend(v77, "arrayByAddingObject:", v76),
                v81 = (void *)objc_claimAutoreleasedReturnValue(),
                objc_msgSend(v123, "setObject:forKeyedSubscript:", v81, v71),
                v81,
                (v79 & 1) == 0))
          {
            if (v73 == v76)
            {
              objc_msgSend(*(id *)(v45 + 800), "itemWithLeader:members:", v73, v77);
              v84 = (void *)objc_claimAutoreleasedReturnValue();
              v41[2](v41, v84);
              goto LABEL_126;
            }
          }
          else
          {
            objc_msgSend(v117, "nativeRoutesInVendorSpecificGroup");
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            v83 = objc_msgSend(v82, "containsObject:", v73);

            if ((v83 & 1) == 0)
            {
              v130 = v77;
              objc_msgSend(*(id *)(v45 + 800), "itemWithRoute:", v73);
              v84 = (void *)objc_claimAutoreleasedReturnValue();
              expandedRouteUIDs = self->_expandedRouteUIDs;
              objc_msgSend(v73, "routeUID");
              v86 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v84, "setExpanded:", -[NSMutableSet containsObject:](expandedRouteUIDs, "containsObject:", v86));

              v41[2](v41, v84);
              if (objc_msgSend(v84, "isExpanded"))
              {
                v139 = 0u;
                v140 = 0u;
                v137 = 0u;
                v138 = 0u;
                objc_msgSend(v73, "subRoutes");
                v87 = (void *)objc_claimAutoreleasedReturnValue();
                v88 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v137, v170, 16);
                if (v88)
                {
                  v89 = v88;
                  v90 = *(_QWORD *)v138;
                  do
                  {
                    for (j = 0; j != v89; ++j)
                    {
                      if (*(_QWORD *)v138 != v90)
                        objc_enumerationMutation(v87);
                      objc_msgSend(MEMORY[0x1E0CC2320], "itemWithRoute:", *(_QWORD *)(*((_QWORD *)&v137 + 1) + 8 * j));
                      v92 = (void *)objc_claimAutoreleasedReturnValue();
                      v41[2](v41, v92);

                    }
                    v89 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v137, v170, 16);
                  }
                  while (v89);
                }

                v45 = 0x1E0CC2000;
              }
              v77 = v130;
LABEL_126:

            }
          }

          v44 = v114;
          v43 = v115;
          goto LABEL_132;
        }
        v48 = v47;
        v49 = v48;
        if (v43 && !self->_didExpandVendorSpecificSpeakerGroup)
        {
          if (v43 == v48)
          {
            v73 = v48;
            objc_msgSend(*(id *)(v45 + 800), "itemWithVendorSpecificLeader:members:", v43, v111);
            v75 = objc_claimAutoreleasedReturnValue();
            v41[2](v41, v75);
            MCLogCategoryDeviceAccess();
            v93 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
            {
              -[NSObject localizedTitle](v75, "localizedTitle");
              v102 = objc_claimAutoreleasedReturnValue();
              -[NSObject localizedSubtitle](v75, "localizedSubtitle");
              v103 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v174 = v102;
              v175 = 2112;
              v176 = v103;
              _os_log_impl(&dword_1AA991000, v93, OS_LOG_TYPE_DEFAULT, "Adding vendor specific speaker group: %@, %@", buf, 0x16u);

              v44 = v114;
              v43 = v115;
            }
LABEL_130:

            goto LABEL_131;
          }
          if (objc_msgSend(v111, "containsObject:", v48))
          {
            v73 = v49;
            MCLogCategoryDeviceAccess();
            v75 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
              goto LABEL_131;
            objc_msgSend(v73, "routeName");
            v93 = objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v174 = v93;
            _os_log_impl(&dword_1AA991000, v75, OS_LOG_TYPE_DEFAULT, "Skipping member speaker in vendor specific group: %@@", buf, 0xCu);
            goto LABEL_130;
          }
        }
        if (!objc_msgSend(v49, "isGroup"))
        {
          v73 = v49;
          objc_msgSend(*(id *)(v45 + 800), "itemWithVendorSpecificRoute:", v49);
          v75 = objc_claimAutoreleasedReturnValue();
          v41[2](v41, v75);
          goto LABEL_131;
        }
        v147 = 0u;
        v148 = 0u;
        v145 = 0u;
        v146 = 0u;
        objc_msgSend(v49, "subroutes");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v145, v172, 16);
        if (!v51)
        {

          goto LABEL_115;
        }
        v52 = v51;
        v113 = v49;
        v53 = *(_QWORD *)v146;
        v118 = 1;
        v127 = *(_QWORD *)v146;
        v129 = v50;
        while (2)
        {
          for (k = 0; k != v52; ++k)
          {
            if (*(_QWORD *)v146 != v53)
              objc_enumerationMutation(v50);
            v55 = *(void **)(*((_QWORD *)&v145 + 1) + 8 * k);
            if (objc_msgSend(v55, "isAirPlayRoute"))
            {
              objc_msgSend(v55, "underlyingNativeRoute");
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v57 = v56;
                -[MRURoutingViewController groupUIDForRoute:](self, "groupUIDForRoute:", v57);
                v58 = (id)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v57, "routeUID");
                v59 = (void *)objc_claimAutoreleasedReturnValue();
                if (!objc_msgSend(v135, "containsObject:", v59))
                  goto LABEL_70;
                v60 = objc_msgSend(v57, "isHeadphonesRoute");

                if ((v60 & 1) == 0)
                {
                  v59 = v58;
                  v58 = v121;
LABEL_70:

                }
                objc_msgSend(v134, "objectForKeyedSubscript:", v58);
                v61 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v132, "objectForKeyedSubscript:", v58);
                v62 = (void *)objc_claimAutoreleasedReturnValue();
                v63 = -[NSMutableSet containsObject:](self->_expandedGroupUIDs, "containsObject:", v58);
                if (!v61)
                  goto LABEL_77;
                v64 = v63;
                v65 = objc_msgSend(v62, "count");
                v66 = 1;
                if (v58 && v65)
                {
                  objc_msgSend(v62, "arrayByAddingObject:", v61);
                  v67 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v123, "setObject:forKeyedSubscript:", v67, v58);

                  if ((v64 & 1) == 0)
                  {
                    objc_msgSend(v117, "nativeRoutesInVendorSpecificGroup");
                    v68 = (void *)objc_claimAutoreleasedReturnValue();
                    v69 = objc_msgSend(v68, "containsObject:", v57);

                    if (v69)
                    {
                      v66 = 0;
                      v118 &= -[MRURoutingViewController shouldSuppressNativeRoutesStatusDisplay](self, "shouldSuppressNativeRoutesStatusDisplay");
                      goto LABEL_78;
                    }
                  }
LABEL_77:
                  v66 = 1;
                }
LABEL_78:

                if (!v66)
                {

                  v45 = 0x1E0CC2000;
                  goto LABEL_112;
                }
                v45 = 0x1E0CC2000;
                v53 = v127;
                v50 = v129;
              }

              continue;
            }
          }
          v52 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v145, v172, 16);
          if (v52)
            continue;
          break;
        }

LABEL_112:
        v49 = v113;
        if ((v118 & 1) == 0)
        {
          v44 = v114;
          v43 = v115;
          goto LABEL_133;
        }
LABEL_115:
        objc_msgSend(*(id *)(v45 + 800), "itemWithVendorSpecificRoute:", v49);
        v94 = v49;
        v75 = objc_claimAutoreleasedReturnValue();
        v41[2](v41, v75);
        v143 = 0u;
        v144 = 0u;
        v141 = 0u;
        v142 = 0u;
        v73 = v94;
        objc_msgSend(v94, "subroutes");
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        v96 = objc_msgSend(v95, "countByEnumeratingWithState:objects:count:", &v141, v171, 16);
        if (v96)
        {
          v97 = v96;
          v98 = *(_QWORD *)v142;
          do
          {
            for (m = 0; m != v97; ++m)
            {
              if (*(_QWORD *)v142 != v98)
                objc_enumerationMutation(v95);
              v100 = *(void **)(*((_QWORD *)&v141 + 1) + 8 * m);
              if (objc_msgSend(v100, "shouldBeDisplayed"))
              {
                objc_msgSend(*(id *)(v45 + 800), "itemWithVendorSpecificRoute:", v100);
                v101 = (void *)objc_claimAutoreleasedReturnValue();
                v41[2](v41, v101);

              }
            }
            v97 = objc_msgSend(v95, "countByEnumeratingWithState:objects:count:", &v141, v171, 16);
          }
          while (v97);
        }

        v44 = v114;
        v43 = v115;
LABEL_131:

LABEL_132:
        v49 = v73;
LABEL_133:

LABEL_134:
        v46 = v125 + 1;
      }
      while (v125 + 1 != v120);
      v104 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v149, v177, 16);
      v120 = v104;
    }
    while (v104);
  }

  v105 = objc_alloc_init(MRURoutingViewControllerItems);
  -[MRURoutingViewControllerItems setRouteGrouping:](v105, "setRouteGrouping:", v123);
  -[MRURoutingViewControllerItems setLocalDevicesAndHeadphones:](v105, "setLocalDevicesAndHeadphones:", v108);
  -[MRURoutingViewControllerItems setSpeakersAndTVs:](v105, "setSpeakersAndTVs:", v107);
  -[MRURoutingViewControllerItems setCustomRows:](v105, "setCustomRows:", self->_staticCustomRowItems);

  return v105;
}

void __61__MRURoutingViewController__createRoutingViewItemsForUpdate___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a2;
  v5 = a3;
  objc_msgSend(a1[4], "objectForKeyedSubscript:", v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(v5, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "setObject:forKeyedSubscript:", v7, v13);

    objc_msgSend(v5, "subarrayWithRange:", 1, objc_msgSend(v5, "count") - 1);
    v8 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1[5], "setObject:forKeyedSubscript:", v8, v13);
    v5 = (id)v8;
  }
  objc_msgSend(a1[4], "objectForKeyedSubscript:", v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    v10 = 0;
    do
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", v10);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = (void *)v11;
      if (!v9 || v9 == (void *)v11)
      {
        ++v10;
      }
      else
      {
        objc_msgSend(a1[6], "removeObject:", v11);
        objc_msgSend(a1[6], "insertObject:atIndex:", v12, ++v10 + objc_msgSend(a1[6], "indexOfObject:", v9));
      }

    }
    while (objc_msgSend(v5, "count") > v10);
  }

}

void __61__MRURoutingViewController__createRoutingViewItemsForUpdate___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  int v12;
  _BOOL4 v13;
  id v14;

  v14 = a2;
  objc_msgSend(v14, "mainRoute");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isLocalDeviceOrHeadphone") & 1) != 0
    || (objc_msgSend(v3, "isWiredDevice") & 1) != 0
    || objc_msgSend(v3, "isGroupSession"))
  {
    v4 = *(void **)(a1 + 32);
LABEL_5:
    objc_msgSend(v4, "addObject:", v14);
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0D4C638], "currentSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "supportShowMore");

  if (!v6)
  {
    v4 = *(void **)(a1 + 40);
    goto LABEL_5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v3;
  else
    v7 = 0;
  v8 = v7;
  objc_msgSend(v8, "outputDevice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "recommendation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isConservativelyFiltered");

  if ((objc_msgSend(v3, "isKnown") & 1) != 0)
    v12 = 1;
  else
    v12 = *(unsigned __int8 *)(a1 + 48);
  if (*(_BYTE *)(a1 + 50))
    goto LABEL_16;
  v13 = v12 == 0;
  if (!*(_BYTE *)(a1 + 49))
    v11 = v13;
  if ((objc_msgSend(v3, "isPicked") & 1) != 0 || !v11 || *(_BYTE *)(a1 + 51))
LABEL_16:
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v14);

LABEL_6:
}

id __61__MRURoutingViewController__createRoutingViewItemsForUpdate___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  char v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    if (objc_msgSend(v4, "isGroup"))
    {
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      objc_msgSend(v4, "subroutes", 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v19;
LABEL_5:
        v9 = 0;
        while (1)
        {
          if (*(_QWORD *)v19 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v9);
          objc_msgSend(*(id *)(a1 + 32), "activatedVendorSpecificDeviceIDs");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "routeUID");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v11, "containsObject:", v12);

          if ((v13 & 1) != 0)
            goto LABEL_15;
          if (v7 == ++v9)
          {
            v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
            if (v7)
              goto LABEL_5;
            break;
          }
        }
      }

LABEL_14:
      v5 = v4;
      v4 = 0;
LABEL_15:

      goto LABEL_16;
    }
    objc_msgSend(*(id *)(a1 + 32), "activatedVendorSpecificDeviceIDs");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "routeUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "containsObject:", v15);

    if ((v16 & 1) == 0)
      goto LABEL_14;
  }
  else
  {
    v4 = 0;
  }
LABEL_16:

  return v4;
}

- (void)_collapseAllGroups
{
  -[NSMutableSet removeAllObjects](self->_expandedGroupUIDs, "removeAllObjects");
  -[NSMutableSet removeAllObjects](self->_expandedItemUIDs, "removeAllObjects");
  -[NSMutableSet removeAllObjects](self->_expandedRouteUIDs, "removeAllObjects");
  self->_didExpandVendorSpecificSpeakerGroup = 0;
}

- (void)_collapseAllGroupsAfterDelay
{
  NSTimer *v3;
  NSTimer *collapseTimer;
  _QWORD v5[5];

  -[NSTimer invalidate](self->_collapseTimer, "invalidate");
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __56__MRURoutingViewController__collapseAllGroupsAfterDelay__block_invoke;
  v5[3] = &unk_1E5819368;
  v5[4] = self;
  objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:repeats:block:", 0, v5, 2.0);
  v3 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  collapseTimer = self->_collapseTimer;
  self->_collapseTimer = v3;

}

void __56__MRURoutingViewController__collapseAllGroupsAfterDelay__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "_collapseAllGroups");
  objc_msgSend(*(id *)(a1 + 32), "_setNeedsDisplayedRoutesUpdate");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 1320);
  *(_QWORD *)(v2 + 1320) = 0;

}

- (id)_createSectionedCollection:(id)a3 withPickedRoutes:(id)a4
{
  id v6;
  objc_class *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = (objc_class *)MEMORY[0x1E0CC2498];
  v8 = a3;
  v9 = objc_alloc_init(v7);
  objc_msgSend(v8, "localDevicesAndHeadphones");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "speakersAndTVs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "customRows");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "arrayByAddingObjectsFromArray:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "count"))
  {
    objc_msgSend(v9, "appendSection:", CFSTR("LOCAL DEVICES"));
    objc_msgSend(v9, "appendItems:", v10);
    -[MRURoutingViewController endpointRoute](self, "endpointRoute");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v14, "isSplitRoute") & 1) != 0)
    {
LABEL_11:

      goto LABEL_12;
    }
    v15 = -[MRURoutingViewController routesContainSplitterCapableRoute:](self, "routesContainSplitterCapableRoute:", v6);

    if (!v15)
      goto LABEL_12;
    v16 = -[MRURoutingViewController isInVehicle](self, "isInVehicle") ^ 1;
    if (-[MRURoutingViewController isInCarPlay](self, "isInCarPlay"))
    {
      +[MRUStringsProvider audioSharingDisabledCarPlay](MRUStringsProvider, "audioSharingDisabledCarPlay");
      v17 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!-[MRURoutingViewController hasCarKitRoute](self, "hasCarKitRoute"))
      {
        v14 = 0;
        goto LABEL_10;
      }
      +[MRUStringsProvider audioShaingDisabledCarKit](MRUStringsProvider, "audioShaingDisabledCarKit");
      v17 = objc_claimAutoreleasedReturnValue();
    }
    v14 = (void *)v17;
LABEL_10:
    v18 = (void *)MEMORY[0x1E0CC2320];
    +[MRUStringsProvider audioShaingActionTitle](MRUStringsProvider, "audioShaingActionTitle");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "itemWithActionTitle:subtitle:enabled:identifier:image:", v19, v14, v16, *MEMORY[0x1E0CC1D18], 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v28[0] = v20;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "appendItems:", v21);

    goto LABEL_11;
  }
LABEL_12:
  if (objc_msgSend(v13, "count"))
  {
    +[MRUStringsProvider routingHeaderSpeakersAndTVsTitle](MRUStringsProvider, "routingHeaderSpeakersAndTVsTitle");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "appendSection:", v22);

    if (-[MRURoutingViewController _shouldShowShowMoreButton](self, "_shouldShowShowMoreButton"))
    {
      v23 = (void *)MEMORY[0x1E0CC2320];
      +[MRUStringsProvider routingFooterShowMoreTitle](MRUStringsProvider, "routingFooterShowMoreTitle");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "itemWithActionTitle:subtitle:enabled:identifier:image:", v24, 0, 1, CFSTR("Show more"), 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "arrayByAddingObject:", v25);
      v26 = objc_claimAutoreleasedReturnValue();

      v13 = (void *)v26;
    }
    objc_msgSend(v9, "appendItems:", v13);
  }

  return v9;
}

- (BOOL)routesContainMultipleBuiltIn:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v3);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "pickableRouteType", (_QWORD)v10))
        {
          if (v6)
          {
            v6 = 2;
            goto LABEL_14;
          }
          v6 = 1;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v5)
        continue;
      break;
    }
  }
  else
  {
    v6 = 0;
  }
LABEL_14:

  return v6 > 1;
}

- (BOOL)routesContainSplitterCapableRoute:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (routesContainSplitterCapableRoute__onceToken != -1)
    dispatch_once(&routesContainSplitterCapableRoute__onceToken, &__block_literal_global_241);
  if (routesContainSplitterCapableRoute____supportsWirelessSplitting)
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v4 = v3;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v10;
      while (2)
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v10 != v6)
            objc_enumerationMutation(v4);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "isSplitterCapable", (_QWORD)v9) & 1) != 0)
          {
            LOBYTE(v5) = 1;
            goto LABEL_14;
          }
        }
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        if (v5)
          continue;
        break;
      }
    }
LABEL_14:

  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

uint64_t __62__MRURoutingViewController_routesContainSplitterCapableRoute___block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  routesContainSplitterCapableRoute____supportsWirelessSplitting = result;
  return result;
}

- (BOOL)routesContainAirPlayGroupableRoute:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
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
  v3 = a3;
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
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "supportsAirPlayGrouping", (_QWORD)v8) & 1) != 0)
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

- (void)ensureVendorSpecificGroupTreeIsVisible:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  unint64_t v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  void *v20;
  void *v21;
  unint64_t v22;
  unint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  int v34;
  uint64_t v35;
  __int16 v36;
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MPSectionedCollection itemAtIndexPath:](self->_routingViewItems, "itemAtIndexPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mainRoute");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "subroutes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "msv_compactMap:", &__block_literal_global_244);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  v10 = objc_msgSend(v4, "row") + v9;
  -[MRURoutingViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "tableView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "numberOfRowsInSection:", objc_msgSend(v4, "section"));

  if (v10 >= v13)
  {
    MCLogCategoryDeviceAccess();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = objc_msgSend(v4, "row") + v9;
      -[MRURoutingViewController view](self, "view");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "tableView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = 134218240;
      v35 = v15;
      v36 = 2048;
      v37 = objc_msgSend(v17, "numberOfRowsInSection:", objc_msgSend(v4, "section"));
      _os_log_impl(&dword_1AA991000, v14, OS_LOG_TYPE_DEFAULT, "ensureVendorSpecificGroupTreeIsVisible - Want to scroll to row %lu, but there are only %ld rows", (uint8_t *)&v34, 0x16u);

    }
  }
  v18 = (void *)MEMORY[0x1E0CB36B0];
  v19 = objc_msgSend(v4, "row") + v9;
  -[MRURoutingViewController view](self, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "tableView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "numberOfRowsInSection:", objc_msgSend(v4, "section"));

  if (v19 >= v22)
    v23 = v22;
  else
    v23 = v19;
  objc_msgSend(v18, "indexPathForRow:inSection:", v23, objc_msgSend(v4, "section"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRURoutingViewController view](self, "view");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "tableView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "indexPathsForVisibleRows");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "lastObject");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = objc_msgSend(v28, "section");
  if (v29 < objc_msgSend(v24, "section")
    || (v30 = objc_msgSend(v28, "section"), v30 == objc_msgSend(v24, "section"))
    && (v31 = objc_msgSend(v28, "row"), v31 < objc_msgSend(v24, "row")))
  {
    -[MRURoutingViewController view](self, "view");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "tableView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "scrollToRowAtIndexPath:atScrollPosition:animated:", v24, 3, 1);

  }
}

id __67__MRURoutingViewController_ensureVendorSpecificGroupTreeIsVisible___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  if (objc_msgSend(v2, "shouldBeDisplayed"))
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

- (BOOL)_shouldShowShowMoreButton
{
  void *v3;
  int v4;

  objc_msgSend(MEMORY[0x1E0D4C638], "currentSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supportShowMore");

  return v4 && self->_someRoutesAreFiltered && !self->_didSelectShowMore;
}

- (id)symbolNameForVendorSpecificRoute:(id)a3
{
  uint64_t v3;

  v3 = objc_msgSend(a3, "vendorSpecificRouteType");
  if ((unint64_t)(v3 - 1) > 4)
    return CFSTR("hifispeaker.fill");
  else
    return off_1E581AC38[v3 - 1];
}

- (BOOL)handleSelectedRoutingViewItem:(id)a3 operation:(int64_t)a4
{
  id v6;
  void *v7;
  id v8;
  uint64_t *v9;
  NSMutableDictionary *vendorSpecificGroupDisplayedSubroutes;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  int64_t v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  int64_t v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  int v24;
  BOOL v25;
  int v26;
  NSMutableSet *expandedItemUIDs;
  void *v28;
  int64_t v29;
  void *v30;
  uint64_t v31;
  NSObject *v32;
  _BOOL4 v33;
  MRGroupSession *activeGroupSession;
  MRGroupSession *v35;
  NSObject *v36;
  NSObject *v37;
  NSObject *v38;
  void *v39;
  int v41;
  _BOOL4 v42;
  void *v43;
  void *v44;
  void *v45;
  _QWORD v46[5];
  id v47;
  id v48;
  int64_t v49;
  uint8_t buf[4];
  MRGroupSession *v51;
  __int16 v52;
  void *v53;
  uint64_t v54;
  _QWORD v55[2];

  v55[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "routes");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mainRoute");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUVendorSpecificDeviceManager disconnectAllDevices](self->_vendorSpecificManager, "disconnectAllDevices");
  if (objc_msgSend(v6, "type") == 5)
  {
    v8 = v7;
    if (!objc_msgSend(v8, "isAirPlayRoute"))
    {
      v7 = v8;
      goto LABEL_9;
    }
    objc_msgSend(v8, "underlyingNativeRoute");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v55[0] = v7;
    v9 = v55;
    goto LABEL_7;
  }
  if (objc_msgSend(v6, "type") != 4)
    goto LABEL_10;
  vendorSpecificGroupDisplayedSubroutes = self->_vendorSpecificGroupDisplayedSubroutes;
  objc_msgSend(v7, "routeUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](vendorSpecificGroupDisplayedSubroutes, "objectForKeyedSubscript:", v11);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "isAirPlayRoute"))
  {
    objc_msgSend(v8, "underlyingNativeRoute");
    v12 = objc_claimAutoreleasedReturnValue();

    v54 = v12;
    v9 = &v54;
    v7 = (void *)v12;
LABEL_7:
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v13 = objc_claimAutoreleasedReturnValue();

    v45 = (void *)v13;
  }
LABEL_9:

LABEL_10:
  if (v7)
  {
    v43 = v6;
    self->_hasUserSelections = 1;
    v14 = a4;
    if (a4 == 2)
    {
      if (-[MRURoutingViewController shouldSuppressNativeRoutesStatusDisplay](self, "shouldSuppressNativeRoutesStatusDisplay"))
      {
        v14 = 1;
      }
      else
      {
        v14 = 2;
      }
    }
    self->_didLastPickNativeRoute = 1;
    -[MPAVRoutingController pickedRoutes](self->_routingController, "pickedRoutes");
    v15 = objc_claimAutoreleasedReturnValue();
    -[MRGroupSessionDiscovery activeSession](self->_groupSessionDiscovery, "activeSession");
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v7;
    v18 = v7;
    v19 = v14;
    v42 = -[MRURoutingViewController _wouldShareAudioForPickedRoute:operation:pickedRoutes:](self, "_wouldShareAudioForPickedRoute:operation:pickedRoutes:", v18, v14, v15);
    v41 = -[MPAVRoutingController supportsMultipleSelection](self->_routingController, "supportsMultipleSelection");
    -[MRURoutingViewController endpointRoute](self, "endpointRoute");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "isGroupSession");

    v44 = (void *)v16;
    if (v16)
    {
      -[MRURoutingViewController endpointRoute](self, "endpointRoute");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "endpointObject");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "isLocalEndpoint");

    }
    else
    {
      v24 = 0;
    }
    v6 = v43;
    v26 = v21 & v24;
    if (a4 == 1 && !objc_msgSend(v43, "type"))
    {
      expandedItemUIDs = self->_expandedItemUIDs;
      objc_msgSend(v17, "routeUID");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableSet addObject:](expandedItemUIDs, "addObject:", v28);

    }
    v29 = v19;
    v7 = v17;
    if (v26
      && -[MRURoutingViewController _wouldEndGroupSessionForViewItem:operation:pickedRoutes:](self, "_wouldEndGroupSessionForViewItem:operation:pickedRoutes:", v43, v29, v15))
    {
      -[MRGroupSession participants](self->_activeGroupSession, "participants");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "count");

      MCLogCategoryDefault();
      v32 = objc_claimAutoreleasedReturnValue();
      v33 = os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);
      if (v31)
      {
        if (v33)
        {
          activeGroupSession = self->_activeGroupSession;
          *(_DWORD *)buf = 138543618;
          v51 = (MRGroupSession *)v7;
          v52 = 2114;
          v53 = activeGroupSession;
          _os_log_impl(&dword_1AA991000, v32, OS_LOG_TYPE_DEFAULT, "[MRURoutingViewController] User picked route that would end hosted group session. Route: %{public}@, active group session: %{public}@", buf, 0x16u);
        }

        v46[0] = MEMORY[0x1E0C809B0];
        v46[1] = 3221225472;
        v46[2] = __68__MRURoutingViewController_handleSelectedRoutingViewItem_operation___block_invoke;
        v46[3] = &unk_1E581AB60;
        v46[4] = self;
        v47 = v45;
        v49 = v29;
        v48 = v43;
        -[MRURoutingViewController _displayEndGroupSessionWithCompletion:](self, "_displayEndGroupSessionWithCompletion:", v46);

        goto LABEL_48;
      }
      if (v33)
      {
        v35 = self->_activeGroupSession;
        *(_DWORD *)buf = 138543362;
        v51 = v35;
        _os_log_impl(&dword_1AA991000, v32, OS_LOG_TYPE_DEFAULT, "[MRURoutingViewController] Continuing with action while in hosted group session because session has no participants: %{public}@", buf, 0xCu);
      }

    }
    if (objc_msgSend(v7, "isDiscoveredGroupSession"))
    {
      MCLogCategoryDefault();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v51 = (MRGroupSession *)v7;
        _os_log_impl(&dword_1AA991000, v36, OS_LOG_TYPE_DEFAULT, "[MRURoutingViewController] User picked route that will join group session: %{public}@", buf, 0xCu);
      }

      -[MRURoutingViewController handleGroupSessionJoinWithPickedRoute:](self, "handleGroupSessionJoinWithPickedRoute:", v7);
    }
    else if (v29 == 2 && objc_msgSend(v7, "isDeviceSpeakerRoute"))
    {
      MCLogCategoryDefault();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AA991000, v37, OS_LOG_TYPE_DEFAULT, "[MRURoutingViewController] RCS cannot remove device route", buf, 2u);
      }

    }
    else
    {
      if ((-[MRURoutingViewController isInVehicle](self, "isInVehicle") & v41 & v42) != 1)
      {
        -[MRURoutingViewController selectRoutes:operation:routingViewItem:](self, "selectRoutes:operation:routingViewItem:", v45, v29, v43);
LABEL_48:
        v25 = 1;
LABEL_52:

        goto LABEL_53;
      }
      MCLogCategoryDefault();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v51 = (MRGroupSession *)v7;
        v52 = 2114;
        v53 = v15;
        _os_log_impl(&dword_1AA991000, v38, OS_LOG_TYPE_DEFAULT, "[MRURoutingViewController] Can't share audio while in the Car. Route: %{public}@, picked: %{public}@", buf, 0x16u);
      }

      if (-[MRURoutingViewController isInCarPlay](self, "isInCarPlay"))
        +[MRUStringsProvider audioSharingDisabledCarPlaySameOwner](MRUStringsProvider, "audioSharingDisabledCarPlaySameOwner");
      else
        +[MRUStringsProvider audioSharingDisabledCarKitSameOwner](MRUStringsProvider, "audioSharingDisabledCarKitSameOwner");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRURoutingViewController _displayShareAudioDisabledAlertForReason:](self, "_displayShareAudioDisabledAlertForReason:", v39);

    }
    v25 = 0;
    goto LABEL_52;
  }
  MCLogCategoryDefault();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AA991000, v15, OS_LOG_TYPE_ERROR, "[MRURoutingViewController] RCS attempted to select a nil route, ignoring.", buf, 2u);
  }
  v25 = 0;
LABEL_53:

  return v25;
}

uint64_t __68__MRURoutingViewController_handleSelectedRoutingViewItem_operation___block_invoke(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "selectRoutes:operation:routingViewItem:", *(_QWORD *)(result + 40), *(_QWORD *)(result + 56), *(_QWORD *)(result + 48));
  return result;
}

- (void)selectRoutes:(id)a3 operation:(int64_t)a4 routingViewItem:(id)a5
{
  id v8;
  MPAVRoutingController *routingController;
  id v10;
  _QWORD v11[5];
  id v12;
  BOOL v13;

  v8 = a5;
  routingController = self->_routingController;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __67__MRURoutingViewController_selectRoutes_operation_routingViewItem___block_invoke;
  v11[3] = &unk_1E581AB88;
  v13 = a4 == 1;
  v11[4] = self;
  v12 = v8;
  v10 = v8;
  -[MPAVRoutingController selectRoutes:operation:completion:](routingController, "selectRoutes:operation:completion:", a3, a4, v11);

}

void __67__MRURoutingViewController_selectRoutes_operation_routingViewItem___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  dispatch_time_t v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  char v13;
  _QWORD block[13];

  if (!a2)
  {
    block[5] = v5;
    block[6] = v4;
    block[11] = v2;
    block[12] = v3;
    v7 = dispatch_time(0, 2000000000);
    v8 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __67__MRURoutingViewController_selectRoutes_operation_routingViewItem___block_invoke_2;
    block[3] = &unk_1E5818C88;
    block[4] = *(_QWORD *)(a1 + 32);
    v9 = MEMORY[0x1E0C80D38];
    dispatch_after(v7, MEMORY[0x1E0C80D38], block);
    v11[0] = v8;
    v11[1] = 3221225472;
    v11[2] = __67__MRURoutingViewController_selectRoutes_operation_routingViewItem___block_invoke_260;
    v11[3] = &unk_1E5819228;
    v13 = *(_BYTE *)(a1 + 48);
    v10 = *(void **)(a1 + 40);
    v11[4] = *(_QWORD *)(a1 + 32);
    v12 = v10;
    dispatch_async(v9, v11);

  }
}

void __67__MRURoutingViewController_selectRoutes_operation_routingViewItem___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "endpointRoute");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endpointObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    +[MRURouteRecommender sharedInstance](MRURouteRecommender, "sharedInstance");
    v4 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "donatingAppBundleID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject donatePickerChoiceFor:bundleID:isEligibleApp:reason:](v4, "donatePickerChoiceFor:bundleID:isEligibleApp:reason:", v3, v5, objc_msgSend(*(id *)(a1 + 32), "isDonatingAppEligible"), CFSTR("selectRoutes"));

  }
  else
  {
    MCLogCategoryDefault();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = objc_opt_class();
      v7 = *(void **)(a1 + 32);
      objc_msgSend(v7, "endpointRoute");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543874;
      v10 = v6;
      v11 = 2048;
      v12 = v7;
      v13 = 2112;
      v14 = v8;
      _os_log_impl(&dword_1AA991000, v4, OS_LOG_TYPE_ERROR, "%{public}@<%p> Attempt to donate nil endpoint from route:%@", (uint8_t *)&v9, 0x20u);

    }
  }

}

void __67__MRURoutingViewController_selectRoutes_operation_routingViewItem___block_invoke_260(uint64_t a1)
{
  id WeakRetained;

  if (!+[MRUFeatureFlagProvider isRoutePickerNotCollapseGroupAutomaticallyEnabled](MRUFeatureFlagProvider, "isRoutePickerNotCollapseGroupAutomaticallyEnabled")&& *(_BYTE *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "_collapseAllGroupsAfterDelay");
  }
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1168));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "routingViewController:didSelectRoutingViewItem:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)fetchAvailableRoutesWithCompletionHandler:(id)a3
{
  id v4;
  MPAVRoutingController *routingController;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  routingController = self->_routingController;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __70__MRURoutingViewController_fetchAvailableRoutesWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E581ABF0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[MPAVRoutingController fetchAvailableRoutesWithCompletionHandler:](routingController, "fetchAvailableRoutesWithCompletionHandler:", v7);

}

void __70__MRURoutingViewController_fetchAvailableRoutesWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  char v8;
  int v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = (id)objc_msgSend(a2, "mutableCopy");
  v3 = *(id *)(*(_QWORD *)(a1 + 32) + 1200);
  v4 = *(id *)(*(_QWORD *)(a1 + 32) + 1392);
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 1224);
  if (v5)
  {
    v6 = v5;
    if (!v4)
      goto LABEL_13;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bundleIdentifier");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (!v4)
      goto LABEL_13;
  }
  if (objc_msgSend(v3, "isDeviceRoute"))
    v8 = MRBundlePermittedForJoiningGroupSessions() ^ 1;
  else
    v8 = 1;
  v9 = objc_msgSend(v3, "isDeviceRoute");
  objc_msgSend(v4, "activeSession");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v9 && (v8 & 1) == 0 && !v10)
  {
    objc_msgSend(v4, "discoveredSessions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "msv_map:", &__block_literal_global_262);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "addObjectsFromArray:", v13);
  }

LABEL_13:
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

MRUDiscoveredGroupSessionRoute *__70__MRURoutingViewController_fetchAvailableRoutesWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  MRUDiscoveredGroupSessionRoute *v3;

  v2 = a2;
  v3 = -[MRUDiscoveredGroupSessionRoute initWithDiscoveredGroupSession:]([MRUDiscoveredGroupSessionRoute alloc], "initWithDiscoveredGroupSession:", v2);

  return v3;
}

- (void)groupSessionDiscovery:(id)a3 discoveredSessionsDidChange:(id)a4
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__MRURoutingViewController_groupSessionDiscovery_discoveredSessionsDidChange___block_invoke;
  block[3] = &unk_1E5818C88;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __78__MRURoutingViewController_groupSessionDiscovery_discoveredSessionsDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateDisplayedRoutes");
}

- (void)groupSessionDiscovery:(id)a3 activeSessionDidChange:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __73__MRURoutingViewController_groupSessionDiscovery_activeSessionDidChange___block_invoke;
  v7[3] = &unk_1E5818CB0;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

uint64_t __73__MRURoutingViewController_groupSessionDiscovery_activeSessionDidChange___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  void *v5;
  char v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  int v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 1400);
  if (v2)
  {
    objc_msgSend(v2, "identifier");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (v3 == v4)
    {

    }
    else
    {
      v5 = v4;
      v6 = objc_msgSend(v3, "isEqual:", v4);

      if ((v6 & 1) == 0)
      {
        MCLogCategoryDefault();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1400), "identifier");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = 138543362;
          v20 = v8;
          _os_log_impl(&dword_1AA991000, v7, OS_LOG_TYPE_DEFAULT, "[MRURoutingViewController] End observing group session: %{public}@", (uint8_t *)&v19, 0xCu);

        }
        v9 = *(_QWORD *)(a1 + 32);
        v10 = *(void **)(v9 + 1400);
        *(_QWORD *)(v9 + 1400) = 0;

      }
    }
  }
  if (*(_QWORD *)(a1 + 40))
  {
    MCLogCategoryDefault();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543362;
      v20 = v12;
      _os_log_impl(&dword_1AA991000, v11, OS_LOG_TYPE_DEFAULT, "[MRURoutingViewController] Begin observing group session: %{public}@", (uint8_t *)&v19, 0xCu);

    }
    v13 = (void *)MEMORY[0x1E0D4C568];
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "remoteControlGroupSessionWithIdentifier:delegate:", v14, *(_QWORD *)(a1 + 32));
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = *(_QWORD *)(a1 + 32);
    v17 = *(void **)(v16 + 1400);
    *(_QWORD *)(v16 + 1400) = v15;

  }
  return objc_msgSend(*(id *)(a1 + 32), "_updateDisplayedRoutes");
}

- (void)groupSessionDidConnect:(id)a3
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  MCLogCategoryDefault();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_1AA991000, v4, OS_LOG_TYPE_DEFAULT, "[MRURoutingViewController] Connected to group session: %{public}@", (uint8_t *)&v5, 0xCu);
  }

}

- (void)groupSession:(id)a3 didInvalidateWithError:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _QWORD block[5];
  uint8_t buf[4];
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  MCLogCategoryDefault();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v11 = v6;
    v12 = 2114;
    v13 = v7;
    _os_log_impl(&dword_1AA991000, v8, OS_LOG_TYPE_DEFAULT, "[MRURoutingViewController] Group session invalidated: %{public}@ with error: %{public}@", buf, 0x16u);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__MRURoutingViewController_groupSession_didInvalidateWithError___block_invoke;
  block[3] = &unk_1E5818C88;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __64__MRURoutingViewController_groupSession_didInvalidateWithError___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 1400);
  *(_QWORD *)(v2 + 1400) = 0;

  return objc_msgSend(*(id *)(a1 + 32), "_updateDisplayedRoutes");
}

- (id)_stateDumpObject
{
  id v2;
  id v3;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__0;
  v9 = __Block_byref_object_dispose__0;
  v10 = 0;
  v2 = MEMORY[0x1E0C80D38];
  msv_dispatch_sync_on_queue();

  v3 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v3;
}

void __44__MRURoutingViewController__stateDumpObject__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[4];
  _QWORD v12[5];

  v12[4] = *MEMORY[0x1E0C80C00];
  v11[0] = CFSTR("_obj");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p>"), objc_opt_class(), *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v2;
  v11[1] = CFSTR("endpointRoute");
  objc_msgSend(*(id *)(a1 + 32), "endpointRoute");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  v5 = CFSTR("<NONE>");
  if (v3)
    v5 = (const __CFString *)v3;
  v12[1] = v5;
  v11[2] = CFSTR("routeDiscoveryMode");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1152), "discoveryMode"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v6;
  v11[3] = CFSTR("onScreen");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 1142));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[3] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 4);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

}

- (id)_fullStateDumpObject
{
  id v2;
  id v3;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__0;
  v9 = __Block_byref_object_dispose__0;
  v10 = 0;
  v2 = MEMORY[0x1E0C80D38];
  msv_dispatch_sync_on_queue();

  v3 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v3;
}

void __48__MRURoutingViewController__fullStateDumpObject__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  const __CFString *v5;
  uint64_t v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  _QWORD *v15;
  const __CFString *v16;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  const __CFString *v20;
  const __CFString *v21;
  const __CFString *v22;
  const __CFString *v23;
  const __CFString *v24;
  const __CFString *v25;
  const __CFString *v26;
  const __CFString *v27;
  const __CFString *v28;
  const __CFString *v29;
  const __CFString *v30;
  const __CFString *v31;
  const __CFString *v32;
  const __CFString *v33;
  const __CFString *v34;
  const __CFString *v35;
  const __CFString *v36;
  const __CFString *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  _QWORD v41[29];
  _QWORD v42[31];

  v42[29] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p>"), objc_opt_class(), *(_QWORD *)(a1 + 32), CFSTR("_obj"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = v2;
  v41[1] = CFSTR("endpointRoute");
  objc_msgSend(*(id *)(a1 + 32), "endpointRoute");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
    v5 = (const __CFString *)v3;
  else
    v5 = CFSTR("<NONE>");
  v42[1] = v5;
  v41[2] = CFSTR("displayedEndpointRoute");
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(const __CFString **)(v6 + 992);
  if (!v7)
    v7 = CFSTR("<NONE>");
  v42[2] = v7;
  v41[3] = CFSTR("routeDiscoveryMode");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(v6 + 1152), "discoveryMode"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v42[3] = v8;
  v41[4] = CFSTR("onScreen");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 1142));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v42[4] = v9;
  v41[5] = CFSTR("inCarPlay");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "isInCarPlay"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v42[5] = v10;
  v41[6] = CFSTR("groupSessionDiscovery");
  objc_msgSend(*(id *)(a1 + 32), "groupSessionDiscovery");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "debugDescription");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v12)
    v14 = (const __CFString *)v12;
  else
    v14 = CFSTR("<NONE>");
  v42[6] = v14;
  v41[7] = CFSTR("expandedGroupUIDs");
  v15 = *(_QWORD **)(a1 + 32);
  v16 = (const __CFString *)v15[159];
  if (!v16)
    v16 = CFSTR("<NONE>");
  v42[7] = v16;
  v41[8] = CFSTR("expandedItemUIDs");
  v17 = (const __CFString *)v15[160];
  if (!v17)
    v17 = CFSTR("<NONE>");
  v42[8] = v17;
  v41[9] = CFSTR("expandedRouteUIDs");
  v18 = (const __CFString *)v15[161];
  if (!v18)
    v18 = CFSTR("<NONE>");
  v42[9] = v18;
  v41[10] = CFSTR("expandedVendorSpecificGroupUIDs");
  v19 = (const __CFString *)v15[170];
  if (!v19)
    v19 = CFSTR("<NONE>");
  v42[10] = v19;
  v41[11] = CFSTR("collapsedVendorSpecificGroupUIDs");
  v20 = (const __CFString *)v15[169];
  if (!v20)
    v20 = CFSTR("<NONE>");
  v42[11] = v20;
  v41[12] = CFSTR("indexedDataControllers");
  v21 = (const __CFString *)v15[162];
  if (!v21)
    v21 = CFSTR("<NONE>");
  v42[12] = v21;
  v41[13] = CFSTR("routingViewItems");
  v22 = (const __CFString *)v15[125];
  if (!v22)
    v22 = CFSTR("<NONE>");
  v42[13] = v22;
  v41[14] = CFSTR("routingController");
  v23 = (const __CFString *)v15[144];
  if (!v23)
    v23 = CFSTR("<NONE>");
  v42[14] = v23;
  v41[15] = CFSTR("pendingUpdate");
  v24 = (const __CFString *)v15[121];
  if (!v24)
    v24 = CFSTR("<NONE>");
  v42[15] = v24;
  v41[16] = CFSTR("optimisticUpdate");
  v25 = (const __CFString *)v15[122];
  if (!v25)
    v25 = CFSTR("<NONE>");
  v42[16] = v25;
  v41[17] = CFSTR("cachedPickedRoutes");
  v26 = (const __CFString *)v15[126];
  if (!v26)
    v26 = CFSTR("<NONE>");
  v42[17] = v26;
  v41[18] = CFSTR("cachedDisplayableAvailableRoutes");
  v27 = (const __CFString *)v15[127];
  if (!v27)
    v27 = CFSTR("<NONE>");
  v42[18] = v27;
  v41[19] = CFSTR("cachedPendingPickedRoutes");
  v28 = (const __CFString *)v15[128];
  if (!v28)
    v28 = CFSTR("<NONE>");
  v42[19] = v28;
  v41[20] = CFSTR("cachedDisplayAsPickedRoutes");
  v29 = (const __CFString *)v15[129];
  if (!v29)
    v29 = CFSTR("<NONE>");
  v42[20] = v29;
  v41[21] = CFSTR("cachedVolumeCapableRoutes");
  v30 = (const __CFString *)v15[130];
  if (!v30)
    v30 = CFSTR("<NONE>");
  v42[21] = v30;
  v41[22] = CFSTR("cachedRouteGrouping");
  v31 = (const __CFString *)v15[131];
  if (!v31)
    v31 = CFSTR("<NONE>");
  v42[22] = v31;
  v41[23] = CFSTR("cachedAirPlayRoutes");
  v32 = (const __CFString *)v15[132];
  if (!v32)
    v32 = CFSTR("<NONE>");
  v42[23] = v32;
  v41[24] = CFSTR("cachedNativeRoutes");
  v33 = (const __CFString *)v15[133];
  if (!v33)
    v33 = CFSTR("<NONE>");
  v42[24] = v33;
  v41[25] = CFSTR("cachedNativeRoutesInVendorSpecificGroup");
  v34 = (const __CFString *)v15[134];
  if (!v34)
    v34 = CFSTR("<NONE>");
  v42[25] = v34;
  v41[26] = CFSTR("cachedActivatedVendorSpecificDeviceIDs");
  v35 = (const __CFString *)v15[135];
  if (!v35)
    v35 = CFSTR("<NONE>");
  v42[26] = v35;
  v41[27] = CFSTR("cachedPendingVendorSpecificDeviceIDs");
  v36 = (const __CFString *)v15[136];
  if (!v36)
    v36 = CFSTR("<NONE>");
  v42[27] = v36;
  v41[28] = CFSTR("cachedAvailableVendorSpecificDeviceIDs");
  v37 = (const __CFString *)v15[137];
  if (!v37)
    v37 = CFSTR("<NONE>");
  v42[28] = v37;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, v41, 29);
  v38 = objc_claimAutoreleasedReturnValue();
  v39 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v40 = *(void **)(v39 + 40);
  *(_QWORD *)(v39 + 40) = v38;

}

- (void)hearingAidConnectionDidChange
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  char isKindOfClass;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id obj;
  _QWORD v20[5];
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  id v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  -[MRURoutingViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "indexPathsForVisibleRows");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
  obj = v6;
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v23;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v23 != v9)
        objc_enumerationMutation(obj);
      v11 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v10);
      -[MPSectionedCollection itemAtIndexPath:](self->_routingViewItems, "itemAtIndexPath:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "mainRoute");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
        break;

      if (v8 == ++v10)
      {
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
        if (v8)
          goto LABEL_3;
        v6 = obj;
        goto LABEL_14;
      }
    }
    v15 = v11;

    if (!v15)
      goto LABEL_15;
    MCLogCategoryDefault();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v27 = v15;
      _os_log_impl(&dword_1AA991000, v16, OS_LOG_TYPE_DEFAULT, "[MRURoutingViewController] virtualHearingAidIndexPath: %@", buf, 0xCu);
    }

    -[MRURoutingViewController view](self, "view");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "tableView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __57__MRURoutingViewController_hearingAidConnectionDidChange__block_invoke;
    v20[3] = &unk_1E5818CB0;
    v20[4] = self;
    v21 = v15;
    v6 = v15;
    objc_msgSend(v18, "performBatchUpdates:completion:", v20, 0);

  }
LABEL_14:

LABEL_15:
}

void __57__MRURoutingViewController_hearingAidConnectionDidChange__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadRowsAtIndexPaths:withRowAnimation:", v4, 0);

}

- (MPAVRoutingController)routingController
{
  return self->_routingController;
}

- (MRUVendorSpecificDeviceManager)vendorSpecificManager
{
  return self->_vendorSpecificManager;
}

- (MRURoutingViewControllerDelegate)delegate
{
  return (MRURoutingViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (MRUVisualStylingProvider)stylingProvider
{
  return self->_stylingProvider;
}

- (MRUVolumeGroupCoordinator)volumeGroupCoordinator
{
  return self->_volumeGroupCoordinator;
}

- (NSArray)nowPlayingControllers
{
  return self->_nowPlayingControllers;
}

- (MPAVEndpointRoute)endpointRoute
{
  return self->_endpointRoute;
}

- (int64_t)discoveryMode
{
  return self->_discoveryMode;
}

- (BOOL)sortByIsVideoRoute
{
  return self->_sortByIsVideoRoute;
}

- (void)setSortByIsVideoRoute:(BOOL)a3
{
  self->_sortByIsVideoRoute = a3;
}

- (BOOL)showMetadataForEndpointRoute
{
  return self->_showMetadataForEndpointRoute;
}

- (void)setShowMetadataForEndpointRoute:(BOOL)a3
{
  self->_showMetadataForEndpointRoute = a3;
}

- (UIEdgeInsets)contentEdgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentEdgeInsets.top;
  left = self->_contentEdgeInsets.left;
  bottom = self->_contentEdgeInsets.bottom;
  right = self->_contentEdgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (UIEdgeInsets)scrollIndicatorInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_scrollIndicatorInsets.top;
  left = self->_scrollIndicatorInsets.left;
  bottom = self->_scrollIndicatorInsets.bottom;
  right = self->_scrollIndicatorInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (NSMutableArray)customRows
{
  return self->_customRows;
}

- (int)presentingAppProcessIdentifier
{
  return self->_presentingAppProcessIdentifier;
}

- (void)setPresentingAppProcessIdentifier:(int)a3
{
  self->_presentingAppProcessIdentifier = a3;
}

- (NSString)presentingAppBundleID
{
  return self->_presentingAppBundleID;
}

- (NSString)nowPlayingAppBundleID
{
  return self->_nowPlayingAppBundleID;
}

- (void)setNowPlayingAppBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1232);
}

- (NSArray)visibleMediaApps
{
  return self->_visibleMediaApps;
}

- (void)setVisibleMediaApps:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1240);
}

- (NSString)donatingAppBundleID
{
  return self->_donatingAppBundleID;
}

- (void)setDonatingAppBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1248);
}

- (BOOL)isDonatingAppEligible
{
  return self->_donatingAppEligible;
}

- (void)setDonatingAppEligible:(BOOL)a3
{
  self->_donatingAppEligible = a3;
}

- (BOOL)onScreen
{
  return self->_onScreen;
}

- (NSDictionary)outputDeviceVolumeControllers
{
  return self->_outputDeviceVolumeControllers;
}

- (void)setOutputDeviceVolumeControllers:(id)a3
{
  objc_storeStrong((id *)&self->_outputDeviceVolumeControllers, a3);
}

- (CARSessionStatus)carPlaySessionStatus
{
  return self->_carPlaySessionStatus;
}

- (void)setCarPlaySessionStatus:(id)a3
{
  objc_storeStrong((id *)&self->_carPlaySessionStatus, a3);
}

- (NSMutableSet)expandedGroupUIDs
{
  return self->_expandedGroupUIDs;
}

- (void)setExpandedGroupUIDs:(id)a3
{
  objc_storeStrong((id *)&self->_expandedGroupUIDs, a3);
}

- (NSMutableSet)expandedItemUIDs
{
  return self->_expandedItemUIDs;
}

- (void)setExpandedItemUIDs:(id)a3
{
  objc_storeStrong((id *)&self->_expandedItemUIDs, a3);
}

- (NSMutableSet)expandedRouteUIDs
{
  return self->_expandedRouteUIDs;
}

- (void)setExpandedRouteUIDs:(id)a3
{
  objc_storeStrong((id *)&self->_expandedRouteUIDs, a3);
}

- (NSDictionary)indexedNowPlayingControllers
{
  return self->_indexedNowPlayingControllers;
}

- (void)setIndexedNowPlayingControllers:(id)a3
{
  objc_storeStrong((id *)&self->_indexedNowPlayingControllers, a3);
}

- (BOOL)needsDisplayedRoutesUpdate
{
  return self->_needsDisplayedRoutesUpdate;
}

- (void)setNeedsDisplayedRoutesUpdate:(BOOL)a3
{
  self->_needsDisplayedRoutesUpdate = a3;
}

- (NSNumberFormatter)percentageFormatter
{
  return self->_percentageFormatter;
}

- (void)setPercentageFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_percentageFormatter, a3);
}

- (MPWeakTimer)subtitleUpdateTimer
{
  return self->_subtitleUpdateTimer;
}

- (void)setSubtitleUpdateTimer:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleUpdateTimer, a3);
}

- (NSTimer)collapseTimer
{
  return self->_collapseTimer;
}

- (void)setCollapseTimer:(id)a3
{
  objc_storeStrong((id *)&self->_collapseTimer, a3);
}

- (unint64_t)stateHandle
{
  return self->_stateHandle;
}

- (void)setStateHandle:(unint64_t)a3
{
  self->_stateHandle = a3;
}

- (BOOL)presentingAppHasActiveAVSession
{
  return self->_presentingAppHasActiveAVSession;
}

- (void)setPresentingAppHasActiveAVSession:(BOOL)a3
{
  self->_presentingAppHasActiveAVSession = a3;
}

- (BOOL)didLastPickNativeRoute
{
  return self->_didLastPickNativeRoute;
}

- (void)setDidLastPickNativeRoute:(BOOL)a3
{
  self->_didLastPickNativeRoute = a3;
}

- (NSIndexPath)vendorSpecificGroupThatWasJustExpanded
{
  return self->_vendorSpecificGroupThatWasJustExpanded;
}

- (void)setVendorSpecificGroupThatWasJustExpanded:(id)a3
{
  objc_storeStrong((id *)&self->_vendorSpecificGroupThatWasJustExpanded, a3);
}

- (NSString)mostRecentlyInteractedVendorSpecificGroupRouteID
{
  return self->_mostRecentlyInteractedVendorSpecificGroupRouteID;
}

- (void)setMostRecentlyInteractedVendorSpecificGroupRouteID:(id)a3
{
  objc_storeStrong((id *)&self->_mostRecentlyInteractedVendorSpecificGroupRouteID, a3);
}

- (NSMutableSet)collapsedVendorSpecificGroupUIDs
{
  return self->_collapsedVendorSpecificGroupUIDs;
}

- (void)setCollapsedVendorSpecificGroupUIDs:(id)a3
{
  objc_storeStrong((id *)&self->_collapsedVendorSpecificGroupUIDs, a3);
}

- (NSMutableSet)expandedVendorSpecificGroupUIDs
{
  return self->_expandedVendorSpecificGroupUIDs;
}

- (void)setExpandedVendorSpecificGroupUIDs:(id)a3
{
  objc_storeStrong((id *)&self->_expandedVendorSpecificGroupUIDs, a3);
}

- (NSMutableDictionary)vendorSpecificGroupDisplayedSubroutes
{
  return self->_vendorSpecificGroupDisplayedSubroutes;
}

- (void)setVendorSpecificGroupDisplayedSubroutes:(id)a3
{
  objc_storeStrong((id *)&self->_vendorSpecificGroupDisplayedSubroutes, a3);
}

- (BOOL)didExpandVendorSpecificSpeakerGroup
{
  return self->_didExpandVendorSpecificSpeakerGroup;
}

- (void)setDidExpandVendorSpecificSpeakerGroup:(BOOL)a3
{
  self->_didExpandVendorSpecificSpeakerGroup = a3;
}

- (NSMutableArray)staticCustomRowItems
{
  return self->_staticCustomRowItems;
}

- (void)setStaticCustomRowItems:(id)a3
{
  objc_storeStrong((id *)&self->_staticCustomRowItems, a3);
}

- (AVSystemController)mediaServerController
{
  return self->_mediaServerController;
}

- (void)setMediaServerController:(id)a3
{
  objc_storeStrong((id *)&self->_mediaServerController, a3);
}

- (MRGroupSessionDiscovery)groupSessionDiscovery
{
  return self->_groupSessionDiscovery;
}

- (MRGroupSession)activeGroupSession
{
  return self->_activeGroupSession;
}

- (void)setActiveGroupSession:(id)a3
{
  objc_storeStrong((id *)&self->_activeGroupSession, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeGroupSession, 0);
  objc_storeStrong((id *)&self->_groupSessionDiscovery, 0);
  objc_storeStrong((id *)&self->_mediaServerController, 0);
  objc_storeStrong((id *)&self->_staticCustomRowItems, 0);
  objc_storeStrong((id *)&self->_vendorSpecificGroupDisplayedSubroutes, 0);
  objc_storeStrong((id *)&self->_expandedVendorSpecificGroupUIDs, 0);
  objc_storeStrong((id *)&self->_collapsedVendorSpecificGroupUIDs, 0);
  objc_storeStrong((id *)&self->_mostRecentlyInteractedVendorSpecificGroupRouteID, 0);
  objc_storeStrong((id *)&self->_vendorSpecificGroupThatWasJustExpanded, 0);
  objc_storeStrong((id *)&self->_collapseTimer, 0);
  objc_storeStrong((id *)&self->_subtitleUpdateTimer, 0);
  objc_storeStrong((id *)&self->_percentageFormatter, 0);
  objc_storeStrong((id *)&self->_indexedNowPlayingControllers, 0);
  objc_storeStrong((id *)&self->_expandedRouteUIDs, 0);
  objc_storeStrong((id *)&self->_expandedItemUIDs, 0);
  objc_storeStrong((id *)&self->_expandedGroupUIDs, 0);
  objc_storeStrong((id *)&self->_carPlaySessionStatus, 0);
  objc_storeStrong((id *)&self->_outputDeviceVolumeControllers, 0);
  objc_storeStrong((id *)&self->_donatingAppBundleID, 0);
  objc_storeStrong((id *)&self->_visibleMediaApps, 0);
  objc_storeStrong((id *)&self->_nowPlayingAppBundleID, 0);
  objc_storeStrong((id *)&self->_presentingAppBundleID, 0);
  objc_storeStrong((id *)&self->_customRows, 0);
  objc_storeStrong((id *)&self->_endpointRoute, 0);
  objc_storeStrong((id *)&self->_nowPlayingControllers, 0);
  objc_storeStrong((id *)&self->_volumeGroupCoordinator, 0);
  objc_storeStrong((id *)&self->_stylingProvider, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_vendorSpecificManager, 0);
  objc_storeStrong((id *)&self->_routingController, 0);
  objc_storeStrong((id *)&self->_updateTimer, 0);
  objc_storeStrong((id *)&self->_cachedAvailableVendorSpecificDeviceIDs, 0);
  objc_storeStrong((id *)&self->_cachedPendingVendorSpecificDeviceIDs, 0);
  objc_storeStrong((id *)&self->_cachedActivatedVendorSpecificDeviceIDs, 0);
  objc_storeStrong((id *)&self->_cachedNativeRoutesInVendorSpecificGroup, 0);
  objc_storeStrong((id *)&self->_cachedNativeRoutes, 0);
  objc_storeStrong((id *)&self->_cachedAirPlayRoutes, 0);
  objc_storeStrong((id *)&self->_cachedRouteGrouping, 0);
  objc_storeStrong((id *)&self->_cachedVolumeCapableRoutes, 0);
  objc_storeStrong((id *)&self->_cachedDisplayAsPickedRoutes, 0);
  objc_storeStrong((id *)&self->_cachedPendingPickedRoutes, 0);
  objc_storeStrong((id *)&self->_cachedDisplayableAvailableRoutes, 0);
  objc_storeStrong((id *)&self->_cachedPickedRoutes, 0);
  objc_storeStrong((id *)&self->_routingViewItems, 0);
  objc_storeStrong((id *)&self->_displayedEndpointRoute, 0);
  objc_storeStrong((id *)&self->_optimisticUpdate, 0);
  objc_storeStrong((id *)&self->_pendingUpdate, 0);
}

@end
