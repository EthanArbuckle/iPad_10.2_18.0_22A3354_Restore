@implementation FBSApplicationPlaceholderProgress

- (FBSApplicationPlaceholderProgress)initWithPlaceholder:(id)a3 queue:(id)a4
{
  id v7;
  id v8;
  void *v9;
  FBSApplicationPlaceholderProgress *v10;
  FBSApplicationPlaceholderProgress *v11;
  void *v13;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("placeholder"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSApplicationPlaceholderProgress initWithPlaceholder:queue:].cold.1(a2);
LABEL_11:
    objc_msgSend(objc_retainAutorelease(v13), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A729598);
  }
  v9 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("queue"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSApplicationPlaceholderProgress initWithPlaceholder:queue:].cold.2(a2);
    goto LABEL_11;
  }
  v10 = -[FBSApplicationPlaceholderProgress init](self, "init");
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_placeholder, v7);
    objc_storeStrong((id *)&v11->_queue, a4);
    v11->_invalidated = 0;
    v11->_percentComplete = -1.0;
    v11->_installPhase = 0x7FFFFFFFFFFFFFFFLL;
    v11->_installState = 0x7FFFFFFFFFFFFFFFLL;
    v11->_expectedFinalInstallPhase = 0x7FFFFFFFFFFFFFFFLL;
    *(_OWORD *)&v11->_cancellationAllowed = xmmword_19A767F70;
  }

  return v11;
}

- (void)dealloc
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
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

void __44__FBSApplicationPlaceholderProgress_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = 0;

}

- (int64_t)state
{
  NSObject *queue;
  int64_t v3;
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
  v5[2] = __42__FBSApplicationPlaceholderProgress_state__block_invoke;
  v5[3] = &unk_1E38EB928;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __42__FBSApplicationPlaceholderProgress_state__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 40);
  return result;
}

- (double)percentComplete
{
  NSObject *queue;
  double v3;
  _QWORD v5[6];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__FBSApplicationPlaceholderProgress_percentComplete__block_invoke;
  v5[3] = &unk_1E38EB928;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

double __52__FBSApplicationPlaceholderProgress_percentComplete__block_invoke(uint64_t a1)
{
  double result;

  result = *(double *)(*(_QWORD *)(a1 + 32) + 48);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (unint64_t)installState
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
  v9 = 0x7FFFFFFFFFFFFFFFLL;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49__FBSApplicationPlaceholderProgress_installState__block_invoke;
  v5[3] = &unk_1E38EB928;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __49__FBSApplicationPlaceholderProgress_installState__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 64);
  return result;
}

- (unint64_t)installPhase
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
  v9 = 0x7FFFFFFFFFFFFFFFLL;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49__FBSApplicationPlaceholderProgress_installPhase__block_invoke;
  v5[3] = &unk_1E38EB928;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __49__FBSApplicationPlaceholderProgress_installPhase__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 56);
  return result;
}

- (unint64_t)expectedFinalInstallPhase
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
  v9 = 0x7FFFFFFFFFFFFFFFLL;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __62__FBSApplicationPlaceholderProgress_expectedFinalInstallPhase__block_invoke;
  v5[3] = &unk_1E38EB928;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __62__FBSApplicationPlaceholderProgress_expectedFinalInstallPhase__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 72);
  return result;
}

- (void)invalidate
{
  NSObject *queue;
  _QWORD block[5];

  if (BSAtomicSetFlag())
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __47__FBSApplicationPlaceholderProgress_invalidate__block_invoke;
    block[3] = &unk_1E38EAE78;
    block[4] = self;
    dispatch_async(queue, block);
  }
}

id __47__FBSApplicationPlaceholderProgress_invalidate__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "queue_updateProxy:", 0);
  return objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 80), 0);
}

- (NSString)description
{
  return (NSString *)-[FBSApplicationPlaceholderProgress descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[FBSApplicationPlaceholderProgress succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  unint64_t v4;
  const __CFString *v5;
  id v6;
  id v7;

  objc_msgSend(off_1E38E9DF0, "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[FBSApplicationPlaceholderProgress state](self, "state");
  if (v4 > 6)
    v5 = CFSTR("(unknown)");
  else
    v5 = (const __CFString *)*((_QWORD *)&off_1E38ED048 + v4);
  v6 = (id)objc_msgSend(v3, "appendObject:withName:", v5, CFSTR("state"));
  -[FBSApplicationPlaceholderProgress percentComplete](self, "percentComplete");
  v7 = (id)objc_msgSend(v3, "appendDouble:withName:decimalPrecision:", CFSTR("percentComplete"), 2);
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[FBSApplicationPlaceholderProgress descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  -[FBSApplicationPlaceholderProgress succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  FBSStringForInstallState(-[FBSApplicationPlaceholderProgress installState](self, "installState"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v4, "appendObject:withName:", v5, CFSTR("LSInstallState"));

  FBSStringForInstallPhase(-[FBSApplicationPlaceholderProgress installPhase](self, "installPhase"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v4, "appendObject:withName:", v7, CFSTR("LSInstallPhase"));

  return v4;
}

- (BOOL)_queue_updateFromProgress
{
  id WeakRetained;
  void *v4;
  NSProgress *progress;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  uint64_t v11;
  int IsZero;
  NSObject *v13;
  int64_t *p_state;
  uint64_t *p_installPhase;
  uint64_t *p_installState;
  unint64_t installState;
  BOOL v18;
  NSObject *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  __CFString *v24;
  double v25;
  int v26;
  void *v27;
  __int16 v28;
  const __CFString *v29;
  __int16 v30;
  double v31;
  __int16 v32;
  double v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  BSDispatchQueueAssert();
  WeakRetained = objc_loadWeakRetained((id *)&self->_placeholder);
  objc_msgSend(WeakRetained, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  progress = self->_progress;
  if (progress)
  {
    v6 = -[NSProgress installState](progress, "installState");
    v7 = -[NSProgress installPhase](self->_progress, "installPhase");
    v8 = -[NSProgress ls_expectedFinalInstallPhase](self->_progress, "ls_expectedFinalInstallPhase");
    -[NSProgress fractionCompleted](self->_progress, "fractionCompleted");
    if (v9 <= 1.0)
      v10 = v9;
    else
      v10 = 1.0;
    if ((unint64_t)(v6 - 3) >= 2)
    {
      if (v6 == 2)
      {
        v11 = 2;
      }
      else if (v6 == 5 && (BSFloatIsOne() & 1) != 0)
      {
        v6 = 5;
        v11 = 6;
      }
      else if ((v7 & 0xFFFFFFFFFFFFFFFBLL) != 0)
      {
        if ((unint64_t)(v7 - 1) >= 2)
        {
          if (v7 == 3)
          {
            v11 = 3;
          }
          else
          {
            FBSLogApplicationPlaceholder();
            v13 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            {
              FBSStringForInstallState(v6);
              v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
              FBSStringForInstallPhase(v7);
              v25 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
              v26 = 138413058;
              v27 = v4;
              v28 = 2112;
              v29 = v24;
              v30 = 2112;
              v31 = v25;
              v32 = 2048;
              v33 = v10;
              _os_log_error_impl(&dword_19A6D4000, v13, OS_LOG_TYPE_ERROR, "Unable to determine progress state for %@ from LSInstallState=%@, LSInstallPhase=%@, and progress=%.2f", (uint8_t *)&v26, 0x2Au);

            }
            v11 = 0;
          }
        }
        else
        {
          v11 = 5;
        }
      }
      else
      {
        IsZero = BSFloatIsZero();
        v11 = 3;
        if (!IsZero)
          v11 = 4;
      }
    }
    else
    {
      v11 = 1;
    }
  }
  else
  {
    v11 = 0;
    v6 = 0x7FFFFFFFFFFFFFFFLL;
    v8 = 0x7FFFFFFFFFFFFFFFLL;
    v10 = -1.0;
    v7 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (self->_percentComplete == v10
    && (p_state = &self->_state, self->_state == v11)
    && (p_installPhase = (uint64_t *)&self->_installPhase, self->_installPhase == v7))
  {
    installState = self->_installState;
    p_installState = (uint64_t *)&self->_installState;
    *(p_installState - 1) = v7;
    *p_installState = v6;
    p_installState[1] = v8;
    *((double *)p_installState - 2) = v10;
    *(p_installState - 3) = v11;
    if (installState == v6)
    {
      v18 = 0;
      goto LABEL_36;
    }
  }
  else
  {
    self->_installState = v6;
    p_installState = (uint64_t *)&self->_installState;
    *(p_installState - 1) = v7;
    p_installPhase = p_installState - 1;
    p_installState[1] = v8;
    *((double *)p_installState - 2) = v10;
    *(p_installState - 3) = v11;
    p_state = p_installState - 3;
  }
  FBSLogApplicationPlaceholder();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    if ((unint64_t)*p_state > 6)
      v20 = CFSTR("(unknown)");
    else
      v20 = (const __CFString *)*((_QWORD *)&off_1E38ED048 + *p_state);
    FBSStringForInstallPhase(*p_installPhase);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    FBSStringForInstallState(*p_installState);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 138413314;
    v27 = v4;
    v28 = 2112;
    v29 = v20;
    v30 = 2048;
    v31 = v10 * 100.0;
    v32 = 2112;
    v33 = *(double *)&v21;
    v34 = 2112;
    v35 = v22;
    _os_log_impl(&dword_19A6D4000, v19, OS_LOG_TYPE_INFO, "Updated progress for %@ to state %@ at %.0f%% (LSPhase=%@; LSState=%@)",
      (uint8_t *)&v26,
      0x34u);

  }
  v18 = 1;
LABEL_36:

  return v18;
}

- (BOOL)queue_isValid
{
  return self->_progress != 0;
}

- (BOOL)queue_updateProxy:(id)a3
{
  id v4;
  NSProgress *v5;
  NSProgress *progress;
  NSObject *v7;
  void *v8;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  BSDispatchQueueAssert();
  objc_msgSend(v4, "installProgress");
  v5 = (NSProgress *)objc_claimAutoreleasedReturnValue();

  progress = self->_progress;
  if (progress != v5)
  {
    -[FBSApplicationPlaceholderProgress _stopObservingProgress:withContext:](self, "_stopObservingProgress:withContext:", self->_progress, &self->_placeholder);
    objc_storeStrong((id *)&self->_progress, v5);
    -[FBSApplicationPlaceholderProgress _startObservingProgress:withContext:](self, "_startObservingProgress:withContext:", self->_progress, &self->_placeholder);
    FBSLogApplicationPlaceholder();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      -[NSProgress _LSDescription](self->_progress, "_LSDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412290;
      v11 = v8;
      _os_log_impl(&dword_19A6D4000, v7, OS_LOG_TYPE_INFO, "Now tracking progress: %@", (uint8_t *)&v10, 0xCu);

    }
    -[FBSApplicationPlaceholderProgress _queue_updateFromProgress](self, "_queue_updateFromProgress");
  }

  return progress != v5;
}

- (BOOL)queue_isCancellationAllowed
{
  id WeakRetained;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  id v13;

  BSDispatchQueueAssert();
  if (self->_cancellationAllowed == 0x7FFFFFFFFFFFFFFFLL)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_placeholder);
    if (WeakRetained)
    {
      v4 = objc_alloc((Class)getIXApplicationIdentityClass());
      objc_msgSend(WeakRetained, "bundleIdentifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "applicationIdentity");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "personaUniqueString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(v4, "initWithBundleIdentifier:personaUniqueString:", v5, v7);

      if (v8)
      {
        v13 = 0;
        v9 = objc_msgSend(getIXAppInstallCoordinatorClass(), "removabilityForAppWithIdentity:error:", v8, &v13);
        v10 = v13;
        if (v10)
        {
          FBSLogApplicationPlaceholder();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
            -[FBSApplicationPlaceholderProgress queue_isCancellationAllowed].cold.1(WeakRetained, (uint64_t)v10, v11);

        }
        self->_cancellationAllowed = v9 == 1;

      }
    }

  }
  return BSSettingFlagIsYes();
}

- (unint64_t)queue_supportedActions
{
  unint64_t result;
  unint64_t v4;

  BSDispatchQueueAssert();
  result = (unint64_t)self->_progress;
  if (result)
  {
    if (self->_state == 6)
    {
      return 0;
    }
    else
    {
      v4 = objc_msgSend((id)result, "isPrioritizable");
      if (-[NSProgress isCancellable](self->_progress, "isCancellable")
        && -[FBSApplicationPlaceholderProgress queue_isCancellationAllowed](self, "queue_isCancellationAllowed"))
      {
        v4 |= 8uLL;
      }
      if (-[NSProgress isPausable](self->_progress, "isPausable"))
        return v4 | 6;
      else
        return v4;
    }
  }
  return result;
}

- (BOOL)queue_canPerformAction:(unint64_t)a3
{
  int64_t state;
  BOOL v6;

  BSDispatchQueueAssert();
  if ((a3 & ~-[FBSApplicationPlaceholderProgress queue_supportedActions](self, "queue_supportedActions")) != 0)
    return 0;
  state = self->_state;
  v6 = a3 != 2 || state == 4;
  if (a3 == 4)
    v6 = state == 2;
  return state != 6 && v6;
}

- (void)_startObservingProgress:(id)a3 withContext:(void *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "addObserver:forKeyPath:options:context:", self, CFSTR("installPhase"), 0, a4);
  objc_msgSend(v6, "addObserver:forKeyPath:options:context:", self, CFSTR("installState"), 0, a4);
  objc_msgSend(v6, "addObserver:forKeyPath:options:context:", self, CFSTR("ls_expectedFinalInstallPhase"), 0, a4);
  objc_msgSend(v6, "addObserver:forKeyPath:options:context:", self, CFSTR("fractionCompleted"), 0, a4);
  objc_msgSend(v6, "addObserver:forKeyPath:options:context:", self, CFSTR("prioritizable"), 0, a4);
  objc_msgSend(v6, "addObserver:forKeyPath:options:context:", self, CFSTR("cancellable"), 0, a4);
  objc_msgSend(v6, "addObserver:forKeyPath:options:context:", self, CFSTR("cancelled"), 0, a4);
  objc_msgSend(v6, "addObserver:forKeyPath:options:context:", self, CFSTR("pausable"), 0, a4);
  objc_msgSend(v6, "addObserver:forKeyPath:options:context:", self, CFSTR("paused"), 0, a4);
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(MEMORY[0x1E0CB38A8], "keyPathsForValuesAffectingInstallState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v22;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(v6, "addObserver:forKeyPath:options:context:", self, *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v11++), 0, a4);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v9);
  }

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(MEMORY[0x1E0CB38A8], "keyPathsForValuesAffectingInstallPhase", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v18;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v18 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(v6, "addObserver:forKeyPath:options:context:", self, *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v16++), 0, a4);
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v14);
  }

}

- (void)_stopObservingProgress:(id)a3 withContext:(void *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "removeObserver:forKeyPath:context:", self, CFSTR("installPhase"), a4);
  objc_msgSend(v6, "removeObserver:forKeyPath:context:", self, CFSTR("installState"), a4);
  objc_msgSend(v6, "removeObserver:forKeyPath:context:", self, CFSTR("ls_expectedFinalInstallPhase"), a4);
  objc_msgSend(v6, "removeObserver:forKeyPath:context:", self, CFSTR("fractionCompleted"), a4);
  objc_msgSend(v6, "removeObserver:forKeyPath:context:", self, CFSTR("prioritizable"), a4);
  objc_msgSend(v6, "removeObserver:forKeyPath:context:", self, CFSTR("cancellable"), a4);
  objc_msgSend(v6, "removeObserver:forKeyPath:context:", self, CFSTR("cancelled"), a4);
  objc_msgSend(v6, "removeObserver:forKeyPath:context:", self, CFSTR("pausable"), a4);
  objc_msgSend(v6, "removeObserver:forKeyPath:context:", self, CFSTR("paused"), a4);
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(MEMORY[0x1E0CB38A8], "keyPathsForValuesAffectingInstallState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v22;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(v6, "removeObserver:forKeyPath:context:", self, *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v11++), a4);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v9);
  }

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(MEMORY[0x1E0CB38A8], "keyPathsForValuesAffectingInstallPhase", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v18;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v18 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(v6, "removeObserver:forKeyPath:context:", self, *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v16++), a4);
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v14);
  }

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  void *v11;
  id v12;
  NSObject *queue;
  objc_super v14;
  _QWORD block[4];
  id v16;
  FBSApplicationPlaceholderProgress *v17;

  v10 = a4;
  v11 = v10;
  if (&self->_placeholder == a6)
  {
    v12 = v10;
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __84__FBSApplicationPlaceholderProgress_observeValueForKeyPath_ofObject_change_context___block_invoke;
    block[3] = &unk_1E38EAE08;
    v16 = v12;
    v17 = self;
    dispatch_async(queue, block);

  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)FBSApplicationPlaceholderProgress;
    -[FBSApplicationPlaceholderProgress observeValueForKeyPath:ofObject:change:context:](&v14, sel_observeValueForKeyPath_ofObject_change_context_, a3, v10, a5, a6);
  }

}

void __84__FBSApplicationPlaceholderProgress_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  id WeakRetained;

  if (*(_QWORD *)(a1 + 32) == *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16) && (BSAtomicGetFlag() & 1) == 0)
  {
    if (objc_msgSend(*(id *)(a1 + 40), "_queue_updateFromProgress"))
    {
      WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 80));
      objc_msgSend(WeakRetained, "_queue_noteChangedSignificantly:", *(_QWORD *)(a1 + 40));

    }
  }
}

- (FBSApplicationPlaceholder)placeholder
{
  return (FBSApplicationPlaceholder *)objc_loadWeakRetained((id *)&self->_placeholder);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_placeholder);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)initWithPlaceholder:(const char *)a1 queue:.cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
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

- (void)initWithPlaceholder:(const char *)a1 queue:.cold.2(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
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

- (void)queue_isCancellationAllowed
{
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543618;
  v7 = v5;
  v8 = 2114;
  v9 = a2;
  _os_log_error_impl(&dword_19A6D4000, a3, OS_LOG_TYPE_ERROR, "Unable to determine removability for %{public}@: %{public}@", (uint8_t *)&v6, 0x16u);

}

@end
