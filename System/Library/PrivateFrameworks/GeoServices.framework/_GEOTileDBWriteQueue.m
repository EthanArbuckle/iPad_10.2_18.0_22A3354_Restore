@implementation _GEOTileDBWriteQueue

- (void)_flushPendingOperations
{
  NSObject *queue;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  id WeakRetained;
  id v8;
  _QWORD v9[7];
  _QWORD block[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  __int128 buf;
  uint64_t v18;
  char v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__5;
  v15 = __Block_byref_object_dispose__5;
  v16 = 0;
  queue = self->_queue;
  v4 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47___GEOTileDBWriteQueue__flushPendingOperations__block_invoke;
  block[3] = &unk_1E1C00760;
  block[4] = self;
  block[5] = &v11;
  dispatch_sync(queue, block);
  if (objc_msgSend((id)v12[5], "count"))
  {
    GEOGetTileDBLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v6 = objc_msgSend((id)v12[5], "count");
      LODWORD(buf) = 134217984;
      *(_QWORD *)((char *)&buf + 4) = v6;
      _os_log_impl(&dword_1885A9000, v5, OS_LOG_TYPE_DEBUG, "Flushing %llu pending writes to disk", (uint8_t *)&buf, 0xCu);
    }

    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v18 = 0x2020000000;
    v19 = 0;
    WeakRetained = objc_loadWeakRetained((id *)&self->_db);
    v9[0] = v4;
    v9[1] = 3221225472;
    v9[2] = __47___GEOTileDBWriteQueue__flushPendingOperations__block_invoke_278;
    v9[3] = &unk_1E1C00788;
    v9[4] = self;
    v9[5] = &v11;
    v9[6] = &buf;
    objc_msgSend(WeakRetained, "_performInTransaction:", v9);

    if (*(_BYTE *)(*((_QWORD *)&buf + 1) + 24))
    {
      v8 = objc_loadWeakRetained((id *)&self->_db);
      objc_msgSend(v8, "_evictIfNecessary");

    }
    _Block_object_dispose(&buf, 8);
  }
  _Block_object_dispose(&v11, 8);

}

- (id)dataForKey:(uint64_t)a3 ETag:(_QWORD *)a4 originalLoadReason:(uint64_t)a5 isKnownNotToExist:(_BYTE *)a6
{
  NSObject *v11;
  id v12;
  _QWORD v14[10];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  dispatch_assert_queue_not_V2(*(dispatch_queue_t *)(a1 + 40));
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__5;
  v29 = __Block_byref_object_dispose__5;
  v30 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__5;
  v23 = __Block_byref_object_dispose__5;
  v24 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v11 = *(NSObject **)(a1 + 40);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __77___GEOTileDBWriteQueue_dataForKey_ETag_originalLoadReason_isKnownNotToExist___block_invoke;
  v14[3] = &unk_1E1C007D8;
  v14[4] = a1;
  v14[5] = &v25;
  v14[8] = a3;
  v14[9] = a5;
  v14[6] = &v19;
  v14[7] = &v15;
  dispatch_sync(v11, v14);
  if (a4)
    *a4 = objc_retainAutorelease((id)v20[5]);
  if (a6)
    *a6 = *((_BYTE *)v16 + 24);
  v12 = (id)v26[5];
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);
  return v12;
}

- (void)addOperation:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __37___GEOTileDBWriteQueue_addOperation___block_invoke;
  v7[3] = &unk_1E1C00738;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)_prunePendingOperationsSupercededByOperationOnIsolationQueue:(id)a3
{
  id v4;
  NSMutableArray *pendingOperations;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, void *, uint64_t);
  void *v10;
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__5;
  v17 = __Block_byref_object_dispose__5;
  v18 = 0;
  pendingOperations = self->_pendingOperations;
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __85___GEOTileDBWriteQueue__prunePendingOperationsSupercededByOperationOnIsolationQueue___block_invoke;
  v10 = &unk_1E1C007B0;
  v6 = v4;
  v11 = v6;
  v12 = &v13;
  -[NSMutableArray enumerateObjectsUsingBlock:](pendingOperations, "enumerateObjectsUsingBlock:", &v7);
  if (objc_msgSend((id)v14[5], "count", v7, v8, v9, v10))
    -[NSMutableArray removeObjectsAtIndexes:](self->_pendingOperations, "removeObjectsAtIndexes:", v14[5]);

  _Block_object_dispose(&v13, 8);
}

- (void)flushPendingOperations:(BOOL)a3
{
  id WeakRetained;
  _QWORD v5[5];

  if (a3)
  {
    -[_GEOTileDBWriteQueue _flushPendingOperations](self, "_flushPendingOperations");
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_db);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __47___GEOTileDBWriteQueue_flushPendingOperations___block_invoke;
    v5[3] = &unk_1E1BFF6F8;
    v5[4] = self;
    objc_msgSend(WeakRetained, "_performOnDBQueue:", v5);

  }
}

- (_GEOTileDBWriteQueue)init
{
  _GEOTileDBWriteQueue *result;

  result = (_GEOTileDBWriteQueue *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (_GEOTileDBWriteQueue)initWithDB:(id)a3 maxOperations:(unint64_t)a4 maxOperationsSizeInBytes:(unint64_t)a5
{
  id v8;
  _GEOTileDBWriteQueue *v9;
  _GEOTileDBWriteQueue *v10;
  uint64_t v11;
  OS_dispatch_queue *queue;
  _GEOTileDBWriteQueue *v13;
  objc_super v15;

  v8 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_GEOTileDBWriteQueue;
  v9 = -[_GEOTileDBWriteQueue init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_maxOperations = a4;
    v9->_maxOperationsSizeInBytes = a5;
    objc_storeWeak((id *)&v9->_db, v8);
    geo_dispatch_queue_create_with_qos();
    v11 = objc_claimAutoreleasedReturnValue();
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v11;

    v13 = v10;
  }

  return v10;
}

- (void)dropAllPendingOperations
{
  NSObject *queue;
  _QWORD block[5];

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48___GEOTileDBWriteQueue_dropAllPendingOperations__block_invoke;
  block[3] = &unk_1E1BFF6F8;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)prunePendingOperationsSupercededByOperation:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __68___GEOTileDBWriteQueue_prunePendingOperationsSupercededByOperation___block_invoke;
  v7[3] = &unk_1E1C00738;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_db);
  objc_storeStrong((id *)&self->_pendingOperations, 0);
}

@end
