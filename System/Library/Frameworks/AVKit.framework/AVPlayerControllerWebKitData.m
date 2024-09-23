@implementation AVPlayerControllerWebKitData

- (AVPlayerControllerWebKitData)initWithPlayerController:(id)a3
{
  id v4;
  AVPlayerControllerWebKitData *v5;
  AVPlayerControllerWebKitData *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AVPlayerControllerWebKitData;
  v5 = -[AVPlayerControllerWebKitData init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_playerController, v4);
    v6->_scrubbing = 0;
    v6->_seekToTime = NAN;
    objc_storeWeak((id *)&v6->_delegate, 0);
  }

  return v6;
}

- (void)setScrubbing:(BOOL)a3
{
  _BOOL8 v3;
  id WeakRetained;
  id v6;

  if (self->_scrubbing != a3)
  {
    v3 = a3;
    self->_scrubbing = a3;
    -[AVPlayerControllerWebKitData delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_playerController);
      objc_msgSend(v6, "webkitPlayerController:didChangeScrubbingStateTo:", WeakRetained, v3);

    }
  }
}

- (void)setSeekToTime:(double)a3
{
  id WeakRetained;
  id v6;

  if (self->_seekToTime != a3)
  {
    self->_seekToTime = a3;
    -[AVPlayerControllerWebKitData delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_playerController);
      objc_msgSend(v6, "webkitPlayerController:didUpdateSeekToTime:", WeakRetained, a3);

    }
  }
}

- (AVPlayerControllerWebKitDelegate)delegate
{
  return (AVPlayerControllerWebKitDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isScrubbing
{
  return self->_scrubbing;
}

- (double)seekToTime
{
  return self->_seekToTime;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_playerController);
}

@end
