@implementation _DKSyncedFeatures

+ (id)sharedInstance
{
  objc_opt_self();
  if (sharedInstance_initialized_2 != -1)
    dispatch_once(&sharedInstance_initialized_2, &__block_literal_global_50);
  return (id)sharedInstance_instance_0;
}

- (_DKSyncedFeatures)init
{
  _DKSyncedFeatures *v2;
  _DKSyncedFeatures *v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_DKSyncedFeatures;
  v2 = -[_DKSyncedFeatures init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_screenTimeSyncState = 0;
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("ScreenTimeSyncDisabled"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = objc_msgSend(v5, "BOOLValue");
        v7 = 1;
        if (!v6)
          v7 = 2;
        v3->_screenTimeSyncState = v7;
      }
    }

  }
  return v3;
}

- (void)_fetchScreenTimeSyncState
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 16));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_1_1(&dword_18DDBE000, a2, v4, "ScreenTime sync state query timed out. Falling back to state %@", (uint8_t *)&v5);

}

- (BOOL)isDigitalHealthDisabledWithIsSingleDevice:(uint64_t)a3 forTransports:
{
  _BOOL8 v5;
  void *v6;
  NSObject *v7;
  const __CFString *v8;
  int v10;
  const __CFString *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  *(_BYTE *)(a1 + 10) = a2;
  if ((a2 & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    -[_DKSyncedFeatures _fetchScreenTimeSyncState](a1);
    v5 = *(_QWORD *)(a1 + 16) == 1;
  }
  +[_DKSyncPeerStatusTracker stringForTransports:](_DKSyncPeerStatusTracker, "stringForTransports:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!*(_BYTE *)(a1 + 8) || *(_BYTE *)(a1 + 9) != v5)
  {
    *(_BYTE *)(a1 + 8) = 1;
    *(_BYTE *)(a1 + 9) = v5;
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = CFSTR("enabled");
      if (v5)
        v8 = CFSTR("disabled");
      v10 = 138543618;
      v11 = v8;
      v12 = 2114;
      v13 = v6;
      _os_log_impl(&dword_18DDBE000, v7, OS_LOG_TYPE_INFO, "Digital Health feature is %{public}@ for transport %{public}@", (uint8_t *)&v10, 0x16u);
    }

  }
  return v5;
}

- (BOOL)isIDSMessageGatingDisabled
{
  if (a1 && isIDSMessageGatingDisabled_initialized != -1)
    dispatch_once(&isIDSMessageGatingDisabled_initialized, &__block_literal_global_356);
  return a1 != 0;
}

- (uint64_t)isSiriPortraitDisabled
{
  void *v1;
  int v2;
  NSObject *v3;
  const __CFString *v4;
  _QWORD block[4];
  char v6;
  uint8_t buf[4];
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    -[objc_class sharedPreferences](getAFPreferencesClass(), "sharedPreferences");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(v1, "cloudSyncEnabled");

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __43___DKSyncedFeatures_isSiriPortraitDisabled__block_invoke;
    block[3] = &__block_descriptor_33_e5_v8__0l;
    v6 = v2;
    if (isSiriPortraitDisabled_initialized != -1)
      dispatch_once(&isSiriPortraitDisabled_initialized, block);
    if (isSiriPortraitDisabled_previousResult != v2)
    {
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        v4 = CFSTR("disabled");
        if (v2)
          v4 = CFSTR("enabled");
        *(_DWORD *)buf = 138412290;
        v8 = v4;
        _os_log_impl(&dword_18DDBE000, v3, OS_LOG_TYPE_INFO, "Siri Portrait feature is %@", buf, 0xCu);
      }

      isSiriPortraitDisabled_previousResult = v2;
    }
    return v2 ^ 1u;
  }
  return result;
}

- (uint64_t)isSupergreenDisabledForTransports:(uint64_t)a1
{
  void *v3;
  void *v4;
  int OneDay;
  uint64_t v6;
  NSObject *v7;
  const __CFString *v8;
  _QWORD block[4];
  char v11;
  uint8_t buf[4];
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend(MEMORY[0x1E0D51840], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getPairedDevices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "count"))
  {
    if (a2 == 1)
      OneDay = slREIsSupergreenUsedInLastOneDay();
    else
      OneDay = slREIsSupergreenUsedInLastSevenDays();
    v6 = OneDay ^ 1u;
  }
  else
  {
    v6 = 1;
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55___DKSyncedFeatures_isSupergreenDisabledForTransports___block_invoke;
  block[3] = &__block_descriptor_33_e5_v8__0l;
  v11 = v6;
  if (isSupergreenDisabledForTransports__initialized != -1)
    dispatch_once(&isSupergreenDisabledForTransports__initialized, block);
  if (isSupergreenDisabledForTransports__previousResult != (_DWORD)v6)
  {
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = CFSTR("enabled");
      if ((_DWORD)v6)
        v8 = CFSTR("disabled");
      *(_DWORD *)buf = 138412290;
      v13 = v8;
      _os_log_impl(&dword_18DDBE000, v7, OS_LOG_TYPE_INFO, "Supergreen feature is now %@", buf, 0xCu);
    }

    isSupergreenDisabledForTransports__previousResult = v6;
  }

  return v6;
}

- (BOOL)isEucalyptusDisabled
{
  return a1 != 0;
}

- (uint64_t)isOptimizedBatteryChargingDisabled
{
  void *v1;
  void *v2;
  int v3;
  NSObject *v4;
  const __CFString *v5;
  uint64_t v6;
  int v8;
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v1 = (void *)CFPreferencesCopyValue(CFSTR("enabled"), CFSTR("com.apple.smartcharging.topoffprotection"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B250]);
  v2 = v1;
  if (v1)
    v3 = objc_msgSend(v1, "BOOLValue");
  else
    v3 = 1;
  +[_CDLogging syncChannel](_CDLogging, "syncChannel");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = CFSTR("disabled");
    if (v3)
      v5 = CFSTR("enabled");
    v8 = 138412290;
    v9 = v5;
    _os_log_impl(&dword_18DDBE000, v4, OS_LOG_TYPE_INFO, "Optimized Battery Charging feature is %@", (uint8_t *)&v8, 0xCu);
  }

  v6 = v3 ^ 1u;
  return v6;
}

- (uint64_t)isTipsDisabled
{
  void *v1;
  void *v2;
  void *v3;
  int v4;
  NSObject *v5;
  const __CFString *v6;
  uint64_t v7;
  int v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend(MEMORY[0x1E0D51840], "sharedInstance");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "getPairedDevices");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v2, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "applicationIsInstalled:", CFSTR("com.apple.tips"));

    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = CFSTR("not ");
      if (v4)
        v6 = &stru_1E26E9728;
      v9 = 138412290;
      v10 = v6;
      _os_log_impl(&dword_18DDBE000, v5, OS_LOG_TYPE_INFO, "Tips is %@installed.", (uint8_t *)&v9, 0xCu);
    }

    v7 = v4 ^ 1u;
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  int64_t screenTimeSyncState;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;

  v3 = (void *)objc_opt_new();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@ %p: "), v5, self);

  if (-[_DKSyncedFeatures isDigitalHealthDisabledWithIsSingleDevice:forTransports:]((uint64_t)self, self->_isSingleDevice, 0))
  {
    v6 = CFSTR("YES");
  }
  else
  {
    v6 = CFSTR("NO");
  }
  objc_msgSend(v3, "appendFormat:", CFSTR("isDigitalHealthDisabled=%@"), v6);
  if (self->_isSingleDevice)
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  v8 = CFSTR("unknown");
  screenTimeSyncState = self->_screenTimeSyncState;
  if (screenTimeSyncState == 2)
    v8 = CFSTR("enabled");
  if (screenTimeSyncState == 1)
    v8 = CFSTR("disabled");
  if (self->_isDigitalHealthDisabledPreviousResult)
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR(" (isSingleDevice=%@, STState=%@) previously %@"), v7, v8, v10);
  objc_msgSend(v3, "appendString:", CFSTR(", "));
  if (-[_DKSyncedFeatures isSiriPortraitDisabled]((uint64_t)self))
    v11 = CFSTR("YES");
  else
    v11 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("isSiriPortraitDisabled=%@"), v11);
  objc_msgSend(v3, "appendString:", CFSTR(", "));
  if (-[_DKSyncedFeatures isOptimizedBatteryChargingDisabled]((uint64_t)self))
    v12 = CFSTR("YES");
  else
    v12 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("isOptimizedBatteryChargingDisabled=%@"), v12);
  objc_msgSend(v3, "appendString:", CFSTR(", "));
  if (-[_DKSyncedFeatures isTipsDisabled]((uint64_t)self))
    v13 = CFSTR("YES");
  else
    v13 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("isTipsDisabled=%@"), v13);
  objc_msgSend(v3, "appendFormat:", CFSTR(", "));
  if (-[_DKSyncedFeatures isSupergreenDisabledForTransports:]((uint64_t)self, 4))
    v14 = CFSTR("YES");
  else
    v14 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("isSupergreenDisabled(CloudDown)=%@"), v14);
  objc_msgSend(v3, "appendString:", CFSTR(", "));
  if (-[_DKSyncedFeatures isSupergreenDisabledForTransports:]((uint64_t)self, 8))
    v15 = CFSTR("YES");
  else
    v15 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("isSupergreenDisabled(CloudUp)=%@"), v15);
  objc_msgSend(v3, "appendString:", CFSTR(", "));
  if (-[_DKSyncedFeatures isSupergreenDisabledForTransports:]((uint64_t)self, 1))
    v16 = CFSTR("YES");
  else
    v16 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("isSupergreenDisabled(Rapport)=%@"), v16);
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

@end
