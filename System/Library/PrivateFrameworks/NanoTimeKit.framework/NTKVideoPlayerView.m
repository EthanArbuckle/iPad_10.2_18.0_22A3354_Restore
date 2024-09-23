@implementation NTKVideoPlayerView

- (NTKVideoPlayerView)initWithFrame:(CGRect)a3
{
  NTKVideoPlayerView *v3;
  NTKVideoPlayerView *v4;
  void *v5;
  NTKTaskScheduler *v6;
  NTKTaskScheduler *taskScheduler;
  __int128 v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NTKVideoPlayerView;
  v3 = -[NTKVideoPlayerView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[NTKVideoPlayerView _createPosterImageView](v3, "_createPosterImageView");
    -[NTKVideoPlayerView _createCurtainView](v4, "_createCurtainView");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v4, sel__mediaServicesWereReset_, *MEMORY[0x1E0C89738], 0);

    if (CLKIsClockFaceApp())
    {
      v6 = objc_alloc_init(NTKTaskScheduler);
      taskScheduler = v4->_taskScheduler;
      v4->_taskScheduler = v6;

    }
    v4->_currentDataMode = 0;
    v4->_fadeAnimationDuration = 0.4;
    v4->_pausedViewEnabled = 1;
    v4->_playerBehavior = 3;
    v4->_prerollState = 0;
    v4->_videoPlayerInViewHierarchy = 0;
    v8 = *(_OWORD *)(MEMORY[0x1E0DC49E8] + 16);
    *(_OWORD *)&v4->_videoPlayerEdgeInsets.top = *MEMORY[0x1E0DC49E8];
    *(_OWORD *)&v4->_videoPlayerEdgeInsets.bottom = v8;
    v4->_shouldApplyVideoInsetToPosterImage = 0;
    v4->_isHandlingTapGesture = 0;
    v4->_paused = 1;
    v4->_frozen = 0;
    v4->_slow = 0;
    v4->_orbing = 0;
  }
  return v4;
}

- (void)dealloc
{
  UIView *curtainView;
  UIImageView *posterImageView;
  UIView *posterContainerView;
  CLKVideoPlayerView *videoPlayerView;
  void *v7;
  objc_super v8;

  curtainView = self->_curtainView;
  self->_curtainView = 0;

  posterImageView = self->_posterImageView;
  self->_posterImageView = 0;

  posterContainerView = self->_posterContainerView;
  self->_posterContainerView = 0;

  videoPlayerView = self->_videoPlayerView;
  self->_videoPlayerView = 0;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObserver:", self);

  -[NTKVideoPlayerView _cancelScheduledPreroll](self, "_cancelScheduledPreroll");
  v8.receiver = self;
  v8.super_class = (Class)NTKVideoPlayerView;
  -[NTKVideoPlayerView dealloc](&v8, sel_dealloc);
}

- (void)layoutSubviews
{
  double top;
  double left;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  UIView *curtainView;
  UIView *posterContainerView;
  UIImageView *posterImageView;
  double v16;
  double v17;
  double v18;
  double v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)NTKVideoPlayerView;
  -[NTKVideoPlayerView layoutSubviews](&v20, sel_layoutSubviews);
  -[NTKVideoPlayerView bounds](self, "bounds");
  top = self->_videoPlayerEdgeInsets.top;
  left = self->_videoPlayerEdgeInsets.left;
  v6 = v5 + left;
  v8 = v7 + top;
  v10 = v9 - (left + self->_videoPlayerEdgeInsets.right);
  v12 = v11 - (top + self->_videoPlayerEdgeInsets.bottom);
  -[CLKVideoPlayerView ntk_setBoundsAndPositionFromFrame:](self->_videoPlayerView, "ntk_setBoundsAndPositionFromFrame:", v5 + left, v7 + top, v10, v12);
  curtainView = self->_curtainView;
  -[NTKVideoPlayerView bounds](self, "bounds");
  -[UIView ntk_setBoundsAndPositionFromFrame:](curtainView, "ntk_setBoundsAndPositionFromFrame:");
  posterContainerView = self->_posterContainerView;
  -[NTKVideoPlayerView bounds](self, "bounds");
  -[UIView ntk_setBoundsAndPositionFromFrame:](posterContainerView, "ntk_setBoundsAndPositionFromFrame:");
  posterImageView = self->_posterImageView;
  if (!self->_shouldApplyVideoInsetToPosterImage)
  {
    -[NTKVideoPlayerView bounds](self, "bounds");
    v6 = v16;
    v8 = v17;
    v10 = v18;
    v12 = v19;
  }
  -[UIImageView ntk_setBoundsAndPositionFromFrame:](posterImageView, "ntk_setBoundsAndPositionFromFrame:", v6, v8, v10, v12);
}

- (void)didAddSubview:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NTKVideoPlayerView;
  -[NTKVideoPlayerView didAddSubview:](&v4, sel_didAddSubview_, a3);
  if (self->_videoPlayerView)
    -[NTKVideoPlayerView sendSubviewToBack:](self, "sendSubviewToBack:");
  if (self->_curtainView)
    -[NTKVideoPlayerView bringSubviewToFront:](self, "bringSubviewToFront:");
  if (self->_posterContainerView)
    -[NTKVideoPlayerView bringSubviewToFront:](self, "bringSubviewToFront:");
}

- (void)handleScreenOff
{
  void *v3;

  self->_isHandlingTapGesture = 0;
  if (self->_videoPlayerInViewHierarchy)
  {
    if (-[NTKVideoPlayerView _shouldChangeVideoOnWake](self, "_shouldChangeVideoOnWake"))
      -[NTKVideoPlayerView _advanceListingForEvent:](self, "_advanceListingForEvent:", 1);
    -[NTKVideoPlayerView _pause](self, "_pause");
    -[NTKVideoPlayerView _showCurtainView](self, "_showCurtainView");
    -[NTKVideoPlayerView videoPlayerView](self, "videoPlayerView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "expectPreroll");

    -[NTKVideoPlayerView _schedulePreroll](self, "_schedulePreroll");
  }
}

- (void)handleStyleDidChange
{
  if (self->_currentDataMode == 1)
  {
    -[NTKVideoPlayerView _playNextVideoForEvent:animated:](self, "_playNextVideoForEvent:animated:", 0, 0);
  }
  else
  {
    -[NTKVideoPlayerView _unloadVideoPlayerView](self, "_unloadVideoPlayerView");
    -[NTKVideoPlayerView _advanceListingForEvent:](self, "_advanceListingForEvent:", 0);
    -[NTKVideoPlayerView _loadCurrentListing](self, "_loadCurrentListing");
    -[NTKVideoPlayerView _showPosterImageView](self, "_showPosterImageView");
  }
}

- (void)applyFrozen:(BOOL)a3
{
  self->_frozen = a3;
  -[NTKVideoPlayerView _updatePauseState](self, "_updatePauseState");
}

- (void)applySlow:(BOOL)a3
{
  self->_slow = a3;
  -[NTKVideoPlayerView _updatePauseState](self, "_updatePauseState");
}

- (void)applyOrbing:(BOOL)a3
{
  self->_orbing = a3;
  -[NTKVideoPlayerView _updatePauseState](self, "_updatePauseState");
}

- (void)videoPlayerViewWasTapped
{
  if (!self->_isHandlingTapGesture)
  {
    if (-[NTKVideoPlayerView _shouldChangeVideoOnTap](self, "_shouldChangeVideoOnTap"))
    {
      self->_isHandlingTapGesture = 1;
      -[NTKVideoPlayerView _playNextVideoForEvent:animated:](self, "_playNextVideoForEvent:animated:", 2, 1);
    }
    else if (-[NTKVideoPlayerView _shouldPlayVideoOnTap](self, "_shouldPlayVideoOnTap"))
    {
      self->_isHandlingTapGesture = 1;
      -[NTKVideoPlayerView _rewindLoadedVideoToBeginning](self, "_rewindLoadedVideoToBeginning");
      -[NTKVideoPlayerView _play](self, "_play");
    }
  }
}

- (void)transitionToEditing
{
  -[NTKVideoPlayerView _updatePauseState](self, "_updatePauseState");
  if (-[UIView isHidden](self->_posterContainerView, "isHidden"))
    -[NTKVideoPlayerView _fadeToPosterImage](self, "_fadeToPosterImage");
}

- (void)applyDataMode:(int64_t)a3 comingFromDataMode:(int64_t)a4
{
  void *v5;
  int v6;

  if (self->_currentDataMode != a3)
  {
    self->_currentDataMode = a3;
    self->_isHandlingTapGesture = 0;
    switch(self->_currentDataMode)
    {
      case 0:
        goto LABEL_14;
      case 1:
        if (self->_videoPlayerInViewHierarchy)
        {
          if (self->_prerollState == 3
            && (-[NTKVideoPlayerView videoPlayerView](self, "videoPlayerView"),
                v5 = (void *)objc_claimAutoreleasedReturnValue(),
                v6 = objc_msgSend(v5, "isPlaybackReady"),
                v5,
                v6))
          {
            if (!-[UIView isHidden](self->_posterContainerView, "isHidden"))
              -[NTKVideoPlayerView _fadeFromPosterImageIfVisible:](self, "_fadeFromPosterImageIfVisible:", 0);
            -[NTKVideoPlayerView _hideCurtainView](self, "_hideCurtainView");
            -[NTKVideoPlayerView _play](self, "_play");
          }
          else
          {
            -[NTKVideoPlayerView _cancelScheduledPreroll](self, "_cancelScheduledPreroll");
            if (self->_prerollState)
            {
              -[NTKVideoPlayerView _loadCurrentListing](self, "_loadCurrentListing");
              -[NTKVideoPlayerView _play](self, "_play");
            }
            else
            {
              -[NTKVideoPlayerView _updatePauseState](self, "_updatePauseState");
            }
            -[NTKVideoPlayerView _fadeFromPosterImageIfVisible:](self, "_fadeFromPosterImageIfVisible:", 0);
          }
          self->_prerollState = 0;
        }
        else
        {
          -[NTKVideoPlayerView _playNextVideoForEvent:animated:](self, "_playNextVideoForEvent:animated:", 0, 1);
        }
        return;
      case 2:
        if (self->_videoPlayerInViewHierarchy)
          -[NTKVideoPlayerView _hidePosterImageView](self, "_hidePosterImageView");
        else
          -[NTKVideoPlayerView _loadVideoPlayerView](self, "_loadVideoPlayerView");
        goto LABEL_20;
      case 3:
        if (a4 == 1)
          goto LABEL_20;
        goto LABEL_14;
      case 4:
        -[NTKVideoPlayerView _unloadVideoPlayerView](self, "_unloadVideoPlayerView");
LABEL_14:
        -[NTKVideoPlayerView _showPosterImageView](self, "_showPosterImageView");
        break;
      case 5:
        -[NTKVideoPlayerView _showPosterImageView](self, "_showPosterImageView");
LABEL_20:
        -[NTKVideoPlayerView _updatePauseState](self, "_updatePauseState");
        break;
      default:
        return;
    }
  }
}

- (id)videoPlayerView
{
  -[NTKVideoPlayerView _createVideoPlayerViewIfNeeded](self, "_createVideoPlayerViewIfNeeded");
  return self->_videoPlayerView;
}

- (void)_resetVideoPlayer
{
  void *v3;
  CLKVideoPlayerView *videoPlayerView;

  self->_prerollState = 0;
  self->_isHandlingTapGesture = 0;
  -[NTKVideoPlayerView videoPlayerView](self, "videoPlayerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelegate:", 0);

  -[NTKVideoPlayerView _unloadVideoPlayerView](self, "_unloadVideoPlayerView");
  videoPlayerView = self->_videoPlayerView;
  self->_videoPlayerView = 0;

  -[NTKVideoPlayerView _loadVideoPlayerView](self, "_loadVideoPlayerView");
}

- (void)_loadVideoPlayerView
{
  void *v3;

  -[NTKVideoPlayerView _createVideoPlayerViewIfNeeded](self, "_createVideoPlayerViewIfNeeded");
  -[NTKVideoPlayerView videoPlayerView](self, "videoPlayerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKVideoPlayerView addSubview:](self, "addSubview:", v3);

  self->_videoPlayerInViewHierarchy = 1;
}

- (void)_unloadVideoPlayerView
{
  void *v3;

  -[NTKVideoPlayerView _cancelScheduledPreroll](self, "_cancelScheduledPreroll");
  self->_prerollState = 0;
  -[NTKVideoPlayerView _updatePauseState](self, "_updatePauseState");
  -[NTKVideoPlayerView _rewindLoadedVideoToBeginning](self, "_rewindLoadedVideoToBeginning");
  -[NTKVideoPlayerView videoPlayerView](self, "videoPlayerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

  self->_videoPlayerInViewHierarchy = 0;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
  -[NTKVideoPlayerView _cancelScheduledPreroll](self, "_cancelScheduledPreroll");
  self->_prerollState = 0;
  -[NTKVideoPlayerView _pause](self, "_pause");
  -[NTKVideoPlayerView _unloadVideoPlayerView](self, "_unloadVideoPlayerView");
}

- (void)_cancelScheduledPreroll
{
  -[NTKTaskScheduler cancelAllTasks](self->_taskScheduler, "cancelAllTasks");
}

- (void)_schedulePreroll
{
  NSObject *v3;
  NTKTaskScheduler *taskScheduler;
  id v5;
  _QWORD v6[4];
  id v7;
  id buf[2];

  _NTKLoggingObjectForDomain(32, (uint64_t)"NTKLoggingDomainAnalogVideo");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1B72A3000, v3, OS_LOG_TYPE_DEFAULT, "Scheduling preroll", (uint8_t *)buf, 2u);
  }

  if (self->_prerollState == 1)
  {
    -[NTKVideoPlayerView _cancelScheduledPreroll](self, "_cancelScheduledPreroll");
    self->_prerollState = 0;
  }
  self->_prerollState = 1;
  objc_initWeak(buf, self);
  taskScheduler = self->_taskScheduler;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __38__NTKVideoPlayerView__schedulePreroll__block_invoke;
  v6[3] = &unk_1E6BCE0A8;
  objc_copyWeak(&v7, buf);
  v5 = -[NTKTaskScheduler scheduleTask:identifier:](taskScheduler, "scheduleTask:identifier:", v6, CFSTR("com.apple.ntk.NTKVideoPlayerView"));
  objc_destroyWeak(&v7);
  objc_destroyWeak(buf);
}

uint64_t __38__NTKVideoPlayerView__schedulePreroll__block_invoke(uint64_t a1)
{
  char v1;
  _QWORD *WeakRetained;
  _QWORD *v3;
  uint64_t v4;
  NSObject *v6;
  uint64_t v7;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (!WeakRetained)
  {
LABEL_10:
    v1 = 0;
    goto LABEL_11;
  }
  v4 = WeakRetained[62];
  if ((unint64_t)(v4 - 2) < 2 || v4 == 0)
  {
    _NTKLoggingObjectForDomain(32, (uint64_t)"NTKLoggingDomainAnalogVideo");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = v3[62];
      v9 = 134217984;
      v10 = v7;
      _os_log_impl(&dword_1B72A3000, v6, OS_LOG_TYPE_DEFAULT, "Not prerolling video because _prerollState == %lu", (uint8_t *)&v9, 0xCu);
    }

    goto LABEL_10;
  }
  if (v4 == 1)
  {
    objc_msgSend(WeakRetained, "_prerollVideo");
    v1 = 1;
  }
LABEL_11:

  return v1 & 1;
}

- (void)_prerollVideo
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  _NTKLoggingObjectForDomain(32, (uint64_t)"NTKLoggingDomainAnalogVideo");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[NTKVideoPlayerView dataSource](self, "dataSource");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "currentListing");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "description");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v6;
    _os_log_impl(&dword_1B72A3000, v3, OS_LOG_TYPE_DEFAULT, "Prerolling video: %@", (uint8_t *)&v8, 0xCu);

  }
  self->_prerollState = 2;
  -[NTKVideoPlayerView _loadCurrentListing](self, "_loadCurrentListing");
  -[NTKVideoPlayerView videoPlayerView](self, "videoPlayerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "preroll");

}

- (void)videoPlayerView:(id)a3 didFinishPrerolling:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  unint64_t prerollState;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  _BOOL4 v23;
  uint64_t v24;

  v4 = a4;
  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  prerollState = self->_prerollState;
  if (prerollState < 2 || prerollState == 3)
  {
    _NTKLoggingObjectForDomain(32, (uint64_t)"NTKLoggingDomainAnalogVideo");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      -[NTKVideoPlayerView dataSource](self, "dataSource");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "currentListing");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "description");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138412546;
      v21 = v12;
      v22 = 1024;
      v23 = v4;
      _os_log_impl(&dword_1B72A3000, v9, OS_LOG_TYPE_DEFAULT, "Finished prerolling video while _prerollState != inProgress: %@ successful: %d", (uint8_t *)&v20, 0x12u);

    }
    goto LABEL_8;
  }
  if (prerollState != 2)
    goto LABEL_14;
  _NTKLoggingObjectForDomain(32, (uint64_t)"NTKLoggingDomainAnalogVideo");
  v9 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (!v4)
  {
    if (v13)
    {
      -[NTKVideoPlayerView dataSource](self, "dataSource");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "currentListing");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "description");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138412290;
      v21 = v19;
      _os_log_impl(&dword_1B72A3000, v9, OS_LOG_TYPE_DEFAULT, "Unsuccessfully prerolled video: %@", (uint8_t *)&v20, 0xCu);

    }
LABEL_8:

    goto LABEL_14;
  }
  if (v13)
  {
    -[NTKVideoPlayerView dataSource](self, "dataSource");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "currentListing");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "description");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138412290;
    v21 = v16;
    _os_log_impl(&dword_1B72A3000, v9, OS_LOG_TYPE_DEFAULT, "Successfully prerolled video: %@", (uint8_t *)&v20, 0xCu);

  }
  self->_prerollState = 3;
LABEL_14:

}

- (BOOL)_shouldPause
{
  return self->_frozen
      || self->_slow
      || self->_orbing
      || self->_currentDataMode != 1
      || !self->_videoPlayerInViewHierarchy;
}

- (void)_playIfNotPaused
{
  if (!-[NTKVideoPlayerView _shouldPause](self, "_shouldPause"))
    -[NTKVideoPlayerView _play](self, "_play");
}

- (void)_updatePauseState
{
  _BOOL4 v3;

  v3 = -[NTKVideoPlayerView _shouldPause](self, "_shouldPause");
  if (v3 && self->_paused != v3)
    -[NTKVideoPlayerView _pause](self, "_pause");
}

- (void)_play
{
  void *v3;

  -[NTKVideoPlayerView videoPlayerView](self, "videoPlayerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "play");

  self->_paused = 0;
}

- (void)_pause
{
  void *v3;

  -[NTKVideoPlayerView videoPlayerView](self, "videoPlayerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pause");

  self->_paused = 1;
}

- (void)_rewindLoadedVideoToBeginning
{
  void *v2;
  __int128 v3;
  uint64_t v4;

  -[NTKVideoPlayerView videoPlayerView](self, "videoPlayerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x1E0CA2E68];
  v4 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
  objc_msgSend(v2, "seekToTime:", &v3);

}

- (void)_playNextVideoForEvent:(unint64_t)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  void (**v7)(_QWORD);
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12[2];
  BOOL v13;
  id location;

  v4 = a4;
  if (!self->_videoPlayerInViewHierarchy)
    -[NTKVideoPlayerView _loadVideoPlayerView](self, "_loadVideoPlayerView");
  objc_initWeak(&location, self);
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __54__NTKVideoPlayerView__playNextVideoForEvent_animated___block_invoke;
  v11 = &unk_1E6BD8CB0;
  objc_copyWeak(v12, &location);
  v12[1] = (id)a3;
  v13 = v4;
  v7 = (void (**)(_QWORD))_Block_copy(&v8);
  -[NTKVideoPlayerView _pause](self, "_pause", v8, v9, v10, v11);
  if (v4)
    -[NTKVideoPlayerView _fadeToCurtainView:](self, "_fadeToCurtainView:", v7);
  else
    v7[2](v7);

  objc_destroyWeak(v12);
  objc_destroyWeak(&location);
}

void __54__NTKVideoPlayerView__playNextVideoForEvent_animated___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  _QWORD v4[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_advanceListingForEvent:", *(_QWORD *)(a1 + 40));
    objc_msgSend(v3, "_loadCurrentListing");
    if (*(_BYTE *)(a1 + 48))
    {
      v4[0] = MEMORY[0x1E0C809B0];
      v4[1] = 3221225472;
      v4[2] = __54__NTKVideoPlayerView__playNextVideoForEvent_animated___block_invoke_2;
      v4[3] = &unk_1E6BCD5F0;
      v4[4] = v3;
      objc_msgSend(v3, "_fadeFromPosterImageIfVisible:", v4);
    }
    else
    {
      objc_msgSend(v3, "_hidePosterImageView");
      objc_msgSend(v3, "_playIfNotPaused");
    }
  }

}

uint64_t __54__NTKVideoPlayerView__playNextVideoForEvent_animated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_playIfNotPaused");
}

- (void)_loadCurrentListing
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[NTKVideoPlayerView dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentListing");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[NTKVideoPlayerView videoPlayerView](self, "videoPlayerView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "video");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "loadVideo:", v5);

  }
}

- (void)_advanceListingForEvent:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[NTKVideoPlayerView dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "advanceToNextListing:", a3);

  -[NTKVideoPlayerView delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NTKVideoPlayerView dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentListing");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "customizeFaceViewForListing:changeEvent:animated:", v7, a3, a3 != 1);

}

- (void)videoPlayerViewDidBeginPlaying:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  self->_isHandlingTapGesture = 0;
  -[NTKVideoPlayerView _fadeFromPosterImageAndCurtainViewIfVisible](self, "_fadeFromPosterImageAndCurtainViewIfVisible", a3);
  -[NTKVideoPlayerView delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKVideoPlayerView dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentListing");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "customizeFaceViewForListing:changeEvent:animated:", v6, 3, 1);

  -[NTKVideoPlayerView _queueSubsequentListingIfSupported](self, "_queueSubsequentListingIfSupported");
  -[NTKVideoPlayerView delegate](self, "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "videoDidBeginPlayingQueuedVideo");

}

- (void)videoPlayerViewDidPauseAfterPlayingVideoToEnd:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  -[NTKVideoPlayerView delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "videoDidFinishPlayingToEnd");

  if (!self->_paused)
  {
    -[NTKVideoPlayerView dataSource](self, "dataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "currentListing");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "endBehavior");

    switch(v7)
    {
      case 0:
        -[NTKVideoPlayerView _playNextVideoForEvent:animated:](self, "_playNextVideoForEvent:animated:", 4, 1);
        break;
      case 1:
        -[NTKVideoPlayerView _pause](self, "_pause");
        -[NTKVideoPlayerView _fadeToCurtainView:](self, "_fadeToCurtainView:", 0);
        break;
      case 2:
        -[NTKVideoPlayerView _rewindLoadedVideoToBeginning](self, "_rewindLoadedVideoToBeginning");
        -[NTKVideoPlayerView _play](self, "_play");
        break;
      case 3:
        -[NTKVideoPlayerView _pause](self, "_pause");
        break;
      default:
        return;
    }
  }
}

- (void)videoPlayerViewDidBeginPlayingQueuedVideo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[NTKVideoPlayerView delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "videoDidFinishPlayingToEnd");

  -[NTKVideoPlayerView delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKVideoPlayerView dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentListing");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "customizeFaceViewForListing:changeEvent:animated:", v7, 3, 1);

  -[NTKVideoPlayerView _queueSubsequentListingIfSupported](self, "_queueSubsequentListingIfSupported");
}

- (void)_queueSubsequentListingIfSupported
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[NTKVideoPlayerView dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "listingToQueueOncePlaybackStarts");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[NTKVideoPlayerView videoPlayerView](self, "videoPlayerView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "video");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "queueVideo:", v5);

  }
}

- (void)setPosterImage:(id)a3
{
  id v4;

  v4 = a3;
  -[NTKVideoPlayerView _createPosterImageView](self, "_createPosterImageView");
  -[UIImageView setImage:](self->_posterImageView, "setImage:", v4);

}

- (void)_createPosterImageView
{
  id v3;
  UIView *v4;
  UIView *posterContainerView;
  UIView *v6;
  void *v7;
  id v8;
  UIImageView *v9;
  UIImageView *posterImageView;

  if (!self->_posterContainerView)
  {
    v3 = objc_alloc(MEMORY[0x1E0DC3F10]);
    -[NTKVideoPlayerView bounds](self, "bounds");
    v4 = (UIView *)objc_msgSend(v3, "initWithFrame:");
    posterContainerView = self->_posterContainerView;
    self->_posterContainerView = v4;

    v6 = self->_posterContainerView;
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v6, "setBackgroundColor:", v7);

    -[UIView setHidden:](self->_posterContainerView, "setHidden:", 1);
    -[NTKVideoPlayerView addSubview:](self, "addSubview:", self->_posterContainerView);
    v8 = objc_alloc(MEMORY[0x1E0DC3890]);
    -[NTKVideoPlayerView bounds](self, "bounds");
    v9 = (UIImageView *)objc_msgSend(v8, "initWithFrame:");
    posterImageView = self->_posterImageView;
    self->_posterImageView = v9;

    -[UIImageView setContentMode:](self->_posterImageView, "setContentMode:", 1);
    -[UIView addSubview:](self->_posterContainerView, "addSubview:", self->_posterImageView);
  }
}

- (void)_showPosterImageView
{
  -[UIView setAlpha:](self->_posterContainerView, "setAlpha:", 1.0);
  -[UIView setHidden:](self->_posterContainerView, "setHidden:", 0);
}

- (void)_hidePosterImageView
{
  -[UIView setHidden:](self->_posterContainerView, "setHidden:", 1);
}

- (void)_fadeToPosterImage
{
  double fadeAnimationDuration;
  _QWORD v4[5];
  _QWORD v5[5];

  -[UIView setAlpha:](self->_curtainView, "setAlpha:", 0.0);
  -[UIView setHidden:](self->_curtainView, "setHidden:", 0);
  -[UIView setAlpha:](self->_posterContainerView, "setAlpha:", 0.0);
  -[UIView setHidden:](self->_posterContainerView, "setHidden:", 0);
  fadeAnimationDuration = self->_fadeAnimationDuration;
  v4[4] = self;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __40__NTKVideoPlayerView__fadeToPosterImage__block_invoke;
  v5[3] = &unk_1E6BCD5F0;
  v5[4] = self;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __40__NTKVideoPlayerView__fadeToPosterImage__block_invoke_2;
  v4[3] = &unk_1E6BD05C8;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:completion:", v5, v4, fadeAnimationDuration);
}

uint64_t __40__NTKVideoPlayerView__fadeToPosterImage__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "setAlpha:", 1.0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "setAlpha:", 1.0);
}

uint64_t __40__NTKVideoPlayerView__fadeToPosterImage__block_invoke_2(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "_rewindLoadedVideoToBeginning");
  return result;
}

- (void)_fadeFromPosterImageIfVisible:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  double fadeAnimationDuration;
  _QWORD v7[5];
  void (**v8)(_QWORD);
  _QWORD v9[5];

  v4 = (void (**)(_QWORD))a3;
  if (-[UIView isHidden](self->_posterContainerView, "isHidden"))
  {
    if (v4)
      v4[2](v4);
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0DC3F10];
    fadeAnimationDuration = self->_fadeAnimationDuration;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __52__NTKVideoPlayerView__fadeFromPosterImageIfVisible___block_invoke;
    v9[3] = &unk_1E6BCD5F0;
    v9[4] = self;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __52__NTKVideoPlayerView__fadeFromPosterImageIfVisible___block_invoke_2;
    v7[3] = &unk_1E6BCE0F8;
    v7[4] = self;
    v8 = v4;
    objc_msgSend(v5, "animateWithDuration:animations:completion:", v9, v7, fadeAnimationDuration);

  }
}

uint64_t __52__NTKVideoPlayerView__fadeFromPosterImageIfVisible___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "setAlpha:", 0.0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "setAlpha:", 0.0);
}

uint64_t __52__NTKVideoPlayerView__fadeFromPosterImageIfVisible___block_invoke_2(uint64_t result, int a2)
{
  uint64_t v2;

  if (a2)
  {
    v2 = result;
    objc_msgSend(*(id *)(result + 32), "_hidePosterImageView");
    objc_msgSend(*(id *)(v2 + 32), "_hideCurtainView");
    result = *(_QWORD *)(v2 + 40);
    if (result)
      return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_createCurtainView
{
  id v3;
  void *v4;
  UIView *v5;
  UIView *curtainView;
  UIView *v7;
  void *v8;

  if (!self->_curtainView)
  {
    v3 = objc_alloc(MEMORY[0x1E0DC3F10]);
    -[NTKVideoPlayerView videoPlayerView](self, "videoPlayerView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bounds");
    v5 = (UIView *)objc_msgSend(v3, "initWithFrame:");
    curtainView = self->_curtainView;
    self->_curtainView = v5;

    v7 = self->_curtainView;
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v7, "setBackgroundColor:", v8);

    -[UIView setHidden:](self->_curtainView, "setHidden:", 1);
    -[NTKVideoPlayerView addSubview:](self, "addSubview:", self->_curtainView);
  }
}

- (void)_showCurtainView
{
  -[UIView setAlpha:](self->_curtainView, "setAlpha:", 1.0);
  -[UIView setHidden:](self->_curtainView, "setHidden:", 0);
}

- (void)_hideCurtainView
{
  -[UIView setHidden:](self->_curtainView, "setHidden:", 1);
}

- (void)_fadeToCurtainView:(id)a3
{
  id v4;
  void *v5;
  double fadeAnimationDuration;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[5];

  v4 = a3;
  -[UIView setAlpha:](self->_curtainView, "setAlpha:", 0.0);
  -[UIView setHidden:](self->_curtainView, "setHidden:", 0);
  v5 = (void *)MEMORY[0x1E0DC3F10];
  fadeAnimationDuration = self->_fadeAnimationDuration;
  v9 = v4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __41__NTKVideoPlayerView__fadeToCurtainView___block_invoke;
  v10[3] = &unk_1E6BCD5F0;
  v10[4] = self;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __41__NTKVideoPlayerView__fadeToCurtainView___block_invoke_2;
  v8[3] = &unk_1E6BCE0D0;
  v7 = v4;
  objc_msgSend(v5, "animateWithDuration:animations:completion:", v10, v8, fadeAnimationDuration);

}

uint64_t __41__NTKVideoPlayerView__fadeToCurtainView___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "setAlpha:", 1.0);
}

uint64_t __41__NTKVideoPlayerView__fadeToCurtainView___block_invoke_2(uint64_t result, int a2)
{
  if (a2)
  {
    result = *(_QWORD *)(result + 32);
    if (result)
      return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_fadeFromCurtainViewIfVisible
{
  double fadeAnimationDuration;
  _QWORD v4[5];
  _QWORD v5[5];

  if (!-[UIView isHidden](self->_curtainView, "isHidden"))
  {
    fadeAnimationDuration = self->_fadeAnimationDuration;
    v4[4] = self;
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __51__NTKVideoPlayerView__fadeFromCurtainViewIfVisible__block_invoke;
    v5[3] = &unk_1E6BCD5F0;
    v5[4] = self;
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __51__NTKVideoPlayerView__fadeFromCurtainViewIfVisible__block_invoke_2;
    v4[3] = &unk_1E6BD05C8;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:completion:", v5, v4, fadeAnimationDuration);
  }
}

uint64_t __51__NTKVideoPlayerView__fadeFromCurtainViewIfVisible__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "setAlpha:", 0.0);
}

uint64_t __51__NTKVideoPlayerView__fadeFromCurtainViewIfVisible__block_invoke_2(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "_hideCurtainView");
  return result;
}

- (void)_fadeFromPosterImageAndCurtainViewIfVisible
{
  -[NTKVideoPlayerView _fadeFromCurtainViewIfVisible](self, "_fadeFromCurtainViewIfVisible");
  -[NTKVideoPlayerView _fadeFromPosterImageIfVisible:](self, "_fadeFromPosterImageIfVisible:", 0);
}

- (void)setVideoPlayerTransform:(CGAffineTransform *)a3
{
  CLKVideoPlayerView *videoPlayerView;
  __int128 v4;
  _OWORD v5[3];

  videoPlayerView = self->_videoPlayerView;
  v4 = *(_OWORD *)&a3->c;
  v5[0] = *(_OWORD *)&a3->a;
  v5[1] = v4;
  v5[2] = *(_OWORD *)&a3->tx;
  -[CLKVideoPlayerView setTransform:](videoPlayerView, "setTransform:", v5);
}

- (void)setVideoPlayerInset:(UIEdgeInsets)a3
{
  if (self->_videoPlayerEdgeInsets.left != a3.left
    || self->_videoPlayerEdgeInsets.top != a3.top
    || self->_videoPlayerEdgeInsets.right != a3.right
    || self->_videoPlayerEdgeInsets.bottom != a3.bottom)
  {
    self->_videoPlayerEdgeInsets = a3;
    -[NTKVideoPlayerView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setVideoPlayerResizeGravity:(int64_t)a3
{
  -[CLKVideoPlayerView setGravityResize:](self->_videoPlayerView, "setGravityResize:", a3);
}

- (void)setShouldApplyVideoInsetToPosterImage:(BOOL)a3
{
  if (self->_shouldApplyVideoInsetToPosterImage != a3)
  {
    self->_shouldApplyVideoInsetToPosterImage = a3;
    -[NTKVideoPlayerView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_removeCurrentVideo
{
  id v2;

  -[CLKVideoPlayerView player](self->_videoPlayerView, "player");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllItems");

}

- (BOOL)_shouldChangeVideoOnTap
{
  return (LOBYTE(self->_playerBehavior) >> 1) & 1;
}

- (BOOL)_shouldPlayVideoOnTap
{
  void *v3;
  _BOOL4 v4;

  -[NTKVideoPlayerView videoPlayerView](self, "videoPlayerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "playing") & 1) != 0)
    LOBYTE(v4) = 0;
  else
    v4 = (LOBYTE(self->_playerBehavior) >> 2) & 1;

  return v4;
}

- (BOOL)_shouldChangeVideoOnWake
{
  return self->_playerBehavior & 1;
}

- (void)setPausedViewEnabled:(BOOL)a3
{
  id v4;

  self->_pausedViewEnabled = a3;
  -[NTKVideoPlayerView videoPlayerView](self, "videoPlayerView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPausedViewEnabled:", self->_pausedViewEnabled);

}

- (void)_mediaServicesWereReset:(id)a3
{
  _QWORD block[5];

  kdebug_trace();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__NTKVideoPlayerView__mediaServicesWereReset___block_invoke;
  block[3] = &unk_1E6BCD5F0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __46__NTKVideoPlayerView__mediaServicesWereReset___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_resetVideoPlayer");
}

- (NTKVideoPlayerViewFaceDelegate)delegate
{
  return (NTKVideoPlayerViewFaceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NTKVideoPlayerDataSource)dataSource
{
  return self->_dataSource;
}

- (unint64_t)playerBehavior
{
  return self->_playerBehavior;
}

- (void)setPlayerBehavior:(unint64_t)a3
{
  self->_playerBehavior = a3;
}

- (double)fadeAnimationDuration
{
  return self->_fadeAnimationDuration;
}

- (void)setFadeAnimationDuration:(double)a3
{
  self->_fadeAnimationDuration = a3;
}

- (BOOL)shouldApplyVideoInsetToPosterImage
{
  return self->_shouldApplyVideoInsetToPosterImage;
}

- (BOOL)isPausedViewEnabled
{
  return self->_pausedViewEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_videoPlayerView, 0);
  objc_storeStrong((id *)&self->_posterImageView, 0);
  objc_storeStrong((id *)&self->_posterContainerView, 0);
  objc_storeStrong((id *)&self->_curtainView, 0);
  objc_storeStrong((id *)&self->_taskScheduler, 0);
}

@end
