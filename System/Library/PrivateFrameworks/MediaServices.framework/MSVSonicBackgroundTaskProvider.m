@implementation MSVSonicBackgroundTaskProvider

- (unint64_t)beginTaskWithName:(id)a3 expirationHandler:(id)a4
{
  id v6;
  void *v7;
  MSVSonicAssertion *v8;
  MSVBlockGuard *v9;
  double invalidationDuration;
  uint64_t v11;
  MSVBlockGuard *v12;
  void *v13;
  NSMutableDictionary *expirationHandlers;
  void *v15;
  NSMutableDictionary *timeoutGuards;
  void *v17;
  NSMutableDictionary *assertions;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  id v23;
  _QWORD v24[4];
  id v25[2];
  _QWORD v26[4];
  id v27[2];
  id location;
  uint8_t buf[4];
  MSVSonicBackgroundTaskProvider *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v23 = a4;
  os_unfair_recursive_lock_lock_with_options();
  v7 = (void *)(self->_lastIdentifier + 1);
  self->_lastIdentifier = (unint64_t)v7;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("BackgroundTask#%ld"), v7);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = -[MSVSonicAssertion initWithName:]([MSVSonicAssertion alloc], "initWithName:", v6);
  if (v8)
  {
    objc_initWeak(&location, self);
    v9 = [MSVBlockGuard alloc];
    invalidationDuration = self->_invalidationDuration;
    v11 = MEMORY[0x1E0C809B0];
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __70__MSVSonicBackgroundTaskProvider_beginTaskWithName_expirationHandler___block_invoke;
    v26[3] = &unk_1E43E8988;
    objc_copyWeak(v27, &location);
    v27[1] = v7;
    v12 = -[MSVBlockGuard initWithTimeout:interruptionHandler:](v9, "initWithTimeout:interruptionHandler:", v26, invalidationDuration);
    v24[0] = v11;
    v24[1] = 3221225472;
    v24[2] = __70__MSVSonicBackgroundTaskProvider_beginTaskWithName_expirationHandler___block_invoke_2;
    v24[3] = &unk_1E43E8658;
    objc_copyWeak(v25, &location);
    v25[1] = v7;
    -[MSVSonicAssertion setInvalidationHandler:](v8, "setInvalidationHandler:", v24);
    v13 = (void *)MEMORY[0x1A1AFBD28](v23);
    expirationHandlers = self->_expirationHandlers;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](expirationHandlers, "setObject:forKeyedSubscript:", v13, v15);

    timeoutGuards = self->_timeoutGuards;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](timeoutGuards, "setObject:forKeyedSubscript:", v12, v17);

    assertions = self->_assertions;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](assertions, "setObject:forKeyedSubscript:", v8, v19);

    v20 = os_log_create("com.apple.amp.MediaServices", "Default");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218498;
      v30 = self;
      v31 = 2048;
      v32 = v7;
      v33 = 2114;
      v34 = v6;
      _os_log_impl(&dword_1A077D000, v20, OS_LOG_TYPE_DEFAULT, "MSVSonicBackgroundTaskProvider %p Task #%ld [%{public}@] started", buf, 0x20u);
    }

    objc_destroyWeak(v25);
    objc_destroyWeak(v27);
    objc_destroyWeak(&location);
  }
  else
  {
    v21 = os_log_create("com.apple.amp.MediaServices", "Default");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218498;
      v30 = self;
      v31 = 2048;
      v32 = v7;
      v33 = 2114;
      v34 = v6;
      _os_log_impl(&dword_1A077D000, v21, OS_LOG_TYPE_DEFAULT, "MSVSonicBackgroundTaskProvider %p Task #%ld [%{public}@] failed to start", buf, 0x20u);
    }

    v7 = 0;
  }
  os_unfair_recursive_lock_unlock();

  return (unint64_t)v7;
}

- (MSVSonicBackgroundTaskProvider)initWithInvalidationDuration:(double)a3
{
  MSVSonicBackgroundTaskProvider *v5;
  MSVSonicBackgroundTaskProvider *v6;
  uint64_t v7;
  NSMutableDictionary *timeoutGuards;
  uint64_t v9;
  NSMutableDictionary *expirationHandlers;
  uint64_t v11;
  NSMutableDictionary *assertions;
  MSVSonicBackgroundTaskProvider *v13;
  objc_super v15;

  if (+[MSVSonicAssertion hasEntitlement](MSVSonicAssertion, "hasEntitlement"))
  {
    v15.receiver = self;
    v15.super_class = (Class)MSVSonicBackgroundTaskProvider;
    v5 = -[MSVSonicBackgroundTaskProvider init](&v15, sel_init);
    v6 = v5;
    if (v5)
    {
      v5->_invalidationDuration = a3;
      v5->_lock = 0;
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v7 = objc_claimAutoreleasedReturnValue();
      timeoutGuards = v6->_timeoutGuards;
      v6->_timeoutGuards = (NSMutableDictionary *)v7;

      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v9 = objc_claimAutoreleasedReturnValue();
      expirationHandlers = v6->_expirationHandlers;
      v6->_expirationHandlers = (NSMutableDictionary *)v9;

      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v11 = objc_claimAutoreleasedReturnValue();
      assertions = v6->_assertions;
      v6->_assertions = (NSMutableDictionary *)v11;

    }
    self = v6;
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (unint64_t)beginTaskWithExpirationHandler:(id)a3
{
  return -[MSVSonicBackgroundTaskProvider beginTaskWithName:expirationHandler:](self, "beginTaskWithName:expirationHandler:", 0, a3);
}

- (void)endTask:(unint64_t)a3
{
  NSMutableDictionary *timeoutGuards;
  void *v6;
  void *v7;
  NSMutableDictionary *assertions;
  void *v9;
  void *v10;
  NSMutableDictionary *v11;
  void *v12;
  NSMutableDictionary *expirationHandlers;
  void *v14;
  NSMutableDictionary *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  int v19;
  MSVSonicBackgroundTaskProvider *v20;
  __int16 v21;
  unint64_t v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  os_unfair_recursive_lock_lock_with_options();
  timeoutGuards = self->_timeoutGuards;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](timeoutGuards, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "disarm");
    assertions = self->_assertions;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](assertions, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = self->_timeoutGuards;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", 0, v12);

    expirationHandlers = self->_expirationHandlers;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](expirationHandlers, "setObject:forKeyedSubscript:", 0, v14);

    v15 = self->_assertions;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", 0, v16);

    v17 = os_log_create("com.apple.amp.MediaServices", "Default");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v10, "name");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 134218498;
      v20 = self;
      v21 = 2048;
      v22 = a3;
      v23 = 2114;
      v24 = v18;
      _os_log_impl(&dword_1A077D000, v17, OS_LOG_TYPE_DEFAULT, "MSVSonicBackgroundTaskProvider %p Task #%ld [%{public}@] ended", (uint8_t *)&v19, 0x20u);

    }
  }
  os_unfair_recursive_lock_unlock();

}

- (void)_taskDidTimeout:(unint64_t)a3
{
  NSMutableDictionary *expirationHandlers;
  void *v6;
  void (**v7)(_QWORD);
  NSMutableDictionary *assertions;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  int v13;
  MSVSonicBackgroundTaskProvider *v14;
  __int16 v15;
  unint64_t v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  os_unfair_recursive_lock_lock_with_options();
  expirationHandlers = self->_expirationHandlers;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](expirationHandlers, "objectForKeyedSubscript:", v6);
  v7 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();

  assertions = self->_assertions;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](assertions, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v11 = os_log_create("com.apple.amp.MediaServices", "Default");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v10, "name");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 134218498;
      v14 = self;
      v15 = 2048;
      v16 = a3;
      v17 = 2114;
      v18 = v12;
      _os_log_impl(&dword_1A077D000, v11, OS_LOG_TYPE_DEFAULT, "MSVSonicBackgroundTaskProvider %p Task #%ld [%{public}@] expired", (uint8_t *)&v13, 0x20u);

    }
    v7[2](v7);
  }
  os_unfair_recursive_lock_unlock();

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assertions, 0);
  objc_storeStrong((id *)&self->_timeoutGuards, 0);
  objc_storeStrong((id *)&self->_expirationHandlers, 0);
}

void __70__MSVSonicBackgroundTaskProvider_beginTaskWithName_expirationHandler___block_invoke(uint64_t a1, uint64_t a2)
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

void __70__MSVSonicBackgroundTaskProvider_beginTaskWithName_expirationHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_taskDidTimeout:", *(_QWORD *)(a1 + 40));
  objc_msgSend(WeakRetained, "endTask:", *(_QWORD *)(a1 + 40));

}

@end
