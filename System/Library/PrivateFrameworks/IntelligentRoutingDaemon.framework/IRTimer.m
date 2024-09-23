@implementation IRTimer

- (IRTimer)initWithInterval:(double)a3 repeats:(BOOL)a4 queue:(id)a5 block:(id)a6
{
  _BOOL4 v7;
  NSObject *v10;
  id v11;
  IRTimer *v12;
  dispatch_source_t v13;
  double v14;
  dispatch_time_t v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t);
  void *v24;
  id v25;
  id v26;
  BOOL v27;
  id location;
  objc_super v29;

  v7 = a4;
  v10 = a5;
  v11 = a6;
  v29.receiver = self;
  v29.super_class = (Class)IRTimer;
  v12 = -[IRTimer init](&v29, sel_init);
  if (v12)
  {
    v13 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, v10);
    -[IRTimer setTimerSource:](v12, "setTimerSource:", v13);

    v14 = a3 * 1000000000.0;
    v15 = dispatch_time(0, (uint64_t)v14);
    if (v7)
      v16 = (unint64_t)v14;
    else
      v16 = -1;
    -[IRTimer timerSource](v12, "timerSource");
    v17 = objc_claimAutoreleasedReturnValue();
    dispatch_source_set_timer(v17, v15, v16, 0x989680uLL);

    objc_initWeak(&location, v12);
    -[IRTimer timerSource](v12, "timerSource");
    v18 = objc_claimAutoreleasedReturnValue();
    v21 = MEMORY[0x24BDAC760];
    v22 = 3221225472;
    v23 = __48__IRTimer_initWithInterval_repeats_queue_block___block_invoke;
    v24 = &unk_251045328;
    v25 = v11;
    v27 = v7;
    objc_copyWeak(&v26, &location);
    dispatch_source_set_event_handler(v18, &v21);

    -[IRTimer timerSource](v12, "timerSource", v21, v22, v23, v24);
    v19 = objc_claimAutoreleasedReturnValue();
    dispatch_activate(v19);

    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }

  return v12;
}

- (OS_dispatch_source)timerSource
{
  return self->_timerSource;
}

- (void)setTimerSource:(id)a3
{
  objc_storeStrong((id *)&self->_timerSource, a3);
}

void __48__IRTimer_initWithInterval_repeats_queue_block___block_invoke(uint64_t a1)
{
  id WeakRetained;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if (!*(_BYTE *)(a1 + 48))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "invalidate");

  }
}

- (void)dealloc
{
  objc_super v3;

  -[IRTimer invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)IRTimer;
  -[IRTimer dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  void *v3;
  NSObject *v4;

  -[IRTimer timerSource](self, "timerSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[IRTimer timerSource](self, "timerSource");
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_source_cancel(v4);

    -[IRTimer setTimerSource:](self, "setTimerSource:", 0);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timerSource, 0);
}

@end
