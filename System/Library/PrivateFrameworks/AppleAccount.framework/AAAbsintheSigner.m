@implementation AAAbsintheSigner

+ (AAAbsintheSigner)sharedSigner
{
  if (sharedSigner_onceToken != -1)
    dispatch_once(&sharedSigner_onceToken, &__block_literal_global_5);
  return (AAAbsintheSigner *)(id)sharedSigner_sharedSigner;
}

void __32__AAAbsintheSigner_sharedSigner__block_invoke()
{
  AAAbsintheSigner *v0;
  void *v1;

  v0 = -[AAAbsintheSigner initWithCacheTimeout:]([AAAbsintheSigner alloc], "initWithCacheTimeout:", 540.0);
  v1 = (void *)sharedSigner_sharedSigner;
  sharedSigner_sharedSigner = (uint64_t)v0;

}

+ (id)_contextCreationBlock
{
  if (_contextCreationBlock_onceToken != -1)
    dispatch_once(&_contextCreationBlock_onceToken, &__block_literal_global_16);
  return (id)MEMORY[0x1A1AED7A0](_AAContextCreationBlock);
}

void __41__AAAbsintheSigner__contextCreationBlock__block_invoke()
{
  if (!_AAContextCreationBlock)
  {
    _AAContextCreationBlock = (uint64_t)&__block_literal_global_18;

  }
}

AAAbsintheContext *__41__AAAbsintheSigner__contextCreationBlock__block_invoke_2()
{
  return objc_alloc_init(AAAbsintheContext);
}

+ (void)_setContextCreationBlock:(id)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("AAAbsintheSigner.m"), 70, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("contextCreationBlock"));

  }
  v5 = MEMORY[0x1A1AED7A0]();
  v6 = (void *)_AAContextCreationBlock;
  _AAContextCreationBlock = v5;

}

- (AAAbsintheSigner)init
{
  return -[AAAbsintheSigner initWithCacheTimeout:](self, "initWithCacheTimeout:", 540.0);
}

- (AAAbsintheSigner)initWithCacheTimeout:(double)a3
{
  AAAbsintheSigner *v4;
  AAAbsintheSigner *v5;
  uint64_t v6;
  AAURLSession *session;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *contextQueue;
  AAAbsintheSignerContextCache *contextCache;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)AAAbsintheSigner;
  v4 = -[AAAbsintheSigner init](&v13, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_cacheTimeout = a3;
    +[AAURLSession sharedSession](AAURLSession, "sharedSession");
    v6 = objc_claimAutoreleasedReturnValue();
    session = v5->_session;
    v5->_session = (AAURLSession *)v6;

    v5->_contextLock._os_unfair_lock_opaque = 0;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create("com.apple.AppleAccount.NACQ", v8);
    contextQueue = v5->_contextQueue;
    v5->_contextQueue = (OS_dispatch_queue *)v9;

    contextCache = v5->_contextCache;
    v5->_contextCache = 0;

  }
  return v5;
}

- (void)dealloc
{
  os_unfair_lock_s *p_contextLock;
  objc_super v4;
  _QWORD v5[5];

  p_contextLock = &self->_contextLock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __27__AAAbsintheSigner_dealloc__block_invoke;
  v5[3] = &unk_1E416E3A8;
  v5[4] = self;
  os_unfair_lock_lock(&self->_contextLock);
  __27__AAAbsintheSigner_dealloc__block_invoke((uint64_t)v5);
  os_unfair_lock_unlock(p_contextLock);
  v4.receiver = self;
  v4.super_class = (Class)AAAbsintheSigner;
  -[AAAbsintheSigner dealloc](&v4, sel_dealloc);
}

void __27__AAAbsintheSigner_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  void *v4;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 24);
  if (v3)
  {
    dispatch_source_cancel(v3);
    v2 = *(_QWORD *)(a1 + 32);
  }
  v4 = *(void **)(v2 + 32);
  *(_QWORD *)(v2 + 32) = 0;

}

- (void)signatureForData:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AAAbsintheSigner.m"), 108, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __48__AAAbsintheSigner_signatureForData_completion___block_invoke;
  v12[3] = &unk_1E416E898;
  v13 = v7;
  v14 = v8;
  v9 = v8;
  v10 = v7;
  -[AAAbsintheSigner _contextWithCompletion:](self, "_contextWithCompletion:", v12);

}

void __48__AAAbsintheSigner_signatureForData_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;

  if (a2)
  {
    v3 = *(_QWORD *)(a1 + 32);
    v8 = 0;
    objc_msgSend(a2, "cao1NI5PNJBn:error:", v3, &v8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v8;
    if (v4)
    {
      v6 = v4;
      v7 = 0;
    }
    else
    {
      v6 = 0;
      v7 = v5;
    }
    (*(void (**)(_QWORD, void *, id))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v6, v7);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

- (AAAbsintheContext)context
{
  os_unfair_lock_s *p_contextLock;
  void *v3;
  _QWORD v5[5];

  p_contextLock = &self->_contextLock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __27__AAAbsintheSigner_context__block_invoke;
  v5[3] = &unk_1E416E8C0;
  v5[4] = self;
  os_unfair_lock_lock(&self->_contextLock);
  __27__AAAbsintheSigner_context__block_invoke((uint64_t)v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_contextLock);
  return (AAAbsintheContext *)v3;
}

uint64_t __27__AAAbsintheSigner_context__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_contextLock_contextInvalidatingIfNecessary");
}

- (id)_contextLock_contextInvalidatingIfNecessary
{
  void *v3;
  double v4;
  double v5;
  double v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  AAAbsintheSignerContextCache *contextCache;

  os_unfair_lock_assert_owner(&self->_contextLock);
  -[AAAbsintheSignerContextCache creationDate](self->_contextCache, "creationDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceNow");
  v5 = v4;
  v6 = -self->_cacheTimeout;

  if (v5 < v6)
  {
    _AALogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[AAAbsintheSigner _contextLock_contextInvalidatingIfNecessary].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);

    contextCache = self->_contextCache;
    self->_contextCache = 0;

    -[AAAbsintheSigner _contextLock_dequeueContextCleanup](self, "_contextLock_dequeueContextCleanup");
  }
  -[AAAbsintheSignerContextCache context](self->_contextCache, "context");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setContext:(id)a3
{
  id v4;
  os_unfair_lock_s *p_contextLock;
  id v6;
  _QWORD v7[4];
  id v8;
  AAAbsintheSigner *v9;

  v4 = a3;
  p_contextLock = &self->_contextLock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __31__AAAbsintheSigner_setContext___block_invoke;
  v7[3] = &unk_1E416E8E8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  os_unfair_lock_lock(p_contextLock);
  __31__AAAbsintheSigner_setContext___block_invoke((uint64_t)v7);
  os_unfair_lock_unlock(p_contextLock);

}

uint64_t __31__AAAbsintheSigner_setContext___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v6;
  void *v7;

  if (*(_QWORD *)(a1 + 32))
  {
    +[AAAbsintheSignerContextCache cacheWithContext:](AAAbsintheSignerContextCache, "cacheWithContext:");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(a1 + 40);
    v4 = *(void **)(v3 + 32);
    *(_QWORD *)(v3 + 32) = v2;

    return objc_msgSend(*(id *)(a1 + 40), "_contextLock_enqueueContextCleanup");
  }
  else
  {
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(void **)(v6 + 32);
    *(_QWORD *)(v6 + 32) = 0;

    return objc_msgSend(*(id *)(a1 + 40), "_contextLock_dequeueContextCleanup");
  }
}

- (void)_contextLock_enqueueContextCleanup
{
  NSObject *contextTimerSource;
  OS_dispatch_source *v4;
  OS_dispatch_source *v5;
  NSObject *v6;
  double v7;
  dispatch_time_t v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  id location;

  os_unfair_lock_assert_owner(&self->_contextLock);
  contextTimerSource = self->_contextTimerSource;
  if (contextTimerSource)
    dispatch_source_cancel(contextTimerSource);
  objc_initWeak(&location, self);
  v4 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_contextQueue);
  v5 = self->_contextTimerSource;
  self->_contextTimerSource = v4;

  v6 = self->_contextTimerSource;
  -[AAAbsintheSigner cacheTimeout](self, "cacheTimeout");
  v8 = dispatch_walltime(0, (uint64_t)(v7 * 1000000000.0));
  dispatch_source_set_timer(v6, v8, 0xFFFFFFFFFFFFFFFFLL, 0);
  v9 = self->_contextTimerSource;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __54__AAAbsintheSigner__contextLock_enqueueContextCleanup__block_invoke;
  v10[3] = &unk_1E416E358;
  objc_copyWeak(&v11, &location);
  dispatch_source_set_event_handler(v9, v10);
  dispatch_resume((dispatch_object_t)self->_contextTimerSource);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __54__AAAbsintheSigner__contextLock_enqueueContextCleanup__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id WeakRetained;

  _AALogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __54__AAAbsintheSigner__contextLock_enqueueContextCleanup__block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setContext:", 0);

}

- (void)_contextLock_dequeueContextCleanup
{
  NSObject *contextTimerSource;
  OS_dispatch_source *v4;

  os_unfair_lock_assert_owner(&self->_contextLock);
  contextTimerSource = self->_contextTimerSource;
  if (contextTimerSource)
  {
    dispatch_source_cancel(contextTimerSource);
    v4 = self->_contextTimerSource;
    self->_contextTimerSource = 0;

  }
}

- (void)_contextWithCompletion:(id)a3
{
  void (**v5)(id, void *, _QWORD);
  void *v6;
  NSObject *contextQueue;
  void *v8;
  _QWORD block[5];
  void (**v10)(id, void *, _QWORD);

  v5 = (void (**)(id, void *, _QWORD))a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AAAbsintheSigner.m"), 206, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  -[AAAbsintheSigner context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v5[2](v5, v6, 0);
  }
  else
  {
    contextQueue = self->_contextQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __43__AAAbsintheSigner__contextWithCompletion___block_invoke;
    block[3] = &unk_1E416E4C8;
    block[4] = self;
    v10 = v5;
    dispatch_async(contextQueue, block);

  }
}

uint64_t __43__AAAbsintheSigner__contextWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_contextQueue_contextWithCompletion:", *(_QWORD *)(a1 + 40));
}

- (void)_contextQueue_contextWithCompletion:(id)a3
{
  void (**v5)(id, void *, _QWORD);
  void *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  void (**v15)(id, void *, _QWORD);
  void *v16;
  id v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  void (**v21)(id, void *, _QWORD);
  _QWORD v22[5];
  id v23;
  os_signpost_id_t v24;
  uint64_t v25;
  uint8_t buf[4];
  os_signpost_id_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(id, void *, _QWORD))a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AAAbsintheSigner.m"), 219, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_contextQueue);
  -[AAAbsintheSigner context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v5[2](v5, v6, 0);
  }
  else
  {
    _AASignpostLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = _AASignpostCreate(v7);
    v10 = v9;

    _AASignpostLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_19EACA000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v8, "InitializeAbsinthe", " enableTelemetry=YES ", buf, 2u);
    }

    _AASignpostLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v27 = v8;
      _os_log_impl(&dword_19EACA000, v13, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: InitializeAbsinthe  enableTelemetry=YES ", buf, 0xCu);
    }

    v14 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __56__AAAbsintheSigner__contextQueue_contextWithCompletion___block_invoke;
    v22[3] = &unk_1E416E910;
    v24 = v8;
    v25 = v10;
    v22[4] = self;
    v15 = v5;
    v23 = v15;
    v16 = (void *)MEMORY[0x1A1AED7A0](v22);
    dispatch_suspend((dispatch_object_t)self->_contextQueue);
    v19[0] = v14;
    v19[1] = 3221225472;
    v19[2] = __56__AAAbsintheSigner__contextQueue_contextWithCompletion___block_invoke_38;
    v19[3] = &unk_1E416E960;
    v19[4] = self;
    v20 = v16;
    v21 = v15;
    v17 = v16;
    -[AAAbsintheSigner _fetchCertificateDataWithCompletion:](self, "_fetchCertificateDataWithCompletion:", v19);

  }
}

void __56__AAAbsintheSigner__contextQueue_contextWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  unint64_t Nanoseconds;
  NSObject *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  void *v14;
  NSObject *v15;
  double v16;
  uint64_t v17;
  void *v18;
  int v19;
  NSObject *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  int v30;
  uint64_t v31;
  __int16 v32;
  double v33;
  __int16 v34;
  int v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v5;
  v8 = v6;
  if ((v7 != 0) != (v8 == 0))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Invalid exclusivity not satisfying: context ^ error"), 0);
    v29 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v29);
  }
  v9 = v8;

  Nanoseconds = _AASignpostGetNanoseconds(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  _AASignpostLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  v13 = *(_QWORD *)(a1 + 48);
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    _AAErrorUnderlyingError(v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 67240192;
    LODWORD(v31) = objc_msgSend(v14, "code");
    _os_signpost_emit_with_name_impl(&dword_19EACA000, v12, OS_SIGNPOST_INTERVAL_END, v13, "InitializeAbsinthe", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v30, 8u);

  }
  _AASignpostLogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = (double)Nanoseconds / 1000000000.0;
    v17 = *(_QWORD *)(a1 + 48);
    _AAErrorUnderlyingError(v9);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "code");
    v30 = 134218496;
    v31 = v17;
    v32 = 2048;
    v33 = v16;
    v34 = 1026;
    v35 = v19;
    _os_log_impl(&dword_19EACA000, v15, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: InitializeAbsinthe  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v30, 0x1Cu);

  }
  _AALogSystem();
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v7)
  {
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      __56__AAAbsintheSigner__contextQueue_contextWithCompletion___block_invoke_cold_1(v21, v22, v23, v24, v25, v26, v27, v28);

    objc_msgSend(*(id *)(a1 + 32), "setContext:", v7);
  }
  else
  {
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      __56__AAAbsintheSigner__contextQueue_contextWithCompletion___block_invoke_cold_2((uint64_t)v9, v21);

  }
  dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 16));
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __56__AAAbsintheSigner__contextQueue_contextWithCompletion___block_invoke_38(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void (**v8)(void);
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    +[AAAbsintheSigner _contextCreationBlock](AAAbsintheSigner, "_contextCreationBlock");
    v8 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v8[2]();
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = 0;
    objc_msgSend(v9, "TgBfoO2wtF5L:error:", v5, &v18);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v18;
    if (v10)
    {
      v12 = *(void **)(a1 + 32);
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __56__AAAbsintheSigner__contextQueue_contextWithCompletion___block_invoke_2;
      v15[3] = &unk_1E416E938;
      v16 = v9;
      v17 = *(id *)(a1 + 40);
      objc_msgSend(v12, "_fetchSessionInfoWithRequestInfo:completion:", v10, v15);

    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }

  }
  else if (v6)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v13 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB35C8], "aa_errorWithCode:", -4402);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v13 + 16))(v13, 0, v14);

  }
}

void __56__AAAbsintheSigner__contextQueue_contextWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;
  id v5;

  if (a2)
  {
    v3 = *(void **)(a1 + 32);
    v5 = 0;
    objc_msgSend(v3, "R6XtwiyjL3q2:error:", a2, &v5);
    v4 = v5;
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

- (void)_fetchCertificateDataWithCompletion:(id)a3
{
  id v4;
  void *v5;
  AAURLSession *session;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E98], "aa_URLWithEndpoint:", CFSTR("qualifyCert"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  session = self->_session;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __56__AAAbsintheSigner__fetchCertificateDataWithCompletion___block_invoke;
  v9[3] = &unk_1E416E988;
  v10 = v4;
  v7 = v4;
  -[AAURLSession dataTaskWithURL:completion:](session, "dataTaskWithURL:completion:", v5, v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "resume");

}

void __56__AAAbsintheSigner__fetchCertificateDataWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a2;
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    objc_opt_class();
    v10 = v7;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;

    if (objc_msgSend(v11, "statusCode") == 200)
    {
      v13 = *(_QWORD *)(a1 + 32);
      if (v16)
      {
        (*(void (**)(uint64_t, id, _QWORD))(v13 + 16))(v13, v16, 0);
LABEL_12:

        goto LABEL_13;
      }
    }
    else
    {
      v13 = *(_QWORD *)(a1 + 32);
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "aa_errorWithCode:underlyingError:", -4402, v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v13 + 16))(v13, 0, v14);

    goto LABEL_12;
  }
  v12 = *(_QWORD *)(a1 + 32);
  if (v8)
  {
    (*(void (**)(_QWORD, _QWORD, id))(v12 + 16))(*(_QWORD *)(a1 + 32), 0, v8);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "aa_errorWithCode:", -4402);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v12 + 16))(v12, 0, v15);

  }
LABEL_13:

}

- (void)_fetchSessionInfoWithRequestInfo:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  AAURLSession *session;
  id v13;
  void *v14;
  _QWORD v15[4];
  id v16;

  v6 = a4;
  v7 = (void *)MEMORY[0x1E0C99E98];
  v8 = a3;
  objc_msgSend(v7, "aa_URLWithEndpoint:", CFSTR("qualifySession"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C92C28]), "initWithURL:", v9);
  objc_msgSend(v8, "base64EncodedStringWithOptions:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setValue:forHTTPHeaderField:", v11, CFSTR("X-MMe-Nas-Session"));
  session = self->_session;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __64__AAAbsintheSigner__fetchSessionInfoWithRequestInfo_completion___block_invoke;
  v15[3] = &unk_1E416E9B0;
  v16 = v6;
  v13 = v6;
  -[AAURLSession bodyTaskWithRequest:completion:](session, "bodyTaskWithRequest:completion:", v10, v15);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "resume");

}

void __64__AAAbsintheSigner__fetchSessionInfoWithRequestInfo_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;

  v6 = a2;
  v7 = a4;
  objc_opt_class();
  v16 = v6;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_6:
    v10 = *(_QWORD *)(a1 + 32);
    if (v7)
    {
      (*(void (**)(uint64_t, _QWORD, id))(v10 + 16))(v10, 0, v7);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "aa_errorWithCode:", -4402);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v10 + 16))(v10, 0, v11);

    }
    goto LABEL_17;
  }
  if (!v16)
    goto LABEL_6;
  objc_opt_class();
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("session-info"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;

  if (v9)
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v9, 0);
    v13 = *(_QWORD *)(a1 + 32);
    if (v12)
    {
      (*(void (**)(uint64_t, void *, _QWORD))(v13 + 16))(v13, v12, 0);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "aa_errorWithCode:underlyingError:", -4402, v7);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v13 + 16))(v13, 0, v15);

    }
  }
  else
  {
    v14 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB35C8], "aa_errorWithCode:underlyingError:", -4402, v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v14 + 16))(v14, 0, v12);
  }

LABEL_17:
}

- (double)cacheTimeout
{
  return self->_cacheTimeout;
}

- (AAURLSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
  objc_storeStrong((id *)&self->_session, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_contextCache, 0);
  objc_storeStrong((id *)&self->_contextTimerSource, 0);
  objc_storeStrong((id *)&self->_contextQueue, 0);
}

- (void)_contextLock_contextInvalidatingIfNecessary
{
  OUTLINED_FUNCTION_0_2(&dword_19EACA000, a1, a3, "NAC context expired, clearing context...", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void __54__AAAbsintheSigner__contextLock_enqueueContextCleanup__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_19EACA000, a1, a3, "NAC timer fired, clearing context...", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void __56__AAAbsintheSigner__contextQueue_contextWithCompletion___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_19EACA000, a1, a3, "Successfully initialized NAC session", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void __56__AAAbsintheSigner__contextQueue_contextWithCompletion___block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_19EACA000, a2, OS_LOG_TYPE_ERROR, "Failed to initialize NAC session, error: %@", (uint8_t *)&v2, 0xCu);
}

@end
