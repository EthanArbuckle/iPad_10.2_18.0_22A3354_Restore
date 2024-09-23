@implementation CXVoicemailObserver

- (CXVoicemailObserver)init
{
  CXVoicemailObserverXPCClient *v3;
  void *v4;
  CXVoicemailObserver *v5;

  v3 = objc_alloc_init(CXVoicemailObserverXPCClient);
  -[CXVoicemailObserverXPCClient queue](v3, "queue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CXVoicemailObserver initWithDataSource:queue:](self, "initWithDataSource:queue:", v3, v4);

  return v5;
}

- (CXVoicemailObserver)initWithDataSource:(id)a3 queue:(id)a4
{
  id v7;
  id v8;
  CXVoicemailObserver *v9;
  CXVoicemailObserver *v10;
  NSObject *queue;
  _QWORD block[4];
  CXVoicemailObserver *v14;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CXVoicemailObserver;
  v9 = -[CXVoicemailObserver init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queue, a4);
    objc_storeStrong((id *)&v10->_dataSource, a3);
    queue = v10->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __48__CXVoicemailObserver_initWithDataSource_queue___block_invoke;
    block[3] = &unk_1E4B88AE8;
    v14 = v10;
    dispatch_async(queue, block);

  }
  return v10;
}

uint64_t __48__CXVoicemailObserver_initWithDataSource_queue___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "addDelegate:");
}

- (void)dealloc
{
  CXVoicemailObserverDataSource *v3;
  NSObject *v4;
  CXVoicemailObserverDataSource *v5;
  objc_super v6;
  _QWORD block[4];
  CXVoicemailObserverDataSource *v8;

  v3 = self->_dataSource;
  -[CXVoicemailObserver queue](self, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__CXVoicemailObserver_dealloc__block_invoke;
  block[3] = &unk_1E4B88AE8;
  v8 = v3;
  v5 = v3;
  dispatch_async(v4, block);

  v6.receiver = self;
  v6.super_class = (Class)CXVoicemailObserver;
  -[CXVoicemailObserver dealloc](&v6, sel_dealloc);
}

uint64_t __30__CXVoicemailObserver_dealloc__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (NSArray)voicemails
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
  v10 = __Block_byref_object_copy__2;
  v11 = __Block_byref_object_dispose__2;
  v12 = 0;
  -[CXVoicemailObserver queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __33__CXVoicemailObserver_voicemails__block_invoke;
  v6[3] = &unk_1E4B88C60;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

void __33__CXVoicemailObserver_voicemails__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "dataSource");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "voicemailUUIDToVoicemailMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (void)setDelegate:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[CXVoicemailObserver queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__CXVoicemailObserver_setDelegate_queue___block_invoke;
  block[3] = &unk_1E4B88AC0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __41__CXVoicemailObserver_setDelegate_queue___block_invoke(uint64_t a1)
{
  uint64_t v2;

  objc_msgSend(*(id *)(a1 + 32), "setDelegate:", *(_QWORD *)(a1 + 40));
  if (*(_QWORD *)(a1 + 48))
    v2 = *(_QWORD *)(a1 + 48);
  else
    v2 = MEMORY[0x1E0C80D38];
  return objc_msgSend(*(id *)(a1 + 32), "setDelegateQueue:", v2);
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
  -[CXVoicemailObserver queue](self, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  -[CXVoicemailObserver delegate](self, "delegate");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    -[CXVoicemailObserver delegateQueue](self, "delegateQueue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[CXVoicemailObserver delegateQueue](self, "delegateQueue");
      v8 = objc_claimAutoreleasedReturnValue();
      dispatch_async(v8, block);

    }
  }

}

- (void)dataSourceVoicemailsChanged:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __51__CXVoicemailObserver_dataSourceVoicemailsChanged___block_invoke;
  v3[3] = &unk_1E4B88AE8;
  v3[4] = self;
  -[CXVoicemailObserver _performDelegateCallback:](self, "_performDelegateCallback:", v3);
}

void __51__CXVoicemailObserver_dataSourceVoicemailsChanged___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "voicemailObserverVoicemailsChanged:", *(_QWORD *)(a1 + 32));

}

- (CXVoicemailObserverDelegate)delegate
{
  return (CXVoicemailObserverDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void)setDelegateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_delegateQueue, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (CXVoicemailObserverDataSource)dataSource
{
  return self->_dataSource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
