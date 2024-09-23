@implementation PHLivePhotoView

- (PHLivePhotoView)initWithFrame:(CGRect)a3
{
  PHLivePhotoView *v3;
  PHLivePhotoView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PHLivePhotoView;
  v3 = -[PHLivePhotoView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[PHLivePhotoView _commonPHLivePhotoViewInitialization](v3, "_commonPHLivePhotoViewInitialization");
  return v4;
}

- (PHLivePhotoView)initWithCoder:(id)a3
{
  PHLivePhotoView *v3;
  PHLivePhotoView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PHLivePhotoView;
  v3 = -[PHLivePhotoView initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[PHLivePhotoView _commonPHLivePhotoViewInitialization](v3, "_commonPHLivePhotoViewInitialization");
  return v4;
}

- (void)_commonPHLivePhotoViewInitialization
{
  ISLivePhotoUIView *v3;
  ISLivePhotoUIView *playerView;
  ISLivePhotoUIView *v5;
  ISLivePhotoPlayer *v6;
  ISLivePhotoPlayer *player;

  self->_targetReadiness = 2;
  self->_shouldApplyTargetReadiness = 1;
  -[PHLivePhotoView setContentMode:](self, "setContentMode:", 2);
  v3 = (ISLivePhotoUIView *)objc_alloc_init(MEMORY[0x24BE72708]);
  playerView = self->_playerView;
  self->_playerView = v3;

  v5 = self->_playerView;
  -[PHLivePhotoView bounds](self, "bounds");
  -[ISLivePhotoUIView setFrame:](v5, "setFrame:");
  -[ISLivePhotoUIView setAutoresizingMask:](self->_playerView, "setAutoresizingMask:", 18);
  -[ISLivePhotoUIView setDelegate:](self->_playerView, "setDelegate:", self);
  -[PHLivePhotoView addSubview:](self, "addSubview:", self->_playerView);
  -[ISLivePhotoUIView player](self->_playerView, "player");
  v6 = (ISLivePhotoPlayer *)objc_claimAutoreleasedReturnValue();
  player = self->_player;
  self->_player = v6;

  -[ISLivePhotoPlayer registerChangeObserver:context:](self->_player, "registerChangeObserver:context:", self, ISPlayerChangeObserverContext);
  self->_contentsRect.origin.x = 0.0;
  self->_contentsRect.origin.y = 0.0;
  __asm { FMOV            V0.2D, #1.0 }
  self->_contentsRect.size = _Q0;
  -[PHLivePhotoView _updatePlayerAudioEnabled](self, "_updatePlayerAudioEnabled");
  -[PHLivePhotoView _updateCurrentPlaybackStyleAndSeeking](self, "_updateCurrentPlaybackStyleAndSeeking");
  -[PHLivePhotoView _updatePlayerViewDynamicRange](self, "_updatePlayerViewDynamicRange");
  -[PHLivePhotoView _addDebugOverlayViewIfNeeded](self, "_addDebugOverlayViewIfNeeded");
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PHLivePhotoView;
  -[PHLivePhotoView layoutSubviews](&v3, sel_layoutSubviews);
  -[PHLivePhotoView bounds](self, "bounds");
  -[PUPhotosAssetDebugOverlayView setFrame:](self->_debugOverlayView, "setFrame:");
}

- (void)setPreferredImageDynamicRange:(int64_t)a3
{
  NSObject *v5;
  uint8_t v6[16];

  if ((_os_feature_enabled_impl() & 1) != 0)
  {
    if (self->_preferredImageDynamicRange != a3)
    {
      self->_preferredImageDynamicRange = a3;
      -[PHLivePhotoView _updatePlayerViewDynamicRange](self, "_updatePlayerViewDynamicRange");
      -[PHLivePhotoView _updateDebugOverlayView](self, "_updateDebugOverlayView");
    }
  }
  else
  {
    PLLivePhotoPlaybackGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_20D1E2000, v5, OS_LOG_TYPE_DEBUG, "Attempting to set preferredImageDynamicRange without enabling the appropriate feature flag", v6, 2u);
    }

  }
}

- (void)setPlayer:(id)a3
{
  ISLivePhotoPlayer **p_player;
  void *v6;
  ISPlayerItem *v7;
  ISPlayerItem *playerItem;
  ISLivePhotoPlayer *v9;

  p_player = &self->_player;
  v9 = (ISLivePhotoPlayer *)a3;
  if (*p_player != v9)
  {
    -[PHLivePhotoView playerView](self, "playerView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ISLivePhotoPlayer unregisterChangeObserver:context:](*p_player, "unregisterChangeObserver:context:", self, ISPlayerChangeObserverContext);
    objc_storeStrong((id *)&self->_player, a3);
    -[ISLivePhotoPlayer registerChangeObserver:context:](*p_player, "registerChangeObserver:context:", self, ISPlayerChangeObserverContext);
    objc_msgSend(v6, "setPlayer:", *p_player);
    -[ISLivePhotoPlayer playerItem](v9, "playerItem");
    v7 = (ISPlayerItem *)objc_claimAutoreleasedReturnValue();
    playerItem = self->__playerItem;
    self->__playerItem = v7;

  }
}

- (void)setShowsStatusBorder:(BOOL)a3
{
  if (self->_showsStatusBorder != a3)
  {
    self->_showsStatusBorder = a3;
    -[PHLivePhotoView _updateStatusBorder](self, "_updateStatusBorder");
  }
}

- (UIGestureRecognizer)playbackGestureRecognizer
{
  void *v2;
  void *v3;

  -[PHLivePhotoView playerView](self, "playerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "playbackGestureRecognizer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIGestureRecognizer *)v3;
}

- (void)setDelegate:(id)delegate
{
  id WeakRetained;
  id v5;
  $0946180CE9F0B8FEAE5114FD53820F4C *p_delegatePrivateFlags;
  char v7;
  id obj;

  obj = delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    self->_delegateFlags.respondsToCanBeginPlayback = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToWillBeginPlaybackWithStyle = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToDidEndPlayback = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToExtraMinimumTouchDuration = objc_opt_respondsToSelector() & 1;
    v5 = obj;
    p_delegatePrivateFlags = &self->_delegatePrivateFlags;
    self->_delegatePrivateFlags.respondsToDidEndPlayingVitality = objc_opt_respondsToSelector() & 1;
    self->_delegatePrivateFlags.respondsToDidBeginHinting = objc_opt_respondsToSelector() & 1;
    self->_delegatePrivateFlags.respondsToDidBeginScrubbing = objc_opt_respondsToSelector() & 1;
    v7 = objc_opt_respondsToSelector();

    p_delegatePrivateFlags->respondsToDidEndScrubbing = v7 & 1;
  }

}

- (void)setPhotoView:(id)a3
{
  UIView *v5;
  UIView **p_photoView;
  void *v7;
  UIView *v8;

  v5 = (UIView *)a3;
  p_photoView = &self->_photoView;
  if (self->_photoView != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->_photoView, a3);
    -[PHLivePhotoView playerView](self, "playerView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCustomPhotoView:", *p_photoView);

    v5 = v8;
  }

}

- (void)setContentsRect:(CGRect)contentsRect
{
  double height;
  double width;
  double y;
  double x;
  CGRect *p_contentsRect;
  id v9;

  height = contentsRect.size.height;
  width = contentsRect.size.width;
  y = contentsRect.origin.y;
  x = contentsRect.origin.x;
  p_contentsRect = &self->_contentsRect;
  if (!CGRectEqualToRect(contentsRect, self->_contentsRect))
  {
    p_contentsRect->origin.x = x;
    p_contentsRect->origin.y = y;
    p_contentsRect->size.width = width;
    p_contentsRect->size.height = height;
    -[PHLivePhotoView playerView](self, "playerView");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setContentsRect:", x, y, width, height);

  }
}

- (void)setScaleAnchorOffset:(CGPoint)a3
{
  double y;
  double x;
  id v6;

  y = a3.y;
  x = a3.x;
  if (self->_scaleAnchorOffset.x != a3.x || self->_scaleAnchorOffset.y != a3.y)
  {
    self->_scaleAnchorOffset = a3;
    -[PHLivePhotoView playerView](self, "playerView");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setScaleAnchorOffset:", x, y);

  }
}

- (void)setLivePhoto:(PHLivePhoto *)livePhoto
{
  PHLivePhoto *v5;
  void *v6;
  void *v7;
  double Seconds;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  uint64_t v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  int v39;
  int v40;
  void *v41;
  double v42;
  CMTime time;
  uint8_t buf[4];
  double v45;
  __int16 v46;
  double v47;
  __int16 v48;
  uint64_t v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v5 = livePhoto;
  if (self->_livePhoto != v5)
  {
    objc_storeStrong((id *)&self->_livePhoto, livePhoto);
    if (v5)
    {
      -[PHLivePhoto image](v5, "image");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHLivePhoto videoAsset](v5, "videoAsset");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHLivePhoto photoTime](v5, "photoTime");
      Seconds = CMTimeGetSeconds(&time);
      objc_msgSend(v6, "imageOrientation");
      v9 = PLExifOrientationFromImageOrientation();
      -[PHLivePhoto targetSize](v5, "targetSize");
      v12 = v11;
      v13 = v10;
      if (v11 == *MEMORY[0x24BDBF148] && v10 == *(double *)(MEMORY[0x24BDBF148] + 8))
      {
        -[PHLivePhotoView window](self, "window");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "screen");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v16)
        {
          objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v16, "bounds");
        v18 = v17;
        v20 = v19;
        objc_msgSend(v16, "scale");
        v22 = v21 * v18;
        v23 = v21 * v20;
        if (v22 >= v23)
          v13 = v22;
        else
          v13 = v23;

        v12 = v13;
      }
      v24 = -[PHLivePhoto hasPhotoColorAdjustments](v5, "hasPhotoColorAdjustments");
      v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE72700]), "initWithVideoAsset:UIImage:photoTime:photoEXIFOrientation:options:", v7, v6, v9, v24, Seconds);
      -[PHLivePhoto size](v5, "size");
      v28 = 0;
      if (v26 != 0.0 && v27 != 0.0)
      {
        v30 = *MEMORY[0x24BE71BF0];
        v29 = *(double *)(MEMORY[0x24BE71BF0] + 8);
        if (v26 == *MEMORY[0x24BE71BF0] && v27 == v29)
        {
          v28 = 0;
        }
        else
        {
          v32 = (void *)MEMORY[0x24BDD16E0];
          -[PHLivePhoto size](v5, "size");
          v35 = v33;
          v36 = v34;
          if (v33 == 0.0 || v34 == 0.0 || v33 == v30 && v34 == v29)
          {
            v37 = 1.0;
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 134218496;
              v45 = v35;
              v46 = 2048;
              v47 = v36;
              v48 = 2048;
              v49 = 0x3FF0000000000000;
              _os_log_fault_impl(&dword_20D1E2000, MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT, "PFSizeGetAspectRatio produced an undefined aspect ratio from size {%lf, %lf}. Returning %f. Use PFSizeGetAspectRatioWithDefault() to provide a value for this case.", buf, 0x20u);
            }
          }
          else
          {
            v37 = fabs(v33 / v34);
          }
          objc_msgSend(v32, "numberWithDouble:", v37);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
        }
      }
      objc_msgSend(MEMORY[0x24BE72710], "playerItemWithAsset:targetSize:contentAspectRatio:", v25, v28, v12, v13);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHLivePhoto videoComposition](v5, "videoComposition");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setVideoComposition:", v38);
      -[PHLivePhoto audioVolume](v5, "audioVolume");
      v40 = v39;
      -[ISLivePhotoUIView player](self->_playerView, "player");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v42) = v40;
      objc_msgSend(v41, "setAudioVolume:", v42);

    }
    else
    {
      v31 = 0;
    }
    -[PHLivePhotoView _updateVideoFilter](self, "_updateVideoFilter");
    -[PHLivePhotoView _setPlayerItem:](self, "_setPlayerItem:", v31);

  }
}

- (void)setTargetReadiness:(int64_t)a3
{
  if (self->_targetReadiness != a3)
  {
    self->_targetReadiness = a3;
    -[PHLivePhotoView _updatePlayerTargetReadiness](self, "_updatePlayerTargetReadiness");
  }
}

- (void)_setPlaybackRequested:(BOOL)a3
{
  if (self->__playbackRequested != a3)
  {
    self->__playbackRequested = a3;
    -[PHLivePhotoView _updatePlayerTargetReadiness](self, "_updatePlayerTargetReadiness");
  }
}

- (void)setMuted:(BOOL)muted
{
  if (self->_muted != muted)
  {
    self->_muted = muted;
    -[PHLivePhotoView _updatePlayerAudioEnabled](self, "_updatePlayerAudioEnabled");
  }
}

- (void)setSeekTime:(id *)a3
{
  void *v4;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5;

  -[PHLivePhotoView player](self, "player");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *a3;
  objc_msgSend(v4, "setSeekTime:completion:", &v5, 0);

}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)seekTime
{
  void *v4;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  void *v6;

  -[PHLivePhotoView player](self, "player");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v6 = v4;
    objc_msgSend(v4, "seekTime");
    v4 = v6;
  }
  else
  {
    retstr->var0 = 0;
    *(_QWORD *)&retstr->var1 = 0;
    retstr->var3 = 0;
  }

  return result;
}

- (void)setTrimmedTimeRange:(id *)a3
{
  __int128 v3;
  __int128 v4;
  void *v5;
  __int128 v6;

  v4 = *(_OWORD *)&a3->var0.var3;
  v3 = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&self->_trimmedTimeRange.start.value = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&self->_trimmedTimeRange.start.epoch = v4;
  *(_OWORD *)&self->_trimmedTimeRange.duration.timescale = v3;
  -[PHLivePhotoView player](self, "player", a3->var0.var0, *(_QWORD *)&a3->var0.var1, a3->var0.var3, a3->var1.var0, *(_QWORD *)&a3->var1.var1, a3->var1.var3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTrimTimeRange:", &v6);

}

- (void)startPlaybackWithStyle:(PHLivePhotoViewPlaybackStyle)playbackStyle
{
  _BOOL4 v4;
  void *v5;
  uint64_t v6;
  id v7;

  v4 = playbackStyle == PHLivePhotoViewPlaybackStyleHint;
  -[PHLivePhotoView player](self, "player");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  if (playbackStyle == PHLivePhotoViewPlaybackStyleFull)
    v6 = 1;
  else
    v6 = 2 * v4;
  objc_msgSend(v5, "startPlaybackWithStyleWhenReady:settleAutomatically:", v6, 1);

}

- (void)stopPlayback
{
  id v2;

  -[PHLivePhotoView player](self, "player");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stopPlayback");

}

- (void)setContentMode:(PHLivePhotoViewContentMode)contentMode
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PHLivePhotoView;
  -[PHLivePhotoView setContentMode:](&v6, sel_setContentMode_);
  -[PHLivePhotoView playerView](self, "playerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setContentMode:", contentMode);

}

- (void)setOverridePhoto:(CGImage *)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BEBD640], "imageWithCGImage:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PHLivePhotoView playerView](self, "playerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOverrideImage:", v5);

}

- (CGImage)overridePhoto
{
  void *v2;
  id v3;
  CGImage *v4;

  -[PHLivePhotoView playerView](self, "playerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "overrideImage");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = (CGImage *)objc_msgSend(v3, "CGImage");

  return v4;
}

- (id)generateSnapshotImage
{
  void *v2;
  void *v3;

  -[PHLivePhotoView playerView](self, "playerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "generateSnapshotImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isDisplayingPhoto
{
  void *v2;
  char v3;

  -[PHLivePhotoView playerView](self, "playerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isDisplayingPhoto");

  return v3;
}

- (void)_setScrubbing:(BOOL)a3
{
  id v4;

  if (self->_scrubbing != a3)
  {
    self->_scrubbing = a3;
    if (a3)
    {
      if (!self->_delegatePrivateFlags.respondsToDidBeginScrubbing)
        return;
      -[PHLivePhotoView delegate](self, "delegate");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "livePhotoViewDidBeginScrubbing:", self);
    }
    else
    {
      if (!self->_delegatePrivateFlags.respondsToDidEndScrubbing)
        return;
      -[PHLivePhotoView delegate](self, "delegate");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "livePhotoViewDidEndScrubbing:", self);
    }

  }
}

- (void)_setPlayerItem:(id)a3
{
  ISPlayerItem *v5;
  ISPlayerItem *playerItem;
  void *v7;
  ISPlayerItem *v8;

  v5 = (ISPlayerItem *)a3;
  playerItem = self->__playerItem;
  v8 = v5;
  if (playerItem != v5)
  {
    -[ISPlayerItem unregisterChangeObserver:context:](playerItem, "unregisterChangeObserver:context:", self, ISPlayerItemChangeObserverContext);
    objc_storeStrong((id *)&self->__playerItem, a3);
    -[ISPlayerItem registerChangeObserver:context:](self->__playerItem, "registerChangeObserver:context:", self, ISPlayerItemChangeObserverContext);
    -[PHLivePhotoView _updateStatusBorder](self, "_updateStatusBorder");
    -[PHLivePhotoView player](self, "player");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPlayerItem:", v8);

    -[PHLivePhotoView _updatePlayerAudioEnabled](self, "_updatePlayerAudioEnabled");
  }

}

- (void)_updatePlayerAudioEnabled
{
  _BOOL4 v3;
  id v4;

  v3 = -[PHLivePhotoView isMuted](self, "isMuted");
  -[PHLivePhotoView player](self, "player");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAudioEnabled:", !v3);

}

- (void)_updatePlayingVitality
{
  id v3;

  -[PHLivePhotoView player](self, "player");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PHLivePhotoView _setPlayingVitality:](self, "_setPlayingVitality:", objc_msgSend(v3, "isPlayingVitality"));

}

- (void)_setPlayingVitality:(BOOL)a3
{
  id v4;

  if (self->__playingVitality != a3)
  {
    self->__playingVitality = a3;
    if (!a3 && self->_delegatePrivateFlags.respondsToDidEndPlayingVitality)
    {
      -[PHLivePhotoView delegate](self, "delegate");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "livePhotoViewDidEndPlayingVitality:", self);

    }
  }
}

- (void)_updateStatusBorder
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  if (-[PHLivePhotoView showsStatusBorder](self, "showsStatusBorder"))
  {
    -[PHLivePhotoView _playerItem](self, "_playerItem");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "status") == 3)
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "greenColor");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "videoComposition");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (v4)
      {
        objc_msgSend(MEMORY[0x24BEBD4B8], "purpleColor");
        v5 = objc_claimAutoreleasedReturnValue();

        v3 = (void *)v5;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "redColor");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[PHLivePhotoView layer](self, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_retainAutorelease(v3);
    objc_msgSend(v7, "setBorderColor:", objc_msgSend(v8, "CGColor"));

    -[PHLivePhotoView layer](self, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setBorderWidth:", 2.0);

  }
  else
  {
    -[PHLivePhotoView layer](self, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBorderWidth:", 0.0);

    -[PHLivePhotoView layer](self, "layer");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setBorderColor:", 0);
  }

}

- (void)_updateCurrentPlaybackStyleAndSeeking
{
  void *v3;
  uint64_t v4;
  int64_t v5;

  -[PHLivePhotoView player](self, "player");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "currentPlaybackStyle");

  v5 = 2 * (v4 == 2);
  if (v4 == 1)
    v5 = 1;
  self->_currentPlaybackStyle = v5;
  -[PHLivePhotoView _setScrubbing:](self, "_setScrubbing:", v4 == 3);
}

- (void)_playerDidBeginHinting
{
  id v3;

  if (self->_delegatePrivateFlags.respondsToDidBeginHinting)
  {
    -[PHLivePhotoView delegate](self, "delegate");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "livePhotoViewDidBeginHinting:", self);

  }
}

- (void)_updatePlayerTargetReadiness
{
  uint64_t v2;
  int64_t targetReadiness;
  id v4;

  if (self->_shouldApplyTargetReadiness)
  {
    if (self->__playbackRequested)
    {
      v2 = 2;
    }
    else
    {
      targetReadiness = self->_targetReadiness;
      if (targetReadiness == 2)
        v2 = 2;
      else
        v2 = targetReadiness == 1;
    }
    -[PHLivePhotoView player](self, "player");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTargetReadiness:", v2);

  }
}

- (void)setOverrideSRLCompensationAmount:(id)a3
{
  NSNumber *v5;
  NSNumber *v6;
  char v7;
  NSNumber *v8;

  v5 = (NSNumber *)a3;
  v6 = v5;
  if (self->_overrideSRLCompensationAmount != v5)
  {
    v8 = v5;
    v7 = -[NSNumber isEqual:](v5, "isEqual:");
    v6 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_overrideSRLCompensationAmount, a3);
      -[PHLivePhotoView _updateVideoFilter](self, "_updateVideoFilter");
      v6 = v8;
    }
  }

}

- (void)_updateVideoFilter
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10[2];
  id location;

  -[PHLivePhotoView setVideoFilterUpdateCounter:](self, "setVideoFilterUpdateCounter:", -[PHLivePhotoView videoFilterUpdateCounter](self, "videoFilterUpdateCounter") + 1);
  v3 = -[PHLivePhotoView videoFilterUpdateCounter](self, "videoFilterUpdateCounter");
  -[PHLivePhotoView overrideSRLCompensationAmount](self, "overrideSRLCompensationAmount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[PHLivePhotoView _applySRLCompensationAmount:updateCount:](self, "_applySRLCompensationAmount:updateCount:", v4, v3);
  }
  else
  {
    objc_initWeak(&location, self);
    -[PHLivePhotoView livePhoto](self, "livePhoto");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_get_global_queue(25, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __37__PHLivePhotoView__updateVideoFilter__block_invoke;
    v8[3] = &unk_24C62BEC8;
    v9 = v5;
    v7 = v5;
    objc_copyWeak(v10, &location);
    v10[1] = v3;
    dispatch_async(v6, v8);

    objc_destroyWeak(v10);
    objc_destroyWeak(&location);
  }

}

- (void)_applySRLCompensationAmount:(id)a3 updateCount:(int64_t)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (-[PHLivePhotoView videoFilterUpdateCounter](self, "videoFilterUpdateCounter") == a4)
  {
    if (v8)
    {
      objc_msgSend(MEMORY[0x24BDE56B0], "filterWithType:", CFSTR("srl"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setValue:forKey:", v8, CFSTR("inputAmount"));
    }
    else
    {
      v6 = 0;
    }
    -[PHLivePhotoView playerView](self, "playerView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setVideoFilter:", v6);

  }
}

- (void)_updatePlayerViewDynamicRange
{
  int64_t v3;
  id v4;

  v3 = -[PHLivePhotoView preferredImageDynamicRange](self, "preferredImageDynamicRange");
  -[PHLivePhotoView playerView](self, "playerView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPreferredImageDynamicRange:", v3);

}

- (void)_updateDebugOverlayView
{
  unint64_t v3;
  unint64_t v4;

  v3 = -[PHLivePhotoView preferredImageDynamicRange](self, "preferredImageDynamicRange");
  if (v3 < 3)
    v4 = v3 + 1;
  else
    v4 = 0;
  -[PUPhotosAssetDebugOverlayView setPreferredImageDynamicRange:](self->_debugOverlayView, "setPreferredImageDynamicRange:", v4);
}

- (void)_addDebugOverlayViewIfNeeded
{
  PUPhotosAssetDebugOverlayView *v3;
  objc_class *v4;
  void *v5;
  PUPhotosAssetDebugOverlayView *v6;
  PUPhotosAssetDebugOverlayView *debugOverlayView;
  _QWORD v8[5];

  if (PUPhotosAssetViewShowDebugOverlayView())
  {
    if (!self->_debugOverlayView)
    {
      v3 = [PUPhotosAssetDebugOverlayView alloc];
      v4 = (objc_class *)objc_opt_class();
      NSStringFromClass(v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v8[0] = MEMORY[0x24BDAC760];
      v8[1] = 3221225472;
      v8[2] = __47__PHLivePhotoView__addDebugOverlayViewIfNeeded__block_invoke;
      v8[3] = &unk_24C62BEF0;
      v8[4] = self;
      v6 = -[PUPhotosAssetDebugOverlayView initWithClientIdentifier:configuration:](v3, "initWithClientIdentifier:configuration:", v5, v8);
      debugOverlayView = self->_debugOverlayView;
      self->_debugOverlayView = v6;

      -[PUPhotosAssetDebugOverlayView setDelegate:](self->_debugOverlayView, "setDelegate:", self);
      -[PHLivePhotoView addSubview:](self, "addSubview:", self->_debugOverlayView);
    }
  }
}

- (void)_handlePlayerItemStatusChanged
{
  if (-[PHLivePhotoView showsStatusBorder](self, "showsStatusBorder"))
    -[PHLivePhotoView _updateStatusBorder](self, "_updateStatusBorder");
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v8;

  v6 = a4;
  v8 = a3;
  if ((void *)ISPlayerChangeObserverContext == a5)
  {
    if ((v6 & 0x10) != 0)
      PLDispatchOnMainQueue();
    if ((v6 & 0x20) != 0 && objc_msgSend(v8, "isHinting"))
      PLDispatchOnMainQueue();
    if ((v6 & 8) != 0)
    {
      PLDispatchOnMainQueue();
      -[PHLivePhotoView _updateCurrentPlaybackStyleAndSeeking](self, "_updateCurrentPlaybackStyleAndSeeking");
    }
  }
  else if ((v6 & 1) != 0 && (void *)ISPlayerItemChangeObserverContext == a5)
  {
    PLDispatchOnMainQueue();
  }

}

- (BOOL)livePhotoViewCanBeginInteractivePlayback:(id)a3
{
  PHLivePhotoView *v3;
  void *v4;

  if (!self->_delegateFlags.respondsToCanBeginPlayback)
    return 1;
  v3 = self;
  -[PHLivePhotoView delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v4, "livePhotoView:canBeginPlaybackWithStyle:", v3, 1);

  return (char)v3;
}

- (double)livePhotoViewExtraMinimumTouchDuration:(id)a3 touch:(id)a4
{
  id v5;
  void *v6;
  double v7;
  double v8;

  if (!self->_delegateFlags.respondsToExtraMinimumTouchDuration)
    return 0.0;
  v5 = a4;
  -[PHLivePhotoView delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "livePhotoView:extraMinimumTouchDurationForTouch:withStyle:", self, v5, 1);
  v8 = v7;

  return v8;
}

- (id)photosAssetDebugOverlayViewCurrentlyDisplayedImage:(id)a3
{
  return (id)-[PHLivePhoto image](self->_livePhoto, "image", a3);
}

- (void)photosAssetDebugOverlayView:(id)a3 didRequestPreferredImageDynamicRange:(int64_t)a4
{
  int64_t v4;

  if ((unint64_t)(a4 - 1) >= 3)
    v4 = -1;
  else
    v4 = a4 - 1;
  -[PHLivePhotoView setPreferredImageDynamicRange:](self, "setPreferredImageDynamicRange:", v4);
}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (PHLivePhoto)livePhoto
{
  return self->_livePhoto;
}

- (CGRect)contentsRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_contentsRect.origin.x;
  y = self->_contentsRect.origin.y;
  width = self->_contentsRect.size.width;
  height = self->_contentsRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (BOOL)isMuted
{
  return self->_muted;
}

- (ISPlayerItem)_playerItem
{
  return self->__playerItem;
}

- (BOOL)_playingVitality
{
  return self->__playingVitality;
}

- (BOOL)_playbackRequested
{
  return self->__playbackRequested;
}

- (BOOL)scrubbing
{
  return self->_scrubbing;
}

- (int64_t)videoFilterUpdateCounter
{
  return self->_videoFilterUpdateCounter;
}

- (void)setVideoFilterUpdateCounter:(int64_t)a3
{
  self->_videoFilterUpdateCounter = a3;
}

- (PUPhotosAssetDebugOverlayView)debugOverlayView
{
  return self->_debugOverlayView;
}

- (int64_t)targetReadiness
{
  return self->_targetReadiness;
}

- (BOOL)shouldApplyTargetReadiness
{
  return self->_shouldApplyTargetReadiness;
}

- (void)setShouldApplyTargetReadiness:(BOOL)a3
{
  self->_shouldApplyTargetReadiness = a3;
}

- (UIView)photoView
{
  return self->_photoView;
}

- (CGPoint)scaleAnchorOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_scaleAnchorOffset.x;
  y = self->_scaleAnchorOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (ISLivePhotoUIView)playerView
{
  return self->_playerView;
}

- (void)setPlayerView:(id)a3
{
  objc_storeStrong((id *)&self->_playerView, a3);
}

- (ISLivePhotoPlayer)player
{
  return self->_player;
}

- (BOOL)showsStatusBorder
{
  return self->_showsStatusBorder;
}

- ($97BACB40282BF2823C2E803DDEC6F6A6)trimmedTimeRange
{
  __int128 v3;

  v3 = *(_OWORD *)&self[12].var0.var3;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[12].var0.var0;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[12].var1.var1;
  return self;
}

- (NSNumber)overrideSRLCompensationAmount
{
  return self->_overrideSRLCompensationAmount;
}

- (int64_t)preferredImageDynamicRange
{
  return self->_preferredImageDynamicRange;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideSRLCompensationAmount, 0);
  objc_storeStrong((id *)&self->_player, 0);
  objc_storeStrong((id *)&self->_playerView, 0);
  objc_storeStrong((id *)&self->_photoView, 0);
  objc_storeStrong((id *)&self->_debugOverlayView, 0);
  objc_storeStrong((id *)&self->__playerItem, 0);
  objc_storeStrong((id *)&self->_livePhoto, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

uint64_t __48__PHLivePhotoView_observable_didChange_context___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updatePlayingVitality");
}

uint64_t __48__PHLivePhotoView_observable_didChange_context___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_playerDidBeginHinting");
}

void __48__PHLivePhotoView_observable_didChange_context___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  _BYTE *v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "player");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v6, "currentPlaybackStyle");
  v3 = *(_BYTE **)(a1 + 32);
  if (v2)
  {
    if (v3[417])
    {
      if (v2 == 1)
        v4 = 1;
      else
        v4 = 2 * (v2 == 2);
      objc_msgSend(v3, "delegate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "livePhotoView:willBeginPlaybackWithStyle:", *(_QWORD *)(a1 + 32), v4);
      goto LABEL_9;
    }
  }
  else if (v3[418])
  {
    objc_msgSend(v3, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "livePhotoView:didEndPlaybackWithStyle:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 424));
LABEL_9:

  }
}

uint64_t __48__PHLivePhotoView_observable_didChange_context___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handlePlayerItemStatusChanged");
}

void __47__PHLivePhotoView__addDebugOverlayViewIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  unint64_t v3;
  unint64_t v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v5 = a2;
  v3 = objc_msgSend(v2, "preferredImageDynamicRange");
  if (v3 < 3)
    v4 = v3 + 1;
  else
    v4 = 0;
  objc_msgSend(v5, "setPreferredImageDynamicRange:", v4);

}

void __37__PHLivePhotoView__updateVideoFilter__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7[2];

  objc_msgSend(*(id *)(a1 + 32), "srlCompensationValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__PHLivePhotoView__updateVideoFilter__block_invoke_2;
  block[3] = &unk_24C62BEC8;
  objc_copyWeak(v7, (id *)(a1 + 40));
  v3 = *(void **)(a1 + 48);
  v6 = v2;
  v7[1] = v3;
  v4 = v2;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(v7);
}

void __37__PHLivePhotoView__updateVideoFilter__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_applySRLCompensationAmount:updateCount:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));

}

+ (UIImage)livePhotoBadgeImageWithOptions:(PHLivePhotoBadgeOptions)badgeOptions
{
  const __CFString *v3;
  const __CFString *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = CFSTR("PhotoIrisShadowBadge-OFF");
  if ((badgeOptions & 2) != 0)
  {
    v4 = CFSTR("PhotoIrisBadge-OFF");
  }
  else
  {
    v3 = CFSTR("PhotoIrisShadowBadge-ON");
    v4 = CFSTR("PhotoIrisBadge-ON");
  }
  if ((badgeOptions & 1) != 0)
    v5 = v3;
  else
    v5 = v4;
  v6 = (void *)MEMORY[0x24BEBD640];
  PLPhotoLibraryFrameworkBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "imageNamed:inBundle:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v8;
}

@end
