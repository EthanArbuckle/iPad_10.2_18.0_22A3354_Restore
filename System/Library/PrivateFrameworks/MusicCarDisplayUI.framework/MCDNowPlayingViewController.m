@implementation MCDNowPlayingViewController

- (MCDNowPlayingViewController)initWithBundleID:(id)a3 appName:(id)a4
{
  id v7;
  MCDNowPlayingViewController *v8;
  MCDNowPlayingViewController *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MCDNowPlayingViewController;
  v8 = -[CPUINowPlayingViewController initWithBundleIdentifier:dataSource:delegate:](&v11, sel_initWithBundleIdentifier_dataSource_delegate_, a3, 0, 0);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_appName, a4);

  return v9;
}

- (MCDNowPlayingViewController)initWithPlayableBundleID:(id)a3 appName:(id)a4
{
  id v6;
  MCDNowPlayingViewController *v7;
  MCDPlayableContentPlaybackManager *v8;
  void *v9;
  MCDPlayableContentPlaybackManager *v10;
  MCDPlayableContentQueueTableViewController *v11;
  void *v12;
  MCDPlayableContentQueueTableViewController *v13;

  v6 = a3;
  v7 = -[MCDNowPlayingViewController initWithBundleID:appName:](self, "initWithBundleID:appName:", v6, a4);
  if (v7)
  {
    v8 = [MCDPlayableContentPlaybackManager alloc];
    v9 = (void *)objc_opt_new();
    v10 = -[_MCDNowPlayingContentManager initWithDelegate:dataSource:bundleID:](v8, "initWithDelegate:dataSource:bundleID:", v7, v9, v6);
    -[MCDNowPlayingViewController setContentManager:](v7, "setContentManager:", v10);

    v11 = [MCDPlayableContentQueueTableViewController alloc];
    -[MCDNowPlayingViewController contentManager](v7, "contentManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[MCDPlayableContentQueueTableViewController initWithContentManager:](v11, "initWithContentManager:", v12);
    -[MCDNowPlayingViewController setPlaybackQueueViewController:](v7, "setPlaybackQueueViewController:", v13);

  }
  return v7;
}

- (void)setContentManager:(id)a3
{
  MCDNowPlayingContentManagerProtocol *v5;

  v5 = (MCDNowPlayingContentManagerProtocol *)a3;
  if (self->_contentManager != v5)
  {
    objc_storeStrong((id *)&self->_contentManager, a3);
    -[CPUINowPlayingViewController setDataSource:](self, "setDataSource:", v5);
    -[CPUINowPlayingViewController setDelegate:](self, "setDelegate:", v5);
  }

}

- (void)willMoveToParentViewController:(id)a3
{
  void *v4;
  id v5;

  -[MCDNowPlayingViewController contentManager](self, "contentManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a3)
    objc_msgSend(v4, "beginRequestObservation");
  else
    objc_msgSend(v4, "endRequestObservation");

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)MCDNowPlayingViewController;
  -[CPUINowPlayingViewController dealloc](&v4, sel_dealloc);
}

- (void)viewDidLoad
{
  void *v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  int v11;
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
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  int v43;
  void *v44;
  void *v45;
  MCDNowPlayingBackdropView *v46;
  void *v47;
  MCDNowPlayingBackdropView *v48;
  void *v49;
  void *v50;
  _QWORD v51[5];
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t (*v55)(uint64_t, uint64_t);
  void (*v56)(uint64_t);
  id v57;
  objc_super v58;
  _QWORD v59[3];
  CGRect v60;

  v59[2] = *MEMORY[0x24BDAC8D0];
  v58.receiver = self;
  v58.super_class = (Class)MCDNowPlayingViewController;
  -[CPUINowPlayingViewController viewDidLoad](&v58, sel_viewDidLoad);
  -[MCDNowPlayingViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x24BEBDB00]);
  v5 = *MEMORY[0x24BDBF090];
  v6 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v7 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v8 = *(double *)(MEMORY[0x24BDBF090] + 24);
  v9 = (void *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x24BDBF090], v6, v7, v8);
  objc_msgSend(v3, "setTitleView:", v9);

  -[CPUINowPlayingViewController bundleIdentifier](self, "bundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MRMediaRemoteApplicationSupportsBrowsableContent();

  if (v11)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", self, sel__updateBackButton, *MEMORY[0x24BE655C0], 0);

  }
  -[MCDNowPlayingViewController _updateBackButton](self, "_updateBackButton");
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD708]), "initWithFrame:", v5, v6, v7, v8);
  -[MCDNowPlayingViewController setRightTitleLabel:](self, "setRightTitleLabel:", v13);

  objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 12.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCDNowPlayingViewController rightTitleLabel](self, "rightTitleLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFont:", v14);

  -[MCDNowPlayingViewController rightTitleLabel](self, "rightTitleLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setLineBreakMode:", 4);

  objc_msgSend(MEMORY[0x24BEBD4B8], "_labelColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "colorWithAlphaComponent:", 0.5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCDNowPlayingViewController rightTitleLabel](self, "rightTitleLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setTextColor:", v18);

  -[MCDNowPlayingViewController rightTitleLabel](self, "rightTitleLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setTextAlignment:", 2);

  -[MCDNowPlayingViewController _adjustRightTitleLabelToFit](self, "_adjustRightTitleLabelToFit");
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD398]), "initWithActivityIndicatorStyle:", 100);
  -[MCDNowPlayingViewController setActivityIndicator:](self, "setActivityIndicator:", v21);

  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithCustomView:", self->_activityIndicator);
  -[MCDNowPlayingViewController setActivityIndicatorBarButtonItem:](self, "setActivityIndicatorBarButtonItem:", v22);

  -[MCDNowPlayingViewController _setupActivityTimer](self, "_setupActivityTimer");
  v23 = objc_alloc(MEMORY[0x24BEBD410]);
  -[MCDNowPlayingViewController rightTitleLabel](self, "rightTitleLabel");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v23, "initWithCustomView:", v24);
  -[MCDNowPlayingViewController setRightTitleLabelBarButtonItem:](self, "setRightTitleLabelBarButtonItem:", v25);

  LODWORD(v25) = _os_feature_enabled_impl();
  v26 = (void *)objc_opt_new();
  if ((_DWORD)v25)
  {
    objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("list.bullet"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setImage:forState:", v27, 0);

    objc_msgSend(v26, "addTarget:action:forControlEvents:", self, sel_upNextButtonTapped_, 64);
    objc_msgSend(v26, "setFrame:", 0.0, 0.0, 48.0, 26.0);
    MCDCarDisplayBundle();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("ACCESSIBILITY_QUEUE"), &stru_24FD78C58, CFSTR("MusicCarDisplayUI"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v59[0] = v29;
    MCDCarDisplayBundle();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("ACCESSIBILITY_LIST"), &stru_24FD78C58, CFSTR("MusicCarDisplayUI"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v59[1] = v31;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v59, 2);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setAccessibilityUserInputLabels:", v32);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 16.0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "titleLabel");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setFont:", v33);

    MCDCarDisplayBundle();
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "localizedStringForKey:value:table:", CFSTR("PLAYBACK_QUEUE_TITLE"), &stru_24FD78C58, CFSTR("MusicCarDisplayUI"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setTitle:forState:", v36, 0);

    objc_msgSend(v26, "addTarget:action:forControlEvents:", self, sel_upNextButtonTapped_, 64);
    objc_msgSend(v26, "sizeToFit");
    objc_msgSend(v26, "frame");
    objc_msgSend(v26, "setFrame:", v60.origin.x, v60.origin.y, CGRectGetWidth(v60) + 16.0, v60.size.height + 6.0);
  }
  v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithCustomView:", v26);
  -[MCDNowPlayingViewController setQueueBarButtonItem:](self, "setQueueBarButtonItem:", v37);

  -[MCDNowPlayingViewController setRightTitle:](self, "setRightTitle:", 0);
  -[CPUINowPlayingViewController delegate](self, "delegate");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[CPUINowPlayingViewController delegate](self, "delegate");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v39, "nowPlayingViewControllerCanShowUpNext:", self);

  }
  else
  {
    v40 = 0;
  }

  -[MCDNowPlayingViewController contentManager](self, "contentManager");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCDNowPlayingViewController contentManager:shouldShowPlaybackQueue:](self, "contentManager:shouldShowPlaybackQueue:", v41, v40);

  if (MSVDeviceOSIsInternalInstall())
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v42, "BOOLForKey:", CFSTR("rogueCarPlayBackdrop"));

    if (v43)
    {
      v52 = 0;
      v53 = &v52;
      v54 = 0x3032000000;
      v55 = __Block_byref_object_copy__0;
      v56 = __Block_byref_object_dispose__0;
      v57 = 0;
      -[MCDNowPlayingViewController view](self, "view");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "subviews");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v51[0] = MEMORY[0x24BDAC760];
      v51[1] = 3221225472;
      v51[2] = __42__MCDNowPlayingViewController_viewDidLoad__block_invoke;
      v51[3] = &unk_24FD78520;
      v51[4] = &v52;
      objc_msgSend(v45, "enumerateObjectsUsingBlock:", v51);

      v46 = [MCDNowPlayingBackdropView alloc];
      -[MCDNowPlayingViewController view](self, "view");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "bounds");
      v48 = -[MCDNowPlayingBackdropView initWithFrame:](v46, "initWithFrame:");

      -[MCDNowPlayingBackdropView setAutoresizingMask:](v48, "setAutoresizingMask:", 18);
      -[MCDNowPlayingViewController setBackdropView:](self, "setBackdropView:", v48);
      v49 = (void *)v53[5];
      if (v49)
      {
        objc_msgSend(v49, "setHidden:", 1);
        -[MCDNowPlayingViewController view](self, "view");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "insertSubview:aboveSubview:", v48, v53[5]);
      }
      else
      {
        -[MCDNowPlayingViewController view](self, "view");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "insertSubview:atIndex:", v48, 0);
      }

      _Block_object_dispose(&v52, 8);
    }
  }

}

void __42__MCDNowPlayingViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;

  v7 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (void)upNextButtonTapped:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  id v9;
  id v10;

  -[MCDNowPlayingViewController navigationController](self, "navigationController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCDNowPlayingViewController playbackQueueViewController](self, "playbackQueueViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "containsObject:", v6);

  -[MCDNowPlayingViewController navigationController](self, "navigationController");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[MCDNowPlayingViewController playbackQueueViewController](self, "playbackQueueViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    v9 = (id)objc_msgSend(v10, "popToViewController:animated:", v8, 1);
  else
    objc_msgSend(v10, "pushViewController:animated:", v8, 1);

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MCDNowPlayingViewController;
  -[CPUINowPlayingViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[MCDNowPlayingViewController _handleWillAppear](self, "_handleWillAppear");
  -[MCDNowPlayingViewController updateBarButtonItems](self, "updateBarButtonItems");
}

- (void)_handleWillAppear
{
  void *v3;

  if (self->_showNavigationBar)
  {
    -[MCDNowPlayingViewController navigationController](self, "navigationController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setNavigationBarHidden:animated:", 0, 1);

  }
  -[MCDNowPlayingViewController setHandledWillAppear:](self, "setHandledWillAppear:", 1);
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (!self->_handledWillAppear)
    -[MCDNowPlayingViewController _handleWillAppear](self, "_handleWillAppear");
  v5.receiver = self;
  v5.super_class = (Class)MCDNowPlayingViewController;
  -[MCDNowPlayingViewController viewDidAppear:](&v5, sel_viewDidAppear_, v3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MCDNowPlayingViewController;
  -[CPUINowPlayingViewController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  -[MCDNowPlayingViewController setHandledWillAppear:](self, "setHandledWillAppear:", 0);
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MCDNowPlayingViewController;
  -[CPUINowPlayingViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, a3);
  -[MCDNowPlayingViewController contentManager](self, "contentManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewWillDisappear");

  -[MCDNowPlayingViewController setHandledWillAppear:](self, "setHandledWillAppear:", 0);
}

- (id)_upNextBarButtonItem
{
  return 0;
}

- (void)_updateBackButton
{
  void *v2;

  -[CPUINowPlayingViewController bundleIdentifier](self, "bundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MRMediaRemoteGetSupportedBrowsableContentAPIs();

}

void __48__MCDNowPlayingViewController__updateBackButton__block_invoke(uint64_t a1, int a2, int a3)
{
  _QWORD v3[5];
  int v4;
  int v5;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __48__MCDNowPlayingViewController__updateBackButton__block_invoke_2;
  v3[3] = &unk_24FD78548;
  v4 = a3;
  v5 = a2;
  v3[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], v3);
}

uint64_t __48__MCDNowPlayingViewController__updateBackButton__block_invoke_2(uint64_t a1)
{
  _BOOL8 v2;
  void *v3;

  if (*(_DWORD *)(a1 + 40))
    v2 = 1;
  else
    v2 = *(_DWORD *)(a1 + 44) == 0;
  objc_msgSend(*(id *)(a1 + 32), "contentManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setShouldHideBackButton:", v2);

  return objc_msgSend(*(id *)(a1 + 32), "reloadData");
}

- (void)setRightTitle:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  -[MCDNowPlayingViewController appName](self, "appName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    +[MCDBrowsableContentUtilities sharedInstance](MCDBrowsableContentUtilities, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstPartyAppBundleIDs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPUINowPlayingViewController bundleIdentifier](self, "bundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "containsObject:", v7);

    if ((v8 & 1) != 0)
    {
      v9 = v15;
LABEL_7:
      v4 = v9;
      goto LABEL_8;
    }
    if (!v15)
    {
      -[MCDNowPlayingViewController appName](self, "appName");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    v10 = (void *)MEMORY[0x24BDD17C8];
    MCDCarDisplayBundle();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("AppName_PlaybackQueue"), &stru_24FD78C58, CFSTR("MusicCarDisplayUI"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCDNowPlayingViewController appName](self, "appName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringWithFormat:", v12, v13, v15);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_8:
  -[MCDNowPlayingViewController rightTitleLabel](self, "rightTitleLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setText:", v4);

  -[MCDNowPlayingViewController _adjustRightTitleLabelToFit](self, "_adjustRightTitleLabelToFit");
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

  -[MCDNowPlayingViewController rightTitleLabel](self, "rightTitleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sizeToFit");

  -[MCDNowPlayingViewController rightTitleLabel](self, "rightTitleLabel");
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
  -[MCDNowPlayingViewController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "frame");
  v15 = CGRectGetWidth(v24) * 0.6;

  if (Width > v15)
    Width = v15;
  -[MCDNowPlayingViewController rightTitleLabel](self, "rightTitleLabel");
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
    -[MCDNowPlayingViewController rightTitleLabel](self, "rightTitleLabel");
    v22 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setFrame:", v6, v8, Width, v12);

  }
}

- (void)updateBarButtonItems
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;

  if (-[MCDNowPlayingViewController shouldShowPlaybackQueue](self, "shouldShowPlaybackQueue"))
    -[MCDNowPlayingViewController queueBarButtonItem](self, "queueBarButtonItem");
  else
    -[MCDNowPlayingViewController rightTitleLabelBarButtonItem](self, "rightTitleLabelBarButtonItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v12 = v3;
    -[MCDNowPlayingViewController activityIndicatorBarButtonItem](self, "activityIndicatorBarButtonItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v3 = v12;
    if (v4)
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObject:", v12);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[MCDNowPlayingViewController additionalBarButtonItems](self, "additionalBarButtonItems");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObjectsFromArray:", v6);

      -[MCDNowPlayingViewController activityIndicatorBarButtonItem](self, "activityIndicatorBarButtonItem");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v7);

      -[MCDNowPlayingViewController navigationItem](self, "navigationItem");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "rightBarButtonItems");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isEqualToArray:", v5);

      if ((v10 & 1) == 0)
      {
        -[MCDNowPlayingViewController navigationItem](self, "navigationItem");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setRightBarButtonItems:", v5);

      }
      v3 = v12;
    }
  }

}

- (void)contentManager:(id)a3 processResponse:(id)a4 error:(id)a5
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  _QWORD v23[4];
  id v24;
  MCDNowPlayingViewController *v25;

  v6 = a4;
  if (MSVDeviceOSIsInternalInstall())
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "BOOLForKey:", CFSTR("rogueCarPlayBackdrop"));

    if (v8)
    {
      objc_msgSend(v6, "tracklist");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "playingItem");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "metadataObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "flattenedGenericObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "artworkCatalog");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[MCDNowPlayingViewController view](self, "view");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "bounds");
      objc_msgSend(v13, "setFittingSize:", v15, v16);

      v17 = (void *)MEMORY[0x24BDDC6D8];
      -[MCDNowPlayingViewController backdropView](self, "backdropView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setCacheLimit:forCacheIdentifier:cacheReference:", 1, CFSTR("Backdrop"), v18);

      -[MCDNowPlayingViewController backdropView](self, "backdropView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setCacheIdentifier:forCacheReference:", CFSTR("Backdrop"), v19);

      -[MCDNowPlayingViewController traitCollection](self, "traitCollection");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "displayScale");
      objc_msgSend(v13, "setDestinationScale:");

      -[MCDNowPlayingViewController backdropView](self, "backdropView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = MEMORY[0x24BDAC760];
      v23[1] = 3221225472;
      v23[2] = __68__MCDNowPlayingViewController_contentManager_processResponse_error___block_invoke;
      v23[3] = &unk_24FD78570;
      v24 = v12;
      v25 = self;
      v22 = v12;
      objc_msgSend(v13, "setDestination:configurationBlock:", v21, v23);

    }
  }

}

void __68__MCDNowPlayingViewController_contentManager_processResponse_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;

  v12 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "anyObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "contentManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "currentPlayingSong");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identifiers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v7, "intersectsSet:", v10);

  if (v11)
    objc_msgSend(v12, "updateWithImage:animated:", v5, 1);

}

- (void)contentManager:(id)a3 bufferingItem:(BOOL)a4
{
  _QWORD block[5];

  -[MCDNowPlayingViewController setTrackBuffering:](self, "setTrackBuffering:", a4);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__MCDNowPlayingViewController_contentManager_bufferingItem___block_invoke;
  block[3] = &unk_24FD78200;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __60__MCDNowPlayingViewController_contentManager_bufferingItem___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  id v4;

  v2 = objc_msgSend(*(id *)(a1 + 32), "trackBuffering");
  objc_msgSend(*(id *)(a1 + 32), "activityIndicator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
    objc_msgSend(v3, "startAnimating");
  else
    objc_msgSend(v3, "stopAnimating");

}

- (void)contentManagerReloadData:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__MCDNowPlayingViewController_contentManagerReloadData___block_invoke;
  block[3] = &unk_24FD78200;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __56__MCDNowPlayingViewController_contentManagerReloadData___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadData");
}

- (void)contentManager:(id)a3 presentViewController:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __68__MCDNowPlayingViewController_contentManager_presentViewController___block_invoke;
  v7[3] = &unk_24FD781B0;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], v7);

}

uint64_t __68__MCDNowPlayingViewController_contentManager_presentViewController___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", *(_QWORD *)(a1 + 40), 1, 0);
}

- (void)contentManager:(id)a3 pushViewController:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __65__MCDNowPlayingViewController_contentManager_pushViewController___block_invoke;
  v7[3] = &unk_24FD781B0;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], v7);

}

void __65__MCDNowPlayingViewController_contentManager_pushViewController___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "navigationController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pushViewController:animated:", *(_QWORD *)(a1 + 40), 1);

}

- (void)contentManager:(id)a3 shouldShowPlaybackQueue:(BOOL)a4
{
  -[MCDNowPlayingViewController setShouldShowPlaybackQueue:](self, "setShouldShowPlaybackQueue:", a4);
  if (-[MCDNowPlayingViewController handledWillAppear](self, "handledWillAppear"))
    -[MCDNowPlayingViewController updateBarButtonItems](self, "updateBarButtonItems");
}

- (void)contentManager:(id)a3 sectionName:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __58__MCDNowPlayingViewController_contentManager_sectionName___block_invoke;
  v7[3] = &unk_24FD781B0;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], v7);

}

uint64_t __58__MCDNowPlayingViewController_contentManager_sectionName___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setRightTitle:", *(_QWORD *)(a1 + 40));
}

- (void)contentManager:(id)a3 displayItemIndex:(int64_t)a4 totalItemCount:(int64_t)a5
{
  _QWORD block[7];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __78__MCDNowPlayingViewController_contentManager_displayItemIndex_totalItemCount___block_invoke;
  block[3] = &unk_24FD78598;
  block[4] = self;
  block[5] = a4;
  block[6] = a5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __78__MCDNowPlayingViewController_contentManager_displayItemIndex_totalItemCount___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v2 = (void *)a1[4];
  v3 = (void *)MEMORY[0x24BDD17C8];
  MCDCarDisplayBundle();
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("POSITION_IN_PLAYLIST_FORMAT"), &stru_24FD78C58, CFSTR("MusicCarDisplayUI"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a1[5] + 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  MCDFormattedNumberString(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a1[6]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  MCDFormattedNumberString(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringWithFormat:", v4, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setRightTitle:", v9);

}

- (void)contentManagerInitiatedPlaybackFromPlaybackQueue:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  MCDGeneralLogging();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_22FBAA000, v4, OS_LOG_TYPE_DEFAULT, "Row selected in Playback Queue, dismissing Playback Queue screen", v5, 2u);
  }

  -[MCDNowPlayingViewController _popViewControllerAnimated](self, "_popViewControllerAnimated");
}

- (void)contentManagerCompletedAllPlayback:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  MCDGeneralLogging();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_22FBAA000, v4, OS_LOG_TYPE_DEFAULT, "All playback completed, dismissing Now Playing screen", v5, 2u);
  }

  -[MCDNowPlayingViewController _popViewControllerAnimated](self, "_popViewControllerAnimated");
}

- (void)contentManager:(id)a3 setAdditionalBarButtonItems:(id)a4
{
  -[MCDNowPlayingViewController setAdditionalBarButtonItems:](self, "setAdditionalBarButtonItems:", a4);
  -[MCDNowPlayingViewController updateBarButtonItems](self, "updateBarButtonItems");
}

- (void)_popViewControllerAnimated
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__MCDNowPlayingViewController__popViewControllerAnimated__block_invoke;
  block[3] = &unk_24FD78200;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __57__MCDNowPlayingViewController__popViewControllerAnimated__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  id v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "navigationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewControllers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", *(_QWORD *)(a1 + 32));

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "navigationController");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v5 = (id)objc_msgSend(v6, "popViewControllerAnimated:", 1);

  }
}

- (void)_setupActivityTimer
{
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;
  id location;

  -[MCDNowPlayingViewController _invalidateActivityTimer](self, "_invalidateActivityTimer");
  objc_initWeak(&location, self);
  v3 = (void *)MEMORY[0x24BDDCD00];
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __50__MCDNowPlayingViewController__setupActivityTimer__block_invoke;
  v5[3] = &unk_24FD785C0;
  objc_copyWeak(&v6, &location);
  v5[4] = self;
  objc_msgSend(v3, "timerWithInterval:repeats:block:", 0, v5, 2.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCDNowPlayingViewController setActivityTimer:](self, "setActivityTimer:", v4);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __50__MCDNowPlayingViewController__setupActivityTimer__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    if ((objc_msgSend(WeakRetained[155], "isAnimating") & 1) == 0
      && objc_msgSend(*(id *)(a1 + 32), "trackBuffering"))
    {
      objc_msgSend(v3[155], "startAnimating");
    }
    objc_msgSend(v3, "_invalidateActivityTimer");
    WeakRetained = v3;
  }

}

- (void)_invalidateActivityTimer
{
  void *v3;
  void *v4;

  -[MCDNowPlayingViewController activityTimer](self, "activityTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[MCDNowPlayingViewController activityTimer](self, "activityTimer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invalidate");

    -[MCDNowPlayingViewController setActivityTimer:](self, "setActivityTimer:", 0);
  }
}

- (BOOL)showNavigationBar
{
  return self->_showNavigationBar;
}

- (void)setShowNavigationBar:(BOOL)a3
{
  self->_showNavigationBar = a3;
}

- (UITableViewController)playbackQueueViewController
{
  return self->_playbackQueueViewController;
}

- (void)setPlaybackQueueViewController:(id)a3
{
  objc_storeStrong((id *)&self->_playbackQueueViewController, a3);
}

- (MCDNowPlayingContentManagerProtocol)contentManager
{
  return self->_contentManager;
}

- (MCDNowPlayingBackdropView)backdropView
{
  return self->_backdropView;
}

- (void)setBackdropView:(id)a3
{
  objc_storeStrong((id *)&self->_backdropView, a3);
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

- (BOOL)trackBuffering
{
  return self->_trackBuffering;
}

- (void)setTrackBuffering:(BOOL)a3
{
  self->_trackBuffering = a3;
}

- (NSString)appName
{
  return self->_appName;
}

- (void)setAppName:(id)a3
{
  objc_storeStrong((id *)&self->_appName, a3);
}

- (MPWeakTimer)activityTimer
{
  return self->_activityTimer;
}

- (void)setActivityTimer:(id)a3
{
  objc_storeStrong((id *)&self->_activityTimer, a3);
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

- (UIBarButtonItem)queueBarButtonItem
{
  return self->_queueBarButtonItem;
}

- (void)setQueueBarButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_queueBarButtonItem, a3);
}

- (NSArray)additionalBarButtonItems
{
  return self->_additionalBarButtonItems;
}

- (void)setAdditionalBarButtonItems:(id)a3
{
  objc_storeStrong((id *)&self->_additionalBarButtonItems, a3);
}

- (BOOL)handledWillAppear
{
  return self->_handledWillAppear;
}

- (void)setHandledWillAppear:(BOOL)a3
{
  self->_handledWillAppear = a3;
}

- (BOOL)shouldShowPlaybackQueue
{
  return self->_shouldShowPlaybackQueue;
}

- (void)setShouldShowPlaybackQueue:(BOOL)a3
{
  self->_shouldShowPlaybackQueue = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalBarButtonItems, 0);
  objc_storeStrong((id *)&self->_queueBarButtonItem, 0);
  objc_storeStrong((id *)&self->_rightTitleLabelBarButtonItem, 0);
  objc_storeStrong((id *)&self->_rightTitleLabel, 0);
  objc_storeStrong((id *)&self->_activityTimer, 0);
  objc_storeStrong((id *)&self->_appName, 0);
  objc_storeStrong((id *)&self->_activityIndicatorBarButtonItem, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_backdropView, 0);
  objc_storeStrong((id *)&self->_contentManager, 0);
  objc_storeStrong((id *)&self->_playbackQueueViewController, 0);
}

@end
