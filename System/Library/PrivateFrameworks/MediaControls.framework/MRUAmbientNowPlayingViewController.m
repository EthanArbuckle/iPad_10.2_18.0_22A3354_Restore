@implementation MRUAmbientNowPlayingViewController

- (MRUAmbientNowPlayingViewController)initWithNowPlayingController:(id)a3
{
  id v5;
  MRUAmbientNowPlayingViewController *v6;
  MRUAmbientNowPlayingViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MRUAmbientNowPlayingViewController;
  v6 = -[MRUAmbientNowPlayingViewController init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_controller, a3);

  return v7;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)loadView
{
  MRUAmbientNowPlayingView *v3;

  v3 = objc_alloc_init(MRUAmbientNowPlayingView);
  -[MRUAmbientNowPlayingViewController setView:](self, "setView:", v3);

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
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)MRUAmbientNowPlayingViewController;
  -[MRUAmbientNowPlayingViewController viewDidLoad](&v14, sel_viewDidLoad);
  -[MRUAmbientNowPlayingViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setOverrideUserInterfaceStyle:", 2);

  -[MRUNowPlayingController addObserver:](self->_controller, "addObserver:", self);
  -[MRUAmbientNowPlayingViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "artworkView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:", self);

  -[MRUAmbientNowPlayingViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "routingButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addTarget:action:forControlEvents:", self, sel_didSelectRoutingButton_, 64);

  -[MRUAmbientNowPlayingViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "leftButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addTarget:action:forControlEvents:", self, sel_transportButtonTap_, 64);

  -[MRUAmbientNowPlayingViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "rightButton");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addTarget:action:forControlEvents:", self, sel_transportButtonTap_, 64);

  -[MRUAmbientNowPlayingViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "labelView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addTarget:action:forControlEvents:", self, sel_didSelectLabelView_, 64);

  -[MRUAmbientNowPlayingViewController updateEverything](self, "updateEverything");
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  MRUVisualStylingProvider *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MRUAmbientNowPlayingViewController;
  -[MRUAmbientNowPlayingViewController viewWillAppear:](&v7, sel_viewWillAppear_, a3);
  objc_msgSend(MEMORY[0x1E0D474B8], "_visualStylingProviderForRecipe:andCategory:", 101, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MRUVisualStylingProvider initWithVisualStylingProvider:]([MRUVisualStylingProvider alloc], "initWithVisualStylingProvider:", v4);
  -[MRUVisualStylingProvider setTraitChangeObservable:](v5, "setTraitChangeObservable:", self);
  -[MRUAmbientNowPlayingViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setStylingProvider:", v5);

  -[MRUAmbientNowPlayingViewController updateEverything](self, "updateEverything");
  -[MRUAmbientNowPlayingViewController setOnScreen:](self, "setOnScreen:", 1);

}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MRUAmbientNowPlayingViewController;
  -[MRUAmbientNowPlayingViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[MRUAmbientNowPlayingViewController setOnScreen:](self, "setOnScreen:", 0);
  -[MRUAmbientNowPlayingViewController removeBackdropViewController](self, "removeBackdropViewController");
}

- (void)setOnScreen:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  if (self->_onScreen != a3)
  {
    v3 = a3;
    self->_onScreen = a3;
    -[MRUAmbientNowPlayingViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setOnScreen:", v3);

    -[MRUNowPlayingController updateAutomaticResponseLoading](self->_controller, "updateAutomaticResponseLoading");
  }
}

- (void)setBackdropViewController:(id)a3
{
  MRUBackdropControllerProtocol *v5;
  MRUBackdropControllerProtocol *v6;

  v5 = (MRUBackdropControllerProtocol *)a3;
  if (self->_backdropViewController != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_backdropViewController, a3);
    -[MRUAmbientNowPlayingViewController embedBackdropViewController](self, "embedBackdropViewController");
    v5 = v6;
  }

}

- (void)setArtworkTransitionDirection:(int64_t)a3
{
  MSVTimer *v4;
  MSVTimer *artworkTransitionDirectionTimer;
  _QWORD v6[5];

  self->_artworkTransitionDirection = a3;
  -[MSVTimer invalidate](self->_artworkTransitionDirectionTimer, "invalidate");
  if (self->_artworkTransitionDirection == 1)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __68__MRUAmbientNowPlayingViewController_setArtworkTransitionDirection___block_invoke;
    v6[3] = &unk_1E5818C88;
    v6[4] = self;
    objc_msgSend(MEMORY[0x1E0D4D110], "timerWithInterval:repeats:block:", 0, v6, 3.0);
    v4 = (MSVTimer *)objc_claimAutoreleasedReturnValue();
    artworkTransitionDirectionTimer = self->_artworkTransitionDirectionTimer;
    self->_artworkTransitionDirectionTimer = v4;

  }
}

uint64_t __68__MRUAmbientNowPlayingViewController_setArtworkTransitionDirection___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setArtworkTransitionDirection:", 0);
}

- (void)nowPlayingController:(id)a3 metadataController:(id)a4 didChangeArtwork:(id)a5
{
  NSObject *v6;
  void *v7;
  int v8;
  MRUAmbientNowPlayingViewController *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  MCLogCategoryDefault();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    MRUFlippingArtworkTransitionDirectionDescription(-[MRUAmbientNowPlayingViewController artworkTransitionDirection](self, "artworkTransitionDirection"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412546;
    v9 = self;
    v10 = 2112;
    v11 = v7;
    _os_log_impl(&dword_1AA991000, v6, OS_LOG_TYPE_DEFAULT, "%@ updateArtwork direction:%@", (uint8_t *)&v8, 0x16u);

  }
  -[MRUAmbientNowPlayingViewController updateArtwork](self, "updateArtwork");
  -[MRUAmbientNowPlayingViewController setArtworkTransitionDirection:](self, "setArtworkTransitionDirection:", 0);
}

- (void)nowPlayingController:(id)a3 endpointController:(id)a4 didChangeRoute:(id)a5
{
  -[MRUAmbientNowPlayingViewController updateRoute](self, "updateRoute", a3, a4, a5);
  -[MRUAmbientNowPlayingViewController updateVolumeControls](self, "updateVolumeControls");
  -[MRUAmbientNowPlayingViewController updateRoutingButton](self, "updateRoutingButton");
}

- (void)artworkView:(id)a3 didChangeArtworkImage:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[MRUAmbientNowPlayingViewController backdropViewController](self, "backdropViewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateImage:animated:", v5, 1);

}

- (void)transportButtonTap:(id)a3
{
  id v4;
  id v5;
  id v6;

  v4 = a3;
  -[MRUAmbientNowPlayingViewController view](self, "view");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "leftButton");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[MRUAmbientNowPlayingViewController setArtworkTransitionDirection:](self, "setArtworkTransitionDirection:", v5 == v4);
}

- (void)updateVolumeControls
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void (**v10)(_QWORD);
  void *v11;
  void *v12;
  char v13;
  void *v14;
  MRUVolumeController *v15;
  MRUVolumeController *v16;
  _QWORD aBlock[4];
  id v18;

  -[MRUAmbientNowPlayingViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "volumeControlsView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[MRUNowPlayingController endpointController](self->_controller, "endpointController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "route");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "dataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __58__MRUAmbientNowPlayingViewController_updateVolumeControls__block_invoke;
  aBlock[3] = &unk_1E581B9A8;
  v9 = v6;
  v18 = v9;
  v10 = (void (**)(_QWORD))_Block_copy(aBlock);
  objc_msgSend(v4, "volumeController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    v15 = [MRUVolumeController alloc];
    v10[2](v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[MPVolumeController initWithDataSource:](v15, "initWithDataSource:", v14);
    objc_msgSend(v4, "setVolumeController:", v16);

    goto LABEL_8;
  }
  objc_msgSend(v8, "groupRoute");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqual:", v9);

  if ((v13 & 1) == 0)
  {
    v10[2](v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDataSource:", v14);
LABEL_8:

  }
}

id __58__MRUAmbientNowPlayingViewController_updateVolumeControls__block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CC2538]), "initWithGroupRoute:outputDeviceRoute:", *(_QWORD *)(a1 + 32), 0);
}

- (void)updateRoute
{
  void *v3;
  void *v4;
  id v5;

  -[MRUAmbientNowPlayingViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "artworkView");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[MRUNowPlayingController deviceSymbolName](self->_controller, "deviceSymbolName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPlaceholderSymbolName:", v4);

}

- (void)updateRoutingButton
{
  void *v3;
  _QWORD v4[5];

  -[MRUAmbientNowPlayingViewController controller](self, "controller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __57__MRUAmbientNowPlayingViewController_updateRoutingButton__block_invoke;
  v4[3] = &unk_1E5819988;
  v4[4] = self;
  objc_msgSend(v3, "routingDeviceImage:", v4);

}

void __57__MRUAmbientNowPlayingViewController_updateRoutingButton__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "view");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRoutingButtonImage:", v3);

}

- (void)updateNowPlayingInfo
{
  void *v3;
  void *v4;
  id v5;

  -[MRUNowPlayingController metadataController](self->_controller, "metadataController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nowPlayingInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUAmbientNowPlayingViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNowPlayingInfo:", v3);

}

- (void)updateArtwork
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[MRUAmbientNowPlayingViewController view](self, "view");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "artworkView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUNowPlayingController metadataController](self->_controller, "metadataController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "artwork");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setArtwork:transitionDirection:", v5, -[MRUAmbientNowPlayingViewController artworkTransitionDirection](self, "artworkTransitionDirection"));

}

- (void)updateTimeControls
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[MRUNowPlayingController metadataController](self->_controller, "metadataController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeControls");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUAmbientNowPlayingViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeControlsView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTimeControls:", v3);

}

- (void)updateTransportControls
{
  void *v3;
  void *v4;
  id v5;

  -[MRUNowPlayingController metadataController](self->_controller, "metadataController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "transportControls");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUAmbientNowPlayingViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTransportControls:", v3);

}

- (void)updateEverything
{
  -[MRUAmbientNowPlayingViewController updateRoute](self, "updateRoute");
  -[MRUAmbientNowPlayingViewController updateVolumeControls](self, "updateVolumeControls");
  -[MRUAmbientNowPlayingViewController updateRoutingButton](self, "updateRoutingButton");
  -[MRUAmbientNowPlayingViewController updateNowPlayingInfo](self, "updateNowPlayingInfo");
  -[MRUAmbientNowPlayingViewController updateArtwork](self, "updateArtwork");
  -[MRUAmbientNowPlayingViewController updateTimeControls](self, "updateTimeControls");
  -[MRUAmbientNowPlayingViewController updateTransportControls](self, "updateTransportControls");
}

- (void)presentRoutingControlsFromSourceView:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  MPMediaControls *v9;
  MPMediaControls *mediaControls;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  id location;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0CC23D8]);
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPresentingAppBundleID:", v7);

  objc_msgSend(v5, "setStyle:", 2);
  if (MRAVOutputContextGetSharedAudioPresentationContext())
  {
    v8 = (void *)MRAVOutputContextCopyUniqueIdentifier();
    objc_msgSend(v5, "setRoutingContextUID:", v8);

  }
  objc_initWeak(&location, self);
  v9 = (MPMediaControls *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC23D0]), "initWithConfiguration:shouldObserveRoutingContextUIDChanges:", v5, 0);
  mediaControls = self->_mediaControls;
  self->_mediaControls = v9;

  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __75__MRUAmbientNowPlayingViewController_presentRoutingControlsFromSourceView___block_invoke;
  v14 = &unk_1E5818E18;
  objc_copyWeak(&v15, &location);
  -[MPMediaControls setDismissHandler:](self->_mediaControls, "setDismissHandler:", &v11);
  -[MPMediaControls present](self->_mediaControls, "present", v11, v12, v13, v14);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

void __75__MRUAmbientNowPlayingViewController_presentRoutingControlsFromSourceView___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setMediaControls:", 0);

}

- (void)embedBackdropViewController
{
  MRUBackdropControllerProtocol *backdropViewController;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[MRUAmbientNowPlayingViewController addChildViewController:](self, "addChildViewController:", self->_backdropViewController);
  backdropViewController = self->_backdropViewController;
  -[MRUAmbientNowPlayingViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "artworkView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "artworkImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUBackdropControllerProtocol updateImage:animated:](backdropViewController, "updateImage:animated:", v6, 0);

  -[MRUBackdropControllerProtocol beginAppearanceTransition:animated:](self->_backdropViewController, "beginAppearanceTransition:animated:", 1, self->_onScreen);
  -[MRUBackdropControllerProtocol view](self->_backdropViewController, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUAmbientNowPlayingViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBackgroundView:", v7);

  -[MRUBackdropControllerProtocol didMoveToParentViewController:](self->_backdropViewController, "didMoveToParentViewController:", self);
  -[MRUBackdropControllerProtocol endAppearanceTransition](self->_backdropViewController, "endAppearanceTransition");
}

- (void)removeBackdropViewController
{
  void *v3;

  -[MRUBackdropControllerProtocol willMoveToParentViewController:](self->_backdropViewController, "willMoveToParentViewController:", 0);
  -[MRUBackdropControllerProtocol beginAppearanceTransition:animated:](self->_backdropViewController, "beginAppearanceTransition:animated:", 0, self->_onScreen);
  -[MRUAmbientNowPlayingViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundView:", 0);

  -[MRUBackdropControllerProtocol removeFromParentViewController](self->_backdropViewController, "removeFromParentViewController");
  -[MRUBackdropControllerProtocol endAppearanceTransition](self->_backdropViewController, "endAppearanceTransition");
}

- (void)launchNowPlayingApp
{
  id v2;

  -[MRUNowPlayingController endpointController](self->_controller, "endpointController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "launchNowPlayingApp");

}

- (MRUBackdropControllerProtocol)backdropViewController
{
  return self->_backdropViewController;
}

- (MRUNowPlayingController)controller
{
  return self->_controller;
}

- (void)setController:(id)a3
{
  objc_storeStrong((id *)&self->_controller, a3);
}

- (MPMediaControls)mediaControls
{
  return self->_mediaControls;
}

- (void)setMediaControls:(id)a3
{
  objc_storeStrong((id *)&self->_mediaControls, a3);
}

- (BOOL)isOnScreen
{
  return self->_onScreen;
}

- (int64_t)artworkTransitionDirection
{
  return self->_artworkTransitionDirection;
}

- (MSVTimer)artworkTransitionDirectionTimer
{
  return self->_artworkTransitionDirectionTimer;
}

- (void)setArtworkTransitionDirectionTimer:(id)a3
{
  objc_storeStrong((id *)&self->_artworkTransitionDirectionTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkTransitionDirectionTimer, 0);
  objc_storeStrong((id *)&self->_mediaControls, 0);
  objc_storeStrong((id *)&self->_controller, 0);
  objc_storeStrong((id *)&self->_backdropViewController, 0);
}

@end
