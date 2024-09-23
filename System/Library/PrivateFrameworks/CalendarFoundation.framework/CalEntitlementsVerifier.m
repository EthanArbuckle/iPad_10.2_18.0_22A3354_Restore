@implementation CalEntitlementsVerifier

+ (BOOL)currentProcessHasAllowSuggestionsEntitlement
{
  return objc_msgSend(a1, "currentProcessHasBooleanEntitlement:", CFSTR("com.apple.private.calendar.allow-suggestions"));
}

+ (BOOL)currentProcessHasBooleanEntitlement:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a1, "_currentProcessValueForEntitlement:loadBlock:", a3, &__block_literal_global_23);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

+ (BOOL)currentProcessHasLocationdEffectiveBundleEntitlement
{
  return objc_msgSend(a1, "currentProcessHasBooleanEntitlement:", CFSTR("com.apple.locationd.effective_bundle"));
}

uint64_t __63__CalEntitlementsVerifier_currentProcessHasBooleanEntitlement___block_invoke(int a1, CFTypeRef cf)
{
  CFTypeID v3;
  _BOOL8 v4;

  v4 = cf && (v3 = CFGetTypeID(cf), v3 == CFBooleanGetTypeID()) && CFBooleanGetValue((CFBooleanRef)cf) != 0;
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
}

+ (id)currentProcessGetStringEntitlement:(id)a3
{
  return (id)objc_msgSend(a1, "_currentProcessValueForEntitlement:loadBlock:", a3, &__block_literal_global_2);
}

id __62__CalEntitlementsVerifier_currentProcessGetStringEntitlement___block_invoke(int a1, void *cf)
{
  CFTypeID v3;
  void *v4;

  if (cf)
  {
    v3 = CFGetTypeID(cf);
    if (v3 == CFStringGetTypeID())
      v4 = cf;
    else
      v4 = 0;
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)currentProcessGetArrayOfStringsEntitlement:(id)a3
{
  return (id)objc_msgSend(a1, "_currentProcessValueForEntitlement:loadBlock:", a3, &__block_literal_global_4);
}

id __70__CalEntitlementsVerifier_currentProcessGetArrayOfStringsEntitlement___block_invoke(int a1, void *cf)
{
  CFTypeID v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  CFTypeID v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  void *v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (!cf)
    return 0;
  v3 = CFGetTypeID(cf);
  if (v3 != CFArrayGetTypeID())
  {
    v14 = CFGetTypeID(cf);
    if (v14 == CFStringGetTypeID())
    {
      v19 = cf;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1);
      return (id)objc_claimAutoreleasedReturnValue();
    }
    return 0;
  }
  v4 = cf;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v5, "addObject:", v11, (_QWORD)v15);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    }
    while (v8);
  }

  v12 = (void *)objc_msgSend(v5, "copy");
  return v12;
}

+ (id)_currentProcessValueForEntitlement:(id)a3 loadBlock:(id)a4
{
  __CFString *v5;
  void (**v6)(id, CFTypeRef);
  void *v7;
  __SecTask *v8;
  CFTypeRef v9;
  BOOL v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  CFErrorRef error;

  v5 = (__CFString *)a3;
  v6 = (void (**)(id, CFTypeRef))a4;
  os_unfair_lock_lock((os_unfair_lock_t)&_currentProcessValueForEntitlement_loadBlock__lock);
  objc_msgSend((id)_currentProcessValueForEntitlement_loadBlock__s_cache, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v8 = SecTaskCreateFromSelf((CFAllocatorRef)*MEMORY[0x1E0C9AE00]);
    error = 0;
    v9 = SecTaskCopyValueForEntitlement(v8, v5, &error);
    if (v9)
      v10 = 1;
    else
      v10 = error == 0;
    if (!v10)
    {
      +[CalFoundationLogSubsystem defaultCategory](CalFoundationLogSubsystem, "defaultCategory");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        +[CalEntitlementsVerifier _currentProcessValueForEntitlement:loadBlock:].cold.1((uint64_t)v5, (uint64_t *)&error, v11);

    }
    v6[2](v6, v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      CFRelease(v9);
    if (v8)
      CFRelease(v8);
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v12 = (void *)_currentProcessValueForEntitlement_loadBlock__s_cache;
    if (!_currentProcessValueForEntitlement_loadBlock__s_cache)
    {
      v13 = objc_opt_new();
      v14 = (void *)_currentProcessValueForEntitlement_loadBlock__s_cache;
      _currentProcessValueForEntitlement_loadBlock__s_cache = v13;

      v12 = (void *)_currentProcessValueForEntitlement_loadBlock__s_cache;
    }
    objc_msgSend(v12, "setObject:forKey:", v7, v5);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_currentProcessValueForEntitlement_loadBlock__lock);
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 == v15)
    v16 = 0;
  else
    v16 = v7;
  v17 = v16;

  return v17;
}

+ (BOOL)currentProcessIsFirstPartyCalendarApp
{
  return objc_msgSend(a1, "currentProcessHasBooleanEntitlement:", CFSTR("com.apple.private.calendar"));
}

+ (BOOL)currentProcessIsCalendarDaemon
{
  return objc_msgSend(a1, "currentProcessHasBooleanEntitlement:", CFSTR("com.apple.private.calendar.calaccessd"));
}

+ (BOOL)currentProcessIsDataAccess
{
  return objc_msgSend(a1, "currentProcessHasBooleanEntitlement:", CFSTR("com.apple.private.calendar.dataaccessd"));
}

+ (BOOL)currentProcessIsPreferences
{
  void *v2;
  char v3;

  objc_msgSend(a1, "currentProcessGetStringEntitlement:", CFSTR("application-identifier"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.Preferences"));

  return v3;
}

+ (BOOL)currentProcessIsAutomator
{
  void *v2;
  char v3;

  objc_msgSend(a1, "currentProcessGetStringEntitlement:", CFSTR("com.apple.application-identifier"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.Automator"));

  return v3;
}

+ (BOOL)currentProcessHasWatchOSMutableDatabaseEntitlement
{
  return objc_msgSend(a1, "currentProcessHasBooleanEntitlement:", CFSTR("com.apple.private.calendar.watchos-mutable-database"));
}

+ (BOOL)currentProcessHasSyncClientEntitlement
{
  return objc_msgSend(a1, "currentProcessHasBooleanEntitlement:", CFSTR("com.apple.private.calendar.syncclient"));
}

+ (BOOL)currentProcessHasCalendarToolEntitlement
{
  return objc_msgSend(a1, "currentProcessHasBooleanEntitlement:", CFSTR("com.apple.private.calendar.iamcalendar_tool"));
}

+ (BOOL)currentProcessHasBirthdayModificationEntitlement
{
  return objc_msgSend(a1, "currentProcessHasBooleanEntitlement:", CFSTR("com.apple.private.calendar.allow-birthday-modification"));
}

+ (BOOL)currentProcessHasTestingEntitlement
{
  return objc_msgSend(a1, "currentProcessHasBooleanEntitlement:", CFSTR("com.apple.private.calendar.daemon.access-level.testing"));
}

+ (BOOL)currentProcessIsFirstPartyApp
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a1, "currentProcessGetArrayOfStringsEntitlement:", CFSTR("com.apple.private.tcc.allow"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "containsObject:", CFSTR("kTCCServiceCalendar")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    objc_msgSend(a1, "currentProcessGetArrayOfStringsEntitlement:", CFSTR("com.apple.private.tcc.allow.overridable"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "containsObject:", CFSTR("kTCCServiceCalendar")) & 1) != 0)
    {
      v4 = 1;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CA5898], "bundleRecordForCurrentProcess");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "teamIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v7)
      {
        if ((objc_msgSend(v7, "isEqualToString:", CFSTR("0000000000")) & 1) != 0)
          v4 = 1;
        else
          v4 = objc_msgSend(v8, "isEqualToString:", CFSTR("ZL6BUSYGB3"));
      }
      else
      {
        v4 = 0;
      }

    }
  }

  return v4;
}

+ (BOOL)currentProcessUsesInProcessEventStores
{
  return objc_msgSend(a1, "currentProcessHasBooleanEntitlement:", CFSTR("com.apple.private.calendar.usesInProcessEventStores"));
}

+ (void)_currentProcessValueForEntitlement:(os_log_t)log loadBlock:.cold.1(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *a2;
  v4 = 138412546;
  v5 = a1;
  v6 = 2112;
  v7 = v3;
  _os_log_error_impl(&dword_18FC12000, log, OS_LOG_TYPE_ERROR, "An error occurred while checking to see if the current process has entitlement %@. %@", (uint8_t *)&v4, 0x16u);
}

@end
