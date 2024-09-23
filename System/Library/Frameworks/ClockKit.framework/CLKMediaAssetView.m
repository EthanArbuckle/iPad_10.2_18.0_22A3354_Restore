@implementation CLKMediaAssetView

- (CLKMediaAssetView)initWithFrame:(CGRect)a3 forDevice:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  CLKMediaAssetView *v11;
  CLKMediaAssetView *v12;
  id v13;
  uint64_t v14;
  UIImageView *posterView;
  void *v16;
  void *v17;
  objc_super v19;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = a4;
  v19.receiver = self;
  v19.super_class = (Class)CLKMediaAssetView;
  v11 = -[CLKMediaAssetView initWithFrame:](&v19, sel_initWithFrame_, x, y, width, height);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_device, a4);
    v13 = objc_alloc(MEMORY[0x24BEBD668]);
    -[CLKMediaAssetView bounds](v12, "bounds");
    v14 = objc_msgSend(v13, "initWithFrame:");
    posterView = v12->_posterView;
    v12->_posterView = (UIImageView *)v14;

    -[UIImageView setAutoresizingMask:](v12->_posterView, "setAutoresizingMask:", 18);
    -[UIImageView setContentMode:](v12->_posterView, "setContentMode:", 1);
    -[CLKMediaAssetView addSubview:](v12, "addSubview:", v12->_posterView);
    -[CLKMediaAssetView bringSubviewToFront:](v12, "bringSubviewToFront:", v12->_posterView);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    CLKget_AVAudioSessionMediaServicesWereResetNotification();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObserver:selector:name:object:", v12, sel__mediaServicesWereReset_, v17, 0);

  }
  return v12;
}

- (void)dealloc
{
  void *v3;
  id timeObserver;
  void *v5;
  objc_super v6;

  if (self->_timeObserver)
  {
    -[CLKVideoPlayerView player](self->_videoPlayerView, "player");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeTimeObserver:", self->_timeObserver);

    timeObserver = self->_timeObserver;
    self->_timeObserver = 0;

  }
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", self);

  v6.receiver = self;
  v6.super_class = (Class)CLKMediaAssetView;
  -[CLKMediaAssetView dealloc](&v6, sel_dealloc);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[UIImageView sizeThatFits:](self->_posterView, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[UIImageView intrinsicContentSize](self->_posterView, "intrinsicContentSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  NSObject *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint8_t v14[16];
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CLKMediaAssetView;
  -[CLKMediaAssetView layoutSubviews](&v15, sel_layoutSubviews);
  -[AVSynchronizedLayer superlayer](self->_syncLayer, "superlayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  -[AVSynchronizedLayer setFrame:](self->_syncLayer, "setFrame:");

  -[CALayer superlayer](self->_posterLayer, "superlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  -[CALayer setFrame:](self->_posterLayer, "setFrame:");

  CLKLoggingObjectForDomain(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_2114F4000, v5, OS_LOG_TYPE_DEFAULT, "CLKMediaAssetView layoutSubviews", v14, 2u);
  }

  -[CLKMediaAssetView bounds](self, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  _CLKSetViewBoundsAndPositionFromFrame(self->_curtainView, v6, v8, v10, v12);
  _CLKSetViewBoundsAndPositionFromFrame(self->_posterView, v7, v9, v11, v13);
  _CLKSetViewBoundsAndPositionFromFrame(self->_videoPlayerView, v7, v9, v11, v13);
}

- (void)changeMediaAsset:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  AVSynchronizedLayer *syncLayer;
  CALayer *posterLayer;
  void *v12;
  UIImageView *posterView;
  __int128 v14;
  void *v15;
  void *v16;
  _OWORD v17[3];

  v5 = a3;
  -[CLKMediaAssetView _cancelPlayback](self, "_cancelPlayback");
  objc_msgSend(v5, "video");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "url");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKMediaAsset video](self->_mediaAsset, "video");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "url");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 != v9)
  {
    *((_BYTE *)self + 448) &= ~1u;
    -[CALayer removeFromSuperlayer](self->_posterLayer, "removeFromSuperlayer");
    -[AVSynchronizedLayer removeFromSuperlayer](self->_syncLayer, "removeFromSuperlayer");
    syncLayer = self->_syncLayer;
    self->_syncLayer = 0;

    posterLayer = self->_posterLayer;
    self->_posterLayer = 0;

  }
  self->_preparedForOperation = 0;
  objc_storeStrong((id *)&self->_mediaAsset, a3);
  objc_msgSend(v5, "image");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setImage:](self->_posterView, "setImage:", v12);

  posterView = self->_posterView;
  v14 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v17[0] = *MEMORY[0x24BDBD8B8];
  v17[1] = v14;
  v17[2] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  -[UIImageView setTransform:](posterView, "setTransform:", v17);
  -[UIImageView setAlpha:](self->_posterView, "setAlpha:", 1.0);
  objc_msgSend(v5, "video");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "url");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
    -[CLKMediaAssetView _createVideoPlayerViewIfNeeded](self, "_createVideoPlayerViewIfNeeded");
  if ((*((_BYTE *)self + 448) & 1) == 0)
    -[CLKVideoPlayerView setHidden:](self->_videoPlayerView, "setHidden:", 1);

}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_startTimeForOperation:(SEL)a3
{
  double v5;

  -[CLKMediaAsset stillDisplayTime](self->_mediaAsset, "stillDisplayTime");
  return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CLKcall_CMTimeMakeWithSeconds(1000, fmax(v5 + _startTimeForOperation__startTimeOffsets[a4], 0.0));
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_endTimeForOperation:(SEL)a3
{
  double v6;
  double v7;
  double v8;

  -[CLKMediaAsset stillDisplayTime](self->_mediaAsset, "stillDisplayTime");
  v7 = v6 + _endTimeForOperation__endTimeOffsets[a4];
  -[CLKMediaAsset videoDuration](self->_mediaAsset, "videoDuration");
  if (v7 < v8)
    v8 = v7;
  return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CLKcall_CMTimeMakeWithSeconds(1000, v8);
}

- (void)prepareToPlayWithOperation:(int64_t)a3
{
  NSObject *v4;
  void *v6;
  int64_t preparedForOperation;
  NSObject *v8;
  void *v9;
  void *v10;
  CLKVideoPlayerView *videoPlayerView;
  void *v12;
  CALayer *v13;
  CALayer *posterLayer;
  id v15;
  void *v16;
  uint64_t v17;
  __int128 v18;
  CALayer *v19;
  double v20;
  id v21;
  void *v22;
  void *v23;
  AVSynchronizedLayer *v24;
  AVSynchronizedLayer *syncLayer;
  void *v26;
  void *v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  uint64_t v33;
  void *v34;
  void *v35;
  double v36;
  CLKVideoPlayerView *v37;
  id v38;
  _BYTE v39[24];
  __n128 v40;
  uint64_t v41;
  __n128 v42;
  uint64_t v43;
  __n128 v44;
  uint64_t v45;
  __int128 v46;
  uint64_t v47;
  __int128 v48;
  uint64_t v49;
  CGAffineTransform v50;
  CGAffineTransform v51;
  __n128 buf;
  uint64_t v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  if ((unint64_t)(a3 - 4) > 0xFFFFFFFFFFFFFFFCLL)
  {
    -[CLKMediaAsset video](self->_mediaAsset, "video");
    v38 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "url");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      preparedForOperation = self->_preparedForOperation;

      if (preparedForOperation != a3)
      {
        if ((*((_BYTE *)self + 448) & 1) == 0)
        {
          CLKLoggingObjectForDomain(0);
          v8 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
          {
            -[CLKMediaAsset video](self->_mediaAsset, "video");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "url");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            buf.n128_u32[0] = 138412290;
            *(unint64_t *)((char *)buf.n128_u64 + 4) = (unint64_t)v10;
            _os_log_impl(&dword_2114F4000, v8, OS_LOG_TYPE_DEFAULT, "Loading video: %@.", (uint8_t *)&buf, 0xCu);

          }
          videoPlayerView = self->_videoPlayerView;
          -[CLKMediaAsset video](self->_mediaAsset, "video");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[CLKVideoPlayerView loadVideo:](videoPlayerView, "loadVideo:", v12);

          -[CLKVideoPlayerView setHidden:](self->_videoPlayerView, "setHidden:", 0);
          *((_BYTE *)self + 448) |= 1u;
        }
        if (a3 == 2)
        {
          if (!self->_syncLayer)
          {
            objc_msgSend(MEMORY[0x24BDE56D0], "layer");
            v13 = (CALayer *)objc_claimAutoreleasedReturnValue();
            posterLayer = self->_posterLayer;
            self->_posterLayer = v13;

            -[CALayer setContentsGravity:](self->_posterLayer, "setContentsGravity:", *MEMORY[0x24BDE5C90]);
            -[CALayer setContentsRect:](self->_posterLayer, "setContentsRect:", 0.046, 0.046, 0.908, 0.908);
            objc_msgSend(MEMORY[0x24BDE57D8], "begin");
            objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
            -[UIImageView image](self->_posterView, "image");
            v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            -[CALayer setContents:](self->_posterLayer, "setContents:", objc_msgSend(v15, "CGImage"));

            -[UIImageView image](self->_posterView, "image");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v16, "imageOrientation");

            v18 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
            *(_OWORD *)&v51.a = *MEMORY[0x24BDBD8B8];
            *(_OWORD *)&v51.c = v18;
            *(_OWORD *)&v51.tx = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
            if ((unint64_t)(v17 - 1) <= 2)
              CGAffineTransformMakeRotation(&v51, dbl_211565DA0[v17 - 1]);
            v19 = self->_posterLayer;
            v50 = v51;
            -[CALayer setContentsTransform:](v19, "setContentsTransform:", &v50);
            LODWORD(v20) = 0;
            -[CALayer setOpacity:](self->_posterLayer, "setOpacity:", v20);
            objc_msgSend(MEMORY[0x24BDE57D8], "commit");
            v21 = CLKget_AVSynchronizedLayerClass();
            -[CLKVideoPlayerView player](self->_videoPlayerView, "player");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "currentItem");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "synchronizedLayerWithPlayerItem:", v23);
            v24 = (AVSynchronizedLayer *)objc_claimAutoreleasedReturnValue();
            syncLayer = self->_syncLayer;
            self->_syncLayer = v24;

            -[CLKMediaAssetView layer](self, "layer");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "bounds");
            -[AVSynchronizedLayer setFrame:](self->_syncLayer, "setFrame:");

            -[CLKMediaAssetView layer](self, "layer");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "addSublayer:", self->_syncLayer);

            -[AVSynchronizedLayer bounds](self->_syncLayer, "bounds");
            -[CALayer setFrame:](self->_posterLayer, "setFrame:");
            -[AVSynchronizedLayer addSublayer:](self->_syncLayer, "addSublayer:", self->_posterLayer);
          }
          -[CLKMediaAsset stillDisplayTime](self->_mediaAsset, "stillDisplayTime");
          CLKcall_CMTimeMakeWithSeconds(1000, v28);
          -[CLKVideoPlayerView player](self->_videoPlayerView, "player");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "currentItem");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = v48;
          v47 = v49;
          objc_msgSend(v30, "setForwardPlaybackEndTime:", &v46);

          objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("opacity"));
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "setFromValue:", &unk_24CC17B78);
          objc_msgSend(v31, "setToValue:", &unk_24CC17B88);
          objc_msgSend(v31, "setDuration:", 0.065);
          objc_msgSend(v31, "setFillMode:", *MEMORY[0x24BDE5978]);
          objc_msgSend(v31, "setRemovedOnCompletion:", 0);
          -[CLKMediaAsset stillDisplayTime](self->_mediaAsset, "stillDisplayTime");
          objc_msgSend(v31, "setBeginTime:", v32 + -0.065);
          -[CALayer addAnimation:forKey:](self->_posterLayer, "addAnimation:forKey:", v31, CFSTR("poster"));

        }
        else
        {
          -[CLKVideoPlayerView player](self->_videoPlayerView, "player", CLKget_kCMTimeInvalid(&v44).n128_f64[0]);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "currentItem");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = v44;
          v43 = v45;
          objc_msgSend(v35, "setForwardPlaybackEndTime:", &v42);

          objc_msgSend(MEMORY[0x24BDE57D8], "begin");
          objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
          -[CALayer removeAllAnimations](self->_posterLayer, "removeAllAnimations");
          LODWORD(v36) = 0;
          -[CALayer setOpacity:](self->_posterLayer, "setOpacity:", v36);
          v33 = objc_msgSend(MEMORY[0x24BDE57D8], "commit");
        }
        buf = 0uLL;
        v53 = 0;
        CLKget_kCMTimePositiveInfinity(&buf, v33);
        if (a3 == 1)
        {
          CLKget_kCMTimeZero(&v40);
          buf = v40;
          v53 = v41;
        }
        v37 = self->_videoPlayerView;
        -[CLKMediaAssetView _startTimeForOperation:](self, "_startTimeForOperation:", a3);
        v40 = buf;
        v41 = v53;
        -[CLKVideoPlayerView seekToTime:tolerance:](v37, "seekToTime:tolerance:", v39, &v40);
        -[CLKVideoPlayerView preroll](self->_videoPlayerView, "preroll");
        self->_preparedForOperation = a3;
      }
    }
    else
    {

    }
  }
  else
  {
    CLKLoggingObjectForDomain(0);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      buf.n128_u32[0] = 134217984;
      *(unint64_t *)((char *)buf.n128_u64 + 4) = a3;
      _os_log_impl(&dword_2114F4000, v4, OS_LOG_TYPE_DEFAULT, "Unsupported media view operation: %ld", (uint8_t *)&buf, 0xCu);
    }

  }
}

- (void)_transitionFromPosterToVideo
{
  int64_t transitionOperation;
  double v4;
  double v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[6];

  transitionOperation = self->_transitionOperation;
  v4 = _transitionFromPosterToVideo_s_transitionDurationForPlayWithOperation[transitionOperation];
  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
  LODWORD(v5) = 0;
  -[CALayer setOpacity:](self->_posterLayer, "setOpacity:", v5);
  objc_msgSend(MEMORY[0x24BDE57D8], "commit");
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __49__CLKMediaAssetView__transitionFromPosterToVideo__block_invoke;
  v8[3] = &unk_24CBFB218;
  v8[4] = self;
  v8[5] = 0x3FF1333333333333;
  v6 = MEMORY[0x212BDBEAC](v8);
  v7 = (void *)v6;
  if (transitionOperation == 1)
    objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:delay:options:animations:completion:", 0x20000, v6, 0, v4, 0.0);
  else
    (*(void (**)(uint64_t))(v6 + 16))(v6);

}

uint64_t __49__CLKMediaAssetView__transitionFromPosterToVideo__block_invoke(uint64_t a1)
{
  void *v2;
  CGAffineTransform v4;
  CGAffineTransform v5;

  CGAffineTransformMakeScale(&v5, *(CGFloat *)(a1 + 40), *(CGFloat *)(a1 + 40));
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 432);
  v4 = v5;
  objc_msgSend(v2, "setTransform:", &v4);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "setAlpha:", 0.0);
}

- (void)playWithOperation:(int64_t)a3
{
  NSObject *v4;
  void *v6;
  void *v7;
  void *v8;
  id timeObserver;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19[2];
  __int128 v20;
  uint64_t v21;
  id location;
  void *v23;
  uint8_t buf[16];
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  if ((unint64_t)(a3 - 4) > 0xFFFFFFFFFFFFFFFCLL)
  {
    -[CLKMediaAsset video](self->_mediaAsset, "video");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "url");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      if (self->_preparedForOperation != a3)
        -[CLKMediaAssetView prepareToPlayWithOperation:](self, "prepareToPlayWithOperation:", a3);
      self->_transitionOperation = a3;
      memset(buf, 0, sizeof(buf));
      v25 = 0;
      -[CLKMediaAssetView _endTimeForOperation:](self, "_endTimeForOperation:", a3);
      objc_initWeak(&location, self);
      if (self->_timeObserver)
      {
        -[CLKVideoPlayerView player](self->_videoPlayerView, "player");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "removeTimeObserver:", self->_timeObserver);

        timeObserver = self->_timeObserver;
        self->_timeObserver = 0;

      }
      -[CLKVideoPlayerView player](self->_videoPlayerView, "player");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = *(_OWORD *)buf;
      v21 = v25;
      objc_msgSend(MEMORY[0x24BDD1968], "valueWithCMTime:", &v20);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v11;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v23, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = MEMORY[0x24BDAC760];
      v16 = 3221225472;
      v17 = __39__CLKMediaAssetView_playWithOperation___block_invoke;
      v18 = &unk_24CBFB240;
      objc_copyWeak(v19, &location);
      v19[1] = (id)a3;
      objc_msgSend(v10, "addBoundaryTimeObserverForTimes:queue:usingBlock:", v12, 0, &v15);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = self->_timeObserver;
      self->_timeObserver = v13;

      -[CLKVideoPlayerView play](self->_videoPlayerView, "play", v15, v16, v17, v18);
      self->_preparedForOperation = 0;
      *((_BYTE *)self + 448) |= 2u;
      objc_destroyWeak(v19);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    CLKLoggingObjectForDomain(0);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = a3;
      _os_log_impl(&dword_2114F4000, v4, OS_LOG_TYPE_DEFAULT, "Unsupported media view operation: %ld", buf, 0xCu);
    }

  }
}

void __39__CLKMediaAssetView_playWithOperation___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_completePlaybackWithOperation:", *(_QWORD *)(a1 + 40));

}

- (void)_completePlaybackWithOperation:(int64_t)a3
{
  void *v5;
  id timeObserver;
  id v7;

  -[CLKVideoPlayerView player](self->_videoPlayerView, "player");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeTimeObserver:", self->_timeObserver);

  timeObserver = self->_timeObserver;
  self->_timeObserver = 0;

  if (a3 == 1)
  {
    -[CLKVideoPlayerView pause](self->_videoPlayerView, "pause");
    self->_preparedForOperation = 0;
    *((_BYTE *)self + 448) &= ~2u;
  }
  else
  {
    -[CLKMediaAssetView pauseWithOperation:](self, "pauseWithOperation:", a3);
  }
  -[CLKMediaAssetView delegate](self, "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "mediaAssetViewDidEndPlaying:", self);

}

- (void)pauseWithOperation:(int64_t)a3
{
  NSObject *v4;
  void *v6;
  void *v7;
  void *v8;
  id timeObserver;
  uint64_t v10;
  void (**v11)(_QWORD);
  void (**v12)(_QWORD, _QWORD);
  _QWORD v13[5];
  _QWORD v14[5];
  uint8_t buf[4];
  int64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if ((unint64_t)(a3 - 4) > 0xFFFFFFFFFFFFFFFCLL)
  {
    -[CLKMediaAsset video](self->_mediaAsset, "video");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "url");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      if (self->_timeObserver)
      {
        -[CLKVideoPlayerView player](self->_videoPlayerView, "player");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "removeTimeObserver:", self->_timeObserver);

        timeObserver = self->_timeObserver;
        self->_timeObserver = 0;

      }
      v10 = MEMORY[0x24BDAC760];
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __40__CLKMediaAssetView_pauseWithOperation___block_invoke;
      v14[3] = &unk_24CBF9F60;
      v14[4] = self;
      v11 = (void (**)(_QWORD))MEMORY[0x212BDBEAC](v14);
      v13[0] = v10;
      v13[1] = 3221225472;
      v13[2] = __40__CLKMediaAssetView_pauseWithOperation___block_invoke_2;
      v13[3] = &unk_24CBFAFF8;
      v13[4] = self;
      v12 = (void (**)(_QWORD, _QWORD))MEMORY[0x212BDBEAC](v13);
      if (a3 == 1)
      {
        objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:delay:options:animations:completion:", 0x10000, v11, v12, 0.6, 0.0);
      }
      else
      {
        v11[2](v11);
        v12[2](v12, 1);
      }

    }
  }
  else
  {
    CLKLoggingObjectForDomain(0);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v16 = a3;
      _os_log_impl(&dword_2114F4000, v4, OS_LOG_TYPE_DEFAULT, "Unsupported media view operation: %ld", buf, 0xCu);
    }

  }
}

uint64_t __40__CLKMediaAssetView_pauseWithOperation___block_invoke(uint64_t a1)
{
  void *v2;
  __int128 v3;
  _OWORD v5[3];

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 432);
  v3 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v5[0] = *MEMORY[0x24BDBD8B8];
  v5[1] = v3;
  v5[2] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  objc_msgSend(v2, "setTransform:", v5);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "setAlpha:", 1.0);
}

uint64_t __40__CLKMediaAssetView_pauseWithOperation___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "pause");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 480) = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 448) &= ~2u;
  return result;
}

- (BOOL)isPlaying
{
  return (*((unsigned __int8 *)self + 448) >> 1) & 1;
}

- (void)interruptPlayback
{
  if ((*((_BYTE *)self + 448) & 2) != 0)
    -[CLKVideoPlayerView pause](self->_videoPlayerView, "pause");
}

- (void)resumeInterruptedPlayback
{
  if ((*((_BYTE *)self + 448) & 2) != 0)
    -[CLKVideoPlayerView play](self->_videoPlayerView, "play");
}

- (void)_cancelPlayback
{
  UIImageView *posterView;
  __int128 v4;
  void *v5;
  id timeObserver;
  _OWORD v7[3];

  if ((*((_BYTE *)self + 448) & 2) != 0)
  {
    posterView = self->_posterView;
    v4 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
    v7[0] = *MEMORY[0x24BDBD8B8];
    v7[1] = v4;
    v7[2] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
    -[UIImageView setTransform:](posterView, "setTransform:", v7);
    -[UIImageView setAlpha:](self->_posterView, "setAlpha:", 1.0);
    -[CLKVideoPlayerView pause](self->_videoPlayerView, "pause");
    self->_preparedForOperation = 0;
    *((_BYTE *)self + 448) &= ~2u;
    if (self->_timeObserver)
    {
      -[CLKVideoPlayerView player](self->_videoPlayerView, "player");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "removeTimeObserver:", self->_timeObserver);

      timeObserver = self->_timeObserver;
      self->_timeObserver = 0;

    }
  }
}

- (void)_mediaServicesWereReset:(id)a3
{
  _QWORD block[5];

  kdebug_trace();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45__CLKMediaAssetView__mediaServicesWereReset___block_invoke;
  block[3] = &unk_24CBF9F60;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __45__CLKMediaAssetView__mediaServicesWereReset___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reset");
}

- (void)pauseVideoPlayerViewIfItExists
{
  -[CLKVideoPlayerView pause](self->_videoPlayerView, "pause");
}

- (void)_createVideoPlayerViewIfNeeded
{
  NSObject *v3;
  CLKVideoPlayerView *v4;
  CLKVideoPlayerView *v5;
  CLKVideoPlayerView *videoPlayerView;
  uint8_t v7[16];

  CLKLoggingObjectForDomain(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_2114F4000, v3, OS_LOG_TYPE_DEFAULT, "CLKMediaAssetView _createVideoPlayerViewIfNeeded", v7, 2u);
  }

  if (!self->_videoPlayerView)
  {
    kdebug_trace();
    v4 = [CLKVideoPlayerView alloc];
    -[CLKMediaAssetView bounds](self, "bounds");
    v5 = -[CLKVideoPlayerView initWithFrame:](v4, "initWithFrame:");
    videoPlayerView = self->_videoPlayerView;
    self->_videoPlayerView = v5;

    -[CLKVideoPlayerView setDelegate:](self->_videoPlayerView, "setDelegate:", self);
    -[CLKVideoPlayerView setAutoresizingMask:](self->_videoPlayerView, "setAutoresizingMask:", 18);
    -[CLKMediaAssetView insertSubview:belowSubview:](self, "insertSubview:belowSubview:", self->_videoPlayerView, self->_posterView);
  }
}

- (void)_reset
{
  NSObject *v3;
  void *v4;
  void *v5;
  CLKMediaAsset *v6;
  void *v7;
  void *v8;
  CLKVideoPlayerView *videoPlayerView;
  uint8_t v10[16];

  CLKLoggingObjectForDomain(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_2114F4000, v3, OS_LOG_TYPE_DEFAULT, "CLKMediaAssetView _reset", v10, 2u);
  }

  -[CLKMediaAsset video](self->_mediaAsset, "video");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "url");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = self->_mediaAsset;
    -[CLKMediaAsset image](v6, "image");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[CLKMediaAsset mediaAssetWithImage:forDevice:](CLKMediaAsset, "mediaAssetWithImage:forDevice:", v7, self->_device);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKMediaAssetView changeMediaAsset:](self, "changeMediaAsset:", v8);

    -[CLKVideoPlayerView setDelegate:](self->_videoPlayerView, "setDelegate:", 0);
    -[CLKVideoPlayerView pause](self->_videoPlayerView, "pause");
    -[CLKVideoPlayerView removeFromSuperview](self->_videoPlayerView, "removeFromSuperview");
    videoPlayerView = self->_videoPlayerView;
    self->_videoPlayerView = 0;

    -[CLKMediaAssetView changeMediaAsset:](self, "changeMediaAsset:", v6);
  }
}

- (void)videoPlayerViewDidBeginPlaying:(id)a3
{
  NSObject *v4;
  id WeakRetained;
  uint8_t v6[16];

  CLKLoggingObjectForDomain(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_2114F4000, v4, OS_LOG_TYPE_DEFAULT, "CLKMediaAssetView videoPlayerViewDidBeginPlaying", v6, 2u);
  }

  -[CLKMediaAssetView _transitionFromPosterToVideo](self, "_transitionFromPosterToVideo");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "mediaAssetViewDidBeginPlaying:", self);

}

- (void)videoPlayerViewDidPauseAfterPlayingVideoToEnd:(id)a3
{
  NSObject *v3;
  uint8_t v4[16];

  CLKLoggingObjectForDomain(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_2114F4000, v3, OS_LOG_TYPE_DEFAULT, "CLKMediaAssetView videoPlayerViewDidPauseAfterPlayingVideoToEnd", v4, 2u);
  }

}

- (void)showCurtainView
{
  id v3;
  UIView *v4;
  UIView *curtainView;
  void *v6;

  if (!self->_curtainView)
  {
    v3 = objc_alloc(MEMORY[0x24BEBDB00]);
    -[CLKVideoPlayerView bounds](self->_videoPlayerView, "bounds");
    v4 = (UIView *)objc_msgSend(v3, "initWithFrame:");
    curtainView = self->_curtainView;
    self->_curtainView = v4;

    objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](self->_curtainView, "setBackgroundColor:", v6);

    -[CLKMediaAssetView addSubview:](self, "addSubview:", self->_curtainView);
    -[CLKMediaAssetView bringSubviewToFront:](self, "bringSubviewToFront:", self->_curtainView);
  }
}

- (void)hideCurtainView
{
  UIView *curtainView;

  -[UIView removeFromSuperview](self->_curtainView, "removeFromSuperview");
  curtainView = self->_curtainView;
  self->_curtainView = 0;

}

- (void)fadeToCurtainViewWithDuration:(double)a3 completion:(id)a4
{
  void (**v6)(id, uint64_t);
  _QWORD v7[5];

  v6 = (void (**)(id, uint64_t))a4;
  -[CLKMediaAssetView showCurtainView](self, "showCurtainView");
  if (a3 >= 0.00000011920929)
  {
    -[UIView setAlpha:](self->_curtainView, "setAlpha:", 0.0);
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __62__CLKMediaAssetView_fadeToCurtainViewWithDuration_completion___block_invoke;
    v7[3] = &unk_24CBF9F60;
    v7[4] = self;
    objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:animations:completion:", v7, v6, a3);
  }
  else if (v6)
  {
    v6[2](v6, 1);
  }

}

uint64_t __62__CLKMediaAssetView_fadeToCurtainViewWithDuration_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "setAlpha:", 1.0);
}

- (void)fadeFromCurtainViewWithDuration:(double)a3 completion:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[5];
  _QWORD v12[5];
  id v13;

  v6 = a4;
  v7 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __64__CLKMediaAssetView_fadeFromCurtainViewWithDuration_completion___block_invoke;
  v12[3] = &unk_24CBFB268;
  v12[4] = self;
  v8 = v6;
  v13 = v8;
  v9 = MEMORY[0x212BDBEAC](v12);
  v10 = (void *)v9;
  if (a3 >= 0.00000011920929)
  {
    -[CLKMediaAssetView showCurtainView](self, "showCurtainView");
    -[UIView setAlpha:](self->_curtainView, "setAlpha:", 1.0);
    v11[0] = v7;
    v11[1] = 3221225472;
    v11[2] = __64__CLKMediaAssetView_fadeFromCurtainViewWithDuration_completion___block_invoke_2;
    v11[3] = &unk_24CBF9F60;
    v11[4] = self;
    objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:animations:completion:", v11, v10, a3);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t))(v9 + 16))(v9, 1);
  }

}

uint64_t __64__CLKMediaAssetView_fadeFromCurtainViewWithDuration_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "hideCurtainView");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

uint64_t __64__CLKMediaAssetView_fadeFromCurtainViewWithDuration_completion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "setAlpha:", 0.0);
}

- (CLKMediaAsset)mediaAsset
{
  return self->_mediaAsset;
}

- (CLKDevice)device
{
  return self->_device;
}

- (CLKMediaAssetViewDelegate)delegate
{
  return (CLKMediaAssetViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_posterLayer, 0);
  objc_storeStrong((id *)&self->_syncLayer, 0);
  objc_storeStrong(&self->_timeObserver, 0);
  objc_storeStrong((id *)&self->_curtainView, 0);
  objc_storeStrong((id *)&self->_posterView, 0);
  objc_storeStrong((id *)&self->_mediaAsset, 0);
  objc_storeStrong((id *)&self->_videoPlayerView, 0);
}

@end
