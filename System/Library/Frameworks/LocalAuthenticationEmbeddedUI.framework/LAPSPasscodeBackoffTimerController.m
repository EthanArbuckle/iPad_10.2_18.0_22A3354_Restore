@implementation LAPSPasscodeBackoffTimerController

- (LAPSPasscodeBackoffTimerController)initWithTimeout:(int64_t)a3 updateHandler:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  LAPSPasscodeBackoffTimerController *v10;
  LAPSPasscodeBackoffTimerController *v11;
  uint64_t v12;
  id updateHandler;
  uint64_t v14;
  id completionHandler;
  objc_super v17;

  v8 = a4;
  v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)LAPSPasscodeBackoffTimerController;
  v10 = -[LAPSPasscodeBackoffTimerController init](&v17, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_timeout = a3;
    v12 = MEMORY[0x2348AF9C0](v8);
    updateHandler = v11->_updateHandler;
    v11->_updateHandler = (id)v12;

    v14 = MEMORY[0x2348AF9C0](v9);
    completionHandler = v11->_completionHandler;
    v11->_completionHandler = (id)v14;

  }
  return v11;
}

- (void)start
{
  NSObject *timer;

  timer = self->_timer;
  if (!timer || dispatch_source_testcancel(timer))
    -[LAPSPasscodeBackoffTimerController _startTimerWithTimeout:](self, "_startTimerWithTimeout:", self->_timeout);
}

- (void)_startTimerWithTimeout:(int64_t)a3
{
  double v5;
  OS_dispatch_source *v6;
  OS_dispatch_source *v7;
  dispatch_time_t v8;
  NSObject *v9;
  OS_dispatch_source *timer;
  _QWORD v11[4];
  id v12[3];
  id location;

  if (a3 <= 0)
  {
    dispatch_source_cancel((dispatch_source_t)self->_timer);
    timer = self->_timer;
    self->_timer = 0;

    (*((void (**)(void))self->_completionHandler + 2))();
  }
  else
  {
    (*((void (**)(void))self->_updateHandler + 2))();
    if (a3 % 0x3CuLL)
      v5 = (double)(a3 % 0x3CuLL);
    else
      v5 = 60.0;
    v6 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDACA18], 0, 1uLL, MEMORY[0x24BDAC9B8]);
    v7 = self->_timer;
    self->_timer = v6;

    v8 = dispatch_time(0, (uint64_t)(v5 * 1000000000.0));
    dispatch_source_set_timer((dispatch_source_t)self->_timer, v8, 0xFFFFFFFFFFFFFFFFLL, 0);
    objc_initWeak(&location, self);
    v9 = self->_timer;
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __61__LAPSPasscodeBackoffTimerController__startTimerWithTimeout___block_invoke;
    v11[3] = &unk_24FDCE188;
    objc_copyWeak(v12, &location);
    v12[1] = (id)a3;
    v12[2] = *(id *)&v5;
    dispatch_source_set_event_handler(v9, v11);
    dispatch_activate((dispatch_object_t)self->_timer);
    objc_destroyWeak(v12);
    objc_destroyWeak(&location);
  }
}

void __61__LAPSPasscodeBackoffTimerController__startTimerWithTimeout___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_startTimerWithTimeout:", (uint64_t)fmax((double)*(uint64_t *)(a1 + 40) - *(double *)(a1 + 48), 0.0));
    WeakRetained = v3;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong(&self->_updateHandler, 0);
  objc_storeStrong((id *)&self->_timer, 0);
}

@end
