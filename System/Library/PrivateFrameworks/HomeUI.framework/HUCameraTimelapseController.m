@implementation HUCameraTimelapseController

- (HUCameraTimelapseController)initWithCameraProfile:(id)a3
{
  id v5;
  HUCameraTimelapseController *v6;
  HUCameraTimelapseController *v7;
  AVPlayer *v8;
  AVPlayer *player;
  uint64_t v10;
  AVPlayerLayer *playerLayer;
  CALayer *v12;
  CALayer *imageLayer;
  NSMutableDictionary *v14;
  NSMutableDictionary *cachedVideos;
  NSCache *v16;
  NSCache *cachedPlayerItems;
  objc_super v19;

  v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)HUCameraTimelapseController;
  v6 = -[HUCameraTimelapseController init](&v19, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_cameraProfile, a3);
    v8 = (AVPlayer *)objc_alloc_init(MEMORY[0x1E0C8B2E8]);
    player = v7->_player;
    v7->_player = v8;

    -[AVPlayer addObserver:forKeyPath:options:context:](v7->_player, "addObserver:forKeyPath:options:context:", v7, CFSTR("status"), 0, HUCameraTimelapseControllerContext);
    objc_msgSend(MEMORY[0x1E0C8B330], "playerLayerWithPlayer:", v7->_player);
    v10 = objc_claimAutoreleasedReturnValue();
    playerLayer = v7->_playerLayer;
    v7->_playerLayer = (AVPlayerLayer *)v10;

    v12 = (CALayer *)objc_alloc_init(MEMORY[0x1E0CD27A8]);
    imageLayer = v7->_imageLayer;
    v7->_imageLayer = v12;

    -[HUCameraTimelapseController _hideAllTimelapseLayers](v7, "_hideAllTimelapseLayers");
    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    cachedVideos = v7->_cachedVideos;
    v7->_cachedVideos = v14;

    v16 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    cachedPlayerItems = v7->_cachedPlayerItems;
    v7->_cachedPlayerItems = v16;

    -[NSCache setCountLimit:](v7->_cachedPlayerItems, "setCountLimit:", 6);
    v7->_downloadState = 0;
  }

  return v7;
}

- (void)resetForNewCamera
{
  void *v3;
  void *v4;

  -[HUCameraTimelapseController imageLayer](self, "imageLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setContents:", 0);

  -[HUCameraTimelapseController cachedPlayerItems](self, "cachedPlayerItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

  -[HUCameraTimelapseController setCurrentClip:](self, "setCurrentClip:", 0);
  -[HUCameraTimelapseController setHighQualityClip:](self, "setHighQualityClip:", 0);
  -[HUCameraTimelapseController setTimelapseVisibility:](self, "setTimelapseVisibility:", 0);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)cmTimeFromDate:(SEL)a3
{
  id v6;
  void *v7;
  void *v8;
  double v9;
  Float64 v10;

  v6 = a4;
  -[HUCameraTimelapseController currentClip](self, "currentClip");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "startDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSinceDate:", v8);
  v10 = v9;

  return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeMakeWithSeconds((CMTime *)retstr, v10, 1000);
}

- (BOOL)canSeekWithClip:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[HUCameraTimelapseController currentClip](self, "currentClip");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v6, "isEqual:", v7);
  return (char)v4;
}

- (id)playerItemForURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HUCameraTimelapseController cachedPlayerItems](self, "cachedPlayerItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    HFLogForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412290;
      v11 = v4;
      _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, "Adding player item to cache: %@", (uint8_t *)&v10, 0xCu);
    }

    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8B300]), "initWithURL:", v4);
    -[HUCameraTimelapseController cachedPlayerItems](self, "cachedPlayerItems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v6, v4);

  }
  return v6;
}

- (void)updatePlaceholderContent
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  int v21;
  _BYTE v22[14];
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D31220], "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraTimelapseController highQualityClip](self, "highQualityClip");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstPosterFrameImageForClip:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    HFLogForCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      -[HUCameraTimelapseController highQualityClip](self, "highQualityClip");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "uniqueIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUCameraTimelapseController currentClip](self, "currentClip");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "uniqueIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 67109634;
      *(_DWORD *)v22 = 1;
      *(_WORD *)&v22[4] = 2112;
      *(_QWORD *)&v22[6] = v8;
      v23 = 2112;
      v24 = v10;
      _os_log_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_DEFAULT, "IMAGE: Updating camera clip with first poster frame:%{BOOL}d for Full:%@ Timelapse:%@", (uint8_t *)&v21, 0x1Cu);

    }
LABEL_8:
    v17 = objc_retainAutorelease(v5);
    v18 = -[NSObject CGImage](v17, "CGImage");
    -[HUCameraTimelapseController imageLayer](self, "imageLayer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setContents:", v18);
    goto LABEL_9;
  }
  -[HUCameraTimelapseController highQualityClip](self, "highQualityClip");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "heroFrameImageForClip:", v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  HFLogForCategory();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    -[HUCameraTimelapseController highQualityClip](self, "highQualityClip");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "uniqueIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCameraTimelapseController currentClip](self, "currentClip");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "uniqueIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 67109634;
    *(_DWORD *)v22 = v5 != 0;
    *(_WORD *)&v22[4] = 2112;
    *(_QWORD *)&v22[6] = v14;
    v23 = 2112;
    v24 = v16;
    _os_log_impl(&dword_1B8E1E000, v12, OS_LOG_TYPE_DEFAULT, "IMAGE: Updating camera clip with hero frame:%{BOOL}d for Full:%@ Timelapse:%@", (uint8_t *)&v21, 0x1Cu);

  }
  if (v5)
    goto LABEL_8;
  -[HUCameraTimelapseController setTimelapseVisibility:](self, "setTimelapseVisibility:", 0);
  HFLogForCategory();
  v17 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    goto LABEL_10;
  -[HUCameraTimelapseController currentClip](self, "currentClip");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "uniqueIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 138412290;
  *(_QWORD *)v22 = v20;
  _os_log_error_impl(&dword_1B8E1E000, v17, OS_LOG_TYPE_ERROR, "IMAGE: No image available for %@. Using stale image.", (uint8_t *)&v21, 0xCu);

LABEL_9:
LABEL_10:

}

- (void)_updateTimelapseClip:(id)a3 withHighQualityClip:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  HFLogForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    -[HUCameraTimelapseController currentClip](self, "currentClip");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "uniqueIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uniqueIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138412546;
    v18 = v10;
    v19 = 2112;
    v20 = v11;
    _os_log_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_DEFAULT, "Updating timelapse from %@ to %@", (uint8_t *)&v17, 0x16u);

  }
  -[HUCameraTimelapseController setPlayingHLSPlayerItem:](self, "setPlayingHLSPlayerItem:", 0);
  -[HUCameraTimelapseController setDownloadState:](self, "setDownloadState:", 0);
  -[HUCameraTimelapseController setCurrentClip:](self, "setCurrentClip:", v6);
  -[HUCameraTimelapseController imageLayer](self, "imageLayer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setContents:", 0);

  -[HUCameraTimelapseController currentClip](self, "currentClip");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
    -[HUCameraTimelapseController updatePlaceholderContent](self, "updatePlaceholderContent");
  if ((objc_msgSend(v7, "isComplete") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0D31280], "sharedProvider");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "getVideoForTimelapseClip:taskType:delegate:", v6, 0, self);

  }
  else
  {
    HFLogForCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "uniqueIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138412290;
      v18 = v16;
      _os_log_impl(&dword_1B8E1E000, v15, OS_LOG_TYPE_DEFAULT, "Using HLS Playlist to play in-progress timelapse clip:%@", (uint8_t *)&v17, 0xCu);

    }
    -[HUCameraTimelapseController _fallbackToHighQualityClip:](self, "_fallbackToHighQualityClip:", v7);
  }

}

- (void)_fallbackToHighQualityClip:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint8_t v11[16];

  v4 = a3;
  if (v4)
  {
    -[HUCameraTimelapseController setPlayingHLSPlayerItem:](self, "setPlayingHLSPlayerItem:", 1);
    v5 = objc_alloc(MEMORY[0x1E0D31210]);
    -[HUCameraTimelapseController cameraProfile](self, "cameraProfile");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "clipManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v5, "initWithClipManager:clip:", v7, v4);

    -[HUCameraTimelapseController player](self, "player");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "replaceCurrentItemWithPlayerItem:", v8);

  }
  else
  {
    HFLogForCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v11 = 0;
      _os_log_error_impl(&dword_1B8E1E000, v10, OS_LOG_TYPE_ERROR, "Trying to fallback to high quality clip but it is nil", v11, 2u);
    }

  }
}

- (void)setTimelapseVisibility:(BOOL)a3
{
  if (!a3)
    goto LABEL_6;
  if (-[HUCameraTimelapseController isPlayingHLSPlayerItem](self, "isPlayingHLSPlayerItem"))
  {
LABEL_3:
    -[HUCameraTimelapseController _showOnlyPlayerLayer](self, "_showOnlyPlayerLayer");
    return;
  }
  if (-[HUCameraTimelapseController downloadState](self, "downloadState"))
  {
    if (-[HUCameraTimelapseController downloadState](self, "downloadState") == 2)
    {
LABEL_6:
      -[HUCameraTimelapseController _hideAllTimelapseLayers](self, "_hideAllTimelapseLayers");
      return;
    }
    if (-[HUCameraTimelapseController downloadState](self, "downloadState") == 1)
      goto LABEL_3;
  }
  else
  {
    -[HUCameraTimelapseController _showOnlyImageLayer](self, "_showOnlyImageLayer");
  }
}

- (void)_hideAllTimelapseLayers
{
  void *v3;
  id v4;

  -[HUCameraTimelapseController playerLayer](self, "playerLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 1);

  -[HUCameraTimelapseController imageLayer](self, "imageLayer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", 1);

}

- (void)_showOnlyPlayerLayer
{
  void *v3;
  id v4;

  -[HUCameraTimelapseController playerLayer](self, "playerLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 0);

  -[HUCameraTimelapseController imageLayer](self, "imageLayer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", 1);

}

- (void)_showOnlyImageLayer
{
  void *v3;
  id v4;

  -[HUCameraTimelapseController playerLayer](self, "playerLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 1);

  -[HUCameraTimelapseController imageLayer](self, "imageLayer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", 0);

}

- (void)updateToPlaybackPosition:(id)a3 forHighQualityClip:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0D31278], "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "clipPlaybackDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timelapseClipPositionForDate:inHighQualityClip:", v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[HUCameraTimelapseController setTimelapseVisibility:](self, "setTimelapseVisibility:", 0);
    -[HUCameraTimelapseController setHighQualityClip:](self, "setHighQualityClip:", v6);
    -[HUCameraTimelapseController currentClip](self, "currentClip");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "uniqueIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "clip");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "uniqueIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v11, "isEqual:", v13);

    if ((v14 & 1) == 0)
    {
      objc_msgSend(v9, "clip");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUCameraTimelapseController _updateTimelapseClip:withHighQualityClip:](self, "_updateTimelapseClip:withHighQualityClip:", v15, v6);

    }
    -[HUCameraTimelapseController setTimelapseVisibility:](self, "setTimelapseVisibility:", 1);
    objc_msgSend(v17, "clipPlaybackDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCameraTimelapseController seekToDate:](self, "seekToDate:", v16);

  }
  else
  {
    -[HUCameraTimelapseController setCurrentClip:](self, "setCurrentClip:", 0);
    -[HUCameraTimelapseController setTimelapseVisibility:](self, "setTimelapseVisibility:", 0);
  }

}

- (void)updateVideoBounds:(CGRect)a3
{
  double height;
  double width;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  NSObject *v14;
  int v15;
  double v16;
  __int16 v17;
  double v18;
  __int16 v19;
  double v20;
  __int16 v21;
  double v22;
  uint64_t v23;
  CGRect v24;
  CGRect v25;

  height = a3.size.height;
  width = a3.size.width;
  v23 = *MEMORY[0x1E0C80C00];
  -[HUCameraTimelapseController playerLayer](self, "playerLayer", a3.origin.x, a3.origin.y);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "superlayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v8 = CGRectGetMidX(v24) - width * 0.5;

  -[HUCameraTimelapseController playerLayer](self, "playerLayer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "superlayer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");
  v11 = CGRectGetMidY(v25) - height * 0.5;

  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setValue:forKey:", *MEMORY[0x1E0C9AE50], *MEMORY[0x1E0CD3160]);
  -[HUCameraTimelapseController playerLayer](self, "playerLayer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v8, v11, width, height);

  -[HUCameraTimelapseController imageLayer](self, "imageLayer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFrame:", v8, v11, width, height);

  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  HFLogForCategory();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    v15 = 134218752;
    v16 = v8;
    v17 = 2048;
    v18 = v11;
    v19 = 2048;
    v20 = width;
    v21 = 2048;
    v22 = height;
    _os_log_debug_impl(&dword_1B8E1E000, v14, OS_LOG_TYPE_DEBUG, "Updating timelapse video bounds :%.0f, %.0f, %.0f, %.0f", (uint8_t *)&v15, 0x2Au);
  }

}

- (void)hideAllViews
{
  NSObject *v3;
  uint8_t v4[16];

  HFLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1B8E1E000, v3, OS_LOG_TYPE_DEFAULT, "Hiding timelapse views", v4, 2u);
  }

  -[HUCameraTimelapseController setTimelapseVisibility:](self, "setTimelapseVisibility:", 0);
}

- (void)pauseTimelapseScrubbing
{
  -[HUCameraTimelapseController setTimelapseVisibility:](self, "setTimelapseVisibility:", 0);
}

- (void)seekToDate:(id)a3
{
  CMTime v4;
  CMTime time1;
  CMTime time2;
  CMTime v7;

  memset(&v7, 0, sizeof(v7));
  -[HUCameraTimelapseController cmTimeFromDate:](self, "cmTimeFromDate:", a3);
  -[HUCameraTimelapseController chaseTime](self, "chaseTime");
  time1 = v7;
  if (CMTimeCompare(&time1, &time2))
  {
    v4 = v7;
    -[HUCameraTimelapseController setChaseTime:](self, "setChaseTime:", &v4);
    if (!-[HUCameraTimelapseController isSeekInProgress](self, "isSeekInProgress"))
      -[HUCameraTimelapseController trySeekToChaseTime](self, "trySeekToChaseTime");
  }
}

- (void)trySeekToChaseTime
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const char *v12;
  BOOL v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (!-[HUCameraTimelapseController playerItemStatus](self, "playerItemStatus"))
  {
    HFLogForCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      goto LABEL_18;
    LOWORD(v26) = 0;
    v12 = "Not seeking because status is unknown.";
LABEL_10:
    _os_log_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v26, 2u);
    goto LABEL_18;
  }
  if (-[HUCameraTimelapseController playerItemStatus](self, "playerItemStatus") != 1)
  {
    HFLogForCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      goto LABEL_18;
    LOWORD(v26) = 0;
    v12 = "Not seeking because status is failed";
    goto LABEL_10;
  }
  -[HUCameraTimelapseController player](self, "player");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "asset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URL");
  v6 = objc_claimAutoreleasedReturnValue();

  -[HUCameraTimelapseController currentClip](self, "currentClip");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    goto LABEL_18;
  -[NSObject path](v6, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraTimelapseController currentClip](self, "currentClip");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "uniqueIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "UUIDString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "containsString:", v11) & 1) != 0)
  {

LABEL_12:
    HFLogForCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      -[HUCameraTimelapseController player](self, "player");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "currentItem");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "asset");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUCameraTimelapseController currentClip](self, "currentClip");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "uniqueIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138412546;
      v27 = v17;
      v28 = 2112;
      v29 = v19;
      _os_log_impl(&dword_1B8E1E000, v14, OS_LOG_TYPE_DEFAULT, "Seeking with current item:%@ for clip:%@", (uint8_t *)&v26, 0x16u);

    }
    -[HUCameraTimelapseController actuallySeekToTime](self, "actuallySeekToTime");
    goto LABEL_18;
  }
  v13 = -[HUCameraTimelapseController isPlayingHLSPlayerItem](self, "isPlayingHLSPlayerItem");

  if (v13)
    goto LABEL_12;
  HFLogForCategory();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    -[HUCameraTimelapseController player](self, "player");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "currentItem");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "asset");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCameraTimelapseController currentClip](self, "currentClip");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "uniqueIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 138412546;
    v27 = v23;
    v28 = 2112;
    v29 = v25;
    _os_log_error_impl(&dword_1B8E1E000, v20, OS_LOG_TYPE_ERROR, "Unable to seek due to mismatched item:%@ for clip:%@", (uint8_t *)&v26, 0x16u);

  }
LABEL_18:

}

- (void)actuallySeekToTime
{
  void *v3;
  __int128 v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  _QWORD v10[5];
  __int128 v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;

  -[HUCameraTimelapseController setSeekInProgress:](self, "setSeekInProgress:", 1);
  v13 = 0uLL;
  v14 = 0;
  -[HUCameraTimelapseController chaseTime](self, "chaseTime");
  -[HUCameraTimelapseController player](self, "player");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = 3221225472;
  v10[2] = __49__HUCameraTimelapseController_actuallySeekToTime__block_invoke;
  v10[3] = &unk_1E6F5F7B0;
  v11 = v13;
  v10[4] = self;
  v12 = v14;
  v8 = v13;
  v9 = v14;
  v10[0] = MEMORY[0x1E0C809B0];
  v6 = *MEMORY[0x1E0CA2E68];
  v7 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
  v4 = v6;
  v5 = v7;
  objc_msgSend(v3, "seekToTime:toleranceBefore:toleranceAfter:completionHandler:", &v8, &v6, &v4, v10);

}

void __49__HUCameraTimelapseController_actuallySeekToTime__block_invoke(uint64_t a1, int a2)
{
  void *v4;
  int32_t v5;
  NSObject *v6;
  _BOOL4 v7;
  CMTime time2;
  CMTime time1;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "setSeekInProgress:", 0);
  v4 = *(void **)(a1 + 32);
  if (v4)
    objc_msgSend(v4, "chaseTime");
  else
    memset(&time2, 0, sizeof(time2));
  time1 = *(CMTime *)(a1 + 40);
  v5 = CMTimeCompare(&time1, &time2);
  HFLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      LODWORD(time1.value) = 67109120;
      HIDWORD(time1.value) = a2;
      _os_log_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_DEFAULT, "Finished seeking. Previous seek request to complete. Completed current seek:%{BOOL}d", (uint8_t *)&time1, 8u);
    }

    objc_msgSend(*(id *)(a1 + 32), "trySeekToChaseTime");
  }
  else
  {
    if (v7)
    {
      LODWORD(time1.value) = 67109120;
      HIDWORD(time1.value) = a2;
      _os_log_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_DEFAULT, "Finished seeking. Completed current seek:%{BOOL}d", (uint8_t *)&time1, 8u);
    }

  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;
  uint8_t buf[4];
  HUCameraTimelapseController *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if ((void *)HUCameraTimelapseControllerContext == a6)
  {
    if (objc_msgSend(a3, "isEqual:", CFSTR("status"), a4, a5))
    {
      HFLogForCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = (void *)MEMORY[0x1E0CB37E8];
        -[HUCameraTimelapseController player](self, "player");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "numberWithInteger:", objc_msgSend(v9, "status"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v14 = self;
        v15 = 2112;
        v16 = v10;
        _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, "Player:%@ status changed:%@", buf, 0x16u);

      }
      -[HUCameraTimelapseController player](self, "player");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUCameraTimelapseController setPlayerItemStatus:](self, "setPlayerItemStatus:", objc_msgSend(v11, "status"));

    }
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)HUCameraTimelapseController;
    -[HUCameraTimelapseController observeValueForKeyPath:ofObject:change:context:](&v12, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[HUCameraTimelapseController player](self, "player");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("status"));

  objc_msgSend(MEMORY[0x1E0D31278], "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClipManager:", 0);

  v5.receiver = self;
  v5.super_class = (Class)HUCameraTimelapseController;
  -[HUCameraTimelapseController dealloc](&v5, sel_dealloc);
}

- (void)didDownloadVideoFileForClip:(id)a3 toURL:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__HUCameraTimelapseController_didDownloadVideoFileForClip_toURL___block_invoke;
  block[3] = &unk_1E6F4E020;
  block[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __65__HUCameraTimelapseController_didDownloadVideoFileForClip_toURL___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_loadPlayerForTimelapseClip:atLocation:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)foundVideoFileForClip:(id)a3 atURL:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__HUCameraTimelapseController_foundVideoFileForClip_atURL___block_invoke;
  block[3] = &unk_1E6F4E020;
  block[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __59__HUCameraTimelapseController_foundVideoFileForClip_atURL___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_loadPlayerForTimelapseClip:atLocation:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)failedToDownloadVideoFileForClip:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_error_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_ERROR, "Error fetching clip: %@", (uint8_t *)&v6, 0xCu);
  }

  -[HUCameraTimelapseController setDownloadState:](self, "setDownloadState:", 2);
  -[HUCameraTimelapseController setTimelapseVisibility:](self, "setTimelapseVisibility:", 0);

}

- (void)_loadPlayerForTimelapseClip:(id)a3 atLocation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  NSObject *v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HUCameraTimelapseController currentClip](self, "currentClip");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uniqueIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uniqueIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "hmf_isEqualToUUID:", v10);

  if ((v11 & 1) != 0)
  {
    -[HUCameraTimelapseController _loadPlayerFromLocation:](self, "_loadPlayerFromLocation:", v7);
  }
  else
  {
    HFLogForCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = 138412290;
      v14 = v6;
      _os_log_error_impl(&dword_1B8E1E000, v12, OS_LOG_TYPE_ERROR, "No longer need timelapse for clip: %@", (uint8_t *)&v13, 0xCu);
    }

  }
}

- (void)_loadPlayerFromLocation:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[HUCameraTimelapseController setDownloadState:](self, "setDownloadState:", 1);
  -[HUCameraTimelapseController setTimelapseVisibility:](self, "setTimelapseVisibility:", 1);
  -[HUCameraTimelapseController playerItemForURL:](self, "playerItemForURL:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[HUCameraTimelapseController player](self, "player");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "replaceCurrentItemWithPlayerItem:", v6);

}

- (AVPlayer)player
{
  return self->_player;
}

- (AVPlayerLayer)playerLayer
{
  return self->_playerLayer;
}

- (CALayer)imageLayer
{
  return self->_imageLayer;
}

- (NSArray)timelapseClips
{
  return self->_timelapseClips;
}

- (HMCameraClip)currentClip
{
  return self->_currentClip;
}

- (void)setCurrentClip:(id)a3
{
  objc_storeStrong((id *)&self->_currentClip, a3);
}

- (HMCameraProfile)cameraProfile
{
  return self->_cameraProfile;
}

- (void)setCameraProfile:(id)a3
{
  objc_storeStrong((id *)&self->_cameraProfile, a3);
}

- (BOOL)isSeekingToTime
{
  return self->_seekingToTime;
}

- (void)setSeekingToTime:(BOOL)a3
{
  self->_seekingToTime = a3;
}

- (NSMutableDictionary)cachedVideos
{
  return self->_cachedVideos;
}

- (void)setCachedVideos:(id)a3
{
  objc_storeStrong((id *)&self->_cachedVideos, a3);
}

- (NSCache)cachedPlayerItems
{
  return self->_cachedPlayerItems;
}

- (void)setCachedPlayerItems:(id)a3
{
  objc_storeStrong((id *)&self->_cachedPlayerItems, a3);
}

- (HMCameraClip)highQualityClip
{
  return self->_highQualityClip;
}

- (void)setHighQualityClip:(id)a3
{
  objc_storeStrong((id *)&self->_highQualityClip, a3);
}

- (BOOL)isSeekInProgress
{
  return self->_seekInProgress;
}

- (void)setSeekInProgress:(BOOL)a3
{
  self->_seekInProgress = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)chaseTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 104);
  return self;
}

- (void)setChaseTime:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_chaseTime.epoch = a3->var3;
  *(_OWORD *)&self->_chaseTime.value = v3;
}

- (int64_t)playerItemStatus
{
  return self->_playerItemStatus;
}

- (void)setPlayerItemStatus:(int64_t)a3
{
  self->_playerItemStatus = a3;
}

- (BOOL)isPlayingHLSPlayerItem
{
  return self->_playingHLSPlayerItem;
}

- (void)setPlayingHLSPlayerItem:(BOOL)a3
{
  self->_playingHLSPlayerItem = a3;
}

- (unint64_t)downloadState
{
  return self->_downloadState;
}

- (void)setDownloadState:(unint64_t)a3
{
  self->_downloadState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highQualityClip, 0);
  objc_storeStrong((id *)&self->_cachedPlayerItems, 0);
  objc_storeStrong((id *)&self->_cachedVideos, 0);
  objc_storeStrong((id *)&self->_cameraProfile, 0);
  objc_storeStrong((id *)&self->_currentClip, 0);
  objc_storeStrong((id *)&self->_timelapseClips, 0);
  objc_storeStrong((id *)&self->_imageLayer, 0);
  objc_storeStrong((id *)&self->_playerLayer, 0);
  objc_storeStrong((id *)&self->_player, 0);
}

@end
