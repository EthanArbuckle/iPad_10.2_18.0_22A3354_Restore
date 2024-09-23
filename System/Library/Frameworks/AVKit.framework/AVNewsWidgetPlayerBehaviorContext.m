@implementation AVNewsWidgetPlayerBehaviorContext

- (AVNewsWidgetPlayerBehaviorContext)initWithAVKitOwner:(id)a3
{
  id v4;
  AVNewsWidgetPlayerBehaviorContext *v5;
  NSObject *v6;
  objc_super v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  AVNewsWidgetPlayerBehaviorContext *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AVNewsWidgetPlayerBehaviorContext;
  v5 = -[AVNewsWidgetPlayerBehaviorContext init](&v8, sel_init);
  if (v5)
  {
    _AVLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v10 = "-[AVNewsWidgetPlayerBehaviorContext initWithAVKitOwner:]";
      v11 = 1024;
      v12 = 47;
      v13 = 2048;
      v14 = v5;
      _os_log_impl(&dword_1AC4B1000, v6, OS_LOG_TYPE_DEFAULT, "%s %d %p", buf, 0x1Cu);
    }

    objc_storeWeak((id *)&v5->_playerViewController, v4);
    *(_WORD *)&v5->_startNextContentTransitionButtonEnabled = 257;
  }

  return v5;
}

- (void)setVideoGravityForTransitioningContent:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _AVLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136315394;
    v12 = "-[AVNewsWidgetPlayerBehaviorContext setVideoGravityForTransitioningContent:]";
    v13 = 2112;
    v14 = v4;
    _os_log_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v11, 0x16u);
  }

  -[AVNewsWidgetPlayerBehaviorContext contentTransitionView](self, "contentTransitionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "incomingContentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "playerLayerView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setVideoGravity:", AVVideoGravityFromString(v4));

  -[AVNewsWidgetPlayerBehaviorContext playerViewController](self, "playerViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setNeedsLayout");

}

- (void)startContentTransition:(int64_t)a3
{
  id v5;

  -[AVNewsWidgetPlayerBehaviorContext contentTransitionView](self, "contentTransitionView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "performTransition:", -[AVNewsWidgetPlayerBehaviorContext _transitionDirectionForContentTransitionType:](self, "_transitionDirectionForContentTransitionType:", a3));

}

- (int64_t)_transitionDirectionForContentTransitionType:(int64_t)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  int64_t v7;
  int64_t v8;

  -[AVNewsWidgetPlayerBehaviorContext playerViewController](self, "playerViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "effectiveUserInterfaceLayoutDirection");

  v7 = 2;
  if (v6 != 1)
    v7 = 3;
  v8 = 2;
  if (v6 == 1)
    v8 = 3;
  if (a3 != 1)
    v8 = 0;
  if (a3 == 2)
    return v7;
  else
    return v8;
}

- (UIView)contentTransitioningOverlayView
{
  void *v2;
  void *v3;
  void *v4;

  -[AVNewsWidgetPlayerBehaviorContext contentTransitionView](self, "contentTransitionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "incomingContentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentOverlayView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIView *)v4;
}

- (int64_t)activeContentTransitionType
{
  void *v3;
  uint64_t v4;
  void *v5;
  int64_t v6;

  -[AVNewsWidgetPlayerBehaviorContext contentTransitionView](self, "contentTransitionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "transitionState");

  if ((unint64_t)(v4 - 3) > 4)
    return 0;
  -[AVNewsWidgetPlayerBehaviorContext contentTransitionView](self, "contentTransitionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[AVNewsWidgetPlayerBehaviorContext contentTransitionTypeForTransitionDirection:](self, "contentTransitionTypeForTransitionDirection:", objc_msgSend(v5, "transitionDirection"));

  return v6;
}

- (BOOL)isContentTransitionInteractive
{
  void *v2;
  char v3;

  -[AVNewsWidgetPlayerBehaviorContext contentTransitionView](self, "contentTransitionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isTransitionInteractive");

  return v3;
}

- (void)setStartNextContentTransitionButtonEnabled:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const char *v6;
  int v7;
  const char *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v3 = a3;
  v13 = *MEMORY[0x1E0C80C00];
  _AVLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = "NO";
    v7 = 136315650;
    v8 = "-[AVNewsWidgetPlayerBehaviorContext setStartNextContentTransitionButtonEnabled:]";
    v10 = "startNextContentTransitionButtonEnabled";
    v9 = 2080;
    if (v3)
      v6 = "YES";
    v11 = 2080;
    v12 = v6;
    _os_log_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_DEFAULT, "%s %s %s", (uint8_t *)&v7, 0x20u);
  }

  self->_startNextContentTransitionButtonEnabled = v3;
  -[AVNewsWidgetPlayerBehaviorContext updateStartLeftRightContentTransitionButtonsEnabled](self, "updateStartLeftRightContentTransitionButtonsEnabled");
}

- (void)setStartPreviousContentTransitionButtonEnabled:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const char *v6;
  int v7;
  const char *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v3 = a3;
  v13 = *MEMORY[0x1E0C80C00];
  _AVLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = "NO";
    v7 = 136315650;
    v8 = "-[AVNewsWidgetPlayerBehaviorContext setStartPreviousContentTransitionButtonEnabled:]";
    v10 = "startPreviousContentTransitionButtonEnabled";
    v9 = 2080;
    if (v3)
      v6 = "YES";
    v11 = 2080;
    v12 = v6;
    _os_log_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_DEFAULT, "%s %s %s", (uint8_t *)&v7, 0x20u);
  }

  self->_startPreviousContentTransitionButtonEnabled = v3;
  -[AVNewsWidgetPlayerBehaviorContext updateStartLeftRightContentTransitionButtonsEnabled](self, "updateStartLeftRightContentTransitionButtonsEnabled");
}

- (void)updateStartLeftRightContentTransitionButtonsEnabled
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _BOOL8 v8;
  void *v9;
  void *v10;
  _BOOL8 v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id location;

  -[AVNewsWidgetPlayerBehaviorContext playerViewController](self, "playerViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "effectiveUserInterfaceLayoutDirection");

  -[AVNewsWidgetPlayerBehaviorContext playerViewController](self, "playerViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "playbackControlsController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v8 = -[AVNewsWidgetPlayerBehaviorContext isStartNextContentTransitionButtonEnabled](self, "isStartNextContentTransitionButtonEnabled");
  else
    v8 = -[AVNewsWidgetPlayerBehaviorContext isStartPreviousContentTransitionButtonEnabled](self, "isStartPreviousContentTransitionButtonEnabled");
  objc_msgSend(v7, "setStartLeftwardContentTransitionButtonEnabled:", v8);

  -[AVNewsWidgetPlayerBehaviorContext playerViewController](self, "playerViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "playbackControlsController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v11 = -[AVNewsWidgetPlayerBehaviorContext isStartPreviousContentTransitionButtonEnabled](self, "isStartPreviousContentTransitionButtonEnabled");
  else
    v11 = -[AVNewsWidgetPlayerBehaviorContext isStartNextContentTransitionButtonEnabled](self, "isStartNextContentTransitionButtonEnabled");
  objc_msgSend(v10, "setStartRightwardContentTransitionButtonEnabled:", v11);

  if (-[AVNewsWidgetPlayerBehaviorContext isStartNextContentTransitionButtonEnabled](self, "isStartNextContentTransitionButtonEnabled")|| -[AVNewsWidgetPlayerBehaviorContext isStartPreviousContentTransitionButtonEnabled](self, "isStartPreviousContentTransitionButtonEnabled"))
  {
    objc_initWeak(&location, self);
    -[AVNewsWidgetPlayerBehaviorContext playerViewController](self, "playerViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "playbackControlsController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __88__AVNewsWidgetPlayerBehaviorContext_updateStartLeftRightContentTransitionButtonsEnabled__block_invoke;
    v16[3] = &unk_1E5BB38A0;
    objc_copyWeak(&v17, &location);
    objc_msgSend(v13, "setContentTransitionAction:", v16);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  else
  {
    -[AVNewsWidgetPlayerBehaviorContext playerViewController](self, "playerViewController");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "playbackControlsController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setContentTransitionAction:", 0);

  }
}

- (void)setCustomContentTransitioningInfoPanel:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  const char *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _AVLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 136315394;
    v16 = "-[AVNewsWidgetPlayerBehaviorContext setCustomContentTransitioningInfoPanel:]";
    v17 = 2112;
    v18 = v5;
    _os_log_impl(&dword_1AC4B1000, v6, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v15, 0x16u);
  }

  objc_storeStrong((id *)&self->_customContentTransitioningInfoPanel, a3);
  -[AVNewsWidgetPlayerBehaviorContext playerViewController](self, "playerViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isViewLoaded");

  if (v8)
  {
    -[AVNewsWidgetPlayerBehaviorContext playerViewController](self, "playerViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "loadPlaybackControlsViewIfNeeded");

    -[AVNewsWidgetPlayerBehaviorContext playerViewController](self, "playerViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "contentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "playbackControlsView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "transportControlsView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setCustomContentTransitioningInfoPanel:", v5);

  }
}

- (void)didAddBehavior:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char isKindOfClass;
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
  id v30;

  -[AVNewsWidgetPlayerBehaviorContext playerViewController](self, "playerViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isViewLoaded");

  if (v5)
  {
    -[AVNewsWidgetPlayerBehaviorContext playerViewController](self, "playerViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "playbackControlsController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setShowsVideoGravityButton:", 0);

  }
  -[AVNewsWidgetPlayerBehaviorContext playerViewController](self, "playerViewController");
  v30 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v30, "isViewLoaded"))
  {
    -[AVNewsWidgetPlayerBehaviorContext playerViewController](self, "playerViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "playbackContentContainerView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
      return;
    -[AVNewsWidgetPlayerBehaviorContext playerViewController](self, "playerViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "contentView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "playbackContentContainerView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "activeContentView");
    v30 = (id)objc_claimAutoreleasedReturnValue();

    -[AVNewsWidgetPlayerBehaviorContext playerViewController](self, "playerViewController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "contentView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "frame");
    -[AVNewsWidgetPlayerBehaviorContext makePlaybackContentContainerWithFrame:activeContentView:](self, "makePlaybackContentContainerWithFrame:activeContentView:", v30);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setPlaybackContentContainerView:", v17);

    -[AVNewsWidgetPlayerBehaviorContext playerViewController](self, "playerViewController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "playbackControlsController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setPlaybackControlsIncludeStartContentTransitionButtons:", 1);

    -[AVNewsWidgetPlayerBehaviorContext updateStartLeftRightContentTransitionButtonsEnabled](self, "updateStartLeftRightContentTransitionButtonsEnabled");
    -[AVNewsWidgetPlayerBehaviorContext playerViewController](self, "playerViewController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "_transitionController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "interactiveGestureTracker");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVNewsWidgetPlayerBehaviorContext contentTransitionView](self, "contentTransitionView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "panGestureRecognizer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setContentTransitioningViewGestureRecognizer:", v24);

    -[AVNewsWidgetPlayerBehaviorContext playerViewController](self, "playerViewController");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "view");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "window");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    -[AVNewsWidgetPlayerBehaviorContext playerViewController](self, "playerViewController");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "contentView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setStyleSheetShouldUseCompactFullScreenItemSize:", objc_msgSend(v27, "avkit_isHostedInAnotherProcess"));

  }
}

- (void)willRemoveBehavior:(id)a3
{
  void *v4;
  int v5;
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
  id v19;

  -[AVNewsWidgetPlayerBehaviorContext playerViewController](self, "playerViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isViewLoaded");

  if (v5)
  {
    -[AVNewsWidgetPlayerBehaviorContext playerViewController](self, "playerViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "playbackControlsController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPlaybackControlsIncludeStartContentTransitionButtons:", 0);

    -[AVNewsWidgetPlayerBehaviorContext playerViewController](self, "playerViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVNewsWidgetPlayerBehaviorContext playerViewController](self, "playerViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "playbackContentContainerView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setPlaybackContentContainerView:", v12);

    -[AVNewsWidgetPlayerBehaviorContext playerViewController](self, "playerViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_transitionController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "interactiveGestureTracker");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setContentTransitioningViewGestureRecognizer:", 0);

    -[AVNewsWidgetPlayerBehaviorContext playerViewController](self, "playerViewController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "contentView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setStyleSheetShouldUseCompactFullScreenItemSize:", 0);

    -[AVNewsWidgetPlayerBehaviorContext playerViewController](self, "playerViewController");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "playbackControlsController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setShowsVideoGravityButton:", 1);

  }
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  -[AVNewsWidgetPlayerBehaviorContext playerViewController](self, "playerViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "playbackControlsController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShowsVideoGravityButton:", 0);

  -[AVNewsWidgetPlayerBehaviorContext playerViewController](self, "playerViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "playbackControlsController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPlaybackControlsIncludeStartContentTransitionButtons:", 1);

  -[AVNewsWidgetPlayerBehaviorContext updateStartLeftRightContentTransitionButtonsEnabled](self, "updateStartLeftRightContentTransitionButtonsEnabled");
  -[AVNewsWidgetPlayerBehaviorContext playerViewController](self, "playerViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_transitionController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "interactiveGestureTracker");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVNewsWidgetPlayerBehaviorContext contentTransitionView](self, "contentTransitionView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "panGestureRecognizer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setContentTransitioningViewGestureRecognizer:", v11);

  -[AVNewsWidgetPlayerBehaviorContext playerViewController](self, "playerViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "window");
  v24 = (id)objc_claimAutoreleasedReturnValue();

  -[AVNewsWidgetPlayerBehaviorContext playerViewController](self, "playerViewController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "contentView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setStyleSheetShouldUseCompactFullScreenItemSize:", objc_msgSend(v24, "avkit_isHostedInAnotherProcess"));

  -[AVNewsWidgetPlayerBehaviorContext customContentTransitioningInfoPanel](self, "customContentTransitioningInfoPanel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[AVNewsWidgetPlayerBehaviorContext playerViewController](self, "playerViewController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "contentView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "loadPlaybackControlsViewIfNeeded");

    -[AVNewsWidgetPlayerBehaviorContext playerViewController](self, "playerViewController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "contentView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "playbackControlsView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "transportControlsView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVNewsWidgetPlayerBehaviorContext customContentTransitioningInfoPanel](self, "customContentTransitioningInfoPanel");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setCustomContentTransitioningInfoPanel:", v23);

  }
}

- (id)makePlaybackContentContainerWithFrame:(CGRect)a3 activeContentView:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  AVPlaybackContentTransitioningView *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint8_t v19[16];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  -[AVNewsWidgetPlayerBehaviorContext contentTransitionView](self, "contentTransitionView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    _AVLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v19 = 0;
      _os_log_error_impl(&dword_1AC4B1000, v11, OS_LOG_TYPE_ERROR, "Already had a content transition view, which is unexpected.", v19, 2u);
    }

  }
  -[AVNewsWidgetPlayerBehaviorContext contentTransitionView](self, "contentTransitionView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeFromSuperview");

  v13 = -[AVPlaybackContentTransitioningView initWithFrame:activeContentView:]([AVPlaybackContentTransitioningView alloc], "initWithFrame:activeContentView:", v9, x, y, width, height);
  -[AVPlaybackContentTransitioningView setContentTransitioningDelegate:](v13, "setContentTransitioningDelegate:", self);
  -[AVNewsWidgetPlayerBehaviorContext setContentTransitionView:](self, "setContentTransitionView:", v13);
  -[AVNewsWidgetPlayerBehaviorContext playerViewController](self, "playerViewController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "_transitionController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "interactiveGestureTracker");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVPlaybackContentTransitioningView panGestureRecognizer](v13, "panGestureRecognizer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setContentTransitioningViewGestureRecognizer:", v17);

  return v13;
}

- (BOOL)contentTransitioningViewShouldBeginDragging:(id)a3 locationInView:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  -[AVNewsWidgetPlayerBehaviorContext playerViewController](self, "playerViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "hasActiveTransition") & 1) != 0)
  {
    LOBYTE(v9) = 0;
  }
  else
  {
    -[AVNewsWidgetPlayerBehaviorContext playerViewController](self, "playerViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "player");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      LOBYTE(v9) = 0;
      goto LABEL_7;
    }
    -[AVNewsWidgetPlayerBehaviorContext playerViewController](self, "playerViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "contentView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "convertPoint:fromView:", v7, x, y);
    v15 = v14;
    v17 = v16;

    -[AVNewsWidgetPlayerBehaviorContext playerViewController](self, "playerViewController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "contentView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "hitTest:withEvent:", 0, v15, v17);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[AVNewsWidgetPlayerBehaviorContext playerViewController](self, "playerViewController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "contentView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v21, "isViewDescendantOfPlaybackControlsSubview:", v8) ^ 1;

  }
LABEL_7:

  return v9;
}

- (BOOL)contentTransitioningView:(id)a3 shouldBeginTransitionWithDirection:(int64_t)a4
{
  int64_t v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;

  -[AVNewsWidgetPlayerBehaviorContext setContentTransitioningPlayer:](self, "setContentTransitioningPlayer:", 0);
  v6 = -[AVNewsWidgetPlayerBehaviorContext contentTransitionTypeForTransitionDirection:](self, "contentTransitionTypeForTransitionDirection:", a4);
  if (!v6)
    return 0;
  v7 = v6;
  -[AVNewsWidgetPlayerBehaviorContext behavior](self, "behavior");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "playerForContentTransitionType:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[AVNewsWidgetPlayerBehaviorContext setContentTransitioningPlayer:](self, "setContentTransitioningPlayer:", v9);
  -[AVNewsWidgetPlayerBehaviorContext contentTransitioningPlayer](self, "contentTransitioningPlayer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10 != 0;

  return v11;
}

- (id)contentTransitioningPlayerContentViewForTransition:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  __AVPlayerLayerView *v11;
  void *v12;
  __AVPlayerLayerView *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  AVPlaybackContentContainerView *v21;
  AVPlaybackContentContainerView *v22;
  void *v23;
  void *v24;
  uint8_t v26[16];
  uint8_t buf[16];

  v4 = a3;
  -[AVNewsWidgetPlayerBehaviorContext contentTransitionView](self, "contentTransitionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "incomingContentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    _AVLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1AC4B1000, v7, OS_LOG_TYPE_ERROR, "Content view unexpectedly had incomingContentView.", buf, 2u);
    }

  }
  -[AVNewsWidgetPlayerBehaviorContext contentTransitioningPlayer](self, "contentTransitioningPlayer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    _AVLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v26 = 0;
      _os_log_error_impl(&dword_1AC4B1000, v9, OS_LOG_TYPE_ERROR, "contentTransitioningPlayer should never be nil here.", v26, 2u);
    }

  }
  -[AVNewsWidgetPlayerBehaviorContext contentTransitioningPlayer](self, "contentTransitioningPlayer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = [__AVPlayerLayerView alloc];
    objc_msgSend(v4, "activeContentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "videoContentFrame");
    v13 = -[__AVPlayerLayerView initWithFrame:](v11, "initWithFrame:");

    -[__AVPlayerLayerView playerLayer](v13, "playerLayer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVNewsWidgetPlayerBehaviorContext contentTransitioningPlayer](self, "contentTransitioningPlayer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setPlayer:", v15);

    objc_msgSend(v4, "activeContentView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "playerLayerView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "pixelBufferAttributes");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[__AVPlayerLayerView setPixelBufferAttributes:](v13, "setPixelBufferAttributes:", v18);

    objc_msgSend(v4, "activeContentView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "playerLayerView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[__AVPlayerLayerView setVideoGravity:](v13, "setVideoGravity:", objc_msgSend(v20, "videoGravity"));

    v21 = [AVPlaybackContentContainerView alloc];
    objc_msgSend(v4, "bounds");
    v22 = -[AVPlaybackContentContainerView initWithFrame:playerLayerView:contentOverlayView:](v21, "initWithFrame:playerLayerView:contentOverlayView:", v13, 0);
    -[AVNewsWidgetPlayerBehaviorContext contentTransitionView](self, "contentTransitionView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "activeContentView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "videoContentFrame");
    -[AVPlaybackContentContainerView setVideoContentFrame:](v22, "setVideoContentFrame:");

  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (void)contentTransitioningViewDidChangeTransitionStatus:(id)a3 oldState:(int64_t)a4 oldTransitionDirection:(int64_t)a5 oldProgress:(double)a6
{
  uint64_t v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v9 = objc_msgSend(v14, "transitionState");
  objc_msgSend(v14, "transitionProgress");
  v11 = v10;
  switch(objc_msgSend(v14, "transitionState"))
  {
    case 3:
      if (v9 == a4)
        goto LABEL_9;
      -[AVNewsWidgetPlayerBehaviorContext behavior](self, "behavior");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "willBeginContentTransition");
      goto LABEL_14;
    case 4:
      if (v9 == a4)
        goto LABEL_9;
      -[AVNewsWidgetPlayerBehaviorContext behavior](self, "behavior");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "willCancelContentTransition");
      goto LABEL_14;
    case 5:
      if (v9 == a4)
        goto LABEL_15;
      -[AVNewsWidgetPlayerBehaviorContext setContentTransitioningPlayer:](self, "setContentTransitioningPlayer:", 0);
      -[AVNewsWidgetPlayerBehaviorContext behavior](self, "behavior");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "didCancelContentTransition");
      goto LABEL_14;
    case 6:
      if (v9 == a4)
      {
LABEL_9:
        if (v11 == a6)
          goto LABEL_15;
        -[AVNewsWidgetPlayerBehaviorContext behavior](self, "behavior");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "transitionProgress");
        objc_msgSend(v12, "didUpdateContentTransitionProgress:");
      }
      else
      {
        -[AVNewsWidgetPlayerBehaviorContext behavior](self, "behavior");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "willCompleteContentTransition");
      }
LABEL_14:

LABEL_15:
      return;
    case 7:
      if (v9 == a4)
        goto LABEL_15;
      -[AVNewsWidgetPlayerBehaviorContext playerViewController](self, "playerViewController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "activeContentViewDidChange");

      -[AVNewsWidgetPlayerBehaviorContext setContentTransitioningPlayer:](self, "setContentTransitioningPlayer:", 0);
      -[AVNewsWidgetPlayerBehaviorContext behavior](self, "behavior");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "didCompleteContentTransition");
      goto LABEL_14;
    default:
      goto LABEL_15;
  }
}

- (int64_t)contentTransitionTypeForTransitionDirection:(int64_t)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  int64_t v7;
  int64_t v8;

  -[AVNewsWidgetPlayerBehaviorContext playerViewController](self, "playerViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "effectiveUserInterfaceLayoutDirection");

  v7 = 1;
  if (v6 == 1)
    v7 = 2;
  v8 = 1;
  if (v6 != 1)
    v8 = 2;
  if (a3 != 2)
    v8 = 0;
  if (a3 == 3)
    return v7;
  else
    return v8;
}

- (AVPlayerViewController)playerViewController
{
  return (AVPlayerViewController *)objc_loadWeakRetained((id *)&self->_playerViewController);
}

- (AVNewsWidgetPlayerBehavior)behavior
{
  return (AVNewsWidgetPlayerBehavior *)objc_loadWeakRetained((id *)&self->_behavior);
}

- (void)setBehavior:(id)a3
{
  objc_storeWeak((id *)&self->_behavior, a3);
}

- (AVPlayer)contentTransitioningPlayer
{
  return self->_contentTransitioningPlayer;
}

- (void)setContentTransitioningPlayer:(id)a3
{
  objc_storeStrong((id *)&self->_contentTransitioningPlayer, a3);
}

- (BOOL)isStartNextContentTransitionButtonEnabled
{
  return self->_startNextContentTransitionButtonEnabled;
}

- (BOOL)isStartPreviousContentTransitionButtonEnabled
{
  return self->_startPreviousContentTransitionButtonEnabled;
}

- (UIView)customContentTransitioningInfoPanel
{
  return self->_customContentTransitioningInfoPanel;
}

- (AVPlaybackContentTransitioningView)contentTransitionView
{
  return self->_contentTransitionView;
}

- (void)setContentTransitionView:(id)a3
{
  objc_storeStrong((id *)&self->_contentTransitionView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentTransitionView, 0);
  objc_storeStrong((id *)&self->_customContentTransitioningInfoPanel, 0);
  objc_storeStrong((id *)&self->_contentTransitioningPlayer, 0);
  objc_destroyWeak((id *)&self->_behavior);
  objc_destroyWeak((id *)&self->_playerViewController);
}

void __88__AVNewsWidgetPlayerBehaviorContext_updateStartLeftRightContentTransitionButtonsEnabled__block_invoke(uint64_t a1, uint64_t a2)
{
  char *WeakRetained;
  char *v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = objc_msgSend(WeakRetained, "activeContentTransitionType");
    _AVLog();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v5)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v8 = 138412290;
        v9 = v4;
        _os_log_error_impl(&dword_1AC4B1000, v7, OS_LOG_TYPE_ERROR, "Warning: Attempted to start content transition on a %@, which was already transitioning. Ignoring.", (uint8_t *)&v8, 0xCu);
      }

    }
    else
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v8 = 136315394;
        v9 = "-[AVNewsWidgetPlayerBehaviorContext updateStartLeftRightContentTransitionButtonsEnabled]_block_invoke";
        v10 = 2048;
        v11 = a2;
        _os_log_impl(&dword_1AC4B1000, v7, OS_LOG_TYPE_DEFAULT, "%s %ld", (uint8_t *)&v8, 0x16u);
      }

      objc_msgSend(v4, "startContentTransition:", a2);
    }
  }

}

@end
