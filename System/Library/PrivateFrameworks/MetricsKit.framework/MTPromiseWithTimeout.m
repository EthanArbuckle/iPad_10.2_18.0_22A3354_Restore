@implementation MTPromiseWithTimeout

- (void)dealloc
{
  void *v3;
  NSObject *v4;
  objc_super v5;

  -[MTPromiseWithTimeout dispatchSourceTimer](self, "dispatchSourceTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[MTPromiseWithTimeout dispatchSourceTimer](self, "dispatchSourceTimer");
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_source_cancel(v4);

  }
  v5.receiver = self;
  v5.super_class = (Class)MTPromiseWithTimeout;
  -[MTPromiseWithTimeout dealloc](&v5, sel_dealloc);
}

- (MTPromiseWithTimeout)initWithTimeout:(double)a3 queue:(id)a4 timeoutBlock:(id)a5
{
  NSObject *v8;
  id v9;
  MTPromiseWithTimeout *v10;
  void *v11;
  MTPromise *v12;
  NSObject *v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  id v20[2];
  id location;
  objc_super v22;

  v8 = a4;
  v9 = a5;
  v22.receiver = self;
  v22.super_class = (Class)MTPromiseWithTimeout;
  v10 = -[MTPromiseWithTimeout init](&v22, sel_init);
  if (v10)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTPromiseWithTimeout setStartDate:](v10, "setStartDate:", v11);

    v12 = objc_alloc_init(MTPromise);
    -[MTPromiseWithTimeout setPromise:](v10, "setPromise:", v12);

    v13 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, v8);
    dispatch_source_set_timer(v13, 0, (unint64_t)(a3 * 1000000000.0), 0x989680uLL);
    objc_initWeak(&location, v10);
    v15 = MEMORY[0x24BDAC760];
    v16 = 3221225472;
    v17 = __59__MTPromiseWithTimeout_initWithTimeout_queue_timeoutBlock___block_invoke;
    v18 = &unk_24C7A1608;
    objc_copyWeak(v20, &location);
    v20[1] = *(id *)&a3;
    v19 = v9;
    dispatch_source_set_event_handler(v13, &v15);
    -[MTPromiseWithTimeout setDispatchSourceTimer:](v10, "setDispatchSourceTimer:", v13, v15, v16, v17, v18);
    dispatch_resume(v13);

    objc_destroyWeak(v20);
    objc_destroyWeak(&location);

  }
  return v10;
}

- (void)setStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_startDate, a3);
}

- (void)setPromise:(id)a3
{
  objc_storeStrong((id *)&self->_promise, a3);
}

- (void)finishWithResult:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;

  v9 = a3;
  -[MTPromiseWithTimeout promise](self, "promise");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isFinished");

  if ((v5 & 1) == 0)
  {
    -[MTPromiseWithTimeout promise](self, "promise");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "finishWithResult:", v9);

  }
  -[MTPromiseWithTimeout dispatchSourceTimer](self, "dispatchSourceTimer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[MTPromiseWithTimeout dispatchSourceTimer](self, "dispatchSourceTimer");
    v8 = objc_claimAutoreleasedReturnValue();
    dispatch_source_cancel(v8);

    -[MTPromiseWithTimeout setDispatchSourceTimer:](self, "setDispatchSourceTimer:", 0);
  }

}

- (MTPromise)promise
{
  return self->_promise;
}

- (OS_dispatch_source)dispatchSourceTimer
{
  return self->_dispatchSourceTimer;
}

- (void)setDispatchSourceTimer:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchSourceTimer, a3);
}

void __59__MTPromiseWithTimeout_initWithTimeout_queue_timeoutBlock___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  double v4;
  double v5;
  double v6;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v7 = WeakRetained;
    objc_msgSend(WeakRetained, "startDate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "timeIntervalSinceNow");
    v5 = v4 + -0.01;
    v6 = -*(double *)(a1 + 48);

    WeakRetained = v7;
    if (v5 < v6)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
      WeakRetained = v7;
    }
  }

}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchSourceTimer, 0);
  objc_storeStrong((id *)&self->_promise, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

- (void)finishWithError:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;

  v9 = a3;
  -[MTPromiseWithTimeout promise](self, "promise");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isFinished");

  if ((v5 & 1) == 0)
  {
    -[MTPromiseWithTimeout promise](self, "promise");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "finishWithError:", v9);

  }
  -[MTPromiseWithTimeout dispatchSourceTimer](self, "dispatchSourceTimer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[MTPromiseWithTimeout dispatchSourceTimer](self, "dispatchSourceTimer");
    v8 = objc_claimAutoreleasedReturnValue();
    dispatch_source_cancel(v8);

    -[MTPromiseWithTimeout setDispatchSourceTimer:](self, "setDispatchSourceTimer:", 0);
  }

}

@end
