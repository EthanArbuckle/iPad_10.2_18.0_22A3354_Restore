@implementation CPUINowPlayingViewController

- (CPUINowPlayingViewController)initWithBundleIdentifier:(id)a3 dataSource:(id)a4 delegate:(id)a5
{
  id v9;
  id v10;
  id v11;
  CPUINowPlayingViewController *v12;
  CPUINowPlayingViewController *v13;
  NSArray *nowPlayingSizeConstraints;
  NSOperationQueue *v15;
  NSOperationQueue *artworkOperationQueue;
  CPUINowPlayingView *v17;
  uint64_t v18;
  CPUINowPlayingView *nowPlayingView;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  CRSUIStatusBarStyleAssertion *statusBarStyleAssertion;
  MRNowPlayingAudioFormatController *v27;
  MRNowPlayingAudioFormatController *audioFormatController;
  objc_super v30;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v30.receiver = self;
  v30.super_class = (Class)CPUINowPlayingViewController;
  v12 = -[CPUINowPlayingViewController init](&v30, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeWeak((id *)&v12->_dataSource, v10);
    objc_storeWeak((id *)&v13->_delegate, v11);
    objc_storeStrong((id *)&v13->_bundleIdentifier, a3);
    nowPlayingSizeConstraints = v13->_nowPlayingSizeConstraints;
    v13->_nowPlayingSizeConstraints = (NSArray *)MEMORY[0x24BDBD1A8];

    v15 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x24BDD1710]);
    artworkOperationQueue = v13->_artworkOperationQueue;
    v13->_artworkOperationQueue = v15;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v13->_artworkOperationQueue, "setMaxConcurrentOperationCount:", 1);
    -[NSOperationQueue setName:](v13->_artworkOperationQueue, "setName:", CFSTR("Now Playing Artwork Queue"));
    -[NSOperationQueue setQualityOfService:](v13->_artworkOperationQueue, "setQualityOfService:", 33);
    v17 = [CPUINowPlayingView alloc];
    v18 = -[CPUINowPlayingView initWithFrame:](v17, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    nowPlayingView = v13->_nowPlayingView;
    v13->_nowPlayingView = (CPUINowPlayingView *)v18;

    -[CPUINowPlayingView songDetailsView](v13->_nowPlayingView, "songDetailsView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "albumArtistLabelButton");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addTarget:action:forControlEvents:", v13, sel__albumArtistButtonTapped_, 64);

    -[CPUINowPlayingView songDetailsView](v13->_nowPlayingView, "songDetailsView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "attributionButton");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addTarget:action:forControlEvents:", v13, sel__attributionButtonTapped_, 64);

    -[CPUINowPlayingView playModeControlView](v13->_nowPlayingView, "playModeControlView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setDelegate:", v13);

    v25 = objc_msgSend(objc_alloc(MEMORY[0x24BE15428]), "initWithInterfaceStyle:contrast:", 2, 0);
    statusBarStyleAssertion = v13->_statusBarStyleAssertion;
    v13->_statusBarStyleAssertion = (CRSUIStatusBarStyleAssertion *)v25;

    v27 = (MRNowPlayingAudioFormatController *)objc_alloc_init(MEMORY[0x24BE65518]);
    audioFormatController = v13->_audioFormatController;
    v13->_audioFormatController = v27;

    -[MRNowPlayingAudioFormatController setDelegate:](v13->_audioFormatController, "setDelegate:", v13);
    -[CPUINowPlayingViewController _updateAudioFormatContentInfo:](v13, "_updateAudioFormatContentInfo:", 0);
  }

  return v13;
}

- (void)dealloc
{
  CRSUIStatusBarStyleAssertion *statusBarStyleAssertion;
  NSTimer *uiTimer;
  objc_super v5;

  -[CRSUIStatusBarStyleAssertion invalidate](self->_statusBarStyleAssertion, "invalidate");
  statusBarStyleAssertion = self->_statusBarStyleAssertion;
  self->_statusBarStyleAssertion = 0;

  -[NSTimer invalidate](self->_uiTimer, "invalidate");
  uiTimer = self->_uiTimer;
  self->_uiTimer = 0;

  v5.receiver = self;
  v5.super_class = (Class)CPUINowPlayingViewController;
  -[CPUINowPlayingViewController dealloc](&v5, sel_dealloc);
}

- (void)setDataSource:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_dataSource, obj);
    -[CPUINowPlayingViewController reloadData](self, "reloadData");
    v5 = obj;
  }

}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    -[CPUINowPlayingViewController reloadData](self, "reloadData");
    v5 = obj;
  }

}

- (void)reloadData
{
  -[CPUINowPlayingViewController _reloadDataForcingLayout:updateControls:](self, "_reloadDataForcingLayout:updateControls:", 0, 1);
}

- (void)playModeControlView:(id)a3 didSelectButton:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  char v9;
  id v10;
  id v11;
  id v12;
  char v13;
  id v14;
  id v15;
  char v16;
  id v17;
  id v18;
  char v19;
  id v20;
  id v21;
  char v22;
  id v23;
  char v24;
  id v25;

  v25 = a3;
  v6 = a4;
  objc_msgSend(v25, "shuffleButton");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7 == v6)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      v10 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v10, "nowPlayingViewControllerToggleShuffle:", self);
LABEL_23:

      goto LABEL_24;
    }
  }
  else
  {

  }
  objc_msgSend(v25, "repeatButton");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (v11 != v6)
  {

    goto LABEL_9;
  }
  v12 = objc_loadWeakRetained((id *)&self->_delegate);
  v13 = objc_opt_respondsToSelector();

  if ((v13 & 1) != 0)
  {
    v10 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v10, "nowPlayingViewControllerToggleRepeat:", self);
    goto LABEL_23;
  }
LABEL_9:
  objc_msgSend(v25, "moreButton");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  if (v14 != v6)
  {

    goto LABEL_13;
  }
  v15 = objc_loadWeakRetained((id *)&self->_delegate);
  v16 = objc_opt_respondsToSelector();

  if ((v16 & 1) != 0)
  {
    v10 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v10, "nowPlayingViewControllerMore:", self);
    goto LABEL_23;
  }
LABEL_13:
  objc_msgSend(v25, "addToLibraryButton");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  if (v17 != v6)
  {

    goto LABEL_17;
  }
  v18 = objc_loadWeakRetained((id *)&self->_delegate);
  v19 = objc_opt_respondsToSelector();

  if ((v19 & 1) != 0)
  {
    v10 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v10, "nowPlayingViewControllerAddToLibrary:", self);
    goto LABEL_23;
  }
LABEL_17:
  objc_msgSend(v25, "playbackRateButton");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  if (v20 != v6)
  {

    goto LABEL_21;
  }
  v21 = objc_loadWeakRetained((id *)&self->_delegate);
  v22 = objc_opt_respondsToSelector();

  if ((v22 & 1) != 0)
  {
    v10 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v10, "nowPlayingViewControllerChangePlaybackRate:", self);
    goto LABEL_23;
  }
LABEL_21:
  v23 = objc_loadWeakRetained((id *)&self->_delegate);
  v24 = objc_opt_respondsToSelector();

  if ((v24 & 1) != 0)
  {
    v10 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v10, "nowPlayingViewController:didSelectButton:", self, v6);
    goto LABEL_23;
  }
LABEL_24:

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)CPUINowPlayingViewController;
  -[CPUINowPlayingViewController viewWillAppear:](&v17, sel_viewWillAppear_, a3);
  -[CPUINowPlayingViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "navigationBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBarStyle:", 4);

  -[CPUINowPlayingViewController navigationController](self, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "navigationBar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setOverrideUserInterfaceStyle:", 2);

  objc_msgSend(MEMORY[0x24BDE56B0], "filterWithType:", *MEMORY[0x24BDE5BD8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPUINowPlayingViewController navigationController](self, "navigationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "navigationBar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setCompositingFilter:", v8);

  -[CPUINowPlayingViewController navigationController](self, "navigationController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "navigationBar");
  v13 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v13, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAllowsGroupBlending:", 1);

  -[CPUINowPlayingViewController _setStatusBarOverrideActive:](self, "_setStatusBarOverrideActive:", 1);
  -[CPUINowPlayingViewController delegate](self, "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v13) = objc_opt_respondsToSelector();

  if ((v13 & 1) != 0)
  {
    -[CPUINowPlayingViewController delegate](self, "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "nowPlayingViewControllerWillAppear:", self);

  }
}

- (void)viewWillDisappear:(BOOL)a3
{
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
  v14.super_class = (Class)CPUINowPlayingViewController;
  -[CPUINowPlayingViewController viewWillDisappear:](&v14, sel_viewWillDisappear_, a3);
  -[CPUINowPlayingViewController _setStatusBarOverrideActive:](self, "_setStatusBarOverrideActive:", 0);
  -[CPUINowPlayingViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "navigationBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBarStyle:", 0);

  -[CPUINowPlayingViewController navigationController](self, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "navigationBar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setOverrideUserInterfaceStyle:", 0);

  -[CPUINowPlayingViewController navigationController](self, "navigationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "navigationBar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setCompositingFilter:", 0);

  -[CPUINowPlayingViewController navigationController](self, "navigationController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "navigationBar");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAllowsGroupBlending:", 0);

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CPUINowPlayingViewController;
  -[CPUINowPlayingViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, a3);
  -[CPUINowPlayingViewController uiTimer](self, "uiTimer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

  -[CPUINowPlayingViewController setUiTimer:](self, "setUiTimer:", 0);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  UIImageView *v6;
  UIImageView *artworkView;
  UIVisualEffectView *v8;
  UIVisualEffectView *artworkVisualEffectView;
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
  id v21;
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
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  CPUINowPlayingView *nowPlayingView;
  void *v39;
  void *v40;
  void *v41;
  CPUINowPlayingView *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  CPUINowPlayingView *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  CPUINowPlayingView *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  objc_super v70;
  _QWORD v71[4];
  _QWORD v72[2];

  v72[1] = *MEMORY[0x24BDAC8D0];
  v70.receiver = self;
  v70.super_class = (Class)CPUINowPlayingViewController;
  -[CPUINowPlayingViewController viewDidLoad](&v70, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x24BDF6950], "tableBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPUINowPlayingViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  -[CPUINowPlayingViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityIdentifier:", CFSTR("CPNowPlayingView"));

  -[CPUINowPlayingViewController _installedFullBackgroundArtworkViewBelowView:](self, "_installedFullBackgroundArtworkViewBelowView:", 0);
  v6 = (UIImageView *)objc_claimAutoreleasedReturnValue();
  artworkView = self->_artworkView;
  self->_artworkView = v6;

  objc_msgSend(MEMORY[0x24BDF6878], "effectWithStyle:", 10);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (UIVisualEffectView *)objc_alloc_init(MEMORY[0x24BDF6FC8]);
  artworkVisualEffectView = self->_artworkVisualEffectView;
  self->_artworkVisualEffectView = v8;

  v72[0] = v69;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v72, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIVisualEffectView setBackgroundEffects:](self->_artworkVisualEffectView, "setBackgroundEffects:", v10);

  -[UIVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:](self->_artworkVisualEffectView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[CPUINowPlayingViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSubview:", self->_artworkVisualEffectView);

  v61 = (void *)MEMORY[0x24BDD1628];
  -[UIVisualEffectView topAnchor](self->_artworkVisualEffectView, "topAnchor");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPUINowPlayingViewController view](self, "view");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "topAnchor");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "constraintEqualToAnchor:", v66);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v71[0] = v65;
  -[UIVisualEffectView bottomAnchor](self->_artworkVisualEffectView, "bottomAnchor");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPUINowPlayingViewController view](self, "view");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "bottomAnchor");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "constraintEqualToAnchor:", v62);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v71[1] = v60;
  -[UIVisualEffectView leadingAnchor](self->_artworkVisualEffectView, "leadingAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPUINowPlayingViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "leadingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v71[2] = v15;
  -[UIVisualEffectView trailingAnchor](self->_artworkVisualEffectView, "trailingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPUINowPlayingViewController view](self, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "trailingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v71[3] = v19;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v71, 4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "activateConstraints:", v20);

  v21 = objc_alloc(MEMORY[0x24BDF6B68]);
  v22 = (void *)objc_msgSend(v21, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  -[CPUINowPlayingViewController setRightTitleLabel:](self, "setRightTitleLabel:", v22);

  objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:", 12.0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPUINowPlayingViewController rightTitleLabel](self, "rightTitleLabel");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setFont:", v23);

  -[CPUINowPlayingViewController rightTitleLabel](self, "rightTitleLabel");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setLineBreakMode:", 4);

  objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPUINowPlayingViewController rightTitleLabel](self, "rightTitleLabel");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setTextColor:", v26);

  -[CPUINowPlayingViewController rightTitleLabel](self, "rightTitleLabel");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setTextAlignment:", 2);

  -[CPUINowPlayingViewController rightTitleLabel](self, "rightTitleLabel");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setAlpha:", 0.0);

  -[CPUINowPlayingViewController _adjustRightTitleLabelToFit](self, "_adjustRightTitleLabelToFit");
  v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF67D0]), "initWithActivityIndicatorStyle:", 100);
  -[CPUINowPlayingViewController setActivityIndicator:](self, "setActivityIndicator:", v30);

  v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithCustomView:", self->_activityIndicator);
  -[CPUINowPlayingViewController setActivityIndicatorBarButtonItem:](self, "setActivityIndicatorBarButtonItem:", v31);

  v32 = objc_alloc(MEMORY[0x24BDF6860]);
  -[CPUINowPlayingViewController rightTitleLabel](self, "rightTitleLabel");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)objc_msgSend(v32, "initWithCustomView:", v33);
  -[CPUINowPlayingViewController setRightTitleLabelBarButtonItem:](self, "setRightTitleLabelBarButtonItem:", v34);

  -[CPUINowPlayingViewController view](self, "view");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "addSubview:", self->_nowPlayingView);

  v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E80]), "initWithTarget:action:", self, sel__leftNudgePress_);
  -[CPUINowPlayingViewController setLeftNudgePressRecognizer:](self, "setLeftNudgePressRecognizer:", v36);

  -[CPUINowPlayingViewController leftNudgePressRecognizer](self, "leftNudgePressRecognizer");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setAllowedPressTypes:", &unk_24DF303A8);

  nowPlayingView = self->_nowPlayingView;
  -[CPUINowPlayingViewController leftNudgePressRecognizer](self, "leftNudgePressRecognizer");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPUINowPlayingView addGestureRecognizer:](nowPlayingView, "addGestureRecognizer:", v39);

  v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E80]), "initWithTarget:action:", self, sel__rightNudgePress_);
  -[CPUINowPlayingViewController setRightNudgePressRecognizer:](self, "setRightNudgePressRecognizer:", v40);

  -[CPUINowPlayingViewController rightNudgePressRecognizer](self, "rightNudgePressRecognizer");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setAllowedPressTypes:", &unk_24DF303C0);

  v42 = self->_nowPlayingView;
  -[CPUINowPlayingViewController rightNudgePressRecognizer](self, "rightNudgePressRecognizer");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPUINowPlayingView addGestureRecognizer:](v42, "addGestureRecognizer:", v43);

  v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6BA0]), "initWithTarget:action:", self, sel__leftButtonLongPress_);
  -[CPUINowPlayingViewController setLeftNudgeLongPressRecognizer:](self, "setLeftNudgeLongPressRecognizer:", v44);

  -[CPUINowPlayingViewController leftNudgeLongPressRecognizer](self, "leftNudgeLongPressRecognizer");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setAllowedPressTypes:", &unk_24DF303D8);

  -[CPUINowPlayingViewController leftNudgeLongPressRecognizer](self, "leftNudgeLongPressRecognizer");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPUINowPlayingViewController leftNudgePressRecognizer](self, "leftNudgePressRecognizer");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "requireGestureRecognizerToFail:", v47);

  v48 = self->_nowPlayingView;
  -[CPUINowPlayingViewController leftNudgeLongPressRecognizer](self, "leftNudgeLongPressRecognizer");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPUINowPlayingView addGestureRecognizer:](v48, "addGestureRecognizer:", v49);

  v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6BA0]), "initWithTarget:action:", self, sel__fastForwardButtonLongPress_);
  -[CPUINowPlayingViewController setRightNudgeLongPressRecognizer:](self, "setRightNudgeLongPressRecognizer:", v50);

  -[CPUINowPlayingViewController rightNudgeLongPressRecognizer](self, "rightNudgeLongPressRecognizer");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "setAllowedPressTypes:", &unk_24DF303F0);

  -[CPUINowPlayingViewController rightNudgeLongPressRecognizer](self, "rightNudgeLongPressRecognizer");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPUINowPlayingViewController rightNudgePressRecognizer](self, "rightNudgePressRecognizer");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "requireGestureRecognizerToFail:", v53);

  v54 = self->_nowPlayingView;
  -[CPUINowPlayingViewController rightNudgeLongPressRecognizer](self, "rightNudgeLongPressRecognizer");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPUINowPlayingView addGestureRecognizer:](v54, "addGestureRecognizer:", v55);

  -[CPUINowPlayingViewController _initializeTransportControls](self, "_initializeTransportControls");
  -[CPUINowPlayingViewController setOverrideUserInterfaceStyle:](self, "setOverrideUserInterfaceStyle:", 2);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "addObserver:selector:name:object:", self, sel__sceneWillEnterForeground_, *MEMORY[0x24BDF7D40], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "addObserver:selector:name:object:", self, sel__sceneDidActivate_, *MEMORY[0x24BDF7D18], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "addObserver:selector:name:object:", self, sel__sceneWillDeactivate_, *MEMORY[0x24BDF7D38], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "addObserver:selector:name:object:", self, sel__sceneDidEnterBackground_, *MEMORY[0x24BDF7D28], 0);

}

- (void)_backButtonTapped:(id)a3
{
  id v3;
  id v4;

  -[CPUINowPlayingViewController navigationController](self, "navigationController", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v4, "popViewControllerAnimated:", 1);

}

- (void)setRightTitle:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[CPUINowPlayingViewController rightTitleLabel](self, "rightTitleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

  -[CPUINowPlayingViewController _adjustRightTitleLabelToFit](self, "_adjustRightTitleLabelToFit");
}

- (void)_adjustRightTitleLabelToFit
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  double Width;
  void *v14;
  double v15;
  void *v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  BOOL v21;
  id v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;

  -[CPUINowPlayingViewController rightTitleLabel](self, "rightTitleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sizeToFit");

  -[CPUINowPlayingViewController rightTitleLabel](self, "rightTitleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v23.origin.x = v6;
  v23.origin.y = v8;
  v23.size.width = v10;
  v23.size.height = v12;
  Width = CGRectGetWidth(v23);
  -[CPUINowPlayingViewController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "frame");
  v15 = CGRectGetWidth(v24) * 0.6;

  if (Width > v15)
    Width = v15;
  -[CPUINowPlayingViewController rightTitleLabel](self, "rightTitleLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "frame");
  v26.origin.x = v17;
  v26.origin.y = v18;
  v26.size.width = v19;
  v26.size.height = v20;
  v25.origin.x = v6;
  v25.origin.y = v8;
  v25.size.width = Width;
  v25.size.height = v12;
  v21 = CGRectEqualToRect(v25, v26);

  if (!v21)
  {
    -[CPUINowPlayingViewController rightTitleLabel](self, "rightTitleLabel");
    v22 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setFrame:", v6, v8, Width, v12);

  }
}

- (CPUITransportControlView)transportControlView
{
  void *v2;
  void *v3;

  -[CPUINowPlayingViewController nowPlayingView](self, "nowPlayingView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transportControlView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CPUITransportControlView *)v3;
}

- (CPUIPlayModeControlView)playModeControlView
{
  void *v2;
  void *v3;

  -[CPUINowPlayingViewController nowPlayingView](self, "nowPlayingView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "playModeControlView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CPUIPlayModeControlView *)v3;
}

- (CPUISongDetailsView)songDetailsView
{
  void *v2;
  void *v3;

  -[CPUINowPlayingViewController nowPlayingView](self, "nowPlayingView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "songDetailsView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CPUISongDetailsView *)v3;
}

- (id)preferredFocusEnvironments
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  -[CPUINowPlayingViewController transportControlView](self, "transportControlView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "playPauseButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v6[0] = v3;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v4;
}

- (void)_setStatusBarOverrideActive:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __60__CPUINowPlayingViewController__setStatusBarOverrideActive___block_invoke;
  v3[3] = &unk_24DF24150;
  v3[4] = self;
  v4 = a3;
  dispatch_async(MEMORY[0x24BDAC9B8], v3);
}

void __60__CPUINowPlayingViewController__setStatusBarOverrideActive___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  int v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", *MEMORY[0x24BDE5D20]);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE0BD98], "settingsWithDuration:timingFunction:", 0.35);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "statusBarStyleAssertion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isValid");

  v5 = *(unsigned __int8 *)(a1 + 40);
  if (v5 != v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "statusBarStyleAssertion");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v5)
      objc_msgSend(v6, "acquireWithAnimationSettings:", v2);
    else
      objc_msgSend(v6, "relinquishWithAnimationSettings:", v2);

  }
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CPUINowPlayingViewController;
  -[CPUINowPlayingViewController traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  -[CPUINowPlayingViewController _reloadDataForcingLayout:updateControls:](self, "_reloadDataForcingLayout:updateControls:", 1, 0);
}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CPUINowPlayingViewController;
  -[CPUINowPlayingViewController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  -[CPUINowPlayingViewController _recalculateLayout:](self, "_recalculateLayout:", 0);
}

- (void)_recalculateLayout:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  unint64_t v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  NSArray *v46;
  NSArray *nowPlayingSizeConstraints;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  double v52;
  CGFloat v53;
  double v54;
  CGFloat v55;
  double v56;
  CGFloat v57;
  double v58;
  CGFloat v59;
  void *v60;
  double Width;
  double Height;
  NSArray *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  _QWORD v74[4];
  _QWORD v75[6];
  CGRect v76;
  CGRect v77;

  v3 = a3;
  v75[4] = *MEMORY[0x24BDAC8D0];
  -[CPUINowPlayingViewController traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  if (v6 == 3)
  {
    -[CPUINowPlayingViewController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "nowPlayingViewControllerCanShowAlbumArt:", self);

    -[CPUINowPlayingViewController delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[CPUINowPlayingViewController delegate](self, "delegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "nowPlayingViewControllerIsRightHandDrive:", self);

    }
    else
    {
      v11 = 0;
    }

    -[CPUINowPlayingViewController nowPlayingView](self, "nowPlayingView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPUINowPlayingViewController dataSource](self, "dataSource");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPUINowPlayingViewController view](self, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "frame");
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;
    -[CPUINowPlayingViewController view](self, "view");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "safeAreaLayoutGuide");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "layoutFrame");
    objc_msgSend(v12, "recalculateLayout:allowsAlbumArt:hasDataSource:viewArea:safeArea:rightHandDrive:", v3, v8, v13 != 0, v11, v16, v18, v20, v22, v25, v26, v27, v28);

    v29 = 0x24BDD1000uLL;
    objc_msgSend(MEMORY[0x24BDD1628], "deactivateConstraints:", self->_nowPlayingSizeConstraints);
    -[CPUINowPlayingViewController nowPlayingView](self, "nowPlayingView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "nowPlayingLayout");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "maximumNowPlayingSize");
    v33 = v32;
    v35 = v34;

    if (v33 == *MEMORY[0x24BDBF148] && v35 == *(double *)(MEMORY[0x24BDBF148] + 8))
    {
      -[CPUINowPlayingView topAnchor](self->_nowPlayingView, "topAnchor");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      -[CPUINowPlayingViewController view](self, "view");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "topAnchor");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "constraintEqualToAnchor:");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v74[0] = v72;
      -[CPUINowPlayingView bottomAnchor](self->_nowPlayingView, "bottomAnchor");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[CPUINowPlayingViewController view](self, "view");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "bottomAnchor");
      v71 = v36;
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "constraintEqualToAnchor:");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v74[1] = v68;
      -[CPUINowPlayingView leadingAnchor](self->_nowPlayingView, "leadingAnchor");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[CPUINowPlayingViewController view](self, "view");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "safeAreaLayoutGuide");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "leadingAnchor");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = v37;
      objc_msgSend(v37, "constraintEqualToAnchor:", v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v74[2] = v40;
      -[CPUINowPlayingView trailingAnchor](self->_nowPlayingView, "trailingAnchor");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[CPUINowPlayingViewController view](self, "view");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "safeAreaLayoutGuide");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "trailingAnchor");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "constraintEqualToAnchor:", v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v74[3] = v45;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v74, 4);
      v46 = (NSArray *)objc_claimAutoreleasedReturnValue();
      nowPlayingSizeConstraints = self->_nowPlayingSizeConstraints;
      self->_nowPlayingSizeConstraints = v46;

      v48 = v65;
      v49 = v64;

      v29 = 0x24BDD1000;
    }
    else
    {
      -[CPUINowPlayingViewController view](self, "view");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "safeAreaLayoutGuide");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "layoutFrame");
      v53 = v52;
      v55 = v54;
      v57 = v56;
      v59 = v58;

      -[CPUINowPlayingView centerXAnchor](self->_nowPlayingView, "centerXAnchor");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      -[CPUINowPlayingViewController view](self, "view");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "safeAreaLayoutGuide");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "centerXAnchor");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "constraintEqualToAnchor:");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v75[0] = v71;
      -[CPUINowPlayingView centerYAnchor](self->_nowPlayingView, "centerYAnchor");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      -[CPUINowPlayingViewController view](self, "view");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "safeAreaLayoutGuide");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "centerYAnchor");
      v70 = v60;
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "constraintEqualToAnchor:");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v75[1] = v66;
      -[CPUINowPlayingView widthAnchor](self->_nowPlayingView, "widthAnchor");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v76.origin.x = v53;
      v76.origin.y = v55;
      v76.size.width = v57;
      v76.size.height = v59;
      Width = CGRectGetWidth(v76);
      if (Width >= v33)
        Width = v33;
      objc_msgSend(v38, "constraintEqualToConstant:", Width);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v75[2] = v39;
      -[CPUINowPlayingView heightAnchor](self->_nowPlayingView, "heightAnchor");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v77.origin.x = v53;
      v77.origin.y = v55;
      v77.size.width = v57;
      v77.size.height = v59;
      Height = CGRectGetHeight(v77);
      if (Height >= v35)
        Height = v35;
      objc_msgSend(v40, "constraintEqualToConstant:", Height);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v75[3] = v41;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v75, 4);
      v63 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v42 = self->_nowPlayingSizeConstraints;
      self->_nowPlayingSizeConstraints = v63;
    }

    objc_msgSend(*(id *)(v29 + 1576), "activateConstraints:", self->_nowPlayingSizeConstraints);
  }
}

- (BOOL)_showsButtonSelectionsForTouch
{
  void *v2;
  void *v3;
  void *v4;
  int v5;

  -[CPUINowPlayingViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "screen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v5 = objc_msgSend(v4, "supportsFocus") ^ 1;
  else
    LOBYTE(v5) = 0;

  return v5;
}

- (void)updatePlayControls
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL8 v17;
  _OWORD v18[3];
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;

  -[CPUINowPlayingView transportControlView](self->_nowPlayingView, "transportControlView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPUINowPlayingView progressView](self->_nowPlayingView, "progressView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "leftButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "defaultLeftButtonImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPUINowPlayingViewController _updateTransportControl:withDefaultImage:actionType:](self, "_updateTransportControl:withDefaultImage:actionType:", v5, v6, 0);

  objc_msgSend(v3, "playPauseButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPUINowPlayingViewController _updateTransportControl:withDefaultImage:actionType:](self, "_updateTransportControl:withDefaultImage:actionType:", v7, 0, 2);

  objc_msgSend(v3, "fastForwardButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "defaultFastForwardButtonImage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPUINowPlayingViewController _updateTransportControl:withDefaultImage:actionType:](self, "_updateTransportControl:withDefaultImage:actionType:", v8, v9, 1);

  -[CPUINowPlayingViewController dataSource](self, "dataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_msgSend(v10, "progressBarArtworkImageForNowPlayingViewController:", self),
        (v11 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v12 = (void *)v11;
    objc_msgSend(v4, "setHidden:", 1);
    -[CPUINowPlayingView progressImageView](self->_nowPlayingView, "progressImageView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setHidden:", 0);

    -[CPUINowPlayingView progressImageView](self->_nowPlayingView, "progressImageView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setImage:", v12);

  }
  else
  {
    -[CPUINowPlayingView progressImageView](self->_nowPlayingView, "progressImageView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setHidden:", 1);

    v23 = 0;
    v21 = 0u;
    v22 = 0u;
    v20 = 0u;
    if (v10)
      objc_msgSend(v10, "durationSnapshotForNowPlayingViewController:", self);
    v18[0] = v20;
    v18[1] = v21;
    v18[2] = v22;
    v19 = v23;
    objc_msgSend(v4, "setDurationSnapshot:", v18);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v10, "progressBarLocalizedDurationStringForNowPlayingViewController:", self);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
    }
    objc_msgSend(v4, "updateLocalizedDurationString:", v12);
    v17 = *((double *)&v21 + 1) == 0.0 && v23 == 0;
    objc_msgSend(v4, "setHidden:", v17, *((double *)&v21 + 1));
  }

  objc_msgSend(v3, "setProgressActive:", objc_msgSend(v10, "nowPlayingViewControllerIsPlaying:", self));
  -[CPUINowPlayingViewController _updatePlayModesState](self, "_updatePlayModesState");

}

- (void)_updatePlayModesState
{
  CPUINowPlayingViewControllerDelegate **p_delegate;
  id WeakRetained;
  char v5;
  id v6;
  int v7;
  id v8;
  char v9;
  id v10;
  uint64_t v11;
  int v12;
  id v13;
  char v14;
  id v15;
  int v16;
  id v17;
  char v18;
  id v19;
  uint64_t v20;
  int v21;
  id v22;
  char v23;
  id v24;
  int v25;
  id v26;
  char v27;
  id v28;
  int v29;
  id v30;
  char v31;
  id v32;
  uint64_t v33;
  id v34;
  char v35;
  id v36;
  int v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  _DWORD v45[2];
  __int16 v46;
  int v47;
  __int16 v48;
  int v49;
  __int16 v50;
  int v51;
  __int16 v52;
  int v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0
    && (v6 = objc_loadWeakRetained((id *)p_delegate),
        v7 = objc_msgSend(v6, "nowPlayingViewControllerCanShuffle:", self),
        v6,
        v7))
  {
    v8 = objc_loadWeakRetained((id *)&self->_dataSource);
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      v10 = objc_loadWeakRetained((id *)&self->_dataSource);
      v11 = objc_msgSend(v10, "shuffleTypeForNowPlayingViewController:", self);

      -[CPUINowPlayingViewController _updateShuffleStateWithType:](self, "_updateShuffleStateWithType:", v11);
    }
    v12 = 1;
  }
  else
  {
    v12 = 0;
  }
  v13 = objc_loadWeakRetained((id *)p_delegate);
  v14 = objc_opt_respondsToSelector();

  if ((v14 & 1) != 0
    && (v15 = objc_loadWeakRetained((id *)p_delegate),
        v16 = objc_msgSend(v15, "nowPlayingViewControllerCanRepeat:", self),
        v15,
        v16))
  {
    v17 = objc_loadWeakRetained((id *)&self->_dataSource);
    v18 = objc_opt_respondsToSelector();

    if ((v18 & 1) != 0)
    {
      v19 = objc_loadWeakRetained((id *)&self->_dataSource);
      v20 = objc_msgSend(v19, "repeatTypeForNowPlayingViewController:", self);

      -[CPUINowPlayingViewController _updateRepeatStateWithType:](self, "_updateRepeatStateWithType:", v20);
    }
    v21 = 1;
  }
  else
  {
    v21 = 0;
  }
  v22 = objc_loadWeakRetained((id *)p_delegate);
  v23 = objc_opt_respondsToSelector();

  if ((v23 & 1) != 0)
  {
    v24 = objc_loadWeakRetained((id *)p_delegate);
    v25 = objc_msgSend(v24, "nowPlayingViewControllerCanShowMore:", self);

  }
  else
  {
    v25 = 0;
  }
  v26 = objc_loadWeakRetained((id *)p_delegate);
  v27 = objc_opt_respondsToSelector();

  if ((v27 & 1) != 0)
  {
    v28 = objc_loadWeakRetained((id *)p_delegate);
    v29 = objc_msgSend(v28, "nowPlayingViewControllerCanShowAddToLibrary:", self);

  }
  else
  {
    v29 = 0;
  }
  v30 = objc_loadWeakRetained((id *)p_delegate);
  v31 = objc_opt_respondsToSelector();

  if ((v31 & 1) != 0)
  {
    v32 = objc_loadWeakRetained((id *)p_delegate);
    v33 = objc_msgSend(v32, "nowPlayingViewControllerIsFuseSubscriber:", self);

  }
  else
  {
    v33 = 0;
  }
  v34 = objc_loadWeakRetained((id *)p_delegate);
  v35 = objc_opt_respondsToSelector();

  if ((v35 & 1) != 0)
  {
    v36 = objc_loadWeakRetained((id *)p_delegate);
    v37 = objc_msgSend(v36, "nowPlayingViewControllerCanShowChangePlaybackRate:", self);

    -[CPUINowPlayingViewController _updatePlaybackRate](self, "_updatePlaybackRate");
  }
  else
  {
    v37 = 0;
  }
  -[CPUINowPlayingView playModeControlView](self->_nowPlayingView, "playModeControlView");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "shuffleButton");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setHidden:", v12 ^ 1u);

  objc_msgSend(v38, "repeatButton");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setHidden:", v21 ^ 1u);

  objc_msgSend(v38, "moreButton");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setHidden:", v25 ^ 1u);

  objc_msgSend(v38, "addToLibraryButton");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setHidden:", v29 ^ 1u);

  objc_msgSend(v38, "setFuseSubscriberLayout:", v33);
  objc_msgSend(v38, "playbackRateButton");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setHidden:", v37 ^ 1u);

  CarPlayUIGeneralLogging();
  v44 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
  {
    v45[0] = 67110144;
    v45[1] = v12;
    v46 = 1024;
    v47 = v21;
    v48 = 1024;
    v49 = v25;
    v50 = 1024;
    v51 = v29;
    v52 = 1024;
    v53 = v37;
    _os_log_impl(&dword_21B6EC000, v44, OS_LOG_TYPE_DEFAULT, "Shuffle: %d Repeat: %d Show CTA: %d Bookmark: %d Change Playback Rate: %d", (uint8_t *)v45, 0x20u);
  }

  objc_msgSend(v38, "layoutSubviews");
}

- (void)_updateRepeatStateWithType:(int64_t)a3
{
  void *v5;
  void *v6;
  id v7;

  -[CPUINowPlayingViewController nowPlayingView](self, "nowPlayingView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "playModeControlView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "repeatButton");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setRepeatType:", a3);
  if ((((a3 == 0) ^ objc_msgSend(v7, "isSelected")) & 1) == 0)
    -[CPUINowPlayingViewController _updateShuffleAndRepeatButtons](self, "_updateShuffleAndRepeatButtons");

}

- (void)_updateShuffleStateWithType:(int64_t)a3
{
  void *v5;
  void *v6;
  id v7;

  -[CPUINowPlayingViewController nowPlayingView](self, "nowPlayingView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "playModeControlView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "shuffleButton");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if ((((a3 == 0) ^ objc_msgSend(v7, "isSelected")) & 1) == 0)
    -[CPUINowPlayingViewController _updateShuffleAndRepeatButtons](self, "_updateShuffleAndRepeatButtons");

}

- (void)_updateShuffleAndRepeatButtons
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id buf[2];

  -[CPUINowPlayingViewController nowPlayingView](self, "nowPlayingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "playModeControlView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "shuffleButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[CPUINowPlayingViewController nowPlayingView](self, "nowPlayingView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "playModeControlView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "repeatButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[CPUINowPlayingViewController uiTimer](self, "uiTimer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[CPUINowPlayingViewController uiTimer](self, "uiTimer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "invalidate");

    CarPlayUIGeneralLogging();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_21B6EC000, v11, OS_LOG_TYPE_DEFAULT, "UI Timer invalidated", (uint8_t *)buf, 2u);
    }

  }
  CarPlayUIGeneralLogging();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_21B6EC000, v12, OS_LOG_TYPE_DEFAULT, "UI Timer created", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  v13 = (void *)MEMORY[0x24BDBCF40];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __62__CPUINowPlayingViewController__updateShuffleAndRepeatButtons__block_invoke;
  v17[3] = &unk_24DF24520;
  objc_copyWeak(&v20, buf);
  v14 = v5;
  v18 = v14;
  v15 = v8;
  v19 = v15;
  objc_msgSend(v13, "scheduledTimerWithTimeInterval:repeats:block:", 0, v17, 0.1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPUINowPlayingViewController setUiTimer:](self, "setUiTimer:", v16);

  objc_destroyWeak(&v20);
  objc_destroyWeak(buf);

}

void __62__CPUINowPlayingViewController__updateShuffleAndRepeatButtons__block_invoke(id *a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  int v12;
  _BOOL4 v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained && objc_msgSend(v3, "isValid"))
  {
    CarPlayUIGeneralLogging();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_21B6EC000, v5, OS_LOG_TYPE_DEFAULT, "UI Timer executed", (uint8_t *)&v12, 2u);
    }

    objc_msgSend(WeakRetained, "dataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "shuffleTypeForNowPlayingViewController:", WeakRetained);

    if ((v7 != 0) != objc_msgSend(a1[4], "isSelected"))
    {
      CarPlayUIGeneralLogging();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v12 = 67109120;
        v13 = v7 != 0;
        _os_log_impl(&dword_21B6EC000, v8, OS_LOG_TYPE_DEFAULT, "UI Timer set shuffle selected: %i", (uint8_t *)&v12, 8u);
      }

      objc_msgSend(a1[4], "setSelected:", v7 != 0);
    }
    objc_msgSend(WeakRetained, "dataSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "repeatTypeForNowPlayingViewController:", WeakRetained);

    if ((v10 != 0) != objc_msgSend(a1[5], "isSelected"))
    {
      CarPlayUIGeneralLogging();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = 67109120;
        v13 = v10 != 0;
        _os_log_impl(&dword_21B6EC000, v11, OS_LOG_TYPE_DEFAULT, "UI Timer set repeat selected: %i", (uint8_t *)&v12, 8u);
      }

      objc_msgSend(a1[5], "setSelected:", v10 != 0);
    }
  }

}

- (void)_updatePlaybackRate
{
  void *v3;
  void *v4;
  void *v5;
  id WeakRetained;
  char v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  -[CPUINowPlayingViewController nowPlayingView](self, "nowPlayingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "playModeControlView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "playbackRateButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v8, "nowPlayingViewControllerGetPlaybackRate:", self);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    CPUIFormattedPlaybackRateString(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTitle:forState:", v10, 0);
    CPUIAccessiblePlaybackRateString(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v11;
    CPUILocalizedStringForKey(CFSTR("ACCESSIBLE_PLAYBACK_SPEED"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v12;
    CPUILocalizedStringForKey(CFSTR("ACCESSIBLE_PLAYBACK_RATE"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v13;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v15, 3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAccessibilityUserInputLabels:", v14, v15, v16);

  }
}

- (void)_sendAction:(int64_t)a3 withState:(int64_t)a4
{
  id v7;

  -[CPUINowPlayingViewController delegate](self, "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "nowPlayingViewController:didSendAction:state:", self, a3, a4);

}

- (void)_playPauseButtonTouchDown:(id)a3
{
  id v4;

  v4 = a3;
  if (-[CPUINowPlayingViewController _showsButtonSelectionsForTouch](self, "_showsButtonSelectionsForTouch"))
    objc_msgSend(v4, "setSelected:", 1);

}

- (void)_playPauseButtonTouchUp:(id)a3
{
  id v4;

  v4 = a3;
  if (-[CPUINowPlayingViewController _showsButtonSelectionsForTouch](self, "_showsButtonSelectionsForTouch"))
    objc_msgSend(v4, "setSelected:", 0);
  -[CPUINowPlayingViewController _sendAction:withState:](self, "_sendAction:withState:", 2, 2);

}

- (void)_respondToHeldAction
{
  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, a2, 0);
  -[CPUINowPlayingViewController _sendAction:withState:](self, "_sendAction:withState:", self->_heldAction, 1);
}

- (void)_sendHeldAction
{
  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__respondToHeldAction, 0);
  -[CPUINowPlayingViewController _sendAction:withState:](self, "_sendAction:withState:", self->_heldAction, 2);
  self->_heldAction = -1;
}

- (void)_leftButtonTouchDown:(id)a3
{
  id v4;

  v4 = a3;
  if (-[CPUINowPlayingViewController _showsButtonSelectionsForTouch](self, "_showsButtonSelectionsForTouch"))
    objc_msgSend(v4, "setSelected:", 1);
  self->_heldAction = 0;
  -[CPUINowPlayingViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__respondToHeldAction, 0, 0.5);

}

- (void)_leftButtonTouchUp:(id)a3
{
  id v4;

  v4 = a3;
  if (-[CPUINowPlayingViewController _showsButtonSelectionsForTouch](self, "_showsButtonSelectionsForTouch"))
    objc_msgSend(v4, "setSelected:", 0);
  -[CPUINowPlayingViewController _sendHeldAction](self, "_sendHeldAction");

}

- (void)_leftButtonLongPress:(id)a3
{
  uint64_t v4;

  if (objc_msgSend(a3, "state") == 1)
  {
    v4 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__respondToHeldAction, 0);
    v4 = 2;
  }
  -[CPUINowPlayingViewController _sendAction:withState:](self, "_sendAction:withState:", 0, v4);
}

- (void)_leftNudgePress:(id)a3
{
  -[CPUINowPlayingViewController _sendAction:withState:](self, "_sendAction:withState:", 0, 2);
}

- (void)_fastForwardButtonTouchDown:(id)a3
{
  id v4;

  v4 = a3;
  if (-[CPUINowPlayingViewController _showsButtonSelectionsForTouch](self, "_showsButtonSelectionsForTouch"))
    objc_msgSend(v4, "setSelected:", 1);
  self->_heldAction = 1;
  -[CPUINowPlayingViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__respondToHeldAction, 0, 0.5);

}

- (void)_fastForwardButtonTouchUp:(id)a3
{
  id v4;

  v4 = a3;
  if (-[CPUINowPlayingViewController _showsButtonSelectionsForTouch](self, "_showsButtonSelectionsForTouch"))
    objc_msgSend(v4, "setSelected:", 0);
  -[CPUINowPlayingViewController _sendHeldAction](self, "_sendHeldAction");

}

- (void)_rightNudgePress:(id)a3
{
  -[CPUINowPlayingViewController _sendAction:withState:](self, "_sendAction:withState:", 1, 2);
}

- (void)_fastForwardButtonLongPress:(id)a3
{
  uint64_t v4;

  if (objc_msgSend(a3, "state") == 1)
  {
    v4 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__respondToHeldAction, 0);
    v4 = 2;
  }
  -[CPUINowPlayingViewController _sendAction:withState:](self, "_sendAction:withState:", 1, v4);
}

- (void)_albumArtistButtonTapped:(id)a3
{
  CPUINowPlayingViewControllerDelegate **p_delegate;
  id WeakRetained;
  char v6;
  id v7;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v7, "nowPlayingViewControllerAlbumArtistButtonTapped:", self);

  }
}

- (void)_attributionButtonTapped:(id)a3
{
  CPUINowPlayingViewControllerDelegate **p_delegate;
  id WeakRetained;
  char v6;
  id v7;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v7, "nowPlayingViewControllerAttributionButtonTapped:", self);

  }
}

- (void)upNextButtonTapped:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[CPUINowPlayingViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CPUINowPlayingViewController delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "nowPlayingViewControllerUpNextButtonTapped:", self);

  }
}

- (void)_initializeTransportControls
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
  void *v16;
  id v17;

  -[CPUINowPlayingView transportControlView](self->_nowPlayingView, "transportControlView");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "playPauseButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addTarget:action:forControlEvents:", self, sel__playPauseButtonTouchDown_, 1);

  objc_msgSend(v17, "playPauseButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addTarget:action:forControlEvents:", self, sel__playPauseButtonTouchUp_, 448);

  objc_msgSend(v17, "leftButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addTarget:action:forControlEvents:", self, sel__leftButtonTouchDown_, 1);

  objc_msgSend(v17, "leftButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addTarget:action:forControlEvents:", self, sel__leftButtonTouchUp_, 448);

  objc_msgSend(v17, "fastForwardButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addTarget:action:forControlEvents:", self, sel__fastForwardButtonTouchDown_, 1);

  objc_msgSend(v17, "fastForwardButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addTarget:action:forControlEvents:", self, sel__fastForwardButtonTouchUp_, 448);

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6BA0]), "initWithTarget:action:", self, sel__leftButtonLongPress_);
  -[CPUINowPlayingViewController setLeftButtonLongPressRecognizer:](self, "setLeftButtonLongPressRecognizer:", v9);

  -[CPUINowPlayingViewController leftButtonLongPressRecognizer](self, "leftButtonLongPressRecognizer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAllowedPressTypes:", &unk_24DF30408);

  objc_msgSend(v17, "leftButton");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPUINowPlayingViewController leftButtonLongPressRecognizer](self, "leftButtonLongPressRecognizer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addGestureRecognizer:", v12);

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6BA0]), "initWithTarget:action:", self, sel__fastForwardButtonLongPress_);
  -[CPUINowPlayingViewController setFastForwardButtonLongPressRecognizer:](self, "setFastForwardButtonLongPressRecognizer:", v13);

  -[CPUINowPlayingViewController fastForwardButtonLongPressRecognizer](self, "fastForwardButtonLongPressRecognizer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAllowedPressTypes:", &unk_24DF30420);

  objc_msgSend(v17, "fastForwardButton");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPUINowPlayingViewController fastForwardButtonLongPressRecognizer](self, "fastForwardButtonLongPressRecognizer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addGestureRecognizer:", v16);

}

- (void)_updateTransportControl:(id)a3 withDefaultImage:(id)a4 actionType:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  int v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  unsigned __int8 v23;

  v8 = a3;
  v9 = a4;
  v23 = 0;
  -[CPUINowPlayingViewController delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    if ((unint64_t)a5 > 2)
      v11 = 0;
    else
      v11 = *(id *)((char *)&self->super.super.super.isa + *off_24DF24638[a5]);
    v22 = 0;
    v14 = objc_msgSend(v10, "nowPlayingViewController:shouldDisplayButton:withImage:existingIdentifier:tinted:", self, a5, &v22, v11, &v23);
    v13 = v22;
    v12 = v14 ^ 1u;
  }
  else
  {
    v12 = 0;
    v11 = 0;
    v13 = 0;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0
    && !objc_msgSend(v10, "nowPlayingViewController:buttonShouldBeActive:", self, a5))
  {
    v16 = 0;
    v15 = 0.3;
  }
  else
  {
    v15 = 1.0;
    v16 = 1;
  }
  objc_msgSend(v8, "setAlpha:", v15);
  objc_msgSend(v8, "setHidden:", v12);
  if (v13)
  {
    v17 = 0;
LABEL_15:
    objc_msgSend(v13, "imageWithRenderingMode:", v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "setImage:forState:", v19, 0);
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "imageWithTintColor:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setImage:forState:", v21, 1);

    goto LABEL_16;
  }
  v18 = v9;
  if (v18)
  {
    v13 = v18;
    v17 = 2;
    goto LABEL_15;
  }
LABEL_16:
  objc_msgSend(v8, "setSelected:", v23);
  objc_msgSend(v8, "setEnabled:", v16);

}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  void *v7;
  objc_super v8;

  v6 = a4;
  objc_msgSend(a3, "objectsPassingTest:", _nonCapturedPressType);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    v8.receiver = self;
    v8.super_class = (Class)CPUINowPlayingViewController;
    -[CPUINowPlayingViewController pressesBegan:withEvent:](&v8, sel_pressesBegan_withEvent_, v7, v6);
  }

}

- (void)pressesChanged:(id)a3 withEvent:(id)a4
{
  id v6;
  void *v7;
  objc_super v8;

  v6 = a4;
  objc_msgSend(a3, "objectsPassingTest:", _nonCapturedPressType);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    v8.receiver = self;
    v8.super_class = (Class)CPUINowPlayingViewController;
    -[CPUINowPlayingViewController pressesChanged:withEvent:](&v8, sel_pressesChanged_withEvent_, v7, v6);
  }

}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  id v6;
  void *v7;
  objc_super v8;

  v6 = a4;
  objc_msgSend(a3, "objectsPassingTest:", _nonCapturedPressType);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    v8.receiver = self;
    v8.super_class = (Class)CPUINowPlayingViewController;
    -[CPUINowPlayingViewController pressesEnded:withEvent:](&v8, sel_pressesEnded_withEvent_, v7, v6);
  }

}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  id v6;
  void *v7;
  objc_super v8;

  v6 = a4;
  objc_msgSend(a3, "objectsPassingTest:", _nonCapturedPressType);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    v8.receiver = self;
    v8.super_class = (Class)CPUINowPlayingViewController;
    -[CPUINowPlayingViewController pressesCancelled:withEvent:](&v8, sel_pressesCancelled_withEvent_, v7, v6);
  }

}

- (id)_installedFullBackgroundArtworkViewBelowView:(id)a3
{
  id v4;
  id v5;
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
  void *v16;
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
  _QWORD v28[5];

  v28[4] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDF6AE8]);
  objc_msgSend(v5, "setClipsToBounds:", 1);
  objc_msgSend(v5, "setContentMode:", 2);
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[CPUINowPlayingViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  v27 = v4;
  if (v4)
    objc_msgSend(v6, "insertSubview:belowSubview:", v5, v4);
  else
    objc_msgSend(v6, "addSubview:", v5);

  v19 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(v5, "topAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPUINowPlayingViewController view](self, "view");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "topAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToAnchor:", v24);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v23;
  objc_msgSend(v5, "bottomAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPUINowPlayingViewController view](self, "view");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "bottomAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToAnchor:", v20);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v18;
  objc_msgSend(v5, "leadingAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPUINowPlayingViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "leadingAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v28[2] = v11;
  objc_msgSend(v5, "trailingAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPUINowPlayingViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "trailingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v28[3] = v15;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "activateConstraints:", v16);

  return v5;
}

- (void)_updateArtworkIfNeeded:(id)a3 placeholder:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  CPUINowPlayingViewController *v15;
  id v16;

  v6 = a3;
  v7 = a4;
  -[CPUINowPlayingViewController artworkImage](self, "artworkImage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPUINowPlayingViewController nowPlayingView](self, "nowPlayingView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "artworkViewBrick");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setPlaceholderImage:", v7);
  if (v6)
  {
    if ((objc_msgSend(v8, "isEqual:", v6) & 1) == 0)
    {
      -[CPUINowPlayingViewController artworkOperationQueue](self, "artworkOperationQueue");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __67__CPUINowPlayingViewController__updateArtworkIfNeeded_placeholder___block_invoke;
      v13[3] = &unk_24DF245D8;
      v14 = v6;
      v15 = self;
      v16 = v10;
      objc_msgSend(v11, "addOperationWithBlock:", v13);

    }
  }
  else
  {
    -[CPUINowPlayingViewController artworkView](self, "artworkView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setImage:", 0);

    objc_msgSend(v10, "setImage:", 0);
    -[CPUINowPlayingViewController setArtworkImage:](self, "setArtworkImage:", 0);
  }

}

void __67__CPUINowPlayingViewController__updateArtworkIfNeeded_placeholder___block_invoke(uint64_t a1)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v2 = *(id *)(a1 + 32);
  if ((objc_msgSend(v2, "isSquared") & 1) == 0)
  {
    CarPlayUIGeneralLogging();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "size");
      v5 = v4;
      objc_msgSend(*(id *)(a1 + 32), "size");
      *(_DWORD *)buf = 134218240;
      v15 = v5;
      v16 = 2048;
      v17 = v6;
      _os_log_impl(&dword_21B6EC000, v3, OS_LOG_TYPE_DEFAULT, "Setting corner radius to artwork image with size: (%f, %f)", buf, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 32), "imageWithRoundedCornersOfRadius:", 14.0);
    v7 = objc_claimAutoreleasedReturnValue();

    v2 = (id)v7;
  }
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __67__CPUINowPlayingViewController__updateArtworkIfNeeded_placeholder___block_invoke_150;
  v10[3] = &unk_24DF245B0;
  v8 = *(void **)(a1 + 48);
  v10[4] = *(_QWORD *)(a1 + 40);
  v11 = v8;
  v12 = v2;
  v13 = *(id *)(a1 + 32);
  v9 = v2;
  dispatch_sync(MEMORY[0x24BDAC9B8], v10);

}

void __67__CPUINowPlayingViewController__updateArtworkIfNeeded_placeholder___block_invoke_150(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;

  objc_msgSend(*(id *)(a1 + 32), "artworkImage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "setImage:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "setArtworkImage:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "artworkView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v5, "artworkView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_installedFullBackgroundArtworkViewBelowView:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "setImage:", *(_QWORD *)(a1 + 56));
    objc_msgSend(*(id *)(a1 + 32), "setArtworkView:", v7);
  }
  else
  {
    objc_msgSend(v3, "setAlpha:", 0.0);

    v8 = *(_QWORD *)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 32), "artworkView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setImage:", v8);

    objc_msgSend(*(id *)(a1 + 32), "artworkView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 0;
  }
  v10 = (void *)MEMORY[0x24BDF6F90];
  v11 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __67__CPUINowPlayingViewController__updateArtworkIfNeeded_placeholder___block_invoke_2;
  v16[3] = &unk_24DF24460;
  v17 = v4;
  v18 = v7;
  v14[0] = v11;
  v14[1] = 3221225472;
  v14[2] = __67__CPUINowPlayingViewController__updateArtworkIfNeeded_placeholder___block_invoke_3;
  v14[3] = &unk_24DF24588;
  v15 = v17;
  v12 = v17;
  v13 = v7;
  objc_msgSend(v10, "animateWithDuration:delay:options:animations:completion:", 2, v16, v14, 1.5, 0.0);

}

uint64_t __67__CPUINowPlayingViewController__updateArtworkIfNeeded_placeholder___block_invoke_2(uint64_t a1)
{
  void *v2;
  double v3;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    v3 = 0.0;
  }
  else
  {
    v2 = *(void **)(a1 + 40);
    v3 = 1.0;
  }
  return objc_msgSend(v2, "setAlpha:", v3);
}

void *__67__CPUINowPlayingViewController__updateArtworkIfNeeded_placeholder___block_invoke_3(uint64_t a1)
{
  void *result;

  result = *(void **)(a1 + 32);
  if (result)
    return (void *)objc_msgSend(result, "removeFromSuperview");
  return result;
}

- (id)_upNextBarButtonItem
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double x;
  double y;
  double height;
  double Width;
  double v23;
  void *v24;
  void *v26;
  _QWORD v27[4];
  CGRect v28;

  v27[3] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:", 16.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "titleLabel");
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v5, "setFont:", v4);

  -[CPUINowPlayingViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CPUINowPlayingViewController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "titleForUpNextInNowPlayingViewController:", self);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByTrimmingCharactersInSet:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }
  if (!objc_msgSend(v10, "length"))
  {
    CPUILocalizedStringForKey(CFSTR("PLAYBACK_QUEUE_TITLE"));
    v11 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v11;
  }
  CPUILocalizedStringForKey(CFSTR("PLAYBACK_QUEUE_TITLE"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v10, "isEqualToString:", v12);

  if (v13)
  {
    objc_msgSend(v3, "setTitle:forState:", 0, 0);
    objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("list.bullet"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setImage:forState:", v14, 0);

    CPUILocalizedStringForKey(CFSTR("LIST"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v15;
    CPUILocalizedStringForKey(CFSTR("QUEUE"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v27[1] = v16;
    CPUILocalizedStringForKey(CFSTR("PLAYBACK_QUEUE_TITLE"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v27[2] = v17;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setAccessibilityUserInputLabels:", v18);

  }
  else
  {
    objc_msgSend(v3, "setImage:forState:", 0, 0);
    objc_msgSend(v3, "setTitle:forState:", v10, 0);
    v26 = v10;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v26, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setAccessibilityUserInputLabels:", v15);
  }

  objc_msgSend(v3, "addTarget:action:forControlEvents:", self, sel_upNextButtonTapped_, 64);
  objc_msgSend(v3, "sizeToFit");
  objc_msgSend(v3, "frame");
  x = v28.origin.x;
  y = v28.origin.y;
  height = v28.size.height;
  Width = CGRectGetWidth(v28);
  if (v13)
    v23 = height + 6.0;
  else
    v23 = height;
  objc_msgSend(v3, "setFrame:", x, y, Width + 16.0, v23);
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithCustomView:", v3);

  return v24;
}

- (void)_reloadDataForcingLayout:(BOOL)a3 updateControls:(BOOL)a4
{
  _BOOL4 v4;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  char v47;
  void *v48;
  void *v49;
  __CFString *v50;
  _BOOL4 v51;
  void *v52;
  void *v53;
  __CFString *v54;
  _BOOL4 v55;
  void *v56;
  void *v57;
  uint8_t buf[4];
  CPUINowPlayingViewController *v59;
  uint64_t v60;

  v4 = a4;
  v55 = a3;
  v60 = *MEMORY[0x24BDAC8D0];
  CarPlayUIGeneralLogging();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v59 = self;
    _os_log_impl(&dword_21B6EC000, v6, OS_LOG_TYPE_DEFAULT, "Reloading now playing view controller %@", buf, 0xCu);
  }

  -[CPUINowPlayingViewController dataSource](self, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPUINowPlayingViewController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "titleForNowPlayingController:", self);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  CPUIFilteredString(v9);
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "artistTextForNowPlayingController:", self);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  CPUIFilteredString(v11);
  v12 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "albumTextForNowPlayingController:", self);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  CPUIFilteredString(v13);
  v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

  -[CPUINowPlayingView songDetailsView](self->_nowPlayingView, "songDetailsView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v10)
    v17 = v10;
  else
    v17 = &stru_24DF24E68;
  objc_msgSend(v15, "setTrackTitle:", v17);
  if (v14)
    v18 = v14;
  else
    v18 = &stru_24DF24E68;
  objc_msgSend(v16, "setAlbumTitle:", v18);
  v56 = (void *)v12;
  if (v12)
    v19 = (const __CFString *)v12;
  else
    v19 = &stru_24DF24E68;
  objc_msgSend(v16, "setArtistName:", v19);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v7, "attributionTitleForNowPlayingViewController:", self);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setAttributionName:", v20);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v7, "attributionArtworkForNowPlayingViewController:", self);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setAttributionArtwork:", v21);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v16, "titleView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setShouldUseMusicExplicitGlyph:", objc_msgSend(v8, "nowPlayingViewControllerShouldUseMusicExplicitGlyph:", self));

  }
  v23 = objc_msgSend(v7, "nowPlayingViewControllerIsShowingExplicitTrack:", self);
  objc_msgSend(v16, "titleView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setExplicitTrack:", v23);

  if (-[__CFString length](v14, "length") && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v25 = objc_msgSend(v8, "nowPlayingViewControllerCanShowAlbumLink:", self);
    objc_msgSend(v16, "albumArtistLabelButton");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setEnabled:", v25);

  }
  objc_msgSend(v7, "backgroundArtForNowPlayingController:", self);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v27 = objc_msgSend(v7, "placeholderTypeForNowPlayingViewController:", self);
  else
    v27 = 0;
  -[CPUINowPlayingViewController traitCollection](self, "traitCollection");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  CPUIImageForPlaceholderTypeWithTraitCollection(v27, v28);
  v29 = objc_claimAutoreleasedReturnValue();

  v53 = (void *)v29;
  -[CPUINowPlayingViewController _updateArtworkIfNeeded:placeholder:](self, "_updateArtworkIfNeeded:placeholder:", v57, v29);
  -[CPUINowPlayingView playModeControlView](self->_nowPlayingView, "playModeControlView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v8, "customPlaybackControlButtonsForNowPlayingViewController:", self);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v31 = 0;
  }
  v54 = v14;
  if (!objc_msgSend(v31, "count"))
  {
    objc_msgSend(v30, "defaultPlayModeButtons");
    v32 = objc_claimAutoreleasedReturnValue();

    v31 = (void *)v32;
  }
  -[CPUINowPlayingViewController _updateButtonAXLabelsForButtons:](self, "_updateButtonAXLabelsForButtons:", v31);
  v52 = v30;
  objc_msgSend(v30, "setMediaButtons:", v31);
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_msgSend(v8, "nowPlayingViewControllerShouldHideBackButton:", self) & 1) != 0)
  {
    -[CPUINowPlayingViewController navigationItem](self, "navigationItem");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setLeftBarButtonItem:", 0);
LABEL_34:

    goto LABEL_35;
  }
  -[CPUINowPlayingViewController navigationItem](self, "navigationItem");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "leftBarButtonItem");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v35)
  {
    v33 = (void *)objc_opt_new();
    objc_msgSend(v33, "addTarget:action:forControlEvents:", self, sel__backButtonTapped_, 64);
    -[CPUINowPlayingViewController navigationItem](self, "navigationItem");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setHidesBackButton:", 1);

    v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithCustomView:", v33);
    -[CPUINowPlayingViewController navigationItem](self, "navigationItem");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setLeftBarButtonItem:", v37);

    -[CPUINowPlayingViewController navigationItem](self, "navigationItem");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "leftBarButtonItem");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setAccessibilityIdentifier:", CFSTR("CPNowPlayingBackButton"));

    goto LABEL_34;
  }
LABEL_35:
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (objc_msgSend(v8, "nowPlayingViewControllerShouldOverrideRightBarButtons:", self) & 1) == 0)
  {
    if (objc_msgSend(v8, "nowPlayingViewControllerCanShowUpNext:", self))
    {
      -[CPUINowPlayingViewController _upNextBarButtonItem](self, "_upNextBarButtonItem");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[CPUINowPlayingViewController setPlaybackQueueBarButtonItem:](self, "setPlaybackQueueBarButtonItem:", v41);
      if (!v41)
        goto LABEL_46;
    }
    else
    {
      -[CPUINowPlayingViewController rightTitleLabelBarButtonItem](self, "rightTitleLabelBarButtonItem");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v41)
        goto LABEL_46;
    }
    v50 = v10;
    v51 = v4;
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObject:", v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPUINowPlayingViewController activityIndicatorBarButtonItem](self, "activityIndicatorBarButtonItem");
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    if (v43)
    {
      -[CPUINowPlayingViewController activityIndicatorBarButtonItem](self, "activityIndicatorBarButtonItem");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "addObject:", v44);

    }
    -[CPUINowPlayingViewController navigationItem](self, "navigationItem");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "rightBarButtonItems");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v46, "isEqualToArray:", v42);

    if ((v47 & 1) == 0)
    {
      -[CPUINowPlayingViewController navigationItem](self, "navigationItem");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "setRightBarButtonItems:", v42);

    }
    v4 = v51;
    v10 = v50;
  }
LABEL_46:
  -[CPUINowPlayingViewController _recalculateLayout:](self, "_recalculateLayout:", v55);
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (objc_msgSend(v7, "badgeAnnotationViewForNowPlayingViewController:", self),
        (v49 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    -[CPUINowPlayingViewController audioSessionRenderingModeView](self, "audioSessionRenderingModeView");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[CPUINowPlayingView setBadgeAnnotationView:](self->_nowPlayingView, "setBadgeAnnotationView:", v49);
  if (v4)
    -[CPUINowPlayingViewController updatePlayControls](self, "updatePlayControls");

}

- (void)_sceneWillEnterForeground:(id)a3
{
  void *v4;
  _BOOL4 v5;

  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CPUINowPlayingViewController _isCarScene:](self, "_isCarScene:", v4);

  if (v5)
    -[CPUINowPlayingViewController _setStatusBarOverrideActive:](self, "_setStatusBarOverrideActive:", 1);
}

- (void)_sceneDidActivate:(id)a3
{
  void *v4;
  _BOOL4 v5;

  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CPUINowPlayingViewController _isCarScene:](self, "_isCarScene:", v4);

  if (v5)
    -[CPUINowPlayingViewController _setStatusBarOverrideActive:](self, "_setStatusBarOverrideActive:", 1);
}

- (void)_sceneWillDeactivate:(id)a3
{
  void *v4;
  _BOOL4 v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CPUINowPlayingViewController _isCarScene:](self, "_isCarScene:", v4);

  if (v5)
  {
    objc_msgSend(v7, "object");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPUINowPlayingViewController _deactivateStatusBarStyleOverrideIfNecessaryForScene:](self, "_deactivateStatusBarStyleOverrideIfNecessaryForScene:", v6);

  }
}

- (void)_sceneDidEnterBackground:(id)a3
{
  void *v4;
  _BOOL4 v5;

  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CPUINowPlayingViewController _isCarScene:](self, "_isCarScene:", v4);

  if (v5)
    -[CPUINowPlayingViewController _setStatusBarOverrideActive:](self, "_setStatusBarOverrideActive:", 0);
}

- (BOOL)_isCarScene:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  BOOL v11;
  void *v12;

  v4 = a3;
  objc_opt_class();
  v5 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (!v5)
    {
      v12 = 0;
      v11 = 0;
      goto LABEL_9;
    }
    objc_msgSend(v5, "traitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "userInterfaceIdiom");

    if (v7 != 3)
    {
      v11 = 0;
      v12 = v5;
      goto LABEL_9;
    }
    -[CPUINowPlayingViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "window");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "windowScene");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v11 = v10 == v5;

    v12 = v5;
  }
  else
  {
    v12 = 0;
    v11 = 0;
    v8 = v5;
  }

LABEL_9:
  return v11;
}

- (void)_deactivateStatusBarStyleOverrideIfNecessaryForScene:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "_FBSScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "settings");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "deactivationReasons") != 16)
    -[CPUINowPlayingViewController _setStatusBarOverrideActive:](self, "_setStatusBarOverrideActive:", 0);

}

- (void)nowPlayingAudioFormatController:(id)a3 didChangeAudioFormatContentInfo:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __96__CPUINowPlayingViewController_nowPlayingAudioFormatController_didChangeAudioFormatContentInfo___block_invoke;
  v7[3] = &unk_24DF24460;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], v7);

}

uint64_t __96__CPUINowPlayingViewController_nowPlayingAudioFormatController_didChangeAudioFormatContentInfo___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateAudioFormatContentInfo:", *(_QWORD *)(a1 + 40));
}

- (void)_updateAudioFormatContentInfo:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  __CFString *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  UIStackView *audioSessionRenderingModeView;
  double *v21;
  UIStackView *v22;
  UIStackView *v23;
  void *v24;
  _QWORD *v25;
  void *v26;
  void *v27;
  _QWORD *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!v4)
  {
    -[MRNowPlayingAudioFormatController audioFormatContentInfo](self->_audioFormatController, "audioFormatContentInfo");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (objc_msgSend(v4, "renderingMode") == 3)
  {
    CPUILocalizedStringForKey(CFSTR("SPATIAL_AUDIO"));
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  -[CPUINowPlayingViewController traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v4;
  v8 = v6;
  v9 = 0;
  switch(objc_msgSend(v7, "renderingMode"))
  {
    case 1:
    case 2:
      goto LABEL_16;
    case 3:
      objc_msgSend(MEMORY[0x24BDF6AC8], "_systemImageNamed:", CFSTR("person.spatialaudio.fill"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDF6AE0], "configurationWithPointSize:weight:scale:", 4, 1, 10.0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "imageWithConfiguration:", v11);
      v12 = objc_claimAutoreleasedReturnValue();

      goto LABEL_14;
    case 4:
      v13 = CFSTR("DolbyAudio");
      goto LABEL_13;
    case 5:
      v13 = CFSTR("DolbyAtmos");
LABEL_13:
      CPUIImageNamedWithTraitCollection(v13, v8);
      v12 = objc_claimAutoreleasedReturnValue();
LABEL_14:
      -[NSObject imageWithRenderingMode:](v12, "imageWithRenderingMode:", 2);
      v9 = objc_claimAutoreleasedReturnValue();
      break;
    default:
      CarPlayUIGeneralLogging();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        -[CPUINowPlayingViewController _updateAudioFormatContentInfo:].cold.1(v7, v12);
      v9 = 0;
      break;
  }

LABEL_16:
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  -[UIStackView arrangedSubviews](self->_audioSessionRenderingModeView, "arrangedSubviews", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v36 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        -[UIStackView removeArrangedSubview:](self->_audioSessionRenderingModeView, "removeArrangedSubview:", v19);
        objc_msgSend(v19, "removeFromSuperview");
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    }
    while (v16);
  }

  audioSessionRenderingModeView = self->_audioSessionRenderingModeView;
  if (!(v5 | v9))
  {
    self->_audioSessionRenderingModeView = 0;
    goto LABEL_33;
  }
  v21 = (double *)MEMORY[0x24BDBF090];
  if (!audioSessionRenderingModeView)
  {
    v22 = (UIStackView *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6DD0]), "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    v23 = self->_audioSessionRenderingModeView;
    self->_audioSessionRenderingModeView = v22;

    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_audioSessionRenderingModeView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView layer](self->_audioSessionRenderingModeView, "layer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setAllowsGroupBlending:", 0);

    -[UIStackView setAxis:](self->_audioSessionRenderingModeView, "setAxis:", 0);
    -[UIStackView setDistribution:](self->_audioSessionRenderingModeView, "setDistribution:", 2);
    -[UIStackView setAlignment:](self->_audioSessionRenderingModeView, "setAlignment:", 3);
    -[UIStackView setAlpha:](self->_audioSessionRenderingModeView, "setAlpha:", 0.400000006);
  }
  v25 = (_QWORD *)MEMORY[0x24BDE5BD8];
  if (v9)
  {
    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AE8]), "initWithImage:", v9);
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setTintColor:", v27);

    objc_msgSend(v26, "setContentMode:", 1);
    v28 = v25;
    objc_msgSend(MEMORY[0x24BDE56B0], "filterWithType:", *v25);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "layer");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setCompositingFilter:", v29);

    -[UIStackView addArrangedSubview:](self->_audioSessionRenderingModeView, "addArrangedSubview:", v26);
    if (v5)
      -[UIStackView setCustomSpacing:afterView:](self->_audioSessionRenderingModeView, "setCustomSpacing:afterView:", v26, 3.0);

    v25 = v28;
  }
  if (v5)
  {
    audioSessionRenderingModeView = (UIStackView *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6B68]), "initWithFrame:", *v21, v21[1], v21[2], v21[3]);
    -[UIStackView setText:](audioSessionRenderingModeView, "setText:", v5);
    objc_msgSend(MEMORY[0x24BDE56B0], "filterWithType:", *v25);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView layer](audioSessionRenderingModeView, "layer");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setCompositingFilter:", v31);

    objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:weight:", 10.0, *MEMORY[0x24BDF7888]);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView setFont:](audioSessionRenderingModeView, "setFont:", v33);

    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView setTextColor:](audioSessionRenderingModeView, "setTextColor:", v34);

    -[UIStackView addArrangedSubview:](self->_audioSessionRenderingModeView, "addArrangedSubview:", audioSessionRenderingModeView);
LABEL_33:

  }
  -[CPUINowPlayingViewController reloadData](self, "reloadData");

}

- (void)_updateButtonAXLabelsForButtons:(id)a3
{
  objc_msgSend(a3, "enumerateObjectsUsingBlock:", &__block_literal_global_197);
}

void __64__CPUINowPlayingViewController__updateButtonAXLabelsForButtons___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "accessibilityLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v9, "accessibilityLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v6);

  }
  if (a3 <= 4)
  {
    CPUILocalizedStringForKey(off_24DF24650[a3]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v7);

  }
  v8 = (void *)objc_msgSend(v4, "copy");
  objc_msgSend(v9, "setAccessibilityUserInputLabels:", v8);

}

- (CPUINowPlayingViewControllerDataSource)dataSource
{
  return (CPUINowPlayingViewControllerDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (CPUINowPlayingViewControllerDelegate)delegate
{
  return (CPUINowPlayingViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (CPUINowPlayingView)nowPlayingView
{
  return self->_nowPlayingView;
}

- (void)setNowPlayingView:(id)a3
{
  objc_storeStrong((id *)&self->_nowPlayingView, a3);
}

- (CRSUIStatusBarStyleAssertion)statusBarStyleAssertion
{
  return self->_statusBarStyleAssertion;
}

- (void)setStatusBarStyleAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_statusBarStyleAssertion, a3);
}

- (NSOperationQueue)artworkOperationQueue
{
  return self->_artworkOperationQueue;
}

- (void)setArtworkOperationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_artworkOperationQueue, a3);
}

- (UIVisualEffectView)artworkVisualEffectView
{
  return self->_artworkVisualEffectView;
}

- (void)setArtworkVisualEffectView:(id)a3
{
  objc_storeStrong((id *)&self->_artworkVisualEffectView, a3);
}

- (UIImage)artworkImage
{
  return self->_artworkImage;
}

- (void)setArtworkImage:(id)a3
{
  objc_storeStrong((id *)&self->_artworkImage, a3);
}

- (UIImageView)artworkView
{
  return self->_artworkView;
}

- (void)setArtworkView:(id)a3
{
  objc_storeStrong((id *)&self->_artworkView, a3);
}

- (NSTimer)uiTimer
{
  return self->_uiTimer;
}

- (void)setUiTimer:(id)a3
{
  objc_storeStrong((id *)&self->_uiTimer, a3);
}

- (UILabel)rightTitleLabel
{
  return self->_rightTitleLabel;
}

- (void)setRightTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_rightTitleLabel, a3);
}

- (UIBarButtonItem)rightTitleLabelBarButtonItem
{
  return self->_rightTitleLabelBarButtonItem;
}

- (void)setRightTitleLabelBarButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_rightTitleLabelBarButtonItem, a3);
}

- (UIBarButtonItem)playbackQueueBarButtonItem
{
  return self->_playbackQueueBarButtonItem;
}

- (void)setPlaybackQueueBarButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_playbackQueueBarButtonItem, a3);
}

- (UIActivityIndicatorView)activityIndicator
{
  return self->_activityIndicator;
}

- (void)setActivityIndicator:(id)a3
{
  objc_storeStrong((id *)&self->_activityIndicator, a3);
}

- (UIBarButtonItem)activityIndicatorBarButtonItem
{
  return self->_activityIndicatorBarButtonItem;
}

- (void)setActivityIndicatorBarButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_activityIndicatorBarButtonItem, a3);
}

- (UITapGestureRecognizer)knobPressRecognizer
{
  return self->_knobPressRecognizer;
}

- (UITapGestureRecognizer)backPressRecognizer
{
  return self->_backPressRecognizer;
}

- (UITapGestureRecognizer)leftNudgePressRecognizer
{
  return self->_leftNudgePressRecognizer;
}

- (void)setLeftNudgePressRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_leftNudgePressRecognizer, a3);
}

- (UITapGestureRecognizer)rightNudgePressRecognizer
{
  return self->_rightNudgePressRecognizer;
}

- (void)setRightNudgePressRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_rightNudgePressRecognizer, a3);
}

- (UILongPressGestureRecognizer)leftNudgeLongPressRecognizer
{
  return self->_leftNudgeLongPressRecognizer;
}

- (void)setLeftNudgeLongPressRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_leftNudgeLongPressRecognizer, a3);
}

- (UILongPressGestureRecognizer)rightNudgeLongPressRecognizer
{
  return self->_rightNudgeLongPressRecognizer;
}

- (void)setRightNudgeLongPressRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_rightNudgeLongPressRecognizer, a3);
}

- (UILongPressGestureRecognizer)leftButtonLongPressRecognizer
{
  return self->_leftButtonLongPressRecognizer;
}

- (void)setLeftButtonLongPressRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_leftButtonLongPressRecognizer, a3);
}

- (UILongPressGestureRecognizer)fastForwardButtonLongPressRecognizer
{
  return self->_fastForwardButtonLongPressRecognizer;
}

- (void)setFastForwardButtonLongPressRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_fastForwardButtonLongPressRecognizer, a3);
}

- (NSString)previousTransportButtonImageIdentifier
{
  return self->_previousTransportButtonImageIdentifier;
}

- (void)setPreviousTransportButtonImageIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_previousTransportButtonImageIdentifier, a3);
}

- (NSString)forwardTransportButtonImageIdentifier
{
  return self->_forwardTransportButtonImageIdentifier;
}

- (void)setForwardTransportButtonImageIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_forwardTransportButtonImageIdentifier, a3);
}

- (NSString)playPauseTransportButtonImageIdentifier
{
  return self->_playPauseTransportButtonImageIdentifier;
}

- (void)setPlayPauseTransportButtonImageIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_playPauseTransportButtonImageIdentifier, a3);
}

- (NSArray)nowPlayingSizeConstraints
{
  return self->_nowPlayingSizeConstraints;
}

- (void)setNowPlayingSizeConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_nowPlayingSizeConstraints, a3);
}

- (UIStackView)audioSessionRenderingModeView
{
  return self->_audioSessionRenderingModeView;
}

- (void)setAudioSessionRenderingModeView:(id)a3
{
  objc_storeStrong((id *)&self->_audioSessionRenderingModeView, a3);
}

- (MRNowPlayingAudioFormatController)audioFormatController
{
  return self->_audioFormatController;
}

- (void)setAudioFormatController:(id)a3
{
  objc_storeStrong((id *)&self->_audioFormatController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioFormatController, 0);
  objc_storeStrong((id *)&self->_audioSessionRenderingModeView, 0);
  objc_storeStrong((id *)&self->_nowPlayingSizeConstraints, 0);
  objc_storeStrong((id *)&self->_playPauseTransportButtonImageIdentifier, 0);
  objc_storeStrong((id *)&self->_forwardTransportButtonImageIdentifier, 0);
  objc_storeStrong((id *)&self->_previousTransportButtonImageIdentifier, 0);
  objc_storeStrong((id *)&self->_fastForwardButtonLongPressRecognizer, 0);
  objc_storeStrong((id *)&self->_leftButtonLongPressRecognizer, 0);
  objc_storeStrong((id *)&self->_rightNudgeLongPressRecognizer, 0);
  objc_storeStrong((id *)&self->_leftNudgeLongPressRecognizer, 0);
  objc_storeStrong((id *)&self->_rightNudgePressRecognizer, 0);
  objc_storeStrong((id *)&self->_leftNudgePressRecognizer, 0);
  objc_storeStrong((id *)&self->_backPressRecognizer, 0);
  objc_storeStrong((id *)&self->_knobPressRecognizer, 0);
  objc_storeStrong((id *)&self->_activityIndicatorBarButtonItem, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_playbackQueueBarButtonItem, 0);
  objc_storeStrong((id *)&self->_rightTitleLabelBarButtonItem, 0);
  objc_storeStrong((id *)&self->_rightTitleLabel, 0);
  objc_storeStrong((id *)&self->_uiTimer, 0);
  objc_storeStrong((id *)&self->_artworkView, 0);
  objc_storeStrong((id *)&self->_artworkImage, 0);
  objc_storeStrong((id *)&self->_artworkVisualEffectView, 0);
  objc_storeStrong((id *)&self->_artworkOperationQueue, 0);
  objc_storeStrong((id *)&self->_statusBarStyleAssertion, 0);
  objc_storeStrong((id *)&self->_nowPlayingView, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
}

- (void)_updateAudioFormatContentInfo:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(a1, "renderingMode"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138543362;
  v5 = v3;
  _os_log_debug_impl(&dword_21B6EC000, a2, OS_LOG_TYPE_DEBUG, "No available CPUI badge for rendering mode %{public}@", (uint8_t *)&v4, 0xCu);

}

@end
