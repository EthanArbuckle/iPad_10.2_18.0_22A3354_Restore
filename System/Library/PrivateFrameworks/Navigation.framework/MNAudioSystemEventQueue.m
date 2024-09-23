@implementation MNAudioSystemEventQueue

- (MNAudioSystemEventQueue)initWithCapacity:(unint64_t)a3
{
  MNAudioSystemEventQueue *syncQueue;
  MNAudioSystemEventQueue *v5;
  MNAudioSystemEventQueue *v6;
  uint64_t v7;
  NSMutableArray *container;
  uint64_t v9;
  NSObject *v10;
  objc_super v12;
  uint8_t buf[16];

  syncQueue = self;
  if (!a3)
  {
    GetAudioLogForMNAudioSystemEventQueueCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B0AD7000, v10, OS_LOG_TYPE_ERROR, "⒬ Trying to create a queue with a capacity of 0", buf, 2u);
    }

    v6 = 0;
    goto LABEL_7;
  }
  v12.receiver = self;
  v12.super_class = (Class)MNAudioSystemEventQueue;
  v5 = -[MNAudioSystemEventQueue init](&v12, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_capacity = a3;
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v5->_capacity);
    container = v6->_container;
    v6->_container = (NSMutableArray *)v7;

    v9 = geo_dispatch_queue_create();
    syncQueue = (MNAudioSystemEventQueue *)v6->_syncQueue;
    v6->_syncQueue = (OS_dispatch_queue *)v9;
LABEL_7:

  }
  return v6;
}

- (unint64_t)capacity
{
  return self->_capacity;
}

- (unint64_t)count
{
  NSObject *syncQueue;
  unint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  syncQueue = self->_syncQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __32__MNAudioSystemEventQueue_count__block_invoke;
  v5[3] = &unk_1E61D22E0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(syncQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __32__MNAudioSystemEventQueue_count__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "count");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)empty
{
  NSObject *syncQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  syncQueue = self->_syncQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __32__MNAudioSystemEventQueue_empty__block_invoke;
  v5[3] = &unk_1E61D22E0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(syncQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __32__MNAudioSystemEventQueue_empty__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "count");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result == 0;
  return result;
}

- (BOOL)full
{
  NSObject *syncQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  syncQueue = self->_syncQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __31__MNAudioSystemEventQueue_full__block_invoke;
  v5[3] = &unk_1E61D22E0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(syncQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __31__MNAudioSystemEventQueue_full__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "count");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result == *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  return result;
}

- (BOOL)enqueue:(id)a3 withOptions:(unint64_t)a4 andReport:(id *)a5
{
  char v6;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  BOOL v20;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  char v25;
  void *v26;
  NSObject *v27;
  NSObject *syncQueue;
  _QWORD v29[5];
  id v30;
  uint8_t buf[4];
  id v32;
  uint64_t v33;

  v6 = a4;
  v33 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (-[MNAudioSystemEventQueue full](self, "full"))
  {
    GetAudioLogForMNAudioSystemEventQueueCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B0AD7000, v9, OS_LOG_TYPE_ERROR, "⒬ Trying to enqueue to a full queue", buf, 2u);
    }

    if (!a5)
      goto LABEL_22;
    v10 = (void *)MEMORY[0x1E0CB35C8];
    NAVAudioErrorDomain();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v10;
    v13 = v11;
    v14 = 2000;
LABEL_21:
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, v14, 0);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

LABEL_22:
    v20 = 0;
    goto LABEL_23;
  }
  if (!v8)
  {
    GetAudioLogForMNAudioSystemEventQueueCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B0AD7000, v16, OS_LOG_TYPE_ERROR, "⒬ Trying to enqueue a nil event", buf, 2u);
    }

    if (!a5)
      goto LABEL_22;
    v17 = (void *)MEMORY[0x1E0CB35C8];
    NAVAudioErrorDomain();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v17;
    v13 = v11;
    v14 = 2001;
    goto LABEL_21;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    GetAudioLogForMNAudioSystemEventQueueCategory();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138477827;
      v32 = v8;
      _os_log_impl(&dword_1B0AD7000, v18, OS_LOG_TYPE_ERROR, "⒬ Trying to enqueue a non-MNAudioSystemEvent object : %{private}@", buf, 0xCu);
    }

    if (!a5)
      goto LABEL_22;
    v19 = (void *)MEMORY[0x1E0CB35C8];
    NAVAudioErrorDomain();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v19;
    v13 = v11;
    v14 = 2002;
    goto LABEL_21;
  }
  if ((v6 & 4) != 0)
  {
    GetAudioLogForMNAudioSystemEventQueueCategory();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138477827;
      v32 = v8;
      _os_log_impl(&dword_1B0AD7000, v22, OS_LOG_TYPE_INFO, "ⓠ Event will clear the queue before enqueuing : %{private}@", buf, 0xCu);
    }

    -[MNAudioSystemEventQueue clear](self, "clear");
  }
  else if ((v6 & 8) != 0)
  {
    GetAudioLogForMNAudioSystemEventQueueCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138477827;
      v32 = v8;
      _os_log_impl(&dword_1B0AD7000, v15, OS_LOG_TYPE_INFO, "ⓠ Event will remove duplicates before enqueuing : %{private}@", buf, 0xCu);
    }

    -[MNAudioSystemEventQueue _removeEventsMatching:](self, "_removeEventsMatching:", v8);
  }
  if ((v6 & 3) != 0)
  {
    GetAudioLogForMNAudioSystemEventQueueCategory();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138477827;
      v32 = v8;
      _os_log_impl(&dword_1B0AD7000, v23, OS_LOG_TYPE_INFO, "ⓠ Event is enqueued as an interrupt : %{private}@", buf, 0xCu);
    }

    -[MNAudioSystemEventQueue delegate](self, "delegate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_opt_respondsToSelector();

    if ((v25 & 1) != 0)
    {
      -[MNAudioSystemEventQueue delegate](self, "delegate");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "audioSystemEventQueue:eventWillInterrupt:", self, v8);

    }
  }
  if ((v6 & 1) != 0)
  {
    GetAudioLogForMNAudioSystemEventQueueCategory();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138477827;
      v32 = v8;
      _os_log_impl(&dword_1B0AD7000, v27, OS_LOG_TYPE_INFO, "ⓠ Enqueued event will be processed next : %{private}@", buf, 0xCu);
    }

    syncQueue = self->_syncQueue;
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __57__MNAudioSystemEventQueue_enqueue_withOptions_andReport___block_invoke;
    v29[3] = &unk_1E61D1D10;
    v29[4] = self;
    v30 = v8;
    dispatch_async(syncQueue, v29);

  }
  else
  {
    -[MNAudioSystemEventQueue _enqueue:](self, "_enqueue:", v8);
  }
  v20 = 1;
LABEL_23:

  return v20;
}

uint64_t __57__MNAudioSystemEventQueue_enqueue_withOptions_andReport___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "insertObject:atIndex:", *(_QWORD *)(a1 + 40), 0);
}

- (void)_removeEventsMatching:(id)a3
{
  id v4;
  NSObject *syncQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  syncQueue = self->_syncQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__MNAudioSystemEventQueue__removeEventsMatching___block_invoke;
  v7[3] = &unk_1E61D1D10;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(syncQueue, v7);

}

void __49__MNAudioSystemEventQueue__removeEventsMatching___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[2] = __49__MNAudioSystemEventQueue__removeEventsMatching___block_invoke_2;
  v8[3] = &unk_1E61D73F8;
  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v8[1] = 3221225472;
  v9 = v2;
  objc_msgSend(v3, "indexesOfObjectsPassingTest:", v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    GetAudioLogForMNAudioSystemEventQueueCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = objc_msgSend(v4, "count");
      v7 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 134218243;
      v11 = v6;
      v12 = 2113;
      v13 = v7;
      _os_log_impl(&dword_1B0AD7000, v5, OS_LOG_TYPE_INFO, "ⓠ Removed %lu events matching event : %{private}@", buf, 0x16u);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeObjectsAtIndexes:", v4);
  }

}

uint64_t __49__MNAudioSystemEventQueue__removeEventsMatching___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "isEqualToEvent:", a2);
}

- (id)dequeue
{
  NSObject *v3;
  uint8_t v5[16];

  if (-[MNAudioSystemEventQueue empty](self, "empty"))
  {
    GetAudioLogForMNAudioSystemEventQueueCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1B0AD7000, v3, OS_LOG_TYPE_ERROR, "⒬ Trying to dequeue from an empty queue", v5, 2u);
    }

    return 0;
  }
  else
  {
    -[MNAudioSystemEventQueue _dequeue](self, "_dequeue");
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (void)clear
{
  NSObject *v3;
  NSObject *syncQueue;
  _QWORD block[5];
  uint8_t buf[16];

  GetAudioLogForMNAudioSystemEventQueueCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B0AD7000, v3, OS_LOG_TYPE_INFO, "ⓠ Clearing the queue", buf, 2u);
  }

  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__MNAudioSystemEventQueue_clear__block_invoke;
  block[3] = &unk_1E61D23C8;
  block[4] = self;
  dispatch_async(syncQueue, block);
}

uint64_t __32__MNAudioSystemEventQueue_clear__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeAllObjects");
}

- (void)_enqueue:(id)a3
{
  id v4;
  NSObject *syncQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  MNAudioSystemEventQueue *v9;

  v4 = a3;
  syncQueue = self->_syncQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __36__MNAudioSystemEventQueue__enqueue___block_invoke;
  v7[3] = &unk_1E61D1D10;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(syncQueue, v7);

}

uint64_t __36__MNAudioSystemEventQueue__enqueue___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  GetAudioLogForMNAudioSystemEventQueueCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138477827;
    v6 = v3;
    _os_log_impl(&dword_1B0AD7000, v2, OS_LOG_TYPE_INFO, "ⓠ Enqueuing event : %{private}@", (uint8_t *)&v5, 0xCu);
  }

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "addObject:", *(_QWORD *)(a1 + 32));
}

- (id)_dequeue
{
  NSObject *syncQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__12;
  v10 = __Block_byref_object_dispose__12;
  v11 = 0;
  syncQueue = self->_syncQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __35__MNAudioSystemEventQueue__dequeue__block_invoke;
  v5[3] = &unk_1E61D1B10;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(syncQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __35__MNAudioSystemEventQueue__dequeue__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "count"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "firstObject");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

    GetAudioLogForMNAudioSystemEventQueueCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      v8 = 138477827;
      v9 = v6;
      _os_log_impl(&dword_1B0AD7000, v5, OS_LOG_TYPE_INFO, "ⓠ Dequeued event : %{private}@", (uint8_t *)&v8, 0xCu);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeObjectAtIndex:", 0);
  }
  else
  {
    GetAudioLogForMNAudioSystemEventQueueCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_1B0AD7000, v7, OS_LOG_TYPE_ERROR, "ⓠ Attempting to dequeue event, but events container is already empty.", (uint8_t *)&v8, 2u);
    }

  }
}

- (MNAudioEventQueueDelegate)delegate
{
  return (MNAudioEventQueueDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_syncQueue, 0);
  objc_storeStrong((id *)&self->_container, 0);
}

@end
