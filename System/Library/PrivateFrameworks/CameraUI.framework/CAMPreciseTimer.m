@implementation CAMPreciseTimer

- (CAMPreciseTimer)initWithDelay:(double)a3 interval:(double)a4 handler:(id)a5
{
  id v8;
  CAMPreciseTimer *v9;
  CAMPreciseTimer *v10;
  uint64_t v11;
  id handler;
  CAMPreciseTimer *v13;
  objc_super v15;

  v8 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CAMPreciseTimer;
  v9 = -[CAMPreciseTimer init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_delay = a3;
    v9->_interval = a4;
    v11 = objc_msgSend(v8, "copy");
    handler = v10->__handler;
    v10->__handler = (id)v11;

    v13 = v10;
  }

  return v10;
}

- (void)start
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  NSObject *v8;
  dispatch_time_t v9;
  id v10;
  _QWORD handler[4];
  id v12;
  id v13;
  id location;

  if (self->__currentTimer)
    -[CAMPreciseTimer invalidate](self, "invalidate");
  -[CAMPreciseTimer _setFired:](self, "_setFired:", 0);
  -[CAMPreciseTimer delay](self, "delay");
  v4 = v3;
  -[CAMPreciseTimer interval](self, "interval");
  v6 = v5;
  -[CAMPreciseTimer _handler](self, "_handler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, MEMORY[0x1E0C80D38]);
  v9 = dispatch_time(0, (uint64_t)(v4 * 1000000000.0));
  dispatch_source_set_timer(v8, v9, (unint64_t)(v6 * 1000000000.0), 0);
  objc_initWeak(&location, self);
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __24__CAMPreciseTimer_start__block_invoke;
  handler[3] = &unk_1EA32B1C8;
  objc_copyWeak(&v13, &location);
  v10 = v7;
  v12 = v10;
  dispatch_source_set_event_handler(v8, handler);
  dispatch_resume(v8);
  -[CAMPreciseTimer _setCurrentTimer:](self, "_setCurrentTimer:", v8);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

- (void)_setFired:(BOOL)a3
{
  self->_fired = a3;
}

- (double)delay
{
  return self->_delay;
}

- (double)interval
{
  return self->_interval;
}

- (id)_handler
{
  return self->__handler;
}

- (void)_setCurrentTimer:(id)a3
{
  objc_storeStrong((id *)&self->__currentTimer, a3);
}

- (void)invalidate
{
  NSObject *v3;
  NSObject *v4;

  -[CAMPreciseTimer _currentTimer](self, "_currentTimer");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    dispatch_source_cancel(v3);
    -[CAMPreciseTimer _setCurrentTimer:](self, "_setCurrentTimer:", 0);
    v3 = v4;
  }

}

- (OS_dispatch_source)_currentTimer
{
  return self->__currentTimer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__currentTimer, 0);
  objc_storeStrong(&self->__handler, 0);
}

- (CAMPreciseTimer)init
{
  return -[CAMPreciseTimer initWithDelay:interval:handler:](self, "initWithDelay:interval:handler:", 0, 0.0, 0.0);
}

void __24__CAMPreciseTimer_start__block_invoke(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_setFired:", 1);
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, WeakRetained);

}

- (BOOL)fired
{
  return self->_fired;
}

@end
