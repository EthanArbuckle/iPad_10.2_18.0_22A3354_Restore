@implementation _OSBatchingQueue

- (_OSBatchingQueue)initWithName:(id)a3 maxBatchingDelay:(double)a4 maxQueueDepth:(unint64_t)a5 queue:(id)a6 workItemsHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  _OSBatchingQueue *v15;
  _OSBatchingQueue *v16;
  unint64_t v17;
  uint64_t v18;
  id workHandler;
  uint64_t v20;
  NSMutableArray *workItems;
  NSObject *v22;
  dispatch_queue_t v23;
  id v24;
  const char *v25;
  OS_dispatch_queue *executionQueue;
  id v27;
  const char *v28;
  dispatch_queue_t v29;
  OS_dispatch_queue *syncQueue;
  dispatch_source_t v31;
  OS_dispatch_source *timer;
  NSObject *v33;
  NSObject *v34;
  dispatch_time_t v35;
  _QWORD handler[4];
  _OSBatchingQueue *v38;
  objc_super v39;

  v12 = a3;
  v13 = a6;
  v14 = a7;
  v39.receiver = self;
  v39.super_class = (Class)_OSBatchingQueue;
  v15 = -[_OSBatchingQueue init](&v39, sel_init);
  v16 = v15;
  if (v15)
  {
    v15->_maxDelay = a4;
    v17 = 4;
    if (a5)
      v17 = a5;
    v15->_maxQueueDepth = v17;
    v18 = MEMORY[0x2207CDC38](v14);
    workHandler = v16->_workHandler;
    v16->_workHandler = (id)v18;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v20 = objc_claimAutoreleasedReturnValue();
    workItems = v16->_workItems;
    v16->_workItems = (NSMutableArray *)v20;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v22 = objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v23 = (dispatch_queue_t)v13;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.dasbatchingqueue.executionqueue.%s"), objc_msgSend(objc_retainAutorelease(v12), "UTF8String"));
      v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v25 = (const char *)objc_msgSend(v24, "UTF8String");

      v23 = dispatch_queue_create(v25, v22);
    }
    executionQueue = v16->_executionQueue;
    v16->_executionQueue = (OS_dispatch_queue *)v23;

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.dasbatchingqueue.syncqueue.%s"), objc_msgSend(objc_retainAutorelease(v12), "UTF8String"));
    v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v28 = (const char *)objc_msgSend(v27, "UTF8String");

    v29 = dispatch_queue_create(v28, v22);
    syncQueue = v16->_syncQueue;
    v16->_syncQueue = (OS_dispatch_queue *)v29;

    v31 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, (dispatch_queue_t)v16->_syncQueue);
    timer = v16->_timer;
    v16->_timer = (OS_dispatch_source *)v31;

    dispatch_set_qos_class_fallback();
    v33 = v16->_timer;
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __87___OSBatchingQueue_initWithName_maxBatchingDelay_maxQueueDepth_queue_workItemsHandler___block_invoke;
    handler[3] = &unk_24E4777B8;
    v38 = v16;
    dispatch_source_set_event_handler(v33, handler);
    v34 = v16->_timer;
    v35 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
    dispatch_source_set_timer(v34, v35, 0xFFFFFFFFFFFFFFFFLL, (unint64_t)(a4 / 10.0 * 1000000000.0));

  }
  return v16;
}

+ (id)queueWithName:(id)a3 maxBatchingDelay:(double)a4 maxQueueDepth:(unint64_t)a5 queue:(id)a6 workItemsHandler:(id)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;

  v11 = a7;
  v12 = a6;
  v13 = a3;
  v14 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithName:maxBatchingDelay:maxQueueDepth:queue:workItemsHandler:", v13, a5, v12, v11, a4);

  return v14;
}

- (void)unprotectedExecuteWorkItems
{
  void *v3;
  void *v4;
  NSObject *executionQueue;
  _QWORD block[4];
  id v7;
  _OSBatchingQueue *v8;
  id v9;

  v3 = (void *)os_transaction_create();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", self->_workItems);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    executionQueue = self->_executionQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __47___OSBatchingQueue_unprotectedExecuteWorkItems__block_invoke;
    block[3] = &unk_24E4777E0;
    v7 = v3;
    v8 = self;
    v9 = v4;
    dispatch_async(executionQueue, block);
    -[NSMutableArray removeAllObjects](self->_workItems, "removeAllObjects");
    dispatch_suspend((dispatch_object_t)self->_timer);

  }
}

- (void)addWorkItem:(id)a3
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
  block[2] = __32___OSBatchingQueue_addWorkItem___block_invoke;
  block[3] = &unk_24E4776E8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(syncQueue, block);

}

- (double)maxDelay
{
  return self->_maxDelay;
}

- (void)setMaxDelay:(double)a3
{
  self->_maxDelay = a3;
}

- (unint64_t)maxQueueDepth
{
  return self->_maxQueueDepth;
}

- (void)setMaxQueueDepth:(unint64_t)a3
{
  self->_maxQueueDepth = a3;
}

- (OS_dispatch_queue)syncQueue
{
  return self->_syncQueue;
}

- (void)setSyncQueue:(id)a3
{
  objc_storeStrong((id *)&self->_syncQueue, a3);
}

- (OS_dispatch_queue)executionQueue
{
  return self->_executionQueue;
}

- (void)setExecutionQueue:(id)a3
{
  objc_storeStrong((id *)&self->_executionQueue, a3);
}

- (id)workHandler
{
  return self->_workHandler;
}

- (void)setWorkHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSMutableArray)workItems
{
  return self->_workItems;
}

- (void)setWorkItems:(id)a3
{
  objc_storeStrong((id *)&self->_workItems, a3);
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
  objc_storeStrong((id *)&self->_workItems, 0);
  objc_storeStrong(&self->_workHandler, 0);
  objc_storeStrong((id *)&self->_executionQueue, 0);
  objc_storeStrong((id *)&self->_syncQueue, 0);
}

@end
