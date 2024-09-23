@implementation CHSServerSubscription

- (CHSServerSubscription)initWithIdentifier:(id)a3 serverSubscriptionBlock:(id)a4
{
  id v6;
  id v7;
  CHSServerSubscription *v8;
  uint64_t v9;
  NSString *identifier;
  NSObject *lock_cachedValue;
  uint64_t v12;
  id lock_subscriptionBlock;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CHSServerSubscription;
  v8 = -[CHSServerSubscription init](&v15, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v9;

    v8->_lock._os_unfair_lock_opaque = 0;
    lock_cachedValue = v8->_lock_cachedValue;
    v8->_lock_cachedValue = 0;

    v12 = objc_msgSend(v7, "copy");
    lock_subscriptionBlock = v8->_lock_subscriptionBlock;
    v8->_lock_subscriptionBlock = (id)v12;

  }
  return v8;
}

- (NSObject)cachedValue
{
  os_unfair_lock_s *p_lock;
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
  p_lock = &self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __36__CHSServerSubscription_cachedValue__block_invoke;
  v5[3] = &unk_1E2A5A6C0;
  v5[4] = self;
  v5[5] = &v6;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  __36__CHSServerSubscription_cachedValue__block_invoke((uint64_t)v5);
  os_unfair_lock_unlock(p_lock);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __36__CHSServerSubscription_cachedValue__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 24));
}

- (BOOL)isSubscribed
{
  os_unfair_lock_s *p_lock;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  p_lock = &self->_lock;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __37__CHSServerSubscription_isSubscribed__block_invoke;
  v4[3] = &unk_1E2A5A6C0;
  v4[4] = self;
  v4[5] = &v5;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  __37__CHSServerSubscription_isSubscribed__block_invoke((uint64_t)v4);
  os_unfair_lock_unlock(p_lock);
  LOBYTE(p_lock) = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return (char)p_lock;
}

uint64_t __37__CHSServerSubscription_isSubscribed__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result != 0;
  return result;
}

- (void)setCachedValue:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  p_lock = &self->_lock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40__CHSServerSubscription_setCachedValue___block_invoke;
  v7[3] = &unk_1E2A5A290;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  os_unfair_lock_assert_not_owner(p_lock);
  os_unfair_lock_lock(p_lock);
  __40__CHSServerSubscription_setCachedValue___block_invoke((uint64_t)v7);
  os_unfair_lock_unlock(p_lock);

}

void __40__CHSServerSubscription_setCachedValue___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 24), *(id *)(a1 + 40));
}

- (void)updateCachedValue:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  p_lock = &self->_lock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43__CHSServerSubscription_updateCachedValue___block_invoke;
  v7[3] = &unk_1E2A5B458;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  os_unfair_lock_assert_not_owner(p_lock);
  os_unfair_lock_lock(p_lock);
  __43__CHSServerSubscription_updateCachedValue___block_invoke((uint64_t)v7);
  os_unfair_lock_unlock(p_lock);

}

void __43__CHSServerSubscription_updateCachedValue___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 24);
  *(_QWORD *)(v3 + 24) = v2;

}

- (id)subscribeWithResult:(id *)a3 error:(id *)a4
{
  return -[CHSServerSubscription subscribeWithResult:forcingServerUpdate:error:](self, "subscribeWithResult:forcingServerUpdate:error:", a3, 0, a4);
}

- (id)subscribeWithResult:(id *)a3 forcingServerUpdate:(BOOL)a4 error:(id *)a5
{
  void *v9;
  NSString *identifier;
  void *v11;
  void *v12;
  id v13;
  NSString *v14;
  os_unfair_lock_s *p_lock;
  id v16;
  void *v17;
  id v18;
  _QWORD v20[5];
  id v21;
  uint64_t *v22;
  uint64_t *v23;
  BOOL v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  _QWORD v37[5];

  v9 = (void *)MEMORY[0x1E0CB3940];
  identifier = self->_identifier;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("<%@: %@>"), identifier, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_alloc(MEMORY[0x1E0D01868]);
  v14 = self->_identifier;
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __71__CHSServerSubscription_subscribeWithResult_forcingServerUpdate_error___block_invoke;
  v37[3] = &unk_1E2A5B480;
  v37[4] = self;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__3;
  v35 = __Block_byref_object_dispose__3;
  v36 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__3;
  v29 = __Block_byref_object_dispose__3;
  v30 = 0;
  p_lock = &self->_lock;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __71__CHSServerSubscription_subscribeWithResult_forcingServerUpdate_error___block_invoke_27;
  v20[3] = &unk_1E2A5B4A8;
  v20[4] = self;
  v16 = (id)objc_msgSend(v13, "initWithIdentifier:forReason:invalidationBlock:", v12, v14, v37);
  v21 = v16;
  v22 = &v31;
  v24 = a4;
  v23 = &v25;
  os_unfair_lock_assert_not_owner(p_lock);
  os_unfair_lock_lock(p_lock);
  __71__CHSServerSubscription_subscribeWithResult_forcingServerUpdate_error___block_invoke_27((uint64_t)v20);
  os_unfair_lock_unlock(p_lock);
  if (a3)
    *a3 = objc_retainAutorelease((id)v26[5]);
  if (a5)
    *a5 = objc_retainAutorelease((id)v32[5]);
  v17 = v21;
  v18 = v16;

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);

  return v18;
}

void __71__CHSServerSubscription_subscribeWithResult_forcingServerUpdate_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  os_unfair_lock_s *v4;
  os_unfair_lock_s *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v3 = a2;
  v4 = *(os_unfair_lock_s **)(a1 + 32);
  v5 = v4 + 4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __71__CHSServerSubscription_subscribeWithResult_forcingServerUpdate_error___block_invoke_2;
  v7[3] = &unk_1E2A5A290;
  v7[4] = v4;
  v6 = v3;
  v8 = v6;
  os_unfair_lock_assert_not_owner(v5);
  os_unfair_lock_lock(v5);
  __71__CHSServerSubscription_subscribeWithResult_forcingServerUpdate_error___block_invoke_2((uint64_t)v7);
  os_unfair_lock_unlock(v5);

}

void __71__CHSServerSubscription_subscribeWithResult_forcingServerUpdate_error___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeObject:", *(_QWORD *)(a1 + 40));
  CHSLogSubscriptions();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(v3 + 8);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(v3 + 32), "count"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v4;
    v13 = 2114;
    v14 = v5;
    _os_log_impl(&dword_18FB18000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] Remaining local subscription count (post remove): %{public}@", (uint8_t *)&v11, 0x16u);

  }
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count"))
  {
    CHSLogSubscriptions();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v11 = 138543362;
      v12 = v7;
      _os_log_impl(&dword_18FB18000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Invalidating server subscription (no more subscribers)", (uint8_t *)&v11, 0xCu);
    }

    v9 = *(_QWORD *)(a1 + 32);
    v8 = a1 + 32;
    objc_msgSend(*(id *)(v9 + 40), "invalidate");
    v10 = *(void **)(*(_QWORD *)v8 + 40);
    *(_QWORD *)(*(_QWORD *)v8 + 40) = 0;

  }
}

void __71__CHSServerSubscription_subscribeWithResult_forcingServerUpdate_error___block_invoke_27(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  id obj;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 32);
    *(_QWORD *)(v4 + 32) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  }
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));
  CHSLogSubscriptions();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(_QWORD *)(v7 + 8);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(v7 + 32), "count"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v17 = v8;
    v18 = 2114;
    v19 = v9;
    _os_log_impl(&dword_18FB18000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Local subscription count (post add): %{public}@", buf, 0x16u);

  }
  v10 = *(void **)(a1 + 32);
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v11 + 40);
  objc_msgSend(v10, "_lock_createServerSubscriptionIfNecessary:forcing:", &obj, *(unsigned __int8 *)(a1 + 64));
  objc_storeStrong((id *)(v11 + 40), obj);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    CHSLogSubscriptions();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v14 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      *(_DWORD *)buf = 138543618;
      v17 = v13;
      v18 = 2114;
      v19 = v14;
      _os_log_impl(&dword_18FB18000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Error subscribing to server: %{public}@", buf, 0x16u);
    }

  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 24));
}

- (id)updateSubscription:(id *)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  _QWORD v7[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__3;
  v18 = __Block_byref_object_dispose__3;
  v19 = 0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__3;
  v12 = __Block_byref_object_dispose__3;
  v13 = 0;
  p_lock = &self->_lock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__CHSServerSubscription_updateSubscription___block_invoke;
  v7[3] = &unk_1E2A5A698;
  v7[4] = self;
  v7[5] = &v14;
  v7[6] = &v8;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  __44__CHSServerSubscription_updateSubscription___block_invoke(v7);
  os_unfair_lock_unlock(p_lock);
  if (a3)
    *a3 = objc_retainAutorelease((id)v15[5]);
  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);
  return v5;
}

void __44__CHSServerSubscription_updateSubscription___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  id obj;

  v2 = (void *)a1[4];
  v3 = *(_QWORD *)(a1[5] + 8);
  obj = *(id *)(v3 + 40);
  objc_msgSend(v2, "_lock_updateSubscription:", &obj);
  objc_storeStrong((id *)(v3 + 40), obj);
  objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), *(id *)(a1[4] + 24));
}

- (void)noteConnectionTerminated
{
  NSObject *v3;
  NSString *identifier;
  _QWORD v5[5];
  uint8_t buf[4];
  NSString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  CHSLogSubscriptions();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    identifier = self->_identifier;
    *(_DWORD *)buf = 138543362;
    v7 = identifier;
    _os_log_impl(&dword_18FB18000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Connection terminated; killing subscription.",
      buf,
      0xCu);
  }

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49__CHSServerSubscription_noteConnectionTerminated__block_invoke;
  v5[3] = &unk_1E2A5A2D8;
  v5[4] = self;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  __49__CHSServerSubscription_noteConnectionTerminated__block_invoke((uint64_t)v5);
  os_unfair_lock_unlock(&self->_lock);
}

void __49__CHSServerSubscription_noteConnectionTerminated__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "invalidate");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

}

- (BOOL)resubscribeIfNecessary
{
  NSObject *v3;
  NSString *identifier;
  NSObject *v5;
  NSString *v6;
  NSObject *v7;
  NSString *v8;
  uint64_t v9;
  BOOL v10;
  _QWORD v12[7];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;
  uint8_t v17[4];
  NSString *v18;
  __int16 v19;
  uint64_t v20;
  __int128 buf;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  CHSLogSubscriptions();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    identifier = self->_identifier;
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = identifier;
    _os_log_impl(&dword_18FB18000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Resubscribing to server if necessary", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__3;
  v24 = __Block_byref_object_dispose__3;
  v25 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __47__CHSServerSubscription_resubscribeIfNecessary__block_invoke;
  v12[3] = &unk_1E2A5A670;
  v12[4] = self;
  v12[5] = &v13;
  v12[6] = &buf;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  __47__CHSServerSubscription_resubscribeIfNecessary__block_invoke(v12);
  os_unfair_lock_unlock(&self->_lock);
  if (!*((_BYTE *)v14 + 24))
  {
    CHSLogSubscriptions();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = self->_identifier;
      *(_DWORD *)v17 = 138543362;
      v18 = v6;
      _os_log_impl(&dword_18FB18000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] No server subscription necessary.", v17, 0xCu);
    }

  }
  if (*(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
  {
    CHSLogSubscriptions();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = self->_identifier;
      v9 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
      *(_DWORD *)v17 = 138543618;
      v18 = v8;
      v19 = 2114;
      v20 = v9;
      _os_log_impl(&dword_18FB18000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Error re-subscribing to server: %{public}@", v17, 0x16u);
    }

  }
  v10 = *((_BYTE *)v14 + 24) != 0;
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&buf, 8);

  return v10;
}

void __47__CHSServerSubscription_resubscribeIfNecessary__block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  char v4;
  id obj;

  v2 = (void *)a1[4];
  v3 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v3 + 40);
  v4 = objc_msgSend(v2, "_lock_createServerSubscriptionIfNecessary:forcing:", &obj, 0);
  objc_storeStrong((id *)(v3 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = v4;
}

- (BOOL)_lock_createServerSubscriptionIfNecessary:(id *)a3 forcing:(BOOL)a4
{
  _BOOL4 v4;
  NSUInteger v7;
  BOOL v8;
  NSObject *v9;
  NSString *identifier;
  void *v11;
  int v13;
  NSString *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v4 = a4;
  v17 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_assert_owner(&self->_lock);
  v7 = -[NSHashTable count](self->_lock_localSubscriptions, "count");
  if (v7)
  {
    if (self->_lock_serverSubscription)
      v8 = !v4;
    else
      v8 = 0;
    if (v8)
    {
      LOBYTE(v7) = 0;
    }
    else
    {
      CHSLogSubscriptions();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        identifier = self->_identifier;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSHashTable count](self->_lock_localSubscriptions, "count"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 138543618;
        v14 = identifier;
        v15 = 2114;
        v16 = v11;
        _os_log_impl(&dword_18FB18000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Subscribing to server... %{public}@ local subscriptions.", (uint8_t *)&v13, 0x16u);

      }
      LOBYTE(v7) = -[CHSServerSubscription _lock_updateSubscription:](self, "_lock_updateSubscription:", a3);
    }
  }
  return v7;
}

- (BOOL)_lock_updateSubscription:(id *)a3
{
  void *v5;
  NSObject *v6;
  NSString *identifier;
  BSInvalidatable *v8;
  BSInvalidatable *lock_serverSubscription;
  NSObject *v10;
  NSObject *lock_cachedValue;
  void *v12;
  BOOL v13;
  NSObject *v14;
  NSString *v15;
  void *v16;
  NSObject *v17;
  NSString *v18;
  int v20;
  NSString *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  (*((void (**)(void))self->_lock_subscriptionBlock + 2))();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    CHSLogSubscriptions();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      identifier = self->_identifier;
      v20 = 138543362;
      v21 = identifier;
      _os_log_impl(&dword_18FB18000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Updating subscription to server: success", (uint8_t *)&v20, 0xCu);
    }

    -[BSInvalidatable invalidate](self->_lock_serverSubscription, "invalidate");
    objc_msgSend(v5, "assertion");
    v8 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
    lock_serverSubscription = self->_lock_serverSubscription;
    self->_lock_serverSubscription = v8;

    objc_msgSend(v5, "value");
    v10 = objc_claimAutoreleasedReturnValue();
    lock_cachedValue = self->_lock_cachedValue;
    self->_lock_cachedValue = v10;

    if (a3)
    {
      objc_msgSend(v5, "error");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12 == 0;

      if (!v13)
      {
        CHSLogSubscriptions();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          v15 = self->_identifier;
          objc_msgSend(v5, "error");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = 138543618;
          v21 = v15;
          v22 = 2114;
          v23 = v16;
          _os_log_impl(&dword_18FB18000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] Updating subscription to server: failed: %{public}@", (uint8_t *)&v20, 0x16u);

        }
      }
      objc_msgSend(v5, "error");
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    CHSLogSubscriptions();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = self->_identifier;
      v20 = 138543362;
      v21 = v18;
      _os_log_impl(&dword_18FB18000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@] Updating nsubscription to server: failed for unknown reason", (uint8_t *)&v20, 0xCu);
    }

  }
  return v5 != 0;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_lock_subscriptionBlock, 0);
  objc_storeStrong((id *)&self->_lock_serverSubscription, 0);
  objc_storeStrong((id *)&self->_lock_localSubscriptions, 0);
  objc_storeStrong((id *)&self->_lock_cachedValue, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
