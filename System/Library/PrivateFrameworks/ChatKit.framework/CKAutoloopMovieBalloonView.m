@implementation CKAutoloopMovieBalloonView

- (void)configureForMediaObject:(id)a3 previewWidth:(double)a4 orientation:(char)a5 hasInvisibleInkEffect:(BOOL)a6
{
  _BOOL8 v6;
  uint64_t v7;
  id v10;
  uint64_t v11;
  objc_super v12;

  v6 = a6;
  v7 = a5;
  v12.receiver = self;
  v12.super_class = (Class)CKAutoloopMovieBalloonView;
  v10 = a3;
  -[CKImageBalloonView configureForMediaObject:previewWidth:orientation:hasInvisibleInkEffect:](&v12, sel_configureForMediaObject_previewWidth_orientation_hasInvisibleInkEffect_, v10, v7, v6, a4);
  -[CKAutoloopMovieBalloonView setMediaObject:](self, "setMediaObject:", v10, v12.receiver, v12.super_class);
  v11 = objc_msgSend(v10, "isJellyfishVideo");

  -[CKAutoloopMovieBalloonView setIsJellyfishVideo:](self, "setIsJellyfishVideo:", v11);
}

+ (BOOL)isEnabled
{
  Class v2;

  v2 = NSClassFromString(CFSTR("ISWrappedAVPlayer"));
  if (v2)
    LOBYTE(v2) = NSClassFromString(CFSTR("ISVideoPlayerUIView")) != 0;
  return (char)v2;
}

+ (id)_autoloopAVAudioSessionQueue
{
  if (_autoloopAVAudioSessionQueue_onceToken != -1)
    dispatch_once(&_autoloopAVAudioSessionQueue_onceToken, &__block_literal_global_171);
  return (id)_autoloopAVAudioSessionQueue_queue;
}

void __58__CKAutoloopMovieBalloonView__autoloopAVAudioSessionQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.MobileSMS.AutoloopAVAudioSessionQueue", v2);
  v1 = (void *)_autoloopAVAudioSessionQueue_queue;
  _autoloopAVAudioSessionQueue_queue = (uint64_t)v0;

}

- (CKAutoloopMovieBalloonView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CKAutoloopMovieBalloonView *v7;
  void *v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  ISVideoPlayerUIView *videoPlayer;
  ISWrappedAVPlayer *v14;
  ISWrappedAVPlayer *avPlayer;
  ISWrappedAVPlayer *v16;
  void *v17;
  ISVideoPlayerUIView *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint8_t v27[8];
  id v28;
  objc_super v29;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v29.receiver = self;
  v29.super_class = (Class)CKAutoloopMovieBalloonView;
  v7 = -[CKImageBalloonView initWithFrame:](&v29, sel_initWithFrame_);
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0D78290], "auxiliarySession");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *MEMORY[0x1E0C89660];
    v28 = 0;
    objc_msgSend(v8, "setCategory:error:", v9, &v28);
    v10 = v28;
    if (v10 && IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v27 = 0;
        _os_log_impl(&dword_18DFCD000, v11, OS_LOG_TYPE_INFO, "Failed to change category shared autoloop audio session", v27, 2u);
      }

    }
    -[CKAutoloopMovieBalloonView setAudioSession:](v7, "setAudioSession:", v8);
    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0D78280]), "initWithFrame:", x, y, width, height);
    videoPlayer = v7->_videoPlayer;
    v7->_videoPlayer = (ISVideoPlayerUIView *)v12;

    v14 = (ISWrappedAVPlayer *)objc_alloc_init(MEMORY[0x1E0D78298]);
    avPlayer = v7->_avPlayer;
    v7->_avPlayer = v14;

    -[ISWrappedAVPlayer registerChangeObserver:context:](v7->_avPlayer, "registerChangeObserver:context:", v7, playerObservationContext);
    -[ISWrappedAVPlayer setLoopingEnabled:](v7->_avPlayer, "setLoopingEnabled:", 1);
    -[ISWrappedAVPlayer setPreventsSleepDuringVideoPlayback:](v7->_avPlayer, "setPreventsSleepDuringVideoPlayback:", 0);
    v16 = v7->_avPlayer;
    -[CKAutoloopMovieBalloonView audioSession](v7, "audioSession");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[ISWrappedAVPlayer setWrappedAudioSession:](v16, "setWrappedAudioSession:", v17);

    -[ISVideoPlayerUIView setVideoPlayer:](v7->_videoPlayer, "setVideoPlayer:", v7->_avPlayer);
    -[CKAutoloopMovieBalloonView startListeningToVideoPlayer](v7, "startListeningToVideoPlayer");
    v18 = v7->_videoPlayer;
    -[CKImageBalloonView tailMask](v7, "tailMask");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKAutoloopMovieBalloonView insertSubview:belowSubview:](v7, "insertSubview:belowSubview:", v18, v19);

    -[ISWrappedAVPlayer setDelegate:](v7->_avPlayer, "setDelegate:", v7);
    v20 = objc_alloc(MEMORY[0x1E0CEA658]);
    v21 = (void *)objc_msgSend(v20, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "unmuteButtonImage");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setImage:", v23);

    -[CKAutoloopMovieBalloonView setMuteButton:](v7, "setMuteButton:", v21);
    -[CKAutoloopMovieBalloonView addSubview:](v7, "addSubview:", v21);
    -[CKAutoloopMovieBalloonView setIsMuted:](v7, "setIsMuted:", 1);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addObserver:selector:name:object:", v7, sel__thermalStateDidChange_, *MEMORY[0x1E0CB3050], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addObserver:selector:name:object:", v7, sel_previewDidChange_, CFSTR("CKPreviewDidChangeNotification"), 0);

  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[CKAutoloopMovieBalloonView stopListeningToVideoPlayer](self, "stopListeningToVideoPlayer");
  v3.receiver = self;
  v3.super_class = (Class)CKAutoloopMovieBalloonView;
  -[CKImageBalloonView dealloc](&v3, sel_dealloc);
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)CKAutoloopMovieBalloonView;
  -[CKImageBalloonView description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKAutoloopMovieBalloonView mediaObject](self, "mediaObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ mediaObject: %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (void)layoutSubviews
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
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  void *v42;
  void *v43;
  double v44;
  double v45;
  void *v46;
  void *v47;
  double v48;
  double v49;
  CGFloat v50;
  void *v51;
  double v52;
  double v53;
  void *v54;
  double v55;
  void *v56;
  objc_super v57;
  CGRect v58;

  v57.receiver = self;
  v57.super_class = (Class)CKAutoloopMovieBalloonView;
  -[CKImageBalloonView layoutSubviews](&v57, sel_layoutSubviews);
  -[CKAutoloopMovieBalloonView videoPlayer](self, "videoPlayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKAutoloopMovieBalloonView bounds](self, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[CKImageBalloonView imageInsets](self, "imageInsets");
  objc_msgSend(v3, "setFrame:", v5 + v15, v7 + v12, v9 - (v15 + v13), v11 - (v12 + v14));

  -[CKAutoloopMovieBalloonView videoPlayer](self, "videoPlayer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CKImageBalloonView isScheduled](self, "isScheduled"))
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "scheduledImageBalloonAlpha");
    objc_msgSend(v16, "setAlpha:");

  }
  else
  {
    objc_msgSend(v16, "setAlpha:", 1.0);
  }

  -[CKAutoloopMovieBalloonView videoPlayer](self, "videoPlayer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CKImageBalloonView isScheduled](self, "isScheduled"))
  {
    -[CKImageBalloonView imageInsetMask](self, "imageInsetMask");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setMaskView:", v19);

  }
  else
  {
    objc_msgSend(v18, "setMaskView:", 0);
  }

  -[CKAutoloopMovieBalloonView muteButton](self, "muteButton");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[CKAutoloopMovieBalloonView muteButton](self, "muteButton");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "sizeToFit");

    v22 = *MEMORY[0x1E0C9D648];
    v23 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    -[CKAutoloopMovieBalloonView muteButton](self, "muteButton");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "bounds");
    v26 = v25;
    v28 = v27;

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "muteButtonImage");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "size");
    v32 = v31;

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "unmuteButtonImage");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "size");
    v36 = v35;

    if (v32 >= v36)
      v37 = v32;
    else
      v37 = v36;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "muteButtonImage");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "size");
    v41 = v40;

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "unmuteButtonImage");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "size");
    v45 = v44;

    if (v41 < v45)
      v41 = v45;
    -[CKAutoloopMovieBalloonView muteButton](self, "muteButton");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setFrame:", v22, v23, v26, v28);

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "verticalBalloonBadgeInset");
    v49 = v41 * 0.5 + v48;

    -[CKAutoloopMovieBalloonView bounds](self, "bounds");
    v50 = CGRectGetMaxX(v58) - v37 * 0.5;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "horizontalBalloonBadgeInset");
    v53 = v50 - v52;

    if (-[CKBalloonView orientation](self, "orientation") == 1)
    {
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "balloonMaskTailSizeForTailShape:", 2);
      v53 = v53 - v55;

    }
    -[CKAutoloopMovieBalloonView muteButton](self, "muteButton");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "setCenter:", v53, v49);

  }
}

- (void)setMediaObject:(id)a3
{
  id v5;
  id v6;

  v6 = a3;
  -[CKAutoloopMovieBalloonView mediaObject](self, "mediaObject");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v6)
  {
    objc_storeStrong((id *)&self->_mediaObject, a3);
    -[CKBalloonView setNeedsPrepareForDisplay](self, "setNeedsPrepareForDisplay");
  }

}

- (void)startListeningToVideoPlayer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  void *v9;
  void *v10;

  if (!-[CKAutoloopMovieBalloonView isListeningToVideoPlayer](self, "isListeningToVideoPlayer"))
  {
    -[CKAutoloopMovieBalloonView videoPlayer](self, "videoPlayer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "subviews");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[ISVideoPlayerUIView subviews](self->_videoPlayer, "subviews");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "firstObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "layer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "addObserver:forKeyPath:options:context:", self, CFSTR("readyForDisplay"), 1, 0);
    }
    -[CKAutoloopMovieBalloonView setIsListeningToVideoPlayer:](self, "setIsListeningToVideoPlayer:", 1);
  }
}

- (void)stopListeningToVideoPlayer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  if (-[CKAutoloopMovieBalloonView isListeningToVideoPlayer](self, "isListeningToVideoPlayer"))
  {
    -[CKAutoloopMovieBalloonView videoPlayer](self, "videoPlayer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "subviews");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[CKAutoloopMovieBalloonView videoPlayer](self, "videoPlayer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "subviews");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "firstObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "layer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "removeObserver:forKeyPath:", self, CFSTR("readyForDisplay"));
    }
    -[CKAutoloopMovieBalloonView setIsListeningToVideoPlayer:](self, "setIsListeningToVideoPlayer:", 0);
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8;
  id v9;
  char isKindOfClass;
  void *v11;
  int v12;
  _QWORD block[5];

  v8 = a5;
  v9 = a4;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v8, "objectForKey:", CFSTR("new"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "BOOLValue");

    if (v12)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __77__CKAutoloopMovieBalloonView_observeValueForKeyPath_ofObject_change_context___block_invoke;
      block[3] = &unk_1E274A208;
      block[4] = self;
      dispatch_async(MEMORY[0x1E0C80D38], block);
    }
  }

}

uint64_t __77__CKAutoloopMovieBalloonView_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint8_t v5[16];

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_18DFCD000, v2, OS_LOG_TYPE_INFO, "MoviePlayer is ready, clearing content", v5, 2u);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setContents:", 0);

  return objc_msgSend(*(id *)(a1 + 32), "setImageHidden:", 1);
}

- (void)prepareForReuse
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKAutoloopMovieBalloonView;
  -[CKImageBalloonView prepareForReuse](&v8, sel_prepareForReuse);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[CKAutoloopMovieBalloonView stopListeningToVideoPlayer](self, "stopListeningToVideoPlayer");
  -[CKAutoloopMovieBalloonView videoPlayer](self, "videoPlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMaskView:", 0);

  -[CKAutoloopMovieBalloonView videoPlayer](self, "videoPlayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlpha:", 1.0);

  -[CKAutoloopMovieBalloonView avPlayer](self, "avPlayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "replaceCurrentItemWithPlayerItem:", 0);

  -[CKAutoloopMovieBalloonView avPlayer](self, "avPlayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pause");

  -[CKAutoloopMovieBalloonView setIsMuted:](self, "setIsMuted:", 1);
  -[CKAutoloopMovieBalloonView setMediaObject:](self, "setMediaObject:", 0);
  -[CKAutoloopMovieBalloonView _removeSnapshot](self, "_removeSnapshot");
}

- (void)prepareForDisplay
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
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  BOOL v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)CKAutoloopMovieBalloonView;
  -[CKImageBalloonView prepareForDisplay](&v26, sel_prepareForDisplay);
  -[CKAutoloopMovieBalloonView stopListeningToVideoPlayer](self, "stopListeningToVideoPlayer");
  -[CKAutoloopMovieBalloonView videoPlayer](self, "videoPlayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

  -[CKAutoloopMovieBalloonView mediaObject](self, "mediaObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    if (-[CKAutoloopMovieBalloonView _shouldAutoPlay](self, "_shouldAutoPlay"))
    {
      -[CKAutoloopMovieBalloonView mediaObject](self, "mediaObject");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "fileURL");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      CKAVURLAssetForURL(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C8B300], "playerItemWithAsset:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKAutoloopMovieBalloonView avPlayer](self, "avPlayer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setLoopingEnabled:", 1);

      -[CKAutoloopMovieBalloonView avPlayer](self, "avPlayer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "replaceCurrentItemWithPlayerItem:", v8);

      -[ISWrappedAVPlayer setSuppressesAudioRendering:](self->_avPlayer, "setSuppressesAudioRendering:", 1);
      -[CKAutoloopMovieBalloonView avPlayer](self, "avPlayer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v12) = 1.0;
      objc_msgSend(v11, "setRate:", v12);

      if (-[CKAutoloopMovieBalloonView _shouldPauseInitialLooping](self, "_shouldPauseInitialLooping")
        || !-[CKAutoloopMovieBalloonView _thermalStateAcceptableForLooping](self, "_thermalStateAcceptableForLooping"))
      {
        -[CKAutoloopMovieBalloonView avPlayer](self, "avPlayer");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "pause");

      }
    }
    -[CKBalloonView invisibleInkEffectController](self, "invisibleInkEffectController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "effectView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKAutoloopMovieBalloonView videoPlayer](self, "videoPlayer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      -[CKAutoloopMovieBalloonView insertSubview:belowSubview:](self, "insertSubview:belowSubview:", v16, v15);
    }
    else
    {
      -[CKImageBalloonView tailMask](self, "tailMask");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKAutoloopMovieBalloonView insertSubview:belowSubview:](self, "insertSubview:belowSubview:", v16, v17);

    }
    -[CKAutoloopMovieBalloonView startListeningToVideoPlayer](self, "startListeningToVideoPlayer");

  }
  -[CKAutoloopMovieBalloonView muteButton](self, "muteButton");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    v19 = -[CKAutoloopMovieBalloonView isJellyfishVideo](self, "isJellyfishVideo");
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "theme");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v19)
      objc_msgSend(v21, "jellyfishMuteButtonColor");
    else
      objc_msgSend(v21, "autoloopMuteButtonColor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKAutoloopMovieBalloonView muteButton](self, "muteButton");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setTintColor:", v23);

    -[CKAutoloopMovieBalloonView muteButton](self, "muteButton");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKAutoloopMovieBalloonView bringSubviewToFront:](self, "bringSubviewToFront:", v25);

  }
}

- (void)prepareForAcknowledgementDisplay
{
  if (-[CKAutoloopMovieBalloonView isJellyfishVideo](self, "isJellyfishVideo"))
    -[CKAutoloopMovieBalloonView setHidden:](self, "setHidden:", 1);
}

- (void)prepareForAcknowledgementDismissal
{
  -[CKAutoloopMovieBalloonView setHidden:](self, "setHidden:", 0);
}

- (void)didMoveToWindow
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKAutoloopMovieBalloonView;
  -[CKImageBalloonView didMoveToWindow](&v5, sel_didMoveToWindow);
  -[CKAutoloopMovieBalloonView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CKAutoloopMovieBalloonView prepareForDisplay](self, "prepareForDisplay");
  }
  else
  {
    -[CKAutoloopMovieBalloonView avPlayer](self, "avPlayer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "replaceCurrentItemWithPlayerItem:", 0);

  }
}

- (void)tapGestureRecognized:(id)a3
{
  id v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CKAutoloopMovieBalloonView *v18;
  uint64_t v19;
  objc_super v20;
  objc_super v21;
  objc_super v22;
  CGPoint v23;
  CGPoint v24;
  CGRect v25;
  CGRect v26;

  v4 = a3;
  objc_msgSend(v4, "locationInView:", self);
  v6 = v5;
  v8 = v7;
  -[CKAutoloopMovieBalloonView muteButton](self, "muteButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "frame");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  if (!-[CKAutoloopMovieBalloonView _thermalStateAcceptableForLooping](self, "_thermalStateAcceptableForLooping"))
  {
    -[CKImageBalloonView tapGestureRecognized:](&v20, sel_tapGestureRecognized_, v4, self, CKAutoloopMovieBalloonView, v21.receiver, v21.super_class, v22.receiver, v22.super_class);
    goto LABEL_11;
  }
  if (-[CKAutoloopMovieBalloonView _shouldPauseInitialLooping](self, "_shouldPauseInitialLooping"))
  {
    kInitialAutoloopWasSuppressed = 1;
    if (-[CKAutoloopMovieBalloonView _shouldPresentQuickLookOnTap](self, "_shouldPresentQuickLookOnTap"))
    {
      v25.origin.x = v11 + -10.0;
      v25.origin.y = v13 + -10.0;
      v25.size.width = v15 + 20.0;
      v25.size.height = v17 + 20.0;
      v23.x = v6;
      v23.y = v8;
      if (!CGRectContainsPoint(v25, v23))
      {
        -[CKImageBalloonView tapGestureRecognized:](&v22, sel_tapGestureRecognized_, v4, v20.receiver, v20.super_class, v21.receiver, v21.super_class, self, CKAutoloopMovieBalloonView);
        goto LABEL_11;
      }
    }
    -[CKAutoloopMovieBalloonView prepareForDisplay](self, "prepareForDisplay");
    v18 = self;
    v19 = 0;
  }
  else
  {
    v26.origin.x = v11 + -10.0;
    v26.origin.y = v13 + -10.0;
    v26.size.width = v15 + 20.0;
    v26.size.height = v17 + 20.0;
    v24.x = v6;
    v24.y = v8;
    if (!CGRectContainsPoint(v26, v24))
    {
      -[CKImageBalloonView tapGestureRecognized:](&v21, sel_tapGestureRecognized_, v4, v20.receiver, v20.super_class, self, CKAutoloopMovieBalloonView, v22.receiver, v22.super_class);
      goto LABEL_11;
    }
    v19 = -[CKAutoloopMovieBalloonView isMuted](self, "isMuted") ^ 1;
    v18 = self;
  }
  -[CKAutoloopMovieBalloonView setIsMuted:](v18, "setIsMuted:", v19);
LABEL_11:

}

- (void)setIsMuted:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  char v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  _BOOL4 isMuted;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  ISWrappedAVPlayer *avPlayer;
  id v29;
  __int128 v30;
  uint64_t v31;
  __int128 v32;
  uint64_t v33;
  __int128 v34;
  uint64_t v35;
  _QWORD v36[4];
  id v37;
  CKAutoloopMovieBalloonView *v38;
  uint8_t buf[16];
  uint64_t v40;
  id v41;
  _QWORD block[5];
  id v43;

  if (self->_isMuted == a3)
    return;
  v3 = a3;
  self->_isMuted = a3;
  -[CKAutoloopMovieBalloonView audioSession](self, "audioSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "category");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v3)
  {

    v13 = *MEMORY[0x1E0C89690];
    if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0C89690]) & 1) == 0)
    {
      -[CKAutoloopMovieBalloonView audioSession](self, "audioSession");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = 0;
      objc_msgSend(v14, "setCategory:error:", v13, &v41);
      v15 = v41;

      if (v15 && IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18DFCD000, v16, OS_LOG_TYPE_INFO, "Failed to change category shared autoloop audio session to AVAudioSessionCategoryPlayback", buf, 2u);
        }

      }
    }
    -[CKAutoloopMovieBalloonView audioSession](self, "audioSession");
    v12 = objc_claimAutoreleasedReturnValue();
    -[NSObject audioSession](v12, "audioSession");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setActive:error:", 1, 0);

    goto LABEL_18;
  }
  v8 = *MEMORY[0x1E0C89660];
  v9 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0C89660]);

  if ((v9 & 1) == 0)
  {
    -[CKAutoloopMovieBalloonView audioSession](self, "audioSession");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = 0;
    objc_msgSend(v10, "setCategory:error:", v8, &v43);
    v7 = v43;

    if (v7 && IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v11, OS_LOG_TYPE_INFO, "Failed to change category shared autoloop audio session to AVAudioSessionCategoryAmbient", buf, 2u);
      }

    }
    objc_msgSend((id)objc_opt_class(), "_autoloopAVAudioSessionQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __41__CKAutoloopMovieBalloonView_setIsMuted___block_invoke;
    block[3] = &unk_1E274A208;
    block[4] = self;
    dispatch_async(v12, block);
LABEL_18:

  }
  -[ISWrappedAVPlayer setSuppressesAudioRendering:](self->_avPlayer, "setSuppressesAudioRendering:", v3);
  -[ISWrappedAVPlayer setActionAtItemEnd:](self->_avPlayer, "setActionAtItemEnd:", v3 ^ 1);
  isMuted = self->_isMuted;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (isMuted)
    objc_msgSend(v19, "muteButtonImage");
  else
    objc_msgSend(v19, "unmuteButtonImage");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEAD70], "transition");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setStyle:", 3);
  -[CKAutoloopMovieBalloonView muteButton](self, "muteButton");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "_setSymbolImage:withSymbolTransition:", v21, v22);

  if (!self->_isMuted)
  {
    -[CKAutoloopMovieBalloonView _removeSnapshot](self, "_removeSnapshot");
    -[CKAutoloopMovieBalloonView videoPlayer](self, "videoPlayer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "snapshotViewAfterScreenUpdates:", 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKAutoloopMovieBalloonView setSnapshotView:](self, "setSnapshotView:", v25);
    -[CKAutoloopMovieBalloonView videoPlayer](self, "videoPlayer");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKAutoloopMovieBalloonView insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", v25, v26);

    v27 = MEMORY[0x193FF3C24]("kCMTimeZero", CFSTR("CoreMedia"));
    v40 = *(_QWORD *)(v27 + 16);
    *(_OWORD *)buf = *(_OWORD *)v27;
    avPlayer = self->_avPlayer;
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __41__CKAutoloopMovieBalloonView_setIsMuted___block_invoke_84;
    v36[3] = &unk_1E274BE58;
    v37 = v25;
    v38 = self;
    v34 = *(_OWORD *)buf;
    v35 = v40;
    v32 = *(_OWORD *)buf;
    v33 = v40;
    v30 = *(_OWORD *)buf;
    v31 = v40;
    v29 = v25;
    -[ISWrappedAVPlayer seekToTime:toleranceBefore:toleranceAfter:completionHandler:](avPlayer, "seekToTime:toleranceBefore:toleranceAfter:completionHandler:", &v34, &v32, &v30, v36);

  }
  -[CKAutoloopMovieBalloonView setNeedsLayout](self, "setNeedsLayout", v30, v31);

}

void __41__CKAutoloopMovieBalloonView_setIsMuted___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "audioSession");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "audioSession");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setActive:withOptions:error:", 0, 1, 0);

}

void __41__CKAutoloopMovieBalloonView_setIsMuted___block_invoke_84(uint64_t a1)
{
  id v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  uint64_t v6;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __41__CKAutoloopMovieBalloonView_setIsMuted___block_invoke_2;
  v4[3] = &unk_1E274A108;
  v2 = *(id *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5 = v2;
  v6 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v4);

}

void __41__CKAutoloopMovieBalloonView_setIsMuted___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD v4[5];
  _QWORD v5[4];
  id v6;

  v2 = MEMORY[0x1E0C809B0];
  v3 = (void *)MEMORY[0x1E0CEABB0];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __41__CKAutoloopMovieBalloonView_setIsMuted___block_invoke_3;
  v5[3] = &unk_1E274A208;
  v6 = *(id *)(a1 + 32);
  v4[0] = v2;
  v4[1] = 3221225472;
  v4[2] = __41__CKAutoloopMovieBalloonView_setIsMuted___block_invoke_4;
  v4[3] = &unk_1E274A1B8;
  v4[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v3, "animateWithDuration:animations:completion:", v5, v4, 0.3);

}

uint64_t __41__CKAutoloopMovieBalloonView_setIsMuted___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __41__CKAutoloopMovieBalloonView_setIsMuted___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeSnapshot");
}

- (BOOL)_thermalStateAcceptableForLooping
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  _BOOL4 v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "thermalState");

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v6 = 134218240;
      v7 = v3;
      v8 = 1024;
      v9 = v3 < 2;
      _os_log_impl(&dword_18DFCD000, v4, OS_LOG_TYPE_INFO, "thermalState: %ld is acceptable: %{BOOL}d.", (uint8_t *)&v6, 0x12u);
    }

  }
  return v3 < 2;
}

- (void)_thermalStateDidChange:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__CKAutoloopMovieBalloonView__thermalStateDidChange___block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __53__CKAutoloopMovieBalloonView__thermalStateDidChange___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  int v5;
  const __CFString *v6;
  int v8;
  uint64_t v9;
  __int16 v10;
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v3, "thermalState");
      v5 = objc_msgSend(*(id *)(a1 + 32), "_thermalStateAcceptableForLooping");
      v6 = CFSTR("NO");
      if (v5)
        v6 = CFSTR("YES");
      v8 = 134218242;
      v9 = v4;
      v10 = 2112;
      v11 = v6;
      _os_log_impl(&dword_18DFCD000, v2, OS_LOG_TYPE_INFO, "Thermal state changed to %lu, setting loop playback to paused:%@", (uint8_t *)&v8, 0x16u);

    }
  }
  return objc_msgSend(*(id *)(a1 + 32), "prepareForDisplay");
}

- (BOOL)_applicationStateAcceptableForLooping
{
  return +[CKApplicationState isApplicationActive](CKApplicationState, "isApplicationActive");
}

- (void)_removeSnapshot
{
  void *v3;

  -[CKAutoloopMovieBalloonView snapshotView](self, "snapshotView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

  -[CKAutoloopMovieBalloonView setSnapshotView:](self, "setSnapshotView:", 0);
}

- (BOOL)_shouldAutoPlay
{
  void *v2;
  void *v3;
  int v4;
  int v5;
  NSObject *v6;
  const char *v7;
  uint8_t *v8;
  int v9;
  NSObject *v10;
  __int16 v12;
  __int16 v13;
  uint8_t buf[16];

  if (self->_mediaObject)
  {
    -[CKAutoloopMovieBalloonView mediaObject](self, "mediaObject");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "messageContext");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isSenderUnknown");

    v5 = IMOSLoggingEnabled();
    if (v4)
    {
      if (v5)
      {
        OSLogHandleForIMFoundationCategory();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          v13 = 0;
          v7 = "_shouldAutoPlay: NO because media object of view has context with unknown sender.";
          v8 = (uint8_t *)&v13;
LABEL_13:
          _os_log_impl(&dword_18DFCD000, v6, OS_LOG_TYPE_INFO, v7, v8, 2u);
          goto LABEL_14;
        }
        goto LABEL_14;
      }
    }
    else if (v5)
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v12 = 0;
        v7 = "_shouldAutoPlay: YES because everything seems to be fine.";
        v8 = (uint8_t *)&v12;
        goto LABEL_13;
      }
LABEL_14:

    }
    LOBYTE(v9) = v4 ^ 1;
    return v9;
  }
  v9 = IMOSLoggingEnabled();
  if (v9)
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DFCD000, v10, OS_LOG_TYPE_INFO, "_shouldAutoPlay: NO because view has no media object at all.", buf, 2u);
    }

    LOBYTE(v9) = 0;
  }
  return v9;
}

- (BOOL)_shouldPauseInitialLooping
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringForKey:", CFSTR("DisableLoopingFilenameKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CKAutoloopMovieBalloonView mediaObject](self, "mediaObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fileURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lastPathComponent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if ((kInitialAutoloopWasSuppressed & 1) != 0)
      v8 = 0;
    else
      v8 = objc_msgSend(v7, "isEqualToString:", v4);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)_shouldPresentQuickLookOnTap
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("DisableAutoloopTapToQuicklookKey"));

  return v3 ^ 1;
}

- (void)avPlayer:(id)a3 itemDidPlayToEnd:(id)a4
{
  if (!-[CKAutoloopMovieBalloonView isMuted](self, "isMuted", a3, a4))
    -[CKAutoloopMovieBalloonView setIsMuted:](self, "setIsMuted:", 1);
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v8;
  _BOOL4 v9;
  BOOL v10;
  _BOOL4 v11;
  _BOOL4 v12;
  void *v13;
  float v14;
  float v15;
  void *v16;
  double v17;
  id v18;

  v6 = a4;
  v8 = a3;
  if ((v6 & 2) != 0 && (void *)playerObservationContext == a5)
  {
    v18 = v8;
    v9 = -[CKAutoloopMovieBalloonView _shouldAutoPlay](self, "_shouldAutoPlay");
    v8 = v18;
    if (v9)
    {
      v10 = -[CKAutoloopMovieBalloonView _shouldPauseInitialLooping](self, "_shouldPauseInitialLooping");
      v8 = v18;
      if (!v10)
      {
        v11 = -[CKAutoloopMovieBalloonView _thermalStateAcceptableForLooping](self, "_thermalStateAcceptableForLooping");
        v8 = v18;
        if (v11)
        {
          v12 = -[CKAutoloopMovieBalloonView _applicationStateAcceptableForLooping](self, "_applicationStateAcceptableForLooping");
          v8 = v18;
          if (v12)
          {
            -[CKAutoloopMovieBalloonView avPlayer](self, "avPlayer");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "rate");
            v15 = v14;

            v8 = v18;
            if (v15 == 0.0)
            {
              -[CKAutoloopMovieBalloonView avPlayer](self, "avPlayer");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              LODWORD(v17) = 1.0;
              objc_msgSend(v16, "setRate:", v17);

              v8 = v18;
            }
          }
        }
      }
    }
  }

}

- (void)previewDidChange:(id)a3
{
  id v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  void *v12;
  CKMovieMediaObject *mediaObject;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v4, "object");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMediaObject transferGUID](self->_mediaObject, "transferGUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "transferGUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqualToString:", v9);

    if (v10)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          -[CKMediaObject transferGUID](self->_mediaObject, "transferGUID");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = 138412546;
          v16 = v7;
          v17 = 2112;
          v18 = v12;
          _os_log_impl(&dword_18DFCD000, v11, OS_LOG_TYPE_INFO, "Got updated preview %@ for %@", (uint8_t *)&v15, 0x16u);

        }
      }
      mediaObject = self->_mediaObject;
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "previewMaxWidth");
      -[CKImageBalloonView configureForMediaObject:previewWidth:orientation:](self, "configureForMediaObject:previewWidth:orientation:", mediaObject, 1);

    }
  }

}

- (CKMovieMediaObject)mediaObject
{
  return self->_mediaObject;
}

- (BOOL)isJellyfishVideo
{
  return self->_isJellyfishVideo;
}

- (void)setIsJellyfishVideo:(BOOL)a3
{
  self->_isJellyfishVideo = a3;
}

- (UIImageView)muteButton
{
  return self->_muteButton;
}

- (void)setMuteButton:(id)a3
{
  objc_storeStrong((id *)&self->_muteButton, a3);
}

- (ISVideoPlayerUIView)videoPlayer
{
  return self->_videoPlayer;
}

- (void)setVideoPlayer:(id)a3
{
  objc_storeStrong((id *)&self->_videoPlayer, a3);
}

- (ISWrappedAVPlayer)avPlayer
{
  return self->_avPlayer;
}

- (void)setAvPlayer:(id)a3
{
  objc_storeStrong((id *)&self->_avPlayer, a3);
}

- (ISWrappedAVAudioSession)audioSession
{
  return self->_audioSession;
}

- (void)setAudioSession:(id)a3
{
  objc_storeStrong((id *)&self->_audioSession, a3);
}

- (BOOL)isMuted
{
  return self->_isMuted;
}

- (UIView)snapshotView
{
  return self->_snapshotView;
}

- (void)setSnapshotView:(id)a3
{
  objc_storeStrong((id *)&self->_snapshotView, a3);
}

- (BOOL)isListeningToVideoPlayer
{
  return self->_isListeningToVideoPlayer;
}

- (void)setIsListeningToVideoPlayer:(BOOL)a3
{
  self->_isListeningToVideoPlayer = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotView, 0);
  objc_storeStrong((id *)&self->_audioSession, 0);
  objc_storeStrong((id *)&self->_avPlayer, 0);
  objc_storeStrong((id *)&self->_videoPlayer, 0);
  objc_storeStrong((id *)&self->_muteButton, 0);
  objc_storeStrong((id *)&self->_mediaObject, 0);
}

@end
