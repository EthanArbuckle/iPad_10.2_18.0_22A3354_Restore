@implementation CXCallObserver

uint64_t __53__CXCallObserver_initWithDataSource_concurrentQueue___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "addDelegate:");
}

- (void)setDelegate:(id)delegate queue:(dispatch_queue_t)queue
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  _QWORD block[5];
  id v12;
  NSObject *v13;

  v6 = delegate;
  v7 = queue;
  -[CXCallObserver concurrentQueue](self, "concurrentQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__CXCallObserver_setDelegate_queue___block_invoke;
  block[3] = &unk_1E4B88AC0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_barrier_async(v8, block);

}

- (CXCallObserver)init
{
  CXCallObserverXPCClient *v3;
  void *v4;
  CXCallObserver *v5;

  v3 = objc_alloc_init(CXCallObserverXPCClient);
  -[CXCallObserverXPCClient concurrentQueue](v3, "concurrentQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CXCallObserver initWithDataSource:concurrentQueue:](self, "initWithDataSource:concurrentQueue:", v3, v4);

  return v5;
}

- (CXCallObserver)initWithDataSource:(id)a3 concurrentQueue:(id)a4
{
  id v7;
  id v8;
  CXCallObserver *v9;
  CXCallObserver *v10;
  NSObject *concurrentQueue;
  _QWORD block[4];
  CXCallObserver *v14;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CXCallObserver;
  v9 = -[CXCallObserver init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_concurrentQueue, a4);
    objc_storeStrong((id *)&v10->_dataSource, a3);
    concurrentQueue = v10->_concurrentQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __53__CXCallObserver_initWithDataSource_concurrentQueue___block_invoke;
    block[3] = &unk_1E4B88AE8;
    v14 = v10;
    dispatch_barrier_async(concurrentQueue, block);

  }
  return v10;
}

void __23__CXCallObserver_calls__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "dataSource");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "callUUIDToCallMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (CXCallObserverDataSource)dataSource
{
  return self->_dataSource;
}

- (NSArray)calls
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__5;
  v11 = __Block_byref_object_dispose__5;
  v12 = 0;
  -[CXCallObserver concurrentQueue](self, "concurrentQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __23__CXCallObserver_calls__block_invoke;
  v6[3] = &unk_1E4B88C60;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

- (OS_dispatch_queue)concurrentQueue
{
  return self->_concurrentQueue;
}

- (void)setDelegateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_delegateQueue, a3);
}

uint64_t __36__CXCallObserver_setDelegate_queue___block_invoke(uint64_t a1)
{
  uint64_t v2;

  objc_msgSend(*(id *)(a1 + 32), "setDelegate:", *(_QWORD *)(a1 + 40));
  if (*(_QWORD *)(a1 + 48))
    v2 = *(_QWORD *)(a1 + 48);
  else
    v2 = MEMORY[0x1E0C80D38];
  return objc_msgSend(*(id *)(a1 + 32), "setDelegateQueue:", v2);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)dealloc
{
  CXCallObserverDataSource *v3;
  NSObject *v4;
  CXCallObserverDataSource *v5;
  objc_super v6;
  _QWORD block[4];
  CXCallObserverDataSource *v8;

  v3 = self->_dataSource;
  -[CXCallObserver concurrentQueue](self, "concurrentQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __25__CXCallObserver_dealloc__block_invoke;
  block[3] = &unk_1E4B88AE8;
  v8 = v3;
  v5 = v3;
  dispatch_barrier_async(v4, block);

  v6.receiver = self;
  v6.super_class = (Class)CXCallObserver;
  -[CXCallObserver dealloc](&v6, sel_dealloc);
}

uint64_t __25__CXCallObserver_dealloc__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (void)_performDelegateCallback:(id)a3
{
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  dispatch_block_t block;

  block = a3;
  -[CXCallObserver concurrentQueue](self, "concurrentQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  -[CXCallObserver delegate](self, "delegate");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    -[CXCallObserver delegateQueue](self, "delegateQueue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[CXCallObserver delegateQueue](self, "delegateQueue");
      v8 = objc_claimAutoreleasedReturnValue();
      dispatch_async(v8, block);

    }
  }

}

- (void)dataSource:(id)a3 callChanged:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __41__CXCallObserver_dataSource_callChanged___block_invoke;
  v7[3] = &unk_1E4B88A20;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  -[CXCallObserver _performDelegateCallback:](self, "_performDelegateCallback:", v7);

}

void __41__CXCallObserver_dataSource_callChanged___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "callObserver:callChanged:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (CXCallObserverDelegate)delegate
{
  return (CXCallObserverDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_concurrentQueue, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
