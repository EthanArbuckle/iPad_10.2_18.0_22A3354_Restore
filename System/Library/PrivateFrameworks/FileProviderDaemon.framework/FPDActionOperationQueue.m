@implementation FPDActionOperationQueue

- (FPDActionOperationQueue)initWithMoveInfo:(id)a3
{
  id v4;
  FPDActionOperationQueue *v5;
  NSObject *v6;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *queue;
  uint64_t v10;
  NSMutableArray *fifo;
  intptr_t maxLength;
  dispatch_semaphore_t v13;
  OS_dispatch_semaphore *enqueueSema;
  dispatch_semaphore_t v15;
  OS_dispatch_semaphore *dequeueSema;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)FPDActionOperationQueue;
  v5 = -[FPDActionOperationQueue init](&v18, sel_init);
  if (v5)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v6, (dispatch_qos_class_t)objc_msgSend(v4, "qos"), 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("FileProvider.move-queue", v7);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v8;

    v10 = objc_opt_new();
    fifo = v5->_fifo;
    v5->_fifo = (NSMutableArray *)v10;

    v5->_maxLength = 128;
    if (objc_msgSend(v4, "_t_moveQueueWidth"))
    {
      maxLength = objc_msgSend(v4, "_t_moveQueueWidth");
      v5->_maxLength = maxLength;
    }
    else
    {
      maxLength = v5->_maxLength;
    }
    v13 = dispatch_semaphore_create(maxLength);
    enqueueSema = v5->_enqueueSema;
    v5->_enqueueSema = (OS_dispatch_semaphore *)v13;

    v15 = dispatch_semaphore_create(0);
    dequeueSema = v5->_dequeueSema;
    v5->_dequeueSema = (OS_dispatch_semaphore *)v15;

  }
  return v5;
}

- (void)enqueue:(id)a3
{
  id v4;
  NSObject *queue;
  uint64_t v6;
  NSObject *v7;
  _QWORD v8[5];
  id v9;
  _QWORD block[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  queue = self->_queue;
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__FPDActionOperationQueue_enqueue___block_invoke;
  block[3] = &unk_1E8C769C8;
  block[4] = self;
  block[5] = &v11;
  dispatch_sync(queue, block);
  if (!*((_BYTE *)v12 + 24))
  {
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_enqueueSema, 0xFFFFFFFFFFFFFFFFLL);
    v7 = self->_queue;
    v8[0] = v6;
    v8[1] = 3221225472;
    v8[2] = __35__FPDActionOperationQueue_enqueue___block_invoke_2;
    v8[3] = &unk_1E8C75850;
    v8[4] = self;
    v9 = v4;
    dispatch_sync(v7, v8);

  }
  _Block_object_dispose(&v11, 8);

}

uint64_t __35__FPDActionOperationQueue_enqueue___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 49);
  return result;
}

void __35__FPDActionOperationQueue_enqueue___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v1 = a1 + 40;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "addObject:", *(_QWORD *)(a1 + 40));
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(v1 - 8) + 40));
  fp_current_or_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __35__FPDActionOperationQueue_enqueue___block_invoke_2_cold_1(v1, v2, v3, v4, v5, v6, v7, v8);

}

- (id)dequeue
{
  NSObject *queue;
  uint64_t v4;
  id v5;
  NSObject *v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  _QWORD block[6];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  queue = self->_queue;
  v4 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__FPDActionOperationQueue_dequeue__block_invoke;
  block[3] = &unk_1E8C769C8;
  block[4] = self;
  block[5] = &v16;
  dispatch_sync(queue, block);
  v5 = 0;
  if (!*((_BYTE *)v17 + 24))
  {
    v9 = 0;
    v10 = &v9;
    v11 = 0x3032000000;
    v12 = __Block_byref_object_copy__6;
    v13 = __Block_byref_object_dispose__6;
    v14 = 0;
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_dequeueSema, 0xFFFFFFFFFFFFFFFFLL);
    v6 = self->_queue;
    v8[0] = v4;
    v8[1] = 3221225472;
    v8[2] = __34__FPDActionOperationQueue_dequeue__block_invoke_2;
    v8[3] = &unk_1E8C768B0;
    v8[4] = self;
    v8[5] = &v9;
    dispatch_sync(v6, v8);
    v5 = (id)v10[5];
    _Block_object_dispose(&v9, 8);

  }
  _Block_object_dispose(&v16, 8);
  return v5;
}

uint64_t __34__FPDActionOperationQueue_dequeue__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 49);
  return result;
}

void __34__FPDActionOperationQueue_dequeue__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 48))
  {
    if (!objc_msgSend(*(id *)(v2 + 24), "count"))
    {
      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v15 = *(void **)(v14 + 40);
      *(_QWORD *)(v14 + 40) = 0;

      return;
    }
    v2 = *(_QWORD *)(a1 + 32);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v2 + 32));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectAtIndexedSubscript:", 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = a1 + 40;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObjectAtIndex:", 0);
  fp_current_or_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __34__FPDActionOperationQueue_dequeue__block_invoke_2_cold_1(v4, v7, v8, v9, v10, v11, v12, v13);

}

- (void)finishedEnqueuing
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__FPDActionOperationQueue_finishedEnqueuing__block_invoke;
  block[3] = &unk_1E8C75E48;
  block[4] = self;
  dispatch_sync(queue, block);
}

intptr_t __44__FPDActionOperationQueue_finishedEnqueuing__block_invoke(intptr_t result)
{
  uint64_t v1;
  intptr_t v2;

  *(_BYTE *)(*(_QWORD *)(result + 32) + 48) = 1;
  v1 = *(_QWORD *)(*(_QWORD *)(result + 32) + 16);
  if (v1)
  {
    v2 = result;
    do
    {
      result = dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(v2 + 32) + 40));
      --v1;
    }
    while (v1);
  }
  return result;
}

- (void)cancel
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__FPDActionOperationQueue_cancel__block_invoke;
  block[3] = &unk_1E8C75E48;
  block[4] = self;
  dispatch_sync(queue, block);
}

intptr_t __33__FPDActionOperationQueue_cancel__block_invoke(intptr_t result)
{
  uint64_t v1;
  intptr_t v2;
  unint64_t v3;
  unint64_t v4;

  v1 = *(_QWORD *)(result + 32);
  if (!*(_BYTE *)(v1 + 49))
  {
    v2 = result;
    if (*(_QWORD *)(v1 + 16))
    {
      v3 = 0;
      do
      {
        result = dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v1 + 32));
        ++v3;
        v1 = *(_QWORD *)(v2 + 32);
        v4 = *(_QWORD *)(v1 + 16);
      }
      while (v3 < v4);
      if (v4)
      {
        do
        {
          result = dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(v2 + 32) + 40));
          --v4;
        }
        while (v4);
        v1 = *(_QWORD *)(v2 + 32);
      }
    }
    *(_BYTE *)(v1 + 48) = 1;
    *(_BYTE *)(*(_QWORD *)(v2 + 32) + 49) = 1;
  }
  return result;
}

- (void)dumpStateTo:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  objc_msgSend(v4, "write:", CFSTR("+ queue\n"));
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__FPDActionOperationQueue_dumpStateTo___block_invoke;
  block[3] = &unk_1E8C75850;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

uint64_t __39__FPDActionOperationQueue_dumpStateTo___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 48))
  {
    objc_msgSend(*(id *)(a1 + 40), "startAttributes:", 2);
    objc_msgSend(*(id *)(a1 + 40), "write:", CFSTR("  done\n"));
    objc_msgSend(*(id *)(a1 + 40), "reset");
    v2 = *(_QWORD *)(a1 + 32);
  }
  if (*(_BYTE *)(v2 + 49))
    objc_msgSend(*(id *)(a1 + 40), "write:", CFSTR("  cancelled\n"));
  objc_msgSend(*(id *)(a1 + 40), "write:", CFSTR("  FIFO:\n"));
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = *(id *)(*(_QWORD *)(a1 + 32) + 24);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(a1 + 40), "write:", CFSTR("   %@\n"), *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  return objc_msgSend(*(id *)(a1 + 40), "write:", CFSTR("\n"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dequeueSema, 0);
  objc_storeStrong((id *)&self->_enqueueSema, 0);
  objc_storeStrong((id *)&self->_fifo, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __35__FPDActionOperationQueue_enqueue___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1CF55F000, a2, a3, "[DEBUG] queue: enqueued %@", a5, a6, a7, a8, 2u);
}

void __34__FPDActionOperationQueue_dequeue__block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1CF55F000, a2, a3, "[DEBUG] queue: dequeued %@", a5, a6, a7, a8, 2u);
}

@end
