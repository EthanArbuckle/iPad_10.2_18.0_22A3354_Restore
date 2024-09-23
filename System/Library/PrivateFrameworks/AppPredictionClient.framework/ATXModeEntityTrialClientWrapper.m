@implementation ATXModeEntityTrialClientWrapper

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken2 != -1)
    dispatch_once(&sharedInstance__pasOnceToken2, &__block_literal_global_3);
  return (id)sharedInstance__pasExprOnceResult_1;
}

void __49__ATXModeEntityTrialClientWrapper_sharedInstance__block_invoke()
{
  void *v0;
  ATXModeEntityTrialClientWrapper *v1;
  void *v2;

  v0 = (void *)MEMORY[0x1A85A4F90]();
  v1 = -[ATXModeEntityTrialClientWrapper initWithClientIdentifier:]([ATXModeEntityTrialClientWrapper alloc], "initWithClientIdentifier:", 105);
  v2 = (void *)sharedInstance__pasExprOnceResult_1;
  sharedInstance__pasExprOnceResult_1 = (uint64_t)v1;

  objc_autoreleasePoolPop(v0);
}

- (ATXModeEntityTrialClientWrapper)initWithClientIdentifier:(int)a3
{
  ATXModeEntityTrialClientWrapper *v3;
  id v4;
  void *v5;
  uint64_t v6;
  _PASLock *lock;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ATXModeEntityTrialClientWrapper;
  v3 = -[ATXTrialClientWrapper initWithClientIdentifier:namespaceName:](&v9, sel_initWithClientIdentifier_namespaceName_, *(_QWORD *)&a3, CFSTR("SYSTEM_SPACE_INTELLIGENCE_FOCUS_MODES"));
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0D815F0]);
    v5 = (void *)objc_opt_new();
    v6 = objc_msgSend(v4, "initWithGuardedData:", v5);
    lock = v3->_lock;
    v3->_lock = (_PASLock *)v6;

    -[ATXModeEntityTrialClientWrapper updateFactors](v3, "updateFactors");
  }
  return v3;
}

- (void)updateFactors
{
  _PASLock *lock;
  _QWORD v3[5];

  lock = self->_lock;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __48__ATXModeEntityTrialClientWrapper_updateFactors__block_invoke;
  v3[3] = &unk_1E4D57890;
  v3[4] = self;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v3);
}

void __48__ATXModeEntityTrialClientWrapper_updateFactors__block_invoke(uint64_t a1, void *a2)
{
  _QWORD *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  int v21;
  const __CFString *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  __atxlog_handle_modes();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    LOWORD(v21) = 0;
    _os_log_impl(&dword_1A49EF000, v4, OS_LOG_TYPE_INFO, "ATXModeEntityTrialClientWrapper: Updating factors", (uint8_t *)&v21, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "refreshEnrollmentInformation");
  objc_msgSend(*(id *)(a1 + 32), "dictionaryForTrialResource:", CFSTR("ATXWidgetModeEntityModelWeights"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Default_WidgetModeEntityModelWeights"));
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v3[1];
    v3[1] = v7;
  }
  else
  {
    __atxlog_handle_modes();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v21 = 138543362;
      v22 = CFSTR("ATXWidgetModeEntityModelWeights");
      _os_log_impl(&dword_1A49EF000, v8, OS_LOG_TYPE_INFO, "ATXModeEntityTrialClientWrapper: No active Trial experiment asset for %{public}@", (uint8_t *)&v21, 0xCu);
    }
  }

  objc_msgSend(*(id *)(a1 + 32), "dictionaryForTrialResource:", CFSTR("ATXNotificationModeEntityModelWeights"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("Default_NotificationModeEntityModelWeights"));
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v3[2];
    v3[2] = v11;
  }
  else
  {
    __atxlog_handle_modes();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v21 = 138543362;
      v22 = CFSTR("ATXNotificationModeEntityModelWeights");
      _os_log_impl(&dword_1A49EF000, v12, OS_LOG_TYPE_INFO, "ATXModeEntityTrialClientWrapper: No active Trial experiment asset for %{public}@", (uint8_t *)&v21, 0xCu);
    }
  }

  objc_msgSend(*(id *)(a1 + 32), "dictionaryForTrialResource:", CFSTR("ATXModeAffinityAppCategoryScores"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("Modes"));
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v3[3];
    v3[3] = v15;
  }
  else
  {
    __atxlog_handle_modes();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v21 = 138543362;
      v22 = CFSTR("ATXModeAffinityAppCategoryScores");
      _os_log_impl(&dword_1A49EF000, v16, OS_LOG_TYPE_INFO, "ATXModeEntityTrialClientWrapper: No active Trial experiment asset for %{public}@", (uint8_t *)&v21, 0xCu);
    }
  }

  objc_msgSend(*(id *)(a1 + 32), "dictionaryForTrialResource:", CFSTR("ATXModeAffinityModelsConstants"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
  {
    v19 = v17;
    v20 = v3[4];
    v3[4] = v19;
  }
  else
  {
    __atxlog_handle_modes();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      v21 = 138543362;
      v22 = CFSTR("ATXModeAffinityModelsConstants");
      _os_log_impl(&dword_1A49EF000, v20, OS_LOG_TYPE_INFO, "ATXModeEntityTrialClientWrapper: No active Trial experiment asset for %{public}@", (uint8_t *)&v21, 0xCu);
    }
  }

}

- (id)widgetModeEntityModelWeights
{
  _PASLock *lock;
  id v3;
  NSObject *v4;
  uint64_t v5;
  _QWORD v7[5];
  uint8_t buf[8];
  uint8_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)buf = 0;
  v9 = buf;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__0;
  v12 = __Block_byref_object_dispose__0;
  lock = self->_lock;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__ATXModeEntityTrialClientWrapper_widgetModeEntityModelWeights__block_invoke;
  v7[3] = &unk_1E4D578B8;
  v7[4] = buf;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v7);
  v3 = *((id *)v9 + 5);
  _Block_object_dispose(buf, 8);

  __atxlog_handle_modes();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = objc_msgSend(v3, "count");
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v5 != 0;
    _os_log_impl(&dword_1A49EF000, v4, OS_LOG_TYPE_INFO, "ATXModeEntityTrialClientWrapper: widgetModeEntityModelWeights list loaded with Trial: %{BOOL}d", buf, 8u);
  }

  return v3;
}

void __63__ATXModeEntityTrialClientWrapper_widgetModeEntityModelWeights__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(id *)(a2 + 8));
}

- (id)notificationModeEntityModelWeights
{
  _PASLock *lock;
  id v3;
  NSObject *v4;
  uint64_t v5;
  _QWORD v7[5];
  uint8_t buf[8];
  uint8_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)buf = 0;
  v9 = buf;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__0;
  v12 = __Block_byref_object_dispose__0;
  lock = self->_lock;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __69__ATXModeEntityTrialClientWrapper_notificationModeEntityModelWeights__block_invoke;
  v7[3] = &unk_1E4D578B8;
  v7[4] = buf;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v7);
  v3 = *((id *)v9 + 5);
  _Block_object_dispose(buf, 8);

  __atxlog_handle_modes();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = objc_msgSend(v3, "count");
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v5 != 0;
    _os_log_impl(&dword_1A49EF000, v4, OS_LOG_TYPE_INFO, "ATXModeEntityTrialClientWrapper: notificationModeEntityModelWeights list loaded with Trial: %{BOOL}d", buf, 8u);
  }

  return v3;
}

void __69__ATXModeEntityTrialClientWrapper_notificationModeEntityModelWeights__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(id *)(a2 + 16));
}

- (id)modeAffinityAppCategoryScores
{
  _PASLock *lock;
  id v3;
  NSObject *v4;
  uint64_t v5;
  _QWORD v7[5];
  uint8_t buf[8];
  uint8_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)buf = 0;
  v9 = buf;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__0;
  v12 = __Block_byref_object_dispose__0;
  lock = self->_lock;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__ATXModeEntityTrialClientWrapper_modeAffinityAppCategoryScores__block_invoke;
  v7[3] = &unk_1E4D578B8;
  v7[4] = buf;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v7);
  v3 = *((id *)v9 + 5);
  _Block_object_dispose(buf, 8);

  __atxlog_handle_modes();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = objc_msgSend(v3, "count");
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v5 != 0;
    _os_log_impl(&dword_1A49EF000, v4, OS_LOG_TYPE_INFO, "ATXModeEntityTrialClientWrapper: modeAffinityAppCategoryScores list loaded with Trial: %{BOOL}d", buf, 8u);
  }

  return v3;
}

void __64__ATXModeEntityTrialClientWrapper_modeAffinityAppCategoryScores__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(id *)(a2 + 24));
}

- (id)modeAffinityModelsConstants
{
  _PASLock *lock;
  id v3;
  NSObject *v4;
  uint64_t v5;
  _QWORD v7[5];
  uint8_t buf[8];
  uint8_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)buf = 0;
  v9 = buf;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__0;
  v12 = __Block_byref_object_dispose__0;
  lock = self->_lock;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__ATXModeEntityTrialClientWrapper_modeAffinityModelsConstants__block_invoke;
  v7[3] = &unk_1E4D578B8;
  v7[4] = buf;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v7);
  v3 = *((id *)v9 + 5);
  _Block_object_dispose(buf, 8);

  __atxlog_handle_modes();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = objc_msgSend(v3, "count");
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v5 != 0;
    _os_log_impl(&dword_1A49EF000, v4, OS_LOG_TYPE_INFO, "ATXModeEntityTrialClientWrapper: modeAffinityModelsConstants list loaded with Trial: %{BOOL}d", buf, 8u);
  }

  return v3;
}

void __62__ATXModeEntityTrialClientWrapper_modeAffinityModelsConstants__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(id *)(a2 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
}

@end
