@implementation BSBlockSentinel

- (BOOL)signal
{
  return -[BSBlockSentinel signalWithContext:](self, "signalWithContext:", 0);
}

- (void)dealloc
{
  os_unfair_lock_s *p_lock;
  void (**v4)(_QWORD, _QWORD);
  unint64_t lock_signalCount;
  unint64_t lock_expectedSignals;
  NSObject *v7;
  OS_dispatch_queue *explicitQueue;
  id v9;
  OS_dispatch_queue *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  BSBlockSentinelSignalContext *v14;
  BSBlockSentinelSignalContext *v15;
  NSString *v16;
  NSString *lock_identifier;
  objc_super v18;
  __int128 block;
  void (*v20)(uint64_t);
  void *v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void (**)(_QWORD, _QWORD))MEMORY[0x18D769CFC](self->_lock_handler);
  lock_signalCount = self->_lock_signalCount;
  lock_expectedSignals = self->_lock_expectedSignals;
  if (lock_expectedSignals)
  {
    if (lock_signalCount < lock_expectedSignals)
    {
LABEL_3:
      BSLogCommon();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        lock_identifier = self->_lock_identifier;
        LODWORD(block) = 138543362;
        *(_QWORD *)((char *)&block + 4) = lock_identifier;
        _os_log_error_impl(&dword_18A184000, v7, OS_LOG_TYPE_ERROR, "[BSBlockSentinel:%{public}@] failed!", (uint8_t *)&block, 0xCu);
      }

      os_unfair_lock_unlock(p_lock);
      explicitQueue = self->_explicitQueue;
      v9 = v4;
      v10 = explicitQueue;
      v11 = v10;
      if (v9)
      {
        if (!v10
          || v10 == (OS_dispatch_queue *)MEMORY[0x1E0C80D38]
          && objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
        {
          +[BSBlockSentinelSignalContext failureContext]();
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          (*((void (**)(id, void *))v9 + 2))(v9, v12);
        }
        else
        {
          *(_QWORD *)&block = MEMORY[0x1E0C809B0];
          *((_QWORD *)&block + 1) = 3221225472;
          v20 = __BSBlockSentinelFireFailureHandler_block_invoke;
          v21 = &unk_1E1EBF738;
          v22 = v9;
          dispatch_async(v11, &block);
          v12 = v22;
        }

      }
      goto LABEL_20;
    }
  }
  else if (!lock_signalCount)
  {
    goto LABEL_3;
  }
  BSLogCommon();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v16 = self->_lock_identifier;
    LODWORD(block) = 138412290;
    *(_QWORD *)((char *)&block + 4) = v16;
    _os_log_debug_impl(&dword_18A184000, v13, OS_LOG_TYPE_DEBUG, "[BSBlockSentinel:%@] dealloc", (uint8_t *)&block, 0xCu);
  }

  os_unfair_lock_unlock(p_lock);
  if (!lock_expectedSignals)
  {
    v14 = objc_alloc_init(BSBlockSentinelSignalContext);
    v15 = v14;
    if (v14)
      v14->_complete = 1;
    ((void (**)(_QWORD, BSBlockSentinelSignalContext *))v4)[2](v4, v14);

  }
LABEL_20:

  v18.receiver = self;
  v18.super_class = (Class)BSBlockSentinel;
  -[BSBlockSentinel dealloc](&v18, sel_dealloc);
}

- (BOOL)signalWithContext:(id)a3
{
  id v5;
  OS_dispatch_queue *explicitQueue;
  unint64_t lock_expectedSignals;
  unint64_t v8;
  NSObject *v9;
  NSObject *v10;
  BOOL v11;
  unint64_t v12;
  unint64_t v13;
  void (**v14)(_QWORD, _QWORD);
  BOOL v15;
  BSBlockSentinelSignalContext *v16;
  BSBlockSentinelSignalContext *v17;
  id v18;
  BSBlockSentinelSignalContext *v19;
  id lock_handler;
  NSString *lock_identifier;
  unint64_t v23;
  unint64_t lock_signalCount;
  NSString *v25;
  unint64_t v26;
  unint64_t v27;
  id v28;
  int v29;
  NSString *v30;
  __int16 v31;
  unint64_t v32;
  __int16 v33;
  unint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  explicitQueue = self->_explicitQueue;
  if (explicitQueue)
    BSDispatchQueueAssert(explicitQueue);
  os_unfair_lock_lock(&self->_lock);
  lock_expectedSignals = self->_lock_expectedSignals;
  v8 = self->_lock_signalCount + 1;
  self->_lock_signalCount = v8;
  BSLogCommon();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (lock_expectedSignals && v8 > lock_expectedSignals)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v23 = self->_lock_expectedSignals;
      lock_identifier = self->_lock_identifier;
      lock_signalCount = self->_lock_signalCount;
      v29 = 138543874;
      v30 = lock_identifier;
      v31 = 2048;
      v32 = lock_signalCount;
      v33 = 2048;
      v34 = v23;
      _os_log_error_impl(&dword_18A184000, v10, OS_LOG_TYPE_ERROR, "[BSBlockSentinel:%{public}@] unexpected signal! %lu of %lu", (uint8_t *)&v29, 0x20u);
    }

    os_unfair_lock_unlock(&self->_lock);
    v11 = 0;
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v26 = self->_lock_expectedSignals;
      v25 = self->_lock_identifier;
      v27 = self->_lock_signalCount;
      v29 = 138412802;
      v30 = v25;
      v31 = 2048;
      v32 = v27;
      v33 = 2048;
      v34 = v26;
      _os_log_debug_impl(&dword_18A184000, v10, OS_LOG_TYPE_DEBUG, "[BSBlockSentinel:%@] signaled! %lu of %lu", (uint8_t *)&v29, 0x20u);
    }

    v13 = self->_lock_signalCount;
    v12 = self->_lock_expectedSignals;
    v11 = v13 == v12;
    v14 = (void (**)(_QWORD, _QWORD))MEMORY[0x18D769CFC](self->_lock_handler);
    v15 = v13 != v12;
    if (v5)
      v15 = 0;
    if (v15)
    {
      v19 = 0;
    }
    else
    {
      v16 = objc_alloc_init(BSBlockSentinelSignalContext);
      v17 = v16;
      if (v16)
      {
        v16->_complete = v13 == v12;
        v18 = v5;
        objc_storeStrong(&v17->_context, a3);
      }
      else
      {
        v28 = v5;
      }

      v19 = v17;
    }
    if (v13 == v12)
    {
      lock_handler = self->_lock_handler;
      self->_lock_handler = 0;

    }
    os_unfair_lock_unlock(&self->_lock);
    if (v14)
      ((void (**)(_QWORD, BSBlockSentinelSignalContext *))v14)[2](v14, v19);

  }
  return v11;
}

+ (id)sentinelWithCompletion:(id)a3
{
  id v3;
  void **v4;

  v3 = a3;
  v4 = -[BSBlockSentinel initWithCount:queue:block:]((void **)[BSBlockSentinel alloc], (void *)1, 0, v3);

  return v4;
}

+ (id)sentinelWithSignalCount:(unint64_t)a3 signalHandler:(id)a4
{
  id v7;
  void **v8;
  void *v10;
  id v11;
  objc_class *v12;
  void *v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  const __CFString *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("count > 0"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v15 = v11;
      v16 = 2114;
      v17 = v13;
      v18 = 2048;
      v19 = a1;
      v20 = 2114;
      v21 = CFSTR("BSBlockSentinel.m");
      v22 = 1024;
      v23 = 129;
      v24 = 2114;
      v25 = v10;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
    __break(0);
    JUMPOUT(0x18A1983C4);
  }
  v8 = -[BSBlockSentinel initWithCount:queue:block:]((void **)[BSBlockSentinel alloc], (void *)a3, 0, v7);

  return v8;
}

- (void)initWithCount:(void *)a3 queue:(void *)a4 block:
{
  id v8;
  id v9;
  void *v10;
  void **v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void **v19;
  uint64_t v20;
  void *v21;
  void *v23;
  id v24;
  objc_class *v25;
  void *v26;
  objc_super v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void **v33;
  __int16 v34;
  const __CFString *v35;
  __int16 v36;
  int v37;
  __int16 v38;
  void *v39;
  uint64_t v40;
  uint64_t vars0;

  v40 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (a1)
  {
    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("block"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel_initWithCount_queue_block_);
        v24 = (id)objc_claimAutoreleasedReturnValue();
        v25 = (objc_class *)objc_opt_class();
        NSStringFromClass(v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v29 = v24;
        v30 = 2114;
        v31 = v26;
        v32 = 2048;
        v33 = a1;
        v34 = 2114;
        v35 = CFSTR("BSBlockSentinel.m");
        v36 = 1024;
        v37 = 138;
        v38 = 2114;
        v39 = v23;
        _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v23), "UTF8String");
      __break(0);
      JUMPOUT(0x18A19866CLL);
    }
    v27.receiver = a1;
    v27.super_class = (Class)BSBlockSentinel;
    v11 = (void **)objc_msgSendSuper2(&v27, sel_init);
    a1 = v11;
    if (v11)
    {
      *((_DWORD *)v11 + 2) = 0;
      objc_storeStrong(v11 + 6, a3);
      v12 = objc_msgSend(v10, "copy");
      v13 = a1[2];
      a1[2] = (void *)v12;

      a1[3] = 0;
      a1[4] = a2;
      BSStackFrameInfoForAddresss(*(const void **)(vars0 + 8));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "className");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v15)
      {
        v17 = v15;
      }
      else
      {
        objc_msgSend(v14, "executableName");
        v17 = (id)objc_claimAutoreleasedReturnValue();
      }
      v19 = a1 + 5;
      v18 = a1[5];
      a1[5] = v17;

      if (!a1[5])
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%p"), a1);
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = *v19;
        *v19 = (void *)v20;

      }
    }
  }

  return a1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_explicitQueue, 0);
  objc_storeStrong((id *)&self->_lock_identifier, 0);
  objc_storeStrong(&self->_lock_handler, 0);
}

+ (id)sentinelWithQueue:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  BSBlockSentinel *v7;
  id v8;
  void **v9;
  _QWORD v11[4];
  id v12;

  v5 = a3;
  v6 = a4;
  v7 = [BSBlockSentinel alloc];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __48__BSBlockSentinel_sentinelWithQueue_completion___block_invoke;
  v11[3] = &unk_1E1EBF6E8;
  v8 = v6;
  v12 = v8;
  v9 = -[BSBlockSentinel initWithCount:queue:block:]((void **)&v7->super.isa, (void *)1, v5, v11);

  return v9;
}

void __48__BSBlockSentinel_sentinelWithQueue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "isComplete"))
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

+ (id)sentinelWithQueue:(id)a3 signalCount:(unint64_t)a4 completion:(id)a5
{
  id v9;
  id v10;
  BSBlockSentinel *v11;
  id v12;
  void **v13;
  void *v15;
  id v16;
  objc_class *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  const __CFString *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  if (!a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("count > 0"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v16 = (id)objc_claimAutoreleasedReturnValue();
      v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v22 = v16;
      v23 = 2114;
      v24 = v18;
      v25 = 2048;
      v26 = a1;
      v27 = 2114;
      v28 = CFSTR("BSBlockSentinel.m");
      v29 = 1024;
      v30 = 88;
      v31 = 2114;
      v32 = v15;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v15), "UTF8String");
    __break(0);
    JUMPOUT(0x18A1F6BE0);
  }
  v11 = [BSBlockSentinel alloc];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __60__BSBlockSentinel_sentinelWithQueue_signalCount_completion___block_invoke;
  v19[3] = &unk_1E1EBF6E8;
  v12 = v10;
  v20 = v12;
  v13 = -[BSBlockSentinel initWithCount:queue:block:]((void **)&v11->super.isa, (void *)a4, v9, v19);

  return v13;
}

void __60__BSBlockSentinel_sentinelWithQueue_signalCount_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  if (objc_msgSend(v4, "isComplete"))
  {
    v3 = *(_QWORD *)(a1 + 32);
    if (v3)
      (*(void (**)(void))(v3 + 16))();
  }

}

+ (id)sentinelWithQueue:(id)a3 signalHandler:(id)a4
{
  id v5;
  id v6;
  void **v7;

  v5 = a3;
  v6 = a4;
  v7 = -[BSBlockSentinel initWithCount:queue:block:]((void **)[BSBlockSentinel alloc], (void *)1, v5, v6);

  return v7;
}

+ (id)sentinelWithQueue:(id)a3 signalCount:(unint64_t)a4 signalHandler:(id)a5
{
  id v9;
  id v10;
  void **v11;
  void *v13;
  id v14;
  objc_class *v15;
  void *v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  const __CFString *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  if (!a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("count > 0"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v14 = (id)objc_claimAutoreleasedReturnValue();
      v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v18 = v14;
      v19 = 2114;
      v20 = v16;
      v21 = 2048;
      v22 = a1;
      v23 = 2114;
      v24 = CFSTR("BSBlockSentinel.m");
      v25 = 1024;
      v26 = 103;
      v27 = 2114;
      v28 = v13;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v13), "UTF8String");
    __break(0);
    JUMPOUT(0x18A1F6EB0);
  }
  v11 = -[BSBlockSentinel initWithCount:queue:block:]((void **)[BSBlockSentinel alloc], (void *)a4, v9, v10);

  return v11;
}

+ (id)sentinelWithExceptionReason:(id)a3
{
  objc_msgSend(a1, "sentinelWithSignalCount:exceptionReason:", 1, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)sentinelWithSignalCount:(unint64_t)a3 exceptionReason:(id)a4
{
  id v7;
  void **v8;
  id v9;
  void **v10;
  void *v12;
  id v13;
  objc_class *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  const __CFString *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("count > 0"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v19 = v13;
      v20 = 2114;
      v21 = v15;
      v22 = 2048;
      v23 = a1;
      v24 = 2114;
      v25 = CFSTR("BSBlockSentinel.m");
      v26 = 1024;
      v27 = 112;
      v28 = 2114;
      v29 = v12;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
    __break(0);
    JUMPOUT(0x18A1F70F4);
  }
  v8 = (void **)objc_alloc((Class)a1);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __59__BSBlockSentinel_sentinelWithSignalCount_exceptionReason___block_invoke;
  v16[3] = &unk_1E1EBF710;
  v9 = v7;
  v17 = v9;
  v10 = -[BSBlockSentinel initWithCount:queue:block:](v8, (void *)a3, 0, v16);

  return v10;
}

void __59__BSBlockSentinel_sentinelWithSignalCount_exceptionReason___block_invoke(uint64_t a1, void *a2)
{
  const __CFString *v3;
  const __CFString *v4;
  __CFString *v5;

  if (objc_msgSend(a2, "isFailed"))
  {
    v3 = (const __CFString *)*(id *)(a1 + 32);
    if (v3)
      v4 = v3;
    else
      v4 = CFSTR("sentinel deallocated without being signaled");
    v5 = (__CFString *)v4;
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("%@"), v4);

  }
}

+ (id)sentinelWithSignalHandler:(id)a3
{
  id v3;
  void **v4;

  v3 = a3;
  v4 = -[BSBlockSentinel initWithCount:queue:block:]((void **)[BSBlockSentinel alloc], 0, 0, v3);

  return v4;
}

- (void)setIdentifier:(id)a3
{
  NSString *v4;
  NSString *lock_identifier;
  id v6;

  v6 = a3;
  os_unfair_lock_lock(&self->_lock);
  v4 = (NSString *)objc_msgSend(v6, "copy");
  lock_identifier = self->_lock_identifier;
  self->_lock_identifier = v4;

  os_unfair_lock_unlock(&self->_lock);
}

@end
