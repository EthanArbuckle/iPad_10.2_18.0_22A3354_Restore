@implementation MRURouteRecommendationPlatterViewController

- (MRURouteRecommendationPlatterViewController)init
{
  return -[MRURouteRecommendationPlatterViewController initWithRouteIdentifier:](self, "initWithRouteIdentifier:", 0);
}

- (MRURouteRecommendationPlatterViewController)initWithRouteIdentifier:(id)a3
{
  id v4;
  MRURouteRecommendationPlatterViewController *v5;
  NSObject *v6;
  MRUEndpointController *v7;
  MRUEndpointController *v8;
  MRUNowPlayingController *v9;
  MRUNowPlayingController *nowPlayingController;
  MRURouteTextFormatter *v11;
  MRURouteTextFormatter *routeTextFormatter;
  void *v13;
  objc_super v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  MRURouteRecommendationPlatterViewController *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MRURouteRecommendationPlatterViewController;
  v5 = -[MRURouteRecommendationPlatterViewController init](&v15, sel_init);
  if (v5)
  {
    _MRLogForCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v17 = v4;
      v18 = 2048;
      v19 = v5;
      _os_log_impl(&dword_1AA991000, v6, OS_LOG_TYPE_DEFAULT, ">>+ MRURPVC got %@ (self = %p)", buf, 0x16u);
    }

    if (objc_msgSend(v4, "length"))
    {
      v7 = -[MRUEndpointController initWithRouteUID:client:player:]([MRUEndpointController alloc], "initWithRouteUID:client:player:", v4, 0, 0);
    }
    else
    {
      +[MRUEndpointController proactiveRecommendedEndpointController](MRUEndpointController, "proactiveRecommendedEndpointController");
      v7 = (MRUEndpointController *)objc_claimAutoreleasedReturnValue();
    }
    v8 = v7;
    v9 = -[MRUNowPlayingController initWithEndpointController:]([MRUNowPlayingController alloc], "initWithEndpointController:", v7);
    nowPlayingController = v5->_nowPlayingController;
    v5->_nowPlayingController = v9;

    v11 = objc_alloc_init(MRURouteTextFormatter);
    routeTextFormatter = v5->_routeTextFormatter;
    v5->_routeTextFormatter = v11;

    -[MRURouteTextFormatter configuration](v5->_routeTextFormatter, "configuration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setOmitGroupLeaderName:", 1);

  }
  return v5;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)loadView
{
  MRURouteRecommendationPlatterView *v3;

  v3 = objc_alloc_init(MRURouteRecommendationPlatterView);
  -[MRURouteRecommendationPlatterViewController setView:](self, "setView:", v3);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MRURouteRecommendationPlatterViewController;
  -[MRURouteRecommendationPlatterViewController viewDidLoad](&v7, sel_viewDidLoad);
  -[MRURouteRecommendationPlatterViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addTarget:action:forControlEvents:", self, sel_handleTap_, 64);

  -[MRURouteRecommendationPlatterViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actionButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addTarget:action:forControlEvents:", self, sel_handleActionButtonTap_, 64);

  -[MRURouteRecommendationPlatterViewController nowPlayingController](self, "nowPlayingController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:", self);

  -[MRURouteRecommendationPlatterViewController updateActionType](self, "updateActionType");
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MRURouteRecommendationPlatterViewController;
  -[MRURouteRecommendationPlatterViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[MRURouteRecommendationPlatterViewController setOnScreen:](self, "setOnScreen:", 1);
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[MRURouteRecommendationPlatterViewController setOnScreen:](self, "setOnScreen:", 0);
  v5.receiver = self;
  v5.super_class = (Class)MRURouteRecommendationPlatterViewController;
  -[MRURouteRecommendationPlatterViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, v3);
}

- (void)setOnScreen:(BOOL)a3
{
  void *v4;

  if (self->_onScreen != a3)
  {
    self->_onScreen = a3;
    -[MRURouteRecommendationPlatterViewController nowPlayingController](self, "nowPlayingController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "updateAutomaticResponseLoading");

  }
  -[MRURouteRecommendationPlatterViewController updateMarqueeAnimation](self, "updateMarqueeAnimation");
}

- (void)handleActionButtonTap:(id)a3
{
  void *v4;
  int v5;
  id v6;

  -[MRUNowPlayingController tvRemoteController](self->_nowPlayingController, "tvRemoteController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "showTVRemote");

  if (v5)
  {
    -[MRUNowPlayingController tvRemoteController](self->_nowPlayingController, "tvRemoteController");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "presentTVRemoteUsingApp:", 0);

  }
  else
  {
    -[MRURouteRecommendationPlatterViewController _acceptRecommendation](self, "_acceptRecommendation");
  }
}

- (void)_acceptRecommendation
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[MRURouteRecommendationPlatterViewController nowPlayingController](self, "nowPlayingController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endpointController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "route");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endpointObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "outputDeviceUIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4C648]), "initWithOutputDeviceUID:reason:", v8, CFSTR("Recommendation accepted"));
  objc_msgSend(v7, "perform:completion:", MEMORY[0x1E0C80D38], &__block_literal_global_11);

}

- (void)nowPlayingController:(id)a3 endpointController:(id)a4 didChangeRoute:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];

  v6 = a5;
  +[MRUAssetManager sharedManager](MRUAssetManager, "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __102__MRURouteRecommendationPlatterViewController_nowPlayingController_endpointController_didChangeRoute___block_invoke;
  v11[3] = &unk_1E5819988;
  v11[4] = self;
  objc_msgSend(v7, "imageForEndpointRoute:completion:", v6, v11);

  -[MRURouteTextFormatter textForRoute:](self->_routeTextFormatter, "textForRoute:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[MRURouteRecommendationPlatterViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "labelView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTitle:", v8);

  -[MRURouteRecommendationPlatterViewController invalidateAllTimelinesForReason:](self, "invalidateAllTimelinesForReason:", CFSTR("now playing route changed"));
}

uint64_t __102__MRURouteRecommendationPlatterViewController_nowPlayingController_endpointController_didChangeRoute___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activityRouteView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deviceIconView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "frame");
  objc_msgSend(v4, "mru_imageFittingSize:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "activityRouteView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "deviceIconView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setImage:", v10);

  return objc_msgSend(*(id *)(a1 + 32), "invalidateAllTimelinesForReason:", CFSTR("now playing route image changed"));
}

- (void)nowPlayingController:(id)a3 metadataController:(id)a4 didChangeArtwork:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a5;
  -[MRURouteRecommendationPlatterViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "activityRouteView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "artworkView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setArtwork:", v6);

  -[MRURouteRecommendationPlatterViewController invalidateAllTimelinesForReason:](self, "invalidateAllTimelinesForReason:", CFSTR("now playing artwork changed"));
}

- (void)nowPlayingController:(id)a3 metadataController:(id)a4 didChangeNowPlayingInfo:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;

  v6 = a5;
  -[MRURouteRecommendationPlatterViewController view](self, "view");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringForComponents:", 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "labelView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSubtitle:", v7);

  v9 = objc_msgSend(v6, "isPlaying") ^ 1;
  objc_msgSend(v15, "activityRouteView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "artworkView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setHidden:", v9);

  v12 = objc_msgSend(v6, "isPlaying");
  objc_msgSend(v15, "activityRouteView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "artworkView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setPlaying:", v12);

  -[MRURouteRecommendationPlatterViewController invalidateAllTimelinesForReason:](self, "invalidateAllTimelinesForReason:", CFSTR("now playing info changed"));
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  int v5;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MRURouteRecommendationPlatterViewController;
  v4 = a3;
  -[MRURouteRecommendationPlatterViewController traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, v4);
  v5 = objc_msgSend(v4, "mr_shouldDim", v9.receiver, v9.super_class);

  -[MRURouteRecommendationPlatterViewController traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "mr_shouldDim");

  if (v5 != (_DWORD)v7)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRURouteRecommendationPlatterViewController setPendingDimmed:](self, "setPendingDimmed:", v8);

    -[MRURouteRecommendationPlatterViewController schedulePendingTraitCollectionUpdates](self, "schedulePendingTraitCollectionUpdates");
  }
}

- (void)updateDimmed
{
  -[MRURouteRecommendationPlatterViewController invalidateAllTimelinesForReason:](self, "invalidateAllTimelinesForReason:", CFSTR("backlight luminance changed"));
  -[MRURouteRecommendationPlatterViewController updateMarqueeAnimation](self, "updateMarqueeAnimation");
}

- (void)updateActionType
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;

  -[MRURouteRecommendationPlatterViewController nowPlayingController](self, "nowPlayingController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tvRemoteController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "showTVRemote");

  -[MRURouteRecommendationPlatterViewController view](self, "view");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setActionType:", v5);

}

- (void)schedulePendingTraitCollectionUpdates
{
  dispatch_time_t v3;
  _QWORD block[5];

  if (!-[MRURouteRecommendationPlatterViewController hasPendingTraitCollectionUpdates](self, "hasPendingTraitCollectionUpdates"))
  {
    -[MRURouteRecommendationPlatterViewController setHasPendingTraitCollectionUpdates:](self, "setHasPendingTraitCollectionUpdates:", 1);
    v3 = dispatch_time(0, 100000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __84__MRURouteRecommendationPlatterViewController_schedulePendingTraitCollectionUpdates__block_invoke;
    block[3] = &unk_1E5818C88;
    block[4] = self;
    dispatch_after(v3, MEMORY[0x1E0C80D38], block);
  }
}

uint64_t __84__MRURouteRecommendationPlatterViewController_schedulePendingTraitCollectionUpdates__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

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
  return objc_msgSend(*(id *)(a1 + 32), "setHasPendingTraitCollectionUpdates:", 0);
}

- (void)updateMarqueeAnimation
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = -[MRURouteRecommendationPlatterViewController isDimmed](self, "isDimmed") ^ 1;
  -[MRURouteRecommendationPlatterViewController view](self, "view");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "labelView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMarqueeEnabled:", v3);

}

- (id)backlightSceneEnvironment
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[MRURouteRecommendationPlatterViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "windowScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_backlightSceneEnvironment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_timelinesForDateInterval:(id)a3
{
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D00F38], "emptyTimelineWithIdentifier:", CFSTR("route recommendation platter"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)invalidateAllTimelinesForReason:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (-[MRURouteRecommendationPlatterViewController isDimmed](self, "isDimmed"))
  {
    -[MRURouteRecommendationPlatterViewController backlightSceneEnvironment](self, "backlightSceneEnvironment");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invalidateAllTimelinesForReason:", v5);

  }
}

- (NSString)routeIdentifier
{
  return self->_routeIdentifier;
}

- (void)setRouteIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_routeIdentifier, a3);
}

- (MRUNowPlayingController)nowPlayingController
{
  return self->_nowPlayingController;
}

- (void)setNowPlayingController:(id)a3
{
  objc_storeStrong((id *)&self->_nowPlayingController, a3);
}

- (BOOL)isOnScreen
{
  return self->_onScreen;
}

- (MRURouteTextFormatter)routeTextFormatter
{
  return self->_routeTextFormatter;
}

- (void)setRouteTextFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_routeTextFormatter, a3);
}

- (BOOL)isDimmed
{
  return self->_dimmed;
}

- (void)setDimmed:(BOOL)a3
{
  self->_dimmed = a3;
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
  objc_storeStrong((id *)&self->_routeTextFormatter, 0);
  objc_storeStrong((id *)&self->_nowPlayingController, 0);
  objc_storeStrong((id *)&self->_routeIdentifier, 0);
}

@end
