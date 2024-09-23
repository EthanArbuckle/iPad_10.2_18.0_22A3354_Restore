@implementation ICMovieController

+ (void)stopIfPlaying
{
  id v2;

  if (sDidCreateSharedController == 1)
  {
    objc_msgSend(a1, "sharedController");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stopIfPlaying");

  }
}

+ (void)pauseIfPlaying
{
  id v2;

  if (sDidCreateSharedController == 1)
  {
    objc_msgSend(a1, "sharedController");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "pauseIfPlaying");

  }
}

+ (BOOL)isFullScreen
{
  void *v2;
  char v3;

  if (sDidCreateSharedController != 1)
    return 0;
  objc_msgSend(a1, "sharedController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isFullScreen");

  return v3;
}

+ (ICMovieController)sharedController
{
  if (s_onceToken != -1)
    dispatch_once(&s_onceToken, &__block_literal_global_26);
  return (ICMovieController *)(id)sharedController_s_instance;
}

void __37__ICMovieController_sharedController__block_invoke()
{
  ICMovieController *v0;
  void *v1;

  v0 = objc_alloc_init(ICMovieController);
  v1 = (void *)sharedController_s_instance;
  sharedController_s_instance = (uint64_t)v0;

  sDidCreateSharedController = 1;
}

- (void)dealloc
{
  objc_super v3;

  -[ICMovieController stopIfPlaying](self, "stopIfPlaying");
  -[ICMovieController setMoviePlayerController:](self, "setMoviePlayerController:", 0);
  v3.receiver = self;
  v3.super_class = (Class)ICMovieController;
  -[ICMovieController dealloc](&v3, sel_dealloc);
}

- (id)ic_viewControllerManager
{
  void *v2;
  void *v3;

  -[ICMovieController activeMovieAttachmentView](self, "activeMovieAttachmentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ic_viewControllerManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)updatePlayer
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v3 = (void *)MEMORY[0x1E0C8B300];
  -[ICMovieController activeAsset](self, "activeAsset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "playerItemWithAsset:", v4);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C8B2E8], "playerWithPlayerItem:", v14);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICMovieController moviePlayerController](self, "moviePlayerController");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    -[ICMovieController moviePlayerController](self, "moviePlayerController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "player");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "currentItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "asset");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICMovieController activeAsset](self, "activeAsset");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11 != v12)
    {
      -[ICMovieController moviePlayerController](self, "moviePlayerController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setPlayer:", v5);

    }
  }

}

- (BOOL)prepareForPlayback
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v22;

  -[ICMovieController activeMovieAttachmentView](self, "activeMovieAttachmentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attachment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attachmentModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isReadyToPresent");

  if (v6)
  {
    v7 = (void *)objc_opt_new();
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "setDelegate:", self);
      -[ICMovieController activeMovieAttachmentView](self, "activeMovieAttachmentView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setAllowsPictureInPicturePlayback:", objc_msgSend(v9, "allowsPictureInPicture"));

      objc_msgSend(v8, "setAllowsEnteringFullScreen:", objc_msgSend(MEMORY[0x1E0DC3708], "ic_isVision") ^ 1);
      -[ICMovieController setMoviePlayerController:](self, "setMoviePlayerController:", v8);
      -[ICMovieController activeMovieAttachmentView](self, "activeMovieAttachmentView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "shouldPlayFullscreenOnly");

      if ((v11 & 1) == 0)
      {
        objc_msgSend(v8, "view");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICMovieController activeMovieAttachmentView](self, "activeMovieAttachmentView");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "bounds");
        objc_msgSend(v12, "setFrame:");

        -[ICMovieController activeMovieAttachmentView](self, "activeMovieAttachmentView");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "view");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addSubview:", v15);

      }
      -[ICMovieController activeMovieAttachmentView](self, "activeMovieAttachmentView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setIcaxIsShowingPlayer:", 1);

      LODWORD(v16) = *MEMORY[0x1E0DC4578];
      objc_msgSend(v8, "view");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      UIAccessibilityPostNotification((UIAccessibilityNotifications)v16, v17);

    }
    objc_msgSend(MEMORY[0x1E0C89AE8], "sharedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = *MEMORY[0x1E0C89690];
    v22 = 0;
    if ((objc_msgSend(v18, "setCategory:error:", v19, &v22) & 1) == 0)
    {
      v20 = os_log_create("com.apple.notes", "UI");
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        -[ICMovieController prepareForPlayback].cold.1(v20);

    }
    -[ICMovieController updatePlayer](self, "updatePlayer");

  }
  return v6;
}

- (void)play
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  ICMovieController *v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICMovieController activeMovieAttachmentView](self, "activeMovieAttachmentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attachment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("ICMovieAttachmentViewWillPlayMovieNotification"), v5);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0D638A0];
  v23 = *MEMORY[0x1E0D63898];
  -[ICMovieController activeMovieAttachmentView](self, "activeMovieAttachmentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "attachment");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:userInfo:", v7, 0, v10);

  -[ICMovieController moviePlayerController](self, "moviePlayerController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "player");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setUsesExternalPlaybackWhileExternalScreenIsActive:", 1);
  v13 = -[ICMovieController playbackForPreview](self, "playbackForPreview");
  -[ICMovieController activeMovieAttachmentView](self, "activeMovieAttachmentView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v9) = objc_msgSend(v14, "shouldPlayFullscreenOnly");

  if (!(_DWORD)v9 || v13)
  {
    objc_msgSend(v12, "play");
  }
  else
  {
    -[ICMovieController activeMovieAttachmentView](self, "activeMovieAttachmentView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setUserInteractionEnabled:", 0);

    -[ICMovieController activeMovieAttachmentView](self, "activeMovieAttachmentView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "window");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "rootViewController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICMovieController moviePlayerController](self, "moviePlayerController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __25__ICMovieController_play__block_invoke;
    v20[3] = &unk_1EA7DD498;
    v21 = v12;
    v22 = self;
    objc_msgSend(v18, "presentViewController:animated:completion:", v19, 1, v20);

  }
}

void __25__ICMovieController_play__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "play");
  objc_msgSend(*(id *)(a1 + 40), "activeMovieAttachmentView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setUserInteractionEnabled:", 1);

}

- (void)pauseIfPlaying
{
  void *v2;
  id v3;

  -[ICMovieController moviePlayerController](self, "moviePlayerController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "player");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "pause");
}

- (void)stopIfPlaying
{
  void *v2;
  void *v3;
  __int128 v4;
  uint64_t v5;

  -[ICMovieController moviePlayerController](self, "moviePlayerController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "player");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "pause");
  v4 = *MEMORY[0x1E0CA2E68];
  v5 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
  objc_msgSend(v3, "seekToTime:", &v4);

}

- (void)moviePlayerTapped
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  float v11;
  float v12;
  ICMovieController *v13;
  void *v14;
  void *v15;
  float v16;
  float v17;

  -[ICMovieController moviePlayerController](self, "moviePlayerController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "player");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "asset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICMovieController activeAsset](self, "activeAsset");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICMovieController moviePlayerController](self, "moviePlayerController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v6 == v7)
  {

    v13 = self;
    if (v9)
    {
      -[ICMovieController moviePlayerController](self, "moviePlayerController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "player");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "rate");
      v17 = v16;

      if (v17 != 0.0)
      {
        -[ICMovieController pauseIfPlaying](self, "pauseIfPlaying");
        return;
      }
LABEL_9:
      -[ICMovieController play](self, "play");
      return;
    }
  }
  else
  {
    objc_msgSend(v8, "player");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "rate");
    v12 = v11;

    if (v12 != 0.0)
      -[ICMovieController stopIfPlaying](self, "stopIfPlaying");
    v13 = self;
  }
  if (-[ICMovieController prepareForPlayback](v13, "prepareForPlayback"))
    goto LABEL_9;
}

- (void)setActiveMovieAttachmentView:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  ICMovieAttachmentView *v10;

  v10 = (ICMovieAttachmentView *)a3;
  if (self->_activeMovieAttachmentView != v10)
  {
    -[ICMovieController stopIfPlaying](self, "stopIfPlaying");
    -[ICMovieController setPlaybackForPreview:](self, "setPlaybackForPreview:", 0);
    -[ICMovieController moviePlayerController](self, "moviePlayerController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeFromSuperview");

    -[ICMovieController setMoviePlayerController:](self, "setMoviePlayerController:", 0);
    objc_storeStrong((id *)&self->_activeMovieAttachmentView, a3);
    -[ICMovieAttachmentView attachment](v10, "attachment");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "attachmentModel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "asset");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICMovieController setActiveAsset:](self, "setActiveAsset:", v9);

  }
}

- (void)playerViewController:(id)a3 willBeginFullScreenPresentationWithAnimationCoordinator:(id)a4
{
  -[ICMovieController setIsFullScreen:](self, "setIsFullScreen:", 1, a4);
}

- (void)playerViewController:(id)a3 willEndFullScreenPresentationWithAnimationCoordinator:(id)a4
{
  -[ICMovieController setIsFullScreen:](self, "setIsFullScreen:", 0, a4);
}

- (ICMovieAttachmentView)activeMovieAttachmentView
{
  return self->_activeMovieAttachmentView;
}

- (AVAsset)activeAsset
{
  return self->_activeAsset;
}

- (void)setActiveAsset:(id)a3
{
  objc_storeStrong((id *)&self->_activeAsset, a3);
}

- (AVPlayerViewController)moviePlayerController
{
  return self->_moviePlayerController;
}

- (void)setMoviePlayerController:(id)a3
{
  objc_storeStrong((id *)&self->_moviePlayerController, a3);
}

- (BOOL)playbackForPreview
{
  return self->_playbackForPreview;
}

- (void)setPlaybackForPreview:(BOOL)a3
{
  self->_playbackForPreview = a3;
}

- (BOOL)isFullScreen
{
  return self->_isFullScreen;
}

- (void)setIsFullScreen:(BOOL)a3
{
  self->_isFullScreen = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_moviePlayerController, 0);
  objc_storeStrong((id *)&self->_activeAsset, 0);
  objc_storeStrong((id *)&self->_activeMovieAttachmentView, 0);
}

- (void)prepareForPlayback
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DD7B0000, log, OS_LOG_TYPE_ERROR, "Unable to set category for audio session", v1, 2u);
}

@end
