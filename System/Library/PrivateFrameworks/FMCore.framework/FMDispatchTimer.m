@implementation FMDispatchTimer

- (FMDispatchTimer)initWithQueue:(id)a3 timeout:(double)a4 completion:(id)a5
{
  id v8;
  id v9;
  FMDispatchTimer *v10;
  OS_dispatch_queue *v11;
  OS_dispatch_queue *queue;
  OS_dispatch_queue *v13;
  id v14;
  uint64_t v15;
  id completion;
  objc_super v18;

  v8 = a3;
  v9 = a5;
  v18.receiver = self;
  v18.super_class = (Class)FMDispatchTimer;
  v10 = -[FMDispatchTimer init](&v18, sel_init);
  if (v10)
  {
    if (v8)
    {
      v11 = (OS_dispatch_queue *)v8;
      queue = v10->_queue;
      v10->_queue = v11;
    }
    else
    {
      v13 = (OS_dispatch_queue *)MEMORY[0x1E0C80D38];
      v14 = MEMORY[0x1E0C80D38];
      queue = v10->_queue;
      v10->_queue = v13;
    }

    v10->_timeout = a4;
    v15 = MEMORY[0x1CAA45B8C](v9);
    completion = v10->_completion;
    v10->_completion = (id)v15;

    v10->_leewayTimeInterval = 1.0;
  }

  return v10;
}

- (void)dealloc
{
  NSObject *timerSource;
  objc_super v4;

  timerSource = self->_timerSource;
  if (timerSource)
    dispatch_source_cancel(timerSource);
  v4.receiver = self;
  v4.super_class = (Class)FMDispatchTimer;
  -[FMDispatchTimer dealloc](&v4, sel_dealloc);
}

- (void)start
{
  NSObject *v3;
  dispatch_source_t v4;
  NSObject *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  NSObject *v10;
  dispatch_time_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  id location;

  -[FMDispatchTimer queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v3);
  -[FMDispatchTimer setTimerSource:](self, "setTimerSource:", v4);

  objc_initWeak(&location, self);
  -[FMDispatchTimer timerSource](self, "timerSource");
  v5 = objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __24__FMDispatchTimer_start__block_invoke;
  v16 = &unk_1E82AA508;
  objc_copyWeak(&v17, &location);
  dispatch_source_set_event_handler(v5, &v13);

  -[FMDispatchTimer timeout](self, "timeout", v13, v14, v15, v16);
  v7 = v6;
  -[FMDispatchTimer leewayTimeInterval](self, "leewayTimeInterval");
  v9 = v8;
  -[FMDispatchTimer timerSource](self, "timerSource");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = dispatch_time(0, (uint64_t)(v7 * 1000000000.0));
  dispatch_source_set_timer(v10, v11, 0xFFFFFFFFFFFFFFFFLL, (unint64_t)(v9 * 1000000000.0));

  -[FMDispatchTimer timerSource](self, "timerSource");
  v12 = objc_claimAutoreleasedReturnValue();
  dispatch_resume(v12);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __24__FMDispatchTimer_start__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "completion");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)v1;
  if (v1)
    (*(void (**)(uint64_t))(v1 + 16))(v1);

}

- (void)cancel
{
  void *v3;
  NSObject *v4;

  -[FMDispatchTimer timerSource](self, "timerSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[FMDispatchTimer timerSource](self, "timerSource");
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_source_cancel(v4);

    -[FMDispatchTimer setTimerSource:](self, "setTimerSource:", 0);
  }
}

- (double)leewayTimeInterval
{
  return self->_leewayTimeInterval;
}

- (void)setLeewayTimeInterval:(double)a3
{
  self->_leewayTimeInterval = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (OS_dispatch_source)timerSource
{
  return self->_timerSource;
}

- (void)setTimerSource:(id)a3
{
  objc_storeStrong((id *)&self->_timerSource, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timerSource, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
