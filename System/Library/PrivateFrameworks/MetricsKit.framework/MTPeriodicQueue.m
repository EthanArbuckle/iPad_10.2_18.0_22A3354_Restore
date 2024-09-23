@implementation MTPeriodicQueue

- (MTPeriodicQueue)init
{
  MTPeriodicQueue *v2;
  MTPeriodicQueue *v3;
  NSMutableArray *v4;
  NSMutableArray *mutableObjects;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *flushQueue;
  dispatch_queue_t v9;
  OS_dispatch_queue *syncQueue;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MTPeriodicQueue;
  v2 = -[MTPeriodicQueue init](&v12, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_flushTimerEnabled = 1;
    v2->_flushTimeInterval = 60.0;
    v2->_maximumBatchSize = 1000;
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    mutableObjects = v3->_mutableObjects;
    v3->_mutableObjects = v4;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create(0, v6);
    flushQueue = v3->_flushQueue;
    v3->_flushQueue = (OS_dispatch_queue *)v7;

    v9 = dispatch_queue_create(0, v6);
    syncQueue = v3->_syncQueue;
    v3->_syncQueue = (OS_dispatch_queue *)v9;

    -[MTPeriodicQueue _beginFlushTimer](v3, "_beginFlushTimer");
  }
  return v3;
}

- (void)dealloc
{
  NSObject *timer;
  OS_dispatch_source *v4;
  objc_super v5;

  timer = self->_timer;
  if (timer)
  {
    dispatch_source_cancel(timer);
    v4 = self->_timer;
    self->_timer = 0;

  }
  v5.receiver = self;
  v5.super_class = (Class)MTPeriodicQueue;
  -[MTPeriodicQueue dealloc](&v5, sel_dealloc);
}

- (void)setFlushTimeInterval:(double)a3
{
  NSObject *syncQueue;
  _QWORD v4[6];

  syncQueue = self->_syncQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __40__MTPeriodicQueue_setFlushTimeInterval___block_invoke;
  v4[3] = &unk_24C7A1C20;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  dispatch_sync(syncQueue, v4);
}

uint64_t __40__MTPeriodicQueue_setFlushTimeInterval___block_invoke(uint64_t result)
{
  uint64_t v1;
  double v2;

  v1 = *(_QWORD *)(result + 32);
  v2 = *(double *)(result + 40);
  if (*(double *)(v1 + 16) != v2)
  {
    *(double *)(v1 + 16) = v2;
    result = *(_QWORD *)(result + 32);
    if (*(_BYTE *)(result + 8))
      return objc_msgSend((id)result, "__beginFlushTimer");
  }
  return result;
}

- (void)setFlushTimerEnabled:(BOOL)a3
{
  NSObject *syncQueue;
  _QWORD v4[5];
  BOOL v5;

  syncQueue = self->_syncQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __40__MTPeriodicQueue_setFlushTimerEnabled___block_invoke;
  v4[3] = &unk_24C7A1C48;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(syncQueue, v4);
}

uint64_t __40__MTPeriodicQueue_setFlushTimerEnabled___block_invoke(uint64_t result)
{
  uint64_t v1;
  int v2;
  int v3;
  void *v4;

  v1 = *(_QWORD *)(result + 32);
  v2 = *(unsigned __int8 *)(result + 40);
  if (*(unsigned __int8 *)(v1 + 8) != v2)
  {
    *(_BYTE *)(v1 + 8) = v2;
    v3 = *(unsigned __int8 *)(result + 40);
    v4 = *(void **)(result + 32);
    if (v3)
      return objc_msgSend(v4, "__beginFlushTimer");
    else
      return objc_msgSend(v4, "__endFlushTimer");
  }
  return result;
}

- (void)setMaximumBatchSize:(int64_t)a3
{
  NSObject *syncQueue;
  _QWORD v4[6];

  syncQueue = self->_syncQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __39__MTPeriodicQueue_setMaximumBatchSize___block_invoke;
  v4[3] = &unk_24C7A1C20;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(syncQueue, v4);
}

unint64_t __39__MTPeriodicQueue_setMaximumBatchSize___block_invoke(unint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v1 = *(_QWORD *)(result + 32);
  v2 = *(_QWORD *)(result + 40);
  if (*(_QWORD *)(v1 + 24) != v2)
  {
    v3 = result;
    *(_QWORD *)(v1 + 24) = v2;
    v4 = *(_QWORD *)(result + 40);
    result = objc_msgSend(*(id *)(*(_QWORD *)(result + 32) + 48), "count");
    if (v4 <= result)
      return objc_msgSend(*(id *)(v3 + 32), "__flushObjects");
  }
  return result;
}

- (void)appendObject:(id)a3
{
  id v4;
  NSObject *syncQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __32__MTPeriodicQueue_appendObject___block_invoke;
  block[3] = &unk_24C7A0F90;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(syncQueue, block);

}

_QWORD *__32__MTPeriodicQueue_appendObject___block_invoke(uint64_t a1)
{
  unint64_t v2;
  _QWORD *result;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "addObject:", *(_QWORD *)(a1 + 40));
  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "count");
  result = *(_QWORD **)(a1 + 32);
  if (v2 >= result[3])
    return (_QWORD *)objc_msgSend(result, "__flushObjects");
  return result;
}

- (void)insertObject:(id)a3
{
  id v4;
  NSObject *syncQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __32__MTPeriodicQueue_insertObject___block_invoke;
  block[3] = &unk_24C7A0F90;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(syncQueue, block);

}

_QWORD *__32__MTPeriodicQueue_insertObject___block_invoke(uint64_t a1)
{
  unint64_t v2;
  _QWORD *result;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "insertObject:atIndex:", *(_QWORD *)(a1 + 40), 0);
  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "count");
  result = *(_QWORD **)(a1 + 32);
  if (v2 >= result[3])
    return (_QWORD *)objc_msgSend(result, "__flushObjects");
  return result;
}

- (void)insertObjects:(id)a3
{
  id v4;
  NSObject *syncQueue;
  id v6;
  _QWORD block[4];
  id v8;
  MTPeriodicQueue *v9;

  v4 = a3;
  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __33__MTPeriodicQueue_insertObjects___block_invoke;
  block[3] = &unk_24C7A0F90;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(syncQueue, block);

}

void __33__MTPeriodicQueue_insertObjects___block_invoke(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  _QWORD *v4;
  id v5;

  v2 = objc_msgSend(*(id *)(a1 + 32), "count");
  objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndexesInRange:", 0, v2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "insertObjects:atIndexes:", *(_QWORD *)(a1 + 32));
  v3 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "count");
  v4 = *(_QWORD **)(a1 + 40);
  if (v3 >= v4[3])
    objc_msgSend(v4, "__flushObjects");

}

- (void)flushObjects
{
  NSObject *syncQueue;
  _QWORD block[5];

  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __31__MTPeriodicQueue_flushObjects__block_invoke;
  block[3] = &unk_24C7A0748;
  block[4] = self;
  dispatch_sync(syncQueue, block);
}

uint64_t __31__MTPeriodicQueue_flushObjects__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "__flushObjects");
}

- (void)__flushObjects
{
  id v3;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_syncQueue);
  -[MTPeriodicQueue __clearObjects](self, "__clearObjects");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[MTPeriodicQueue __flushObjects:](self, "__flushObjects:", v3);

}

- (id)__clearObjects
{
  void *v3;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_syncQueue);
  v3 = (void *)-[NSMutableArray copy](self->_mutableObjects, "copy");
  -[NSMutableArray removeAllObjects](self->_mutableObjects, "removeAllObjects");
  return v3;
}

- (void)__flushObjects:(id)a3
{
  id v4;
  int64_t maximumBatchSize;
  void *v6;
  NSObject *flushQueue;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  int64_t v13;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_syncQueue);
  maximumBatchSize = self->_maximumBatchSize;
  v6 = (void *)MEMORY[0x212BA8428](self->_flushHandler);
  flushQueue = self->_flushQueue;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __34__MTPeriodicQueue___flushObjects___block_invoke;
  v10[3] = &unk_24C7A1C70;
  v10[4] = self;
  v11 = v4;
  v12 = v6;
  v13 = maximumBatchSize;
  v8 = v6;
  v9 = v4;
  dispatch_async(flushQueue, v10);

}

uint64_t __34__MTPeriodicQueue___flushObjects___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "__flushObjects:maximumBatchSize:flushHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

- (void)__flushObjects:(id)a3 maximumBatchSize:(int64_t)a4 flushHandler:(id)a5
{
  id v8;
  void (**v9)(id, void *);
  uint64_t v10;
  unint64_t v11;
  int64_t v12;
  uint64_t v13;
  void *v14;
  id v15;

  v8 = a3;
  v9 = (void (**)(id, void *))a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_flushQueue);
  v10 = objc_msgSend(v8, "count");
  if (v9 && v10)
  {
    do
    {
      v11 = objc_msgSend(v8, "count");
      if (v11 >= a4)
        v12 = a4;
      else
        v12 = v11;
      v13 = objc_msgSend(v8, "count") - v12;
      objc_msgSend(v8, "subarrayWithRange:", 0, v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "subarrayWithRange:", v12, v13);
      v15 = (id)objc_claimAutoreleasedReturnValue();

      v9[2](v9, v14);
      v8 = v15;
    }
    while (objc_msgSend(v15, "count"));
  }
  else
  {
    v15 = v8;
  }

}

- (void)_beginFlushTimer
{
  NSObject *syncQueue;
  _QWORD block[5];

  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__MTPeriodicQueue__beginFlushTimer__block_invoke;
  block[3] = &unk_24C7A0748;
  block[4] = self;
  dispatch_sync(syncQueue, block);
}

uint64_t __35__MTPeriodicQueue__beginFlushTimer__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "__endFlushTimer");
  return objc_msgSend(*(id *)(a1 + 32), "__beginFlushTimer");
}

- (void)__beginFlushTimer
{
  OS_dispatch_source *v3;
  OS_dispatch_source *timer;
  NSObject *v5;
  dispatch_time_t v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id location;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_syncQueue);
  objc_initWeak(&location, self);
  v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, (dispatch_queue_t)self->_syncQueue);
  timer = self->_timer;
  self->_timer = v3;

  v5 = self->_timer;
  v6 = dispatch_time(0, (uint64_t)(self->_flushTimeInterval * 1000000000.0));
  dispatch_source_set_timer(v5, v6, (unint64_t)(self->_flushTimeInterval * 1000000000.0), 0x3B9ACA00uLL);
  v7 = self->_timer;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __36__MTPeriodicQueue___beginFlushTimer__block_invoke;
  v8[3] = &unk_24C7A0380;
  objc_copyWeak(&v9, &location);
  dispatch_source_set_event_handler(v7, v8);
  dispatch_resume((dispatch_object_t)self->_timer);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __36__MTPeriodicQueue___beginFlushTimer__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "__flushObjects");

}

- (void)_endFlushTimer
{
  NSObject *syncQueue;
  _QWORD block[5];

  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __33__MTPeriodicQueue__endFlushTimer__block_invoke;
  block[3] = &unk_24C7A0748;
  block[4] = self;
  dispatch_sync(syncQueue, block);
}

uint64_t __33__MTPeriodicQueue__endFlushTimer__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "__endFlushTimer");
}

- (void)__endFlushTimer
{
  NSObject *timer;
  OS_dispatch_source *v4;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_syncQueue);
  timer = self->_timer;
  if (timer)
  {
    dispatch_source_cancel(timer);
    v4 = self->_timer;
    self->_timer = 0;

  }
}

- (double)flushTimeInterval
{
  return self->_flushTimeInterval;
}

- (BOOL)isFlushTimerEnabled
{
  return self->_flushTimerEnabled;
}

- (int64_t)maximumBatchSize
{
  return self->_maximumBatchSize;
}

- (id)flushHandler
{
  return self->_flushHandler;
}

- (void)setFlushHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (OS_dispatch_queue)flushQueue
{
  return self->_flushQueue;
}

- (void)setFlushQueue:(id)a3
{
  objc_storeStrong((id *)&self->_flushQueue, a3);
}

- (NSMutableArray)mutableObjects
{
  return self->_mutableObjects;
}

- (void)setMutableObjects:(id)a3
{
  objc_storeStrong((id *)&self->_mutableObjects, a3);
}

- (OS_dispatch_queue)syncQueue
{
  return self->_syncQueue;
}

- (void)setSyncQueue:(id)a3
{
  objc_storeStrong((id *)&self->_syncQueue, a3);
}

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_syncQueue, 0);
  objc_storeStrong((id *)&self->_mutableObjects, 0);
  objc_storeStrong((id *)&self->_flushQueue, 0);
  objc_storeStrong(&self->_flushHandler, 0);
}

@end
