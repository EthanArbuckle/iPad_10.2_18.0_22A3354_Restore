@implementation FMDDispatchTimer

- (FMDDispatchTimer)initWithQueue:(id)a3 timeout:(double)a4 completion:(id)a5
{
  id v8;
  id v9;
  FMDDispatchTimer *v10;
  OS_dispatch_queue *v11;
  OS_dispatch_queue *queue;
  id v13;
  id v14;
  id completion;
  objc_super v17;

  v8 = a3;
  v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)FMDDispatchTimer;
  v10 = -[FMDDispatchTimer init](&v17, "init");
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
      v13 = &_dispatch_main_q;
      queue = v10->_queue;
      v10->_queue = (OS_dispatch_queue *)&_dispatch_main_q;
    }

    v10->_timeout = a4;
    v14 = objc_retainBlock(v9);
    completion = v10->_completion;
    v10->_completion = v14;

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
  v4.super_class = (Class)FMDDispatchTimer;
  -[FMDDispatchTimer dealloc](&v4, "dealloc");
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
  void **v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  id location;

  v3 = objc_claimAutoreleasedReturnValue(-[FMDDispatchTimer queue](self, "queue"));
  v4 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v3);
  -[FMDDispatchTimer setTimerSource:](self, "setTimerSource:", v4);

  objc_initWeak(&location, self);
  v5 = objc_claimAutoreleasedReturnValue(-[FMDDispatchTimer timerSource](self, "timerSource"));
  v13 = _NSConcreteStackBlock;
  v14 = 3221225472;
  v15 = sub_100011D90;
  v16 = &unk_100021570;
  objc_copyWeak(&v17, &location);
  dispatch_source_set_event_handler(v5, &v13);

  -[FMDDispatchTimer timeout](self, "timeout", v13, v14, v15, v16);
  v7 = v6;
  -[FMDDispatchTimer leewayTimeInterval](self, "leewayTimeInterval");
  v9 = v8;
  v10 = objc_claimAutoreleasedReturnValue(-[FMDDispatchTimer timerSource](self, "timerSource"));
  v11 = dispatch_time(0, (uint64_t)(v7 * 1000000000.0));
  dispatch_source_set_timer(v10, v11, 0xFFFFFFFFFFFFFFFFLL, (unint64_t)(v9 * 1000000000.0));

  v12 = objc_claimAutoreleasedReturnValue(-[FMDDispatchTimer timerSource](self, "timerSource"));
  dispatch_resume(v12);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

- (void)cancel
{
  void *v3;
  NSObject *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMDDispatchTimer timerSource](self, "timerSource"));

  if (v3)
  {
    v4 = objc_claimAutoreleasedReturnValue(-[FMDDispatchTimer timerSource](self, "timerSource"));
    dispatch_source_cancel(v4);

    -[FMDDispatchTimer setTimerSource:](self, "setTimerSource:", 0);
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
