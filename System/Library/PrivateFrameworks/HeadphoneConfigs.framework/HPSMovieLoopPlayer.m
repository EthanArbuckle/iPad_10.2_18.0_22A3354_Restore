@implementation HPSMovieLoopPlayer

- (HPSMovieLoopPlayer)initWithFrame:(CGRect)a3 urlForResource:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  HPSMovieLoopPlayer *v11;
  uint64_t v12;
  AVPlayerLayer *playerLayer;
  void *v14;
  objc_super v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HPSMovieLoopPlayer;
  v11 = -[HPSMovieLoopPlayer initWithFrame:](&v16, sel_initWithFrame_, x, y, width, height);
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0C8B330], "playerLayerWithPlayer:", 0);
    v12 = objc_claimAutoreleasedReturnValue();
    playerLayer = v11->_playerLayer;
    v11->_playerLayer = (AVPlayerLayer *)v12;

    objc_storeStrong((id *)&v11->_url, a4);
    v11->_desiredBounds.origin.x = 0.0;
    v11->_desiredBounds.origin.y = 0.0;
    v11->_desiredBounds.size.width = width;
    v11->_desiredBounds.size.height = height;
    -[HPSMovieLoopPlayer layer](v11, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addSublayer:", v11->_playerLayer);

  }
  return v11;
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (void)load
{
  void *v3;
  AVQueuePlayer *v4;
  AVQueuePlayer *videoPlayer;
  AVQueuePlayer *v6;
  void *v7;
  void *v8;
  AVQueuePlayer *v9;
  id v10;
  void *v11;
  void *v12;
  AVPlayerLooper *v13;
  AVPlayerLooper *playerLooper;
  void *v15;
  __int128 v16;
  uint64_t v17;

  objc_msgSend(MEMORY[0x1E0C89AE8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCategory:withOptions:error:", *MEMORY[0x1E0C89660], 1, 0);

  v4 = (AVQueuePlayer *)objc_opt_new();
  videoPlayer = self->_videoPlayer;
  self->_videoPlayer = v4;

  -[AVQueuePlayer setMuted:](self->_videoPlayer, "setMuted:", 1);
  -[AVQueuePlayer setAllowsExternalPlayback:](self->_videoPlayer, "setAllowsExternalPlayback:", 0);
  v6 = self->_videoPlayer;
  -[HPSMovieLoopPlayer playerLayer](self, "playerLayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPlayer:", v6);

  -[HPSMovieLoopPlayer showVideoPlayer](self, "showVideoPlayer");
  v8 = (void *)MEMORY[0x1E0C8B338];
  v9 = self->_videoPlayer;
  v10 = objc_alloc(MEMORY[0x1E0C8B300]);
  -[HPSMovieLoopPlayer url](self, "url");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithURL:", v11);
  objc_msgSend(v8, "playerLooperWithPlayer:templateItem:", v9, v12);
  v13 = (AVPlayerLooper *)objc_claimAutoreleasedReturnValue();
  playerLooper = self->_playerLooper;
  self->_playerLooper = v13;

  -[HPSMovieLoopPlayer videoPlayer](self, "videoPlayer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = *MEMORY[0x1E0CA2E68];
  v17 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
  objc_msgSend(v15, "seekToTime:", &v16);

}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  void *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)HPSMovieLoopPlayer;
  -[HPSMovieLoopPlayer layoutSubviews](&v15, sel_layoutSubviews);
  -[HPSMovieLoopPlayer playerLayer](self, "playerLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HPSMovieLoopPlayer desiredBounds](self, "desiredBounds");
  objc_msgSend(v3, "setBounds:");

  -[HPSMovieLoopPlayer layer](self, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMasksToBounds:", 0);

  -[HPSMovieLoopPlayer layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCornerRadius:", 0.0);

  -[HPSMovieLoopPlayer layer](self, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v7 * 0.5;
  -[HPSMovieLoopPlayer layer](self, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  v11 = v10 * 0.5;
  -[HPSMovieLoopPlayer playerLayer](self, "playerLayer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setPosition:", v8, v11);

  v13 = *MEMORY[0x1E0C8A6E0];
  -[HPSMovieLoopPlayer playerLayer](self, "playerLayer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setVideoGravity:", v13);

}

- (void)showVideoPlayer
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __37__HPSMovieLoopPlayer_showVideoPlayer__block_invoke;
  v2[3] = &unk_1EA29A770;
  v2[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v2, 0.15);
}

void __37__HPSMovieLoopPlayer_showVideoPlayer__block_invoke(uint64_t a1)
{
  double v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "playerLayer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v1) = 1.0;
  objc_msgSend(v2, "setOpacity:", v1);

}

- (void)hideVideoPlayer
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __37__HPSMovieLoopPlayer_hideVideoPlayer__block_invoke;
  v2[3] = &unk_1EA29A770;
  v2[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v2, 0.15);
}

void __37__HPSMovieLoopPlayer_hideVideoPlayer__block_invoke(uint64_t a1)
{
  double v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "playerLayer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v1) = 0;
  objc_msgSend(v2, "setOpacity:", v1);

}

- (void)setAlphaHideOnZero:(double)a3
{
  -[HPSMovieLoopPlayer setAlpha:](self, "setAlpha:");
  -[HPSMovieLoopPlayer setHidden:](self, "setHidden:", a3 == 0.0);
}

- (void)setAlpha:(double)a3
{
  void *v5;
  double v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HPSMovieLoopPlayer;
  -[HPSMovieLoopPlayer setAlpha:](&v7, sel_setAlpha_);
  -[HPSMovieLoopPlayer playerLayer](self, "playerLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&a3 = a3;
  LODWORD(v6) = LODWORD(a3);
  objc_msgSend(v5, "setOpacity:", v6);

}

- (void)play
{
  void *v3;
  void *v4;
  double v5;
  __int128 v6;
  uint64_t v7;

  NSLog(CFSTR("Spatial Profile: video tutorial played"), a2);
  -[HPSMovieLoopPlayer videoPlayer](self, "videoPlayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0CA2E68];
  v7 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
  objc_msgSend(v3, "seekToTime:", &v6);

  -[HPSMovieLoopPlayer videoPlayer](self, "videoPlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = 1.0;
  objc_msgSend(v4, "playImmediatelyAtRate:", v5);

}

- (AVQueuePlayer)videoPlayer
{
  return self->_videoPlayer;
}

- (void)setVideoPlayer:(id)a3
{
  objc_storeStrong((id *)&self->_videoPlayer, a3);
}

- (AVPlayerLayer)playerLayer
{
  return self->_playerLayer;
}

- (void)setPlayerLayer:(id)a3
{
  objc_storeStrong((id *)&self->_playerLayer, a3);
}

- (CGRect)desiredBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_desiredBounds.origin.x;
  y = self->_desiredBounds.origin.y;
  width = self->_desiredBounds.size.width;
  height = self->_desiredBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setDesiredBounds:(CGRect)a3
{
  self->_desiredBounds = a3;
}

- (AVPlayerLooper)playerLooper
{
  return self->_playerLooper;
}

- (void)setPlayerLooper:(id)a3
{
  objc_storeStrong((id *)&self->_playerLooper, a3);
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_storeStrong((id *)&self->_url, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_playerLooper, 0);
  objc_storeStrong((id *)&self->_playerLayer, 0);
  objc_storeStrong((id *)&self->_videoPlayer, 0);
}

@end
