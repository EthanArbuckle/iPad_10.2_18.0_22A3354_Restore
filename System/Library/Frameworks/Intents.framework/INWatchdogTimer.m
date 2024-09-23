@implementation INWatchdogTimer

uint64_t __24__INWatchdogTimer_start__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_start");
}

- (void)_start
{
  NSObject *timerSource;
  dispatch_time_t v4;
  void *v5;
  double v6;

  if (self->_isStopped)
  {
    timerSource = self->_timerSource;
    v4 = dispatch_time(0, (uint64_t)(self->_remainingInterval * 1000000000.0));
    dispatch_source_set_timer(timerSource, v4, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_resume((dispatch_object_t)self->_timerSource);
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "systemUptime");
    self->_startTime = v6;

    self->_isStopped = 0;
  }
}

uint64_t __45__INWatchdogTimer_cancelIfNotAlreadyCanceled__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_cancelIfNotAlreadyCanceled");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __29__INWatchdogTimer_isCanceled__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_isCanceled");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)_cancelIfNotAlreadyCanceled
{
  BOOL v3;

  v3 = -[INWatchdogTimer _isCanceled](self, "_isCanceled");
  if (!v3)
    -[INWatchdogTimer _cancel](self, "_cancel");
  return !v3;
}

- (BOOL)_isCanceled
{
  return dispatch_source_testcancel((dispatch_source_t)self->_timerSource) != 0;
}

- (void)_cancel
{
  dispatch_source_cancel((dispatch_source_t)self->_timerSource);
  if (self->_isStopped)
  {
    dispatch_resume((dispatch_object_t)self->_timerSource);
    self->_isStopped = 0;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_timerSource, 0);
}

- (BOOL)cancelIfNotAlreadyCanceled
{
  NSObject *internalQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__INWatchdogTimer_cancelIfNotAlreadyCanceled__block_invoke;
  v5[3] = &unk_1E228F138;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_isStopped)
    dispatch_resume((dispatch_object_t)self->_timerSource);
  v3.receiver = self;
  v3.super_class = (Class)INWatchdogTimer;
  -[INWatchdogTimer dealloc](&v3, sel_dealloc);
}

- (BOOL)isCanceled
{
  NSObject *internalQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __29__INWatchdogTimer_isCanceled__block_invoke;
  v5[3] = &unk_1E228F138;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)start
{
  NSObject *internalQueue;
  _QWORD block[5];

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __24__INWatchdogTimer_start__block_invoke;
  block[3] = &unk_1E2294DE0;
  block[4] = self;
  dispatch_sync(internalQueue, block);
}

- (INWatchdogTimer)initWithTimeoutInterval:(double)a3 onQueue:(id)a4 timeoutHandler:(id)a5
{
  NSObject *v8;
  id v9;
  INWatchdogTimer *v10;
  INWatchdogTimer *v11;
  dispatch_source_t v12;
  OS_dispatch_source *timerSource;
  dispatch_queue_t v14;
  OS_dispatch_queue *internalQueue;
  NSObject *v16;
  _QWORD handler[4];
  id v19;
  id v20;
  id location;
  objc_super v22;

  v8 = a4;
  v9 = a5;
  v22.receiver = self;
  v22.super_class = (Class)INWatchdogTimer;
  v10 = -[INWatchdogTimer init](&v22, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_interval = a3;
    v10->_remainingInterval = a3;
    v12 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v8);
    timerSource = v11->_timerSource;
    v11->_timerSource = (OS_dispatch_source *)v12;

    v14 = dispatch_queue_create("com.apple.intents.INWatchdogTimer", 0);
    internalQueue = v11->_internalQueue;
    v11->_internalQueue = (OS_dispatch_queue *)v14;

    objc_initWeak(&location, v11);
    v16 = v11->_timerSource;
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __66__INWatchdogTimer_initWithTimeoutInterval_onQueue_timeoutHandler___block_invoke;
    handler[3] = &unk_1E228C328;
    objc_copyWeak(&v20, &location);
    v19 = v9;
    dispatch_source_set_event_handler(v16, handler);
    v11->_isStopped = 1;

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }

  return v11;
}

- (INWatchdogTimer)initWithTimeoutInterval:(double)a3 timeoutHandler:(id)a4
{
  void *v7;
  INWatchdogTimer *v8;

  dispatch_get_global_queue(17, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[INWatchdogTimer initWithTimeoutInterval:onQueue:timeoutHandler:](self, "initWithTimeoutInterval:onQueue:timeoutHandler:", v7, a4, a3);

  return v8;
}

- (void)stop
{
  NSObject *internalQueue;
  _QWORD block[5];

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __23__INWatchdogTimer_stop__block_invoke;
  block[3] = &unk_1E2294DE0;
  block[4] = self;
  dispatch_sync(internalQueue, block);
}

- (void)cancel
{
  NSObject *internalQueue;
  _QWORD block[5];

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __25__INWatchdogTimer_cancel__block_invoke;
  block[3] = &unk_1E2294DE0;
  block[4] = self;
  dispatch_sync(internalQueue, block);
}

- (void)_stop
{
  void *v3;
  double v4;
  double v5;
  double v6;

  if (!self->_isStopped)
  {
    dispatch_suspend((dispatch_object_t)self->_timerSource);
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "systemUptime");
    v5 = v4 - self->_startTime;

    v6 = self->_interval - v5;
    if (v6 < 0.0)
      v6 = 0.0;
    self->_remainingInterval = v6;
    self->_isStopped = 1;
  }
}

- (void)_reset
{
  -[INWatchdogTimer _stop](self, "_stop");
  self->_remainingInterval = self->_interval;
  -[INWatchdogTimer _start](self, "_start");
}

uint64_t __25__INWatchdogTimer_cancel__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cancel");
}

uint64_t __23__INWatchdogTimer_stop__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_stop");
}

uint64_t __66__INWatchdogTimer_initWithTimeoutInterval_onQueue_timeoutHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "cancel");

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
