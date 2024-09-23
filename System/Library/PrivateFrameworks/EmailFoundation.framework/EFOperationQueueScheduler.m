@implementation EFOperationQueueScheduler

- (EFOperationQueueScheduler)initWithMaxConcurrentOperationCount:(int64_t)a3
{
  EFOperationQueueScheduler *v4;
  NSOperationQueue *v5;
  NSOperationQueue *queue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)EFOperationQueueScheduler;
  v4 = -[EFOperationQueueScheduler init](&v8, sel_init);
  if (v4)
  {
    v5 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    queue = v4->_queue;
    v4->_queue = v5;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v4->_queue, "setMaxConcurrentOperationCount:", a3);
  }
  return v4;
}

- (void)performBlock:(id)a3
{
  id v4;
  NSOperationQueue *queue;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42__EFOperationQueueScheduler_performBlock___block_invoke;
  v7[3] = &unk_1E62A5B40;
  v8 = v4;
  v6 = v4;
  -[NSOperationQueue addOperationWithBlock:](queue, "addOperationWithBlock:", v7);

}

uint64_t __42__EFOperationQueueScheduler_performBlock___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return +[EFPriorityDesignator destroyCurrentDesignator](EFPriorityDesignator, "destroyCurrentDesignator");
}

- (void)performSyncBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  NSOperationQueue *queue;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  id v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[EFPriorityDesignator currentDesignatorIfExists](EFPriorityDesignator, "currentDesignatorIfExists");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB34C8];
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __46__EFOperationQueueScheduler_performSyncBlock___block_invoke;
  v15 = &unk_1E62A5D70;
  v7 = v4;
  v17 = v7;
  v8 = v5;
  v16 = v8;
  objc_msgSend(v6, "blockOperationWithBlock:", &v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  v18[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1, v12, v13, v14, v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSOperationQueue addOperations:waitUntilFinished:](queue, "addOperations:waitUntilFinished:", v11, 1);

}

void __46__EFOperationQueueScheduler_performSyncBlock___block_invoke(uint64_t a1)
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

- (void)performSyncBarrierBlock:(id)a3
{
  id v4;
  void *v5;
  NSOperationQueue *queue;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  id v14;

  v4 = a3;
  +[EFPriorityDesignator currentDesignatorIfExists](EFPriorityDesignator, "currentDesignatorIfExists");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __53__EFOperationQueueScheduler_performSyncBarrierBlock___block_invoke;
  v12 = &unk_1E62A5D70;
  v7 = v4;
  v14 = v7;
  v8 = v5;
  v13 = v8;
  -[NSOperationQueue addBarrierBlock:](queue, "addBarrierBlock:", &v9);
  -[EFOperationQueueScheduler performSyncBlock:](self, "performSyncBlock:", &__block_literal_global_23, v9, v10, v11, v12);

}

void __53__EFOperationQueueScheduler_performSyncBarrierBlock___block_invoke(uint64_t a1)
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
  NSOperationQueue *queue;
  id v6;
  dispatch_block_t v7;
  _QWORD block[4];
  id v9;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__EFOperationQueueScheduler_performVoucherPreservingBlock___block_invoke;
  block[3] = &unk_1E62A5B40;
  v6 = v4;
  v9 = v6;
  v7 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  -[NSOperationQueue addOperationWithBlock:](queue, "addOperationWithBlock:", v7);

}

uint64_t __59__EFOperationQueueScheduler_performVoucherPreservingBlock___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return +[EFPriorityDesignator destroyCurrentDesignator](EFPriorityDesignator, "destroyCurrentDesignator");
}

- (id)performCancelableBlock:(id)a3
{
  id v4;
  EFCancelationToken *v5;
  void *v6;
  uint64_t v7;
  id v8;
  EFCancelationToken *v9;
  void *v10;
  EFCancelationToken *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  id location;
  _QWORD v19[4];
  EFCancelationToken *v20;
  id v21;

  v4 = a3;
  v5 = objc_alloc_init(EFCancelationToken);
  v6 = (void *)MEMORY[0x1E0CB34C8];
  v7 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __52__EFOperationQueueScheduler_performCancelableBlock___block_invoke;
  v19[3] = &unk_1E62A5D70;
  v8 = v4;
  v21 = v8;
  v9 = v5;
  v20 = v9;
  objc_msgSend(v6, "blockOperationWithBlock:", v19);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, v10);
  v13 = v7;
  v14 = 3221225472;
  v15 = __52__EFOperationQueueScheduler_performCancelableBlock___block_invoke_2;
  v16 = &unk_1E62A5838;
  objc_copyWeak(&v17, &location);
  -[EFCancelationToken addCancelationBlock:](v9, "addCancelationBlock:", &v13);
  -[NSOperationQueue addOperation:](self->_queue, "addOperation:", v10, v13, v14, v15, v16);
  v11 = v9;
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

  return v11;
}

uint64_t __52__EFOperationQueueScheduler_performCancelableBlock___block_invoke(uint64_t a1)
{
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  return +[EFPriorityDesignator destroyCurrentDesignator](EFPriorityDesignator, "destroyCurrentDesignator");
}

void __52__EFOperationQueueScheduler_performCancelableBlock___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "cancel");

}

- (id)afterDelay:(double)a3 performBlock:(id)a4
{
  id v6;
  EFCancelationToken *v7;
  void *v8;
  EFCancelationToken *v9;
  id v10;
  id v11;
  void *v12;
  EFCancelationToken *v13;
  _QWORD v15[4];
  EFCancelationToken *v16;
  EFOperationQueueScheduler *v17;
  id v18;

  v6 = a4;
  v7 = objc_alloc_init(EFCancelationToken);
  +[EFScheduler globalAsyncScheduler](EFScheduler, "globalAsyncScheduler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __53__EFOperationQueueScheduler_afterDelay_performBlock___block_invoke;
  v15[3] = &unk_1E62A5A18;
  v9 = v7;
  v16 = v9;
  v17 = self;
  v10 = v6;
  v18 = v10;
  v11 = (id)objc_msgSend(v8, "afterDelay:performBlock:", v15, a3);

  v12 = v18;
  v13 = v9;

  return v13;
}

void __53__EFOperationQueueScheduler_afterDelay_performBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t);
  void *v7;
  id v8;
  id v9;

  if ((objc_msgSend(*(id *)(a1 + 32), "isCanceled") & 1) == 0)
  {
    v4 = MEMORY[0x1E0C809B0];
    v5 = 3221225472;
    v6 = __53__EFOperationQueueScheduler_afterDelay_performBlock___block_invoke_2;
    v7 = &unk_1E62A6D40;
    v2 = *(void **)(a1 + 40);
    v8 = *(id *)(a1 + 32);
    v9 = *(id *)(a1 + 48);
    objc_msgSend(v2, "performCancelableBlock:", &v4);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "addCancelable:", v3, v4, v5, v6, v7);

  }
}

uint64_t __53__EFOperationQueueScheduler_afterDelay_performBlock___block_invoke_2(uint64_t a1)
{
  if ((objc_msgSend(*(id *)(a1 + 32), "isCanceled") & 1) == 0)
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return +[EFPriorityDesignator destroyCurrentDesignator](EFPriorityDesignator, "destroyCurrentDesignator");
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
