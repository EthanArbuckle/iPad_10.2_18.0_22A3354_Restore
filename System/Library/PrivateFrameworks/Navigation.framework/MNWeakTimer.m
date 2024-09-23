@implementation MNWeakTimer

+ (id)scheduledTimerWithTimeInterval:(double)a3 target:(id)a4 selector:(SEL)a5
{
  id v7;
  MNWeakTimer *v8;

  v7 = a4;
  v8 = -[MNWeakTimer initWithTimeInterval:target:selector:]([MNWeakTimer alloc], "initWithTimeInterval:target:selector:", v7, a5, a3);

  return v8;
}

- (MNWeakTimer)initWithTimeInterval:(double)a3 target:(id)a4 selector:(SEL)a5
{
  id v8;
  MNWeakTimer *v9;
  MNWeakTimer *v10;
  uint64_t v11;
  NSTimer *timer;
  objc_super v14;

  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MNWeakTimer;
  v9 = -[MNWeakTimer init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeWeak(&v9->_target, v8);
    v10->_selector = a5;
    objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", v10, sel__timerDidFire, 0, 0, a3);
    v11 = objc_claimAutoreleasedReturnValue();
    timer = v10->_timer;
    v10->_timer = (NSTimer *)v11;

  }
  return v10;
}

- (void)dealloc
{
  NSTimer *timer;
  objc_super v4;

  -[NSTimer invalidate](self->_timer, "invalidate");
  timer = self->_timer;
  self->_timer = 0;

  v4.receiver = self;
  v4.super_class = (Class)MNWeakTimer;
  -[MNWeakTimer dealloc](&v4, sel_dealloc);
}

- (void)invalidate
{
  NSTimer *timer;

  -[NSTimer invalidate](self->_timer, "invalidate");
  timer = self->_timer;
  self->_timer = 0;

}

- (void)_timerDidFire
{
  void *v3;
  id v4;

  -[MNWeakTimer target](self, "target");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[MNWeakTimer target](self, "target");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "performSelector:", -[MNWeakTimer selector](self, "selector"));

  }
  else
  {
    -[MNWeakTimer invalidate](self, "invalidate");
  }
}

- (id)target
{
  return objc_loadWeakRetained(&self->_target);
}

- (void)setTarget:(id)a3
{
  objc_storeWeak(&self->_target, a3);
}

- (SEL)selector
{
  return self->_selector;
}

- (void)setSelector:(SEL)a3
{
  self->_selector = a3;
}

- (NSTimer)timer
{
  return self->_timer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_destroyWeak(&self->_target);
}

@end
