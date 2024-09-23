@implementation MPCSleepTimerEngineObserver

- (MPCSleepTimerEngineObserver)initWithDelegate:(id)a3
{
  id v4;
  MPCSleepTimerEngineObserver *v5;
  MPCSleepTimerEngineObserver *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MPCSleepTimerEngineObserver;
  v5 = -[MPCSleepTimerEngineObserver init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[MPCSleepTimerEngineObserver setDelegate:](v5, "setDelegate:", v4);

  return v6;
}

- (void)engine:(id)a3 didEndPlaybackOfItem:(id)a4
{
  id v4;

  -[MPCSleepTimerEngineObserver delegate](self, "delegate", a3, a4);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "didEndPlaybackForCurrentItem");

}

- (void)engine:(id)a3 didChangeItemElapsedTime:(double)a4 rate:(float)a5
{
  id v6;

  -[MPCSleepTimerEngineObserver delegate](self, "delegate", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "didChangeItemElapsedTime:", a4);

}

- (MPCSleepTimerEngineObserverDelegate)delegate
{
  return (MPCSleepTimerEngineObserverDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
