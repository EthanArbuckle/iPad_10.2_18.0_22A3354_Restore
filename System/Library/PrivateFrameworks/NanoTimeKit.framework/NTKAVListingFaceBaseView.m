@implementation NTKAVListingFaceBaseView

- (NTKAVListingFaceBaseView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5
{
  NTKAVListingFaceBaseView *v5;
  NTKTaskScheduler *v6;
  NTKTaskScheduler *taskScheduler;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NTKAVListingFaceBaseView;
  v5 = -[NTKAVFaceBaseView initWithFaceStyle:forDevice:clientIdentifier:](&v10, sel_initWithFaceStyle_forDevice_clientIdentifier_, a3, a4, a5);
  if (v5)
  {
    if (CLKIsClockFaceApp())
    {
      v6 = objc_alloc_init(NTKTaskScheduler);
      taskScheduler = v5->_taskScheduler;
      v5->_taskScheduler = v6;

    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v5, sel__unpauseFromSwitcher, CFSTR("NTKFaceLibraryDismissedNotification"), 0);

  }
  return v5;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[NTKDelayedBlock cancel](self->_playNextVideoDelayBlock, "cancel");
  -[NTKTaskScheduler cancelAllTasks](self->_taskScheduler, "cancelAllTasks");
  -[NSTimer invalidate](self->_playOnWakeTimeout, "invalidate");
  v4.receiver = self;
  v4.super_class = (Class)NTKAVListingFaceBaseView;
  -[NTKAVFaceBaseView dealloc](&v4, sel_dealloc);
}

- (BOOL)_changeCurrentListing
{
  void *v3;
  NTKAVListing **p_currentListing;
  char v5;
  int v6;
  void *v7;
  BOOL v8;

  self->_preLoadedVideoOnSleep = 0;
  kdebug_trace();
  -[NTKAVListingFaceBaseView _nextListing](self, "_nextListing");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  p_currentListing = &self->_currentListing;
  v5 = objc_msgSend(v3, "isEqual:", self->_currentListing);
  v6 = 0;
  if ((v5 & 1) == 0)
  {
    v6 = objc_msgSend(v3, "snapshotDiffers:", *p_currentListing);
    objc_storeStrong((id *)&self->_currentListing, v3);
  }
  if (*p_currentListing)
  {
    -[NTKAVListing video](*p_currentListing, "video");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      if ((v5 & 1) != 0)
      {
        -[NTKAVListingFaceBaseView _resetVideoForListing](self, "_resetVideoForListing");
        if (!v6)
          goto LABEL_11;
      }
      else
      {
        -[NTKAVListingFaceBaseView _loadVideoForListing](self, "_loadVideoForListing");
        if (!v6)
        {
LABEL_11:
          v8 = 1;
          goto LABEL_12;
        }
      }
      -[NTKAVListingFaceBaseView _updateImageToBlur](self, "_updateImageToBlur");
      goto LABEL_11;
    }
  }
  v8 = 0;
LABEL_12:

  return v8;
}

- (void)_loadVideoForListing
{
  void *v3;
  id v4;

  -[NTKAVFaceBaseView videoPlayerView](self, "videoPlayerView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NTKAVListing video](self->_currentListing, "video");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "loadVideo:", v3);

}

- (void)_resetVideoForListing
{
  void *v2;
  __int128 v3;
  uint64_t v4;

  -[NTKAVFaceBaseView videoPlayerView](self, "videoPlayerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x1E0CA2E68];
  v4 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
  objc_msgSend(v2, "seekToTime:", &v3);

}

- (id)_nextListing
{
  return 0;
}

- (id)_onDeckPosterImageView
{
  return 0;
}

- (void)_performPreloadVideoTask
{
  void *v3;

  kdebug_trace();
  self->_shouldChangeVariantForScreenWake = 1;
  self->_preLoadingVideoOnSleep = 1;
  -[NTKAVListingFaceBaseView _changeCurrentListing](self, "_changeCurrentListing");
  -[NTKAVFaceBaseView videoPlayerView](self, "videoPlayerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preroll");

  self->_preLoadingVideoOnSleep = 0;
  self->_preLoadedVideoOnSleep = 1;
}

- (void)_queuePreloadVideoTask
{
  NTKTaskScheduler *taskScheduler;
  id v4;
  _QWORD v5[4];
  id v6;
  id location;

  self->_preLoadedVideoOnSleep = 0;
  objc_initWeak(&location, self);
  taskScheduler = self->_taskScheduler;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50__NTKAVListingFaceBaseView__queuePreloadVideoTask__block_invoke;
  v5[3] = &unk_1E6BCE0A8;
  objc_copyWeak(&v6, &location);
  v4 = -[NTKTaskScheduler scheduleTask:identifier:](taskScheduler, "scheduleTask:identifier:", v5, CFSTR("com.apple.ntk.NTKAVListingFaceBaseView"));
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

uint64_t __50__NTKAVListingFaceBaseView__queuePreloadVideoTask__block_invoke(uint64_t a1)
{
  _BYTE *WeakRetained;
  void *v2;
  uint64_t v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained && !WeakRetained[1113])
  {
    objc_msgSend(WeakRetained, "_performPreloadVideoTask");
    v3 = 1;
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)screenDidTurnOffAnimated:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NTKAVListingFaceBaseView;
  -[NTKFaceView screenDidTurnOffAnimated:](&v5, sel_screenDidTurnOffAnimated_, a3);
  -[NTKAVListingFaceBaseView setHandlingScreenWake:](self, "setHandlingScreenWake:", 0);
  if ((unint64_t)(-[NTKFaceView dataMode](self, "dataMode") - 1) <= 1
    && !-[NTKAVListingFaceBaseView isContentUnloadedForFaceSwiping](self, "isContentUnloadedForFaceSwiping"))
  {
    self->_shouldChangeVariantForScreenWake = 1;
    -[NTKAVFaceBaseView videoPlayerView](self, "videoPlayerView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pause");

    -[NTKAVListingFaceBaseView _showCurtainView](self, "_showCurtainView");
  }
}

- (void)screenWillTurnOnAnimated:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NTKAVListingFaceBaseView;
  -[NTKFaceView screenWillTurnOnAnimated:](&v4, sel_screenWillTurnOnAnimated_, a3);
  -[NTKAVListingFaceBaseView _handleScreenWake](self, "_handleScreenWake");
}

- (void)_handleScreenWake
{
  if (-[NTKAVListingFaceBaseView isContentUnloadedForFaceSwiping](self, "isContentUnloadedForFaceSwiping"))
  {
    if (!-[NTKAVListingFaceBaseView isHandlingScreenWake](self, "isHandlingScreenWake"))
    {
      -[NTKAVListingFaceBaseView setHandlingScreenWake:](self, "setHandlingScreenWake:", 1);
      kdebug_trace();
      -[NTKAVListingFaceBaseView setContentUnloadedForFaceSwiping:](self, "setContentUnloadedForFaceSwiping:", 0);
      -[NTKAVListingFaceBaseView _cancelAllTasks](self, "_cancelAllTasks");
      -[NTKAVListingFaceBaseView _playVideoForScreenWake:](self, "_playVideoForScreenWake:", 0);
      -[NTKAVListingFaceBaseView setHandlingScreenWake:](self, "setHandlingScreenWake:", 0);
    }
  }
}

- (void)_showCurtainView
{
  id v3;
  void *v4;
  UIView *v5;
  UIView *blackView;
  UIView *v7;
  void *v8;
  id v9;

  if (!self->_blackView)
  {
    v3 = objc_alloc(MEMORY[0x1E0DC3F10]);
    -[NTKAVFaceBaseView videoPlayerView](self, "videoPlayerView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bounds");
    v5 = (UIView *)objc_msgSend(v3, "initWithFrame:");
    blackView = self->_blackView;
    self->_blackView = v5;

    v7 = self->_blackView;
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v7, "setBackgroundColor:", v8);

  }
  -[NTKFaceView contentView](self, "contentView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSubview:", self->_blackView);

}

- (void)_hideCurtainView
{
  UIView *blackView;

  -[UIView removeFromSuperview](self->_blackView, "removeFromSuperview");
  blackView = self->_blackView;
  self->_blackView = 0;

}

- (void)_fadeToCurtainViewWithDuration:(double)a3 completion:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  void (**v9)(void *, uint64_t);
  _QWORD v10[5];
  _QWORD aBlock[4];
  id v12;

  v6 = a4;
  v7 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __70__NTKAVListingFaceBaseView__fadeToCurtainViewWithDuration_completion___block_invoke;
  aBlock[3] = &unk_1E6BCE0D0;
  v8 = v6;
  v12 = v8;
  v9 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
  -[NTKAVListingFaceBaseView _showCurtainView](self, "_showCurtainView");
  if (a3 >= 0.00000011920929)
  {
    -[UIView setAlpha:](self->_blackView, "setAlpha:", 0.0);
    v10[0] = v7;
    v10[1] = 3221225472;
    v10[2] = __70__NTKAVListingFaceBaseView__fadeToCurtainViewWithDuration_completion___block_invoke_2;
    v10[3] = &unk_1E6BCD5F0;
    v10[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:completion:", v10, v9, a3);
  }
  else
  {
    v9[2](v9, 1);
  }

}

uint64_t __70__NTKAVListingFaceBaseView__fadeToCurtainViewWithDuration_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __70__NTKAVListingFaceBaseView__fadeToCurtainViewWithDuration_completion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1144), "setAlpha:", 1.0);
}

- (void)_fadeFromCurtainViewWithDuration:(double)a3 completion:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v12[5];
  _QWORD aBlock[5];
  id v14;

  v6 = a4;
  v7 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __72__NTKAVListingFaceBaseView__fadeFromCurtainViewWithDuration_completion___block_invoke;
  aBlock[3] = &unk_1E6BCE0F8;
  aBlock[4] = self;
  v8 = v6;
  v14 = v8;
  v9 = _Block_copy(aBlock);
  v10 = v9;
  if (a3 < 0.00000011920929 || self->_blackView == 0)
  {
    (*((void (**)(void *, uint64_t))v9 + 2))(v9, 1);
  }
  else
  {
    v12[0] = v7;
    v12[1] = 3221225472;
    v12[2] = __72__NTKAVListingFaceBaseView__fadeFromCurtainViewWithDuration_completion___block_invoke_2;
    v12[3] = &unk_1E6BCD5F0;
    v12[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:completion:", v12, v9, a3);
  }

}

uint64_t __72__NTKAVListingFaceBaseView__fadeFromCurtainViewWithDuration_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_hideCurtainView");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __72__NTKAVListingFaceBaseView__fadeFromCurtainViewWithDuration_completion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1144), "setAlpha:", 0.0);
}

- (BOOL)_curtainViewVisible
{
  void *v2;
  BOOL v3;

  -[UIView superview](self->_blackView, "superview");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)_curtainView
{
  return self->_blackView;
}

- (void)_prepareForOrb
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTKAVListingFaceBaseView;
  -[NTKFaceView _prepareForOrb](&v3, sel__prepareForOrb);
  -[NTKAVListingFaceBaseView _updatePaused](self, "_updatePaused");
}

- (void)_cleanupAfterOrb:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NTKAVListingFaceBaseView;
  -[NTKFaceView _cleanupAfterOrb:](&v4, sel__cleanupAfterOrb_, a3);
  -[NTKAVListingFaceBaseView _updatePaused](self, "_updatePaused");
}

- (void)_loadSnapshotContentViews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTKAVListingFaceBaseView;
  -[NTKAVFaceBaseView _loadSnapshotContentViews](&v3, sel__loadSnapshotContentViews);
  -[NTKAVListingFaceBaseView _updateImageToBlur](self, "_updateImageToBlur");
}

- (void)setNormalComplicationDisplayWrapper:(id)a3 forSlot:(id)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NTKAVListingFaceBaseView;
  -[NTKFaceView setNormalComplicationDisplayWrapper:forSlot:](&v4, sel_setNormalComplicationDisplayWrapper_forSlot_, a3, a4);
}

- (void)_unloadSnapshotContentViews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTKAVListingFaceBaseView;
  -[NTKAVFaceBaseView _unloadSnapshotContentViews](&v3, sel__unloadSnapshotContentViews);
  -[NTKAVListingFaceBaseView _cancelDelayedPlayback](self, "_cancelDelayedPlayback");
  -[NTKAVListingFaceBaseView _cancelPauseLockout](self, "_cancelPauseLockout");
  self->_updateWhenUnpausing = 0;
}

- (void)_applyDataMode
{
  int64_t v3;
  int64_t v4;
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
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)NTKAVListingFaceBaseView;
  -[NTKFaceView _applyDataMode](&v16, sel__applyDataMode);
  v3 = -[NTKFaceView dataMode](self, "dataMode");
  if (v3 != self->_previousDataMode)
  {
    v4 = v3;
    switch(v3)
    {
      case 1:
        if (!-[NTKAVListingFaceBaseView isContentUnloadedForFaceSwiping](self, "isContentUnloadedForFaceSwiping"))
        {
          -[NTKAVFaceBaseView posterImageView](self, "posterImageView");
          v5 = (void *)objc_claimAutoreleasedReturnValue();

          if (v5)
            -[NTKAVListingFaceBaseView _showCurtainView](self, "_showCurtainView");
          -[NTKAVFaceBaseView posterImageView](self, "posterImageView");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "removeFromSuperview");

          -[NTKAVFaceBaseView setPosterImageView:](self, "setPosterImageView:", 0);
          -[NTKFaceView contentView](self, "contentView");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          -[NTKAVFaceBaseView videoPlayerView](self, "videoPlayerView");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addSubview:", v8);

          -[NTKAVFaceBaseView videoPlayerView](self, "videoPlayerView");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "superview");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[NTKAVFaceBaseView videoPlayerView](self, "videoPlayerView");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "sendSubviewToBack:", v11);

          if (self->_previousDataMode != 3)
            goto LABEL_15;
          self->_updateWhenUnpausing = 1;
        }
        goto LABEL_16;
      case 2:
        -[NTKAVListingFaceBaseView faultInFaceContentSkippedDuringSwiping](self, "faultInFaceContentSkippedDuringSwiping");
        -[NTKAVListingFaceBaseView _cancelAllTasks](self, "_cancelAllTasks");
        -[NTKAVListingFaceBaseView _queuePreloadVideoTask](self, "_queuePreloadVideoTask");
        goto LABEL_15;
      case 3:
        if (self->_isPauseLockedout)
          goto LABEL_16;
        -[NTKAVListingFaceBaseView _hideCurtainView](self, "_hideCurtainView");
LABEL_15:
        -[NTKAVListingFaceBaseView _updatePaused](self, "_updatePaused");
LABEL_16:
        self->_previousDataMode = v4;
        -[NTKAVListingFaceBaseView setNeedsLayout](self, "setNeedsLayout");
        break;
      case 4:
        -[NTKAVListingFaceBaseView setContentUnloadedForFaceSwiping:](self, "setContentUnloadedForFaceSwiping:", 1);
        if ((unint64_t)(self->_previousDataMode - 1) <= 2)
        {
          -[NTKAVListingFaceBaseView _cancelAllTasks](self, "_cancelAllTasks");
          -[NTKAVFaceBaseView videoPlayerView](self, "videoPlayerView");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "removeFromSuperview");

        }
        -[NTKAVListingFaceBaseView _onDeckPosterImageView](self, "_onDeckPosterImageView");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[NTKAVFaceBaseView posterImageView](self, "posterImageView");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "removeFromSuperview");

        -[NTKAVFaceBaseView setPosterImageView:](self, "setPosterImageView:", v13);
        -[NTKFaceView contentView](self, "contentView");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addSubview:", v13);

        -[NTKAVListingFaceBaseView _hideCurtainView](self, "_hideCurtainView");
        -[NTKAVListingFaceBaseView _updatePaused](self, "_updatePaused");
        -[NTKAVListingFaceBaseView _selectDefaultListing](self, "_selectDefaultListing");

        goto LABEL_16;
      case 5:
        -[NTKAVListingFaceBaseView setContentUnloadedForFaceSwiping:](self, "setContentUnloadedForFaceSwiping:", 1);
        goto LABEL_15;
      default:
        goto LABEL_16;
    }
  }
}

- (void)faultInFaceContentSkippedDuringSwiping
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (-[NTKAVListingFaceBaseView isContentUnloadedForFaceSwiping](self, "isContentUnloadedForFaceSwiping"))
  {
    -[NTKAVListingFaceBaseView setContentUnloadedForFaceSwiping:](self, "setContentUnloadedForFaceSwiping:", 0);
    -[NTKAVListingFaceBaseView _updatePaused](self, "_updatePaused");
    -[NTKFaceView contentView](self, "contentView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKAVFaceBaseView videoPlayerView](self, "videoPlayerView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addSubview:", v4);

    -[NTKAVFaceBaseView videoPlayerView](self, "videoPlayerView");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "superview");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKAVFaceBaseView videoPlayerView](self, "videoPlayerView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sendSubviewToBack:", v6);

  }
}

- (void)_applyFrozen
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTKAVListingFaceBaseView;
  -[NTKFaceView _applyFrozen](&v3, sel__applyFrozen);
  -[NTKAVListingFaceBaseView _updatePaused](self, "_updatePaused");
}

- (void)_applySlow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTKAVListingFaceBaseView;
  -[NTKFaceView _applySlow](&v3, sel__applySlow);
  -[NTKAVListingFaceBaseView _updatePaused](self, "_updatePaused");
}

- (void)_prepareForEditing
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTKAVListingFaceBaseView;
  -[NTKAVFaceBaseView _prepareForEditing](&v3, sel__prepareForEditing);
  -[NTKAVListingFaceBaseView _pauseImmediately](self, "_pauseImmediately");
  -[NTKAVListingFaceBaseView _hideCurtainView](self, "_hideCurtainView");
}

- (BOOL)_timeLabelUsesLegibility
{
  return 1;
}

- (void)_updatePaused
{
  _BOOL4 v3;

  v3 = -[NTKFaceView isFrozen](self, "isFrozen")
    || -[NTKFaceView orbing](self, "orbing")
    || -[NTKFaceView isSlow](self, "isSlow")
    || -[NTKFaceView dataMode](self, "dataMode") != 1
    || -[NTKAVListingFaceBaseView isContentUnloadedForFaceSwiping](self, "isContentUnloadedForFaceSwiping")
    || -[NTKFaceView timeScrubbing](self, "timeScrubbing");
  self->_shouldPause = v3;
  if (!self->_isPauseLockedout && self->_isPaused != v3)
  {
    self->_isPaused = v3;
    kdebug_trace();
    if (self->_isPaused)
      -[NTKAVListingFaceBaseView _pauseImmediately](self, "_pauseImmediately");
    -[NTKAVListingFaceBaseView setNeedsLayout](self, "setNeedsLayout");
    self->_updateWhenUnpausing = 0;
  }
}

- (void)_pauseImmediately
{
  -[NTKAVListingFaceBaseView _cancelPauseLockout](self, "_cancelPauseLockout");
  self->_isPaused = 1;
  -[NTKAVFaceBaseView pauseVideoPlayerViewIfItExists](self, "pauseVideoPlayerViewIfItExists");
  -[NTKAVListingFaceBaseView _cancelDelayedPlayback](self, "_cancelDelayedPlayback");
  self->_shouldPlayOnWake = 0;
}

- (void)_playVideo
{
  void *v3;
  char v4;

  if (!-[NTKAVListingFaceBaseView isContentUnloadedForFaceSwiping](self, "isContentUnloadedForFaceSwiping"))
  {
    if (self->_preLoadedVideoOnSleep)
    {
      -[NTKAVListingFaceBaseView _playQueuedUpVideo](self, "_playQueuedUpVideo");
      self->_preLoadedVideoOnSleep = 0;
    }
    else
    {
      -[NTKAVFaceBaseView videoPlayerView](self, "videoPlayerView");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v3, "playing");

      if ((v4 & 1) != 0)
      {
        -[NTKAVListingFaceBaseView _hideCurtainView](self, "_hideCurtainView");
      }
      else if (self->_currentListing
             && !-[NTKAVListingFaceBaseView shouldChangeVariantForScreenWake](self, "shouldChangeVariantForScreenWake"))
      {
        -[NTKAVListingFaceBaseView _playQueuedUpVideo](self, "_playQueuedUpVideo");
      }
      else
      {
        -[NTKAVListingFaceBaseView _playNextVideo](self, "_playNextVideo");
      }
    }
  }
}

- (void)_playVideoForScreenWake:(id)a3
{
  _QWORD block[5];

  if (!-[NTKAVListingFaceBaseView isContentUnloadedForFaceSwiping](self, "isContentUnloadedForFaceSwiping", a3))
  {
    -[NSTimer invalidate](self->_playOnWakeTimeout, "invalidate");
    if (self->_shouldPlayOnWake && !self->_preLoadingVideoOnSleep)
    {
      self->_shouldPlayOnWake = 0;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __52__NTKAVListingFaceBaseView__playVideoForScreenWake___block_invoke;
      block[3] = &unk_1E6BCD5F0;
      block[4] = self;
      dispatch_async(MEMORY[0x1E0C80D38], block);
    }
  }
}

uint64_t __52__NTKAVListingFaceBaseView__playVideoForScreenWake___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_playVideo");
}

- (void)_unpauseFromSwitcher
{
  if (self->_updateWhenUnpausing)
  {
    -[NTKAVListingFaceBaseView _updatePaused](self, "_updatePaused");
    -[NTKAVListingFaceBaseView _activatePauseLockout](self, "_activatePauseLockout");
    self->_updateWhenUnpausing = 0;
  }
}

- (id)_complicationFlickerWorkgroundAnimationWithDuration:(double)a3 applier:(id)a4
{
  (*((void (**)(id, SEL, double))a4 + 2))(a4, a2, 1.0);
  return 0;
}

- (void)_cancelAllTasks
{
  id v3;

  -[NTKTaskScheduler cancelAllTasks](self->_taskScheduler, "cancelAllTasks");
  -[NTKAVFaceBaseView videoPlayerView](self, "videoPlayerView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resetRequestState");

}

- (void)_startScrubbingAnimated:(BOOL)a3 withCompletion:(id)a4
{
  _BOOL8 v4;
  id v6;
  objc_super v7;

  v4 = a3;
  v6 = a4;
  -[NTKAVListingFaceBaseView _pauseImmediately](self, "_pauseImmediately");
  v7.receiver = self;
  v7.super_class = (Class)NTKAVListingFaceBaseView;
  -[NTKBackgroundImageFaceView _startScrubbingAnimated:withCompletion:](&v7, sel__startScrubbingAnimated_withCompletion_, v4, v6);

}

- (void)_endScrubbingAnimated:(BOOL)a3 withCompletion:(id)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  objc_super v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  v4 = a3;
  v6 = a4;
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __65__NTKAVListingFaceBaseView__endScrubbingAnimated_withCompletion___block_invoke;
  v9[3] = &unk_1E6BCE120;
  v7 = v6;
  v10 = v7;
  objc_copyWeak(&v11, &location);
  v8.receiver = self;
  v8.super_class = (Class)NTKAVListingFaceBaseView;
  -[NTKBackgroundImageFaceView _endScrubbingAnimated:withCompletion:](&v8, sel__endScrubbingAnimated_withCompletion_, v4, v9);
  objc_destroyWeak(&v11);

  objc_destroyWeak(&location);
}

void __65__NTKAVListingFaceBaseView__endScrubbingAnimated_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_updatePaused");

}

- (void)_transitionToPosterView:(id)a3
{
  id v4;
  void *v5;
  NTKAVListing *currentListing;
  objc_super v7;

  v4 = a3;
  -[NTKAVFaceBaseView posterImageView](self, "posterImageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    currentListing = self->_currentListing;
    self->_currentListing = 0;

  }
  v7.receiver = self;
  v7.super_class = (Class)NTKAVListingFaceBaseView;
  -[NTKAVFaceBaseView _transitionToPosterView:](&v7, sel__transitionToPosterView_, v4);

}

- (void)_playQueuedUpVideo
{
  id v3;

  if (!-[NTKAVListingFaceBaseView isContentUnloadedForFaceSwiping](self, "isContentUnloadedForFaceSwiping")
    && !self->_isPaused)
  {
    -[NTKAVFaceBaseView videoPlayerView](self, "videoPlayerView");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "play");

  }
}

- (void)_playNextVideo
{
  id v3;

  if (!-[NTKAVListingFaceBaseView isContentUnloadedForFaceSwiping](self, "isContentUnloadedForFaceSwiping")
    && -[NTKAVListingFaceBaseView _changeCurrentListing](self, "_changeCurrentListing")
    && !self->_isPaused)
  {
    -[NTKAVFaceBaseView videoPlayerView](self, "videoPlayerView");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "play");

  }
}

- (void)_playNextVideoAfterDelay:(double)a3
{
  NTKDelayedBlock *v5;
  NTKDelayedBlock *v6;
  NTKDelayedBlock *playNextVideoDelayBlock;
  _QWORD v8[4];
  id v9;
  id location;

  objc_initWeak(&location, self);
  v5 = [NTKDelayedBlock alloc];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __53__NTKAVListingFaceBaseView__playNextVideoAfterDelay___block_invoke;
  v8[3] = &unk_1E6BCE148;
  objc_copyWeak(&v9, &location);
  v6 = -[NTKDelayedBlock initWithDelay:action:](v5, "initWithDelay:action:", v8, a3);
  playNextVideoDelayBlock = self->_playNextVideoDelayBlock;
  self->_playNextVideoDelayBlock = v6;

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __53__NTKAVListingFaceBaseView__playNextVideoAfterDelay___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_playNextVideo");

}

- (void)_cancelDelayedPlayback
{
  NTKDelayedBlock *playNextVideoDelayBlock;

  -[NTKDelayedBlock cancel](self->_playNextVideoDelayBlock, "cancel");
  playNextVideoDelayBlock = self->_playNextVideoDelayBlock;
  self->_playNextVideoDelayBlock = 0;

}

- (void)_activatePauseLockout
{
  NTKDelayedBlock *v3;
  NTKDelayedBlock *v4;
  NTKDelayedBlock *pauseLockoutBlock;
  _QWORD v6[4];
  id v7;
  id location;

  if (!self->_isPaused)
  {
    self->_isPauseLockedout = 1;
    -[NTKDelayedBlock cancel](self->_pauseLockoutBlock, "cancel");
    objc_initWeak(&location, self);
    v3 = [NTKDelayedBlock alloc];
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __49__NTKAVListingFaceBaseView__activatePauseLockout__block_invoke;
    v6[3] = &unk_1E6BCE148;
    objc_copyWeak(&v7, &location);
    v4 = -[NTKDelayedBlock initWithDelay:action:](v3, "initWithDelay:action:", v6, 1.5);
    pauseLockoutBlock = self->_pauseLockoutBlock;
    self->_pauseLockoutBlock = v4;

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

void __49__NTKAVListingFaceBaseView__activatePauseLockout__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_cancelPauseLockout");
  objc_msgSend(WeakRetained, "_updatePaused");

}

- (void)_cancelPauseLockout
{
  NTKDelayedBlock *pauseLockoutBlock;

  self->_isPauseLockedout = 0;
  -[NTKDelayedBlock cancel](self->_pauseLockoutBlock, "cancel");
  pauseLockoutBlock = self->_pauseLockoutBlock;
  self->_pauseLockoutBlock = 0;

}

- (void)_reset
{
  NTKAVListing *currentListing;
  NTKDelayedBlock *v4;
  NTKDelayedBlock *v5;
  NTKDelayedBlock *playNextVideoDelayBlock;
  _QWORD v7[4];
  id v8;
  id location;
  objc_super v10;

  -[NTKAVListingFaceBaseView _cancelDelayedPlayback](self, "_cancelDelayedPlayback");
  self->_updateWhenUnpausing = 0;
  currentListing = self->_currentListing;
  self->_currentListing = 0;

  self->_preLoadedVideoOnSleep = 0;
  v10.receiver = self;
  v10.super_class = (Class)NTKAVListingFaceBaseView;
  -[NTKAVFaceBaseView _reset](&v10, sel__reset);
  if (-[NTKFaceView dataMode](self, "dataMode") == 1)
  {
    objc_initWeak(&location, self);
    v4 = [NTKDelayedBlock alloc];
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __34__NTKAVListingFaceBaseView__reset__block_invoke;
    v7[3] = &unk_1E6BCE148;
    objc_copyWeak(&v8, &location);
    v5 = -[NTKDelayedBlock initWithDelay:action:](v4, "initWithDelay:action:", v7, 3.0);
    playNextVideoDelayBlock = self->_playNextVideoDelayBlock;
    self->_playNextVideoDelayBlock = v5;

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __34__NTKAVListingFaceBaseView__reset__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_playNextVideo");

}

- (BOOL)paused
{
  return self->_isPaused;
}

- (BOOL)shouldPause
{
  return self->_shouldPause;
}

- (NTKAVListing)currentListing
{
  return self->_currentListing;
}

- (void)setCurrentListing:(id)a3
{
  objc_storeStrong((id *)&self->_currentListing, a3);
}

- (BOOL)shouldChangeVariantForScreenWake
{
  return self->_shouldChangeVariantForScreenWake;
}

- (void)setShouldChangeVariantForScreenWake:(BOOL)a3
{
  self->_shouldChangeVariantForScreenWake = a3;
}

- (BOOL)isContentUnloadedForFaceSwiping
{
  return self->_contentUnloadedForFaceSwiping;
}

- (void)setContentUnloadedForFaceSwiping:(BOOL)a3
{
  self->_contentUnloadedForFaceSwiping = a3;
}

- (BOOL)isHandlingScreenWake
{
  return self->_handlingScreenWake;
}

- (void)setHandlingScreenWake:(BOOL)a3
{
  self->_handlingScreenWake = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentListing, 0);
  objc_storeStrong((id *)&self->_blackView, 0);
  objc_storeStrong((id *)&self->_pauseLockoutBlock, 0);
  objc_storeStrong((id *)&self->_playNextVideoDelayBlock, 0);
  objc_storeStrong((id *)&self->_playOnWakeTimeout, 0);
  objc_storeStrong((id *)&self->_taskScheduler, 0);
}

@end
