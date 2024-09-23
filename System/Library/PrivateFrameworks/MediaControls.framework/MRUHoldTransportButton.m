@implementation MRUHoldTransportButton

- (MRUHoldTransportButton)initWithFrame:(CGRect)a3
{
  MRUHoldTransportButton *v3;
  MRUHoldTransportButton *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MRUHoldTransportButton;
  v3 = -[MRUTransportButton initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[MRUHoldTransportButton addTarget:action:forControlEvents:](v3, "addTarget:action:forControlEvents:", v3, sel_beganHold_, 0x1000000);
    -[MRUHoldTransportButton addTarget:action:forControlEvents:](v4, "addTarget:action:forControlEvents:", v4, sel_releasedHold_, 0x2000000);
    -[MRUHoldTransportButton addTarget:action:forControlEvents:](v4, "addTarget:action:forControlEvents:", v4, sel_dragEnter_, 16);
    -[MRUHoldTransportButton addTarget:action:forControlEvents:](v4, "addTarget:action:forControlEvents:", v4, sel_releasedHold_, 32);
  }
  return v4;
}

- (void)setTransportControlItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  MRUForwardBackwardPackageStateNameForState(-[MRUTransportButton packageState](self, "packageState"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "asset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "packageAsset");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setGlyphState:", v5);

  v8.receiver = self;
  v8.super_class = (Class)MRUHoldTransportButton;
  -[MRUTransportButton setTransportControlItem:](&v8, sel_setTransportControlItem_, v4);

}

- (void)setAnimationTimer:(id)a3
{
  NSTimer *v4;
  void *v5;
  NSTimer *animationTimer;

  v4 = (NSTimer *)a3;
  -[MRUHoldTransportButton animationTimer](self, "animationTimer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidate");

  animationTimer = self->_animationTimer;
  self->_animationTimer = v4;

}

- (void)dragEnter:(id)a3
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "isHolding"))
    -[MRUHoldTransportButton beganHold:](self, "beganHold:", v4);

}

- (void)beganHold:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void (**v8)(void);
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  id location;

  v4 = a3;
  -[MRUTransportButton transportControlItem](self, "transportControlItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "supportsHolding"))
  {
    objc_initWeak(&location, self);
    v6 = (void *)MEMORY[0x1E0C99E88];
    v9 = MEMORY[0x1E0C809B0];
    v10 = 3221225472;
    v11 = __36__MRUHoldTransportButton_beganHold___block_invoke;
    v12 = &unk_1E58190C0;
    objc_copyWeak(&v13, &location);
    objc_msgSend(v6, "scheduledTimerWithTimeInterval:repeats:block:", 1, &v9, 0.5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRUHoldTransportButton setAnimationTimer:](self, "setAnimationTimer:", v7, v9, v10, v11, v12);

    objc_msgSend(v5, "holdBeganAction");
    v8 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v8[2]();

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

}

void __36__MRUHoldTransportButton_beganHold___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "setPackageState:", MRUForwardBackwardPackageStateNextStateForState(objc_msgSend(WeakRetained, "packageState")));
    WeakRetained = v2;
  }

}

- (void)releasedHold:(id)a3
{
  void (**v4)(void);
  id v5;

  -[MRUHoldTransportButton setAnimationTimer:](self, "setAnimationTimer:", 0);
  -[MRUTransportButton transportControlItem](self, "transportControlItem");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "supportsHolding"))
  {
    objc_msgSend(v5, "holdEndAction");
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v4[2]();

  }
}

- (NSTimer)animationTimer
{
  return self->_animationTimer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animationTimer, 0);
}

@end
