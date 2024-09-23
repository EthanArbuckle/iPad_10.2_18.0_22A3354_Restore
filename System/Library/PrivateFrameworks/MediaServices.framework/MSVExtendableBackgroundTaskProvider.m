@implementation MSVExtendableBackgroundTaskProvider

- (MSVExtendableBackgroundTaskProvider)initWithRunningRBSDomain:(id)a3 name:(id)a4 invalidationDuration:(double)a5
{
  id v9;
  id v10;
  MSVExtendableBackgroundTaskProvider *v11;
  MSVExtendableBackgroundTaskProvider *v12;
  uint64_t v13;
  NSMutableDictionary *timeoutGuards;
  uint64_t v15;
  NSMutableDictionary *expirationHandlers;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  v18.receiver = self;
  v18.super_class = (Class)MSVExtendableBackgroundTaskProvider;
  v11 = -[MSVExtendableBackgroundTaskProvider init](&v18, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_domain, a3);
    objc_storeStrong((id *)&v12->_name, a4);
    v12->_invalidationDuration = a5;
    v12->_lock = 0;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v13 = objc_claimAutoreleasedReturnValue();
    timeoutGuards = v12->_timeoutGuards;
    v12->_timeoutGuards = (NSMutableDictionary *)v13;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v15 = objc_claimAutoreleasedReturnValue();
    expirationHandlers = v12->_expirationHandlers;
    v12->_expirationHandlers = (NSMutableDictionary *)v15;

  }
  return v12;
}

- (unint64_t)beginTaskWithName:(id)a3 expirationHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  MSVBlockGuard *v9;
  double invalidationDuration;
  MSVBlockGuard *v11;
  void *v12;
  NSMutableDictionary *expirationHandlers;
  void *v14;
  NSMutableDictionary *timeoutGuards;
  void *v16;
  NSObject *v17;
  _QWORD v19[4];
  id v20[2];
  id location;
  uint8_t buf[4];
  MSVExtendableBackgroundTaskProvider *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  os_unfair_recursive_lock_lock_with_options();
  v8 = (void *)(self->_lastIdentifier + 1);
  self->_lastIdentifier = (unint64_t)v8;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("BackgroundTask#%ld"), v8);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (-[MSVExtendableBackgroundTaskProvider _locked_acquireAssertion:](self, "_locked_acquireAssertion:", v6))
  {
    objc_initWeak(&location, self);
    v9 = [MSVBlockGuard alloc];
    invalidationDuration = self->_invalidationDuration;
    v19[1] = 3221225472;
    v19[2] = __75__MSVExtendableBackgroundTaskProvider_beginTaskWithName_expirationHandler___block_invoke;
    v19[3] = &unk_1E43E8988;
    v19[0] = MEMORY[0x1E0C809B0];
    objc_copyWeak(v20, &location);
    v20[1] = v8;
    v11 = -[MSVBlockGuard initWithTimeout:interruptionHandler:](v9, "initWithTimeout:interruptionHandler:", v19, invalidationDuration);
    v12 = (void *)MEMORY[0x1A1AFBD28](v7);
    expirationHandlers = self->_expirationHandlers;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](expirationHandlers, "setObject:forKeyedSubscript:", v12, v14);

    timeoutGuards = self->_timeoutGuards;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](timeoutGuards, "setObject:forKeyedSubscript:", v11, v16);

    v17 = os_log_create("com.apple.amp.MediaServices", "Default");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218498;
      v23 = self;
      v24 = 2048;
      v25 = v8;
      v26 = 2114;
      v27 = v6;
      _os_log_impl(&dword_1A077D000, v17, OS_LOG_TYPE_DEFAULT, "MSVExtendableBackgroundTaskProvider %p Task #%ld started [%{public}@]", buf, 0x20u);
    }

    objc_destroyWeak(v20);
    objc_destroyWeak(&location);
  }
  else
  {
    v8 = 0;
  }
  os_unfair_recursive_lock_unlock();

  return (unint64_t)v8;
}

- (unint64_t)beginTaskWithExpirationHandler:(id)a3
{
  return -[MSVExtendableBackgroundTaskProvider beginTaskWithName:expirationHandler:](self, "beginTaskWithName:expirationHandler:", 0, a3);
}

- (void)endTask:(unint64_t)a3
{
  NSMutableDictionary *timeoutGuards;
  void *v6;
  void *v7;
  NSMutableDictionary *v8;
  void *v9;
  NSMutableDictionary *expirationHandlers;
  void *v11;
  NSObject *v12;
  int v13;
  MSVExtendableBackgroundTaskProvider *v14;
  __int16 v15;
  unint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  os_unfair_recursive_lock_lock_with_options();
  timeoutGuards = self->_timeoutGuards;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](timeoutGuards, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "disarm");
    v8 = self->_timeoutGuards;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", 0, v9);

    expirationHandlers = self->_expirationHandlers;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](expirationHandlers, "setObject:forKeyedSubscript:", 0, v11);

    v12 = os_log_create("com.apple.amp.MediaServices", "Default");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 134218240;
      v14 = self;
      v15 = 2048;
      v16 = a3;
      _os_log_impl(&dword_1A077D000, v12, OS_LOG_TYPE_DEFAULT, "MSVExtendableBackgroundTaskProvider %p Task #%ld ended", (uint8_t *)&v13, 0x16u);
    }

    if (!-[MSVExtendableBackgroundTaskProvider _locked_taskCount](self, "_locked_taskCount"))
      -[MSVExtendableBackgroundTaskProvider _locked_releaseAssertion](self, "_locked_releaseAssertion");
  }
  os_unfair_recursive_lock_unlock();

}

- (void)_taskDidTimeout:(unint64_t)a3
{
  NSMutableDictionary *expirationHandlers;
  void *v6;
  void (**v7)(_QWORD);
  NSObject *v8;
  int v9;
  MSVExtendableBackgroundTaskProvider *v10;
  __int16 v11;
  unint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  os_unfair_recursive_lock_lock_with_options();
  expirationHandlers = self->_expirationHandlers;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](expirationHandlers, "objectForKeyedSubscript:", v6);
  v7 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = os_log_create("com.apple.amp.MediaServices", "Default");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 134218240;
      v10 = self;
      v11 = 2048;
      v12 = a3;
      _os_log_impl(&dword_1A077D000, v8, OS_LOG_TYPE_DEFAULT, "MSVExtendableBackgroundTaskProvider %p Task #%ld expired", (uint8_t *)&v9, 0x16u);
    }

    v7[2](v7);
  }
  os_unfair_recursive_lock_unlock();

}

- (void)_assertionInvalidated:(id)a3 error:(id)a4
{
  RBSAssertion *v6;
  id v7;
  NSObject *v8;
  int v9;
  MSVExtendableBackgroundTaskProvider *v10;
  __int16 v11;
  RBSAssertion *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = (RBSAssertion *)a3;
  v7 = a4;
  os_unfair_recursive_lock_lock_with_options();
  v8 = os_log_create("com.apple.amp.MediaServices", "Default");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 134218498;
    v10 = self;
    v11 = 2048;
    v12 = v6;
    v13 = 2114;
    v14 = v7;
    _os_log_impl(&dword_1A077D000, v8, OS_LOG_TYPE_DEFAULT, "MSVExtendableBackgroundTaskProvider %p RBSAssertion %p invalidated with error: %{public}@", (uint8_t *)&v9, 0x20u);
  }

  if (self->_assertion == v6)
  {
    self->_assertion = 0;

    if (-[MSVExtendableBackgroundTaskProvider _locked_taskCount](self, "_locked_taskCount") >= 1
      && (!self->_explanationForExtension
       || !-[MSVExtendableBackgroundTaskProvider _locked_acquireAssertion:](self, "_locked_acquireAssertion:")))
    {
      -[MSVExtendableBackgroundTaskProvider _locked_removeAllTasksWithError:](self, "_locked_removeAllTasksWithError:", v7);
    }
  }
  os_unfair_recursive_lock_unlock();

}

- (int64_t)_locked_taskCount
{
  return -[NSMutableDictionary count](self->_timeoutGuards, "count");
}

- (BOOL)_locked_needsAssertion
{
  RBSAssertion *assertion;
  double v4;
  void *v5;
  double v6;
  double v7;

  assertion = self->_assertion;
  if (!assertion || !-[RBSAssertion isValid](assertion, "isValid"))
    return 1;
  v4 = self->_assertionCreatedTime + self->_invalidationDuration;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSince1970");
  v7 = v4 - v6;

  return v7 < 5.0;
}

- (void)_locked_removeAllTasksWithError:(id)a3
{
  id v4;
  NSMutableDictionary *timeoutGuards;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  timeoutGuards = self->_timeoutGuards;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __71__MSVExtendableBackgroundTaskProvider__locked_removeAllTasksWithError___block_invoke;
  v7[3] = &unk_1E43E89B0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](timeoutGuards, "enumerateKeysAndObjectsUsingBlock:", v7);
  -[NSMutableDictionary removeAllObjects](self->_timeoutGuards, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_expirationHandlers, "removeAllObjects");

}

- (BOOL)_locked_acquireAssertion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  RBSAssertion *v10;
  void *v11;
  double v12;
  NSString *explanationForExtension;
  NSString *v14;
  NSString *v15;
  BOOL v16;
  _QWORD v18[5];
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  id location;
  uint8_t buf[4];
  MSVExtendableBackgroundTaskProvider *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  id v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[MSVExtendableBackgroundTaskProvider _locked_needsAssertion](self, "_locked_needsAssertion"))
  {
    objc_msgSend(MEMORY[0x1E0D87DF8], "currentProcess");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D87CD0], "attributeWithDomain:name:", self->_domain, self->_name);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D87C98]), "initWithExplanation:target:attributes:", v4, v5, v7);
    objc_initWeak(&location, self);
    v20 = 0;
    v21 = &v20;
    v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__1608;
    v24 = __Block_byref_object_dispose__1609;
    v18[0] = MEMORY[0x1E0C809B0];
    v25 = 0;
    v18[2] = __64__MSVExtendableBackgroundTaskProvider__locked_acquireAssertion___block_invoke;
    v18[3] = &unk_1E43E89D8;
    v18[1] = 3221225472;
    objc_copyWeak(&v19, &location);
    v18[4] = &v20;
    objc_msgSend(v8, "acquireWithInvalidationHandler:", v18);
    if (!v21[5])
    {
      v9 = os_log_create("com.apple.amp.MediaServices", "Default");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218754;
        v28 = self;
        v29 = 2048;
        v30 = v8;
        v31 = 2114;
        v32 = v7;
        v33 = 2114;
        v34 = v4;
        _os_log_impl(&dword_1A077D000, v9, OS_LOG_TYPE_DEFAULT, "MSVExtendableBackgroundTaskProvider %p Took RBSAssertion %p %{public}@ [%{public}@]", buf, 0x2Au);
      }

      v10 = self->_assertion;
      objc_storeStrong((id *)&self->_assertion, v8);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "timeIntervalSince1970");
      self->_assertionCreatedTime = v12;

      if (v10)
        -[RBSAssertion invalidate](v10, "invalidate");

    }
    if (!self->_assertion)
      -[MSVExtendableBackgroundTaskProvider _locked_removeAllTasksWithError:](self, "_locked_removeAllTasksWithError:", v21[5]);
    explanationForExtension = self->_explanationForExtension;
    self->_explanationForExtension = 0;

    objc_destroyWeak(&v19);
    _Block_object_dispose(&v20, 8);

    objc_destroyWeak(&location);
  }
  else
  {
    objc_msgSend(v4, "stringByAppendingString:", CFSTR(" (extension)"));
    v14 = (NSString *)objc_claimAutoreleasedReturnValue();
    v15 = self->_explanationForExtension;
    self->_explanationForExtension = v14;

  }
  v16 = self->_assertion != 0;

  return v16;
}

- (void)_locked_releaseAssertion
{
  uint32_t v3;
  dispatch_time_t v4;
  NSObject *v5;
  _QWORD v6[5];
  uint32_t v7;

  if (self->_assertion)
  {
    v3 = arc4random();
    self->_assertionInvalidationNonce = v3;
    v4 = dispatch_time(0, 1000000000);
    dispatch_get_global_queue(9, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __63__MSVExtendableBackgroundTaskProvider__locked_releaseAssertion__block_invoke;
    v6[3] = &unk_1E43E8A00;
    v6[4] = self;
    v7 = v3;
    dispatch_after(v4, v5, v6);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeoutGuards, 0);
  objc_storeStrong((id *)&self->_expirationHandlers, 0);
  objc_storeStrong((id *)&self->_explanationForExtension, 0);
  objc_storeStrong((id *)&self->_assertion, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_domain, 0);
}

uint64_t __63__MSVExtendableBackgroundTaskProvider__locked_releaseAssertion__block_invoke(uint64_t a1)
{
  _DWORD *v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  os_unfair_recursive_lock_lock_with_options();
  v2 = *(_DWORD **)(a1 + 32);
  if (*(_DWORD *)(a1 + 40) == v2[14])
  {
    v3 = objc_msgSend(v2, "_locked_taskCount");
    v4 = *(_QWORD *)(a1 + 32);
    if (!v3)
    {
      if (*(_QWORD *)(v4 + 40))
      {
        objc_msgSend(*(id *)(v4 + 40), "invalidate");
        v5 = os_log_create("com.apple.amp.MediaServices", "Default");
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          v6 = *(_QWORD *)(a1 + 32);
          v7 = *(_QWORD *)(v6 + 40);
          v11 = 134218240;
          v12 = v6;
          v13 = 2048;
          v14 = v7;
          _os_log_impl(&dword_1A077D000, v5, OS_LOG_TYPE_DEFAULT, "MSVExtendableBackgroundTaskProvider %p Invalidated RBSAssertion %p", (uint8_t *)&v11, 0x16u);
        }

        v8 = *(_QWORD *)(a1 + 32);
        v9 = *(void **)(v8 + 40);
        *(_QWORD *)(v8 + 40) = 0;

      }
    }
  }
  return os_unfair_recursive_lock_unlock();
}

void __64__MSVExtendableBackgroundTaskProvider__locked_acquireAssertion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  uint64_t v8;
  void *v9;

  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_assertionInvalidated:error:", v6, v5);

  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v5;

}

void __71__MSVExtendableBackgroundTaskProvider__locked_removeAllTasksWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void (**v6)(_QWORD);
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (objc_msgSend(a3, "disarm"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "objectForKeyedSubscript:", v5);
    v6 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = os_log_create("com.apple.amp.MediaServices", "Default");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = *(_QWORD *)(a1 + 32);
        v9 = objc_msgSend(v5, "integerValue");
        v10 = *(_QWORD *)(a1 + 40);
        v11 = 134218498;
        v12 = v8;
        v13 = 2048;
        v14 = v9;
        v15 = 2114;
        v16 = v10;
        _os_log_impl(&dword_1A077D000, v7, OS_LOG_TYPE_DEFAULT, "MSVExtendableBackgroundTaskProvider %p Task #%ld ended [%{public}@]", (uint8_t *)&v11, 0x20u);
      }

      v6[2](v6);
    }

  }
}

void __75__MSVExtendableBackgroundTaskProvider_beginTaskWithName_expirationHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (!a2)
  {
    objc_msgSend(WeakRetained, "_taskDidTimeout:", *(_QWORD *)(a1 + 40));
    WeakRetained = v5;
  }
  objc_msgSend(WeakRetained, "endTask:", *(_QWORD *)(a1 + 40));

}

@end
