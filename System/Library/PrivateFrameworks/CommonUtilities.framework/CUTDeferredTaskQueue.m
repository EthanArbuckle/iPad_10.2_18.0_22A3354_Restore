@implementation CUTDeferredTaskQueue

- (CUTDeferredTaskQueue)initWithCapacity:(int64_t)a3 queue:(id)a4 block:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  CUTDeferredTaskQueue *v12;

  v8 = a4;
  v9 = a5;
  if (a3 < 0)
    sub_1A0BD1DBC();
  v10 = v9;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[CUTDeferredTaskQueue initWithNumberCapacity:queue:block:](self, "initWithNumberCapacity:queue:block:", v11, v8, v10);

  return v12;
}

- (CUTDeferredTaskQueue)initWithNumberCapacity:(id)a3 queue:(id)a4 block:(id)a5
{
  id v9;
  id v10;
  id v11;
  CUTDeferredTaskQueue *v12;
  CUTDeferredTaskQueue *v13;
  uint64_t v14;
  id originalBlock;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)CUTDeferredTaskQueue;
  v12 = -[CUTDeferredTaskQueue init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v12->_capacity, a3);
    objc_storeStrong((id *)&v13->_queue, a4);
    v14 = MEMORY[0x1A1B015EC](v11);
    originalBlock = v13->_originalBlock;
    v13->_originalBlock = (id)v14;

  }
  return v13;
}

- (CUTDeferredTaskQueue)initWithQueue:(id)a3 block:(id)a4
{
  return -[CUTDeferredTaskQueue initWithNumberCapacity:queue:block:](self, "initWithNumberCapacity:queue:block:", 0, a3, a4);
}

- (void)enqueueExecutionWithTarget:(id)a3 afterDelay:(double)a4
{
  id v6;
  id v7;
  dispatch_block_t v8;
  os_unfair_lock_s *p_lock;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSMutableArray *pendingDispatchBlocks;
  void *v22;
  NSMutableArray *v23;
  NSMutableArray *v24;
  void *v25;
  void *v26;
  dispatch_time_t v27;
  NSObject *v28;
  _QWORD block[5];
  id v30;
  uint64_t *v31;
  uint64_t v32;
  id *v33;
  uint64_t v34;
  void (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;

  v6 = a3;
  v32 = 0;
  v33 = (id *)&v32;
  v34 = 0x3042000000;
  v35 = sub_1A0BC594C;
  v36 = sub_1A0BC5958;
  v37 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1A0BC5960;
  block[3] = &unk_1E4490080;
  block[4] = self;
  v31 = &v32;
  v7 = v6;
  v30 = v7;
  v8 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  objc_storeWeak(v33 + 5, v8);
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  while (1)
  {
    -[CUTDeferredTaskQueue capacity](self, "capacity");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
      break;
    -[CUTDeferredTaskQueue pendingDispatchBlocks](self, "pendingDispatchBlocks");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");
    -[CUTDeferredTaskQueue capacity](self, "capacity");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "integerValue");

    if (v12 < v14)
      break;
    v15 = (void *)MEMORY[0x1A1B01454]();
    -[CUTDeferredTaskQueue pendingDispatchBlocks](self, "pendingDispatchBlocks");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectAtIndex:", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    -[CUTDeferredTaskQueue pendingDispatchBlocks](self, "pendingDispatchBlocks");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "removeObjectAtIndex:", 0);

    dispatch_block_cancel(v17);
    -[CUTDeferredTaskQueue pendingDispatchBlocks](self, "pendingDispatchBlocks");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "count");

    if (!v20)
    {
      pendingDispatchBlocks = self->_pendingDispatchBlocks;
      self->_pendingDispatchBlocks = 0;

    }
    objc_autoreleasePoolPop(v15);
  }
  -[CUTDeferredTaskQueue pendingDispatchBlocks](self, "pendingDispatchBlocks");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v22)
  {
    v23 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v24 = self->_pendingDispatchBlocks;
    self->_pendingDispatchBlocks = v23;

  }
  -[CUTDeferredTaskQueue pendingDispatchBlocks](self, "pendingDispatchBlocks");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)MEMORY[0x1A1B015EC](v8);
  objc_msgSend(v25, "addObject:", v26);

  v27 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
  -[CUTDeferredTaskQueue queue](self, "queue");
  v28 = objc_claimAutoreleasedReturnValue();
  dispatch_after(v27, v28, v8);

  os_unfair_lock_unlock(p_lock);
  _Block_object_dispose(&v32, 8);
  objc_destroyWeak(&v37);

}

- (void)cancelPendingExecutions
{
  os_unfair_lock_s *p_lock;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSMutableArray *pendingDispatchBlocks;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[CUTDeferredTaskQueue pendingDispatchBlocks](self, "pendingDispatchBlocks", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        dispatch_block_cancel(*(dispatch_block_t *)(*((_QWORD *)&v11 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  -[CUTDeferredTaskQueue pendingDispatchBlocks](self, "pendingDispatchBlocks");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeAllObjects");

  pendingDispatchBlocks = self->_pendingDispatchBlocks;
  self->_pendingDispatchBlocks = 0;

  os_unfair_lock_unlock(p_lock);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (id)originalBlock
{
  return self->_originalBlock;
}

- (NSMutableArray)pendingDispatchBlocks
{
  return self->_pendingDispatchBlocks;
}

- (NSNumber)capacity
{
  return self->_capacity;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_capacity, 0);
  objc_storeStrong((id *)&self->_pendingDispatchBlocks, 0);
  objc_storeStrong(&self->_originalBlock, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
