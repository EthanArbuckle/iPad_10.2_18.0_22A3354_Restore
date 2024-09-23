@implementation NTKSnapshotQueue

- (NTKSnapshotQueue)initWithRequestHandler:(id)a3
{
  id v4;
  NTKSnapshotQueue *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *queue;
  uint64_t v8;
  NSMutableArray *queue_requests;
  void *v10;
  id requestHandler;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NTKSnapshotQueue;
  v5 = -[NTKSnapshotQueue init](&v13, sel_init);
  if (v5)
  {
    v6 = dispatch_queue_create("com.apple.NanoTimeKit.NTKSnapshotQueue", 0);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v6;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = objc_claimAutoreleasedReturnValue();
    queue_requests = v5->_queue_requests;
    v5->_queue_requests = (NSMutableArray *)v8;

    v5->_queue_isProcessingQueue = 0;
    v10 = _Block_copy(v4);
    requestHandler = v5->_requestHandler;
    v5->_requestHandler = v10;

  }
  return v5;
}

- (void)queueRequest:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__NTKSnapshotQueue_queueRequest___block_invoke;
  block[3] = &unk_1E6BCF6D8;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __33__NTKSnapshotQueue_queueRequest___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained[2], "addObject:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v3, "_queue_processQueue");
    WeakRetained = v3;
  }

}

- (id)_queue_pullHighestPriorityRequestFromQueue
{
  NSMutableArray *queue_requests;
  void *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[4];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x2020000000;
  v11[3] = 0;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  if (-[NSMutableArray count](self->_queue_requests, "count"))
  {
    queue_requests = self->_queue_requests;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __62__NTKSnapshotQueue__queue_pullHighestPriorityRequestFromQueue__block_invoke;
    v6[3] = &unk_1E6BD6798;
    v6[4] = v11;
    v6[5] = &v7;
    -[NSMutableArray enumerateObjectsUsingBlock:](queue_requests, "enumerateObjectsUsingBlock:", v6);
    -[NSMutableArray objectAtIndex:](self->_queue_requests, "objectAtIndex:", v8[3]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray removeObjectAtIndex:](self->_queue_requests, "removeObjectAtIndex:", v8[3]);
  }
  else
  {
    v4 = 0;
  }
  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(v11, 8);
  return v4;
}

unint64_t __62__NTKSnapshotQueue__queue_pullHighestPriorityRequestFromQueue__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  unint64_t result;

  result = objc_msgSend(a2, "priority");
  if (result > *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  }
  if (result == 3)
    *a4 = 1;
  return result;
}

- (void)_queue_processQueue
{
  void *v3;
  OS_dispatch_queue *v4;
  uint64_t v5;
  OS_dispatch_queue *v6;
  void *v7;
  OS_dispatch_queue *v8;
  id v9;
  void (**v10)(void);
  _QWORD v11[4];
  OS_dispatch_queue *v12;
  id v13;
  id v14;
  id v15;
  _QWORD aBlock[4];
  OS_dispatch_queue *v17;
  id v18;
  id location;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_queue_isProcessingQueue)
  {
    -[NTKSnapshotQueue _queue_pullHighestPriorityRequestFromQueue](self, "_queue_pullHighestPriorityRequestFromQueue");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      self->_queue_isProcessingQueue = 1;
      v4 = self->_queue;
      objc_initWeak(&location, self);
      v5 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __39__NTKSnapshotQueue__queue_processQueue__block_invoke;
      aBlock[3] = &unk_1E6BCF6D8;
      objc_copyWeak(&v18, &location);
      v6 = v4;
      v17 = v6;
      v7 = _Block_copy(aBlock);
      v11[0] = v5;
      v11[1] = 3221225472;
      v11[2] = __39__NTKSnapshotQueue__queue_processQueue__block_invoke_2;
      v11[3] = &unk_1E6BD39D8;
      objc_copyWeak(&v15, &location);
      v8 = v6;
      v12 = v8;
      v13 = v3;
      v9 = v7;
      v14 = v9;
      v10 = (void (**)(void))_Block_copy(v11);
      v10[2]();

      objc_destroyWeak(&v15);
      objc_destroyWeak(&v18);
      objc_destroyWeak(&location);

    }
  }
}

void __39__NTKSnapshotQueue__queue_processQueue__block_invoke(uint64_t a1)
{
  _BYTE *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
    WeakRetained[24] = 0;
    objc_msgSend(WeakRetained, "_queue_processQueue");
  }

}

void __39__NTKSnapshotQueue__queue_processQueue__block_invoke_2(uint64_t a1)
{
  _QWORD *WeakRetained;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
    v3 = WeakRetained[4];
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __39__NTKSnapshotQueue__queue_processQueue__block_invoke_3;
    v5[3] = &unk_1E6BD00B0;
    v4 = *(_QWORD *)(a1 + 40);
    v6 = *(id *)(a1 + 32);
    v7 = *(id *)(a1 + 48);
    (*(void (**)(uint64_t, uint64_t, _QWORD *))(v3 + 16))(v3, v4, v5);

  }
}

void __39__NTKSnapshotQueue__queue_processQueue__block_invoke_3(uint64_t a1)
{
  NSObject *v1;
  _QWORD block[4];
  id v3;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__NTKSnapshotQueue__queue_processQueue__block_invoke_4;
  block[3] = &unk_1E6BCDF60;
  v1 = *(NSObject **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  dispatch_async(v1, block);

}

uint64_t __39__NTKSnapshotQueue__queue_processQueue__block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_requestHandler, 0);
  objc_storeStrong((id *)&self->_queue_requests, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
