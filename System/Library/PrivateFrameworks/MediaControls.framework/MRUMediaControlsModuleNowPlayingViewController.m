@implementation MRUMediaControlsModuleNowPlayingViewController

- (MRUMediaControlsModuleNowPlayingViewController)init
{
  MRUMediaControlsModuleNowPlayingViewController *v2;
  MRUMediaControlsModuleNowPlayingViewController *v3;
  MRUMediaControlsModuleNowPlayingViewController *v4;
  _QWORD v6[5];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MRUMediaControlsModuleNowPlayingViewController;
  v2 = -[MRUMediaControlsModuleNowPlayingViewController init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __54__MRUMediaControlsModuleNowPlayingViewController_init__block_invoke;
    v6[3] = &unk_1E58193D8;
    v6[4] = v2;
    v4 = v2;
    v4->_stateHandle = __54__MRUMediaControlsModuleNowPlayingViewController_init__block_invoke((uint64_t)v6);

  }
  return v3;
}

uint64_t __54__MRUMediaControlsModuleNowPlayingViewController_init__block_invoke(uint64_t a1)
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
  v5[2] = __54__MRUMediaControlsModuleNowPlayingViewController_init__block_invoke_2;
  v5[3] = &unk_1E58193B0;
  objc_copyWeak(&v6, &location);
  v3 = MCLogAddStateHandlerWithName(v2, v5);
  objc_destroyWeak(&v6);

  objc_destroyWeak(&location);
  return v3;
}

id __54__MRUMediaControlsModuleNowPlayingViewController_init__block_invoke_2(uint64_t a1, uint64_t a2)
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
      objc_msgSend(WeakRetained, "_stateDumpObject");
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

- (void)loadView
{
  MRUMediaControlsModuleNowPlayingView *v3;

  v3 = objc_alloc_init(MRUMediaControlsModuleNowPlayingView);
  -[MRUMediaControlsModuleNowPlayingViewController setView:](self, "setView:", v3);

}

- (void)viewDidLoad
{
  int64_t layout;
  void *v4;
  double top;
  double left;
  double bottom;
  double right;
  void *v9;
  MRUVisualStylingProvider *stylingProvider;
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
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  objc_super v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v34.receiver = self;
  v34.super_class = (Class)MRUMediaControlsModuleNowPlayingViewController;
  -[MRUMediaControlsModuleNowPlayingViewController viewDidLoad](&v34, sel_viewDidLoad);
  layout = self->_layout;
  -[MRUMediaControlsModuleNowPlayingViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLayout:", layout);

  top = self->_contentEdgeInsets.top;
  left = self->_contentEdgeInsets.left;
  bottom = self->_contentEdgeInsets.bottom;
  right = self->_contentEdgeInsets.right;
  -[MRUMediaControlsModuleNowPlayingViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setContentEdgeInsets:", top, left, bottom, right);

  stylingProvider = self->_stylingProvider;
  -[MRUMediaControlsModuleNowPlayingViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setStylingProvider:", stylingProvider);

  -[MRUMediaControlsModuleNowPlayingViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "artworkView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addTarget:action:forControlEvents:", self, sel_didSelectArtworkView_, 64);

  -[MRUMediaControlsModuleNowPlayingViewController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "artworkView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObserver:", self);

  -[MRUMediaControlsModuleNowPlayingViewController view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "headerView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "labelView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addTarget:action:forControlEvents:", self, sel_didSelectLabelView_, 64);

  -[MRUMediaControlsModuleNowPlayingViewController view](self, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "volumeControlsView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setDelegate:", self);

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  -[MRUMediaControlsModuleNowPlayingViewController view](self, "view", 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "routingButtons");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v31 != v25)
          objc_enumerationMutation(v22);
        objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i), "addTarget:action:forControlEvents:", self, sel_didSelectRouteButton_, 64);
      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v24);
  }

  -[MRUMediaControlsModuleNowPlayingViewController view](self, "view");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "transportControlsView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setDelegate:", self);

  +[MRUCallMonitor sharedMonitor](MRUCallMonitor, "sharedMonitor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "addObserver:", self);

  -[MRUMediaControlsModuleNowPlayingViewController createWaveformViewController](self, "createWaveformViewController");
  -[MRUMediaControlsModuleNowPlayingViewController createHapticViewController](self, "createHapticViewController");
  -[MRUMediaControlsModuleNowPlayingViewController registerHapticObserver](self, "registerHapticObserver");
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MRUMediaControlsModuleNowPlayingViewController;
  -[MRUMediaControlsModuleNowPlayingViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[MRUMediaControlsModuleNowPlayingViewController setOnScreen:](self, "setOnScreen:", 1);
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MRUMediaControlsModuleNowPlayingViewController;
  -[MRUMediaControlsModuleNowPlayingViewController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  -[MRUMediaControlsModuleNowPlayingViewController setOnScreen:](self, "setOnScreen:", 0);
}

- (void)dealloc
{
  objc_super v3;

  os_state_remove_handler();
  -[MRUNowPlayingController updateAutomaticResponseLoading](self->_controller, "updateAutomaticResponseLoading");
  v3.receiver = self;
  v3.super_class = (Class)MRUMediaControlsModuleNowPlayingViewController;
  -[MRUMediaControlsModuleNowPlayingViewController dealloc](&v3, sel_dealloc);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[MRUMediaControlsModuleNowPlayingViewController controller](self, "controller");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "endpointController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "route");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p route: %@"), v4, self, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (MRUArtworkView)artworkView
{
  void *v2;
  void *v3;

  -[MRUMediaControlsModuleNowPlayingViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "artworkView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MRUArtworkView *)v3;
}

- (void)setOnScreen:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  id v7;

  if (self->_onScreen != a3)
  {
    v3 = a3;
    self->_onScreen = a3;
    -[MRUMediaControlsModuleNowPlayingViewController controller](self, "controller");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "updateAutomaticResponseLoading");

    -[MRUMediaControlsModuleNowPlayingViewController updateRoute](self, "updateRoute");
    -[MRUMediaControlsModuleNowPlayingViewController updateRoutingButton](self, "updateRoutingButton");
    -[MRUMediaControlsModuleNowPlayingViewController updateArtwork](self, "updateArtwork");
    -[MRUMediaControlsModuleNowPlayingViewController updateNowPlayingInfo](self, "updateNowPlayingInfo");
    -[MRUMediaControlsModuleNowPlayingViewController updateTimeControls](self, "updateTimeControls");
    -[MRUMediaControlsModuleNowPlayingViewController updateTransportControls](self, "updateTransportControls");
    -[MRUMediaControlsModuleNowPlayingViewController updateVolumeControls](self, "updateVolumeControls");
    -[MRUMediaControlsModuleNowPlayingViewController updateQuickControl](self, "updateQuickControl");
    -[MRUMediaControlsModuleNowPlayingViewController updateSuggestions](self, "updateSuggestions");
    -[MRUMediaControlsModuleNowPlayingViewController updateVisibility](self, "updateVisibility");
    -[MRUMediaControlsModuleNowPlayingViewController updateWaveformVisibility](self, "updateWaveformVisibility");
    if (v3)
    {
      -[MRUMediaControlsModuleNowPlayingViewController controller](self, "controller");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "mediaSuggestionsController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "refreshMediaSuggestions");

    }
  }
}

- (void)setController:(id)a3
{
  MRUNowPlayingController *v4;
  MRUNowPlayingController *controller;
  MRUNowPlayingController *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = (MRUNowPlayingController *)a3;
  -[MRUNowPlayingController removeObserver:](self->_controller, "removeObserver:", self);
  controller = self->_controller;
  self->_controller = v4;
  v6 = v4;

  -[MRUNowPlayingController addObserver:](self->_controller, "addObserver:", self);
  -[MRUWaveformController setNowPlayingController:](self->_waveformController, "setNowPlayingController:", v6);
  -[MRUHapticViewController setNowPlayingController:](self->_hapticViewController, "setNowPlayingController:", v6);

  -[MRUMediaControlsModuleNowPlayingViewController controller](self, "controller");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tvRemoteController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setContext:", 1);

  -[MRUMediaControlsModuleNowPlayingViewController controller](self, "controller");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "mediaSuggestionsController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "refreshMediaSuggestions");

  -[MRUMediaControlsModuleNowPlayingViewController updateRoute](self, "updateRoute");
  -[MRUMediaControlsModuleNowPlayingViewController updateRoutingButton](self, "updateRoutingButton");
  -[MRUMediaControlsModuleNowPlayingViewController updateArtwork](self, "updateArtwork");
  -[MRUMediaControlsModuleNowPlayingViewController updateNowPlayingInfo](self, "updateNowPlayingInfo");
  -[MRUMediaControlsModuleNowPlayingViewController updateTimeControls](self, "updateTimeControls");
  -[MRUMediaControlsModuleNowPlayingViewController updateTransportControls](self, "updateTransportControls");
  -[MRUMediaControlsModuleNowPlayingViewController updateQuickControl](self, "updateQuickControl");
  -[MRUMediaControlsModuleNowPlayingViewController updateVolumeControls](self, "updateVolumeControls");
  -[MRUMediaControlsModuleNowPlayingViewController updateSuggestions](self, "updateSuggestions");
  -[MRUMediaControlsModuleNowPlayingViewController updateVisibility](self, "updateVisibility");
  -[MRUMediaControlsModuleNowPlayingViewController updateWaveformVisibility](self, "updateWaveformVisibility");
}

- (void)setVolumeController:(id)a3
{
  id v5;
  void *v6;
  void *v7;

  objc_storeStrong((id *)&self->_volumeController, a3);
  v5 = a3;
  -[MRUMediaControlsModuleNowPlayingViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "volumeControlsView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setVolumeController:", v5);

  -[MRUMediaControlsModuleNowPlayingViewController updateVolumeControls](self, "updateVolumeControls");
}

- (void)setVolumeGroupCoordinator:(id)a3
{
  id v5;
  void *v6;
  id v7;

  objc_storeStrong((id *)&self->_volumeGroupCoordinator, a3);
  v5 = a3;
  -[MRUMediaControlsModuleNowPlayingViewController view](self, "view");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "volumeControlsView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setVolumeGroupCoordinator:", v5);

}

- (void)setLayout:(int64_t)a3
{
  void *v5;
  void *v6;

  if (self->_layout != a3)
  {
    self->_layout = a3;
    -[MRUMediaControlsModuleNowPlayingViewController viewIfLoaded](self, "viewIfLoaded");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setLayout:", a3);

    -[MRUMediaControlsModuleNowPlayingViewController suggestionsViewController](self, "suggestionsViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setLayout:", 0);

    -[MRUMediaControlsModuleNowPlayingViewController updateArtwork](self, "updateArtwork");
    -[MRUMediaControlsModuleNowPlayingViewController updateRoute](self, "updateRoute");
    -[MRUMediaControlsModuleNowPlayingViewController updateRoutingButton](self, "updateRoutingButton");
    -[MRUMediaControlsModuleNowPlayingViewController updateNowPlayingInfo](self, "updateNowPlayingInfo");
    -[MRUMediaControlsModuleNowPlayingViewController updateVolumeControls](self, "updateVolumeControls");
    -[MRUMediaControlsModuleNowPlayingViewController updateSuggestions](self, "updateSuggestions");
    -[MRUMediaControlsModuleNowPlayingViewController updateVisibility](self, "updateVisibility");
    -[MRUMediaControlsModuleNowPlayingViewController updateWaveformVisibility](self, "updateWaveformVisibility");
  }
}

- (void)setContentEdgeInsets:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;
  double v7;
  void *v12;
  id v13;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  v7 = self->_contentEdgeInsets.top;
  if (self->_contentEdgeInsets.left != a3.left
    || v7 != top
    || self->_contentEdgeInsets.right != a3.right
    || self->_contentEdgeInsets.bottom != a3.bottom)
  {
    self->_contentEdgeInsets.top = top;
    self->_contentEdgeInsets.left = a3.left;
    self->_contentEdgeInsets.bottom = a3.bottom;
    self->_contentEdgeInsets.right = a3.right;
    -[MRUMediaControlsModuleNowPlayingViewController viewIfLoaded](self, "viewIfLoaded", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setContentEdgeInsets:", top, left, bottom, right);

    -[MRUMediaControlsModuleNowPlayingViewController suggestionsViewController](self, "suggestionsViewController");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setContentEdgeInsets:", top, left, bottom, right);

  }
}

- (void)setResizing:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  self->_resizing = a3;
  -[MRUMediaControlsModuleNowPlayingViewController view](self, "view");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setResizing:", v3);

}

- (void)setStylingProvider:(id)a3
{
  MRUVisualStylingProvider **p_stylingProvider;
  void *v6;
  void *v7;
  MRUVisualStylingProvider *v8;

  p_stylingProvider = &self->_stylingProvider;
  v8 = (MRUVisualStylingProvider *)a3;
  if (*p_stylingProvider != v8)
  {
    objc_storeStrong((id *)&self->_stylingProvider, a3);
    -[MRUVisualStylingProvider setTraitChangeObservable:](*p_stylingProvider, "setTraitChangeObservable:", self);
    -[MRUMediaControlsModuleNowPlayingViewController viewIfLoaded](self, "viewIfLoaded");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setStylingProvider:", v8);

    -[MRUMediaControlsModuleNowPlayingViewController suggestionsViewController](self, "suggestionsViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setStylingProvider:", v8);

  }
}

- (BOOL)shouldExpandModuleOnTouch:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  void *v15;
  CGFloat v16;
  CGFloat v17;
  int v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;
  CGPoint v33;
  CGRect v34;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MRUMediaControlsModuleNowPlayingViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "transportControlsView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "frame");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[MRUMediaControlsModuleNowPlayingViewController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v15);
  v33.x = v16;
  v33.y = v17;
  v34.origin.x = v8;
  v34.origin.y = v10;
  v34.size.width = v12;
  v34.size.height = v14;
  v18 = !CGRectContainsPoint(v34, v33);

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[MRUMediaControlsModuleNowPlayingViewController view](self, "view", 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "routingButtons");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v28 != v23)
          objc_enumerationMutation(v20);
        v25 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v4, "locationInView:", v25);
        if ((v18 & 1) != 0)
          v18 = objc_msgSend(v25, "pointInside:withEvent:", 0) ^ 1;
        else
          LOBYTE(v18) = 0;
      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v22);
  }

  return v18;
}

- (void)didSelectQuickControl:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  -[MRUNowPlayingController quickControlItem](self->_controller, "quickControlItem", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mainAction");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v4 = v5;
  if (v5)
  {
    (*((void (**)(id))v5 + 2))(v5);
    v4 = v5;
  }

}

- (BOOL)nowPlayingControllerShouldAutomaticallyUpdateResponse:(id)a3
{
  return self->_onScreen;
}

- (void)nowPlayingController:(id)a3 metadataController:(id)a4 didChangeBundleID:(id)a5
{
  -[MRUMediaControlsModuleNowPlayingViewController updateRoute](self, "updateRoute", a3, a4, a5);
  -[MRUMediaControlsModuleNowPlayingViewController updateRoutingButton](self, "updateRoutingButton");
}

- (void)nowPlayingController:(id)a3 endpointController:(id)a4 didChangeRoute:(id)a5
{
  -[MRUMediaControlsModuleNowPlayingViewController updateNowPlayingInfo](self, "updateNowPlayingInfo", a3, a4, a5);
  -[MRUMediaControlsModuleNowPlayingViewController updateVolumeControls](self, "updateVolumeControls");
  -[MRUMediaControlsModuleNowPlayingViewController updateRoutingButtonAnimated:](self, "updateRoutingButtonAnimated:", 1);
  -[MRUMediaControlsModuleNowPlayingViewController updateLayout](self, "updateLayout");
}

- (void)nowPlayingController:(id)a3 tvRemoteController:(id)a4 didChangeShowTVRemote:(BOOL)a5
{
  uint64_t v6;
  void *v7;
  id v8;

  v6 = objc_msgSend(a4, "showTVRemote", a3);
  -[MRUMediaControlsModuleNowPlayingViewController view](self, "view");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "transportControlsView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setShowTVRemoteButton:", v6);

}

- (void)mediaSuggestionsViewController:(id)a3 didSelectSuggestion:(id)a4 completion:(id)a5
{
  id v7;
  MRUNowPlayingController *controller;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v7 = a5;
  controller = self->_controller;
  v9 = a4;
  -[MRUNowPlayingController mediaSuggestionsController](controller, "mediaSuggestionsController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __112__MRUMediaControlsModuleNowPlayingViewController_mediaSuggestionsViewController_didSelectSuggestion_completion___block_invoke;
  v12[3] = &unk_1E5819400;
  v13 = v7;
  v11 = v7;
  objc_msgSend(v10, "playSuggestion:completion:", v9, v12);

}

uint64_t __112__MRUMediaControlsModuleNowPlayingViewController_mediaSuggestionsViewController_didSelectSuggestion_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)transportControlsView:(id)a3 didSelectTVRemoteButton:(id)a4
{
  id WeakRetained;
  _QWORD v6[5];

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __96__MRUMediaControlsModuleNowPlayingViewController_transportControlsView_didSelectTVRemoteButton___block_invoke;
  v6[3] = &unk_1E5818C88;
  v6[4] = self;
  objc_msgSend(WeakRetained, "nowPlayingViewController:cordinateDismissal:", self, v6);

}

void __96__MRUMediaControlsModuleNowPlayingViewController_transportControlsView_didSelectTVRemoteButton___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "controller");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tvRemoteController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "presentTVRemoteUsingApp:", 0);

}

- (void)registerHapticObserver
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_handleHapticEnabledStatusChangedNotification_, *MEMORY[0x1E0CC1C88], 0);

}

- (void)createWaveformViewController
{
  MRUWaveformController *v3;
  MRUWaveformController *waveformController;
  MRUWaveformViewController *v5;
  MRUWaveformViewController *waveformViewController;
  void *v7;
  void *v8;
  void *v9;

  v3 = objc_alloc_init(MRUWaveformController);
  waveformController = self->_waveformController;
  self->_waveformController = v3;

  v5 = -[MRUWaveformViewController initWithContext:waveformController:]([MRUWaveformViewController alloc], "initWithContext:waveformController:", 1, self->_waveformController);
  waveformViewController = self->_waveformViewController;
  self->_waveformViewController = v5;

  -[MRUWaveformController setNowPlayingController:](self->_waveformController, "setNowPlayingController:", self->_controller);
  -[MRUMediaControlsModuleNowPlayingViewController addChildViewController:](self, "addChildViewController:", self->_waveformViewController);
  -[MRUWaveformViewController view](self->_waveformViewController, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUMediaControlsModuleNowPlayingViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "headerView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWaveformView:", v7);

  -[MRUWaveformViewController didMoveToParentViewController:](self->_waveformViewController, "didMoveToParentViewController:", self);
}

- (void)createHapticViewController
{
  MRUHapticViewController *v3;
  MRUHapticViewController *hapticViewController;
  void *v5;
  void *v6;
  void *v7;

  v3 = -[MRUHapticViewController initWithContext:nowPlayingController:]([MRUHapticViewController alloc], "initWithContext:nowPlayingController:", 1, self->_controller);
  hapticViewController = self->_hapticViewController;
  self->_hapticViewController = v3;

  -[MRUMediaControlsModuleNowPlayingViewController addChildViewController:](self, "addChildViewController:", self->_hapticViewController);
  -[MRUHapticViewController view](self->_hapticViewController, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUMediaControlsModuleNowPlayingViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "headerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHapticView:", v5);

  -[MRUWaveformViewController didMoveToParentViewController:](self->_waveformViewController, "didMoveToParentViewController:", self);
}

- (void)createSuggestionsViewController
{
  void *v3;
  MRUMediaSuggestionsViewController *v4;
  MRUMediaSuggestionsViewController *suggestionsViewController;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[MRUNowPlayingController mediaSuggestionsController](self->_controller, "mediaSuggestionsController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mediaSuggestions");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v4 = -[MRUMediaSuggestionsViewController initWithMediaSuggestions:]([MRUMediaSuggestionsViewController alloc], "initWithMediaSuggestions:", v9);
  suggestionsViewController = self->_suggestionsViewController;
  self->_suggestionsViewController = v4;

  -[MRUMediaSuggestionsViewController setDelegate:](self->_suggestionsViewController, "setDelegate:", self);
  -[MRUMediaSuggestionsViewController setLayout:](self->_suggestionsViewController, "setLayout:", 0);
  -[MRUMediaControlsModuleNowPlayingViewController stylingProvider](self, "stylingProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUMediaSuggestionsViewController setStylingProvider:](self->_suggestionsViewController, "setStylingProvider:", v6);

  -[MRUMediaSuggestionsViewController setSupportsHorizontalLayout:](self->_suggestionsViewController, "setSupportsHorizontalLayout:", 1);
  -[MRUMediaSuggestionsViewController setContentEdgeInsets:](self->_suggestionsViewController, "setContentEdgeInsets:", self->_contentEdgeInsets.top, self->_contentEdgeInsets.left, self->_contentEdgeInsets.bottom, self->_contentEdgeInsets.right);
  -[MRUMediaControlsModuleNowPlayingViewController addChildViewController:](self, "addChildViewController:", self->_suggestionsViewController);
  -[MRUMediaSuggestionsViewController view](self->_suggestionsViewController, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUMediaControlsModuleNowPlayingViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSuggestionsView:", v7);

  -[MRUMediaSuggestionsViewController didMoveToParentViewController:](self->_suggestionsViewController, "didMoveToParentViewController:", self);
}

- (void)updateArtwork
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[MRUNowPlayingController metadataController](self->_controller, "metadataController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "artwork");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[MRUMediaControlsModuleNowPlayingViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "artworkView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setArtwork:", v6);
}

- (void)updateRoute
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
  _BOOL8 v12;
  void *v13;
  id v14;

  -[MRUMediaControlsModuleNowPlayingViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "artworkView");
  v14 = (id)objc_claimAutoreleasedReturnValue();

  -[MRUMediaControlsModuleNowPlayingViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "headerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "labelView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[MRUNowPlayingController endpointController](self->_controller, "endpointController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "route");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0DC3870];
  -[MRUNowPlayingController deviceSymbolName](self->_controller, "deviceSymbolName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_systemImageNamed:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[MRUMediaControlsModuleNowPlayingViewController showRouteLabel](self, "showRouteLabel");
  objc_msgSend(v14, "setPlaceholderImage:", v11);
  objc_msgSend(v6, "setRoute:", v8);
  objc_msgSend(v6, "setDeviceImage:", v11);
  if ((unint64_t)(self->_layout - 1) >= 2)
  {
    objc_msgSend(v6, "setShowDevice:", 0);
  }
  else
  {
    objc_msgSend(v14, "artworkImage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setShowDevice:", v13 != 0);

  }
  if (v12 != objc_msgSend(v6, "showRoute"))
    objc_msgSend(v6, "setShowRoute:", v12);

}

- (void)updateNowPlayingInfo
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  -[MRUMediaControlsModuleNowPlayingViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "headerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "labelView");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  -[MRUNowPlayingController metadataController](self->_controller, "metadataController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nowPlayingInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[MRUMediaControlsModuleNowPlayingViewController showRouteLabel](self, "showRouteLabel");
  v8 = objc_msgSend(v6, "showPlaceholder");
  objc_msgSend(v6, "placeholder");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setPlaceholder:", v9);

  if (v7)
    v10 = 59;
  else
    v10 = 1;
  objc_msgSend(v6, "stringForComponents:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTitle:", v11);

  objc_msgSend(v6, "stringForComponents:", 58);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setSubtitle:", v12);

  if ((_DWORD)v8 != objc_msgSend(v13, "showPlaceholder")
    || v7 == objc_msgSend(v13, "showSubtitle"))
  {
    objc_msgSend(v13, "setShowPlaceholder:", v8);
    objc_msgSend(v13, "setShowSubtitle:", v7 ^ 1u);
  }

}

- (BOOL)showRouteLabel
{
  unint64_t layout;
  void *v4;
  void *v5;
  char v6;

  layout = self->_layout;
  if (layout > 4)
    return 0;
  if (((1 << layout) & 0x19) == 0)
    return 1;
  -[MRUNowPlayingController endpointController](self->_controller, "endpointController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isDeviceSystemRoute"))
  {
    -[MRUNowPlayingController endpointController](self->_controller, "endpointController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isAirPlaying");

  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (void)updateTimeControls
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[MRUNowPlayingController metadataController](self->_controller, "metadataController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeControls");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[MRUMediaControlsModuleNowPlayingViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeControlsView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setTimeControls:", v6);
}

- (void)updateTransportControls
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[MRUNowPlayingController metadataController](self->_controller, "metadataController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "transportControls");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[MRUMediaControlsModuleNowPlayingViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transportControlsView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setTransportControls:", v7);
  -[MRUNowPlayingController tvRemoteController](self->_controller, "tvRemoteController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShowTVRemoteButton:", objc_msgSend(v6, "showTVRemote"));

}

- (void)updateQuickControl
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[MRUMediaControlsModuleNowPlayingViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "headerView");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[MRUNowPlayingController quickControlItem](self->_controller, "quickControlItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setShowTransportButton:", objc_msgSend(v4, "isEnabled"));
  objc_msgSend(v7, "transportButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "asset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAsset:", v6);

}

- (void)updateVolumeControls
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL8 v8;
  void *v9;
  int v10;
  char v11;
  char v12;
  NSObject *v13;
  void *v14;
  objc_class *v15;
  void *v16;
  BSInvalidatable *v17;
  BSInvalidatable *hardwareVolumeControlAssertion;
  NSObject *v19;
  int v20;
  uint64_t v21;
  __int16 v22;
  int v23;
  __int16 v24;
  int v25;
  __int16 v26;
  _WORD v27[11];

  *(_QWORD *)&v27[7] = *MEMORY[0x1E0C80C00];
  -[MRUMediaControlsModuleNowPlayingViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "volumeControlsView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[MRUNowPlayingController endpointController](self->_controller, "endpointController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "route");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPVolumeController dataSource](self->_volumeController, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (unint64_t)(self->_layout - 5) <= 4 && self->_onScreen;
  +[MRUCallMonitor sharedMonitor](MRUCallMonitor, "sharedMonitor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isOnCall");

  objc_msgSend(v4, "setOnScreen:", v8);
  v11 = objc_msgSend(v7, "volumeControlCapabilities");
  if (v8 && (v10 & 1) == 0)
  {
    v12 = v11;
    if ((objc_msgSend(v6, "isDeviceRoute") & 1) == 0 && (v12 & 3) != 0)
    {
      MCLogCategoryVolume();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v20 = 138544386;
        v21 = objc_opt_class();
        v22 = 1024;
        v23 = 1;
        v24 = 1024;
        v25 = 0;
        v26 = 1024;
        *(_DWORD *)v27 = 1;
        v27[2] = 2114;
        *(_QWORD *)&v27[3] = v6;
        _os_log_impl(&dword_1AA991000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ taking hardware assertion: on screen: %{BOOL}u | call: %{BOOL}u | control: %{BOOL}u | route: %{public}@", (uint8_t *)&v20, 0x28u);
      }

      +[MRUHardwareVolumeController sharedInstance](MRUHardwareVolumeController, "sharedInstance");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "requestControlsForVolumeDataSource:reason:", v7, v16);
      v17 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
      hardwareVolumeControlAssertion = self->_hardwareVolumeControlAssertion;
      self->_hardwareVolumeControlAssertion = v17;

LABEL_15:
      goto LABEL_16;
    }
  }
  if (self->_hardwareVolumeControlAssertion)
  {
    MCLogCategoryVolume();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = 138544130;
      v21 = objc_opt_class();
      v22 = 1024;
      v23 = v8;
      v24 = 1024;
      v25 = v10;
      v26 = 2114;
      *(_QWORD *)v27 = v6;
      _os_log_impl(&dword_1AA991000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ removing hardware assertion: on screen: %{BOOL}u | call: %{BOOL}u | route: %{public}@", (uint8_t *)&v20, 0x22u);
    }

    v14 = self->_hardwareVolumeControlAssertion;
    self->_hardwareVolumeControlAssertion = 0;
    goto LABEL_15;
  }
LABEL_16:

}

- (void)updateRoutingButton
{
  -[MRUMediaControlsModuleNowPlayingViewController updateRoutingButtonAnimated:](self, "updateRoutingButtonAnimated:", 0);
}

- (void)updateRoutingButtonAnimated:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _BOOL8 v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v3 = a3;
  v33 = *MEMORY[0x1E0C80C00];
  -[MRUMediaControlsModuleNowPlayingViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "transportControlsView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[MRUNowPlayingController endpointController](self->_controller, "endpointController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "route");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "canModifyGroupMembership");
  -[MRUMediaControlsModuleNowPlayingViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "layout") == 8;

  v12 = (void *)MEMORY[0x1E0DC3870];
  -[MRUNowPlayingController outputDevicesSymbolName](self->_controller, "outputDevicesSymbolName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_systemImageNamed:", v13);
  v14 = objc_claimAutoreleasedReturnValue();

  v27 = (void *)v14;
  +[MRUAsset image:](MRUAsset, "image:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setShowRoutingButton:", v11);
  objc_msgSend(v6, "routingButton");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setEnabled:", v9);

  objc_msgSend(v6, "routingButton");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setSelected:", 1);

  objc_msgSend(v6, "routingButton");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setAsset:animated:", v15, -[MRUMediaControlsModuleNowPlayingViewController isOnScreen](self, "isOnScreen") & v3);

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  -[MRUMediaControlsModuleNowPlayingViewController view](self, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "routingButtons");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v29 != v23)
          objc_enumerationMutation(v20);
        v25 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v25, "setRoute:", v8);
        objc_msgSend(v25, "setEnabled:", v9);
      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v22);
  }

  -[MRUMediaControlsModuleNowPlayingViewController view](self, "view");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setNeedsLayout");

}

- (void)updateLayout
{
  void *v3;
  int64_t layout;
  id v5;

  if (-[MRUMediaControlsModuleNowPlayingViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[MRUNowPlayingController endpointController](self->_controller, "endpointController");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "route");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v3, "canModifyGroupMembership") & 1) != 0)
    {

    }
    else
    {
      layout = self->_layout;

      if (layout == 8)
        -[MRUMediaControlsModuleNowPlayingViewController setLayout:](self, "setLayout:", 6);
    }
  }
}

- (void)updateWaveformVisibility
{
  void *v3;
  _BOOL4 v4;
  unsigned int v5;
  void *v6;
  void *v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  -[MRUMediaControlsModuleNowPlayingViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "headerView");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  v4 = -[MRUWaveformController routeSupportsWaveform](self->_waveformController, "routeSupportsWaveform");
  v5 = (self->_layout < 9uLL) & (0x160u >> self->_layout);
  objc_msgSend(MEMORY[0x1E0CC1C90], "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "musicHapticsEnabled"))
  {
    -[MRUNowPlayingController metadataController](self->_controller, "metadataController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "appSupportsHaptics");

  }
  else
  {
    v8 = 0;
  }

  if ((v4 & v5 & 1) != 0)
  {
    if (self->_onScreen)
      v9 = v8 ^ 1;
    else
      v9 = 0;
    -[MRUWaveformViewController setOnScreen:](self->_waveformViewController, "setOnScreen:", v9);
    if (self->_onScreen)
      v10 = v8;
    else
      v10 = 0;
  }
  else
  {
    -[MRUWaveformViewController setOnScreen:](self->_waveformViewController, "setOnScreen:", 0);
    v10 = 0;
  }
  -[MRUHapticViewController setOnScreen:](self->_hapticViewController, "setOnScreen:", v10);
  if (v4)
  {
    objc_msgSend(v12, "setShowWaveform:", v5 & (v8 ^ 1));
    v11 = v5 & v8;
  }
  else
  {
    objc_msgSend(v12, "setShowWaveform:", 0);
    v11 = 0;
  }
  objc_msgSend(v12, "setShowHaptic:", v11);

}

- (void)updateVisibility
{
  _BOOL8 onScreen;
  void *v4;
  _BOOL8 v5;
  void *v6;
  void *v7;
  _BOOL8 v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL8 v12;
  void *v13;
  id v14;

  onScreen = self->_onScreen;
  -[MRUMediaControlsModuleNowPlayingViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOnScreen:", onScreen);

  v5 = self->_layout == 6;
  -[MRUMediaControlsModuleNowPlayingViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "artworkView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setEnabled:", v5);

  v8 = self->_layout == 6;
  -[MRUMediaControlsModuleNowPlayingViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "headerView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "labelView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setEnabled:", v8);

  v12 = (unint64_t)(self->_layout - 1) < 2;
  -[MRUMediaControlsModuleNowPlayingViewController view](self, "view");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "artworkView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setShowPlaceholder:", v12);

}

- (void)updateSuggestions
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  char v14;
  _QWORD v15[4];
  id v16;
  char v17;
  id location;

  if ((self->_layout & 0xFFFFFFFFFFFFFFFELL) == 6)
  {
    -[MRUNowPlayingController mediaSuggestionsController](self->_controller, "mediaSuggestionsController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "mediaSuggestions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4 != 0;

  }
  else
  {
    v5 = 0;
  }
  objc_initWeak(&location, self);
  -[MRUMediaControlsModuleNowPlayingViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "showSuggestionsView");

  if (v5 == v7)
  {
    if (v5)
    {
      -[MRUNowPlayingController mediaSuggestionsController](self->_controller, "mediaSuggestionsController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "mediaSuggestions");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRUMediaSuggestionsViewController setMediaSuggestions:](self->_suggestionsViewController, "setMediaSuggestions:", v11);

    }
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0DC3F10];
    v9 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __67__MRUMediaControlsModuleNowPlayingViewController_updateSuggestions__block_invoke;
    v15[3] = &unk_1E5819428;
    objc_copyWeak(&v16, &location);
    v17 = v5;
    v12[0] = v9;
    v12[1] = 3221225472;
    v12[2] = __67__MRUMediaControlsModuleNowPlayingViewController_updateSuggestions__block_invoke_2;
    v12[3] = &unk_1E5819450;
    objc_copyWeak(&v13, &location);
    v14 = v5;
    objc_msgSend(v8, "animateWithDuration:animations:completion:", v15, v12, 0.25);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&v16);
  }
  objc_destroyWeak(&location);
}

void __67__MRUMediaControlsModuleNowPlayingViewController_updateSuggestions__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(WeakRetained, "createSuggestionsViewController");
    WeakRetained = v7;
  }
  objc_msgSend(WeakRetained, "suggestionsViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "beginAppearanceTransition:animated:", *(unsigned __int8 *)(a1 + 40), 0);

  v4 = *(unsigned __int8 *)(a1 + 40);
  objc_msgSend(v7, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShowSuggestionsView:", v4);

  objc_msgSend(v7, "suggestionsViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "endAppearanceTransition");

}

void __67__MRUMediaControlsModuleNowPlayingViewController_updateSuggestions__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!*(_BYTE *)(a1 + 40))
  {
    v6 = WeakRetained;
    objc_msgSend(WeakRetained, "suggestionsViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "willMoveToParentViewController:", 0);

    objc_msgSend(v6, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setSuggestionsView:", 0);

    objc_msgSend(v6, "suggestionsViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeFromParentViewController");

    objc_msgSend(v6, "setSuggestionsViewController:", 0);
    WeakRetained = v6;
  }

}

- (void)toggleRoutePicker
{
  id WeakRetained;
  MRUMediaControlsModuleNowPlayingViewController *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;

  switch(self->_layout)
  {
    case 6:
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v8 = WeakRetained;
      v4 = self;
      v5 = 8;
      goto LABEL_10;
    case 7:
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v8 = WeakRetained;
      v4 = self;
      v5 = 9;
      goto LABEL_10;
    case 8:
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v8 = WeakRetained;
      v4 = self;
      v5 = 6;
      goto LABEL_10;
    case 9:
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v8 = WeakRetained;
      v4 = self;
      v5 = 7;
LABEL_10:
      objc_msgSend(WeakRetained, "nowPlayingViewController:applyLayout:", v4, v5);
      break;
    default:
      v8 = objc_loadWeakRetained((id *)&self->_delegate);
      -[MRUMediaControlsModuleNowPlayingViewController view](self, "view");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (MRULayoutShouldBeVertical())
        v7 = 8;
      else
        v7 = 7;
      objc_msgSend(v8, "nowPlayingViewController:applyLayout:", self, v7);

      break;
  }

}

- (void)launchNowPlayingApp
{
  id WeakRetained;
  _QWORD v4[5];

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __69__MRUMediaControlsModuleNowPlayingViewController_launchNowPlayingApp__block_invoke;
  v4[3] = &unk_1E5818C88;
  v4[4] = self;
  objc_msgSend(WeakRetained, "nowPlayingViewController:cordinateDismissal:", self, v4);

}

void __69__MRUMediaControlsModuleNowPlayingViewController_launchNowPlayingApp__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "controller");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endpointController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "launchNowPlayingApp");

}

- (id)_stateDumpObject
{
  uint64_t v3;
  void *v4;
  const __CFString *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  MRUNowPlayingController *controller;
  void *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  _QWORD v16[4];
  _QWORD v17[5];

  v17[4] = *MEMORY[0x1E0C80C00];
  v16[0] = CFSTR("hardwareVolumeControlAssertion");
  -[BSInvalidatable description](self->_hardwareVolumeControlAssertion, "description");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
    v5 = (const __CFString *)v3;
  else
    v5 = CFSTR("<NONE>");
  v17[0] = v5;
  v16[1] = CFSTR("endpointController");
  -[MRUNowPlayingController endpointController](self->_controller, "endpointController");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
    v8 = (const __CFString *)v6;
  else
    v8 = CFSTR("<NONE>");
  controller = self->_controller;
  if (!controller)
    controller = (MRUNowPlayingController *)CFSTR("<NONE>");
  v17[1] = v8;
  v17[2] = controller;
  v16[2] = CFSTR("dataController");
  v16[3] = CFSTR("window");
  -[MRUMediaControlsModuleNowPlayingViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "window");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v11)
    v13 = (const __CFString *)v11;
  else
    v13 = CFSTR("<NONE>");
  v17[3] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (MRUNowPlayingController)controller
{
  return self->_controller;
}

- (MRUVolumeController)volumeController
{
  return self->_volumeController;
}

- (MRUVolumeGroupCoordinator)volumeGroupCoordinator
{
  return self->_volumeGroupCoordinator;
}

- (MRUMediaControlsModuleNowPlayingViewControllerDelegate)delegate
{
  return (MRUMediaControlsModuleNowPlayingViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (MRUVisualStylingProvider)stylingProvider
{
  return self->_stylingProvider;
}

- (int64_t)layout
{
  return self->_layout;
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

- (BOOL)resizing
{
  return self->_resizing;
}

- (MRUMediaSuggestionsViewController)suggestionsViewController
{
  return self->_suggestionsViewController;
}

- (void)setSuggestionsViewController:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionsViewController, a3);
}

- (MRUWaveformViewController)waveformViewController
{
  return self->_waveformViewController;
}

- (void)setWaveformViewController:(id)a3
{
  objc_storeStrong((id *)&self->_waveformViewController, a3);
}

- (MRUWaveformController)waveformController
{
  return self->_waveformController;
}

- (void)setWaveformController:(id)a3
{
  objc_storeStrong((id *)&self->_waveformController, a3);
}

- (MRUHapticViewController)hapticViewController
{
  return self->_hapticViewController;
}

- (void)setHapticViewController:(id)a3
{
  objc_storeStrong((id *)&self->_hapticViewController, a3);
}

- (BSInvalidatable)hardwareVolumeControlAssertion
{
  return self->_hardwareVolumeControlAssertion;
}

- (void)setHardwareVolumeControlAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_hardwareVolumeControlAssertion, a3);
}

- (BOOL)isOnScreen
{
  return self->_onScreen;
}

- (unint64_t)stateHandle
{
  return self->_stateHandle;
}

- (void)setStateHandle:(unint64_t)a3
{
  self->_stateHandle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hardwareVolumeControlAssertion, 0);
  objc_storeStrong((id *)&self->_hapticViewController, 0);
  objc_storeStrong((id *)&self->_waveformController, 0);
  objc_storeStrong((id *)&self->_waveformViewController, 0);
  objc_storeStrong((id *)&self->_suggestionsViewController, 0);
  objc_storeStrong((id *)&self->_stylingProvider, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_volumeGroupCoordinator, 0);
  objc_storeStrong((id *)&self->_volumeController, 0);
  objc_storeStrong((id *)&self->_controller, 0);
}

@end
