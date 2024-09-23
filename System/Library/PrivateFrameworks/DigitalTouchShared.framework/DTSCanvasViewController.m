@implementation DTSCanvasViewController

+ (id)replayButtonFont
{
  return (id)objc_msgSend(MEMORY[0x24BDF6A70], "boldSystemFontOfSize:", 19.0);
}

+ (id)audioToggleOnImage
{
  if (audioToggleOnImage_onceToken != -1)
    dispatch_once(&audioToggleOnImage_onceToken, &__block_literal_global_7);
  return (id)audioToggleOnImage_image;
}

void __45__DTSCanvasViewController_audioToggleOnImage__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = (void *)MEMORY[0x24BDF6AC8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "imageNamed:inBundle:", CFSTR("AudioOn"), v3);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)audioToggleOnImage_image;
  audioToggleOnImage_image = v1;

}

+ (id)audioToggleOffImage
{
  if (audioToggleOffImage_onceToken != -1)
    dispatch_once(&audioToggleOffImage_onceToken, &__block_literal_global_37);
  return (id)audioToggleOffImage_image;
}

void __46__DTSCanvasViewController_audioToggleOffImage__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = (void *)MEMORY[0x24BDF6AC8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "imageNamed:inBundle:", CFSTR("AudioOff"), v3);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)audioToggleOffImage_image;
  audioToggleOffImage_image = v1;

}

- (DTSCanvasViewController)init
{
  DTSCanvasViewController *v2;
  ETCanvasView *v3;
  ETCanvasView *canvasView;
  uint64_t v5;
  NSMutableArray *unplayedMessages;
  void *v7;
  uint64_t v8;
  UIButton *replayButton;
  UIButton *v10;
  void *v11;
  double v12;
  uint64_t v13;
  UIButton *audioToggleButton;
  UIButton *v15;
  void *v16;
  double v17;
  uint64_t v18;
  UIButton *cancelButton;
  UIButton *v20;
  void *v21;
  double v22;
  uint64_t v23;
  UIButton *skipButton;
  UIButton *v25;
  void *v26;
  double v27;
  DTSCanvasViewController *v28;
  objc_super v30;

  v30.receiver = self;
  v30.super_class = (Class)DTSCanvasViewController;
  v2 = -[DTSCanvasViewController init](&v30, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(ETCanvasView);
    canvasView = v2->_canvasView;
    v2->_canvasView = v3;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v5 = objc_claimAutoreleasedReturnValue();
    unplayedMessages = v2->_unplayedMessages;
    v2->_unplayedMessages = (NSMutableArray *)v5;

    -[DTSCanvasViewController setComposingMessageType:](v2, "setComposingMessageType:", 0xFFFFLL);
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6880], "buttonWithType:", 1);
    v8 = objc_claimAutoreleasedReturnValue();
    replayButton = v2->_replayButton;
    v2->_replayButton = (UIButton *)v8;

    -[UIButton addTarget:action:forControlEvents:](v2->_replayButton, "addTarget:action:forControlEvents:", v2, sel_replay, 64);
    v10 = v2->_replayButton;
    objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:", CFSTR("Replay"), v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setBackgroundImage:forState:](v10, "setBackgroundImage:forState:", v11, 0);

    -[UIButton sizeToFit](v2->_replayButton, "sizeToFit");
    -[UIButton setAlpha:](v2->_replayButton, "setAlpha:", 0.0);
    LODWORD(v12) = -1093874483;
    -[UIButton setCharge:](v2->_replayButton, "setCharge:", v12);
    objc_msgSend(MEMORY[0x24BDF6880], "buttonWithType:", 1);
    v13 = objc_claimAutoreleasedReturnValue();
    audioToggleButton = v2->_audioToggleButton;
    v2->_audioToggleButton = (UIButton *)v13;

    v15 = v2->_audioToggleButton;
    +[DTSCanvasViewController audioToggleOffImage](DTSCanvasViewController, "audioToggleOffImage");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setBackgroundImage:forState:](v15, "setBackgroundImage:forState:", v16, 0);

    -[UIButton addTarget:action:forControlEvents:](v2->_audioToggleButton, "addTarget:action:forControlEvents:", v2, sel__audioToggleButtonTapped, 64);
    LODWORD(v17) = -1093874483;
    -[UIButton setCharge:](v2->_audioToggleButton, "setCharge:", v17);
    -[UIButton setAlpha:](v2->_audioToggleButton, "setAlpha:", 0.0);
    -[UIButton sizeToFit](v2->_audioToggleButton, "sizeToFit");
    objc_msgSend(MEMORY[0x24BDF6880], "buttonWithType:", 1);
    v18 = objc_claimAutoreleasedReturnValue();
    cancelButton = v2->_cancelButton;
    v2->_cancelButton = (UIButton *)v18;

    -[UIButton addTarget:action:forControlEvents:](v2->_cancelButton, "addTarget:action:forControlEvents:", v2, sel__cancelButtonTapped, 64);
    v20 = v2->_cancelButton;
    objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:", CFSTR("Cancel"), v7);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setBackgroundImage:forState:](v20, "setBackgroundImage:forState:", v21, 0);

    -[UIButton sizeToFit](v2->_cancelButton, "sizeToFit");
    -[UIButton setAlpha:](v2->_cancelButton, "setAlpha:", 0.0);
    LODWORD(v22) = -1093874483;
    -[UIButton setCharge:](v2->_cancelButton, "setCharge:", v22);
    objc_msgSend(MEMORY[0x24BDF6880], "buttonWithType:", 1);
    v23 = objc_claimAutoreleasedReturnValue();
    skipButton = v2->_skipButton;
    v2->_skipButton = (UIButton *)v23;

    -[UIButton addTarget:action:forControlEvents:](v2->_skipButton, "addTarget:action:forControlEvents:", v2, sel__skipButtonTapped, 64);
    v25 = v2->_skipButton;
    objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:", CFSTR("Skip"), v7);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setBackgroundImage:forState:](v25, "setBackgroundImage:forState:", v26, 0);

    -[UIButton sizeToFit](v2->_skipButton, "sizeToFit");
    -[UIButton setAlpha:](v2->_skipButton, "setAlpha:", 0.0);
    LODWORD(v27) = -1093874483;
    -[UIButton setCharge:](v2->_skipButton, "setCharge:", v27);
    v28 = v2;

  }
  return v2;
}

- (void)setDataSource:(id)a3
{
  ETBalloonPluginDataSource **p_dataSource;
  id WeakRetained;

  p_dataSource = &self->_dataSource;
  objc_storeWeak((id *)&self->_dataSource, a3);
  if (!a3)
  {
    -[DTSCanvasViewController _sendAutosendingComposition](self, "_sendAutosendingComposition");
    -[DTSCanvasViewController setPlaybackEnabled:](self, "setPlaybackEnabled:", 0);
  }
  WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  objc_msgSend(WeakRetained, "setDelegate:", self);

}

- (BOOL)shouldAutorotate
{
  return 0;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (void)viewDidLoad
{
  void *v3;
  DTSColorPicker *v4;
  DTSColorPicker *colorPicker;
  DTSColorPicker *v6;
  ETCanvasView *canvasView;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)DTSCanvasViewController;
  -[DTSCanvasViewController viewDidLoad](&v9, sel_viewDidLoad);
  -[DTSCanvasViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityIgnoresInvertColors:", 1);
  objc_msgSend(v3, "addSubview:", self->_canvasView);
  -[ETCanvasView setCanvasDelegate:](self->_canvasView, "setCanvasDelegate:", self);
  -[DTSCanvasViewController colorPicker](self, "colorPicker");
  v4 = (DTSColorPicker *)objc_claimAutoreleasedReturnValue();
  colorPicker = self->_colorPicker;
  self->_colorPicker = v4;

  v6 = self->_colorPicker;
  if (v6)
  {
    -[DTSColorPicker setDelegate:](v6, "setDelegate:", self);
    objc_msgSend(v3, "addSubview:", self->_colorPicker);
    canvasView = self->_canvasView;
    -[DTSColorPicker selectedColor](self->_colorPicker, "selectedColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ETCanvasView setDrawingColor:](canvasView, "setDrawingColor:", v8);

  }
  objc_msgSend(v3, "insertSubview:above:", self->_audioToggleButton, self->_canvasView);
  objc_msgSend(v3, "addSubview:", self->_cancelButton);
  objc_msgSend(v3, "addSubview:", self->_skipButton);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v7;

  if (!self->_ignoreAppearanceCallbacks)
  {
    v7.receiver = self;
    v7.super_class = (Class)DTSCanvasViewController;
    -[DTSCanvasViewController viewDidAppear:](&v7, sel_viewDidAppear_, a3);
    if (-[DTSCanvasViewController _canComposeAfterMediaPlayback](self, "_canComposeAfterMediaPlayback"))
    {
      objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "applicationState");

      if (!v5)
        +[ETGLSketchRenderer warmupShaders](ETGLSketchRenderer, "warmupShaders");
    }
    -[DTSCanvasViewController setComposingMessageType:](self, "setComposingMessageType:", 0xFFFFLL);
    if (!self->_autoPlayOnAppearanceDisabled
      && !-[DTSCanvasViewController usesCompactKeyboardLayout](self, "usesCompactKeyboardLayout"))
    {
      -[DTSCanvasViewController setPlaybackEnabled:](self, "setPlaybackEnabled:", 1);
      -[DTSCanvasViewController startMessagePlaybackLoop](self, "startMessagePlaybackLoop");
    }
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__applicationWillResignActive, *MEMORY[0x24BDF75D8], 0);
    objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__applicationDidBecomeActive, *MEMORY[0x24BDF7510], 0);
    objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__applicationDidEnterBackground, *MEMORY[0x24BDF7528], 0);

  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  if (!self->_ignoreAppearanceCallbacks)
  {
    v5.receiver = self;
    v5.super_class = (Class)DTSCanvasViewController;
    -[DTSCanvasViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, a3);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:", self);

    -[DTSCanvasViewController setPlaybackEnabled:](self, "setPlaybackEnabled:", 0);
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)DTSCanvasViewController;
  -[DTSCanvasViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[DTSCanvasViewController _sendAutosendingComposition](self, "_sendAutosendingComposition");
  -[ETCanvasView clearCanvasAnimated:](self->_canvasView, "clearCanvasAnimated:", 0);
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DTSCanvasViewController;
  -[DTSCanvasViewController viewWillLayoutSubviews](&v5, sel_viewWillLayoutSubviews);
  -[DTSCanvasViewController canvasView](self, "canvasView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DTSCanvasViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  objc_msgSend(v3, "setFrame:");

}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DTSCanvasViewController;
  -[DTSCanvasViewController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  -[DTSCanvasViewController _updateVideoPlayerUI](self, "_updateVideoPlayerUI");
}

- (BOOL)canExpireMessages
{
  return 0;
}

- (void)_updateVideoPlayerUI
{
  -[DTSCanvasViewController _updatePlaybackControls](self, "_updatePlaybackControls");
  -[DTSCanvasViewController _updateAudioOnOffButton](self, "_updateAudioOnOffButton");
}

- (BOOL)_shouldShowSkipButton
{
  id WeakRetained;
  char v4;

  if (!self->_playingMessages || self->_composingCompositeMessage || self->_playingCompositeMessage)
    return 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  v4 = objc_msgSend(WeakRetained, "sessionHasMultipleMessages");

  return v4;
}

- (BOOL)_shouldShowCancelButton
{
  return -[ETCanvasView usesMediaAppearance](self->_canvasView, "usesMediaAppearance");
}

- (double)_cornerButtonInset
{
  void *v2;
  double v3;
  double v4;

  -[ETCanvasView layer](self->_canvasView, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cornerRadius");
  v4 = v3 * 0.5;

  return v4;
}

- (void)_updateSkipButtonFrame
{
  UIButton *skipButton;
  void *v4;
  UIButton *v5;

  skipButton = self->_skipButton;
  -[DTSCanvasViewController _cancelButton](self, "_cancelButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  -[UIButton setFrame:](skipButton, "setFrame:");

  v5 = self->_skipButton;
  -[DTSColorPicker center](self->_colorPicker, "center");
  -[UIButton setCenter:](v5, "setCenter:");
}

- (void)_updatePlaybackControls
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  _BOOL4 v14;
  _BOOL4 v15;
  double v16;
  void *v17;
  id v18;

  -[ETCanvasView frame](self->_canvasView, "frame");
  v4 = v3;
  v6 = v5;
  -[DTSCanvasViewController _cancelButton](self, "_cancelButton");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "frame");
  v8 = v7;
  v10 = v9;
  -[DTSCanvasViewController _cornerButtonInset](self, "_cornerButtonInset");
  v12 = v4 + v11;
  -[DTSCanvasViewController _cornerButtonInset](self, "_cornerButtonInset");
  objc_msgSend(v18, "setFrame:", v12, v6 + v13, v8, v10);
  v14 = -[DTSCanvasViewController _shouldShowCancelButton](self, "_shouldShowCancelButton");
  v15 = -[ETCanvasView usesMediaAppearance](self->_canvasView, "usesMediaAppearance");
  v16 = 0.4;
  if (v15)
    v16 = 1.0;
  if (!v14)
    v16 = 0.0;
  objc_msgSend(v18, "setAlpha:", v16);
  -[UIButton setAlpha:](self->_skipButton, "setAlpha:", (double)-[DTSCanvasViewController _shouldShowSkipButton](self, "_shouldShowSkipButton"));
  -[DTSCanvasViewController _updateSkipButtonFrame](self, "_updateSkipButtonFrame");
  -[DTSCanvasViewController _replayButton](self, "_replayButton");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setEnabled:", -[DTSCanvasViewController canReplay](self, "canReplay"));

  -[DTSCanvasViewController _setShowingReplayButton:](self, "_setShowingReplayButton:", -[DTSCanvasViewController canShowReplayButton](self, "canShowReplayButton"));
}

- (id)_audioToggleButton
{
  return self->_audioToggleButton;
}

- (void)_updateAudioOnOffButton
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double MinY;
  double v19;
  int v20;
  double v21;
  _QWORD v22[5];
  char v23;
  CGRect v24;
  CGRect v25;

  -[ETCanvasView frame](self->_canvasView, "frame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIButton frame](self->_audioToggleButton, "frame");
  v12 = v11;
  v14 = v13;
  v24.origin.x = v4;
  v24.origin.y = v6;
  v24.size.width = v8;
  v24.size.height = v10;
  v15 = CGRectGetMaxX(v24) - v12;
  -[DTSCanvasViewController _rightButtonInset](self, "_rightButtonInset");
  v17 = v15 - v16;
  v25.origin.x = v4;
  v25.origin.y = v6;
  v25.size.width = v8;
  v25.size.height = v10;
  MinY = CGRectGetMinY(v25);
  -[DTSCanvasViewController _cornerButtonInset](self, "_cornerButtonInset");
  -[UIButton setFrame:](self->_audioToggleButton, "setFrame:", v17, MinY + v19, v12, v14);
  if (self->_composingCompositeMessage || !self->_videoPlayer)
  {
    v20 = 0;
  }
  else
  {
    -[DTSCanvasViewController _updateAudioOnOffButtonImage](self, "_updateAudioOnOffButtonImage");
    v20 = 1;
  }
  -[UIButton alpha](self->_audioToggleButton, "alpha");
  if (((v20 ^ (v21 == 0.0)) & 1) == 0)
  {
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __50__DTSCanvasViewController__updateAudioOnOffButton__block_invoke;
    v22[3] = &unk_24F6E73A0;
    v22[4] = self;
    v23 = v20;
    objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:animations:", v22, 0.25);
  }
}

uint64_t __50__DTSCanvasViewController__updateAudioOnOffButton__block_invoke(uint64_t a1)
{
  double v1;

  v1 = 0.0;
  if (*(_BYTE *)(a1 + 40))
    v1 = 1.0;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1024), "setAlpha:", v1);
}

- (void)_updateAudioOnOffButtonImage
{
  AVPlayer *videoPlayer;
  uint64_t v4;
  id v5;

  videoPlayer = self->_videoPlayer;
  if (videoPlayer && !-[AVPlayer isMuted](videoPlayer, "isMuted"))
  {
    +[DTSCanvasViewController audioToggleOnImage](DTSCanvasViewController, "audioToggleOnImage");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[DTSCanvasViewController audioToggleOffImage](DTSCanvasViewController, "audioToggleOffImage");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (id)v4;
  -[UIButton setBackgroundImage:forState:](self->_audioToggleButton, "setBackgroundImage:forState:", v4, 0);

}

- (void)_relinquishAudio
{
  NSObject *v2;

  dispatch_get_global_queue(-32768, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v2, &__block_literal_global_79);

}

void __43__DTSCanvasViewController__relinquishAudio__block_invoke()
{
  void *v0;
  id v1;
  NSObject *v2;
  id v3;
  uint8_t buf[4];
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDB1858], "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 0;
  objc_msgSend(v0, "setActive:withOptions:error:", 0, 1, &v3);
  v1 = v3;

  if (v1 && IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v5 = v1;
      _os_log_impl(&dword_22C68B000, v2, OS_LOG_TYPE_INFO, "Failed to deactivate audio and notify others of deactivation with error: %@", buf, 0xCu);
    }

  }
}

- (void)_audioToggleButtonTapped
{
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD block[5];

  v3 = -[AVPlayer isMuted](self->_videoPlayer, "isMuted") ^ 1;
  -[AVPlayer setMuted:](self->_videoPlayer, "setMuted:", v3);
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:forKey:", v5, CFSTR("ETVideoAudioOffPreference"));

  -[DTSCanvasViewController _updateAudioOnOffButtonImage](self, "_updateAudioOnOffButtonImage");
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__DTSCanvasViewController__audioToggleButtonTapped__block_invoke;
  block[3] = &unk_24F6E6A98;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __51__DTSCanvasViewController__audioToggleButtonTapped__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1016), "isMuted");
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "_relinquishAudio");
  return result;
}

- (void)_applicationWillResignActive
{
  -[DTSCanvasViewController _sendAutosendingComposition](self, "_sendAutosendingComposition");
  -[ETCanvasView setPaused:](self->_canvasView, "setPaused:", 1);
}

- (void)_sendAutosendingComposition
{
  if (-[ETCanvasView isComposing](self->_canvasView, "isComposing"))
  {
    if (-[DTSCanvasViewController _shouldAutoSend](self, "_shouldAutoSend"))
      -[ETCanvasView sendCurrentMessage](self->_canvasView, "sendCurrentMessage");
  }
}

- (void)_applicationDidBecomeActive
{
  id v2;

  -[DTSCanvasViewController canvasView](self, "canvasView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlwaysPaused:", 0);

}

- (void)_applicationDidEnterBackground
{
  -[DTSCanvasViewController setPlaybackEnabled:](self, "setPlaybackEnabled:", 0);
  -[ETCanvasView setAlwaysPaused:](self->_canvasView, "setAlwaysPaused:", 1);
  -[ETCanvasView setPaused:](self->_canvasView, "setPaused:", 1);
  -[DTSCanvasViewController _sendAutosendingComposition](self, "_sendAutosendingComposition");
  -[ETCanvasView clearCanvasAnimated:](self->_canvasView, "clearCanvasAnimated:", 0);
}

- (void)addUnplayedMessage:(id)a3
{
  id v4;
  int v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  int v10;
  id v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = IMOSLoggingEnabled();
  if (v4)
  {
    if (v5)
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v4, "identifier");
        v7 = (id)objc_claimAutoreleasedReturnValue();
        v8 = -[NSMutableArray count](self->_unplayedMessages, "count");
        v10 = 138412546;
        v11 = v7;
        v12 = 2048;
        v13 = v8;
        _os_log_impl(&dword_22C68B000, v6, OS_LOG_TYPE_INFO, "Adding to session unplayed message ID: %@, total count: %lu", (uint8_t *)&v10, 0x16u);

      }
    }
    -[NSMutableArray addObject:](self->_unplayedMessages, "addObject:", v4);
    -[DTSCanvasViewController startMessagePlaybackLoop](self, "startMessagePlaybackLoop");
  }
  else if (v5)
  {
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_22C68B000, v9, OS_LOG_TYPE_INFO, "Not adding nil message", (uint8_t *)&v10, 2u);
    }

  }
}

- (void)replay
{
  if (self->_playingCompositeMessage)
  {
    -[DTSCanvasViewController setPlayingMessage:](self, "setPlayingMessage:", self->_messageForReplay);
  }
  else
  {
    -[DTSCanvasViewController _reloadUnplayedMessages](self, "_reloadUnplayedMessages");
    -[DTSCanvasViewController startMessagePlaybackLoop](self, "startMessagePlaybackLoop");
  }
}

- (BOOL)canReplay
{
  _BOOL4 v3;
  void *v4;

  if (self->_messageForReplay && !self->_isPlayingMessage)
  {
    -[DTSCanvasViewController canvasView](self, "canvasView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "isComposing") & 1) != 0)
      LOBYTE(v3) = 0;
    else
      v3 = !-[DTSCanvasViewController isPlayingMessages](self, "isPlayingMessages");

  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (BOOL)hasMessageForReplay
{
  return self->_messageForReplay != 0;
}

- (void)_setCachedMessageForReplay:(id)a3
{
  ETMessage *v4;
  ETMessage *messageForReplay;

  v4 = (ETMessage *)a3;
  -[ETMessage wispChildren](self->_messageForReplay, "wispChildren");
  messageForReplay = self->_messageForReplay;
  self->_messageForReplay = v4;

  -[DTSCanvasViewController _updatePlaybackControls](self, "_updatePlaybackControls");
}

- (void)setComposingCompositeMessage:(BOOL)a3
{
  id v4;

  if (self->_composingCompositeMessage != a3)
  {
    self->_composingCompositeMessage = a3;
    if (!a3)
    {
      -[DTSCanvasViewController canvasView](self, "canvasView");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "endMessageComposition");
      objc_msgSend(v4, "clearCanvasAnimated:", 0);
      -[NSMutableArray removeAllObjects](self->_unplayedMessages, "removeAllObjects");
      -[ETMessage stopPlaying](self->_playingMessage, "stopPlaying");
      -[DTSCanvasViewController _hideVideoPlayer](self, "_hideVideoPlayer");
      -[ETCanvasView hidePhoto](self->_canvasView, "hidePhoto");
      -[DTSCanvasViewController _updateColorPickerEnabled](self, "_updateColorPickerEnabled");
      -[DTSCanvasViewController _updatePlaybackControls](self, "_updatePlaybackControls");
      -[DTSCanvasViewController updateVideoUI](self, "updateVideoUI");
      -[DTSCanvasViewController _setCachedMessageForReplay:](self, "_setCachedMessageForReplay:", 0);

    }
  }
}

- (void)setPlayingMessage:(id)a3
{
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[5];

  v7 = a3;
  objc_msgSend(v7, "setMissedDuringPlayback:", 0);
  -[DTSCanvasViewController _setCachedMessageForReplay:](self, "_setCachedMessageForReplay:", v7);
  if (!v7 || objc_msgSend(v7, "messageType") != 8)
  {
    -[DTSCanvasViewController _hideVideoPlayer](self, "_hideVideoPlayer");
    v4 = 0;
LABEL_8:
    -[ETCanvasView hidePhoto](self->_canvasView, "hidePhoto");
    goto LABEL_9;
  }
  if (objc_msgSend(v7, "mediaType") != 1)
    -[DTSCanvasViewController _hideVideoPlayer](self, "_hideVideoPlayer");
  v4 = 1;
  if (objc_msgSend(v7, "mediaType") != 2)
    goto LABEL_8;
LABEL_9:
  -[DTSCanvasViewController canvasView](self, "canvasView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUsesMediaAppearance:", v4);
  if ((_DWORD)v4)
    v6 = v7;
  else
    v6 = 0;
  objc_msgSend(v5, "setParentMessage:", v6);
  if (v7)
    -[DTSCanvasViewController _playMessage:](self, "_playMessage:", v7);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __45__DTSCanvasViewController_setPlayingMessage___block_invoke;
  v8[3] = &unk_24F6E6A98;
  v8[4] = self;
  objc_msgSend(MEMORY[0x24BDF6F90], "performWithoutAnimation:", v8);

}

uint64_t __45__DTSCanvasViewController_setPlayingMessage___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updatePlaybackControls");
}

- (void)_playMessage:(id)a3
{
  ETMessage *v5;
  ETMessage **p_playingMessage;
  ETMessage *messageForReplay;
  ETMessage *v8;
  ETMessage *v9;
  ETCanvasView *canvasView;
  void *v11;
  ETMessage *v12;
  double v13;
  dispatch_time_t v14;
  ETMessage *v15;
  _QWORD block[4];
  ETMessage *v17;
  id v18;
  id location;

  v5 = (ETMessage *)a3;
  p_playingMessage = &self->_playingMessage;
  if (self->_playingMessage != v5
    && self->_playbackEnabled
    && -[DTSCanvasViewController _isVisible](self, "_isVisible"))
  {
    -[ETMessage setMissedDuringPlayback:](v5, "setMissedDuringPlayback:", 0);
    if (-[ETMessage messageType](v5, "messageType") == 8)
    {
      -[DTSCanvasViewController setPlayingCompositeMessage:](self, "setPlayingCompositeMessage:", 1);
      -[DTSCanvasViewController _setCachedMessageForReplay:](self, "_setCachedMessageForReplay:", v5);
    }
    objc_storeStrong((id *)&self->_playingMessage, a3);
    if (*p_playingMessage)
    {
      if (-[DTSCanvasViewController _isVisible](self, "_isVisible"))
      {
        if (!self->_isPlayingMessage
          || (messageForReplay = self->_messageForReplay,
              -[ETMessage parentMessage](v5, "parentMessage"),
              v8 = (ETMessage *)objc_claimAutoreleasedReturnValue(),
              v8,
              messageForReplay == v8))
        {
          if (-[ETMessage messageType](v5, "messageType") == 8)
          {
            -[ETCanvasView setUsesMediaAppearance:](self->_canvasView, "setUsesMediaAppearance:", 1);
            v9 = v5;
            if (-[ETMessage mediaType](v9, "mediaType") == 1)
            {
              -[DTSCanvasViewController _startVideoPlayerWithMessage:](self, "_startVideoPlayerWithMessage:", v9);
            }
            else if (-[ETMessage mediaType](v9, "mediaType") == 2)
            {
              canvasView = self->_canvasView;
              -[ETMessage stillImage](v9, "stillImage");
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              -[ETCanvasView showPhotoForImage:](canvasView, "showPhotoForImage:", v11);

              -[DTSCanvasViewController _schedulePlaybackOfCompositeMessageContent:](self, "_schedulePlaybackOfCompositeMessageContent:", v9);
            }

          }
          self->_isPlayingMessage = 1;
          -[DTSCanvasViewController _updateColorPickerEnabled](self, "_updateColorPickerEnabled");
          -[ETCanvasView playMessage:](self->_canvasView, "playMessage:", *p_playingMessage);
          if (!-[ETMessage isAnimated](v5, "isAnimated"))
          {
            v12 = *p_playingMessage;
            objc_initWeak(&location, self);
            -[DTSCanvasViewController _nonAnimatedMessagePlaybackDuration](self, "_nonAnimatedMessagePlaybackDuration");
            v14 = dispatch_time(0, (uint64_t)(v13 * 1000000000.0));
            block[0] = MEMORY[0x24BDAC760];
            block[1] = 3221225472;
            block[2] = __40__DTSCanvasViewController__playMessage___block_invoke;
            block[3] = &unk_24F6E73E8;
            objc_copyWeak(&v18, &location);
            v17 = v12;
            v15 = v12;
            dispatch_after(v14, MEMORY[0x24BDAC9B8], block);

            objc_destroyWeak(&v18);
            objc_destroyWeak(&location);
          }
        }
      }
    }
    else if (-[NSMutableArray count](self->_unplayedMessages, "count"))
    {
      -[DTSCanvasViewController startMessagePlaybackLoop](self, "startMessagePlaybackLoop");
    }
  }

}

void __40__DTSCanvasViewController__playMessage___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "messageForReplay");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);

  if (v3 == v4)
    objc_msgSend(*(id *)(a1 + 32), "stopPlaying");
}

- (void)setPlayingMessages:(BOOL)a3
{
  if (self->_playingMessages != a3)
  {
    self->_playingMessages = a3;
    -[DTSCanvasViewController _updateCanvasInteractionEnabled](self, "_updateCanvasInteractionEnabled");
  }
}

- (void)_schedulePlaybackOfCompositeMessageContent:(id)a3
{
  id v4;
  double Current;
  int v6;
  uint64_t v7;
  void *v8;
  dispatch_time_t v9;
  void *v10;
  void *v11;
  NSMutableArray *v12;
  NSMutableArray *unplayedMessages;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t i;
  void *v20;
  double v21;
  dispatch_time_t v22;
  dispatch_time_t v23;
  void *v24;
  _QWORD v25[6];
  _QWORD v26[7];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD block[5];
  id v32;
  double v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  Current = CFAbsoluteTimeGetCurrent();
  self->_mediaMessagePlayTrackerTime = Current;
  v6 = objc_msgSend(v4, "messageType");
  v7 = MEMORY[0x24BDAC760];
  if (v6 == 8)
  {
    objc_msgSend(v4, "introMessage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = dispatch_time(0, 0);
      block[0] = v7;
      block[1] = 3221225472;
      block[2] = __70__DTSCanvasViewController__schedulePlaybackOfCompositeMessageContent___block_invoke;
      block[3] = &unk_24F6E6EB8;
      block[4] = self;
      v33 = Current;
      v32 = v8;
      dispatch_after(v9, MEMORY[0x24BDAC9B8], block);

    }
  }
  v10 = (void *)MEMORY[0x24BDBCEB8];
  objc_msgSend(v4, "playingMessages");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "arrayWithArray:", v11);
  v12 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  unplayedMessages = self->_unplayedMessages;
  self->_unplayedMessages = v12;

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v24 = v4;
  objc_msgSend(v4, "playingMessages");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v34, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v28;
    v18 = MEMORY[0x24BDAC9B8];
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v28 != v17)
          objc_enumerationMutation(v14);
        v20 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v20, "startDelay");
        v22 = dispatch_time(0, (uint64_t)(v21 * 1000000000.0));
        v26[0] = v7;
        v26[1] = 3221225472;
        v26[2] = __70__DTSCanvasViewController__schedulePlaybackOfCompositeMessageContent___block_invoke_2;
        v26[3] = &unk_24F6E6EB8;
        *(double *)&v26[6] = Current;
        v26[4] = self;
        v26[5] = v20;
        dispatch_after(v22, v18, v26);
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v34, 16);
    }
    while (v16);
  }

  v23 = dispatch_time(0, 0);
  v25[0] = v7;
  v25[1] = 3221225472;
  v25[2] = __70__DTSCanvasViewController__schedulePlaybackOfCompositeMessageContent___block_invoke_3;
  v25[3] = &unk_24F6E7410;
  v25[4] = self;
  *(double *)&v25[5] = Current;
  dispatch_after(v23, MEMORY[0x24BDAC9B8], v25);

}

double *__70__DTSCanvasViewController__schedulePlaybackOfCompositeMessageContent___block_invoke(uint64_t a1)
{
  double *result;

  result = *(double **)(a1 + 32);
  if (result[134] == *(double *)(a1 + 48))
    return (double *)objc_msgSend(result, "_playMessage:", *(_QWORD *)(a1 + 40));
  return result;
}

double *__70__DTSCanvasViewController__schedulePlaybackOfCompositeMessageContent___block_invoke_2(uint64_t a1)
{
  double *result;

  result = *(double **)(a1 + 32);
  if (result[134] == *(double *)(a1 + 48))
    return (double *)objc_msgSend(result, "_playMessage:", *(_QWORD *)(a1 + 40));
  return result;
}

double *__70__DTSCanvasViewController__schedulePlaybackOfCompositeMessageContent___block_invoke_3(uint64_t a1)
{
  double *result;

  result = *(double **)(a1 + 32);
  if (result[134] == *(double *)(a1 + 40))
    return (double *)objc_msgSend(result, "willBeginSessionPlayback");
  return result;
}

- (BOOL)_isVisible
{
  void *v3;
  void *v4;
  BOOL v5;

  if (!-[DTSCanvasViewController isViewLoaded](self, "isViewLoaded"))
    return 0;
  -[DTSCanvasViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

- (BOOL)_shouldDimColorPicker
{
  return -[DTSCanvasViewController isPlayingCompositeMessage](self, "isPlayingCompositeMessage")
      || self->_isPlayingMessage
      || -[DTSCanvasViewController isPlayingMessages](self, "isPlayingMessages");
}

- (void)_updateColorPickerEnabled
{
  id v3;

  -[DTSCanvasViewController colorPicker](self, "colorPicker");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDimmed:", -[DTSCanvasViewController _shouldDimColorPicker](self, "_shouldDimColorPicker"));

}

- (BOOL)_shouldAutoSend
{
  return !self->_composingCompositeMessage;
}

- (BOOL)usesCompactKeyboardLayout
{
  return 0;
}

- (void)setComposeDisabled:(BOOL)a3
{
  if (self->_composeDisabled != a3)
  {
    self->_composeDisabled = a3;
    -[DTSCanvasViewController _updateCanvasInteractionEnabled](self, "_updateCanvasInteractionEnabled");
  }
}

- (void)colorPickerSelectedColorDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[DTSCanvasViewController canvasView](self, "canvasView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selectedColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setDrawingColor:", v6);
  -[DTSCanvasViewController didChangeColorPickerColor](self, "didChangeColorPickerColor");
}

- (void)colorPickerTapped:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (-[DTSCanvasViewController _usingDemoHook](self, "_usingDemoHook"))
  {
    objc_msgSend(v9, "selectedCircle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "paletteCircles");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6 == v4)
    {
      -[DTSCanvasViewController _exportDemoHookMessage](self, "_exportDemoHookMessage");
    }
    else
    {
      objc_msgSend(v9, "paletteCircles");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lastObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8 == v4)
        -[DTSCanvasViewController _sendDemoHookMessage](self, "_sendDemoHookMessage");
    }

  }
}

- (BOOL)_usingDemoHook
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("DigitalTouchDemoHook"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = objc_msgSend(v3, "BOOLValue");
  return (char)v2;
}

- (void)_sendDemoHookMessage
{
  void *v3;
  void *v4;
  void *v5;
  id WeakRetained;
  ETHeartbeatMessage *v7;

  v7 = objc_alloc_init(ETHeartbeatMessage);
  v3 = (void *)MEMORY[0x24BDD17C8];
  -[ETMessage identifier](v7, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@%@"), CFSTR("DemoHook-"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ETMessage setIdentifier:](v7, "setIdentifier:", v5);

  WeakRetained = objc_loadWeakRetained((id *)&self->_sendDelegate);
  objc_msgSend(WeakRetained, "canvasViewController:sendMessage:", self, v7);

}

- (void)_exportDemoHookMessage
{
  void *v3;
  void *v4;
  ETMessage *messageForReplay;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  void *v13;
  const __CFString *v14;
  id v15;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("DigitalTouchDemoHookExportDirectory"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ preference isn't set"), CFSTR("DigitalTouchDemoHookExportDirectory"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[DTSCanvasViewController _showDemoHookAlertWithTitle:message:](self, "_showDemoHookAlertWithTitle:message:", CFSTR("Can't Export"), v9);
LABEL_9:

    goto LABEL_10;
  }
  messageForReplay = self->_messageForReplay;
  if (messageForReplay)
  {
    v6 = (void *)MEMORY[0x24BDD17C8];
    -[ETMessage identifier](messageForReplay, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("%@%@"), CFSTR("DemoHook-"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByAppendingPathComponent:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[ETMessage archive](self->_messageForReplay, "archive");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    v11 = objc_msgSend(v10, "writeToFile:options:error:", v9, 1, &v15);
    v12 = v15;

    if ((v11 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Path: %@"), v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = CFSTR("Wrote Message");
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Error: %@, at path: %@"), v12, v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = CFSTR("Failed to write message");
    }
    -[DTSCanvasViewController _showDemoHookAlertWithTitle:message:](self, "_showDemoHookAlertWithTitle:message:", v14, v13);

    goto LABEL_9;
  }
  -[DTSCanvasViewController _showDemoHookAlertWithTitle:message:](self, "_showDemoHookAlertWithTitle:message:", CFSTR("No Replay Message"), CFSTR("You can only export messages that have just played in full-screen."));
LABEL_10:

}

- (void)_showDemoHookAlertWithTitle:(id)a3 message:(id)a4
{
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x24BDF67F0], "alertControllerWithTitle:message:preferredStyle:", a3, a4, 1);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF67E8], "actionWithTitle:style:handler:", CFSTR("Done"), 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addAction:", v5);
  -[DTSCanvasViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, 0);

}

- (void)_updateCanvasInteractionEnabled
{
  void *v3;
  uint64_t v4;
  id v5;

  -[DTSCanvasViewController canvasView](self, "canvasView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  if (self->_composeDisabled)
  {
    v4 = 0;
  }
  else
  {
    if (-[DTSCanvasViewController isPlayingMessages](self, "isPlayingMessages"))
      v4 = 0;
    else
      v4 = -[DTSCanvasViewController isPlayingCompositeMessage](self, "isPlayingCompositeMessage") ^ 1;
    v3 = v5;
  }
  objc_msgSend(v3, "setUserInteractionEnabled:", v4);

}

- (void)canvasView:(id)a3 didBeginPlayingMessage:(id)a4
{
  -[DTSCanvasViewController updateVideoUI](self, "updateVideoUI", a3, a4);
  -[DTSCanvasViewController _updateCanvasInteractionEnabled](self, "_updateCanvasInteractionEnabled");
}

- (void)canvasView:(id)a3 willEndPlayingMessage:(id)a4
{
  id v6;
  id v7;
  NSMutableArray *unplayedMessages;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  BOOL v13;
  int v14;
  char v16;
  void *v17;
  uint64_t v18;
  float v19;
  void *v20;
  int v21;
  void *v22;
  _BOOL4 v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, void *, uint64_t, _BYTE *);
  void *v27;
  id v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;

  v6 = a3;
  v7 = a4;
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 0x7FFFFFFFFFFFFFFFLL;
  unplayedMessages = self->_unplayedMessages;
  v24 = MEMORY[0x24BDAC760];
  v25 = 3221225472;
  v26 = __60__DTSCanvasViewController_canvasView_willEndPlayingMessage___block_invoke;
  v27 = &unk_24F6E7438;
  v9 = v7;
  v28 = v9;
  v29 = &v30;
  -[NSMutableArray enumerateObjectsUsingBlock:](unplayedMessages, "enumerateObjectsUsingBlock:", &v24);
  v10 = v31[3];
  objc_msgSend(v9, "parentMessage", v24, v25, v26, v27);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "messageType") == 1)
  {
    objc_msgSend(v11, "introMessage");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v13 = v12 == v9;

  }
  else
  {
    v13 = 0;
  }
  v14 = objc_msgSend(v9, "messageType");
  v16 = v10 != 0x7FFFFFFFFFFFFFFFLL || v14 == 8 || v13;
  if ((v16 & 1) != 0)
  {
    if (v10 != 0x7FFFFFFFFFFFFFFFLL)
      -[NSMutableArray removeObjectAtIndex:](self->_unplayedMessages, "removeObjectAtIndex:", v31[3]);
    objc_msgSend(v9, "parentMessage");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17
      && (v18 = -[NSMutableArray count](self->_unplayedMessages, "count"), v17, !v18)
      && (-[AVPlayer rate](self->_videoPlayer, "rate"), v19 == 0.0)
      || objc_msgSend(v9, "messageType") == 8)
    {
      -[DTSCanvasViewController canvasView](self, "canvasView");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "wispVisibleSketchViewsWithCompletion:", 0);

      v21 = 1;
    }
    else
    {
      v21 = 0;
    }
    objc_msgSend(v9, "parentMessage");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
      v23 = 0;
    else
      v23 = -[NSMutableArray count](self->_unplayedMessages, "count") == 0;

    if ((v21 | v23) == 1)
    {
      -[DTSCanvasViewController willEndSessionPlaybackInterrupted:](self, "willEndSessionPlaybackInterrupted:", objc_msgSend(v9, "missedDuringPlayback"));
      -[ETMessage wispChildren](self->_messageForReplay, "wispChildren");
    }
  }

  _Block_object_dispose(&v30, 8);
}

void __60__DTSCanvasViewController_canvasView_willEndPlayingMessage___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  id v8;
  void *v9;
  void *v10;

  v7 = *(void **)(a1 + 32);
  v8 = a2;
  objc_msgSend(v7, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v8) = objc_msgSend(v9, "isEqualToString:", v10);
  if ((_DWORD)v8)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }
}

- (void)canvasView:(id)a3 didEndPlayingMessage:(id)a4
{
  id v6;
  id v7;
  ETMessage *playingMessage;
  uint64_t v9;
  void *v10;
  _BOOL4 playbackEnabled;
  void *v12;
  int v13;
  _BOOL4 v14;
  float v15;
  float v16;
  NSObject *v17;
  _BOOL4 v18;
  id WeakRetained;
  uint8_t v20[16];

  v6 = a3;
  v7 = a4;
  self->_isPlayingMessage = 0;
  playingMessage = self->_playingMessage;
  self->_playingMessage = 0;

  v9 = -[NSMutableArray count](self->_unplayedMessages, "count");
  if (v9)
  {
    -[DTSCanvasViewController setPlayingMessages:](self, "setPlayingMessages:", self->_playbackEnabled);
    objc_msgSend(v7, "parentMessage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "childMessageDidCompleteWisp:", v7);

    playbackEnabled = self->_playbackEnabled;
  }
  else
  {
    -[DTSCanvasViewController setPlayingMessages:](self, "setPlayingMessages:", 0);
    objc_msgSend(v7, "parentMessage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "childMessageDidCompleteWisp:", v7);

    playbackEnabled = 0;
  }
  if (-[DTSCanvasViewController _canLoopMessageDuringPlayback:](self, "_canLoopMessageDuringPlayback:", v7)
    && -[ETMessage shouldLoopDuringPlayback](self->_messageForReplay, "shouldLoopDuringPlayback")
    && self->_playbackEnabled)
  {
    v13 = objc_msgSend(v7, "missedDuringPlayback") ^ 1;
  }
  else
  {
    v13 = 0;
  }
  v14 = -[ETMessage hasWispingChildren](self->_messageForReplay, "hasWispingChildren");
  if (playbackEnabled)
  {
    if (!self->_playingCompositeMessage)
      -[DTSCanvasViewController _continueMessagePlaybackLoopWithDelay:](self, "_continueMessagePlaybackLoopWithDelay:", 1);
  }
  else if (v13)
  {
    if (-[ETMessage messageType](self->_messageForReplay, "messageType") != 8
      || !-[ETMessage hasWispingChildren](self->_messageForReplay, "hasWispingChildren")
      && (-[AVPlayer rate](self->_videoPlayer, "rate"), v15 == 0.0))
    {
      -[DTSCanvasViewController replay](self, "replay");
    }
  }
  else if (v14)
  {
    -[ETMessage wispChildren](self->_messageForReplay, "wispChildren");
  }
  else
  {
    -[AVPlayer rate](self->_videoPlayer, "rate");
    if (v16 == 0.0)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v20 = 0;
          _os_log_impl(&dword_22C68B000, v17, OS_LOG_TYPE_INFO, "Ending all playback", v20, 2u);
        }

      }
      v18 = -[DTSCanvasViewController canExpireMessages](self, "canExpireMessages");
      if (!v9 && v18 && (objc_msgSend(v7, "missedDuringPlayback") & 1) == 0)
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
        objc_msgSend(WeakRetained, "markAsPlayed");

      }
      -[DTSCanvasViewController didEndSessionPlayback](self, "didEndSessionPlayback");
      -[DTSCanvasViewController setPlayingCompositeMessage:](self, "setPlayingCompositeMessage:", 0);
      -[DTSCanvasViewController _hideVideoPlayer](self, "_hideVideoPlayer");
      -[ETCanvasView hidePhoto](self->_canvasView, "hidePhoto");
      -[DTSCanvasViewController _updateColorPickerEnabled](self, "_updateColorPickerEnabled");
      -[DTSCanvasViewController _updatePlaybackControls](self, "_updatePlaybackControls");
      -[DTSCanvasViewController updateVideoUI](self, "updateVideoUI");
      objc_msgSend(v7, "setMissedDuringPlayback:", 0);
    }
  }
  -[DTSCanvasViewController _updateCanvasInteractionEnabled](self, "_updateCanvasInteractionEnabled");

}

- (BOOL)_canLoopMessageDuringPlayback:(id)a3
{
  return 0;
}

- (void)_videoMessageDidFinishPlaying:(id)a3
{
  AVPlayer *videoPlayer;
  id v5;
  id v6;
  int v7;
  id v8;

  videoPlayer = self->_videoPlayer;
  v5 = a3;
  -[AVPlayer currentItem](videoPlayer, "currentItem");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "object");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v6)
  {
    v7 = -[ETMessage messageType](self->_messageForReplay, "messageType");

    if (v7 == 8)
      -[ETMessage stopPlaying](self->_messageForReplay, "stopPlaying");
  }
  else
  {

  }
}

- (void)_startVideoPlayerWithMessage:(id)a3
{
  id v4;
  void *v5;
  AVPlayer *videoPlayer;
  AVPlayer *v7;
  AVPlayer *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  AVPlayer *v12;
  void *v13;
  void *v14;
  AVPlayer *v15;
  AVPlayer *v16;
  void *v17;
  void *v18;
  AVPlayer *v19;
  id v20;
  _QWORD v21[4];
  id v22;
  AVPlayer *v23;
  id v24;
  CMTime v25;
  id location;
  void *v27;
  CMTime buf;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "mediaURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  videoPlayer = self->_videoPlayer;
  if (videoPlayer)
  {
    buf = *(CMTime *)*(_QWORD *)&MEMORY[0x24BDC0D88];
    -[AVPlayer seekToTime:](videoPlayer, "seekToTime:", &buf);
  }
  else
  {
    v7 = (AVPlayer *)objc_msgSend(objc_alloc(MEMORY[0x24BDB2610]), "initWithURL:", v5);
    v8 = self->_videoPlayer;
    self->_videoPlayer = v7;

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVPlayer currentItem](self->_videoPlayer, "currentItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", self, sel__videoMessageDidFinishPlaying_, *MEMORY[0x24BDB1FA8], v10);

    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        LODWORD(buf.value) = 138412290;
        *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v5;
        _os_log_impl(&dword_22C68B000, v11, OS_LOG_TYPE_INFO, "Setting video player URL: %@", (uint8_t *)&buf, 0xCu);
      }

    }
    if (!self->_composingCompositeMessage)
    {
      v12 = self->_videoPlayer;
      if (self->_overrideAudioDefaultToOff)
      {
        -[AVPlayer setMuted:](self->_videoPlayer, "setMuted:", 1);
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "valueForKey:", CFSTR("ETVideoAudioOffPreference"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[AVPlayer setMuted:](v12, "setMuted:", objc_msgSend(v14, "BOOLValue"));

      }
    }
    v15 = self->_videoPlayer;
    objc_initWeak(&location, self);
    memset(&buf, 0, sizeof(buf));
    CMTimeMake(&buf, 1, 20);
    v16 = self->_videoPlayer;
    v25 = buf;
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithCMTime:", &v25);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v17;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v27, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __56__DTSCanvasViewController__startVideoPlayerWithMessage___block_invoke;
    v21[3] = &unk_24F6E7460;
    objc_copyWeak(&v24, &location);
    v22 = v4;
    v19 = v15;
    v23 = v19;
    v20 = -[AVPlayer addBoundaryTimeObserverForTimes:queue:usingBlock:](v16, "addBoundaryTimeObserverForTimes:queue:usingBlock:", v18, 0, v21);

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);

  }
  -[AVPlayer play](self->_videoPlayer, "play");

}

void __56__DTSCanvasViewController__startVideoPlayerWithMessage___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;

  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_playingParentMessage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 32);

  if (v4 == v5)
  {
    v6 = objc_loadWeakRetained(v2);
    objc_msgSend(v6, "canvasView");
    v9 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "setUsesMediaAppearance:", 1);
    objc_msgSend(v9, "showVideoForPlayer:", *(_QWORD *)(a1 + 40));
    v7 = objc_loadWeakRetained(v2);
    objc_msgSend(v7, "_updateVideoPlayerUI");

    v8 = objc_loadWeakRetained(v2);
    objc_msgSend(v8, "_schedulePlaybackOfCompositeMessageContent:", *(_QWORD *)(a1 + 32));

  }
}

- (void)_hideVideoPlayer
{
  void *v3;
  uint64_t v4;
  void *v5;
  AVPlayer *videoPlayer;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x24BDB1FA8];
  -[AVPlayer currentItem](self->_videoPlayer, "currentItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, v4, v5);

  -[ETCanvasView hideVideo](self->_canvasView, "hideVideo");
  -[AVPlayer pause](self->_videoPlayer, "pause");
  videoPlayer = self->_videoPlayer;
  self->_videoPlayer = 0;

  -[DTSCanvasViewController _relinquishAudio](self, "_relinquishAudio");
  -[DTSCanvasViewController _updateAudioOnOffButton](self, "_updateAudioOnOffButton");
  if (-[DTSCanvasViewController _canComposeAfterMediaPlayback](self, "_canComposeAfterMediaPlayback"))
    -[ETCanvasView setUsesMediaAppearance:](self->_canvasView, "setUsesMediaAppearance:", 0);
}

- (BOOL)_canComposeAfterMediaPlayback
{
  return 1;
}

- (void)canvasView:(id)a3 didBeginComposingMessageType:(unsigned __int16)a4
{
  uint64_t v4;

  v4 = a4;
  -[DTSCanvasViewController didBeginComposingMessage](self, "didBeginComposingMessage", a3);
  -[DTSCanvasViewController setComposingMessageType:](self, "setComposingMessageType:", v4);
  -[DTSCanvasViewController _setCachedMessageForReplay:](self, "_setCachedMessageForReplay:", 0);
  -[DTSCanvasViewController _updateColorPickerEnabled](self, "_updateColorPickerEnabled");
  -[DTSCanvasViewController _updatePlaybackControls](self, "_updatePlaybackControls");
  -[DTSCanvasViewController updateVideoUI](self, "updateVideoUI");
}

- (void)canvasView:(id)a3 didEndComposingMessageType:(unsigned __int16)a4
{
  -[DTSCanvasViewController setComposingMessageType:](self, "setComposingMessageType:", 0xFFFFLL, a4);
  -[DTSCanvasViewController _updateColorPickerEnabled](self, "_updateColorPickerEnabled");
  if (-[DTSCanvasViewController _shouldAutoSend](self, "_shouldAutoSend"))
    -[DTSCanvasViewController _startComposeSessionEndTimer](self, "_startComposeSessionEndTimer");
  -[DTSCanvasViewController didEndComposingMessage](self, "didEndComposingMessage");
}

- (void)canvasView:(id)a3 sendMessage:(id)a4
{
  NSMutableArray *v5;
  NSMutableArray *deferredMessages;
  void *v7;
  id WeakRetained;
  id v9;

  v9 = a4;
  if (!-[DTSCanvasViewController deferMessageSend](self, "deferMessageSend"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_sendDelegate);
    objc_msgSend(WeakRetained, "canvasViewController:sendMessage:", self, v9);

    -[DTSCanvasViewController _updateSendButton](self, "_updateSendButton");
    goto LABEL_7;
  }
  if (!self->_deferredMessages)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v5 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    deferredMessages = self->_deferredMessages;
    self->_deferredMessages = v5;

  }
  v7 = v9;
  if (v9)
  {
    -[NSMutableArray addObject:](self->_deferredMessages, "addObject:");
LABEL_7:
    v7 = v9;
  }

}

- (void)canvasViewWillReachComposingSizeLimit:(id)a3
{
  id v3;

  -[DTSCanvasViewController colorPicker](self, "colorPicker", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDimmed:", 1);

}

- (void)canvasViewDidPause:(id)a3
{
  -[AVPlayer pause](self->_videoPlayer, "pause", a3);
}

- (void)canvasViewDidUnpause:(id)a3
{
  -[AVPlayer play](self->_videoPlayer, "play", a3);
}

- (int64_t)recentHeartRate
{
  return 85;
}

- (void)clearDeferredMessages
{
  NSMutableArray *deferredMessages;

  deferredMessages = self->_deferredMessages;
  self->_deferredMessages = 0;

}

- (BOOL)canvasView:(id)a3 tapRecognizerShouldBegin:(id)a4
{
  return -[DTSCanvasViewController _tapRecognizerShouldBegin:](self, "_tapRecognizerShouldBegin:", a4);
}

- (BOOL)_tapRecognizerShouldBegin:(id)a3
{
  return 1;
}

- (void)canvasView:(id)a3 angerUsesForceTouch:(BOOL)a4
{
  -[DTSCanvasViewController _setAngerUsesForceTouch:](self, "_setAngerUsesForceTouch:", a4);
}

- (BOOL)_canStartMessagePlaybackLoop
{
  BOOL v3;
  void *v5;
  void *v6;
  void *v7;

  if (!self->_playbackEnabled || !-[DTSCanvasViewController _isVisible](self, "_isVisible") || self->_isPlayingMessage)
    return 0;
  -[DTSCanvasViewController playingMessage](self, "playingMessage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 || !-[NSMutableArray count](self->_unplayedMessages, "count"))
  {
    v3 = 0;
  }
  else
  {
    -[DTSCanvasViewController canvasView](self, "canvasView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isComposing") & 1) != 0 || self->_composeSessionEndTimer)
    {
      v3 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v7, "applicationState") == 0;

    }
  }

  return v3;
}

- (void)startMessagePlaybackLoop
{
  id WeakRetained;
  void *v4;

  if (-[DTSCanvasViewController _canStartMessagePlaybackLoop](self, "_canStartMessagePlaybackLoop"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    objc_msgSend(WeakRetained, "mediaURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
      -[DTSCanvasViewController willBeginSessionPlayback](self, "willBeginSessionPlayback");
    -[DTSCanvasViewController setPlayingMessages:](self, "setPlayingMessages:", 1);
    -[DTSCanvasViewController _playNextMessage](self, "_playNextMessage");
  }
}

- (void)_stopPlaybackAnimated:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL4 isPlayingMessage;
  ETMessage *playingMessage;
  ETMessage *messageForReplay;

  v3 = a3;
  isPlayingMessage = self->_isPlayingMessage;
  if (self->_isPlayingMessage)
    -[DTSCanvasViewController willEndSessionPlaybackInterrupted:](self, "willEndSessionPlaybackInterrupted:", 1);
  -[ETMessage setMissedDuringPlayback:](self->_playingMessage, "setMissedDuringPlayback:", 1);
  -[ETMessage stopPlaying](self->_playingMessage, "stopPlaying");
  -[ETCanvasView clearCanvasAnimated:](self->_canvasView, "clearCanvasAnimated:", v3);
  playingMessage = self->_playingMessage;
  self->_playingMessage = 0;

  self->_isPlayingMessage = 0;
  messageForReplay = self->_messageForReplay;
  self->_messageForReplay = 0;

  -[DTSCanvasViewController _hideVideoPlayer](self, "_hideVideoPlayer");
  -[ETCanvasView hidePhoto](self->_canvasView, "hidePhoto");
  -[DTSCanvasViewController setPlayingCompositeMessage:](self, "setPlayingCompositeMessage:", 0);
  -[DTSCanvasViewController setPlayingMessages:](self, "setPlayingMessages:", 0);
  -[ETCanvasView setParentMessage:](self->_canvasView, "setParentMessage:", 0);
  if (isPlayingMessage)
    -[DTSCanvasViewController didEndSessionPlayback](self, "didEndSessionPlayback");
}

- (void)_reloadUnplayedMessages
{
  void *v3;
  void *v4;
  NSMutableArray *v5;
  NSMutableArray *unplayedMessages;
  id WeakRetained;

  v3 = (void *)MEMORY[0x24BDBCEB8];
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(WeakRetained, "createSessionMessages");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithArray:", v4);
  v5 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  unplayedMessages = self->_unplayedMessages;
  self->_unplayedMessages = v5;

}

- (void)setPlaybackEnabled:(BOOL)a3
{
  if (self->_playbackEnabled != a3)
  {
    self->_playbackEnabled = a3;
    if (a3)
    {
      -[DTSCanvasViewController _reloadUnplayedMessages](self, "_reloadUnplayedMessages");
    }
    else
    {
      -[DTSCanvasViewController _setCachedMessageForReplay:](self, "_setCachedMessageForReplay:", 0);
      -[NSMutableArray removeAllObjects](self->_unplayedMessages, "removeAllObjects");
      -[DTSCanvasViewController _stopPlaybackAnimated:](self, "_stopPlaybackAnimated:", 0);
      -[DTSCanvasViewController _updatePlaybackControls](self, "_updatePlaybackControls");
    }
    -[DTSCanvasViewController _updateCanvasInteractionEnabled](self, "_updateCanvasInteractionEnabled");
  }
}

- (void)setPlayingCompositeMessage:(BOOL)a3
{
  void *v4;

  if (self->_playingCompositeMessage != a3)
  {
    self->_playingCompositeMessage = a3;
    if (!a3)
    {
      self->_mediaMessagePlayTrackerTime = 0.0;
      -[NSMutableArray removeAllObjects](self->_unplayedMessages, "removeAllObjects");
      -[DTSCanvasViewController canvasView](self, "canvasView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "clearCanvasAnimated:", 0);

      -[ETMessage stopPlaying](self->_playingMessage, "stopPlaying");
    }
    -[DTSCanvasViewController _updateColorPickerEnabled](self, "_updateColorPickerEnabled");
    -[DTSCanvasViewController _updateCanvasInteractionEnabled](self, "_updateCanvasInteractionEnabled");
  }
}

- (void)_playNextMessage
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  if (self->_playbackEnabled && -[NSMutableArray count](self->_unplayedMessages, "count"))
  {
    -[DTSCanvasViewController playingMessage](self, "playingMessage");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
LABEL_4:

      return;
    }
    objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "applicationState");

    if (!v5)
    {
      -[NSMutableArray objectAtIndex:](self->_unplayedMessages, "objectAtIndex:", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setMissedDuringPlayback:", 0);
      if (self->_playingCompositeMessage)
        -[DTSCanvasViewController _playMessage:](self, "_playMessage:", v6);
      else
        -[DTSCanvasViewController setPlayingMessage:](self, "setPlayingMessage:", v6);
      v3 = v6;
      goto LABEL_4;
    }
  }
}

- (void)_continueMessagePlaybackLoopWithDelay:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v4;
  void *v5;
  dispatch_time_t v6;
  _QWORD v7[5];

  v3 = a3;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __65__DTSCanvasViewController__continueMessagePlaybackLoopWithDelay___block_invoke;
  v7[3] = &unk_24F6E6A98;
  v7[4] = self;
  v4 = MEMORY[0x22E2FF82C](v7, a2);
  v5 = (void *)v4;
  if (v3)
  {
    v6 = dispatch_time(0, 1000000000);
    dispatch_after(v6, MEMORY[0x24BDAC9B8], v5);
  }
  else
  {
    (*(void (**)(uint64_t))(v4 + 16))(v4);
  }

}

uint64_t __65__DTSCanvasViewController__continueMessagePlaybackLoopWithDelay___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isPlayingMessages");
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "_playNextMessage");
  return result;
}

- (void)_startComposeSessionEndTimer
{
  NSTimer *v3;
  NSTimer *composeSessionEndTimer;

  -[NSTimer invalidate](self->_composeSessionEndTimer, "invalidate");
  objc_msgSend(MEMORY[0x24BDBCF40], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__composeSessionEndTimerFired, 0, 0, 5.0);
  v3 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  composeSessionEndTimer = self->_composeSessionEndTimer;
  self->_composeSessionEndTimer = v3;

}

- (void)_clearComposeSessionEndTimer
{
  NSTimer *composeSessionEndTimer;

  -[NSTimer invalidate](self->_composeSessionEndTimer, "invalidate");
  composeSessionEndTimer = self->_composeSessionEndTimer;
  self->_composeSessionEndTimer = 0;

}

- (void)_composeSessionEndTimerFired
{
  NSTimer *composeSessionEndTimer;

  composeSessionEndTimer = self->_composeSessionEndTimer;
  self->_composeSessionEndTimer = 0;

  -[DTSCanvasViewController startMessagePlaybackLoop](self, "startMessagePlaybackLoop");
  -[DTSCanvasViewController updateVideoUI](self, "updateVideoUI");
}

- (id)_cancelButton
{
  return self->_cancelButton;
}

- (id)_skipButton
{
  return self->_skipButton;
}

- (void)_skipButtonTapped
{
  ETMessage *playingMessage;
  ETMessage *v4;

  playingMessage = self->_playingMessage;
  if (playingMessage)
  {
    v4 = playingMessage;
    -[DTSCanvasViewController _stopPlaybackAnimated:](self, "_stopPlaybackAnimated:", 1);
    -[NSMutableArray removeObject:](self->_unplayedMessages, "removeObject:", v4);

  }
  -[DTSCanvasViewController startMessagePlaybackLoop](self, "startMessagePlaybackLoop");
}

- (void)_cancelButtonTapped
{
  -[DTSCanvasViewController _stopPlaybackAnimated:](self, "_stopPlaybackAnimated:", 1);
  -[DTSCanvasViewController didEndComposingMessage](self, "didEndComposingMessage");
}

- (id)_replayButton
{
  return self->_replayButton;
}

- (void)_setReplayButton:(id)a3
{
  objc_storeStrong((id *)&self->_replayButton, a3);
}

- (BOOL)canShowReplayButton
{
  _BOOL4 v2;
  void *v5;

  if (self->_playingMessages
    || !self->_playbackEnabled
    || !-[DTSCanvasViewController hasMessageForReplay](self, "hasMessageForReplay")
    || -[DTSCanvasViewController usesCompactKeyboardLayout](self, "usesCompactKeyboardLayout")
    || -[ETCanvasView usesMediaAppearance](self->_canvasView, "usesMediaAppearance"))
  {
    LOBYTE(v2) = 0;
  }
  else
  {
    -[DTSCanvasViewController playingMessage](self, "playingMessage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 || -[DTSCanvasViewController _shouldShowSkipButton](self, "_shouldShowSkipButton"))
      LOBYTE(v2) = 0;
    else
      v2 = !-[DTSCanvasViewController _shouldShowCancelButton](self, "_shouldShowCancelButton");

  }
  return v2;
}

- (void)_setShowingReplayButton:(BOOL)a3
{
  void *v5;
  _QWORD v6[5];
  BOOL v7;
  _QWORD v8[5];
  BOOL v9;

  if (self->_showingReplayButton != a3)
  {
    self->_showingReplayButton = a3;
    if (a3)
    {
      -[UIButton setAlpha:](self->_replayButton, "setAlpha:", 0.0);
      -[DTSCanvasViewController view](self, "view");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addSubview:", self->_replayButton);

    }
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __51__DTSCanvasViewController__setShowingReplayButton___block_invoke;
    v8[3] = &unk_24F6E73A0;
    v8[4] = self;
    v9 = a3;
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __51__DTSCanvasViewController__setShowingReplayButton___block_invoke_2;
    v6[3] = &unk_24F6E7488;
    v7 = a3;
    v6[4] = self;
    objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:animations:completion:", v8, v6, 0.25);
  }
}

uint64_t __51__DTSCanvasViewController__setShowingReplayButton___block_invoke(uint64_t a1, double a2)
{
  LOBYTE(a2) = *(_BYTE *)(a1 + 40);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 984), "setAlpha:", (double)*(unint64_t *)&a2);
}

uint64_t __51__DTSCanvasViewController__setShowingReplayButton___block_invoke_2(uint64_t result)
{
  if (!*(_BYTE *)(result + 40))
    return objc_msgSend(*(id *)(*(_QWORD *)(result + 32) + 984), "removeFromSuperview");
  return result;
}

- (id)_playingParentMessage
{
  return self->_messageForReplay;
}

- (double)_nonAnimatedMessagePlaybackDuration
{
  return 10.0;
}

- (void)dataSource:(id)a3 didReceiveSessionMessage:(id)a4
{
  -[DTSCanvasViewController addUnplayedMessage:](self, "addUnplayedMessage:", a4);
}

- (void)dataSource:(id)a3 startPlaybackWithCompletion:(id)a4
{
  void *v5;
  id balloonPlaybackCompletion;
  void *v7;
  uint64_t v8;
  id v9;

  v5 = (void *)MEMORY[0x22E2FF82C](a4, a2, a3);
  balloonPlaybackCompletion = self->_balloonPlaybackCompletion;
  self->_balloonPlaybackCompletion = v5;

  -[DTSCanvasViewController setAutoPlayOnAppearanceDisabled:](self, "setAutoPlayOnAppearanceDisabled:", 0);
  if (self->_playingMessages
    && (objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "applicationState"),
        v7,
        !v8))
  {
    -[DTSCanvasViewController canvasView](self, "canvasView");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setPaused:", 0);

  }
  else
  {
    -[DTSCanvasViewController setPlaybackEnabled:](self, "setPlaybackEnabled:", 1);
    -[DTSCanvasViewController startMessagePlaybackLoop](self, "startMessagePlaybackLoop");
  }
}

- (BOOL)dataSource:(id)a3 addDemoHookToMessage:(id *)a4
{
  void *v6;
  int v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  BOOL v19;
  void *v20;
  void *v21;

  if (-[DTSCanvasViewController _usingDemoHook](self, "_usingDemoHook", a3))
  {
    objc_msgSend(*a4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "hasPrefix:", CFSTR("DemoHook-"));

    if (v7)
    {
      objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKey:", CFSTR("DigitalTouchDemoHookMessageDataPath"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:", v9);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)v10;
      if (v9 && v10)
      {
        +[ETMessage unarchive:](ETMessage, "unarchive:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if (v12)
        {
          if (objc_msgSend(v12, "messageType") != 8)
          {
LABEL_10:
            v13 = objc_retainAutorelease(v13);
            *a4 = v13;
            v19 = 1;
LABEL_18:

            return v19;
          }
          objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectForKey:", CFSTR("DigitalTouchDemoHookAssetPath"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
          {
            objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v16, "fileExistsAtPath:", v15);

            if ((v17 & 1) != 0)
            {
              objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v15);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "setMediaURL:", v18);

              goto LABEL_10;
            }
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Couldn't find path: %@"), v15);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            -[DTSCanvasViewController _showDemoHookAlertWithTitle:message:](self, "_showDemoHookAlertWithTitle:message:", CFSTR("Movie File Not Found"), v21);

          }
          else
          {
            -[DTSCanvasViewController _showDemoHookAlertWithTitle:message:](self, "_showDemoHookAlertWithTitle:message:", CFSTR("Movie Path Not Specified"), CFSTR("Please set DigitalTouchDemoHookAssetPath preference."));
          }

        }
        else
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Not changing incoming message to demo message. Data at path: %@"), v9);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[DTSCanvasViewController _showDemoHookAlertWithTitle:message:](self, "_showDemoHookAlertWithTitle:message:", CFSTR("Couldn't Unarchive Demo Message"), v20);

        }
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid data at path %@. Not changing incoming message to demo message."), v9);
        v13 = (id)objc_claimAutoreleasedReturnValue();
        -[DTSCanvasViewController _showDemoHookAlertWithTitle:message:](self, "_showDemoHookAlertWithTitle:message:", CFSTR("Missing Demo Message Data"), v13);
      }
      v19 = 0;
      goto LABEL_18;
    }
  }
  return 0;
}

- (void)dataSourceStopPlayback:(id)a3
{
  void *v4;

  if (self->_playingMessages)
  {
    -[DTSCanvasViewController canvasView](self, "canvasView", a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPaused:", 1);

  }
  else
  {
    -[DTSCanvasViewController setPlaybackEnabled:](self, "setPlaybackEnabled:", 0);
  }
  -[DTSCanvasViewController setAutoPlayOnAppearanceDisabled:](self, "setAutoPlayOnAppearanceDisabled:", 1);
}

- (BOOL)dataSourceViewIsMostlyVisible:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  BOOL v16;
  CGRect v18;
  CGRect v19;
  CGRect v20;

  if (!-[DTSCanvasViewController isViewLoaded](self, "isViewLoaded", a3))
    return 0;
  -[DTSCanvasViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v7 = v6;
  objc_msgSend(v4, "convertRect:toView:", v5);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  objc_msgSend(v5, "bounds");
  v20.origin.x = v9;
  v20.origin.y = v11;
  v20.size.width = v13;
  v20.size.height = v15;
  v19 = CGRectIntersection(v18, v20);
  v16 = v19.size.height / v7 >= 0.5;

  return v16;
}

- (void)dataSource:(id)a3 didUpdateAttachmentURL:(id)a4 forMessageWithIdentifier:(id)a5
{
  id v8;
  id v9;
  void *v10;
  int v11;
  ETMessage *v12;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  int v19;
  ETMessage *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  int v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  int v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v25 = a3;
  v8 = a4;
  v9 = a5;
  -[ETMessage identifier](self->_messageForReplay, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", v9);

  if (v11)
    v12 = self->_messageForReplay;
  else
    v12 = 0;
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v13 = self->_unplayedMessages;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v27 != v15)
          objc_enumerationMutation(v13);
        v17 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v17, "identifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "isEqualToString:", v9);

        if (v19)
        {
          v20 = v17;

          v12 = v20;
        }
      }
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    }
    while (v14);
  }

  if (v12)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      -[ETMessage setMediaURL:](v12, "setMediaURL:", v8);
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "path");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v22, "fileExistsAtPath:", v23);
          *(_DWORD *)buf = 138412546;
          v31 = v8;
          v32 = 1024;
          v33 = v24;
          _os_log_impl(&dword_22C68B000, v21, OS_LOG_TYPE_INFO, "Setting media URL: %@, URL exists on disk: %d", buf, 0x12u);

        }
      }
    }
  }

}

- (DTSCanvasViewControllerSendDelegate)sendDelegate
{
  return (DTSCanvasViewControllerSendDelegate *)objc_loadWeakRetained((id *)&self->_sendDelegate);
}

- (void)setSendDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_sendDelegate, a3);
}

- (unsigned)composingMessageType
{
  return self->_composingMessageType;
}

- (void)setComposingMessageType:(unsigned __int16)a3
{
  self->_composingMessageType = a3;
}

- (BOOL)isComposingCompositeMessage
{
  return self->_composingCompositeMessage;
}

- (BOOL)isPlayingCompositeMessage
{
  return self->_playingCompositeMessage;
}

- (double)mediaMessagePlayTrackerTime
{
  return self->_mediaMessagePlayTrackerTime;
}

- (void)setMediaMessagePlayTrackerTime:(double)a3
{
  self->_mediaMessagePlayTrackerTime = a3;
}

- (BOOL)isPaused
{
  return self->_paused;
}

- (void)setPaused:(BOOL)a3
{
  self->_paused = a3;
}

- (BOOL)isComposeDisabled
{
  return self->_composeDisabled;
}

- (BOOL)isAutoPlayOnAppearanceDisabled
{
  return self->_autoPlayOnAppearanceDisabled;
}

- (void)setAutoPlayOnAppearanceDisabled:(BOOL)a3
{
  self->_autoPlayOnAppearanceDisabled = a3;
}

- (BOOL)ignoreAppearanceCallbacks
{
  return self->_ignoreAppearanceCallbacks;
}

- (void)setIgnoreAppearanceCallbacks:(BOOL)a3
{
  self->_ignoreAppearanceCallbacks = a3;
}

- (ETCanvasView)canvasView
{
  return self->_canvasView;
}

- (void)setCanvasView:(id)a3
{
  objc_storeStrong((id *)&self->_canvasView, a3);
}

- (BOOL)isPlayingMessages
{
  return self->_playingMessages;
}

- (ETMessage)playingMessage
{
  return self->_playingMessage;
}

- (DTSColorPicker)colorPicker
{
  return self->_colorPicker;
}

- (void)setColorPicker:(id)a3
{
  objc_storeStrong((id *)&self->_colorPicker, a3);
}

- (BOOL)deferMessageSend
{
  return self->_deferMessageSend;
}

- (void)setDeferMessageSend:(BOOL)a3
{
  self->_deferMessageSend = a3;
}

- (NSArray)deferredMessages
{
  return &self->_deferredMessages->super;
}

- (void)setUsesCompactKeyboardLayout:(BOOL)a3
{
  self->_usesCompactKeyboardLayout = a3;
}

- (BOOL)overrideAudioDefaultToOff
{
  return self->_overrideAudioDefaultToOff;
}

- (void)setOverrideAudioDefaultToOff:(BOOL)a3
{
  self->_overrideAudioDefaultToOff = a3;
}

- (BOOL)isPlaybackEnabled
{
  return self->_playbackEnabled;
}

- (ETBalloonPluginDataSource)dataSource
{
  return (ETBalloonPluginDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (id)balloonPlaybackCompletion
{
  return self->_balloonPlaybackCompletion;
}

- (void)setBalloonPlaybackCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1112);
}

- (ETMessage)messageForReplay
{
  return self->_messageForReplay;
}

- (void)setMessageForReplay:(id)a3
{
  objc_storeStrong((id *)&self->_messageForReplay, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageForReplay, 0);
  objc_storeStrong(&self->_balloonPlaybackCompletion, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_colorPicker, 0);
  objc_storeStrong((id *)&self->_playingMessage, 0);
  objc_storeStrong((id *)&self->_canvasView, 0);
  objc_destroyWeak((id *)&self->_sendDelegate);
  objc_storeStrong((id *)&self->_skipButton, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_audioToggleButton, 0);
  objc_storeStrong((id *)&self->_videoPlayer, 0);
  objc_storeStrong((id *)&self->_deferredMessages, 0);
  objc_storeStrong((id *)&self->_composeSessionEndTimer, 0);
  objc_storeStrong((id *)&self->_replayButton, 0);
  objc_storeStrong((id *)&self->_unplayedMessages, 0);
}

@end
