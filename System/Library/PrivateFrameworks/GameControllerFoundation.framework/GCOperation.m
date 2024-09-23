@implementation GCOperation

+ (id)allocWithZone:(_NSZone *)a3
{
  const void *v3;
  objc_super v7;

  if (__creatorFrameKey(void)::onceToken != -1)
    dispatch_once(&__creatorFrameKey(void)::onceToken, &__block_literal_global_288);
  pthread_setspecific(__creatorFrameKey(void)::key, v3);
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___GCOperation;
  return objc_msgSendSuper2(&v7, sel_allocWithZone_, a3);
}

+ (id)alloc
{
  const void *v2;
  objc_super v5;

  if (__creatorFrameKey(void)::onceToken != -1)
    dispatch_once(&__creatorFrameKey(void)::onceToken, &__block_literal_global_288);
  pthread_setspecific(__creatorFrameKey(void)::key, v2);
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___GCOperation;
  return objc_msgSendSuper2(&v5, sel_allocWithZone_, 0);
}

- (GCOperation)initWithResult:(id)a3
{
  id v6;
  char *v7;
  void *v9;
  objc_super v10;

  v6 = a3;
  if (!v6)
  {
    unk_1F03A9A20(&off_1F03A9B88, "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCFuture.mm"), 1408, CFSTR("Invalid parameter not satisfying: %s"), "result != nil");

  }
  v10.receiver = self;
  v10.super_class = (Class)GCFuture;
  v7 = -[GCFuture init](&v10, sel_init);
  *((_DWORD *)v7 + 2) = 0;
  v7[12] = -2;
  v7[12] = 2;
  objc_storeStrong((id *)v7 + 2, a3);
  atomic_store(1u, (unsigned __int8 *)v7 + 14);
  ContinuationList::drainContinuations_takesLock((ContinuationList *)(v7 + 72), (GCFuture *)v7);

  return (GCOperation *)v7;
}

- (GCOperation)initWithError:(id)a3
{
  id v6;
  char *v7;
  void *v9;
  objc_super v10;

  v6 = a3;
  if (!v6)
  {
    unk_1F03A9A20(&off_1F03A9B88, "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCFuture.mm"), 1421, CFSTR("Invalid parameter not satisfying: %s"), "error != nil");

  }
  v10.receiver = self;
  v10.super_class = (Class)GCFuture;
  v7 = -[GCFuture init](&v10, sel_init);
  *((_DWORD *)v7 + 2) = 0;
  v7[12] = -2;
  v7[12] = 1;
  objc_storeStrong((id *)v7 + 2, a3);
  atomic_store(1u, (unsigned __int8 *)v7 + 14);
  ContinuationList::drainContinuations_takesLock((ContinuationList *)(v7 + 72), (GCFuture *)v7);

  return (GCOperation *)v7;
}

- (id)initCancelled
{
  char *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GCFuture;
  v2 = -[GCFuture init](&v5, sel_init);
  *((_DWORD *)v2 + 2) = 0;
  v2[12] = -2;
  v2[12] = 0;
  v3 = (void *)*((_QWORD *)v2 + 2);
  *((_QWORD *)v2 + 2) = 0;

  atomic_store(1u, (unsigned __int8 *)v2 + 14);
  atomic_store(1u, (unsigned __int8 *)v2 + 15);
  ContinuationList::drainContinuations_takesLock((ContinuationList *)(v2 + 72), (GCFuture *)v2);
  return v2;
}

- (id)initOnQueue:(id)a3 withOptions:(unsigned int)a4
{
  __int16 v4;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  _opaque_pthread_t *v13;
  objc_super v15;

  v4 = a4;
  v7 = a3;
  v15.receiver = self;
  v15.super_class = (Class)GCFuture;
  v8 = -[GCFuture init](&v15, sel_init);
  *((_DWORD *)v8 + 2) = 0;
  *((_BYTE *)v8 + 12) = -2;
  *((_BYTE *)v8 + 12) = -2;
  atomic_store(0, (unsigned __int8 *)v8 + 14);
  if (__creatorFrameKey(void)::onceToken != -1)
    dispatch_once(&__creatorFrameKey(void)::onceToken, &__block_literal_global_288);
  *((_QWORD *)v8 + 13) = pthread_getspecific(__creatorFrameKey(void)::key);
  if ((v4 & 0x100) != 0)
    *((_BYTE *)v8 + 13) |= 1u;
  objc_storeStrong((id *)v8 + 4, a3);
  if ((v4 & 2) != 0)
  {
    v12 = (void *)*((_QWORD *)v8 + 7);
    *((_QWORD *)v8 + 7) = 0;

    if ((v4 & 4) == 0)
    {
      v11 = 0;
      goto LABEL_10;
    }
LABEL_11:
    v13 = pthread_self();
    pthread_get_qos_class_np(v13, (qos_class_t *)v8 + 16, (int *)v8 + 17);
    goto LABEL_12;
  }
  v9 = voucher_copy();
  v10 = (void *)*((_QWORD *)v8 + 7);
  *((_QWORD *)v8 + 7) = v9;

  if ((v4 & 4) != 0)
    goto LABEL_11;
  v11 = 21;
LABEL_10:
  *((_DWORD *)v8 + 16) = v11;
  *((_DWORD *)v8 + 17) = 0;
LABEL_12:

  return v8;
}

- (id)initOnQueue:(id)a3 withOptions:(unsigned int)a4 block:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  id v10;

  v6 = *(_QWORD *)&a4;
  v8 = a3;
  v9 = a5;
  v10 = -[GCOperation initOnQueue:withOptions:](self, "initOnQueue:withOptions:", v8, v6);
  objc_msgSend(v10, "setAsyncBlock:", v9);

  return v10;
}

- (id)initOnQueue:(id)a3 withBlock:(id)a4
{
  return -[GCOperation initOnQueue:withOptions:block:](self, "initOnQueue:withOptions:block:", a3, 0, a4);
}

- (void)setLabel:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)GCOperation;
  -[GCFuture setLabel:](&v5, sel_setLabel_, v4);
  if (self->_continuations._continuations.tqh_last)
  {
    objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
    dispatch_queue_set_label_nocopy();
  }

}

- (void)setAsyncBlock:(id)a3
{
  id v4;
  unsigned __int8 v5;
  OS_dispatch_queue *v6;
  OS_dispatch_queue *targetQueue;
  id v8;

  v4 = a3;
  v5 = atomic_load((unsigned __int8 *)&self->super._state + 2);
  if ((v5 & 1) != 0)
    -[GCOperation setAsyncBlock:].cold.1();
  v8 = v4;
  v6 = (OS_dispatch_queue *)objc_msgSend(v4, "copy");
  targetQueue = self->_targetQueue;
  self->_targetQueue = v6;

}

- (void)setSyncBlock:(id)a3
{
  id v4;
  unsigned __int8 v5;
  void *v6;
  id asyncBlock;
  id v8;

  v4 = a3;
  v5 = atomic_load((unsigned __int8 *)&self->super._state + 2);
  if ((v5 & 1) != 0)
    -[GCOperation setSyncBlock:].cold.1();
  v8 = v4;
  v6 = (void *)objc_msgSend(v4, "copy");
  asyncBlock = self->_asyncBlock;
  self->_asyncBlock = v6;

}

- (id)activate
{
  if (!*((_QWORD *)self + 5) && !*((_QWORD *)self + 6))
    -[GCOperation activate].cold.1();
  atomic_store(1u, (unsigned __int8 *)self + 14);
  return self;
}

- (id)startAsynchronously
{
  id v3;

  v3 = -[GCOperation activate](self, "activate");
  -[GCOperation _startAsynchronouslyIfNeeded]((uint64_t)self);
  return self;
}

- (void)_startAsynchronouslyIfNeeded
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 138412290;
  v2 = a1;
  _os_log_debug_impl(&dword_1DC79E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "#WARNING Asynchronously observing an operation that only has a synchronous implementation is bad for #performance.  Provide an asynchronous implementation for %@", (uint8_t *)&v1, 0xCu);
}

uint64_t __43__GCOperation__startAsynchronouslyIfNeeded__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __43__GCOperation__startAsynchronouslyIfNeeded__block_invoke_236(uint64_t a1)
{
  NSObject *v2;
  id v3;
  void *v4;
  uint64_t v5;
  unsigned __int8 v6;
  uint64_t v7;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__11;
  v22 = __Block_byref_object_dispose__11;
  v23 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__11;
  v16 = __Block_byref_object_dispose__11;
  v17 = 0;
  v2 = *(NSObject **)(a1 + 32);
  if (v2)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __43__GCOperation__startAsynchronouslyIfNeeded__block_invoke_237;
    block[3] = &unk_1EA4D43C8;
    v10 = &v12;
    v3 = *(id *)(a1 + 48);
    block[4] = *(_QWORD *)(a1 + 40);
    v9 = v3;
    v11 = &v18;
    dispatch_async_and_wait(v2, block);
    v4 = v9;
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    v5 = objc_claimAutoreleasedReturnValue();
    objc_storeStrong(&v23, 0);
    v4 = (void *)v13[5];
    v13[5] = v5;
  }

  v6 = atomic_load((unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 15));
  if ((v6 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "_setState:result:error:", 0, 0, 0);
  }
  else
  {
    v7 = v13[5];
    if (v7)
    {
      objc_msgSend(*(id *)(a1 + 40), "_setState:result:error:", 2, v7, 0);
    }
    else
    {
      if (!v19[5])
        __43__GCOperation__startAsynchronouslyIfNeeded__block_invoke_236_cold_1();
      objc_msgSend(*(id *)(a1 + 40), "_setState:result:error:", 1, 0);
    }
  }
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);
}

void __43__GCOperation__startAsynchronouslyIfNeeded__block_invoke_237(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id obj;

  v2 = a1[5];
  v3 = *(_QWORD *)(a1[7] + 8);
  obj = *(id *)(v3 + 40);
  (*(void (**)(void))(v2 + 16))();
  v4 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v3 + 40), obj);
  v5 = *(_QWORD *)(a1[6] + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (BOOL)_runSynchronouslyIfNeeded
{
  unsigned __int8 v2;
  void *v3;
  _BOOL8 v4;
  id v5;
  void *v6;
  NSObject *v7;
  dispatch_queue_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  int v14;
  dispatch_block_flags_t v15;
  uint64_t v16;
  void *v17;
  _QWORD aBlock[4];
  id v20;
  uint64_t v21;
  id v22;

  if (a1)
  {
    v2 = atomic_load((unsigned __int8 *)(a1 + 14));
    if ((v2 & 1) == 0)
      -[GCOperation _runSynchronouslyIfNeeded].cold.1();
    os_unfair_lock_lock_with_options();
    if (*(unsigned __int8 *)(a1 + 12) == 254)
    {
      v3 = _Block_copy(*(const void **)(a1 + 48));
      v4 = v3 != 0;
      if (!v3)
      {
        os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
        -[GCOperation _startAsynchronouslyIfNeeded](a1);
LABEL_20:

        return v4;
      }
      *(_BYTE *)(a1 + 12) = -1;
      v5 = *(id *)(a1 + 32);
      v6 = v5;
      if ((*(_BYTE *)(a1 + 13) & 1) != 0)
      {

        v6 = 0;
      }
      dispatch_queue_attr_make_initially_inactive(0);
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = dispatch_queue_create(0, v7);
      v9 = *(void **)(a1 + 88);
      *(_QWORD *)(a1 + 88) = v8;

      objc_msgSend(*(id *)(a1 + 24), "UTF8String");
      dispatch_queue_set_label_nocopy();
      dispatch_activate(*(dispatch_object_t *)(a1 + 88));
      dispatch_get_current_queue();
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = *(void **)(a1 + 96);
      *(_QWORD *)(a1 + 96) = v10;

      *(_BYTE *)(a1 + 13) &= ~2u;
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __40__GCOperation__runSynchronouslyIfNeeded__block_invoke;
      aBlock[3] = &unk_1EA4D43F0;
      v12 = v6;
      v20 = v12;
      v21 = a1;
      v22 = v3;
      v13 = _Block_copy(aBlock);
      v14 = *(_DWORD *)(a1 + 64);
      if (!*(_QWORD *)(a1 + 56) && v14 == 21)
      {
LABEL_19:
        dispatch_async_and_wait(*(dispatch_queue_t *)(a1 + 88), v13);

        goto LABEL_20;
      }
      if (v14)
      {
        if (v14 != 21)
        {
          v16 = dispatch_block_create_with_voucher_and_qos_class();
          goto LABEL_18;
        }
        v15 = DISPATCH_BLOCK_ASSIGN_CURRENT;
      }
      else
      {
        v15 = DISPATCH_BLOCK_DETACHED;
      }
      v16 = (uint64_t)dispatch_block_create(v15, v13);
LABEL_18:
      v17 = (void *)v16;

      v13 = v17;
      goto LABEL_19;
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
  }
  return 0;
}

void __40__GCOperation__runSynchronouslyIfNeeded__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id v3;
  void *v4;
  uint64_t v5;
  unsigned __int8 v6;
  uint64_t v7;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__11;
  v22 = __Block_byref_object_dispose__11;
  v23 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__11;
  v16 = __Block_byref_object_dispose__11;
  v17 = 0;
  v2 = *(NSObject **)(a1 + 32);
  if (v2)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __40__GCOperation__runSynchronouslyIfNeeded__block_invoke_2;
    block[3] = &unk_1EA4D43C8;
    v10 = &v12;
    v3 = *(id *)(a1 + 48);
    block[4] = *(_QWORD *)(a1 + 40);
    v9 = v3;
    v11 = &v18;
    dispatch_async_and_wait(v2, block);
    v4 = v9;
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    v5 = objc_claimAutoreleasedReturnValue();
    objc_storeStrong(&v23, 0);
    v4 = (void *)v13[5];
    v13[5] = v5;
  }

  v6 = atomic_load((unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 15));
  if ((v6 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "_setState:result:error:", 0, 0, 0);
  }
  else
  {
    v7 = v13[5];
    if (v7)
    {
      objc_msgSend(*(id *)(a1 + 40), "_setState:result:error:", 2, v7, 0);
    }
    else
    {
      if (!v19[5])
        __40__GCOperation__runSynchronouslyIfNeeded__block_invoke_cold_1();
      objc_msgSend(*(id *)(a1 + 40), "_setState:result:error:", 1, 0);
    }
  }
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);
}

void __40__GCOperation__runSynchronouslyIfNeeded__block_invoke_2(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id obj;

  v2 = a1[5];
  v3 = *(_QWORD *)(a1[7] + 8);
  obj = *(id *)(v3 + 40);
  (*(void (**)(void))(v2 + 16))();
  v4 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v3 + 40), obj);
  v5 = *(_QWORD *)(a1[6] + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (BOOL)_checkFinished:(BOOL)a3
{
  unsigned __int8 v3;
  OS_dispatch_queue *v5;
  os_unfair_lock_s *p_lock;
  BOOL v7;

  v3 = atomic_load((unsigned __int8 *)&self->super._state + 2);
  if ((v3 & 1) == 0)
    -[GCOperation _checkFinished:].cold.1();
  if (a3)
  {
    if (!-[GCOperation _runSynchronouslyIfNeeded]((uint64_t)self))
    {
      os_unfair_lock_lock_with_options();
      if (self->_continuations._continuations.tqh_first)
      {
        v5 = self->_privateQueue;
        os_unfair_lock_unlock(&self->super._lock);
        if (!v5)
          -[GCOperation _checkFinished:].cold.2();
        if ((*(&self->super._state + 1) & 2) != 0)
          dispatch_group_wait((dispatch_group_t)v5, 0xFFFFFFFFFFFFFFFFLL);
        else
          dispatch_async_and_wait((dispatch_queue_t)self->_continuations._continuations.tqh_last, &__block_literal_global_240);

      }
      else
      {
        os_unfair_lock_unlock(&self->super._lock);
      }
    }
    return 1;
  }
  else
  {
    p_lock = &self->super._lock;
    os_unfair_lock_lock_with_options();
    v7 = self->_continuations._continuations.tqh_first == 0;
    os_unfair_lock_unlock(p_lock);
  }
  return v7;
}

- (void)_observeFinishOnQueue:(id)a3 withOptions:(unsigned int)a4 qosClass:(unsigned int)a5 relativePriority:(int)a6 block:(id)a7
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v12;
  id v13;
  NSObject *privateQueue;
  _QWORD v15[4];
  id v16;
  id v17;
  int v18;
  int v19;
  int v20;
  objc_super v21;

  v8 = *(_QWORD *)&a6;
  v9 = *(_QWORD *)&a5;
  v10 = *(_QWORD *)&a4;
  v12 = a3;
  v13 = a7;
  if ((v10 & 0x10000) == 0)
    -[GCOperation _startAsynchronouslyIfNeeded]((uint64_t)self);
  os_unfair_lock_lock_with_options();
  if (self->_continuations._continuations.tqh_first)
  {
    if ((v10 & 0x10000) == 0 && (*(&self->super._state + 1) & 2) == 0)
    {
      privateQueue = self->_privateQueue;
      if (privateQueue)
        dispatch_async(privateQueue, &__block_literal_global_241);
    }
    os_unfair_lock_unlock(&self->super._lock);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __81__GCOperation__observeFinishOnQueue_withOptions_qosClass_relativePriority_block___block_invoke_2;
    v15[3] = &unk_1EA4D43A0;
    v17 = v13;
    v16 = v12;
    v18 = v10;
    v19 = v9;
    v20 = v8;
    ContinuationList::addOrInvokeContinuation_takesLock((uint64_t)&self->_qos, self, v15);

  }
  else
  {
    os_unfair_lock_unlock(&self->super._lock);
    v21.receiver = self;
    v21.super_class = (Class)GCOperation;
    -[GCFuture _observeFinishOnQueue:withOptions:qosClass:relativePriority:block:](&v21, sel__observeFinishOnQueue_withOptions_qosClass_relativePriority_block_, v12, v10, v9, v8, v13);
  }

}

_QWORD *__81__GCOperation__observeFinishOnQueue_withOptions_qosClass_relativePriority_block___block_invoke_2(uint64_t a1)
{
  return Observer::Create(*(void **)(a1 + 40), *(void **)(a1 + 32), *(_DWORD *)(a1 + 48), (dispatch_qos_class_t)*(_DWORD *)(a1 + 52), *(_DWORD *)(a1 + 56));
}

- (BOOL)_setState:(int64_t)a3 result:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  _BOOL4 v10;
  id syncBlock;
  objc_super v13;

  v8 = a4;
  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)GCOperation;
  v10 = -[GCFuture _setState:result:error:](&v13, sel__setState_result_error_, a3, v8, v9);
  if (v10)
  {
    ContinuationList::drainContinuations_takesLock((ContinuationList *)&self->_qos, &self->super);
    syncBlock = self->_syncBlock;
    self->_syncBlock = 0;

    if ((*(&self->super._state + 1) & 2) != 0)
      dispatch_group_leave((dispatch_group_t)self->_privateQueue);
  }

  return v10;
}

- (unint64_t)_creatorFrame
{
  return (unint64_t)self->_syncBoostQueueOrAsyncGroup;
}

- (id)debugDescription
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GCOperation;
  -[GCFuture debugDescription](&v3, sel_debugDescription);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_thenSynchronouslyRequiringState:(int64_t)a3 onQueue:(id)a4 withOptions:(unsigned int)a5 qosClass:(unsigned int)a6 relativePriority:(int)a7 label:(id)a8 block:(id)a9
{
  uint64_t v12;
  id v16;
  id v17;
  id v18;
  unsigned __int8 v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v24;
  void *v25;
  _QWORD v26[5];
  id v27;
  int64_t v28;
  _QWORD v29[5];
  id v30;
  id v31;
  int64_t v32;
  int v33;
  unsigned int v34;
  int v35;

  v12 = *(_QWORD *)&a5;
  v16 = a4;
  v17 = a8;
  v18 = a9;
  v25 = v17;
  if (!v18)
  {
    unk_1F03A9A20(&off_1F03A9B88, "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCFuture.mm"), 1875, CFSTR("Invalid parameter not satisfying: %s"), "block != nil", v17);

  }
  v19 = atomic_load((unsigned __int8 *)&self->super._state + 2);
  if ((v19 & 1) == 0)
    -[GCOperation _thenSynchronouslyRequiringState:onQueue:withOptions:qosClass:relativePriority:label:block:].cold.1();
  v20 = -[GCOperation initOnQueue:withOptions:]([GCOperation alloc], "initOnQueue:withOptions:", v16, v12);
  v21 = MEMORY[0x1E0C809B0];
  if (self->_targetQueue)
  {
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __106__GCOperation__thenSynchronouslyRequiringState_onQueue_withOptions_qosClass_relativePriority_label_block___block_invoke;
    v29[3] = &unk_1EA4D42B0;
    v29[4] = self;
    v33 = v12;
    v34 = a6;
    v35 = a7;
    v30 = v16;
    v32 = a3;
    v31 = v18;
    objc_msgSend(v20, "setAsyncBlock:", v29);

  }
  if (self->_asyncBlock)
  {
    v26[0] = v21;
    v26[1] = 3221225472;
    v26[2] = __106__GCOperation__thenSynchronouslyRequiringState_onQueue_withOptions_qosClass_relativePriority_label_block___block_invoke_3;
    v26[3] = &unk_1EA4D4458;
    v26[4] = self;
    v28 = a3;
    v27 = v18;
    objc_msgSend(v20, "setSyncBlock:", v26);

  }
  objc_msgSend(v20, "activate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

void __106__GCOperation__thenSynchronouslyRequiringState_onQueue_withOptions_qosClass_relativePriority_label_block___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  uint64_t v14;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(unsigned int *)(a1 + 64);
  v7 = *(unsigned int *)(a1 + 68);
  v8 = *(unsigned int *)(a1 + 72);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __106__GCOperation__thenSynchronouslyRequiringState_onQueue_withOptions_qosClass_relativePriority_label_block___block_invoke_2;
  v11[3] = &unk_1EA4D4288;
  v9 = *(void **)(a1 + 48);
  v14 = *(_QWORD *)(a1 + 56);
  v11[4] = v4;
  v12 = v3;
  v13 = v9;
  v10 = v3;
  objc_msgSend(v4, "observeFinishOnQueue:withOptions:qosClass:relativePriority:block:", v5, v6, v7, v8, v11);

}

void __106__GCOperation__thenSynchronouslyRequiringState_onQueue_withOptions_qosClass_relativePriority_label_block___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  unint64_t v10;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  unsigned __int8 *v17;
  void *v18;
  void *v19;
  id v20;

  v7 = a3;
  v8 = a4;
  v9 = *(id *)(a1 + 32);
  v10 = *(_QWORD *)(a1 + 56);
  if (v10 > 2 || v10 == a2)
  {
    v12 = v8;
    v13 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 40), "future");
    v14 = objc_claimAutoreleasedReturnValue();
    v20 = v12;
    (*(void (**)(uint64_t, uint64_t, id, uint64_t, id *))(v13 + 16))(v13, a2, v7, v14 + 15, &v20);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v20;

    objc_msgSend(*(id *)(a1 + 40), "future");
    v17 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v14) = atomic_load(v17 + 15);

    if ((v14 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "future");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "_setState:result:error:", 0, 0, 0);
    }
    else if (v15)
    {
      objc_msgSend(*(id *)(a1 + 40), "future");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "_setState:result:error:", 2, v15, 0);
    }
    else
    {
      if (!v12)
        __106__GCOperation__thenSynchronouslyRequiringState_onQueue_withOptions_qosClass_relativePriority_label_block___block_invoke_2_cold_1();
      objc_msgSend(*(id *)(a1 + 40), "future");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "_setState:result:error:", 1, 0, v16);
    }

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "future");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "_setState:result:error:", a2, v7, v8);

  }
}

id __106__GCOperation__thenSynchronouslyRequiringState_onQueue_withOptions_qosClass_relativePriority_label_block___block_invoke_3(uint64_t a1, unsigned __int8 *a2, _QWORD *a3)
{
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v6 = objc_msgSend(*(id *)(a1 + 32), "waitUntilFinished");
  v7 = (void *)v6;
  v8 = *(_QWORD *)(a1 + 48);
  if (v8 != 2)
  {
    if (v8 != 1)
    {
      if (!v8)
      {
        if (v6 != 1)
        {
          if (v6 != 2)
            goto LABEL_9;
LABEL_14:
          objc_msgSend(*(id *)(a1 + 32), "result");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          return v7;
        }
LABEL_13:
        objc_msgSend(*(id *)(a1 + 32), "error");
        v7 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
        return v7;
      }
      goto LABEL_9;
    }
    if (v6 == 2)
      goto LABEL_14;
    if (v6)
      goto LABEL_9;
LABEL_12:
    atomic_store(1u, a2);
    return v7;
  }
  if (v6 == 1)
    goto LABEL_13;
  if (!v6)
    goto LABEL_12;
LABEL_9:
  objc_msgSend(*(id *)(a1 + 32), "error");
  *a3 = (id)objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "result");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, void *, unsigned __int8 *, _QWORD *))(v9 + 16))(v9, v7, v10, a2, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)asyncBlock
{
  return self->_targetQueue;
}

- (id)syncBlock
{
  return self->_asyncBlock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateQueue, 0);
  objc_storeStrong((id *)&self->_continuations._continuations.tqh_last, 0);
  objc_storeStrong(&self->_syncBlock, 0);
  objc_storeStrong(&self->_asyncBlock, 0);
  objc_storeStrong((id *)&self->_targetQueue, 0);
  objc_storeStrong((id *)&self->super._label, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 9) = 0;
  *((_QWORD *)self + 10) = (char *)self + 72;
  return self;
}

- (void)setAsyncBlock:.cold.1()
{
  qword_1F039F7F8 = (uint64_t)"BUG IN CLIENT OF GCOperation: -setAsyncBlock: called on active GCOperation.";
  __break(1u);
}

- (void)setSyncBlock:.cold.1()
{
  qword_1F039F7F8 = (uint64_t)"BUG IN CLIENT OF GCOperation: -setSyncBlock: called on active GCOperation.";
  __break(1u);
}

- (void)activate
{
  qword_1F039F7F8 = (uint64_t)"BUG IN CLIENT OF GCOperation: Operation must have an async or sync implementation.";
  __break(1u);
}

void __43__GCOperation__startAsynchronouslyIfNeeded__block_invoke_236_cold_1()
{
  qword_1F039F7F8 = (uint64_t)"BUG IN CLIENT OF GCOperation: Operation was not cancelled, but syncBlock did not return a r"
                             "esult or an error.";
  __break(1u);
}

- (void)_runSynchronouslyIfNeeded
{
  qword_1F039F7F8 = (uint64_t)"BUG IN CLIENT OF GCOperation: Operation has not been activated.";
  __break(1u);
}

void __40__GCOperation__runSynchronouslyIfNeeded__block_invoke_cold_1()
{
  qword_1F039F7F8 = (uint64_t)"BUG IN CLIENT OF GCOperation: Operation was not cancelled, but syncBlock did not return a r"
                             "esult or an error.";
  __break(1u);
}

- (void)_checkFinished:.cold.1()
{
  qword_1F039F7F8 = (uint64_t)"BUG IN CLIENT OF GCOperation: GCOperation has not been activated.";
  __break(1u);
}

- (void)_checkFinished:.cold.2()
{
  _os_assert_log();
  _os_crash();
  __break(1u);
}

- (void)_thenSynchronouslyRequiringState:onQueue:withOptions:qosClass:relativePriority:label:block:.cold.1()
{
  qword_1F039F7F8 = (uint64_t)"BUG IN CLIENT OF GCOperation: GCOperation has not been activated.";
  __break(1u);
}

void __106__GCOperation__thenSynchronouslyRequiringState_onQueue_withOptions_qosClass_relativePriority_label_block___block_invoke_2_cold_1()
{
  qword_1F039F7F8 = (uint64_t)"BUG IN CLIENT OF GCOperation: Operation was not cancelled, but block did not return a result or an error.";
  __break(1u);
}

@end
