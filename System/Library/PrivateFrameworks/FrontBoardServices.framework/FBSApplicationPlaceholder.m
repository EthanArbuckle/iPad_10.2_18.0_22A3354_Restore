@implementation FBSApplicationPlaceholder

- (id)_initWithBundleIdentifier:(id)a3 url:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  id result;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  FBSApplicationPlaceholder *v19;
  __int16 v20;
  const __CFString *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  void *v25;

  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("this initializer is unavailable"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138544642;
    v15 = v10;
    v16 = 2114;
    v17 = v12;
    v18 = 2048;
    v19 = self;
    v20 = 2114;
    v21 = CFSTR("FBSApplicationPlaceholder.m");
    v22 = 1024;
    v23 = 46;
    v24 = 2114;
    v25 = v9;
    _os_log_error_impl(&dword_19A6D4000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v14, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
  result = (id)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (id)_initWithBundleProxy:(id)a3 url:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  id result;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  FBSApplicationPlaceholder *v19;
  __int16 v20;
  const __CFString *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  void *v25;

  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("this initializer is unavailable"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138544642;
    v15 = v10;
    v16 = 2114;
    v17 = v12;
    v18 = 2048;
    v19 = self;
    v20 = 2114;
    v21 = CFSTR("FBSApplicationPlaceholder.m");
    v22 = 1024;
    v23 = 51;
    v24 = 2114;
    v25 = v9;
    _os_log_error_impl(&dword_19A6D4000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v14, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
  result = (id)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (id)_initWithApplicationProxy:(id)a3 identity:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id *v10;
  id *v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  id v17;
  FBSApplicationPlaceholderProgress *v18;
  id v19;
  void *v21;
  objc_super v22;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("proxy"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSApplicationPlaceholder _initWithApplicationProxy:identity:].cold.1();
LABEL_11:
    objc_msgSend(objc_retainAutorelease(v21), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A70CAB0);
  }
  v9 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("identity"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSApplicationPlaceholder _initWithApplicationProxy:identity:].cold.2();
    goto LABEL_11;
  }
  v22.receiver = self;
  v22.super_class = (Class)FBSApplicationPlaceholder;
  v10 = -[FBSBundleInfo _initWithBundleProxy:overrideURL:](&v22, sel__initWithBundleProxy_overrideURL_, v7, 0);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong(v10 + 8, a3);
    objc_storeStrong(v11 + 14, a4);
    v12 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v13 = v11[12];
    v11[12] = v12;

    +[FBSApplicationPlaceholder _sharedQueue](FBSApplicationPlaceholder, "_sharedQueue");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v11[9];
    v11[9] = (id)v14;

    +[FBSApplicationPlaceholder _callOutQueue](FBSApplicationPlaceholder, "_callOutQueue");
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v11[10];
    v11[10] = (id)v16;

    v18 = -[FBSApplicationPlaceholderProgress initWithPlaceholder:queue:]([FBSApplicationPlaceholderProgress alloc], "initWithPlaceholder:queue:", v11, v11[9]);
    v19 = v11[11];
    v11[11] = v18;

    v11[13] = (id)objc_msgSend(v7, "installType");
    objc_msgSend(v11, "_setProxy:force:", v7, 1);
  }

  return v11;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  _QWORD block[9];
  _QWORD v6[5];
  NSMutableSet *v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  FBSApplicationPlaceholderProgress *v13;
  _QWORD v14[5];
  LSApplicationProxy *v15;
  _QWORD v16[5];
  OS_dispatch_queue *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  OS_dispatch_queue *v23;

  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__3;
  v22 = __Block_byref_object_dispose__3;
  v23 = self->_queue;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = __Block_byref_object_copy__3;
  v16[4] = __Block_byref_object_dispose__3;
  v17 = self->_callOutQueue;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x3032000000;
  v14[3] = __Block_byref_object_copy__3;
  v14[4] = __Block_byref_object_dispose__3;
  v15 = self->_proxy;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__3;
  v12 = __Block_byref_object_dispose__3;
  v13 = self->_queue_progress;
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x3032000000;
  v6[3] = __Block_byref_object_copy__3;
  v6[4] = __Block_byref_object_dispose__3;
  v7 = self->_queue_observers;
  objc_msgSend((id)v9[5], "invalidate");
  v3 = v19[5];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__FBSApplicationPlaceholder_dealloc__block_invoke;
  block[3] = &unk_1E38EBB70;
  block[4] = &v8;
  block[5] = v14;
  block[6] = v6;
  block[7] = v16;
  block[8] = &v18;
  dispatch_async(v3, block);
  _Block_object_dispose(v6, 8);

  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(v14, 8);

  _Block_object_dispose(v16, 8);
  _Block_object_dispose(&v18, 8);

  v4.receiver = self;
  v4.super_class = (Class)FBSApplicationPlaceholder;
  -[FBSApplicationPlaceholder dealloc](&v4, sel_dealloc);
}

void __36__FBSApplicationPlaceholder_dealloc__block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v2 = *(_QWORD *)(a1[4] + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

  v4 = *(_QWORD *)(a1[5] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = 0;

  v6 = *(_QWORD *)(a1[6] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = 0;

  v8 = *(_QWORD *)(a1[7] + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = 0;

  v10 = *(_QWORD *)(a1[8] + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = 0;

}

- (FBSApplicationPlaceholderProgress)progress
{
  NSObject *queue;
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
  v9 = __Block_byref_object_copy__3;
  v10 = __Block_byref_object_dispose__3;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __37__FBSApplicationPlaceholder_progress__block_invoke;
  v5[3] = &unk_1E38EB628;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (FBSApplicationPlaceholderProgress *)v3;
}

void __37__FBSApplicationPlaceholder_progress__block_invoke(uint64_t a1)
{
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "queue_isValid"))
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 88));
}

- (BOOL)isPrioritizable
{
  return -[FBSApplicationPlaceholder _canPerformAction:](self, "_canPerformAction:", 1);
}

- (BOOL)isPausable
{
  return -[FBSApplicationPlaceholder _canPerformAction:](self, "_canPerformAction:", 2);
}

- (BOOL)isResumable
{
  return -[FBSApplicationPlaceholder _canPerformAction:](self, "_canPerformAction:", 4);
}

- (BOOL)isCancellable
{
  return -[FBSApplicationPlaceholder _canPerformAction:](self, "_canPerformAction:", 8);
}

- (BOOL)prioritizeWithResult:(id)a3
{
  return -[FBSApplicationPlaceholder _performAction:withResult:](self, "_performAction:withResult:", 1, a3);
}

- (BOOL)pauseWithResult:(id)a3
{
  return -[FBSApplicationPlaceholder _performAction:withResult:](self, "_performAction:withResult:", 2, a3);
}

- (BOOL)resumeWithResult:(id)a3
{
  return -[FBSApplicationPlaceholder _performAction:withResult:](self, "_performAction:withResult:", 4, a3);
}

- (BOOL)cancelWithResult:(id)a3
{
  return -[FBSApplicationPlaceholder _performAction:withResult:](self, "_performAction:withResult:", 8, a3);
}

- (BOOL)isRestricted
{
  return 0;
}

- (double)percentComplete
{
  void *v2;
  double v3;
  double v4;

  -[FBSApplicationPlaceholder progress](self, "progress");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "percentComplete");
  v4 = v3;

  return v4;
}

- (BOOL)prioritize
{
  return -[FBSApplicationPlaceholder _performAction:withResult:](self, "_performAction:withResult:", 1, 0);
}

- (BOOL)cancel
{
  return -[FBSApplicationPlaceholder _performAction:withResult:](self, "_performAction:withResult:", 8, 0);
}

- (BOOL)pause
{
  return -[FBSApplicationPlaceholder _performAction:withResult:](self, "_performAction:withResult:", 2, 0);
}

- (BOOL)resume
{
  return -[FBSApplicationPlaceholder _performAction:withResult:](self, "_performAction:withResult:", 4, 0);
}

- (void)addObserver:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __41__FBSApplicationPlaceholder_addObserver___block_invoke;
    v7[3] = &unk_1E38EAE08;
    v7[4] = self;
    v8 = v4;
    dispatch_async(queue, v7);

  }
}

uint64_t __41__FBSApplicationPlaceholder_addObserver___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "containsObject:", *(_QWORD *)(a1 + 40));
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "addObject:", *(_QWORD *)(a1 + 40));
  return result;
}

- (void)removeObserver:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __44__FBSApplicationPlaceholder_removeObserver___block_invoke;
    v7[3] = &unk_1E38EAE08;
    v7[4] = self;
    v8 = v4;
    dispatch_async(queue, v7);

  }
}

uint64_t __44__FBSApplicationPlaceholder_removeObserver___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "containsObject:", *(_QWORD *)(a1 + 40));
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "removeObject:", *(_QWORD *)(a1 + 40));
  return result;
}

- (void)_dispatchToObserversWithBlock:(id)a3
{
  id v4;
  void *v5;
  NSObject *callOutQueue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    callOutQueue = self->_callOutQueue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __59__FBSApplicationPlaceholder__dispatchToObserversWithBlock___block_invoke;
    v7[3] = &unk_1E38EBB98;
    v7[4] = self;
    v8 = v4;
    dispatch_async(callOutQueue, v7);

  }
}

void __59__FBSApplicationPlaceholder__dispatchToObserversWithBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _QWORD block[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__3;
  v17 = __Block_byref_object_dispose__3;
  v18 = 0;
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 72);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__FBSApplicationPlaceholder__dispatchToObserversWithBlock___block_invoke_2;
  block[3] = &unk_1E38EB928;
  block[4] = v2;
  block[5] = &v13;
  dispatch_sync(v3, block);
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v4 = (id)v14[5];
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v19, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v4);
        (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40));
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v19, 16);
    }
    while (v5);
  }

  _Block_object_dispose(&v13, 8);
}

void __59__FBSApplicationPlaceholder__dispatchToObserversWithBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "allObjects");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)_sendToObserversPlaceholderProgressDidUpdate
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __73__FBSApplicationPlaceholder__sendToObserversPlaceholderProgressDidUpdate__block_invoke;
  v2[3] = &unk_1E38EBBC0;
  v2[4] = self;
  -[FBSApplicationPlaceholder _dispatchToObserversWithBlock:](self, "_dispatchToObserversWithBlock:", v2);
}

void __73__FBSApplicationPlaceholder__sendToObserversPlaceholderProgressDidUpdate__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "placeholderProgressDidUpdate:", *(_QWORD *)(a1 + 32));
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "placeholderPercentCompleteDidChange:", *(_QWORD *)(a1 + 32));
  }

}

- (void)_sendToObserversPlaceholderDidChangeSignificantly
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __78__FBSApplicationPlaceholder__sendToObserversPlaceholderDidChangeSignificantly__block_invoke;
  v2[3] = &unk_1E38EBBC0;
  v2[4] = self;
  -[FBSApplicationPlaceholder _dispatchToObserversWithBlock:](self, "_dispatchToObserversWithBlock:", v2);
}

void __78__FBSApplicationPlaceholder__sendToObserversPlaceholderDidChangeSignificantly__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "placeholderDidChangeSignificantly:", *(_QWORD *)(a1 + 32));

}

- (BOOL)_queue_isCloudDemoted
{
  return (unint64_t)(-[LSApplicationProxy installType](self->_proxy, "installType") - 7) < 3;
}

- (unint64_t)_queue_supportedActions
{
  BSDispatchQueueAssert();
  if (-[FBSApplicationPlaceholderProgress queue_isValid](self->_queue_progress, "queue_isValid"))
    return -[FBSApplicationPlaceholderProgress queue_supportedActions](self->_queue_progress, "queue_supportedActions");
  if (-[FBSApplicationPlaceholder _queue_isCloudDemoted](self, "_queue_isCloudDemoted"))
    return 9;
  return 0;
}

- (BOOL)_queue_canPerformAction:(unint64_t)a3
{
  uint8x8_t v5;
  BOOL result;
  void *v7;

  BSDispatchQueueAssert();
  v5 = (uint8x8_t)vcnt_s8((int8x8_t)a3);
  v5.i16[0] = vaddlv_u8(v5);
  if (v5.u32[0] == 1)
  {
    if (-[FBSApplicationPlaceholderProgress queue_isValid](self->_queue_progress, "queue_isValid"))
      return -[FBSApplicationPlaceholderProgress queue_canPerformAction:](self->_queue_progress, "queue_canPerformAction:", a3);
    else
      return (a3 & ~-[FBSApplicationPlaceholder _queue_supportedActions](self, "_queue_supportedActions")) == 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("BSBitmaskCount(action) == 1"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSApplicationPlaceholder _queue_canPerformAction:].cold.1();
    objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
    result = _bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (BOOL)_canPerformAction:(unint64_t)a3
{
  NSObject *queue;
  char v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__FBSApplicationPlaceholder__canPerformAction___block_invoke;
  block[3] = &unk_1E38EBBE8;
  block[4] = self;
  block[5] = &v7;
  block[6] = a3;
  dispatch_sync(queue, block);
  v4 = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __47__FBSApplicationPlaceholder__canPerformAction___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_queue_canPerformAction:", *(_QWORD *)(a1 + 48));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)_performAction:(unint64_t)a3 withResult:(id)a4
{
  id v6;
  uint8x8_t v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  const __CFString *v17;
  BOOL v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  __CFString *v27;
  id v28;
  FBSApplicationPlaceholder *v29;
  id v30;
  uint8_t buf[4];
  const __CFString *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = (uint8x8_t)vcnt_s8((int8x8_t)a3);
  v7.i16[0] = vaddlv_u8(v7);
  if (v7.u32[0] != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("BSBitmaskCount(action) == 1"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSApplicationPlaceholder _performAction:withResult:].cold.1();
    objc_msgSend(objc_retainAutorelease(v23), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A70DAE4);
  }
  v8 = v6;
  -[FBSBundleInfo bundleIdentifier](self, "bundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 > 8)
    v10 = CFSTR("(unknown)");
  else
    v10 = off_1E38EBCC8[a3];
  FBSLogApplicationPlaceholder();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v32 = v10;
    v33 = 2114;
    v34 = v9;
    _os_log_impl(&dword_19A6D4000, v11, OS_LOG_TYPE_DEFAULT, "Received request to perform action \"%{public}@\" on %{public}@", buf, 0x16u);
  }

  v12 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __55__FBSApplicationPlaceholder__performAction_withResult___block_invoke;
  v26[3] = &unk_1E38EBC38;
  v27 = (__CFString *)v10;
  v13 = v9;
  v29 = self;
  v30 = v8;
  v28 = v13;
  v14 = v8;
  objc_msgSend(off_1E38E9DE0, "sentinelWithCompletion:", v26);
  v24[0] = v12;
  v24[1] = 3221225472;
  v24[2] = __55__FBSApplicationPlaceholder__performAction_withResult___block_invoke_2_53;
  v24[3] = &unk_1E38EB4A0;
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v25 = v15;
  v16 = (void *)MEMORY[0x19AECA324](v24);
  if (-[FBSApplicationPlaceholder _canPerformAction:](self, "_canPerformAction:", a3))
  {
    switch(a3)
    {
      case 1uLL:
        -[FBSApplicationPlaceholder _prioritizeWithResult:](self, "_prioritizeWithResult:", v16);
        break;
      case 2uLL:
        -[FBSApplicationPlaceholder _pauseWithResult:](self, "_pauseWithResult:", v16);
        break;
      case 4uLL:
        -[FBSApplicationPlaceholder _resumeWithResult:](self, "_resumeWithResult:", v16);
        break;
      case 8uLL:
        -[FBSApplicationPlaceholder progress](self, "progress");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19)
        {
          -[FBSApplicationPlaceholder _cancelWithResult:](self, "_cancelWithResult:", v16);
        }
        else
        {
          -[FBSApplicationPlaceholder appLibrary](self, "appLibrary");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = v20;
          if (v20)
            objc_msgSend(v20, "uninstallApplication:withOptions:completion:", v13, 0, v16);
          else
            objc_msgSend(v15, "signalWithContext:", CFSTR("The placeholder's FBSApplicationLibrary has deallocated"));

        }
        break;
      default:
        v17 = CFSTR("This action is undefined");
        goto LABEL_11;
    }
    v18 = 1;
  }
  else
  {
    v17 = CFSTR("This action is not currently supported");
LABEL_11:
    objc_msgSend(v15, "signalWithContext:", v17);
    v18 = 0;
  }

  return v18;
}

void __55__FBSApplicationPlaceholder__performAction_withResult___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  _QWORD block[4];
  id v18;
  id v19;
  _QWORD v20[4];
  NSObject *v21;
  id v22;
  id v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  if (v4 || objc_msgSend(v3, "isFailed"))
  {
    v6 = (void *)MEMORY[0x1E0CB35C8];
    v20[0] = v5;
    v20[1] = 3221225472;
    v20[2] = __55__FBSApplicationPlaceholder__performAction_withResult___block_invoke_2;
    v20[3] = &unk_1E38EBC10;
    v21 = v3;
    v22 = *(id *)(a1 + 32);
    v23 = v4;
    objc_msgSend(v6, "bs_errorWithDomain:code:configuration:", CFSTR("FBSApplicationPlaceholder"), 1, v20);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    FBSLogApplicationPlaceholder();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v14 = *(_QWORD *)(a1 + 32);
      v15 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v7, "descriptionWithMultilinePrefix:", 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v25 = v14;
      v26 = 2114;
      v27 = v15;
      v28 = 2114;
      v29 = v16;
      _os_log_error_impl(&dword_19A6D4000, v8, OS_LOG_TYPE_ERROR, "%{public}@ on %{public}@ failed: %{public}@", buf, 0x20u);

    }
    v9 = v21;
  }
  else
  {
    FBSLogApplicationPlaceholder();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v12 = *(_QWORD *)(a1 + 32);
      v13 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v25 = v12;
      v26 = 2114;
      v27 = v13;
      _os_log_impl(&dword_19A6D4000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ on %{public}@ succeeded!", buf, 0x16u);
    }
    v7 = 0;
  }

  v10 = *(void **)(a1 + 56);
  if (v10)
  {
    v11 = *(NSObject **)(*(_QWORD *)(a1 + 48) + 80);
    block[0] = v5;
    block[1] = 3221225472;
    block[2] = __55__FBSApplicationPlaceholder__performAction_withResult___block_invoke_51;
    block[3] = &unk_1E38EB888;
    v19 = v10;
    v18 = v7;
    dispatch_async(v11, block);

  }
}

void __55__FBSApplicationPlaceholder__performAction_withResult___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  id v14;

  v14 = a2;
  objc_msgSend(v14, "setFailureDescription:", CFSTR("Unable to perform placeholder action"));
  if (objc_msgSend(*(id *)(a1 + 32), "isFailed"))
  {
    objc_msgSend(v14, "setFailureReason:", CFSTR("The completion block was dropped before being called"));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "context");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_opt_class();
    v5 = v3;
    if (v4)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v6 = v5;
      else
        v6 = 0;
    }
    else
    {
      v6 = 0;
    }
    v7 = v6;

    if (v7)
      objc_msgSend(v14, "setFailureReason:", CFSTR("%@"), v7);
    else
      objc_msgSend(v14, "setFailureReason:", CFSTR("The operation returned an error"), v13);

  }
  objc_msgSend(v14, "setUserInfoValue:forKey:", *(_QWORD *)(a1 + 40), CFSTR("FBSPlaceholderAction"));
  v8 = *(void **)(a1 + 48);
  v9 = objc_opt_class();
  v10 = v8;
  if (v9)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;
  }
  else
  {
    v11 = 0;
  }
  v12 = v11;

  objc_msgSend(v14, "setUnderlyingError:", v12);
}

uint64_t __55__FBSApplicationPlaceholder__performAction_withResult___block_invoke_51(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __55__FBSApplicationPlaceholder__performAction_withResult___block_invoke_2_53(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "signalWithContext:", a2);
}

- (void)_prioritizeWithResult:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id IXAppInstallCoordinatorClass;
  void *v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[FBSBundleInfo bundleIdentifier](self, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  FBSLogApplicationPlaceholder();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v14 = v5;
    _os_log_impl(&dword_19A6D4000, v6, OS_LOG_TYPE_DEFAULT, "Attempting to prioritize %{public}@", buf, 0xCu);
  }

  if (FBSApplicationLibraryLogTransactionEnabled())
  {
    v7 = (void *)MEMORY[0x1E0D4E420];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Requesting to prioritize placeholder."));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "logStep:byParty:phase:success:forBundleID:description:", 4, 11, 3, 1, v5, v8);

  }
  IXAppInstallCoordinatorClass = getIXAppInstallCoordinatorClass();
  if (IXAppInstallCoordinatorClass)
  {
    v10 = IXAppInstallCoordinatorClass;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __51__FBSApplicationPlaceholder__prioritizeWithResult___block_invoke;
    v11[3] = &unk_1E38EBC60;
    v12 = v4;
    objc_msgSend(v10, "prioritizeCoordinatorForAppWithBundleID:completion:", v5, v11);

  }
  else
  {
    (*((void (**)(id, const __CFString *))v4 + 2))(v4, CFSTR("The IXAppInstallCoordinator class does not exist"));
  }

}

uint64_t __51__FBSApplicationPlaceholder__prioritizeWithResult___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_cancelWithResult:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id IXAppInstallCoordinatorClass;
  void *v17;
  _QWORD v18[4];
  id v19;
  uint64_t v20;
  void *v21;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[FBSBundleInfo bundleIdentifier](self, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  FBSLogApplicationPlaceholder();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v23 = v5;
    _os_log_impl(&dword_19A6D4000, v6, OS_LOG_TYPE_DEFAULT, "Attempting to cancel %{public}@", buf, 0xCu);
  }

  if (FBSApplicationLibraryLogTransactionEnabled())
  {
    v7 = (void *)MEMORY[0x1E0D4E420];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Requesting to cancel placeholder."));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "logStep:byParty:phase:success:forBundleID:description:", 5, 11, 3, 1, v5, v8);

  }
  v9 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "processName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("%@ requested cancellation via FBSApplicationPlaceholder"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0CB35C8];
  v20 = *MEMORY[0x1E0CB2D50];
  v21 = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("com.apple.frontboard.app-library"), 1, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  IXAppInstallCoordinatorClass = getIXAppInstallCoordinatorClass();
  if (IXAppInstallCoordinatorClass)
  {
    v17 = IXAppInstallCoordinatorClass;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __47__FBSApplicationPlaceholder__cancelWithResult___block_invoke;
    v18[3] = &unk_1E38EBC60;
    v19 = v4;
    objc_msgSend(v17, "cancelCoordinatorForAppWithBundleID:withReason:client:completion:", v5, v15, 8, v18);

  }
  else
  {
    (*((void (**)(id, const __CFString *))v4 + 2))(v4, CFSTR("The IXAppInstallCoordinator class does not exist"));
  }

}

uint64_t __47__FBSApplicationPlaceholder__cancelWithResult___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_pauseWithResult:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id IXAppInstallCoordinatorClass;
  void *v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[FBSBundleInfo bundleIdentifier](self, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  FBSLogApplicationPlaceholder();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v14 = v5;
    _os_log_impl(&dword_19A6D4000, v6, OS_LOG_TYPE_DEFAULT, "Attempting to pause %{public}@", buf, 0xCu);
  }

  if (FBSApplicationLibraryLogTransactionEnabled())
  {
    v7 = (void *)MEMORY[0x1E0D4E420];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Requesting to pause placeholder."));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "logStep:byParty:phase:success:forBundleID:description:", 6, 11, 3, 1, v5, v8);

  }
  IXAppInstallCoordinatorClass = getIXAppInstallCoordinatorClass();
  if (IXAppInstallCoordinatorClass)
  {
    v10 = IXAppInstallCoordinatorClass;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __46__FBSApplicationPlaceholder__pauseWithResult___block_invoke;
    v11[3] = &unk_1E38EBC60;
    v12 = v4;
    objc_msgSend(v10, "pauseCoordinatorForAppWithBundleID:completion:", v5, v11);

  }
  else
  {
    (*((void (**)(id, const __CFString *))v4 + 2))(v4, CFSTR("The IXAppInstallCoordinator class does not exist"));
  }

}

uint64_t __46__FBSApplicationPlaceholder__pauseWithResult___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_resumeWithResult:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id IXAppInstallCoordinatorClass;
  void *v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[FBSBundleInfo bundleIdentifier](self, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  FBSLogApplicationPlaceholder();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v14 = v5;
    _os_log_impl(&dword_19A6D4000, v6, OS_LOG_TYPE_DEFAULT, "Attempting to resume %{public}@", buf, 0xCu);
  }

  if (FBSApplicationLibraryLogTransactionEnabled())
  {
    v7 = (void *)MEMORY[0x1E0D4E420];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Requesting to resume placeholder."));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "logStep:byParty:phase:success:forBundleID:description:", 7, 11, 3, 1, v5, v8);

  }
  IXAppInstallCoordinatorClass = getIXAppInstallCoordinatorClass();
  if (IXAppInstallCoordinatorClass)
  {
    v10 = IXAppInstallCoordinatorClass;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __47__FBSApplicationPlaceholder__resumeWithResult___block_invoke;
    v11[3] = &unk_1E38EBC60;
    v12 = v4;
    objc_msgSend(v10, "resumeCoordinatorForAppWithBundleID:completion:", v5, v11);

  }
  else
  {
    (*((void (**)(id, const __CFString *))v4 + 2))(v4, CFSTR("The IXAppInstallCoordinator class does not exist"));
  }

}

uint64_t __47__FBSApplicationPlaceholder__resumeWithResult___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (id)_sharedQueue
{
  if (_sharedQueue_onceToken != -1)
    dispatch_once(&_sharedQueue_onceToken, &__block_literal_global_5);
  return (id)_sharedQueue___SharedQueue;
}

void __41__FBSApplicationPlaceholder__sharedQueue__block_invoke()
{
  uint64_t Serial;
  void *v1;

  Serial = BSDispatchQueueCreateSerial();
  v1 = (void *)_sharedQueue___SharedQueue;
  _sharedQueue___SharedQueue = Serial;

}

+ (id)_callOutQueue
{
  if (_callOutQueue_onceToken != -1)
    dispatch_once(&_callOutQueue_onceToken, &__block_literal_global_81);
  return (id)_callOutQueue___CallOutQueue;
}

void __42__FBSApplicationPlaceholder__callOutQueue__block_invoke()
{
  uint64_t Serial;
  void *v1;

  Serial = BSDispatchQueueCreateSerial();
  v1 = (void *)_callOutQueue___CallOutQueue;
  _callOutQueue___CallOutQueue = Serial;

}

- (LSApplicationProxy)_proxy
{
  NSObject *queue;
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
  v9 = __Block_byref_object_copy__3;
  v10 = __Block_byref_object_dispose__3;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __35__FBSApplicationPlaceholder__proxy__block_invoke;
  v5[3] = &unk_1E38EB928;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (LSApplicationProxy *)v3;
}

void __35__FBSApplicationPlaceholder__proxy__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 64));
}

- (void)_setProxy:(id)a3
{
  -[FBSApplicationPlaceholder _setProxy:force:](self, "_setProxy:force:", a3, 0);
}

- (void)_setProxy:(id)a3 force:(BOOL)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__FBSApplicationPlaceholder__setProxy_force___block_invoke;
  block[3] = &unk_1E38EBCA8;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_async(queue, block);

}

uint64_t __45__FBSApplicationPlaceholder__setProxy_force___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_setProxy:force:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

- (void)_queue_setProxy:(id)a3 force:(BOOL)a4
{
  LSApplicationProxy *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;

  v7 = (LSApplicationProxy *)a3;
  -[FBSApplicationPlaceholderProgress queue_isValid](self->_queue_progress, "queue_isValid");
  -[LSApplicationProxy installProgress](v7, "installProgress");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4 || self->_proxy != v7 || (BSEqualBools() & 1) == 0)
  {
    FBSLogApplicationPlaceholder();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[FBSApplicationPlaceholder _queue_setProxy:force:].cold.2(self, v9);

    if (a4 || self->_proxy != v7)
    {
      -[FBSApplicationPlaceholder _reloadFromProxy:](self, "_reloadFromProxy:", v7);
      -[LSApplicationProxy fbs_correspondingApplicationRecord](v7, "fbs_correspondingApplicationRecord");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[FBSApplicationPlaceholder _reloadFromRecord:](self, "_reloadFromRecord:", v10);

      if (self->_proxy != v7)
        objc_storeStrong((id *)&self->_proxy, a3);
    }
    if (-[FBSApplicationPlaceholder _queue_isCloudDemoted](self, "_queue_isCloudDemoted"))
    {
      if (!-[FBSApplicationPlaceholderProgress queue_updateProxy:](self->_queue_progress, "queue_updateProxy:", 0))
        goto LABEL_19;
      goto LABEL_18;
    }
    if (!v8)
    {
      FBSLogApplicationPlaceholder();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[FBSApplicationPlaceholder _queue_setProxy:force:].cold.1(self, v11);

    }
    if (-[FBSApplicationPlaceholderProgress queue_updateProxy:](self->_queue_progress, "queue_updateProxy:", v7))
LABEL_18:
      -[FBSApplicationPlaceholder _queue_noteChangedSignificantly:](self, "_queue_noteChangedSignificantly:", self);
  }
LABEL_19:

}

- (void)_reloadProgress
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__FBSApplicationPlaceholder__reloadProgress__block_invoke;
  block[3] = &unk_1E38EAE78;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __44__FBSApplicationPlaceholder__reloadProgress__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_setProxy:force:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64), 1);
}

- (void)_noteChangedSignificantly
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__FBSApplicationPlaceholder__noteChangedSignificantly__block_invoke;
  block[3] = &unk_1E38EAE78;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __54__FBSApplicationPlaceholder__noteChangedSignificantly__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_noteChangedSignificantly:", 0);
}

- (void)_queue_noteChangedSignificantly:(id)a3
{
  FBSApplicationPlaceholderProgress *v4;
  FBSApplicationPlaceholderProgress *queue_progress;

  v4 = (FBSApplicationPlaceholderProgress *)a3;
  BSDispatchQueueAssert();
  queue_progress = self->_queue_progress;

  if (queue_progress == v4)
    -[FBSApplicationPlaceholder _sendToObserversPlaceholderProgressDidUpdate](self, "_sendToObserversPlaceholderProgressDidUpdate");
  else
    -[FBSApplicationPlaceholder _sendToObserversPlaceholderDidChangeSignificantly](self, "_sendToObserversPlaceholderDidChangeSignificantly");
}

- (unint64_t)installType
{
  NSObject *queue;
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
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __40__FBSApplicationPlaceholder_installType__block_invoke;
  v5[3] = &unk_1E38EB928;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __40__FBSApplicationPlaceholder_installType__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "installType");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (unint64_t)installState
{
  void *v2;
  unint64_t v3;

  -[FBSApplicationPlaceholder progress](self, "progress");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "installState");

  return v3;
}

- (unint64_t)installPhase
{
  void *v2;
  unint64_t v3;

  -[FBSApplicationPlaceholder progress](self, "progress");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "installPhase");

  return v3;
}

- (unint64_t)expectedFinalInstallPhase
{
  void *v2;
  unint64_t v3;

  -[FBSApplicationPlaceholder progress](self, "progress");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "expectedFinalInstallPhase");

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)FBSApplicationPlaceholder;
  -[FBSBundleInfo succinctDescriptionBuilder](&v9, sel_succinctDescriptionBuilder);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[LSApplicationIdentity fbs_personaUniqueString](self->_applicationIdentity, "fbs_personaUniqueString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", v4, CFSTR("persona"), 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "NSStringFromLSInstallType:", self->_installType);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendObject:withName:", v6, CFSTR("LSInstallType"));

  return v3;
}

- (LSApplicationIdentity)applicationIdentity
{
  return self->_applicationIdentity;
}

- (FBSApplicationLibrary)appLibrary
{
  return (FBSApplicationLibrary *)objc_loadWeakRetained((id *)&self->_appLibrary);
}

- (void)setAppLibrary:(id)a3
{
  objc_storeWeak((id *)&self->_appLibrary, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_appLibrary);
  objc_storeStrong((id *)&self->_applicationIdentity, 0);
  objc_storeStrong((id *)&self->_queue_observers, 0);
  objc_storeStrong((id *)&self->_queue_progress, 0);
  objc_storeStrong((id *)&self->_callOutQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_proxy, 0);
}

- (void)_initWithApplicationProxy:identity:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_initWithApplicationProxy:identity:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_queue_canPerformAction:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_performAction:withResult:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_queue_setProxy:(void *)a1 force:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_19A6D4000, a2, OS_LOG_TYPE_ERROR, "Non-demoted placeholder for %@ has no associated NSProgress!", (uint8_t *)&v4, 0xCu);

  OUTLINED_FUNCTION_20();
}

- (void)_queue_setProxy:(void *)a1 force:(NSObject *)a2 .cold.2(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_debug_impl(&dword_19A6D4000, a2, OS_LOG_TYPE_DEBUG, "Updating proxy for %@", (uint8_t *)&v4, 0xCu);

  OUTLINED_FUNCTION_20();
}

@end
