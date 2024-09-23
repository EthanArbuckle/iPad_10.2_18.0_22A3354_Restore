@implementation SUUIEmbeddedMediaView

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)SUUIMediaPlayerFramework();
  objc_msgSend(v3, "removeObserver:name:object:", self, *(_QWORD *)SUUIWeakLinkedSymbolForString("MPMoviePlayerDidExitFullscreenNotification", v4), 0);
  v5 = (void *)SUUIMediaPlayerFramework();
  objc_msgSend(v3, "removeObserver:name:object:", self, *(_QWORD *)SUUIWeakLinkedSymbolForString("MPMoviePlayerPlaybackDidFinishNotification", v5), 0);
  v6 = (void *)SUUIMediaPlayerFramework();
  objc_msgSend(v3, "removeObserver:name:object:", self, *(_QWORD *)SUUIWeakLinkedSymbolForString("MPMoviePlayerPlaybackStateDidChangeNotification", v6), 0);

  v7.receiver = self;
  v7.super_class = (Class)SUUIEmbeddedMediaView;
  -[SUUIEmbeddedMediaView dealloc](&v7, sel_dealloc);
}

- (void)beginInlinePlaybackWithURL:(id)a3
{
  id v4;
  MPMoviePlayerController *v5;
  MPMoviePlayerController *moviePlayer;
  id v7;

  v4 = a3;
  -[SUUIEmbeddedMediaView _tearDownMoviePlayer](self, "_tearDownMoviePlayer");
  v5 = -[SUUIEmbeddedMediaView _newMoviePlayerControllerWithURL:](self, "_newMoviePlayerControllerWithURL:", v4);

  moviePlayer = self->_moviePlayer;
  self->_moviePlayer = v5;

  self->_usingInlinePlayback = 1;
  -[MPMoviePlayerController view](self->_moviePlayer, "view");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[SUUIEmbeddedMediaView bounds](self, "bounds");
  objc_msgSend(v7, "setFrame:");
  -[SUUIEmbeddedMediaView addSubview:](self, "addSubview:", v7);

}

- (void)beginPlaybackAnimated:(BOOL)a3
{
  _BOOL8 v3;
  MPMoviePlayerController *moviePlayer;
  void *v6;
  MPMoviePlayerController *v7;
  MPMoviePlayerController *v8;
  id v9;

  v3 = a3;
  if (self->_mediaURLString)
  {
    moviePlayer = self->_moviePlayer;
    if (moviePlayer)
    {
      -[MPMoviePlayerController play](moviePlayer, "play");
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[SUUIEmbeddedMediaView _newMoviePlayerControllerWithURL:](self, "_newMoviePlayerControllerWithURL:", v6);
      v8 = self->_moviePlayer;
      self->_moviePlayer = v7;

      self->_usingInlinePlayback = 0;
      -[MPMoviePlayerController view](self->_moviePlayer, "view");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      -[SUUIEmbeddedMediaView bounds](self, "bounds");
      objc_msgSend(v9, "setFrame:");
      -[SUUIEmbeddedMediaView addSubview:](self, "addSubview:", v9);
      -[MPMoviePlayerController setFullscreen:animated:](self->_moviePlayer, "setFullscreen:animated:", 1, v3);

    }
  }
}

- (void)endPlaybackAnimated:(BOOL)a3
{
  MPMoviePlayerController *moviePlayer;
  void *v6;
  _QWORD v7[5];
  _QWORD v8[5];

  moviePlayer = self->_moviePlayer;
  if (moviePlayer)
  {
    -[MPMoviePlayerController stop](moviePlayer, "stop");
    if (a3)
    {
      if (-[MPMoviePlayerController isFullscreen](self->_moviePlayer, "isFullscreen"))
      {
        -[MPMoviePlayerController setFullscreen:animated:](self->_moviePlayer, "setFullscreen:animated:", 0, 1);
      }
      else
      {
        -[UIImageView setAlpha:](self->_playerDecorationView, "setAlpha:", 0.0);
        -[UIImageView setAlpha:](self->_thumbnailReflectionView, "setAlpha:", 0.0);
        -[UIImageView setAlpha:](self->_thumbnailView, "setAlpha:", 0.0);
        -[MPMoviePlayerController view](self->_moviePlayer, "view");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[SUUIEmbeddedMediaView sendSubviewToBack:](self, "sendSubviewToBack:", v6);

        v7[4] = self;
        v8[0] = MEMORY[0x24BDAC760];
        v8[1] = 3221225472;
        v8[2] = __45__SUUIEmbeddedMediaView_endPlaybackAnimated___block_invoke;
        v8[3] = &unk_2511F47C0;
        v8[4] = self;
        v7[0] = MEMORY[0x24BDAC760];
        v7[1] = 3221225472;
        v7[2] = __45__SUUIEmbeddedMediaView_endPlaybackAnimated___block_invoke_2;
        v7[3] = &unk_2511F4908;
        objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:animations:completion:", v8, v7, 0.2);
      }
    }
    else
    {
      -[SUUIEmbeddedMediaView _tearDownMoviePlayer](self, "_tearDownMoviePlayer");
    }
  }
}

uint64_t __45__SUUIEmbeddedMediaView_endPlaybackAnimated___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 496), "setAlpha:", 1.0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "setAlpha:", 1.0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 512), "setAlpha:", 1.0);
}

uint64_t __45__SUUIEmbeddedMediaView_endPlaybackAnimated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_tearDownMoviePlayer");
}

- (int64_t)playbackState
{
  int64_t result;
  uint64_t v3;

  result = (int64_t)self->_moviePlayer;
  if (result)
  {
    v3 = objc_msgSend((id)result, "playbackState");
    if ((unint64_t)(v3 - 1) > 4)
      return 0;
    else
      return qword_241EFD1D0[v3 - 1];
  }
  return result;
}

- (void)setMediaType:(int64_t)a3
{
  UIImageView *playerDecorationView;

  if (self->_mediaType != a3)
  {
    self->_mediaType = a3;
    -[UIImageView removeFromSuperview](self->_playerDecorationView, "removeFromSuperview");
    playerDecorationView = self->_playerDecorationView;
    self->_playerDecorationView = 0;

    -[SUUIEmbeddedMediaView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setShowsThumbnailReflection:(BOOL)a3
{
  id v5;
  void *v6;
  UIImageView *v7;
  UIImageView *thumbnailReflectionView;
  void *v9;
  UIImageView *v10;
  CATransform3D v11;

  if (-[SUUIEmbeddedMediaView showsThumbnailReflection](self, "showsThumbnailReflection") != a3)
  {
    if (a3)
    {
      v5 = objc_alloc(MEMORY[0x24BEBD668]);
      -[UIImageView image](self->_thumbnailView, "image");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (UIImageView *)objc_msgSend(v5, "initWithImage:", v6);
      thumbnailReflectionView = self->_thumbnailReflectionView;
      self->_thumbnailReflectionView = v7;

      -[UIImageView setContentMode:](self->_thumbnailReflectionView, "setContentMode:", -[UIImageView contentMode](self->_thumbnailView, "contentMode"));
      -[UIImageView layer](self->_thumbnailReflectionView, "layer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      CATransform3DMakeScale(&v11, -1.0, -1.0, 1.0);
      objc_msgSend(v9, "setTransform:", &v11);

      -[SUUIEmbeddedMediaView addSubview:](self, "addSubview:", self->_thumbnailReflectionView);
    }
    else
    {
      -[UIImageView removeFromSuperview](self->_thumbnailReflectionView, "removeFromSuperview");
      v10 = self->_thumbnailReflectionView;
      self->_thumbnailReflectionView = 0;

    }
    -[SUUIEmbeddedMediaView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setThumbnailContentMode:(int64_t)a3
{
  void *v5;

  -[SUUIEmbeddedMediaView _thumbnailView](self, "_thumbnailView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setContentMode:", a3);

  -[UIImageView setContentMode:](self->_thumbnailReflectionView, "setContentMode:", a3);
}

- (void)setThumbnailImage:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = a3;
  -[UIImageView image](self->_thumbnailView, "image");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 != v6)
  {
    -[SUUIEmbeddedMediaView _thumbnailView](self, "_thumbnailView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setImage:", v6);
    -[UIImageView setImage:](self->_thumbnailReflectionView, "setImage:", v6);
    -[SUUIEmbeddedMediaView setNeedsLayout](self, "setNeedsLayout");

  }
}

- (BOOL)showsThumbnailReflection
{
  return self->_thumbnailReflectionView != 0;
}

- (int64_t)thumbnailContentMode
{
  void *v2;
  int64_t v3;

  -[SUUIEmbeddedMediaView _thumbnailView](self, "_thumbnailView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "contentMode");

  return v3;
}

- (UIImage)thumbnailImage
{
  return -[UIImageView image](self->_thumbnailView, "image");
}

- (void)layoutSubviews
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
  int64_t v12;
  UIImageView *thumbnailReflectionView;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGFloat v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double MaxY;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  float v33;
  float v34;
  double v35;
  double v36;
  UIImageView *playerDecorationView;
  void *v38;
  void *v39;
  void *v40;
  UIImageView *v41;
  UIImageView *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  void *v47;
  float v48;
  double v49;
  float v50;
  double v51;
  double v52;
  float v53;
  UIImageView *thumbnailView;
  void *v55;
  id v56;
  CGRect v57;

  -[SUUIEmbeddedMediaView bounds](self, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v10 = v3;
  if (self->_thumbnailReflectionView)
    v11 = v3 * 0.5;
  else
    v11 = v3;
  v12 = -[SUUIEmbeddedMediaView thumbnailContentMode](self, "thumbnailContentMode");
  thumbnailReflectionView = self->_thumbnailReflectionView;
  if (thumbnailReflectionView)
  {
    -[UIImageView image](thumbnailReflectionView, "image");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "size");
    v16 = v15;
    v18 = v17;

    -[UIImageView frame](self->_thumbnailReflectionView, "frame");
    -[SUUIEmbeddedMediaView _sizeToFitImageSize:bounds:](self, "_sizeToFitImageSize:bounds:", v16, v18, v5, v7, v9, v11);
    v21 = v20;
    v22 = v19;
    *(float *)&v20 = (v9 - v20) * 0.5;
    v23 = v9;
    v24 = v11;
    v25 = floorf(*(float *)&v20);
    if (v12 == 6)
      v26 = v10 - v19;
    else
      v26 = 0.0;
    -[UIImageView setFrame:](self->_thumbnailReflectionView, "setFrame:", v25, v26, v21, v19);
    v57.origin.x = v25;
    v11 = v24;
    v9 = v23;
    v57.origin.y = v26;
    v57.size.width = v21;
    v57.size.height = v22;
    MaxY = CGRectGetMaxY(v57);
  }
  else
  {
    MaxY = 0.0;
  }
  -[SUUIEmbeddedMediaView _thumbnailView](self, "_thumbnailView");
  v56 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "frame");
  objc_msgSend(v56, "image");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "size");
  -[SUUIEmbeddedMediaView _sizeToFitImageSize:bounds:](self, "_sizeToFitImageSize:bounds:");
  v30 = v29;
  v32 = v31;

  v33 = (v9 - v30) * 0.5;
  v34 = floorf(v33);
  v35 = v34;
  if (v12 == 6)
    v36 = v10 - v32;
  else
    v36 = MaxY;
  objc_msgSend(v56, "setFrame:", v34, v36, v30, v32);
  if (self->_mediaType == 2)
  {
    playerDecorationView = self->_playerDecorationView;
    if (!playerDecorationView)
    {
      v38 = (void *)MEMORY[0x24BEBD640];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "imageNamed:inBundle:", CFSTR("PlayControl"), v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      v41 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD668]), "initWithImage:", v40);
      v42 = self->_playerDecorationView;
      self->_playerDecorationView = v41;

      -[SUUIEmbeddedMediaView addSubview:](self, "addSubview:", self->_playerDecorationView);
      playerDecorationView = self->_playerDecorationView;
    }
    -[UIImageView frame](playerDecorationView, "frame");
    v44 = v43;
    v46 = v45;
    objc_msgSend(v56, "image");
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    v48 = (v9 - v44) * 0.5;
    v49 = floorf(v48);
    v50 = (v30 - v44) * 0.5;
    v51 = v35 + floorf(v50);
    if (v47)
      v52 = v32;
    else
      v52 = v11;
    if (v47)
      v49 = v51;
    v53 = (v52 - v46) * 0.5;
    -[UIImageView setFrame:](self->_playerDecorationView, "setFrame:", v49, v36 + floorf(v53), v44, v46);
    thumbnailView = self->_thumbnailView;
    objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setBackgroundColor:](thumbnailView, "setBackgroundColor:", v55);

  }
}

- (void)setBackgroundColor:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  if (self->_mediaType != 2)
    -[UIImageView setBackgroundColor:](self->_thumbnailView, "setBackgroundColor:", v4);
  v5.receiver = self;
  v5.super_class = (Class)SUUIEmbeddedMediaView;
  -[SUUIEmbeddedMediaView setBackgroundColor:](&v5, sel_setBackgroundColor_, v4);

}

- (void)didMoveToWindow
{
  void *v3;

  -[SUUIEmbeddedMediaView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    -[SUUIEmbeddedMediaView endPlaybackAnimated:](self, "endPlaybackAnimated:", 0);
}

- (void)_didExitFullscreen:(id)a3
{
  if (!self->_usingInlinePlayback)
  {
    -[SUUIEmbeddedMediaView _tearDownMoviePlayer](self, "_tearDownMoviePlayer", a3);
    -[SUUIEmbeddedMediaView _sendPlaybackStateChanged](self, "_sendPlaybackStateChanged");
  }
}

- (void)_didFinishPlayback:(id)a3
{
  if (-[MPMoviePlayerController isFullscreen](self->_moviePlayer, "isFullscreen", a3))
  {
    -[MPMoviePlayerController setFullscreen:animated:](self->_moviePlayer, "setFullscreen:animated:", 0, 1);
  }
  else
  {
    -[SUUIEmbeddedMediaView _tearDownMoviePlayer](self, "_tearDownMoviePlayer");
    -[SUUIEmbeddedMediaView _sendPlaybackStateChanged](self, "_sendPlaybackStateChanged");
  }
}

- (id)_newMoviePlayerControllerWithURL:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = SUUIMediaPlayerFramework();
  v6 = (void *)objc_msgSend(objc_alloc((Class)SUUIWeakLinkedClassForString(CFSTR("MPMoviePlayerController"), v5)), "initWithContentURL:", v4);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)SUUIMediaPlayerFramework();
  objc_msgSend(v7, "addObserver:selector:name:object:", self, sel__didExitFullscreen_, *(_QWORD *)SUUIWeakLinkedSymbolForString("MPMoviePlayerDidExitFullscreenNotification", v8), v6);
  v9 = (void *)SUUIMediaPlayerFramework();
  objc_msgSend(v7, "addObserver:selector:name:object:", self, sel__didFinishPlayback_, *(_QWORD *)SUUIWeakLinkedSymbolForString("MPMoviePlayerPlaybackDidFinishNotification", v9), v6);
  v10 = (void *)SUUIMediaPlayerFramework();
  objc_msgSend(v7, "addObserver:selector:name:object:", self, sel__playbackStateChanged_, *(_QWORD *)SUUIWeakLinkedSymbolForString("MPMoviePlayerPlaybackStateDidChangeNotification", v10), v6);

  return v6;
}

- (void)_sendPlaybackStateChanged
{
  id v3;

  -[SUUIEmbeddedMediaView delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "mediaView:playbackStateDidChange:", self, -[SUUIEmbeddedMediaView playbackState](self, "playbackState"));

}

- (CGSize)_sizeToFitImageSize:(CGSize)a3 bounds:(CGRect)a4
{
  double height;
  double width;
  double v6;
  double v7;
  float v9;
  double v10;
  double v11;
  CGSize result;

  height = a4.size.height;
  width = a4.size.width;
  v6 = a3.height;
  v7 = a3.width;
  if (-[SUUIEmbeddedMediaView thumbnailContentMode](self, "thumbnailContentMode", a3.width, a3.height, a4.origin.x, a4.origin.y) == 1&& (v7 > width || v6 > height))
  {
    v9 = v6 * (width / v7);
    v6 = ceilf(v9);
    v7 = width;
  }
  v10 = v7;
  v11 = v6;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)_tearDownMoviePlayer
{
  MPMoviePlayerController *moviePlayer;
  void *v4;
  void *v5;
  void *v6;
  MPMoviePlayerController *v7;
  id v8;

  moviePlayer = self->_moviePlayer;
  if (moviePlayer)
  {
    -[MPMoviePlayerController stop](moviePlayer, "stop");
    -[MPMoviePlayerController view](self->_moviePlayer, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeFromSuperview");

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v5 = (void *)SUUIMediaPlayerFramework();
    objc_msgSend(v8, "removeObserver:name:object:", self, *(_QWORD *)SUUIWeakLinkedSymbolForString("MPMoviePlayerDidExitFullscreenNotification", v5), self->_moviePlayer);
    v6 = (void *)SUUIMediaPlayerFramework();
    objc_msgSend(v8, "removeObserver:name:object:", self, *(_QWORD *)SUUIWeakLinkedSymbolForString("MPMoviePlayerPlaybackDidFinishNotification", v6), self->_moviePlayer);
    v7 = self->_moviePlayer;
    self->_moviePlayer = 0;

  }
}

- (id)_thumbnailView
{
  UIImageView *thumbnailView;
  UIImageView *v4;
  UIImageView *v5;
  UIImageView *v6;
  void *v7;

  thumbnailView = self->_thumbnailView;
  if (!thumbnailView)
  {
    v4 = (UIImageView *)objc_alloc_init(MEMORY[0x24BEBD668]);
    v5 = self->_thumbnailView;
    self->_thumbnailView = v4;

    v6 = self->_thumbnailView;
    -[SUUIEmbeddedMediaView backgroundColor](self, "backgroundColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setBackgroundColor:](v6, "setBackgroundColor:", v7);

    -[UIImageView setContentMode:](self->_thumbnailView, "setContentMode:", 1);
    -[SUUIEmbeddedMediaView addSubview:](self, "addSubview:", self->_thumbnailView);
    thumbnailView = self->_thumbnailView;
  }
  return thumbnailView;
}

- (SUUIEmbeddedMediaViewDelegate)delegate
{
  return (SUUIEmbeddedMediaViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)mediaType
{
  return self->_mediaType;
}

- (NSString)mediaURLString
{
  return self->_mediaURLString;
}

- (void)setMediaURLString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 480);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnailView, 0);
  objc_storeStrong((id *)&self->_thumbnailReflectionView, 0);
  objc_storeStrong((id *)&self->_playerDecorationView, 0);
  objc_storeStrong((id *)&self->_moviePlayer, 0);
  objc_storeStrong((id *)&self->_mediaURLString, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
