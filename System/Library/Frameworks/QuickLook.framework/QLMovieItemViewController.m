@implementation QLMovieItemViewController

- (QLMovieItemViewController)init
{
  QLMovieItemViewController *v2;
  uint64_t v3;
  QLMovieEdits *editsSinceLastSave;
  uint64_t v5;
  QLMovieEdits *edits;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)QLMovieItemViewController;
  v2 = -[QLScrollableContentItemViewController init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    editsSinceLastSave = v2->_editsSinceLastSave;
    v2->_editsSinceLastSave = (QLMovieEdits *)v3;

    v5 = objc_opt_new();
    edits = v2->_edits;
    v2->_edits = (QLMovieEdits *)v5;

  }
  return v2;
}

- (void)loadPreviewControllerWithContents:(id)a3 context:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  objc_super v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[QLScrollableContentItemViewController setShouldFit:](self, "setShouldFit:", 1);
  objc_initWeak(&location, self);
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __89__QLMovieItemViewController_loadPreviewControllerWithContents_context_completionHandler___block_invoke;
  v13[3] = &unk_24C725118;
  v11 = v10;
  v14 = v11;
  objc_copyWeak(&v15, &location);
  v12.receiver = self;
  v12.super_class = (Class)QLMovieItemViewController;
  -[QLMediaItemViewController loadPreviewControllerWithContents:context:completionHandler:](&v12, sel_loadPreviewControllerWithContents_context_completionHandler_, v8, v9, v13);
  objc_destroyWeak(&v15);

  objc_destroyWeak(&location);
}

void __89__QLMovieItemViewController_loadPreviewControllerWithContents_context_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject **v4;
  NSObject *v5;
  uint64_t v6;
  id WeakRetained;
  void *v8;
  NSObject *v9;
  NSObject **v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (!v3)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    if (WeakRetained)
    {
      v8 = objc_loadWeakRetained((id *)(a1 + 40));
      objc_msgSend(v8, "_setupWithCompletionHandler:", *(_QWORD *)(a1 + 32));
    }
    else
    {
      v9 = *MEMORY[0x24BE7BF48];
      if (!*MEMORY[0x24BE7BF48])
      {
        v10 = (NSObject **)MEMORY[0x24BE7BF48];
        QLSInitLogging();
        v9 = *v10;
      }
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v11) = 0;
        _os_log_impl(&dword_20D4F5000, v9, OS_LOG_TYPE_ERROR, "Could not setup media item view controller because it has been deallocated #Media", (uint8_t *)&v11, 2u);
      }
      if (!*(_QWORD *)(a1 + 32))
        goto LABEL_17;
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE7BF30], 0, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    }

LABEL_17:
    goto LABEL_18;
  }
  v4 = (NSObject **)MEMORY[0x24BE7BF48];
  v5 = *MEMORY[0x24BE7BF48];
  if (!*MEMORY[0x24BE7BF48])
  {
    QLSInitLogging();
    v5 = *v4;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v11 = 138412290;
    v12 = v3;
    _os_log_impl(&dword_20D4F5000, v5, OS_LOG_TYPE_ERROR, "Error while attempting to load media item view controller: %@ #Media", (uint8_t *)&v11, 0xCu);
  }
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
LABEL_18:

}

- (void)_setupWithCompletionHandler:(id)a3
{
  void *v4;
  QLOverlayPlayButton *v5;
  QLOverlayPlayButton *playButton;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QLMovieScrubberViewContainer *v16;
  UIView *scrubberContainer;
  void *v18;
  void *v19;
  id v20;

  v20 = a3;
  -[QLMediaItemBaseViewController imageSize](self, "imageSize");
  -[QLMovieItemViewController setPreferredContentSize:](self, "setPreferredContentSize:");
  -[QLMovieItemViewController loadAssetMetadata](self, "loadAssetMetadata");
  -[QLMediaItemBaseViewController player](self, "player");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, CFSTR("externalPlaybackActive"), 3, &QLMovieItemViewControllerContext);

  self->_isObservingPlayerExternalPlaybackActive = 1;
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    v5 = objc_alloc_init(QLOverlayPlayButton);
    playButton = self->_playButton;
    self->_playButton = v5;

    -[QLOverlayPlayButton setTarget:action:](self->_playButton, "setTarget:action:", self, sel_play);
    -[QLOverlayPlayButton setAlpha:](self->_playButton, "setAlpha:", 0.0);
    -[QLOverlayPlayButton setTranslatesAutoresizingMaskIntoConstraints:](self->_playButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[QLMovieItemViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", self->_playButton);

    -[QLMovieItemViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x24BDD1628];
    -[QLMovieItemViewController view](self, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v10, 9, 0, self->_playButton, 9, 1.0, 0.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addConstraint:", v11);

    -[QLMovieItemViewController view](self, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x24BDD1628];
    -[QLMovieItemViewController view](self, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v14, 10, 0, self->_playButton, 10, 1.0, 0.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addConstraint:", v15);

    v16 = objc_alloc_init(_QLMovieScrubberViewContainer);
    scrubberContainer = self->_scrubberContainer;
    self->_scrubberContainer = &v16->super;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_scrubberContainer, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView setUserInteractionEnabled:](self->_scrubberContainer, "setUserInteractionEnabled:", 1);
    -[UIView setDeliversTouchesForGesturesToSuperview:](self->_scrubberContainer, "setDeliversTouchesForGesturesToSuperview:", 0);
    -[UIView setAlpha:](self->_scrubberContainer, "setAlpha:", 1.0);
  }
  -[QLMediaItemBaseViewController mediaAsset](self, "mediaAsset");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  self->_assetCanBeRotated = objc_msgSend(v18, "ql_canBeRotated");

  -[QLMovieItemViewController _setupEditBehavior](self, "_setupEditBehavior");
  v19 = v20;
  if (v20)
  {
    (*((void (**)(id, _QWORD))v20 + 2))(v20, 0);
    v19 = v20;
  }

}

- (void)addScrubberIfNeededWithDeferral
{
  dispatch_time_t v3;
  _QWORD v4[4];
  id v5;
  id location;

  if ((_os_feature_enabled_impl() & 1) == 0 && !self->_scrubber)
  {
    if (self->_scrubberContainer)
    {
      objc_initWeak(&location, self);
      v3 = dispatch_time(0, 1000000000);
      v4[0] = MEMORY[0x24BDAC760];
      v4[1] = 3221225472;
      v4[2] = __60__QLMovieItemViewController_addScrubberIfNeededWithDeferral__block_invoke;
      v4[3] = &unk_24C725230;
      objc_copyWeak(&v5, &location);
      dispatch_after(v3, MEMORY[0x24BDAC9B8], v4);
      objc_destroyWeak(&v5);
      objc_destroyWeak(&location);
    }
  }
}

void __60__QLMovieItemViewController_addScrubberIfNeededWithDeferral__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "addScrubberIfNeeded");

}

- (void)addScrubberIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  UIScrollView *v14;
  UIScrollView *scrubberContainerScrollView;
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
  UIView *scrubberContainer;
  void *v32;
  UIScrollView *v33;
  void *v34;
  void *v35;
  UIView *v36;
  void *v37;
  UIScrollView *v38;
  void *v39;
  void *v40;
  _QWORD v41[4];
  id v42;
  id location;
  const __CFString *v44;
  UIScrollView *v45;
  const __CFString *v46;
  _QWORD v47[2];

  v47[1] = *MEMORY[0x24BDAC8D0];
  -[QLMovieItemViewController scrubber](self, "scrubber");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3 && self->_previewIsVisisble)
  {
    v4 = (void *)objc_opt_new();
    -[QLMovieItemViewController setScrubber:](self, "setScrubber:", v4);

    -[QLMediaItemBaseViewController player](self, "player");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLMovieItemViewController scrubber](self, "scrubber");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "photosScrubber");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPlayer:", v5);

    -[QLMediaItemBaseViewController mediaDuration](self, "mediaDuration");
    v9 = v8;
    -[QLMovieItemViewController scrubber](self, "scrubber");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "photosScrubber");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setEstimatedDuration:", v9);

    -[QLMovieItemViewController _setupScrubberPlaceholderThumbnail](self, "_setupScrubberPlaceholderThumbnail");
    -[QLMovieItemViewController scrubber](self, "scrubber");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "scrollView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setContentInsetAdjustmentBehavior:", 2);

    v14 = (UIScrollView *)objc_opt_new();
    scrubberContainerScrollView = self->_scrubberContainerScrollView;
    self->_scrubberContainerScrollView = v14;

    -[UIScrollView setTranslatesAutoresizingMaskIntoConstraints:](self->_scrubberContainerScrollView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIScrollView setShowsHorizontalScrollIndicator:](self->_scrubberContainerScrollView, "setShowsHorizontalScrollIndicator:", 0);
    -[UIScrollView setBounces:](self->_scrubberContainerScrollView, "setBounces:", 0);
    -[QLMovieItemViewController scrubber](self, "scrubber");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[QLMovieItemViewController scrubber](self, "scrubber");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObserver:forKeyPath:options:context:", self, CFSTR("userInteractingWithScrubber"), 0, &QLMovieItemViewControllerContext);

    -[QLVideoScrubberView setAlpha:](self->_scrubber, "setAlpha:", 0.0);
    objc_initWeak(&location, self);
    v18 = (void *)MEMORY[0x24BEBDB00];
    v41[0] = MEMORY[0x24BDAC760];
    v41[1] = 3221225472;
    v41[2] = __48__QLMovieItemViewController_addScrubberIfNeeded__block_invoke;
    v41[3] = &unk_24C725230;
    objc_copyWeak(&v42, &location);
    objc_msgSend(v18, "animateWithDuration:animations:", v41, 0.2);
    -[UIScrollView addSubview:](self->_scrubberContainerScrollView, "addSubview:", self->_scrubber);
    -[UIView addSubview:](self->_scrubberContainer, "addSubview:", self->_scrubberContainerScrollView);
    -[UIView leadingAnchor](self->_scrubberContainer, "leadingAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLVideoScrubberView leadingAnchor](self->_scrubber, "leadingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setActive:", 1);

    -[UIView trailingAnchor](self->_scrubberContainer, "trailingAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLVideoScrubberView trailingAnchor](self->_scrubber, "trailingAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setActive:", 1);

    -[UIView topAnchor](self->_scrubberContainer, "topAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLVideoScrubberView topAnchor](self->_scrubber, "topAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setActive:", 1);

    -[UIView bottomAnchor](self->_scrubberContainer, "bottomAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLVideoScrubberView bottomAnchor](self->_scrubber, "bottomAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setActive:", 1);

    scrubberContainer = self->_scrubberContainer;
    v32 = (void *)MEMORY[0x24BDD1628];
    v33 = self->_scrubberContainerScrollView;
    v46 = CFSTR("scrubberContainerScrollView");
    v47[0] = v33;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v47, &v46, 1);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[scrubberContainerScrollView]|"), 0, 0, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addConstraints:](scrubberContainer, "addConstraints:", v35);

    v36 = self->_scrubberContainer;
    v37 = (void *)MEMORY[0x24BDD1628];
    v38 = self->_scrubberContainerScrollView;
    v44 = CFSTR("scrubberContainerScrollView");
    v45 = v38;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[scrubberContainerScrollView]|"), 0, 0, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addConstraints:](v36, "addConstraints:", v40);

    -[QLMovieItemViewController showTimeLabelIfNeeded](self, "showTimeLabelIfNeeded");
    objc_destroyWeak(&v42);
    objc_destroyWeak(&location);
  }
}

void __48__QLMovieItemViewController_addScrubberIfNeeded__block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "scrubber");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

- (void)_setupScrubberPlaceholderThumbnail
{
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id location;

  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    objc_initWeak(&location, self);
    -[QLItemViewController context](self, "context");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "thumbnailGenerator");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __63__QLMovieItemViewController__setupScrubberPlaceholderThumbnail__block_invoke;
    v5[3] = &unk_24C726740;
    objc_copyWeak(&v6, &location);
    objc_msgSend(v4, "generateThumbnailWithSize:completionBlock:", v5, 30.0, 30.0);

    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

void __63__QLMovieItemViewController__setupScrubberPlaceholderThumbnail__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __63__QLMovieItemViewController__setupScrubberPlaceholderThumbnail__block_invoke_2;
  v5[3] = &unk_24C725348;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v5);

  objc_destroyWeak(&v7);
}

void __63__QLMovieItemViewController__setupScrubberPlaceholderThumbnail__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  id WeakRetained;

  v1 = *(_QWORD *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "scrubber");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "photosScrubber");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPlaceholderThumbnail:", v1);

}

- (id)setupPlayerViewWithPlayer:(id)a3
{
  objc_class *v4;
  id v5;
  AVPlayerViewController *v6;
  AVPlayerViewController *playerViewController;
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
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  char v30;
  void *v31;
  void *v32;
  uint64_t v34;
  void *v35;
  const __CFString *v36;
  void *v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x24BDAC8D0];
  v4 = (objc_class *)MEMORY[0x24BDB27C0];
  v5 = a3;
  v6 = (AVPlayerViewController *)objc_alloc_init(v4);
  playerViewController = self->_playerViewController;
  self->_playerViewController = v6;

  -[AVPlayerViewController setAllowsVideoFrameAnalysis:](self->_playerViewController, "setAllowsVideoFrameAnalysis:", 1);
  -[AVPlayerViewController setUpdatesNowPlayingInfoCenter:](self->_playerViewController, "setUpdatesNowPlayingInfoCenter:", 1);
  -[AVPlayerViewController view](self->_playerViewController, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBackgroundColor:", 0);

  -[AVPlayerViewController setShowsPlaybackControls:](self->_playerViewController, "setShowsPlaybackControls:", _os_feature_enabled_impl());
  -[AVPlayerViewController setPlayer:](self->_playerViewController, "setPlayer:", v5);

  -[AVPlayerViewController setAllowsPictureInPicturePlayback:](self->_playerViewController, "setAllowsPictureInPicturePlayback:", 0);
  -[AVPlayerViewController setDelegate:](self->_playerViewController, "setDelegate:", self);
  -[AVPlayerViewController setShowsExitFullScreenButton:](self->_playerViewController, "setShowsExitFullScreenButton:", 0);
  if (_os_feature_enabled_impl())
  {
    -[AVPlayerViewController configuration](self->_playerViewController, "configuration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setExcludedControls:", objc_msgSend(v9, "excludedControls") | 0x1FD0);
    objc_msgSend(v9, "setPrefersFullScreenStyleForEmbeddedMode:", 1);
    -[AVPlayerViewController setConfiguration:](self->_playerViewController, "setConfiguration:", v9);
    -[AVPlayerViewController setPrefersDeviceUserInterfaceStyle:](self->_playerViewController, "setPrefersDeviceUserInterfaceStyle:", 1);

  }
  -[QLMovieItemViewController _metadataItemTitle](self, "_metadataItemTitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v38, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVPlayerViewController player](self->_playerViewController, "player");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "currentItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setExternalMetadata:", v11);

  -[AVPlayerViewController view](self->_playerViewController, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[QLMovieItemViewController addChildViewController:](self, "addChildViewController:", self->_playerViewController);
  -[QLMovieItemViewController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVPlayerViewController view](self->_playerViewController, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addSubview:", v16);

  -[AVPlayerViewController didMoveToParentViewController:](self->_playerViewController, "didMoveToParentViewController:", self);
  -[QLMovieItemViewController view](self, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)MEMORY[0x24BDD1628];
  v36 = CFSTR("player");
  -[AVPlayerViewController view](self->_playerViewController, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v19;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[player]|"), 0, 0, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addConstraints:", v21);

  -[QLMovieItemViewController view](self, "view");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)MEMORY[0x24BDD1628];
  -[AVPlayerViewController view](self->_playerViewController, "view", CFSTR("player"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v24;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[player]|"), 0, 0, v25);
  v26 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addConstraints:", v26);

  -[QLMovieItemViewController playerViewController](self, "playerViewController");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v26) = objc_opt_respondsToSelector();

  if ((v26 & 1) != 0)
  {
    -[QLMovieItemViewController playerViewController](self, "playerViewController");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "addObserver:forKeyPath:options:context:", self, CFSTR("analysisInteractionInProgress"), 5, &QLMovieItemViewControllerContext);

  }
  -[QLMovieItemViewController playerViewController](self, "playerViewController");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_opt_respondsToSelector();

  if ((v30 & 1) != 0)
  {
    -[QLMovieItemViewController playerViewController](self, "playerViewController");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "addObserver:forKeyPath:options:context:", self, CFSTR("toggleLookupAction"), 5, &QLMovieItemViewControllerContext);

  }
  -[QLMovieItemViewController playerViewController](self, "playerViewController");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "addObserver:forKeyPath:options:context:", self, CFSTR("videoBounds"), 5, &QLMovieItemViewControllerContext);

  return self->_playerViewContainer;
}

- (id)_metadataItemTitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDDC7B8];
  -[QLMediaItemBaseViewController mediaAsset](self, "mediaAsset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ql_propertyTitleFromAsset:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[QLItemViewController context](self, "context");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "previewTitle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x24BDB25B8], "metadataItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setKey:", *MEMORY[0x24BDB1DA0]);
  objc_msgSend(v7, "setIdentifier:", *MEMORY[0x24BDB1D78]);
  objc_msgSend(v7, "setValue:", v5);

  return v7;
}

- (void)dealloc
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  if ((_os_feature_enabled_impl() & 1) == 0)
    -[QLVideoScrubberView removeObserver:forKeyPath:context:](self->_scrubber, "removeObserver:forKeyPath:context:", self, CFSTR("userInteractingWithScrubber"), &QLMovieItemViewControllerContext);
  -[QLMovieItemViewController playerViewController](self, "playerViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[QLMovieItemViewController playerViewController](self, "playerViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, CFSTR("analysisInteractionInProgress"), &QLMovieItemViewControllerContext);

  }
  -[QLMovieItemViewController playerViewController](self, "playerViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[QLMovieItemViewController playerViewController](self, "playerViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObserver:forKeyPath:context:", self, CFSTR("toggleLookupAction"), &QLMovieItemViewControllerContext);

  }
  if (self->_isObservingPlayerExternalPlaybackActive)
  {
    -[QLMediaItemBaseViewController player](self, "player");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObserver:forKeyPath:context:", self, CFSTR("externalPlaybackActive"), &QLMovieItemViewControllerContext);

  }
  -[QLMovieItemViewController playerViewController](self, "playerViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeObserver:forKeyPath:context:", self, CFSTR("videoBounds"), &QLMovieItemViewControllerContext);

  v11.receiver = self;
  v11.super_class = (Class)QLMovieItemViewController;
  -[QLMediaItemViewController dealloc](&v11, sel_dealloc);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  QLVideoScrubberView *v11;
  QLVideoScrubberView *v12;
  QLVideoScrubberView *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  objc_super v27;

  v10 = a3;
  v11 = (QLVideoScrubberView *)a4;
  if (a6 == &QLMovieItemViewControllerContext)
  {
    if ((_os_feature_enabled_impl() & 1) == 0 && self->_scrubber == v11)
    {
      if (objc_msgSend(v10, "isEqualToString:", CFSTR("userInteractingWithScrubber")))
      {
        if (-[QLVideoScrubberView isUserInteractingWithScrubber](self->_scrubber, "isUserInteractingWithScrubber"))
        {
          -[QLMovieItemViewController showTimeLabelIfNeeded](self, "showTimeLabelIfNeeded");
        }
        else
        {
          if (-[QLMediaItemBaseViewController endOfMediaReached](self, "endOfMediaReached"))
            -[QLMediaItemBaseViewController resetToBeginningAndPlay](self, "resetToBeginningAndPlay");
          -[QLMediaItemViewController hideTimeLabelAfterDelay](self, "hideTimeLabelAfterDelay");
        }
        -[QLMovieItemViewController didChangePlayingStatus](self, "didChangePlayingStatus");
      }
    }
    else
    {
      -[QLMediaItemBaseViewController player](self, "player");
      v12 = (QLVideoScrubberView *)objc_claimAutoreleasedReturnValue();

      if (v12 == v11)
      {
        if (objc_msgSend(v10, "isEqualToString:", CFSTR("externalPlaybackActive")))
          -[QLMovieItemViewController _updatePlaceHolderView](self, "_updatePlaceHolderView");
      }
      else
      {
        -[QLMovieItemViewController playerViewController](self, "playerViewController");
        v13 = (QLVideoScrubberView *)objc_claimAutoreleasedReturnValue();

        if (v13 == v11)
        {
          if (!objc_msgSend(v10, "isEqualToString:", CFSTR("analysisInteractionInProgress")))
          {
            if (objc_msgSend(v10, "isEqualToString:", CFSTR("toggleLookupAction"))
              && (-[QLMovieItemViewController lookupAction](self, "lookupAction"),
                  v14 = (void *)objc_claimAutoreleasedReturnValue(),
                  v14,
                  v14))
            {
              -[QLItemViewController delegate](self, "delegate");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "previewItemViewControllerWantsUpdateOverlay:animated:", self, 0);
            }
            else
            {
              if (!objc_msgSend(v10, "isEqualToString:", CFSTR("videoBounds")))
                goto LABEL_3;
              -[QLMovieItemViewController view](self, "view");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              -[QLMovieItemViewController playerViewController](self, "playerViewController");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "videoBounds");
              v18 = v17;
              v20 = v19;
              v22 = v21;
              v24 = v23;
              -[QLMovieItemViewController playerViewController](self, "playerViewController");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "view");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "convertRect:fromView:", v26, v18, v20, v22, v24);
              -[QLItemViewController setContentFrame:](self, "setContentFrame:");

            }
            goto LABEL_3;
          }
          -[QLMovieItemViewController _updatePlayButtonVisibility](self, "_updatePlayButtonVisibility");
        }
      }
    }
  }
  else
  {
    v27.receiver = self;
    v27.super_class = (Class)QLMovieItemViewController;
    -[QLMediaItemViewController observeValueForKeyPath:ofObject:change:context:](&v27, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, a5, a6);
  }
LABEL_3:

}

- (void)previewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)QLMovieItemViewController;
  -[QLScrollableContentItemViewController previewWillAppear:](&v4, sel_previewWillAppear_, a3);
  -[QLMovieItemViewController _showAssetBadgeViewIfNeeded](self, "_showAssetBadgeViewIfNeeded");
}

- (void)previewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)QLMovieItemViewController;
  -[QLMediaItemViewController previewDidAppear:](&v6, sel_previewDidAppear_, a3);
  self->_previewIsVisisble = 1;
  if ((_os_feature_enabled_impl() & 1) == 0)
    -[QLMovieItemViewController addScrubberIfNeededWithDeferral](self, "addScrubberIfNeededWithDeferral");
  -[QLItemViewController presentingDelegate](self, "presentingDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "parentApplicationDisplayIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVPlayerViewController setOverrideParentApplicationDisplayIdentifier:](self->_playerViewController, "setOverrideParentApplicationDisplayIdentifier:", v5);

}

- (void)previewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)QLMovieItemViewController;
  -[QLMediaItemViewController previewDidDisappear:](&v4, sel_previewDidDisappear_, a3);
  self->_previewIsVisisble = 0;
  -[QLMovieItemViewController _stopLookupIfNeeded](self, "_stopLookupIfNeeded");
}

- (void)hostApplicationDidEnterBackground:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)QLMovieItemViewController;
  -[QLMediaItemViewController hostApplicationDidEnterBackground:](&v4, sel_hostApplicationDidEnterBackground_, a3);
  -[QLMediaItemBaseViewController pause](self, "pause");
}

- (void)previewBecameFullScreen:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  double v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)QLMovieItemViewController;
  -[QLMediaItemViewController previewBecameFullScreen:animated:](&v7, sel_previewBecameFullScreen_animated_, a3, a4);
  -[QLMovieItemViewController _updateAssetBadgeViewVisibilityForFullscreenMode:](self, "_updateAssetBadgeViewVisibilityForFullscreenMode:", v4);
  if (v4)
    v6 = 0.0;
  else
    v6 = 40.0;
  -[AVPlayerViewController setAdditionalSafeAreaInsets:](self->_playerViewController, "setAdditionalSafeAreaInsets:", 0.0, 0.0, v6, 0.0);
}

- (id)accessoryView
{
  UIView *v3;

  if ((_os_feature_enabled_impl() & 1) != 0)
    v3 = 0;
  else
    v3 = self->_scrubberContainer;
  return v3;
}

- (id)timeLabelScrollView
{
  void *v3;

  if ((_os_feature_enabled_impl() & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    -[QLVideoScrubberView scrollView](self->_scrubber, "scrollView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (void)showTimeLabelIfNeeded
{
  objc_super v3;

  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    v3.receiver = self;
    v3.super_class = (Class)QLMovieItemViewController;
    -[QLMediaItemViewController showTimeLabelIfNeeded](&v3, sel_showTimeLabelIfNeeded);
  }
}

- (BOOL)canEnterFullScreen
{
  void *v2;
  char v3;

  -[QLMediaItemBaseViewController player](self, "player");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isExternalPlaybackActive") ^ 1;

  return v3;
}

- (BOOL)play
{
  _BOOL4 v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)QLMovieItemViewController;
  v3 = -[QLMediaItemBaseViewController play](&v6, sel_play);
  if (v3)
  {
    -[QLItemViewController delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "previewItemViewController:wantsFullScreen:", self, 1);

  }
  return v3;
}

- (id)scrollView
{
  UIScrollView **p_playerViewControllerScrollView;
  id WeakRetained;
  void *v5;
  void *v6;

  p_playerViewControllerScrollView = &self->_playerViewControllerScrollView;
  WeakRetained = objc_loadWeakRetained((id *)&self->_playerViewControllerScrollView);

  if (!WeakRetained)
  {
    -[AVPlayerViewController view](self->_playerViewController, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLMovieItemViewController scrollViewInView:](self, "scrollViewInView:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)p_playerViewControllerScrollView, v6);

  }
  return objc_loadWeakRetained((id *)p_playerViewControllerScrollView);
}

- (id)scrollViewInView:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
  }
  else
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    objc_msgSend(v4, "subviews", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      while (2)
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          -[QLMovieItemViewController scrollViewInView:](self, "scrollViewInView:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10));
          v11 = objc_claimAutoreleasedReturnValue();
          if (v11)
          {
            v5 = (id)v11;

            goto LABEL_13;
          }
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v8)
          continue;
        break;
      }
    }

    v5 = 0;
  }
LABEL_13:

  return v5;
}

- (BOOL)canPinchToDismiss
{
  BOOL v2;
  void *v3;
  double v4;
  double v5;
  double v6;

  if (self->_isEditing)
    return 0;
  -[QLMovieItemViewController scrollView](self, "scrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "minimumZoomScale");
  v5 = v4;
  objc_msgSend(v3, "zoomScale");
  v2 = v5 == v6;

  return v2;
}

- (BOOL)canSwipeToDismiss
{
  objc_super v3;

  if (self->_isEditing)
    return 0;
  v3.receiver = self;
  v3.super_class = (Class)QLMovieItemViewController;
  return -[QLItemViewController canSwipeToDismiss](&v3, sel_canSwipeToDismiss);
}

- (BOOL)canToggleFullScreen
{
  objc_super v4;

  if (self->_isEditing || -[QLItemViewController isSavingEdits](self, "isSavingEdits"))
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)QLMovieItemViewController;
  return -[QLItemViewController canToggleFullScreen](&v4, sel_canToggleFullScreen);
}

- (void)setPlayControlsHidden:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  double v7;
  _QWORD v8[5];
  BOOL v9;

  v4 = a4;
  v5 = a3;
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    -[QLOverlayPlayButton alpha](self->_playButton, "alpha");
    if (v7 == (double)v5)
    {
      if (v4)
      {
        v8[0] = MEMORY[0x24BDAC760];
        v8[1] = 3221225472;
        v8[2] = __60__QLMovieItemViewController_setPlayControlsHidden_animated___block_invoke;
        v8[3] = &unk_24C724CF8;
        v8[4] = self;
        v9 = v5;
        objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:animations:", v8, 0.2);
      }
      else
      {
        -[QLOverlayPlayButton setAlpha:](self->_playButton, "setAlpha:", (double)!v5);
      }
    }
  }
}

uint64_t __60__QLMovieItemViewController_setPlayControlsHidden_animated___block_invoke(uint64_t a1)
{
  double v1;

  v1 = 0.0;
  if (!*(_BYTE *)(a1 + 40))
    v1 = 1.0;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1400), "setAlpha:", v1);
}

- (void)_updatePlayButtonVisibility
{
  _BOOL4 v3;
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;
  int v8;
  int v9;
  char v10;
  BOOL v11;
  void *v12;
  _BOOL8 v13;
  uint64_t v14;

  v3 = -[QLMovieItemViewController _videoIsPlaying](self, "_videoIsPlaying");
  -[QLMovieItemViewController scrubber](self, "scrubber");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isUserInteractingWithScrubber") & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    -[QLMediaItemViewController scrubGesture](self, "scrubGesture");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "state") == 2)
    {
      v5 = 1;
    }
    else
    {
      -[QLMediaItemViewController scrubGesture](self, "scrubGesture");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v7, "state") == 1;

    }
  }

  v8 = _os_feature_enabled_impl();
  v9 = v8 ^ 1;
  v10 = (v8 ^ 1) & v5;
  v11 = -[QLMovieItemViewController _isInteractingWithAnalysis](self, "_isInteractingWithAnalysis");
  -[QLItemViewController appearance](self, "appearance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "presentationMode") == 4;

  v14 = 1;
  if ((v10 & 1) == 0 && !v11 && (v9 & v3 & 1) == 0)
    v14 = !-[QLMediaItemBaseViewController playable](self, "playable", 1)
       || self->_isEditing
       || (_os_feature_enabled_impl() & 1) == 0
       && (-[QLItemViewController isSavingEdits](self, "isSavingEdits") || self->_isSavingEditsBeforeDismissing)
       || v13;
  -[QLMovieItemViewController setPlayControlsHidden:animated:](self, "setPlayControlsHidden:animated:", v14, 0);
}

- (void)didChangePlayingStatus
{
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    -[QLMovieItemViewController _updatePlayButtonVisibility](self, "_updatePlayButtonVisibility");
    -[QLMovieItemViewController _updateAssetBadgeViewVisibilityWithNewPlayingStatus:](self, "_updateAssetBadgeViewVisibilityWithNewPlayingStatus:", -[QLMediaItemBaseViewController playingStatus](self, "playingStatus"));
  }
  -[QLMovieItemViewController _stopLookupIfNeeded](self, "_stopLookupIfNeeded");
}

- (void)_stopLookupIfNeeded
{
  void *v3;
  BOOL v4;
  id v5;

  -[QLMovieItemViewController lookupAction](self, "lookupAction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v5 = v3;
    v4 = objc_msgSend(v3, "state") == 1;
    v3 = v5;
    if (v4)
    {
      -[QLMovieItemViewController _lookupButtonTapped](self, "_lookupButtonTapped");
      v3 = v5;
    }
  }

}

- (BOOL)_videoIsPlaying
{
  return -[QLMediaItemBaseViewController playingStatus](self, "playingStatus") == 1;
}

- (BOOL)_isInteractingWithAnalysis
{
  void *v3;
  char v4;
  void *v5;
  char v6;

  -[QLMovieItemViewController playerViewController](self, "playerViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0)
    return 0;
  -[QLMovieItemViewController playerViewController](self, "playerViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "analysisInteractionInProgress");

  return v6;
}

- (int64_t)preferredWhitePointAdaptivityStyle
{
  return 3;
}

- (void)transitionDidStart:(BOOL)a3
{
  if (a3)
  {
    -[QLMovieItemViewController _updatePlayButtonVisibility](self, "_updatePlayButtonVisibility");
  }
  else
  {
    -[QLMovieItemViewController setPlayControlsHidden:animated:](self, "setPlayControlsHidden:animated:", 1, 1);
    if ((_os_feature_enabled_impl() & 1) == 0)
      -[QLMovieItemViewController _hideAssetBadgeViewIfVisible](self, "_hideAssetBadgeViewIfVisible");
  }
}

- (void)transitionDidFinish:(BOOL)a3 didComplete:(BOOL)a4
{
  id v6;

  if (a3 && a4 && !-[QLMovieItemViewController isEditing](self, "isEditing"))
  {
    -[QLMediaItemBaseViewController player](self, "player");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "play");

  }
  else if (!a4 && -[QLMediaItemBaseViewController playingStatus](self, "playingStatus") != 1)
  {
    -[QLMovieItemViewController _updatePlayButtonVisibility](self, "_updatePlayButtonVisibility");
  }
}

- (id)transitioningView
{
  void *v3;
  PHPlaceholderView *v4;
  PHPlaceholderView *v5;

  -[QLMediaItemBaseViewController player](self, "player");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isExternalPlaybackActive"))
  {
    v4 = self->_airPlayPlaceholderView;
  }
  else
  {
    -[AVPlayerViewController view](self->_playerViewController, "view");
    v4 = (PHPlaceholderView *)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

- (BOOL)shouldAllowEditingContents
{
  void *v3;
  uint64_t v4;
  BOOL v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;

  -[QLMediaItemBaseViewController mediaAsset](self, "mediaAsset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasProtectedContent");

  if ((v4 & 1) == 0)
  {
    -[QLItemViewController context](self, "context");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "canBeEdited");
    if (v7
      && (-[QLItemViewController context](self, "context"),
          v4 = objc_claimAutoreleasedReturnValue(),
          objc_msgSend((id)v4, "editedFileBehavior")))
    {
      v5 = 1;
    }
    else
    {
      -[QLItemViewController context](self, "context");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "item");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v9, "editingMode") != 0;

      if (!v7)
      {
LABEL_8:

        return v5;
      }
    }

    goto LABEL_8;
  }
  return 0;
}

- (BOOL)shouldHandleRegisteringForCommandCenterHandlers
{
  return 0;
}

- (BOOL)supportsChromeless
{
  return _os_feature_enabled_impl();
}

- (void)setAppearance:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  objc_super v10;

  v4 = a4;
  v6 = a3;
  -[QLItemViewController appearance](self, "appearance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "presentationMode");

  v10.receiver = self;
  v10.super_class = (Class)QLMovieItemViewController;
  -[QLMediaItemViewController setAppearance:animated:](&v10, sel_setAppearance_animated_, v6, v4);
  v9 = objc_msgSend(v6, "presentationMode");

  if (v8 != v9)
    -[QLMovieItemViewController _updatePlayButtonVisibility](self, "_updatePlayButtonVisibility");
}

- (void)_setupEditBehavior
{
  AVEditBehavior *v3;
  AVEditBehavior *editBehavior;

  v3 = (AVEditBehavior *)objc_opt_new();
  editBehavior = self->_editBehavior;
  self->_editBehavior = v3;

  -[AVEditBehavior setDelegate:](self->_editBehavior, "setDelegate:", self);
  -[AVPlayerViewController addBehavior:](self->_playerViewController, "addBehavior:", self->_editBehavior);
}

- (BOOL)_enterEditModeIfPossible
{
  _BOOL4 v3;
  NSObject **v4;
  NSObject *v5;
  uint8_t v7[16];

  v3 = -[QLItemViewController isSavingEdits](self, "isSavingEdits");
  if (v3)
  {
    v4 = (NSObject **)MEMORY[0x24BE7BF48];
    v5 = *MEMORY[0x24BE7BF48];
    if (!*MEMORY[0x24BE7BF48])
    {
      QLSInitLogging();
      v5 = *v4;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_20D4F5000, v5, OS_LOG_TYPE_INFO, "Ignored request to enter edit mode because changes are being saved. #ItemViewController", v7, 2u);
    }
  }
  else
  {
    -[QLMovieItemViewController _enterEditMode](self, "_enterEditMode");
  }
  return !v3;
}

- (void)_enterEditMode
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject **v8;
  NSObject *v9;
  int v10;
  QLMovieItemViewController *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (-[QLMovieItemViewController shouldAllowEditingContents](self, "shouldAllowEditingContents"))
  {
    self->_isEditing = 1;
    -[QLMovieItemViewController _updatePlayButtonVisibility](self, "_updatePlayButtonVisibility");
    -[QLItemViewController delegate](self, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "previewItemViewController:didEnableEditMode:", self, 1);

    -[AVEditBehavior behaviorContext](self->_editBehavior, "behaviorContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "startEditing");

    -[QLItemViewController delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "previewItemViewController:wantsFullScreen:", self, 1);

    -[QLItemViewController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "previewItemViewControllerWantsUpdateOverlay:animated:", self, 0);

    -[QLItemViewController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "previewItemViewControllerWantsUpdateKeyCommands:", self);

    if (_os_feature_enabled_impl())
      -[AVPlayerViewController setShowsPlaybackControls:](self->_playerViewController, "setShowsPlaybackControls:", 0);
  }
  else
  {
    v8 = (NSObject **)MEMORY[0x24BE7BF48];
    v9 = *MEMORY[0x24BE7BF48];
    if (!*MEMORY[0x24BE7BF48])
    {
      QLSInitLogging();
      v9 = *v8;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = 138412290;
      v11 = self;
      _os_log_impl(&dword_20D4F5000, v9, OS_LOG_TYPE_ERROR, "Could not enter edit mode because editing preview (%@) is not allowed. #PreviewController", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (void)_exitEditMode:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double Seconds;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  dispatch_time_t v16;
  _QWORD block[4];
  id v18;
  _QWORD v19[4];
  id v20;
  id location;
  CMTime v22;
  CMTime time;

  v3 = a3;
  self->_isEditing = 0;
  -[AVEditBehavior behaviorContext](self->_editBehavior, "behaviorContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "endEditing");

  -[QLMovieItemViewController playerViewController](self, "playerViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "player");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
    objc_msgSend(v8, "reversePlaybackEndTime");
  else
    memset(&time, 0, sizeof(time));
  Seconds = CMTimeGetSeconds(&time);
  -[QLMovieItemViewController playerViewController](self, "playerViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "player");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "currentItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
    objc_msgSend(v13, "forwardPlaybackEndTime");
  else
    memset(&v22, 0, sizeof(v22));
  -[QLMovieItemViewController _updateEditsTrimmingValuesWithTrimStartTime:trimEndTime:](self, "_updateEditsTrimmingValuesWithTrimStartTime:trimEndTime:", Seconds, CMTimeGetSeconds(&v22));

  -[QLMovieItemViewController _updateEditMode](self, "_updateEditMode");
  if (_os_feature_enabled_impl())
    -[AVPlayerViewController setShowsPlaybackControls:](self->_playerViewController, "setShowsPlaybackControls:", 1);
  -[QLMovieEdits trimmed](self->_editsSinceLastSave, "trimmed");
  if (v3)
  {
    objc_initWeak(&location, self);
    v15 = MEMORY[0x24BDAC760];
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __43__QLMovieItemViewController__exitEditMode___block_invoke;
    v19[3] = &unk_24C726768;
    objc_copyWeak(&v20, &location);
    -[QLMovieItemViewController _saveMovieIfEdited:forceSaving:withCompletionHandler:](self, "_saveMovieIfEdited:forceSaving:withCompletionHandler:", 1, 1, v19);
    v16 = dispatch_time(0, (uint64_t)(*MEMORY[0x24BE7C008] * 1000000000.0));
    block[0] = v15;
    block[1] = 3221225472;
    block[2] = __43__QLMovieItemViewController__exitEditMode___block_invoke_3;
    block[3] = &unk_24C725230;
    objc_copyWeak(&v18, &location);
    dispatch_after(v16, MEMORY[0x24BDAC9B8], block);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
  else
  {
    -[QLMovieItemViewController _updateInterfaceAfterExitingEditMode](self, "_updateInterfaceAfterExitingEditMode");
    -[QLMovieItemViewController _resetTrimmingValues](self, "_resetTrimmingValues");
  }
}

void __43__QLMovieItemViewController__exitEditMode___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id *v7;
  id WeakRetained;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v9 = WeakRetained;
  if (WeakRetained)
  {
    if (!v5 || v6)
    {
      objc_msgSend(WeakRetained, "_showFailedToSaveChangesAlertWithError:", v6);
    }
    else
    {
      objc_msgSend(WeakRetained, "delegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __43__QLMovieItemViewController__exitEditMode___block_invoke_2;
      v11[3] = &unk_24C725230;
      objc_copyWeak(&v12, v7);
      objc_msgSend(v10, "previewItemViewControllerDidEditCopyOfPreviewItem:editedCopy:completionHandler:", v9, v5, v11);

      objc_destroyWeak(&v12);
    }
  }

}

void __43__QLMovieItemViewController__exitEditMode___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "delegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "previewItemViewControllerWantsToDismissQuickLook:", v3);

    WeakRetained = v3;
  }

}

void __43__QLMovieItemViewController__exitEditMode___block_invoke_3(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  int v3;
  id v4;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_msgSend(WeakRetained, "isSavingEdits");

  if (v3)
  {
    v4 = objc_loadWeakRetained(v1);
    objc_msgSend(v4, "_updateInterfaceAfterExitingEditMode");

  }
}

- (void)_updateEditsTrimmingValuesWithTrimStartTime:(double)a3 trimEndTime:(double)a4
{
  -[QLMovieEdits setTrimStartTime:](self->_editsSinceLastSave, "setTrimStartTime:");
  -[QLMovieEdits setTrimEndTime:](self->_editsSinceLastSave, "setTrimEndTime:", a4);
  -[QLMovieEdits setTrimStartTime:](self->_edits, "setTrimStartTime:", a3);
  -[QLMovieEdits setTrimEndTime:](self->_edits, "setTrimEndTime:", a4);
}

- (void)_updateInterfaceAfterExitingEditMode
{
  void *v3;
  id v4;

  if (_os_feature_enabled_impl())
  {
    -[QLMovieItemViewController playerViewController](self, "playerViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "flashPlaybackControlsWithDuration:", 10.0);

  }
  else
  {
    -[QLMovieItemViewController _updatePlayButtonVisibility](self, "_updatePlayButtonVisibility");
  }
  -[QLItemViewController delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "previewItemViewController:wantsFullScreen:", self, 0);

}

- (void)_resetTrimmingValues
{
  -[QLMovieEdits resetTrimmingValues](self->_editsSinceLastSave, "resetTrimmingValues");
  -[QLMovieEdits resetTrimmingValues](self->_edits, "resetTrimmingValues");
}

- (void)_updateEditMode
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = -[QLMovieEdits hasEdits](self->_editsSinceLastSave, "hasEdits");
  -[QLItemViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "previewItemViewController:hasUnsavedEdits:", self, v3);

  -[QLItemViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "previewItemViewController:didEnableEditMode:", self, v3);

}

- (id)editProgressIndicatorMessage
{
  return (id)QLLocalizedString();
}

- (void)updateInterfaceForSavingEdits
{
  void *v3;

  -[QLMediaItemBaseViewController pause](self, "pause");
  -[QLMovieItemViewController _updatePlayButtonVisibility](self, "_updatePlayButtonVisibility");
  -[QLMovieItemViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUserInteractionEnabled:", 0);

  if ((_os_feature_enabled_impl() & 1) == 0)
    -[UIView setUserInteractionEnabled:](self->_scrubberContainer, "setUserInteractionEnabled:", 0);
}

- (void)updateInterfaceAfterSavingEdits
{
  void *v3;

  -[QLMovieItemViewController _updatePlayButtonVisibility](self, "_updatePlayButtonVisibility");
  -[QLMovieItemViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUserInteractionEnabled:", 1);

  if ((_os_feature_enabled_impl() & 1) == 0)
    -[UIView setUserInteractionEnabled:](self->_scrubberContainer, "setUserInteractionEnabled:", 1);
}

- (void)_rotateIfPossible
{
  NSObject **v3;
  NSObject *v4;
  uint8_t v5[16];

  if (-[QLItemViewController isSavingEdits](self, "isSavingEdits"))
  {
    v3 = (NSObject **)MEMORY[0x24BE7BF48];
    v4 = *MEMORY[0x24BE7BF48];
    if (!*MEMORY[0x24BE7BF48])
    {
      QLSInitLogging();
      v4 = *v3;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_20D4F5000, v4, OS_LOG_TYPE_INFO, "Ignored request to rotate right because changes are being saved. #ItemViewController", v5, 2u);
    }
  }
  else
  {
    -[QLMovieItemViewController _rotateMovieRight](self, "_rotateMovieRight");
    -[QLMovieItemViewController _updateEditMode](self, "_updateEditMode");
  }
}

- (void)_rotateMovieRight
{
  id v3;

  -[QLMovieEdits incrementRightRotationsCount](self->_editsSinceLastSave, "incrementRightRotationsCount");
  -[QLMovieEdits incrementRightRotationsCount](self->_edits, "incrementRightRotationsCount");
  -[AVEditBehavior behaviorContext](self->_editBehavior, "behaviorContext");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rotateClockwise");

}

- (void)_saveMovieIfEdited:(BOOL)a3 withCompletionHandler:(id)a4
{
  -[QLMovieItemViewController _saveMovieIfEdited:forceSaving:withCompletionHandler:](self, "_saveMovieIfEdited:forceSaving:withCompletionHandler:", a3, 0, a4);
}

- (void)_saveMovieIfEdited:(BOOL)a3 forceSaving:(BOOL)a4 withCompletionHandler:(id)a5
{
  id v8;
  NSObject **v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  BOOL v22;
  id buf[2];

  v8 = a5;
  if (-[QLMovieEdits hasEdits](self->_editsSinceLastSave, "hasEdits") || a4)
  {
    objc_initWeak(buf, self);
    -[QLItemViewController context](self, "context");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "item");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "previewItemContentType");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v14 = (void *)MEMORY[0x24BDF8238];
      -[QLItemViewController context](self, "context");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "item");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "previewItemContentType");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "typeWithIdentifier:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v19[0] = MEMORY[0x24BDAC760];
      v19[1] = 3221225472;
      v19[2] = __82__QLMovieItemViewController__saveMovieIfEdited_forceSaving_withCompletionHandler___block_invoke;
      v19[3] = &unk_24C726070;
      v20 = v8;
      objc_copyWeak(&v21, buf);
      v22 = a3;
      -[QLItemViewController editedCopyToSaveChangesWithOutputType:completionHandler:](self, "editedCopyToSaveChangesWithOutputType:completionHandler:", v18, v19);
      objc_destroyWeak(&v21);

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE7BF30], 0, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v8 + 2))(v8, 0, v18);
    }

    objc_destroyWeak(buf);
  }
  else
  {
    v9 = (NSObject **)MEMORY[0x24BE7BF48];
    v10 = *MEMORY[0x24BE7BF48];
    if (!*MEMORY[0x24BE7BF48])
    {
      QLSInitLogging();
      v10 = *v9;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_20D4F5000, v10, OS_LOG_TYPE_DEBUG, "Not saving new video because it was not edited (was already saved or no changed were made). #AnyItemViewController", (uint8_t *)buf, 2u);
    }
    (*((void (**)(id, _QWORD, _QWORD))v8 + 2))(v8, 0, 0);
  }

}

void __82__QLMovieItemViewController__saveMovieIfEdited_forceSaving_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id WeakRetained;
  NSObject **v9;
  NSObject *v10;
  uint8_t v11[16];

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    v9 = (NSObject **)MEMORY[0x24BE7BF48];
    v10 = *MEMORY[0x24BE7BF48];
    if (!*MEMORY[0x24BE7BF48])
    {
      QLSInitLogging();
      v10 = *v9;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_20D4F5000, v10, OS_LOG_TYPE_ERROR, "Could not create edited movie because could not generate a URL to save the file. #AnyItemViewController", v11, 2u);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "_saveMovieIfEditedWithEditedCopy:shouldDismissAfterSaving:completionHandler:", v5, *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));

  }
}

- (void)_saveMovieIfEditedWithEditedCopy:(id)a3 shouldDismissAfterSaving:(BOOL)a4 completionHandler:(id)a5
{
  id v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject **v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  void **v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  int32_t v38;
  CMTime *v39;
  _BOOL4 v40;
  double v41;
  double v42;
  double v43;
  int v44;
  NSObject **v45;
  NSObject *v46;
  NSObject *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  CMTimeValue v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  int v56;
  void **v57;
  void *v58;
  NSObject *v59;
  CMTimeValue v60;
  void *v61;
  void *v62;
  NSObject *v63;
  NSObject *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  char v69;
  char v70;
  NSObject **v71;
  NSObject *v72;
  NSObject *v73;
  void *v74;
  _BOOL4 v75;
  id v76;
  void *v77;
  id v78;
  id v79;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v82;
  id v83;
  id v84;
  CMTime duration;
  CMTime v86;
  __int128 v87;
  CMTimeEpoch v88;
  __int128 v89;
  CMTimeEpoch v90;
  _QWORD aBlock[4];
  id v92;
  id v93;
  id location;
  CMTimeRange rhs;
  CMTimeRange buf;
  uint64_t v97;

  v97 = *MEMORY[0x24BDAC8D0];
  v78 = a3;
  v8 = a5;
  v75 = -[QLMovieEdits rotated](self->_edits, "rotated");
  v9 = -[QLMovieEdits trimmed](self->_edits, "trimmed");
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __105__QLMovieItemViewController__saveMovieIfEditedWithEditedCopy_shouldDismissAfterSaving_completionHandler___block_invoke;
  aBlock[3] = &unk_24C726790;
  objc_copyWeak(&v93, &location);
  v76 = v8;
  v92 = v76;
  v77 = _Block_copy(aBlock);
  -[QLItemViewController showSaveEditsProgressIndicatorAfterDelay](self, "showSaveEditsProgressIndicatorAfterDelay");
  self->_isSavingEditsBeforeDismissing = a4;
  -[QLItemViewController didStartSavingEdits](self, "didStartSavingEdits");
  if (v9)
  {
    v89 = 0uLL;
    v90 = 0;
    -[QLMovieItemViewController playerViewController](self, "playerViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "player");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "currentItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      objc_msgSend(v12, "reversePlaybackEndTime");
    }
    else
    {
      v89 = 0uLL;
      v90 = 0;
    }

    v87 = 0uLL;
    v88 = 0;
    -[QLMovieItemViewController playerViewController](self, "playerViewController");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "player");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "currentItem");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v36;
    if (v36)
    {
      objc_msgSend(v36, "forwardPlaybackEndTime");
    }
    else
    {
      v87 = 0uLL;
      v88 = 0;
    }

    memset(&v86, 0, sizeof(v86));
    *(_OWORD *)&buf.start.value = v87;
    buf.start.epoch = v88;
    *(_OWORD *)&rhs.start.value = v89;
    rhs.start.epoch = v90;
    CMTimeSubtract(&v86, &buf.start, &rhs.start);
    buf.start = v86;
    *(_OWORD *)&rhs.start.value = *MEMORY[0x24BDC0D40];
    rhs.start.epoch = *(_QWORD *)(MEMORY[0x24BDC0D40] + 16);
    v38 = CMTimeCompare(&buf.start, &rhs.start);
    v39 = (CMTime *)MEMORY[0x24BDC0D88];
    if (v38)
    {
      buf.start = v86;
      *(_OWORD *)&rhs.start.value = *MEMORY[0x24BDC0D88];
      rhs.start.epoch = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
      v40 = CMTimeCompare(&buf.start, &rhs.start) == 0;
    }
    else
    {
      v40 = 1;
    }
    -[QLMovieEdits trimStartTime](self->_edits, "trimStartTime");
    v42 = v41;
    -[QLMovieEdits trimEndTime](self->_edits, "trimEndTime");
    v44 = v42 > v43 || v40;
    v45 = (NSObject **)MEMORY[0x24BE7BF48];
    v46 = *MEMORY[0x24BE7BF48];
    if (v44 == 1)
    {
      if (!v46)
      {
        QLSInitLogging();
        v46 = *v45;
      }
      v47 = v46;
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v78, "url");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        -[QLMovieEdits trimStartTime](self->_edits, "trimStartTime");
        v50 = v49;
        -[QLMovieEdits trimEndTime](self->_edits, "trimEndTime");
        LODWORD(buf.start.value) = 138412802;
        *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v48;
        LOWORD(buf.start.flags) = 2048;
        *(_QWORD *)((char *)&buf.start.flags + 2) = v50;
        HIWORD(buf.start.epoch) = 2048;
        buf.duration.value = v51;
        _os_log_impl(&dword_20D4F5000, v47, OS_LOG_TYPE_ERROR, "Could not create edited movie for trimmed movie at URL: %@ because of invalid trim values (startTime: %f endTime: %f). #Media", (uint8_t *)&buf, 0x20u);

      }
      objc_msgSend(v78, "removeFromDisk:", 0);
      (*((void (**)(void *, _QWORD, _QWORD))v77 + 2))(v77, 0, 0);
      v26 = 0;
      v29 = 0;
      goto LABEL_70;
    }
    if (!v46)
    {
      QLSInitLogging();
      v46 = *v45;
    }
    if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf.start.value) = 138412290;
      *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)self;
      _os_log_impl(&dword_20D4F5000, v46, OS_LOG_TYPE_INFO, "Creating AVMutableMovie for new trimmed movie. %@ #Media", (uint8_t *)&buf, 0xCu);
    }
    v29 = objc_alloc_init(MEMORY[0x24BDB25C0]);
    v52 = objc_alloc(MEMORY[0x24BDB2560]);
    objc_msgSend(v78, "url");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = (void *)objc_msgSend(v52, "initWithURL:options:", v53, 0);
    objc_msgSend(v29, "setDefaultMediaDataStorage:", v54);

    memset(&buf, 0, sizeof(buf));
    *(_OWORD *)&rhs.start.value = v89;
    rhs.start.epoch = v90;
    duration = v86;
    CMTimeRangeMake(&buf, &rhs.start, &duration);
    -[QLMediaItemBaseViewController mediaAsset](self, "mediaAsset");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v84 = 0;
    rhs = buf;
    duration = *v39;
    v56 = objc_msgSend(v29, "insertTimeRange:ofAsset:atTime:copySampleData:error:", &rhs, v55, &duration, 1, &v84);
    v26 = v84;
    if (v26)
      v56 = 0;

    if (v56)
      goto LABEL_42;
    v63 = *v45;
    if (!*v45)
    {
      QLSInitLogging();
      v63 = *v45;
    }
    v64 = v63;
    if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v78, "url");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(rhs.start.value) = 138412546;
      *(CMTimeValue *)((char *)&rhs.start.value + 4) = (CMTimeValue)v65;
      LOWORD(rhs.start.flags) = 2112;
      *(_QWORD *)((char *)&rhs.start.flags + 2) = v26;
      _os_log_impl(&dword_20D4F5000, v64, OS_LOG_TYPE_ERROR, "Could not write contents for trimmed movie at URL: %@. Error: %@ #Media", (uint8_t *)&rhs, 0x16u);

    }
    objc_msgSend(v78, "removeFromDisk:", 0);
    (*((void (**)(void *, _QWORD, id))v77 + 2))(v77, 0, v26);
  }
  else
  {
    v14 = (NSObject **)MEMORY[0x24BE7BF48];
    v15 = *MEMORY[0x24BE7BF48];
    if (!*MEMORY[0x24BE7BF48])
    {
      QLSInitLogging();
      v15 = *v14;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf.start.value) = 138412290;
      *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)self;
      _os_log_impl(&dword_20D4F5000, v15, OS_LOG_TYPE_INFO, "Creating AVMutableMovie for new rotated movie. %@ #Media", (uint8_t *)&buf, 0xCu);
    }
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "url");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "path");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v16, "fileExistsAtPath:", v18);

    if (v19)
      objc_msgSend(v78, "removeFromDisk:", 0);
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLItemViewController context](self, "context");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "item");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "saveURL");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "url");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v83 = 0;
    v25 = objc_msgSend(v20, "copyItemAtURL:toURL:error:", v23, v24, &v83);
    v26 = v83;
    if (v26)
      v25 = 0;

    if ((v25 & 1) != 0)
    {
      v27 = (void *)MEMORY[0x24BDB25C0];
      objc_msgSend(v78, "url");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "movieWithURL:options:", v28, 0);
      v29 = (id)objc_claimAutoreleasedReturnValue();

LABEL_42:
      if (v75)
      {
        v57 = (void **)MEMORY[0x24BE7BF48];
        v58 = (void *)*MEMORY[0x24BE7BF48];
        if (!*MEMORY[0x24BE7BF48])
        {
          QLSInitLogging();
          v58 = *v57;
        }
        v59 = v58;
        if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
        {
          v60 = -[QLMovieEdits rightRotationsCount](self->_edits, "rightRotationsCount");
          LODWORD(buf.start.value) = 134218242;
          *(CMTimeValue *)((char *)&buf.start.value + 4) = v60;
          LOWORD(buf.start.flags) = 2112;
          *(_QWORD *)((char *)&buf.start.flags + 2) = self;
          _os_log_impl(&dword_20D4F5000, v59, OS_LOG_TYPE_INFO, "Setting preferred transform of rotated movie with rotations count: %lu. %@ #Media", (uint8_t *)&buf, 0x16u);
        }

        objc_msgSend(v29, "tracksWithMediaType:", *MEMORY[0x24BDB1D50]);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "firstObject");
        v62 = (void *)objc_claimAutoreleasedReturnValue();

        if (v62)
          objc_msgSend(v62, "preferredTransform");
        else
          memset(&t1, 0, sizeof(t1));
        CGAffineTransformMakeRotation(&t2, (double)-[QLMovieEdits rightRotationsCount](self->_edits, "rightRotationsCount") * 1.57079633);
        CGAffineTransformConcat(&v82, &t1, &t2);
        objc_msgSend(v62, "setPreferredTransform:", &v82);

      }
      objc_msgSend(v78, "url");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      -[QLItemViewController context](self, "context");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "contentType");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v79 = 0;
      v69 = objc_msgSend(v29, "writeMovieHeaderToURL:fileType:options:error:", v66, v68, 0, &v79);
      v26 = v79;
      if (v26)
        v70 = 0;
      else
        v70 = v69;

      v71 = (NSObject **)MEMORY[0x24BE7BF48];
      v72 = *MEMORY[0x24BE7BF48];
      if ((v70 & 1) != 0)
      {
        if (!v72)
        {
          QLSInitLogging();
          v72 = *v71;
        }
        if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
        {
          LODWORD(buf.start.value) = 138412546;
          *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v78;
          LOWORD(buf.start.flags) = 2112;
          *(_QWORD *)((char *)&buf.start.flags + 2) = self;
          _os_log_impl(&dword_20D4F5000, v72, OS_LOG_TYPE_INFO, "Successfully wrote new header of edited movie to URL of edited copy: %@. %@ #Media", (uint8_t *)&buf, 0x16u);
        }
        -[QLMovieEdits resetEditingValues](self->_editsSinceLastSave, "resetEditingValues");
        -[QLMovieItemViewController _updateEditMode](self, "_updateEditMode");
        objc_msgSend(v78, "bumpVersion");
        objc_msgSend(v78, "markAsPurgeable");
        (*((void (**)(void *, id, _QWORD))v77 + 2))(v77, v78, 0);
        v26 = 0;
      }
      else
      {
        if (!v72)
        {
          QLSInitLogging();
          v72 = *v71;
        }
        v73 = v72;
        if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v78, "url");
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(buf.start.value) = 138412546;
          *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v74;
          LOWORD(buf.start.flags) = 2112;
          *(_QWORD *)((char *)&buf.start.flags + 2) = v26;
          _os_log_impl(&dword_20D4F5000, v73, OS_LOG_TYPE_ERROR, "Could not write header for trimmed movie at URL of edited copy: %@. Error: %@ #Media", (uint8_t *)&buf, 0x16u);

        }
        objc_msgSend(v78, "removeFromDisk:", 0);
        (*((void (**)(void *, _QWORD, id))v77 + 2))(v77, 0, v26);
      }
      goto LABEL_70;
    }
    v30 = (void **)MEMORY[0x24BE7BF48];
    v31 = (void *)*MEMORY[0x24BE7BF48];
    if (!*MEMORY[0x24BE7BF48])
    {
      QLSInitLogging();
      v31 = *v30;
    }
    v32 = v31;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v78, "url");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf.start.value) = 138412546;
      *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v33;
      LOWORD(buf.start.flags) = 2112;
      *(_QWORD *)((char *)&buf.start.flags + 2) = v26;
      _os_log_impl(&dword_20D4F5000, v32, OS_LOG_TYPE_ERROR, "Could not copy original movie to save rotated version at URL: %@. Error: %@ #Media", (uint8_t *)&buf, 0x16u);

    }
    objc_msgSend(v78, "removeFromDisk:", 0);
    (*((void (**)(void *, _QWORD, id))v77 + 2))(v77, 0, v26);
    v29 = 0;
  }
LABEL_70:

  objc_destroyWeak(&v93);
  objc_destroyWeak(&location);

}

void __105__QLMovieItemViewController__saveMovieIfEditedWithEditedCopy_shouldDismissAfterSaving_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;

  v5 = a2;
  v6 = a3;
  objc_copyWeak(&v10, (id *)(a1 + 40));
  v9 = *(id *)(a1 + 32);
  v7 = v5;
  v8 = v6;
  QLRunInMainThread();

  objc_destroyWeak(&v10);
}

void __105__QLMovieItemViewController__saveMovieIfEditedWithEditedCopy_shouldDismissAfterSaving_completionHandler___block_invoke_2(uint64_t a1)
{
  _BYTE *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    WeakRetained[1385] = 0;
    objc_msgSend(WeakRetained, "hideSaveEditProgressIndicator");
    objc_msgSend(WeakRetained, "didFinishSavingEdits");
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (void)savePreviewEditedCopyWithCompletionHandler:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;

  v4 = a3;
  if (-[QLMovieItemViewController shouldAllowEditingContents](self, "shouldAllowEditingContents"))
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __72__QLMovieItemViewController_savePreviewEditedCopyWithCompletionHandler___block_invoke;
    v5[3] = &unk_24C726048;
    v6 = v4;
    -[QLMovieItemViewController _saveMovieIfEdited:withCompletionHandler:](self, "_saveMovieIfEdited:withCompletionHandler:", 1, v5);

  }
  else
  {
    (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
  }

}

uint64_t __72__QLMovieItemViewController_savePreviewEditedCopyWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)imageAnalysisToolbarButton
{
  void *v3;
  void *v4;
  QLToolbarButton *v5;
  QLToolbarButton *v6;
  QLToolbarButton *imageAnalysisToolbarButton;
  const __CFString *v8;

  -[QLMovieItemViewController lookupAction](self, "lookupAction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && (objc_msgSend(v3, "attributes") & 5) == 0)
  {
    if (!self->_imageAnalysisToolbarButton)
    {
      v6 = (QLToolbarButton *)objc_msgSend(objc_alloc(MEMORY[0x24BE7BFD8]), "initWithIdentifier:", CFSTR("QLMediaLookupButtonIdentifier"));
      imageAnalysisToolbarButton = self->_imageAnalysisToolbarButton;
      self->_imageAnalysisToolbarButton = v6;

      -[QLToolbarButton setPlacement:](self->_imageAnalysisToolbarButton, "setPlacement:", 0);
      -[QLToolbarButton setAccessibilityIdentifier:](self->_imageAnalysisToolbarButton, "setAccessibilityIdentifier:", CFSTR("QLOverlayImageAnalysisButtonAccessibilityIdentifier"));
    }
    if (objc_msgSend(v4, "state") == 1)
      v8 = CFSTR("info.circle.and.sparkles.fill");
    else
      v8 = CFSTR("info.circle.and.sparkles");
    -[QLToolbarButton setSymbolImageName:](self->_imageAnalysisToolbarButton, "setSymbolImageName:", v8);
    -[QLToolbarButton setUseInternalSymbolImage:](self->_imageAnalysisToolbarButton, "setUseInternalSymbolImage:", 1);
    v5 = self->_imageAnalysisToolbarButton;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)lookupAction
{
  void *v3;
  char v4;
  void *v5;
  void *v6;

  -[QLMovieItemViewController playerViewController](self, "playerViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[QLMovieItemViewController playerViewController](self, "playerViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "toggleLookupAction");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)_lookupButtonTapped
{
  void *v3;
  id v4;

  -[QLMovieItemViewController lookupAction](self, "lookupAction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, "performWithSender:target:", self, 0);
    v3 = v4;
  }

}

- (void)_showFailedToSaveChangesAlertWithError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  id location;

  v4 = a3;
  v5 = (void *)MEMORY[0x24BEBD3B0];
  QLLocalizedStringFromTable();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "alertControllerWithTitle:message:preferredStyle:", v6, v7, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  v9 = (void *)MEMORY[0x24BEBD3A8];
  QLLocalizedStringWithDefaultValue();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x24BDAC760];
  v13 = 3221225472;
  v14 = __68__QLMovieItemViewController__showFailedToSaveChangesAlertWithError___block_invoke;
  v15 = &unk_24C7267B8;
  objc_copyWeak(&v16, &location);
  objc_msgSend(v9, "actionWithTitle:style:handler:", v10, 0, &v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "addAction:", v11, v12, v13, v14, v15);
  -[QLMovieItemViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v8, 1, 0);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

void __68__QLMovieItemViewController__showFailedToSaveChangesAlertWithError___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateInterfaceAfterExitingEditMode");

}

- (id)editBehaviorAlertActionsForDoneButtonTap:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  id location;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[QLItemViewController context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "item");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "editingMode");

  QLLocalizedString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v8 = (void *)MEMORY[0x24BEBD3A8];
  v12 = MEMORY[0x24BDAC760];
  v13 = 3221225472;
  v14 = __70__QLMovieItemViewController_editBehaviorAlertActionsForDoneButtonTap___block_invoke;
  v15 = &unk_24C7267B8;
  objc_copyWeak(&v16, &location);
  objc_msgSend(v8, "actionWithTitle:style:handler:", v7, 0, &v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 1, v12, v13, v14, v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

  return v10;
}

void __70__QLMovieItemViewController_editBehaviorAlertActionsForDoneButtonTap___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_exitEditMode:", 1);

}

- (void)editBehaviorDidCancel:(id)a3
{
  -[QLMovieItemViewController _exitEditMode:](self, "_exitEditMode:", 0);
}

- (BOOL)canPerformFirstTimeAppearanceActions:(unint64_t)a3
{
  return (a3 >> 1) & 1 | -[QLMovieItemViewController shouldAllowEditingContents](self, "shouldAllowEditingContents") & (a3 >> 2);
}

- (void)performFirstTimeAppearanceActions:(unint64_t)a3
{
  if ((a3 & 2) != 0)
  {
    -[QLMovieItemViewController play](self, "play");
  }
  else if ((a3 & 4) != 0)
  {
    -[QLMovieItemViewController _enterEditMode](self, "_enterEditMode");
  }
}

- (id)toolbarButtonsForTraitCollection:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  id v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)QLMovieItemViewController;
  -[QLMediaItemBaseViewController toolbarButtonsForTraitCollection:](&v12, sel_toolbarButtonsForTraitCollection_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  -[QLMovieItemViewController imageAnalysisToolbarButton](self, "imageAnalysisToolbarButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v5, "addObject:", v6);
  if (-[QLMovieItemViewController shouldAllowEditingContents](self, "shouldAllowEditingContents"))
  {
    if (v5)
    {
      if (self->_assetCanBeRotated)
      {
        v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE7BFD8]), "initWithIdentifier:", CFSTR("QLMediaRotateRightButtonIdentifier"));
        objc_msgSend(v7, "setSymbolImageName:", CFSTR("rotate.right"));
        objc_msgSend(v7, "setForceToNavBar:", _UIBarsDesktopNavigationBarEnabled() ^ 1);
        objc_msgSend(v7, "setPlacement:", 2);
        objc_msgSend(v7, "setAccessibilityIdentifier:", CFSTR("QLMediaItemViewControllerBarRotateRightButtonAccessibilityIdentifier"));
        objc_msgSend(v5, "addObject:", v7);

      }
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE7BFD8]), "initWithIdentifier:", CFSTR("QLMediaTrimButtonIdentifier"));
      if (_os_feature_enabled_impl())
        v9 = CFSTR("timeline.selection");
      else
        v9 = CFSTR("selection.pin.in.out");
      objc_msgSend(v8, "setSymbolImageName:", v9);
      objc_msgSend(v8, "setForceToNavBar:", _UIBarsDesktopNavigationBarEnabled() ^ 1);
      objc_msgSend(v8, "setPlacement:", 2);
      objc_msgSend(v8, "setAccessibilityIdentifier:", CFSTR("QLMediaItemViewControllerBarTrimButtonAccessibilityIdentifier"));
      objc_msgSend(v5, "addObject:", v8);
      v10 = v5;

    }
    else
    {
      v10 = (id)MEMORY[0x24BDBD1A8];
    }
  }
  else
  {
    v10 = v5;
  }

  return v10;
}

- (void)buttonPressedWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  objc_super v8;

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("QLMediaTrimButtonIdentifier")))
  {
    -[QLMovieItemViewController editButtonTapped](self, "editButtonTapped");
    if (!v7)
      goto LABEL_10;
    goto LABEL_9;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("QLMediaRotateRightButtonIdentifier")))
  {
    -[QLMovieItemViewController _rotateRightButtonTapped](self, "_rotateRightButtonTapped");
    if (!v7)
      goto LABEL_10;
LABEL_9:
    v7[2](v7);
    goto LABEL_10;
  }
  if (!objc_msgSend(v6, "isEqualToString:", CFSTR("QLMediaLookupButtonIdentifier")))
  {
    v8.receiver = self;
    v8.super_class = (Class)QLMovieItemViewController;
    -[QLMediaItemBaseViewController buttonPressedWithIdentifier:completionHandler:](&v8, sel_buttonPressedWithIdentifier_completionHandler_, v6, v7);
    goto LABEL_10;
  }
  -[QLMovieItemViewController _lookupButtonTapped](self, "_lookupButtonTapped");
  if (v7)
    goto LABEL_9;
LABEL_10:

}

- (id)registeredKeyCommands
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
  objc_super v13;

  v3 = (void *)objc_opt_new();
  if (-[QLMovieItemViewController shouldAllowEditingContents](self, "shouldAllowEditingContents") && !self->_isEditing)
  {
    objc_msgSend(MEMORY[0x24BEBD6B8], "keyCommandWithInput:modifierFlags:action:", CFSTR("t"), 1179648, sel__enterEditModeIfPossible);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    QLLocalizedString();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDiscoverabilityTitle:", v5);

    objc_msgSend(MEMORY[0x24BE7BFA8], "keyCommandWithKeyCommand:identifier:", v4, 6);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v6);

    objc_msgSend(MEMORY[0x24BEBD6B8], "keyCommandWithInput:modifierFlags:action:", CFSTR("r"), 0x100000, sel__rotateIfPossible);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    QLLocalizedString();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDiscoverabilityTitle:", v8);

    objc_msgSend(MEMORY[0x24BE7BFA8], "keyCommandWithKeyCommand:identifier:", v7, 7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v9);

  }
  v13.receiver = self;
  v13.super_class = (Class)QLMovieItemViewController;
  -[QLMediaItemViewController registeredKeyCommands](&v13, sel_registeredKeyCommands);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "arrayByAddingObjectsFromArray:", v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)handlePerformedKeyCommandIfNeeded:(id)a3
{
  id v4;
  uint64_t v5;
  objc_super v6;

  v4 = a3;
  v5 = objc_msgSend(v4, "keyCommandIdentifier");
  if (v5 == 4)
  {
    if ((_os_feature_enabled_impl() & 1) != 0)
      goto LABEL_8;
LABEL_6:
    v6.receiver = self;
    v6.super_class = (Class)QLMovieItemViewController;
    -[QLMediaItemViewController handlePerformedKeyCommandIfNeeded:](&v6, sel_handlePerformedKeyCommandIfNeeded_, v4);
    goto LABEL_8;
  }
  if (v5 == 7)
  {
    -[QLMovieItemViewController _rotateIfPossible](self, "_rotateIfPossible");
    goto LABEL_8;
  }
  if (v5 != 6)
    goto LABEL_6;
  -[QLMovieItemViewController _enterEditModeIfPossible](self, "_enterEditModeIfPossible");
LABEL_8:

}

- (PHPlaceholderView)airPlayPlaceholderView
{
  double v2;
  PHPlaceholderView *airPlayPlaceholderView;
  uint64_t v5;
  PHPlaceholderView *v6;
  PHPlaceholderView *v7;

  airPlayPlaceholderView = self->_airPlayPlaceholderView;
  if (!airPlayPlaceholderView)
  {
    gotLoadHelper_x8__OBJC_CLASS___PHPlaceholderView(v2);
    v6 = (PHPlaceholderView *)objc_msgSend(objc_alloc(*(Class *)(v5 + 3344)), "initWithType:", 0);
    v7 = self->_airPlayPlaceholderView;
    self->_airPlayPlaceholderView = v6;

    airPlayPlaceholderView = self->_airPlayPlaceholderView;
  }
  return airPlayPlaceholderView;
}

- (void)_updatePlaceHolderView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  PHPlaceholderView *airPlayPlaceholderView;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  PHPlaceholderView *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  char v20;
  _QWORD v21[5];
  char v22;
  const __CFString *v23;
  PHPlaceholderView *v24;
  const __CFString *v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x24BDAC8D0];
  -[QLMovieItemViewController airPlayPlaceholderView](self, "airPlayPlaceholderView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[QLMovieItemViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addSubview:", self->_airPlayPlaceholderView);

    -[PHPlaceholderView setTranslatesAutoresizingMaskIntoConstraints:](self->_airPlayPlaceholderView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[QLMovieItemViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x24BDD1628];
    airPlayPlaceholderView = self->_airPlayPlaceholderView;
    v25 = CFSTR("placeHolderView");
    v26[0] = airPlayPlaceholderView;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-0-[placeHolderView]-0-|"), 0, 0, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addConstraints:", v10);

    -[QLMovieItemViewController view](self, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x24BDD1628];
    v13 = self->_airPlayPlaceholderView;
    v23 = CFSTR("placeHolderView");
    v24 = v13;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-0-[placeHolderView]-0-|"), 0, 0, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addConstraints:", v15);

  }
  -[QLMediaItemBaseViewController player](self, "player");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isExternalPlaybackActive");

  if (v17)
  {
    -[QLItemViewController delegate](self, "delegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "previewItemViewController:wantsFullScreen:", self, 1);

  }
  -[QLMediaItemBaseViewController player](self, "player");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "isExternalPlaybackActive") ^ 1;

  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __51__QLMovieItemViewController__updatePlaceHolderView__block_invoke;
  v21[3] = &unk_24C724CF8;
  v21[4] = self;
  v22 = v20;
  objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:animations:", v21, 0.2);
}

void __51__QLMovieItemViewController__updatePlaceHolderView__block_invoke(uint64_t a1)
{
  double v1;
  id v2;

  if (*(_BYTE *)(a1 + 40))
    v1 = 0.0;
  else
    v1 = 1.0;
  objc_msgSend(*(id *)(a1 + 32), "airPlayPlaceholderView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", v1);

}

- (void)_showBadge
{
  void *v3;
  void *v4;
  int v5;
  id v6;

  -[QLMovieItemViewController assetIsHDR](self, "assetIsHDR");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "BOOLValue"))
  {

  }
  else
  {
    -[QLMovieItemViewController assetIsProRes](self, "assetIsProRes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "BOOLValue");

    if (!v5)
      return;
  }
  -[QLMovieItemViewController assetBadgeView](self, "assetBadgeView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[QLMovieItemViewController _showAssetBadgeView:](self, "_showAssetBadgeView:", v6);

}

- (void)_showAssetBadgeViewIfNeeded
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  __int128 v7;
  __int128 v8;

  if ((_os_feature_enabled_impl() & 1) == 0
    && !-[QLMediaItemBaseViewController isFullScreen](self, "isFullScreen")
    && -[QLMediaItemBaseViewController playingStatus](self, "playingStatus") != 1)
  {
    -[QLMovieItemViewController assetIsHDR](self, "assetIsHDR");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "BOOLValue"))
    {

    }
    else
    {
      -[QLMovieItemViewController assetIsProRes](self, "assetIsProRes");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "BOOLValue");

      if (!v5)
        return;
    }
    -[QLMovieItemViewController assetBadgeView](self, "assetBadgeView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isHidden") & 1) == 0)
    {
      if (v6)
      {
        objc_msgSend(v6, "badgeInfo");
        if ((_QWORD)v7)
        {
LABEL_13:

          return;
        }
      }
      else
      {
        v7 = 0u;
        v8 = 0u;
      }
    }
    -[QLMovieItemViewController _showAssetBadgeView:](self, "_showAssetBadgeView:", v6, v7, v8);
    goto LABEL_13;
  }
}

- (void)_showAssetBadgeView:(id)a3
{
  id v4;

  v4 = a3;
  -[QLMovieItemViewController _addAssetBadgeViewToHierarchyIfNeeded:](self, "_addAssetBadgeViewToHierarchyIfNeeded:", v4);
  -[QLMovieItemViewController _displayAssetBadgeView:](self, "_displayAssetBadgeView:", v4);

}

- (void)_addAssetBadgeViewToHierarchyIfNeeded:(id)a3
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
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  objc_msgSend(v16, "superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[QLMovieItemViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addSubview:", v16);

    objc_msgSend(v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v16, "topAnchor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLMovieItemViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "safeAreaLayoutGuide");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "topAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "constraintEqualToAnchor:constant:", v9, 6.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setActive:", 1);

    objc_msgSend(v16, "leadingAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLMovieItemViewController view](self, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "safeAreaLayoutGuide");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "leadingAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToAnchor:constant:", v14, 6.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setActive:", 1);

  }
}

- (void)_displayAssetBadgeView:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  __int128 v13;
  __int128 v14;
  id location;
  __int128 v16;
  __int128 v17;

  v4 = a3;
  -[QLMovieItemViewController assetIsProRes](self, "assetIsProRes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  if ((v6 & 1) == 0)
  {
    -[QLMovieItemViewController assetIsHDR](self, "assetIsHDR");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "BOOLValue");

  }
  v16 = 0u;
  v17 = 0u;
  PXAssetBadgeInfoCreateWithBadges_delayInitStub(0.0);
  v8 = _os_feature_enabled_impl();
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __52__QLMovieItemViewController__displayAssetBadgeView___block_invoke;
  v10[3] = &unk_24C7267E0;
  v9 = v4;
  v11 = v9;
  objc_copyWeak(&v12, &location);
  v13 = v16;
  v14 = v17;
  objc_msgSend(v9, "performChanges:animated:", v10, v8);
  objc_destroyWeak(&v12);

  objc_destroyWeak(&location);
}

uint64_t __52__QLMovieItemViewController__displayAssetBadgeView___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  double v4;
  __int128 v5;
  _OWORD v7[2];

  objc_msgSend(*(id *)(a1 + 32), "setStyle:", 3);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  objc_msgSend(*(id *)(a1 + 32), "setContentWidth:", v4);

  v5 = *(_OWORD *)(a1 + 64);
  v7[0] = *(_OWORD *)(a1 + 48);
  v7[1] = v5;
  return objc_msgSend(*(id *)(a1 + 32), "setBadgeInfo:", v7);
}

- (void)_hideAssetBadgeViewAfterDelayIfNeeded:(double)a3
{
  dispatch_time_t v5;
  _QWORD v6[4];
  id v7;
  id location;

  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    objc_initWeak(&location, self);
    v5 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __67__QLMovieItemViewController__hideAssetBadgeViewAfterDelayIfNeeded___block_invoke;
    v6[3] = &unk_24C725230;
    objc_copyWeak(&v7, &location);
    dispatch_after(v5, MEMORY[0x24BDAC9B8], v6);
    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

void __67__QLMovieItemViewController__hideAssetBadgeViewAfterDelayIfNeeded___block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  uint64_t v3;
  id v4;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_msgSend(WeakRetained, "playingStatus");

  if (v3 == 1)
  {
    v4 = objc_loadWeakRetained(v1);
    objc_msgSend(v4, "_hideAssetBadgeViewIfVisible");

  }
}

- (void)_hideAssetBadgeViewIfVisible
{
  PXUIAssetBadgeView *assetBadgeView;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  assetBadgeView = self->_assetBadgeView;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __57__QLMovieItemViewController__hideAssetBadgeViewIfVisible__block_invoke;
  v4[3] = &unk_24C725230;
  objc_copyWeak(&v5, &location);
  -[PXUIAssetBadgeView performChanges:animated:](assetBadgeView, "performChanges:animated:", v4, 1);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __57__QLMovieItemViewController__hideAssetBadgeViewIfVisible__block_invoke(uint64_t a1)
{
  id WeakRetained;
  double v2;
  uint64_t v3;
  _OWORD *v4;
  __int128 v5;
  id v6;
  _OWORD v7[2];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    gotLoadHelper_x8__PXAssetBadgeInfoNull(v2);
    v4 = *(_OWORD **)(v3 + 2024);
    v5 = v4[1];
    v7[0] = *v4;
    v7[1] = v5;
    objc_msgSend(v6, "setBadgeInfo:", v7);
  }

}

- (void)_updateAssetBadgeViewVisibilityWithNewPlayingStatus:(int64_t)a3
{
  if (a3 == 1)
    -[QLMovieItemViewController _hideAssetBadgeViewAfterDelayIfNeeded:](self, "_hideAssetBadgeViewAfterDelayIfNeeded:", 2.5);
  else
    -[QLMovieItemViewController _showAssetBadgeViewIfNeeded](self, "_showAssetBadgeViewIfNeeded");
}

- (void)_updateAssetBadgeViewVisibilityForFullscreenMode:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    if (v3)
      -[QLMovieItemViewController _hideAssetBadgeViewIfVisible](self, "_hideAssetBadgeViewIfVisible");
    else
      -[QLMovieItemViewController _showAssetBadgeViewIfNeeded](self, "_showAssetBadgeViewIfNeeded");
  }
}

- (PXUIAssetBadgeView)assetBadgeView
{
  double v2;
  PXUIAssetBadgeView *assetBadgeView;
  uint64_t v5;
  id v6;
  PXUIAssetBadgeView *v7;
  PXUIAssetBadgeView *v8;

  assetBadgeView = self->_assetBadgeView;
  if (!assetBadgeView)
  {
    gotLoadHelper_x8__OBJC_CLASS___PXUIAssetBadgeView(v2);
    v6 = objc_alloc(*(Class *)(v5 + 1984));
    v7 = (PXUIAssetBadgeView *)objc_msgSend(v6, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    v8 = self->_assetBadgeView;
    self->_assetBadgeView = v7;

    assetBadgeView = self->_assetBadgeView;
  }
  return assetBadgeView;
}

- (void)loadAssetMetadata
{
  NSObject **v3;
  NSObject *v4;
  void *v5;
  double v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[4];
  QLMovieItemViewController *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = (NSObject **)MEMORY[0x24BE7BF48];
  v4 = *MEMORY[0x24BE7BF48];
  if (!*MEMORY[0x24BE7BF48])
  {
    QLSInitLogging();
    v4 = *v3;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v13 = self;
    _os_log_impl(&dword_20D4F5000, v4, OS_LOG_TYPE_INFO, "Loading metadata for current asset. %@ #Media", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  -[QLMediaItemBaseViewController mediaAsset](self, "mediaAsset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    gotLoadHelper_x8__OBJC_CLASS___PFMetadata(v6);
    v8 = *(void **)(v7 + 1024);
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __46__QLMovieItemViewController_loadAssetMetadata__block_invoke;
    v9[3] = &unk_24C726808;
    v10 = v5;
    objc_copyWeak(&v11, (id *)buf);
    objc_msgSend(v8, "metadataForAsset:completionHandler:", v10, v9);
    objc_destroyWeak(&v11);

  }
  objc_destroyWeak((id *)buf);
}

void __46__QLMovieItemViewController_loadAssetMetadata__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject **v8;
  NSObject *v9;
  uint64_t v10;
  _QWORD *WeakRetained;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  _QWORD block[4];
  id v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  _WORD v25[9];

  *(_QWORD *)&v25[5] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  v8 = (NSObject **)MEMORY[0x24BE7BF48];
  if (!v5 || v6)
  {
    v9 = *MEMORY[0x24BE7BF48];
    if (!*MEMORY[0x24BE7BF48])
    {
      QLSInitLogging();
      v9 = *v8;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v23 = v10;
      v24 = 2112;
      *(_QWORD *)v25 = v7;
      _os_log_impl(&dword_20D4F5000, v9, OS_LOG_TYPE_ERROR, "Failed to get metadata for asset %@ finished loading: %@ #Media", buf, 0x16u);
    }
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (v5 && (objc_opt_respondsToSelector() & 1) != 0)
      v12 = objc_msgSend(v5, "isProRes");
    else
      v12 = 0;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v12);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)WeakRetained[184];
    WeakRetained[184] = v13;

    if (v5 && (objc_opt_respondsToSelector() & 1) != 0)
      v15 = objc_msgSend(v5, "isHDR");
    else
      v15 = 0;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v15);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)WeakRetained[183];
    WeakRetained[183] = v16;

    v18 = *v8;
    if (!*v8)
    {
      QLSInitLogging();
      v18 = *v8;
    }
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v19 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      v23 = v19;
      v24 = 1024;
      *(_DWORD *)v25 = v12;
      v25[2] = 1024;
      *(_DWORD *)&v25[3] = v15;
      _os_log_impl(&dword_20D4F5000, v18, OS_LOG_TYPE_INFO, "Updated badge info with metadata for asset %@. isProRes: %d. isHDR: %d. #Media", buf, 0x18u);
    }
    if ((_os_feature_enabled_impl() & 1) == 0)
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __46__QLMovieItemViewController_loadAssetMetadata__block_invoke_163;
      block[3] = &unk_24C725230;
      objc_copyWeak(&v21, (id *)(a1 + 40));
      dispatch_async(MEMORY[0x24BDAC9B8], block);
      objc_destroyWeak(&v21);
    }
  }

}

void __46__QLMovieItemViewController_loadAssetMetadata__block_invoke_163(uint64_t a1)
{
  id v1;

  v1 = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v1, "_updateAssetBadgeViewVisibilityWithNewPlayingStatus:", objc_msgSend(v1, "playingStatus"));

}

- (void)playerViewControllerWillPerformAnalysisCalloutAction:(id)a3
{
  id v4;
  NSObject **v5;
  NSObject *v6;
  void *v7;
  uint8_t v8[16];

  v4 = a3;
  v5 = (NSObject **)MEMORY[0x24BE7BF48];
  v6 = *MEMORY[0x24BE7BF48];
  if (!*MEMORY[0x24BE7BF48])
  {
    QLSInitLogging();
    v6 = *v5;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_20D4F5000, v6, OS_LOG_TYPE_INFO, "Will perform analysis callout action #ItemViewController", v8, 2u);
  }
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    -[QLItemViewController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "previewItemViewController:wantsFullScreen:", self, 1);

  }
}

- (void)playerViewController:(id)a3 willTransitionToVisibilityOfPlaybackControls:(BOOL)a4 withAnimationCoordinator:(id)a5
{
  id v8;
  id v9;
  char v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  BOOL v14;
  char v15;
  _QWORD v16[4];
  id v17;
  BOOL v18;
  id location;

  v8 = a3;
  v9 = a5;
  objc_initWeak(&location, self);
  v10 = _os_feature_enabled_impl();
  v11 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __120__QLMovieItemViewController_playerViewController_willTransitionToVisibilityOfPlaybackControls_withAnimationCoordinator___block_invoke;
  v16[3] = &unk_24C724F18;
  objc_copyWeak(&v17, &location);
  v18 = a4;
  v12[0] = v11;
  v12[1] = 3221225472;
  v12[2] = __120__QLMovieItemViewController_playerViewController_willTransitionToVisibilityOfPlaybackControls_withAnimationCoordinator___block_invoke_2;
  v12[3] = &unk_24C726830;
  objc_copyWeak(&v13, &location);
  v14 = a4;
  v15 = v10;
  objc_msgSend(v9, "addCoordinatedAnimations:completion:", v16, v12);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

void __120__QLMovieItemViewController_playerViewController_willTransitionToVisibilityOfPlaybackControls_withAnimationCoordinator___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && *(_BYTE *)(a1 + 40))
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "previewItemViewController:wantsFullScreen:", v4, 0);

    WeakRetained = v4;
  }

}

void __120__QLMovieItemViewController_playerViewController_willTransitionToVisibilityOfPlaybackControls_withAnimationCoordinator___block_invoke_2(uint64_t a1, int a2)
{
  id WeakRetained;
  void *v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && a2 && !*(_BYTE *)(a1 + 40))
  {
    v6 = WeakRetained;
    objc_msgSend(WeakRetained, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "previewItemViewController:wantsFullScreen:", v6, 1);

    objc_msgSend(v6, "_hideBadge");
    goto LABEL_9;
  }
  if (a2 && *(_BYTE *)(a1 + 40) && *(_BYTE *)(a1 + 41))
  {
    v6 = WeakRetained;
    objc_msgSend(WeakRetained, "_showBadge");
LABEL_9:
    WeakRetained = v6;
  }

}

- (BOOL)shouldDisplayPlayButtonInNavigationBar
{
  return _os_feature_enabled_impl() ^ 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v4;
  char isKindOfClass;

  v4 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (AVPlayerViewController)playerViewController
{
  return self->_playerViewController;
}

- (void)setPlayerViewController:(id)a3
{
  objc_storeStrong((id *)&self->_playerViewController, a3);
}

- (QLOverlayPlayButton)playButton
{
  return (QLOverlayPlayButton *)objc_getProperty(self, a2, 1400, 1);
}

- (void)setPlayButton:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1400);
}

- (QLVideoScrubberView)scrubber
{
  return (QLVideoScrubberView *)objc_getProperty(self, a2, 1408, 1);
}

- (void)setScrubber:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1408);
}

- (NSLayoutConstraint)bottomScrubberConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 1416, 1);
}

- (void)setBottomScrubberConstraint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1416);
}

- (UIView)scrubberContainer
{
  return (UIView *)objc_getProperty(self, a2, 1424, 1);
}

- (void)setScrubberContainer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1424);
}

- (UIScrollView)scrubberContainerScrollView
{
  return (UIScrollView *)objc_getProperty(self, a2, 1432, 1);
}

- (void)setScrubberContainerScrollView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1432);
}

- (double)scrubberVerticalOffset
{
  return self->_scrubberVerticalOffset;
}

- (void)setScrubberVerticalOffset:(double)a3
{
  self->_scrubberVerticalOffset = a3;
}

- (UIView)playerViewContainer
{
  return self->_playerViewContainer;
}

- (void)setPlayerViewContainer:(id)a3
{
  objc_storeStrong((id *)&self->_playerViewContainer, a3);
}

- (UIScrollView)playerViewControllerScrollView
{
  return (UIScrollView *)objc_loadWeakRetained((id *)&self->_playerViewControllerScrollView);
}

- (void)setPlayerViewControllerScrollView:(id)a3
{
  objc_storeWeak((id *)&self->_playerViewControllerScrollView, a3);
}

- (NSNumber)assetIsHDR
{
  return self->_assetIsHDR;
}

- (void)setAssetIsHDR:(id)a3
{
  objc_storeStrong((id *)&self->_assetIsHDR, a3);
}

- (NSNumber)assetIsProRes
{
  return self->_assetIsProRes;
}

- (void)setAssetIsProRes:(id)a3
{
  objc_storeStrong((id *)&self->_assetIsProRes, a3);
}

- (void)setAssetBadgeView:(id)a3
{
  objc_storeStrong((id *)&self->_assetBadgeView, a3);
}

- (AVEditBehavior)editBehavior
{
  return self->_editBehavior;
}

- (void)setEditBehavior:(id)a3
{
  objc_storeStrong((id *)&self->_editBehavior, a3);
}

- (BOOL)isEditing
{
  return self->_isEditing;
}

- (void)setIsEditing:(BOOL)a3
{
  self->_isEditing = a3;
}

- (QLMovieEdits)edits
{
  return self->_edits;
}

- (void)setEdits:(id)a3
{
  objc_storeStrong((id *)&self->_edits, a3);
}

- (QLMovieEdits)editsSinceLastSave
{
  return self->_editsSinceLastSave;
}

- (void)setEditsSinceLastSave:(id)a3
{
  objc_storeStrong((id *)&self->_editsSinceLastSave, a3);
}

- (BOOL)isSavingEditsBeforeDismissing
{
  return self->_isSavingEditsBeforeDismissing;
}

- (void)setIsSavingEditsBeforeDismissing:(BOOL)a3
{
  self->_isSavingEditsBeforeDismissing = a3;
}

- (BOOL)assetCanBeRotated
{
  return self->_assetCanBeRotated;
}

- (void)setAssetCanBeRotated:(BOOL)a3
{
  self->_assetCanBeRotated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editsSinceLastSave, 0);
  objc_storeStrong((id *)&self->_edits, 0);
  objc_storeStrong((id *)&self->_editBehavior, 0);
  objc_storeStrong((id *)&self->_assetBadgeView, 0);
  objc_storeStrong((id *)&self->_assetIsProRes, 0);
  objc_storeStrong((id *)&self->_assetIsHDR, 0);
  objc_destroyWeak((id *)&self->_playerViewControllerScrollView);
  objc_storeStrong((id *)&self->_playerViewContainer, 0);
  objc_storeStrong((id *)&self->_scrubberContainerScrollView, 0);
  objc_storeStrong((id *)&self->_scrubberContainer, 0);
  objc_storeStrong((id *)&self->_bottomScrubberConstraint, 0);
  objc_storeStrong((id *)&self->_scrubber, 0);
  objc_storeStrong((id *)&self->_playButton, 0);
  objc_storeStrong((id *)&self->_playerViewController, 0);
  objc_storeStrong((id *)&self->_imageAnalysisToolbarButton, 0);
  objc_storeStrong((id *)&self->_airPlayPlaceholderView, 0);
}

@end
