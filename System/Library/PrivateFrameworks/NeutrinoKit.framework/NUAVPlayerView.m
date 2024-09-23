@implementation NUAVPlayerView

- (void)setPlayer:(id)a3
{
  void *v5;
  AVPlayer *v6;

  v6 = (AVPlayer *)a3;
  if (self->_player != v6)
  {
    objc_storeStrong((id *)&self->_player, a3);
    -[NUAVPlayerView layer](self, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPlayer:", v6);

  }
}

- (NUAVPlayerView)initWithFrame:(CGRect)a3
{
  NUAVPlayerView *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NUAVPlayerView;
  v3 = -[NUAVPlayerView initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  _commonInit(v3);
  return v3;
}

- (NUAVPlayerView)initWithCoder:(id)a3
{
  NUAVPlayerView *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NUAVPlayerView;
  v3 = -[NUAVPlayerView initWithCoder:](&v5, sel_initWithCoder_, a3);
  _commonInit(v3);
  return v3;
}

- (void)dispose
{
  id v3;

  if (!self->_observerDetached)
  {
    self->_observerDetached = 1;
    -[NUAVPlayerView layer](self, "layer");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, CFSTR("readyForDisplay"), PlayerLayerReadyForDisplayObservationContext);

  }
}

- (void)dealloc
{
  objc_super v3;

  -[NUAVPlayerView dispose](self, "dispose");
  v3.receiver = self;
  v3.super_class = (Class)NUAVPlayerView;
  -[NUAVPlayerView dealloc](&v3, sel_dealloc);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  void *v11;
  int *p_updateReadyForDisplayID;
  unsigned int v13;
  uint64_t v14;
  dispatch_time_t v15;
  objc_super v16;
  _QWORD block[4];
  id v18;
  int v19;
  id location;

  v10 = a4;
  v11 = v10;
  if ((void *)PlayerLayerReadyForDisplayObservationContext == a6)
  {
    p_updateReadyForDisplayID = &self->_updateReadyForDisplayID;
    do
    {
      v13 = __ldaxr((unsigned int *)p_updateReadyForDisplayID);
      v14 = v13 + 1;
    }
    while (__stlxr(v14, (unsigned int *)p_updateReadyForDisplayID));
    if (objc_msgSend(v10, "isReadyForDisplay"))
    {
      -[NUAVPlayerView _updateReadyForDisplayWithID:](self, "_updateReadyForDisplayWithID:", v14);
    }
    else
    {
      objc_initWeak(&location, self);
      v15 = dispatch_time(0, 300000000);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __65__NUAVPlayerView_observeValueForKeyPath_ofObject_change_context___block_invoke;
      block[3] = &unk_24C625520;
      objc_copyWeak(&v18, &location);
      v19 = v14;
      dispatch_after(v15, MEMORY[0x24BDAC9B8], block);
      objc_destroyWeak(&v18);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)NUAVPlayerView;
    -[NUAVPlayerView observeValueForKeyPath:ofObject:change:context:](&v16, sel_observeValueForKeyPath_ofObject_change_context_, a3, v10, a5, a6);
  }

}

- (void)_updateReadyForDisplayWithID:(int)a3
{
  unsigned int v3;
  id v5;

  v3 = atomic_load((unsigned int *)&self->_updateReadyForDisplayID);
  if (v3 == a3)
  {
    -[NUAVPlayerView layer](self, "layer");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[NUAVPlayerView _setReadyForDisplay:](self, "_setReadyForDisplay:", objc_msgSend(v5, "isReadyForDisplay"));

  }
}

- (void)_setReadyForDisplay:(BOOL)a3
{
  id v4;

  if (self->_readyForDisplay != a3)
  {
    self->_readyForDisplay = a3;
    -[NUAVPlayerView delegate](self, "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "playerViewReadyForDisplayDidChange:", self);

  }
}

- (AVPlayer)player
{
  return self->_player;
}

- (BOOL)isReadyForDisplay
{
  return self->_readyForDisplay;
}

- (NUAVPlayerViewDelegate)delegate
{
  return (NUAVPlayerViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_player, 0);
}

void __65__NUAVPlayerView_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = atomic_load((unsigned int *)(a1 + 40));
  objc_msgSend(WeakRetained, "_updateReadyForDisplayWithID:", v2);

}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

@end
