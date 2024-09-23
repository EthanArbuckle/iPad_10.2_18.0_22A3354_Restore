@implementation MRUAmbientCompactNowPlayingViewController

- (MRUAmbientCompactNowPlayingViewController)init
{
  void *v3;
  MRUNowPlayingController *v4;
  MRUAmbientCompactNowPlayingViewController *v5;

  +[MRUEndpointController proactiveUserSelectedEndpointController](MRUEndpointController, "proactiveUserSelectedEndpointController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[MRUNowPlayingController initWithEndpointController:]([MRUNowPlayingController alloc], "initWithEndpointController:", v3);
  v5 = -[MRUAmbientCompactNowPlayingViewController initWithNowPlayingController:](self, "initWithNowPlayingController:", v4);

  return v5;
}

- (MRUAmbientCompactNowPlayingViewController)initWithNowPlayingController:(id)a3
{
  id v5;
  MRUAmbientCompactNowPlayingViewController *v6;
  MRUAmbientCompactNowPlayingViewController *v7;
  id *p_nowPlayingController;
  MRUWaveformController *v9;
  MRUWaveformController *waveformController;
  MRUWaveformViewController *v11;
  MRUWaveformController *v12;
  void *v13;
  uint64_t v14;
  MRUWaveformViewController *waveformViewController;
  objc_super v17;

  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MRUAmbientCompactNowPlayingViewController;
  v6 = -[MRUAmbientCompactNowPlayingViewController init](&v17, sel_init);
  v7 = v6;
  if (v6)
  {
    p_nowPlayingController = (id *)&v6->_nowPlayingController;
    objc_storeStrong((id *)&v6->_nowPlayingController, a3);
    objc_msgSend(*p_nowPlayingController, "addObserver:", v7);
    v9 = objc_alloc_init(MRUWaveformController);
    waveformController = v7->_waveformController;
    v7->_waveformController = v9;

    -[MRUWaveformController setNowPlayingController:](v7->_waveformController, "setNowPlayingController:", *p_nowPlayingController);
    v11 = [MRUWaveformViewController alloc];
    v12 = v7->_waveformController;
    +[MRUWaveformSettings ambientSettings](MRUWaveformSettings, "ambientSettings");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[MRUWaveformViewController initWithContext:waveformController:settings:](v11, "initWithContext:waveformController:settings:", 2, v12, v13);
    waveformViewController = v7->_waveformViewController;
    v7->_waveformViewController = (MRUWaveformViewController *)v14;

    -[MRUWaveformViewController setOnScreen:](v7->_waveformViewController, "setOnScreen:", 1);
    -[MRUWaveformViewController willMoveToParentViewController:](v7->_waveformViewController, "willMoveToParentViewController:", v7);
    -[MRUAmbientCompactNowPlayingViewController addChildViewController:](v7, "addChildViewController:", v7->_waveformViewController);
  }

  return v7;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)loadView
{
  MRUAmbientCompactNowPlayingView *v3;
  void *v4;
  void *v5;
  MRUAmbientCompactNowPlayingView *v6;
  id v7;

  v3 = [MRUAmbientCompactNowPlayingView alloc];
  -[MRUAmbientCompactNowPlayingViewController waveformViewController](self, "waveformViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MRUAmbientCompactNowPlayingView initWithWaveformView:](v3, "initWithWaveformView:", v5);
  -[MRUAmbientCompactNowPlayingViewController setView:](self, "setView:", v6);

  -[MRUAmbientCompactNowPlayingViewController waveformViewController](self, "waveformViewController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "didMoveToParentViewController:", self);

}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MRUAmbientCompactNowPlayingViewController;
  -[MRUAmbientCompactNowPlayingViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[MRUAmbientCompactNowPlayingViewController updateArtwork](self, "updateArtwork");
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MRUAmbientCompactNowPlayingViewController;
  -[MRUAmbientCompactNowPlayingViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[MRUAmbientCompactNowPlayingViewController setOnScreen:](self, "setOnScreen:", 1);
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MRUAmbientCompactNowPlayingViewController;
  -[MRUAmbientCompactNowPlayingViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[MRUAmbientCompactNowPlayingViewController setOnScreen:](self, "setOnScreen:", 0);
}

- (void)setOnScreen:(BOOL)a3
{
  id v3;

  if (self->_onScreen != a3)
  {
    self->_onScreen = a3;
    -[MRUAmbientCompactNowPlayingViewController nowPlayingController](self, "nowPlayingController");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "updateAutomaticResponseLoading");

  }
}

- (void)updateArtwork
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  -[MRUNowPlayingController metadataController](self->_nowPlayingController, "metadataController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "artwork");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "catalog");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __58__MRUAmbientCompactNowPlayingViewController_updateArtwork__block_invoke;
  v6[3] = &unk_1E5819EB8;
  v6[4] = self;
  objc_msgSend(v5, "requestImageWithCompletion:", v6);

}

void __58__MRUAmbientCompactNowPlayingViewController_updateArtwork__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "waveformController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setArtworkImage:", v3);

}

- (MRUNowPlayingController)nowPlayingController
{
  return self->_nowPlayingController;
}

- (MRUWaveformController)waveformController
{
  return self->_waveformController;
}

- (MRUWaveformViewController)waveformViewController
{
  return self->_waveformViewController;
}

- (BOOL)isOnScreen
{
  return self->_onScreen;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waveformViewController, 0);
  objc_storeStrong((id *)&self->_waveformController, 0);
  objc_storeStrong((id *)&self->_nowPlayingController, 0);
}

@end
