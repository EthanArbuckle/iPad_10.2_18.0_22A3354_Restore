@implementation NPKWifiObserver

- (NPKWifiObserver)initWithCallbackQueue:(id)a3
{
  id v4;
  NPKWifiObserver *v5;
  OS_dispatch_queue *v6;
  OS_dispatch_queue *callbackQueue;
  NPKWifiObserver *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NPKWifiObserver;
  v5 = -[NPKWifiObserver init](&v10, sel_init);
  if (v5)
  {
    if (v4)
    {
      v6 = (OS_dispatch_queue *)v4;
    }
    else
    {
      dispatch_get_global_queue(0, 0);
      v6 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue();
    }
    callbackQueue = v5->_callbackQueue;
    v5->_callbackQueue = v6;

    -[NPKWifiObserver _setupInterface](v5, "_setupInterface");
    v8 = v5;
  }

  return v5;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)NPKWifiObserver;
  -[NPKWifiObserver dealloc](&v2, sel_dealloc);
}

- (BOOL)isWifiEnabled
{
  return 1;
}

- (NPKWiFiObserverDelegate)delegate
{
  return (NPKWiFiObserverDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
}

@end
