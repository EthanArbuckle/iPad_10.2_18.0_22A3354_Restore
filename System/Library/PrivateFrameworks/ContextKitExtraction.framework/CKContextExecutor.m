@implementation CKContextExecutor

- (void)_awaitCompletion
{
  BOOL *p_done;
  unsigned __int8 v3;
  intptr_t v5;
  BOOL v6;
  NSObject *completionQueue;
  id v8;
  id v9;
  uint64_t block;
  uint64_t v11;
  uint64_t (*v12)(uint64_t);
  void *v13;
  CKContextExecutor *v14;
  id v15;
  BOOL v16;

  p_done = &self->_done;
  v3 = atomic_load((unsigned __int8 *)&self->_done);
  if ((v3 & 1) == 0)
  {
    v5 = dispatch_group_wait((dispatch_group_t)self->_group, self->_timeoutAfter);
    atomic_store(1u, (unsigned __int8 *)p_done);
    v8 = (id)MEMORY[0x1B5E103A4](self->_completionHandler);
    if (v8)
    {
      v6 = v5 != 0;
      completionQueue = self->_completionQueue;
      block = MEMORY[0x1E0C809B0];
      v11 = 3221225472;
      v12 = __37__CKContextExecutor__awaitCompletion__block_invoke;
      v13 = &unk_1E62433B8;
      v14 = self;
      v15 = v8;
      v16 = v6;
      dispatch_sync(completionQueue, &block);

    }
    -[NSCondition signal](self->_completionCondition, "signal", v8, block, v11, v12, v13);

  }
}

uint64_t __37__CKContextExecutor__awaitCompletion__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48));
}

- (CKContextExecutor)initWithContext:(id)a3 workItemQueue:(id)a4 completionQueue:(id)a5 timeoutAfter:(unint64_t)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  CKContextExecutor *v16;
  CKContextExecutor *v17;
  dispatch_group_t v18;
  OS_dispatch_group *group;
  uint64_t v20;
  id completionHandler;
  NSCondition *v22;
  NSCondition *completionCondition;
  NSObject *v24;
  _QWORD block[4];
  CKContextExecutor *v27;
  objc_super v28;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  v28.receiver = self;
  v28.super_class = (Class)CKContextExecutor;
  v16 = -[CKContextExecutor init](&v28, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeWeak(&v16->_context, v12);
    objc_storeStrong((id *)&v17->_workItemQueue, a4);
    objc_storeStrong((id *)&v17->_completionQueue, a5);
    v18 = dispatch_group_create();
    group = v17->_group;
    v17->_group = (OS_dispatch_group *)v18;

    v17->_timeoutAfter = a6;
    v20 = MEMORY[0x1B5E103A4](v15);
    completionHandler = v17->_completionHandler;
    v17->_completionHandler = (id)v20;

    v22 = (NSCondition *)objc_alloc_init(MEMORY[0x1E0CB3530]);
    completionCondition = v17->_completionCondition;
    v17->_completionCondition = v22;

    -[CKContextExecutor markIncomplete](v17, "markIncomplete");
    dispatch_get_global_queue(25, 0);
    v24 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __98__CKContextExecutor_initWithContext_workItemQueue_completionQueue_timeoutAfter_completionHandler___block_invoke;
    block[3] = &unk_1E6243148;
    v27 = v17;
    dispatch_async(v24, block);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v15 + 2))(v15, 0, 0);
  }

  return v17;
}

uint64_t __98__CKContextExecutor_initWithContext_workItemQueue_completionQueue_timeoutAfter_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_awaitCompletion");
}

- (void)dealloc
{
  OS_dispatch_queue *workItemQueue;
  OS_dispatch_queue *completionQueue;
  OS_dispatch_group *group;
  id completionHandler;
  NSCondition *completionCondition;
  objc_super v8;

  objc_storeWeak(&self->_context, 0);
  workItemQueue = self->_workItemQueue;
  self->_workItemQueue = 0;

  completionQueue = self->_completionQueue;
  self->_completionQueue = 0;

  group = self->_group;
  self->_group = 0;

  completionHandler = self->_completionHandler;
  self->_completionHandler = 0;

  completionCondition = self->_completionCondition;
  self->_completionCondition = 0;

  v8.receiver = self;
  v8.super_class = (Class)CKContextExecutor;
  -[CKContextExecutor dealloc](&v8, sel_dealloc);
}

- (void)markIncomplete
{
  dispatch_group_enter((dispatch_group_t)self->_group);
}

- (void)markReady
{
  dispatch_group_leave((dispatch_group_t)self->_group);
}

- (void)markReadyAndAwaitCompletion
{
  unsigned __int8 v3;

  dispatch_group_leave((dispatch_group_t)self->_group);
  v3 = atomic_load((unsigned __int8 *)&self->_done);
  if ((v3 & 1) == 0)
    -[NSCondition wait](self->_completionCondition, "wait");
}

- (void)addWorkItem:(id)a3
{
  -[CKContextExecutor addWorkItemToQueue:withWorkItem:andContext:](self, "addWorkItemToQueue:withWorkItem:andContext:", self->_workItemQueue, a3, 0);
}

- (void)addWorkItem:(id)a3 toQueue:(id)a4
{
  -[CKContextExecutor addWorkItemToQueue:withWorkItem:andContext:](self, "addWorkItemToQueue:withWorkItem:andContext:", a4, a3, 0);
}

- (void)addWorkItem:(id)a3 withContext:(id)a4
{
  -[CKContextExecutor addWorkItemToQueue:withWorkItem:andContext:](self, "addWorkItemToQueue:withWorkItem:andContext:", self->_workItemQueue, a3, a4);
}

- (void)addWorkItemToQueue:(id)a3 withWorkItem:(id)a4 andContext:(id)a5
{
  id v8;
  id v9;
  unsigned __int8 v10;
  NSObject *v11;
  void *v12;
  NSObject *group;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id location;

  v8 = a4;
  v9 = a5;
  v10 = atomic_load((unsigned __int8 *)&self->_done);
  if (v8 && (v10 & 1) == 0)
  {
    v11 = a3;
    v12 = (void *)objc_msgSend(v8, "copy");

    objc_initWeak(&location, self);
    group = self->_group;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __64__CKContextExecutor_addWorkItemToQueue_withWorkItem_andContext___block_invoke;
    v14[3] = &unk_1E62433E0;
    objc_copyWeak(&v17, &location);
    v8 = v12;
    v16 = v8;
    v15 = v9;
    dispatch_group_async(group, v11, v14);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

}

void __64__CKContextExecutor_addWorkItemToQueue_withWorkItem_andContext___block_invoke(uint64_t a1)
{
  unsigned __int8 *WeakRetained;
  unsigned __int8 *v3;
  unsigned __int8 v4;
  unsigned __int8 *v5;

  WeakRetained = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    if (*(_QWORD *)(a1 + 40))
    {
      v4 = atomic_load(WeakRetained + 56);
      if ((v4 & 1) == 0)
      {
        v5 = WeakRetained;
        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
        v3 = v5;
      }
    }
  }

}

- (BOOL)done
{
  return self->_done;
}

- (id)context
{
  return objc_loadWeakRetained(&self->_context);
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_context);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_completionCondition, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_completionQueue, 0);
  objc_storeStrong((id *)&self->_workItemQueue, 0);
}

@end
