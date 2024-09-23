@implementation LNWatchdogTimer

uint64_t __24__LNWatchdogTimer_start__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_start");
}

uint64_t __24__LNWatchdogTimer_reset__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reset");
}

uint64_t __25__LNWatchdogTimer_cancel__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cancel");
}

- (void)_reset
{
  -[LNWatchdogTimer _stop](self, "_stop");
  self->_remainingInterval = self->_interval;
  -[LNWatchdogTimer _start](self, "_start");
}

- (void)setStopped:(BOOL)a3
{
  self->_stopped = a3;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;

  if (-[LNWatchdogTimer _isStopped](self, "_isStopped"))
  {
    -[LNWatchdogTimer timerSource](self, "timerSource");
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_resume(v3);

  }
  v4.receiver = self;
  v4.super_class = (Class)LNWatchdogTimer;
  -[LNWatchdogTimer dealloc](&v4, sel_dealloc);
}

- (void)_cancel
{
  dispatch_source_cancel((dispatch_source_t)self->_timerSource);
  if (-[LNWatchdogTimer _isStopped](self, "_isStopped"))
  {
    dispatch_resume((dispatch_object_t)self->_timerSource);
    -[LNWatchdogTimer setStopped:](self, "setStopped:", 0);
  }
}

- (void)_stop
{
  void *v3;
  double v4;
  double v5;

  if (!-[LNWatchdogTimer _isStopped](self, "_isStopped"))
  {
    dispatch_suspend((dispatch_object_t)self->_timerSource);
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "systemUptime");
    v5 = v4 - self->_startTime;

    -[LNWatchdogTimer setRemainingInterval:](self, "setRemainingInterval:", fmax(self->_interval - v5, 0.0));
    -[LNWatchdogTimer setStopped:](self, "setStopped:", 1);
  }
}

- (void)_start
{
  NSObject *timerSource;
  dispatch_time_t v4;
  void *v5;

  if (-[LNWatchdogTimer _isStopped](self, "_isStopped"))
  {
    timerSource = self->_timerSource;
    v4 = dispatch_time(0, (uint64_t)(self->_remainingInterval * 1000000000.0));
    dispatch_source_set_timer(timerSource, v4, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_resume((dispatch_object_t)self->_timerSource);
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "systemUptime");
    -[LNWatchdogTimer setStartTime:](self, "setStartTime:");

    -[LNWatchdogTimer setStopped:](self, "setStopped:", 0);
  }
}

- (BOOL)_isStopped
{
  return self->_stopped;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (void)setRemainingInterval:(double)a3
{
  self->_remainingInterval = a3;
}

- (void)cancel
{
  NSObject *internalQueue;
  _QWORD block[5];

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __25__LNWatchdogTimer_cancel__block_invoke;
  block[3] = &unk_1E45DDE18;
  block[4] = self;
  dispatch_sync(internalQueue, block);
}

- (void)start
{
  NSObject *internalQueue;
  _QWORD block[5];

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __24__LNWatchdogTimer_start__block_invoke;
  block[3] = &unk_1E45DDE18;
  block[4] = self;
  dispatch_sync(internalQueue, block);
}

- (LNWatchdogTimer)initWithTimeoutInterval:(double)a3 onQueue:(id)a4 timeoutHandler:(id)a5
{
  return -[LNWatchdogTimer initWithTimeoutInterval:onQueue:singleUse:timeoutHandler:](self, "initWithTimeoutInterval:onQueue:singleUse:timeoutHandler:", a4, 1, a5, a3);
}

- (LNWatchdogTimer)initWithTimeoutInterval:(double)a3 onQueue:(id)a4 singleUse:(BOOL)a5 timeoutHandler:(id)a6
{
  NSObject *v11;
  id v12;
  LNWatchdogTimer *v13;
  LNWatchdogTimer *v14;
  dispatch_source_t v15;
  OS_dispatch_source *timerSource;
  NSObject *v17;
  dispatch_queue_t v18;
  OS_dispatch_queue *internalQueue;
  NSObject *v20;
  LNWatchdogTimer *v21;
  void *v23;
  void *v24;
  void *v25;
  _QWORD handler[4];
  id v27;
  id v28;
  BOOL v29;
  id location;
  objc_super v31;

  v11 = a4;
  v12 = a6;
  if (a3 >= 0.0)
  {
    if (v11)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNWatchdogTimer.m"), 62, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("queue"));

    if (v12)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNWatchdogTimer.m"), 61, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("timeoutInterval >= 0"));

  if (!v11)
    goto LABEL_8;
LABEL_3:
  if (v12)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNWatchdogTimer.m"), 63, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("timeoutHandler"));

LABEL_4:
  v31.receiver = self;
  v31.super_class = (Class)LNWatchdogTimer;
  v13 = -[LNWatchdogTimer init](&v31, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_interval = a3;
    v13->_remainingInterval = a3;
    v15 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v11);
    timerSource = v14->_timerSource;
    v14->_timerSource = (OS_dispatch_source *)v15;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = dispatch_queue_create("com.apple.link.LNWatchdogTimer.internal-queue", v17);
    internalQueue = v14->_internalQueue;
    v14->_internalQueue = (OS_dispatch_queue *)v18;

    objc_initWeak(&location, v14);
    v20 = v14->_timerSource;
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __76__LNWatchdogTimer_initWithTimeoutInterval_onQueue_singleUse_timeoutHandler___block_invoke;
    handler[3] = &unk_1E45DCE98;
    objc_copyWeak(&v28, &location);
    v29 = a5;
    v27 = v12;
    dispatch_source_set_event_handler(v20, handler);
    v14->_stopped = 1;
    v21 = v14;

    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
  }

  return v14;
}

- (void)reset
{
  NSObject *internalQueue;
  _QWORD block[5];

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __24__LNWatchdogTimer_reset__block_invoke;
  block[3] = &unk_1E45DDE18;
  block[4] = self;
  dispatch_sync(internalQueue, block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_timerSource, 0);
}

void __76__LNWatchdogTimer_initWithTimeoutInterval_onQueue_singleUse_timeoutHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (*(_BYTE *)(a1 + 48))
    objc_msgSend(WeakRetained, "cancel");
  else
    objc_msgSend(WeakRetained, "stop");
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (LNWatchdogTimer)initWithTimeoutInterval:(double)a3 timeoutHandler:(id)a4
{
  void *v7;
  LNWatchdogTimer *v8;

  dispatch_get_global_queue(17, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[LNWatchdogTimer initWithTimeoutInterval:onQueue:singleUse:timeoutHandler:](self, "initWithTimeoutInterval:onQueue:singleUse:timeoutHandler:", v7, 1, a4, a3);

  return v8;
}

- (LNWatchdogTimer)initWithTimeoutInterval:(double)a3 singleUse:(BOOL)a4 timeoutHandler:(id)a5
{
  _BOOL8 v6;
  void *v9;
  LNWatchdogTimer *v10;

  v6 = a4;
  dispatch_get_global_queue(17, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[LNWatchdogTimer initWithTimeoutInterval:onQueue:singleUse:timeoutHandler:](self, "initWithTimeoutInterval:onQueue:singleUse:timeoutHandler:", v9, v6, a5, a3);

  return v10;
}

- (void)stop
{
  NSObject *internalQueue;
  _QWORD block[5];

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __23__LNWatchdogTimer_stop__block_invoke;
  block[3] = &unk_1E45DDE18;
  block[4] = self;
  dispatch_sync(internalQueue, block);
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
  v5[2] = __45__LNWatchdogTimer_cancelIfNotAlreadyCanceled__block_invoke;
  v5[3] = &unk_1E45DCEC0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
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
  v5[2] = __29__LNWatchdogTimer_isCanceled__block_invoke;
  v5[3] = &unk_1E45DCEC0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isStopped
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
  v5[2] = __28__LNWatchdogTimer_isStopped__block_invoke;
  v5[3] = &unk_1E45DCEC0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)_cancelIfNotAlreadyCanceled
{
  BOOL v3;

  v3 = -[LNWatchdogTimer _isCanceled](self, "_isCanceled");
  if (!v3)
    -[LNWatchdogTimer _cancel](self, "_cancel");
  return !v3;
}

- (BOOL)_isCanceled
{
  return dispatch_source_testcancel((dispatch_source_t)self->_timerSource) != 0;
}

- (double)interval
{
  return self->_interval;
}

- (OS_dispatch_source)timerSource
{
  return self->_timerSource;
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (double)remainingInterval
{
  return self->_remainingInterval;
}

- (double)startTime
{
  return self->_startTime;
}

uint64_t __28__LNWatchdogTimer_isStopped__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_isStopped");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __29__LNWatchdogTimer_isCanceled__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_isCanceled");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __45__LNWatchdogTimer_cancelIfNotAlreadyCanceled__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_cancelIfNotAlreadyCanceled");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __23__LNWatchdogTimer_stop__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_stop");
}

@end
