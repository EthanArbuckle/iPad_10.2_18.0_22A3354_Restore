@implementation DKSyncedFeatures

void __35___DKSyncedFeatures_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_instance_0;
  sharedInstance_instance_0 = v0;

}

void __46___DKSyncedFeatures__fetchScreenTimeSyncState__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v6);

  if (v5)
  {
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __46___DKSyncedFeatures__fetchScreenTimeSyncState__block_invoke_cold_1((uint64_t)v5, v7, v8);
LABEL_4:

    goto LABEL_5;
  }
  if (a2)
  {
    v9 = *(_QWORD *)(a1 + 32);
    if (v9)
      v9 = *(_QWORD *)(v9 + 16);
    if (v9 != a2)
    {
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 138412290;
        v17 = v11;
        _os_log_impl(&dword_18DDBE000, v10, OS_LOG_TYPE_DEFAULT, "ScreenTime sync state: %@", (uint8_t *)&v16, 0xCu);

      }
      v12 = *(_QWORD *)(a1 + 32);
      if (v12)
        *(_QWORD *)(v12 + 16) = a2;
      v13 = (void *)MEMORY[0x1E0C9AAA0];
      if (a2 == 1)
        v13 = (void *)MEMORY[0x1E0C9AAB0];
      v14 = (void *)MEMORY[0x1E0C99EA0];
      v15 = v13;
      objc_msgSend(v14, "standardUserDefaults");
      v7 = objc_claimAutoreleasedReturnValue();
      -[NSObject setObject:forKey:](v7, "setObject:forKey:", v15, CFSTR("ScreenTimeSyncDisabled"));

      goto LABEL_4;
    }
  }
LABEL_5:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

void __47___DKSyncedFeatures_isIDSMessageGatingDisabled__block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  +[_CDLogging syncChannel](_CDLogging, "syncChannel");
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_18DDBE000, v0, OS_LOG_TYPE_INFO, "IDS Message Gating feature is disabled", v1, 2u);
  }

}

void __43___DKSyncedFeatures_isSiriPortraitDisabled__block_invoke(uint64_t a1)
{
  NSObject *v2;
  const __CFString *v3;
  int v4;
  const __CFString *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  isSiriPortraitDisabled_previousResult = *(_BYTE *)(a1 + 32);
  +[_CDLogging syncChannel](_CDLogging, "syncChannel");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    if (*(_BYTE *)(a1 + 32))
      v3 = CFSTR("enabled");
    else
      v3 = CFSTR("disabled");
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_18DDBE000, v2, OS_LOG_TYPE_INFO, "Siri Portrait feature is %@", (uint8_t *)&v4, 0xCu);
  }

}

void __55___DKSyncedFeatures_isSupergreenDisabledForTransports___block_invoke(uint64_t a1)
{
  NSObject *v2;
  const __CFString *v3;
  int v4;
  const __CFString *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  isSupergreenDisabledForTransports__previousResult = *(_BYTE *)(a1 + 32);
  +[_CDLogging syncChannel](_CDLogging, "syncChannel");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    if (*(_BYTE *)(a1 + 32))
      v3 = CFSTR("disabled");
    else
      v3 = CFSTR("enabled");
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_18DDBE000, v2, OS_LOG_TYPE_INFO, "Supergreen feature is %@", (uint8_t *)&v4, 0xCu);
  }

}

void __46___DKSyncedFeatures__fetchScreenTimeSyncState__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_1_1(&dword_18DDBE000, a2, a3, "Failed to get ScreenTime sync state with error: %@", (uint8_t *)&v3);
}

@end
