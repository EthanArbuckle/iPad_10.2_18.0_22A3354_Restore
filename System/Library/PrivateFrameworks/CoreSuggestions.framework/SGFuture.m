@implementation SGFuture

- (void)_wait:(id)a3 forSyncAPI:(BOOL)a4
{
  _BOOL4 v4;
  void (**v6)(id, NSObject *, NSError *);
  uint64_t v7;
  void *v8;
  NSObject *v9;
  NSError *v10;
  NSObject *callbacks;
  NSObject *v12;
  NSObject *workQueue;
  qos_class_t v14;
  dispatch_block_t v15;
  _QWORD v16[4];
  void (**v17)(id, NSObject *, NSError *);
  id v18;
  id location;
  _QWORD block[4];
  NSObject *v21;
  NSError *v22;
  void (**v23)(id, NSObject *, NSError *);

  v4 = a4;
  v6 = (void (**)(id, NSObject *, NSError *))a3;
  v7 = pthread_mutex_lock(&self->_lock);
  if (self->_isComplete)
  {
    v8 = (void *)MEMORY[0x1A8583A40](v7);
    v9 = self->_result;
    v10 = self->_error;
    pthread_mutex_unlock(&self->_lock);
    if (!self->_alwaysUseCallbacksQueue || v4)
    {
      v6[2](v6, v9, v10);
    }
    else
    {
      callbacks = self->_callbacks;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __29__SGFuture__wait_forSyncAPI___block_invoke;
      block[3] = &unk_1E4760160;
      v23 = v6;
      v21 = v9;
      v22 = v10;
      dispatch_async(callbacks, block);

    }
    objc_autoreleasePoolPop(v8);
  }
  else
  {
    self->_yoDontLeaveMeHangingBro = 1;
    location = 0;
    objc_initWeak(&location, self);
    v12 = self->_callbacks;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __29__SGFuture__wait_forSyncAPI___block_invoke_2;
    v16[3] = &unk_1E4760068;
    objc_copyWeak(&v18, &location);
    v17 = v6;
    dispatch_async(v12, v16);
    pthread_mutex_unlock(&self->_lock);
    workQueue = self->_workQueue;
    v14 = qos_class_self();
    v15 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v14, 0, &__block_literal_global_16);
    dispatch_async(workQueue, v15);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

}

- (void)wait:(id)a3
{
  -[SGFuture _wait:forSyncAPI:](self, "_wait:forSyncAPI:", a3, 0);
}

+ (id)futureForObject:(id)a3 withKey:(void *)a4 onCreate:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id location;

  v7 = a3;
  v8 = a5;
  v9 = v7;
  objc_sync_enter(v9);
  objc_getAssociatedObject(v9, a4);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_sync_exit(v9);

  }
  else
  {
    v11 = objc_opt_new();
    objc_storeWeak((id *)(v11 + 112), v9);
    *(_QWORD *)(v11 + 120) = a4;
    objc_setAssociatedObject(v9, a4, (id)v11, (void *)1);
    location = 0;
    objc_initWeak(&location, v9);
    v12 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __45__SGFuture_futureForObject_withKey_onCreate___block_invoke;
    v18[3] = &unk_1E4760138;
    objc_copyWeak(&v19, &location);
    objc_msgSend((id)v11, "wait:", v18);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
    objc_sync_exit(v9);

    objc_msgSend((id)v11, "workQueue");
    v13 = objc_claimAutoreleasedReturnValue();
    v15[0] = v12;
    v15[1] = 3221225472;
    v15[2] = __45__SGFuture_futureForObject_withKey_onCreate___block_invoke_32;
    v15[3] = &unk_1E4760260;
    v17 = v8;
    v10 = (id)v11;
    v16 = v10;
    dispatch_sync(v13, v15);

  }
  return v10;
}

uint64_t __50__SGFuture_waitForFuturesToComplete_withCallback___block_invoke(uint64_t result)
{
  unint64_t *v1;
  unint64_t v2;
  unint64_t v3;

  v1 = (unint64_t *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24);
  do
  {
    v2 = __ldaxr(v1);
    v3 = v2 - 1;
  }
  while (__stlxr(v3, v1));
  if (!v3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

intptr_t __16__SGFuture_wait__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0D81638], "tupleWithFirst:second:", a2, a3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)result
{
  void *v5;

  if (!self->_isComplete)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGFuture.m"), 143, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_isComplete"));

  }
  return self->_result;
}

+ (id)createWithImmediateResult:(id)a3 error:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "completeWithResult:error:", v6, v5);

  return v7;
}

- (SGFuture)init
{
  SGFuture *v2;
  SGFuture *v3;
  NSObject *v4;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *callbacks;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *workQueue;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SGFuture;
  v2 = -[SGFuture init](&v12, sel_init);
  v3 = v2;
  if (v2)
  {
    pthread_mutex_init(&v2->_lock, 0);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_initially_inactive(v4);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("SGFuture", v5);
    callbacks = v3->_callbacks;
    v3->_callbacks = (OS_dispatch_queue *)v6;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create("SGFuture-workQueue", v8);
    workQueue = v3->_workQueue;
    v3->_workQueue = (OS_dispatch_queue *)v9;

  }
  return v3;
}

- (id)wait
{
  dispatch_semaphore_t v3;
  NSObject *v4;
  NSObject *v5;
  id v6;
  uint64_t v8;
  uint64_t v9;
  intptr_t (*v10)(uint64_t, uint64_t, uint64_t);
  void *v11;
  NSObject *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v3 = dispatch_semaphore_create(0);
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__998;
  v18 = __Block_byref_object_dispose__999;
  v19 = 0;
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __16__SGFuture_wait__block_invoke;
  v11 = &unk_1E4760040;
  v13 = &v14;
  v4 = v3;
  v12 = v4;
  -[SGFuture _wait:forSyncAPI:](self, "_wait:forSyncAPI:", &v8, 1);
  -[SGFuture workQueue](self, "workQueue", v8, v9, v10, v11);
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_sync(v5, &__block_literal_global);

  dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
  v6 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v6;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (BOOL)completeWithResult:(id)a3 error:(id)a4
{
  id v7;
  id v8;
  void *v9;
  BOOL v10;
  void *v12;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7 && v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGFuture.m"), 165, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("result == nil || error == nil"));

  }
  v10 = -[SGFuture _finishWithResult:orError:](self, "_finishWithResult:orError:", v7, v9);

  return v10;
}

- (BOOL)_finishWithResult:(id)a3 orError:(id)a4
{
  unint64_t v8;
  unint64_t v9;
  void *v10;
  _BOOL4 isComplete;
  NSObject *callbacks;
  void *v14;
  _QWORD block[5];

  v8 = (unint64_t)a3;
  v9 = (unint64_t)a4;
  v10 = (void *)v9;
  if (!(v8 | v9))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGFuture.m"), 178, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("result || error"));
LABEL_10:

    goto LABEL_4;
  }
  if (v8 && v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGFuture.m"), 179, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!(result && error)"));
    goto LABEL_10;
  }
LABEL_4:
  pthread_mutex_lock(&self->_lock);
  isComplete = self->_isComplete;
  if (!self->_isComplete)
  {
    objc_storeStrong((id *)&self->_result, a3);
    objc_storeStrong((id *)&self->_error, a4);
    self->_isComplete = 1;
    -[SGFuture _clearTimeoutNonThreadSafe](self, "_clearTimeoutNonThreadSafe");
    dispatch_activate((dispatch_object_t)self->_callbacks);
    if (self->_yoDontLeaveMeHangingBro)
    {
      self->_yoDontLeaveMeHangingBro = 0;
      callbacks = self->_callbacks;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __38__SGFuture__finishWithResult_orError___block_invoke;
      block[3] = &unk_1E47627A0;
      block[4] = self;
      dispatch_async(callbacks, block);
    }
  }
  pthread_mutex_unlock(&self->_lock);

  return !isComplete;
}

- (void)_clearTimeoutNonThreadSafe
{
  NSObject *timeoutTimer;
  OS_dispatch_source *v4;

  timeoutTimer = self->_timeoutTimer;
  if (timeoutTimer)
  {
    dispatch_source_cancel(timeoutTimer);
    v4 = self->_timeoutTimer;
    self->_timeoutTimer = 0;

  }
}

- (BOOL)succeed:(id)a3
{
  return -[SGFuture _finishWithResult:orError:](self, "_finishWithResult:orError:", a3, 0);
}

void __29__SGFuture__wait_forSyncAPI___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  char *WeakRetained;

  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 40));
  pthread_mutex_lock((pthread_mutex_t *)(WeakRetained + 24));
  v2 = (void *)*((_QWORD *)WeakRetained + 1);
  v3 = *((id *)WeakRetained + 2);
  v4 = v2;
  pthread_mutex_unlock((pthread_mutex_t *)(WeakRetained + 24));
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __45__SGFuture_futureForObject_withKey_onCreate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  NSObject *v8;
  uint8_t v9[16];

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

  if (WeakRetained == v5)
  {
    sgLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_fault_impl(&dword_1A2267000, v8, OS_LOG_TYPE_FAULT, "+[SGFuture futureForObject:withKey:onCreate:] future result is pointer-equivalent to object, which creates a circular reference", v9, 2u);
    }

    if (_PASEvaluateLogFaultAndProbCrashCriteria())
      abort();
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_parentObject);
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong((id *)&self->_callbacks, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_result, 0);
}

- (id)error
{
  void *v5;

  if (!self->_isComplete)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGFuture.m"), 149, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_isComplete"));

  }
  return self->_error;
}

id __38__SGFuture__finishWithResult_orError___block_invoke()
{
  return (id)objc_opt_self();
}

- (void)dealloc
{
  _opaque_pthread_mutex_t *p_lock;
  void *v5;
  objc_super v6;

  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  if (self->_yoDontLeaveMeHangingBro)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGFuture.m"), 49, CFSTR("Tried to dealloc an SGFuture (with >0 listeners) before calling succeed: or :fail."));

  }
  if (!self->_isComplete)
  {
    -[SGFuture _clearTimeoutNonThreadSafe](self, "_clearTimeoutNonThreadSafe");
    dispatch_activate((dispatch_object_t)self->_callbacks);
  }
  pthread_mutex_unlock(p_lock);
  pthread_mutex_destroy(p_lock);
  v6.receiver = self;
  v6.super_class = (Class)SGFuture;
  -[SGFuture dealloc](&v6, sel_dealloc);
}

+ (void)waitForFuturesToComplete:(id)a3 withCallback:(id)a4
{
  id v5;
  void (**v6)(_QWORD);
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  _QWORD v15[4];
  void (**v16)(_QWORD);
  uint64_t *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void (**)(_QWORD))a4;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v14 = v5;
  v25 = objc_msgSend(v5, "count");
  if (atomic_load((unint64_t *)v23 + 3))
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v19;
      v11 = MEMORY[0x1E0C809B0];
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v19 != v10)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          v15[0] = v11;
          v15[1] = 3221225472;
          v15[2] = __50__SGFuture_waitForFuturesToComplete_withCallback___block_invoke;
          v15[3] = &unk_1E4760188;
          v17 = &v22;
          v16 = v6;
          objc_msgSend(v13, "wait:", v15);

        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
      }
      while (v9);
    }

  }
  else
  {
    v6[2](v6);
  }
  _Block_object_dispose(&v22, 8);

}

- (void)setTargetQueue:(id)a3 useAfterCompletion:(BOOL)a4
{
  void *v7;
  void *v8;
  NSObject *queue;

  queue = a3;
  pthread_mutex_lock(&self->_lock);
  if (self->_isComplete)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGFuture.m"), 69, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_isComplete"), queue);

  }
  if (self->_timeoutTimer)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGFuture.m"), 70, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_timeoutTimer"));

  }
  dispatch_set_target_queue((dispatch_object_t)self->_callbacks, queue);
  self->_alwaysUseCallbacksQueue = a4;
  pthread_mutex_unlock(&self->_lock);

}

- (BOOL)fail:(id)a3
{
  return -[SGFuture _finishWithResult:orError:](self, "_finishWithResult:orError:", 0, a3);
}

- (id)completer
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __21__SGFuture_completer__block_invoke;
  v3[3] = &unk_1E47600B0;
  v3[4] = self;
  return (id)MEMORY[0x1A8583BFC](v3, a2);
}

- (void)setTimeout:(double)a3
{
  _opaque_pthread_mutex_t *p_lock;
  NSObject *timeoutTimer;
  NSObject *v7;
  OS_dispatch_source *v8;
  OS_dispatch_source *v9;
  NSObject *v10;
  NSObject *v11;
  dispatch_time_t v12;
  _QWORD v13[4];
  id v14;
  id location;

  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  if (self->_isComplete)
  {
    pthread_mutex_unlock(p_lock);
  }
  else
  {
    if (fabs(a3) == INFINITY)
    {
      -[SGFuture _clearTimeoutNonThreadSafe](self, "_clearTimeoutNonThreadSafe");
    }
    else
    {
      timeoutTimer = self->_timeoutTimer;
      if (timeoutTimer)
      {
        dispatch_suspend(timeoutTimer);
      }
      else
      {
        dispatch_get_global_queue(-2, 0);
        v7 = objc_claimAutoreleasedReturnValue();
        v8 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v7);
        v9 = self->_timeoutTimer;
        self->_timeoutTimer = v8;

        location = 0;
        objc_initWeak(&location, self);
        v10 = self->_timeoutTimer;
        v13[0] = MEMORY[0x1E0C809B0];
        v13[1] = 3221225472;
        v13[2] = __23__SGFuture_setTimeout___block_invoke;
        v13[3] = &unk_1E47627C8;
        objc_copyWeak(&v14, &location);
        dispatch_source_set_event_handler(v10, v13);
        objc_destroyWeak(&v14);
        objc_destroyWeak(&location);
      }
      v11 = self->_timeoutTimer;
      if (a3 <= 0.0)
      {
        v12 = 0;
      }
      else if (a3 <= 9223372040.0)
      {
        v12 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
      }
      else
      {
        v12 = -1;
      }
      dispatch_source_set_timer(v11, v12, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
      dispatch_resume((dispatch_object_t)self->_timeoutTimer);
    }
    pthread_mutex_unlock(p_lock);
  }
}

- (void)clearTimeout
{
  _opaque_pthread_mutex_t *p_lock;

  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  -[SGFuture _clearTimeoutNonThreadSafe](self, "_clearTimeoutNonThreadSafe");
  pthread_mutex_unlock(p_lock);
}

- (id)waitWithTimeout:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  dispatch_block_t v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v11[0] = self;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGFuture createAfter:onCreate:](SGFuture, "createAfter:onCreate:", v5, &__block_literal_global_29);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setTimeout:", a3);
  objc_msgSend(v6, "completer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGFuture wait:](self, "wait:", v7);

  if ((objc_msgSend(v6, "isComplete") & 1) == 0)
  {
    v8 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, &__block_literal_global_30);
    dispatch_async((dispatch_queue_t)self->_workQueue, v8);
    dispatch_block_wait(v8, objc_msgSend(MEMORY[0x1E0D81598], "dispatchTimeWithSecondsFromNow:", a3));

  }
  objc_msgSend(v6, "wait");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)disassociateFromParentObject
{
  id WeakRetained;
  id v4;
  SGFuture *v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_parentObject);
  if (WeakRetained)
  {
    v6 = WeakRetained;
    v4 = WeakRetained;
    objc_sync_enter(v4);
    objc_getAssociatedObject(v4, self->_parentObjectKey);
    v5 = (SGFuture *)objc_claimAutoreleasedReturnValue();
    if (v5 == self)
      objc_setAssociatedObject(v4, self->_parentObjectKey, 0, (void *)1);

    objc_sync_exit(v4);
    WeakRetained = v6;
  }

}

- (BOOL)isComplete
{
  return self->_isComplete;
}

void __23__SGFuture_setTimeout___block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("SGErrorDomain"), 10, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "fail:", v1);

}

uint64_t __21__SGFuture_completer__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeWithResult:error:", a2, a3);
}

uint64_t __29__SGFuture__wait_forSyncAPI___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

+ (id)createAfter:(id)a3 onCreate:(id)a4
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD block[4];
  id v16;
  id v17;
  id v18;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__SGFuture_createAfter_onCreate___block_invoke;
  block[3] = &unk_1E4760160;
  v16 = v5;
  v18 = v6;
  v9 = v7;
  v17 = v9;
  v10 = v6;
  v11 = v5;
  dispatch_sync(v8, block);

  v12 = v17;
  v13 = v9;

  return v13;
}

+ (id)createWithImmediateResult:(id)a3
{
  return (id)objc_msgSend(a1, "createWithImmediateResult:error:", a3, 0);
}

+ (id)createWithImmediateError:(id)a3
{
  return (id)objc_msgSend(a1, "createWithImmediateResult:error:", 0, a3);
}

void __33__SGFuture_createAfter_onCreate___block_invoke(uint64_t a1)
{
  uint64_t v2;
  _QWORD v3[4];
  id v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __33__SGFuture_createAfter_onCreate___block_invoke_2;
  v3[3] = &unk_1E4760260;
  v5 = *(id *)(a1 + 48);
  v4 = *(id *)(a1 + 40);
  +[SGFuture waitForFuturesToComplete:withCallback:](SGFuture, "waitForFuturesToComplete:withCallback:", v2, v3);

}

uint64_t __33__SGFuture_createAfter_onCreate___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __45__SGFuture_futureForObject_withKey_onCreate___block_invoke_32(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

@end
