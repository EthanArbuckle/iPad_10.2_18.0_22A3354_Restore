@implementation AVPlayerLayer(AVPictureInPictureContentSource)

- (AVPlayerController)avkit_makePlayerControllerIfNeeded:()AVPictureInPictureContentSource
{
  AVPlayerController *v4;
  void *v5;
  void *v6;
  AVPlayerController *v7;
  AVPlayerController *v8;
  void *v9;
  AVPlayerController *v10;
  AVPlayerController *v11;

  v4 = a3;
  -[AVPlayerController player](v4, "player");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "player");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v4;
  if (v5 != v6)
  {
    v8 = [AVPlayerController alloc];
    objc_msgSend(a1, "player");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[AVPlayerController initWithPlayer:](v8, "initWithPlayer:", v9);

    -[AVPlayerController setHandlesAudioSessionInterruptions:](v7, "setHandlesAudioSessionInterruptions:", 1);
    -[AVPlayerController setPlayingOnSecondScreen:](v7, "setPlayingOnSecondScreen:", -[AVPlayerController isPlayingOnSecondScreen](v4, "isPlayingOnSecondScreen"));
  }
  if (v7)
    v10 = v7;
  else
    v10 = -[AVPlayerController initWithPlayer:]([AVPlayerController alloc], "initWithPlayer:", 0);
  v11 = v10;

  return v11;
}

- (void)avkit_startRoutingVideoToPictureInPictureViewController:()AVPictureInPictureContentSource
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _AVLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_msgSend(a1, "isPIPModeEnabled");
    v7 = "NO";
    v12 = 136315650;
    v13 = "-[AVPlayerLayer(AVPictureInPictureContentSource) avkit_startRoutingVideoToPictureInPictureViewController:]";
    v15 = "self.isPIPModeEnabled";
    v14 = 2080;
    if (v6)
      v7 = "YES";
    v16 = 2080;
    v17 = v7;
    _os_log_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_DEFAULT, "%s %s %s", (uint8_t *)&v12, 0x20u);
  }

  if ((objc_msgSend(a1, "isPIPModeEnabled") & 1) == 0)
  {
    objc_msgSend(v4, "pictureInPicturePlayerLayerView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "attachPlayerLayer");

    objc_msgSend(v4, "pictureInPicturePlayerLayerView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "playerLayer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "startRedirectingVideoToLayer:forMode:", v10, 0);

    objc_msgSend(a1, "avkit_makePictureInPicturePlatformAdapterContentPlaceholderLayer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setPlaceholderContentLayerDuringPIPMode:", v11);

  }
}

- (void)avkit_stopRoutingVideoToPictureInPictureViewController:()AVPictureInPictureContentSource
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _BYTE v13[24];
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _AVLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_msgSend(a1, "isPIPModeEnabled");
    v7 = "NO";
    *(_DWORD *)v13 = 136315650;
    *(_QWORD *)&v13[4] = "-[AVPlayerLayer(AVPictureInPictureContentSource) avkit_stopRoutingVideoToPictureInPictureViewController:]";
    *(_QWORD *)&v13[14] = "self.isPIPModeEnabled";
    *(_WORD *)&v13[12] = 2080;
    if (v6)
      v7 = "YES";
    *(_WORD *)&v13[22] = 2080;
    v14 = v7;
    _os_log_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_DEFAULT, "%s %s %s", v13, 0x20u);
  }

  if (objc_msgSend(a1, "isPIPModeEnabled"))
  {
    objc_msgSend(v4, "pictureInPicturePlayerLayerView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "playerLayer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "stopRedirectingVideoToLayer:", v9);

    if (objc_msgSend(a1, "isLegibleDisplayEnabled"))
    {
      objc_msgSend(a1, "setLegibleDisplayEnabled:", 0);
      objc_msgSend(a1, "setLegibleDisplayEnabled:", 1);
    }
    objc_msgSend(v4, "pictureInPicturePlayerLayerView", *(_OWORD *)v13, *(_QWORD *)&v13[16]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "playerLayer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setLegibleDisplayEnabled:", 1);

    objc_msgSend(v4, "pictureInPicturePlayerLayerView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "detachPlayerLayer");

    objc_msgSend(a1, "setPlaceholderContentLayerDuringPIPMode:", 0);
  }

}

- (void)avkit_beginReducingResourcesForPictureInPictureViewController:()AVPictureInPictureContentSource playerController:
{
  id v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  objc_msgSend(a1, "avkit_window");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7 || (v8 = (void *)v7, v9 = dyld_program_sdk_at_least(), v8, v9))
  {
    objc_msgSend(v12, "pictureInPicturePlayerLayerView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "playerLayer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "beginReducingResourcesForPictureInPicturePlayerLayer:", v11);

  }
}

- (void)avkit_endReducingResourcesForPictureInPictureViewController:()AVPictureInPictureContentSource playerController:
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  objc_msgSend(a3, "pictureInPicturePlayerLayerView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "playerLayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "endReducingResourcesForPictureInPicturePlayerLayer:", v6);

}

- (void)avkit_willBeginStoppingPictureInPictureForPictureInPictureViewController:()AVPictureInPictureContentSource
{
  void *v3;
  id v4;

  objc_msgSend(a3, "pictureInPicturePlayerLayerView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "playerLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLegibleDisplayEnabled:", 1);

}

- (BOOL)avkit_isVisible
{
  CGRect v2;

  objc_msgSend(a1, "bounds");
  return !CGRectIsEmpty(v2);
}

- (id)avkit_window
{
  id v1;
  void *v2;
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;
  void *v7;

  v1 = a1;
  if (v1)
  {
    v2 = v1;
    do
    {
      objc_msgSend(v2, "delegate");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        objc_msgSend(v2, "delegate");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "window");
        v6 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v6 = 0;
      }
      objc_msgSend(v2, "superlayer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
        break;
      v2 = v7;
    }
    while (v7);
  }
  else
  {
    v6 = 0;
    v7 = 0;
  }

  return v6;
}

- (double)avkit_videoRectInWindow
{
  void *v2;
  double v3;
  double v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  void *v9;
  double v10;
  CGRect v12;

  objc_msgSend(a1, "avkit_window");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "bounds");
  v4 = v3;
  if (v2)
  {
    if (objc_msgSend(a1, "isReadyForDisplay"))
    {
      objc_msgSend(a1, "videoRect");
      v12.origin.x = v5;
      v12.origin.y = v6;
      v12.size.width = v7;
      v12.size.height = v8;
      if (!CGRectEqualToRect(*MEMORY[0x1E0C9D648], v12))
      {
        objc_msgSend(v2, "layer");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          objc_msgSend(a1, "videoRect");
          objc_msgSend(v9, "convertRect:fromLayer:", a1);
          v4 = v10;
        }

      }
    }
  }

  return v4;
}

- (uint64_t)avkit_pictureInPictureViewController
{
  return 0;
}

- (uint64_t)avkit_wantsManagedSecondScreenPlayback
{
  return 1;
}

- (AVPictureInPictureIndicatorLayer)avkit_makePictureInPicturePlatformAdapterContentPlaceholderLayer
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  AVPictureInPictureIndicatorLayer *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  id v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  AVPictureInPictureIndicatorLayer *v20;

  v2 = (void *)MEMORY[0x1E0DC3870];
  AVBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "avkit_window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("PictureInPictureIndicatorLarge"), v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3658], "AV_indicatorForegroundColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_flatImageWithColor:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = [AVPictureInPictureIndicatorLayer alloc];
  objc_msgSend(a1, "avkit_window");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "traitCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "displayScale");
  v13 = v12;
  v14 = objc_retainAutorelease(v8);
  v15 = objc_msgSend(v14, "CGImage");
  objc_msgSend(a1, "avkit_videoRectInWindow");
  v20 = -[AVPictureInPictureIndicatorLayer initWithDisplayScale:placeholderImage:opaque:videoRectWhenPIPBegan:](v9, "initWithDisplayScale:placeholderImage:opaque:videoRectWhenPIPBegan:", v15, 0, v13, v16, v17, v18, v19);

  return v20;
}

- (uint64_t)avkit_contentSourceType
{
  return 0;
}

@end
