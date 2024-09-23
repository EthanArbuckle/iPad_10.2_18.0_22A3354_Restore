@implementation MSVBackgroundTaskProvider

- (MSVBackgroundTaskProvider)init
{
  MSVBackgroundTaskProvider *v2;
  MSVBackgroundTaskProvider *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MSVBackgroundTaskProvider;
  v2 = -[MSVBackgroundTaskProvider init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSVBackgroundTaskProvider setTimeoutGuards:](v3, "setTimeoutGuards:", v4);

  }
  return v3;
}

- (BOOL)_locked_acquireAssertion
{
  BKSProcessAssertion *v3;
  BKSProcessAssertion *v4;
  double v5;
  NSObject *v6;
  BKSProcessAssertion *v7;
  BKSProcessAssertion *assertion;
  char v9;
  NSObject *v10;
  BKSProcessAssertion *v11;
  BOOL v12;
  uint8_t v14[16];
  uint8_t buf[16];

  v3 = self->_assertion;
  v4 = v3;
  if (v3)
  {
    if (-[BKSProcessAssertion valid](v3, "valid"))
    {
      BKSProcessAssertionBackgroundTimeRemaining();
      if (v5 >= 5.0)
      {
        ++self->_assertionCount;
LABEL_13:
        v12 = 1;
        goto LABEL_14;
      }
    }
  }
  v6 = os_log_create("com.apple.amp.MediaServices", "Default");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A077D000, v6, OS_LOG_TYPE_DEFAULT, "[MSVBackgroundTaskProvider] Taking Process Assertion", buf, 2u);
  }

  v7 = (BKSProcessAssertion *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFE308]), "initWithPID:flags:reason:name:", getpid(), 1, 4, CFSTR("MSVBackgroundTaskProvider"));
  assertion = self->_assertion;
  self->_assertion = v7;

  v9 = -[BKSProcessAssertion acquire](self->_assertion, "acquire");
  if (v4)
  {
    v10 = os_log_create("com.apple.amp.MediaServices", "Default");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_1A077D000, v10, OS_LOG_TYPE_DEFAULT, "[MSVBackgroundTaskProvider] Invalidating Existing Process Assertion", v14, 2u);
    }

    -[BKSProcessAssertion invalidate](v4, "invalidate");
  }
  ++self->_assertionCount;
  if ((v9 & 1) != 0)
    goto LABEL_13;
  v11 = self->_assertion;
  self->_assertion = 0;
  self->_assertionCount = 0;

  v12 = 0;
LABEL_14:

  return v12;
}

- (void)_locked_releaseAssertion
{
  int64_t assertionCount;
  uint32_t v4;
  dispatch_time_t v5;
  NSObject *v6;
  _QWORD v7[5];
  uint32_t v8;

  assertionCount = self->_assertionCount;
  self->_assertionCount = assertionCount - 1;
  if (assertionCount <= 1)
  {
    self->_assertionCount = 0;
    v4 = arc4random();
    self->_assertionInvalidationNonce = v4;
    v5 = dispatch_time(0, 5000000000);
    dispatch_get_global_queue(9, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __53__MSVBackgroundTaskProvider__locked_releaseAssertion__block_invoke;
    v7[3] = &unk_1E43E8A00;
    v7[4] = self;
    v8 = v4;
    dispatch_after(v5, v6, v7);

  }
}

- (unint64_t)beginTaskWithName:(id)a3 expirationHandler:(id)a4
{
  id v6;
  id v7;
  os_unfair_lock_s *p_lock;
  unint64_t v9;
  MSVBlockGuard *v10;
  MSVBlockGuard *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  _QWORD v16[4];
  id v17;
  MSVBackgroundTaskProvider *v18;
  id v19;
  unint64_t v20;
  uint8_t buf[4];
  unint64_t v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (-[MSVBackgroundTaskProvider _locked_acquireAssertion](self, "_locked_acquireAssertion"))
  {
    v9 = -[MSVBackgroundTaskProvider lastIdentifier](self, "lastIdentifier") + 1;
    -[MSVBackgroundTaskProvider setLastIdentifier:](self, "setLastIdentifier:", v9);
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("BackgroundTask#%ld"), v9);
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    v10 = [MSVBlockGuard alloc];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __65__MSVBackgroundTaskProvider_beginTaskWithName_expirationHandler___block_invoke;
    v16[3] = &unk_1E43E88A8;
    v20 = v9;
    v6 = v6;
    v17 = v6;
    v18 = self;
    v19 = v7;
    v11 = -[MSVBlockGuard initWithTimeout:interruptionHandler:](v10, "initWithTimeout:interruptionHandler:", v16, 30.0);
    -[MSVBackgroundTaskProvider timeoutGuards](self, "timeoutGuards");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, v13);

    v14 = os_log_create("com.apple.amp.MediaServices", "Default");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v22 = v9;
      v23 = 2114;
      v24 = v6;
      _os_log_impl(&dword_1A077D000, v14, OS_LOG_TYPE_DEFAULT, "[MSVBackgroundTaskProvider] Background Task #%ld started (%{public}@)", buf, 0x16u);
    }

  }
  else
  {
    v9 = 0;
  }
  os_unfair_lock_unlock(p_lock);

  return v9;
}

- (unint64_t)beginTaskWithExpirationHandler:(id)a3
{
  return -[MSVBackgroundTaskProvider beginTaskWithName:expirationHandler:](self, "beginTaskWithName:expirationHandler:", 0, a3);
}

- (void)endTask:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v12;
  unint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[MSVBackgroundTaskProvider timeoutGuards](self, "timeoutGuards");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "disarm");
    -[MSVBackgroundTaskProvider timeoutGuards](self, "timeoutGuards");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", 0, v10);

    -[MSVBackgroundTaskProvider _locked_releaseAssertion](self, "_locked_releaseAssertion");
    v11 = os_log_create("com.apple.amp.MediaServices", "Default");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 134217984;
      v13 = a3;
      _os_log_impl(&dword_1A077D000, v11, OS_LOG_TYPE_DEFAULT, "[MSVBackgroundTaskProvider] Background Task #%ld ended", (uint8_t *)&v12, 0xCu);
    }

  }
  os_unfair_lock_unlock(p_lock);

}

- (unint64_t)lastIdentifier
{
  return self->_lastIdentifier;
}

- (void)setLastIdentifier:(unint64_t)a3
{
  self->_lastIdentifier = a3;
}

- (NSMutableDictionary)timeoutGuards
{
  return self->_timeoutGuards;
}

- (void)setTimeoutGuards:(id)a3
{
  objc_storeStrong((id *)&self->_timeoutGuards, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeoutGuards, 0);
  objc_storeStrong((id *)&self->_assertion, 0);
}

uint64_t __65__MSVBackgroundTaskProvider_beginTaskWithName_expirationHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = os_log_create("com.apple.amp.MediaServices", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 56);
    v6 = *(_QWORD *)(a1 + 32);
    v9 = 134218242;
    v10 = v5;
    v11 = 2114;
    v12 = v6;
    _os_log_impl(&dword_1A077D000, v4, OS_LOG_TYPE_DEFAULT, "[MSVBackgroundTaskProvider] Background Task #%ld expired (%{public}@)", (uint8_t *)&v9, 0x16u);
  }

  if (!a2)
  {
    v7 = *(_QWORD *)(a1 + 48);
    if (v7)
      (*(void (**)(void))(v7 + 16))();
  }
  return objc_msgSend(*(id *)(a1 + 40), "endTask:", *(_QWORD *)(a1 + 56));
}

void __53__MSVBackgroundTaskProvider__locked_releaseAssertion__block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  uint8_t v6[16];

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_DWORD *)(a1 + 40) == *(_DWORD *)(v2 + 32) && *(uint64_t *)(v2 + 24) <= 0 && *(_QWORD *)(v2 + 16))
  {
    v3 = os_log_create("com.apple.amp.MediaServices", "Default");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1A077D000, v3, OS_LOG_TYPE_DEFAULT, "[MSVBackgroundTaskProvider] Invalidating Process Assertion Timeout", v6, 2u);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "invalidate");
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 16);
    *(_QWORD *)(v4 + 16) = 0;

    v2 = *(_QWORD *)(a1 + 32);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 8));
}

+ (id)sharedProvider
{
  if (sharedProvider_onceToken != -1)
    dispatch_once(&sharedProvider_onceToken, &__block_literal_global_1075);
  return (id)sharedProvider_sharedInstance;
}

void __43__MSVBackgroundTaskProvider_sharedProvider__block_invoke()
{
  MSVBackgroundTaskProvider *v0;
  void *v1;

  v0 = objc_alloc_init(MSVBackgroundTaskProvider);
  v1 = (void *)sharedProvider_sharedInstance;
  sharedProvider_sharedInstance = (uint64_t)v0;

}

@end
