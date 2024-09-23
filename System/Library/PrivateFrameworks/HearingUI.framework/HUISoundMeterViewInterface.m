@implementation HUISoundMeterViewInterface

- (HUISoundMeterViewInterface)initWithConfigurationType:(unint64_t)a3 delegate:(id)a4 source:(unint64_t)a5
{
  id v8;
  HUISoundMeterViewInterface *v9;
  HUISoundMeterViewInterfaceInternal *v10;
  HUISoundMeterListener *v11;
  objc_super v13;

  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HUISoundMeterViewInterface;
  v9 = -[HUISoundMeterViewInterface init](&v13, sel_init);
  if (v9)
  {
    v10 = -[HUISoundMeterViewInterfaceInternal initWithConfigurationType:]([HUISoundMeterViewInterfaceInternal alloc], "initWithConfigurationType:", a3);
    -[HUISoundMeterViewInterface setSoundMeterViewInterfaceInternal:](v9, "setSoundMeterViewInterfaceInternal:", v10);

    -[HUISoundMeterViewInterface setDelegate:](v9, "setDelegate:", v8);
    v11 = -[HUISoundMeterListener initWithDelgate:source:]([HUISoundMeterListener alloc], "initWithDelgate:source:", v9, a5);
    -[HUISoundMeterViewInterface setMeteringListener:](v9, "setMeteringListener:", v11);

  }
  return v9;
}

- (id)soundMeterViewController
{
  void *v2;
  void *v3;

  -[HUISoundMeterViewInterface soundMeterViewInterfaceInternal](self, "soundMeterViewInterfaceInternal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "soundMeterViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)soundMeterView
{
  void *v2;
  void *v3;
  void *v4;

  -[HUISoundMeterViewInterface soundMeterViewInterfaceInternal](self, "soundMeterViewInterfaceInternal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "soundMeterViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)start
{
  id v2;

  -[HUISoundMeterViewInterface meteringListener](self, "meteringListener");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "start");

}

- (void)stop
{
  id v2;

  -[HUISoundMeterViewInterface meteringListener](self, "meteringListener");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stop");

}

- (BOOL)shouldShow
{
  void *v2;
  char v3;

  -[HUISoundMeterViewInterface meteringListener](self, "meteringListener");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldShow");

  return v3;
}

- (void)liveLevelMeteringDisplayStateChanged:(BOOL)a3
{
  void *v3;
  char v4;

  -[HUISoundMeterViewInterface delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
    AXPerformBlockOnMainThread();
}

void __67__HUISoundMeterViewInterface_liveLevelMeteringDisplayStateChanged___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "soundMeterViewInterfaceDisplayStateChanged:", *(unsigned __int8 *)(a1 + 40));

}

- (void)updateViewsWith:(double)a3 fastLeq:(double)a4 thresholdLevel:(unint64_t)a5
{
  id v8;

  -[HUISoundMeterViewInterface soundMeterViewInterfaceInternal](self, "soundMeterViewInterfaceInternal");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateViewsWithSlowLeq:fastLeq:thresholdLevel:", a5, a3, a4);

}

- (void)localSourceAvailableDidUpdate:(BOOL)a3
{
  void *v3;
  char v4;

  -[HUISoundMeterViewInterface delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
    AXPerformBlockOnMainThread();
}

void __60__HUISoundMeterViewInterface_localSourceAvailableDidUpdate___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localSourceAvailableDidUpdate:", *(unsigned __int8 *)(a1 + 40));

}

- (void)remoteSourceAvailableDidUpdate:(BOOL)a3
{
  void *v3;
  char v4;

  -[HUISoundMeterViewInterface delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
    AXPerformBlockOnMainThread();
}

void __61__HUISoundMeterViewInterface_remoteSourceAvailableDidUpdate___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteSourceAvailableDidUpdate:", *(unsigned __int8 *)(a1 + 40));

}

- (HUISoundMeterViewInterfaceInternal)soundMeterViewInterfaceInternal
{
  return self->_soundMeterViewInterfaceInternal;
}

- (void)setSoundMeterViewInterfaceInternal:(id)a3
{
  objc_storeStrong((id *)&self->_soundMeterViewInterfaceInternal, a3);
}

- (HUISoundMeterListener)meteringListener
{
  return self->_meteringListener;
}

- (void)setMeteringListener:(id)a3
{
  objc_storeStrong((id *)&self->_meteringListener, a3);
}

- (HUISoundMeterViewInterfaceDelegate)delegate
{
  return (HUISoundMeterViewInterfaceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_meteringListener, 0);
  objc_storeStrong((id *)&self->_soundMeterViewInterfaceInternal, 0);
}

@end
