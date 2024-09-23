@implementation HMHome(Additions)

- (id)hf_characteristicValueManagerIfCreated
{
  return objc_getAssociatedObject(a1, sel_hf_characteristicValueManager);
}

- (HFCharacteristicValueManager)hf_characteristicValueManager
{
  HFCharacteristicValueManager *v2;
  NSObject *v3;
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  HFCharacteristicValueManager *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_getAssociatedObject(a1, sel_hf_characteristicValueManager);
  v2 = (HFCharacteristicValueManager *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v2 = -[HFCharacteristicValueManager initWithValueReader:valueWriter:]([HFCharacteristicValueManager alloc], "initWithValueReader:valueWriter:", a1, a1);
    objc_setAssociatedObject(a1, sel_hf_characteristicValueManager, v2, (void *)1);
    HFLogForCategory(0x36uLL);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v5 = 136315906;
      v6 = "-[HMHome(Additions) hf_characteristicValueManager]";
      v7 = 2048;
      v8 = 123;
      v9 = 2112;
      v10 = v2;
      v11 = 2112;
      v12 = a1;
      _os_log_impl(&dword_1DD34E000, v3, OS_LOG_TYPE_INFO, "%s (Line: %ld) HFCharacteristicValueManager is %@ for Home %@.", (uint8_t *)&v5, 0x2Au);
    }

  }
  return v2;
}

- (uint64_t)hf_currentUserIsOwner
{
  void *v3;
  void *v4;
  uint64_t v5;

  if ((HFForceNotAdministrator() & 1) != 0
    || +[HFUtilities isRunningInStoreDemoMode](HFUtilities, "isRunningInStoreDemoMode"))
  {
    return 0;
  }
  objc_msgSend(a1, "currentUser");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "homeAccessControlForUser:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isOwner");

  return v5;
}

- (uint64_t)hf_currentUserIsAdministrator
{
  void *v3;
  void *v4;
  uint64_t v5;

  if ((HFForceNotAdministrator() & 1) != 0
    || +[HFUtilities isRunningInStoreDemoMode](HFUtilities, "isRunningInStoreDemoMode"))
  {
    return 0;
  }
  objc_msgSend(a1, "currentUser");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "homeAccessControlForUser:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isAdministrator");

  return v5;
}

- (uint64_t)hf_shouldBlockCurrentUserFromHome
{
  if ((objc_msgSend(a1, "hf_shouldBlockCurrentRestrictedGuestFromHome") & 1) != 0)
    return 1;
  else
    return objc_msgSend(a1, "hf_shouldBlockCurrentUserFromHomeForRoarUpgrade");
}

- (uint64_t)hf_enabledResidentsSupportsNaturalLight
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "hf_enabledResidentDevices");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "na_any:", &__block_literal_global_223);

  return v2;
}

- (id)hf_enabledResidentDevices
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "residentDevices");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "na_filter:", &__block_literal_global_74);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)hf_orderedRooms
{
  void *v2;
  void *v3;
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, val);
  +[HFHomePropertyCacheManager sharedManager](HFHomePropertyCacheManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __36__HMHome_Additions__hf_orderedRooms__block_invoke;
  v5[3] = &unk_1EA72E428;
  objc_copyWeak(&v6, &location);
  objc_msgSend(v2, "valueForObject:home:key:invalidationReasons:recalculationBlock:", val, val, CFSTR("hf_orderedRooms"), 4, v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v6);

  objc_destroyWeak(&location);
  return v3;
}

- (id)hf_allVisibleServices
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(a1, "accessories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setWithArray:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_flatMap:", &__block_literal_global_108_2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (HFSuspendedStateOverrideValueProvider)hf_suspendedStateOverrideValueProvider
{
  HFSuspendedStateOverrideValueProvider *v2;

  objc_getAssociatedObject(a1, sel_hf_suspendedStateOverrideValueProvider);
  v2 = (HFSuspendedStateOverrideValueProvider *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v2 = objc_alloc_init(HFSuspendedStateOverrideValueProvider);
    objc_setAssociatedObject(a1, sel_hf_suspendedStateOverrideValueProvider, v2, (void *)1);
  }
  return v2;
}

- (id)hf_allProgrammableSwitchAccessories
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  objc_msgSend(MEMORY[0x1E0CBA7E0], "hf_programmableSwitchServiceTypes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "accessories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__HMHome_Additions__hf_allProgrammableSwitchAccessories__block_invoke;
  v7[3] = &unk_1EA727840;
  v8 = v2;
  v4 = v2;
  objc_msgSend(v3, "na_filter:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)hf_allBridgeAccessories
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_new();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(a1, "accessories", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if (objc_msgSend(v8, "hf_isBridge"))
          objc_msgSend(v2, "addObject:", v8);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  return v2;
}

- (BOOL)hf_hasAtleastOneAudioAnalysisSupportedAccessory
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "hf_audioAnalysisSupportedAccessories");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "count") != 0;

  return v2;
}

- (BOOL)hf_hasAtleastOneSafetyAndSecuritySupportedAccessory
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "hf_safetyAndSecuritySupportedAccessories");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "count") != 0;

  return v2;
}

- (id)hf_audioAnalysisSupportedAccessories
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "accessories");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "na_filter:", &__block_literal_global_239);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (uint64_t)hf_shouldShowAnnounceButtonForThisHome
{
  void *v2;
  void *v3;
  int v4;
  int v5;
  NSObject *v6;
  uint64_t v7;
  _DWORD v9[2];
  __int16 v10;
  int v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "currentUser");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "homeAccessControlForUser:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "isAnnounceAccessAllowed");
  v5 = objc_msgSend(a1, "hf_atleastOneMediaAccessorySupportsAndHasAnnounceEnabled");
  HFLogForCategory(7uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109634;
    v9[1] = v4;
    v10 = 1024;
    v11 = v5;
    v12 = 2112;
    v13 = a1;
    _os_log_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_DEFAULT, "isAnnounceAccessAllowedForThisUser = %d, atleastOneHomePodSupportsAnnounce = [%d], for home = %@", (uint8_t *)v9, 0x18u);
  }

  if ((v4 & v5) == 1)
    v7 = objc_msgSend(a1, "hf_shouldBlockCurrentUserFromHome") ^ 1;
  else
    v7 = 0;

  return v7;
}

- (uint64_t)hf_atleastOneMediaAccessorySupportsAndHasAnnounceEnabled
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "accessories");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "na_any:", &__block_literal_global_236);

  return v2;
}

- (uint64_t)hf_hasVisibleAccessories
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "accessories");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "na_any:", &__block_literal_global_67_0);

  return v2;
}

- (id)hf_roomWithIdentifier:()Additions
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  objc_msgSend(a1, "hf_allRooms");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __43__HMHome_Additions__hf_roomWithIdentifier___block_invoke;
  v9[3] = &unk_1EA72E400;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "na_firstObjectPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)hf_allRooms
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "rooms");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_safeAddObjectsFromArray:", v3);

  objc_msgSend(a1, "roomForEntireHome");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_safeAddObject:", v4);

  return v2;
}

- (uint64_t)hf_showPredictedScenesOnDashboard
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "applicationData");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("showPredictedScenesOnDashboard"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = objc_msgSend(v2, "BOOLValue");
  else
    v3 = 1;

  return v3;
}

- (id)hf_serviceGroupsForService:()Additions
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  if (v4)
  {
    objc_msgSend(a1, "serviceGroups");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __48__HMHome_Additions__hf_serviceGroupsForService___block_invoke;
    v8[3] = &unk_1EA72E668;
    v9 = v4;
    objc_msgSend(v5, "na_filter:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v6;
}

- (id)hf_visibleAccessories
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "accessories");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "na_filter:", &__block_literal_global_66_0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)hf_mediaAccessories
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "accessories");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "na_filter:", &__block_literal_global_176_1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (uint64_t)hf_canUpdateToHH2
{
  void *v2;
  void *v3;
  uint64_t v4;

  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "homeManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(a1, "hf_currentUserIsOwner")
    && objc_msgSend(v3, "isHH2MigrationAvailable"))
  {
    v4 = objc_msgSend(v3, "hasOptedToHH2") ^ 1;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (HFAccessoryCategoryReorderableItemList)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
{
  return -[HFAccessoryCategoryReorderableItemList initWithApplicationDataContainer:category:]([HFAccessoryCategoryReorderableItemList alloc], "initWithApplicationDataContainer:category:", a1, CFSTR("homeAccessoryCategories"));
}

- (id)hf_orderedActionSets
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "hf_reorderableActionSetsList");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sortedHomeKitObjectComparator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    NSLog(CFSTR("Could not create action set comparator for Home = %@."), a1);
  objc_msgSend(a1, "actionSets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortedArrayUsingComparator:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (HFReorderableHomeKitItemList)hf_reorderableActionSetsList
{
  return -[HFReorderableHomeKitItemList initWithApplicationDataContainer:category:]([HFReorderableHomeKitItemList alloc], "initWithApplicationDataContainer:category:", a1, CFSTR("homeActionSets"));
}

- (HFHomeDashboardReorderableItemList)hf_reorderableDashboardSectionList
{
  return -[HFHomeDashboardReorderableItemList initWithApplicationDataContainer:category:]([HFHomeDashboardReorderableItemList alloc], "initWithApplicationDataContainer:category:", a1, CFSTR("dashboardSections"));
}

- (HFReorderableHomeKitItemList)hf_reorderableRoomsList
{
  return -[HFReorderableHomeKitItemList initWithApplicationDataContainer:category:]([HFReorderableHomeKitItemList alloc], "initWithApplicationDataContainer:category:", a1, CFSTR("homeRooms"));
}

- (HFReorderableHomeKitItemList)hf_reorderableServicesList
{
  return -[HFReorderableHomeKitItemList initWithApplicationDataContainer:category:]([HFReorderableHomeKitItemList alloc], "initWithApplicationDataContainer:category:", a1, CFSTR("homeServices"));
}

- (HFReorderableHomeKitItemList)hf_reorderableCamerasList
{
  return -[HFReorderableHomeKitItemList initWithApplicationDataContainer:category:]([HFReorderableHomeKitItemList alloc], "initWithApplicationDataContainer:category:", a1, CFSTR("homeCameras"));
}

- (uint64_t)hf_isCurrentLocationHome
{
  void *v2;
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "homeManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!+[HFUtilities isInternalTest](HFUtilities, "isInternalTest"))
  {
    objc_msgSend(v3, "homes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "containsObject:", a1);

    if ((v5 & 1) == 0)
      NSLog(CFSTR("Home %@ is not a part of HFHomeKitDispatcher's home manager %@!"), a1, v3);
  }
  objc_msgSend(v3, "currentHome");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v3, "currentHome");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "uniqueIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "uniqueIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqual:", v9);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (uint64_t)hf_userIsOwner:()Additions
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "homeAccessControlForUser:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isOwner");

  return v2;
}

- (id)hf_walletKeyAccessories
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "accessories");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "na_filter:", &__block_literal_global_265);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)hf_homePods
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "accessories");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "na_filter:", &__block_literal_global_178);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)hf_accessoriesSupportingNaturalLighting
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "hf_allLightProfilesSupportingNaturalLighting");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "na_flatMap:", &__block_literal_global_97_0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)hf_allLightProfilesSupportingNaturalLighting
{
  void *v2;
  void *v3;

  if (objc_msgSend(a1, "hf_enabledResidentsSupportsNaturalLight"))
  {
    objc_msgSend(a1, "hf_allLightProfiles");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "na_filter:", &__block_literal_global_117);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = (void *)MEMORY[0x1E0C9AA60];
  }
  return v3;
}

- (BOOL)hf_userCanCreateTrigger
{
  int v2;
  int v3;
  NSObject *v4;
  _BOOL8 v5;
  NSObject *v6;
  int v8;
  _BOOL4 v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(a1, "hf_isAbleToAddTrigger");
  v3 = objc_msgSend(a1, "hf_userIsAllowedToCreateTrigger");
  HFLogForCategory(0x43uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 67109376;
    v9 = v2;
    v10 = 1024;
    v11 = v3;
    _os_log_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_DEFAULT, "Checking if user can create a trigger in this home isAbleToAddTrigger:%d userIsAllowedToCreateTrigger:%d", (uint8_t *)&v8, 0xEu);
  }

  v5 = (v2 & v3 & 1) != 0 || HFForceAllowAutomationCreation();
  HFLogForCategory(0x43uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 67109120;
    v9 = v5;
    _os_log_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_DEFAULT, "Checking if user can create a trigger in this home userCanCreateTrigger:%d", (uint8_t *)&v8, 8u);
  }

  return v5;
}

- (id)hf_fetchWalletKeyDeviceStateForCurrentDeviceIfNecessary
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "_hf_cachedWalletKeyDeviceStateForCurrentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v2);
  else
    objc_msgSend(a1, "hf_fetchWalletKeyDeviceStateForCurrentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)hf_walletKeyUUID
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a1, "_hf_cachedWalletKeyDeviceStateForCurrentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(v2, "walletKey");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "futureWithResult:", v6);
  }
  else
  {
    objc_msgSend(a1, "hf_fetchWalletKeyDeviceStateForCurrentDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "flatMap:", &__block_literal_global_276);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "recoverIgnoringError");
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_hf_cachedWalletKeyDeviceStateForCurrentDevice
{
  return objc_getAssociatedObject(a1, "hf_cachedWalletKeyDeviceStateForCurrentDeviceKey");
}

- (id)hf_fetchWalletKeyDeviceStateForCurrentDevice
{
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id location;

  objc_getAssociatedObject(a1, "hf_fetchWalletKeyDeviceStateFuture");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
  }
  else
  {
    v4 = objc_alloc_init(MEMORY[0x1E0D519C0]);
    objc_msgSend(a1, "description");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setAssociatedObject(a1, "hf_fetchWalletKeyDeviceStateFuture", v4, (void *)1);
    objc_initWeak(&location, a1);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __65__HMHome_Additions__hf_fetchWalletKeyDeviceStateForCurrentDevice__block_invoke;
    v9[3] = &unk_1EA72F538;
    objc_copyWeak(&v12, &location);
    v6 = v5;
    v10 = v6;
    v7 = v4;
    v11 = v7;
    objc_msgSend(a1, "fetchWalletKeyDeviceStateWithCompletion:", v9);
    v3 = v7;

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);

  }
  return v3;
}

- (uint64_t)hf_isAbleToAddTrigger
{
  uint64_t v2;
  void *v3;
  void *v4;
  int v5;
  int v6;
  unsigned int v7;
  NSObject *v8;
  _DWORD v10[2];
  __int16 v11;
  int v12;
  __int16 v13;
  int v14;
  __int16 v15;
  unsigned int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(a1, "hf_remoteAccessState");
  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "homeManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hf_hasDetectediCloudIssue");

  v6 = objc_msgSend(a1, "hf_hasEnabledResident");
  v7 = objc_msgSend(a1, "hf_isAutomatable");
  HFLogForCategory(0x43uLL);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109888;
    v10[1] = v2 == 1;
    v11 = 1024;
    v12 = v5;
    v13 = 1024;
    v14 = v6;
    v15 = 1024;
    v16 = v7;
    _os_log_impl(&dword_1DD34E000, v8, OS_LOG_TYPE_DEFAULT, "Checking if triggers can be added to this home hasRemoteAccessProblem:%d hasiCloudProblem:%d hasResident:%d isAutomatable:%d", (uint8_t *)v10, 0x1Au);
  }

  return (v2 != 1) & ~v5 & v6 & v7;
}

- (uint64_t)hf_remoteAccessState
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if ((HFForceRemoteAccessStateAvailable() & 1) != 0
    || +[HFUtilities shouldSuppressAllErrorsForDemo](HFUtilities, "shouldSuppressAllErrorsForDemo"))
  {
    return 3;
  }
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(a1, "residentDevices", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    v2 = 1;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if (objc_msgSend(v8, "isEnabled"))
        {
          if ((objc_msgSend(v8, "status") & 1) != 0)
          {
            v2 = 3;
            goto LABEL_17;
          }
          v2 = 2;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v5)
        continue;
      break;
    }
  }
  else
  {
    v2 = 1;
  }
LABEL_17:

  return v2;
}

- (uint64_t)hf_isAutomatable
{
  if ((objc_msgSend(a1, "hf_hasAutomatableServices") & 1) != 0)
    return 1;
  else
    return objc_msgSend(a1, "hf_hasAutomatableProfiles");
}

- (uint64_t)hf_hasEnabledResident
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = HFForceRemoteAccessStateAvailable();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(a1, "residentDevices", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "hf_isEnabled") & 1) != 0)
        {
          v2 = 1;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  return v2;
}

- (uint64_t)hf_hasAutomatableServices
{
  uint64_t v1;
  NSObject *v2;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v1 = objc_msgSend(a1, "hf_hasVisibleServies");
  HFLogForCategory(0x43uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 67109120;
    v4[1] = v1;
    _os_log_impl(&dword_1DD34E000, v2, OS_LOG_TYPE_DEFAULT, "Checking if home has automatable services hasAutomatableServices:%d", (uint8_t *)v4, 8u);
  }

  return v1;
}

- (uint64_t)hf_hasVisibleServies
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "accessories");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "na_any:", &__block_literal_global_106_2);

  return v2;
}

- (id)hf_dashboardSectionReorderableUUIDStringComparator
{
  void *v1;
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, val);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __71__HMHome_Additions__hf_dashboardSectionReorderableUUIDStringComparator__block_invoke;
  v3[3] = &unk_1EA72F048;
  objc_copyWeak(&v4, &location);
  v1 = _Block_copy(v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
  return v1;
}

- (uint64_t)hf_userIsAdministrator:()Additions
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "homeAccessControlForUser:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isAdministrator");

  return v2;
}

- (uint64_t)hf_hasAppleTVs
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "accessories");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "na_any:", &__block_literal_global_231);

  return v2;
}

- (uint64_t)hf_hasRMVCapableAppleTV
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "accessories");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "na_any:", &__block_literal_global_232);

  return v2;
}

- (uint64_t)hf_hasHomeHubSupportingWalletKey
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "residentDevices");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "na_any:", &__block_literal_global_293);

  return v2;
}

- (uint64_t)hf_hasHomeHubSupportingAccessCodes
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "residentDevices");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "na_any:", &__block_literal_global_311);

  return v2;
}

- (id)hf_siriEndpointCapableAccessoriesToOnboard
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "accessories");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "na_filter:", &__block_literal_global_179_0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)hf_accessoriesSupportingAccessCodes
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "accessories");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "na_filter:", &__block_literal_global_310);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (uint64_t)hf_isHomeEnergyHomeEmpty
{
  if (objc_msgSend(a1, "hf_hasVisibleAccessories"))
    return objc_msgSend(a1, "hf_shouldBlockCurrentUserFromHome");
  else
    return 1;
}

- (uint64_t)hf_isHomeEnergyVisible
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "hf_energyManager");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isHomeEnergyVisible");

  return v2;
}

- (_TtC4Home19HFHomeEnergyManager)hf_energyManager
{
  _TtC4Home19HFHomeEnergyManager *v2;
  NSObject *v3;
  int v5;
  const char *v6;
  __int16 v7;
  _TtC4Home19HFHomeEnergyManager *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_getAssociatedObject(a1, sel_hf_energyManager);
  v2 = (_TtC4Home19HFHomeEnergyManager *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v2 = -[HFHomeEnergyManager initWithHome:]([_TtC4Home19HFHomeEnergyManager alloc], "initWithHome:", a1);
    objc_setAssociatedObject(a1, sel_hf_energyManager, v2, (void *)1);
    -[HFHomeEnergyManager updateHomeEnergyAvailableFeaturesWithCompletionHandler:](v2, "updateHomeEnergyAvailableFeaturesWithCompletionHandler:", &__block_literal_global_63);
    HFLogForCategory(0x23uLL);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      v5 = 136315650;
      v6 = "-[HMHome(Additions) hf_energyManager]";
      v7 = 2112;
      v8 = v2;
      v9 = 2112;
      v10 = a1;
      _os_log_debug_impl(&dword_1DD34E000, v3, OS_LOG_TYPE_DEBUG, "%s HFHomeEnergyManager is %@ for Home %@.", (uint8_t *)&v5, 0x20u);
    }

  }
  return v2;
}

- (BOOL)hf_hasSecureRecordingCameras
{
  void *v1;
  void *v2;
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a1, "accessories");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "na_filter:", &__block_literal_global_124_1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "na_filter:", &__block_literal_global_125_1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

- (uint64_t)hf_hasAnyVisibleTriggers
{
  void *v1;
  uint64_t v2;
  NSObject *v3;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "triggers");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "na_any:", &__block_literal_global_250);

  HFLogForCategory(0x43uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109120;
    v5[1] = v2;
    _os_log_impl(&dword_1DD34E000, v3, OS_LOG_TYPE_DEFAULT, "Checking if home has visible triggers hasVisibleTriggers:%d", (uint8_t *)v5, 8u);
  }

  return v2;
}

- (uint64_t)hf_hasHomePods
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "accessories");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "na_any:", &__block_literal_global_228);

  return v2;
}

- (id)hf_allUsersIncludingCurrentUser
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "users");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_safeAddObjectsFromArray:", v3);

  objc_msgSend(a1, "currentUser");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_safeAddObject:", v4);

  return v2;
}

- (id)hf_allLightProfiles
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "accessories");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "na_flatMap:", &__block_literal_global_115_2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)hf_allCameraProfilesSupportingRecording
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "hf_allCameraProfiles");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "na_filter:", &__block_literal_global_120_1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)hf_allCameraProfiles
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "accessories");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "na_flatMap:", &__block_literal_global_119_1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (uint64_t)hf_homeHasMigratedForRedesign
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "applicationData");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("hasMigratedForRedesign"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = objc_msgSend(v2, "BOOLValue");
  else
    v3 = 0;

  return v3;
}

- (id)hf_dashboardSectionReorderableHomeKitObjectComparator
{
  void *v1;
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, val);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __74__HMHome_Additions__hf_dashboardSectionReorderableHomeKitObjectComparator__block_invoke;
  v3[3] = &unk_1EA72F070;
  objc_copyWeak(&v4, &location);
  v1 = _Block_copy(v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
  return v1;
}

- (id)hf_activeRooms
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  v2 = objc_alloc(MEMORY[0x1E0C99DE8]);
  objc_msgSend(a1, "rooms");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithArray:", v3);

  objc_msgSend(a1, "roomForEntireHome");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "rooms");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    v7 = objc_msgSend(v5, "hf_hasVisibleAccessories");

    if ((v7 & 1) == 0)
      goto LABEL_6;
  }
  else
  {

  }
  objc_msgSend(v4, "na_safeAddObject:", v5);
LABEL_6:

  return v4;
}

- (void)hf_clearCachedWalletKeyDeviceStateForCurrentDevice
{
  objc_setAssociatedObject(a1, "hf_cachedWalletKeyDeviceStateForCurrentDeviceKey", 0, (void *)1);
  objc_setAssociatedObject(a1, "hf_fetchWalletKeyDeviceStateFuture", 0, (void *)1);
}

- (uint64_t)hf_homeHasMigratedServicesToAccessories
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "applicationData");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("hasMigratedAccessories"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = objc_msgSend(v2, "BOOLValue");
  else
    v3 = 0;

  return v3;
}

- (uint64_t)hf_isGridForecastAvailableForNewFeaturesView
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "hf_energyManager");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isGridForecastAvailableForNewFeaturesView");

  return v2;
}

- (uint64_t)hf_isGridForecastAvailable
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "hf_energyManager");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "effectiveGridForecastAvailable");

  return v2;
}

- (uint64_t)hf_isGridForecastEnabled
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "hf_energyManager");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isGridForecastEnabled");

  return v2;
}

- (void)hf_setIsGridForecastEnabled:()Additions
{
  id v4;

  objc_msgSend(a1, "hf_energyManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsGridForecastEnabled:", a3);

}

- (uint64_t)hf_isGridForecastVisible
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "hf_energyManager");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isGridForecastVisible");

  return v2;
}

- (uint64_t)hf_isHomeElectricitySupported
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "hf_energyManager");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isHomeElectricitySupported");

  return v2;
}

- (uint64_t)hf_cachedHasEnergySite
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "hf_energyManager");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "cachedHasEnergySite");

  return v2;
}

- (uint64_t)hf_hasUtilitySubscription
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "hf_energyManager");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "cachedHasUtilitySubscription");

  return v2;
}

- (void)hf_setTemporaryEnergyLocation:()Additions
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(a1, "hf_energyManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTemporaryLocation:", v4);

}

- (uint64_t)hf_isEmpty
{
  void *v3;
  uint64_t v4;

  if ((objc_msgSend(a1, "hf_hasVisibleAccessories") & 1) != 0)
    return objc_msgSend(a1, "hf_shouldBlockCurrentUserFromHome");
  objc_msgSend(a1, "rooms");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
    v4 = objc_msgSend(a1, "hf_shouldBlockCurrentUserFromHome");
  else
    v4 = 1;

  return v4;
}

- (BOOL)hf_hasResident
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "residentDevices");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "count") != 0;

  return v2;
}

- (uint64_t)hf_canAddHomeMember
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "homeManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasOptedToHH2");

  if (!v4)
    return 1;
  objc_msgSend(a1, "residentDevices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "na_any:", &__block_literal_global_32_1);

  return v6;
}

- (uint64_t)hf_canAddRestrictedGuest
{
  NSObject *v2;
  unsigned int v3;
  NSObject *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  BOOL v8;
  uint64_t v9;
  int v11;
  const char *v12;
  __int16 v13;
  const __CFString *v14;
  __int16 v15;
  NSObject *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if ((_os_feature_enabled_impl() & 1) == 0
    && !+[HFUtilities isInternalTest](HFUtilities, "isInternalTest"))
  {
    return 0;
  }
  if ((objc_msgSend(a1, "hf_canAddHomeMember") & 1) != 0)
  {
    objc_msgSend(a1, "hf_primaryResidentDevice");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = -[NSObject capabilities](v2, "capabilities");
    HFLogForCategory(0x45uLL);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      if ((v3 & 0x40000000) != 0)
        v5 = CFSTR("YES");
      else
        v5 = CFSTR("NO");
      -[NSObject capabilities](v2, "capabilities");
      HMResidentDeviceCapabilitiesDescription();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 136315906;
      v12 = "-[HMHome(Additions) hf_canAddRestrictedGuest]";
      v13 = 2112;
      v14 = v5;
      v15 = 2112;
      v16 = v2;
      v17 = 2112;
      v18 = v6;
      _os_log_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_DEFAULT, "(%s) Returning %@. primary resident %@ has capabilities %@.", (uint8_t *)&v11, 0x2Au);

    }
    objc_msgSend(a1, "hf_restrictedGuestAllowedAccessories");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count") != 0;

    v9 = *(_DWORD *)&v8 & (v3 >> 30);
  }
  else
  {
    HFLogForCategory(0x45uLL);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 136315138;
      v12 = "-[HMHome(Additions) hf_canAddRestrictedGuest]";
      _os_log_impl(&dword_1DD34E000, v2, OS_LOG_TYPE_DEFAULT, "(%s) Returning NO because adding home is not available. Check if resident device opted into HH2 or not.", (uint8_t *)&v11, 0xCu);
    }
    v9 = 0;
  }

  return v9;
}

- (uint64_t)hf_userIsRestrictedGuest:()Additions
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  if ((_os_feature_enabled_impl() & 1) != 0
    || +[HFUtilities isInternalTest](HFUtilities, "isInternalTest"))
  {
    objc_msgSend(a1, "homeAccessControlForUser:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isRestrictedGuest");

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (uint64_t)hf_currentUserIsRestrictedGuest
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "currentUser");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "hf_userIsRestrictedGuest:", v2);

  return v3;
}

- (uint64_t)hf_isInRestrictedGuestAllowedPeriodForUser:()Additions
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v21;
  const char *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(a1, "hf_userIsRestrictedGuest:", v4) & 1) != 0)
  {
    objc_msgSend(a1, "homeAccessControlForUser:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "restrictedGuestAccessSettings");
    v6 = objc_claimAutoreleasedReturnValue();

    -[NSObject guestAccessSchedule](v6, "guestAccessSchedule");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(a1, "homeAccessControlForUser:", v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isRestrictedGuestInAllowedPeriod");

      HFLogForCategory(0x45uLL);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromBOOL();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "name");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "uniqueIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "hf_prettyDescription");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "timeZone");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 136316418;
        v22 = "-[HMHome(Additions) hf_isInRestrictedGuestAllowedPeriodForUser:]";
        v23 = 2112;
        v24 = v11;
        v25 = 2112;
        v26 = v12;
        v27 = 2112;
        v28 = v13;
        v29 = 2112;
        v30 = v14;
        v31 = 2112;
        v32 = v15;
        _os_log_impl(&dword_1DD34E000, v10, OS_LOG_TYPE_DEFAULT, "(%s) Returning %@. home: <Name: %@, uniqueIdentifier: %@>. User = %@. (timeZone = %@.)", (uint8_t *)&v21, 0x3Eu);

      }
    }
    else
    {
      HFLogForCategory(0x45uLL);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(a1, "name");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "uniqueIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "hf_prettyDescription");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 136315906;
        v22 = "-[HMHome(Additions) hf_isInRestrictedGuestAllowedPeriodForUser:]";
        v23 = 2112;
        v24 = v17;
        v25 = 2112;
        v26 = v18;
        v27 = 2112;
        v28 = v19;
        _os_log_impl(&dword_1DD34E000, v10, OS_LOG_TYPE_DEFAULT, "(%s) Returning YES because schedule is 'nil' aka 'Always Allowed' for RG. home: <Name: %@, Id: %@> user:%@.", (uint8_t *)&v21, 0x2Au);

      }
      v9 = 1;
    }

  }
  else
  {
    HFLogForCategory(0x45uLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "hf_prettyDescription");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 136315394;
      v22 = "-[HMHome(Additions) hf_isInRestrictedGuestAllowedPeriodForUser:]";
      v23 = 2112;
      v24 = v16;
      _os_log_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_DEFAULT, "(%s) Returning NO because user is NOT restricted guest. User = %@", (uint8_t *)&v21, 0x16u);

    }
    v9 = 0;
  }

  return v9;
}

- (uint64_t)hf_isCurrentUserInRestrictedGuestAllowedPeriod
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "currentUser");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "hf_isInRestrictedGuestAllowedPeriodForUser:", v2);

  return v3;
}

- (BOOL)hf_isCurrentRestrictedGuestAwayFromHome
{
  void *v2;
  int v3;
  _BOOL8 v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v13;
  const char *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "currentUser");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "hf_userIsRestrictedGuest:", v2);

  if (v3)
    v4 = objc_msgSend(a1, "homeLocationStatus") == 2;
  else
    v4 = 0;
  HFLogForCategory(0x45uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromBOOL();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "uniqueIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "homeLocationStatus");
    HMStringFromHomeLocation();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "currentUser");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "hf_prettyDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 136316418;
    v14 = "-[HMHome(Additions) hf_isCurrentRestrictedGuestAwayFromHome]";
    v15 = 2112;
    v16 = v6;
    v17 = 2112;
    v18 = v7;
    v19 = 2112;
    v20 = v8;
    v21 = 2112;
    v22 = v9;
    v23 = 2112;
    v24 = v11;
    _os_log_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_DEFAULT, "(%s) result = %@. home: <Name: %@, Id: %@>. HomeLocationStatus = %@. User:%@.", (uint8_t *)&v13, 0x3Eu);

  }
  return v4;
}

- (uint64_t)hf_shouldBlockCurrentRestrictedGuestFromHome
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "currentUser");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(a1, "hf_userIsRestrictedGuest:", v2))
  {
    if ((objc_msgSend(a1, "hf_isCurrentRestrictedGuestAwayFromHome") & 1) != 0)
      v3 = 1;
    else
      v3 = objc_msgSend(a1, "hf_isCurrentUserInRestrictedGuestAllowedPeriod") ^ 1;
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (uint64_t)hf_shouldShowNoAccessOutsideOfScheduleForRestrictedGuest:()Additions
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v15;
  const char *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    HFLogForCategory(0x45uLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "hf_prettyDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 136315650;
      v16 = "-[HMHome(Additions) hf_shouldShowNoAccessOutsideOfScheduleForRestrictedGuest:]";
      v17 = 2112;
      v18 = a1;
      v19 = 2112;
      v20 = v11;
      _os_log_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_DEFAULT, "(%s) home:%@ user:%@. Returning NO because feature flag is turned off.", (uint8_t *)&v15, 0x20u);
LABEL_9:

    }
LABEL_10:
    v5 = 0;
    goto LABEL_11;
  }
  if ((objc_msgSend(a1, "hf_userIsRestrictedGuest:", v4) & 1) == 0)
  {
    HFLogForCategory(0x45uLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(a1, "name");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "uniqueIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "hf_prettyDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 136315906;
      v16 = "-[HMHome(Additions) hf_shouldShowNoAccessOutsideOfScheduleForRestrictedGuest:]";
      v17 = 2112;
      v18 = v11;
      v19 = 2112;
      v20 = v12;
      v21 = 2112;
      v22 = v13;
      _os_log_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_DEFAULT, "(%s) Returning NO because user is NOT a restricted guest. home: <Name: %@, Id: %@>. User:%@", (uint8_t *)&v15, 0x2Au);

      goto LABEL_9;
    }
    goto LABEL_10;
  }
  v5 = objc_msgSend(a1, "hf_isInRestrictedGuestAllowedPeriodForUser:", v4) ^ 1;
  HFLogForCategory(0x45uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromBOOL();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "uniqueIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "hf_prettyDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 136316162;
    v16 = "-[HMHome(Additions) hf_shouldShowNoAccessOutsideOfScheduleForRestrictedGuest:]";
    v17 = 2112;
    v18 = v7;
    v19 = 2112;
    v20 = v8;
    v21 = 2112;
    v22 = v9;
    v23 = 2112;
    v24 = v10;
    _os_log_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_DEFAULT, "(%s) Returning %@. home: <Name: %@, Id: %@>. user = %@.", (uint8_t *)&v15, 0x34u);

  }
LABEL_11:

  return v5;
}

- (uint64_t)hf_shouldHideResidentDeviceReachabilityIssues
{
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "currentUser");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(a1, "hf_userIsRestrictedGuest:", v4);

  if ((_DWORD)v5)
  {
    HFLogForCategory(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412546;
      v10 = a1;
      v11 = 2112;
      v12 = v7;
      _os_log_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_DEFAULT, "%@:%@ Current user is a restricted guest, will hide resident reachability issues.", (uint8_t *)&v9, 0x16u);

    }
  }
  return v5;
}

- (id)hf_roomWithName:()Additions
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  objc_msgSend(a1, "hf_allRooms");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __37__HMHome_Additions__hf_roomWithName___block_invoke;
  v9[3] = &unk_1EA72E400;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "na_firstObjectPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)hf_selectedRoom
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  +[HFStateRestorationSettings sharedInstance](HFStateRestorationSettings, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "selectedRoomIdentifierForHomeIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "hf_roomWithIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(a1, "hf_orderedRooms");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "count"))
      objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
    else
      objc_msgSend(a1, "roomForEntireHome");
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (void)hf_setSelectedRoom:()Additions
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[HFStateRestorationSettings sharedInstance](HFStateRestorationSettings, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selectedRoomIdentifierForSelectedHome");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqual:", v6);

  if ((v8 & 1) == 0)
  {
    +[HFStateRestorationSettings sharedInstance](HFStateRestorationSettings, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uniqueIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "uniqueIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "saveSelectedRoomIdentifier:forHomeIdentifier:", v10, v11);

    HFLogForCategory(0);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "hf_prettyDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v18 = a1;
      v19 = 2112;
      v20 = v13;
      _os_log_impl(&dword_1DD34E000, v12, OS_LOG_TYPE_DEFAULT, "home:%@ didSelectRoom:%@", buf, 0x16u);

    }
    +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __40__HMHome_Additions__hf_setSelectedRoom___block_invoke;
    v15[3] = &unk_1EA7277C8;
    v15[4] = a1;
    v16 = v4;
    objc_msgSend(v14, "dispatchHomeObserverMessage:sender:", v15, 0);

  }
}

- (id)hf_zoneWithIdentifier:()Additions
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  objc_msgSend(a1, "zones");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __43__HMHome_Additions__hf_zoneWithIdentifier___block_invoke;
  v9[3] = &unk_1EA72E450;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "na_firstObjectPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)hf_isNetworkProtectionSupportedForAccessories
{
  return (objc_msgSend(a1, "networkRouterSupport") & 2) == 0;
}

- (BOOL)hf_isNetworkProtectionSupportedForHome
{
  return (objc_msgSend(a1, "networkRouterSupport") & 1) == 0;
}

- (id)hf_localizedDescriptionForNetworkProtectionSupport
{
  __CFString *v2;

  if ((objc_msgSend(a1, "networkRouterSupportDisableReason") & 2) != 0)
  {
    v2 = CFSTR("HFNetworkProtectionSupportIncompatibleVersion");
  }
  else if ((objc_msgSend(a1, "networkRouterSupportDisableReason") & 1) != 0)
  {
    v2 = CFSTR("HFNetworkProtectionSupportIncompatibleHomeHub");
  }
  else
  {
    v2 = CFSTR("HFNetworkProtectionSupport");
  }
  _HFLocalizedStringWithDefaultValue(v2, v2, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)hf_isNetworkProtectionEnabled
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a1, "hf_allNetworkRouterAccessories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
    v3 = objc_msgSend(a1, "protectionMode") == 1;
  else
    v3 = 0;

  return v3;
}

- (BOOL)hf_isNetworkCredentialManagementEnabled
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "hf_allNetworkRouterAccessories");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "count") != 0;

  return v2;
}

- (BOOL)hf_isNetworkRouterSupported
{
  return (objc_msgSend(a1, "networkRouterSupport") & 4) == 0;
}

- (id)hf_updateNetworkProtection:()Additions
{
  void *v4;
  void *v5;
  _QWORD v7[4];
  id v8[2];
  id location;

  objc_initWeak(&location, val);
  v4 = (void *)MEMORY[0x1E0D519C0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__HMHome_Additions__hf_updateNetworkProtection___block_invoke;
  v7[3] = &unk_1EA72E478;
  objc_copyWeak(v8, &location);
  v8[1] = a3;
  objc_msgSend(v4, "futureWithBlock:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(v8);
  objc_destroyWeak(&location);
  return v5;
}

- (id)hf_allNonEmptyActionSets
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  char v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(a1, "actionSets", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v8, "actions");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "count"))
        {
          v10 = objc_msgSend(v8, "hf_isAnonymous");

          if ((v10 & 1) == 0)
            objc_msgSend(v2, "addObject:", v8);
        }
        else
        {

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

  return v2;
}

- (id)hf_accessoryWithIdentifier:()Additions
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(a1, "accessories", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "uniqueIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqual:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)hf_accessoryWithDeviceIdentifier:()Additions
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(a1, "accessories", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        v10 = objc_alloc(MEMORY[0x1E0D285C0]);
        objc_msgSend(v9, "deviceIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)objc_msgSend(v10, "initWithMACAddressString:", v11);
        objc_msgSend(v12, "formattedString");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if (v13)
        {
          v15 = v13;
        }
        else
        {
          objc_msgSend(v9, "deviceIdentifier");
          v15 = (id)objc_claimAutoreleasedReturnValue();
        }
        v16 = v15;

        if ((objc_msgSend(v16, "isEqual:", v4) & 1) != 0)
        {
          v6 = v9;

          goto LABEL_14;
        }

      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_14:

  return v6;
}

- (id)hf_accessoryWithMatterNodeID:()Additions
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  objc_msgSend(a1, "accessories");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __50__HMHome_Additions__hf_accessoryWithMatterNodeID___block_invoke;
  v9[3] = &unk_1EA727840;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "na_firstObjectPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)hf_accessoryForSymptomsHandler:()Additions
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(a1, "accessories", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "symptomsHandler");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqual:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)hf_mediaSystemForSymptomsHandler:()Additions
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  objc_msgSend(a1, "mediaSystems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __54__HMHome_Additions__hf_mediaSystemForSymptomsHandler___block_invoke;
  v9[3] = &unk_1EA72CE40;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "na_firstObjectPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)hf_mediaProfileContainerForSymptomsHandler:()Additions
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "hf_mediaSystemForSymptomsHandler:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(a1, "hf_accessoryForSymptomsHandler:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "mediaProfile");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)hf_accessoriesMatchingCategoryType:()Additions
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(a1, "accessories", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v11, "category");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "categoryType");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqualToString:", v4);

        if (v14)
          objc_msgSend(v5, "addObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)hf_allNetworkRouterAccessories
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "accessories");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "na_filter:", &__block_literal_global_69_0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)hf_allTargetControlAccessories
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "accessories");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "na_filter:", &__block_literal_global_72_1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)hf_primaryResidentDevice
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "residentDevices");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "na_firstObjectPassingTest:", &__block_literal_global_73_1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)hf_actionSetWithUUID:()Additions
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  objc_msgSend(a1, "actionSets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __42__HMHome_Additions__hf_actionSetWithUUID___block_invoke;
  v9[3] = &unk_1EA728840;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "na_firstObjectPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (uint64_t)hf_hasResidentDeviceCapableOfSupportingThreadBorderRouter
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "residentDevices");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "na_any:", &__block_literal_global_76);

  return v2;
}

- (uint64_t)hf_hasResidentDeviceCapableOfSupportingMatterSharedAdmin
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "residentDevices");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "na_any:", &__block_literal_global_77);

  return v2;
}

- (uint64_t)hf_hasResidentDeviceCapableOfSupportingCHIP
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "residentDevices");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "na_any:", &__block_literal_global_78);

  return v2;
}

- (uint64_t)hf_hasResidentDeviceCapableOfSupportingActivityZones
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "residentDevices");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "na_any:", &__block_literal_global_79_0);

  return v2;
}

- (uint64_t)hf_hasResidentDeviceCapableOfSupportingEnhancedDetectionModes
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "residentDevices");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "na_any:", &__block_literal_global_80);

  return v2;
}

- (id)hf_residentDevicesAddedToHome
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  objc_msgSend(a1, "hf_appleTVs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_map:", &__block_literal_global_82_0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(a1, "residentDevices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __50__HMHome_Additions__hf_residentDevicesAddedToHome__block_invoke_2;
  v10[3] = &unk_1EA72E620;
  v11 = v3;
  v7 = v3;
  objc_msgSend(v6, "na_filter:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)hf_shouldBlockCurrentUserFromHomeForRoarUpgrade
{
  void *v2;
  void *v3;
  NSObject *v4;
  _BOOL8 v5;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "currentUser");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "homeAccessControlForUser:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v3, "isAccessAllowed") & 1) == 0)
  {
    HFLogForCategory(0);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 134217984;
      v8 = objc_msgSend(v3, "accessNotAllowedReasonCode");
      _os_log_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_DEFAULT, "User is blocked from home. HMHomeAccessNotAllowedReasonCode %lu", (uint8_t *)&v7, 0xCu);
    }

  }
  if ((objc_msgSend(v3, "isAccessAllowed") & 1) != 0)
    v5 = 0;
  else
    v5 = objc_msgSend(v3, "accessNotAllowedReasonCode") == 2 || objc_msgSend(v3, "accessNotAllowedReasonCode") == 4;

  return v5;
}

- (uint64_t)hf_blockCurrentUserFromHomeReason
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a1, "currentUser");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "homeAccessControlForUser:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "accessNotAllowedReasonCode");
  return v4;
}

- (BOOL)hf_hasReachableResidents
{
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  _BOOL8 v8;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "residentDevices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_filter:", &__block_literal_global_84);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HFLogForCategory(0);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138413058;
    v11 = a1;
    v12 = 2112;
    v13 = v7;
    v14 = 2048;
    v15 = objc_msgSend(v4, "count");
    v16 = 2112;
    v17 = v5;
    _os_log_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_DEFAULT, "%@:%@ Total residents: %lu - Reachable: %@", (uint8_t *)&v10, 0x2Au);

  }
  v8 = objc_msgSend(v5, "count") != 0;

  return v8;
}

- (id)hf_serviceGroupWithIdentifier:()Additions
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  objc_msgSend(a1, "serviceGroups");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __51__HMHome_Additions__hf_serviceGroupWithIdentifier___block_invoke;
  v9[3] = &unk_1EA72E668;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "na_firstObjectPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)hf_mediaSystemForAccessory:()Additions
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  objc_msgSend(a1, "mediaSystems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __48__HMHome_Additions__hf_mediaSystemForAccessory___block_invoke;
  v9[3] = &unk_1EA72CE40;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "na_firstObjectPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)hf_mediaSystemWithIdentifier:()Additions
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  objc_msgSend(a1, "mediaSystems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __50__HMHome_Additions__hf_mediaSystemWithIdentifier___block_invoke;
  v9[3] = &unk_1EA72CE40;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "na_firstObjectPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)hf_appleTVUsingAudioDestination:()Additions
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  objc_msgSend(a1, "hf_appleTVs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __53__HMHome_Additions__hf_appleTVUsingAudioDestination___block_invoke;
  v9[3] = &unk_1EA727840;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "na_firstObjectPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)hf_relatedHomeTheaterMediaProfileContainerFor:()Additions
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[4];
  id v20;

  v4 = a3;
  if (+[HFMediaHelper isHomePod:](HFMediaHelper, "isHomePod:", v4))
  {
    objc_msgSend(v4, "hf_backingAccessory");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "audioDestinationIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "hf_appleTVUsingAudioDestination:", v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "mediaProfile");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else if (+[HFMediaHelper isHomePodMediaSystem:](HFMediaHelper, "isHomePodMediaSystem:", v4))
  {
    objc_opt_class();
    v9 = v4;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
    v7 = v10;

    objc_msgSend(v7, "audioDestinationIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "hf_appleTVUsingAudioDestination:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "mediaProfile");
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (!+[HFMediaHelper isAppleTV:](HFMediaHelper, "isAppleTV:", v4))
    {
      v8 = 0;
      goto LABEL_11;
    }
    objc_msgSend(v4, "hf_backingAccessory");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "audioDestinationController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "destination");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "hf_allHomePodsOrStereoPairs");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __67__HMHome_Additions__hf_relatedHomeTheaterMediaProfileContainerFor___block_invoke;
    v19[3] = &unk_1EA72B900;
    v20 = v15;
    v7 = v15;
    objc_msgSend(v16, "na_firstObjectPassingTest:", v19);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = v17;
  }

LABEL_11:
  return v8;
}

- (id)hf_appleTVsSupportingHomeTheater
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "hf_appleTVs");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "na_filter:", &__block_literal_global_90);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)accessoriesSupportingSoftwareUpdate
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(a1, "accessories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_filter:", &__block_literal_global_91_0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (uint64_t)hf_hasAccessoriesSupportingSoftwareUpdate
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "accessories");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "na_any:", &__block_literal_global_92_0);

  return v2;
}

- (uint64_t)hf_hasFirstPartyAccessoriesSupportingSoftwareUpdate
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "accessories");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "na_any:", &__block_literal_global_93);

  return v2;
}

- (uint64_t)hf_hasThirdPartyAccessoriesSupportingSoftwareUpdate
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "accessories");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "na_any:", &__block_literal_global_94_0);

  return v2;
}

- (uint64_t)hf_shouldShowSoftwareUpdateSettings
{
  uint64_t result;

  if ((objc_msgSend(a1, "hf_canUpdateToHH2") & 1) != 0
    || (objc_msgSend(a1, "hf_hasFirstPartyAccessoriesSupportingSoftwareUpdate") & 1) != 0)
  {
    return 1;
  }
  result = objc_msgSend(a1, "hf_hasThirdPartyAccessoriesSupportingSoftwareUpdate");
  if ((_DWORD)result)
    return objc_msgSend(a1, "hf_hasEnabledResidentSupportingThirdPartySoftwareUpdate");
  return result;
}

- (uint64_t)hf_isAutomaticThirdPartyAccessorySoftwareUpdateEnabled
{
  uint64_t result;

  result = objc_msgSend(a1, "hf_hasEnabledResidentSupportingThirdPartySoftwareUpdate");
  if ((_DWORD)result)
    return objc_msgSend(a1, "isAutomaticThirdPartyAccessorySoftwareUpdateEnabled");
  return result;
}

- (id)hf_accessoriesWithValidSoftwareOrFirmwareUpdates
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(a1, "accessories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setWithArray:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_filter:", &__block_literal_global_95);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)hf_homeKitObjectsSupportingNaturalLighting
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "hf_allLightProfilesSupportingNaturalLighting");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v1, "na_flatMap:", &__block_literal_global_100_2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "na_map:", &__block_literal_global_102);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (uint64_t)hf_containsActionableAccessories
{
  void *v2;
  char v3;

  objc_msgSend(a1, "hf_allServices");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "na_any:", &__block_literal_global_103_2);

  if ((v3 & 1) != 0)
    return 1;
  else
    return objc_msgSend(a1, "hf_hasMediaAccessories");
}

- (id)hf_serviceWithIdentifier:()Additions
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  void *v15;
  char v16;
  id v17;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  objc_msgSend(a1, "accessories");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v20)
  {
    v6 = *(_QWORD *)v26;
    v19 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v26 != v6)
          objc_enumerationMutation(v5);
        v8 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        objc_msgSend(v8, "services", v19);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v22;
          while (2)
          {
            for (j = 0; j != v11; ++j)
            {
              if (*(_QWORD *)v22 != v12)
                objc_enumerationMutation(v9);
              v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * j);
              objc_msgSend(v14, "uniqueIdentifier");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = objc_msgSend(v15, "isEqual:", v4);

              if ((v16 & 1) != 0)
              {
                v17 = v14;

                goto LABEL_19;
              }
            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
            if (v11)
              continue;
            break;
          }
        }

        v6 = v19;
      }
      v17 = 0;
      v20 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v20);
  }
  else
  {
    v17 = 0;
  }
LABEL_19:

  return v17;
}

- (id)hf_allServices
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(a1, "accessories", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7), "services");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObjectsFromArray:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  return v2;
}

- (id)hf_allAccessoryProfiles
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "accessories");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "na_flatMap:", &__block_literal_global_110_0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)hf_accessoryProfilesWithClass:()Additions
{
  void *v4;
  void *v5;
  _QWORD v7[5];

  objc_msgSend(a1, "hf_allAccessoryProfiles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__HMHome_Additions__hf_accessoryProfilesWithClass___block_invoke;
  v7[3] = &__block_descriptor_40_e28_B16__0__HMAccessoryProfile_8lu32l8;
  v7[4] = a3;
  objc_msgSend(v4, "na_filter:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)hf_allNetworkConfigurationProfiles
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "hf_allAccessoryProfiles");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "na_map:", &__block_literal_global_113_0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)hf_cameraProfileWithIdentifier:()Additions
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(a1, "accessories");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    v9 = MEMORY[0x1E0C809B0];
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v17 != v8)
        objc_enumerationMutation(v5);
      objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v10), "cameraProfiles");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = v9;
      v14[1] = 3221225472;
      v14[2] = __52__HMHome_Additions__hf_cameraProfileWithIdentifier___block_invoke;
      v14[3] = &unk_1EA72E998;
      v15 = v4;
      objc_msgSend(v11, "na_firstObjectPassingTest:", v14);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
        break;
      if (v7 == ++v10)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v12 = 0;
  }

  return v12;
}

- (id)hf_cameraProfileForSignificantEvent:()Additions
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  objc_msgSend(a1, "hf_allCameraProfiles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __57__HMHome_Additions__hf_cameraProfileForSignificantEvent___block_invoke;
  v9[3] = &unk_1EA72E998;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "na_firstObjectPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)hf_allCameraProfilesWithDoorbellService
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "hf_allCameraProfiles");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "na_filter:", &__block_literal_global_121_0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)hf_allCameraProfilesWithSmartMotionRecordingEnabled
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  +[HFCameraSignificantEventConfiguration defaultSmartMotionConfiguration](HFCameraSignificantEventConfiguration, "defaultSmartMotionConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "eventTypes");

  objc_msgSend(a1, "hf_allCameraProfilesSupportingRecording");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __72__HMHome_Additions__hf_allCameraProfilesWithSmartMotionRecordingEnabled__block_invoke;
  v7[3] = &__block_descriptor_40_e25_B16__0__HMCameraProfile_8l;
  v7[4] = v3;
  objc_msgSend(v4, "na_filter:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)hf_unitaryCameraProfile
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "hf_allCameraProfiles");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "count") == 1)
  {
    objc_msgSend(v1, "firstObject");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (id)hf_allMediaProfileContainers
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "accessories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_map:", &__block_literal_global_127_1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_filter:", &__block_literal_global_129_2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "mediaSystems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayByAddingObjectsFromArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)hf_allUniqueMediaProfileContainersExcludingMediaGroups
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "hf_allMediaProfileContainers");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "na_filter:", &__block_literal_global_130);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

- (id)hf_allUniqueMediaProfileContainers
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a1, "accessories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_map:", &__block_literal_global_131);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "mediaSystems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "na_filter:", &__block_literal_global_132);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  return v7;
}

- (id)hf_allHomePodsOrStereoPairs
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  objc_msgSend(a1, "accessories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_map:", &__block_literal_global_133_0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48__HMHome_Additions__hf_allHomePodsOrStereoPairs__block_invoke_2;
  v8[3] = &unk_1EA72B900;
  v8[4] = a1;
  objc_msgSend(v3, "na_filter:", v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "mediaSystems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayByAddingObjectsFromArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)hf_allHomePodProfileContainers
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "accessories");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "na_map:", &__block_literal_global_135);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "na_filter:", &__block_literal_global_136_0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)hf_allHomePodsOrStereoPairsThatWillChime
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "hf_allHomePodsOrStereoPairs");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "na_filter:", &__block_literal_global_137);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (uint64_t)hf_isFaceRecognitionAvailable
{
  void *v2;
  uint64_t v3;
  void *v4;
  char v5;
  void *v6;
  uint64_t v7;
  NSObject *v9;
  const char *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "residentDevices");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (!v3)
  {
    HFLogForCategory(0x13uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      goto LABEL_12;
    v11 = 138412290;
    v12 = a1;
    v10 = "Home %@ does not have any resident device, which is required for Face Recognition feature";
LABEL_11:
    _os_log_impl(&dword_1DD34E000, v9, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v11, 0xCu);
    goto LABEL_12;
  }
  objc_msgSend(a1, "residentDevices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "na_any:", &__block_literal_global_138_0);

  if ((v5 & 1) == 0)
  {
    HFLogForCategory(0x13uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      goto LABEL_12;
    v11 = 138412290;
    v12 = a1;
    v10 = "No resident devices in home %@ support face classification";
    goto LABEL_11;
  }
  objc_msgSend(a1, "hf_allCameraProfilesSupportingRecording");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
    return 1;
  HFLogForCategory(0x13uLL);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412290;
    v12 = a1;
    v10 = "No cameras in home %@ support recording";
    goto LABEL_11;
  }
LABEL_12:

  return 0;
}

- (id)hf_setFaceRecognitionEnabled:()Additions
{
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[5];
  char v15;
  _QWORD v16[5];
  char v17;
  _QWORD v18[2];
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  HFLogForCategory(0x13uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v20 = a1;
    v21 = 1024;
    v22 = a3;
    _os_log_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_DEFAULT, "%@: Setting face recognition enabled(%d)", buf, 0x12u);
  }

  v6 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __50__HMHome_Additions__hf_setFaceRecognitionEnabled___block_invoke;
  v16[3] = &unk_1EA729EA0;
  v17 = a3;
  v16[4] = a1;
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithBlock:", v16);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v6;
  v14[1] = 3221225472;
  v14[2] = __50__HMHome_Additions__hf_setFaceRecognitionEnabled___block_invoke_2_143;
  v14[3] = &unk_1EA729EA0;
  v14[4] = a1;
  v15 = a3;
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithBlock:", v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0D519C0];
  v18[0] = v7;
  v18[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D519E8], "mainThreadScheduler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "combineAllFutures:ignoringErrors:scheduler:", v10, 1, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)hf_allPersonManagers
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "personManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_safeAddObject:", v3);

  objc_msgSend(a1, "hf_allPhotosPersonManagers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_safeAddObjectsFromArray:", v4);

  return v2;
}

- (id)hf_allPhotosPersonManagers
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "hf_allUsersIncludingCurrentUser");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "na_map:", &__block_literal_global_152_0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)hf_personManagerWithIdentifier:()Additions
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  objc_msgSend(a1, "hf_allPersonManagers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __52__HMHome_Additions__hf_personManagerWithIdentifier___block_invoke;
  v9[3] = &unk_1EA72ECB8;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "na_firstObjectPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)hf_allPersons
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "hf_allPersonManagers");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "na_map:", &__block_literal_global_155);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(MEMORY[0x1E0D519E8], "mainThreadScheduler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "combineAllFutures:ignoringErrors:scheduler:", v2, 1, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "flatMap:", &__block_literal_global_158);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)hf_personWithIdentifier:()Additions
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;

  v4 = a3;
  objc_msgSend(a1, "hf_allPersonManagers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __45__HMHome_Additions__hf_personWithIdentifier___block_invoke;
  v13[3] = &unk_1EA72ED60;
  v14 = v4;
  v6 = v4;
  objc_msgSend(v5, "na_map:", v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(MEMORY[0x1E0D519E8], "mainThreadScheduler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "combineAllFutures:ignoringErrors:scheduler:", v7, 1, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "flatMap:", &__block_literal_global_161_1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (uint64_t)hf_setImportPhotosLibraryEnabled:()Additions forUser:
{
  return objc_msgSend(a1, "hf_setPhotosLibrarySettingsForUser:importPhotosLibraryEnabled:shareFacesEnabled:", a4, a3, 0);
}

- (id)hf_setSharePhotosLibraryEnabled:()Additions forUser:
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  int v14;
  void *v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if ((objc_msgSend(v6, "hf_isImportingPhotosLibraryEnabledForFaceRecognition") & 1) != 0)
  {
    v7 = a1;
    v8 = v6;
    v9 = 1;
    v10 = a3;
  }
  else
  {
    HFLogForCategory(0x13uLL);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138412546;
      v15 = a1;
      v16 = 2080;
      v17 = "-[HMHome(Additions) hf_setSharePhotosLibraryEnabled:forUser:]";
      _os_log_impl(&dword_1DD34E000, v11, OS_LOG_TYPE_DEFAULT, "%@ %s: importing photos library is disabled, so disabling sharing of photos library.", (uint8_t *)&v14, 0x16u);
    }

    v7 = a1;
    v8 = v6;
    v9 = 0;
    v10 = 0;
  }
  objc_msgSend(v7, "hf_setPhotosLibrarySettingsForUser:importPhotosLibraryEnabled:shareFacesEnabled:", v8, v9, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)hf_setPhotosLibrarySettingsForUser:()Additions importPhotosLibraryEnabled:shareFacesEnabled:
{
  id v8;
  NSObject *v9;
  void *v10;
  char v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  id v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  void *v22;
  char v23;
  char v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  int v32;
  __int16 v33;
  int v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  HFLogForCategory(0x13uLL);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413314;
    v26 = a1;
    v27 = 2080;
    v28 = "-[HMHome(Additions) hf_setPhotosLibrarySettingsForUser:importPhotosLibraryEnabled:shareFacesEnabled:]";
    v29 = 2112;
    v30 = v8;
    v31 = 1024;
    v32 = a4;
    v33 = 1024;
    v34 = a5;
    _os_log_impl(&dword_1DD34E000, v9, OS_LOG_TYPE_DEFAULT, "%@ (%s): Setting Use Photos Library for user %@ enabled=%d and sharing=%d", buf, 0x2Cu);
  }

  objc_msgSend(a1, "hf_allUsersIncludingCurrentUser");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "containsObject:", v8);

  if ((v11 & 1) != 0)
  {
    if (!a5 || (a4 & 1) != 0)
    {
      v16 = (void *)MEMORY[0x1E0D519C0];
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __101__HMHome_Additions__hf_setPhotosLibrarySettingsForUser_importPhotosLibraryEnabled_shareFacesEnabled___block_invoke;
      v20[3] = &unk_1EA72EE10;
      v23 = a4;
      v24 = a5;
      v21 = v8;
      v22 = a1;
      objc_msgSend(v16, "futureWithBlock:", v20);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v21;
      goto LABEL_10;
    }
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v13 = CFSTR("Sharing photos library is only possible when using photos library for face recognition is enabled.");
  }
  else
  {
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v18 = v8;
    v19 = a1;
    v13 = CFSTR("%@ is not a user of home %@");
  }
  objc_msgSend(v12, "hf_errorWithCode:descriptionFormat:", 33, v13, v18, v19);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithError:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return v15;
}

- (id)hf_resetAllNetworkConfigurationProfiles
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v1 = (void *)MEMORY[0x1E0CBA290];
  v2 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(a1, "accessoryProtectionGroups");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "hf_updateProtectionMode:forGroups:", 0, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)hf_accessoriesRequiringManualWiFiReconfiguration
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "accessories");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "na_filter:", &__block_literal_global_172_0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)hf_updateAutomaticSoftwareUpdateEnabled:()Additions
{
  _QWORD v4[5];
  char v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __61__HMHome_Additions__hf_updateAutomaticSoftwareUpdateEnabled___block_invoke;
  v4[3] = &unk_1EA72EE98;
  v4[4] = a1;
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithErrorOnlyHandlerAdapterBlock:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)hf_updateAutomaticThirdPartyAccessorySoftwareUpdateEnabled:()Additions
{
  _QWORD v4[5];
  char v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __80__HMHome_Additions__hf_updateAutomaticThirdPartyAccessorySoftwareUpdateEnabled___block_invoke;
  v4[3] = &unk_1EA72EE98;
  v4[4] = a1;
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithErrorOnlyHandlerAdapterBlock:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)hf_appleTVs
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "accessories");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "na_filter:", &__block_literal_global_177);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)hf_allResidentAccessories
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "accessories");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "na_filter:", &__block_literal_global_180);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)hf_personalRequestAccessories
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "accessories");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "na_filter:", &__block_literal_global_181_0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)hf_tvViewingProfilesAccessories
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "accessories");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "na_filter:", &__block_literal_global_183);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (uint64_t)hf_canShowTvViewingInfoForUser:()Additions
{
  return objc_msgSend(a1, "hf_userIsRestrictedGuest:") ^ 1;
}

- (id)hf_siriEndPointAccessories
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "accessories");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "na_filter:", &__block_literal_global_185_0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)hf_allSiriEndPointProfileContainers
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "accessories");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "na_map:", &__block_literal_global_186);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "na_filter:", &__block_literal_global_187);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)hf_allSiriEndPointProfileContainersThatWillChime
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "hf_allSiriEndPointProfileContainers");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "na_filter:", &__block_literal_global_188);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)hf_accessoryCategoriesReorderableItemComparator
{
  void *v1;
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, val);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __68__HMHome_Additions__hf_accessoryCategoriesReorderableItemComparator__block_invoke;
  v3[3] = &unk_1EA72F020;
  objc_copyWeak(&v4, &location);
  v1 = _Block_copy(v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
  return v1;
}

- (id)hf_dashboardSectionReorderableItemComparator
{
  void *v1;
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, val);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __65__HMHome_Additions__hf_dashboardSectionReorderableItemComparator__block_invoke;
  v3[3] = &unk_1EA72F020;
  objc_copyWeak(&v4, &location);
  v1 = _Block_copy(v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
  return v1;
}

- (id)hf_notesApplicationData
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "applicationData");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("UserDetails"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_4;
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("Notes"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_4:
    v3 = 0;
  }

  return v3;
}

- (id)hf_setNotesApplicationData:()Additions
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[5];
  id v14;

  v4 = a3;
  objc_msgSend(a1, "applicationData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("UserDetails"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = (void *)objc_msgSend(v6, "mutableCopy");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v4, CFSTR("Notes"));

  objc_msgSend(v5, "setObject:forKey:", v8, CFSTR("UserDetails"));
  v9 = (void *)MEMORY[0x1E0D519C0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __48__HMHome_Additions__hf_setNotesApplicationData___block_invoke;
  v13[3] = &unk_1EA728590;
  v13[4] = a1;
  v14 = v5;
  v10 = v5;
  objc_msgSend(v9, "futureWithErrorOnlyHandlerAdapterBlock:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (uint64_t)hf_homeHasMigratedIntoHomeApp
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "applicationData");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("hasOnboarded"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = objc_msgSend(v2, "BOOLValue");
  else
    v3 = 0;

  return v3;
}

- (id)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:()Additions
{
  void *v2;
  void *v3;
  _QWORD v5[5];

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "applicationData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v2, CFSTR("hasOnboarded"));

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59__HMHome_Additions__hf_setHomeHasOnboardedApplicationData___block_invoke;
  v5[3] = &unk_1EA7268C8;
  v5[4] = a1;
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithErrorOnlyHandlerAdapterBlock:", v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)hf_setHomeHasMigratedServicesToAccessories:()Additions
{
  void *v2;
  void *v3;
  _QWORD v5[5];

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "applicationData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v2, CFSTR("hasMigratedAccessories"));

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __64__HMHome_Additions__hf_setHomeHasMigratedServicesToAccessories___block_invoke;
  v5[3] = &unk_1EA7268C8;
  v5[4] = a1;
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithErrorOnlyHandlerAdapterBlock:", v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)hf_setHomeHasMigratedForRedesign:()Additions
{
  void *v2;
  void *v3;
  _QWORD v5[5];

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "applicationData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v2, CFSTR("hasMigratedForRedesign"));

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__HMHome_Additions__hf_setHomeHasMigratedForRedesign___block_invoke;
  v5[3] = &unk_1EA7268C8;
  v5[4] = a1;
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithErrorOnlyHandlerAdapterBlock:", v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (uint64_t)hf_hasAcceptedTermsAndConditionsForHomePodVersion:()Additions
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  _QWORD block[4];
  id v11;
  _BYTE location[12];
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (+[HFUtilities isInternalInstall](HFUtilities, "isInternalInstall"))
  {
    objc_initWeak((id *)location, a1);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __71__HMHome_Additions__hf_hasAcceptedTermsAndConditionsForHomePodVersion___block_invoke;
    block[3] = &unk_1EA728AE8;
    objc_copyWeak(&v11, (id *)location);
    if (hf_hasAcceptedTermsAndConditionsForHomePodVersion__onceToken != -1)
      dispatch_once(&hf_hasAcceptedTermsAndConditionsForHomePodVersion__onceToken, block);
    objc_destroyWeak(&v11);
    objc_destroyWeak((id *)location);
  }
  objc_msgSend(a1, "applicationData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("HFApplicationHomePodTermsAndConditionsAcceptedKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  HFLogForCategory(0x3FuLL);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)location = 138412546;
    *(_QWORD *)&location[4] = v6;
    v13 = 2112;
    v14 = v4;
    _os_log_impl(&dword_1DD34E000, v7, OS_LOG_TYPE_DEFAULT, "[START UPDATE] Comparing previously accepted license agremenet versions to current version: %@ %@", location, 0x16u);
  }

  v8 = objc_msgSend(v6, "containsObject:", v4);
  return v8;
}

- (id)hf_markTermsAndConditionsAsAcceptedForHomePodWithLicenseAgreementVersion:()Additions
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v15;
  _QWORD v16[5];

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HMHome+HFAdditions.m"), 2000, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("licenseAgreementVersion"));

  }
  objc_msgSend(a1, "applicationData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("HFApplicationHomePodTermsAndConditionsAcceptedKey"));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  v9 = (void *)MEMORY[0x1E0C9AA60];
  if (v7)
    v9 = (void *)v7;
  v10 = v9;

  if (objc_msgSend(v10, "containsObject:", v5))
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v10, "arrayByAddingObject:", v5);
    v12 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "applicationData");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKey:", v12, CFSTR("HFApplicationHomePodTermsAndConditionsAcceptedKey"));

    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __94__HMHome_Additions__hf_markTermsAndConditionsAsAcceptedForHomePodWithLicenseAgreementVersion___block_invoke;
    v16[3] = &unk_1EA7268C8;
    v16[4] = a1;
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithErrorOnlyHandlerAdapterBlock:", v16);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (id)v12;
  }

  return v11;
}

- (uint64_t)hf_supportsPerUserRemoteAccess
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "residentDevices");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "na_any:", &__block_literal_global_220);

  return v2;
}

- (uint64_t)hf_supportsRemoteAccessRestrictions
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "residentDevices");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "na_any:", &__block_literal_global_221_0);

  return v2;
}

- (uint64_t)hf_enabledResidentsSupportsMediaActions
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "hf_enabledResidentDevices");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "na_any:", &__block_literal_global_222_0);

  return v2;
}

- (uint64_t)hf_hasEnabledResidentSupportingThirdPartySoftwareUpdate
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "residentDevices");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "na_any:", &__block_literal_global_224);

  return v2;
}

- (id)hf_allNonAdminUsers
{
  void *v2;
  void *v3;
  _QWORD v5[5];

  objc_msgSend(a1, "users");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __40__HMHome_Additions__hf_allNonAdminUsers__block_invoke;
  v5[3] = &unk_1EA72A818;
  v5[4] = a1;
  objc_msgSend(v2, "na_filter:", v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)hf_allNonOwnerUsers
{
  void *v2;
  void *v3;
  _QWORD v5[5];

  objc_msgSend(a1, "users");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __40__HMHome_Additions__hf_allNonOwnerUsers__block_invoke;
  v5[3] = &unk_1EA72A818;
  v5[4] = a1;
  objc_msgSend(v2, "na_filter:", v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (uint64_t)hf_hasAtLeastOneRestrictedGuest
{
  void *v2;
  uint64_t v3;
  _QWORD v5[5];

  objc_msgSend(a1, "users");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__HMHome_Additions__hf_hasAtLeastOneRestrictedGuest__block_invoke;
  v5[3] = &unk_1EA72A818;
  v5[4] = a1;
  v3 = objc_msgSend(v2, "na_any:", v5);

  return v3;
}

- (BOOL)hf_isPresenceAuthorizedForUser:()Additions
{
  id v4;
  void *v5;
  char v6;
  uint64_t v7;
  _BOOL8 v8;
  void *v9;

  v4 = a3;
  objc_msgSend(a1, "currentUser");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", v4);

  if ((v6 & 1) != 0 || (v7 = HFPreferencesBooleanValueForKey(CFSTR("HFForceUserPresenceAuthorized")), v7 == 2))
  {
    v8 = 1;
  }
  else if (v7 == 1)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(a1, "homeAccessControlForUser:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v9, "presenceAuthorizationStatus") == 1;

  }
  return v8;
}

- (uint64_t)hf_isMediaAccessoryProfileValid:()Additions
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(a1, "mediaSystems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unionSet:", v8);

  v9 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(a1, "hf_allMediaProfileContainers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unionSet:", v11);

  v12 = objc_msgSend(v5, "containsObject:", v4);
  return v12;
}

- (uint64_t)hf_supportsSharedEventAutomation
{
  uint64_t v2;
  void *v4;
  uint64_t v5;

  v2 = HFPreferencesBooleanValueForKey(CFSTR("HFForcedResidentSupportsSharedEventTriggerActivationState"));
  if (v2 == 2)
    return 1;
  if (v2 == 1)
    return 0;
  objc_msgSend(a1, "residentDevices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "na_any:", &__block_literal_global_226);

  return v5;
}

- (uint64_t)hf_hasMediaAccessories
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "accessories");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "na_any:", &__block_literal_global_227);

  return v2;
}

- (uint64_t)hf_numberOfHomePods
{
  void *v1;
  uint64_t v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  objc_msgSend(a1, "accessories");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __40__HMHome_Additions__hf_numberOfHomePods__block_invoke;
  v4[3] = &unk_1EA72F1B8;
  v4[4] = &v5;
  objc_msgSend(v1, "na_each:", v4);

  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (uint64_t)hf_allHomePodsSupportRemoteProfileInstallation
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "hf_homePods");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "na_all:", &__block_literal_global_230);

  return v2;
}

- (uint64_t)hf_hasCameraRecordingResident
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "residentDevices");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "na_any:", &__block_literal_global_233);

  return v2;
}

- (uint64_t)hf_supportsReachabilityNotifications
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "residentDevices");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "na_any:", &__block_literal_global_234_0);

  return v2;
}

- (void)hf_startReprovisioningAccessory:()Additions
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  HFLogForCategory(0x24uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v10 = v4;
    _os_log_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_DEFAULT, "Requesting reprovisioning for accessory: %@", buf, 0xCu);
  }

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__HMHome_Additions__hf_startReprovisioningAccessory___block_invoke;
  v7[3] = &unk_1EA726968;
  v8 = v4;
  v6 = v4;
  objc_msgSend(a1, "reprovisionAccessory:completionHandler:", v6, v7);

}

- (uint64_t)hf_shouldShowAnnounceFeatureForThisHome
{
  uint64_t v2;
  NSObject *v3;
  _DWORD v5[2];
  __int16 v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(a1, "hf_atleastOneHomePodSupportsAnnounce");
  HFLogForCategory(7uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109378;
    v5[1] = v2;
    v6 = 2112;
    v7 = a1;
    _os_log_impl(&dword_1DD34E000, v3, OS_LOG_TYPE_DEFAULT, "atleastOneHomePodSupportsAnnounce = [%d], for home = %@", (uint8_t *)v5, 0x12u);
  }

  return v2;
}

- (uint64_t)hf_atleastOneHomePodSupportsAnnounce
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "hf_homePods");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "na_any:", &__block_literal_global_235_0);

  return v2;
}

- (uint64_t)hf_hasAtleastOneReachableHomePod
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "hf_homePods");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "na_any:", &__block_literal_global_237);

  return v2;
}

- (uint64_t)hf_hasAtLeastOneHomePodWithSettings
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "hf_homePods");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "na_any:", &__block_literal_global_238);

  return v2;
}

- (uint64_t)hf_canEnableAudioAnalysisAfterHH2Upgrade
{
  void *v1;
  int v2;
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a1, "hf_homePods");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "na_any:", &__block_literal_global_240);

  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "homeManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "homeSafetySecurityEnabled") & v2;

  return v5;
}

- (uint64_t)hf_shouldShowActivityLogSetting
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  char v6;
  int v7;
  NSObject *v8;
  uint64_t v9;
  int v11;
  void *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  int v16;
  __int16 v17;
  int v18;
  __int16 v19;
  int v20;
  __int16 v21;
  int v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activityLogCoordinatorForHome:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "residentDevices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "na_any:", &__block_literal_global_241);

  if (v5 && objc_msgSend(a1, "hf_hasEnabledResident"))
    v6 = objc_msgSend(a1, "hf_hasCompatibleActivityLogAccessories");
  else
    v6 = 0;
  v7 = objc_msgSend(v3, "eventsExist");
  HFLogForCategory(3uLL);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138413826;
    v12 = a1;
    v13 = 1024;
    v14 = v5;
    v15 = 1024;
    v16 = objc_msgSend(a1, "hf_hasEnabledResident");
    v17 = 1024;
    v18 = objc_msgSend(a1, "hf_hasCompatibleActivityLogAccessories");
    v19 = 1024;
    v20 = v7;
    v21 = 1024;
    v22 = objc_msgSend(a1, "isEventLogEnabled");
    v23 = 1024;
    v24 = objc_msgSend(a1, "hf_hasActivityLogPrerequisites");
    _os_log_impl(&dword_1DD34E000, v8, OS_LOG_TYPE_DEFAULT, "Home:%@ hasActivityCapableHub:%{BOOL}d hasEnabledResident:%{BOOL}d hasCompatibleActivityLogAccessories:%{BOOL}d hasEvents:%{BOOL}d isEventLogEnabled:%{BOOL}d hasActivityLogPrerequisites:%{BOOL}d", (uint8_t *)&v11, 0x30u);
  }

  if ((v6 & 1) != 0 || (objc_msgSend(a1, "isEventLogEnabled") & v7) == 1)
    v9 = objc_msgSend(a1, "hf_hasActivityLogPrerequisites");
  else
    v9 = 0;

  return v9;
}

- (uint64_t)hf_hasAtleastOneOasisEnabledHomePod
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "hf_homePods");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "na_any:", &__block_literal_global_242);

  return v2;
}

- (uint64_t)hf_atleastOneMediaAccessorySupportingJustSiri
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "accessories");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "na_any:", &__block_literal_global_244);

  return v2;
}

- (uint64_t)hf_atLeastOneMediaAccessoryWithSupportingJustSiriLanguage
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "accessories");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "na_filter:", &__block_literal_global_245);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "na_any:", &__block_literal_global_246);

  return v3;
}

- (uint64_t)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
{
  return objc_msgSend(a1, "setHasAnyUserAcknowledgedCameraRecordingOnboardingWithCompletionHandler:", &__block_literal_global_248);
}

- (uint64_t)hf_hasEnabledAndReachableResident
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = HFForceRemoteAccessStateAvailable();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(a1, "residentDevices", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if (objc_msgSend(v8, "hf_isEnabled") && (objc_msgSend(v8, "hf_isReachable") & 1) != 0)
        {
          v2 = 1;
          goto LABEL_12;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_12:

  return v2;
}

- (uint64_t)hf_hasAutomatableProfiles
{
  void *v1;
  uint64_t v2;
  NSObject *v3;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "hf_allAccessoryProfiles");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "na_any:", &__block_literal_global_251_0);

  HFLogForCategory(0x43uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109120;
    v5[1] = v2;
    _os_log_impl(&dword_1DD34E000, v3, OS_LOG_TYPE_DEFAULT, "Checking if home has automatable profiles hasAutomatableProfiles:%d", (uint8_t *)v5, 8u);
  }

  return v2;
}

+ (__CFString)_hf_appDataKeyForColorPaletteOfType:()Additions
{
  if (a3 > 3)
    return 0;
  else
    return off_1EA72FA68[a3];
}

- (HFColorPalette)hf_colorPaletteOfType:()Additions
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  HFColorPalette *v12;
  void *v13;
  HFColorPalette *v14;

  objc_msgSend(a1, "applicationData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("colorPickerFavorites"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(a1, "currentUser");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "uniqueIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "UUIDString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "objectForKeyedSubscript:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = (void *)v10;
      v12 = -[HFColorPalette initWithDawnColorPickerFavorites:type:]([HFColorPalette alloc], "initWithDawnColorPickerFavorites:type:", v10, a3);
      goto LABEL_9;
    }

  }
  objc_msgSend((id)objc_opt_class(), "_hf_appDataKeyForColorPaletteOfType:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "applicationData");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v12 = -[HFColorPalette initWithSerializedRepresentation:type:]([HFColorPalette alloc], "initWithSerializedRepresentation:type:", v11, a3);
  }
  else
  {
    +[HFColorPalette defaultColorPaletteOfType:](HFColorPalette, "defaultColorPaletteOfType:", a3);
    v12 = (HFColorPalette *)objc_claimAutoreleasedReturnValue();
  }
LABEL_9:
  v14 = v12;

  return v14;
}

- (id)hf_updateColorPalette:()Additions type:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[5];

  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "_hf_appDataKeyForColorPaletteOfType:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "serializedRepresentation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "applicationData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, v7);

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __48__HMHome_Additions__hf_updateColorPalette_type___block_invoke;
  v12[3] = &unk_1EA7268C8;
  v12[4] = a1;
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithErrorOnlyHandlerAdapterBlock:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)hf_accessControlDescriptor
{
  void *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "mediaPassword");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "minimumMediaUserPrivilege");
  v4 = objc_msgSend(a1, "isMediaPeerToPeerEnabled");
  if ((unint64_t)(v3 - 1) < 3)
  {
LABEL_7:
    v5 = 2;
    goto LABEL_8;
  }
  if (v3)
  {
    HFLogForCategory(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v9 = 134217984;
      v10 = v3;
      _os_log_error_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_ERROR, "Unknown HMUserPrivilege %lu", (uint8_t *)&v9, 0xCu);
    }

    goto LABEL_7;
  }
  v5 = v4 ^ 1u;
LABEL_8:
  +[HFMediaAccessControlDescriptor descriptorWithAccess:requiresPassword:password:](HFMediaAccessControlDescriptor, "descriptorWithAccess:requiresPassword:password:", v5, v2 != 0, v2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)hf_updateAccessControlDescriptor:()Additions
{
  id v5;
  __CFString *v6;
  int v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  void *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  __CFString *v24;
  uint64_t v25;
  int v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  __CFString *v31;
  int v33;
  const __CFString *v34;
  const __CFString *v35;
  __CFString *v36;
  uint64_t v37;
  void *v38;
  _QWORD v39[5];
  __CFString *v40;
  _QWORD v41[4];
  id v42;
  void *v43;
  _QWORD v44[6];
  _QWORD v45[6];
  _QWORD v46[5];
  char v47;
  uint8_t buf[4];
  const __CFString *v49;
  __int16 v50;
  uint64_t v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(a1, "hf_accessControlDescriptor");
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v7 = -[__CFString isEqual:](v6, "isEqual:", v5);
  HFLogForCategory(0);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DD34E000, v8, OS_LOG_TYPE_DEFAULT, "MediaAccessControl is same; returning.", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v9)
    {
      *(_DWORD *)buf = 138412546;
      v49 = v6;
      v50 = 2112;
      v51 = (uint64_t)v5;
      _os_log_impl(&dword_1DD34E000, v8, OS_LOG_TYPE_DEFAULT, "Transitioning from %@ -> %@", buf, 0x16u);
    }

    v11 = (void *)objc_opt_new();
    v12 = objc_msgSend(v5, "access");
    v13 = 1;
    v14 = MEMORY[0x1E0C809B0];
    switch(v12)
    {
      case 0:
        v13 = 0;
        goto LABEL_9;
      case 1:
        v13 = 0;
        goto LABEL_13;
      case 2:
LABEL_9:
        if ((objc_msgSend(a1, "isMediaPeerToPeerEnabled") & 1) != 0)
          goto LABEL_17;
        v15 = 1;
        goto LABEL_15;
      case 3:
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HMHome+HFAdditions.m"), 2618, CFSTR("Error: Cannot do a access control descirptor for 'count'; that doesn't even make any sense!"));

        v13 = 1;
        goto LABEL_13;
      default:
LABEL_13:
        if ((objc_msgSend(a1, "isMediaPeerToPeerEnabled") & 1) == 0)
          goto LABEL_17;
        v15 = 0;
LABEL_15:
        HFLogForCategory(0);
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          v33 = objc_msgSend(a1, "isMediaPeerToPeerEnabled");
          v34 = CFSTR("NO");
          if (v33)
            v35 = CFSTR("YES");
          else
            v35 = CFSTR("NO");
          if (v15)
            v34 = CFSTR("YES");
          *(_DWORD *)buf = 138412546;
          v49 = v35;
          v50 = 2112;
          v51 = (uint64_t)v34;
          _os_log_debug_impl(&dword_1DD34E000, v17, OS_LOG_TYPE_DEBUG, "--> Updating mediaPeerToPeerEnabled from '%@' to '%@'", buf, 0x16u);
        }

        v46[0] = v14;
        v46[1] = 3221225472;
        v46[2] = __54__HMHome_Additions__hf_updateAccessControlDescriptor___block_invoke;
        v46[3] = &unk_1EA72EE98;
        v46[4] = a1;
        v47 = v15;
        objc_msgSend(MEMORY[0x1E0D519C0], "futureWithErrorOnlyHandlerAdapterBlock:", v46);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObject:", v18);

LABEL_17:
        if (v13 != objc_msgSend(a1, "minimumMediaUserPrivilege"))
        {
          HFLogForCategory(0);
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(a1, "minimumMediaUserPrivilege");
            HMUserPrivilegeToString();
            v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
            HMUserPrivilegeToString();
            v37 = objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v49 = v36;
            v50 = 2112;
            v51 = v37;
            v38 = (void *)v37;
            _os_log_debug_impl(&dword_1DD34E000, v19, OS_LOG_TYPE_DEBUG, "--> Updating minimumMediaUserPrivilege from %@ to %@", buf, 0x16u);

          }
          v45[0] = v14;
          v45[1] = 3221225472;
          v45[2] = __54__HMHome_Additions__hf_updateAccessControlDescriptor___block_invoke_256;
          v45[3] = &unk_1EA728E58;
          v45[4] = a1;
          v45[5] = v13;
          objc_msgSend(MEMORY[0x1E0D519C0], "futureWithErrorOnlyHandlerAdapterBlock:", v45);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v20);

        }
        objc_msgSend(v5, "accessPassword");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "accessPassword");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v44[0] = v14;
        v44[1] = 3221225472;
        v44[2] = __54__HMHome_Additions__hf_updateAccessControlDescriptor___block_invoke_2;
        v44[3] = &unk_1EA72F480;
        v23 = v5;
        v44[4] = v23;
        v24 = v6;
        v44[5] = v24;
        if (v21)
          v25 = -1;
        else
          v25 = v22 != 0;
        if (v21 && v22)
          v25 = __54__HMHome_Additions__hf_updateAccessControlDescriptor___block_invoke_2((uint64_t)v44);

        v26 = objc_msgSend(v23, "accessRequiresPassword");
        if (v26 != -[__CFString accessRequiresPassword](v24, "accessRequiresPassword") || v25)
        {
          HFLogForCategory(0);
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_debug_impl(&dword_1DD34E000, v27, OS_LOG_TYPE_DEBUG, "--> Updating access password.", buf, 2u);
          }

          v28 = (void *)MEMORY[0x1E0D519C0];
          v41[0] = v14;
          v41[1] = 3221225472;
          v41[2] = __54__HMHome_Additions__hf_updateAccessControlDescriptor___block_invoke_258;
          v41[3] = &unk_1EA728590;
          v42 = v23;
          v43 = a1;
          objc_msgSend(v28, "futureWithErrorOnlyHandlerAdapterBlock:", v41);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v29);

        }
        objc_msgSend(MEMORY[0x1E0D519C0], "combineAllFutures:", v11);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v39[0] = v14;
        v39[1] = 3221225472;
        v39[2] = __54__HMHome_Additions__hf_updateAccessControlDescriptor___block_invoke_2_261;
        v39[3] = &unk_1EA726990;
        v39[4] = a1;
        v31 = v24;
        v40 = v31;
        objc_msgSend(v30, "recover:", v39);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        break;
    }
  }

  return v10;
}

- (id)hf_restrictedGuestAllowedAccessories
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "accessories");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "na_filter:", &__block_literal_global_264);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)hf_hasWalletKey
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a1, "_hf_cachedWalletKeyDeviceStateForCurrentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = (void *)MEMORY[0x1E0D519C0];
    v5 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v2, "walletKey");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "numberWithInt:", v6 != 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "futureWithResult:", v7);
  }
  else
  {
    objc_msgSend(a1, "hf_fetchWalletKeyDeviceStateForCurrentDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "flatMap:", &__block_literal_global_274);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "recover:", &__block_literal_global_275);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)hf_walletKeyInWalletAppURL
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_hf_cachedWalletKeyDeviceStateForCurrentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "walletKey");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "customURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    HFLogForCategory(0x42uLL);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v7)
      {
        objc_msgSend(v3, "walletKey");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "customURL");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v25 = a1;
        v26 = 2080;
        v27 = "-[HMHome(Additions) hf_walletKeyInWalletAppURL]";
        v28 = 2112;
        v29 = v9;
        v30 = 2112;
        v31 = v3;
        _os_log_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_DEFAULT, "(%@:%s) returning url %@ for cached wallet key device state %@", buf, 0x2Au);

      }
      v10 = (void *)MEMORY[0x1E0D519C0];
      objc_msgSend(v3, "walletKey");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "customURL");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "futureWithResult:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      if (v7)
      {
        *(_DWORD *)buf = 138412802;
        v25 = a1;
        v26 = 2080;
        v27 = "-[HMHome(Additions) hf_walletKeyInWalletAppURL]";
        v28 = 2112;
        v29 = v3;
        _os_log_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_DEFAULT, "(%@:%s) returning default wallet app url because customURL is nil for cached %@", buf, 0x20u);
      }

      v17 = (void *)MEMORY[0x1E0D519C0];
      +[HFWalletUtilities walletAppURL](HFWalletUtilities, "walletAppURL");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "futureWithResult:", v18);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    objc_initWeak((id *)buf, a1);
    objc_msgSend(a1, "hf_fetchWalletKeyDeviceStateForCurrentDevice");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __47__HMHome_Additions__hf_walletKeyInWalletAppURL__block_invoke;
    v22[3] = &unk_1EA72F5E0;
    objc_copyWeak(&v23, (id *)buf);
    objc_msgSend(v14, "flatMap:", v22);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v15;
    v20[1] = 3221225472;
    v20[2] = __47__HMHome_Additions__hf_walletKeyInWalletAppURL__block_invoke_278;
    v20[3] = &unk_1EA72A488;
    objc_copyWeak(&v21, (id *)buf);
    objc_msgSend(v16, "recover:", v20);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_destroyWeak(&v21);

    objc_destroyWeak(&v23);
    objc_destroyWeak((id *)buf);
  }

  return v13;
}

- (id)hf_enableExpressModeForWalletKeyWithAuthData:()Additions
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  v4 = a3;
  objc_initWeak(&location, a1);
  v5 = (void *)MEMORY[0x1E0D519C0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __66__HMHome_Additions__hf_enableExpressModeForWalletKeyWithAuthData___block_invoke;
  v9[3] = &unk_1EA72F630;
  objc_copyWeak(&v11, &location);
  v6 = v4;
  v10 = v6;
  objc_msgSend(v5, "futureWithBlock:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

  return v7;
}

- (id)hf_enableUWBForWalletKeyWithAuthData:()Additions enableNFCExpress:
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  _QWORD v11[4];
  id v12;
  id v13;
  char v14;
  _BYTE location[12];
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if ((_os_feature_enabled_impl() & 1) != 0)
  {
    objc_initWeak((id *)location, a1);
    v7 = (void *)MEMORY[0x1E0D519C0];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __75__HMHome_Additions__hf_enableUWBForWalletKeyWithAuthData_enableNFCExpress___block_invoke;
    v11[3] = &unk_1EA72F658;
    objc_copyWeak(&v13, (id *)location);
    v12 = v6;
    v14 = a4;
    objc_msgSend(v7, "futureWithBlock:", v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_destroyWeak(&v13);
    objc_destroyWeak((id *)location);
  }
  else
  {
    HFLogForCategory(0x42uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)location = 138412546;
      *(_QWORD *)&location[4] = a1;
      v16 = 2080;
      v17 = "-[HMHome(Additions) hf_enableUWBForWalletKeyWithAuthData:enableNFCExpress:]";
      _os_log_impl(&dword_1DD34E000, v9, OS_LOG_TYPE_DEFAULT, "(%@:%s) Returning early because uwb feature flag.", location, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (BOOL)hf_containsWalletKeyUWBAccessory
{
  void *v2;
  _BOOL8 v3;
  NSObject *v4;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if ((_os_feature_enabled_impl() & 1) != 0)
  {
    objc_msgSend(a1, "hf_accessoriesSupportingUWBUnlock");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "count") != 0;

  }
  else
  {
    HFLogForCategory(0x42uLL);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315138;
      v7 = "-[HMHome(Additions) hf_containsWalletKeyUWBAccessory]";
      _os_log_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_DEFAULT, "(%s) Returning false because feature flag is NOT enabled.", (uint8_t *)&v6, 0xCu);
    }

    return 0;
  }
  return v3;
}

- (id)hf_accessoriesSupportingUWBUnlock
{
  void *v2;
  void *v3;
  NSObject *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if ((_os_feature_enabled_impl() & 1) != 0)
  {
    objc_msgSend(a1, "accessories");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "na_filter:", &__block_literal_global_283_0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    return v3;
  }
  else
  {
    HFLogForCategory(0x42uLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315138;
      v7 = "-[HMHome(Additions) hf_accessoriesSupportingUWBUnlock]";
      _os_log_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_DEFAULT, "(%s) Returning empty collection because feature flag is NOT enabled.", (uint8_t *)&v6, 0xCu);
    }

    return MEMORY[0x1E0C9AA60];
  }
}

- (id)hf_addWalletKeyWithOptions:()Additions
{
  void *v4;
  void *v5;
  _QWORD v7[4];
  id v8[2];
  id location;

  objc_initWeak(&location, val);
  v4 = (void *)MEMORY[0x1E0D519C0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__HMHome_Additions__hf_addWalletKeyWithOptions___block_invoke;
  v7[3] = &unk_1EA72E478;
  objc_copyWeak(v8, &location);
  v8[1] = a3;
  objc_msgSend(v4, "futureWithBlock:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(v8);
  objc_destroyWeak(&location);
  return v5;
}

- (id)hf_addWalletKeyToPairedWatchesWithOptions:()Additions
{
  void *v4;
  void *v5;
  _QWORD v7[4];
  id v8[2];
  id location;

  objc_initWeak(&location, val);
  v4 = (void *)MEMORY[0x1E0D519C0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__HMHome_Additions__hf_addWalletKeyToPairedWatchesWithOptions___block_invoke;
  v7[3] = &unk_1EA72E478;
  objc_copyWeak(v8, &location);
  v8[1] = a3;
  objc_msgSend(v4, "futureWithBlock:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(v8);
  objc_destroyWeak(&location);
  return v5;
}

- (id)hf_setHasOnboardedForWalletKey
{
  void *v1;
  void *v2;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, val);
  v1 = (void *)MEMORY[0x1E0D519C0];
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __51__HMHome_Additions__hf_setHasOnboardedForWalletKey__block_invoke;
  v4[3] = &unk_1EA729F60;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v1, "futureWithBlock:", v4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return v2;
}

- (id)hf_formattedErrorForWalletKeyDeviceStateForCurrentDevice
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[5];

  objc_msgSend(a1, "hf_fetchWalletKeyDeviceStateForCurrentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __77__HMHome_Additions__hf_formattedErrorForWalletKeyDeviceStateForCurrentDevice__block_invoke;
  v6[3] = &unk_1EA72F710;
  v6[4] = a1;
  objc_msgSend(v2, "flatMap:", v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "recover:", &__block_literal_global_304);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)hf_fetchWalletKeyDeviceStateForPairedWatches
{
  void *v1;
  void *v2;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, val);
  v1 = (void *)MEMORY[0x1E0D519C0];
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __65__HMHome_Additions__hf_fetchWalletKeyDeviceStateForPairedWatches__block_invoke;
  v4[3] = &unk_1EA729F60;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v1, "futureWithBlock:", v4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return v2;
}

- (id)_hf_fetchWalletKeyColorFromAccessories
{
  void *v1;
  void *v2;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, val);
  v1 = (void *)MEMORY[0x1E0D519C0];
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __59__HMHome_Additions___hf_fetchWalletKeyColorFromAccessories__block_invoke;
  v4[3] = &unk_1EA729F60;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v1, "futureWithBlock:", v4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return v2;
}

- (id)_hf_existingWalletKeyColorForCurrentDevice
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "_hf_cachedWalletKeyDeviceStateForCurrentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E0D519C0];
    +[HFWalletUtilities walletKeyColorOfDeviceState:](HFWalletUtilities, "walletKeyColorOfDeviceState:", v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "futureWithResult:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1, "hf_fetchWalletKeyDeviceStateForCurrentDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "flatMap:", &__block_literal_global_307_0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "recover:", &__block_literal_global_308);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)hf_walletKeyColorToDisplay
{
  void *v2;
  void *v3;
  _QWORD v5[5];

  objc_msgSend(a1, "_hf_existingWalletKeyColorForCurrentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __47__HMHome_Additions__hf_walletKeyColorToDisplay__block_invoke;
  v5[3] = &unk_1EA726940;
  v5[4] = a1;
  objc_msgSend(v2, "flatMap:", v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)hf_canAddAccessCode
{
  void *v2;
  _BOOL8 v3;

  if (!objc_msgSend(a1, "hasOnboardedForAccessCode"))
    return 0;
  objc_msgSend(a1, "hf_accessoriesSupportingAccessCodes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (id)hf_setHasOnboardedForAccessCode
{
  void *v1;
  void *v2;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, val);
  v1 = (void *)MEMORY[0x1E0D519C0];
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __52__HMHome_Additions__hf_setHasOnboardedForAccessCode__block_invoke;
  v4[3] = &unk_1EA729F60;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v1, "futureWithBlock:", v4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return v2;
}

- (id)hf_hasWalletKeyCompatibleDevice
{
  void *v2;
  void *v3;
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, val);
  objc_msgSend(val, "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");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__HMHome_Additions__hf_hasWalletKeyCompatibleDevice__block_invoke;
  v5[3] = &unk_1EA72F828;
  objc_copyWeak(&v6, &location);
  objc_msgSend(v2, "flatMap:", v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v6);

  objc_destroyWeak(&location);
  return v3;
}

- (id)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
{
  void *v2;
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  id location;

  objc_msgSend(a1, "_hf_cachedWalletKeyDeviceStateForCurrentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = +[HFWalletUtilities isWalletKeyDeviceStateCompatible:](HFWalletUtilities, "isWalletKeyDeviceStateCompatible:", v2);
    v4 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "futureWithResult:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_initWeak(&location, a1);
    objc_msgSend(a1, "hf_fetchWalletKeyDeviceStateForCurrentDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "flatMap:", &__block_literal_global_313);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __58__HMHome_Additions__hf_isCurrentDeviceWalletKeyCompatible__block_invoke_2;
    v10[3] = &unk_1EA72A488;
    objc_copyWeak(&v11, &location);
    objc_msgSend(v8, "recover:", v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_destroyWeak(&v11);

    objc_destroyWeak(&location);
  }

  return v6;
}

- (id)hf_walletKeyDeviceStatesOfCompatiblePairedWatches
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;
  id location;

  objc_initWeak(&location, val);
  objc_msgSend(val, "hf_fetchWalletKeyDeviceStateForPairedWatches");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __70__HMHome_Additions__hf_walletKeyDeviceStatesOfCompatiblePairedWatches__block_invoke;
  v9[3] = &unk_1EA72F870;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v2, "flatMap:", v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  v7[1] = 3221225472;
  v7[2] = __70__HMHome_Additions__hf_walletKeyDeviceStatesOfCompatiblePairedWatches__block_invoke_315;
  v7[3] = &unk_1EA72A488;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v4, "recover:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
  return v5;
}

- (id)hf_fetchAvailableWalletKeyEncodedPKPass
{
  void *v1;
  void *v2;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, val);
  v1 = (void *)MEMORY[0x1E0D519C0];
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __60__HMHome_Additions__hf_fetchAvailableWalletKeyEncodedPKPass__block_invoke;
  v4[3] = &unk_1EA729F60;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v1, "futureWithBlock:", v4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return v2;
}

- (id)hf_fetchExistingWalletKeyEncodedPKPass
{
  void *v1;
  void *v2;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, val);
  v1 = (void *)MEMORY[0x1E0D519C0];
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __59__HMHome_Additions__hf_fetchExistingWalletKeyEncodedPKPass__block_invoke;
  v4[3] = &unk_1EA729F60;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v1, "futureWithBlock:", v4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return v2;
}

- (id)hf_ecosystemAccessoryUUIDMapFuture
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[5];

  objc_msgSend(a1, "accessories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_filter:", &__block_literal_global_319);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(v4, "na_map:", &__block_literal_global_320);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "combineAllFutures:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "flatMap:", &__block_literal_global_322);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "flatMap:", &__block_literal_global_323);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __55__HMHome_Additions__hf_ecosystemAccessoryUUIDMapFuture__block_invoke_8;
  v12[3] = &__block_descriptor_40_e27___NAFuture_16__0__NSError_8l;
  v12[4] = a2;
  objc_msgSend(v9, "recover:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)hf_setShowPredictedScenesOnDashboard:()Additions
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v8[5];
  _QWORD v9[5];

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "applicationData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v2, CFSTR("showPredictedScenesOnDashboard"));

  v4 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __58__HMHome_Additions__hf_setShowPredictedScenesOnDashboard___block_invoke;
  v9[3] = &unk_1EA7268C8;
  v9[4] = a1;
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithErrorOnlyHandlerAdapterBlock:", v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __58__HMHome_Additions__hf_setShowPredictedScenesOnDashboard___block_invoke_2;
  v8[3] = &unk_1EA726338;
  v8[4] = a1;
  objc_msgSend(v5, "addSuccessBlock:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (uint64_t)hf_hasFavorites
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "hf_accessoryLikeObjects");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "na_any:", &__block_literal_global_331_0);

  return v2;
}

- (uint64_t)hf_shortcutsComponentActionSetWithActions:()Additions
{
  return objc_msgSend(MEMORY[0x1E0CBA340], "shortcutsComponentActionSetWithHome:actions:", a1, a3);
}

- (id)hf_accessoryRepresentableUsageCountsByRoomWithFilter:()Additions
{
  id v4;
  HFBiomeUsageCountsByRoomFetchRequest *v5;
  void *v6;

  v4 = a3;
  v5 = -[HFBiomeUsageCountsByRoomFetchRequest initWithHome:]([HFBiomeUsageCountsByRoomFetchRequest alloc], "initWithHome:", a1);
  -[HFBiomeUsageCountsByRoomFetchRequest setFilter:](v5, "setFilter:", v4);

  -[HFBiomeAbstractFetchRequest fetch](v5, "fetch");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)hf_atleastOneMediaAccessoryHasSiriEnabled
{
  void *v2;
  void *v3;
  _BOOL8 v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "hf_allMediaProfileContainers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_firstObjectPassingTest:", &__block_literal_global_334);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 1;
  }
  else
  {
    objc_msgSend(a1, "hf_allSiriEndPointProfileContainers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "na_firstObjectPassingTest:", &__block_literal_global_335);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = v6 != 0;
  }

  return v4;
}

- (id)hf_minimumDescription
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("<HMHome: name = %@ | uniqueIdentifier = %@ | uuid = %@>"), v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (uint64_t)hf_minimumDescriptionsOfHomes:()Additions
{
  return objc_msgSend(a3, "na_map:", &__block_literal_global_339);
}

@end
