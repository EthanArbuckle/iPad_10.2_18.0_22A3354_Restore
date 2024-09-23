@implementation CRKDispatchTimer

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;

  -[CRKDispatchTimer timerSource](self, "timerSource");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_source_cancel(v3);

  v4.receiver = self;
  v4.super_class = (Class)CRKDispatchTimer;
  -[CRKDispatchTimer dealloc](&v4, sel_dealloc);
}

- (CRKDispatchTimer)initWithTimeInterval:(double)a3 queue:(id)a4 handler:(id)a5
{
  id v9;
  id v10;
  CRKDispatchTimer *v11;
  CRKDispatchTimer *v12;
  uint64_t v13;
  id fireHandler;
  dispatch_queue_t v15;
  OS_dispatch_queue *queue;
  objc_super v18;

  v9 = a4;
  v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)CRKDispatchTimer;
  v11 = -[CRKDispatchTimer init](&v18, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_timeInterval = a3;
    v13 = MEMORY[0x219A226E8](v10);
    fireHandler = v12->_fireHandler;
    v12->_fireHandler = (id)v13;

    objc_storeStrong((id *)&v12->_targetQueue, a4);
    v15 = dispatch_queue_create(0, 0);
    queue = v12->_queue;
    v12->_queue = (OS_dispatch_queue *)v15;

  }
  return v12;
}

+ (id)scheduledTimerWithTimerInterval:(double)a3 queue:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a5;
  v9 = a4;
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTimeInterval:queue:handler:", v9, v8, a3);

  objc_msgSend(v10, "resume");
  return v10;
}

- (void)resume
{
  NSObject *v3;
  dispatch_source_t v4;
  NSObject *v5;
  double v6;
  dispatch_time_t v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  id location;

  -[CRKDispatchTimer queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, v3);
  -[CRKDispatchTimer setTimerSource:](self, "setTimerSource:", v4);

  -[CRKDispatchTimer timerSource](self, "timerSource");
  v5 = objc_claimAutoreleasedReturnValue();
  -[CRKDispatchTimer timeInterval](self, "timeInterval");
  v7 = dispatch_time(0, (uint64_t)(v6 * 1000000000.0));
  dispatch_source_set_timer(v5, v7, 0xFFFFFFFFFFFFFFFFLL, 0);

  objc_initWeak(&location, self);
  -[CRKDispatchTimer timerSource](self, "timerSource");
  v8 = objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v11 = 3221225472;
  v12 = __26__CRKDispatchTimer_resume__block_invoke;
  v13 = &unk_24D9C7A60;
  objc_copyWeak(&v14, &location);
  dispatch_source_set_event_handler(v8, &v10);

  -[CRKDispatchTimer timerSource](self, "timerSource", v10, v11, v12, v13);
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_resume(v9);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __26__CRKDispatchTimer_resume__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  intptr_t v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "timerSource");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = dispatch_source_testcancel(v2);

    WeakRetained = v4;
    if (!v3)
    {
      objc_msgSend(v4, "timerDidFire");
      WeakRetained = v4;
    }
  }

}

- (void)timerDidFire
{
  void *v3;
  NSObject *v4;
  dispatch_block_t block;

  -[CRKDispatchTimer fireHandler](self, "fireHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CRKDispatchTimer fireHandler](self, "fireHandler");
    block = (dispatch_block_t)objc_claimAutoreleasedReturnValue();
    -[CRKDispatchTimer setFireHandler:](self, "setFireHandler:", 0);
    -[CRKDispatchTimer targetQueue](self, "targetQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v4, block);

  }
}

- (void)cancel
{
  NSObject *v3;
  _QWORD block[5];

  -[CRKDispatchTimer queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __26__CRKDispatchTimer_cancel__block_invoke;
  block[3] = &unk_24D9C7020;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __26__CRKDispatchTimer_cancel__block_invoke(uint64_t a1)
{
  NSObject *v2;

  objc_msgSend(*(id *)(a1 + 32), "timerSource");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_source_cancel(v2);

  return objc_msgSend(*(id *)(a1 + 32), "setFireHandler:", 0);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (OS_dispatch_queue)targetQueue
{
  return self->_targetQueue;
}

- (double)timeInterval
{
  return self->_timeInterval;
}

- (OS_dispatch_source)timerSource
{
  return self->_timerSource;
}

- (void)setTimerSource:(id)a3
{
  objc_storeStrong((id *)&self->_timerSource, a3);
}

- (id)fireHandler
{
  return self->_fireHandler;
}

- (void)setFireHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_fireHandler, 0);
  objc_storeStrong((id *)&self->_timerSource, 0);
  objc_storeStrong((id *)&self->_targetQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
