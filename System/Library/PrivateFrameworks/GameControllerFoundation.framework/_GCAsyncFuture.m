@implementation _GCAsyncFuture

- (id)_initOnQueue:(char)a3 withOptions:(void *)a4 block:
{
  NSObject *v7;
  id v8;
  void *v9;
  id v10;
  dispatch_group_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id *v15;
  id *v16;
  void *v17;
  dispatch_block_flags_t v18;
  dispatch_block_t v19;
  void *v21;
  _QWORD aBlock[4];
  id *v23;
  id v24;
  objc_super v25;

  v7 = a2;
  v8 = a4;
  v9 = v8;
  if (a1)
  {
    if (!v8)
    {
      unk_1F03A9A20(&off_1F03A9B88, "currentHandler");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", sel__initOnQueue_withOptions_block_, a1, CFSTR("GCFuture.mm"), 1237, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block != nil"));

    }
    v25.receiver = a1;
    v25.super_class = (Class)GCFuture;
    v10 = objc_msgSendSuper2(&v25, sel_init);
    *((_DWORD *)v10 + 2) = 0;
    *((_BYTE *)v10 + 12) = -2;
    *((_BYTE *)v10 + 12) = -1;
    atomic_store(1u, (unsigned __int8 *)v10 + 14);
    if (__creatorFrameKey(void)::onceToken != -1)
      dispatch_once(&__creatorFrameKey(void)::onceToken, &__block_literal_global_288);
    *((_QWORD *)v10 + 8) = pthread_getspecific(__creatorFrameKey(void)::key);
    v11 = dispatch_group_create();
    v12 = (void *)*((_QWORD *)v10 + 4);
    *((_QWORD *)v10 + 4) = v11;

    dispatch_group_enter(*((dispatch_group_t *)v10 + 4));
    if ((a3 & 2) != 0)
    {
      v14 = (void *)*((_QWORD *)v10 + 5);
      *((_QWORD *)v10 + 5) = 0;
    }
    else
    {
      v13 = voucher_copy();
      v14 = (void *)*((_QWORD *)v10 + 5);
      *((_QWORD *)v10 + 5) = v13;
    }

    v15 = -[GCPromise initWithFuture:]((id *)[GCPromise alloc], v10);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __49___GCAsyncFuture__initOnQueue_withOptions_block___block_invoke;
    aBlock[3] = &unk_1EA4D4378;
    v23 = v15;
    v24 = v9;
    v16 = v15;
    v17 = _Block_copy(aBlock);
    if (!v7)
    {
      dispatch_block_perform((dispatch_block_flags_t)(a3 & 2), v17);
LABEL_17:
      a1 = v10;

      goto LABEL_18;
    }
    if ((a3 & 2) != 0)
    {
      v18 = DISPATCH_BLOCK_DETACHED;
    }
    else
    {
      if ((a3 & 4) == 0)
      {
LABEL_16:
        dispatch_async(v7, v17);
        goto LABEL_17;
      }
      v18 = DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT;
    }
    v19 = dispatch_block_create(v18, v17);

    v17 = v19;
    goto LABEL_16;
  }
LABEL_18:

  return a1;
}

- (BOOL)_checkFinished:(BOOL)a3
{
  return dispatch_group_wait(&self->super._label->super, a3 << 63 >> 63) == 0;
}

- (void)_observeFinishOnQueue:(id)a3 withOptions:(unsigned int)a4 qosClass:(unsigned int)a5 relativePriority:(int)a6 block:(id)a7
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v12;
  id v13;
  Observer *tqh_first;
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
  os_unfair_lock_lock_with_options();
  tqh_first = self->_continuations._continuations.tqh_first;
  os_unfair_lock_unlock(&self->super._lock);
  if (tqh_first)
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __84___GCAsyncFuture__observeFinishOnQueue_withOptions_qosClass_relativePriority_block___block_invoke;
    v15[3] = &unk_1EA4D43A0;
    v17 = v13;
    v16 = v12;
    v18 = v10;
    v19 = v9;
    v20 = v8;
    ContinuationList::addOrInvokeContinuation_takesLock((uint64_t)&self->_creationVoucher, self, v15);

  }
  else
  {
    v21.receiver = self;
    v21.super_class = (Class)_GCAsyncFuture;
    -[GCFuture _observeFinishOnQueue:withOptions:qosClass:relativePriority:block:](&v21, sel__observeFinishOnQueue_withOptions_qosClass_relativePriority_block_, v12, v10, v9, v8, v13);
  }

}

- (BOOL)_setState:(int64_t)a3 result:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  _BOOL4 v10;
  OS_dispatch_group *condGroup;
  objc_super v13;

  v8 = a4;
  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)_GCAsyncFuture;
  v10 = -[GCFuture _setState:result:error:](&v13, sel__setState_result_error_, a3, v8, v9);
  if (v10)
  {
    ContinuationList::drainContinuations_takesLock((ContinuationList *)&self->_creationVoucher, &self->super);
    condGroup = self->_condGroup;
    self->_condGroup = 0;

    dispatch_group_leave(&self->super._label->super);
  }

  return v10;
}

- (unint64_t)_creatorFrame
{
  return (unint64_t)self->_continuations._continuations.tqh_last;
}

- (id)debugDescription
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_GCAsyncFuture;
  -[GCFuture debugDescription](&v3, sel_debugDescription);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_condGroup, 0);
  objc_storeStrong((id *)&self->super._label, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 6) = 0;
  *((_QWORD *)self + 7) = (char *)self + 48;
  return self;
}

@end
