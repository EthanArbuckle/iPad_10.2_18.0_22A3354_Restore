@implementation IMDispatchQueue

- (void)dealloc
{
  objc_super v3;

  objc_msgSend_setSuspended_(self, a2, 0);
  v3.receiver = self;
  v3.super_class = (Class)IMDispatchQueue;
  -[IMDispatchQueue dealloc](&v3, sel_dealloc);
}

- (IMDispatchQueue)init
{
  return (IMDispatchQueue *)objc_msgSend__initWithDispatchAttr_dispatchPriority_(self, a2, 0, -32768);
}

+ (id)serialQueueWithDispatchPriority:(int64_t)a3
{
  IMDispatchQueue *v4;
  const char *v5;

  v4 = [IMDispatchQueue alloc];
  return (id)objc_msgSend__initWithDispatchAttr_dispatchPriority_(v4, v5, 0, a3);
}

+ (id)concurrentQueueWithDispatchPriority:(int64_t)a3
{
  IMDispatchQueue *v4;
  const char *v5;

  v4 = [IMDispatchQueue alloc];
  return (id)objc_msgSend__initWithDispatchAttr_dispatchPriority_(v4, v5, MEMORY[0x24BDAC9C0], a3);
}

- (id)_initWithDispatchAttr:(id)a3 dispatchPriority:(int64_t)a4
{
  NSObject *v6;
  IMDispatchQueue *v7;
  CFBinaryHeapRef v8;
  const char *v9;
  NSObject *v10;
  NSObject *v11;
  const char *v12;
  dispatch_queue_t v13;
  const char *v14;
  id v15;
  const char *v16;
  CFBinaryHeapCallBacks callBacks;
  objc_super v19;

  v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)IMDispatchQueue;
  v7 = -[IMDispatchQueue init](&v19, sel_init);
  if (v7)
  {
    callBacks.version = 0;
    *(_OWORD *)&callBacks.retain = *(_OWORD *)(MEMORY[0x24BDBD6B0] + 8);
    callBacks.copyDescription = *(CFStringRef (__cdecl **)(const void *))(MEMORY[0x24BDBD6B0] + 24);
    callBacks.compare = (CFComparisonResult (__cdecl *)(const void *, const void *, void *))_IMDispatchQueueBlockCompare;
    v8 = CFBinaryHeapCreate(0, 0, &callBacks, 0);
    objc_msgSend_setHeap_(v7, v9, (uint64_t)v8);
    CFRelease(v8);
    v10 = dispatch_queue_create(0, v6);
    dispatch_get_global_queue(a4, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    dispatch_set_target_queue(v10, v11);

    objc_msgSend_setDispatchQueue_(v7, v12, (uint64_t)v10);
    v13 = dispatch_queue_create(0, 0);
    objc_msgSend_setLockQueue_(v7, v14, (uint64_t)v13);
    v15 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend_setDispatchQueueBlocks_(v7, v16, (uint64_t)v15);

  }
  return v7;
}

- (void)addBlock:(id)a3
{
  objc_msgSend_addBlock_withQueuePriority_forKey_(self, a2, (uint64_t)a3, 0, 0);
}

- (void)addBlock:(id)a3 withQueuePriority:(int64_t)a4
{
  objc_msgSend_addBlock_withQueuePriority_forKey_(self, a2, (uint64_t)a3, a4, 0);
}

- (void)addBlock:(id)a3 withQueuePriority:(int64_t)a4 forKey:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  NSObject *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  void *v23;
  uint64_t v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  NSObject *v31;
  _QWORD v32[4];
  NSObject *v33;
  id v34;
  id v35;
  _QWORD block[4];
  id v37;
  IMDispatchQueue *v38;
  id v39;
  id v40;
  id v41;
  int64_t v42;

  v8 = a3;
  v9 = a5;
  objc_msgSend_dispatchQueue(self, v10, v11);
  v12 = objc_claimAutoreleasedReturnValue();
  objc_msgSend_lockQueue(self, v13, v14);
  v15 = objc_claimAutoreleasedReturnValue();
  objc_msgSend_heap(self, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dispatchQueueBlocks(self, v19, v20);
  v21 = objc_claimAutoreleasedReturnValue();
  v23 = (void *)v21;
  if (!v18 || !v21)
    objc_msgSend_raise_format_(MEMORY[0x24BDBCE88], v22, *MEMORY[0x24BDBCAB0], CFSTR("Tried to add block for key %@ to a cancelled IMDispatchQueue."), v9);
  if (a4 == 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend_raise_format_(MEMORY[0x24BDBCE88], v22, *MEMORY[0x24BDBCAB8], CFSTR("Tried to add block for key %@ to IMDispatchQueue with priority NSNotFound, which is reserved."), v9);
  v24 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_20D655B90;
  block[3] = &unk_24C751108;
  v41 = v8;
  v42 = a4;
  v37 = v9;
  v38 = self;
  v25 = v23;
  v39 = v25;
  v26 = v18;
  v40 = v26;
  v27 = v9;
  v28 = v8;
  dispatch_async(v15, block);
  v32[0] = v24;
  v32[1] = 3221225472;
  v32[2] = sub_20D655C50;
  v32[3] = &unk_24C751158;
  v33 = v15;
  v34 = v26;
  v35 = v25;
  v29 = v25;
  v30 = v26;
  v31 = v15;
  dispatch_async(v12, v32);

}

- (void)setQueuePriority:(int64_t)a3 ofOutstandingBlockForKey:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  const char *v15;
  const char *v16;
  _QWORD block[4];
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v6 = a4;
  objc_msgSend_lockQueue(self, v7, v8);
  v9 = objc_claimAutoreleasedReturnValue();
  objc_msgSend_dispatchQueueBlocks(self, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = sub_20D655D48;
  v25 = sub_20D655D70;
  v26 = 0;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_20D655F54;
  block[3] = &unk_24C751130;
  v13 = v12;
  v18 = v13;
  v14 = v6;
  v19 = v14;
  v20 = &v21;
  dispatch_sync(v9, block);
  objc_msgSend_removeOutstandingBlockForKey_(self, v15, (uint64_t)v14);
  objc_msgSend_addBlock_withQueuePriority_forKey_(self, v16, v22[5], a3, v14);

  _Block_object_dispose(&v21, 8);
}

- (int64_t)queuePriorityOfOutstandingBlockForKey:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  int64_t v13;
  _QWORD block[4];
  id v16;
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  v4 = a3;
  objc_msgSend_lockQueue(self, v5, v6);
  v7 = objc_claimAutoreleasedReturnValue();
  objc_msgSend_dispatchQueueBlocks(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0x7FFFFFFFFFFFFFFFLL;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_20D6560AC;
  block[3] = &unk_24C751130;
  v16 = v10;
  v17 = v4;
  v18 = &v19;
  v11 = v4;
  v12 = v10;
  dispatch_sync(v7, block);
  v13 = v20[3];

  _Block_object_dispose(&v19, 8);
  return v13;
}

- (id)allKeysOfOutstandingBlocks
{
  uint64_t v2;
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  objc_msgSend_lockQueue(self, a2, v2);
  v4 = objc_claimAutoreleasedReturnValue();
  objc_msgSend_dispatchQueueBlocks(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = sub_20D6561E8;
  v18 = sub_20D6561F8;
  v19 = 0;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = sub_20D656200;
  v11[3] = &unk_24C751180;
  v12 = v7;
  v13 = &v14;
  v8 = v7;
  dispatch_sync(v4, v11);
  v9 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v9;
}

- (BOOL)containsOutstandingBlockForKey:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  char v13;
  _QWORD block[4];
  id v16;
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  v4 = a3;
  objc_msgSend_lockQueue(self, v5, v6);
  v7 = objc_claimAutoreleasedReturnValue();
  objc_msgSend_dispatchQueueBlocks(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_20D656340;
  block[3] = &unk_24C751130;
  v16 = v10;
  v17 = v4;
  v18 = &v19;
  v11 = v4;
  v12 = v10;
  dispatch_sync(v7, block);
  v13 = *((_BYTE *)v20 + 24);

  _Block_object_dispose(&v19, 8);
  return v13;
}

- (void)removeOutstandingBlockForKey:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v4 = a3;
  objc_msgSend_lockQueue(self, v5, v6);
  v7 = objc_claimAutoreleasedReturnValue();
  objc_msgSend_dispatchQueueBlocks(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = sub_20D65643C;
  v13[3] = &unk_24C7511A8;
  v14 = v10;
  v15 = v4;
  v11 = v4;
  v12 = v10;
  dispatch_async(v7, v13);

}

- (void)removeAllOutstandingBlocks
{
  uint64_t v2;
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  objc_msgSend_lockQueue(self, a2, v2);
  v4 = objc_claimAutoreleasedReturnValue();
  objc_msgSend_dispatchQueueBlocks(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_heap(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = sub_20D656544;
  v13[3] = &unk_24C7511A8;
  v14 = v10;
  v15 = v7;
  v11 = v7;
  v12 = v10;
  dispatch_async(v4, v13);

}

- (void)setSuspended:(BOOL)a3
{
  NSObject *dispatchQueue;

  if (self->_suspended != a3)
  {
    self->_suspended = a3;
    dispatchQueue = self->_dispatchQueue;
    if (a3)
      dispatch_suspend(dispatchQueue);
    else
      dispatch_resume(dispatchQueue);
  }
}

- (BOOL)isSuspended
{
  return self->_suspended;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (OS_dispatch_queue)lockQueue
{
  return self->_lockQueue;
}

- (void)setLockQueue:(id)a3
{
  objc_storeStrong((id *)&self->_lockQueue, a3);
}

- (__CFBinaryHeap)heap
{
  return self->_heap;
}

- (void)setHeap:(__CFBinaryHeap *)a3
{
  objc_storeStrong((id *)&self->_heap, a3);
}

- (NSMutableDictionary)dispatchQueueBlocks
{
  return self->_dispatchQueueBlocks;
}

- (void)setDispatchQueueBlocks:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueueBlocks, a3);
}

- (BOOL)isCancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueueBlocks, 0);
  objc_storeStrong((id *)&self->_heap, 0);
  objc_storeStrong((id *)&self->_lockQueue, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end
