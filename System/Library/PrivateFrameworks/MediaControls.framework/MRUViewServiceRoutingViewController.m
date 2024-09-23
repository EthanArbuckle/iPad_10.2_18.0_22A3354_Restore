@implementation MRUViewServiceRoutingViewController

- (MRUViewServiceRoutingViewController)init
{
  MRUViewServiceRoutingViewController *v2;
  uint64_t v3;
  NSMutableDictionary *nowPlayingControllers;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MRUViewServiceRoutingViewController;
  v2 = -[MRUViewServiceRoutingViewController init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    nowPlayingControllers = v2->_nowPlayingControllers;
    v2->_nowPlayingControllers = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[MRUVendorSpecificDeviceManager stopDiscovery](self->_vendorSpecificManager, "stopDiscovery");
  v3.receiver = self;
  v3.super_class = (Class)MRUViewServiceRoutingViewController;
  -[MRUViewServiceRoutingViewController dealloc](&v3, sel_dealloc);
}

- (void)loadView
{
  MRUViewServiceRoutingView *v3;
  MRUViewServiceRoutingView *v4;

  v3 = [MRUViewServiceRoutingView alloc];
  v4 = -[MRUViewServiceRoutingView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[MRUViewServiceRoutingViewController setView:](self, "setView:", v4);

}

- (void)viewDidLoad
{
  MRUVisualStylingProvider *stylingProvider;
  void *v4;
  double v5;
  double v6;
  void *v7;
  uint64_t v8;
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
  uint64_t v24;
  objc_class *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  UITableViewDiffableDataSource *v30;
  UITableViewDiffableDataSource *dataSource;
  MRUVendorSpecificDeviceManager *v32;
  void *v33;
  MRUVendorSpecificDeviceManager *v34;
  MRUVendorSpecificDeviceManager *vendorSpecificManager;
  uint64_t v36;
  uint64_t v37;
  id (*v38)(uint64_t, void *, void *, void *);
  void *v39;
  id v40;
  id location;
  objc_super v42;

  v42.receiver = self;
  v42.super_class = (Class)MRUViewServiceRoutingViewController;
  -[MRUViewServiceRoutingViewController viewDidLoad](&v42, sel_viewDidLoad);
  stylingProvider = self->_stylingProvider;
  -[MRUViewServiceRoutingViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setStylingProvider:", stylingProvider);

  -[MPMediaControlsConfiguration preferredWidth](self->_configuration, "preferredWidth");
  v6 = v5;
  -[MRUViewServiceRoutingViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPreferredWidth:", v6);

  if (-[MPMediaControlsConfiguration useGenericDevicesIconInHeader](self->_configuration, "useGenericDevicesIconInHeader"))
  {
    +[MRUAssetsProvider genericDevices](MRUAssetsProvider, "genericDevices");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[MRUStringsProvider airplayTitle](MRUStringsProvider, "airplayTitle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRUViewServiceRoutingViewController view](self, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "headerView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTitle:", v9);

    if (-[MPMediaControlsConfiguration sortByIsVideoRoute](self->_configuration, "sortByIsVideoRoute"))
      +[MRUAssetsProvider airplayVideo](MRUAssetsProvider, "airplayVideo");
    else
      +[MRUAssetsProvider airplay](MRUAssetsProvider, "airplay");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v12 = (void *)v8;
  -[MRUViewServiceRoutingViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "headerView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setImage:", v12);

  -[MRURoutingViewController view](self->_routingViewController, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUViewServiceRoutingViewController view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setContentView:", v15);

  -[MRURoutingViewController setStylingProvider:](self->_routingViewController, "setStylingProvider:", self->_stylingProvider);
  -[MRUViewServiceRoutingViewController view](self, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "footerView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "button");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addTarget:action:forControlEvents:", self, sel_didSelectListState_, 64);

  -[MRUViewServiceRoutingViewController view](self, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "tableView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setDelegate:", self);

  -[MRUViewServiceRoutingViewController view](self, "view");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "tableView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_opt_class();
  v25 = (objc_class *)objc_opt_class();
  NSStringFromClass(v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "registerClass:forCellReuseIdentifier:", v24, v26);

  objc_initWeak(&location, self);
  v27 = objc_alloc(MEMORY[0x1E0DC3D68]);
  -[MRUViewServiceRoutingViewController view](self, "view");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "tableView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = MEMORY[0x1E0C809B0];
  v37 = 3221225472;
  v38 = __50__MRUViewServiceRoutingViewController_viewDidLoad__block_invoke;
  v39 = &unk_1E5819138;
  objc_copyWeak(&v40, &location);
  v30 = (UITableViewDiffableDataSource *)objc_msgSend(v27, "initWithTableView:cellProvider:", v29, &v36);
  dataSource = self->_dataSource;
  self->_dataSource = v30;

  v32 = [MRUVendorSpecificDeviceManager alloc];
  -[MPMediaControlsConfiguration presentingAppBundleID](self->_configuration, "presentingAppBundleID", v36, v37, v38, v39);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = -[MRUVendorSpecificDeviceManager initWithAppBundleID:serviceIdentifiers:](v32, "initWithAppBundleID:serviceIdentifiers:", v33, MEMORY[0x1E0C9AA60]);
  vendorSpecificManager = self->_vendorSpecificManager;
  self->_vendorSpecificManager = v34;

  -[MRUVendorSpecificDeviceManager startDiscovery](self->_vendorSpecificManager, "startDiscovery");
  -[MRUViewServiceRoutingViewController updateNowPlayingControllers](self, "updateNowPlayingControllers");
  objc_destroyWeak(&v40);
  objc_destroyWeak(&location);
}

id __50__MRUViewServiceRoutingViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  objc_class *v10;
  void *v11;
  void *v12;
  id WeakRetained;

  v7 = a4;
  v8 = a3;
  v9 = a2;
  v10 = (objc_class *)objc_opt_class();
  NSStringFromClass(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dequeueReusableCellWithIdentifier:forIndexPath:", v11, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "updateCell:forIdentifier:", v12, v7);

  return v12;
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MRUViewServiceRoutingViewController;
  -[MRUViewServiceRoutingViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[MRUViewServiceRoutingViewController setOnScreen:](self, "setOnScreen:", 1);
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MRUViewServiceRoutingViewController;
  -[MRUViewServiceRoutingViewController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  -[MRUViewServiceRoutingViewController setOnScreen:](self, "setOnScreen:", 0);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setOnScreen:(BOOL)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (self->_onScreen != a3)
  {
    self->_onScreen = a3;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[NSMutableDictionary allValues](self->_nowPlayingControllers, "allValues", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");

    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "updateAutomaticResponseLoading");
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }

    -[MRUViewServiceRoutingViewController updateDiscoveryMode](self, "updateDiscoveryMode");
  }
}

- (void)setState:(int64_t)a3
{
  void *v5;
  id WeakRetained;

  -[MRUViewServiceRoutingViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setState:", a3);

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "viewServiceRoutingViewControllerDidChangeSize:", self);

}

- (void)setConfiguration:(id)a3
{
  MPMediaControlsConfiguration **p_configuration;
  MediaControlsEndpointsManager *v6;
  MediaControlsEndpointsManager *endpointsManager;
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
  double v20;
  double v21;
  void *v22;
  void *v23;
  id v24;

  p_configuration = &self->_configuration;
  v24 = a3;
  if ((-[MPMediaControlsConfiguration isEqual:](*p_configuration, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_configuration, a3);
    v6 = -[MediaControlsEndpointsManager initWithConfiguration:]([MediaControlsEndpointsManager alloc], "initWithConfiguration:", v24);
    endpointsManager = self->_endpointsManager;
    self->_endpointsManager = v6;

    -[MediaControlsEndpointsManager setDelegate:](self->_endpointsManager, "setDelegate:", self);
    if (-[MPMediaControlsConfiguration style](*p_configuration, "style") == 3)
    {
      self->_canShowRemoteDevices = 1;
    }
    else
    {
      v8 = (void *)MEMORY[0x1E0CB34D0];
      objc_msgSend(v24, "presentingAppBundleID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v8, "mru_isSpringBoardBundleIdentifier:", v9) & 1) != 0)
      {
        self->_canShowRemoteDevices = 1;
      }
      else
      {
        v10 = (void *)MEMORY[0x1E0CB34D0];
        objc_msgSend(v24, "presentingAppBundleID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        self->_canShowRemoteDevices = objc_msgSend(v10, "mru_isMediaRemoteUIBundleIdentifier:", v11);

      }
    }
    if (-[MPMediaControlsConfiguration style](*p_configuration, "style") == 3)
    {
      self->_supportsQueueHandoff = 1;
    }
    else
    {
      v12 = (void *)MEMORY[0x1E0CB34D0];
      objc_msgSend(v24, "presentingAppBundleID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v12, "mru_isSpringBoardBundleIdentifier:", v13) & 1) != 0)
      {
        self->_supportsQueueHandoff = 1;
      }
      else
      {
        v14 = (void *)MEMORY[0x1E0CB34D0];
        objc_msgSend(v24, "presentingAppBundleID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v14, "mru_isHomeBundleIdentifier:", v15) & 1) != 0)
        {
          self->_supportsQueueHandoff = 1;
        }
        else
        {
          v16 = (void *)MEMORY[0x1E0CB34D0];
          objc_msgSend(v24, "presentingAppBundleID");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v16, "mru_isProximityControlBundleIdentifier:", v17) & 1) != 0)
          {
            self->_supportsQueueHandoff = 1;
          }
          else
          {
            v18 = (void *)MEMORY[0x1E0CB34D0];
            objc_msgSend(v24, "presentingAppBundleID");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            self->_supportsQueueHandoff = objc_msgSend(v18, "mru_isMediaRemoteUIBundleIdentifier:", v19);

          }
        }

      }
    }
    objc_msgSend(v24, "preferredWidth");
    v21 = v20;
    -[MRUViewServiceRoutingViewController viewIfLoaded](self, "viewIfLoaded");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setPreferredWidth:", v21);

    -[MRUViewServiceRoutingViewController endpointsManager](self, "endpointsManager");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "prewarm");

    -[MRUViewServiceRoutingViewController updateDiscoveryMode](self, "updateDiscoveryMode");
    -[MRUViewServiceRoutingViewController updateNowPlayingControllers](self, "updateNowPlayingControllers");
    -[MRUViewServiceRoutingViewController updateRoutingViewController](self, "updateRoutingViewController");
  }

}

- (void)setStylingProvider:(id)a3
{
  void *v5;
  MRUVisualStylingProvider *v6;

  v6 = (MRUVisualStylingProvider *)a3;
  if (self->_stylingProvider != v6)
  {
    objc_storeStrong((id *)&self->_stylingProvider, a3);
    -[MRUViewServiceRoutingViewController viewIfLoaded](self, "viewIfLoaded");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setStylingProvider:", v6);

    -[MRURoutingViewController setStylingProvider:](self->_routingViewController, "setStylingProvider:", v6);
  }

}

- (void)setRoutingViewController:(id)a3
{
  MRURoutingViewController *v5;
  MRURoutingViewController **p_routingViewController;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  MRURoutingViewController *v11;

  v5 = (MRURoutingViewController *)a3;
  p_routingViewController = &self->_routingViewController;
  if (self->_routingViewController != v5)
  {
    v11 = v5;
    objc_storeStrong((id *)&self->_routingViewController, a3);
    -[MRUViewServiceRoutingViewController addChildViewController:](self, "addChildViewController:", *p_routingViewController);
    if (-[MRUViewServiceRoutingViewController isViewLoaded](self, "isViewLoaded"))
    {
      -[MRURoutingViewController view](*p_routingViewController, "view");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRUViewServiceRoutingViewController view](self, "view");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setContentView:", v7);

    }
    -[MRUViewServiceRoutingViewController updateRoutingViewControllerScrollIndicatorInsets](self, "updateRoutingViewControllerScrollIndicatorInsets");
    -[MRUViewServiceRoutingViewController viewIfLoaded](self, "viewIfLoaded");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stylingProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRURoutingViewController setStylingProvider:](*p_routingViewController, "setStylingProvider:", v10);

    -[MRURoutingViewController didMoveToParentViewController:](*p_routingViewController, "didMoveToParentViewController:", self);
    v5 = v11;
  }

}

- (void)setSelectedNowPlayingController:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  MRUNowPlayingController *v10;

  v10 = (MRUNowPlayingController *)a3;
  if (self->_selectedNowPlayingController != v10)
  {
    objc_storeStrong((id *)&self->_selectedNowPlayingController, a3);
    -[MRUNowPlayingController endpointController](v10, "endpointController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "route");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRUOutputDeviceRoutingDataSource setEndpointRoute:](self->_outputDeviceRoutingDataSource, "setEndpointRoute:", v6);

    -[MRUNowPlayingController endpointController](v10, "endpointController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "route");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRURoutingViewController setEndpointRoute:](self->_routingViewController, "setEndpointRoute:", v8);

    -[MRUViewServiceRoutingViewController viewIfLoaded](self, "viewIfLoaded");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setNeedsLayout");

  }
}

- (id)selectedIdentifier
{
  return -[MRUNowPlayingController identifier](self->_selectedNowPlayingController, "identifier");
}

- (BOOL)canShowMoreButton
{
  return self->_canShowRemoteDevices
      && (unint64_t)-[NSMutableDictionary count](self->_nowPlayingControllers, "count") > 1;
}

- (void)setAlertViewController:(id)a3
{
  UIViewController *v5;
  UIViewController *alertViewController;
  UIViewController *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  UIViewController *v13;
  _QWORD v14[4];
  UIViewController *v15;
  UIViewController *v16;
  MRUViewServiceRoutingViewController *v17;
  _QWORD v18[4];
  UIViewController *v19;
  MRUViewServiceRoutingViewController *v20;
  UIViewController *v21;

  v5 = (UIViewController *)a3;
  alertViewController = self->_alertViewController;
  if (alertViewController != v5)
  {
    v7 = alertViewController;
    objc_storeStrong((id *)&self->_alertViewController, a3);
    -[UIViewController willMoveToParentViewController:](v7, "willMoveToParentViewController:", 0);
    if (v5)
    {
      -[MRUViewServiceRoutingViewController addChildViewController:](self, "addChildViewController:", v5);
      -[UIViewController view](v5, "view");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRUViewServiceRoutingViewController view](self, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setAlertView:", v8);

      -[MRUViewServiceRoutingViewController view](self, "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "layoutIfNeeded");
    }
    else
    {
      -[MRUViewServiceRoutingViewController view](self, "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setAlertView:", 0);
    }

    v11 = (void *)MEMORY[0x1E0DC3F10];
    v12 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __62__MRUViewServiceRoutingViewController_setAlertViewController___block_invoke;
    v18[3] = &unk_1E5819160;
    v19 = v7;
    v20 = self;
    v21 = v5;
    v14[0] = v12;
    v14[1] = 3221225472;
    v14[2] = __62__MRUViewServiceRoutingViewController_setAlertViewController___block_invoke_2;
    v14[3] = &unk_1E5819188;
    v15 = v19;
    v16 = v21;
    v17 = self;
    v13 = v19;
    objc_msgSend(v11, "mru_animateUsingType:animations:completion:", 0, v18, v14);

  }
}

void __62__MRUViewServiceRoutingViewController_setAlertViewController___block_invoke(uint64_t a1)
{
  void *v2;
  _BOOL8 v3;
  void *v4;
  void *v5;
  id WeakRetained;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 0.0);

  v3 = *(_QWORD *)(a1 + 48) != 0;
  objc_msgSend(*(id *)(a1 + 40), "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShowAlertView:", v3);

  objc_msgSend(*(id *)(a1 + 40), "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layoutIfNeeded");

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 992));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "viewServiceRoutingViewControllerDidChangeSize:", *(_QWORD *)(a1 + 40));

}

uint64_t __62__MRUViewServiceRoutingViewController_setAlertViewController___block_invoke_2(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeFromSuperview");

  objc_msgSend(*(id *)(a1 + 32), "removeFromParentViewController");
  return objc_msgSend(*(id *)(a1 + 40), "didMoveToParentViewController:", *(_QWORD *)(a1 + 48));
}

- (void)didSelectListState:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __58__MRUViewServiceRoutingViewController_didSelectListState___block_invoke;
  v3[3] = &unk_1E5818C88;
  v3[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "mru_animateUsingType:animations:", 0, v3);
}

void __58__MRUViewServiceRoutingViewController_didSelectListState___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "setState:", 1);
  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layoutIfNeeded");

}

- (void)didSelectQuickControl:(id)a3
{
  NSMutableDictionary *nowPlayingControllers;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  nowPlayingControllers = self->_nowPlayingControllers;
  objc_msgSend(a3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](nowPlayingControllers, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "quickControlItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mainAction");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v7 = v8;
  if (v8)
  {
    (*((void (**)(id))v8 + 2))(v8);
    v7 = v8;
  }

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  MRUViewServiceRoutingViewController *v15;
  id v16;
  id location;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v7, 1);
  -[UITableViewDiffableDataSource itemIdentifierForIndexPath:](self->_dataSource, "itemIdentifierForIndexPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_nowPlayingControllers, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "endpointController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "route");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __73__MRUViewServiceRoutingViewController_tableView_didSelectRowAtIndexPath___block_invoke;
  v13[3] = &unk_1E58191B0;
  objc_copyWeak(&v16, &location);
  v12 = v11;
  v14 = v12;
  v15 = self;
  objc_msgSend(v10, "connectAllowingAuthenticationWithCompletion:", v13);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

void __73__MRUViewServiceRoutingViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1, int a2)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (a2)
  {
    v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D4C608]), "initWithName:requestID:reason:userInitiated:", CFSTR("tableView:didSelectRowAtIndexPath:"), 0, CFSTR("User selected active system endpoint"), 1);
    objc_msgSend(WeakRetained, "endpointsManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setActiveSystemRoute:requestDetails:", *(_QWORD *)(a1 + 32), v4);

    objc_msgSend(WeakRetained, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "viewServiceRoutingViewControllerDidDismiss:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    v4 = objc_alloc_init(MEMORY[0x1E0D4D100]);
    +[MRUStringsProvider airPlayErrorTitle](MRUStringsProvider, "airPlayErrorTitle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAlertHeader:", v7);

    objc_msgSend(*(id *)(a1 + 32), "routeName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[MRUStringsProvider airPlayConnectionErrorMessage:](MRUStringsProvider, "airPlayConnectionErrorMessage:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAlertMessage:", v9);

    +[MRUStringsProvider ok](MRUStringsProvider, "ok");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDefaultButtonTitle:", v10);

    objc_msgSend(v4, "setShowAsTopmost:", 1);
    objc_msgSend(v4, "setForceModalAlertAppearance:", 1);
    objc_msgSend(v4, "setShowOnLockscreen:", 1);
    objc_msgSend(v4, "setDismissOverlaysOnLockscreen:", 0);
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4D0F8]), "initWithOptions:", v4);
    objc_msgSend(v6, "presentWithCompletion:", 0);
  }

}

- (BOOL)tableView:(id)a3 shouldHaveFullLengthBottomSeparatorForSection:(int64_t)a4
{
  return 1;
}

- (void)endpointsManager:(id)a3 defersRoutesReplacement:(id)a4
{
  void *v5;
  id replaceRoutes;

  v5 = _Block_copy(a4);
  replaceRoutes = self->_replaceRoutes;
  self->_replaceRoutes = v5;

  -[MRUViewServiceRoutingViewController updateNowPlayingControllers](self, "updateNowPlayingControllers");
}

- (BOOL)nowPlayingControllerShouldAutomaticallyUpdateResponse:(id)a3
{
  return self->_onScreen;
}

- (void)nowPlayingController:(id)a3 endpointController:(id)a4 didChangeRoute:(id)a5
{
  id v6;

  objc_msgSend(a3, "identifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[MRUViewServiceRoutingViewController updateCellForIdentifier:](self, "updateCellForIdentifier:", v6);

}

- (void)nowPlayingController:(id)a3 metadataController:(id)a4 didChangeArtwork:(id)a5
{
  id v6;

  objc_msgSend(a3, "identifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[MRUViewServiceRoutingViewController updateCellForIdentifier:](self, "updateCellForIdentifier:", v6);

}

- (void)nowPlayingController:(id)a3 metadataController:(id)a4 didChangeNowPlayingInfo:(id)a5
{
  id v6;

  objc_msgSend(a3, "identifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[MRUViewServiceRoutingViewController updateCellForIdentifier:](self, "updateCellForIdentifier:", v6);

}

- (void)nowPlayingController:(id)a3 didChangeQuickControlItem:(id)a4
{
  id v5;

  objc_msgSend(a3, "identifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[MRUViewServiceRoutingViewController updateCellForIdentifier:](self, "updateCellForIdentifier:", v5);

}

- (void)routingViewController:(id)a3 didSelectRoutingViewItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  id WeakRetained;
  void *v11;
  void *v12;
  int v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "actionIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0CC1D18]);

  if (!v9)
  {
    if (objc_msgSend(v7, "type") == 6)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v7, "vendorSpecificCustomRowIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "viewServiceRoutingViewControllerDidDismiss:withCustomRowTapped:", self, v11);

    }
    else
    {
      objc_msgSend(v7, "mainRoute");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isGroupSession");

      if (!v13)
        goto LABEL_8;
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "viewServiceRoutingViewControllerDidDismiss:", self);
    }

    goto LABEL_8;
  }
  objc_initWeak(&location, self);
  objc_copyWeak(&v14, &location);
  SBSRequestPasscodeUnlockAlertUI();
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
LABEL_8:

}

void __86__MRUViewServiceRoutingViewController_routingViewController_didSelectRoutingViewItem___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (a2)
  {
    objc_msgSend(MEMORY[0x1E0D975F8], "instantiateViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setFlags:", 1);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __86__MRUViewServiceRoutingViewController_routingViewController_didSelectRoutingViewItem___block_invoke_2;
    v6[3] = &unk_1E58191D8;
    v5 = WeakRetained;
    v7 = v5;
    objc_msgSend(v4, "setCompletion:", v6);
    objc_msgSend(v5, "setAlertViewController:", v4);

  }
}

void __86__MRUViewServiceRoutingViewController_routingViewController_didSelectRoutingViewItem___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  MCLogCategoryDefault();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_opt_class();
    objc_msgSend(v5, "mediaRouteIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412802;
    v11 = v8;
    v12 = 2112;
    v13 = v9;
    v14 = 2112;
    v15 = v6;
    _os_log_impl(&dword_1AA991000, v7, OS_LOG_TYPE_DEFAULT, "%@ ShareAudio dismissed: RouteID %@, Error %@", (uint8_t *)&v10, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 32), "setAlertViewController:", 0);

}

- (void)routingViewControllerDidUpdateItems:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  -[MRUViewServiceRoutingViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "state"))
  {

LABEL_5:
    v6 = WeakRetained;
    goto LABEL_6;
  }
  v5 = objc_opt_respondsToSelector();

  v6 = WeakRetained;
  if ((v5 & 1) != 0)
  {
    objc_msgSend(WeakRetained, "viewServiceRoutingViewControllerDidChangeSize:", self);
    goto LABEL_5;
  }
LABEL_6:

}

- (void)updateNowPlayingControllers
{
  uint64_t (**replaceRoutes)(id, SEL);
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  MRUEndpointController *v21;
  MRUNowPlayingController *v22;
  uint64_t v23;
  NSMutableDictionary *nowPlayingControllers;
  void *v25;
  id v26;
  void *v27;
  id WeakRetained;
  void *v29;
  char v30;
  __int128 v31;
  void *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  uint64_t v39;
  __int16 v40;
  void *v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  replaceRoutes = (uint64_t (**)(id, SEL))self->_replaceRoutes;
  if (replaceRoutes)
  {
    v4 = (id)replaceRoutes[2](replaceRoutes, a2);
    v5 = self->_replaceRoutes;
    self->_replaceRoutes = 0;

  }
  v6 = (void *)MEMORY[0x1E0C99DE8];
  -[MediaControlsEndpointsManager routes](self->_endpointsManager, "routes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "arrayWithCapacity:", objc_msgSend(v7, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0C99E20];
  -[NSMutableDictionary allKeys](self->_nowPlayingControllers, "allKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWithArray:", v10);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  -[MediaControlsEndpointsManager routes](self->_endpointsManager, "routes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
  v32 = v8;
  if (v12)
  {
    v14 = v12;
    v15 = *(_QWORD *)v35;
    *(_QWORD *)&v13 = 138412546;
    v31 = v13;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v35 != v15)
          objc_enumerationMutation(v11);
        v17 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        objc_msgSend(v17, "routeUID", v31);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
        {
          objc_msgSend(v8, "addObject:", v18);
          objc_msgSend(v33, "removeObject:", v18);
          -[NSMutableDictionary objectForKeyedSubscript:](self->_nowPlayingControllers, "objectForKeyedSubscript:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (v19)
            goto LABEL_14;
          -[MediaControlsEndpointsManager endpointControllerForRoute:](self->_endpointsManager, "endpointControllerForRoute:", v17);
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = -[MRUEndpointController initWithEndpointController:]([MRUEndpointController alloc], "initWithEndpointController:", v20);
          v22 = -[MRUNowPlayingController initWithEndpointController:]([MRUNowPlayingController alloc], "initWithEndpointController:", v21);
          -[MRUNowPlayingController addObserver:](v22, "addObserver:", self);
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_nowPlayingControllers, "setObject:forKeyedSubscript:", v22, v18);

          v8 = v32;
        }
        else
        {
          MCLogCategoryDefault();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            v23 = objc_opt_class();
            *(_DWORD *)buf = v31;
            v39 = v23;
            v40 = 2112;
            v41 = v17;
            _os_log_impl(&dword_1AA991000, v20, OS_LOG_TYPE_ERROR, "%@ ignoring endpoint route with no routeUID: %@", buf, 0x16u);
          }
        }

LABEL_14:
      }
      v14 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    }
    while (v14);
  }

  nowPlayingControllers = self->_nowPlayingControllers;
  objc_msgSend(v33, "allObjects");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectsForKeys:](nowPlayingControllers, "removeObjectsForKeys:", v25);

  v26 = objc_alloc_init(MEMORY[0x1E0DC3398]);
  objc_msgSend(v26, "appendSectionsWithIdentifiers:", &unk_1E58784B0);
  objc_msgSend(v26, "appendItemsWithIdentifiers:", v8);
  -[UITableViewDiffableDataSource applySnapshot:animatingDifferences:](self->_dataSource, "applySnapshot:animatingDifferences:", v26, 1);
  -[MRUViewServiceRoutingViewController updateSelectedViewController](self, "updateSelectedViewController");
  -[MRUViewServiceRoutingViewController updateMoreButtonVisibility](self, "updateMoreButtonVisibility");
  -[NSMutableDictionary allValues](self->_nowPlayingControllers, "allValues");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRURoutingViewController setNowPlayingControllers:](self->_routingViewController, "setNowPlayingControllers:", v27);

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  -[MRUViewServiceRoutingViewController view](self, "view");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v29, "state") == 1)
  {
    v30 = objc_opt_respondsToSelector();

    if ((v30 & 1) != 0)
      objc_msgSend(WeakRetained, "viewServiceRoutingViewControllerDidChangeSize:", self);
  }
  else
  {

  }
}

- (void)updateMoreButtonVisibility
{
  void *v3;
  uint64_t v4;
  _BOOL8 v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  MPMediaControlsConfiguration *configuration;
  uint64_t v10;
  _QWORD v11[5];
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  MPMediaControlsConfiguration *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (-[MRUViewServiceRoutingViewController isViewLoaded](self, "isViewLoaded"))
  {
    if (self->_onScreen
      && (-[MRUViewServiceRoutingViewController view](self, "view"),
          v3 = (void *)objc_claimAutoreleasedReturnValue(),
          v4 = objc_msgSend(v3, "state"),
          v3,
          v4 == 1))
    {
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __65__MRUViewServiceRoutingViewController_updateMoreButtonVisibility__block_invoke;
      v11[3] = &unk_1E5818C88;
      v11[4] = self;
      objc_msgSend(MEMORY[0x1E0DC3F10], "mru_animateUsingType:animations:", 0, v11);
    }
    else
    {
      v5 = -[MRUViewServiceRoutingViewController canShowMoreButton](self, "canShowMoreButton");
      -[MRUViewServiceRoutingViewController view](self, "view");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setFooterVisible:", v5);

    }
    -[MRUViewServiceRoutingViewController updateRoutingViewControllerScrollIndicatorInsets](self, "updateRoutingViewControllerScrollIndicatorInsets");
    MCLogCategoryDefault();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = objc_opt_class();
      configuration = self->_configuration;
      v10 = -[NSMutableDictionary count](self->_nowPlayingControllers, "count");
      *(_DWORD *)buf = 138543874;
      v13 = v8;
      v14 = 2114;
      v15 = configuration;
      v16 = 2048;
      v17 = v10;
      _os_log_impl(&dword_1AA991000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ can control other devices, configuration: %{public}@ | endpoint #: %lu", buf, 0x20u);
    }

  }
}

void __65__MRUViewServiceRoutingViewController_updateMoreButtonVisibility__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = objc_msgSend(*(id *)(a1 + 32), "canShowMoreButton");
  objc_msgSend(*(id *)(a1 + 32), "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFooterVisible:", v2);

  objc_msgSend(*(id *)(a1 + 32), "view");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutIfNeeded");

}

- (void)updateDiscoveryMode
{
  uint64_t v3;

  if (self->_onScreen)
    v3 = 3;
  else
    v3 = 0;
  -[MediaControlsEndpointsManager setDiscoveryMode:](self->_endpointsManager, "setDiscoveryMode:", v3);
  -[MRURoutingViewController setDiscoveryMode:](self->_routingViewController, "setDiscoveryMode:", v3);
}

- (void)updateRoutingViewController
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  MRUOutputDeviceRoutingDataSource *v7;
  MRUOutputDeviceRoutingDataSource *outputDeviceRoutingDataSource;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  MRUVendorSpecificDeviceManager *vendorSpecificManager;
  void *v20;
  MRURoutingViewController *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  uint8_t buf[4];
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@(devices)"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_alloc_init(MRUOutputDeviceRoutingDataSource);
  outputDeviceRoutingDataSource = self->_outputDeviceRoutingDataSource;
  self->_outputDeviceRoutingDataSource = v7;

  -[MRUNowPlayingController endpointController](self->_selectedNowPlayingController, "endpointController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "route");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUOutputDeviceRoutingDataSource setEndpointRoute:](self->_outputDeviceRoutingDataSource, "setEndpointRoute:", v10);

  -[MRUOutputDeviceRoutingDataSource setDetachesRoutesToGroup:](self->_outputDeviceRoutingDataSource, "setDetachesRoutesToGroup:", 1);
  -[MPMediaControlsConfiguration routingContextUID](self->_configuration, "routingContextUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUOutputDeviceRoutingDataSource setRoutingContextUID:](self->_outputDeviceRoutingDataSource, "setRoutingContextUID:", v11);

  -[MRUOutputDeviceRoutingDataSource setInitiator:](self->_outputDeviceRoutingDataSource, "setInitiator:", *MEMORY[0x1E0CF63F8]);
  -[MRUOutputDeviceRoutingDataSource setSupportsQueueHandoff:](self->_outputDeviceRoutingDataSource, "setSupportsQueueHandoff:", self->_supportsQueueHandoff);
  -[MPMediaControlsConfiguration presentingAppBundleID](self->_configuration, "presentingAppBundleID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUOutputDeviceRoutingDataSource setPresentingAppBundleID:](self->_outputDeviceRoutingDataSource, "setPresentingAppBundleID:", v12);

  -[MPMediaControlsConfiguration nowPlayingAppBundleID](self->_configuration, "nowPlayingAppBundleID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUOutputDeviceRoutingDataSource setNowPlayingAppBundleID:](self->_outputDeviceRoutingDataSource, "setNowPlayingAppBundleID:", v13);

  -[MPMediaControlsConfiguration visibleMediaApps](self->_configuration, "visibleMediaApps");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUOutputDeviceRoutingDataSource setVisibleMediaApps:](self->_outputDeviceRoutingDataSource, "setVisibleMediaApps:", v14);

  -[MPMediaControlsConfiguration donatingAppBundleID](self->_configuration, "donatingAppBundleID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUOutputDeviceRoutingDataSource setDonatingAppBundleID:](self->_outputDeviceRoutingDataSource, "setDonatingAppBundleID:", v15);

  -[MRUOutputDeviceRoutingDataSource setDonatingAppEligible:](self->_outputDeviceRoutingDataSource, "setDonatingAppEligible:", -[MPMediaControlsConfiguration isDonatingAppEligible](self->_configuration, "isDonatingAppEligible"));
  v16 = -[MPMediaControlsConfiguration style](self->_configuration, "style");
  if (v16 <= 5 && ((0x2Fu >> v16) & 1) != 0)
  {
    -[MRUOutputDeviceRoutingDataSource setSupportsMultipleSelection:](self->_outputDeviceRoutingDataSource, "setSupportsMultipleSelection:", (0xDu >> v16) & 1);
    -[MPAVRoutingDataSource setFilterMode:](self->_outputDeviceRoutingDataSource, "setFilterMode:", 0);
  }
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC2318]), "initWithDataSource:name:", self->_outputDeviceRoutingDataSource, v6);
  -[MPMediaControlsConfiguration presentingAppBundleID](self->_configuration, "presentingAppBundleID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setPresentedBundleID:", v18);

  objc_msgSend(v17, "setPlaybackDataSource:", self->_endpointsManager);
  objc_msgSend(v17, "setFetchAvailableRoutesSynchronously:", 1);
  vendorSpecificManager = self->_vendorSpecificManager;
  objc_msgSend(v17, "availableRoutes");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUVendorSpecificDeviceManager resolverAddNativeRoutes:](vendorSpecificManager, "resolverAddNativeRoutes:", v20);

  objc_msgSend(v17, "setFetchAvailableRoutesSynchronously:", 0);
  v21 = -[MRURoutingViewController initWithRoutingController:]([MRURoutingViewController alloc], "initWithRoutingController:", v17);
  -[MRUViewServiceRoutingViewController setRoutingViewController:](self, "setRoutingViewController:", v21);

  -[MRURoutingViewController setPresentingAppProcessIdentifier:](self->_routingViewController, "setPresentingAppProcessIdentifier:", -[MPMediaControlsConfiguration presentingAppProcessIdentifier](self->_configuration, "presentingAppProcessIdentifier"));
  -[MPMediaControlsConfiguration presentingAppBundleID](self->_configuration, "presentingAppBundleID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRURoutingViewController setPresentingAppBundleID:](self->_routingViewController, "setPresentingAppBundleID:", v22);

  -[MPMediaControlsConfiguration presentingAppBundleID](self->_configuration, "presentingAppBundleID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUOutputDeviceRoutingDataSource setPresentingAppBundleID:](self->_outputDeviceRoutingDataSource, "setPresentingAppBundleID:", v23);

  -[MPMediaControlsConfiguration nowPlayingAppBundleID](self->_configuration, "nowPlayingAppBundleID");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRURoutingViewController setNowPlayingAppBundleID:](self->_routingViewController, "setNowPlayingAppBundleID:", v24);

  -[MPMediaControlsConfiguration visibleMediaApps](self->_configuration, "visibleMediaApps");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRURoutingViewController setVisibleMediaApps:](self->_routingViewController, "setVisibleMediaApps:", v25);

  -[MPMediaControlsConfiguration donatingAppBundleID](self->_configuration, "donatingAppBundleID");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRURoutingViewController setDonatingAppBundleID:](self->_routingViewController, "setDonatingAppBundleID:", v26);

  -[MRURoutingViewController setDonatingAppEligible:](self->_routingViewController, "setDonatingAppEligible:", -[MPMediaControlsConfiguration isDonatingAppEligible](self->_configuration, "isDonatingAppEligible"));
  -[MRURoutingViewController setVendorSpecificManager:](self->_routingViewController, "setVendorSpecificManager:", self->_vendorSpecificManager);
  -[MRUNowPlayingController endpointController](self->_selectedNowPlayingController, "endpointController");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "route");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRURoutingViewController setEndpointRoute:](self->_routingViewController, "setEndpointRoute:", v28);

  -[MRURoutingViewController setDelegate:](self->_routingViewController, "setDelegate:", self);
  -[MRURoutingViewController setSortByIsVideoRoute:](self->_routingViewController, "setSortByIsVideoRoute:", -[MPMediaControlsConfiguration sortByIsVideoRoute](self->_configuration, "sortByIsVideoRoute"));
  -[MRURoutingViewController setShowMetadataForEndpointRoute:](self->_routingViewController, "setShowMetadataForEndpointRoute:", 1);
  -[MRURoutingViewController setContentEdgeInsets:](self->_routingViewController, "setContentEdgeInsets:", 0.0, 24.0, 0.0, 24.0);
  MCLogCategoryDeviceAccess();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    -[MPMediaControlsConfiguration customRows](self->_configuration, "customRows");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v33 = v30;
    _os_log_impl(&dword_1AA991000, v29, OS_LOG_TYPE_DEFAULT, "config customRows: %@", buf, 0xCu);

  }
  -[MPMediaControlsConfiguration customRows](self->_configuration, "customRows");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRURoutingViewController setCustomRows:](self->_routingViewController, "setCustomRows:", v31);

}

- (void)updateSelectedViewController
{
  void *v3;
  uint64_t v4;
  NSMutableDictionary *nowPlayingControllers;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  char v16;
  NSMutableDictionary *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  -[MPMediaControlsConfiguration routeUID](self->_configuration, "routeUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    nowPlayingControllers = self->_nowPlayingControllers;
    -[MPMediaControlsConfiguration routeUID](self->_configuration, "routeUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](nowPlayingControllers, "objectForKeyedSubscript:", v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      -[NSMutableDictionary allValues](self->_nowPlayingControllers, "allValues", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (id)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v7)
      {
        v9 = *(_QWORD *)v23;
        while (2)
        {
          for (i = 0; i != v7; i = (char *)i + 1)
          {
            if (*(_QWORD *)v23 != v9)
              objc_enumerationMutation(v8);
            v11 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
            objc_msgSend(v11, "endpointController");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            -[MPMediaControlsConfiguration routeUID](self->_configuration, "routeUID");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v12, "containsOutputDeviceWithRouteUID:", v13);

            if (v14)
            {
              v7 = v11;
              goto LABEL_16;
            }
          }
          v7 = (id)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
          if (v7)
            continue;
          break;
        }
      }
LABEL_16:

    }
  }
  else
  {
    if (self->_canShowRemoteDevices)
    {
      -[MediaControlsEndpointsManager activeSystemRoute](self->_endpointsManager, "activeSystemRoute");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "canModifyGroupMembership");

      if ((v16 & 1) == 0)
      {
        -[MRUViewServiceRoutingViewController setState:](self, "setState:", 1);
        -[MRUViewServiceRoutingViewController view](self, "view");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "layoutIfNeeded");

        v7 = 0;
        goto LABEL_20;
      }
      v17 = self->_nowPlayingControllers;
      -[MediaControlsEndpointsManager activeSystemRoute](self->_endpointsManager, "activeSystemRoute");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = self->_nowPlayingControllers;
      objc_msgSend(MEMORY[0x1E0CC2318], "systemRoute");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v19 = v18;
    objc_msgSend(v18, "routeUID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](v17, "objectForKeyedSubscript:", v20);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
LABEL_20:
  -[MRUViewServiceRoutingViewController setSelectedNowPlayingController:](self, "setSelectedNowPlayingController:", v7);

}

- (void)updateRoutingViewControllerScrollIndicatorInsets
{
  double v3;
  id v4;

  if (-[MRUViewServiceRoutingViewController canShowMoreButton](self, "canShowMoreButton"))
  {
    -[MRURoutingViewController setScrollIndicatorInsets:](self->_routingViewController, "setScrollIndicatorInsets:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
  }
  else
  {
    -[MRUViewServiceRoutingViewController view](self, "view");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cornerRadius");
    -[MRURoutingViewController setScrollIndicatorInsets:](self->_routingViewController, "setScrollIndicatorInsets:", 0.0, 0.0, v3, 0.0);

  }
}

- (void)updateCellForIdentifier:(id)a3
{
  UITableViewDiffableDataSource *dataSource;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  dataSource = self->_dataSource;
  v5 = a3;
  -[UITableViewDiffableDataSource indexPathForItemIdentifier:](dataSource, "indexPathForItemIdentifier:", v5);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[MRUViewServiceRoutingViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cellForRowAtIndexPath:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[MRUViewServiceRoutingViewController updateCell:forIdentifier:](self, "updateCell:forIdentifier:", v8, v5);
}

- (void)updateCell:(id)a3 forIdentifier:(id)a4
{
  NSMutableDictionary *nowPlayingControllers;
  id v6;
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
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v34;

  nowPlayingControllers = self->_nowPlayingControllers;
  v6 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](nowPlayingControllers, "objectForKeyedSubscript:", a4);
  v34 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "endpointController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "route");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v34, "metadataController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "artwork");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v34, "metadataController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "nowPlayingInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v34, "quickControlItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cellContentView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "artworkView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "cellContentView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "headerView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "cellContentView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "headerView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "labelView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setArtwork:", v9);
  v20 = (void *)MEMORY[0x1E0DC3870];
  objc_msgSend(v34, "deviceSymbolName");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "_systemImageNamed:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setPlaceholderImage:", v22);

  objc_msgSend(v19, "setRoute:", v32);
  objc_msgSend(v11, "stringForComponents:", 59);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setTitle:", v23);

  objc_msgSend(v11, "placeholder");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setPlaceholder:", v24);

  objc_msgSend(v19, "setShowPlaceholder:", objc_msgSend(v11, "showPlaceholder"));
  objc_msgSend(v34, "identifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "transportButton");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setIdentifier:", v25);

  objc_msgSend(v16, "setShowTransportButton:", objc_msgSend(v12, "isEnabled"));
  objc_msgSend(v16, "transportButton");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "asset");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setAsset:", v28);

  objc_msgSend(v16, "transportButton");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "addTarget:action:forControlEvents:", self, sel_didSelectQuickControl_, 64);

  -[MRUViewServiceRoutingViewController view](self, "view");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "stylingProvider");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setStylingProvider:", v31);

  objc_msgSend(v6, "setContentEdgeInsets:", 24.0, 24.0, 24.0, 24.0);
}

- (MPMediaControlsConfiguration)configuration
{
  return self->_configuration;
}

- (MRUVisualStylingProvider)stylingProvider
{
  return self->_stylingProvider;
}

- (MRUViewServiceRoutingViewControllerDelegate)delegate
{
  return (MRUViewServiceRoutingViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (MediaControlsEndpointsManager)endpointsManager
{
  return self->_endpointsManager;
}

- (void)setEndpointsManager:(id)a3
{
  objc_storeStrong((id *)&self->_endpointsManager, a3);
}

- (MRURoutingViewController)routingViewController
{
  return self->_routingViewController;
}

- (MRUOutputDeviceRoutingDataSource)outputDeviceRoutingDataSource
{
  return self->_outputDeviceRoutingDataSource;
}

- (void)setOutputDeviceRoutingDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_outputDeviceRoutingDataSource, a3);
}

- (UITableViewDiffableDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (NSMutableDictionary)nowPlayingControllers
{
  return self->_nowPlayingControllers;
}

- (void)setNowPlayingControllers:(id)a3
{
  objc_storeStrong((id *)&self->_nowPlayingControllers, a3);
}

- (MRUNowPlayingController)selectedNowPlayingController
{
  return self->_selectedNowPlayingController;
}

- (id)replaceRoutes
{
  return self->_replaceRoutes;
}

- (void)setReplaceRoutes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1048);
}

- (BOOL)isOnScreen
{
  return self->_onScreen;
}

- (BOOL)canShowRemoteDevices
{
  return self->_canShowRemoteDevices;
}

- (void)setCanShowRemoteDevices:(BOOL)a3
{
  self->_canShowRemoteDevices = a3;
}

- (BOOL)supportsQueueHandoff
{
  return self->_supportsQueueHandoff;
}

- (void)setSupportsQueueHandoff:(BOOL)a3
{
  self->_supportsQueueHandoff = a3;
}

- (UIViewController)alertViewController
{
  return self->_alertViewController;
}

- (MRUVendorSpecificDeviceManager)vendorSpecificManager
{
  return self->_vendorSpecificManager;
}

- (void)setVendorSpecificManager:(id)a3
{
  objc_storeStrong((id *)&self->_vendorSpecificManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vendorSpecificManager, 0);
  objc_storeStrong((id *)&self->_alertViewController, 0);
  objc_storeStrong(&self->_replaceRoutes, 0);
  objc_storeStrong((id *)&self->_selectedNowPlayingController, 0);
  objc_storeStrong((id *)&self->_nowPlayingControllers, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_outputDeviceRoutingDataSource, 0);
  objc_storeStrong((id *)&self->_routingViewController, 0);
  objc_storeStrong((id *)&self->_endpointsManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_stylingProvider, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
