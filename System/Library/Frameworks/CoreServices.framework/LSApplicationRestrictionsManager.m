@implementation LSApplicationRestrictionsManager

- (id)defaultStateProvider
{
  if (a1)
    a1 = -[LSAskManagerMCStateProvider initWithRestrictionsManager:]((id *)[LSAskManagerMCStateProvider alloc], a1);
  return a1;
}

+ (id)sharedInstance
{
  objc_opt_self();
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_5);
  return (id)sharedInstance_sharedInstance_0;
}

- (BOOL)isFeatureAllowed:(id)a3
{
  return isFeatureAllowed(a3);
}

- (uint64_t)isSystemAppDeletionEnabled
{
  void *v1;

  if (result)
  {
    v1 = (void *)result;
    if (ManagedConfigurationLibrary_frameworkLibrary)
      return objc_msgSend(v1, "isFeatureAllowed:", getMCFeatureSystemAppRemovalAllowed[0]());
    ManagedConfigurationLibrary_frameworkLibrary = (uint64_t)dlopen("/System/Library/PrivateFrameworks/ManagedConfiguration.framework/ManagedConfiguration", 2);
    if (ManagedConfigurationLibrary_frameworkLibrary)
      return objc_msgSend(v1, "isFeatureAllowed:", getMCFeatureSystemAppRemovalAllowed[0]());
    else
      return 1;
  }
  return result;
}

- (id)maximumRating
{
  void *v1;
  _QWORD v3[5];

  if (a1)
  {
    v1 = a1;
    if (!ManagedConfigurationLibrary_frameworkLibrary)
    {
      ManagedConfigurationLibrary_frameworkLibrary = (uint64_t)dlopen("/System/Library/PrivateFrameworks/ManagedConfiguration.framework/ManagedConfiguration", 2);
      if (!ManagedConfigurationLibrary_frameworkLibrary)
        return &unk_1E1075120;
    }
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __49__LSApplicationRestrictionsManager_maximumRating__block_invoke;
    v3[3] = &unk_1E1040400;
    v3[4] = v1;
    _LSLazyLoadObjectWithLock((id *)v1 + 9, (os_unfair_lock_s *)v1 + 2, v3);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (uint64_t)isApplicationRestricted:(uint64_t)a3 checkFlags:(void *)a4 stateProvider:
{
  id v7;
  id v8;
  void *v9;
  uint64_t IsApplicationRestrictedWithMCStateProvider;

  v7 = a2;
  v8 = a4;
  v9 = v8;
  IsApplicationRestrictedWithMCStateProvider = 0;
  if (a1 && (a3 & 0x40000000000) == 0)
    IsApplicationRestrictedWithMCStateProvider = computeIsApplicationRestrictedWithMCStateProvider(v8, v7, 1);

  return IsApplicationRestrictedWithMCStateProvider;
}

- (id)restrictedBundleIDs
{
  _QWORD v2[5];

  if (a1)
  {
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __55__LSApplicationRestrictionsManager_restrictedBundleIDs__block_invoke;
    v2[3] = &unk_1E1040428;
    v2[4] = a1;
    _LSLazyLoadObjectWithLock((id *)(a1 + 64), (os_unfair_lock_s *)(a1 + 8), v2);
    a1 = objc_claimAutoreleasedReturnValue();
  }
  return (id)a1;
}

- (BOOL)isAllowlistEnabled
{
  void *v1;
  _BOOL8 v2;
  _QWORD v4[5];

  if (!a1)
    return 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __54__LSApplicationRestrictionsManager_isAllowlistEnabled__block_invoke;
  v4[3] = &unk_1E1040400;
  v4[4] = a1;
  _LSLazyLoadObjectWithLock((id *)(a1 + 32), (os_unfair_lock_s *)(a1 + 8), v4);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "integerValue") != 0;

  return v2;
}

- (uint64_t)isAdTrackingEnabled
{
  if (a1
    && (ManagedConfigurationLibrary_frameworkLibrary
     || (ManagedConfigurationLibrary_frameworkLibrary = (uint64_t)dlopen("/System/Library/PrivateFrameworks/ManagedConfiguration.framework/ManagedConfiguration", 2)) != 0))
  {
    return objc_msgSend(a1, "isFeatureAllowed:", getMCFeatureIdentifierForAdvertisingAllowed[0]());
  }
  else
  {
    return 0;
  }
}

- (BOOL)isRatingAllowed:(void *)a1
{
  id v3;
  void *v4;
  int v5;
  _BOOL8 v6;

  v3 = a2;
  if (a1)
  {
    -[LSApplicationRestrictionsManager maximumRating](a1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4 && (int)objc_msgSend(v3, "intValue") >= 1)
    {
      v5 = objc_msgSend(v3, "intValue");
      v6 = v5 <= (int)objc_msgSend(v4, "intValue");
    }
    else
    {
      v6 = 1;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)isApplicationRestricted:(uint64_t)a3 checkFlags:
{
  id *v4;
  id v5;
  void *v6;
  uint64_t v7;

  if (result)
  {
    v4 = result;
    v5 = a2;
    -[LSApplicationRestrictionsManager defaultStateProvider](v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[LSApplicationRestrictionsManager isApplicationRestricted:checkFlags:stateProvider:]((uint64_t)v4, v5, a3, v6);

    return (id *)v7;
  }
  return result;
}

- (id)isApplicationRestricted:(id *)result
{
  if (result)
    return -[LSApplicationRestrictionsManager isApplicationRestricted:checkFlags:](result, a2, 0);
  return result;
}

id __49__LSApplicationRestrictionsManager_maximumRating__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_MCProfileConnection");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "effectiveValueForSetting:", getMCFeatureMaximumAppsRating[0]());
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id __54__LSApplicationRestrictionsManager_isAllowlistEnabled__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "_MCProfileConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "numberWithUnsignedInt:", objc_msgSend(v2, "appWhitelistState"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __55__LSApplicationRestrictionsManager_restrictedBundleIDs__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "_MCProfileConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "restrictedAppBundleIDsExcludingRemovedSystemApps");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_LSResolveIdentifiers:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_LSResolveIdentifiers:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

void __50__LSApplicationRestrictionsManager_sharedInstance__block_invoke()
{
  LSApplicationRestrictionsManager *v0;
  void *v1;

  v0 = objc_alloc_init(LSApplicationRestrictionsManager);
  v1 = (void *)sharedInstance_sharedInstance_0;
  sharedInstance_sharedInstance_0 = (uint64_t)v0;

}

- (LSApplicationRestrictionsManager)init
{
  id v2;
  NSObject *v3;
  dispatch_queue_t v4;
  void *v5;
  NSObject *v6;
  dispatch_time_t v7;
  void *v8;
  char *v9;
  __CFNotificationCenter *DistributedCenter;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  id location;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)LSApplicationRestrictionsManager;
  v2 = -[LSApplicationRestrictionsManager init](&v19, sel_init);
  if (v2)
  {
    if (ManagedConfigurationLibrary_frameworkLibrary
      || (ManagedConfigurationLibrary_frameworkLibrary = (uint64_t)dlopen("/System/Library/PrivateFrameworks/ManagedConfiguration.framework/ManagedConfiguration", 2)) != 0)
    {
      *((_DWORD *)v2 + 2) = 0;
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v3 = objc_claimAutoreleasedReturnValue();
      v4 = dispatch_queue_create("com.apple.lsd.restrictionsmanager.signerIdentitySyncQueue", v3);
      v5 = (void *)*((_QWORD *)v2 + 2);
      *((_QWORD *)v2 + 2) = v4;

      if (objc_msgSend((id)__LSDefaultsGetSharedInstance(), "isServer"))
      {
        objc_initWeak(&location, v2);
        v6 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, *((dispatch_queue_t *)v2 + 2));
        v7 = dispatch_time(0, 120000000000);
        dispatch_source_set_timer(v6, v7, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
        v13 = MEMORY[0x1E0C809B0];
        v14 = 3221225472;
        v15 = __40__LSApplicationRestrictionsManager_init__block_invoke;
        v16 = &unk_1E10403D8;
        objc_copyWeak(&v17, &location);
        dispatch_source_set_event_handler(v6, &v13);
        dispatch_resume(v6);
        v8 = (void *)*((_QWORD *)v2 + 3);
        *((_QWORD *)v2 + 3) = v6;

        objc_destroyWeak(&v17);
        objc_destroyWeak(&location);
      }
      if (objc_msgSend((id)__LSDefaultsGetSharedInstance(), "isServer"))
      {
        v9 = sel_handleMCEffectiveSettingsChanged;
      }
      else
      {
        v9 = sel_clearAllValues;
        DistributedCenter = CFNotificationCenterGetDistributedCenter();
        CFNotificationCenterAddObserver(DistributedCenter, v2, (CFNotificationCallback)_applicationStateChangedCallback, CFSTR("com.apple.LaunchServices.applicationStateChanged"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      }
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", v13, v14, v15, v16);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObserver:selector:name:object:", v2, v9, getMCEffectiveSettingsChangedNotification[0](), 0);

    }
  }
  return (LSApplicationRestrictionsManager *)v2;
}

- (id)allowlistedBundleIDs
{
  void *v1;
  _QWORD v3[5];

  if (a1)
  {
    v1 = a1;
    if (-[LSApplicationRestrictionsManager isAllowlistEnabled]((uint64_t)a1))
    {
      v3[0] = MEMORY[0x1E0C809B0];
      v3[1] = 3221225472;
      v3[2] = __56__LSApplicationRestrictionsManager_allowlistedBundleIDs__block_invoke;
      v3[3] = &unk_1E1040428;
      v3[4] = v1;
      _LSLazyLoadObjectWithLock((id *)v1 + 7, (os_unfair_lock_s *)v1 + 2, v3);
      a1 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      a1 = 0;
    }
  }
  return a1;
}

+ (id)activeRestrictionIdentifiers
{
  objc_opt_self();
  if (activeRestrictionIdentifiers_onceToken != -1)
    dispatch_once(&activeRestrictionIdentifiers_onceToken, &__block_literal_global_67);
  return (id)activeRestrictionIdentifiers_restrictionUUIDs;
}

void __64__LSApplicationRestrictionsManager_activeRestrictionIdentifiers__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("com.apple.lsd.appremoval"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)activeRestrictionIdentifiers_restrictionUUIDs;
  activeRestrictionIdentifiers_restrictionUUIDs = v0;

}

void __40__LSApplicationRestrictionsManager_init__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_pruneObsoleteTrustedSignerIdentities");

}

- (id)_MCRestrictionManager
{
  void *v2;
  NSObject *v3;

  objc_msgSend((Class)getMCRestrictionManagerClass[0](), "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    _LSDefaultLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      -[LSApplicationRestrictionsManager _MCRestrictionManager].cold.1();

  }
  return v2;
}

- (uint64_t)isOpenInRestrictionInEffect
{
  void *v1;
  char v2;
  uint64_t v3;
  void *v4;

  if (!a1)
    return 0;
  objc_msgSend(a1, "_MCProfileConnection");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isOpenInRestrictionInEffect");

  if ((v2 & 1) != 0)
    return 1;
  if (!objc_msgSend((id)__LSDefaultsGetSharedInstance(), "isAppleInternal"))
    return 0;
  v4 = (void *)CFPreferencesCopyValue(CFSTR("LSPretendOpenInRestrictionInEffect"), (CFStringRef)*MEMORY[0x1E0C9B228], (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
  if (v4 && (objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(v4, "BOOLValue");
  else
    v3 = 0;

  return v3;
}

- (id)_LSResolveIdentifiers:(id)a3 context:(LSContext *)a4
{
  id v4;
  void *v5;
  id v6;
  void *v7;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

id __56__LSApplicationRestrictionsManager_allowlistedBundleIDs__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "_MCProfileConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "effectiveWhitelistedAppBundleIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_LSResolveIdentifiers:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)locked_setAllowlistedBundleIDs:(uint64_t)a1
{
  const os_unfair_lock *v3;
  id v4;
  uint64_t v5;
  void *v6;

  if (a1)
  {
    v3 = (const os_unfair_lock *)(a1 + 8);
    v4 = a2;
    os_unfair_lock_assert_owner(v3);
    v5 = objc_msgSend(v4, "copy");

    v6 = *(void **)(a1 + 56);
    *(_QWORD *)(a1 + 56) = v5;

  }
}

- (void)locked_setRestrictedBundleIDs:(uint64_t)a1
{
  const os_unfair_lock *v3;
  id v4;
  uint64_t v5;
  void *v6;

  if (a1)
  {
    v3 = (const os_unfair_lock *)(a1 + 8);
    v4 = a2;
    os_unfair_lock_assert_owner(v3);
    v5 = objc_msgSend(v4, "copy");

    v6 = *(void **)(a1 + 64);
    *(_QWORD *)(a1 + 64) = v5;

  }
}

- (os_unfair_lock_s)systemMode
{
  os_unfair_lock_s *v1;
  os_unfair_lock_s *v2;
  _QWORD *v3;
  void *v5;
  _QWORD v6[2];
  void (*v7)(uint64_t);
  void *v8;
  os_unfair_lock_s *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v1 = a1;
  if (a1)
  {
    if ((objc_msgSend((id)__LSDefaultsGetSharedInstance(), "isServer") & 1) == 0
      && !_LSCurrentProcessCanAccessManagedSettings())
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", sel_systemMode, v1, CFSTR("LSApplicationRestrictionsManager.m"), 622, CFSTR("Unable to access mannaged settings."));

    }
    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__3;
    v15 = __Block_byref_object_dispose__3;
    v16 = 0;
    v2 = v1 + 2;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v7 = __46__LSApplicationRestrictionsManager_systemMode__block_invoke;
    v8 = &unk_1E1040450;
    v9 = v1;
    v10 = &v11;
    v3 = v6;
    os_unfair_lock_lock(v2);
    v7((uint64_t)v3);
    os_unfair_lock_unlock(v2);

    v1 = (os_unfair_lock_s *)(id)v12[5];
    _Block_object_dispose(&v11, 8);

  }
  return v1;
}

void __46__LSApplicationRestrictionsManager_systemMode__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 88));
}

- (void)scanForMissedNotificationsForImportantAppsIfNecessary
{
  _QWORD block[5];

  if (a1)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __89__LSApplicationRestrictionsManager_scanForMissedNotificationsForImportantAppsIfNecessary__block_invoke;
    block[3] = &unk_1E1040478;
    block[4] = a1;
    if (scanForMissedNotificationsForImportantAppsIfNecessary_once != -1)
      dispatch_once(&scanForMissedNotificationsForImportantAppsIfNecessary_once, block);
  }
}

void __89__LSApplicationRestrictionsManager_scanForMissedNotificationsForImportantAppsIfNecessary__block_invoke(uint64_t a1)
{
  char v2;
  NSObject *v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  __CFString *v28;
  void *v29;
  int v30;
  void *v31;
  int v32;
  const __CFString *v33;
  uint64_t v34;
  NSObject *v35;
  _BOOL4 v36;
  void *v37;
  void *v38;
  id *v39;
  id v40;
  void *v41;
  NSObject *v42;
  id v43;
  id obj;
  void *v45;
  _QWORD v46[4];
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint8_t buf[4];
  id v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend((id)__LSDefaultsGetSharedInstance(), "isInSyncBubble");
  _LSDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if ((v2 & 1) != 0)
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_182882000, v3, OS_LOG_TYPE_DEFAULT, "in sync bubble, not scanning for missed notifications", buf, 2u);
    }
  }
  else
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_182882000, v3, OS_LOG_TYPE_DEFAULT, "scanning for any missed notifications for important apps", buf, 2u);
    }

    v5 = *(void **)(a1 + 32);
    objc_msgSend(v5, "_MCProfileConnection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "effectiveWhitelistedAppBundleIDs");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_LSResolveIdentifiers:", v7);
    v3 = objc_claimAutoreleasedReturnValue();

    v8 = *(void **)(a1 + 32);
    objc_msgSend(v8, "_MCProfileConnection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "restrictedAppBundleIDsExcludingRemovedSystemApps");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_LSResolveIdentifiers:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "_MCProfileConnection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "appWhitelistState") != 0;

    v14 = (void *)CFPreferencesCopyValue(CFSTR("LSLastSeenImportantAppRestrictionStateKey"), CFSTR("com.apple.lsd.restrictionhardening"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
    v15 = (void *)objc_opt_class();
    v16 = (void *)objc_opt_class();
    if (_LSIsDictionaryWithKeysAndValuesOfClass(v14, v15, v16))
      v17 = v14;
    else
      v17 = 0;
    v18 = v17;

    v19 = -[LSUseValuesMCStateProvider initWithAllowlistEnabled:allowlistedBundles:restrictedBundles:]((id *)[LSUseValuesMCStateProvider alloc], v13, v3, v11);
    computeImportantBundleRestrictionState(v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v18)
    {
      v39 = v19;
      v40 = v18;
      v41 = v11;
      v42 = v3;
      v22 = v18;
      v38 = v21;
      v23 = v21;
      v43 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      v48 = 0u;
      v49 = 0u;
      v50 = 0u;
      v51 = 0u;
      v45 = v23;
      objc_msgSend(v23, "allKeys");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, buf, 16);
      if (v24)
      {
        v25 = v24;
        v26 = *(_QWORD *)v49;
        do
        {
          for (i = 0; i != v25; ++i)
          {
            if (*(_QWORD *)v49 != v26)
              objc_enumerationMutation(obj);
            v28 = *(__CFString **)(*((_QWORD *)&v48 + 1) + 8 * i);
            objc_msgSend(v45, "objectForKeyedSubscript:", v28);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = objc_msgSend(v29, "BOOLValue");
            objc_msgSend(v22, "objectForKeyedSubscript:", v28);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = objc_msgSend(v31, "BOOLValue");

            if (v30 != v32)
            {
              if (_LSIsNewsWidgetBundleIdentifier(v28))
                v33 = CFSTR("com.apple.news");
              else
                v33 = v28;
              objc_msgSend(v43, "addObject:", v33);
            }
          }
          v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, buf, 16);
        }
        while (v25);
      }

      v34 = objc_msgSend(v43, "count");
      _LSDefaultLog();
      v35 = objc_claimAutoreleasedReturnValue();
      v36 = os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT);
      if (v34)
      {
        v19 = v39;
        if (v36)
        {
          *(_DWORD *)buf = 138543362;
          v53 = v43;
          _os_log_impl(&dword_182882000, v35, OS_LOG_TYPE_DEFAULT, "Found important apps whose restriction state changed before startup: %{public}@", buf, 0xCu);
        }

        +[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v46[0] = MEMORY[0x1E0C809B0];
        v46[1] = 3221225472;
        v46[2] = __89__LSApplicationRestrictionsManager_scanForMissedNotificationsForImportantAppsIfNecessary__block_invoke_95;
        v46[3] = &unk_1E1040478;
        v47 = v45;
        objc_msgSend(v37, "sendApplicationStateChangedNotificationsFor:stateProvider:completion:", v43, v39, v46);

      }
      else
      {
        v19 = v39;
        if (v36)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_182882000, v35, OS_LOG_TYPE_DEFAULT, "No important app restriction state changes, continuing.", buf, 2u);
        }

        saveImportantBundleRestrictionState(v45);
      }
      v11 = v41;
      v3 = v42;
      v18 = v40;
      v21 = v38;

    }
    else
    {
      saveImportantBundleRestrictionState(v20);
    }

  }
}

void __89__LSApplicationRestrictionsManager_scanForMissedNotificationsForImportantAppsIfNecessary__block_invoke_95(uint64_t a1)
{
  saveImportantBundleRestrictionState(*(void **)(a1 + 32));
}

- (void)beginListeningForChanges
{
  os_unfair_lock_s *v2;
  os_unfair_lock_s *v3;
  _QWORD *v4;
  _QWORD v5[2];
  void (*v6)(uint64_t);
  void *v7;
  os_unfair_lock_s *v8;

  if (a1)
  {
    _LSServer_DatabaseExecutionContext();
    v2 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
    -[LSDBExecutionContext assertActiveForThisThread](v2);

    if (ManagedConfigurationLibrary_frameworkLibrary
      || (ManagedConfigurationLibrary_frameworkLibrary = (uint64_t)dlopen("/System/Library/PrivateFrameworks/ManagedConfiguration.framework/ManagedConfiguration", 2)) != 0)
    {
      v3 = a1 + 2;
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v6 = __60__LSApplicationRestrictionsManager_beginListeningForChanges__block_invoke;
      v7 = &unk_1E1040478;
      v8 = a1;
      v4 = v5;
      os_unfair_lock_lock(v3);
      v6((uint64_t)v4);
      os_unfair_lock_unlock(v3);

    }
  }
}

void __60__LSApplicationRestrictionsManager_beginListeningForChanges__block_invoke(uint64_t a1)
{
  NSObject *v2;
  int inited;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  int v25;
  uint64_t v26;
  _QWORD v27[5];
  id v28;
  uint8_t buf[8];

  _LSDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_182882000, v2, OS_LOG_TYPE_DEFAULT, "Fetching all restrictions values and listening for change notifications", buf, 2u);
  }

  v28 = 0;
  *(_QWORD *)buf = 0;
  inited = _LSContextInitReturningError((id *)buf, &v28);
  v4 = v28;
  if (inited)
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v5, "_MCProfileConnection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "effectiveWhitelistedAppBundleIDs");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_LSResolveIdentifiers:context:", v7, buf);
    v8 = objc_claimAutoreleasedReturnValue();

    -[LSApplicationRestrictionsManager locked_setAllowlistedBundleIDs:](*(_QWORD *)(a1 + 32), v8);
    v9 = *(void **)(a1 + 32);
    objc_msgSend(v9, "_MCProfileConnection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "restrictedAppBundleIDsExcludingRemovedSystemApps");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_LSResolveIdentifiers:context:", v11, buf);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[LSApplicationRestrictionsManager locked_setRestrictedBundleIDs:](*(_QWORD *)(a1 + 32), v12);
    _LSContextDestroy((void **)buf);

  }
  else
  {
    _LSDefaultLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __60__LSApplicationRestrictionsManager_beginListeningForChanges__block_invoke_cold_1((uint64_t)v4, v8, v13);
  }

  _LSDatabaseGetSeedingGroup();
  v14 = objc_claimAutoreleasedReturnValue();
  _LSServer_GetAsyncWorkQueue();
  v15 = objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __60__LSApplicationRestrictionsManager_beginListeningForChanges__block_invoke_96;
  v27[3] = &unk_1E1040478;
  v27[4] = *(_QWORD *)(a1 + 32);
  dispatch_group_notify(v14, v15, v27);

  v16 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "_MCProfileConnection");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "numberWithUnsignedInt:", objc_msgSend(v17, "appWhitelistState"));
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = *(_QWORD *)(a1 + 32);
  v20 = *(void **)(v19 + 32);
  *(_QWORD *)(v19 + 32) = v18;

  objc_msgSend(*(id *)(a1 + 32), "_MCProfileConnection");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "effectiveValueForSetting:", getMCFeatureMaximumAppsRating[0]());
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = *(_QWORD *)(a1 + 32);
  v24 = *(void **)(v23 + 72);
  *(_QWORD *)(v23 + 72) = v22;

  v25 = -[LSApplicationRestrictionsManager isSystemAppDeletionEnabled](*(_QWORD *)(a1 + 32));
  v26 = 1;
  if (!v25)
    v26 = 2;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = v26;

}

void __60__LSApplicationRestrictionsManager_beginListeningForChanges__block_invoke_96(uint64_t a1)
{
  -[LSApplicationRestrictionsManager scanForMissedNotificationsForImportantAppsIfNecessary](*(_QWORD *)(a1 + 32));
}

- (id)calculateSetDifference:(id)a3 and:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  uint64_t v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  _LSDefaultLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[LSApplicationRestrictionsManager calculateSetDifference:and:].cold.1((uint64_t)v5, (uint64_t)v6, v7);

  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v9 = v5;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v27 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
        if ((objc_msgSend(v6, "containsObject:", v14) & 1) == 0)
          objc_msgSend(v8, "addObject:", v14);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v11);
  }

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v15 = v6;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v23;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v23 != v18)
          objc_enumerationMutation(v15);
        v20 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * j);
        if ((objc_msgSend(v9, "containsObject:", v20, (_QWORD)v22) & 1) == 0)
          objc_msgSend(v8, "addObject:", v20);
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v17);
  }

  return v8;
}

- (void)handleSystemModeChangeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_restrictionsAccessLock;
  id v6;
  _QWORD *v7;
  void *v8;
  _QWORD v9[2];
  void (*v10)(uint64_t);
  void *v11;
  LSApplicationRestrictionsManager *v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v4 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__3;
  v19 = __Block_byref_object_dispose__3;
  v20 = 0;
  p_restrictionsAccessLock = &self->_restrictionsAccessLock;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v10 = __61__LSApplicationRestrictionsManager_handleSystemModeChangeTo___block_invoke;
  v11 = &unk_1E10404A0;
  v14 = &v15;
  v12 = self;
  v6 = v4;
  v13 = v6;
  v7 = v9;
  os_unfair_lock_lock(p_restrictionsAccessLock);
  v10((uint64_t)v7);
  os_unfair_lock_unlock(p_restrictionsAccessLock);

  if ((id)v16[5] != v6)
  {
    +[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sendExtensionNotificationsForSystemModeChangeFrom:to:", v16[5], v6);

  }
  _Block_object_dispose(&v15, 8);

}

void __61__LSApplicationRestrictionsManager_handleSystemModeChangeTo___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 88));
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 88), *(id *)(a1 + 40));
}

- (void)handleMCEffectiveSettingsChanged
{
  NSObject *v3;
  os_unfair_lock_s *p_restrictionsAccessLock;
  _BOOL8 *v5;
  int v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  const __CFString *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id *v34;
  void *v35;
  id *v36;
  int v37;
  NSObject *v38;
  int v39;
  _BOOL4 server_newsWidgetIsRestricted;
  uint8_t *v41;
  void *v42;
  id v43;
  id v44;
  id v45;
  id v46;
  _QWORD *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  _QWORD v51[2];
  void (*v52)(uint64_t);
  void *v53;
  LSApplicationRestrictionsManager *v54;
  id v55;
  id v56;
  id v57;
  id v58;
  uint64_t v59;
  _QWORD v60[4];
  id *v61;
  _QWORD v62[2];
  BOOL (*v63)(_BOOL8 *);
  void *v64;
  LSApplicationRestrictionsManager *v65;
  uint8_t *v66;
  uint64_t *v67;
  uint8_t buf[8];
  uint8_t *v69;
  uint64_t v70;
  char v71;
  uint64_t v72;
  uint64_t *v73;
  uint64_t v74;
  uint64_t v75;
  uint8_t v76[4];
  _BYTE v77[10];
  __int16 v78;
  _BOOL4 v79;
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v72 = 0;
  v73 = &v72;
  v74 = 0x2020000000;
  v75 = 0;
  _LSDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_182882000, v3, OS_LOG_TYPE_DEFAULT, "LSAppRestrictionsManager: handleMCEffectiveSettingsChanged.", buf, 2u);
  }

  *(_QWORD *)buf = 0;
  v69 = buf;
  v70 = 0x2020000000;
  v71 = 0;
  -[LSApplicationRestrictionsManager scanForMissedNotificationsForImportantAppsIfNecessary]((uint64_t)self);
  p_restrictionsAccessLock = &self->_restrictionsAccessLock;
  v62[0] = MEMORY[0x1E0C809B0];
  v62[1] = 3221225472;
  v63 = __68__LSApplicationRestrictionsManager_handleMCEffectiveSettingsChanged__block_invoke;
  v64 = &unk_1E10404C8;
  v65 = self;
  v66 = buf;
  v67 = &v72;
  v5 = v62;
  os_unfair_lock_lock(&self->_restrictionsAccessLock);
  v63(v5);
  os_unfair_lock_unlock(&self->_restrictionsAccessLock);

  v6 = -[LSApplicationRestrictionsManager isSystemAppDeletionEnabled]((uint64_t)self);
  v7 = 1;
  if (!v6)
    v7 = 2;
  v49 = v7;
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB37E8];
  -[LSApplicationRestrictionsManager _MCProfileConnection](self, "_MCProfileConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "numberWithUnsignedInt:", objc_msgSend(v10, "appWhitelistState"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v50, "integerValue");
  -[LSApplicationRestrictionsManager _MCProfileConnection](self, "_MCProfileConnection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "effectiveValueForSetting:", getMCFeatureMaximumAppsRating[0]());
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v11;

  if (v11)
  {
    -[LSApplicationRestrictionsManager _MCProfileConnection](self, "_MCProfileConnection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "effectiveWhitelistedAppBundleIDs");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[LSApplicationRestrictionsManager _LSResolveIdentifiers:](self, "_LSResolveIdentifiers:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = 0;
  }
  -[LSApplicationRestrictionsManager _MCProfileConnection](self, "_MCProfileConnection");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "restrictedAppBundleIDsExcludingRemovedSystemApps");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[LSApplicationRestrictionsManager _LSResolveIdentifiers:](self, "_LSResolveIdentifiers:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if ((v13 != 0) == -[LSApplicationRestrictionsManager isAllowlistEnabled]((uint64_t)self))
  {
    -[LSApplicationRestrictionsManager maximumRating](self);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "intValue");
    LOBYTE(v26) = v26 == objc_msgSend(v48, "intValue");

    if ((v26 & 1) != 0)
    {
      if (v13)
      {
        -[LSApplicationRestrictionsManager allowlistedBundleIDs](self);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[LSApplicationRestrictionsManager calculateSetDifference:and:](self, "calculateSetDifference:and:", v27, v16);
      }
      else
      {
        -[LSApplicationRestrictionsManager restrictedBundleIDs]((uint64_t)self);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[LSApplicationRestrictionsManager calculateSetDifference:and:](self, "calculateSetDifference:and:", v27, v19);
      }
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "unionSet:", v28);
      _LSDefaultLog();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v76 = 138412290;
        *(_QWORD *)v77 = v8;
        _os_log_impl(&dword_182882000, v22, OS_LOG_TYPE_DEFAULT, "LSAppRestrictionsManager: settings changed, state changed apps %@", v76, 0xCu);
      }
    }
    else
    {
      _LSDefaultLog();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v76 = 138412290;
        *(_QWORD *)v77 = v48;
        _os_log_impl(&dword_182882000, v29, OS_LOG_TYPE_DEFAULT, "LSAppRestrictionsManager: new max rating set to %@", v76, 0xCu);
      }

      +[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace");
      v22 = objc_claimAutoreleasedReturnValue();
      -[LSApplicationRestrictionsManager maximumRating](self);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject scanForApplicationStateChangesFromRank:toRank:](v22, "scanForApplicationStateChangesFromRank:toRank:", v30, v48);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "unionSet:", v31);

    }
  }
  else
  {
    _LSDefaultLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = CFSTR("OFF");
      if (v13)
        v21 = CFSTR("ON");
      *(_DWORD *)v76 = 138412290;
      *(_QWORD *)v77 = v21;
      _os_log_impl(&dword_182882000, v20, OS_LOG_TYPE_DEFAULT, "LSAppRestrictionsManager: allowlist turned %@", v76, 0xCu);
    }

    +[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace");
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = v16;
    if (!v13)
    {
      -[LSApplicationRestrictionsManager allowlistedBundleIDs](self);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[NSObject scanForApplicationStateChangesWithAllowlist:](v22, "scanForApplicationStateChangesWithAllowlist:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "unionSet:", v24);

    if (!v13)
  }

  if (v73[3] != v49)
  {
    +[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "scanForForDeletableSystemApps");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "unionSet:", v33);

  }
  if (objc_msgSend(v8, "count"))
  {
    v34 = -[LSUseValuesMCStateProvider initWithAllowlistEnabled:allowlistedBundles:restrictedBundles:]((id *)[LSUseValuesMCStateProvider alloc], v13 != 0, v16, v19);
    +[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v60[0] = MEMORY[0x1E0C809B0];
    v60[1] = 3221225472;
    v60[2] = __68__LSApplicationRestrictionsManager_handleMCEffectiveSettingsChanged__block_invoke_102;
    v60[3] = &unk_1E1040478;
    v36 = v34;
    v61 = v36;
    objc_msgSend(v35, "sendApplicationStateChangedNotificationsFor:stateProvider:completion:", v8, v36, v60);

  }
  v37 = objc_msgSend(v8, "containsObject:", CFSTR("com.apple.news"));
  _LSDefaultLog();
  v38 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
  {
    v39 = v69[24];
    server_newsWidgetIsRestricted = self->_server_newsWidgetIsRestricted;
    *(_DWORD *)v76 = 67109632;
    *(_DWORD *)v77 = v37;
    *(_WORD *)&v77[4] = 1024;
    *(_DWORD *)&v77[6] = v39;
    v78 = 1024;
    v79 = server_newsWidgetIsRestricted;
    _os_log_impl(&dword_182882000, v38, OS_LOG_TYPE_DEFAULT, "LSAppRestrictionsManager: news changed state: %d widget restricted: %d widget was restricted: %d", v76, 0x14u);
  }

  v41 = v69;
  if ((v37 & 1) == 0 && v69[24] != self->_server_newsWidgetIsRestricted)
  {
    +[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "sendExtensionNotificationsForExtensionBundleIdentifier:changingRestrictionStateTo:", CFSTR("com.apple.news.widget"), v69[24]);

    v41 = v69;
  }
  self->_server_newsWidgetIsRestricted = v41[24];
  v51[0] = MEMORY[0x1E0C809B0];
  v51[1] = 3221225472;
  v52 = __68__LSApplicationRestrictionsManager_handleMCEffectiveSettingsChanged__block_invoke_103;
  v53 = &unk_1E10404F0;
  v54 = self;
  v43 = v16;
  v55 = v43;
  v44 = v19;
  v56 = v44;
  v45 = v50;
  v57 = v45;
  v46 = v48;
  v58 = v46;
  v59 = v49;
  v47 = v51;
  os_unfair_lock_lock(p_restrictionsAccessLock);
  v52((uint64_t)v47);
  os_unfair_lock_unlock(p_restrictionsAccessLock);

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v72, 8);
}

BOOL __68__LSApplicationRestrictionsManager_handleMCEffectiveSettingsChanged__block_invoke(_BOOL8 *a1)
{
  _BOOL8 result;

  result = -[LSApplicationRestrictionsManager isAppExtensionRestricted:](a1[4], CFSTR("com.apple.news.widget"));
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = result;
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = *(_QWORD *)(a1[4] + 40);
  return result;
}

- (BOOL)isAppExtensionRestricted:(_BOOL8)a1
{
  id v3;

  v3 = a2;
  if (a1)
    a1 = (ManagedConfigurationLibrary_frameworkLibrary
       || (ManagedConfigurationLibrary_frameworkLibrary = (uint64_t)dlopen("/System/Library/PrivateFrameworks/ManagedConfiguration.framework/ManagedConfiguration", 2)) != 0)&& _LSIsNewsWidgetBundleIdentifier(v3)&& !objc_msgSend((id)a1, "isFeatureAllowed:", getMCFeatureNewsTodayAllowed[0]());

  return a1;
}

void __68__LSApplicationRestrictionsManager_handleMCEffectiveSettingsChanged__block_invoke_102(uint64_t a1)
{
  id v1;

  computeImportantBundleRestrictionState(*(void **)(a1 + 32));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  saveImportantBundleRestrictionState(v1);

}

void __68__LSApplicationRestrictionsManager_handleMCEffectiveSettingsChanged__block_invoke_103(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  -[LSApplicationRestrictionsManager locked_setAllowlistedBundleIDs:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
  -[LSApplicationRestrictionsManager locked_setRestrictedBundleIDs:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 48));
  v2 = objc_msgSend(*(id *)(a1 + 56), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 32);
  *(_QWORD *)(v3 + 32) = v2;

  v5 = objc_msgSend(*(id *)(a1 + 64), "copy");
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 72);
  *(_QWORD *)(v6 + 72) = v5;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = *(_QWORD *)(a1 + 72);
}

- (void)clearAllValues
{
  os_unfair_lock_s *p_restrictionsAccessLock;
  _QWORD *v3;
  _QWORD v4[2];
  void (*v5)(uint64_t);
  void *v6;
  LSApplicationRestrictionsManager *v7;

  p_restrictionsAccessLock = &self->_restrictionsAccessLock;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v5 = __50__LSApplicationRestrictionsManager_clearAllValues__block_invoke;
  v6 = &unk_1E1040478;
  v7 = self;
  v3 = v4;
  os_unfair_lock_lock(p_restrictionsAccessLock);
  v5((uint64_t)v3);
  os_unfair_lock_unlock(p_restrictionsAccessLock);

}

void __50__LSApplicationRestrictionsManager_clearAllValues__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 32);
  *(_QWORD *)(v2 + 32) = 0;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 72);
  *(_QWORD *)(v4 + 72) = 0;

  -[LSApplicationRestrictionsManager locked_setRestrictedBundleIDs:](*(_QWORD *)(a1 + 32), 0);
  -[LSApplicationRestrictionsManager locked_setAllowlistedBundleIDs:](*(_QWORD *)(a1 + 32), 0);
}

- (void)schedulePruneObsoleteTrustedSignerIdentities
{
  dispatch_time_t v2;

  if (a1)
  {
    dispatch_assert_queue_not_V2(*(dispatch_queue_t *)(a1 + 16));
    if (objc_msgSend((id)__LSDefaultsGetSharedInstance(), "isServer"))
    {
      v2 = dispatch_time(0, 1000000000);
      dispatch_source_set_timer(*(dispatch_source_t *)(a1 + 24), v2, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
    }
  }
}

- (void)_pruneObsoleteTrustedSignerIdentities
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_20(&dword_182882000, v0, v1, "-_pruneObsoleteTrustedSignerIdentities can only be called in lsd", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_33();
}

void __73__LSApplicationRestrictionsManager__pruneObsoleteTrustedSignerIdentities__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  os_unfair_lock_s *v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  _LSDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __73__LSApplicationRestrictionsManager__pruneObsoleteTrustedSignerIdentities__block_invoke_cold_1();

  v3 = objc_alloc(MEMORY[0x1E0C99E20]);
  objc_msgSend(*(id *)(a1 + 32), "_MCProfileConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trustedCodeSigningIdentities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithArray:", v5);

  v7 = (void *)objc_msgSend(v6, "mutableCopy");
  _LSServer_DatabaseExecutionContext();
  v8 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __73__LSApplicationRestrictionsManager__pruneObsoleteTrustedSignerIdentities__block_invoke_104;
  v12[3] = &unk_1E1040518;
  v9 = v7;
  v13 = v9;
  -[LSDBExecutionContext syncRead:](v8, v12);

  if (v6 && objc_msgSend(v9, "count"))
  {
    objc_msgSend(v6, "minusSet:", v9);
    objc_msgSend(*(id *)(a1 + 32), "_MCProfileConnection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allObjects");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTrustedCodeSigningIdentities:", v11);

  }
}

void __73__LSApplicationRestrictionsManager__pruneObsoleteTrustedSignerIdentities__block_invoke_104(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  +[LSApplicationRecord enumeratorWithOptions:](LSApplicationRecord, "enumeratorWithOptions:", 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v6), "signerIdentity");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7)
          objc_msgSend(*(id *)(a1 + 32), "removeObject:", v7);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (BOOL)_LSApplyRestrictedSet:(id)a3 forRestriction:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  __CFString *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  id v21;
  __int16 v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  const __CFString *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1E0C99E08];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "MCSetUnionRestriction:values:", v7, v10);
  v11 = (void *)objc_msgSend(v9, "copy");
  v22 = 0;
  _LSDefaultLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v24 = (uint64_t)v11;
    v25 = 2112;
    v26 = CFSTR("com.apple.lsd.appremoval");
    _os_log_impl(&dword_182882000, v12, OS_LOG_TYPE_DEFAULT, "ManagedConfiguration applyRestrictionDictionary:%@ clientType:%@", buf, 0x16u);
  }

  -[LSApplicationRestrictionsManager _MCProfileConnection](self, "_MCProfileConnection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  v14 = objc_msgSend(v13, "applyRestrictionDictionary:clientType:clientUUID:localizedClientDescription:localizedWarningMessage:outRestrictionChanged:outEffectiveSettingsChanged:outError:", v11, CFSTR("com.apple.lsd.appremoval"), CFSTR("com.apple.lsd.appremoval"), &stru_1E10473A0, 0, (char *)&v22 + 1, &v22, &v21);
  v15 = (__CFString *)v21;

  _LSDefaultLog();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v14);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v17;
    if (v15)
      v19 = v15;
    else
      v19 = &stru_1E10473A0;
    *(_DWORD *)buf = 138412546;
    v24 = v17;
    v25 = 2112;
    v26 = v19;
    _os_log_impl(&dword_182882000, v16, OS_LOG_TYPE_DEFAULT, "ManagedConfiguration applyRestrictionDictionary complete with result %@ %@", buf, 0x16u);

  }
  return v14;
}

- (BOOL)cleanRemovedSystemApplicationsList
{
  return a1 != 0;
}

- (void)setRemovedSystemApplicationIdentifiers:(void *)a1
{
  id v3;

  v3 = a2;
  if (a1)
  {
    if (ManagedConfigurationLibrary_frameworkLibrary
      || (ManagedConfigurationLibrary_frameworkLibrary = (uint64_t)dlopen("/System/Library/PrivateFrameworks/ManagedConfiguration.framework/ManagedConfiguration", 2)) != 0)
    {
      objc_msgSend(a1, "_LSApplyRestrictedSet:forRestriction:", v3, getMCFeatureRemovedSystemAppBundleIDs[0]());
    }
  }

}

- (id)removedSystemApplicationIdentifiers
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  if (a1)
  {
    objc_msgSend(a1, "_MCProfileConnection");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "removedSystemAppBundleIDs");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "_LSResolveIdentifiers:", v3);
    v1 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v1;
}

- (uint64_t)setApplication:(int)a3 removed:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!a1)
    goto LABEL_15;
  if (!ManagedConfigurationLibrary_frameworkLibrary)
  {
    ManagedConfigurationLibrary_frameworkLibrary = (uint64_t)dlopen("/System/Library/PrivateFrameworks/ManagedConfiguration.framework/ManagedConfiguration", 2);
    if (!ManagedConfigurationLibrary_frameworkLibrary)
    {
      a1 = 0;
      goto LABEL_15;
    }
  }
  objc_msgSend((id)a1, "_MCProfileConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removedSystemAppBundleIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)a1, "_LSResolveIdentifiers:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  if (a3)
  {
    objc_msgSend(v9, "addObject:", v5);
    _LSDefaultLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138412290;
      v15 = v5;
      v11 = "Added identifier %@ to removedSystemApplications list";
LABEL_9:
      _os_log_impl(&dword_182882000, v10, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v14, 0xCu);
    }
  }
  else
  {
    objc_msgSend(v9, "removeObject:", v5);
    _LSDefaultLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138412290;
      v15 = v5;
      v11 = "Removed identifier %@ from removedSystemApplications list";
      goto LABEL_9;
    }
  }

  a1 = objc_msgSend((id)a1, "_LSApplyRestrictedSet:forRestriction:", v9, getMCFeatureRemovedSystemAppBundleIDs[0]());
  if ((a1 & 1) == 0)
  {
    _LSDefaultLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[LSApplicationRestrictionsManager setApplication:removed:].cold.1(a3, (uint64_t)v5, v12);

  }
LABEL_15:

  return a1;
}

- (id)isApplicationRestricted:(int)a3 checkFeatureRestrictions:
{
  id *v4;
  id v5;
  void *v6;
  uint64_t IsApplicationRestrictedWithMCStateProvider;

  if (result)
  {
    v4 = result;
    v5 = a2;
    -[LSApplicationRestrictionsManager defaultStateProvider](v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    IsApplicationRestrictedWithMCStateProvider = computeIsApplicationRestrictedWithMCStateProvider(v6, v5, a3);

    return (id *)IsApplicationRestrictedWithMCStateProvider;
  }
  return result;
}

- (id)allowedOpenInAppBundleIDsAfterApplyingFilterToAppBundleIDs:(void *)a3 originatingAppBundleID:(uint64_t)a4 originatingAccountIsManaged:
{
  id v4;
  id v7;
  id v8;
  void *v9;
  void *v10;

  v4 = a1;
  if (a1)
  {
    v7 = a3;
    v8 = a2;
    objc_msgSend(v4, "_MCProfileConnection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "allowedOpenInAppBundleIDsAfterApplyingFilterToAppBundleIDs:originatingAppBundleID:originatingAccountIsManaged:", v8, v7, a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v10);
      v4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = 0;
    }

  }
  return v4;
}

- (uint64_t)isLimitAdTrackingForced
{
  void *v1;

  if (result)
  {
    v1 = (void *)result;
    if (ManagedConfigurationLibrary_frameworkLibrary)
      return objc_msgSend(v1, "isFeatureAllowed:", getMCFeatureLimitAdTrackingForced[0]());
    ManagedConfigurationLibrary_frameworkLibrary = (uint64_t)dlopen("/System/Library/PrivateFrameworks/ManagedConfiguration.framework/ManagedConfiguration", 2);
    if (ManagedConfigurationLibrary_frameworkLibrary)
      return objc_msgSend(v1, "isFeatureAllowed:", getMCFeatureLimitAdTrackingForced[0]());
    else
      return 1;
  }
  return result;
}

- (BOOL)forceUpdateRestrictionKnowledgeWithError:(void *)a1
{
  void *v2;
  void *v3;

  if (a1)
  {
    objc_msgSend(a1, "_MCRestrictionManager");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "invalidateSettings");

    objc_msgSend(a1, "_MCRestrictionManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "invalidateRestrictions");

    objc_msgSend(a1, "handleMCEffectiveSettingsChanged");
  }
  return a1 != 0;
}

- (MOEffectiveSettings)effectiveSettings
{
  return (MOEffectiveSettings *)objc_getProperty(self, a2, 80, 1);
}

- (void)setEffectiveSettings:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemMode, 0);
  objc_storeStrong((id *)&self->_effectiveSettings, 0);
  objc_storeStrong((id *)&self->_maximumRating, 0);
  objc_storeStrong((id *)&self->_restrictedBundleIDs, 0);
  objc_storeStrong((id *)&self->_allowlistedBundleIDs, 0);
  objc_storeStrong((id *)&self->_allowlistState, 0);
  objc_storeStrong((id *)&self->_signerIdentitySyncSource, 0);
  objc_storeStrong((id *)&self->_signerIdentitySyncQueue, 0);
}

- (void)_MCRestrictionManager
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_20(&dword_182882000, v0, v1, "LSRestrictionsManager: [MCRestrictionManager sharedManager] returned nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_33();
}

void __60__LSApplicationRestrictionsManager_beginListeningForChanges__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 136315394;
  v4 = "-[LSApplicationRestrictionsManager beginListeningForChanges]_block_invoke";
  v5 = 2112;
  v6 = a1;
  OUTLINED_FUNCTION_4_0(&dword_182882000, a2, a3, "Could not set allowlisted or restricted bundleIDs: could not get context in %s: %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

- (void)calculateSetDifference:(os_log_t)log and:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_debug_impl(&dword_182882000, log, OS_LOG_TYPE_DEBUG, "LSAppRestrictionsManager: comparing old %@ to new %@", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_1();
}

void __73__LSApplicationRestrictionsManager__pruneObsoleteTrustedSignerIdentities__block_invoke_cold_1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_3_1();
  _os_log_debug_impl(&dword_182882000, v0, OS_LOG_TYPE_DEBUG, "Updating trusted signer identifiers.", v1, 2u);
  OUTLINED_FUNCTION_33();
}

- (void)setApplication:(NSObject *)a3 removed:.cold.1(char a1, uint64_t a2, NSObject *a3)
{
  const __CFString *v3;
  int v4;
  const __CFString *v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = CFSTR("remove");
  if ((a1 & 1) == 0)
    v3 = CFSTR("restore");
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  OUTLINED_FUNCTION_4_0(&dword_182882000, a3, (uint64_t)a3, "Failed to %@ app with bundleID: %@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1();
}

@end
