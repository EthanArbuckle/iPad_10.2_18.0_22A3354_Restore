@implementation ASCVideoView

- (ASCVideoView)initWithFrame:(CGRect)a3 videoURL:(id)a4 screenshotDisplayConfiguration:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  id v12;
  ASCVideoView *v13;
  ASCBorderedScreenshotView *v14;
  ASCBorderedScreenshotView *previewFrameArtwork;
  uint64_t v16;
  ASCScreenshotDisplayConfiguration *screenshotDisplayConfiguration;
  void *v18;
  void *v19;
  uint64_t v20;
  AVPlayer *player;
  uint64_t v22;
  AVPlayerLayer *playerLayer;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  objc_super v30;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11 = a4;
  v12 = a5;
  v30.receiver = self;
  v30.super_class = (Class)ASCVideoView;
  v13 = -[ASCVideoView initWithFrame:](&v30, sel_initWithFrame_, x, y, width, height);
  if (v13)
  {
    v14 = -[ASCBorderedScreenshotView initWithFrame:screenshotDisplayConfiguration:]([ASCBorderedScreenshotView alloc], "initWithFrame:screenshotDisplayConfiguration:", v12, x, y, width, height);
    previewFrameArtwork = v13->_previewFrameArtwork;
    v13->_previewFrameArtwork = v14;

    v16 = objc_msgSend(v12, "copy");
    screenshotDisplayConfiguration = v13->_screenshotDisplayConfiguration;
    v13->_screenshotDisplayConfiguration = (ASCScreenshotDisplayConfiguration *)v16;

    v18 = (void *)MEMORY[0x1E0C8B2E8];
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v11);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "playerWithURL:", v19);
    v20 = objc_claimAutoreleasedReturnValue();
    player = v13->_player;
    v13->_player = (AVPlayer *)v20;

    objc_msgSend(MEMORY[0x1E0C8B330], "playerLayerWithPlayer:", v13->_player);
    v22 = objc_claimAutoreleasedReturnValue();
    playerLayer = v13->_playerLayer;
    v13->_playerLayer = (AVPlayerLayer *)v22;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = *MEMORY[0x1E0C8AC48];
    -[AVPlayer currentItem](v13->_player, "currentItem");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addObserver:selector:name:object:", v13, sel_playerDidPlayToEndTime_, v25, v26);

    -[ASCVideoView addSubview:](v13, "addSubview:", v13->_previewFrameArtwork);
    -[ASCVideoView layer](v13, "layer");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addSublayer:", v13->_playerLayer);

    -[AVPlayerLayer setHidden:](v13->_playerLayer, "setHidden:", 1);
    -[ASCVideoView layer](v13, "layer");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setMasksToBounds:", 1);

    -[ASCVideoView setLayoutMargins:](v13, "setLayoutMargins:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
    -[ASCVideoView setUserInteractionEnabled:](v13, "setUserInteractionEnabled:", 0);
  }

  return v13;
}

- (ASCVideoView)initWithFrame:(CGRect)a3
{
  -[ASCVideoView doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);

  return 0;
}

- (ASCVideoView)initWithCoder:(id)a3
{
  -[ASCVideoView doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  -[ASCVideoView doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)ASCVideoView;
  -[ASCVideoView dealloc](&v4, sel_dealloc);
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)ASCVideoView;
  -[ASCVideoView layoutSubviews](&v16, sel_layoutSubviews);
  -[ASCVideoView screenshotDisplayConfiguration](self, "screenshotDisplayConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCVideoView bounds](self, "bounds");
  objc_msgSend(v3, "cornerRadiusForSize:", v4, v5);
  v7 = v6;
  -[ASCVideoView layer](self, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCornerRadius:", v7);

  -[ASCVideoView screenshotDisplayConfiguration](self, "screenshotDisplayConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cornerCurve");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCVideoView layer](self, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setCornerCurve:", v10);

  -[ASCVideoView screenshotDisplayConfiguration](self, "screenshotDisplayConfiguration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "maskedCorners");
  -[ASCVideoView layer](self, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setMaskedCorners:", v13);

  -[ASCVideoView layer](self, "layer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setMasksToBounds:", 1);

  -[ASCVideoView bounds](self, "bounds");
  -[ASCBorderedScreenshotView setFrame:](self->_previewFrameArtwork, "setFrame:");
  -[ASCVideoView bounds](self, "bounds");
  -[AVPlayerLayer setFrame:](self->_playerLayer, "setFrame:");
}

- (CGSize)preferredVideoSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  v4 = *MEMORY[0x1E0DC49E8];
  v3 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
  v5 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
  v6 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  -[ASCVideoView bounds](self, "bounds");
  v8 = v7 - (v3 + v6);
  -[ASCVideoView bounds](self, "bounds");
  v10 = v9 - (v4 + v5);
  v11 = v8;
  result.height = v10;
  result.width = v11;
  return result;
}

- (BOOL)isMuted
{
  void *v2;
  char v3;

  -[ASCVideoView player](self, "player");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isMuted");

  return v3;
}

- (void)setMuted:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[ASCVideoView player](self, "player");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMuted:", v3);

}

- (void)setImage:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[ASCVideoView previewFrameArtwork](self, "previewFrameArtwork");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "artworkView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImage:", v4);

}

- (void)playVideo
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[ASCVideoView player](self, "player");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[ASCVideoView playerLayer](self, "playerLayer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setHidden:", 0);

    -[ASCVideoView previewFrameArtwork](self, "previewFrameArtwork");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHidden:", 1);

    -[ASCVideoView player](self, "player");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "play");

    self->_isPlaying = 1;
    -[ASCVideoView delegate](self, "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "videoView:videoStateDidChange:", self, 0);

  }
}

- (void)pauseVideo
{
  void *v3;
  void *v4;
  id v5;

  -[ASCVideoView player](self, "player");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[ASCVideoView player](self, "player");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pause");

    self->_isPlaying = 0;
    -[ASCVideoView delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "videoView:videoStateDidChange:", self, 1);

  }
}

- (void)resetVideo
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  CMTime v8;

  -[ASCVideoView player](self, "player");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[ASCVideoView playerLayer](self, "playerLayer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setHidden:", 1);

    -[ASCVideoView previewFrameArtwork](self, "previewFrameArtwork");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHidden:", 0);

    -[ASCVideoView player](self, "player");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pause");

    -[ASCVideoView player](self, "player");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    CMTimeMakeWithSeconds(&v8, 0.0, 1);
    objc_msgSend(v7, "seekToTime:", &v8);

    self->_isPlaying = 0;
  }
}

- (void)toggleIsPlaying
{
  if (-[ASCVideoView isPlaying](self, "isPlaying"))
    -[ASCVideoView pauseVideo](self, "pauseVideo");
  else
    -[ASCVideoView playVideo](self, "playVideo");
}

- (void)playerDidPlayToEndTime:(id)a3
{
  void *v4;
  void *v5;
  CMTime v6;

  -[ASCVideoView delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "videoView:videoStateDidChange:", self, 2);

  if (-[ASCVideoView isLoopingEnabled](self, "isLoopingEnabled"))
  {
    -[ASCVideoView player](self, "player");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    CMTimeMakeWithSeconds(&v6, 0.0, 1);
    objc_msgSend(v5, "seekToTime:", &v6);

    -[ASCVideoView playVideo](self, "playVideo");
  }
  else
  {
    -[ASCVideoView resetVideo](self, "resetVideo");
  }
}

- (ASCScreenshotDisplayConfiguration)screenshotDisplayConfiguration
{
  return self->_screenshotDisplayConfiguration;
}

- (ASCBorderedScreenshotView)previewFrameArtwork
{
  return self->_previewFrameArtwork;
}

- (AVPlayer)player
{
  return self->_player;
}

- (AVPlayerLayer)playerLayer
{
  return self->_playerLayer;
}

- (ASCVideoViewDelegate)delegate
{
  return (ASCVideoViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isPlaying
{
  return self->_isPlaying;
}

- (BOOL)isLoopingEnabled
{
  return self->_loopingEnabled;
}

- (void)setLoopingEnabled:(BOOL)a3
{
  self->_loopingEnabled = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_playerLayer, 0);
  objc_storeStrong((id *)&self->_player, 0);
  objc_storeStrong((id *)&self->_previewFrameArtwork, 0);
  objc_storeStrong((id *)&self->_screenshotDisplayConfiguration, 0);
}

@end
