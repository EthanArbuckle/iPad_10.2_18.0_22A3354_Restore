@implementation ULTimer

- (ULTimer)init
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ cannot be initialized directly"), objc_opt_class());
  objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], objc_claimAutoreleasedReturnValue(), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (void)dealloc
{
  objc_super v3;

  -[ULTimer invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)ULTimer;
  -[ULTimer dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  void *v3;
  NSObject *v4;

  -[ULTimer timerSource](self, "timerSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[ULTimer timerSource](self, "timerSource");
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_source_cancel(v4);

    -[ULTimer setTimerSource:](self, "setTimerSource:", 0);
  }
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
}

- (ULTimer)initWithInterval:(double)a3 repeats:(BOOL)a4 queue:(id)a5 block:(id)a6
{
  _BOOL4 v7;
  NSObject *v10;
  id v11;
  ULTimer *v12;
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
  v29.super_class = (Class)ULTimer;
  v12 = -[ULTimer init](&v29, sel_init);
  if (v12)
  {
    v13 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, v10);
    -[ULTimer setTimerSource:](v12, "setTimerSource:", v13);

    v14 = a3 * 1000000000.0;
    v15 = dispatch_time(0, (uint64_t)v14);
    if (v7)
      v16 = (unint64_t)v14;
    else
      v16 = -1;
    -[ULTimer timerSource](v12, "timerSource");
    v17 = objc_claimAutoreleasedReturnValue();
    dispatch_source_set_timer(v17, v15, v16, 0x989680uLL);

    objc_initWeak(&location, v12);
    -[ULTimer timerSource](v12, "timerSource");
    v18 = objc_claimAutoreleasedReturnValue();
    v21 = MEMORY[0x24BDAC760];
    v22 = 3221225472;
    v23 = __54__ULTimer_init__initWithInterval_repeats_queue_block___block_invoke;
    v24 = &unk_2511D4778;
    v25 = v11;
    v27 = v7;
    objc_copyWeak(&v26, &location);
    dispatch_source_set_event_handler(v18, &v21);

    -[ULTimer timerSource](v12, "timerSource", v21, v22, v23, v24);
    v19 = objc_claimAutoreleasedReturnValue();
    dispatch_activate(v19);

    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }

  return v12;
}

void __54__ULTimer_init__initWithInterval_repeats_queue_block___block_invoke(uint64_t a1)
{
  id WeakRetained;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if (!*(_BYTE *)(a1 + 48))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "invalidate");

  }
}

- (BOOL)isTimerSourceNil
{
  void *v2;
  BOOL v3;

  -[ULTimer timerSource](self, "timerSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

@end
