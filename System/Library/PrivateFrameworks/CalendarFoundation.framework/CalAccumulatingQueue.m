@implementation CalAccumulatingQueue

- (CalAccumulatingQueue)initWithQueue:(id)a3 andBlock:(id)a4 delay:(double)a5
{
  return (CalAccumulatingQueue *)-[CalAccumulatingQueue _initWithQueue:andBlock:delay:throttle:](self, "_initWithQueue:andBlock:delay:throttle:", a3, a4, 0, a5);
}

- (CalAccumulatingQueue)initWithQueue:(id)a3 andBlock:(id)a4
{
  return (CalAccumulatingQueue *)-[CalAccumulatingQueue _initWithQueue:andBlock:delay:throttle:](self, "_initWithQueue:andBlock:delay:throttle:", a3, a4, 0, 0.0);
}

- (void)updateTagsAndExecuteBlock:(id)a3 withContext:(id)a4
{
  -[CalAccumulatingQueue updateTags:withContext:](self, "updateTags:withContext:", a3, a4);
  -[CalAccumulatingQueue executeBlock](self, "executeBlock");
}

- (void)updateTagsAndExecuteBlock:(id)a3
{
  -[CalAccumulatingQueue updateTagsAndExecuteBlock:withContext:](self, "updateTagsAndExecuteBlock:withContext:", a3, 0);
}

- (CalAccumulatingQueue)initWithQueue:(id)a3 andBlock:(id)a4 throttle:(id)a5
{
  return (CalAccumulatingQueue *)-[CalAccumulatingQueue _initWithQueue:andBlock:delay:throttle:](self, "_initWithQueue:andBlock:delay:throttle:", a3, a4, a5, 0.0);
}

- (id)_initWithQueue:(id)a3 andBlock:(id)a4 delay:(double)a5 throttle:(id)a6
{
  id v10;
  id v11;
  id v12;
  CalAccumulatingQueue *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *queue;
  uint64_t v16;
  id block;
  uint64_t v18;
  id throttleBlock;
  uint64_t v20;
  NSMutableSet *tags;
  uint64_t v22;
  NSMutableDictionary *context;
  objc_super v25;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v25.receiver = self;
  v25.super_class = (Class)CalAccumulatingQueue;
  v13 = -[CalAccumulatingQueue init](&v25, sel_init);
  if (v13)
  {
    if (v10)
      v14 = (dispatch_queue_t)v10;
    else
      v14 = dispatch_queue_create("CalAccumulatingQueue", 0);
    queue = v13->_queue;
    v13->_queue = (OS_dispatch_queue *)v14;

    v16 = objc_msgSend(v11, "copy");
    block = v13->_block;
    v13->_block = (id)v16;

    v18 = objc_msgSend(v12, "copy");
    throttleBlock = v13->_throttleBlock;
    v13->_throttleBlock = (id)v18;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v20 = objc_claimAutoreleasedReturnValue();
    tags = v13->_tags;
    v13->_tags = (NSMutableSet *)v20;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v22 = objc_claimAutoreleasedReturnValue();
    context = v13->_context;
    v13->_context = (NSMutableDictionary *)v22;

    v13->_delay = a5;
    v13->_executionPending = 0;
  }

  return v13;
}

- (void)_cancelPendingTimer
{
  NSObject *pendingExecutionTimer;
  OS_dispatch_source *v4;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  pendingExecutionTimer = self->_pendingExecutionTimer;
  if (pendingExecutionTimer)
  {
    dispatch_source_cancel(pendingExecutionTimer);
    v4 = self->_pendingExecutionTimer;
    self->_pendingExecutionTimer = 0;

    self->_pendingPopTime = 0;
  }
}

- (void)_scheduleTimerWithDelay:(double)a3
{
  dispatch_time_t v5;
  unint64_t v6;
  OS_dispatch_source *v7;
  OS_dispatch_source *pendingExecutionTimer;
  NSObject *v9;
  _QWORD handler[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (a3 <= 0.0)
  {
    -[CalAccumulatingQueue _cancelPendingTimer](self, "_cancelPendingTimer");
    -[CalAccumulatingQueue _callTargetBlockAndReset](self, "_callTargetBlockAndReset");
  }
  else
  {
    v5 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
    if (self->_pendingPopTime - 1 >= v5)
    {
      v6 = v5;
      -[CalAccumulatingQueue _cancelPendingTimer](self, "_cancelPendingTimer");
      v7 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_queue);
      pendingExecutionTimer = self->_pendingExecutionTimer;
      self->_pendingExecutionTimer = v7;

      self->_pendingPopTime = v6;
      dispatch_source_set_timer((dispatch_source_t)self->_pendingExecutionTimer, v6, 0xFFFFFFFFFFFFFFFFLL, 0);
      v9 = self->_pendingExecutionTimer;
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __48__CalAccumulatingQueue__scheduleTimerWithDelay___block_invoke;
      handler[3] = &unk_1E2A84760;
      handler[4] = self;
      dispatch_source_set_event_handler(v9, handler);
      dispatch_resume((dispatch_object_t)self->_pendingExecutionTimer);
    }
  }
}

uint64_t __48__CalAccumulatingQueue__scheduleTimerWithDelay___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_cancelPendingTimer");
  return objc_msgSend(*(id *)(a1 + 32), "_callTargetBlockAndReset");
}

- (void)_callTargetBlockAndReset
{
  CalAccumulatingQueue *v3;
  void *v4;
  id v5;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3 = self;
  objc_sync_enter(v3);
  -[NSMutableSet allObjects](v3->_tags, "allObjects");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (void *)-[NSMutableDictionary copy](v3->_context, "copy");
  -[NSMutableSet removeAllObjects](v3->_tags, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](v3->_context, "removeAllObjects");
  v3->_executionPending = 0;
  objc_sync_exit(v3);

  if (objc_msgSend(v5, "count") || objc_msgSend(v4, "count"))
    (*((void (**)(void))v3->_block + 2))();

}

- (void)_executeBlockWithoutThrottleBlock
{
  CalAccumulatingQueue *v2;
  uint64_t v3;
  uint64_t v4;
  dispatch_time_t v5;
  NSObject *queue;
  CalAccumulatingQueue *obj;
  _QWORD block[5];

  obj = self;
  objc_sync_enter(obj);
  v2 = obj;
  if (!obj->_executionPending
    && ((v3 = -[NSMutableSet count](obj->_tags, "count"), v2 = obj, v3)
     || (v4 = -[NSMutableDictionary count](obj->_context, "count"), v2 = obj, v4)))
  {
    v2->_executionPending = 1;
    objc_sync_exit(v2);

    v5 = dispatch_time(0, (uint64_t)(obj->_delay * 1000000000.0));
    queue = obj->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __57__CalAccumulatingQueue__executeBlockWithoutThrottleBlock__block_invoke;
    block[3] = &unk_1E2A84760;
    block[4] = obj;
    dispatch_after(v5, queue, block);
  }
  else
  {
    objc_sync_exit(v2);

  }
}

uint64_t __57__CalAccumulatingQueue__executeBlockWithoutThrottleBlock__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_callTargetBlockAndReset");
}

- (void)_executeBlockWithThrottleBlock
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__CalAccumulatingQueue__executeBlockWithThrottleBlock__block_invoke;
  block[3] = &unk_1E2A84760;
  block[4] = self;
  dispatch_async(queue, block);
}

void __54__CalAccumulatingQueue__executeBlockWithThrottleBlock__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;

  v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "allObjects");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "copy");
  objc_sync_exit(v2);

  if (objc_msgSend(v4, "count") || objc_msgSend(v3, "count"))
  {
    (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) + 16))();
    objc_msgSend(*(id *)(a1 + 32), "_scheduleTimerWithDelay:");
  }

}

- (void)executeBlock
{
  if (self->_throttleBlock)
    -[CalAccumulatingQueue _executeBlockWithThrottleBlock](self, "_executeBlockWithThrottleBlock");
  else
    -[CalAccumulatingQueue _executeBlockWithoutThrottleBlock](self, "_executeBlockWithoutThrottleBlock");
}

- (void)updateTags:(id)a3
{
  -[CalAccumulatingQueue updateTags:withContext:](self, "updateTags:withContext:", a3, 0);
}

- (void)updateTags:(id)a3 withContext:(id)a4
{
  id v6;
  CalAccumulatingQueue *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v17 = a4;
  v7 = self;
  objc_sync_enter(v7);
  if (v6)
    -[NSMutableSet addObjectsFromArray:](v7->_tags, "addObjectsFromArray:", v6);
  v16 = v6;
  if (v17)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v8 = v17;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16, v6);
    if (!v9)
      goto LABEL_20;
    v10 = *(_QWORD *)v19;
    while (1)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v8);
        v12 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](v7->_context, "objectForKeyedSubscript:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKeyedSubscript:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v13, "arrayByAddingObjectsFromArray:", v14);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableDictionary setObject:forKeyedSubscript:](v7->_context, "setObject:forKeyedSubscript:", v15, v12);
LABEL_16:

              goto LABEL_18;
            }
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v13, "setByAddingObjectsFromSet:", v14);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableDictionary setObject:forKeyedSubscript:](v7->_context, "setObject:forKeyedSubscript:", v15, v12);
              goto LABEL_16;
            }
          }
        }
        -[NSMutableDictionary setObject:forKeyedSubscript:](v7->_context, "setObject:forKeyedSubscript:", v14, v12);
LABEL_18:

      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (!v9)
      {
LABEL_20:

        break;
      }
    }
  }
  objc_sync_exit(v7);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingExecutionTimer, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_tags, 0);
  objc_storeStrong(&self->_throttleBlock, 0);
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
