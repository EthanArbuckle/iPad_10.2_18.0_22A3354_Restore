@implementation HRVideoPlayerView

- (HRVideoPlayerView)initWithItems:(id)a3 thumbnail:(id)a4 looping:(BOOL)a5
{
  id v9;
  id v10;
  HRVideoPlayerView *v11;
  HRVideoPlayerView *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HRVideoPlayerView;
  v11 = -[HRVideoPlayerView initWithFrame:](&v14, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_items, a3);
    objc_storeStrong((id *)&v12->_thumbnail, a4);
    v12->_looping = a5;
    -[HRVideoPlayerView _setUpUI](v12, "_setUpUI");
    -[HRVideoPlayerView _setUpNotifications](v12, "_setUpNotifications");
  }

  return v12;
}

+ (HRVideoPlayerView)playerViewWithURL:(id)a3 looping:(BOOL)a4
{
  _BOOL8 v4;
  objc_class *v5;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[2];

  v4 = a4;
  v19[1] = *MEMORY[0x24BDAC8D0];
  v5 = (objc_class *)MEMORY[0x24BDB26C8];
  v6 = a3;
  v7 = (void *)objc_msgSend([v5 alloc], "initWithURL:options:", v6, 0);
  objc_msgSend(MEMORY[0x24BDB2618], "playerItemWithURL:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "hrui_assetSize");
  v10 = v9;
  v12 = v11;
  objc_msgSend(v7, "hrui_thumbnailImage");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_alloc((Class)objc_opt_class());
  v19[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v14, "initWithItems:thumbnail:looping:", v15, v13, v4);

  objc_msgSend(v16, "hrui_constraintAspectRatioFromSize:", v10, v12);
  objc_msgSend(v16, "layer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setNeedsDisplayOnBoundsChange:", 1);

  return (HRVideoPlayerView *)v16;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRVideoPlayerView applicationActiveNotificationStub](self, "applicationActiveNotificationStub");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", v4);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRVideoPlayerView applicationInactiveNotificationStub](self, "applicationInactiveNotificationStub");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", v6);

  v7.receiver = self;
  v7.super_class = (Class)HRVideoPlayerView;
  -[HRVideoPlayerView dealloc](&v7, sel_dealloc);
}

- (void)setPreventsDisplaySleepDuringVideoPlayback:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[HRVideoPlayerView queuePlayer](self, "queuePlayer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPreventsDisplaySleepDuringVideoPlayback:", v3);

}

- (BOOL)preventsDisplaySleepDuringVideoPlayback
{
  void *v2;
  char v3;

  -[HRVideoPlayerView queuePlayer](self, "queuePlayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "preventsDisplaySleepDuringVideoPlayback");

  return v3;
}

- (void)play
{
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  HRVideoPlayerView *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  _HKInitializeLogging();
  v4 = (void *)*MEMORY[0x24BDD3010];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3010], OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = self;
    v10 = 2114;
    v11 = v6;
    _os_log_impl(&dword_215454000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@ %{public}@] Playing content", (uint8_t *)&v8, 0x16u);

  }
  -[HRVideoPlayerView queuePlayer](self, "queuePlayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "play");

  -[HRVideoPlayerView setShouldBePlaying:](self, "setShouldBePlaying:", 1);
}

- (void)pause
{
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  HRVideoPlayerView *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  _HKInitializeLogging();
  v4 = (void *)*MEMORY[0x24BDD3010];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3010], OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = self;
    v10 = 2114;
    v11 = v6;
    _os_log_impl(&dword_215454000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@ %{public}@] Pausing content", (uint8_t *)&v8, 0x16u);

  }
  -[HRVideoPlayerView queuePlayer](self, "queuePlayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pause");

  -[HRVideoPlayerView setShouldBePlaying:](self, "setShouldBePlaying:", 0);
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (id)player
{
  void *v2;
  void *v3;

  -[HRVideoPlayerView layer](self, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "player");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setPlayer:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HRVideoPlayerView layer](self, "layer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPlayer:", v4);

}

- (void)_setUpUI
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
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;

  v3 = (void *)MEMORY[0x24BDB2670];
  -[HRVideoPlayerView items](self, "items");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "queuePlayerWithItems:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRVideoPlayerView setQueuePlayer:](self, "setQueuePlayer:", v5);

  -[HRVideoPlayerView queuePlayer](self, "queuePlayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPreventsDisplaySleepDuringVideoPlayback:", 0);

  v7 = (void *)MEMORY[0x24BDB2650];
  -[HRVideoPlayerView queuePlayer](self, "queuePlayer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRVideoPlayerView items](self, "items");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "playerLooperWithPlayer:templateItem:", v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRVideoPlayerView setPlayerLooper:](self, "setPlayerLooper:", v11);

  -[HRVideoPlayerView layer](self, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setShouldRasterize:", 1);

  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "scale");
  v15 = v14;
  -[HRVideoPlayerView layer](self, "layer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setRasterizationScale:", v15);

  -[HRVideoPlayerView thumbnail](self, "thumbnail");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    v18 = objc_alloc(MEMORY[0x24BDF6AE8]);
    -[HRVideoPlayerView thumbnail](self, "thumbnail");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v18, "initWithImage:", v19);
    -[HRVideoPlayerView setThumbnailImageView:](self, "setThumbnailImageView:", v20);

    -[HRVideoPlayerView thumbnailImageView](self, "thumbnailImageView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[HRVideoPlayerView thumbnailImageView](self, "thumbnailImageView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[HRVideoPlayerView addSubview:](self, "addSubview:", v22);

    -[HRVideoPlayerView layer](self, "layer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[HRVideoPlayerView thumbnailImageView](self, "thumbnailImageView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "layer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "insertSublayer:atIndex:", v25, 0);

    -[HRVideoPlayerView thumbnailImageView](self, "thumbnailImageView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "hk_alignConstraintsWithView:", self);

  }
  if (!-[HRVideoPlayerView looping](self, "looping"))
  {
    -[HRVideoPlayerView playerLooper](self, "playerLooper");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "disableLooping");

  }
  -[HRVideoPlayerView queuePlayer](self, "queuePlayer");
  v28 = (id)objc_claimAutoreleasedReturnValue();
  -[HRVideoPlayerView setPlayer:](self, "setPlayer:", v28);

}

- (void)_setUpNotifications
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  id location;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x24BDF7510];
  v6 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __40__HRVideoPlayerView__setUpNotifications__block_invoke;
  v19[3] = &unk_24D34AE50;
  objc_copyWeak(&v20, &location);
  objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", v5, 0, v4, v19);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRVideoPlayerView setApplicationActiveNotificationStub:](self, "setApplicationActiveNotificationStub:", v7);

  objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x24BDF75D8];
  v17[0] = v6;
  v17[1] = 3221225472;
  v17[2] = __40__HRVideoPlayerView__setUpNotifications__block_invoke_2;
  v17[3] = &unk_24D34AE50;
  objc_copyWeak(&v18, &location);
  objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", v9, 0, v8, v17);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRVideoPlayerView setApplicationInactiveNotificationStub:](self, "setApplicationInactiveNotificationStub:", v10);

  -[HRVideoPlayerView queuePlayer](self, "queuePlayer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "currentItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__didReceivePlayerNotification_, *MEMORY[0x24BDB1FF8], v12);

  -[HRVideoPlayerView queuePlayer](self, "queuePlayer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "currentItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__didReceivePlayerNotification_, *MEMORY[0x24BDB2010], v14);

  -[HRVideoPlayerView queuePlayer](self, "queuePlayer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "currentItem");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__didReceivePlayerNotification_, *MEMORY[0x24BDB2038], v16);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

}

void __40__HRVideoPlayerView__setUpNotifications__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  int v3;
  void *v4;
  float v5;
  float v6;
  void *v7;
  void *v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v8 = WeakRetained;
    v3 = objc_msgSend(WeakRetained, "shouldBePlaying");
    v2 = v8;
    if (v3)
    {
      objc_msgSend(v8, "queuePlayer");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "rate");
      v6 = v5;

      v2 = v8;
      if (v6 < 1.0)
      {
        objc_msgSend(v8, "queuePlayer");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "play");

        v2 = v8;
      }
    }
  }

}

void __40__HRVideoPlayerView__setUpNotifications__block_invoke_2(uint64_t a1)
{
  void *v1;
  float v2;
  float v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "queuePlayer");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "rate");
  v3 = v2;

  if (v3 > 0.0)
  {
    objc_msgSend(WeakRetained, "queuePlayer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pause");

  }
}

- (void)_didReceivePlayerNotification:(id)a3
{
  id v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  const char *v21;
  void *v22;
  int v23;
  void *v24;
  int v25;
  HRVideoPlayerView *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(v5, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v5, "object");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "error");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {

    }
    else
    {
      objc_msgSend(v8, "errorLog");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v10)
        goto LABEL_16;
    }
    objc_msgSend(v5, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BDB1FF8]);

    if (!v12)
    {
      objc_msgSend(v5, "name");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "isEqualToString:", *MEMORY[0x24BDB2010]);

      if (v19)
      {
        _HKInitializeLogging();
        v20 = (void *)*MEMORY[0x24BDD3010];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3010], OS_LOG_TYPE_ERROR))
          goto LABEL_16;
        v14 = v20;
        NSStringFromSelector(a2);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "error");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 138543874;
        v26 = self;
        v27 = 2114;
        v28 = v15;
        v29 = 2112;
        v30 = v16;
        v21 = "[%{public}@ %{public}@] Playback stalled while playing content with error: %@";
      }
      else
      {
        objc_msgSend(v5, "name");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "isEqualToString:", *MEMORY[0x24BDB2038]);

        if (!v23)
          goto LABEL_16;
        _HKInitializeLogging();
        v24 = (void *)*MEMORY[0x24BDD3010];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3010], OS_LOG_TYPE_ERROR))
          goto LABEL_16;
        v14 = v24;
        NSStringFromSelector(a2);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "error");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 138543874;
        v26 = self;
        v27 = 2114;
        v28 = v15;
        v29 = 2112;
        v30 = v16;
        v21 = "[%{public}@ %{public}@] Time jumped while playing content with error: %@";
      }
      _os_log_error_impl(&dword_215454000, v14, OS_LOG_TYPE_ERROR, v21, (uint8_t *)&v25, 0x20u);
      goto LABEL_15;
    }
    _HKInitializeLogging();
    v13 = (void *)*MEMORY[0x24BDD3010];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3010], OS_LOG_TYPE_ERROR))
    {
      v14 = v13;
      NSStringFromSelector(a2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "errorLog");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "error");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138544130;
      v26 = self;
      v27 = 2114;
      v28 = v15;
      v29 = 2112;
      v30 = v16;
      v31 = 2112;
      v32 = v17;
      _os_log_error_impl(&dword_215454000, v14, OS_LOG_TYPE_ERROR, "[%{public}@ %{public}@] Failed to play content, new error log entry %@ with error: %@", (uint8_t *)&v25, 0x2Au);

LABEL_15:
    }
LABEL_16:

  }
}

- (NSArray)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
  objc_storeStrong((id *)&self->_items, a3);
}

- (UIImage)thumbnail
{
  return self->_thumbnail;
}

- (void)setThumbnail:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnail, a3);
}

- (UIImageView)thumbnailImageView
{
  return self->_thumbnailImageView;
}

- (void)setThumbnailImageView:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnailImageView, a3);
}

- (AVQueuePlayer)queuePlayer
{
  return self->_queuePlayer;
}

- (void)setQueuePlayer:(id)a3
{
  objc_storeStrong((id *)&self->_queuePlayer, a3);
}

- (AVPlayerLooper)playerLooper
{
  return self->_playerLooper;
}

- (void)setPlayerLooper:(id)a3
{
  objc_storeStrong((id *)&self->_playerLooper, a3);
}

- (BOOL)looping
{
  return self->_looping;
}

- (void)setLooping:(BOOL)a3
{
  self->_looping = a3;
}

- (BOOL)shouldBePlaying
{
  return self->_shouldBePlaying;
}

- (void)setShouldBePlaying:(BOOL)a3
{
  self->_shouldBePlaying = a3;
}

- (NSObject)applicationActiveNotificationStub
{
  return self->_applicationActiveNotificationStub;
}

- (void)setApplicationActiveNotificationStub:(id)a3
{
  objc_storeStrong((id *)&self->_applicationActiveNotificationStub, a3);
}

- (NSObject)applicationInactiveNotificationStub
{
  return self->_applicationInactiveNotificationStub;
}

- (void)setApplicationInactiveNotificationStub:(id)a3
{
  objc_storeStrong((id *)&self->_applicationInactiveNotificationStub, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationInactiveNotificationStub, 0);
  objc_storeStrong((id *)&self->_applicationActiveNotificationStub, 0);
  objc_storeStrong((id *)&self->_playerLooper, 0);
  objc_storeStrong((id *)&self->_queuePlayer, 0);
  objc_storeStrong((id *)&self->_thumbnailImageView, 0);
  objc_storeStrong((id *)&self->_thumbnail, 0);
  objc_storeStrong((id *)&self->_items, 0);
}

@end
