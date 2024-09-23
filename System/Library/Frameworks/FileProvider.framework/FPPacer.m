@implementation FPPacer

- (void)suspend
{
  int *p_sourceSuspendCount;
  unsigned int v3;

  p_sourceSuspendCount = &self->_sourceSuspendCount;
  do
    v3 = __ldaxr((unsigned int *)p_sourceSuspendCount);
  while (__stlxr(v3 + 1, (unsigned int *)p_sourceSuspendCount));
  if (!v3)
    dispatch_suspend((dispatch_object_t)self->_source);
}

void __46__FPPacer_signalWithTransferredQoSIfImmediate__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_fire");

}

void __46__FPPacer_initWithName_queue_minFireInterval___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_scheduleNextFire");

}

- (void)signalWithTransferredQoSIfImmediate
{
  dispatch_block_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t);
  void *v7;
  id v8;
  id location;

  location = 0;
  objc_initWeak(&location, self);
  v4 = MEMORY[0x1E0C809B0];
  v5 = 3221225472;
  v6 = __46__FPPacer_signalWithTransferredQoSIfImmediate__block_invoke;
  v7 = &unk_1E44499C0;
  objc_copyWeak(&v8, &location);
  v3 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, &v4);
  -[FPPacer setExplicitFireBlock:](self, "setExplicitFireBlock:", v3, v4, v5, v6, v7);

  -[FPPacer signal](self, "signal");
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)signal
{
  dispatch_source_merge_data((dispatch_source_t)self->_source, 1uLL);
}

- (void)_scheduleNextFire
{
  void (**v3)(_QWORD);
  double v4;
  double v5;
  NSObject *timer;
  OS_dispatch_source *v7;
  OS_dispatch_source *v8;
  OS_dispatch_source *v9;
  OS_dispatch_source *v10;
  NSObject *v11;
  dispatch_block_t v12;
  double v13;
  dispatch_time_t v14;
  _QWORD v15[4];
  id v16;
  id location;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[FPPacer explicitFireBlock](self, "explicitFireBlock");
  v3 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();
  -[FPPacer setExplicitFireBlock:](self, "setExplicitFireBlock:", 0);
  -[FPPacer _computeNextTime](self, "_computeNextTime");
  if (v4 <= 0.0)
  {
    if (v3)
      v3[2](v3);
    else
      -[FPPacer _fire](self, "_fire");
  }
  else
  {
    v5 = v4;
    timer = self->_timer;
    if (timer)
    {
      dispatch_source_cancel(timer);
      v7 = self->_timer;
      self->_timer = 0;

    }
    v8 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_queue);
    v9 = self->_timer;
    self->_timer = v8;

    dispatch_set_qos_class_fallback();
    location = 0;
    objc_initWeak(&location, self);
    v10 = self->_timer;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __28__FPPacer__scheduleNextFire__block_invoke;
    v15[3] = &unk_1E44499C0;
    objc_copyWeak(&v16, &location);
    v11 = v10;
    v12 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, v15);
    dispatch_source_set_event_handler(v11, v12);

    v13 = v5 * 1000000000.0;
    v14 = dispatch_time(0, (uint64_t)v13);
    dispatch_source_set_timer((dispatch_source_t)self->_timer, v14, 0xFFFFFFFFFFFFFFFFLL, (unint64_t)v13);
    dispatch_resume((dispatch_object_t)self->_timer);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

}

- (void)setExplicitFireBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 64);
}

- (id)explicitFireBlock
{
  return objc_getProperty(self, a2, 64, 1);
}

- (double)_computeNextTime
{
  double result;
  CFAbsoluteTime Current;
  double minFireInterval;
  double v6;
  double v7;
  BOOL v8;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  result = 0.0;
  if (self->_lastFireTime != 0.0)
  {
    Current = CFAbsoluteTimeGetCurrent();
    minFireInterval = self->_minFireInterval;
    v6 = Current - self->_lastFireTime;
    v7 = minFireInterval - v6;
    v8 = v6 < minFireInterval;
    result = 0.0;
    if (v8)
      return v7;
  }
  return result;
}

- (void)_fire
{
  int v3;
  void *v4;
  void *v5;
  void (**v6)(void);

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3 = atomic_load((unsigned int *)&self->_sourceSuspendCount);
  if (v3 < 1)
  {
    self->_lastFireTime = CFAbsoluteTimeGetCurrent();
    -[FPPacer eventBlock](self, "eventBlock");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      v5 = (void *)MEMORY[0x1A1B00664]();
      -[FPPacer eventBlock](self, "eventBlock");
      v6 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v6[2]();

      objc_autoreleasePoolPop(v5);
    }
  }
  else
  {
    -[FPPacer signal](self, "signal");
  }
}

- (id)eventBlock
{
  return self->_eventBlock;
}

- (void)resume
{
  int *p_sourceSuspendCount;
  unsigned int v3;
  unsigned int v4;

  p_sourceSuspendCount = &self->_sourceSuspendCount;
  do
  {
    v3 = __ldaxr((unsigned int *)p_sourceSuspendCount);
    v4 = v3 - 1;
  }
  while (__stlxr(v4, (unsigned int *)p_sourceSuspendCount));
  if (!v4)
    dispatch_resume((dispatch_object_t)self->_source);
}

- (void)setEventBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (FPPacer)initWithName:(id)a3 queue:(id)a4 minFireInterval:(double)a5
{
  id v8;
  FPPacer *v9;
  FPPacer *v10;
  dispatch_source_t v11;
  OS_dispatch_source *source;
  OS_dispatch_source *v13;
  NSObject *v14;
  dispatch_block_t v15;
  _QWORD v17[4];
  id v18;
  id location;
  objc_super v20;

  v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)FPPacer;
  v9 = -[FPPacer init](&v20, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_lastFireTime = 0.0;
    v9->_minFireInterval = a5;
    objc_storeStrong((id *)&v9->_queue, a4);
    v11 = dispatch_source_create(MEMORY[0x1E0C80D78], 0, 0, (dispatch_queue_t)v10->_queue);
    source = v10->_source;
    v10->_source = (OS_dispatch_source *)v11;

    dispatch_set_qos_class_fallback();
    location = 0;
    objc_initWeak(&location, v10);
    v13 = v10->_source;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __46__FPPacer_initWithName_queue_minFireInterval___block_invoke;
    v17[3] = &unk_1E44499C0;
    objc_copyWeak(&v18, &location);
    v14 = v13;
    v15 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, v17);
    dispatch_source_set_event_handler(v14, v15);

    atomic_store(1u, (unsigned int *)&v10->_sourceSuspendCount);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

  return v10;
}

- (BOOL)isSuspended
{
  signed int v2;

  v2 = atomic_load((unsigned int *)&self->_sourceSuspendCount);
  return v2 > 0;
}

void __28__FPPacer__scheduleNextFire__block_invoke(uint64_t a1)
{
  dispatch_source_t *WeakRetained;
  dispatch_source_t v2;
  dispatch_source_t *v3;

  WeakRetained = (dispatch_source_t *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    dispatch_source_cancel(WeakRetained[5]);
    -[dispatch_source_t _fire](v3, "_fire");
    v2 = v3[5];
    v3[5] = 0;

    WeakRetained = v3;
  }

}

- (void)dealloc
{
  OS_dispatch_queue *queue;
  int v4;
  OS_dispatch_source *source;
  OS_dispatch_source *timer;
  objc_super v7;

  queue = self->_queue;
  self->_queue = 0;

  v4 = atomic_load((unsigned int *)&self->_sourceSuspendCount);
  if (v4 >= 1)
    dispatch_resume((dispatch_object_t)self->_source);
  dispatch_activate((dispatch_object_t)self->_source);
  source = self->_source;
  self->_source = 0;

  timer = self->_timer;
  self->_timer = 0;

  v7.receiver = self;
  v7.super_class = (Class)FPPacer;
  -[FPPacer dealloc](&v7, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_explicitFireBlock, 0);
  objc_storeStrong(&self->_eventBlock, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
