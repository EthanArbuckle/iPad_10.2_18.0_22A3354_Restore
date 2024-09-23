@implementation MediaControlsEndpointsViewController

- (MediaControlsEndpointsViewController)init
{
  MediaControlsEndpointsViewController *v2;
  MediaControlsEndpointsViewController *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MediaControlsEndpointsViewController;
  v2 = -[MediaControlsCollectionViewController init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[MediaControlsEndpointsViewController setShouldPresentUsingViewService:](v2, "setShouldPresentUsingViewService:", 1);
    -[MediaControlsEndpointsViewController setDisplayMode:](v3, "setDisplayMode:", 1);
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[MediaControlsCollectionViewController setDelegate:](self, "setDelegate:", 0);
  -[MediaControlsEndpointsManager setDelegate:](self->_endpointsManager, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)MediaControlsEndpointsViewController;
  -[MediaControlsEndpointsViewController dealloc](&v3, sel_dealloc);
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MediaControlsEndpointsViewController;
  -[MediaControlsCollectionViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[MediaControlsCollectionViewController setDataSource:](self, "setDataSource:", self);
  -[MediaControlsCollectionViewController setDelegate:](self, "setDelegate:", self);
  -[MediaControlsEndpointsViewController reloadData](self, "reloadData");
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)MediaControlsEndpointsViewController;
  -[MediaControlsCollectionViewController viewWillAppear:](&v15, sel_viewWillAppear_, a3);
  -[MediaControlsEndpointsViewController setDismissing:](self, "setDismissing:", 0);
  -[MediaControlsEndpointsViewController setOnScreen:](self, "setOnScreen:", 1);
  -[MediaControlsEndpointsViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[MediaControlsEndpointsViewController configuration](self, "configuration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "style");

    if (v7)
    {
      -[MediaControlsEndpointsViewController configuration](self, "configuration");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "presentingAppBundleID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.Music"));

      if (v10)
      {
        v11 = 2;
      }
      else
      {
        -[MediaControlsEndpointsViewController configuration](self, "configuration");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "presentingAppBundleID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("com.apple.springboard"));

        if (v14)
          v11 = 4;
        else
          v11 = 3;
      }
    }
    else
    {
      v11 = 0;
    }
    +[MediaControlsAnalytics postAnalyticKind:](MediaControlsAnalytics, "postAnalyticKind:", v11);
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)MediaControlsEndpointsViewController;
  -[MediaControlsCollectionViewController viewWillDisappear:](&v5, sel_viewWillDisappear_);
  -[MPAVRoutingViewController viewWillDisappear:](self->_routingViewController, "viewWillDisappear:", v3);
  -[MediaControlsEndpointsViewController setDismissing:](self, "setDismissing:", 1);
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)MediaControlsEndpointsViewController;
  -[MediaControlsCollectionViewController viewDidDisappear:](&v6, sel_viewDidDisappear_);
  -[MediaControlsEndpointsViewController stopPrewarming](self, "stopPrewarming");
  -[MediaControlsEndpointsViewController setDismissing:](self, "setDismissing:", 0);
  -[MediaControlsEndpointsViewController setOnScreen:](self, "setOnScreen:", 0);
  -[MediaControlsEndpointsViewController routingViewController](self, "routingViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewDidDisappear:", v3);

}

- (void)viewDidLayoutSubviews
{
  objc_super v2;

  if (self->_configuration)
  {
    v2.receiver = self;
    v2.super_class = (Class)MediaControlsEndpointsViewController;
    -[MediaControlsCollectionViewController viewDidLayoutSubviews](&v2, sel_viewDidLayoutSubviews);
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setConfiguration:(id)a3
{
  MPMediaControlsConfiguration **p_configuration;
  void *v6;
  id v7;

  p_configuration = &self->_configuration;
  v7 = a3;
  if ((-[MPMediaControlsConfiguration isEqual:](*p_configuration, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_configuration, a3);
    -[MPMediaControlsConfiguration routingContextUID](*p_configuration, "routingContextUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MediaControlsEndpointsViewController setRoutingContextUID:](self, "setRoutingContextUID:", v6);

    -[MediaControlsEndpointsViewController _setupEndpointsManager](self, "_setupEndpointsManager");
    -[MediaControlsEndpointsViewController _setupRoutingViewController](self, "_setupRoutingViewController");
  }

}

- (void)setSelectedRoute:(id)a3
{
  -[MediaControlsEndpointsViewController _setSelectedRoute:isUserSelected:animated:](self, "_setSelectedRoute:isUserSelected:animated:", a3, 0, 1);
}

- (void)startPrewarming
{
  self->_prewarming = 1;
  -[MediaControlsEndpointsViewController _updateDiscoveryMode](self, "_updateDiscoveryMode");
}

- (void)stopPrewarming
{
  self->_prewarming = 0;
  -[MediaControlsEndpointsViewController _updateDiscoveryMode](self, "_updateDiscoveryMode");
}

- (void)setRoutingCornerViewTappedBlock:(id)a3
{
  void *v4;
  id routingCornerViewTappedBlock;
  id v6;

  if (self->_routingCornerViewTappedBlock != a3)
  {
    v4 = _Block_copy(a3);
    routingCornerViewTappedBlock = self->_routingCornerViewTappedBlock;
    self->_routingCornerViewTappedBlock = v4;

    -[MediaControlsCollectionViewController viewControllerForSelectedItem](self, "viewControllerForSelectedItem");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setRoutingCornerViewTappedBlock:", self->_routingCornerViewTappedBlock);

  }
}

- (double)preferredExpandedContentHeight
{
  void *v2;
  void *v3;
  double Height;
  CGRect v6;

  -[MediaControlsEndpointsViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  Height = CGRectGetHeight(v6);

  return Height;
}

- (BOOL)providesOwnPlatter
{
  return 1;
}

- (BOOL)canDismissPresentedContent
{
  void *v2;
  BOOL v3;

  -[MediaControlsEndpointsViewController presentedViewController](self, "presentedViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)dismissPresentedContentAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  void (**homeGestureDismissalAllowedBlock)(id, _QWORD);
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  v9 = a4;
  homeGestureDismissalAllowedBlock = (void (**)(id, _QWORD))self->_homeGestureDismissalAllowedBlock;
  if (homeGestureDismissalAllowedBlock)
    homeGestureDismissalAllowedBlock[2](homeGestureDismissalAllowedBlock, 0);
  -[MediaControlsEndpointsViewController presentedViewController](self, "presentedViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "presentedViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dismissViewControllerAnimated:completion:", v4, 0);

  objc_msgSend(v7, "dismissViewControllerAnimated:completion:", v4, v9);
}

- (BOOL)shouldPerformHoverInteraction
{
  return 0;
}

- (BOOL)shouldExpandModuleOnTouch:(id)a3
{
  return objc_msgSend(a3, "_isPointerTouch");
}

- (void)platterViewController:(id)a3 didToggleRoutingPicker:(BOOL)a4
{
  MPAVRoutingViewController *routingViewController;

  routingViewController = self->_routingViewController;
  if (a4)
    -[MPAVRoutingViewController setDiscoveryModeOverride:](routingViewController, "setDiscoveryModeOverride:", &unk_1E58781F0);
  else
    -[MPAVRoutingViewController resetDisplayedRoutes](routingViewController, "resetDisplayedRoutes", a3);
}

- (void)platterViewController:(id)a3 willToggleRoutingPicker:(BOOL)a4
{
  if (a4)
    -[MPAVRoutingViewController resetScrollPosition](self->_routingViewController, "resetScrollPosition", a3);
}

- (BOOL)shouldPresentUsingViewServicePlatterViewController:(id)a3
{
  return self->_shouldPresentUsingViewService;
}

- (void)platterViewController:(id)a3 homeGestureDismisalAllowedDidChange:(BOOL)a4
{
  void (**homeGestureDismissalAllowedBlock)(id, BOOL);

  homeGestureDismissalAllowedBlock = (void (**)(id, BOOL))self->_homeGestureDismissalAllowedBlock;
  if (homeGestureDismissalAllowedBlock)
    homeGestureDismissalAllowedBlock[2](homeGestureDismissalAllowedBlock, a4);
}

- (void)platterViewController:(id)a3 didPickRoute:(id)a4
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;

  v12 = a3;
  v5 = -[MPMediaControlsConfiguration style](self->_configuration, "style");
  if (v5 == 4)
  {
    -[MediaControlsCollectionViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
    objc_msgSend(MEMORY[0x1E0D48560], "sharedAVSystemController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MediaControlsEndpointsViewController configuration](self, "configuration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "presentingAppBundleID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAttribute:forKey:error:", v8, *MEMORY[0x1E0D47E88], 0);

  }
  else if (v5 == 1)
  {
    -[MediaControlsCollectionViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  }
  objc_msgSend(v12, "endpointController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "route");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "isDeviceRoute"))
    v11 = 7;
  else
    v11 = 8;
  +[MediaControlsAnalytics postAnalyticKind:](MediaControlsAnalytics, "postAnalyticKind:", v11);

}

- (void)dismissPlatterViewController:(id)a3 completion:(id)a4
{
  -[MediaControlsCollectionViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, a4);
}

- (void)setRoutingContextUID:(id)a3
{
  NSString *v4;
  NSString *routingContextUID;
  id v6;

  v6 = a3;
  if (!-[NSString isEqualToString:](self->_routingContextUID, "isEqualToString:"))
  {
    v4 = (NSString *)objc_msgSend(v6, "copy");
    routingContextUID = self->_routingContextUID;
    self->_routingContextUID = v4;

    if (self->_routingContextUID)
      -[MPAVOutputDeviceRoutingDataSource setRoutingContextUID:](self->_outputDeviceRoutingDataSource, "setRoutingContextUID:");
  }

}

- (void)setOnScreen:(BOOL)a3
{
  if (self->_onScreen != a3)
  {
    self->_onScreen = a3;
    -[MediaControlsEndpointsViewController _updateDiscoveryMode](self, "_updateDiscoveryMode");
  }
}

- (AVExternalPlaybackMonitor)externalPlaybackMonitor
{
  AVExternalPlaybackMonitor *externalPlaybackMonitor;
  AVExternalPlaybackMonitor *v4;
  AVExternalPlaybackMonitor *v5;

  externalPlaybackMonitor = self->_externalPlaybackMonitor;
  if (!externalPlaybackMonitor)
  {
    objc_msgSend(MEMORY[0x1E0C8B1C0], "longFormVideoExternalPlaybackMonitor");
    v4 = (AVExternalPlaybackMonitor *)objc_claimAutoreleasedReturnValue();
    v5 = self->_externalPlaybackMonitor;
    self->_externalPlaybackMonitor = v4;

    externalPlaybackMonitor = self->_externalPlaybackMonitor;
  }
  return externalPlaybackMonitor;
}

- (void)updateContentInsets
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  id v12;
  objc_super v13;
  objc_super v14;

  -[MediaControlsEndpointsViewController configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "style");

  if (v4)
  {
    v13.receiver = self;
    v13.super_class = (Class)MediaControlsEndpointsViewController;
    -[MediaControlsCollectionViewController updateContentInsets](&v13, sel_updateContentInsets);
  }
  else if (-[MediaControlsCollectionViewController displayMode](self, "displayMode") == 1
         && (objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice"),
             v5 = (void *)objc_claimAutoreleasedReturnValue(),
             v6 = objc_msgSend(v5, "userInterfaceIdiom"),
             v5,
             v6 == 1))
  {
    CCUIExpandedModuleEdgeInsets();
    v8 = v7;
    CCUIExpandedModuleEdgeInsets();
    v10 = v9;
    -[MediaControlsCollectionViewController scrollView](self, "scrollView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAlwaysBounceVertical:", 1);

    -[MediaControlsCollectionViewController scrollView](self, "scrollView");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setContentInset:", v8, 0.0, v10, 0.0);

  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)MediaControlsEndpointsViewController;
    -[MediaControlsCollectionViewController updateContentInsets](&v14, sel_updateContentInsets);
  }
}

- (void)setDisplayMode:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MediaControlsEndpointsViewController;
  -[MediaControlsCollectionViewController setDisplayMode:](&v10, sel_setDisplayMode_);
  -[MediaControlsEndpointsViewController _updateDiscoveryMode](self, "_updateDiscoveryMode");
  if (a3 == 1)
  {
    -[MediaControlsEndpointsViewController configuration](self, "configuration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "style");

    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "bundleIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.springboard"));

      if (v9)
        +[MediaControlsAnalytics postAnalyticKind:](MediaControlsAnalytics, "postAnalyticKind:", 1);
    }
  }
}

- (void)reloadData
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MediaControlsEndpointsViewController;
  -[MediaControlsCollectionViewController reloadData](&v3, sel_reloadData);
  -[MediaControlsEndpointsViewController _transitionToVisibleIfNeeded](self, "_transitionToVisibleIfNeeded");
}

- (void)_transitionToVisible:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  void (**v6)(_QWORD);
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  dispatch_time_t v13;
  _QWORD block[4];
  void (**v15)(_QWORD);
  id v16;
  id location;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD aBlock[5];
  BOOL v23;
  _BYTE v24[128];
  uint64_t v25;

  v3 = a3;
  v25 = *MEMORY[0x1E0C80C00];
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __61__MediaControlsEndpointsViewController__transitionToVisible___block_invoke;
  aBlock[3] = &unk_1E5818D00;
  aBlock[4] = self;
  v23 = a3;
  v6 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (-[MediaControlsEndpointsViewController _isReadyForAppearanceTransition](self, "_isReadyForAppearanceTransition")
    || !v3)
  {
    v6[2](v6);
  }
  else
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    -[MediaControlsCollectionViewController visibleViewControllers](self, "visibleViewControllers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v19;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v19 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v11), "view");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setHidden:", 1);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
      }
      while (v9);
    }

    self->_shouldTransitionToVisibleWhenReady = 1;
    objc_initWeak(&location, self);
    v13 = dispatch_time(0, 2000000000);
    block[0] = v5;
    block[1] = 3221225472;
    block[2] = __61__MediaControlsEndpointsViewController__transitionToVisible___block_invoke_2;
    block[3] = &unk_1E5819478;
    objc_copyWeak(&v16, &location);
    v15 = v6;
    dispatch_after(v13, MEMORY[0x1E0C80D38], block);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

}

id __61__MediaControlsEndpointsViewController__transitionToVisible___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  objc_super v10;
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
  objc_msgSend(*(id *)(a1 + 32), "visibleViewControllers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v6), "view");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setHidden:", 0);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1211) = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1212) = *(_BYTE *)(a1 + 40);
  v8 = *(unsigned __int8 *)(a1 + 40);
  v10.receiver = *(id *)(a1 + 32);
  v10.super_class = (Class)MediaControlsEndpointsViewController;
  return objc_msgSendSuper2(&v10, sel__transitionToVisible_, v8);
}

void __61__MediaControlsEndpointsViewController__transitionToVisible___block_invoke_2(uint64_t a1)
{
  _BYTE *WeakRetained;
  _BYTE *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && WeakRetained[1211])
  {
    v3 = WeakRetained;
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    WeakRetained = v3;
  }

}

- (double)preferredItemHeight
{
  double result;

  CCUIDefaultExpandedContentModuleWidth();
  -[MediaControlsEndpointsViewController preferredItemHeightGivenWidth:](self, "preferredItemHeightGivenWidth:");
  return result;
}

- (double)preferredItemHeightGivenWidth:(double)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  unint64_t v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;

  -[MediaControlsEndpointsViewController traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayScale");

  UIRoundToScale();
  v7 = v6;
  UIRoundToScale();
  v9 = v8;
  UIRoundToScale();
  v11 = v10;
  UIRoundToScale();
  v13 = v12;
  v14 = -[MPMediaControlsConfiguration style](self->_configuration, "style");
  if (v14 > 6)
    return 0.0;
  if (((1 << v14) & 0x2F) != 0)
    return v11 + v7 + v9 + v13;
  -[MediaControlsEndpointsManager routes](self->_endpointsManager, "routes");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[MediaControlsCollectionViewController viewControllerForItemAtIndex:](self, "viewControllerForItemAtIndex:", objc_msgSend(v16, "indexOfObject:", self->_selectedRoute));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v17, "style") == 5)
  {
    if (v17)
    {
      objc_msgSend(v17, "effectiveHeaderView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "sizeThatFits:", a3, 1.79769313e308);
      v9 = v19;

    }
    else
    {
      UIRoundToScale();
      v9 = v20;
    }
    UIRoundToScale();
    v11 = v21;
    UIRoundToScale();
    v13 = v22;
  }
  v15 = v11 + v7 + v9 + v13;

  return v15;
}

- (int64_t)numberOfItemsInCollectionViewController:(id)a3
{
  void *v3;
  int64_t v4;

  -[MediaControlsEndpointsManager routes](self->_endpointsManager, "routes", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (id)mediaControlsCollectionViewController:(id)a3 viewControllerForItemAtIndex:(int64_t)a4
{
  void *v5;
  MRPlatterViewController *v6;
  void *v8;
  int v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  MRPlatterViewController *v13;
  MRPlatterViewController *v14;
  uint8_t v15[16];
  uint8_t buf[16];

  objc_msgSend(a3, "dequeueReusableViewControllerForItemAtIndex:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    switch(-[MPMediaControlsConfiguration style](self->_configuration, "style"))
    {
      case 0:
      case 1:
      case 2:
      case 3:
      case 5:
        v6 = -[MRPlatterViewController initWithNibName:bundle:]([MRPlatterViewController alloc], "initWithNibName:bundle:", 0, 0);
        goto LABEL_4;
      case 4:
        v6 = -[MRPlatterViewController initWithStyle:]([MRPlatterViewController alloc], "initWithStyle:", 5);
LABEL_4:
        v5 = v6;
        return v5;
      case 6:
        -[MediaControlsEndpointsViewController externalPlaybackMonitor](self, "externalPlaybackMonitor");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "isAirPlayVideoActive");

        MCLogCategoryRouting();
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
        if (v9)
        {
          if (v11)
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1AA991000, v10, OS_LOG_TYPE_DEFAULT, "Present local transport control picker because AirPlay video is active", buf, 2u);
          }

          v12 = (void *)-[MPMediaControlsConfiguration copy](self->_configuration, "copy");
          objc_msgSend(v12, "setStyle:", 5);
          objc_msgSend(v12, "setInitatorStyle:", 6);
          -[MediaControlsEndpointsViewController setConfiguration:](self, "setConfiguration:", v12);
          v13 = -[MRPlatterViewController initWithNibName:bundle:]([MRPlatterViewController alloc], "initWithNibName:bundle:", 0, 0);
        }
        else
        {
          if (v11)
          {
            *(_WORD *)v15 = 0;
            _os_log_impl(&dword_1AA991000, v10, OS_LOG_TYPE_DEFAULT, "Present video picker because because AirPlay video is inactive", v15, 2u);
          }

          v12 = (void *)-[MPMediaControlsConfiguration copy](self->_configuration, "copy");
          objc_msgSend(v12, "setStyle:", 4);
          objc_msgSend(v12, "setInitatorStyle:", 6);
          -[MediaControlsEndpointsViewController setConfiguration:](self, "setConfiguration:", v12);
          v13 = -[MRPlatterViewController initWithStyle:]([MRPlatterViewController alloc], "initWithStyle:", 5);
        }
        v14 = v13;

        return v14;
      default:
        return 0;
    }
  }
  return v5;
}

- (int64_t)defaultSelectedItemIndexForCollectionViewController:(id)a3
{
  void *v4;
  int64_t v5;
  void *v6;
  uint64_t v7;

  -[MediaControlsEndpointsManager routes](self->_endpointsManager, "routes", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "indexOfObject:", self->_selectedRoute);

  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[MediaControlsEndpointsManager routes](self->_endpointsManager, "routes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v7)
      return 0;
    else
      return 0x7FFFFFFFFFFFFFFFLL;
  }
  return v5;
}

- (void)mediaControlsCollectionViewController:(id)a3 willDisplayViewController:(id)a4 forItemAtIndex:(int64_t)a5
{
  void *v7;
  unint64_t v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a4;
  -[MediaControlsEndpointsViewController configuration](self, "configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "style");
  if (v8 > 8)
    v9 = CFSTR("MediaControls-<Unknown>");
  else
    v9 = off_1E5819530[v8];
  objc_msgSend(v15, "setLabel:", v9);

  -[MediaControlsEndpointsViewController routingCornerViewTappedBlock](self, "routingCornerViewTappedBlock");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setRoutingCornerViewTappedBlock:", v10);

  -[MediaControlsEndpointsManager routes](self->_endpointsManager, "routes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[MediaControlsEndpointsManager routes](self->_endpointsManager, "routes");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndex:", a5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[MediaControlsEndpointsManager endpointControllerForRoute:](self->_endpointsManager, "endpointControllerForRoute:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setAllowsAutomaticResponseLoading:", 1);
    objc_msgSend(v15, "setEndpointController:", v14);

  }
  objc_msgSend(v15, "setDelegate:", self);
  if (-[MediaControlsCollectionViewController selectedItemIndex](self, "selectedItemIndex") == a5)
  {
    -[MediaControlsEndpointsViewController _assignRouteViewControllerToSelectedPanelViewController](self, "_assignRouteViewControllerToSelectedPanelViewController");
    -[MediaControlsEndpointsViewController _updateSupportedModesForSelectedPlatterViewController](self, "_updateSupportedModesForSelectedPlatterViewController");
  }

}

- (void)mediaControlsCollectionViewController:(id)a3 didDisplayViewController:(id)a4 forItemAtIndex:(int64_t)a5
{
  id v6;

  objc_msgSend(a4, "view", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHidden:", self->_shouldTransitionToVisibleWhenReady);

}

- (void)mediaControlsCollectionViewController:(id)a3 didEndDisplayingViewController:(id)a4 forItemAtIndex:(int64_t)a5
{
  void *v7;
  id v8;

  v8 = a4;
  if (-[MediaControlsCollectionViewController selectedItemIndex](self, "selectedItemIndex") == a5)
    self->_lastSelectedModeForActivePlatterViewController = objc_msgSend(v8, "selectedMode");
  objc_msgSend(v8, "endpointController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAllowsAutomaticResponseLoading:", 0);

}

- (BOOL)mediaControlsCollectionViewController:(id)a3 canSelectItemAtIndex:(int64_t)a4
{
  uint64_t v6;
  int AppBooleanValue;
  BOOL v8;
  void *v10;
  void *v11;
  void *v12;
  void (**v13)(_QWORD, _QWORD);

  v6 = -[MPMediaControlsConfiguration style](self->_configuration, "style", a3);
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("WHADoNotExpandOnSelection"), CFSTR("com.apple.Music"), 0);
  if (v6)
    v8 = AppBooleanValue == 0;
  else
    v8 = 1;
  if (v8)
  {
    if (a4 != 0x7FFFFFFFFFFFFFFFLL)
      return 1;
  }
  else
  {
    -[MediaControlsEndpointsManager routes](self->_endpointsManager, "routes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndex:", a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CC2318], "setActiveRoute:reason:completion:", v11, CFSTR("Analytics: User selected"), 0);
  }
  -[MediaControlsCollectionViewController dismissalBlock](self, "dismissalBlock");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[MediaControlsCollectionViewController dismissalBlock](self, "dismissalBlock");
    v13 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v13[2](v13, 0);

  }
  else
  {
    -[MediaControlsCollectionViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  }
  return 0;
}

- (void)mediaControlsCollectionViewController:(id)a3 willSelectItemAtIndex:(int64_t)a4 withReason:(int64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  id v16;
  id v17;
  NSObject *v18;
  _QWORD v19[4];
  id v20;
  NSObject *v21;
  id v22;
  _QWORD block[4];
  id v24;
  id v25[2];
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (a4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[MediaControlsEndpointsManager routes](self->_endpointsManager, "routes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndex:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[MediaControlsEndpointsManager endpointControllerForRoute:](self->_endpointsManager, "endpointControllerForRoute:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!a5)
    {
      MCLogCategoryRouting();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v10, "routeName");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v27 = v13;
        _os_log_impl(&dword_1AA991000, v12, OS_LOG_TYPE_DEFAULT, "User selected platter: %{public}@", buf, 0xCu);

      }
      +[MediaControlsAnalytics postAnalyticKind:](MediaControlsAnalytics, "postAnalyticKind:", 6);
    }
    -[MediaControlsEndpointsViewController _setSelectedRoute:isUserSelected:animated:](self, "_setSelectedRoute:isUserSelected:animated:", v10, a5 == 0, a5 == 0);
    objc_initWeak((id *)buf, self);
    v14 = dispatch_group_create();
    dispatch_group_enter(v14);
    v15 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __111__MediaControlsEndpointsViewController_mediaControlsCollectionViewController_willSelectItemAtIndex_withReason___block_invoke;
    block[3] = &unk_1E58194A0;
    objc_copyWeak(v25, (id *)buf);
    v16 = v10;
    v24 = v16;
    v25[1] = (id)a5;
    dispatch_group_notify(v14, MEMORY[0x1E0C80D38], block);
    v19[0] = v15;
    v19[1] = 3221225472;
    v19[2] = __111__MediaControlsEndpointsViewController_mediaControlsCollectionViewController_willSelectItemAtIndex_withReason___block_invoke_2;
    v19[3] = &unk_1E58191B0;
    objc_copyWeak(&v22, (id *)buf);
    v17 = v16;
    v20 = v17;
    v18 = v14;
    v21 = v18;
    objc_msgSend(v11, "connectAllowingAuthenticationWithCompletion:", v19);

    objc_destroyWeak(&v22);
    objc_destroyWeak(v25);

    objc_destroyWeak((id *)buf);
  }

}

void __111__MediaControlsEndpointsViewController_mediaControlsCollectionViewController_willSelectItemAtIndex_withReason___block_invoke(uint64_t a1)
{
  void *v2;
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (objc_msgSend(WeakRetained[157], "isEqual:", *(_QWORD *)(a1 + 32)) && !*(_QWORD *)(a1 + 48))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4C608]), "initWithName:requestID:reason:userInitiated:", CFSTR("mediaControlsCollectionViewController:willSelectItemAtIndex:withReason:"), 0, CFSTR("Analytics: User selected"), 1);
    objc_msgSend(WeakRetained[155], "setActiveSystemRoute:requestDetails:", *(_QWORD *)(a1 + 32), v2);
    objc_msgSend(WeakRetained, "didSelectEndpoint:", *(_QWORD *)(a1 + 32));

  }
}

void __111__MediaControlsEndpointsViewController_mediaControlsCollectionViewController_willSelectItemAtIndex_withReason___block_invoke_2(uint64_t a1, char a2)
{
  id *WeakRetained;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id *v16;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v16 = WeakRetained;
    v5 = objc_msgSend(*(id *)(a1 + 32), "isEqual:", WeakRetained[157]);
    WeakRetained = v16;
    if (v5)
    {
      if ((a2 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "mediaControlsBundle");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "mediaControls_localizedStringForKey:inTable:expectedFormat:", CFSTR("AIRPLAY_ERROR_TITLE"), CFSTR("MediaControls"), 0);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v6, "mediaControls_localizedStringForKey:inTable:expectedFormat:", CFSTR("AIRPLAY_CONNECTION_ERROR_MESSAGE"), CFSTR("MediaControls"), CFSTR("%@"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "routeName");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "stringWithFormat:", v9, v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "mediaControls_localizedStringForKey:inTable:expectedFormat:", CFSTR("OK_BUTTON_TITLE"), CFSTR("MediaControls"), 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_alloc_init(MEMORY[0x1E0D4D100]);
        v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4D0F8]), "initWithOptions:", v13);
        objc_msgSend(v13, "setAlertHeader:", v7);
        objc_msgSend(v13, "setAlertMessage:", v11);
        objc_msgSend(v13, "setDefaultButtonTitle:", v12);
        objc_msgSend(v14, "presentWithCompletion:", 0);
        objc_msgSend(v16[155], "activeSystemRoute");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "_setSelectedRoute:isUserSelected:animated:", v15, 1, 1);

      }
      dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
      WeakRetained = v16;
    }
  }

}

- (void)endpointsManager:(id)a3 activeSystemRouteDidChange:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  id v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  self->_didRetrieveActiveSystemRouteOnce = 1;
  self->_shouldReselectActiveSystemRoute = 1;
  MCLogCategoryRouting();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    -[MPMediaControlsConfiguration presentingAppBundleID](self->_configuration, "presentingAppBundleID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v5;
    v10 = 2114;
    v11 = v7;
    _os_log_impl(&dword_1AA991000, v6, OS_LOG_TYPE_DEFAULT, "activeSystemRouteDidChange %{public}@ : %{public}@", (uint8_t *)&v8, 0x16u);

  }
  -[MediaControlsEndpointsViewController _selectActiveSystemRouteIfNeeded](self, "_selectActiveSystemRouteIfNeeded");
  -[MediaControlsEndpointsViewController _updateEndpointRouteForOutputDeviceDataSource:](self, "_updateEndpointRouteForOutputDeviceDataSource:", v5);
  -[MediaControlsEndpointsViewController _transitionToVisibleIfNeeded](self, "_transitionToVisibleIfNeeded");

}

- (void)endpointsManager:(id)a3 defersRoutesReplacement:(id)a4
{
  void (**v5)(_QWORD);
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD block[5];
  _QWORD v10[5];
  void (**v11)(_QWORD);

  v5 = (void (**)(_QWORD))a4;
  if ((-[MediaControlsEndpointsViewController isViewLoaded](self, "isViewLoaded") & 1) != 0)
  {
    v6 = MEMORY[0x1E0C809B0];
    if (self->_shouldTransitionToVisibleWhenReady || !self->_onScreen)
    {
      v5[2](v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        -[MediaControlsEndpointsViewController reloadData](self, "reloadData");
        -[MediaControlsEndpointsViewController _selectActiveSystemRouteIfNeeded](self, "_selectActiveSystemRouteIfNeeded");
      }

    }
    else
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __81__MediaControlsEndpointsViewController_endpointsManager_defersRoutesReplacement___block_invoke;
      v10[3] = &unk_1E58194F0;
      v10[4] = self;
      v11 = v5;
      -[MediaControlsCollectionViewController performBatchUpdates:](self, "performBatchUpdates:", v10);

    }
    block[0] = v6;
    block[1] = 3221225472;
    block[2] = __81__MediaControlsEndpointsViewController_endpointsManager_defersRoutesReplacement___block_invoke_3;
    block[3] = &unk_1E5818C88;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
  else
  {
    v8 = (id)((uint64_t (*)(_QWORD))v5[2])(v5);
  }

}

void __81__MediaControlsEndpointsViewController_endpointsManager_defersRoutesReplacement___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[5];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  objc_msgSend(v2, "insertedItemIndexPaths");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v28;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v28 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(a1 + 32), "insertItemAtIndex:", objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v7++), "row"));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
    }
    while (v5);
  }

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(v2, "deletedItemIndexPaths");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v24;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v24 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(a1 + 32), "deleteItemAtIndex:", objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v12++), "row"));
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
    }
    while (v10);
  }

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(v2, "updatedItemIndexPaths");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v31, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v20;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v20 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(a1 + 32), "reloadItemAtIndex:", objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v17++), "row"));
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v31, 16);
    }
    while (v15);
  }

  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __81__MediaControlsEndpointsViewController_endpointsManager_defersRoutesReplacement___block_invoke_2;
  v18[3] = &unk_1E58194C8;
  v18[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "enumerateItemMovesWithBlock:", v18);
  objc_msgSend(*(id *)(a1 + 32), "_selectActiveSystemRouteIfNeeded");

}

uint64_t __81__MediaControlsEndpointsViewController_endpointsManager_defersRoutesReplacement___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  v6 = objc_msgSend(a2, "row");
  v7 = objc_msgSend(v5, "row");

  return objc_msgSend(v4, "moveItemAtIndex:toIndex:", v6, v7);
}

void __81__MediaControlsEndpointsViewController_endpointsManager_defersRoutesReplacement___block_invoke_3(uint64_t a1)
{
  id *v1;
  id v2;

  v1 = *(id **)(a1 + 32);
  objc_msgSend(v1[155], "activeSystemRoute");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_updateEndpointRouteForOutputDeviceDataSource:", v2);

}

- (BOOL)_isSelectedRouteInRoutes
{
  MediaControlsEndpointsViewController *v2;
  void *v3;

  v2 = self;
  -[MediaControlsEndpointsManager routes](self->_endpointsManager, "routes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v3, "indexOfObject:", v2->_selectedRoute) != 0x7FFFFFFFFFFFFFFFLL;

  return (char)v2;
}

- (void)_updateDiscoveryMode
{
  uint64_t onScreen;
  void *v4;

  if (self->_onScreen && -[MediaControlsCollectionViewController displayMode](self, "displayMode") == 1
    || self->_prewarming)
  {
    onScreen = 3;
  }
  else
  {
    onScreen = self->_onScreen;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", onScreen);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPAVRoutingViewController setDiscoveryModeOverride:](self->_routingViewController, "setDiscoveryModeOverride:", v4);

  -[MediaControlsEndpointsManager setDiscoveryMode:](self->_endpointsManager, "setDiscoveryMode:", onScreen);
}

- (void)_assignRouteViewControllerToSelectedPanelViewController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  MPAVRoutingViewController *v7;
  void *v8;
  uint64_t v9;
  id v11;

  -[MediaControlsEndpointsManager routes](self->_endpointsManager, "routes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MediaControlsCollectionViewController viewControllerForItemAtIndex:](self, "viewControllerForItemAtIndex:", objc_msgSend(v3, "indexOfObject:", self->_selectedRoute));
  v11 = (id)objc_claimAutoreleasedReturnValue();

  -[MPAVRoutingViewController parentViewController](self->_routingViewController, "parentViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "routingViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "willMoveToParentViewController:", 0);
    objc_msgSend(v5, "setRoutingViewController:", 0);
    objc_msgSend(v6, "endAppearanceTransition");

  }
  objc_msgSend(v11, "routingViewController");
  v7 = (MPAVRoutingViewController *)objc_claimAutoreleasedReturnValue();
  if (!v11 || v7 == self->_routingViewController)
  {
    v8 = v7;
  }
  else
  {
    objc_msgSend(v11, "routingViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "willMoveToParentViewController:", 0);
    objc_msgSend(v11, "setRoutingViewController:", 0);
    objc_msgSend(v8, "endAppearanceTransition");
    objc_msgSend(v11, "addChildViewController:", self->_routingViewController);
    objc_msgSend(v11, "setRoutingViewController:", self->_routingViewController);
    -[MPAVRoutingViewController didMoveToParentViewController:](self->_routingViewController, "didMoveToParentViewController:", v11);
    v9 = -[MPMediaControlsConfiguration style](self->_configuration, "style");
    if (objc_msgSend(v11, "selectedMode") == 1 || v9 != 0)
      -[MPAVRoutingViewController setDiscoveryModeOverride:](self->_routingViewController, "setDiscoveryModeOverride:", &unk_1E58781F0);
  }

}

- (void)_updateEndpointRouteForOutputDeviceDataSource:(id)a3
{
  char v4;
  void *v5;
  id v6;

  v6 = a3;
  if (!v6
    || (v4 = objc_msgSend(v6, "isDeviceRoute"), v6, (v4 & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    -[MPAVOutputDeviceRoutingDataSource setEndpointRoute:](self->_outputDeviceRoutingDataSource, "setEndpointRoute:", v6);
    -[MPAVOutputDeviceRoutingDataSource endpointRoute](self->_outputDeviceRoutingDataSource, "endpointRoute");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPAVRoutingViewController setEndpointRoute:](self->_routingViewController, "setEndpointRoute:", v5);

  }
}

- (void)_supportedModesForSelectedRoute:(unint64_t *)a3 selectedMode:(int64_t *)a4
{
  unsigned int v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  int64_t lastSelectedModeForActivePlatterViewController;
  int64_t v12;

  if (-[MPAVEndpointRoute canModifyGroupMembership](self->_selectedRoute, "canModifyGroupMembership"))
  {
    if ((-[MPAVEndpointRoute supportsGrouping](self->_selectedRoute, "supportsGrouping") & 1) != 0)
      v7 = 1;
    else
      v7 = -[MPAVEndpointRoute isDeviceRoute](self->_selectedRoute, "isDeviceRoute");
  }
  else
  {
    v7 = 0;
  }
  -[MediaControlsEndpointsViewController configuration](self, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "style");

  switch(v9)
  {
    case 0:
      v12 = -[MediaControlsCollectionViewController displayMode](self, "displayMode");
      v10 = 3;
      if (!v7)
        v10 = 1;
      if (!v12)
        goto LABEL_17;
      lastSelectedModeForActivePlatterViewController = self->_lastSelectedModeForActivePlatterViewController;
      if (a3)
        goto LABEL_24;
      break;
    case 1:
    case 2:
    case 3:
      v10 = 1;
      if (v7)
        v10 = 2;
      lastSelectedModeForActivePlatterViewController = v7;
      if (a3)
        goto LABEL_24;
      break;
    case 4:
      lastSelectedModeForActivePlatterViewController = 1;
      v10 = 2;
      if (a3)
        goto LABEL_24;
      break;
    case 5:
      lastSelectedModeForActivePlatterViewController = 0;
      v10 = 3;
      if (!v7)
        v10 = 1;
      if (a3)
        goto LABEL_24;
      break;
    default:
      v10 = 0;
LABEL_17:
      lastSelectedModeForActivePlatterViewController = 0;
      if (a3)
LABEL_24:
        *a3 = v10;
      break;
  }
  if (a4)
    *a4 = lastSelectedModeForActivePlatterViewController;
}

- (void)_updateModesForSelectedPlatterViewController
{
  void *v3;
  uint64_t v4;
  uint64_t v5;

  -[MediaControlsCollectionViewController viewControllerForSelectedItem](self, "viewControllerForSelectedItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 0;
    v5 = 0;
    -[MediaControlsEndpointsViewController _supportedModesForSelectedRoute:selectedMode:](self, "_supportedModesForSelectedRoute:selectedMode:", &v5, &v4);
    objc_msgSend(v3, "setSupportedModes:", v5);
    objc_msgSend(v3, "setSelectedMode:", v4);
  }

}

- (void)_updateSupportedModesForSelectedPlatterViewController
{
  void *v3;
  uint64_t v4;

  -[MediaControlsCollectionViewController viewControllerForSelectedItem](self, "viewControllerForSelectedItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 0;
    -[MediaControlsEndpointsViewController _supportedModesForSelectedRoute:selectedMode:](self, "_supportedModesForSelectedRoute:selectedMode:", &v4, 0);
    objc_msgSend(v3, "setSupportedModes:", v4);
  }

}

- (void)_setupEndpointsManager
{
  MediaControlsEndpointsManager *v3;
  MediaControlsEndpointsManager *endpointsManager;
  id v5;

  if (self->_configuration)
  {
    v3 = -[MediaControlsEndpointsManager initWithConfiguration:]([MediaControlsEndpointsManager alloc], "initWithConfiguration:", self->_configuration);
    endpointsManager = self->_endpointsManager;
    self->_endpointsManager = v3;

    -[MediaControlsEndpointsManager setDelegate:](self->_endpointsManager, "setDelegate:", self);
    -[MediaControlsEndpointsViewController _updateDiscoveryMode](self, "_updateDiscoveryMode");
    -[MediaControlsEndpointsViewController reloadData](self, "reloadData");
    -[MediaControlsEndpointsManager activeSystemRoute](self->_endpointsManager, "activeSystemRoute");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[MediaControlsEndpointsViewController _setSelectedRoute:isUserSelected:animated:](self, "_setSelectedRoute:isUserSelected:animated:", v5, 0, 0);

  }
}

- (void)_setupRoutingViewController
{
  void *v3;
  objc_class *v4;
  void *v5;
  MPAVOutputDeviceRoutingDataSource *v6;
  MPAVOutputDeviceRoutingDataSource *outputDeviceRoutingDataSource;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  MediaControlsRoutingViewController *v14;
  MPAVRoutingViewController *routingViewController;
  id v16;

  if (self->_configuration)
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%@(devices)"), v5);
    v16 = (id)objc_claimAutoreleasedReturnValue();

    v6 = (MPAVOutputDeviceRoutingDataSource *)objc_alloc_init(MEMORY[0x1E0CC2300]);
    outputDeviceRoutingDataSource = self->_outputDeviceRoutingDataSource;
    self->_outputDeviceRoutingDataSource = v6;

    if (self->_routingContextUID)
      -[MPAVOutputDeviceRoutingDataSource setRoutingContextUID:](self->_outputDeviceRoutingDataSource, "setRoutingContextUID:");
    v8 = -[MPMediaControlsConfiguration style](self->_configuration, "style");
    v9 = 0;
    v10 = 0;
    switch(v8)
    {
      case 0:
      case 2:
      case 3:
        v10 = 0;
        v9 = 1;
        goto LABEL_8;
      case 1:
      case 5:
        goto LABEL_8;
      case 4:
      case 6:
        v9 = 0;
        v10 = 2;
LABEL_8:
        -[MPAVOutputDeviceRoutingDataSource setSupportsMultipleSelection:](self->_outputDeviceRoutingDataSource, "setSupportsMultipleSelection:", v9);
        -[MPAVOutputDeviceRoutingDataSource setFilterMode:](self->_outputDeviceRoutingDataSource, "setFilterMode:", v10);
        break;
      default:
        break;
    }
    v11 = -[MPMediaControlsConfiguration initatorStyle](self->_configuration, "initatorStyle", v9);
    if (v11 <= 7 && ((0xDDu >> v11) & 1) != 0)
      -[MPAVOutputDeviceRoutingDataSource setInitiator:](self->_outputDeviceRoutingDataSource, "setInitiator:", **((_QWORD **)&unk_1E5819578 + v11));
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC2318]), "initWithDataSource:name:", self->_outputDeviceRoutingDataSource, v16);
    -[MPMediaControlsConfiguration presentingAppBundleID](self->_configuration, "presentingAppBundleID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setPresentedBundleID:", v13);

    v14 = -[MPAVRoutingViewController initWithStyle:routingController:]([MediaControlsRoutingViewController alloc], "initWithStyle:routingController:", 3, v12);
    routingViewController = self->_routingViewController;
    self->_routingViewController = &v14->super;

    -[MPAVRoutingViewController setSortByIsVideoRoute:](self->_routingViewController, "setSortByIsVideoRoute:", -[MPMediaControlsConfiguration sortByIsVideoRoute](self->_configuration, "sortByIsVideoRoute"));
    objc_msgSend(v12, "setPlaybackDataSource:", self->_endpointsManager);
    -[MediaControlsEndpointsViewController _assignRouteViewControllerToSelectedPanelViewController](self, "_assignRouteViewControllerToSelectedPanelViewController");

  }
}

- (void)endUpdates
{
  -[MediaControlsEndpointsManager setDelegate:](self->_endpointsManager, "setDelegate:", 0);
  -[MPAVRoutingViewController _endUpdates](self->_routingViewController, "_endUpdates");
}

- (void)_setSelectedRoute:(id)a3 isUserSelected:(BOOL)a4 animated:(BOOL)a5
{
  _BOOL4 v5;
  MPAVEndpointRoute **p_selectedRoute;
  char v10;
  void *v11;
  _QWORD *v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL8 v16;
  _BOOL8 v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  id v23;

  v5 = a5;
  v23 = a3;
  p_selectedRoute = &self->_selectedRoute;
  v10 = -[MPAVEndpointRoute isEqual:](self->_selectedRoute, "isEqual:", v23);
  v11 = v23;
  if ((v10 & 1) != 0)
    goto LABEL_20;
  v12 = (_QWORD *)MEMORY[0x1E0CC1CD0];
  if (*p_selectedRoute)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "removeObserver:name:object:", self, *v12, *p_selectedRoute);

  }
  objc_storeStrong((id *)&self->_selectedRoute, a3);
  if (*p_selectedRoute)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:selector:name:object:", self, sel__routeDidChangeNotification_, *v12, *p_selectedRoute);

  }
  if (v5)
  {
    if (self->_didTransitionToVisible)
      goto LABEL_13;
    -[MediaControlsEndpointsViewController configuration](self, "configuration");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "style") == 0;

    if (a4)
      goto LABEL_13;
  }
  else
  {
    v16 = 0;
    if (a4)
    {
LABEL_13:
      v17 = -[MediaControlsCollectionViewController selectedItemIndex](self, "selectedItemIndex") != 0x7FFFFFFFFFFFFFFFLL;
      v16 = !self->_shouldTransitionToVisibleWhenReady;
      goto LABEL_14;
    }
  }
  if (v16)
    goto LABEL_13;
  v17 = 0;
LABEL_14:
  if (v23)
  {
    -[MediaControlsEndpointsManager routes](self->_endpointsManager, "routes");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[MediaControlsCollectionViewController setSelectedItemIndex:animated:shouldScroll:](self, "setSelectedItemIndex:animated:shouldScroll:", objc_msgSend(v18, "indexOfObject:", v23), v17, v16);

  }
  -[MediaControlsEndpointsViewController _updateEndpointRouteForOutputDeviceDataSource:](self, "_updateEndpointRouteForOutputDeviceDataSource:");
  -[MPAVRoutingViewController _tableView](self->_routingViewController, "_tableView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "reloadData");

  -[MediaControlsEndpointsViewController _assignRouteViewControllerToSelectedPanelViewController](self, "_assignRouteViewControllerToSelectedPanelViewController");
  -[MediaControlsEndpointsViewController _updateModesForSelectedPlatterViewController](self, "_updateModesForSelectedPlatterViewController");
  if (!a4)
  {
    -[MediaControlsEndpointsManager routes](self->_endpointsManager, "routes");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[MediaControlsEndpointsManager activeSystemRoute](self->_endpointsManager, "activeSystemRoute");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "containsObject:", v21);

    if ((v22 & 1) == 0)
      self->_shouldReselectActiveSystemRoute = 1;
  }
  -[MediaControlsEndpointsViewController _transitionToVisibleIfNeeded](self, "_transitionToVisibleIfNeeded");
  v11 = v23;
LABEL_20:

}

- (void)_routeDidChangeNotification:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__MediaControlsEndpointsViewController__routeDidChangeNotification___block_invoke;
  block[3] = &unk_1E5818C88;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __68__MediaControlsEndpointsViewController__routeDidChangeNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateSupportedModesForSelectedPlatterViewController");
}

- (void)_selectActiveSystemRouteIfNeeded
{
  void *v3;
  int v4;
  id v5;

  -[MediaControlsEndpointsManager resolvedActiveSystemRoute](self->_endpointsManager, "resolvedActiveSystemRoute");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (self->_shouldReselectActiveSystemRoute)
  {
    -[MediaControlsEndpointsManager routes](self->_endpointsManager, "routes");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "containsObject:", v5);

    if (v4)
    {
      -[MediaControlsEndpointsViewController setSelectedRoute:](self, "setSelectedRoute:", v5);
      self->_shouldReselectActiveSystemRoute = 0;
      self->_didRetrieveActiveSystemRouteOnce = 1;
    }
  }

}

- (BOOL)_isReadyForAppearanceTransition
{
  return self->_didRetrieveActiveSystemRouteOnce
      && (-[MediaControlsEndpointsManager isActiveSystemEndpointEqualToLocalEndpoint](self->_endpointsManager, "isActiveSystemEndpointEqualToLocalEndpoint")&& (objc_msgSend((id)objc_opt_class(), "_shouldTransitionEarlyOnSystemRoute") & 1) != 0|| -[MediaControlsEndpointsViewController _isSelectedRouteInRoutes](self, "_isSelectedRouteInRoutes"));
}

- (void)_transitionToVisibleIfNeeded
{
  if (self->_shouldTransitionToVisibleWhenReady)
    -[MediaControlsEndpointsViewController _transitionToVisible:](self, "_transitionToVisible:", 1);
}

+ (BOOL)_shouldTransitionEarlyOnSystemRoute
{
  if (_shouldTransitionEarlyOnSystemRoute_onceToken != -1)
    dispatch_once(&_shouldTransitionEarlyOnSystemRoute_onceToken, &__block_literal_global_5);
  return _shouldTransitionEarlyOnSystemRoute___shouldTransitionEarlyOnSystemRoute;
}

void __75__MediaControlsEndpointsViewController__shouldTransitionEarlyOnSystemRoute__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  unint64_t v4;
  utsname v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  memset(&v5, 0, 512);
  uname(&v5);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v5.machine, 4);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "letterCharacterSet");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringByTrimmingCharactersInSet:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = objc_msgSend(v2, "integerValue");
  if ((objc_msgSend(v0, "hasPrefix:", CFSTR("iPhone")) & 1) != 0)
    goto LABEL_5;
  if ((objc_msgSend(v0, "hasPrefix:", CFSTR("iPad")) & 1) != 0)
  {
    v4 = 4;
LABEL_6:
    _shouldTransitionEarlyOnSystemRoute___shouldTransitionEarlyOnSystemRoute = v3 - 1 < v4;
    goto LABEL_7;
  }
  if (objc_msgSend(v0, "hasPrefix:", CFSTR("iPod")))
  {
LABEL_5:
    v4 = 7;
    goto LABEL_6;
  }
LABEL_7:

}

- (MPMediaControlsConfiguration)configuration
{
  return self->_configuration;
}

- (id)routingCornerViewTappedBlock
{
  return self->_routingCornerViewTappedBlock;
}

- (id)homeGestureDismissalAllowedBlock
{
  return self->_homeGestureDismissalAllowedBlock;
}

- (void)setHomeGestureDismissalAllowedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1232);
}

- (BOOL)shouldPresentUsingViewService
{
  return self->_shouldPresentUsingViewService;
}

- (void)setShouldPresentUsingViewService:(BOOL)a3
{
  self->_shouldPresentUsingViewService = a3;
}

- (BOOL)isDismissing
{
  return self->_dismissing;
}

- (void)setDismissing:(BOOL)a3
{
  self->_dismissing = a3;
}

- (BOOL)isOnScreen
{
  return self->_onScreen;
}

- (MediaControlsEndpointsManager)endpointsManager
{
  return self->_endpointsManager;
}

- (void)setEndpointsManager:(id)a3
{
  objc_storeStrong((id *)&self->_endpointsManager, a3);
}

- (MPAVRoutingViewController)routingViewController
{
  return self->_routingViewController;
}

- (void)setRoutingViewController:(id)a3
{
  objc_storeStrong((id *)&self->_routingViewController, a3);
}

- (MPAVEndpointRoute)selectedRoute
{
  return self->_selectedRoute;
}

- (NSString)routingContextUID
{
  return self->_routingContextUID;
}

- (void)setExternalPlaybackMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_externalPlaybackMonitor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalPlaybackMonitor, 0);
  objc_storeStrong((id *)&self->_routingContextUID, 0);
  objc_storeStrong((id *)&self->_selectedRoute, 0);
  objc_storeStrong((id *)&self->_routingViewController, 0);
  objc_storeStrong((id *)&self->_endpointsManager, 0);
  objc_storeStrong(&self->_homeGestureDismissalAllowedBlock, 0);
  objc_storeStrong(&self->_routingCornerViewTappedBlock, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_outputDeviceRoutingDataSource, 0);
}

@end
