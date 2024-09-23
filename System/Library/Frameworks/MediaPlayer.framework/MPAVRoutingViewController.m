@implementation MPAVRoutingViewController

- (void)_initWithStyle:(unint64_t)a3 routingController:(id)a4
{
  MPAVRoutingController *v6;
  MPAVRoutingController *v7;
  objc_class *v8;
  void *v9;
  NSMapTable *v10;
  NSMapTable *outputDeviceVolumeSliders;
  NSMutableSet *v12;
  NSMutableSet *expandedGroupUIDs;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id location;

  v6 = (MPAVRoutingController *)a4;
  self->_style = a3;
  self->_mirroringStyle = 0;
  self->_routeDiscoveryMode = 0;
  if (!v6)
  {
    v7 = [MPAVRoutingController alloc];
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[MPAVRoutingController initWithName:](v7, "initWithName:", v9);

  }
  objc_storeStrong((id *)&self->_routingController, v6);
  -[MPAVRoutingController setDelegate:](self->_routingController, "setDelegate:", self);
  self->_suspendedDiscoveryModeDueToApplicationState = 0;
  self->_discoveryModeBeforeEnteringBackground = 0;
  self->_shouldAutomaticallyUpdateRoutesList = 1;
  self->_shouldPickRouteOnSelection = 1;
  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v10 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
  outputDeviceVolumeSliders = self->_outputDeviceVolumeSliders;
  self->_outputDeviceVolumeSliders = v10;

  v12 = (NSMutableSet *)objc_opt_new();
  expandedGroupUIDs = self->_expandedGroupUIDs;
  self->_expandedGroupUIDs = v12;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.MediaPlayer"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("AIRTUNES_POPOVER_TITLE"), &stru_1E3163D10, CFSTR("MediaPlayer"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPAVRoutingViewController setTitle:](self, "setTitle:", v15);

  -[MPAVRoutingViewController _registerNotifications](self, "_registerNotifications");
  -[MPAVRoutingViewController _registerCarPlayObserver](self, "_registerCarPlayObserver");
  objc_initWeak(&location, self);
  v16 = MEMORY[0x1E0C80D38];
  v17 = MEMORY[0x1E0C80D38];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __62__MPAVRoutingViewController__initWithStyle_routingController___block_invoke;
  v18[3] = &unk_1E315E6B0;
  objc_copyWeak(&v19, &location);
  notify_register_dispatch("com.apple.mediaplayer.airPlayPasswordAlertDidCancel", &self->_airPlayPasswordAlertDidCancelToken, v16, v18);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

}

- (MPAVRoutingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  MPAVRoutingViewController *v4;
  MPAVRoutingViewController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MPAVRoutingViewController;
  v4 = -[MPAVRoutingViewController initWithNibName:bundle:](&v7, sel_initWithNibName_bundle_, a3, a4);
  v5 = v4;
  if (v4)
    -[MPAVRoutingViewController _initWithStyle:routingController:](v4, "_initWithStyle:routingController:", 1, 0);
  return v5;
}

- (MPAVRoutingViewController)initWithStyle:(unint64_t)a3
{
  MPAVRoutingViewController *v4;
  MPAVRoutingViewController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MPAVRoutingViewController;
  v4 = -[MPAVRoutingViewController initWithNibName:bundle:](&v7, sel_initWithNibName_bundle_, 0, 0);
  v5 = v4;
  if (v4)
    -[MPAVRoutingViewController _initWithStyle:routingController:](v4, "_initWithStyle:routingController:", a3, 0);
  return v5;
}

- (MPAVRoutingViewController)initWithStyle:(unint64_t)a3 routingController:(id)a4
{
  id v6;
  MPAVRoutingViewController *v7;
  MPAVRoutingViewController *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)MPAVRoutingViewController;
  v7 = -[MPAVRoutingViewController initWithNibName:bundle:](&v10, sel_initWithNibName_bundle_, 0, 0);
  v8 = v7;
  if (v7)
    -[MPAVRoutingViewController _initWithStyle:routingController:](v7, "_initWithStyle:routingController:", a3, v6);

  return v8;
}

- (void)dealloc
{
  objc_super v3;

  notify_cancel(self->_airPlayPasswordAlertDidAppearToken);
  notify_cancel(self->_airPlayPasswordAlertDidCancelToken);
  -[MPAVRoutingViewController _unregisterNotifications](self, "_unregisterNotifications");
  -[MPWeakTimer invalidate](self->_updateTimer, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)MPAVRoutingViewController;
  -[MPAVRoutingViewController dealloc](&v3, sel_dealloc);
}

- (void)setAVItemType:(int64_t)a3
{
  if (self->_avItemType != a3)
  {
    self->_avItemType = a3;
    -[MPAVRoutingViewController _setNeedsDisplayedRoutesUpdate](self, "_setNeedsDisplayedRoutesUpdate");
  }
}

- (BOOL)allowMirroring
{
  return self->_mirroringStyle != 0;
}

- (void)setAllowMirroring:(BOOL)a3
{
  -[MPAVRoutingViewController setMirroringStyle:](self, "setMirroringStyle:", a3);
}

- (void)setMirroringStyle:(unint64_t)a3
{
  if (self->_mirroringStyle != a3)
  {
    self->_mirroringStyle = a3;
    -[MPAVRoutingViewController _setNeedsDisplayedRoutesUpdate](self, "_setNeedsDisplayedRoutesUpdate");
  }
}

- (void)setIconStyle:(unint64_t)a3
{
  id v4;

  if (self->_iconStyle != a3)
  {
    self->_iconStyle = a3;
    -[MPAVRoutingViewController _createReloadUpdate](self, "_createReloadUpdate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[MPAVRoutingViewController _enqueueUpdate:](self, "_enqueueUpdate:", v4);

  }
}

- (void)setDiscoveryModeOverride:(id)a3
{
  objc_storeStrong((id *)&self->_discoveryModeOverride, a3);
  -[MPAVRoutingViewController _setNeedsRouteDiscoveryModeUpdate](self, "_setNeedsRouteDiscoveryModeUpdate");
}

- (void)setGroupSliderCoordinator:(id)a3
{
  MPVolumeGroupSliderCoordinator **p_groupSliderCoordinator;
  void *v6;
  MPVolumeGroupSliderCoordinator *v7;

  p_groupSliderCoordinator = &self->_groupSliderCoordinator;
  v7 = (MPVolumeGroupSliderCoordinator *)a3;
  if (*p_groupSliderCoordinator != v7)
  {
    objc_storeStrong((id *)&self->_groupSliderCoordinator, a3);
    -[NSMapTable removeAllObjects](self->_outputDeviceVolumeSliders, "removeAllObjects");
    -[MPVolumeGroupSliderCoordinator removeAllIndividualVolumeSliders](*p_groupSliderCoordinator, "removeAllIndividualVolumeSliders");
  }
  -[MPAVRoutingViewController _createReloadUpdate](self, "_createReloadUpdate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPAVRoutingViewController _enqueueUpdate:](self, "_enqueueUpdate:", v6);

}

- (BOOL)isInCarPlay
{
  void *v2;
  BOOL v3;

  -[CARSessionStatus currentSession](self->_carPlayStatus, "currentSession");
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
  return -[MPAVRoutingViewController isInCarPlay](self, "isInCarPlay")
      || -[MPAVRoutingViewController hasCarKitRoute](self, "hasCarKitRoute");
}

- (void)resetDisplayedRoutes
{
  self->_hasUserSelections = 0;
  -[MPAVRoutingViewController _updateDisplayedRoutes](self, "_updateDisplayedRoutes");
}

- (void)resetScrollPosition
{
  -[MPAVClippingTableView setContentOffset:](self->_tableView, "setContentOffset:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
}

- (void)_setContinuousCornerRadius:(double)a3
{
  id v4;

  self->_continuousCornerRadius = a3;
  -[MPAVClippingTableView layer](self->_tableView, "layer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCornerRadius:", a3);

}

- (void)viewDidLoad
{
  void *v3;
  _BOOL8 v4;
  MPAVClippingTableView *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  MPAVClippingTableView *v10;
  MPAVClippingTableView *tableView;
  void *v12;
  double continuousCornerRadius;
  void *v14;
  void *v15;
  unint64_t style;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)MPAVRoutingViewController;
  -[MPAVRoutingViewController viewDidLoad](&v21, sel_viewDidLoad);
  -[MPAVRoutingViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = self->_style == 1;
  v5 = [MPAVClippingTableView alloc];
  v6 = *MEMORY[0x1E0C9D648];
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v8 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v9 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v10 = -[MPAVClippingTableView initWithFrame:style:](v5, "initWithFrame:style:", v4, *MEMORY[0x1E0C9D648], v7, v8, v9);
  tableView = self->_tableView;
  self->_tableView = v10;

  -[MPAVClippingTableView setSeparatorInset:](self->_tableView, "setSeparatorInset:", 0.0, 10.0, 0.0, 10.0);
  -[MPAVClippingTableView setDataSource:](self->_tableView, "setDataSource:", self);
  -[MPAVClippingTableView setDelegate:](self->_tableView, "setDelegate:", self);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v6, v7, v8, v9);
  -[MPAVClippingTableView setTableFooterView:](self->_tableView, "setTableFooterView:", v12);

  continuousCornerRadius = self->_continuousCornerRadius;
  -[MPAVClippingTableView layer](self->_tableView, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setCornerRadius:", continuousCornerRadius);

  -[MPAVClippingTableView layer](self->_tableView, "layer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setMasksToBounds:", 1);

  -[MPAVRoutingViewController registerTableViewCells](self, "registerTableViewCells");
  objc_msgSend(v3, "addSubview:", self->_tableView);
  style = self->_style;
  if (style == 3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPAVRoutingViewController _setTableCellsContentColor:](self, "_setTableCellsContentColor:", v18);

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setBackgroundColor:", v19);

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPAVClippingTableView setBackgroundColor:](self->_tableView, "setBackgroundColor:", v20);

    -[MPAVClippingTableView setIndicatorStyle:](self->_tableView, "setIndicatorStyle:", 2);
    -[MPAVRoutingViewController setIconStyle:](self, "setIconStyle:", 1);
  }
  else if (!style)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setBackgroundColor:", v17);

  }
}

- (void)registerTableViewCells
{
  -[MPAVClippingTableView registerClass:forHeaderFooterViewReuseIdentifier:](self->_tableView, "registerClass:forHeaderFooterViewReuseIdentifier:", objc_opt_class(), CFSTR("_MPAVRoutingViewHeaderIdentifier"));
  -[MPAVClippingTableView registerClass:forCellReuseIdentifier:](self->_tableView, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("_MPAVRoutingViewCellIdentifier"));
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MPAVRoutingViewController;
  -[MPAVRoutingViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  self->_onScreen = 1;
  -[MPAVRoutingViewController _setNeedsRouteDiscoveryModeUpdate](self, "_setNeedsRouteDiscoveryModeUpdate");
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MPAVRoutingViewController;
  -[MPAVRoutingViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  if (self->_suspendedDiscoveryModeDueToApplicationState)
    self->_discoveryModeBeforeEnteringBackground = 3;
  else
    -[MPAVRoutingViewController _beginRouteDiscovery](self, "_beginRouteDiscovery");
  self->_updatesSincePresentation = 0;
  -[MPAVRoutingViewController _updateDisplayedRoutes](self, "_updateDisplayedRoutes");
}

- (void)viewDidDisappear:(BOOL)a3
{
  MPWeakTimer *updateTimer;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MPAVRoutingViewController;
  -[MPAVRoutingViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, a3);
  -[MPAVRoutingViewController _endRouteDiscovery](self, "_endRouteDiscovery");
  -[MPWeakTimer invalidate](self->_updateTimer, "invalidate");
  updateTimer = self->_updateTimer;
  self->_updateTimer = 0;

  self->_onScreen = 0;
  -[MPAVRoutingViewController _collapseAllGroups](self, "_collapseAllGroups");
  -[MPAVRoutingViewController _setNeedsRouteDiscoveryModeUpdate](self, "_setNeedsRouteDiscoveryModeUpdate");
  -[MPAVRoutingViewController resetDisplayedRoutes](self, "resetDisplayedRoutes");
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  MPWeakTimer *updateTimer;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MPAVRoutingViewController;
  -[MPAVRoutingViewController viewDidMoveToWindow:shouldAppearOrDisappear:](&v6, sel_viewDidMoveToWindow_shouldAppearOrDisappear_, a3, a4);
  if (!self->_onScreen)
  {
    -[MPAVRoutingViewController _endRouteDiscovery](self, "_endRouteDiscovery");
    -[MPWeakTimer invalidate](self->_updateTimer, "invalidate");
    updateTimer = self->_updateTimer;
    self->_updateTimer = 0;

    -[MPAVRoutingViewController _setNeedsRouteDiscoveryModeUpdate](self, "_setNeedsRouteDiscoveryModeUpdate");
  }
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MPAVRoutingViewController;
  -[MPAVRoutingViewController viewWillLayoutSubviews](&v12, sel_viewWillLayoutSubviews);
  -[MPAVRoutingViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;

  -[MPAVClippingTableView setFrame:](self->_tableView, "setFrame:", 0.0, 0.0, v5, v7);
  -[MPAVRoutingViewController traitCollection](self, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "preferredContentSizeCategory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[MPAVRoutingViewController shouldOverrideContentSizeCategory:](self, "shouldOverrideContentSizeCategory:", v9))
  {
    objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithPreferredContentSizeCategory:", *MEMORY[0x1E0DC48F8]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPAVRoutingViewController view](self, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_setLocalOverrideTraitCollection:", v10);

  }
  else
  {
    -[MPAVRoutingViewController view](self, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setLocalOverrideTraitCollection:", 0);
  }

}

- (BOOL)shouldOverrideContentSizeCategory:(id)a3
{
  NSString *v3;
  BOOL IsAccessibilityCategory;
  NSString *v5;

  v3 = (NSString *)a3;
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v3);
  v5 = (NSString *)*MEMORY[0x1E0DC48F0];

  return v5 == v3 || IsAccessibilityCategory;
}

- (CGSize)preferredContentSize
{
  void *v3;
  double v4;
  double v5;
  double v7;
  CGSize result;

  if (self->_tableView)
  {
    -[MPAVRoutingViewController view](self, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "layoutIfNeeded");

    -[MPAVClippingTableView layoutIfNeeded](self->_tableView, "layoutIfNeeded");
    -[MPAVRoutingViewController _tableViewHeightAccordingToDataSource](self, "_tableViewHeightAccordingToDataSource");
    v5 = 156.0;
    if (v4 >= 156.0 || self->_style != 2)
      v5 = v4;
  }
  else
  {
    v5 = 0.0;
  }
  v7 = 320.0;
  result.height = v5;
  result.width = v7;
  return result;
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
  double result;

  result = 24.0;
  if (!a4)
    return 0.0;
  return result;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6;
  void *v7;

  v6 = a3;
  if (a4 && -[MPAVRoutingViewController style](self, "style") == 3)
  {
    objc_msgSend(v6, "dequeueReusableHeaderFooterViewWithIdentifier:", CFSTR("_MPAVRoutingViewHeaderIdentifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  if (!a4)
    return 0;
  -[MPSectionedCollection sectionAtIndex:](self->_routingViewItems, "sectionAtIndex:", a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("_MPAVRoutingViewCellIdentifier"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPAVRoutingViewController _configureCell:forIndexPath:](self, "_configureCell:forIndexPath:", v7, v6);

  return v7;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  void *v6;
  id v7;

  v7 = a4;
  -[MPAVRoutingViewController themeDelegate](self, "themeDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "routingViewController:willDisplayCell:", self, v7);

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;
  NSObject *v12;
  void *v13;
  id WeakRetained;
  int v16;
  int v17;
  int v18;
  uint64_t v19;
  void *v20;
  _BOOL4 v21;
  _BOOL4 v22;
  NSObject *v23;
  void *v24;
  _BOOL4 v25;
  void *v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  BOOL v30;
  MPAVRoutingController *routingController;
  uint64_t v32;
  void *v33;
  _QWORD v34[6];
  _QWORD v35[4];
  id v36;
  MPAVRoutingViewController *v37;
  id v38;
  _BYTE *v39;
  uint64_t v40;
  _BYTE buf[24];
  BOOL v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v7, 1);
  -[MPSectionedCollection itemAtIndexPath:](self->_routingViewItems, "itemAtIndexPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "routes");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "mainRoute");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "type");
  if (v10 >= 2)
  {
    if (v10 != 2)
      goto LABEL_15;
    v12 = os_log_create("com.apple.amp.mediaplayer", "Routing");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v8, "actionIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v13;
      _os_log_impl(&dword_193B9B000, v12, OS_LOG_TYPE_DEFAULT, "RCS user selected: %{public}@", buf, 0xCu);

    }
    goto LABEL_14;
  }
  if (!self->_shouldPickRouteOnSelection || v9 == 0)
  {
    if (v9)
      goto LABEL_15;
    v12 = os_log_create("com.apple.amp.mediaplayer", "Routing");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_193B9B000, v12, OS_LOG_TYPE_ERROR, "RCS attempted to select a nil route, ignoring.", buf, 2u);
    }
    goto LABEL_14;
  }
  self->_hasUserSelections = 1;
  if (-[MPAVRoutingController routeIsPendingPick:](self->_routingController, "routeIsPendingPick:", v9))
    v16 = 0;
  else
    v16 = objc_msgSend(v9, "isPicked") ^ 1;
  v17 = -[MPAVRoutingController routeIsPendingPick:](self->_routingController, "routeIsPendingPick:", v9);
  if (v17)
    v17 = objc_msgSend(v9, "isPicked");
  v18 = v16 | v17;
  if (v18)
    v19 = 1;
  else
    v19 = 2;
  -[MPAVRoutingController pickedRoutes](self->_routingController, "pickedRoutes");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[MPAVRoutingViewController _wouldShareAudioForPickedRoute:operation:pickedRoutes:](self, "_wouldShareAudioForPickedRoute:operation:pickedRoutes:", v9, v19, v20);

  v22 = -[MPAVRoutingController supportsMultipleSelection](self->_routingController, "supportsMultipleSelection");
  if ((v18 & 1) == 0 && objc_msgSend(v9, "isDeviceSpeakerRoute"))
  {
    v12 = os_log_create("com.apple.amp.mediaplayer", "Routing");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_193B9B000, v12, OS_LOG_TYPE_DEFAULT, "RCS cannot remove device route", buf, 2u);
    }
LABEL_14:

    goto LABEL_15;
  }
  if (-[MPAVRoutingViewController isInVehicle](self, "isInVehicle") && v22 && v21)
  {
    v23 = os_log_create("com.apple.amp.mediaplayer", "Routing");
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      -[MPAVRoutingController pickedRoutes](self->_routingController, "pickedRoutes");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v9;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v24;
      _os_log_impl(&dword_193B9B000, v23, OS_LOG_TYPE_DEFAULT, "Can't share audio while in the Car. Route: %{public}@, picked: %{public}@", buf, 0x16u);

    }
    v25 = -[MPAVRoutingViewController isInCarPlay](self, "isInCarPlay");
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.MediaPlayer"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26;
    if (v25)
      v28 = CFSTR("ROUTING_VIEW_SHARE_AUDIO_DISABLED_CARPLAY_SAME_OWNER");
    else
      v28 = CFSTR("ROUTING_VIEW_SHARE_AUDIO_DISABLED_CARKIT_SAME_OWNER");
    objc_msgSend(v26, "localizedStringForKey:value:table:", v28, &stru_1E3163D10, CFSTR("MediaPlayer"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    -[MPAVRoutingViewController _diplayShareAudioDisabledAlertForReason:](self, "_diplayShareAudioDisabledAlertForReason:", v29);
LABEL_15:
    if (!v8)
      goto LABEL_19;
    goto LABEL_16;
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v42 = 0;
  v30 = -[MPAVRoutingViewController _operationRequiresOptimisticState:routes:](self, "_operationRequiresOptimisticState:routes:", v19, v33);
  routingController = self->_routingController;
  v32 = MEMORY[0x1E0C809B0];
  v42 = v30;
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __63__MPAVRoutingViewController_tableView_didSelectRowAtIndexPath___block_invoke;
  v35[3] = &unk_1E31570A8;
  v40 = v19;
  v36 = v33;
  v37 = self;
  v39 = buf;
  v38 = v9;
  -[MPAVRoutingController selectRoutes:operation:completion:](routingController, "selectRoutes:operation:completion:", v36, v19, v35);
  v34[0] = v32;
  v34[1] = 3221225472;
  v34[2] = __63__MPAVRoutingViewController_tableView_didSelectRowAtIndexPath___block_invoke_3;
  v34[3] = &unk_1E31570D0;
  v34[4] = self;
  v34[5] = buf;
  -[MPAVRoutingViewController _createUpdateWithCompletion:](self, "_createUpdateWithCompletion:", v34);

  _Block_object_dispose(buf, 8);
  if (!v8)
    goto LABEL_19;
LABEL_16:
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "routingViewController:didSelectRoutingViewItem:", self, v8);

LABEL_19:
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  void *v5;
  double v6;
  double v7;

  -[MPAVRoutingViewController _normalCellHeight](self, "_normalCellHeight", a3, a4);
  -[MPAVRoutingViewController traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayScale");
  UIRoundToScale();
  v7 = v6;

  return v7;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  void *v5;
  double v6;
  double v7;

  -[MPAVRoutingViewController _normalCellHeight](self, "_normalCellHeight", a3, a4);
  -[MPAVRoutingViewController traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayScale");
  UIRoundToScale();
  v7 = v6;

  return v7;
}

- (void)routingControllerAvailableRoutesDidChange:(id)a3
{
  unint64_t updatesSincePresentation;

  updatesSincePresentation = self->_updatesSincePresentation;
  self->_updatesSincePresentation = updatesSincePresentation + 1;
  if (updatesSincePresentation > 4)
    -[MPAVRoutingViewController _setNeedsDisplayedRoutesUpdate](self, "_setNeedsDisplayedRoutesUpdate", a3);
  else
    -[MPAVRoutingViewController _updateDisplayedRoutes](self, "_updateDisplayedRoutes", a3);
}

- (void)routingController:(id)a3 shouldHijackRoute:(id)a4 alertStyle:(int64_t)a5 busyRouteName:(id)a6 presentingAppName:(id)a7 completion:(id)a8
{
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  const __CFString *v27;
  int v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  id v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  id v43;
  id v45;
  id v46;
  id v47;
  _QWORD v48[4];
  id v49;
  _QWORD v50[4];
  id v51;

  v45 = a3;
  v13 = a4;
  v47 = a6;
  v46 = a7;
  v14 = a8;
  v15 = v14;
  if (a5)
  {
    if (a5 != 1)
    {
      v23 = 0;
      v32 = 0;
      v34 = 0;
      v19 = 0;
      goto LABEL_13;
    }
    v43 = v14;
    v16 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.MediaPlayer"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("ROUTING_SPEAKER_HIJACK_INTERRUPT_LOCAL_MULTITASK_TITLE"), &stru_1E3163D10, CFSTR("MediaPlayer"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", v18, v47);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.MediaPlayer"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("ROUTING_SPEAKER_HIJACK_INTERRUPT_LOCAL_MULTITASK_MESSAGE"), &stru_1E3163D10, CFSTR("MediaPlayer"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringWithFormat:", v22, v46, v47);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v43 = v14;
    v24 = objc_msgSend(v13, "isTVRoute");
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.MediaPlayer"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25;
    if (v24)
      v27 = CFSTR("ROUTING_SPEAKER_HIJACK_NAG_MULTITASK_TV_TITLE");
    else
      v27 = CFSTR("ROUTING_SPEAKER_HIJACK_NAG_MULTITASK_SPEAKER_TITLE");
    objc_msgSend(v25, "localizedStringForKey:value:table:", v27, &stru_1E3163D10, CFSTR("MediaPlayer"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = objc_msgSend(v13, "isTVRoute");
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.MediaPlayer"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v29;
    if (v28)
      v30 = CFSTR("ROUTING_SPEAKER_HIJACK_NAG_MULTITASK_TV_MESSAGE");
    else
      v30 = CFSTR("ROUTING_SPEAKER_HIJACK_NAG_MULTITASK_SPEAKER_MESSAGE");
    objc_msgSend(v29, "localizedStringForKey:value:table:", v30, &stru_1E3163D10, CFSTR("MediaPlayer"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.MediaPlayer"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("ROUTING_SPEAKER_HIJACK_NAG_CANCEL"), &stru_1E3163D10, CFSTR("MediaPlayer"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.MediaPlayer"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("ROUTING_SPEAKER_HIJACK_NAG_CONFIRM"), &stru_1E3163D10, CFSTR("MediaPlayer"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = v43;
LABEL_13:
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v19, v23, 1);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (void *)MEMORY[0x1E0DC3448];
  v37 = MEMORY[0x1E0C809B0];
  v50[0] = MEMORY[0x1E0C809B0];
  v50[1] = 3221225472;
  v50[2] = __119__MPAVRoutingViewController_routingController_shouldHijackRoute_alertStyle_busyRouteName_presentingAppName_completion___block_invoke;
  v50[3] = &unk_1E31570F8;
  v38 = v15;
  v51 = v38;
  objc_msgSend(v36, "actionWithTitle:style:handler:", v32, 1, v50);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "addAction:", v39);

  v40 = (void *)MEMORY[0x1E0DC3448];
  v48[0] = v37;
  v48[1] = 3221225472;
  v48[2] = __119__MPAVRoutingViewController_routingController_shouldHijackRoute_alertStyle_busyRouteName_presentingAppName_completion___block_invoke_2;
  v48[3] = &unk_1E31570F8;
  v49 = v38;
  v41 = v38;
  objc_msgSend(v40, "actionWithTitle:style:handler:", v34, 0, v48);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "addAction:", v42);

  -[MPAVRoutingViewController showViewController:sender:](self, "showViewController:sender:", v35, self);
}

- (void)routingCell:(id)a3 mirroringSwitchValueDidChange:(BOOL)a4
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("mirroring switches are no longer supported in MPAVRoutingViewController"));
}

- (void)routingCellDidTapToExpand:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[MPAVClippingTableView indexPathForCell:](self->_tableView, "indexPathForCell:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[MPSectionedCollection itemAtIndexPath:](self->_routingViewItems, "itemAtIndexPath:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "type") == 1)
  {
    objc_msgSend(v4, "mainRoute");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPAVRoutingViewController groupUIDForRoute:](self, "groupUIDForRoute:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMutableSet addObject:](self->_expandedGroupUIDs, "addObject:", v6);
    -[MPAVRoutingViewController enqueueRefreshUpdate](self, "enqueueRefreshUpdate");

  }
}

- (void)sessionDidConnect:(id)a3
{
  NSObject *v4;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v4 = os_log_create("com.apple.amp.mediaplayer", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5[0] = 67109120;
    v5[1] = -[MPAVRoutingViewController isInCarPlay](self, "isInCarPlay");
    _os_log_impl(&dword_193B9B000, v4, OS_LOG_TYPE_INFO, "CarPlay connected: %{BOOL}u", (uint8_t *)v5, 8u);
  }

  -[MPAVRoutingViewController enqueueRefreshUpdate](self, "enqueueRefreshUpdate");
}

- (void)sessionDidDisconnect:(id)a3
{
  NSObject *v4;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v4 = os_log_create("com.apple.amp.mediaplayer", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5[0] = 67109120;
    v5[1] = -[MPAVRoutingViewController isInCarPlay](self, "isInCarPlay");
    _os_log_impl(&dword_193B9B000, v4, OS_LOG_TYPE_INFO, "CarPlay connected: %{BOOL}u", (uint8_t *)v5, 8u);
  }

  -[MPAVRoutingViewController enqueueRefreshUpdate](self, "enqueueRefreshUpdate");
}

- (void)enqueueRefreshUpdate
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__MPAVRoutingViewController_enqueueRefreshUpdate__block_invoke;
  block[3] = &unk_1E3163508;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

- (void)setEndpointRoute:(id)a3
{
  MPAVEndpointRoute *v5;
  MPAVRoutingViewControllerUpdate *v6;
  MPAVEndpointRoute *v7;

  v5 = (MPAVEndpointRoute *)a3;
  if (self->_endpointRoute != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_endpointRoute, a3);
    -[NSMapTable removeAllObjects](self->_outputDeviceVolumeSliders, "removeAllObjects");
    v6 = objc_alloc_init(MPAVRoutingViewControllerUpdate);
    -[MPAVRoutingViewControllerUpdate setShouldReload:](v6, "setShouldReload:", 1);
    -[MPAVRoutingViewController _enqueueUpdate:](self, "_enqueueUpdate:", v6);

    v5 = v7;
  }

}

- (MPAVRoutingController)_routingController
{
  return self->_routingController;
}

- (double)_expandedCellHeight
{
  return 88.0;
}

- (double)_normalCellHeight
{
  return 52.0;
}

- (UIColor)_tableCellsBackgroundColor
{
  return self->_tableCellsBackgroundColor;
}

- (UIColor)_tableCellsContentColor
{
  return self->_tableCellsContentColor;
}

- (UITableView)_tableView
{
  return (UITableView *)self->_tableView;
}

- (void)_setShouldAutomaticallyUpdateRoutesList:(BOOL)a3
{
  self->_shouldAutomaticallyUpdateRoutesList = a3;
}

- (void)_setShouldPickRouteOnSelection:(BOOL)a3
{
  self->_shouldPickRouteOnSelection = a3;
}

- (void)_setTableCellsBackgroundColor:(id)a3
{
  UIColor *v5;
  void *v6;
  UIColor *v7;

  v5 = (UIColor *)a3;
  if (self->_tableCellsBackgroundColor != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_tableCellsBackgroundColor, a3);
    -[MPAVRoutingViewController _createReloadUpdate](self, "_createReloadUpdate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPAVRoutingViewController _enqueueUpdate:](self, "_enqueueUpdate:", v6);

    v5 = v7;
  }

}

- (void)_setTableCellsContentColor:(id)a3
{
  UIColor *v5;
  void *v6;
  UIColor *v7;

  v5 = (UIColor *)a3;
  if (self->_tableCellsContentColor != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_tableCellsContentColor, a3);
    -[MPAVRoutingViewController _createReloadUpdate](self, "_createReloadUpdate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPAVRoutingViewController _enqueueUpdate:](self, "_enqueueUpdate:", v6);

    v5 = v7;
  }

}

- (BOOL)_shouldAutomaticallyUpdateRoutesList
{
  return self->_shouldAutomaticallyUpdateRoutesList;
}

- (BOOL)_shouldPickRouteOnSelection
{
  return self->_shouldPickRouteOnSelection;
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
  if (a4 == 1
    && objc_msgSend(v8, "count") == 1
    && objc_msgSend(v7, "isShareableRoute")
    && objc_msgSend(v9, "isShareableRoute")
    && objc_msgSend(v7, "supportsGrouping"))
  {
    v10 = objc_msgSend(v9, "supportsGrouping");
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)_diplayShareAudioDisabledAlertForReason:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", 0, a3, 1);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0DC3448];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.MediaPlayer"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1E3163D10, CFSTR("MediaPlayer"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actionWithTitle:style:handler:", v6, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addAction:", v7);

  -[MPAVRoutingViewController showViewController:sender:](self, "showViewController:sender:", v8, self);
}

- (double)_tableViewHeightAccordingToDataSource
{
  double v3;
  double v4;
  double v5;
  double v6;
  unint64_t v7;
  double v8;
  double v9;
  double v10;

  -[MPAVRoutingViewController _tableViewHeaderViewHeight](self, "_tableViewHeaderViewHeight");
  v4 = v3;
  -[MPAVRoutingViewController _tableViewFooterViewHeight](self, "_tableViewFooterViewHeight");
  v6 = v5;
  v7 = -[NSArray count](self->_cachedDisplayAsPickedRoutes, "count");
  -[MPAVRoutingViewController _normalCellHeight](self, "_normalCellHeight");
  v9 = v8;
  v10 = 0.0;
  if (self->_style == 3)
    v10 = (double)(-[MPSectionedCollection numberOfSections](self->_routingViewItems, "numberOfSections", 0.0) - 1)
        * 24.0;
  return v6 + v9 * (double)v7 + v4 + v10;
}

- (void)_applicationDidEnterBackgroundNotification:(id)a3
{
  self->_suspendedDiscoveryModeDueToApplicationState = 1;
  self->_discoveryModeBeforeEnteringBackground = -[MPAVRoutingController discoveryMode](self->_routingController, "discoveryMode", a3);
  -[MPAVRoutingViewController _endRouteDiscovery](self, "_endRouteDiscovery");
}

- (void)_applicationWillEnterForegroundNotification:(id)a3
{
  if (self->_discoveryModeBeforeEnteringBackground)
    -[MPAVRoutingViewController _beginRouteDiscovery](self, "_beginRouteDiscovery", a3);
  self->_suspendedDiscoveryModeDueToApplicationState = 0;
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

- (void)_configureCell:(id)a3 forIndexPath:(id)a4
{
  id v6;
  NSArray *v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  unint64_t v23;
  int v24;
  _BOOL4 v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  uint64_t v31;
  MPSectionedCollection *routingViewItems;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  int v39;
  int v40;
  uint64_t v41;
  uint64_t j;
  uint64_t v43;
  uint64_t v44;
  _BOOL4 v45;
  _BOOL8 v46;
  NSMapTable *outputDeviceVolumeSliders;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  int v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  unsigned int v62;
  id v63;
  void *v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _BYTE v73[128];
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v63 = a4;
  objc_msgSend(v6, "setMirroringStyle:", self->_mirroringStyle);
  objc_msgSend(v6, "setIconStyle:", self->_iconStyle);
  objc_msgSend(v6, "setShouldHideSectionBottomSeparator:", 1);
  if (self->_tableCellsContentColor)
    objc_msgSend(v6, "setTintColor:");
  v64 = v6;
  v7 = self->_cachedDisplayableAvailableRoutes;
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  v8 = v7;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v69, v74, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v70;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v70 != v12)
          objc_enumerationMutation(v8);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v69 + 1) + 8 * i), "pickableRouteType"))
        {
          if (v11)
          {
            v11 = 2;
            goto LABEL_16;
          }
          v11 = 1;
        }
      }
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v69, v74, 16);
      if (v10)
        continue;
      break;
    }
  }
  else
  {
    v11 = 0;
  }
LABEL_16:
  v62 = v11;

  v14 = v64;
  objc_msgSend(v64, "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
    objc_msgSend(v64, "setDelegate:", self);
  v17 = *MEMORY[0x1E0DC49E8];
  v16 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
  v19 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
  v18 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  v20 = v63;
  -[MPSectionedCollection itemAtIndexPath:](self->_routingViewItems, "itemAtIndexPath:", v63);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "mainRoute");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = objc_msgSend(v21, "type");
  v23 = -[MPAVRoutingViewController style](self, "style");
  v24 = objc_msgSend(v22, "supportsGrouping");
  v25 = -[MPAVRoutingController supportsMultipleSelection](self->_routingController, "supportsMultipleSelection");
  if (v23 == 3)
    v26 = v24;
  else
    v26 = 0;
  v27 = v26 & v25;
  v28 = objc_msgSend(v63, "section");
  if (v28 < -[MPSectionedCollection numberOfSections](self->_routingViewItems, "numberOfSections"))
  {
    v29 = objc_msgSend(v63, "row");
    v30 = v29 == -[MPSectionedCollection numberOfItemsInSection:](self->_routingViewItems, "numberOfItemsInSection:", objc_msgSend(v63, "section"))- 1? 0: v27;
    if (v30 == 1)
    {
      v31 = objc_msgSend(v63, "row") + 1;
      routingViewItems = self->_routingViewItems;
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v31, objc_msgSend(v63, "section"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPSectionedCollection itemAtIndexPath:](routingViewItems, "itemAtIndexPath:", v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v34, "mainRoute");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v35, "supportsGrouping"))
      {
        v18 = 0.0;
        v16 = 69.0;
        v19 = 0.0;
        v17 = 0.0;
      }

    }
  }
  objc_msgSend(v64, "setSeparatorInset:", v17, v16, v19, v18);
  objc_msgSend(v64, "setTintColor:", self->_tableCellsContentColor);
  objc_msgSend(v64, "setUseSmartAudioCheckmarkStyle:", v27);
  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  objc_msgSend(v21, "routes");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v65, v73, 16);
  if (!v37)
  {

    LOBYTE(v40) = 0;
    LOBYTE(v39) = 0;
    goto LABEL_39;
  }
  v38 = v37;
  v59 = v22;
  v60 = v21;
  v39 = 0;
  v40 = 0;
  v41 = *(_QWORD *)v66;
  do
  {
    for (j = 0; j != v38; ++j)
    {
      if (*(_QWORD *)v66 != v41)
        objc_enumerationMutation(v36);
      v43 = *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * j);
      v39 |= -[NSArray containsObject:](self->_cachedPendingPickedRoutes, "containsObject:", v43, v59, v60);
      v40 |= -[NSArray containsObject:](self->_cachedDisplayAsPickedRoutes, "containsObject:", v43);
    }
    v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v65, v73, 16);
  }
  while (v38);

  if (v39 & 1 | ((v40 & 1) == 0))
  {
    v20 = v63;
    v14 = v64;
    v22 = v59;
    v21 = v60;
LABEL_39:
    v44 = 0;
    goto LABEL_41;
  }
  LOBYTE(v39) = 0;
  v44 = 3;
  v20 = v63;
  v14 = v64;
  v22 = v59;
  v21 = v60;
LABEL_41:
  objc_msgSend(v14, "setAccessoryType:", v44);
  objc_msgSend(v14, "setIsDisplayedAsPicked:", v40 & 1);
  objc_msgSend(v14, "setPendingSelection:", v39 & 1);
  v45 = -[NSArray containsObject:](self->_cachedVolumeCapableRoutes, "containsObject:", v22);
  v46 = v61 != 1 && v45;
  if (v46)
  {
    outputDeviceVolumeSliders = self->_outputDeviceVolumeSliders;
    objc_msgSend(v22, "routeUID");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable objectForKey:](outputDeviceVolumeSliders, "objectForKey:", v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "setVolumeSlider:", v49);
    objc_msgSend(v14, "volumeSlider");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "volumeController");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "updateVolumeValue");

    objc_msgSend(v14, "volumeSlider");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "updateVolume");

  }
  else
  {
    objc_msgSend(v14, "setVolumeSlider:", 0);
  }
  objc_msgSend(v14, "setShowingVolumeSlider:", v46);
  -[MPAVRoutingViewController endpointRoute](self, "endpointRoute");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "updateForEndpoint:routeItem:inferLocalizedModelName:", v53, v21, v62 < 2);

  if (self->_tableCellsBackgroundColor)
  {
    objc_msgSend(v14, "setBackgroundColor:");
  }
  else
  {
    -[MPAVRoutingViewController _tableView](self, "_tableView");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "backgroundColor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = objc_msgSend(v55, "isEqual:", v56);

    if (v57)
      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setBackgroundColor:", v58);

  }
}

- (void)_registerNotifications
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__applicationDidEnterBackgroundNotification_, *MEMORY[0x1E0DC4768], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__applicationWillEnterForegroundNotification_, *MEMORY[0x1E0DC4860], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__volumeSliderVolumeControlAvailabilityDidChangeNotification_, CFSTR("MPVolumeSliderVolumeControlAvailabilityDidChangeNotification"), 0);

}

- (void)_registerCarPlayObserver
{
  void *v3;
  objc_class *v4;
  CARSessionStatus *v5;
  CARSessionStatus *carPlayStatus;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2050000000;
  v3 = (void *)getCARSessionStatusClass_softClass_17506;
  v11 = getCARSessionStatusClass_softClass_17506;
  if (!getCARSessionStatusClass_softClass_17506)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __getCARSessionStatusClass_block_invoke_17507;
    v7[3] = &unk_1E31639A0;
    v7[4] = &v8;
    __getCARSessionStatusClass_block_invoke_17507((uint64_t)v7);
    v3 = (void *)v9[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v8, 8);
  v5 = (CARSessionStatus *)objc_alloc_init(v4);
  carPlayStatus = self->_carPlayStatus;
  self->_carPlayStatus = v5;

  -[CARSessionStatus addSessionObserver:](self->_carPlayStatus, "addSessionObserver:", self);
}

- (void)_unregisterNotifications
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0D4CDC0], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC4768], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC4860], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("MPVolumeSliderVolumeControlLabelDidChangeNotification"), 0);

}

- (void)_beginRouteDiscovery
{
  -[MPAVRoutingViewController _setRouteDiscoveryMode:](self, "_setRouteDiscoveryMode:", 3);
}

- (void)_endRouteDiscovery
{
  -[MPAVRoutingViewController _setRouteDiscoveryMode:](self, "_setRouteDiscoveryMode:", 0);
}

- (void)_setupUpdateTimerIfNecessary
{
  id v3;
  MPWeakTimer *v4;
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
    v4 = [MPWeakTimer alloc];
    v7 = MEMORY[0x1E0C809B0];
    v8 = 3221225472;
    v9 = __57__MPAVRoutingViewController__setupUpdateTimerIfNecessary__block_invoke;
    v10 = &unk_1E315E5D0;
    objc_copyWeak(&v11, &location);
    v5 = -[MPWeakTimer initWithInterval:queue:block:](v4, "initWithInterval:queue:block:", MEMORY[0x1E0C80D38], &v7, 2.0);
    updateTimer = self->_updateTimer;
    self->_updateTimer = v5;

    -[MPAVRoutingViewController _updateDisplayedRoutes](self, "_updateDisplayedRoutes", v7, v8, v9, v10);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);

  }
}

- (void)_setRouteDiscoveryMode:(int64_t)a3
{
  if (self->_routeDiscoveryMode != a3)
  {
    self->_routeDiscoveryMode = a3;
    -[MPAVRoutingViewController _setNeedsRouteDiscoveryModeUpdate](self, "_setNeedsRouteDiscoveryModeUpdate");
  }
}

- (void)_setNeedsRouteDiscoveryModeUpdate
{
  NSNumber *discoveryModeOverride;
  int64_t routeDiscoveryMode;

  if (self->_onScreen)
  {
    discoveryModeOverride = self->_discoveryModeOverride;
    if (discoveryModeOverride)
      routeDiscoveryMode = -[NSNumber integerValue](discoveryModeOverride, "integerValue");
    else
      routeDiscoveryMode = self->_routeDiscoveryMode;
  }
  else
  {
    routeDiscoveryMode = 0;
  }
  if (-[MPAVRoutingController discoveryMode](self->_routingController, "discoveryMode") != routeDiscoveryMode)
  {
    -[MPAVRoutingController setDiscoveryMode:](self->_routingController, "setDiscoveryMode:", routeDiscoveryMode);
    notify_post("com.apple.airplay.startlogging");
  }
}

- (void)_setNeedsDisplayedRoutesUpdate
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__MPAVRoutingViewController__setNeedsDisplayedRoutesUpdate__block_invoke;
  block[3] = &unk_1E3163508;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

- (void)_volumeSliderVolumeControlAvailabilityDidChangeNotification:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __89__MPAVRoutingViewController__volumeSliderVolumeControlAvailabilityDidChangeNotification___block_invoke;
  block[3] = &unk_1E3163508;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

- (id)_displayableRoutesInRoutes:(id)a3
{
  void *v4;
  BOOL v5;
  BOOL v6;
  _QWORD v8[6];
  BOOL v9;
  BOOL v10;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MPAVRoutingController supportsMultipleSelection](self->_routingController, "supportsMultipleSelection");
  v6 = -[MPAVRoutingController hasPendingPickedRoutes](self->_routingController, "hasPendingPickedRoutes");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __56__MPAVRoutingViewController__displayableRoutesInRoutes___block_invoke;
  v8[3] = &unk_1E3157130;
  v9 = v5;
  v10 = v6;
  v8[4] = self;
  v8[5] = 577;
  objc_msgSend(v4, "sortUsingComparator:", v8);
  return v4;
}

- (id)_displayAsPickedRoutesInRoutes:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (-[MPAVRoutingViewController _shouldDisplayRouteAsPicked:](self, "_shouldDisplayRouteAsPicked:", v11, (_QWORD)v13))
        {
          objc_msgSend(v5, "addObject:", v11);
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)_volumeCapableRoutesInRoutes:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSMapTable *outputDeviceVolumeSliders;
  void *v14;
  void *v15;
  void *v16;
  id v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[MPAVRoutingController pickedRoutes](self->_routingController, "pickedRoutes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 >= 2)
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v18 = v4;
    v7 = v4;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v21 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          outputDeviceVolumeSliders = self->_outputDeviceVolumeSliders;
          objc_msgSend(v12, "routeUID", v18);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMapTable objectForKey:](outputDeviceVolumeSliders, "objectForKey:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "volumeController");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v16, "isVolumeControlAvailable")
            && -[MPAVRoutingViewController _shouldDisplayRouteAsPicked:](self, "_shouldDisplayRouteAsPicked:", v12))
          {
            objc_msgSend(v19, "addObject:", v12);
          }

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v9);
    }

    v4 = v18;
  }

  return v19;
}

- (void)_createUpdateWithCompletion:(id)a3
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
  v7[2] = __57__MPAVRoutingViewController__createUpdateWithCompletion___block_invoke;
  v7[3] = &unk_1E3157158;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[MPAVRoutingController fetchAvailableRoutesWithCompletionHandler:](routingController, "fetchAvailableRoutesWithCompletionHandler:", v7);

}

- (void)_updateDisplayedRoutes
{
  _QWORD v2[5];

  if (self->_shouldAutomaticallyUpdateRoutesList)
  {
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __51__MPAVRoutingViewController__updateDisplayedRoutes__block_invoke;
    v2[3] = &unk_1E3157180;
    v2[4] = self;
    -[MPAVRoutingViewController _createUpdateWithCompletion:](self, "_createUpdateWithCompletion:", v2);
  }
}

- (void)setOptimisticUpdate:(id)a3
{
  id v5;
  MPAVRoutingViewControllerUpdate *optimisticUpdate;
  id v7;

  v5 = a3;
  v7 = v5;
  if (v5)
  {
    -[MPAVRoutingViewController _enqueueUpdate:](self, "_enqueueUpdate:", v5);
    objc_storeStrong((id *)&self->_optimisticUpdate, a3);
  }
  else
  {
    optimisticUpdate = self->_optimisticUpdate;
    self->_optimisticUpdate = 0;

    -[MPAVRoutingViewController _updateDisplayedRoutes](self, "_updateDisplayedRoutes");
  }

}

- (void)_enqueueUpdate:(id)a3
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  v6 = v5;
  if (!self->_optimisticUpdate)
  {
    v7 = v5;
    if (self->_isAnimatingUpdate)
      objc_storeStrong((id *)&self->_pendingUpdate, a3);
    else
      -[MPAVRoutingViewController _applyUpdate:](self, "_applyUpdate:", v5);
    v6 = v7;
  }

}

- (id)_createRefreshUpdate
{
  MPAVRoutingViewControllerUpdate *v3;

  v3 = objc_alloc_init(MPAVRoutingViewControllerUpdate);
  -[MPAVRoutingViewControllerUpdate setDisplayableAvailableRoutes:](v3, "setDisplayableAvailableRoutes:", self->_cachedDisplayableAvailableRoutes);
  -[MPAVRoutingViewControllerUpdate setPickedRoutes:](v3, "setPickedRoutes:", self->_cachedPickedRoutes);
  -[MPAVRoutingViewControllerUpdate setPendingPickedRoutes:](v3, "setPendingPickedRoutes:", self->_cachedPendingPickedRoutes);
  -[MPAVRoutingViewControllerUpdate setDisplayAsPickedRoutes:](v3, "setDisplayAsPickedRoutes:", self->_cachedDisplayAsPickedRoutes);
  -[MPAVRoutingViewControllerUpdate setVolumeCapableRoutes:](v3, "setVolumeCapableRoutes:", self->_cachedVolumeCapableRoutes);
  return v3;
}

- (id)_createReloadUpdate
{
  void *v2;

  -[MPAVRoutingViewController _createRefreshUpdate](self, "_createRefreshUpdate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setShouldReload:", 1);
  return v2;
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
    -[MPAVRoutingViewController endpointGroupUID](self, "endpointGroupUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableSet addObject:](expandedGroupUIDs, "addObject:", v6);

  }
}

- (void)_applyUpdate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void (**v13)(_QWORD);
  id v14;
  id v15;
  id v16;
  id v17;
  MPAVRoutingViewControllerUpdate *v18;
  void *v19;
  MPAVClippingTableView *tableView;
  id v21;
  id WeakRetained;
  char v23;
  id v24;
  void *v25;
  void *v26;
  _QWORD block[5];
  _QWORD v28[5];
  _QWORD v29[4];
  id v30;
  MPAVRoutingViewController *v31;
  void (**v32)(_QWORD);
  _QWORD v33[4];
  id v34;
  id v35;
  MPAVRoutingViewControllerUpdate *v36;
  MPAVRoutingViewController *v37;
  _QWORD v38[4];
  id v39;
  id v40;
  _QWORD v41[5];
  id v42;
  id v43;
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_tableView)
  {
    v5 = (void *)-[MPSectionedCollection copy](self->_routingViewItems, "copy");
    objc_msgSend(v4, "displayableAvailableRoutes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPAVRoutingViewController _createRoutingViewItemsForRoutes:](self, "_createRoutingViewItemsForRoutes:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "routeGrouping");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pickedRoutes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPAVRoutingViewController _createSectionedCollection:withPickedRoutes:](self, "_createSectionedCollection:withPickedRoutes:", v7, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __42__MPAVRoutingViewController__applyUpdate___block_invoke;
    v41[3] = &unk_1E315D848;
    v41[4] = self;
    v11 = v4;
    v42 = v11;
    v12 = v10;
    v43 = v12;
    v24 = v8;
    v44 = v24;
    v13 = (void (**)(_QWORD))MEMORY[0x19403A810](v41);
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __42__MPAVRoutingViewController__applyUpdate___block_invoke_2;
    v38[3] = &unk_1E315E5F8;
    v14 = v5;
    v39 = v14;
    v15 = v12;
    v40 = v15;
    v25 = (void *)MEMORY[0x19403A810](v38);
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __42__MPAVRoutingViewController__applyUpdate___block_invoke_3;
    v33[3] = &unk_1E31571A8;
    v16 = v14;
    v34 = v16;
    v17 = v15;
    v35 = v17;
    v18 = (MPAVRoutingViewControllerUpdate *)v11;
    v36 = v18;
    v37 = self;
    v26 = (void *)MEMORY[0x19403A810](v33);
    if (-[MPAVRoutingViewControllerUpdate shouldReload](v18, "shouldReload")
      || (objc_msgSend(v16, "changeDetailsToSectionedCollection:isEqualBlock:isUpdatedBlock:", v17, v25, v26),
          (v19 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      v13[2](v13);
      objc_storeStrong((id *)&self->_displayedEndpointRoute, self->_endpointRoute);
      if (-[MPAVRoutingViewControllerUpdate shouldReload](v18, "shouldReload"))
        -[MPAVClippingTableView reloadData](self->_tableView, "reloadData");
    }
    else
    {
      self->_isAnimatingUpdate = 1;
      tableView = self->_tableView;
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __42__MPAVRoutingViewController__applyUpdate___block_invoke_4;
      v29[3] = &unk_1E3161780;
      v32 = v13;
      v21 = v19;
      v30 = v21;
      v31 = self;
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __42__MPAVRoutingViewController__applyUpdate___block_invoke_6;
      v28[3] = &unk_1E31631D8;
      v28[4] = self;
      -[MPAVClippingTableView performBatchUpdates:completion:](tableView, "performBatchUpdates:completion:", v29, v28);

    }
    self->_needsDisplayedRoutesUpdate = 0;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v23 = objc_opt_respondsToSelector();

    if ((v23 & 1) != 0)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __42__MPAVRoutingViewController__applyUpdate___block_invoke_110;
      block[3] = &unk_1E3163508;
      block[4] = self;
      dispatch_async(MEMORY[0x1E0C80D38], block);
    }
    if (self->_pendingUpdate == v18)
    {
      self->_pendingUpdate = 0;

    }
  }

}

- (double)_tableViewHeaderViewHeight
{
  double result;

  result = 36.0;
  if (self->_style != 1)
    return 0.0;
  return result;
}

- (double)_tableViewFooterViewHeight
{
  double result;

  result = 36.0;
  if (self->_style != 1)
    return 0.0;
  return result;
}

- (BOOL)_shouldDisplayRouteAsPicked:(id)a3
{
  MPAVRoutingViewController *v3;
  MPAVRoutingController *routingController;
  id v5;

  v3 = self;
  routingController = self->_routingController;
  v5 = a3;
  -[MPAVRoutingController supportsMultipleSelection](routingController, "supportsMultipleSelection");
  -[MPAVRoutingController hasPendingPickedRoutes](v3->_routingController, "hasPendingPickedRoutes");
  LOBYTE(v3) = objc_msgSend(v5, "isDisplayedAsPicked");

  return (char)v3;
}

- (id)_createVolumeSlider
{
  return 0;
}

- (void)_endUpdates
{
  id v2;

  -[MPAVRoutingViewController _routingController](self, "_routingController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDelegate:", 0);

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

- (id)_createRoutingViewItemsForRoutes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  int v36;
  id v37;
  id v38;
  void *v39;
  char v40;
  uint64_t v41;
  int v42;
  void *v43;
  uint64_t v44;
  char v45;
  void *v46;
  char v47;
  void *v48;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  id obj;
  id obja;
  void *v62;
  void *v63;
  MPAVRoutingViewController *v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _QWORD v69[4];
  id v70;
  id v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  _BYTE v76[128];
  _BYTE v77[128];
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v63 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v62 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v53 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  MRAVEndpointGetLocalEndpoint();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v6, "outputDeviceUIDs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D4C4E8], "localDeviceUID");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = v6;
  objc_msgSend(v6, "outputDevices");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "uid");
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  v51 = v4;
  v11 = (void *)objc_msgSend(v4, "mutableCopy");
  v64 = self;
  if (-[MPAVRoutingViewController shouldGroupRoutingViewItems](self, "shouldGroupRoutingViewItems"))
  {
    obj = v11;
    v74 = 0u;
    v75 = 0u;
    v72 = 0u;
    v73 = 0u;
    v12 = v4;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v72, v77, 16);
    if (!v13)
      goto LABEL_24;
    v14 = v13;
    v15 = *(_QWORD *)v73;
    while (1)
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v73 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * v16);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v17, "isDeviceSpeakerRoute") & 1) == 0)
        {
          v18 = v17;
          -[MPAVRoutingViewController groupUIDForRoute:](v64, "groupUIDForRoute:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "routeUID");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "isEqualToString:", v52);

          if (v21)
          {
            v22 = v5;
            v23 = v18;
            v24 = v55;
            goto LABEL_15;
          }
          if (objc_msgSend(v18, "isGroupLeader") && v19 && v19 != v55)
          {
            v22 = v5;
            v23 = v18;
            v24 = v19;
LABEL_15:
            objc_msgSend(v22, "setObject:forKeyedSubscript:", v23, v24);
          }
          else if (v19)
          {
            objc_msgSend(v59, "objectForKeyedSubscript:", v19);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v25)
            {
              v25 = (void *)objc_opt_new();
              objc_msgSend(v59, "setObject:forKeyedSubscript:", v25, v19);
            }
            objc_msgSend(v25, "addObject:", v18);

          }
        }
        ++v16;
      }
      while (v14 != v16);
      v26 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v72, v77, 16);
      v14 = v26;
      if (!v26)
      {
LABEL_24:

        v69[0] = MEMORY[0x1E0C809B0];
        v69[1] = 3221225472;
        v69[2] = __62__MPAVRoutingViewController__createRoutingViewItemsForRoutes___block_invoke;
        v69[3] = &unk_1E31571F8;
        v70 = v5;
        v11 = obj;
        v71 = obj;
        objc_msgSend(v59, "enumerateKeysAndObjectsUsingBlock:", v69);

        break;
      }
    }
  }
  v58 = v5;
  v54 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  obja = v11;
  v27 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v65, v76, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v66;
    v56 = *(_QWORD *)v66;
    do
    {
      for (i = 0; i != v28; ++i)
      {
        if (*(_QWORD *)v66 != v29)
          objc_enumerationMutation(obja);
        v31 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * i);
        +[MPAVRoutingViewItem itemWithRoute:](MPAVRoutingViewItem, "itemWithRoute:", v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_41;
        v33 = v31;
        -[MPAVRoutingViewController groupUIDForRoute:](v64, "groupUIDForRoute:", v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "routeUID");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v57, "containsObject:", v35);

        if (v36)
        {
          v37 = v55;

          v34 = v37;
        }
        objc_msgSend(v58, "objectForKeyedSubscript:", v34);
        v38 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "objectForKeyedSubscript:", v34);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = -[NSMutableSet containsObject:](v64->_expandedGroupUIDs, "containsObject:", v34);
        v41 = objc_msgSend(v39, "count");
        v42 = 1;
        if (v34 && v41)
        {
          objc_msgSend(v39, "arrayByAddingObject:", v38);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "setObject:forKeyedSubscript:", v43, v34);

          if ((v40 & 1) != 0)
          {
            v42 = 1;
          }
          else if (v33 == v38)
          {
            +[MPAVRoutingViewItem itemWithLeader:members:](MPAVRoutingViewItem, "itemWithLeader:members:", v33, v39);
            v44 = objc_claimAutoreleasedReturnValue();

            v42 = 1;
            v32 = (void *)v44;
          }
          else
          {
            v42 = 0;
          }
        }

        v29 = v56;
        if (v42)
        {
LABEL_41:
          v45 = objc_msgSend(v31, "isDeviceSpeakerRoute");
          v46 = v63;
          if ((v45 & 1) == 0)
          {
            v47 = objc_msgSend(v31, "isShareableRoute");
            v46 = v62;
            if ((v47 & 1) == 0)
            {
              if (objc_msgSend(v31, "isHeadphonesRoute"))
                v46 = v62;
              else
                v46 = v53;
            }
          }
          objc_msgSend(v46, "addObject:", v32);
        }

      }
      v28 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v65, v76, 16);
    }
    while (v28);
  }

  v48 = (void *)objc_opt_new();
  objc_msgSend(v48, "setRouteGrouping:", v54);
  objc_msgSend(v48, "setHeadphones:", v62);
  objc_msgSend(v48, "setLocalDevices:", v63);
  objc_msgSend(v48, "setSpeakersAndTVs:", v53);

  return v48;
}

- (void)_collapseAllGroups
{
  -[NSMutableSet removeAllObjects](self->_expandedGroupUIDs, "removeAllObjects");
}

- (id)_createSectionedCollection:(id)a3 withPickedRoutes:(id)a4
{
  id v6;
  id v7;
  MPMutableSectionedCollection *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(MPMutableSectionedCollection);
  objc_msgSend(v7, "localDevices");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "headphones");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "speakersAndTVs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "count"))
  {
    -[MPMutableSectionedCollection appendSection:](v8, "appendSection:", CFSTR("LOCAL DEVICES"));
    -[MPMutableSectionedCollection appendItems:](v8, "appendItems:", v9);
  }
  if (objc_msgSend(v10, "count") || _MPAVRoutingViewControllerRoutesContainsSplitterCapableRoute(v6))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.MediaPlayer"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("ROUTING_VIEW_HEADER_HEADPHONES"), &stru_1E3163D10, CFSTR("MediaPlayer"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPMutableSectionedCollection appendSection:](v8, "appendSection:", v13);

    -[MPMutableSectionedCollection appendItems:](v8, "appendItems:", v10);
    -[MPAVRoutingViewController endpointRoute](self, "endpointRoute");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v14, "isSplitRoute") & 1) != 0)
    {

      goto LABEL_15;
    }
    v15 = _MPAVRoutingViewControllerRoutesContainsSplitterCapableRoute(v6);

    if (v15)
    {
      v16 = -[MPAVRoutingViewController isInVehicle](self, "isInVehicle") ^ 1;
      if (-[MPAVRoutingViewController isInCarPlay](self, "isInCarPlay"))
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.MediaPlayer"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v17;
        v19 = CFSTR("ROUTING_VIEW_SHARE_AUDIO_DISABLED_CARPLAY");
      }
      else
      {
        if (!-[MPAVRoutingViewController hasCarKitRoute](self, "hasCarKitRoute"))
        {
          v20 = 0;
          goto LABEL_14;
        }
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.MediaPlayer"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v17;
        v19 = CFSTR("ROUTING_VIEW_SHARE_AUDIO_DISABLED_CARKIT");
      }
      objc_msgSend(v17, "localizedStringForKey:value:table:", v19, &stru_1E3163D10, CFSTR("MediaPlayer"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_14:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.MediaPlayer"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("ROUTING_VIEW_SHARE_AUDIO"), &stru_1E3163D10, CFSTR("MediaPlayer"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      +[MPAVRoutingViewItem itemWithActionTitle:subtitle:enabled:identifier:image:](MPAVRoutingViewItem, "itemWithActionTitle:subtitle:enabled:identifier:image:", v22, v20, v16, CFSTR("Share Audio"), 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      v28[0] = v23;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPMutableSectionedCollection appendItems:](v8, "appendItems:", v24);

    }
  }
LABEL_15:
  if (objc_msgSend(v11, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.MediaPlayer"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("ROUTING_VIEW_HEADER_SPEAKERS_AND_TVS"), &stru_1E3163D10, CFSTR("MediaPlayer"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPMutableSectionedCollection appendSection:](v8, "appendSection:", v26);

    -[MPMutableSectionedCollection appendItems:](v8, "appendItems:", v11);
  }

  return v8;
}

- (id)_stateDumpObject
{
  uint64_t v3;
  void *v4;
  MPAVRoute *displayedEndpointRoute;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  MPSectionedCollection *routingViewItems;
  void *v11;
  _QWORD v13[6];
  _QWORD v14[7];

  v14[6] = *MEMORY[0x1E0C80C00];
  v13[0] = CFSTR("style");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_style);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  displayedEndpointRoute = self->_displayedEndpointRoute;
  if (!displayedEndpointRoute)
    displayedEndpointRoute = (MPAVRoute *)CFSTR("<NONE>");
  v14[0] = v3;
  v14[1] = displayedEndpointRoute;
  v13[1] = CFSTR("displayedEndpointRoute");
  v13[2] = CFSTR("routeDiscoveryMode");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_routeDiscoveryMode);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v6;
  v13[3] = CFSTR("onScreen");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_onScreen);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[3] = v7;
  v13[4] = CFSTR("inCarPlay");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MPAVRoutingViewController isInCarPlay](self, "isInCarPlay"));
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  v13[5] = CFSTR("routingViewItems");
  routingViewItems = self->_routingViewItems;
  if (!routingViewItems)
    routingViewItems = (MPSectionedCollection *)CFSTR("<NONE>");
  v14[4] = v8;
  v14[5] = routingViewItems;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)shouldGroupRoutingViewItems
{
  return 0;
}

- (unint64_t)style
{
  return self->_style;
}

- (MPAVRoutingViewControllerDelegate)delegate
{
  return (MPAVRoutingViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)avItemType
{
  return self->_avItemType;
}

- (unint64_t)mirroringStyle
{
  return self->_mirroringStyle;
}

- (unint64_t)iconStyle
{
  return self->_iconStyle;
}

- (NSNumber)discoveryModeOverride
{
  return self->_discoveryModeOverride;
}

- (MPAVRoutingViewControllerThemeDelegate)themeDelegate
{
  return (MPAVRoutingViewControllerThemeDelegate *)objc_loadWeakRetained((id *)&self->_themeDelegate);
}

- (void)setThemeDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_themeDelegate, a3);
}

- (MPAVEndpointRoute)endpointRoute
{
  return self->_endpointRoute;
}

- (double)_continuousCornerRadius
{
  return self->_continuousCornerRadius;
}

- (NSMapTable)outputDeviceVolumeSliders
{
  return self->_outputDeviceVolumeSliders;
}

- (void)setOutputDeviceVolumeSliders:(id)a3
{
  objc_storeStrong((id *)&self->_outputDeviceVolumeSliders, a3);
}

- (MPVolumeGroupSliderCoordinator)groupSliderCoordinator
{
  return self->_groupSliderCoordinator;
}

- (BOOL)sortByIsVideoRoute
{
  return self->_sortByIsVideoRoute;
}

- (void)setSortByIsVideoRoute:(BOOL)a3
{
  self->_sortByIsVideoRoute = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupSliderCoordinator, 0);
  objc_storeStrong((id *)&self->_outputDeviceVolumeSliders, 0);
  objc_storeStrong((id *)&self->_endpointRoute, 0);
  objc_destroyWeak((id *)&self->_themeDelegate);
  objc_storeStrong((id *)&self->_discoveryModeOverride, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_carPlayStatus, 0);
  objc_storeStrong((id *)&self->_tableCellsContentColor, 0);
  objc_storeStrong((id *)&self->_tableCellsBackgroundColor, 0);
  objc_storeStrong((id *)&self->_routingController, 0);
  objc_storeStrong((id *)&self->_updateTimer, 0);
  objc_storeStrong((id *)&self->_expandedGroupUIDs, 0);
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
  objc_storeStrong((id *)&self->_tableView, 0);
}

void __62__MPAVRoutingViewController__createRoutingViewItemsForRoutes___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(v5, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v12);

  }
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    v9 = 0;
    do
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", v9);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)v10;
      if (!v8 || v8 == (void *)v10)
      {
        ++v9;
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 40), "removeObject:", v10);
        objc_msgSend(*(id *)(a1 + 40), "insertObject:atIndex:", v11, ++v9 + objc_msgSend(*(id *)(a1 + 40), "indexOfObject:", v8));
      }

    }
    while (objc_msgSend(v5, "count") > v9);
  }

}

uint64_t __42__MPAVRoutingViewController__applyUpdate___block_invoke(id *a1)
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

  objc_msgSend(a1[5], "displayableAvailableRoutes");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = a1[4];
  v4 = (void *)v3[128];
  v3[128] = v2;

  objc_msgSend(a1[5], "pickedRoutes");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = a1[4];
  v7 = (void *)v6[127];
  v6[127] = v5;

  objc_msgSend(a1[5], "pendingPickedRoutes");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = a1[4];
  v10 = (void *)v9[129];
  v9[129] = v8;

  objc_msgSend(a1[5], "displayAsPickedRoutes");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = a1[4];
  v13 = (void *)v12[130];
  v12[130] = v11;

  objc_msgSend(a1[5], "volumeCapableRoutes");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = a1[4];
  v16 = (void *)v15[131];
  v15[131] = v14;

  objc_storeStrong((id *)a1[4] + 126, a1[6]);
  objc_storeStrong((id *)a1[4] + 132, a1[7]);
  return objc_msgSend(a1[4], "updateExpandedGroups");
}

uint64_t __42__MPAVRoutingViewController__applyUpdate___block_invoke_2(uint64_t a1, void *a2, void *a3)
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

uint64_t __42__MPAVRoutingViewController__applyUpdate___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  int v30;
  int v31;
  int v32;
  int v33;
  int v34;
  int v35;
  int v36;
  int v37;
  int v38;
  int v39;
  int v40;
  int v41;
  int v42;
  int v43;

  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v5, "length") != 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "itemAtIndexPath:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "itemAtIndexPath:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "mainRoute");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "mainRoute");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v8, "type");
    if (v12 == objc_msgSend(v9, "type"))
    {
      v13 = objc_msgSend(v8, "type");
      if (v13 == 2)
      {
        v7 = objc_msgSend(v8, "isEqual:", v9) ^ 1;
LABEL_10:

        goto LABEL_11;
      }
      if (v13 <= 1)
      {
        objc_msgSend(*(id *)(a1 + 48), "displayAsPickedRoutes");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "containsObject:", v11);
        v42 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 1040), "containsObject:", v11);

        objc_msgSend(*(id *)(a1 + 48), "pickedRoutes");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = objc_msgSend(v16, "containsObject:", v11);
        v38 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 1016), "containsObject:", v11);

        objc_msgSend(*(id *)(a1 + 48), "pendingPickedRoutes");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v17, "containsObject:", v11);
        v34 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 1032), "containsObject:", v11);

        objc_msgSend(*(id *)(a1 + 48), "volumeCapableRoutes");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "containsObject:", v11);
        v32 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 1048), "containsObject:", v11);

        objc_msgSend(v10, "batteryLevel");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "batteryLevel");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (v20 == v21)
        {
          v35 = 0;
        }
        else
        {
          objc_msgSend(v10, "batteryLevel");
          v30 = v19;
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "batteryLevel");
          v31 = v15;
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = objc_msgSend(v22, "isEqual:", v23) ^ 1;

          v15 = v31;
          v19 = v30;
        }
        v33 = v19 ^ v32;
        v43 = v15 ^ v42;
        v41 = v40 ^ v38;
        v39 = v36 ^ v34;

        objc_msgSend(v10, "routeName");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "routeName");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (v25 == v26)
        {
          v29 = v33;
        }
        else
        {
          objc_msgSend(v10, "routeName");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "routeName");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = objc_msgSend(v27, "isEqual:", v28) ^ 1;

          v29 = v37 | v33;
        }

        v7 = v43 | v41 | v39 | v35 | v29;
        goto LABEL_10;
      }
    }
    v7 = 0;
    goto LABEL_10;
  }
  v7 = 0;
LABEL_11:

  return v7;
}

void __42__MPAVRoutingViewController__applyUpdate___block_invoke_4(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[5];

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "deletedSections");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (v3)
  {
    v4 = *(void **)(*(_QWORD *)(a1 + 40) + 968);
    objc_msgSend(*(id *)(a1 + 32), "deletedSections");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deleteSections:withRowAnimation:", v5, 0);

  }
  objc_msgSend(*(id *)(a1 + 32), "insertedSections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    v8 = *(void **)(*(_QWORD *)(a1 + 40) + 968);
    objc_msgSend(*(id *)(a1 + 32), "insertedSections");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "insertSections:withRowAnimation:", v9, 0);

  }
  objc_msgSend(*(id *)(a1 + 32), "deletedItemIndexPaths");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v11)
  {
    v12 = *(void **)(*(_QWORD *)(a1 + 40) + 968);
    objc_msgSend(*(id *)(a1 + 32), "deletedItemIndexPaths");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "deleteRowsAtIndexPaths:withRowAnimation:", v13, 0);

  }
  objc_msgSend(*(id *)(a1 + 32), "insertedItemIndexPaths");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");

  if (v15)
  {
    v16 = *(void **)(*(_QWORD *)(a1 + 40) + 968);
    objc_msgSend(*(id *)(a1 + 32), "insertedItemIndexPaths");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "insertRowsAtIndexPaths:withRowAnimation:", v17, 0);

  }
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __42__MPAVRoutingViewController__applyUpdate___block_invoke_5;
  v24[3] = &unk_1E31571D0;
  v18 = *(void **)(a1 + 32);
  v24[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v18, "enumerateItemMovesUsingBlock:", v24);
  objc_msgSend(*(id *)(a1 + 32), "updatedItemIndexPaths");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "count");

  if (v20)
  {
    v21 = *(void **)(a1 + 32);
    v22 = *(void **)(*(_QWORD *)(a1 + 40) + 968);
    objc_msgSend(v21, "updatedItemIndexPaths");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "reloadRowsAtIndexPaths:withRowAnimation:", v23, 0);

  }
}

void __42__MPAVRoutingViewController__applyUpdate___block_invoke_6(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__MPAVRoutingViewController__applyUpdate___block_invoke_7;
  block[3] = &unk_1E3163508;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __42__MPAVRoutingViewController__applyUpdate___block_invoke_110(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1168));
  objc_msgSend(WeakRetained, "routingViewControllerDidUpdateContents:", *(_QWORD *)(a1 + 32));

}

_QWORD *__42__MPAVRoutingViewController__applyUpdate___block_invoke_7(uint64_t a1)
{
  _QWORD *result;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 992) = 0;
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 1000), *(id *)(*(_QWORD *)(a1 + 32) + 1216));
  result = *(_QWORD **)(a1 + 32);
  if (result[122])
    return (_QWORD *)objc_msgSend(result, "_applyUpdate:");
  return result;
}

uint64_t __42__MPAVRoutingViewController__applyUpdate___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "moveRowAtIndexPath:toIndexPath:", a2, a3);
}

uint64_t __51__MPAVRoutingViewController__updateDisplayedRoutes__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_enqueueUpdate:", a2);
}

void __57__MPAVRoutingViewController__createUpdateWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  MPAVRoutingViewControllerUpdate *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int *v14;
  int *v15;
  uint64_t i;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  MPVolumeControllerRouteDataSource *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  id v33;
  id v34;
  void *v35;
  uint64_t v36;
  MPAVRoutingViewControllerUpdate *v37;
  void *v38;
  id obj;
  int v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_alloc_init(MPAVRoutingViewControllerUpdate);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1080), "pickedRoutes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  -[MPAVRoutingViewControllerUpdate setPickedRoutes:](v4, "setPickedRoutes:", v6);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1080), "pendingPickedRoutes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPAVRoutingViewControllerUpdate setPendingPickedRoutes:](v4, "setPendingPickedRoutes:", v8);

  objc_msgSend(*(id *)(a1 + 32), "_displayableRoutesInRoutes:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPAVRoutingViewControllerUpdate setDisplayableAvailableRoutes:](v4, "setDisplayableAvailableRoutes:", v9);

  v38 = v3;
  objc_msgSend(*(id *)(a1 + 32), "_displayAsPickedRoutesInRoutes:", v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPAVRoutingViewControllerUpdate setDisplayAsPickedRoutes:](v4, "setDisplayAsPickedRoutes:", v10);

  -[MPAVRoutingViewControllerUpdate setCanGroup:](v4, "setCanGroup:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1080), "supportsMultipleSelection"));
  -[MPAVRoutingViewControllerUpdate setHasPendingPickedRoutes:](v4, "setHasPendingPickedRoutes:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1080), "hasPendingPickedRoutes"));
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v37 = v4;
  -[MPAVRoutingViewControllerUpdate displayAsPickedRoutes](v4, "displayAsPickedRoutes");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v42;
    v14 = &OBJC_IVAR___MPModelLibraryAlbumAppDataChangeRequestOperation__request;
    v15 = &OBJC_IVAR___MPModelLibraryAlbumAppDataChangeRequestOperation__request;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v42 != v13)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
        v40 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + v14[726]), "containsObject:", v17);
        v18 = v15[703];
        v19 = *(void **)(*(_QWORD *)(a1 + 32) + v18);
        objc_msgSend(v17, "routeUID");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "objectForKey:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v21)
        {
          objc_msgSend(*(id *)(a1 + 32), "_createVolumeSlider");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = -[MPVolumeControllerRouteDataSource initWithGroupRoute:outputDeviceRoute:]([MPVolumeControllerRouteDataSource alloc], "initWithGroupRoute:outputDeviceRoute:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1216), v17);
          objc_msgSend(v21, "volumeController");
          v23 = a1;
          v24 = v12;
          v25 = v13;
          v26 = v14;
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "setDataSource:", v22);

          v14 = v26;
          v13 = v25;
          v12 = v24;
          a1 = v23;
          v15 = &OBJC_IVAR___MPModelLibraryAlbumAppDataChangeRequestOperation__request;

          v28 = *(void **)(*(_QWORD *)(a1 + 32) + v18);
          objc_msgSend(v17, "routeUID");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "setObject:forKey:", v21, v29);

        }
        v30 = *(void **)(*(_QWORD *)(a1 + 32) + 1240);
        if (v40)
          objc_msgSend(v30, "addIndividualVolumeSlider:", v21);
        else
          objc_msgSend(v30, "removeIndividualVolumeSlider:", v21);

      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    }
    while (v12);
  }

  objc_msgSend(*(id *)(a1 + 32), "_volumeCapableRoutesInRoutes:", v38);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPAVRoutingViewControllerUpdate setVolumeCapableRoutes:](v37, "setVolumeCapableRoutes:", v31);

  v32 = *(_QWORD *)(a1 + 32);
  v33 = *(id *)(v32 + 1000);
  v34 = *(id *)(v32 + 1216);
  v35 = v34;
  if (v34 == v33)
    v36 = 0;
  else
    v36 = objc_msgSend(v34, "isEqual:", v33) ^ 1;

  -[MPAVRoutingViewControllerUpdate setShouldReload:](v37, "setShouldReload:", v36);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __56__MPAVRoutingViewController__displayableRoutesInRoutes___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  void *v12;
  void *v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v28;
  int v29;
  int v30;
  int v31;
  int v32;
  int v33;
  int v34;
  int v35;
  int v36;
  int v37;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v7 + 1126))
  {
LABEL_11:
    objc_msgSend(*(id *)(v7 + 1080), "dataSource");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v12, "routeIsLeaderOfEndpoint:", v5);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1080), "dataSource");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v13, "routeIsLeaderOfEndpoint:", v6);

    v33 = objc_msgSend(v5, "supportsGrouping");
    v32 = objc_msgSend(v6, "supportsGrouping");
    v14 = objc_msgSend(v5, "isHomePodRoute");
    v15 = objc_msgSend(v6, "isHomePodRoute");
    v36 = objc_msgSend(v5, "isW1Route");
    v35 = objc_msgSend(v6, "isW1Route");
    v37 = objc_msgSend(v5, "isH1Route");
    v16 = objc_msgSend(v6, "isH1Route");
    v17 = objc_msgSend(v5, "isDisplayedAsPicked");
    v18 = objc_msgSend(v6, "isDisplayedAsPicked");
    if ((objc_msgSend(v5, "isAppleTVRoute") & 1) != 0 || (objc_msgSend(v5, "isTVRoute") & 1) != 0)
      v34 = 1;
    else
      v34 = objc_msgSend(v5, "containsDeviceWithSubtype:", 18);
    v30 = v15;
    v31 = v14;
    if ((objc_msgSend(v6, "isAppleTVRoute") & 1) != 0 || (objc_msgSend(v6, "isTVRoute") & 1) != 0)
      v19 = 1;
    else
      v19 = objc_msgSend(v6, "containsDeviceWithSubtype:", 18);
    v20 = objc_msgSend(v5, "supportsGrouping");
    v21 = objc_msgSend(v6, "supportsGrouping");
    if ((objc_msgSend(*(id *)(a1 + 32), "sortByIsVideoRoute") & 1) != 0)
      v22 = 0;
    else
      v22 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1080), "representsLongFormVideoContent") ^ 1;
    if (!objc_msgSend(v5, "pickableRouteType") && objc_msgSend(v6, "pickableRouteType"))
      goto LABEL_43;
    if (objc_msgSend(v6, "pickableRouteType") || !objc_msgSend(v5, "pickableRouteType"))
    {
      if ((v17 ^ 1 | v18) != 1)
        goto LABEL_43;
      if ((v18 ^ 1 | v17) != 1)
        goto LABEL_45;
      if ((v37 ^ 1 | v16) != 1)
        goto LABEL_43;
      if ((v16 ^ 1 | v37) != 1)
        goto LABEL_45;
      if ((v36 ^ 1 | v35) != 1)
        goto LABEL_43;
      if ((v35 ^ 1 | v36) != 1)
        goto LABEL_45;
      if ((v22 | v21 & v19 | v20 & v34 ^ 1) != 1)
        goto LABEL_43;
      if ((v22 | v20 & v34 | v21 & v19 ^ 1) != 1)
        goto LABEL_45;
      if ((v33 ^ 1 | v32) != 1)
        goto LABEL_43;
      if ((v32 ^ 1 | v33) != 1)
        goto LABEL_45;
      if ((v22 | v19 | v34 ^ 1) != 1)
        goto LABEL_43;
      if ((v22 | v34 | v19 ^ 1) != 1)
        goto LABEL_45;
      if ((v31 ^ 1 | v30) != 1)
        goto LABEL_43;
      if ((v30 ^ 1 | v31) != 1)
        goto LABEL_45;
      if ((v29 ^ 1 | v28) != 1)
      {
LABEL_43:
        v10 = -1;
        goto LABEL_46;
      }
      if ((v28 ^ 1 | v29) == 1)
      {
        objc_msgSend(v5, "routeName");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "routeName");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v23, "compare:options:", v24, *(_QWORD *)(a1 + 40));

        if (!v10)
        {
          objc_msgSend(v5, "routeUID");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "routeUID");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v25, "compare:options:", v26, *(_QWORD *)(a1 + 40));

        }
        goto LABEL_46;
      }
    }
LABEL_45:
    v10 = 1;
    goto LABEL_46;
  }
  v8 = objc_msgSend(*(id *)(v7 + 1024), "indexOfObject:", v5);
  v9 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1024), "indexOfObject:", v6);
  if (v8 < v9)
    v10 = -1;
  else
    v10 = 1;
  if (v8 == 0x7FFFFFFFFFFFFFFFLL || v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = *(_QWORD *)(a1 + 32);
    goto LABEL_11;
  }
LABEL_46:

  return v10;
}

uint64_t __89__MPAVRoutingViewController__volumeSliderVolumeControlAvailabilityDidChangeNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateDisplayedRoutes");
}

uint64_t __59__MPAVRoutingViewController__setNeedsDisplayedRoutesUpdate__block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1121) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "_setupUpdateTimerIfNecessary");
}

void __57__MPAVRoutingViewController__setupUpdateTimerIfNecessary__block_invoke(uint64_t a1)
{
  _BYTE *WeakRetained;
  _BYTE *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && WeakRetained[1121])
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_updateDisplayedRoutes");
    WeakRetained = v2;
  }

}

void __49__MPAVRoutingViewController_enqueueRefreshUpdate__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "_createRefreshUpdate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_enqueueUpdate:", v2);

}

uint64_t __119__MPAVRoutingViewController_routingController_shouldHijackRoute_alertStyle_busyRouteName_presentingAppName_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __119__MPAVRoutingViewController_routingController_shouldHijackRoute_alertStyle_busyRouteName_presentingAppName_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __63__MPAVRoutingViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  id v9;

  v3 = a2;
  if (*(_QWORD *)(a1 + 64) == 1 && (unint64_t)objc_msgSend(*(id *)(a1 + 32), "count") >= 2)
  {
    v4 = *(_QWORD **)(a1 + 40);
    v5 = (void *)v4[133];
    objc_msgSend(v4, "endpointGroupUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObject:", v6);

  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
  objc_msgSend(*(id *)(a1 + 40), "setOptimisticUpdate:", 0);
  if (!v3)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __63__MPAVRoutingViewController_tableView_didSelectRowAtIndexPath___block_invoke_2;
    v8[3] = &unk_1E31635F8;
    v7 = *(void **)(a1 + 48);
    v8[4] = *(_QWORD *)(a1 + 40);
    v9 = v7;
    dispatch_async(MEMORY[0x1E0C80D38], v8);

  }
}

void __63__MPAVRoutingViewController_tableView_didSelectRowAtIndexPath___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  _QWORD block[5];
  id v8;
  uint64_t v9;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__MPAVRoutingViewController_tableView_didSelectRowAtIndexPath___block_invoke_4;
  block[3] = &unk_1E31635A8;
  v5 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v8 = v3;
  v9 = v4;
  block[4] = v5;
  v6 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __63__MPAVRoutingViewController_tableView_didSelectRowAtIndexPath___block_invoke_4(uint64_t result)
{
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 24))
    return objc_msgSend(*(id *)(result + 32), "setOptimisticUpdate:", *(_QWORD *)(result + 40));
  return result;
}

void __63__MPAVRoutingViewController_tableView_didSelectRowAtIndexPath___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1168));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "routingViewController:didPickRoute:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __62__MPAVRoutingViewController__initWithStyle_routingController___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained[135], "clearCachedRoutes");
    objc_msgSend(v2, "_setNeedsDisplayedRoutesUpdate");
    WeakRetained = v2;
  }

}

@end
