@implementation HDAppExtensionAssertion

- (HDAppExtensionAssertion)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HDAppExtensionAssertion)initWithBundleIdentifier:(id)a3 profile:(id)a4 queue:(id)a5
{
  id v9;
  id v10;
  id v11;
  HDAppExtensionAssertion *v12;
  HDAppExtensionAssertion *v13;
  NSMutableDictionary *v14;
  NSMutableDictionary *pendingDataTypeCodesToAnchors;
  NSMutableDictionary *v16;
  NSMutableDictionary *pendingAssertionCompletions;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HDAppExtensionAssertion;
  v12 = -[HDAppExtensionAssertion init](&v19, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeWeak((id *)&v12->_profile, v10);
    v13->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v13->_queue, a5);
    objc_storeStrong((id *)&v13->_bundleIdentifier, a3);
    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    pendingDataTypeCodesToAnchors = v13->_pendingDataTypeCodesToAnchors;
    v13->_pendingDataTypeCodesToAnchors = v14;

    v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    pendingAssertionCompletions = v13->_pendingAssertionCompletions;
    v13->_pendingAssertionCompletions = v16;

  }
  return v13;
}

- (void)extendForDataType:(int64_t)a3 anchor:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  os_unfair_lock_s *p_lock;
  void *v11;
  NSMutableDictionary *pendingDataTypeCodesToAnchors;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  NSMutableDictionary *v17;
  void *v18;
  void *v19;
  void *v20;
  NSMutableDictionary *pendingAssertionCompletions;
  void *v22;
  int v23;
  int64_t v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_invalidated)
  {
    -[HDAppExtensionAssertion extension]((id *)&self->super.isa);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      if (!v8)
        v8 = &unk_1E6DFC4A0;
      pendingDataTypeCodesToAnchors = self->_pendingDataTypeCodesToAnchors;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](pendingDataTypeCodesToAnchors, "objectForKeyedSubscript:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "compare:", v8);

      if (v15 == 1)
      {
        _HKInitializeLogging();
        v16 = *MEMORY[0x1E0CB5288];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5288], OS_LOG_TYPE_ERROR))
        {
          v23 = 134218242;
          v24 = a3;
          v25 = 2114;
          v26 = v8;
          _os_log_error_impl(&dword_1B7802000, v16, OS_LOG_TYPE_ERROR, "Ignoring attempt to set '%lu' to lower anchor '%{public}@'", (uint8_t *)&v23, 0x16u);
        }
      }
      else
      {
        v17 = self->_pendingDataTypeCodesToAnchors;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](v17, "setObject:forKeyedSubscript:", v8, v18);

      }
      v19 = (void *)objc_msgSend(v9, "copy");
      v20 = _Block_copy(v19);
      pendingAssertionCompletions = self->_pendingAssertionCompletions;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](pendingAssertionCompletions, "setObject:forKeyedSubscript:", v20, v22);

    }
  }
  os_unfair_lock_unlock(p_lock);

}

- (_QWORD)extension
{
  _QWORD *v1;
  id WeakRetained;
  void *v3;
  void *v4;

  v1 = a1;
  if (a1)
  {
    WeakRetained = objc_loadWeakRetained(a1 + 6);
    objc_msgSend(WeakRetained, "daemon");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "extensionManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "extensionForBundleIdentifier:error:", v1[3], 0);
    v1 = (_QWORD *)objc_claimAutoreleasedReturnValue();

  }
  return v1;
}

- (void)assertAndUpdateWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  id WeakRetained;
  void *v7;
  void *v8;
  NSString *bundleIdentifier;
  void *v10;
  id v11;
  void *v12;
  char v13;
  NSObject *v14;
  NSObject *v15;
  NSString *v16;
  id v17;
  void *v18;
  NSString *v19;
  _QWORD v20[4];
  id v21;
  HDAppExtensionAssertion *v22;
  id v23;
  id v24;
  _QWORD aBlock[5];
  id v26;
  uint8_t buf[4];
  NSString *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_pendingAssertion)
  {
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    self->_pendingAssertion = 1;
    os_unfair_lock_unlock(&self->_lock);
    v5 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __57__HDAppExtensionAssertion_assertAndUpdateWithCompletion___block_invoke;
    aBlock[3] = &unk_1E6CF8AA0;
    aBlock[4] = self;
    v26 = v4;
    v4 = _Block_copy(aBlock);
    WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    objc_msgSend(WeakRetained, "daemon");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "extensionManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    bundleIdentifier = self->_bundleIdentifier;
    v24 = 0;
    objc_msgSend(v8, "extensionForBundleIdentifier:error:", bundleIdentifier, &v24);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v24;

    if (v10)
    {
      v20[0] = v5;
      v20[1] = 3221225472;
      v20[2] = __57__HDAppExtensionAssertion_assertAndUpdateWithCompletion___block_invoke_190;
      v20[3] = &unk_1E6CE7868;
      v21 = v10;
      v22 = self;
      v23 = v4;
      objc_msgSend(v21, "connectWithCompletionHandler:", v20);

    }
    else
    {
      -[HDAppExtensionAssertion _incrementErrorCount]((uint64_t)self);
      objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "applicationIsInstalled:", self->_bundleIdentifier);

      _HKInitializeLogging();
      v14 = *MEMORY[0x1E0CB5288];
      v15 = *MEMORY[0x1E0CB5288];
      if ((v13 & 1) != 0)
      {
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          v19 = self->_bundleIdentifier;
          *(_DWORD *)buf = 138543618;
          v28 = v19;
          v29 = 2114;
          v30 = v11;
          _os_log_error_impl(&dword_1B7802000, v14, OS_LOG_TYPE_ERROR, "Failed to assert app extension: '%{public}@' with error: %{public}@", buf, 0x16u);
        }
        (*((void (**)(id, _QWORD, uint64_t))v4 + 2))(v4, 0, 1);
      }
      else
      {
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          v16 = self->_bundleIdentifier;
          *(_DWORD *)buf = 138543362;
          v28 = v16;
          _os_log_impl(&dword_1B7802000, v14, OS_LOG_TYPE_DEFAULT, "Failed to assert app extesnion: '%{public}@' since the app has been uninstalled.", buf, 0xCu);
        }
        v17 = objc_loadWeakRetained((id *)&self->_profile);
        objc_msgSend(v17, "appSubscriptionManager");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "removeBundleID:", self->_bundleIdentifier);

        (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, 0);
      }
    }

  }
}

uint64_t __57__HDAppExtensionAssertion_assertAndUpdateWithCompletion___block_invoke(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 12));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 9) = 0;
  *(CFAbsoluteTime *)(*(_QWORD *)(a1 + 32) + 96) = CFAbsoluteTimeGetCurrent();
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 12));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_incrementErrorCount
{
  os_unfair_lock_s *v2;
  void (**v3)(void);
  void (**v4)(void);

  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 12);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 12));
    ++*(_QWORD *)(a1 + 104);
    os_unfair_lock_unlock(v2);
    v3 = (void (**)(void))_Block_copy(*(const void **)(a1 + 32));
    if (v3)
    {
      v4 = v3;
      v3[2]();
      v3 = v4;
    }

  }
}

void __57__HDAppExtensionAssertion_assertAndUpdateWithCompletion___block_invoke_190(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t *v11;
  uint64_t v12;
  double v13;
  double v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  uint64_t v29;
  _QWORD v30[4];
  id v31;
  id v32;
  _QWORD v33[4];
  id v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _HKInitializeLogging();
  v6 = (void *)*MEMORY[0x1E0CB5288];
  v7 = *MEMORY[0x1E0CB5288];
  if (a2)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = *(void **)(a1 + 32);
      v9 = v6;
      objc_msgSend(v8, "extensionIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v36 = v10;
      _os_log_impl(&dword_1B7802000, v9, OS_LOG_TYPE_INFO, "Connected to app extension: '%{public}@'", buf, 0xCu);

    }
    v11 = (uint64_t *)(a1 + 40);
    objc_initWeak((id *)buf, *(id *)(a1 + 40));
    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 12));
    -[HDAppExtensionAssertion _lock_cancelTimeoutTimers](*(_QWORD *)(a1 + 40));
    v12 = *(_QWORD *)(a1 + 40);
    if (*(_BYTE *)(v12 + 8))
      v13 = 1.0;
    else
      v13 = 15.0;
    if (*(_BYTE *)(*(_QWORD *)(a1 + 40) + 8))
      v14 = 1.0;
    else
      v14 = 14.0;
    v15 = MEMORY[0x1E0C809B0];
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __57__HDAppExtensionAssertion_assertAndUpdateWithCompletion___block_invoke_191;
    v33[3] = &unk_1E6CECE78;
    objc_copyWeak(&v34, (id *)buf);
    v16 = -[HDAppExtensionAssertion _newTimerWithDuration:handler:](v12, v33, v14);
    v17 = *(void **)(*v11 + 80);
    *(_QWORD *)(*v11 + 80) = v16;

    v18 = *v11;
    v30[0] = v15;
    v30[1] = 3221225472;
    v30[2] = __57__HDAppExtensionAssertion_assertAndUpdateWithCompletion___block_invoke_2;
    v30[3] = &unk_1E6CED848;
    v31 = *(id *)(a1 + 32);
    objc_copyWeak(&v32, (id *)buf);
    v19 = -[HDAppExtensionAssertion _newTimerWithDuration:handler:](v18, v30, v13);
    v20 = *(void **)(*v11 + 72);
    *(_QWORD *)(*v11 + 72) = v19;

    v21 = (void *)objc_msgSend(*(id *)(*v11 + 56), "copy");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "removeAllObjects");
    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 104) = 0;
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 12));
    v27[0] = v15;
    v27[1] = 3221225472;
    v27[2] = __57__HDAppExtensionAssertion_assertAndUpdateWithCompletion___block_invoke_193;
    v27[3] = &unk_1E6CF8AC8;
    v22 = *(id *)(a1 + 32);
    v23 = *(_QWORD *)(a1 + 40);
    v28 = v22;
    v29 = v23;
    objc_msgSend(v21, "enumerateKeysAndObjectsUsingBlock:", v27);

    objc_destroyWeak(&v32);
    objc_destroyWeak(&v34);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v24 = *(void **)(a1 + 32);
      v25 = v6;
      objc_msgSend(v24, "extensionIdentifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v36 = v26;
      v37 = 2114;
      v38 = v5;
      _os_log_error_impl(&dword_1B7802000, v25, OS_LOG_TYPE_ERROR, "Failed to connect to app extension: '%{public}@' with error: %{public}@", buf, 0x16u);

    }
    -[HDAppExtensionAssertion _incrementErrorCount](*(_QWORD *)(a1 + 40));
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (void)_lock_cancelTimeoutTimers
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  void *v5;

  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 12));
    v2 = *(NSObject **)(a1 + 72);
    if (v2)
    {
      dispatch_source_cancel(v2);
      v3 = *(void **)(a1 + 72);
      *(_QWORD *)(a1 + 72) = 0;

    }
    v4 = *(NSObject **)(a1 + 80);
    if (v4)
    {
      dispatch_source_cancel(v4);
      v5 = *(void **)(a1 + 80);
      *(_QWORD *)(a1 + 80) = 0;

    }
  }
}

void __57__HDAppExtensionAssertion_assertAndUpdateWithCompletion___block_invoke_191(uint64_t a1)
{
  id *WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  const void **v5;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = (const void **)WeakRetained;
    -[HDAppExtensionAssertion extension](WeakRetained);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "notifyExtensionOfUpcomingTimeout");

    v3 = _Block_copy(v5[5]);
    v4 = v3;
    if (v3)
      (*((void (**)(void *))v3 + 2))(v3);

    WeakRetained = (id *)v5;
  }

}

- (NSObject)_newTimerWithDuration:(double)a3 handler:
{
  NSObject *v4;
  id v5;
  NSObject *v6;
  dispatch_time_t v7;

  if (!a1)
    return 0;
  v4 = *(NSObject **)(a1 + 88);
  v5 = a2;
  v6 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v4);
  v7 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  dispatch_source_set_timer(v6, v7, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  dispatch_source_set_event_handler(v6, v5);

  dispatch_resume(v6);
  return v6;
}

void __57__HDAppExtensionAssertion_assertAndUpdateWithCompletion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  id WeakRetained;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v2 = (void *)*MEMORY[0x1E0CB5288];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5288], OS_LOG_TYPE_INFO))
  {
    v3 = *(void **)(a1 + 32);
    v4 = v2;
    objc_msgSend(v3, "extensionIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_1B7802000, v4, OS_LOG_TYPE_INFO, "Invalidating app extension assertion due to timeout for '%{public}@'", (uint8_t *)&v7, 0xCu);

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  -[HDAppExtensionAssertion _invalidate]((uint64_t)WeakRetained);

}

- (void)_invalidate
{
  os_unfair_lock_s *v2;
  void *v3;
  id v4;

  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 12);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 12));
    if (*(_BYTE *)(a1 + 10))
    {
      os_unfair_lock_unlock(v2);
    }
    else
    {
      *(_WORD *)(a1 + 9) = 256;
      -[HDAppExtensionAssertion _lock_cancelTimeoutTimers](a1);
      os_unfair_lock_unlock(v2);
      -[HDAppExtensionAssertion extension]((id *)a1);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "disconnect");

      objc_msgSend((id)a1, "delegate");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appExtensionAssertionDidInvalidate:", a1);

    }
  }
}

void __57__HDAppExtensionAssertion_assertAndUpdateWithCompletion___block_invoke_193(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _BYTE v17[24];
  void *v18;
  id *v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  (*(void (**)(uint64_t))(a3 + 16))(a3);
  _HKInitializeLogging();
  v6 = (void *)*MEMORY[0x1E0CB5288];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5288], OS_LOG_TYPE_INFO))
  {
    v7 = *(void **)(a1 + 32);
    v8 = v6;
    objc_msgSend(v7, "extensionIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v17 = 138543618;
    *(_QWORD *)&v17[4] = v9;
    *(_WORD *)&v17[12] = 2114;
    *(_QWORD *)&v17[14] = v5;
    _os_log_impl(&dword_1B7802000, v8, OS_LOG_TYPE_INFO, "Updating app extension: '%{public}@' for data type code: '%{public}@'", v17, 0x16u);

  }
  v10 = *(id **)(a1 + 40);
  v11 = objc_msgSend(v5, "integerValue");
  if (v10)
  {
    v12 = v11;
    objc_msgSend(MEMORY[0x1E0CB6B00], "dataTypeWithCode:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      -[HDAppExtensionAssertion extension](v10);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v14)
      {
        *(_QWORD *)v17 = MEMORY[0x1E0C809B0];
        *(_QWORD *)&v17[8] = 3221225472;
        *(_QWORD *)&v17[16] = __58__HDAppExtensionAssertion__notifyAppExtensionForDataType___block_invoke;
        v18 = &unk_1E6CF8AF0;
        v19 = v10;
        v22 = v12;
        v16 = v14;
        v20 = v16;
        v21 = v13;
        objc_msgSend(v16, "notifyExtensionOfUpdateForSampleType:completionHandler:", v21, v17);

      }
    }

  }
}

- (void)invalidateForDataType:(int64_t)a3 anchor:(id)a4
{
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a4;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDAppExtensionAssertion.m"), 177, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("anchor != nil"));

  }
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_pendingDataTypeCodesToAnchors, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "compare:", v11) != 1)
  {
    -[NSMutableDictionary removeObjectForKey:](self->_pendingDataTypeCodesToAnchors, "removeObjectForKey:", v7);
    -[NSMutableDictionary removeObjectForKey:](self->_pendingAssertionCompletions, "removeObjectForKey:", v7);
  }
  if (self->_invalidated)
  {
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    v9 = -[NSMutableDictionary count](self->_pendingDataTypeCodesToAnchors, "count");
    os_unfair_lock_unlock(&self->_lock);
    if (!v9)
      -[HDAppExtensionAssertion _invalidate]((uint64_t)self);
  }

}

- (BOOL)shouldAssert
{
  HDAppExtensionAssertion *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = !v2->_pendingAssertion;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (double)nextAssertionAttempt
{
  os_unfair_lock_s *p_lock;
  double lastAssertionAttempt;
  double v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lastAssertionAttempt = self->_lastAssertionAttempt;
  v5 = lastAssertionAttempt + exp2((double)self->_connectionErrorCount) * 15.0;
  os_unfair_lock_unlock(p_lock);
  return v5;
}

void __58__HDAppExtensionAssertion__notifyAppExtensionForDataType___block_invoke(_QWORD *a1, int a2, void *a3)
{
  NSObject *v5;
  os_unfair_lock_s *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id WeakRetained;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  NSObject *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (os_unfair_lock_s *)a1[4];
  if (a2)
  {
    os_unfair_lock_lock(v6 + 3);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a1[7]);
    v7 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1[4] + 64), "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1[4] + 64), "removeObjectForKey:", v7);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 12));
    _HKInitializeLogging();
    v9 = (void *)*MEMORY[0x1E0CB5288];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5288], OS_LOG_TYPE_INFO))
    {
      v10 = (void *)a1[5];
      v11 = v9;
      objc_msgSend(v10, "extensionIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v23 = v12;
      v24 = 2114;
      v25 = v7;
      v26 = 2114;
      v27 = v8;
      _os_log_impl(&dword_1B7802000, v11, OS_LOG_TYPE_INFO, "Updated app extension: '%{public}@' with data type code: %{public}@ and anchor: %{public}@", buf, 0x20u);

    }
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6A90]), "initWithDataAnchor:associationAnchor:", v8, 0);
    WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 48));
    objc_msgSend(WeakRetained, "appSubscriptionManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *(_QWORD *)(a1[4] + 24);
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", a1[6], 0);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", time(0));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "ackForBundleID:dataTypes:anchor:ackTime:", v16, v17, v13, v18);

  }
  else
  {
    -[HDAppExtensionAssertion _incrementErrorCount]((uint64_t)v6);
    _HKInitializeLogging();
    v19 = (void *)*MEMORY[0x1E0CB5288];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5288], OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    v20 = (void *)a1[5];
    v7 = v19;
    objc_msgSend(v20, "extensionIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v23 = v21;
    v24 = 2114;
    v25 = v5;
    _os_log_error_impl(&dword_1B7802000, v7, OS_LOG_TYPE_ERROR, "Failed to update app extension: '%{public}@' with error: %{public}@", buf, 0x16u);

  }
LABEL_7:

}

- (unint64_t)_unitTest_pendingAssertionCompletionsCount
{
  os_unfair_lock_s *p_lock;
  unint64_t v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = -[NSMutableDictionary count](self->_pendingAssertionCompletions, "count");
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)_unitTest_pendingDataTypeCodesToAnchors
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)-[NSMutableDictionary copy](self->_pendingDataTypeCodesToAnchors, "copy");
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (int64_t)_unitTest_connectionErrorCount
{
  os_unfair_lock_s *p_lock;
  int64_t connectionErrorCount;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  connectionErrorCount = self->_connectionErrorCount;
  os_unfair_lock_unlock(p_lock);
  return connectionErrorCount;
}

- (double)_unitTest_lastAssertionAttempt
{
  os_unfair_lock_s *p_lock;
  double lastAssertionAttempt;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lastAssertionAttempt = self->_lastAssertionAttempt;
  os_unfair_lock_unlock(p_lock);
  return lastAssertionAttempt;
}

- (BOOL)_unitTest_invalidated
{
  HDAppExtensionAssertion *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_invalidated;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (HDAppExtensionAssertionDelegate)delegate
{
  return (HDAppExtensionAssertionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (id)unitTest_errorCountDidIncrement
{
  return self->_unitTest_errorCountDidIncrement;
}

- (void)setUnitTest_errorCountDidIncrement:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)unitTest_extensionWillTimeout
{
  return self->_unitTest_extensionWillTimeout;
}

- (void)setUnitTest_extensionWillTimeout:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)unitTest_timersWithShortTimeout
{
  return self->_unitTest_timersWithShortTimeout;
}

- (void)setUnitTest_timersWithShortTimeout:(BOOL)a3
{
  self->_unitTest_timersWithShortTimeout = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_graceTimer, 0);
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong((id *)&self->_pendingDataTypeCodesToAnchors, 0);
  objc_storeStrong((id *)&self->_pendingAssertionCompletions, 0);
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong(&self->_unitTest_extensionWillTimeout, 0);
  objc_storeStrong(&self->_unitTest_errorCountDidIncrement, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
