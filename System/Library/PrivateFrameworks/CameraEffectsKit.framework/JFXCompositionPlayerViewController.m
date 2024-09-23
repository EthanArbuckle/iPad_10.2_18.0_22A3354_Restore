@implementation JFXCompositionPlayerViewController

- (JFXCompositionPlayerViewController)init
{
  JFXCompositionPlayerViewController *v2;
  JFXCompositionPlayerViewController *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)JFXCompositionPlayerViewController;
  v2 = -[JFXCompositionPlayerViewController init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[JFXCompositionPlayerViewController sharedInit](v2, "sharedInit");
  return v3;
}

- (JFXCompositionPlayerViewController)initWithCoder:(id)a3
{
  JFXCompositionPlayerViewController *v3;
  JFXCompositionPlayerViewController *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)JFXCompositionPlayerViewController;
  v3 = -[JFXCompositionPlayerViewController initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[JFXCompositionPlayerViewController sharedInit](v3, "sharedInit");
  return v4;
}

- (void)sharedInit
{
  self->_videoContentMode = 0;
  self->_parentCode = -1;
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
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)JFXCompositionPlayerViewController;
  -[JFXCompositionPlayerViewController viewDidLoad](&v10, sel_viewDidLoad);
  -[JFXCompositionPlayerViewController playerContainerView](self, "playerContainerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 0.0);

  -[JFXCompositionPlayerViewController contentModeToVideoGravity:](self, "contentModeToVideoGravity:", -[JFXCompositionPlayerViewController videoContentMode](self, "videoContentMode"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[JFXCompositionPlayerViewController playerViewer](self, "playerViewer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setVideoGravity:", v4);

  -[JFXCompositionPlayerViewController playerViewer](self, "playerViewer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setShowAVControls:", 0);

  *(_OWORD *)&self->_playbackTimeChangedObserverInterval.value = kDefaultPlaybackTimeObserverInterval;
  self->_playbackTimeChangedObserverInterval.epoch = 0;
  -[JFXCompositionPlayerViewController setRestoreToColor:](self, "setRestoreToColor:", 0);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:selector:name:object:", self, sel_appDidBecomeActive_, *MEMORY[0x24BDF7510], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObserver:selector:name:object:", self, sel_appWillResignActive_, *MEMORY[0x24BDF75D8], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObserver:selector:name:object:", self, sel_appDidEnterBackground_, *MEMORY[0x24BDF7528], 0);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)JFXCompositionPlayerViewController;
  -[JFXCompositionPlayerViewController dealloc](&v4, sel_dealloc);
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)JFXCompositionPlayerViewController;
  -[JFXCompositionPlayerViewController viewDidAppear:](&v5, sel_viewDidAppear_, a3);
  -[JFXCompositionPlayerViewController playerViewer](self, "playerViewer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, CFSTR("videoBounds"), 1, 0);

  -[JFXCompositionPlayerViewController updateDelegatePlayer](self, "updateDelegatePlayer");
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)JFXCompositionPlayerViewController;
  -[JFXCompositionPlayerViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, a3);
  -[JFXCompositionPlayerViewController playerViewer](self, "playerViewer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:forKeyPath:", self, CFSTR("videoBounds"));

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)JFXCompositionPlayerViewController;
  -[JFXCompositionPlayerViewController viewDidLayoutSubviews](&v12, sel_viewDidLayoutSubviews);
  -[JFXCompositionPlayerViewController playerViewer](self, "playerViewer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displaySize");
  v5 = v4;
  v7 = v6;

  -[JFXCompositionPlayerViewController lastPlayerViewSize](self, "lastPlayerViewSize");
  if (v5 != v9 || v7 != v8)
  {
    -[JFXCompositionPlayerViewController setLastPlayerViewSize:](self, "setLastPlayerViewSize:", v5, v7);
    -[JFXCompositionPlayerViewController clipsPlayer](self, "clipsPlayer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "notifyPlayerViewSizeChanged");

  }
}

- (void)appDidBecomeActive:(id)a3
{
  void *v4;
  void *v5;

  -[JFXCompositionPlayerViewController viewIfLoaded](self, "viewIfLoaded", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    -[JFXCompositionPlayerViewController reloadClipDataSourceOnBecomingActive](self, "reloadClipDataSourceOnBecomingActive");
}

- (void)appDidEnterBackground:(id)a3
{
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  JFXLog_DebugPlayback();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    -[JFXCompositionPlayerViewController displayName](self, "displayName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543362;
    v7 = v5;
    _os_log_impl(&dword_2269A9000, v4, OS_LOG_TYPE_DEFAULT, "player %{public}@ entered background. will clear composition", (uint8_t *)&v6, 0xCu);

  }
  -[JFXCompositionPlayerViewController unloadCompositionSetPlaceHolder:](self, "unloadCompositionSetPlaceHolder:", 0);
}

- (void)appWillResignActive:(id)a3
{
  NSObject *v4;

  JFXLog_playback();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[JFXCompositionPlayerViewController appWillResignActive:].cold.1(self, v4);

  -[JFXCompositionPlayerViewController pause](self, "pause");
  -[JFXCompositionPlayerViewController preparePlaceHolder](self, "preparePlaceHolder");
}

- (void)didReceiveMemoryWarning
{
  void *v3;
  char v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  objc_super v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v10.receiver = self;
  v10.super_class = (Class)JFXCompositionPlayerViewController;
  -[JFXCompositionPlayerViewController didReceiveMemoryWarning](&v10, sel_didReceiveMemoryWarning);
  -[JFXCompositionPlayerViewController clipsPlayer](self, "clipsPlayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isPlaying");

  if ((v4 & 1) == 0)
  {
    JFXLog_playback();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      -[JFXCompositionPlayerViewController displayName](self, "displayName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v12 = v6;
      _os_log_impl(&dword_2269A9000, v5, OS_LOG_TYPE_DEFAULT, "player %{public}@ didReceiveMemoryWarning and not playing. will clear composition", buf, 0xCu);

    }
    JFXPlaybackEventSignpostPointCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = JFXSignpostExclusiveID;
    if ((unint64_t)(JFXSignpostExclusiveID - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_2269A9000, v8, OS_SIGNPOST_EVENT, v9, "MemoryWarning", (const char *)&unk_226AC25B2, buf, 2u);
    }

    -[JFXCompositionPlayerViewController unloadCompositionSetPlaceHolder:](self, "unloadCompositionSetPlaceHolder:", 1);
  }
}

- (void)updateCachedPlaybackProperties
{
  -[JFXCompositionPlayerViewController setCachedDuration:](self, "setCachedDuration:", -[JFXCompositionPlayerViewController duration](self, "duration"));
  -[JFXCompositionPlayerViewController setCachedCurrentTime:](self, "setCachedCurrentTime:", -[JFXCompositionPlayerViewController currentTime](self, "currentTime"));
  -[JFXCompositionPlayerViewController setCachedMuted:](self, "setCachedMuted:", -[JFXCompositionPlayerViewController isMuted](self, "isMuted"));
  -[JFXCompositionPlayerViewController renderSizeInPixels](self, "renderSizeInPixels");
  -[JFXCompositionPlayerViewController setCachedRenderSizeInPixels:](self, "setCachedRenderSizeInPixels:");
}

- (void)unloadClipDataSourceSetPlaceHolder:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:name:object:", self, CFSTR("mediaserverdCrashed"), 0);

  -[JFXCompositionPlayerViewController placeHolderView](self, "placeHolderView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    -[JFXCompositionPlayerViewController preparePlaceHolder](self, "preparePlaceHolder");
  -[JFXCompositionPlayerViewController playerContainerView](self, "playerContainerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAlpha:", 0.0);

  -[JFXCompositionPlayerViewController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[JFXCompositionPlayerViewController delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "updateFromPlayer:", 0);

  }
  -[JFXCompositionPlayerViewController clipsPlayer](self, "clipsPlayer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "teardownSetPlaceHolder:", v3);

  -[JFXCompositionPlayerViewController setClipsPlayer:](self, "setClipsPlayer:", 0);
}

- (void)setClipsDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_clipsDataSource, a3);
  -[JFXCompositionPlayerViewController reloadClipDataSource](self, "reloadClipDataSource");
}

- (void)reloadClipDataSourceOnBecomingActive
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  JFXLog_DebugPlayback();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[JFXCompositionPlayerViewController displayName](self, "displayName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138543362;
    v6 = v4;
    _os_log_impl(&dword_2269A9000, v3, OS_LOG_TYPE_DEFAULT, "player %{public}@ reloaded clip data source on becomingActive", (uint8_t *)&v5, 0xCu);

  }
  -[JFXCompositionPlayerViewController reloadClipDataSourceIfNeeded](self, "reloadClipDataSourceIfNeeded");
}

- (void)reloadClipDataSourceIfNeeded
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (-[JFXCompositionPlayerViewController isReloadClipDataSourceNeeded](self, "isReloadClipDataSourceNeeded"))
  {
    JFXLog_DebugPlayback();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      -[JFXCompositionPlayerViewController displayName](self, "displayName");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = 138543362;
      v6 = v4;
      _os_log_impl(&dword_2269A9000, v3, OS_LOG_TYPE_DEFAULT, "player %{public}@ reloaded clip data source when needed", (uint8_t *)&v5, 0xCu);

    }
    -[JFXCompositionPlayerViewController reloadClipDataSource](self, "reloadClipDataSource");
  }
}

- (BOOL)isReloadClipDataSourceNeeded
{
  id WeakRetained;
  void *v4;
  BOOL v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_clipsDataSource);
  if (WeakRetained)
  {
    -[JFXCompositionPlayerViewController clipsPlayer](self, "clipsPlayer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4 == 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)reloadClipDataSource
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id WeakRetained;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  __int128 v27;
  uint64_t v28;
  __int128 v29;
  uint64_t v30;
  uint8_t buf[4];
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  -[JFXCompositionPlayerViewController preparePlaceHolder](self, "preparePlaceHolder");
  -[JFXCompositionPlayerViewController playerContainerView](self, "playerContainerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 0.0);

  v4 = -[JFXCompositionPlayerViewController cachedCurrentTime](self, "cachedCurrentTime");
  v5 = -[JFXCompositionPlayerViewController cachedMuted](self, "cachedMuted");
  -[JFXCompositionPlayerViewController setCachedCurrentTime:](self, "setCachedCurrentTime:", 0);
  -[JFXCompositionPlayerViewController setCachedMuted:](self, "setCachedMuted:", 0);
  -[JFXCompositionPlayerViewController setCachedDuration:](self, "setCachedDuration:", 0);
  -[JFXCompositionPlayerViewController setCachedRenderSizeInPixels:](self, "setCachedRenderSizeInPixels:", *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));
  -[JFXCompositionPlayerViewController clipsPlayer](self, "clipsPlayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    JFXLog_DebugPlayback();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      -[JFXCompositionPlayerViewController displayName](self, "displayName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v32 = v8;
      _os_log_impl(&dword_2269A9000, v7, OS_LOG_TYPE_DEFAULT, "player %{public}@ reloading clip data source, tear down existing player", buf, 0xCu);

    }
    -[JFXCompositionPlayerViewController clipsPlayer](self, "clipsPlayer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "teardownSetPlaceHolder:", 1);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_clipsDataSource);

  if (WeakRetained)
  {
    v11 = objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "compositionPlayerClass"));
    v12 = objc_loadWeakRetained((id *)&self->_clipsDataSource);
    v13 = (void *)objc_msgSend(v11, "initWithClipsDataSource:seekPosition:audioMuted:", v12, v4, v5 != 0);
    -[JFXCompositionPlayerViewController setClipsPlayer:](self, "setClipsPlayer:", v13);

    -[JFXCompositionPlayerViewController displayName](self, "displayName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXCompositionPlayerViewController clipsPlayer](self, "clipsPlayer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setDisplayName:", v14);

    v16 = -[JFXCompositionPlayerViewController parentCode](self, "parentCode");
    -[JFXCompositionPlayerViewController clipsPlayer](self, "clipsPlayer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setParentCode:", v16);

    -[JFXCompositionPlayerViewController clipsPlayer](self, "clipsPlayer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setPlaybackDelegate:", self);

    -[JFXCompositionPlayerViewController playbackTimeChangedObserverInterval](self, "playbackTimeChangedObserverInterval");
    -[JFXCompositionPlayerViewController clipsPlayer](self, "clipsPlayer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v29;
    v28 = v30;
    objc_msgSend(v19, "setPlaybackTimeChangedObserverInterval:", &v27);

    -[JFXCompositionPlayerViewController beginFlash](self, "beginFlash");
    objc_initWeak((id *)buf, self);
    -[JFXCompositionPlayerViewController clipsPlayer](self, "clipsPlayer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXCompositionPlayerViewController playerViewer](self, "playerViewer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __58__JFXCompositionPlayerViewController_reloadClipDataSource__block_invoke;
    v25[3] = &unk_24EE5B2E8;
    objc_copyWeak(&v26, (id *)buf);
    objc_msgSend(v20, "setPlayerView:completionBlock:", v21, v25);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addObserver:selector:name:object:", self, sel_mediaserverdCrashed, CFSTR("mediaserverdCrashed"), 0);

    -[JFXCompositionPlayerViewController setNeedsCompositionUpdate](self, "setNeedsCompositionUpdate");
    objc_destroyWeak(&v26);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    -[JFXCompositionPlayerViewController videoDisplayOverlayView](self, "videoDisplayOverlayView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "removeFromSuperview");

    -[JFXCompositionPlayerViewController setVideoDisplayOverlayView:](self, "setVideoDisplayOverlayView:", 0);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "removeObserver:name:object:", self, CFSTR("mediaserverdCrashed"), 0);

    -[JFXCompositionPlayerViewController setClipsPlayer:](self, "setClipsPlayer:", 0);
  }
}

void __58__JFXCompositionPlayerViewController_reloadClipDataSource__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  id v3;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "updateDelegatePlayer");

  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v3, "endFlash");

}

- (void)setNeedsCompositionUpdate
{
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id location;

  -[JFXCompositionPlayerViewController preparePlaceHolder](self, "preparePlaceHolder");
  -[JFXCompositionPlayerViewController reloadClipDataSourceIfNeeded](self, "reloadClipDataSourceIfNeeded");
  -[JFXCompositionPlayerViewController clipsPlayer](self, "clipsPlayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pause:", 0);

  -[JFXCompositionPlayerViewController beginFlash](self, "beginFlash");
  objc_initWeak(&location, self);
  -[JFXCompositionPlayerViewController clipsPlayer](self, "clipsPlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __63__JFXCompositionPlayerViewController_setNeedsCompositionUpdate__block_invoke;
  v5[3] = &unk_24EE5B2E8;
  objc_copyWeak(&v6, &location);
  objc_msgSend(v4, "updateComposition:", v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __63__JFXCompositionPlayerViewController_setNeedsCompositionUpdate__block_invoke(uint64_t a1, uint64_t a2, char a3, void *a4)
{
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  if ((a3 & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "clipsPlayer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __63__JFXCompositionPlayerViewController_setNeedsCompositionUpdate__block_invoke_2;
    v10[3] = &unk_24EE5B2E8;
    objc_copyWeak(&v11, (id *)(a1 + 32));
    objc_msgSend(v8, "dispatchBlockWhenDone:", v10);

    v9 = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(v9, "endFlash");

    objc_destroyWeak(&v11);
  }

}

void __63__JFXCompositionPlayerViewController_setNeedsCompositionUpdate__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "updateDelegatePlayer");

}

- (void)setNeedsCompositionUpdateForClip:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];
  id v7;
  id v8;
  id from;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  objc_initWeak(&from, v4);
  -[JFXCompositionPlayerViewController reloadClipDataSourceIfNeeded](self, "reloadClipDataSourceIfNeeded");
  -[JFXCompositionPlayerViewController clipsPlayer](self, "clipsPlayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __71__JFXCompositionPlayerViewController_setNeedsCompositionUpdateForClip___block_invoke;
  v6[3] = &unk_24EE5B310;
  objc_copyWeak(&v7, &from);
  objc_copyWeak(&v8, &location);
  v6[4] = self;
  objc_msgSend(v5, "updateCompositionForClip:completion:", v4, v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

}

void __71__JFXCompositionPlayerViewController_setNeedsCompositionUpdateForClip___block_invoke(id *a1, uint64_t a2, int a3)
{
  id *v5;
  id WeakRetained;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  int v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  const __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a1 + 5;
  WeakRetained = objc_loadWeakRetained(a1 + 5);

  if (WeakRetained)
  {
    v7 = objc_loadWeakRetained(a1 + 6);
    objc_msgSend(v7, "updateDelegatePlayer");

    JFXLog_DebugPlayback();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(a1[4], "displayName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_loadWeakRetained(v5);
      objc_msgSend(v10, "uuid");
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = (void *)v11;
      v13 = CFSTR("succeeded");
      v14 = 138543874;
      v15 = v9;
      v16 = 2114;
      if (a3)
        v13 = CFSTR("was throttled");
      v17 = v11;
      v18 = 2114;
      v19 = v13;
      _os_log_impl(&dword_2269A9000, v8, OS_LOG_TYPE_DEFAULT, "player %{public}@ clip composition update for clip  %{public}@ %{public}@ ", (uint8_t *)&v14, 0x20u);

    }
  }
}

- (void)updateDelegatePlayer
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  id v7;

  -[JFXCompositionPlayerViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[JFXCompositionPlayerViewController delegate](self, "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[JFXCompositionPlayerViewController playerViewer](self, "playerViewer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "player");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "updateFromPlayer:", v6);

  }
}

- (void)dispatchBlockWhenDone:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  void *v6;
  _QWORD v7[4];
  void (**v8)(_QWORD);

  v4 = (void (**)(_QWORD))a3;
  -[JFXCompositionPlayerViewController reloadClipDataSourceIfNeeded](self, "reloadClipDataSourceIfNeeded");
  -[JFXCompositionPlayerViewController clipsPlayer](self, "clipsPlayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[JFXCompositionPlayerViewController clipsPlayer](self, "clipsPlayer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __60__JFXCompositionPlayerViewController_dispatchBlockWhenDone___block_invoke;
    v7[3] = &unk_24EE5B338;
    v8 = v4;
    objc_msgSend(v6, "dispatchBlockWhenDone:", v7);

  }
  else
  {
    v4[2](v4);
  }

}

uint64_t __60__JFXCompositionPlayerViewController_dispatchBlockWhenDone___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)unloadCompositionSetPlaceHolder:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  uint8_t v8[16];

  v3 = a3;
  JFXPlaybackEventSignpostPointCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = JFXSignpostExclusiveID;
  if ((unint64_t)(JFXSignpostExclusiveID - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)v8 = 0;
    _os_signpost_emit_with_name_impl(&dword_2269A9000, v6, OS_SIGNPOST_EVENT, v7, "UnloadComposition", (const char *)&unk_226AC25B2, v8, 2u);
  }

  -[JFXCompositionPlayerViewController updateCachedPlaybackProperties](self, "updateCachedPlaybackProperties");
  -[JFXCompositionPlayerViewController unloadClipDataSourceSetPlaceHolder:](self, "unloadClipDataSourceSetPlaceHolder:", v3);
}

- (void)preparePlaceHolder
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  kdebug_trace();
  -[JFXCompositionPlayerViewController placeHolderView](self, "placeHolderView");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_3;
  v4 = (void *)v3;
  -[JFXCompositionPlayerViewController placeHolderView](self, "placeHolderView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "superview");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
LABEL_3:
    -[JFXCompositionPlayerViewController placeholderContainerView](self, "placeholderContainerView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      JFXLog_DebugPlayback();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        -[JFXCompositionPlayerViewController displayName](self, "displayName");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 138543362;
        v24 = v9;
        _os_log_impl(&dword_2269A9000, v8, OS_LOG_TYPE_DEFAULT, "player %{public}@ placeholder prepared", (uint8_t *)&v23, 0xCu);

      }
      -[JFXCompositionPlayerViewController playerContainerView](self, "playerContainerView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "snapshotViewAfterScreenUpdates:", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[JFXCompositionPlayerViewController setPlaceHolderView:](self, "setPlaceHolderView:", v11);

      -[JFXCompositionPlayerViewController playerContainerView](self, "playerContainerView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "bounds");
      v14 = v13;
      v16 = v15;
      v18 = v17;
      v20 = v19;
      -[JFXCompositionPlayerViewController placeHolderView](self, "placeHolderView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setFrame:", v14, v16, v18, v20);

      -[JFXCompositionPlayerViewController placeHolderView](self, "placeHolderView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setAutoresizingMask:", 18);

    }
    kdebug_trace();
  }
}

- (void)displayPlaceHolder
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  kdebug_trace();
  -[JFXCompositionPlayerViewController setDontRemovePlaceHolderOnDisplay:](self, "setDontRemovePlaceHolderOnDisplay:", 1);
  JFXLog_DebugPlayback();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[JFXCompositionPlayerViewController displayName](self, "displayName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138543362;
    v6 = v4;
    _os_log_impl(&dword_2269A9000, v3, OS_LOG_TYPE_DEFAULT, "player %{public}@ placeholder placeholder locked", (uint8_t *)&v5, 0xCu);

  }
  -[JFXCompositionPlayerViewController preparePlaceHolder](self, "preparePlaceHolder");
  -[JFXCompositionPlayerViewController addPlaceHolder](self, "addPlaceHolder");
  kdebug_trace();
}

- (void)addPlaceHolder
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  uint64_t v34;
  CGRect v35;
  CGRect v36;

  v34 = *MEMORY[0x24BDAC8D0];
  kdebug_trace();
  -[JFXCompositionPlayerViewController placeHolderView](self, "placeHolderView");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[JFXCompositionPlayerViewController placeholderContainerView](self, "placeholderContainerView");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      -[JFXCompositionPlayerViewController placeHolderView](self, "placeHolderView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "superview");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v8)
      {
        JFXLog_DebugPlayback();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          -[JFXCompositionPlayerViewController displayName](self, "displayName");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = 138543362;
          v33 = v10;
          _os_log_impl(&dword_2269A9000, v9, OS_LOG_TYPE_DEFAULT, "player %{public}@ placeholder displayed", (uint8_t *)&v32, 0xCu);

        }
        objc_msgSend(MEMORY[0x24BDE57D8], "begin");
        objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
        -[JFXCompositionPlayerViewController playerContainerView](self, "playerContainerView");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "bounds");
        v13 = v12;
        v15 = v14;
        v17 = v16;
        v19 = v18;

        -[JFXCompositionPlayerViewController placeHolderView](self, "placeHolderView");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "frame");
        v22 = v21;
        v24 = v23;
        v26 = v25;
        v28 = v27;

        v35.origin.x = v22;
        v35.origin.y = v24;
        v35.size.width = v26;
        v35.size.height = v28;
        v36.origin.x = v13;
        v36.origin.y = v15;
        v36.size.width = v17;
        v36.size.height = v19;
        if (!CGRectEqualToRect(v35, v36))
        {
          -[JFXCompositionPlayerViewController placeHolderView](self, "placeHolderView");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "setFrame:", v13, v15, v17, v19);

        }
        -[JFXCompositionPlayerViewController placeholderContainerView](self, "placeholderContainerView");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[JFXCompositionPlayerViewController placeHolderView](self, "placeHolderView");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "addSubview:", v31);

        objc_msgSend(MEMORY[0x24BDE57D8], "commit");
        objc_msgSend(MEMORY[0x24BDE57D8], "flush");
      }
    }
    else
    {

    }
  }
  kdebug_trace();
}

- (void)removePlaceHolder
{
  uint64_t v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  NSObject *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  uint64_t v17;
  double v18;
  double v19;
  NSObject *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  kdebug_trace();
  -[JFXCompositionPlayerViewController placeHolderView](self, "placeHolderView");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[JFXCompositionPlayerViewController playerContainerView](self, "playerContainerView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "alpha");
    v7 = v6;

    if (v7 != 0.0)
    {
      JFXLog_DebugPlayback();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        -[JFXCompositionPlayerViewController displayName](self, "displayName");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v28 = v9;
        _os_log_impl(&dword_2269A9000, v8, OS_LOG_TYPE_DEFAULT, "player %{public}@ placeholder removed", buf, 0xCu);

      }
      -[JFXCompositionPlayerViewController delegate](self, "delegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_opt_respondsToSelector();

      if ((v11 & 1) != 0)
      {
        -[JFXCompositionPlayerViewController delegate](self, "delegate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "animationPropertiesForCompositionTransition:", self);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v13 = 0;
      }
      -[JFXCompositionPlayerViewController placeHolderView](self, "placeHolderView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[JFXCompositionPlayerViewController setPlaceHolderView:](self, "setPlaceHolderView:", 0);
      if (!v13 || (objc_msgSend(v13, "animationDuration"), v15 == 0.0))
      {
        objc_msgSend(v14, "removeFromSuperview");
      }
      else
      {
        objc_msgSend(v13, "timingParameters");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v16)
          v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF69A0]), "initWithAnimationCurve:", 0);
        v17 = MEMORY[0x24BDAC760];
        v24[0] = MEMORY[0x24BDAC760];
        v24[1] = 3221225472;
        v24[2] = __55__JFXCompositionPlayerViewController_removePlaceHolder__block_invoke;
        v24[3] = &unk_24EE57AA8;
        v25 = v14;
        v26 = v13;
        objc_msgSend(v26, "animationDuration");
        v19 = v18;
        v22[0] = v17;
        v22[1] = 3221225472;
        v22[2] = __55__JFXCompositionPlayerViewController_removePlaceHolder__block_invoke_2;
        v22[3] = &unk_24EE59620;
        v23 = v25;
        +[JTAnimation performAnimation:timingParameters:duration:completion:delay:](JTAnimation, "performAnimation:timingParameters:duration:completion:delay:", v24, v16, v22, v19, 0.0);

      }
    }
  }
  if (-[JFXCompositionPlayerViewController dontRemovePlaceHolderOnDisplay](self, "dontRemovePlaceHolderOnDisplay"))
  {
    JFXLog_DebugPlayback();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      -[JFXCompositionPlayerViewController displayName](self, "displayName");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v28 = v21;
      _os_log_impl(&dword_2269A9000, v20, OS_LOG_TYPE_DEFAULT, "player %{public}@ placeholder was unlocked", buf, 0xCu);

    }
  }
  -[JFXCompositionPlayerViewController setDontRemovePlaceHolderOnDisplay:](self, "setDontRemovePlaceHolderOnDisplay:", 0);
  kdebug_trace();
}

uint64_t __55__JFXCompositionPlayerViewController_removePlaceHolder__block_invoke(uint64_t a1)
{
  uint64_t result;
  void *v3;
  CGAffineTransform v4;
  CGAffineTransform v5;

  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
  result = objc_msgSend(*(id *)(a1 + 40), "shouldScale");
  if ((_DWORD)result)
  {
    CGAffineTransformMakeScale(&v5, 0.6, 0.6);
    v3 = *(void **)(a1 + 32);
    v4 = v5;
    return objc_msgSend(v3, "setTransform:", &v4);
  }
  return result;
}

uint64_t __55__JFXCompositionPlayerViewController_removePlaceHolder__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentCMTime
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  id v10;

  -[JFXCompositionPlayerViewController clipsPlayer](self, "clipsPlayer");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[JFXCompositionPlayerViewController clipsPlayer](self, "clipsPlayer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "currentCMTime");
    }
    else
    {
      retstr->var0 = 0;
      *(_QWORD *)&retstr->var1 = 0;
      retstr->var3 = 0;
    }
  }
  else
  {
    v7 = -[JFXCompositionPlayerViewController cachedCurrentTime](self, "cachedCurrentTime");
    -[JFXCompositionPlayerViewController clipsPlayer](self, "clipsPlayer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "clipsDataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    CMTimeFromFrameTime(v7, objc_msgSend(v8, "timeScale"), (CMTime *)retstr);

  }
  return result;
}

- (int)currentTime
{
  void *v3;
  void *v4;
  int v5;

  -[JFXCompositionPlayerViewController clipsPlayer](self, "clipsPlayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[JFXCompositionPlayerViewController clipsPlayer](self, "clipsPlayer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "currentTime");

  }
  else
  {
    v5 = -[JFXCompositionPlayerViewController cachedCurrentTime](self, "cachedCurrentTime");
  }

  return v5;
}

- (CGSize)renderSizeInPixels
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  -[JFXCompositionPlayerViewController clipsPlayer](self, "clipsPlayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[JFXCompositionPlayerViewController clipsPlayer](self, "clipsPlayer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "renderSize");
    v6 = v5;
    v8 = v7;

  }
  else
  {
    -[JFXCompositionPlayerViewController cachedRenderSizeInPixels](self, "cachedRenderSizeInPixels");
    v6 = v9;
    v8 = v10;
  }

  v11 = v6;
  v12 = v8;
  result.height = v12;
  result.width = v11;
  return result;
}

- (int)duration
{
  void *v3;
  void *v4;
  int v5;

  -[JFXCompositionPlayerViewController clipsPlayer](self, "clipsPlayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[JFXCompositionPlayerViewController clipsPlayer](self, "clipsPlayer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "duration");

  }
  else
  {
    v5 = -[JFXCompositionPlayerViewController cachedDuration](self, "cachedDuration");
  }

  return v5;
}

- (void)seekToTime:(int)a3
{
  uint64_t v3;
  void *v5;
  _QWORD v6[5];
  int v7;

  v3 = *(_QWORD *)&a3;
  -[JFXCompositionPlayerViewController reloadClipDataSourceIfNeeded](self, "reloadClipDataSourceIfNeeded");
  -[JFXCompositionPlayerViewController clipsPlayer](self, "clipsPlayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __49__JFXCompositionPlayerViewController_seekToTime___block_invoke;
  v6[3] = &unk_24EE5B360;
  v6[4] = self;
  v7 = v3;
  objc_msgSend(v5, "seek:tolerance:completion:", v3, 0, v6);

}

void __49__JFXCompositionPlayerViewController_seekToTime___block_invoke(uint64_t a1, uint64_t a2, char a3)
{
  NSObject *v5;

  JFXLog_DebugPlayback();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    __49__JFXCompositionPlayerViewController_seekToTime___block_invoke_cold_1(a1, a3, v5);

}

- (int)frameRate
{
  void *v2;
  int v3;

  -[JFXCompositionPlayerViewController clipsDataSource](self, "clipsDataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "frameRate");

  return v3;
}

- (void)setPlaybackTimeChangedObserverInterval:(id *)a3
{
  __int128 v5;
  void *v6;
  __int128 v7;

  -[JFXCompositionPlayerViewController reloadClipDataSourceIfNeeded](self, "reloadClipDataSourceIfNeeded");
  v5 = *(_OWORD *)&a3->var0;
  self->_playbackTimeChangedObserverInterval.epoch = a3->var3;
  *(_OWORD *)&self->_playbackTimeChangedObserverInterval.value = v5;
  -[JFXCompositionPlayerViewController clipsPlayer](self, "clipsPlayer", a3->var0, *(_QWORD *)&a3->var1, a3->var3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPlaybackTimeChangedObserverInterval:", &v7);

}

- (void)resetPlaybackTimeChangedObserverInterval
{
  void *v3;
  void *v4;
  void *v5;
  CMTime v6;
  CMTime time1;
  CMTime v8;

  -[JFXCompositionPlayerViewController clipsPlayer](self, "clipsPlayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resetPlaybackTimeChangedObserverInterval");

  memset(&v8, 0, sizeof(v8));
  -[JFXCompositionPlayerViewController clipsPlayer](self, "clipsPlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    objc_msgSend(v4, "playbackTimeChangedObserverInterval");
  else
    memset(&v8, 0, sizeof(v8));

  if ((v8.flags & 1) != 0)
  {
    time1 = v8;
    v6 = *(CMTime *)*(_QWORD *)&MEMORY[0x24BDC0D88];
    if (CMTimeCompare(&time1, &v6))
      self->_playbackTimeChangedObserverInterval = ($95D729B680665BEAEFA1D6FCA8238556)v8;
  }
}

- (void)play
{
  -[JFXCompositionPlayerViewController playWithCompletionHandler:](self, "playWithCompletionHandler:", 0);
}

- (void)playWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[JFXCompositionPlayerViewController reloadClipDataSourceIfNeeded](self, "reloadClipDataSourceIfNeeded");
  -[JFXCompositionPlayerViewController clipsPlayer](self, "clipsPlayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __64__JFXCompositionPlayerViewController_playWithCompletionHandler___block_invoke;
  v7[3] = &unk_24EE5B388;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "play:", v7);

}

void __64__JFXCompositionPlayerViewController_playWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, char a3, void *a4)
{
  id v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = *(_QWORD *)(a1 + 40);
  if (v8)
    (*(void (**)(uint64_t, uint64_t))(v8 + 16))(v8, a2);
  if ((a3 & 1) == 0)
  {
    JFXLog_DebugPlayback();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "displayName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v10;
      _os_log_impl(&dword_2269A9000, v9, OS_LOG_TYPE_DEFAULT, "player %{public}@ Play began", (uint8_t *)&v11, 0xCu);

    }
  }

}

- (BOOL)isPlaying
{
  void *v2;
  char v3;

  -[JFXCompositionPlayerViewController clipsPlayer](self, "clipsPlayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPlaying");

  return v3;
}

- (void)pause
{
  -[JFXCompositionPlayerViewController pauseWithCompletionBlock:](self, "pauseWithCompletionBlock:", 0);
}

- (void)pauseWithCompletionBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[JFXCompositionPlayerViewController reloadClipDataSourceIfNeeded](self, "reloadClipDataSourceIfNeeded");
  -[JFXCompositionPlayerViewController clipsPlayer](self, "clipsPlayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __63__JFXCompositionPlayerViewController_pauseWithCompletionBlock___block_invoke;
  v7[3] = &unk_24EE5B3B0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "pause:", v7);

}

void __63__JFXCompositionPlayerViewController_pauseWithCompletionBlock___block_invoke(uint64_t a1, uint64_t a2, char a3, void *a4)
{
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  if ((a3 & 1) == 0)
  {
    JFXLog_DebugPlayback();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "displayName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v8;
      _os_log_impl(&dword_2269A9000, v7, OS_LOG_TYPE_DEFAULT, "player %{public}@ playback paused", (uint8_t *)&v10, 0xCu);

    }
  }
  v9 = *(_QWORD *)(a1 + 40);
  if (v9)
    (*(void (**)(void))(v9 + 16))();

}

- (void)setMuted:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  -[JFXCompositionPlayerViewController reloadClipDataSourceIfNeeded](self, "reloadClipDataSourceIfNeeded");
  -[JFXCompositionPlayerViewController clipsPlayer](self, "clipsPlayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAudioMuted:completionBlock:", v3, 0);

  -[JFXCompositionPlayerViewController setCachedMuted:](self, "setCachedMuted:", v3);
}

- (BOOL)isMuted
{
  void *v3;
  void *v4;
  char v5;

  -[JFXCompositionPlayerViewController clipsPlayer](self, "clipsPlayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[JFXCompositionPlayerViewController clipsPlayer](self, "clipsPlayer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isAudioMuted");

  }
  else
  {
    v5 = -[JFXCompositionPlayerViewController cachedMuted](self, "cachedMuted") != 0;
  }

  return v5;
}

+ (Class)compositionPlayerClass
{
  return (Class)objc_opt_class();
}

- (BOOL)shouldHandleMediaServerCrash
{
  return 1;
}

- (id)playerContainerView
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x24BDBCE88];
  v3 = *MEMORY[0x24BDBCAB0];
  v4 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("must override %@ in a subclass"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (id)placeholderContainerView
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x24BDBCE88];
  v3 = *MEMORY[0x24BDBCAB0];
  v4 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("must override %@ in a subclass"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (id)playerViewer
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x24BDBCE88];
  v3 = *MEMORY[0x24BDBCAB0];
  v4 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("must override %@ in a subclass"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (void)mediaserverdCrashed
{
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  dispatch_time_t v6;
  _QWORD block[4];
  id v8;
  id buf[2];

  JFXPlaybackEventSignpostPointCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v5 = JFXSignpostExclusiveID;
  if ((unint64_t)(JFXSignpostExclusiveID - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    LOWORD(buf[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_2269A9000, v4, OS_SIGNPOST_EVENT, v5, "MediaServerCrash", (const char *)&unk_226AC25B2, (uint8_t *)buf, 2u);
  }

  if (-[JFXCompositionPlayerViewController shouldHandleMediaServerCrash](self, "shouldHandleMediaServerCrash"))
  {
    -[JFXCompositionPlayerViewController unloadClipDataSourceSetPlaceHolder:](self, "unloadClipDataSourceSetPlaceHolder:", 1);
    if (-[JFXCompositionPlayerViewController cachedWasPlaying](self, "cachedWasPlaying"))
      -[JFXCompositionPlayerViewController playbackDidStop:currentTime:](self, "playbackDidStop:currentTime:", 0, -[JFXCompositionPlayerViewController cachedCurrentTime](self, "cachedCurrentTime"));
    objc_initWeak(buf, self);
    v6 = dispatch_time(0, 30000000);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __57__JFXCompositionPlayerViewController_mediaserverdCrashed__block_invoke;
    block[3] = &unk_24EE59648;
    objc_copyWeak(&v8, buf);
    dispatch_after(v6, MEMORY[0x24BDAC9B8], block);
    objc_destroyWeak(&v8);
    objc_destroyWeak(buf);
  }
}

void __57__JFXCompositionPlayerViewController_mediaserverdCrashed__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "reloadClipDataSourceIfNeeded");

}

- (void)playbackTimeDidChange:(id)a3 currentTime:(int)a4
{
  uint64_t v4;
  void *v6;
  char v7;
  void *v8;
  uint64_t v9;
  id v10;

  v4 = *(_QWORD *)&a4;
  -[JFXCompositionPlayerViewController delegate](self, "delegate", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[JFXCompositionPlayerViewController clipsDataSource](self, "clipsDataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "duration");

    -[JFXCompositionPlayerViewController setCachedDuration:](self, "setCachedDuration:", v9);
    -[JFXCompositionPlayerViewController setCachedCurrentTime:](self, "setCachedCurrentTime:", v4);
    if ((int)v9 >= (int)v4)
      v4 = v4;
    else
      v4 = v9;
    -[JFXCompositionPlayerViewController delegate](self, "delegate");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "playbackTimeDidChange:currentTime:", self, v4);

  }
}

- (void)playbackDidStart:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[JFXCompositionPlayerViewController setCachedWasPlaying:](self, "setCachedWasPlaying:", 1);
  -[JFXCompositionPlayerViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[JFXCompositionPlayerViewController delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "playbackDidStart:", self);

  }
}

- (void)playbackDidStop:(id)a3 currentTime:(int)a4
{
  uint64_t v4;
  void *v6;
  char v7;
  id v8;

  v4 = *(_QWORD *)&a4;
  -[JFXCompositionPlayerViewController setCachedWasPlaying:](self, "setCachedWasPlaying:", 0);
  -[JFXCompositionPlayerViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[JFXCompositionPlayerViewController delegate](self, "delegate");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "playbackDidStop:currentTime:", self, v4);

  }
}

- (void)playbackReadyForDisplayChanged:(id)a3 isReady:(BOOL)a4 setPlaceHolder:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;

  v5 = a5;
  v6 = a4;
  if (a4)
  {
    -[JFXCompositionPlayerViewController renderSizeInPixels](self, "renderSizeInPixels", a3);
    -[JFXCompositionPlayerViewController setCachedRenderSizeInPixels:](self, "setCachedRenderSizeInPixels:");
  }
  -[JFXCompositionPlayerViewController playerBecameReadyForDisplayChanged:setPlaceHolder:](self, "playerBecameReadyForDisplayChanged:setPlaceHolder:", v6, v5);
}

- (void)playerWillBeDestroyed:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[JFXCompositionPlayerViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[JFXCompositionPlayerViewController delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "updateFromPlayer:", 0);

  }
}

- (void)playerBecameReadyForDisplayChanged:(BOOL)a3 setPlaceHolder:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  char v12;
  NSObject *v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  const __CFString *v21;
  uint64_t v22;

  v4 = a4;
  v5 = a3;
  v22 = *MEMORY[0x24BDAC8D0];
  JFXLog_DebugPlayback();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    -[JFXCompositionPlayerViewController displayName](self, "displayName");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    v10 = CFSTR("NO");
    if (v5)
      v10 = CFSTR("YES");
    v18 = 138543618;
    v19 = v8;
    v20 = 2114;
    v21 = v10;
    _os_log_impl(&dword_2269A9000, v7, OS_LOG_TYPE_DEFAULT, "player %{public}@ readyForDisplay changed to %{public}@", (uint8_t *)&v18, 0x16u);

  }
  -[JFXCompositionPlayerViewController playerViewer](self, "playerViewer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isReadyForDisplay");

  if (v5 && (v12 & 1) == 0)
  {
    JFXLog_playback();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[JFXCompositionPlayerViewController playerBecameReadyForDisplayChanged:setPlaceHolder:].cold.1(self, v13);

    -[JFXCompositionPlayerViewController playerContainerView](self, "playerContainerView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setAlpha:", 0.0);

    goto LABEL_17;
  }
  if (v5)
    v15 = 1.0;
  else
    v15 = 0.0;
  -[JFXCompositionPlayerViewController playerContainerView](self, "playerContainerView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setAlpha:", v15);

  if (!v5)
  {
LABEL_17:
    if (v4)
    {
      -[JFXCompositionPlayerViewController placeHolderView](self, "placeHolderView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v17)
        -[JFXCompositionPlayerViewController preparePlaceHolder](self, "preparePlaceHolder");
      -[JFXCompositionPlayerViewController addPlaceHolder](self, "addPlaceHolder");
    }
    return;
  }
  if (!-[JFXCompositionPlayerViewController dontRemovePlaceHolderOnDisplay](self, "dontRemovePlaceHolderOnDisplay"))
    -[JFXCompositionPlayerViewController removePlaceHolder](self, "removePlaceHolder");
  -[JFXCompositionPlayerViewController prepareVideoDisplayView](self, "prepareVideoDisplayView");
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  objc_super v19;
  _QWORD block[5];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("videoBounds")))
  {
    -[JFXCompositionPlayerViewController playerViewer](self, "playerViewer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "videoBounds");
    v15 = v14;
    v17 = v16;

    if (v15 != *MEMORY[0x24BDBF148] || v17 != *(double *)(MEMORY[0x24BDBF148] + 8))
    {
      -[JFXCompositionPlayerViewController setLastPlayerViewBoundsSize:](self, "setLastPlayerViewBoundsSize:", v15, v17);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __85__JFXCompositionPlayerViewController_observeValueForKeyPath_ofObject_change_context___block_invoke;
      block[3] = &unk_24EE57B60;
      block[4] = self;
      dispatch_async(MEMORY[0x24BDAC9B8], block);
    }
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)JFXCompositionPlayerViewController;
    -[JFXCompositionPlayerViewController observeValueForKeyPath:ofObject:change:context:](&v19, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
  }

}

uint64_t __85__JFXCompositionPlayerViewController_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateVideoDisplayViewBounds");
}

- (void)setVideoContentMode:(int64_t)a3
{
  void *v4;
  id v5;

  self->_videoContentMode = a3;
  -[JFXCompositionPlayerViewController contentModeToVideoGravity:](self, "contentModeToVideoGravity:");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[JFXCompositionPlayerViewController playerViewer](self, "playerViewer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setVideoGravity:", v5);

}

- (id)contentModeToVideoGravity:(int64_t)a3
{
  id *v3;
  id *v4;

  v3 = (id *)MEMORY[0x24BDB1C70];
  v4 = (id *)MEMORY[0x24BDB1C80];
  if (a3 != 1)
    v4 = (id *)MEMORY[0x24BDB1C78];
  if (a3 != 2)
    v3 = v4;
  return *v3;
}

- (CGRect)videoDisplayBounds
{
  void *v2;
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
  double v14;
  CGRect result;

  -[JFXCompositionPlayerViewController playerViewer](self, "playerViewer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "videoBounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)prepareVideoDisplayView
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;

  -[JFXCompositionPlayerViewController videoDisplayOverlayView](self, "videoDisplayOverlayView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

  if (-[JFXCompositionPlayerViewController disableVideoDisplayGestures](self, "disableVideoDisplayGestures"))
  {
    -[JFXCompositionPlayerViewController view](self, "view");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setUserInteractionEnabled:", 1);

  }
  else
  {
    v4 = objc_alloc_init(MEMORY[0x24BDF6F90]);
    -[JFXCompositionPlayerViewController setVideoDisplayOverlayView:](self, "setVideoDisplayOverlayView:", v4);

    v5 = -[JFXCompositionPlayerViewController disableVideoDisplayGestures](self, "disableVideoDisplayGestures") ^ 1;
    -[JFXCompositionPlayerViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setUserInteractionEnabled:", v5);

    -[JFXCompositionPlayerViewController updateVideoDisplayViewBounds](self, "updateVideoDisplayViewBounds");
    -[JFXCompositionPlayerViewController installVideoDisplayGestures](self, "installVideoDisplayGestures");
  }
}

- (void)updateVideoDisplayViewBounds
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  void *v13;
  BOOL IsNull;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  CGRect v20;

  -[JFXCompositionPlayerViewController playerViewer](self, "playerViewer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "videoBounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[JFXCompositionPlayerViewController videoDisplayOverlayView](self, "videoDisplayOverlayView");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    v20.origin.x = v5;
    v20.origin.y = v7;
    v20.size.width = v9;
    v20.size.height = v11;
    IsNull = CGRectIsNull(v20);

    if (!IsNull)
    {
      -[JFXCompositionPlayerViewController videoDisplayOverlayView](self, "videoDisplayOverlayView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setFrame:", v5, v7, v9, v11);

      -[JFXCompositionPlayerViewController videoDisplayOverlayView](self, "videoDisplayOverlayView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "superview");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v17)
      {
        -[JFXCompositionPlayerViewController view](self, "view");
        v19 = (id)objc_claimAutoreleasedReturnValue();
        -[JFXCompositionPlayerViewController videoDisplayOverlayView](self, "videoDisplayOverlayView");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addSubview:", v18);

      }
    }
  }
}

- (CGSize)playerViewBoundsSize
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  -[JFXCompositionPlayerViewController playerViewer](self, "playerViewer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "videoBounds");
  v5 = v4;
  v7 = v6;

  if (v5 <= 0.0 || v7 <= 0.0)
  {
    -[JFXCompositionPlayerViewController lastPlayerViewBoundsSize](self, "lastPlayerViewBoundsSize");
  }
  else
  {
    v8 = v5;
    v9 = v7;
  }
  result.height = v9;
  result.width = v8;
  return result;
}

- (CGPoint)convertPointInPlaybackSizeToClipPoint:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  -[JFXCompositionPlayerViewController playerViewBoundsSize](self, "playerViewBoundsSize");
  v7 = v6;
  v9 = v8;
  -[JFXCompositionPlayerViewController clipsDataSource](self, "clipsDataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "renderSize");
  v12 = v11;
  v14 = v13;

  v15 = x * (v12 / v7);
  v16 = y * (v14 / v9);
  result.y = v16;
  result.x = v15;
  return result;
}

- (CGPoint)convertPointInPlaybackSizeToClipPointNormalized:(CGPoint)a3
{
  double y;
  double x;
  double v5;
  double v6;
  double v7;
  double v8;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  -[JFXCompositionPlayerViewController playerViewBoundsSize](self, "playerViewBoundsSize");
  v6 = x / v5;
  v8 = y / v7;
  result.y = v8;
  result.x = v6;
  return result;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)normalizedMinimumTouchSize
{
  double v2;
  double v3;
  double v4;
  double v5;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  -[JFXCompositionPlayerViewController playerViewBoundsSize](self, "playerViewBoundsSize");
  v3 = 44.0 / v2;
  v5 = 44.0 / v4;
  result.var1 = v5;
  result.var0 = v3;
  return result;
}

- (void)setDisableVideoDisplayGestures:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  self->_disableVideoDisplayGestures = a3;
  v3 = !a3;
  -[JFXCompositionPlayerViewController view](self, "view");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUserInteractionEnabled:", v3);

}

- (void)installVideoDisplayGestures
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  -[JFXCompositionPlayerViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "gestureRecognizers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (!v5)
  {
    v15 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E80]), "initWithTarget:action:", self, sel_playbackAreaTapped_);
    objc_msgSend(v15, "setDelegate:", self);
    -[JFXCompositionPlayerViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addGestureRecognizer:", v15);

    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6C38]), "initWithTarget:action:", self, sel_playbackAreaPanned_);
    objc_msgSend(v7, "setDelegate:", self);
    -[JFXCompositionPlayerViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addGestureRecognizer:", v7);

    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6C60]), "initWithTarget:action:", self, sel_playbackAreaPinched_);
    objc_msgSend(v9, "setDelegate:", self);
    -[JFXCompositionPlayerViewController view](self, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addGestureRecognizer:", v9);

    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6D18]), "initWithTarget:action:", self, sel_playbackAreaRotated_);
    objc_msgSend(v11, "setDelegate:", self);
    -[JFXCompositionPlayerViewController view](self, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addGestureRecognizer:", v11);

    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E80]), "initWithTarget:action:", self, sel_playbackAreaDoubleTapped_);
    objc_msgSend(v13, "setNumberOfTapsRequired:", 2);
    -[JFXCompositionPlayerViewController view](self, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addGestureRecognizer:", v13);

  }
}

- (void)playbackAreaTapped:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  id v23;

  v23 = a3;
  -[JFXCompositionPlayerViewController videoDisplayOverlayView](self, "videoDisplayOverlayView");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[JFXCompositionPlayerViewController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      -[JFXCompositionPlayerViewController videoDisplayOverlayView](self, "videoDisplayOverlayView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "locationInView:", v8);
      v10 = v9;
      v12 = v11;

      -[JFXCompositionPlayerViewController convertPointInPlaybackSizeToClipPointNormalized:](self, "convertPointInPlaybackSizeToClipPointNormalized:", v10, v12);
      v14 = v13;
      v16 = v15;
      -[JFXCompositionPlayerViewController normalizedMinimumTouchSize](self, "normalizedMinimumTouchSize");
      v18 = v17;
      v20 = v19;
      -[JFXCompositionPlayerViewController delegate](self, "delegate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[JFXCompositionPlayerViewController clipsPlayer](self, "clipsPlayer");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "playbackAreaTapped:normalizedClipPoint:normalizedMinimumSize:atTime:", self, objc_msgSend(v22, "currentTime"), v14, v16, v18, v20);

    }
  }

}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v5;
  id v6;
  char isKindOfClass;
  char v8;
  char v9;

  v5 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    v8 = objc_opt_isKindOfClass();
  }
  v9 = isKindOfClass & v8;

  return v9 & 1;
}

- (void)playbackAreaPanned:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;

  v36 = a3;
  -[JFXCompositionPlayerViewController videoDisplayOverlayView](self, "videoDisplayOverlayView");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[JFXCompositionPlayerViewController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      -[JFXCompositionPlayerViewController videoDisplayOverlayView](self, "videoDisplayOverlayView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "locationInView:", v8);
      v10 = v9;
      v12 = v11;

      -[JFXCompositionPlayerViewController videoDisplayOverlayView](self, "videoDisplayOverlayView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "translationInView:", v13);
      v15 = v14;
      v17 = v16;

      -[JFXCompositionPlayerViewController convertPointInPlaybackSizeToClipPointNormalized:](self, "convertPointInPlaybackSizeToClipPointNormalized:", v10, v12);
      v19 = v18;
      v21 = v20;
      -[JFXCompositionPlayerViewController convertPointInPlaybackSizeToClipPointNormalized:](self, "convertPointInPlaybackSizeToClipPointNormalized:", v15, v17);
      v23 = v22;
      v25 = v24;
      -[JFXCompositionPlayerViewController normalizedMinimumTouchSize](self, "normalizedMinimumTouchSize");
      v27 = v26;
      v29 = v28;
      -[JFXCompositionPlayerViewController delegate](self, "delegate");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[JFXCompositionPlayerViewController clipsPlayer](self, "clipsPlayer");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "currentTime");
      -[JFXCompositionPlayerViewController clipsPlayer](self, "clipsPlayer");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "clipsDataSource");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "playbackAreaPanned:gesture:normalizedClipPoint:normalizedMinimumSize:translationDelta:atTime:timeScale:", self, v36, v32, objc_msgSend(v34, "timeScale"), v19, v21, v27, v29, v23, v25);

    }
  }
  -[JFXCompositionPlayerViewController videoDisplayOverlayView](self, "videoDisplayOverlayView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setTranslation:inView:", v35, *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));

}

- (void)playbackAreaPinched:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  unint64_t v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  id v44;

  v44 = a3;
  -[JFXCompositionPlayerViewController videoDisplayOverlayView](self, "videoDisplayOverlayView");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[JFXCompositionPlayerViewController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      -[JFXCompositionPlayerViewController playerViewer](self, "playerViewer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "videoBounds");
      v10 = v9;
      v12 = v11;

      -[JFXCompositionPlayerViewController videoDisplayOverlayView](self, "videoDisplayOverlayView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "bounds");
      v15 = v14;
      v17 = v16;

      if (v10 > 0.0 && v12 > 0.0 && v15 > 0.0 && v17 > 0.0)
      {
        v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v44, "numberOfTouches"));
        if (objc_msgSend(v44, "numberOfTouches"))
        {
          v19 = 0;
          do
          {
            -[JFXCompositionPlayerViewController videoDisplayOverlayView](self, "videoDisplayOverlayView");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "locationOfTouch:inView:", v19, v20);
            v22 = v21;
            v24 = v23;

            -[JFXCompositionPlayerViewController convertPointInPlaybackSizeToClipPointNormalized:](self, "convertPointInPlaybackSizeToClipPointNormalized:", v22, v24);
            objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "addObject:", v25);

            ++v19;
          }
          while (v19 < objc_msgSend(v44, "numberOfTouches"));
        }
        -[JFXCompositionPlayerViewController videoDisplayOverlayView](self, "videoDisplayOverlayView");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "locationInView:", v26);
        v28 = v27;
        v30 = v29;

        v31 = v28 / v15;
        v32 = v30 / v17;
        -[JFXCompositionPlayerViewController normalizedMinimumTouchSize](self, "normalizedMinimumTouchSize");
        v34 = v33;
        v36 = v35;
        -[JFXCompositionPlayerViewController delegate](self, "delegate");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "scale");
        v39 = v38;
        -[JFXCompositionPlayerViewController clipsPlayer](self, "clipsPlayer");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = objc_msgSend(v40, "currentTime");
        -[JFXCompositionPlayerViewController clipsPlayer](self, "clipsPlayer");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "clipsDataSource");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "playbackAreaPinched:gesture:normalizedClipPoints:normalizedCenterPoint:normalizedMinimumSize:scaleDelta:atTime:timeScale:", self, v44, v18, v41, objc_msgSend(v43, "timeScale"), v31, v32, v34, v36, v39);

      }
    }
  }
  objc_msgSend(v44, "setScale:", 1.0);

}

- (void)playbackAreaRotated:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  unint64_t v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  id v41;

  v41 = a3;
  -[JFXCompositionPlayerViewController videoDisplayOverlayView](self, "videoDisplayOverlayView");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[JFXCompositionPlayerViewController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      -[JFXCompositionPlayerViewController playerViewer](self, "playerViewer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "videoBounds");
      v10 = v9;
      v12 = v11;

      -[JFXCompositionPlayerViewController videoDisplayOverlayView](self, "videoDisplayOverlayView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "bounds");
      v15 = v14;
      v17 = v16;

      if (v10 > 0.0 && v12 > 0.0 && v15 > 0.0 && v17 > 0.0)
      {
        v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v41, "numberOfTouches"));
        if (objc_msgSend(v41, "numberOfTouches"))
        {
          v19 = 0;
          do
          {
            -[JFXCompositionPlayerViewController videoDisplayOverlayView](self, "videoDisplayOverlayView");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "locationOfTouch:inView:", v19, v20);
            v22 = v21;
            v24 = v23;

            -[JFXCompositionPlayerViewController convertPointInPlaybackSizeToClipPointNormalized:](self, "convertPointInPlaybackSizeToClipPointNormalized:", v22, v24);
            objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "addObject:", v25);

            ++v19;
          }
          while (v19 < objc_msgSend(v41, "numberOfTouches"));
        }
        -[JFXCompositionPlayerViewController videoDisplayOverlayView](self, "videoDisplayOverlayView");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "locationInView:", v26);
        v28 = v27;
        v30 = v29;

        v31 = v28 / v15;
        v32 = v30 / v17;
        -[JFXCompositionPlayerViewController normalizedMinimumTouchSize](self, "normalizedMinimumTouchSize");
        v34 = v33;
        v36 = v35;
        -[JFXCompositionPlayerViewController delegate](self, "delegate");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "rotation");
        v39 = v38;
        -[JFXCompositionPlayerViewController clipsPlayer](self, "clipsPlayer");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "playbackAreaRotated:gesture:normalizedClipPoints:normalizedCenterPoint:normalizedMinimumSize:rotateDelta:atTime:", self, v41, v18, objc_msgSend(v40, "currentTime"), v31, v32, v34, v36, v39);

      }
    }
  }
  objc_msgSend(v41, "setRotation:", 0.0);

}

- (void)playbackAreaDoubleTapped:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[JFXCompositionPlayerViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[JFXCompositionPlayerViewController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "playbackAreaDoubleTapped:", v7);

  }
}

- (id)viewToFlash
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[JFXCompositionPlayerViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "superview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "superview");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "superview");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "superview");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)beginFlash
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("flashViewOnCompositionUpdate"));

  if (v4)
  {
    -[JFXCompositionPlayerViewController viewToFlash](self, "viewToFlash");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "backgroundColor");
    v11 = (id)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(MEMORY[0x24BDF6950], "purpleColor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v11, "isEqual:", v6);

      if ((v7 & 1) == 0)
      {
        -[JFXCompositionPlayerViewController setRestoreToColor:](self, "setRestoreToColor:", v11);
        objc_msgSend(MEMORY[0x24BDF6950], "purpleColor");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[JFXCompositionPlayerViewController viewToFlash](self, "viewToFlash");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setBackgroundColor:", v8);

        -[JFXCompositionPlayerViewController viewToFlash](self, "viewToFlash");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[JFXCompositionPlayerViewController setViewFlashed:](self, "setViewFlashed:", v10);

      }
    }

  }
}

- (void)endFlash
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  id v11;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("flashViewOnCompositionUpdate"));

  if (v4)
  {
    -[JFXCompositionPlayerViewController viewFlashed](self, "viewFlashed");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "backgroundColor");
    v11 = (id)objc_claimAutoreleasedReturnValue();

    -[JFXCompositionPlayerViewController restoreToColor](self, "restoreToColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 && v11)
    {
      objc_msgSend(MEMORY[0x24BDF6950], "purpleColor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v11, "isEqual:", v7);

      if (v8)
      {
        -[JFXCompositionPlayerViewController restoreToColor](self, "restoreToColor");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[JFXCompositionPlayerViewController viewFlashed](self, "viewFlashed");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setBackgroundColor:", v9);

        -[JFXCompositionPlayerViewController setRestoreToColor:](self, "setRestoreToColor:", 0);
        -[JFXCompositionPlayerViewController setViewFlashed:](self, "setViewFlashed:", 0);
      }
    }
    else
    {

    }
  }
}

- (JFXCompositionPlayerViewControllerDelegate)delegate
{
  return (JFXCompositionPlayerViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (JFXCompositionPlayableElementsDataSource)clipsDataSource
{
  return (JFXCompositionPlayableElementsDataSource *)objc_loadWeakRetained((id *)&self->_clipsDataSource);
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1008);
}

- (unsigned)parentCode
{
  return self->_parentCode;
}

- (void)setParentCode:(unsigned int)a3
{
  self->_parentCode = a3;
}

- (BOOL)disableVideoDisplayGestures
{
  return self->_disableVideoDisplayGestures;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)playbackTimeChangedObserverInterval
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 1112);
  return self;
}

- (int64_t)videoContentMode
{
  return self->_videoContentMode;
}

- (BOOL)isDisplaying
{
  return self->_isDisplaying;
}

- (UIView)videoDisplayOverlayView
{
  return self->_videoDisplayOverlayView;
}

- (void)setVideoDisplayOverlayView:(id)a3
{
  objc_storeStrong((id *)&self->_videoDisplayOverlayView, a3);
}

- (JFXCompositionPlayer)clipsPlayer
{
  return self->_clipsPlayer;
}

- (void)setClipsPlayer:(id)a3
{
  objc_storeStrong((id *)&self->_clipsPlayer, a3);
}

- (BOOL)dontRemovePlaceHolderOnDisplay
{
  return self->_dontRemovePlaceHolderOnDisplay;
}

- (void)setDontRemovePlaceHolderOnDisplay:(BOOL)a3
{
  self->_dontRemovePlaceHolderOnDisplay = a3;
}

- (int)cachedDuration
{
  return self->_cachedDuration;
}

- (void)setCachedDuration:(int)a3
{
  self->_cachedDuration = a3;
}

- (int)cachedCurrentTime
{
  return self->_cachedCurrentTime;
}

- (void)setCachedCurrentTime:(int)a3
{
  self->_cachedCurrentTime = a3;
}

- (int)cachedMuted
{
  return self->_cachedMuted;
}

- (void)setCachedMuted:(int)a3
{
  self->_cachedMuted = a3;
}

- (BOOL)cachedWasPlaying
{
  return self->_cachedWasPlaying;
}

- (void)setCachedWasPlaying:(BOOL)a3
{
  self->_cachedWasPlaying = a3;
}

- (CGSize)cachedRenderSizeInPixels
{
  double width;
  double height;
  CGSize result;

  width = self->_cachedRenderSizeInPixels.width;
  height = self->_cachedRenderSizeInPixels.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setCachedRenderSizeInPixels:(CGSize)a3
{
  self->_cachedRenderSizeInPixels = a3;
}

- (UIView)viewFlashed
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_viewFlashed);
}

- (void)setViewFlashed:(id)a3
{
  objc_storeWeak((id *)&self->_viewFlashed, a3);
}

- (UIColor)restoreToColor
{
  return self->_restoreToColor;
}

- (void)setRestoreToColor:(id)a3
{
  objc_storeStrong((id *)&self->_restoreToColor, a3);
}

- (CGSize)lastPlayerViewSize
{
  double width;
  double height;
  CGSize result;

  width = self->_lastPlayerViewSize.width;
  height = self->_lastPlayerViewSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setLastPlayerViewSize:(CGSize)a3
{
  self->_lastPlayerViewSize = a3;
}

- (CGSize)lastPlayerViewBoundsSize
{
  double width;
  double height;
  CGSize result;

  width = self->_lastPlayerViewBoundsSize.width;
  height = self->_lastPlayerViewBoundsSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setLastPlayerViewBoundsSize:(CGSize)a3
{
  self->_lastPlayerViewBoundsSize = a3;
}

- (UIView)placeHolderView
{
  return self->_placeHolderView;
}

- (void)setPlaceHolderView:(id)a3
{
  objc_storeStrong((id *)&self->_placeHolderView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeHolderView, 0);
  objc_storeStrong((id *)&self->_restoreToColor, 0);
  objc_destroyWeak((id *)&self->_viewFlashed);
  objc_storeStrong((id *)&self->_clipsPlayer, 0);
  objc_storeStrong((id *)&self->_videoDisplayOverlayView, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_destroyWeak((id *)&self->_clipsDataSource);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)appWillResignActive:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "displayName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_debug_impl(&dword_2269A9000, a2, OS_LOG_TYPE_DEBUG, "player %@ resigned active. pause playback and prepare placeholder", (uint8_t *)&v4, 0xCu);

  OUTLINED_FUNCTION_3();
}

void __49__JFXCompositionPlayerViewController_seekToTime___block_invoke_cold_1(uint64_t a1, char a2, NSObject *a3)
{
  void *v6;
  const __CFString *v7;
  int v8;
  int v9;
  void *v10;
  __int16 v11;
  const __CFString *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = CFSTR("completed");
  v8 = *(_DWORD *)(a1 + 40);
  v9 = 138412802;
  v10 = v6;
  if ((a2 & 1) != 0)
    v7 = CFSTR("throttled");
  v11 = 2112;
  v12 = v7;
  v13 = 1024;
  v14 = v8;
  _os_log_debug_impl(&dword_2269A9000, a3, OS_LOG_TYPE_DEBUG, "Player %@ seek %@ for time %d", (uint8_t *)&v9, 0x1Cu);

}

- (void)playerBecameReadyForDisplayChanged:(void *)a1 setPlaceHolder:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "displayName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138543362;
  v5 = v3;
  _os_log_error_impl(&dword_2269A9000, a2, OS_LOG_TYPE_ERROR, "player %{public}@ reported ready but wasn't really ready", (uint8_t *)&v4, 0xCu);

  OUTLINED_FUNCTION_3();
}

@end
