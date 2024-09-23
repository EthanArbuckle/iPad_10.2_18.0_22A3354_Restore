@implementation CURetrier

- (void)succeededDirect
{
  OS_dispatch_source *retryTimer;
  OS_dispatch_source *v4;
  NSObject *v5;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  retryTimer = self->_retryTimer;
  if (retryTimer)
  {
    v5 = retryTimer;
    dispatch_source_cancel(v5);
    v4 = self->_retryTimer;
    self->_retryTimer = 0;

  }
}

- (void)setActionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (CURetrier)init
{
  CURetrier *v2;
  CURetrier *v3;
  CURetrier *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CURetrier;
  v2 = -[CURetrier init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1E0C80D38]);
    *(_OWORD *)&v3->_interval = xmmword_18D51D440;
    v4 = v3;
  }

  return v3;
}

- (void)startDirect
{
  OS_dispatch_source *retryTimer;
  NSObject *v4;
  OS_dispatch_source *v5;
  void (**v6)(void);
  void (**v7)(void);

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateCalled)
  {
    retryTimer = self->_retryTimer;
    if (retryTimer)
    {
      v4 = retryTimer;
      dispatch_source_cancel(v4);
      v5 = self->_retryTimer;
      self->_retryTimer = 0;

    }
    self->_startTime = CFAbsoluteTimeGetCurrent();
    v6 = (void (**)(void))_Block_copy(self->_actionHandler);
    if (v6)
    {
      v7 = v6;
      v6[2]();
      v6 = v7;
    }

  }
}

- (void)invalidateDirect
{
  void (**invalidationHandler)(void);
  id actionHandler;
  id v5;
  OS_dispatch_source *retryTimer;
  OS_dispatch_source *v7;
  NSObject *v8;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateCalled)
  {
    self->_invalidateCalled = 1;
    invalidationHandler = (void (**)(void))self->_invalidationHandler;
    if (invalidationHandler)
      invalidationHandler[2]();
    actionHandler = self->_actionHandler;
    self->_actionHandler = 0;

    v5 = self->_invalidationHandler;
    self->_invalidationHandler = 0;

    retryTimer = self->_retryTimer;
    if (retryTimer)
    {
      v8 = retryTimer;
      dispatch_source_cancel(v8);
      v7 = self->_retryTimer;
      self->_retryTimer = 0;

    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong(&self->_actionHandler, 0);
  objc_storeStrong((id *)&self->_retryTimer, 0);
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __23__CURetrier_invalidate__block_invoke;
  block[3] = &unk_1E25DF2A0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)start
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __18__CURetrier_start__block_invoke;
  block[3] = &unk_1E25DF2A0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)failed
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __19__CURetrier_failed__block_invoke;
  block[3] = &unk_1E25DF2A0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)failedDirect
{
  double leeway;
  double v4;
  double v5;
  OS_dispatch_source *retryTimer;
  NSObject *v7;
  OS_dispatch_source *v8;
  OS_dispatch_source *v9;
  OS_dispatch_source *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  dispatch_time_t v20;
  uint64_t v21;
  _QWORD handler[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateCalled)
  {
    leeway = self->_leeway;
    if (leeway < 0.0)
      leeway = self->_interval / 10.0;
    v4 = self->_startTime + self->_interval + (double)arc4random() / 4294967300.0 * leeway + 0.0;
    v5 = v4 - CFAbsoluteTimeGetCurrent();
    if (v5 <= 0.0)
    {
      -[CURetrier startDirect](self, "startDirect");
    }
    else
    {
      retryTimer = self->_retryTimer;
      if (retryTimer)
      {
        v7 = retryTimer;
        dispatch_source_cancel(v7);
        v8 = self->_retryTimer;
        self->_retryTimer = 0;

      }
      v9 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_dispatchQueue);
      v10 = self->_retryTimer;
      self->_retryTimer = v9;

      v18 = self->_retryTimer;
      if (!v18)
        FatalErrorF((uint64_t)"Create retry timer failed", v11, v12, v13, v14, v15, v16, v17, v21);
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __25__CURetrier_failedDirect__block_invoke;
      handler[3] = &unk_1E25DF2A0;
      handler[4] = self;
      dispatch_source_set_event_handler(v18, handler);
      v19 = self->_retryTimer;
      v20 = dispatch_time(0, (uint64_t)(v5 * 1000000000.0));
      dispatch_source_set_timer(v19, v20, 0xFFFFFFFFFFFFFFFFLL, 0xEE6B280uLL);
      dispatch_resume((dispatch_object_t)self->_retryTimer);
    }
  }
}

- (void)succeeded
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __22__CURetrier_succeeded__block_invoke;
  block[3] = &unk_1E25DF2A0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (id)actionHandler
{
  return self->_actionHandler;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (double)interval
{
  return self->_interval;
}

- (void)setInterval:(double)a3
{
  self->_interval = a3;
}

- (double)leeway
{
  return self->_leeway;
}

- (void)setLeeway:(double)a3
{
  self->_leeway = a3;
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

uint64_t __22__CURetrier_succeeded__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "succeededDirect");
}

uint64_t __25__CURetrier_failedDirect__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "startDirect");
}

uint64_t __19__CURetrier_failed__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "failedDirect");
}

uint64_t __18__CURetrier_start__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "startDirect");
}

uint64_t __23__CURetrier_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidateDirect");
}

@end
