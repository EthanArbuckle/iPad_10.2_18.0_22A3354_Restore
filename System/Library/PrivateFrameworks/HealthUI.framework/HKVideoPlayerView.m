@implementation HKVideoPlayerView

- (HKVideoPlayerView)initWithItems:(id)a3 thumbnail:(id)a4 looping:(BOOL)a5
{
  id v9;
  id v10;
  HKVideoPlayerView *v11;
  HKVideoPlayerView *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HKVideoPlayerView;
  v11 = -[HKVideoPlayerView initWithFrame:](&v14, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_items, a3);
    objc_storeStrong((id *)&v12->_thumbnail, a4);
    v12->_looping = a5;
    -[HKVideoPlayerView _setUpUI](v12, "_setUpUI");
    -[HKVideoPlayerView _setUpNotifications](v12, "_setUpNotifications");
  }

  return v12;
}

+ (id)playerViewWithURL:(id)a3 looping:(BOOL)a4
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
  v19[1] = *MEMORY[0x1E0C80C00];
  v5 = (objc_class *)MEMORY[0x1E0C8B3C0];
  v6 = a3;
  v7 = (void *)objc_msgSend([v5 alloc], "initWithURL:options:", v6, 0);
  objc_msgSend(MEMORY[0x1E0C8B300], "playerItemWithURL:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "hk_assetSize");
  v10 = v9;
  v12 = v11;
  objc_msgSend(v7, "hk_thumbnailImage");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_alloc((Class)objc_opt_class());
  v19[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v14, "initWithItems:thumbnail:looping:", v15, v13, v4);

  objc_msgSend(v16, "hk_constraintAspectRatioFromSize:", v10, v12);
  objc_msgSend(v16, "layer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setNeedsDisplayOnBoundsChange:", 1);

  return v16;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKVideoPlayerView applicationActiveNotificationStub](self, "applicationActiveNotificationStub");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", v4);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKVideoPlayerView applicationInactiveNotificationStub](self, "applicationInactiveNotificationStub");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", v6);

  v7.receiver = self;
  v7.super_class = (Class)HKVideoPlayerView;
  -[HKVideoPlayerView dealloc](&v7, sel_dealloc);
}

- (void)setPreventsDisplaySleepDuringVideoPlayback:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[HKVideoPlayerView queuePlayer](self, "queuePlayer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPreventsDisplaySleepDuringVideoPlayback:", v3);

}

- (BOOL)preventsDisplaySleepDuringVideoPlayback
{
  void *v2;
  char v3;

  -[HKVideoPlayerView queuePlayer](self, "queuePlayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "preventsDisplaySleepDuringVideoPlayback");

  return v3;
}

- (void)play
{
  void *v3;

  -[HKVideoPlayerView queuePlayer](self, "queuePlayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "play");

  -[HKVideoPlayerView setShouldBePlaying:](self, "setShouldBePlaying:", 1);
}

- (void)pause
{
  void *v3;

  -[HKVideoPlayerView queuePlayer](self, "queuePlayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pause");

  -[HKVideoPlayerView setShouldBePlaying:](self, "setShouldBePlaying:", 0);
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (id)player
{
  void *v2;
  void *v3;

  -[HKVideoPlayerView layer](self, "layer");
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
  -[HKVideoPlayerView layer](self, "layer");
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
  id v25;

  v3 = (void *)MEMORY[0x1E0C8B350];
  -[HKVideoPlayerView items](self, "items");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "queuePlayerWithItems:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKVideoPlayerView setQueuePlayer:](self, "setQueuePlayer:", v5);

  -[HKVideoPlayerView queuePlayer](self, "queuePlayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPreventsDisplaySleepDuringVideoPlayback:", 0);

  v7 = (void *)MEMORY[0x1E0C8B338];
  -[HKVideoPlayerView queuePlayer](self, "queuePlayer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKVideoPlayerView items](self, "items");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "playerLooperWithPlayer:templateItem:", v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKVideoPlayerView setPlayerLooper:](self, "setPlayerLooper:", v11);

  -[HKVideoPlayerView layer](self, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setShouldRasterize:", 1);

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "scale");
  v15 = v14;
  -[HKVideoPlayerView layer](self, "layer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setRasterizationScale:", v15);

  -[HKVideoPlayerView thumbnail](self, "thumbnail");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    v18 = objc_alloc(MEMORY[0x1E0DC3890]);
    -[HKVideoPlayerView thumbnail](self, "thumbnail");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v18, "initWithImage:", v19);
    -[HKVideoPlayerView setThumbnailImageView:](self, "setThumbnailImageView:", v20);

    -[HKVideoPlayerView thumbnailImageView](self, "thumbnailImageView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[HKVideoPlayerView thumbnailImageView](self, "thumbnailImageView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKVideoPlayerView insertSubview:atIndex:](self, "insertSubview:atIndex:", v22, 0);

    -[HKVideoPlayerView thumbnailImageView](self, "thumbnailImageView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "hk_alignConstraintsWithView:", self);

  }
  if (!-[HKVideoPlayerView looping](self, "looping"))
  {
    -[HKVideoPlayerView playerLooper](self, "playerLooper");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "disableLooping");

  }
  -[HKVideoPlayerView queuePlayer](self, "queuePlayer");
  v25 = (id)objc_claimAutoreleasedReturnValue();
  -[HKVideoPlayerView setPlayer:](self, "setPlayer:", v25);

}

- (void)_setUpNotifications
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id location;

  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0DC4750];
  v6 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __40__HKVideoPlayerView__setUpNotifications__block_invoke;
  v14[3] = &unk_1E9C41F68;
  objc_copyWeak(&v15, &location);
  objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", v5, 0, v4, v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKVideoPlayerView setApplicationActiveNotificationStub:](self, "setApplicationActiveNotificationStub:", v7);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x1E0DC4868];
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __40__HKVideoPlayerView__setUpNotifications__block_invoke_2;
  v12[3] = &unk_1E9C41F68;
  objc_copyWeak(&v13, &location);
  objc_msgSend(v8, "addObserverForName:object:queue:usingBlock:", v10, 0, v9, v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKVideoPlayerView setApplicationInactiveNotificationStub:](self, "setApplicationInactiveNotificationStub:", v11);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __40__HKVideoPlayerView__setUpNotifications__block_invoke(uint64_t a1)
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

void __40__HKVideoPlayerView__setUpNotifications__block_invoke_2(uint64_t a1)
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
