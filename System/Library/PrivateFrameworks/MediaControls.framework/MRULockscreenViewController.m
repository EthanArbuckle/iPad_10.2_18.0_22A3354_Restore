@implementation MRULockscreenViewController

- (void)loadView
{
  MRULockscreenView *v3;

  v3 = objc_alloc_init(MRULockscreenView);
  -[MRULockscreenViewController setView:](self, "setView:", v3);

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
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  _QWORD v20[5];
  objc_super v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v21.receiver = self;
  v21.super_class = (Class)MRULockscreenViewController;
  -[MRULockscreenViewController viewDidLoad](&v21, sel_viewDidLoad);
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __42__MRULockscreenViewController_viewDidLoad__block_invoke;
  v20[3] = &unk_1E58193D8;
  v20[4] = self;
  self->_stateHandle = __42__MRULockscreenViewController_viewDidLoad__block_invoke((uint64_t)v20);
  -[MRULockscreenViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setContentEdgeInsets:", 14.0, 14.0, 14.0, 14.0);

  self->_showArtworkView = 1;
  -[MRULockscreenViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "artworkView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:", self);

  -[MRULockscreenViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "artworkView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addTarget:action:forControlEvents:", self, sel_didSelectArtworkView_, 64);

  -[MRULockscreenViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "headerView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "labelView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addTarget:action:forControlEvents:", self, sel_didSelectLabelView_, 64);

  -[MRULockscreenViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "transportControlsView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setDelegate:", self);

  -[MRULockscreenViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "volumeControlsView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setDelegate:", self);

  v23[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (id)-[MRULockscreenViewController registerForTraitChanges:withAction:](self, "registerForTraitChanges:withAction:", v15, sel_updateVisualStyling);

  v22 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (id)-[MRULockscreenViewController registerForTraitChanges:withAction:](self, "registerForTraitChanges:withAction:", v17, sel_updatePreferredContentSize);

  +[MRUCallMonitor sharedMonitor](MRUCallMonitor, "sharedMonitor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addObserver:", self);

  -[MRULockscreenViewController createNowPlayingController](self, "createNowPlayingController");
  -[MRULockscreenViewController createWaveformViewController](self, "createWaveformViewController");
  -[MRULockscreenViewController createHapticViewController](self, "createHapticViewController");
  -[MRULockscreenViewController registerHapticObserver](self, "registerHapticObserver");
  -[MRULockscreenViewController updateEverything](self, "updateEverything");
}

uint64_t __42__MRULockscreenViewController_viewDidLoad__block_invoke(uint64_t a1)
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
  v5[2] = __42__MRULockscreenViewController_viewDidLoad__block_invoke_2;
  v5[3] = &unk_1E58193B0;
  objc_copyWeak(&v6, &location);
  v3 = MCLogAddStateHandlerWithName(v2, v5);
  objc_destroyWeak(&v6);

  objc_destroyWeak(&location);
  return v3;
}

id __42__MRULockscreenViewController_viewDidLoad__block_invoke_2(uint64_t a1, uint64_t a2)
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

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MRULockscreenViewController;
  -[MRULockscreenViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[MRULockscreenViewController setOnScreen:](self, "setOnScreen:", 1);
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MRULockscreenViewController;
  -[MRULockscreenViewController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  -[MRULockscreenViewController setOnScreen:](self, "setOnScreen:", 0);
}

- (void)dealloc
{
  objc_super v3;

  os_state_remove_handler();
  -[MRUNowPlayingController updateAutomaticResponseLoading](self->_nowPlayingController, "updateAutomaticResponseLoading");
  v3.receiver = self;
  v3.super_class = (Class)MRULockscreenViewController;
  -[MRULockscreenViewController dealloc](&v3, sel_dealloc);
}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MRULockscreenViewController;
  -[MRULockscreenViewController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  -[MRULockscreenViewController updateRestrictedRects](self, "updateRestrictedRects");
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setOnScreen:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (self->_onScreen != a3)
  {
    v3 = a3;
    self->_onScreen = a3;
    -[MRULockscreenViewController nowPlayingController](self, "nowPlayingController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "updateAutomaticResponseLoading");

    -[MRULockscreenViewController nowPlayingController](self, "nowPlayingController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "mediaSuggestionsController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "refreshMediaSuggestions");

    -[MRULockscreenViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setOnScreen:", v3);

    -[MRULockscreenViewController updateEverything](self, "updateEverything");
  }
}

- (MRUNowPlayingController)nowPlayingController
{
  MRUNowPlayingController *nowPlayingController;

  nowPlayingController = self->_nowPlayingController;
  if (!nowPlayingController)
  {
    -[MRULockscreenViewController createNowPlayingController](self, "createNowPlayingController");
    nowPlayingController = self->_nowPlayingController;
  }
  return nowPlayingController;
}

- (MRUArtworkView)artworkView
{
  void *v2;
  void *v3;

  -[MRULockscreenViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "artworkView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MRUArtworkView *)v3;
}

- (BOOL)isShowingMediaSuggestions
{
  void *v2;
  char v3;

  -[MRULockscreenViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "showSuggestionsView");

  return v3;
}

- (void)_setStylingProvider:(id)a3
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
    -[MRULockscreenViewController viewIfLoaded](self, "viewIfLoaded");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setStylingProvider:", v8);

    -[MRULockscreenViewController suggestionsViewController](self, "suggestionsViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setStylingProvider:", v8);

  }
}

- (void)setStylingProvider:(id)a3
{
  -[MRULockscreenViewController setPendingVisualStylingProvider:](self, "setPendingVisualStylingProvider:", a3);
  -[MRULockscreenViewController schedulePendingTraitCollectionUpdates](self, "schedulePendingTraitCollectionUpdates");
}

- (void)setShowArtworkView:(BOOL)a3
{
  -[MRULockscreenViewController setShowArtworkView:completion:](self, "setShowArtworkView:completion:", a3, 0);
}

- (void)setShowArtworkView:(BOOL)a3 completion:(id)a4
{
  id v5;

  if (self->_showArtworkView != a3)
  {
    self->_showArtworkView = a3;
    v5 = a4;
    -[MRULockscreenViewController updateArtwork](self, "updateArtwork");
    -[MRULockscreenViewController updateLayoutDependantPropertiesWithCompletion:](self, "updateLayoutDependantPropertiesWithCompletion:", v5);

  }
}

- (NSArray)restrictedRects
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
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
  int v18;
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
  void *v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
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

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRULockscreenViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "showSuggestionsView"))
  {
    -[MRULockscreenViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "suggestionsView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
      goto LABEL_5;
    -[MRULockscreenViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "suggestionsView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "frame");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;

    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRect:", v10, v12, v14, v16);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v4);
  }

LABEL_5:
  -[MRULockscreenViewController view](self, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "showArtworkView");

  if (v18)
  {
    -[MRULockscreenViewController view](self, "view");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "artworkView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "frame");
    v22 = v21;
    v24 = v23;
    v26 = v25;
    v28 = v27;

    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRect:", v22, v24, v26, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v29);

  }
  -[MRULockscreenViewController view](self, "view");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "headerView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "frame");
  v33 = v32;
  v35 = v34;
  v37 = v36;
  v39 = v38;

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRect:", v33, v35, v37, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v40);

  -[MRULockscreenViewController view](self, "view");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "timeControlsView");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "frame");

  UIRectInset();
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRect:");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v43);

  -[MRULockscreenViewController view](self, "view");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "transportControlsView");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "frame");

  UIRectInset();
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRect:");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v46);

  -[MRULockscreenViewController view](self, "view");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v45) = objc_msgSend(v47, "showVolumeControlsView");

  if ((_DWORD)v45)
  {
    -[MRULockscreenViewController view](self, "view");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "volumeControlsView");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "frame");

    UIRectInset();
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRect:");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v50);

  }
  v51 = (void *)objc_msgSend(v3, "copy");

  return (NSArray *)v51;
}

- (void)didSelectArtworkView:(id)a3
{
  id v4;
  void *v5;
  char v6;
  id v7;

  v4 = a3;
  -[MRULockscreenViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "lockscreenViewController:didSelectArtworkView:", self, v4);

  if ((v6 & 1) == 0)
  {
    -[MRUNowPlayingController endpointController](self->_nowPlayingController, "endpointController");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "launchNowPlayingApp");

  }
}

- (void)didSelectLabelView:(id)a3
{
  id v3;

  -[MRUNowPlayingController endpointController](self->_nowPlayingController, "endpointController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "launchNowPlayingApp");

}

- (BOOL)nowPlayingControllerShouldAutomaticallyUpdateResponse:(id)a3
{
  return self->_onScreen;
}

- (void)nowPlayingController:(id)a3 endpointController:(id)a4 didChangeRoute:(id)a5
{
  -[MRULockscreenViewController updateRouteLabel](self, "updateRouteLabel", a3, a4, a5);
  -[MRULockscreenViewController updateVolumeControls](self, "updateVolumeControls");
  -[MRULockscreenViewController updateWaveformVisibility](self, "updateWaveformVisibility");
  -[MRULockscreenViewController updateRoutingButtonAnimated:](self, "updateRoutingButtonAnimated:", 1);
  -[MRULockscreenViewController invalidateAllTimelinesForReason:](self, "invalidateAllTimelinesForReason:", CFSTR("route changed"));
}

- (void)nowPlayingController:(id)a3 tvRemoteController:(id)a4 didChangeShowTVRemote:(BOOL)a5
{
  uint64_t v6;
  void *v7;
  id v8;

  v6 = objc_msgSend(a4, "showTVRemote", a3);
  -[MRULockscreenViewController view](self, "view");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "transportControlsView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setShowTVRemoteButton:", v6);

}

- (void)nowPlayingController:(id)a3 metadataController:(id)a4 didChangeNowPlayingInfo:(id)a5
{
  -[MRULockscreenViewController updateNowPlayingInfo](self, "updateNowPlayingInfo", a3, a4, a5);
  -[MRULockscreenViewController invalidateAllTimelinesForReason:](self, "invalidateAllTimelinesForReason:", CFSTR("now playing info changed"));
}

- (void)nowPlayingController:(id)a3 metadataController:(id)a4 didChangeTimeControls:(id)a5
{
  -[MRULockscreenViewController updateTimeControls](self, "updateTimeControls", a3, a4, a5);
  -[MRULockscreenViewController invalidateAllTimelinesForReason:](self, "invalidateAllTimelinesForReason:", CFSTR("time controls changed"));
}

- (void)nowPlayingController:(id)a3 metadataController:(id)a4 didChangeTransportControls:(id)a5
{
  -[MRULockscreenViewController updateTransportControls](self, "updateTransportControls", a3, a4, a5);
  -[MRULockscreenViewController invalidateAllTimelinesForReason:](self, "invalidateAllTimelinesForReason:", CFSTR("transport controls changed"));
}

- (void)mediaSuggestionsViewController:(id)a3 didSelectSuggestion:(id)a4 completion:(id)a5
{
  id v7;
  MRUNowPlayingController *nowPlayingController;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v7 = a5;
  nowPlayingController = self->_nowPlayingController;
  v9 = a4;
  -[MRUNowPlayingController mediaSuggestionsController](nowPlayingController, "mediaSuggestionsController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __93__MRULockscreenViewController_mediaSuggestionsViewController_didSelectSuggestion_completion___block_invoke;
  v12[3] = &unk_1E5819400;
  v13 = v7;
  v11 = v7;
  objc_msgSend(v10, "playSuggestion:completion:", v9, v12);

}

uint64_t __93__MRULockscreenViewController_mediaSuggestionsViewController_didSelectSuggestion_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)transportControlsView:(id)a3 didSelectTVRemoteButton:(id)a4
{
  id v4;

  -[MRUNowPlayingController tvRemoteController](self->_nowPlayingController, "tvRemoteController", a3, a4);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presentTVRemoteUsingApp:", 0);

}

- (void)transportControlsView:(id)a3 didSelectRoutingButton:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int64_t v14;
  MPMediaControls *v15;
  MPMediaControls *mediaControls;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  id v21;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0CC23D8]);
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPresentingAppBundleID:", v10);

  -[MRUNowPlayingController endpointController](self->_nowPlayingController, "endpointController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "routeUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setRouteUID:", v12);

  if (MRAVOutputContextGetSharedAudioPresentationContext())
  {
    v13 = (void *)MRAVOutputContextCopyUniqueIdentifier();
    objc_msgSend(v8, "setRoutingContextUID:", v13);

  }
  if (-[MRULockscreenViewController lockScreenPresentsOverrideRoutePicker](self, "lockScreenPresentsOverrideRoutePicker"))
  {
    v14 = -[MRULockscreenViewController lockScreenInternalRoutePickerOverrideWithDefaultStyle:](self, "lockScreenInternalRoutePickerOverrideWithDefaultStyle:", 2);
  }
  else
  {
    v14 = 2;
  }
  objc_msgSend(v8, "setStyle:", v14);
  objc_initWeak(&location, self);
  v15 = (MPMediaControls *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC23D0]), "initWithConfiguration:shouldObserveRoutingContextUIDChanges:", v8, 0);
  mediaControls = self->_mediaControls;
  self->_mediaControls = v15;

  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __76__MRULockscreenViewController_transportControlsView_didSelectRoutingButton___block_invoke;
  v20 = &unk_1E5818E18;
  objc_copyWeak(&v21, &location);
  -[MPMediaControls setDismissHandler:](self->_mediaControls, "setDismissHandler:", &v17);
  -[MPMediaControls present](self->_mediaControls, "present", v17, v18, v19, v20);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

}

void __76__MRULockscreenViewController_transportControlsView_didSelectRoutingButton___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setMediaControls:", 0);

}

- (void)volumeControlsView:(id)a3 volumeValueDidChange:(float)a4
{
  -[MRULockscreenViewController invalidateAllTimelinesForReason:](self, "invalidateAllTimelinesForReason:", CFSTR("volume changed"));
}

- (void)artworkView:(id)a3 didChangeArtworkImage:(id)a4
{
  -[MRULockscreenViewController invalidateAllTimelinesForReason:](self, "invalidateAllTimelinesForReason:", CFSTR("artwork changed"), a4);
}

- (void)registerHapticObserver
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_handleHapticEnabledStatusChangedNotification_, *MEMORY[0x1E0CC1C88], 0);

}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  int v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  objc_super v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MRULockscreenViewController;
  -[MRULockscreenViewController traitCollectionDidChange:](&v13, sel_traitCollectionDidChange_, v4);
  v5 = objc_msgSend(v4, "mr_shouldDim");
  -[MRULockscreenViewController traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "mr_shouldDim");

  if (v5 != (_DWORD)v7)
  {
    MCLogCategoryDefault();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_msgSend(v4, "_backlightLuminance");
      -[MRULockscreenViewController traitCollection](self, "traitCollection");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "_backlightLuminance");
      *(_DWORD *)buf = 134218240;
      v15 = v9;
      v16 = 2048;
      v17 = v11;
      _os_log_impl(&dword_1AA991000, v8, OS_LOG_TYPE_DEFAULT, "[AOD] Backlight luminance changed from %ld to %ld", buf, 0x16u);

    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRULockscreenViewController setPendingDimmed:](self, "setPendingDimmed:", v12);

    -[MRULockscreenViewController schedulePendingTraitCollectionUpdates](self, "schedulePendingTraitCollectionUpdates");
  }

}

- (id)_timelinesForDateInterval:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_dimmed
    && (-[MRUNowPlayingController metadataController](self->_nowPlayingController, "metadataController"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "nowPlayingInfo"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "isPlaying"),
        v6,
        v5,
        v7))
  {
    objc_msgSend(MEMORY[0x1E0D4C650], "currentSettings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "flipBookUpdateInterval");
    v10 = (uint64_t)(60.0 / v9);

    objc_msgSend(MEMORY[0x1E0D00F38], "timelineWithPerMinuteUpdateFrequency:identifier:configure:", v10, CFSTR("aod-on"), 0);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D00F38], "emptyTimelineWithIdentifier:", CFSTR("aod-off"));
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v12 = (void *)v11;
  v15[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)_updateWithFrameSpecifier:(id)a3
{
  id v4;

  objc_msgSend(a3, "presentationInterval");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[MRULockscreenViewController updateTimeControlsForPresentationInterval:](self, "updateTimeControlsForPresentationInterval:", v4);

}

- (void)schedulePendingTraitCollectionUpdates
{
  dispatch_time_t v3;
  _QWORD block[5];

  if (!-[MRULockscreenViewController hasPendingTraitCollectionUpdates](self, "hasPendingTraitCollectionUpdates"))
  {
    -[MRULockscreenViewController setHasPendingTraitCollectionUpdates:](self, "setHasPendingTraitCollectionUpdates:", 1);
    v3 = dispatch_time(0, 100000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __68__MRULockscreenViewController_schedulePendingTraitCollectionUpdates__block_invoke;
    block[3] = &unk_1E5818C88;
    block[4] = self;
    dispatch_after(v3, MEMORY[0x1E0C80D38], block);
  }
}

uint64_t __68__MRULockscreenViewController_schedulePendingTraitCollectionUpdates__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "pendingDimmed");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "pendingDimmed");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setDimmed:", objc_msgSend(v3, "BOOLValue"));

    objc_msgSend(*(id *)(a1 + 32), "updateDimmed");
    objc_msgSend(*(id *)(a1 + 32), "setPendingDimmed:", 0);
  }
  objc_msgSend(*(id *)(a1 + 32), "pendingVisualStylingProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v5, "pendingVisualStylingProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_setStylingProvider:", v6);

    objc_msgSend(*(id *)(a1 + 32), "setPendingVisualStylingProvider:", 0);
  }
  return objc_msgSend(*(id *)(a1 + 32), "setHasPendingTraitCollectionUpdates:", 0);
}

- (id)backlightSceneEnvironment
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[MRULockscreenViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "windowScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_backlightSceneEnvironment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)invalidateAllTimelinesForReason:(id)a3
{
  id v4;
  NSObject *v5;
  dispatch_time_t v6;
  _QWORD block[5];
  uint8_t buf[4];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[MRULockscreenViewController isDimmed](self, "isDimmed"))
  {
    MCLogCategoryDefault();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v9 = v4;
      _os_log_impl(&dword_1AA991000, v5, OS_LOG_TYPE_DEFAULT, "[AOD] Enqueueing timeline invalidation because %@", buf, 0xCu);
    }

    if (!-[MRULockscreenViewController pendingTimelineInvalidation](self, "pendingTimelineInvalidation"))
    {
      -[MRULockscreenViewController setPendingTimelineInvalidation:](self, "setPendingTimelineInvalidation:", 1);
      v6 = dispatch_time(0, 500000000);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __63__MRULockscreenViewController_invalidateAllTimelinesForReason___block_invoke;
      block[3] = &unk_1E5818C88;
      block[4] = self;
      dispatch_after(v6, MEMORY[0x1E0C80D38], block);
    }
  }

}

void __63__MRULockscreenViewController_invalidateAllTimelinesForReason___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  objc_msgSend(*(id *)(a1 + 32), "setPendingTimelineInvalidation:", 0);
  MCLogCategoryDefault();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1AA991000, v2, OS_LOG_TYPE_DEFAULT, "[AOD] Invalidating all timelines", v4, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "backlightSceneEnvironment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidateAllTimelinesForReason:", CFSTR("now playing state changed"));

}

- (void)updateDimmed
{
  -[MRULockscreenViewController invalidateAllTimelinesForReason:](self, "invalidateAllTimelinesForReason:", CFSTR("backlight luminance changed"));
  -[MRULockscreenViewController updateVisibility](self, "updateVisibility");
  -[MRULockscreenViewController updateTimeControls](self, "updateTimeControls");
  -[MRULockscreenViewController updateWaveformVisibility](self, "updateWaveformVisibility");
}

- (void)createNowPlayingController
{
  MRUNowPlayingController *v3;
  MRUNowPlayingController *nowPlayingController;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  +[MRUEndpointController proactiveUserSelectedEndpointController](MRUEndpointController, "proactiveUserSelectedEndpointController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v3 = -[MRUNowPlayingController initWithEndpointController:]([MRUNowPlayingController alloc], "initWithEndpointController:", v8);
  nowPlayingController = self->_nowPlayingController;
  self->_nowPlayingController = v3;

  -[MRUNowPlayingController tvRemoteController](self->_nowPlayingController, "tvRemoteController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setContext:", 2);

  v6 = *MEMORY[0x1E0D4C328];
  -[MRUNowPlayingController mediaSuggestionsController](self->_nowPlayingController, "mediaSuggestionsController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setContext:", v6);

  -[MRUNowPlayingController addObserver:](self->_nowPlayingController, "addObserver:", self);
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

  -[MRUWaveformController setNowPlayingController:](self->_waveformController, "setNowPlayingController:", self->_nowPlayingController);
  -[MRULockscreenViewController addChildViewController:](self, "addChildViewController:", self->_waveformViewController);
  -[MRUWaveformViewController view](self->_waveformViewController, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRULockscreenViewController view](self, "view");
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

  v3 = -[MRUHapticViewController initWithContext:nowPlayingController:]([MRUHapticViewController alloc], "initWithContext:nowPlayingController:", 1, self->_nowPlayingController);
  hapticViewController = self->_hapticViewController;
  self->_hapticViewController = v3;

  -[MRULockscreenViewController addChildViewController:](self, "addChildViewController:", self->_hapticViewController);
  -[MRUHapticViewController view](self->_hapticViewController, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRULockscreenViewController view](self, "view");
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

  -[MRUNowPlayingController mediaSuggestionsController](self->_nowPlayingController, "mediaSuggestionsController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mediaSuggestions");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v4 = -[MRUMediaSuggestionsViewController initWithMediaSuggestions:]([MRUMediaSuggestionsViewController alloc], "initWithMediaSuggestions:", v9);
  suggestionsViewController = self->_suggestionsViewController;
  self->_suggestionsViewController = v4;

  -[MRUMediaSuggestionsViewController setDelegate:](self->_suggestionsViewController, "setDelegate:", self);
  -[MRUMediaSuggestionsViewController setLayout:](self->_suggestionsViewController, "setLayout:", 1);
  -[MRULockscreenViewController stylingProvider](self, "stylingProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUMediaSuggestionsViewController setStylingProvider:](self->_suggestionsViewController, "setStylingProvider:", v6);

  -[MRUMediaSuggestionsViewController setContentEdgeInsets:](self->_suggestionsViewController, "setContentEdgeInsets:", 14.0, 14.0, 14.0, 14.0);
  -[MRULockscreenViewController addChildViewController:](self, "addChildViewController:", self->_suggestionsViewController);
  -[MRUMediaSuggestionsViewController view](self->_suggestionsViewController, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRULockscreenViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSuggestionsView:", v7);

  -[MRUMediaSuggestionsViewController didMoveToParentViewController:](self->_suggestionsViewController, "didMoveToParentViewController:", self);
}

- (void)updateEverything
{
  -[MRULockscreenViewController updateRouteLabel](self, "updateRouteLabel");
  -[MRULockscreenViewController updateRoutingButton](self, "updateRoutingButton");
  -[MRULockscreenViewController updateArtwork](self, "updateArtwork");
  -[MRULockscreenViewController updateNowPlayingInfo](self, "updateNowPlayingInfo");
  -[MRULockscreenViewController updateTimeControls](self, "updateTimeControls");
  -[MRULockscreenViewController updateTransportControls](self, "updateTransportControls");
  -[MRULockscreenViewController updateSuggestions](self, "updateSuggestions");
  -[MRULockscreenViewController updateVolumeControls](self, "updateVolumeControls");
  -[MRULockscreenViewController updateWaveformVisibility](self, "updateWaveformVisibility");
  -[MRULockscreenViewController updateVisibility](self, "updateVisibility");
  -[MRULockscreenViewController updateDimmed](self, "updateDimmed");
  -[MRULockscreenViewController updatePreferredContentSize](self, "updatePreferredContentSize");
  -[MRULockscreenViewController updateRestrictedRects](self, "updateRestrictedRects");
  -[MRULockscreenViewController updateVisualStyling](self, "updateVisualStyling");
}

- (void)updateArtwork
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if (-[MRULockscreenViewController showArtworkView](self, "showArtworkView"))
  {
    -[MRUNowPlayingController metadataController](self->_nowPlayingController, "metadataController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "artwork");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    -[MRULockscreenViewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "artworkView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "setArtwork:", v6);
  }
}

- (void)updateRouteLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[MRULockscreenViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "headerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "labelView");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[MRUNowPlayingController endpointController](self->_nowPlayingController, "endpointController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "route");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setRoute:", v6);
  -[MRULockscreenViewController updateLayoutDependantProperties](self, "updateLayoutDependantProperties");

}

- (void)updateNowPlayingInfo
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[5];
  _QWORD v15[4];
  id v16;
  MRULockscreenViewController *v17;
  char v18;

  -[MRUNowPlayingController metadataController](self->_nowPlayingController, "metadataController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nowPlayingInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[MRULockscreenViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "headerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "labelView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "placeholder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPlaceholder:", v8);

  objc_msgSend(v4, "stringForComponents:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTitle:", v9);

  objc_msgSend(v4, "stringForComponents:", 122);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSubtitle:", v10);

  v11 = objc_msgSend(v4, "showPlaceholder");
  if (v11 != objc_msgSend(v7, "showPlaceholder"))
  {
    v12 = (void *)MEMORY[0x1E0DC3F10];
    v13 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __51__MRULockscreenViewController_updateNowPlayingInfo__block_invoke;
    v15[3] = &unk_1E5819228;
    v18 = v11;
    v16 = v7;
    v17 = self;
    v14[0] = v13;
    v14[1] = 3221225472;
    v14[2] = __51__MRULockscreenViewController_updateNowPlayingInfo__block_invoke_2;
    v14[3] = &unk_1E581AA88;
    v14[4] = self;
    objc_msgSend(v12, "mru_animateUsingType:animations:completion:", 0, v15, v14);

  }
}

void __51__MRULockscreenViewController_updateNowPlayingInfo__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "setShowPlaceholder:", *(unsigned __int8 *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 40), "view");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layoutIfNeeded");

}

uint64_t __51__MRULockscreenViewController_updateNowPlayingInfo__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateRestrictedRects");
}

- (void)updateTimeControlsForPresentationInterval:(id)a3
{
  MRUNowPlayingController *nowPlayingController;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  nowPlayingController = self->_nowPlayingController;
  v5 = a3;
  -[MRUNowPlayingController metadataController](nowPlayingController, "metadataController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeControls");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[MRULockscreenViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeControlsView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setTimeControls:forPresentationInterval:", v9, v5);
}

- (void)updateTimeControls
{
  -[MRULockscreenViewController updateTimeControlsForPresentationInterval:](self, "updateTimeControlsForPresentationInterval:", 0);
}

- (void)updateTransportControls
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[MRUNowPlayingController metadataController](self->_nowPlayingController, "metadataController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "transportControls");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[MRULockscreenViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transportControlsView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setTransportControls:", v7);
  -[MRUNowPlayingController tvRemoteController](self->_nowPlayingController, "tvRemoteController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShowTVRemoteButton:", objc_msgSend(v6, "showTVRemote"));

}

- (void)updateVolumeControls
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  uint64_t v12;
  MRUVolumeController *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  void *v17;
  uint64_t v18;
  void *v19;
  int v20;
  char v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  objc_class *v26;
  void *v27;
  BSInvalidatable *v28;
  BSInvalidatable *hardwareVolumeControlAssertion;
  NSObject *v30;
  int v31;
  uint64_t v32;
  __int16 v33;
  int v34;
  __int16 v35;
  int v36;
  __int16 v37;
  int v38;
  __int16 v39;
  _QWORD v40[4];

  v40[3] = *MEMORY[0x1E0C80C00];
  -[MRULockscreenViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "volumeControlsView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[MRUNowPlayingController endpointController](self->_nowPlayingController, "endpointController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "route");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "volumeController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "volumeController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v8, "groupRoute");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqual:", v6);

    if ((v11 & 1) != 0)
      goto LABEL_6;
    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0CC2538]), "initWithGroupRoute:outputDeviceRoute:", v6, 0);

    objc_msgSend(v4, "setDataSource:", v12);
  }
  else
  {
    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0CC2538]), "initWithGroupRoute:outputDeviceRoute:", v6, 0);

    v13 = -[MPVolumeController initWithDataSource:]([MRUVolumeController alloc], "initWithDataSource:", v12);
    objc_msgSend(v4, "setVolumeController:", v13);

  }
  v8 = (void *)v12;
LABEL_6:
  -[MRUNowPlayingController endpointController](self->_nowPlayingController, "endpointController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "isDeviceSystemRoute"))
  {
    -[MRUNowPlayingController endpointController](self->_nowPlayingController, "endpointController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v15, "isAirPlaying") & 1) != 0)
    {
      v16 = 1;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D4C650], "currentSettings");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v17, "alwaysShowVolumeControls");

    }
  }
  else
  {
    v16 = 1;
  }

  if (self->_onScreen)
    v18 = v16;
  else
    v18 = 0;
  +[MRUCallMonitor sharedMonitor](MRUCallMonitor, "sharedMonitor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "isOnCall");

  v21 = objc_msgSend(v8, "volumeControlCapabilities");
  -[MRULockscreenViewController view](self, "view");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "volumeControlsView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setOnScreen:", v18);

  if ((_DWORD)v18 == 1 && (v20 & 1) == 0 && (objc_msgSend(v6, "isDeviceRoute") & 1) == 0 && (v21 & 3) != 0)
  {
    MCLogCategoryVolume();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v31 = 138544642;
      v32 = objc_opt_class();
      v33 = 1024;
      v34 = 1;
      v35 = 1024;
      v36 = 1;
      v37 = 1024;
      v38 = 0;
      v39 = 1024;
      LODWORD(v40[0]) = 1;
      WORD2(v40[0]) = 2114;
      *(_QWORD *)((char *)v40 + 6) = v6;
      _os_log_impl(&dword_1AA991000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@ taking hardware assertion: on screen: %{BOOL}u | show: %{BOOL}u | call: %{BOOL}u | control: %{BOOL}u | route: %{public}@", (uint8_t *)&v31, 0x2Eu);
    }

    +[MRUHardwareVolumeController sharedInstance](MRUHardwareVolumeController, "sharedInstance");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (objc_class *)objc_opt_class();
    NSStringFromClass(v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "requestControlsForVolumeDataSource:reason:", v8, v27);
    v28 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
    hardwareVolumeControlAssertion = self->_hardwareVolumeControlAssertion;
    self->_hardwareVolumeControlAssertion = v28;

LABEL_26:
    goto LABEL_27;
  }
  if (self->_hardwareVolumeControlAssertion)
  {
    MCLogCategoryVolume();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      v31 = 138544386;
      v32 = objc_opt_class();
      v33 = 1024;
      v34 = v18;
      v35 = 1024;
      v36 = v16;
      v37 = 1024;
      v38 = v20;
      v39 = 2114;
      v40[0] = v6;
      _os_log_impl(&dword_1AA991000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@ removing hardware assertion: on screen: %{BOOL}u | show: %{BOOL}u | call: %{BOOL}u | route: %{public}@", (uint8_t *)&v31, 0x28u);
    }

    v25 = self->_hardwareVolumeControlAssertion;
    self->_hardwareVolumeControlAssertion = 0;
    goto LABEL_26;
  }
LABEL_27:

}

- (void)updateRoutingButton
{
  -[MRULockscreenViewController updateRoutingButtonAnimated:](self, "updateRoutingButtonAnimated:", 0);
}

- (void)updateRoutingButtonAnimated:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  MRUNowPlayingController *nowPlayingController;
  id v12;
  _QWORD v13[4];
  id v14;
  MRULockscreenViewController *v15;
  BOOL v16;

  -[MRULockscreenViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "transportControlsView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "routingButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUNowPlayingController endpointController](self->_nowPlayingController, "endpointController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "route");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "canModifyGroupMembership");

  objc_msgSend(v6, "setShowRoutingButton:", v10);
  nowPlayingController = self->_nowPlayingController;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __59__MRULockscreenViewController_updateRoutingButtonAnimated___block_invoke;
  v13[3] = &unk_1E581B2D8;
  v14 = v7;
  v15 = self;
  v16 = a3;
  v12 = v7;
  -[MRUNowPlayingController routingDeviceImage:](nowPlayingController, "routingDeviceImage:", v13);

}

void __59__MRULockscreenViewController_updateRoutingButtonAnimated___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  _BOOL8 v4;
  id v5;

  +[MRUAsset image:](MRUAsset, "image:", a2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 32);
  if (objc_msgSend(*(id *)(a1 + 40), "isOnScreen"))
    v4 = *(_BYTE *)(a1 + 48) != 0;
  else
    v4 = 0;
  objc_msgSend(v3, "setAsset:animated:", v5, v4);

}

- (void)updateWaveformVisibility
{
  void *v3;
  _BOOL8 v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  MRUWaveformViewController **p_waveformViewController;
  uint64_t v10;
  id v11;

  -[MRULockscreenViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "headerView");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  v4 = -[MRUWaveformController routeSupportsWaveform](self->_waveformController, "routeSupportsWaveform");
  objc_msgSend(MEMORY[0x1E0CC1C90], "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "musicHapticsEnabled"))
  {
    -[MRUNowPlayingController metadataController](self->_nowPlayingController, "metadataController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "appSupportsHaptics");

  }
  else
  {
    v7 = 0;
  }

  if (v4)
  {
    if (self->_onScreen)
      v8 = v7 ^ 1;
    else
      v8 = 0;
    p_waveformViewController = &self->_waveformViewController;
    -[MRUWaveformViewController setOnScreen:](self->_waveformViewController, "setOnScreen:", v8);
    if (self->_onScreen)
      v10 = v7;
    else
      v10 = 0;
  }
  else
  {
    p_waveformViewController = &self->_waveformViewController;
    -[MRUWaveformViewController setOnScreen:](self->_waveformViewController, "setOnScreen:", 0);
    v7 = 0;
    v10 = 0;
  }
  -[MRUHapticViewController setOnScreen:](self->_hapticViewController, "setOnScreen:", v10);
  -[MRUWaveformViewController setDimmed:](*p_waveformViewController, "setDimmed:", self->_dimmed);
  -[MRUHapticViewController setDimmed:](self->_hapticViewController, "setDimmed:", self->_dimmed);
  objc_msgSend(v11, "setShowWaveform:", v4);
  objc_msgSend(v11, "setShowHaptic:", v7);

}

- (void)updateVisibility
{
  _BOOL8 onScreen;
  void *v4;
  _BOOL8 dimmed;
  id v6;

  onScreen = self->_onScreen;
  -[MRULockscreenViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOnScreen:", onScreen);

  dimmed = self->_dimmed;
  -[MRULockscreenViewController view](self, "view");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDimmed:", dimmed);

}

- (void)updateSuggestions
{
  void *v3;
  id v4;

  -[MRUNowPlayingController mediaSuggestionsController](self->_nowPlayingController, "mediaSuggestionsController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mediaSuggestions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUMediaSuggestionsViewController setMediaSuggestions:](self->_suggestionsViewController, "setMediaSuggestions:", v3);

}

- (void)updateLayoutDependantPropertiesWithCompletion:(id)a3
{
  id v4;
  BOOL showArtworkView;
  void *v6;
  int v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  int v18;
  BOOL v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  char v28;
  char v29;
  int v30;
  int v31;
  _QWORD v32[5];
  id v33;
  BOOL v34;
  _QWORD v35[5];
  BOOL v36;
  char v37;
  char v38;
  BOOL v39;
  char v40;

  v4 = a3;
  showArtworkView = self->_showArtworkView;
  -[MRULockscreenViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "showArtworkView");
  v8 = self->_showArtworkView;

  -[MRUNowPlayingController endpointController](self->_nowPlayingController, "endpointController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v8;
  v31 = v7;
  if (objc_msgSend(v9, "isDeviceSystemRoute"))
  {
    -[MRUNowPlayingController endpointController](self->_nowPlayingController, "endpointController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isAirPlaying");

  }
  else
  {
    v11 = 1;
  }

  -[MRULockscreenViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "headerView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "labelView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v11 ^ objc_msgSend(v14, "showRoute");

  -[MRUNowPlayingController endpointController](self->_nowPlayingController, "endpointController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v11;
  if (objc_msgSend(v16, "isDeviceSystemRoute"))
  {
    -[MRUNowPlayingController endpointController](self->_nowPlayingController, "endpointController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v17, "isAirPlaying") & 1) != 0)
    {
      v18 = 1;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D4C650], "currentSettings");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v21, "alwaysShowVolumeControls");

    }
    v19 = showArtworkView;
    v20 = v4;

  }
  else
  {
    v19 = showArtworkView;
    v20 = v4;
    v18 = 1;
  }

  -[MRULockscreenViewController view](self, "view");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "showVolumeControlsView");

  -[MRUNowPlayingController mediaSuggestionsController](self->_nowPlayingController, "mediaSuggestionsController");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "mediaSuggestions");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  -[MRULockscreenViewController view](self, "view");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "showSuggestionsView");

  if (v30 == v31)
    v28 = v15;
  else
    v28 = 1;
  if ((v28 & 1) != 0 || ((v18 ^ v23) & 1) != 0 || (v25 != 0) != v27)
  {
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __77__MRULockscreenViewController_updateLayoutDependantPropertiesWithCompletion___block_invoke;
    v35[3] = &unk_1E581BF90;
    v35[4] = self;
    v36 = v19;
    v37 = v29;
    v38 = v18;
    v39 = v25 != 0;
    v40 = (v25 != 0) ^ v27;
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __77__MRULockscreenViewController_updateLayoutDependantPropertiesWithCompletion___block_invoke_2;
    v32[3] = &unk_1E581BFB8;
    v32[4] = self;
    v34 = v25 != 0;
    v33 = v20;
    -[MRULockscreenViewController updateLayoutWithAnimations:completion:](self, "updateLayoutWithAnimations:completion:", v35, v32);

  }
}

uint64_t __77__MRULockscreenViewController_updateLayoutDependantPropertiesWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v2 = *(unsigned __int8 *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setShowArtworkView:", v2);

  v4 = *(unsigned __int8 *)(a1 + 41);
  objc_msgSend(*(id *)(a1 + 32), "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "headerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "labelView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setShowRoute:", v4);

  v8 = *(unsigned __int8 *)(a1 + 42);
  objc_msgSend(*(id *)(a1 + 32), "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setShowVolumeControlsView:", v8);

  if (*(_BYTE *)(a1 + 43) && *(_BYTE *)(a1 + 44))
    objc_msgSend(*(id *)(a1 + 32), "createSuggestionsViewController");
  objc_msgSend(*(id *)(a1 + 32), "suggestionsViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "beginAppearanceTransition:animated:", *(unsigned __int8 *)(a1 + 43), 0);

  v11 = *(unsigned __int8 *)(a1 + 43);
  objc_msgSend(*(id *)(a1 + 32), "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setShowSuggestionsView:", v11);

  objc_msgSend(*(id *)(a1 + 32), "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "layoutIfNeeded");

  return objc_msgSend(*(id *)(a1 + 32), "updatePreferredContentSize");
}

uint64_t __77__MRULockscreenViewController_updateLayoutDependantPropertiesWithCompletion___block_invoke_2(uint64_t a1, int a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "suggestionsViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endAppearanceTransition");

  if (!*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "suggestionsViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "willMoveToParentViewController:", 0);

    objc_msgSend(*(id *)(a1 + 32), "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSuggestionsView:", 0);

    objc_msgSend(*(id *)(a1 + 32), "suggestionsViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeFromParentViewController");

    objc_msgSend(*(id *)(a1 + 32), "setSuggestionsViewController:", 0);
  }
  objc_msgSend(*(id *)(a1 + 32), "updateRestrictedRects");
  result = objc_msgSend(*(id *)(a1 + 32), "updatePreferredContentSize");
  if (a2)
  {
    result = *(_QWORD *)(a1 + 40);
    if (result)
      return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)updateLayoutDependantProperties
{
  -[MRULockscreenViewController updateLayoutDependantPropertiesWithCompletion:](self, "updateLayoutDependantPropertiesWithCompletion:", 0);
}

- (void)updateLayoutWithAnimations:(id)a3 completion:(id)a4
{
  void (**v6)(id, uint64_t);
  void *v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  id v12;
  id v13;

  v13 = a3;
  v6 = (void (**)(id, uint64_t))a4;
  -[MRULockscreenViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  if (v8 == 0.0)
  {

    v12 = v13;
    goto LABEL_5;
  }
  -[MRULockscreenViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  v11 = v10;

  v12 = v13;
  if (v11 == 0.0)
  {
LABEL_5:
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v12);
    v6[2](v6, 1);
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0DC3F10], "mru_animateUsingType:animations:completion:", 0, v13, v6);
LABEL_6:

}

- (void)updatePreferredContentSize
{
  void *v3;
  double Width;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  CGFloat v14;
  CGFloat v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;
  CGSize v25;
  CGSize v26;
  CGRect v27;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  Width = CGRectGetWidth(v27);

  -[MRULockscreenViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sizeThatFits:", Width, 1.79769313e308);
  v7 = v6;
  v9 = v8;

  MCLogCategoryDefault();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = objc_opt_class();
    v25.width = v7;
    v25.height = v9;
    NSStringFromCGSize(v25);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRULockscreenViewController view](self, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "frame");
    v26.width = v14;
    v26.height = v15;
    NSStringFromCGSize(v26);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138543874;
    v19 = v11;
    v20 = 2114;
    v21 = v12;
    v22 = 2114;
    v23 = v16;
    _os_log_impl(&dword_1AA991000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ preferred content size: %{public}@ | current: %{public}@", (uint8_t *)&v18, 0x20u);

  }
  -[MRULockscreenViewController delegate](self, "delegate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v17, "lockscreenViewController:didUpdatePreferredContentSize:", self, v7, v9);

}

- (void)updateRestrictedRects
{
  void *v3;
  id v4;

  -[MRULockscreenViewController delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[MRULockscreenViewController restrictedRects](self, "restrictedRects");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lockscreenViewController:didUpdateRestrictedRects:", self, v3);

  }
}

- (void)updateVisualStyling
{
  void *v3;
  void *v4;
  MRUVisualStylingProvider *v5;
  id v6;

  v3 = (void *)MEMORY[0x1E0D474B8];
  -[MRULockscreenViewController traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_visualStylingProviderForRecipe:category:andUserInterfaceStyle:", 1, 1, objc_msgSend(v4, "userInterfaceStyle"));
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v5 = -[MRUVisualStylingProvider initWithVisualStylingProvider:]([MRUVisualStylingProvider alloc], "initWithVisualStylingProvider:", v6);
  -[MRULockscreenViewController setStylingProvider:](self, "setStylingProvider:", v5);

}

- (BOOL)lockScreenPresentsOverrideRoutePicker
{
  void *v2;
  void *v3;
  char v4;
  char v5;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.Music"));
  objc_msgSend(v2, "stringForKey:", CFSTR("LockScreenRoutingStyleOverride"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("Default")) ^ 1;
  v5 = MSVDeviceOSIsInternalInstall() & v4;

  return v5;
}

- (int64_t)lockScreenInternalRoutePickerOverrideWithDefaultStyle:(int64_t)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.Music"));
  objc_msgSend(v4, "stringForKey:", CFSTR("LockScreenRoutingStyleOverride"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Default")) & 1) == 0)
  {
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("ControlCenter")) & 1) != 0)
    {
      a3 = 0;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("SingleSelect")) & 1) != 0)
    {
      a3 = 1;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("MultiSelect")) & 1) != 0)
    {
      a3 = 2;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("SharedQueue")) & 1) != 0)
    {
      a3 = 3;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("VideoPicker")) & 1) != 0)
    {
      a3 = 4;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("LocalTransportControls")) & 1) != 0)
    {
      a3 = 5;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("AirPlayBluePill")) & 1) != 0)
    {
      a3 = 6;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("MediumConfidenceVideoPicker")) & 1) != 0)
    {
      a3 = 7;
    }
    else if (objc_msgSend(v5, "isEqualToString:", CFSTR("UpNextControls")))
    {
      a3 = 8;
    }
  }

  return a3;
}

- (id)_stateDumpObject
{
  uint64_t v3;
  void *v4;
  const __CFString *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  MRUNowPlayingController *nowPlayingController;
  MPMediaControls *mediaControls;
  void *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  _QWORD v17[5];
  _QWORD v18[6];

  v18[5] = *MEMORY[0x1E0C80C00];
  v17[0] = CFSTR("hardwareVolumeControlAssertion");
  -[BSInvalidatable description](self->_hardwareVolumeControlAssertion, "description");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
    v5 = (const __CFString *)v3;
  else
    v5 = CFSTR("<NONE>");
  v18[0] = v5;
  v17[1] = CFSTR("endpointController");
  -[MRUNowPlayingController endpointController](self->_nowPlayingController, "endpointController");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
    v8 = (const __CFString *)v6;
  else
    v8 = CFSTR("<NONE>");
  nowPlayingController = self->_nowPlayingController;
  if (!nowPlayingController)
    nowPlayingController = (MRUNowPlayingController *)CFSTR("<NONE>");
  v18[1] = v8;
  v18[2] = nowPlayingController;
  v17[2] = CFSTR("dataController");
  v17[3] = CFSTR("mediaControls");
  mediaControls = self->_mediaControls;
  if (!mediaControls)
    mediaControls = (MPMediaControls *)CFSTR("<NONE>");
  v18[3] = mediaControls;
  v17[4] = CFSTR("window");
  -[MRULockscreenViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "window");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v12)
    v14 = (const __CFString *)v12;
  else
    v14 = CFSTR("<NONE>");
  v18[4] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (MRULockscreenViewControllerDelegate)delegate
{
  return (MRULockscreenViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)showArtworkView
{
  return self->_showArtworkView;
}

- (MRUVisualStylingProvider)stylingProvider
{
  return self->_stylingProvider;
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

- (BOOL)isOnScreen
{
  return self->_onScreen;
}

- (BOOL)isDimmed
{
  return self->_dimmed;
}

- (void)setDimmed:(BOOL)a3
{
  self->_dimmed = a3;
}

- (BSInvalidatable)hardwareVolumeControlAssertion
{
  return self->_hardwareVolumeControlAssertion;
}

- (void)setHardwareVolumeControlAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_hardwareVolumeControlAssertion, a3);
}

- (MPMediaControls)mediaControls
{
  return self->_mediaControls;
}

- (void)setMediaControls:(id)a3
{
  objc_storeStrong((id *)&self->_mediaControls, a3);
}

- (unint64_t)stateHandle
{
  return self->_stateHandle;
}

- (void)setStateHandle:(unint64_t)a3
{
  self->_stateHandle = a3;
}

- (BOOL)pendingTimelineInvalidation
{
  return self->_pendingTimelineInvalidation;
}

- (void)setPendingTimelineInvalidation:(BOOL)a3
{
  self->_pendingTimelineInvalidation = a3;
}

- (MRUVisualStylingProvider)pendingVisualStylingProvider
{
  return self->_pendingVisualStylingProvider;
}

- (void)setPendingVisualStylingProvider:(id)a3
{
  objc_storeStrong((id *)&self->_pendingVisualStylingProvider, a3);
}

- (NSNumber)pendingDimmed
{
  return self->_pendingDimmed;
}

- (void)setPendingDimmed:(id)a3
{
  objc_storeStrong((id *)&self->_pendingDimmed, a3);
}

- (BOOL)hasPendingTraitCollectionUpdates
{
  return self->_hasPendingTraitCollectionUpdates;
}

- (void)setHasPendingTraitCollectionUpdates:(BOOL)a3
{
  self->_hasPendingTraitCollectionUpdates = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingDimmed, 0);
  objc_storeStrong((id *)&self->_pendingVisualStylingProvider, 0);
  objc_storeStrong((id *)&self->_mediaControls, 0);
  objc_storeStrong((id *)&self->_hardwareVolumeControlAssertion, 0);
  objc_storeStrong((id *)&self->_hapticViewController, 0);
  objc_storeStrong((id *)&self->_waveformController, 0);
  objc_storeStrong((id *)&self->_waveformViewController, 0);
  objc_storeStrong((id *)&self->_suggestionsViewController, 0);
  objc_storeStrong((id *)&self->_stylingProvider, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_nowPlayingController, 0);
}

@end
