@implementation MPMoviePlayerController

- (MPMoviePlayerController)init
{
  return -[MPMoviePlayerController initWithContentURL:](self, "initWithContentURL:", 0);
}

- (MPMoviePlayerController)initWithContentURL:(NSURL *)url
{
  NSURL *v4;
  MPMoviePlayerController *v5;
  void *v6;
  objc_class *v7;
  AVPlayerViewController *v8;
  AVPlayerViewController *playerViewController;
  void *v10;
  objc_super v12;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v4 = url;
  v12.receiver = self;
  v12.super_class = (Class)MPMoviePlayerController;
  v5 = -[MPMoviePlayerController init](&v12, sel_init);
  if (v5)
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x2050000000;
    v6 = (void *)getAVPlayerViewControllerClass_softClass;
    v17 = getAVPlayerViewControllerClass_softClass;
    if (!getAVPlayerViewControllerClass_softClass)
    {
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __getAVPlayerViewControllerClass_block_invoke;
      v13[3] = &unk_1E31639A0;
      v13[4] = &v14;
      __getAVPlayerViewControllerClass_block_invoke((uint64_t)v13);
      v6 = (void *)v15[3];
    }
    v7 = objc_retainAutorelease(v6);
    _Block_object_dispose(&v14, 8);
    v8 = (AVPlayerViewController *)objc_alloc_init(v7);
    playerViewController = v5->_playerViewController;
    v5->_playerViewController = v8;

    -[AVPlayerViewController setDelegate:](v5->_playerViewController, "setDelegate:", v5);
    -[AVPlayerViewController setAllowsPictureInPicturePlayback:](v5->_playerViewController, "setAllowsPictureInPicturePlayback:", 0);
    -[AVPlayerViewController setUpdatesNowPlayingInfoCenter:](v5->_playerViewController, "setUpdatesNowPlayingInfoCenter:", 0);
    -[AVPlayerViewController addObserver:forKeyPath:options:context:](v5->_playerViewController, "addObserver:forKeyPath:options:context:", v5, CFSTR("videoGravity"), 1, _MPMoviePlayerControllerObservationContext);
    -[AVPlayerViewController addObserver:forKeyPath:options:context:](v5->_playerViewController, "addObserver:forKeyPath:options:context:", v5, CFSTR("playerController.status"), 1, _MPMoviePlayerControllerObservationContext);
    -[AVPlayerViewController addObserver:forKeyPath:options:context:](v5->_playerViewController, "addObserver:forKeyPath:options:context:", v5, CFSTR("isReadyForDisplay"), 1, _MPMoviePlayerControllerObservationContext);
    -[AVPlayerViewController addObserver:forKeyPath:options:context:](v5->_playerViewController, "addObserver:forKeyPath:options:context:", v5, CFSTR("player.currentItem"), 1, _MPMoviePlayerControllerObservationContext);
    -[AVPlayerViewController addObserver:forKeyPath:options:context:](v5->_playerViewController, "addObserver:forKeyPath:options:context:", v5, CFSTR("player.isExternalPlaybackActive"), 1, _MPMoviePlayerControllerObservationContext);
    -[AVPlayerViewController addObserver:forKeyPath:options:context:](v5->_playerViewController, "addObserver:forKeyPath:options:context:", v5, CFSTR("playerController.isPlaying"), 1, _MPMoviePlayerControllerObservationContext);
    -[AVPlayerViewController addObserver:forKeyPath:options:context:](v5->_playerViewController, "addObserver:forKeyPath:options:context:", v5, CFSTR("playerController.contentDuration"), 1, _MPMoviePlayerControllerObservationContext);
    -[AVPlayerViewController addObserver:forKeyPath:options:context:](v5->_playerViewController, "addObserver:forKeyPath:options:context:", v5, CFSTR("playerController.contentDimensions"), 1, _MPMoviePlayerControllerObservationContext);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", v5, sel__avPlayerItemDidPlayToEndNotification_, *MEMORY[0x1E0C8AC48], 0);

    -[MPMoviePlayerController setContentURL:](v5, "setContentURL:", v4);
    -[MPMoviePlayerController setControlStyle:](v5, "setControlStyle:", 1);
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

  -[AVPlayerViewController removeObserver:forKeyPath:context:](self->_playerViewController, "removeObserver:forKeyPath:context:", self, CFSTR("videoGravity"), _MPMoviePlayerControllerObservationContext);
  -[AVPlayerViewController removeObserver:forKeyPath:context:](self->_playerViewController, "removeObserver:forKeyPath:context:", self, CFSTR("playerController.status"), _MPMoviePlayerControllerObservationContext);
  -[AVPlayerViewController removeObserver:forKeyPath:context:](self->_playerViewController, "removeObserver:forKeyPath:context:", self, CFSTR("isReadyForDisplay"), _MPMoviePlayerControllerObservationContext);
  -[AVPlayerViewController removeObserver:forKeyPath:context:](self->_playerViewController, "removeObserver:forKeyPath:context:", self, CFSTR("player.currentItem"), _MPMoviePlayerControllerObservationContext);
  -[AVPlayerViewController removeObserver:forKeyPath:context:](self->_playerViewController, "removeObserver:forKeyPath:context:", self, CFSTR("player.isExternalPlaybackActive"), _MPMoviePlayerControllerObservationContext);
  -[AVPlayerViewController removeObserver:forKeyPath:context:](self->_playerViewController, "removeObserver:forKeyPath:context:", self, CFSTR("playerController.isPlaying"), _MPMoviePlayerControllerObservationContext);
  -[AVPlayerViewController removeObserver:forKeyPath:context:](self->_playerViewController, "removeObserver:forKeyPath:context:", self, CFSTR("playerController.contentDuration"), _MPMoviePlayerControllerObservationContext);
  -[AVPlayerViewController removeObserver:forKeyPath:context:](self->_playerViewController, "removeObserver:forKeyPath:context:", self, CFSTR("playerController.contentDimensions"), _MPMoviePlayerControllerObservationContext);
  v4.receiver = self;
  v4.super_class = (Class)MPMoviePlayerController;
  -[MPMoviePlayerController dealloc](&v4, sel_dealloc);
}

- (void)setContentURL:(NSURL *)contentURL
{
  NSURL *v4;
  NSURL *v5;
  char v6;
  NSURL *v7;
  NSURL *v8;
  NSURL *v9;

  v4 = contentURL;
  v5 = self->_contentURL;
  if (v5 != v4)
  {
    v9 = v4;
    v6 = -[NSURL isEqual:](v5, "isEqual:", v4);
    v4 = v9;
    if ((v6 & 1) == 0)
    {
      v7 = (NSURL *)-[NSURL copy](v9, "copy");
      v8 = self->_contentURL;
      self->_contentURL = v7;

      v4 = v9;
    }
  }

}

- (UIView)view
{
  _MPMoviePlayerProxyView *proxyView;
  _MPMoviePlayerProxyView *v4;
  _MPMoviePlayerProxyView *v5;

  proxyView = self->_proxyView;
  if (!proxyView)
  {
    v4 = -[_MPMoviePlayerProxyView initWithMoviePlayerController:]([_MPMoviePlayerProxyView alloc], "initWithMoviePlayerController:", self);
    v5 = self->_proxyView;
    self->_proxyView = v4;

    proxyView = self->_proxyView;
  }
  return (UIView *)proxyView;
}

- (UIView)backgroundView
{
  UIView *backgroundView;
  UIView *v4;
  UIView *v5;

  backgroundView = self->_backgroundView;
  if (!backgroundView)
  {
    v4 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    v5 = self->_backgroundView;
    self->_backgroundView = v4;

    backgroundView = self->_backgroundView;
  }
  return backgroundView;
}

- (MPMoviePlaybackState)playbackState
{
  void *v3;
  void *v4;
  void *v5;
  int v6;

  -[AVPlayerViewController player](self->_playerViewController, "player");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    return 0;
  -[AVPlayerViewController playerController](self->_playerViewController, "playerController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isPlaying");

  if (v6)
    return 1;
  else
    return 2;
}

- (MPMovieLoadState)loadState
{
  void *v2;
  uint64_t v3;

  -[AVPlayerViewController playerController](self->_playerViewController, "playerController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "status");

  if (v3 == 2)
    return 1;
  else
    return 4 * (v3 == 1);
}

- (void)setControlStyle:(MPMovieControlStyle)controlStyle
{
  _BOOL8 v4;

  if (self->_controlStyle != controlStyle)
  {
    self->_controlStyle = controlStyle;
    if ((unint64_t)controlStyle <= MPMovieControlStyleFullscreen)
    {
      v4 = controlStyle == MPMovieControlStyleFullscreen;
      -[AVPlayerViewController setShowsPlaybackControls:](self->_playerViewController, "setShowsPlaybackControls:", (6u >> (controlStyle & 7)) & 1);
      -[AVPlayerViewController setAllowsEnteringFullScreen:](self->_playerViewController, "setAllowsEnteringFullScreen:", v4);
    }
  }
}

- (void)setRepeatMode:(MPMovieRepeatMode)repeatMode
{
  _BOOL8 v3;
  id v4;

  if (self->_repeatMode != repeatMode)
  {
    self->_repeatMode = repeatMode;
    v3 = repeatMode == MPMovieRepeatModeOne;
    -[AVPlayerViewController playerController](self->_playerViewController, "playerController");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setLooping:", v3);

  }
}

- (void)setShouldAutoplay:(BOOL)shouldAutoplay
{
  _BOOL8 v3;
  id v4;

  if (self->_shouldAutoplay != shouldAutoplay)
  {
    v3 = shouldAutoplay;
    self->_shouldAutoplay = shouldAutoplay;
    -[AVPlayerViewController player](self->_playerViewController, "player");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAutomaticallyWaitsToMinimizeStalling:", v3);

  }
}

- (BOOL)isFullscreen
{
  return self->_isFullscreen;
}

- (void)setFullscreen:(BOOL)fullscreen
{
  -[MPMoviePlayerController setFullscreen:animated:](self, "setFullscreen:animated:", fullscreen, 1);
}

- (void)setFullscreen:(BOOL)fullscreen animated:(BOOL)animated
{
  AVPlayerViewController *playerViewController;

  playerViewController = self->_playerViewController;
  if (fullscreen)
    -[AVPlayerViewController enterFullScreenWithCompletion:](playerViewController, "enterFullScreenWithCompletion:", 0, animated);
  else
    -[AVPlayerViewController exitFullScreenWithCompletion:](playerViewController, "exitFullScreenWithCompletion:", 0, animated);
}

- (MPMovieScalingMode)scalingMode
{
  void *v2;
  MPMovieScalingMode v3;

  -[AVPlayerViewController videoGravity](self->_playerViewController, "videoGravity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 == (void *)*MEMORY[0x1E0C8A6D0])
  {
    v3 = MPMovieScalingModeFill;
  }
  else if (v2 == (void *)*MEMORY[0x1E0C8A6D8])
  {
    v3 = MPMovieScalingModeAspectFit;
  }
  else
  {
    v3 = 2 * (v2 == (void *)*MEMORY[0x1E0C8A6E0]);
  }

  return v3;
}

- (void)setScalingMode:(MPMovieScalingMode)scalingMode
{
  id v5;
  id v6;
  id *v7;
  id v8;
  id v9;
  id v10;

  v5 = (id)*MEMORY[0x1E0C8A6D0];
  v6 = v5;
  if (scalingMode == MPMovieScalingModeAspectFit)
  {
    v9 = v5;
    v7 = (id *)MEMORY[0x1E0C8A6D8];
    goto LABEL_5;
  }
  if (scalingMode == MPMovieScalingModeAspectFill)
  {
    v9 = v5;
    v7 = (id *)MEMORY[0x1E0C8A6E0];
LABEL_5:
    v8 = *v7;

    v6 = v8;
  }
  v10 = v6;
  -[AVPlayerViewController setVideoGravity:](self->_playerViewController, "setVideoGravity:", v6);

}

- (BOOL)readyForDisplay
{
  return -[AVPlayerViewController isReadyForDisplay](self->_playerViewController, "isReadyForDisplay");
}

- (MPMovieMediaTypeMask)movieMediaTypes
{
  return 0;
}

- (NSTimeInterval)duration
{
  void *v2;
  double v3;
  double v4;

  -[AVPlayerViewController playerController](self->_playerViewController, "playerController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentDuration");
  v4 = v3;

  return v4;
}

- (NSTimeInterval)playableDuration
{
  void *v2;
  double v3;
  double v4;

  -[AVPlayerViewController playerController](self->_playerViewController, "playerController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentDurationWithinEndTimes");
  v4 = v3;

  return v4;
}

- (CGSize)naturalSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[AVPlayerViewController playerController](self->_playerViewController, "playerController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentDimensions");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (NSTimeInterval)initialPlaybackTime
{
  void *v2;
  double v3;
  double v4;

  -[AVPlayerViewController playerController](self->_playerViewController, "playerController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "minTime");
  v4 = v3;

  return v4;
}

- (void)setInitialPlaybackTime:(NSTimeInterval)initialPlaybackTime
{
  id v4;

  -[AVPlayerViewController playerController](self->_playerViewController, "playerController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMinTime:", initialPlaybackTime);

}

- (NSTimeInterval)endPlaybackTime
{
  void *v2;
  double v3;
  double v4;

  -[AVPlayerViewController playerController](self->_playerViewController, "playerController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "maxTime");
  v4 = v3;

  return v4;
}

- (void)setEndPlaybackTime:(NSTimeInterval)endPlaybackTime
{
  id v4;

  -[AVPlayerViewController playerController](self->_playerViewController, "playerController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMaxTime:", endPlaybackTime);

}

- (BOOL)allowsAirPlay
{
  void *v2;
  char v3;

  -[AVPlayerViewController playerController](self->_playerViewController, "playerController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "allowsExternalPlayback");

  return v3;
}

- (void)setAllowsAirPlay:(BOOL)allowsAirPlay
{
  _BOOL8 v3;
  id v4;

  v3 = allowsAirPlay;
  -[AVPlayerViewController playerController](self->_playerViewController, "playerController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAllowsExternalPlayback:", v3);

}

- (BOOL)isAirPlayVideoActive
{
  void *v2;
  char v3;

  -[AVPlayerViewController playerController](self->_playerViewController, "playerController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isExternalPlaybackActive");

  return v3;
}

- (void)prepareToPlay
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL8 shouldAutoplay;
  void *v7;
  void *v8;
  id v9;

  -[AVPlayerViewController player](self->_playerViewController, "player");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C8B2E8], "playerWithURL:", self->_contentURL);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVPlayerViewController setPlayer:](self->_playerViewController, "setPlayer:", v5);

    shouldAutoplay = self->_shouldAutoplay;
    -[AVPlayerViewController player](self->_playerViewController, "player");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAutomaticallyWaitsToMinimizeStalling:", shouldAutoplay);

    if (self->_useApplicationAudioSession)
    {
      objc_msgSend(MEMORY[0x1E0C89AE8], "auxiliarySession");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      -[AVPlayerViewController player](self->_playerViewController, "player");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setAudioSession:", v9);

    }
  }
}

- (BOOL)isPreparedToPlay
{
  void *v2;
  BOOL v3;

  -[AVPlayerViewController player](self->_playerViewController, "player");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)play
{
  id v3;

  -[MPMoviePlayerController prepareToPlay](self, "prepareToPlay");
  -[AVPlayerViewController playerController](self->_playerViewController, "playerController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "play:", self);

}

- (void)pause
{
  id v3;

  -[AVPlayerViewController playerController](self->_playerViewController, "playerController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pause:", self);

}

- (void)stop
{
  -[AVPlayerViewController setPlayer:](self->_playerViewController, "setPlayer:", 0);
}

- (double)currentPlaybackTime
{
  void *v2;
  double v3;
  double v4;

  -[AVPlayerViewController playerController](self->_playerViewController, "playerController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentTime");
  v4 = v3;

  return v4;
}

- (void)setCurrentPlaybackTime:(double)a3
{
  id v4;

  -[AVPlayerViewController playerController](self->_playerViewController, "playerController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "seekToTime:", a3);

}

- (float)currentPlaybackRate
{
  void *v2;
  double v3;
  float v4;

  -[AVPlayerViewController playerController](self->_playerViewController, "playerController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rate");
  v4 = v3;

  return v4;
}

- (void)setCurrentPlaybackRate:(float)a3
{
  id v4;

  -[AVPlayerViewController playerController](self->_playerViewController, "playerController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRate:", a3);

}

- (void)beginSeekingForward
{
  id v3;

  -[AVPlayerViewController playerController](self->_playerViewController, "playerController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "beginScanningForward:", self);

}

- (void)beginSeekingBackward
{
  id v3;

  -[AVPlayerViewController playerController](self->_playerViewController, "playerController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "beginScanningBackward:", self);

}

- (void)endSeeking
{
  void *v3;
  id v4;

  -[AVPlayerViewController playerController](self->_playerViewController, "playerController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endScanningBackward:", self);

  -[AVPlayerViewController playerController](self->_playerViewController, "playerController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endScanningForward:", self);

}

- (UIImage)thumbnailImageAtTime:(NSTimeInterval)playbackTime timeOption:(MPMovieTimeOption)option
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  __int128 *v12;
  uint64_t v13;
  CGImage *v14;
  CGImage *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  CMTime v20;
  __int128 v21;
  uint64_t v22;
  __int128 v23;
  uint64_t v24;
  __int128 v25;
  uint64_t v26;
  __int128 v27;
  uint64_t v28;

  v6 = (void *)MEMORY[0x1E0C8AFC8];
  -[AVPlayerViewController player](self->_playerViewController, "player");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "asset");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "assetImageGeneratorWithAsset:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setAppliesPreferredTrackTransform:", 1);
  if (option == MPMovieTimeOptionExact)
  {
    v27 = *MEMORY[0x1E0CA2E68];
    v18 = v27;
    v28 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
    v11 = v28;
    objc_msgSend(v10, "setRequestedTimeToleranceBefore:", &v27);
    v25 = v18;
    v26 = v11;
    v12 = &v25;
  }
  else
  {
    v23 = *MEMORY[0x1E0CA2E30];
    v19 = v23;
    v24 = *(_QWORD *)(MEMORY[0x1E0CA2E30] + 16);
    v13 = v24;
    objc_msgSend(v10, "setRequestedTimeToleranceBefore:", &v23);
    v21 = v19;
    v22 = v13;
    v12 = &v21;
  }
  objc_msgSend(v10, "setRequestedTimeToleranceAfter:", v12);
  CMTimeMake(&v20, (uint64_t)(playbackTime * 1000.0), 1000);
  v14 = (CGImage *)objc_msgSend(v10, "copyCGImageAtTime:actualTime:error:", &v20, 0, 0);
  if (v14)
  {
    v15 = v14;
    if (CGImageGetWidth(v14) && CGImageGetHeight(v15))
    {
      objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCGImage:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = 0;
    }
    CFRelease(v15);
  }
  else
  {
    v16 = 0;
  }

  return (UIImage *)v16;
}

- (void)requestThumbnailImagesAtTimes:(NSArray *)playbackTimes timeOption:(MPMovieTimeOption)option
{
  NSArray *v6;
  AVAssetImageGenerator *generator;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  AVAssetImageGenerator *v12;
  AVAssetImageGenerator *v13;
  AVAssetImageGenerator *v14;
  uint64_t v15;
  AVAssetImageGenerator *v16;
  __int128 *v17;
  uint64_t v18;
  void *v19;
  NSArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  double v26;
  void *v27;
  AVAssetImageGenerator *v28;
  __int128 v29;
  __int128 v30;
  _QWORD v31[5];
  CMTime v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint64_t v38;
  __int128 v39;
  uint64_t v40;
  __int128 v41;
  uint64_t v42;
  __int128 v43;
  uint64_t v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v6 = playbackTimes;
  generator = self->_generator;
  if (!generator)
  {
    v8 = (void *)MEMORY[0x1E0C8AFC8];
    -[AVPlayerViewController player](self->_playerViewController, "player");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "currentItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "asset");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "assetImageGeneratorWithAsset:", v11);
    v12 = (AVAssetImageGenerator *)objc_claimAutoreleasedReturnValue();
    v13 = self->_generator;
    self->_generator = v12;

    generator = self->_generator;
  }
  -[AVAssetImageGenerator setAppliesPreferredTrackTransform:](generator, "setAppliesPreferredTrackTransform:", 1);
  v14 = self->_generator;
  if (option == MPMovieTimeOptionExact)
  {
    v43 = *MEMORY[0x1E0CA2E68];
    v29 = v43;
    v44 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
    v15 = v44;
    -[AVAssetImageGenerator setRequestedTimeToleranceBefore:](v14, "setRequestedTimeToleranceBefore:", &v43);
    v16 = self->_generator;
    v41 = v29;
    v42 = v15;
    v17 = &v41;
  }
  else
  {
    v39 = *MEMORY[0x1E0CA2E30];
    v30 = v39;
    v40 = *(_QWORD *)(MEMORY[0x1E0CA2E30] + 16);
    v18 = v40;
    -[AVAssetImageGenerator setRequestedTimeToleranceBefore:](v14, "setRequestedTimeToleranceBefore:", &v39);
    v16 = self->_generator;
    v37 = v30;
    v38 = v18;
    v17 = &v37;
  }
  -[AVAssetImageGenerator setRequestedTimeToleranceAfter:](v16, "setRequestedTimeToleranceAfter:", v17);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSArray count](v6, "count"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v20 = v6;
  v21 = -[NSArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v34;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v34 != v23)
          objc_enumerationMutation(v20);
        v25 = (void *)MEMORY[0x1E0CB3B18];
        objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * v24), "doubleValue");
        CMTimeMake(&v32, (uint64_t)(v26 * 1000.0), 1000);
        objc_msgSend(v25, "valueWithCMTime:", &v32);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addObject:", v27);

        ++v24;
      }
      while (v22 != v24);
      v22 = -[NSArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
    }
    while (v22);
  }

  v28 = self->_generator;
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __68__MPMoviePlayerController_requestThumbnailImagesAtTimes_timeOption___block_invoke;
  v31[3] = &unk_1E31530D0;
  v31[4] = self;
  -[AVAssetImageGenerator generateCGImagesAsynchronouslyForTimes:completionHandler:](v28, "generateCGImagesAsynchronouslyForTimes:completionHandler:", v19, v31);

}

- (void)cancelAllThumbnailImageRequests
{
  -[AVAssetImageGenerator cancelAllCGImageGeneration](self->_generator, "cancelAllCGImageGeneration");
}

- (NSArray)timedMetadata
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  MPTimedMetadata *v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[AVPlayerViewController player](self->_playerViewController, "player");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timedMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v10);
        v12 = [MPTimedMetadata alloc];
        v13 = -[MPTimedMetadata _initWithMetadataItem:](v12, "_initWithMetadataItem:", v11, (_QWORD)v15);
        if (v13)
          objc_msgSend(v5, "addObject:", v13);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  return (NSArray *)v5;
}

- (MPMovieAccessLog)accessLog
{
  MPMovieAccessLog *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = [MPMovieAccessLog alloc];
  -[AVPlayerViewController player](self->_playerViewController, "player");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessLog");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MPMovieAccessLog _initWithAVItemAccessLog:](v3, "_initWithAVItemAccessLog:", v6);

  return (MPMovieAccessLog *)v7;
}

- (MPMovieErrorLog)errorLog
{
  MPMovieErrorLog *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = [MPMovieErrorLog alloc];
  -[AVPlayerViewController player](self->_playerViewController, "player");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "errorLog");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MPMovieErrorLog _initWithAVItemErrorLog:](v3, "_initWithAVItemErrorLog:", v6);

  return (MPMovieErrorLog *)v7;
}

- (BOOL)useApplicationAudioSession
{
  return self->_useApplicationAudioSession;
}

- (void)setUseApplicationAudioSession:(BOOL)useApplicationAudioSession
{
  void *v4;
  id v5;

  if (self->_useApplicationAudioSession != useApplicationAudioSession)
  {
    self->_useApplicationAudioSession = useApplicationAudioSession;
    objc_msgSend(MEMORY[0x1E0C89AE8], "auxiliarySession");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[AVPlayerViewController player](self->_playerViewController, "player");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAudioSession:", v5);

  }
}

- (id)_advertisementView
{
  return 0;
}

- (id)_videoViewController
{
  return 0;
}

- (void)playerViewController:(id)a3 willBeginFullScreenPresentationWithAnimationCoordinator:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[5];

  v5 = (void *)MEMORY[0x1E0CB37D0];
  v6 = a4;
  objc_msgSend(v5, "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postNotificationName:object:", CFSTR("MPMoviePlayerWillEnterFullscreenNotification"), self);

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __104__MPMoviePlayerController_playerViewController_willBeginFullScreenPresentationWithAnimationCoordinator___block_invoke_2;
  v8[3] = &unk_1E3153128;
  v8[4] = self;
  objc_msgSend(v6, "animateAlongsideTransition:completion:", &__block_literal_global_742, v8);

}

- (void)playerViewController:(id)a3 willEndFullScreenPresentationWithAnimationCoordinator:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[5];

  v5 = (void *)MEMORY[0x1E0CB37D0];
  v6 = a4;
  objc_msgSend(v5, "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postNotificationName:object:", CFSTR("MPMoviePlayerWillExitFullscreenNotification"), self);

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __102__MPMoviePlayerController_playerViewController_willEndFullScreenPresentationWithAnimationCoordinator___block_invoke_2;
  v8[3] = &unk_1E3153128;
  v8[4] = self;
  objc_msgSend(v6, "animateAlongsideTransition:completion:", &__block_literal_global_34, v8);

}

- (void)_avPlayerItemDidPlayToEndNotification:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVPlayerViewController player](self->_playerViewController, "player");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 == v6)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = CFSTR("MPMoviePlayerPlaybackDidFinishReasonUserInfoKey");
    v10[0] = &unk_1E31E4798;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "postNotificationName:object:userInfo:", CFSTR("MPMoviePlayerPlaybackDidFinishNotification"), self, v8);

  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  objc_super v24;
  const __CFString *v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = v10;
  if (a6 != &_MPMoviePlayerControllerObservationContext)
  {
    v24.receiver = self;
    v24.super_class = (Class)MPMoviePlayerController;
    -[MPMoviePlayerController observeValueForKeyPath:ofObject:change:context:](&v24, sel_observeValueForKeyPath_ofObject_change_context_, v10, a4, a5, a6);
    goto LABEL_21;
  }
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("videoGravity")))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    v14 = CFSTR("MPMoviePlayerScalingModeDidChangeNotification");
    goto LABEL_19;
  }
  if (!objc_msgSend(v11, "isEqualToString:", CFSTR("playerController.status")))
  {
    if (!objc_msgSend(v11, "isEqualToString:", CFSTR("isReadyForDisplay")))
    {
      if (objc_msgSend(v11, "isEqualToString:", CFSTR("player.currentItem")))
      {
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "postNotificationName:object:", CFSTR("MPMoviePlayerNowPlayingMovieDidChangeNotification"), self);

        v23 = (void *)MEMORY[0x1E0CB37D0];
      }
      else
      {
        if (objc_msgSend(v11, "isEqualToString:", CFSTR("player.isExternalPlaybackActive")))
        {
          objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v12;
          v14 = CFSTR("MPMoviePlayerIsAirPlayVideoActiveDidChangeNotification");
          goto LABEL_19;
        }
        if (!objc_msgSend(v11, "isEqualToString:", CFSTR("playerController.isPlaying")))
        {
          if (objc_msgSend(v11, "isEqualToString:", CFSTR("playerController.contentDimensions")))
          {
            objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = v12;
            v14 = CFSTR("MPMovieNaturalSizeAvailableNotification");
          }
          else
          {
            if (!objc_msgSend(v11, "isEqualToString:", CFSTR("playerController.contentDuration")))
              goto LABEL_21;
            objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = v12;
            v14 = CFSTR("MPMovieDurationAvailableNotification");
          }
          goto LABEL_19;
        }
        v23 = (void *)MEMORY[0x1E0CB37D0];
      }
      objc_msgSend(v23, "defaultCenter");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      v14 = CFSTR("MPMoviePlayerPlaybackStateDidChangeNotification");
      goto LABEL_19;
    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    v14 = CFSTR("MPMoviePlayerReadyForDisplayDidChangeNotification");
LABEL_19:
    objc_msgSend(v12, "postNotificationName:object:", v14, self);
    goto LABEL_20;
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "postNotificationName:object:", CFSTR("MPMoviePlayerLoadStateDidChangeNotification"), self);

  -[AVPlayerViewController playerController](self->_playerViewController, "playerController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "status");

  if (v17 == 2)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "postNotificationName:object:", CFSTR("MPMediaPlaybackIsPreparedToPlayDidChangeNotification"), self);

  }
  -[AVPlayerViewController playerController](self->_playerViewController, "playerController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "status");

  if (v20 == 3)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = CFSTR("MPMoviePlayerPlaybackDidFinishReasonUserInfoKey");
    v26[0] = &unk_1E31E47B0;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "postNotificationName:object:userInfo:", CFSTR("MPMoviePlayerPlaybackDidFinishNotification"), self, v21);

LABEL_20:
  }
LABEL_21:

}

- (MPMovieSourceType)movieSourceType
{
  return self->_movieSourceType;
}

- (void)setMovieSourceType:(MPMovieSourceType)movieSourceType
{
  self->_movieSourceType = movieSourceType;
}

- (NSURL)contentURL
{
  return self->_contentURL;
}

- (MPMovieControlStyle)controlStyle
{
  return self->_controlStyle;
}

- (MPMovieRepeatMode)repeatMode
{
  return self->_repeatMode;
}

- (BOOL)shouldAutoplay
{
  return self->_shouldAutoplay;
}

- (AVPlayerViewController)playerViewController
{
  return self->_playerViewController;
}

- (UIViewController)hostingViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_hostingViewController);
}

- (void)setHostingViewController:(id)a3
{
  objc_storeWeak((id *)&self->_hostingViewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_hostingViewController);
  objc_storeStrong((id *)&self->_playerViewController, 0);
  objc_storeStrong((id *)&self->_contentURL, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_generator, 0);
  objc_storeStrong((id *)&self->_proxyView, 0);
}

void __102__MPMoviePlayerController_playerViewController_willEndFullScreenPresentationWithAnimationCoordinator___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  if ((objc_msgSend(a2, "isCancelled") & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 33) = 0;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "postNotificationName:object:", CFSTR("MPMoviePlayerDidExitFullscreenNotification"), *(_QWORD *)(a1 + 32));

  }
}

void __104__MPMoviePlayerController_playerViewController_willBeginFullScreenPresentationWithAnimationCoordinator___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  if ((objc_msgSend(a2, "isCancelled") & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 33) = 1;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "postNotificationName:object:", CFSTR("MPMoviePlayerDidEnterFullscreenNotification"), *(_QWORD *)(a1 + 32));

  }
}

void __68__MPMoviePlayerController_requestThumbnailImagesAtTimes_timeOption___block_invoke(uint64_t a1, CMTime *a2, void *a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  CMTime v15;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v9 = a6;
  if (a3)
  {
    if (CGImageGetWidth((CGImageRef)a3))
    {
      if (CGImageGetHeight((CGImageRef)a3))
      {
        objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCGImage:", a3);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        CFRelease(a3);
        if (v10)
        {
          objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = *(_QWORD *)(a1 + 32);
          v16[1] = CFSTR("MPMoviePlayerThumbnailTimeKey");
          v17[0] = v10;
          v15 = *a2;
          v16[0] = CFSTR("MPMoviePlayerThumbnailImageKey");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", CMTimeGetSeconds(&v15));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v17[1] = v13;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "postNotificationName:object:userInfo:", CFSTR("MPMoviePlayerThumbnailImageRequestDidFinishNotification"), v12, v14);

        }
      }
    }
  }

}

@end
