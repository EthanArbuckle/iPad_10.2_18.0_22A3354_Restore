@implementation CATConcreteTimerSource

- (CATConcreteTimerSource)init
{
  CATConcreteTimerSource *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *mWorkQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CATConcreteTimerSource;
  v2 = -[CATConcreteTimerSource init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create(0, 0);
    mWorkQueue = v2->mWorkQueue;
    v2->mWorkQueue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (id)scheduleOneShotTimerWithIdentifier:(id)a3 timeInterval:(double)a4 queue:(id)a5 fireHandler:(id)a6
{
  id v10;
  OS_dispatch_queue *mWorkQueue;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;

  v10 = a6;
  mWorkQueue = self->mWorkQueue;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __92__CATConcreteTimerSource_scheduleOneShotTimerWithIdentifier_timeInterval_queue_fireHandler___block_invoke;
  v15[3] = &unk_24C1C63E0;
  v16 = v10;
  v12 = v10;
  +[CATDispatchTimer scheduledTimerWithIdentifier:workQueue:delegateQueue:timeInterval:totalFires:firesForever:fireHandler:](CATDispatchTimer, "scheduledTimerWithIdentifier:workQueue:delegateQueue:timeInterval:totalFires:firesForever:fireHandler:", a3, mWorkQueue, a5, 1, 0, v15, a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

uint64_t __92__CATConcreteTimerSource_scheduleOneShotTimerWithIdentifier_timeInterval_queue_fireHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)scheduleRepeatTimerWithIdentifier:(id)a3 timeInterval:(double)a4 queue:(id)a5 totalFires:(unint64_t)a6 fireHandler:(id)a7
{
  id v12;
  OS_dispatch_queue *mWorkQueue;
  id v14;
  void *v15;
  _QWORD v17[4];
  id v18;

  v12 = a7;
  mWorkQueue = self->mWorkQueue;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __102__CATConcreteTimerSource_scheduleRepeatTimerWithIdentifier_timeInterval_queue_totalFires_fireHandler___block_invoke;
  v17[3] = &unk_24C1C63E0;
  v18 = v12;
  v14 = v12;
  +[CATDispatchTimer scheduledTimerWithIdentifier:workQueue:delegateQueue:timeInterval:totalFires:firesForever:fireHandler:](CATDispatchTimer, "scheduledTimerWithIdentifier:workQueue:delegateQueue:timeInterval:totalFires:firesForever:fireHandler:", a3, mWorkQueue, a5, a6, 0, v17, a4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

uint64_t __102__CATConcreteTimerSource_scheduleRepeatTimerWithIdentifier_timeInterval_queue_totalFires_fireHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)scheduleInfiniteTimerWithIdentifier:(id)a3 timeInterval:(double)a4 queue:(id)a5 fireHandler:(id)a6
{
  id v10;
  OS_dispatch_queue *mWorkQueue;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;

  v10 = a6;
  mWorkQueue = self->mWorkQueue;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __93__CATConcreteTimerSource_scheduleInfiniteTimerWithIdentifier_timeInterval_queue_fireHandler___block_invoke;
  v15[3] = &unk_24C1C63E0;
  v16 = v10;
  v12 = v10;
  +[CATDispatchTimer scheduledTimerWithIdentifier:workQueue:delegateQueue:timeInterval:totalFires:firesForever:fireHandler:](CATDispatchTimer, "scheduledTimerWithIdentifier:workQueue:delegateQueue:timeInterval:totalFires:firesForever:fireHandler:", a3, mWorkQueue, a5, 0, 1, v15, a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

uint64_t __93__CATConcreteTimerSource_scheduleInfiniteTimerWithIdentifier_timeInterval_queue_fireHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mWorkQueue, 0);
}

@end
