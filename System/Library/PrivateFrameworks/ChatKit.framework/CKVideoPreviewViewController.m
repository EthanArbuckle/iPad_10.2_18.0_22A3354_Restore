@implementation CKVideoPreviewViewController

- (CKVideoPreviewViewController)init
{
  CKVideoPreviewViewController *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CKVideoPreviewViewController;
  v2 = -[CKVideoPreviewViewController init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C8B330], "layer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKVideoPreviewViewController setAvPlayerLayer:](v2, "setAvPlayerLayer:", v3);

    -[CKVideoPreviewViewController avPlayerLayer](v2, "avPlayerLayer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setVideoGravity:", *MEMORY[0x1E0C8A6E0]);

  }
  return v2;
}

- (void)loadView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKVideoPreviewViewController;
  -[CKVideoPreviewViewController loadView](&v8, sel_loadView);
  -[CKVideoPreviewViewController avPlayerLayer](self, "avPlayerLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKVideoPreviewViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  objc_msgSend(v3, "setFrame:");

  -[CKVideoPreviewViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKVideoPreviewViewController avPlayerLayer](self, "avPlayerLayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "insertSublayer:atIndex:", v7, 0);

  -[CKVideoPreviewViewController setNeedsStatusBarAppearanceUpdate](self, "setNeedsStatusBarAppearanceUpdate");
}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (void)setVideoFileURL:(id)a3
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
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  __int128 v22;
  uint64_t v23;

  if (a3)
  {
    CKAVURLAssetForURL(a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C8B300], "playerItemWithAsset:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKVideoPreviewViewController setAvPlayerItem:](self, "setAvPlayerItem:", v5);

    v6 = (void *)MEMORY[0x1E0C8B2E8];
    -[CKVideoPreviewViewController avPlayerItem](self, "avPlayerItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "playerWithPlayerItem:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKVideoPreviewViewController setAvPlayer:](self, "setAvPlayer:", v8);

    -[CKVideoPreviewViewController avPlayer](self, "avPlayer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKVideoPreviewViewController avPlayerLayer](self, "avPlayerLayer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setPlayer:", v9);

    -[CKVideoPreviewViewController avPlayer](self, "avPlayer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setActionAtItemEnd:", 1);

    -[CKVideoPreviewViewController avPlayer](self, "avPlayer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = MEMORY[0x193FF3C24]("CMTimeZero", CFSTR("CoreMedia"));
    v14 = *(_QWORD *)(v13 + 16);
    v22 = *(_OWORD *)v13;
    v23 = v14;
    objc_msgSend(v12, "seekToTime:", &v22);

    -[CKVideoPreviewViewController avPlayerLayer](self, "avPlayerLayer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:forKeyPath:options:context:", self, CFSTR("readyForDisplay"), 5, &CKVideoPlayerLayerContext);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = *MEMORY[0x1E0C8AC48];
    -[CKVideoPreviewViewController avPlayerItem](self, "avPlayerItem");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObserver:selector:name:object:", self, sel_videoDidReachEnd_, v17, v18);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = *MEMORY[0x1E0C8AC58];
    -[CKVideoPreviewViewController avPlayerItem](self, "avPlayerItem");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObserver:selector:name:object:", self, sel_videoDidReachEnd_, v20, v21);

  }
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[AVPlayerLayer removeObserver:forKeyPath:context:](self->_avPlayerLayer, "removeObserver:forKeyPath:context:", self, CFSTR("readyForDisplay"), &CKVideoPlayerLayerContext);
  -[AVPlayerLayer removeFromSuperlayer](self->_avPlayerLayer, "removeFromSuperlayer");
  v4.receiver = self;
  v4.super_class = (Class)CKVideoPreviewViewController;
  -[CKVideoPreviewViewController dealloc](&v4, sel_dealloc);
}

- (BOOL)isPlaying
{
  float v2;

  -[AVPlayer rate](self->_avPlayer, "rate");
  return v2 != 0.0;
}

- (BOOL)togglePlayPause
{
  BOOL v3;

  v3 = -[CKVideoPreviewViewController isPlaying](self, "isPlaying");
  if (v3)
    -[CKVideoPreviewViewController pause](self, "pause");
  else
    -[CKVideoPreviewViewController play](self, "play");
  return !v3;
}

- (void)play
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[5];
  __int128 v8;
  uint64_t v9;

  if (-[CKVideoPreviewViewController reachedEnd](self, "reachedEnd"))
  {
    -[CKVideoPreviewViewController setReachedEnd:](self, "setReachedEnd:", 0);
    -[CKVideoPreviewViewController avPlayer](self, "avPlayer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = MEMORY[0x193FF3C24]("CMTimeZero", CFSTR("CoreMedia"));
    v5 = *(_QWORD *)(v4 + 16);
    v8 = *(_OWORD *)v4;
    v9 = v5;
    objc_msgSend(v3, "seekToTime:", &v8);

  }
  +[CKAudioSessionController shareInstance](CKAudioSessionController, "shareInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __36__CKVideoPreviewViewController_play__block_invoke;
  v7[3] = &unk_1E274A208;
  v7[4] = self;
  objc_msgSend(v6, "activateWithOptions:completion:", 1, v7);

}

void __36__CKVideoPreviewViewController_play__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "avPlayer");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "play");

}

- (void)pause
{
  void *v2;
  id v3;

  -[CKVideoPreviewViewController avPlayer](self, "avPlayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pause");

  +[CKAudioSessionController shareInstance](CKAudioSessionController, "shareInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deactivate");

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  BOOL v7;
  id v8;
  objc_super v9;

  if (a6 != &CKVideoPlayerLayerContext)
  {
    v9.receiver = self;
    v9.super_class = (Class)CKVideoPreviewViewController;
    -[CKVideoPreviewViewController observeValueForKeyPath:ofObject:change:context:](&v9, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
    return;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("readyForDisplay"), a4, a5))
  {
    -[CKVideoPreviewViewController avPlayerLayer](self, "avPlayerLayer");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isReadyForDisplay"))
    {
      v7 = -[CKVideoPreviewViewController isPlaying](self, "isPlaying");

      if (v7)
        return;
      -[CKVideoPreviewViewController videoPreviewDelegate](self, "videoPreviewDelegate");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "ckVideoPreviewViewControllerReady:", self);
    }

  }
}

- (void)videoDidReachEnd:(id)a3
{
  void *v4;
  id v5;

  -[CKVideoPreviewViewController setReachedEnd:](self, "setReachedEnd:", 1);
  +[CKAudioSessionController shareInstance](CKAudioSessionController, "shareInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deactivate");

  -[CKVideoPreviewViewController videoPreviewDelegate](self, "videoPreviewDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ckVideoPreviewViewControllerFinishedPlaying:", self);

}

- (CKVideoPreviewViewControllerDelegate)videoPreviewDelegate
{
  return (CKVideoPreviewViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_videoPreviewDelegate);
}

- (void)setVideoPreviewDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_videoPreviewDelegate, a3);
}

- (BOOL)redisplayStatusBar
{
  return self->_redisplayStatusBar;
}

- (void)setRedisplayStatusBar:(BOOL)a3
{
  self->_redisplayStatusBar = a3;
}

- (AVPlayerItem)avPlayerItem
{
  return self->_avPlayerItem;
}

- (void)setAvPlayerItem:(id)a3
{
  objc_storeStrong((id *)&self->_avPlayerItem, a3);
}

- (AVPlayer)avPlayer
{
  return self->_avPlayer;
}

- (void)setAvPlayer:(id)a3
{
  objc_storeStrong((id *)&self->_avPlayer, a3);
}

- (AVPlayerLayer)avPlayerLayer
{
  return self->_avPlayerLayer;
}

- (void)setAvPlayerLayer:(id)a3
{
  objc_storeStrong((id *)&self->_avPlayerLayer, a3);
}

- (BOOL)reachedEnd
{
  return self->_reachedEnd;
}

- (void)setReachedEnd:(BOOL)a3
{
  self->_reachedEnd = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avPlayerLayer, 0);
  objc_storeStrong((id *)&self->_avPlayer, 0);
  objc_storeStrong((id *)&self->_avPlayerItem, 0);
  objc_destroyWeak((id *)&self->_videoPreviewDelegate);
}

@end
