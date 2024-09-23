@implementation AKProximityAuthViewController

- (AKProximityAuthViewController)initWithViewModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  AKProximityAuthViewController *v7;
  objc_super v9;

  v4 = a3;
  objc_msgSend(v4, "titleText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "detailedText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)AKProximityAuthViewController;
  v7 = -[AKProximityAuthViewController initWithTitle:detailText:icon:](&v9, sel_initWithTitle_detailText_icon_, v5, v6, 0);

  if (v7)
    -[AKProximityAuthViewController setViewModel:](v7, "setViewModel:", v4);

  return v7;
}

- (void)updateViewWithViewModel:(id)a3
{
  AKBringDeviceCloseMicaView *proximityMicaView;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  AKBringDeviceCloseMicaView *v10;
  void *v11;
  id v12;

  v12 = a3;
  proximityMicaView = self->_proximityMicaView;
  if (proximityMicaView)
    -[AKBringDeviceCloseMicaView setShouldshowDotCloud:](proximityMicaView, "setShouldshowDotCloud:", 1);
  -[AKProximityAuthViewController setViewModel:](self, "setViewModel:", v12);
  objc_msgSend(v12, "detailedText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKProximityAuthViewController headerView](self, "headerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDetailText:", v5);

  objc_msgSend(v12, "titleText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKProximityAuthViewController headerView](self, "headerView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTitle:", v7);

  -[AKProximityAuthViewController buttonTray](self, "buttonTray");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeAllButtons");

  -[AKProximityAuthViewController _configureViews](self, "_configureViews");
  if (objc_msgSend(v12, "type") == 1)
  {
    -[AKProximityAuthViewController _start](self, "_start");
    v10 = self->_proximityMicaView;
    self->_proximityMicaView = 0;

  }
  else
  {
    -[AKProximityAuthViewController _stop](self, "_stop");
  }
  -[AKProximityAuthViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "layoutIfNeeded");

}

- (void)dealloc
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  objc_super v6;
  uint8_t buf[16];

  _AKLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BD795000, v3, OS_LOG_TYPE_DEFAULT, "AKProximityAuthViewController deallocated", buf, 2u);
  }

  -[AKProximityAuthViewController videoPlayer](self, "videoPlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:forKeyPath:", self, CFSTR("status"));

  if (self->_deallocAction)
  {
    _AKLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BD795000, v5, OS_LOG_TYPE_DEFAULT, "AKProximityAuthViewController calling dealloc action", buf, 2u);
    }

    (*((void (**)(void))self->_deallocAction + 2))();
  }
  v6.receiver = self;
  v6.super_class = (Class)AKProximityAuthViewController;
  -[AKProximityAuthViewController dealloc](&v6, sel_dealloc);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AKProximityAuthViewController;
  -[OBBaseWelcomeController viewDidLoad](&v5, sel_viewDidLoad);
  -[AKProximityAuthViewController _configureViews](self, "_configureViews");
  objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKProximityAuthViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  -[AKProximityAuthViewController setEdgesForExtendedLayout:](self, "setEdgesForExtendedLayout:", 0);
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AKProximityAuthViewController;
  -[OBBaseWelcomeController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  if (-[AKProximityAuthViewController _shouldShowVisualPairing](self, "_shouldShowVisualPairing"))
    -[AKProximityAuthViewController _start](self, "_start");
}

- (void)viewDidLayoutSubviews
{
  if (-[AKProximityAuthViewController _started](self, "_started"))
  {
    -[AKProximityAuthViewController _stop](self, "_stop");
    -[AKProximityAuthViewController _start](self, "_start");
  }
}

- (BOOL)_doesUserInterfaceStyleMatchMovieURL
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[AKProximityAuthViewController _currentPairingMovieURL](self, "_currentPairingMovieURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByDeletingPathExtension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastPathComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[AKProximityAuthViewController _pairingMovieName](self, "_pairingMovieName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v5, "isEqualToString:", v6);

  return (char)v3;
}

- (BOOL)_shouldShowVisualPairing
{
  void *v2;
  BOOL v3;

  -[AKProximityAuthViewController viewModel](self, "viewModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "type") == 1;

  return v3;
}

- (BOOL)_shouldShowCancelBarButton
{
  void *v2;
  char v3;

  -[AKProximityAuthViewController navigationController](self, "navigationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isModalInPresentation");

  return v3;
}

- (void)didBecomeActive:(id)a3
{
  if (-[AKProximityAuthViewController _started](self, "_started", a3))
    -[AKProximityAuthViewController _start](self, "_start");
}

- (void)_createPlayer
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  objc_class *AVPlayerViewControllerClass;
  id v13;
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
  id v27;

  v3 = objc_alloc(MEMORY[0x1E0C8B2E8]);
  -[AKProximityAuthViewController _pairingMoviePlayerItem](self, "_pairingMoviePlayerItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithPlayerItem:", v4);
  -[AKProximityAuthViewController setVideoPlayer:](self, "setVideoPlayer:", v5);

  -[AKProximityAuthViewController videoPlayer](self, "videoPlayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMuted:", 1);

  -[AKProximityAuthViewController videoPlayer](self, "videoPlayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:forKeyPath:options:context:", self, CFSTR("status"), 0, 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x1E0C8AC48];
  -[AKProximityAuthViewController videoPlayer](self, "videoPlayer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "currentItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObserver:selector:name:object:", self, sel__videoReachedEnd_, v9, v11);

  AVPlayerViewControllerClass = (objc_class *)AVKitLibraryCore();
  if (AVPlayerViewControllerClass)
    AVPlayerViewControllerClass = (objc_class *)getAVPlayerViewControllerClass();
  v13 = objc_alloc_init(AVPlayerViewControllerClass);
  -[AKProximityAuthViewController setVideoViewController:](self, "setVideoViewController:", v13);

  -[AKProximityAuthViewController videoViewController](self, "videoViewController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFrame:", 0.0, 0.0, 300.0, 300.0);

  -[AKProximityAuthViewController videoViewController](self, "videoViewController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setUpdatesNowPlayingInfoCenter:", 0);

  -[AKProximityAuthViewController videoPlayer](self, "videoPlayer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKProximityAuthViewController videoViewController](self, "videoViewController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setPlayer:", v17);

  -[AKProximityAuthViewController videoViewController](self, "videoViewController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setShowsPlaybackControls:", 0);

  -[AKProximityAuthViewController videoViewController](self, "videoViewController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setAllowsPictureInPicturePlayback:", 0);

  -[AKProximityAuthViewController videoViewController](self, "videoViewController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "view");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setContentMode:", 1);

  -[AKProximityAuthViewController videoViewController](self, "videoViewController");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "view");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  if (-[AKProximityAuthViewController _isDarkMode](self, "_isDarkMode"))
    -[AKProximityAuthViewController _pairingBackgroundColor](self, "_pairingBackgroundColor");
  else
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v27 = (id)objc_claimAutoreleasedReturnValue();
  -[AKProximityAuthViewController videoViewController](self, "videoViewController");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "view");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setBackgroundColor:", v27);

}

- (id)_pairingMoviePlayerItem
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C8B300];
  -[AKProximityAuthViewController _pairingMovieURLAsset](self, "_pairingMovieURLAsset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "playerItemWithAsset:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_pairingMovieURLAsset
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", CFSTR("/System/Library/PrivateFrameworks/AuthKitUI.framework"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0C8B3C0]);
  v5 = (void *)MEMORY[0x1E0C99E98];
  -[AKProximityAuthViewController _pairingMovieName](self, "_pairingMovieName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pathForResource:ofType:", v6, CFSTR("mov"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fileURLWithPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v4, "initWithURL:options:", v8, 0);

  return v9;
}

- (id)_pairingMovieName
{
  if (-[AKProximityAuthViewController _isDarkMode](self, "_isDarkMode"))
    return CFSTR("ProximityPairingLoopDark");
  else
    return CFSTR("ProximityPairingLoop");
}

- (void)_addPlayer
{
  void *v3;
  void *v4;
  id v5;

  -[AKProximityAuthViewController visualPairingView](self, "visualPairingView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[AKProximityAuthViewController videoViewController](self, "videoViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", v4);

}

- (void)_updatePlayerIfNeeded
{
  void *v3;
  id v4;

  if (-[AKProximityMessageViewModel type](self->_viewModel, "type") == 1
    && !-[AKProximityAuthViewController _doesUserInterfaceStyleMatchMovieURL](self, "_doesUserInterfaceStyleMatchMovieURL"))
  {
    -[AKProximityAuthViewController videoPlayer](self, "videoPlayer");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[AKProximityAuthViewController _pairingMoviePlayerItem](self, "_pairingMoviePlayerItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "replaceCurrentItemWithPlayerItem:", v3);

  }
}

- (id)_currentPairingMovieURL
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;

  -[AKProximityAuthViewController videoPlayer](self, "videoPlayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "asset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "URL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    _AKLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[AKProximityAuthViewController _currentPairingMovieURL].cold.1(v6);

    v5 = 0;
  }

  return v5;
}

- (void)_start
{
  void *v3;
  id v4;

  if (-[AKProximityAuthViewController _shouldShowVisualPairing](self, "_shouldShowVisualPairing"))
  {
    -[AKProximityAuthViewController set_started:](self, "set_started:", 1);
    -[AKProximityAuthViewController visualPairingView](self, "visualPairingView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "start");

    -[AKProximityAuthViewController videoPlayer](self, "videoPlayer");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "play");

  }
}

- (void)_stop
{
  -[AKProximityAuthViewController set_started:](self, "set_started:", 0);
  -[AKProximityAuthViewController _stopPairingInterface](self, "_stopPairingInterface");
}

- (void)_videoReachedEnd:(id)a3
{
  void *v4;
  void *v5;
  __int128 v6;
  uint64_t v7;

  -[AKProximityAuthViewController videoPlayer](self, "videoPlayer", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0CA2E68];
  v7 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
  objc_msgSend(v4, "seekToTime:", &v6);

  -[AKProximityAuthViewController videoPlayer](self, "videoPlayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "play");

}

- (void)_stopPairingInterface
{
  void *v3;
  void *v4;
  id v5;

  -[AKProximityAuthViewController visualPairingView](self, "visualPairingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stop");

  -[AKProximityAuthViewController videoPlayer](self, "videoPlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pause");

  objc_msgSend(MEMORY[0x1E0C89AE8], "sharedInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCategory:error:", *MEMORY[0x1E0C89660], 0);

}

- (BOOL)_isDarkMode
{
  void *v2;
  BOOL v3;

  objc_msgSend(MEMORY[0x1E0CEAB40], "currentTraitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceStyle") == 2;

  return v3;
}

- (id)_pairingBackgroundColor
{
  return (id)objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
}

- (id)_maskBackgroundColor
{
  return (id)objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
}

- (unsigned)_pairingFlags
{
  return -[AKProximityAuthViewController _isDarkMode](self, "_isDarkMode");
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8;
  id v9;
  id v10;
  BOOL v11;
  uint64_t v12;
  _QWORD block[5];

  v8 = a3;
  v9 = a4;
  -[AKProximityAuthViewController videoPlayer](self, "videoPlayer");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10 != v9 || !objc_msgSend(v8, "isEqualToString:", CFSTR("status")))
    goto LABEL_7;
  v11 = -[AKProximityAuthViewController _started](self, "_started");

  if (v11)
    goto LABEL_8;
  -[AKProximityAuthViewController videoPlayer](self, "videoPlayer");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "status") != 2)
  {
LABEL_7:

    goto LABEL_8;
  }
  v12 = -[AKProximityAuthViewController retryAttempts](self, "retryAttempts");

  if (v12 <= 2)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __80__AKProximityAuthViewController_observeValueForKeyPath_ofObject_change_context___block_invoke;
    block[3] = &unk_1E76789A0;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
LABEL_8:

}

uint64_t __80__AKProximityAuthViewController_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setRetryAttempts:", objc_msgSend(*(id *)(a1 + 32), "retryAttempts") + 1);
}

- (void)_cancelBarButtonItemPressed:(id)a3
{
  void (**cancelAction)(void);

  cancelAction = (void (**)(void))self->_cancelAction;
  if (cancelAction)
    cancelAction[2]();
}

- (void)_primaryFallbackButtonSelected:(id)a3
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (**primaryButtonAction)(void);

  _AKLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[AKProximityAuthViewController _primaryFallbackButtonSelected:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);

  primaryButtonAction = (void (**)(void))self->_primaryButtonAction;
  if (primaryButtonAction)
    primaryButtonAction[2]();
}

- (void)_secondaryFallbackButtonSelected:(id)a3
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (**alternateButtonAction)(void);

  _AKLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[AKProximityAuthViewController _secondaryFallbackButtonSelected:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);

  alternateButtonAction = (void (**)(void))self->_alternateButtonAction;
  if (alternateButtonAction)
    alternateButtonAction[2]();
}

- (void)_configureViews
{
  -[AKProximityAuthViewController _cleanupOldViews](self, "_cleanupOldViews");
  -[AKProximityAuthViewController _addHeaderView](self, "_addHeaderView");
  -[AKProximityAuthViewController _addContentView](self, "_addContentView");
  -[AKProximityAuthViewController _addPrivacyLinkController](self, "_addPrivacyLinkController");
  -[AKProximityAuthViewController _addPrimaryButton](self, "_addPrimaryButton");
  -[AKProximityAuthViewController _addSecondaryButton](self, "_addSecondaryButton");
  if (-[AKProximityAuthViewController _shouldShowCancelBarButton](self, "_shouldShowCancelBarButton"))
    -[AKProximityAuthViewController _addCancelBarButton](self, "_addCancelBarButton");
}

- (void)_addCancelBarButton
{
  void *v3;
  id v4;

  v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithBarButtonSystemItem:target:action:", 24, self, sel__cancelBarButtonItemPressed_);
  -[OBBaseWelcomeController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRightBarButtonItem:", v4);

}

- (void)_cleanupOldViews
{
  void *v3;
  OBTrayButton *primaryButton;
  void *v5;
  OBTrayButton *secondaryButton;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (self->_primaryButton)
  {
    -[AKProximityAuthViewController buttonTray](self, "buttonTray");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeButton:", self->_primaryButton);

    primaryButton = self->_primaryButton;
    self->_primaryButton = 0;

  }
  if (self->_secondaryButton)
  {
    -[AKProximityAuthViewController buttonTray](self, "buttonTray");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeButton:", self->_secondaryButton);

    secondaryButton = self->_secondaryButton;
    self->_secondaryButton = 0;

  }
  -[AKProximityAuthViewController contentView](self, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    -[AKProximityAuthViewController contentView](self, "contentView", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "subviews");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v15;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v15 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v13++), "removeFromSuperview");
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v11);
    }

  }
}

- (void)_addPrimaryButton
{
  void *v3;
  void *v4;
  OBTrayButton *v5;
  OBTrayButton *primaryButton;
  OBTrayButton *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[AKProximityAuthViewController viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "primaryButtonTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D65140], "boldButton");
    v5 = (OBTrayButton *)objc_claimAutoreleasedReturnValue();
    primaryButton = self->_primaryButton;
    self->_primaryButton = v5;

    v7 = self->_primaryButton;
    -[AKProximityAuthViewController viewModel](self, "viewModel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "primaryButtonTitle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBTrayButton setTitle:forState:](v7, "setTitle:forState:", v9, 0);

    objc_msgSend(MEMORY[0x1E0CEA3A8], "plainButtonConfiguration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBTrayButton setConfiguration:](self->_primaryButton, "setConfiguration:", v10);

    -[OBTrayButton addTarget:action:forControlEvents:](self->_primaryButton, "addTarget:action:forControlEvents:", self, sel__primaryFallbackButtonSelected_, 64);
    -[AKProximityAuthViewController buttonTray](self, "buttonTray");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addButton:", self->_primaryButton);

  }
}

- (void)_addSecondaryButton
{
  void *v3;
  void *v4;
  OBTrayButton *v5;
  OBTrayButton *secondaryButton;
  OBTrayButton *v7;
  void *v8;
  void *v9;
  OBTrayButton *v10;
  id v11;

  -[AKProximityAuthViewController viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "secondaryButtonTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D65170], "linkButton");
    v5 = (OBTrayButton *)objc_claimAutoreleasedReturnValue();
    secondaryButton = self->_secondaryButton;
    self->_secondaryButton = v5;

    v7 = self->_secondaryButton;
    -[AKProximityAuthViewController viewModel](self, "viewModel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "secondaryButtonTitle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBTrayButton setTitle:forState:](v7, "setTitle:forState:", v9, 0);

    -[OBTrayButton addTarget:action:forControlEvents:](self->_secondaryButton, "addTarget:action:forControlEvents:", self, sel__secondaryFallbackButtonSelected_, 64);
    -[AKProximityAuthViewController buttonTray](self, "buttonTray");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addButton:", self->_secondaryButton);
  }
  else
  {
    v10 = self->_secondaryButton;
    self->_secondaryButton = 0;

    -[AKProximityAuthViewController buttonTray](self, "buttonTray");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeButton:", self->_secondaryButton);
  }

}

- (void)_addHeaderView
{
  void *v3;
  UIView *v4;
  UIView *logoContainerView;
  AKAppleLogoMicaView *v6;
  AKAppleLogoMicaView *appleLogoMicaView;
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
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  _QWORD v42[10];

  v42[8] = *MEMORY[0x1E0C80C00];
  -[AKProximityAuthViewController headerView](self, "headerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutIfNeeded");

  v4 = (UIView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
  logoContainerView = self->_logoContainerView;
  self->_logoContainerView = v4;

  -[UIView setFrame:](self->_logoContainerView, "setFrame:", 0.0, 50.0, 373.0, 373.0);
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_logoContainerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v6 = objc_alloc_init(AKAppleLogoMicaView);
  appleLogoMicaView = self->_appleLogoMicaView;
  self->_appleLogoMicaView = v6;

  -[AKAppleLogoMicaView setTranslatesAutoresizingMaskIntoConstraints:](self->_appleLogoMicaView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView addSubview:](self->_logoContainerView, "addSubview:", self->_appleLogoMicaView);
  -[AKProximityAuthViewController headerView](self, "headerView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "animationView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSubview:", self->_logoContainerView);

  -[AKProximityAuthViewController headerView](self, "headerView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "animationView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[AKProximityAuthViewController headerView](self, "headerView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "animationView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setClipsToBounds:", 1);

  v30 = (void *)MEMORY[0x1E0CB3718];
  -[UIView centerXAnchor](self->_logoContainerView, "centerXAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKProximityAuthViewController headerView](self, "headerView");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "animationView");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "centerXAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "constraintEqualToAnchor:", v38);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = v37;
  -[UIView centerYAnchor](self->_logoContainerView, "centerYAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKProximityAuthViewController headerView](self, "headerView");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "animationView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "centerYAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "constraintEqualToAnchor:", v33);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v42[1] = v32;
  -[UIView heightAnchor](self->_logoContainerView, "heightAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "constraintEqualToConstant:", 373.0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v42[2] = v29;
  -[UIView widthAnchor](self->_logoContainerView, "widthAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToConstant:", 373.0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v42[3] = v27;
  -[AKAppleLogoMicaView topAnchor](self->_appleLogoMicaView, "topAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView topAnchor](self->_logoContainerView, "topAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:", v25);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v42[4] = v24;
  -[AKAppleLogoMicaView bottomAnchor](self->_appleLogoMicaView, "bottomAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bottomAnchor](self->_logoContainerView, "bottomAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v42[5] = v16;
  -[AKAppleLogoMicaView leadingAnchor](self->_appleLogoMicaView, "leadingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView leadingAnchor](self->_logoContainerView, "leadingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v42[6] = v19;
  -[AKAppleLogoMicaView trailingAnchor](self->_appleLogoMicaView, "trailingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView trailingAnchor](self->_logoContainerView, "trailingAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v42[7] = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 8);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "activateConstraints:", v23);

}

- (void)_addContentView
{
  unint64_t v3;
  id v4;
  _QWORD block[5];

  v3 = -[AKProximityMessageViewModel type](self->_viewModel, "type");
  switch(v3)
  {
    case 2uLL:
      -[AKProximityAuthViewController _showPinCode](self, "_showPinCode");
      break;
    case 1uLL:
      -[AKProximityAuthViewController _showVisualPairingContent](self, "_showVisualPairingContent");
      break;
    case 0uLL:
      -[AKProximityAuthViewController _showBroadcastingContent](self, "_showBroadcastingContent");
      break;
  }
  if (-[AKProximityAuthViewController _shouldShowVisualPairing](self, "_shouldShowVisualPairing"))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __48__AKProximityAuthViewController__addContentView__block_invoke;
    block[3] = &unk_1E76789A0;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
  else
  {
    -[AKProximityAuthViewController contentView](self, "contentView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "layoutIfNeeded");

  }
}

uint64_t __48__AKProximityAuthViewController__addContentView__block_invoke(uint64_t a1)
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __48__AKProximityAuthViewController__addContentView__block_invoke_2;
  v2[3] = &unk_1E76789A0;
  v2[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:", v2, 0.2);
}

void __48__AKProximityAuthViewController__addContentView__block_invoke_2(uint64_t a1)
{
  void *v1;
  double v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "visualPairingView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = 1.0;
  objc_msgSend(v1, "setOpacity:", v2);

}

- (void)_showBroadcastingContent
{
  AKBringDeviceCloseMicaView *v3;
  AKBringDeviceCloseMicaView *proximityMicaView;
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[6];

  v24[5] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(AKBringDeviceCloseMicaView);
  proximityMicaView = self->_proximityMicaView;
  self->_proximityMicaView = v3;

  -[AKBringDeviceCloseMicaView setTranslatesAutoresizingMaskIntoConstraints:](self->_proximityMicaView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[AKProximityAuthViewController contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", self->_proximityMicaView);

  v17 = (void *)MEMORY[0x1E0CB3718];
  -[AKBringDeviceCloseMicaView heightAnchor](self->_proximityMicaView, "heightAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToConstant:", 250.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v22;
  -[AKBringDeviceCloseMicaView widthAnchor](self->_proximityMicaView, "widthAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToConstant:", 300.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v20;
  -[AKBringDeviceCloseMicaView centerXAnchor](self->_proximityMicaView, "centerXAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKProximityAuthViewController contentView](self, "contentView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "centerXAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:", v16);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v6;
  -[AKBringDeviceCloseMicaView topAnchor](self->_proximityMicaView, "topAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKProximityAuthViewController contentView](self, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "topAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintEqualToAnchor:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v24[3] = v10;
  -[AKBringDeviceCloseMicaView bottomAnchor](self->_proximityMicaView, "bottomAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKProximityAuthViewController contentView](self, "contentView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bottomAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:constant:", v13, -30.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v24[4] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "activateConstraints:", v15);

}

- (void)_showVisualPairingContent
{
  objc_class *VPPresenterViewClass;
  void *v4;
  NSString *verificationCode;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
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
  void *v52;
  void *v53;
  void *v54;
  _QWORD v55[7];

  v55[5] = *MEMORY[0x1E0C80C00];
  VPPresenterViewClass = (objc_class *)VisualPairingLibraryCore();
  if (VPPresenterViewClass)
    VPPresenterViewClass = (objc_class *)getVPPresenterViewClass();
  v4 = (void *)objc_msgSend([VPPresenterViewClass alloc], "initWithFrame:", 0.0, 0.0, 300.0, 300.0);
  -[AKProximityAuthViewController setVisualPairingView:](self, "setVisualPairingView:", v4);

  verificationCode = self->_verificationCode;
  -[AKProximityAuthViewController visualPairingView](self, "visualPairingView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setVerificationCode:", verificationCode);

  -[AKProximityAuthViewController visualPairingView](self, "visualPairingView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[AKProximityAuthViewController _pairingBackgroundColor](self, "_pairingBackgroundColor");
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v9 = objc_msgSend(v8, "CGColor");
  -[AKProximityAuthViewController visualPairingView](self, "visualPairingView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setBackgroundColor:", v9);

  v12 = -[AKProximityAuthViewController _pairingFlags](self, "_pairingFlags");
  -[AKProximityAuthViewController visualPairingView](self, "visualPairingView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFlags:", v12);

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", CFSTR("/System/Library/PrivateFrameworks/AuthKitUI.framework"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1E0CEA638];
  objc_msgSend(v54, "pathForResource:ofType:", CFSTR("ProximityPairingMask"), CFSTR(".png"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "imageWithContentsOfFile:", v15);
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithImage:", v53);
  objc_msgSend(v16, "setContentMode:", 1);
  v52 = v16;
  objc_msgSend(v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v18 = objc_msgSend(v17, "CGColor");
  -[AKProximityAuthViewController contentView](self, "contentView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "layer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setBackgroundColor:", v18);

  -[AKProximityAuthViewController visualPairingView](self, "visualPairingView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setMaskView:", v16);

  -[AKProximityAuthViewController _createPlayer](self, "_createPlayer");
  -[AKProximityAuthViewController setRetryAttempts:](self, "setRetryAttempts:", 0);
  -[AKProximityAuthViewController _addPlayer](self, "_addPlayer");
  -[AKProximityAuthViewController visualPairingView](self, "visualPairingView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "layer");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v24) = 1008981770;
  objc_msgSend(v23, "setOpacity:", v24);

  -[AKProximityAuthViewController contentView](self, "contentView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKProximityAuthViewController visualPairingView](self, "visualPairingView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addSubview:", v26);

  v42 = (void *)MEMORY[0x1E0CB3718];
  -[AKProximityAuthViewController visualPairingView](self, "visualPairingView");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "topAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKProximityAuthViewController contentView](self, "contentView");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "topAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "constraintEqualToAnchor:constant:", v48, 20.0);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v55[0] = v47;
  -[AKProximityAuthViewController visualPairingView](self, "visualPairingView");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "bottomAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKProximityAuthViewController contentView](self, "contentView");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "bottomAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "constraintEqualToAnchor:constant:", v43, -30.0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v55[1] = v41;
  -[AKProximityAuthViewController visualPairingView](self, "visualPairingView");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "heightAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "constraintEqualToConstant:", 300.0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v55[2] = v38;
  -[AKProximityAuthViewController visualPairingView](self, "visualPairingView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "widthAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToConstant:", 300.0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v55[3] = v29;
  -[AKProximityAuthViewController visualPairingView](self, "visualPairingView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "centerXAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKProximityAuthViewController contentView](self, "contentView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "centerXAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "constraintEqualToAnchor:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v55[4] = v34;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 5);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "activateConstraints:", v35);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "addObserver:selector:name:object:", self, sel_didBecomeActive_, *MEMORY[0x1E0CEB270], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "addObserver:selector:name:object:", self, sel_willResignActive_, *MEMORY[0x1E0CEB358], 0);

}

- (void)_showPinCode
{
  id v3;
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
  NSString *verificationCode;
  void *v15;
  void *v16;
  double v17;
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
  _QWORD v43[7];

  v43[5] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0CEA700]);
  v4 = (void *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[AKProximityAuthViewController setPinCodeLabel:](self, "setPinCodeLabel:", v4);

  -[AKProximityAuthViewController pinCodeLabel](self, "pinCodeLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNumberOfLines:", 0);

  objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKProximityAuthViewController pinCodeLabel](self, "pinCodeLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTextColor:", v6);

  objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKProximityAuthViewController pinCodeLabel](self, "pinCodeLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBackgroundColor:", v8);

  objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB5A8]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKProximityAuthViewController pinCodeLabel](self, "pinCodeLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFont:", v10);

  -[AKProximityAuthViewController pinCodeLabel](self, "pinCodeLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTextAlignment:", 1);

  -[AKProximityAuthViewController pinCodeLabel](self, "pinCodeLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  verificationCode = self->_verificationCode;
  -[AKProximityAuthViewController pinCodeLabel](self, "pinCodeLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setText:", verificationCode);

  -[AKProximityAuthViewController pinCodeLabel](self, "pinCodeLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v17) = 1148846080;
  objc_msgSend(v16, "setContentHuggingPriority:forAxis:", 1, v17);

  -[AKProximityAuthViewController contentView](self, "contentView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKProximityAuthViewController pinCodeLabel](self, "pinCodeLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addSubview:", v19);

  v33 = (void *)MEMORY[0x1E0CB3718];
  -[AKProximityAuthViewController pinCodeLabel](self, "pinCodeLabel");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "heightAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "constraintEqualToConstant:", 250.0);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = v40;
  -[AKProximityAuthViewController pinCodeLabel](self, "pinCodeLabel");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "widthAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraintEqualToConstant:", 300.0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v43[1] = v37;
  -[AKProximityAuthViewController pinCodeLabel](self, "pinCodeLabel");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "centerXAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKProximityAuthViewController contentView](self, "contentView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "centerXAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintEqualToAnchor:", v32);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v43[2] = v31;
  -[AKProximityAuthViewController pinCodeLabel](self, "pinCodeLabel");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "topAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKProximityAuthViewController contentView](self, "contentView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "topAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v43[3] = v23;
  -[AKProximityAuthViewController pinCodeLabel](self, "pinCodeLabel");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "bottomAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKProximityAuthViewController contentView](self, "contentView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "bottomAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToAnchor:constant:", v27, -30.0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v43[4] = v28;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 5);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "activateConstraints:", v29);

}

- (void)_addPrivacyLinkController
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  -[AKProximityAuthViewController viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "type");

  -[AKProximityAuthViewController buttonTray](self, "buttonTray");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  if (v4)
  {
    objc_msgSend(v5, "setPrivacyLinkController:", 0);

  }
  else
  {
    v8[0] = CFSTR("com.apple.onboarding.appleid");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPrivacyLinkForBundles:", v6);

  }
}

- (id)cancelAction
{
  return self->_cancelAction;
}

- (void)setCancelAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1184);
}

- (id)primaryButtonAction
{
  return self->_primaryButtonAction;
}

- (void)setPrimaryButtonAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1192);
}

- (id)alternateButtonAction
{
  return self->_alternateButtonAction;
}

- (void)setAlternateButtonAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1200);
}

- (id)deallocAction
{
  return self->_deallocAction;
}

- (void)setDeallocAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1208);
}

- (NSString)verificationCode
{
  return self->_verificationCode;
}

- (void)setVerificationCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1216);
}

- (AKProximityViewDelegate)delegate
{
  return (AKProximityViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OBTrayButton)primaryButton
{
  return self->_primaryButton;
}

- (void)setPrimaryButton:(id)a3
{
  objc_storeStrong((id *)&self->_primaryButton, a3);
}

- (OBTrayButton)secondaryButton
{
  return self->_secondaryButton;
}

- (void)setSecondaryButton:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryButton, a3);
}

- (AKProximityMessageViewModel)viewModel
{
  return self->_viewModel;
}

- (void)setViewModel:(id)a3
{
  objc_storeStrong((id *)&self->_viewModel, a3);
}

- (VPPresenterView)visualPairingView
{
  return self->_visualPairingView;
}

- (void)setVisualPairingView:(id)a3
{
  objc_storeStrong((id *)&self->_visualPairingView, a3);
}

- (UILabel)pinCodeLabel
{
  return self->_pinCodeLabel;
}

- (void)setPinCodeLabel:(id)a3
{
  objc_storeStrong((id *)&self->_pinCodeLabel, a3);
}

- (AVPlayer)videoPlayer
{
  return self->_videoPlayer;
}

- (void)setVideoPlayer:(id)a3
{
  objc_storeStrong((id *)&self->_videoPlayer, a3);
}

- (AVPlayerViewController)videoViewController
{
  return self->_videoViewController;
}

- (void)setVideoViewController:(id)a3
{
  objc_storeStrong((id *)&self->_videoViewController, a3);
}

- (AKBringDeviceCloseMicaView)proximityMicaView
{
  return self->_proximityMicaView;
}

- (void)setProximityMicaView:(id)a3
{
  objc_storeStrong((id *)&self->_proximityMicaView, a3);
}

- (AKAppleLogoMicaView)appleLogoMicaView
{
  return self->_appleLogoMicaView;
}

- (void)setAppleLogoMicaView:(id)a3
{
  objc_storeStrong((id *)&self->_appleLogoMicaView, a3);
}

- (UIView)logoContainerView
{
  return self->_logoContainerView;
}

- (void)setLogoContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_logoContainerView, a3);
}

- (BOOL)_started
{
  return self->__started;
}

- (void)set_started:(BOOL)a3
{
  self->__started = a3;
}

- (int64_t)retryAttempts
{
  return self->_retryAttempts;
}

- (void)setRetryAttempts:(int64_t)a3
{
  self->_retryAttempts = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logoContainerView, 0);
  objc_storeStrong((id *)&self->_appleLogoMicaView, 0);
  objc_storeStrong((id *)&self->_proximityMicaView, 0);
  objc_storeStrong((id *)&self->_videoViewController, 0);
  objc_storeStrong((id *)&self->_videoPlayer, 0);
  objc_storeStrong((id *)&self->_pinCodeLabel, 0);
  objc_storeStrong((id *)&self->_visualPairingView, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_secondaryButton, 0);
  objc_storeStrong((id *)&self->_primaryButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_verificationCode, 0);
  objc_storeStrong(&self->_deallocAction, 0);
  objc_storeStrong(&self->_alternateButtonAction, 0);
  objc_storeStrong(&self->_primaryButtonAction, 0);
  objc_storeStrong(&self->_cancelAction, 0);
}

- (void)_currentPairingMovieURL
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1BD795000, log, OS_LOG_TYPE_ERROR, "Pairing movie player does not contain a URL asset.", v1, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)_primaryFallbackButtonSelected:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1BD795000, a1, a3, "User selected the primary fallback for prox auth...", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)_secondaryFallbackButtonSelected:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1BD795000, a1, a3, "User selected the secondary fallback for prox auth...", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

@end
