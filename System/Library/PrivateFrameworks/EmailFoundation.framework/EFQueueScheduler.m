@implementation EFQueueScheduler

- (void)performSyncBlock:(id)a3
{
  void *v4;
  NSObject *queue;
  id v6;
  void (**v7)(void);
  _QWORD block[4];
  id v9;
  void (**v10)(void);

  v7 = (void (**)(void))a3;
  if (-[EFQueueScheduler prefersImmediateExecution](self, "prefersImmediateExecution"))
  {
    v7[2]();
  }
  else
  {
    +[EFPriorityDesignator currentDesignatorIfExists](EFPriorityDesignator, "currentDesignatorIfExists");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __37__EFQueueScheduler_performSyncBlock___block_invoke;
    block[3] = &unk_1E62A5D70;
    v9 = v4;
    v10 = v7;
    v6 = v4;
    dispatch_sync(queue, block);

  }
}

void __37__EFQueueScheduler_performSyncBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = *(void **)(a1 + 32);
  +[EFPriorityDesignator currentDesignatorIfExists](EFPriorityDesignator, "currentDesignatorIfExists");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2 != v3)
    +[EFPriorityDesignator destroyCurrentDesignator](EFPriorityDesignator, "destroyCurrentDesignator");
}

- (EFQueueScheduler)initWithQueue:(id)a3
{
  id v5;
  EFQueueScheduler *v6;
  EFQueueScheduler *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EFQueueScheduler;
  v6 = -[EFQueueScheduler init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_queue, a3);

  return v7;
}

- (id)performCancelableBlock:(id)a3
{
  void (**v4)(id, _QWORD);
  EFCancelationToken *v5;
  EFCancelationToken *v6;
  NSObject *queue;
  EFCancelationToken *v8;
  void *v9;
  _QWORD v11[4];
  EFCancelationToken *v12;
  void (**v13)(id, _QWORD);

  v4 = (void (**)(id, _QWORD))a3;
  if (-[EFQueueScheduler prefersImmediateExecution](self, "prefersImmediateExecution"))
  {
    v4[2](v4, 0);
    v5 = 0;
  }
  else
  {
    v6 = objc_alloc_init(EFCancelationToken);
    queue = self->_queue;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __43__EFQueueScheduler_performCancelableBlock___block_invoke;
    v11[3] = &unk_1E62A64F0;
    v8 = v6;
    v12 = v8;
    v13 = v4;
    dispatch_async(queue, v11);
    v9 = v13;
    v5 = v8;

  }
  return v5;
}

- (void)assertIsExecuting:(BOOL)a3
{
  NSObject *queue;

  queue = self->_queue;
  if (a3)
    dispatch_assert_queue_V2(queue);
  else
    dispatch_assert_queue_not_V2(queue);
}

- (void)performBlock:(id)a3
{
  void (**v4)(_QWORD);
  NSObject *queue;
  _QWORD block[4];
  void (**v7)(_QWORD);

  v4 = (void (**)(_QWORD))a3;
  if (-[EFQueueScheduler prefersImmediateExecution](self, "prefersImmediateExecution"))
  {
    v4[2](v4);
  }
  else
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __33__EFQueueScheduler_performBlock___block_invoke;
    block[3] = &unk_1E62A5B40;
    v7 = v4;
    dispatch_async(queue, block);

  }
}

- (BOOL)prefersImmediateExecution
{
  return 0;
}

uint64_t __44__EFQueueScheduler_afterDelay_performBlock___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
  return +[EFPriorityDesignator destroyCurrentDesignator](EFPriorityDesignator, "destroyCurrentDesignator");
}

uint64_t __33__EFQueueScheduler_performBlock___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return +[EFPriorityDesignator destroyCurrentDesignator](EFPriorityDesignator, "destroyCurrentDesignator");
}

uint64_t __43__EFQueueScheduler_performCancelableBlock___block_invoke(uint64_t a1)
{
  if ((objc_msgSend(*(id *)(a1 + 32), "isCanceled") & 1) == 0)
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return +[EFPriorityDesignator destroyCurrentDesignator](EFPriorityDesignator, "destroyCurrentDesignator");
}

- (id)afterDelay:(double)a3 performBlock:(id)a4
{
  id v6;
  dispatch_time_t v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  _QWORD v15[4];
  NSObject *v16;
  _QWORD handler[4];
  NSObject *v18;
  id v19;

  v6 = a4;
  if (a3 <= 1.84467441e10)
    v7 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  else
    v7 = -1;
  v8 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_queue);
  dispatch_source_set_timer(v8, v7, 0xFFFFFFFFFFFFFFFFLL, 0);
  v9 = MEMORY[0x1E0C809B0];
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __44__EFQueueScheduler_afterDelay_performBlock___block_invoke;
  handler[3] = &unk_1E62A5D70;
  v10 = v6;
  v19 = v10;
  v11 = v8;
  v18 = v11;
  dispatch_source_set_event_handler(v11, handler);
  v15[0] = v9;
  v15[1] = 3221225472;
  v15[2] = __44__EFQueueScheduler_afterDelay_performBlock___block_invoke_2;
  v15[3] = &unk_1E62A5860;
  v16 = v11;
  v12 = v11;
  +[EFCancelationToken tokenWithCancelationBlock:](EFCancelationToken, "tokenWithCancelationBlock:", v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_resume(v12);

  return v13;
}

void __44__EFQueueScheduler_afterDelay_performBlock___block_invoke_2(uint64_t a1)
{
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
}

- (id)performWithObject:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "onScheduler:performWithObject:", self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)suspend
{
  dispatch_suspend((dispatch_object_t)self->_queue);
}

- (void)resume
{
  dispatch_resume((dispatch_object_t)self->_queue);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

- (EFQueueScheduler)init
{
  void *v3;
  EFQueueScheduler *v4;

  dispatch_get_global_queue(21, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[EFQueueScheduler initWithQueue:](self, "initWithQueue:", v3);

  return v4;
}

- (void)performSyncBarrierBlock:(id)a3
{
  void *v4;
  NSObject *queue;
  id v6;
  void (**v7)(void);
  _QWORD block[4];
  id v9;
  void (**v10)(void);

  v7 = (void (**)(void))a3;
  if (-[EFQueueScheduler prefersImmediateExecution](self, "prefersImmediateExecution"))
  {
    v7[2]();
  }
  else
  {
    +[EFPriorityDesignator currentDesignatorIfExists](EFPriorityDesignator, "currentDesignatorIfExists");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __44__EFQueueScheduler_performSyncBarrierBlock___block_invoke;
    block[3] = &unk_1E62A5D70;
    v9 = v4;
    v10 = v7;
    v6 = v4;
    dispatch_barrier_sync(queue, block);

  }
}

void __44__EFQueueScheduler_performSyncBarrierBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = *(void **)(a1 + 32);
  +[EFPriorityDesignator currentDesignatorIfExists](EFPriorityDesignator, "currentDesignatorIfExists");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2 != v3)
    +[EFPriorityDesignator destroyCurrentDesignator](EFPriorityDesignator, "destroyCurrentDesignator");
}

- (void)performVoucherPreservingBlock:(id)a3
{
  id v4;
  NSObject *queue;
  dispatch_block_t v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  if (-[EFQueueScheduler prefersImmediateExecution](self, "prefersImmediateExecution"))
  {
    dispatch_block_perform(DISPATCH_BLOCK_ASSIGN_CURRENT, v4);
  }
  else
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __50__EFQueueScheduler_performVoucherPreservingBlock___block_invoke;
    block[3] = &unk_1E62A5B40;
    v8 = v4;
    v6 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
    dispatch_async(queue, v6);

  }
}

uint64_t __50__EFQueueScheduler_performVoucherPreservingBlock___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return +[EFPriorityDesignator destroyCurrentDesignator](EFPriorityDesignator, "destroyCurrentDesignator");
}

@end
