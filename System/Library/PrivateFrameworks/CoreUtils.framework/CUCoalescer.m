@implementation CUCoalescer

uint64_t __23__CUCoalescer__trigger__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_timerFired");
}

- (void)_timerFired
{
  OS_dispatch_source *timer;
  NSObject *v4;
  OS_dispatch_source *v5;
  int *p_triggered;
  unsigned int v7;
  void (**v8)(void);
  void (**v9)(void);

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  timer = self->_timer;
  if (timer)
  {
    v4 = timer;
    dispatch_source_cancel(v4);
    v5 = self->_timer;
    self->_timer = 0;

  }
  self->_startTime = 0.0;
  p_triggered = &self->_triggered;
  do
    v7 = __ldaxr((unsigned int *)p_triggered);
  while (__stlxr(v7 & 0xFFFFFFFE, (unsigned int *)p_triggered));
  if ((v7 & 1) != 0)
  {
    v8 = (void (**)(void))_Block_copy(self->_actionHandler);
    if (v8)
    {
      v9 = v8;
      v8[2]();
      v8 = v9;
    }

  }
}

- (CUCoalescer)init
{
  CUCoalescer *v2;
  CUCoalescer *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CUCoalescer;
  v2 = -[CUCoalescer init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1E0C80D38]);
    *(_OWORD *)&v3->_maxDelay = xmmword_18D51D410;
  }
  return v3;
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id actionHandler;
  id invalidationHandler;
  objc_super v11;

  if (self->_timer)
    FatalErrorF((uint64_t)"Timer still active during dealloc", (uint64_t)a2, v2, v3, v4, v5, v6, v7, (uint64_t)v11.receiver);
  actionHandler = self->_actionHandler;
  self->_actionHandler = 0;

  invalidationHandler = self->_invalidationHandler;
  self->_invalidationHandler = 0;

  v11.receiver = self;
  v11.super_class = (Class)CUCoalescer;
  -[CUCoalescer dealloc](&v11, sel_dealloc);
}

- (void)invalidate
{
  int *p_triggered;
  unsigned int v3;
  NSObject *dispatchQueue;
  _QWORD block[5];

  p_triggered = &self->_triggered;
  do
    v3 = __ldaxr((unsigned int *)p_triggered);
  while (__stlxr(v3 & 0xFFFFFFFE, (unsigned int *)p_triggered));
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __25__CUCoalescer_invalidate__block_invoke;
  block[3] = &unk_1E25DF2A0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidate
{
  OS_dispatch_source *timer;
  NSObject *v4;
  OS_dispatch_source *v5;
  void *v6;
  void *v7;
  id actionHandler;
  id invalidationHandler;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateCalled)
  {
    self->_invalidateCalled = 1;
    self->_startTime = 0.0;
    timer = self->_timer;
    if (timer)
    {
      v4 = timer;
      dispatch_source_cancel(v4);
      v5 = self->_timer;
      self->_timer = 0;

    }
    v6 = _Block_copy(self->_invalidationHandler);
    v7 = v6;
    if (v6)
      (*((void (**)(void *))v6 + 2))(v6);

    actionHandler = self->_actionHandler;
    self->_actionHandler = 0;

    invalidationHandler = self->_invalidationHandler;
    self->_invalidationHandler = 0;

  }
}

- (void)trigger
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __22__CUCoalescer_trigger__block_invoke;
  block[3] = &unk_1E25DF2A0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_trigger
{
  int *p_triggered;
  unsigned int v4;
  CFAbsoluteTime Current;
  double v6;
  double startTime;
  double maxDelay;
  BOOL v9;
  double v10;
  double v11;
  int64_t v12;
  double leeway;
  uint64_t v14;
  dispatch_time_t v15;
  NSObject *timer;
  OS_dispatch_source *v17;
  OS_dispatch_source *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  _QWORD handler[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateCalled)
  {
    p_triggered = &self->_triggered;
    do
      v4 = __ldaxr((unsigned int *)p_triggered);
    while (__stlxr(v4 | 1, (unsigned int *)p_triggered));
    Current = CFAbsoluteTimeGetCurrent();
    v6 = Current + self->_minDelay;
    startTime = self->_startTime;
    if (startTime == 0.0)
    {
      self->_startTime = Current;
      startTime = Current;
    }
    maxDelay = self->_maxDelay;
    v9 = v6 - startTime <= maxDelay || maxDelay < 0.0;
    v10 = maxDelay + startTime;
    if (!v9)
      v6 = v10;
    v11 = v6 - Current;
    if (v11 <= 0.0)
    {
      -[CUCoalescer _timerFired](self, "_timerFired");
    }
    else
    {
      v12 = (uint64_t)(v11 * 1000000000.0);
      leeway = self->_leeway;
      if (leeway >= 0.0)
        v14 = (unint64_t)(leeway * 1000000000.0);
      else
        v14 = v12 / 4;
      v15 = dispatch_time(0, v12);
      timer = self->_timer;
      if (timer)
      {
        dispatch_source_set_timer(timer, v15, 0xFFFFFFFFFFFFFFFFLL, v14);
      }
      else
      {
        v17 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_dispatchQueue);
        v18 = self->_timer;
        self->_timer = v17;

        v26 = self->_timer;
        if (!v26)
          FatalErrorF((uint64_t)"Create coalesce timer failed", v19, v20, v21, v22, v23, v24, v25, v27);
        handler[0] = MEMORY[0x1E0C809B0];
        handler[1] = 3221225472;
        handler[2] = __23__CUCoalescer__trigger__block_invoke;
        handler[3] = &unk_1E25DF2A0;
        handler[4] = self;
        dispatch_source_set_event_handler(v26, handler);
        dispatch_source_set_timer((dispatch_source_t)self->_timer, v15, 0xFFFFFFFFFFFFFFFFLL, v14);
        dispatch_resume((dispatch_object_t)self->_timer);
      }
    }
  }
}

- (void)cancel
{
  int *p_triggered;
  unsigned int v3;
  NSObject *dispatchQueue;
  _QWORD block[5];

  p_triggered = &self->_triggered;
  do
    v3 = __ldaxr((unsigned int *)p_triggered);
  while (__stlxr(v3 & 0xFFFFFFFE, (unsigned int *)p_triggered));
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __21__CUCoalescer_cancel__block_invoke;
  block[3] = &unk_1E25DF2A0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_cancel
{
  OS_dispatch_source *timer;
  NSObject *v4;
  OS_dispatch_source *v5;
  int *p_triggered;
  unsigned int v7;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  self->_startTime = 0.0;
  timer = self->_timer;
  if (timer)
  {
    v4 = timer;
    dispatch_source_cancel(v4);
    v5 = self->_timer;
    self->_timer = 0;

  }
  p_triggered = &self->_triggered;
  do
    v7 = __ldaxr((unsigned int *)p_triggered);
  while (__stlxr(v7 & 0xFFFFFFFE, (unsigned int *)p_triggered));
}

- (id)actionHandler
{
  return self->_actionHandler;
}

- (void)setActionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (double)leeway
{
  return self->_leeway;
}

- (void)setLeeway:(double)a3
{
  self->_leeway = a3;
}

- (double)maxDelay
{
  return self->_maxDelay;
}

- (void)setMaxDelay:(double)a3
{
  self->_maxDelay = a3;
}

- (double)minDelay
{
  return self->_minDelay;
}

- (void)setMinDelay:(double)a3
{
  self->_minDelay = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong(&self->_actionHandler, 0);
  objc_storeStrong((id *)&self->_timer, 0);
}

uint64_t __21__CUCoalescer_cancel__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cancel");
}

uint64_t __22__CUCoalescer_trigger__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_trigger");
}

uint64_t __25__CUCoalescer_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

@end
