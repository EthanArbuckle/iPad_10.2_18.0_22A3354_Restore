@implementation HMAccessory(HFAdditions)

- (id)hf_standardServices
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __47__HMAccessory_HFAdditions__hf_standardServices__block_invoke;
  aBlock[3] = &unk_1EA72D530;
  aBlock[4] = a1;
  v4 = _Block_copy(aBlock);
  +[HFHomePropertyCacheManager sharedManager](HFHomePropertyCacheManager, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForObject:key:invalidationReasons:recalculationBlock:", a1, v6, 2, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)hf_owningBridgeAccessory
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD aBlock[5];

  if (!objc_msgSend(a1, "isBridged"))
    return 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __52__HMAccessory_HFAdditions__hf_owningBridgeAccessory__block_invoke;
  aBlock[3] = &unk_1EA72D530;
  aBlock[4] = a1;
  v4 = _Block_copy(aBlock);
  +[HFHomePropertyCacheManager sharedManager](HFHomePropertyCacheManager, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForObject:key:invalidationReasons:recalculationBlock:", a1, v6, 3, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (uint64_t)hf_isSingleServiceAccessory
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "hf_visibleServices");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count") == 1)
    v3 = objc_msgSend(a1, "hf_isNonServiceBasedAccessory") ^ 1;
  else
    v3 = 0;

  return v3;
}

- (uint64_t)hf_isNonServiceBasedAccessory
{
  if ((objc_msgSend(a1, "hf_isCamera") & 1) != 0
    || (objc_msgSend(a1, "hf_isMediaAccessory") & 1) != 0
    || (objc_msgSend(a1, "hf_isProgrammableSwitch") & 1) != 0
    || (objc_msgSend(a1, "hf_isRemoteControl") & 1) != 0)
  {
    return 1;
  }
  else
  {
    return objc_msgSend(a1, "hf_isMatterOnlyAccessory");
  }
}

- (id)hf_siriEndpointProfile
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;

  if (_os_feature_enabled_impl())
  {
    objc_msgSend(a1, "profiles");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "na_firstObjectPassingTest:", &__block_literal_global_137_0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    v4 = v3;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (uint64_t)hf_isProgrammableSwitch
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "services");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "na_any:", &__block_literal_global_14_7);

  return v2;
}

- (uint64_t)hf_isRemoteControl
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "category");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "categoryType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CB7AC0]);
  return v3;
}

- (uint64_t)hf_isCamera
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a1, "cameraProfiles");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {
    v3 = 1;
  }
  else
  {
    objc_msgSend(a1, "category");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "categoryType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB7A60]) & 1) != 0)
    {
      v3 = 1;
    }
    else
    {
      objc_msgSend(a1, "category");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "categoryType");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CB7AF0]);

    }
  }

  return v3;
}

- (id)hf_visibleServices
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __46__HMAccessory_HFAdditions__hf_visibleServices__block_invoke;
  aBlock[3] = &unk_1EA72D530;
  aBlock[4] = a1;
  v4 = _Block_copy(aBlock);
  +[HFHomePropertyCacheManager sharedManager](HFHomePropertyCacheManager, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForObject:key:invalidationReasons:recalculationBlock:", a1, v6, 3, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)hf_isAudioAnalysisSupportedDevice
{
  void *v2;
  _BOOL8 v3;

  if (!objc_msgSend(a1, "supportsAudioAnalysis"))
    return 0;
  objc_msgSend(a1, "audioAnalysisEventBulletinBoardNotification");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (uint64_t)hf_isSuspended
{
  return objc_msgSend((id)objc_opt_class(), "hf_isSuspendedStateSuspended:", objc_msgSend(a1, "suspendedState"));
}

+ (uint64_t)hf_isSuspendedStateSuspended:()HFAdditions
{
  NSObject *v5;
  int v6;
  unint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (a3 < 4)
    return (0xCu >> (a3 & 0xF)) & 1;
  HFLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v6 = 134217984;
    v7 = a3;
    _os_log_error_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_ERROR, "Unknown HMAccessorySuspendedState %lu", (uint8_t *)&v6, 0xCu);
  }

  return 0;
}

- (uint64_t)hf_isVisibleAccessory
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "hf_visibleServices");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count")
    || (objc_msgSend(a1, "hf_isCamera") & 1) != 0
    || (objc_msgSend(a1, "hf_isMediaAccessory") & 1) != 0
    || (objc_msgSend(a1, "hf_isProgrammableSwitch") & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    v3 = objc_msgSend(a1, "hf_isRemoteControl");
  }

  return v3;
}

- (uint64_t)hf_canSyncExternalSettings
{
  uint64_t result;

  if (!objc_msgSend(a1, "hf_isTelevision"))
    return 1;
  result = objc_msgSend(a1, "isReachable");
  if ((_DWORD)result)
    return objc_msgSend(a1, "hf_isSuspended") ^ 1;
  return result;
}

- (uint64_t)hf_isTelevision
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(a1, "televisionProfiles");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {
    v3 = 1;
  }
  else
  {
    objc_msgSend(a1, "category");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "categoryType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB7AC8]) & 1) != 0)
    {
      v3 = 1;
    }
    else
    {
      objc_msgSend(a1, "category");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "categoryType");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CB7AD8]) & 1) != 0)
      {
        v3 = 1;
      }
      else
      {
        objc_msgSend(a1, "category");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "categoryType");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v3 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0CB7AE0]);

      }
    }

  }
  return v3;
}

- (id)hf_categoryOrPrimaryServiceType
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a1, "_hf_categoryType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CB7A70]) & 1) != 0
    || objc_msgSend(a1, "hf_isSingleSensorAccessory"))
  {
    objc_msgSend(a1, "hf_primaryService");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      objc_msgSend(v3, "serviceType");
      v5 = objc_claimAutoreleasedReturnValue();

      v2 = (void *)v5;
    }

  }
  return v2;
}

- (BOOL)hf_isSingleSensorAccessory
{
  void *v2;
  _BOOL8 v3;

  if (!objc_msgSend(a1, "hf_isSensorAccessory"))
    return 0;
  objc_msgSend(a1, "hf_visibleServices");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") == 1;

  return v3;
}

- (id)_hf_categoryType
{
  void *v2;
  void *v3;
  __CFString **v4;
  void *v5;
  int v6;
  __CFString *v7;

  objc_msgSend(a1, "category");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "categoryType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(a1, "hf_isCeilingFanWithLight") & 1) != 0)
  {
    v4 = HMAccessoryCategoryTypeHFAdditionCeilingFanWithLight;
LABEL_17:
    v7 = *v4;

    v3 = v7;
    return v3;
  }
  if ((objc_msgSend(a1, "hf_isSensorAccessory") & 1) != 0)
  {
    v4 = (__CFString **)MEMORY[0x1E0CB7A98];
    goto LABEL_17;
  }
  if ((objc_msgSend(a1, "hf_isPowerStrip") & 1) != 0)
  {
    v4 = HMAccessoryCategoryTypeHFAdditionPowerStrip;
    goto LABEL_17;
  }
  if ((objc_msgSend(a1, "hf_isProgrammableSwitch") & 1) != 0)
  {
    v4 = (__CFString **)MEMORY[0x1E0CB7A80];
    goto LABEL_17;
  }
  if ((objc_msgSend(a1, "hf_isSprinkler") & 1) != 0)
  {
    v4 = (__CFString **)MEMORY[0x1E0CB7AB0];
    goto LABEL_17;
  }
  if ((objc_msgSend(a1, "hf_isVisibleAsBridge") & 1) != 0)
  {
    v4 = (__CFString **)MEMORY[0x1E0CB7A28];
    goto LABEL_17;
  }
  if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CB7A70])
    && objc_msgSend(a1, "hf_isCamera"))
  {
    objc_msgSend(a1, "services");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "na_any:", &__block_literal_global_133_1);

    v4 = (__CFString **)MEMORY[0x1E0CB7A60];
    if (v6)
      v4 = (__CFString **)MEMORY[0x1E0CB7AF0];
    goto LABEL_17;
  }
  return v3;
}

- (uint64_t)hf_isSensorAccessory
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a1, "hf_visibleServices");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "category");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "categoryType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB7A98]) & 1) != 0
    || objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB7A70]))
  {
    v5 = objc_msgSend(v2, "na_all:", &__block_literal_global_19_1);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (uint64_t)hf_isPureBridge
{
  void *v2;
  uint64_t v3;

  if (!objc_msgSend(a1, "hf_isBridge"))
    return 0;
  objc_msgSend(a1, "hf_visibleServices");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
    v3 = 0;
  else
    v3 = objc_msgSend(a1, "hf_isNonServiceBasedAccessory") ^ 1;

  return v3;
}

- (uint64_t)hf_isVisibleAsBridge
{
  if (objc_msgSend(a1, "hf_isCategorizedAsBridge") && !objc_msgSend(a1, "hf_isSprinkler"))
    return 1;
  else
    return objc_msgSend(a1, "hf_isPureBridge");
}

- (uint64_t)hf_isCategorizedAsBridge
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "category");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "categoryType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CB7A28]);

  return v3;
}

- (BOOL)hf_isSprinkler
{
  void *v2;
  void *v3;
  _BOOL8 v4;
  void *v5;

  objc_msgSend(a1, "category");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "categoryType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CB7AB0]) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    objc_msgSend(a1, "hf_irrigationSystemServices");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "count") != 0;

  }
  return v4;
}

- (uint64_t)hf_isPowerStrip
{
  void *v2;
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;

  objc_msgSend(a1, "category");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "categoryType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CB7A78]) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    objc_msgSend(a1, "category");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "categoryType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CB7A70]);

  }
  objc_msgSend(a1, "services");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "na_filter:", &__block_literal_global_13_6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9 > 2)
    return v4;
  else
    return 0;
}

- (uint64_t)hf_isCeilingFanWithLight
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  objc_msgSend(a1, "category");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "categoryType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CB7A40]) & 1) != 0
    || objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CB7A70]))
  {
    objc_msgSend(a1, "hf_visibleServices");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "na_any:", &__block_literal_global_4_4);

    objc_msgSend(a1, "hf_visibleServices");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "na_any:", &__block_literal_global_5_5);

    objc_msgSend(a1, "hf_visibleServices");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v6) = objc_msgSend(v8, "na_all:", &__block_literal_global_6_5);

    v9 = v5 & v7 & v6;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)hf_irrigationSystemServices
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "services");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "na_filter:", &__block_literal_global_31_3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (uint64_t)hf_isBridge
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "uniqueIdentifiersForBridgedAccessories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {
    v3 = 1;
  }
  else
  {
    objc_msgSend(a1, "category");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "categoryType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB7A28]);

  }
  return v3;
}

- (uint64_t)hf_showAsAccessoryTile
{
  if ((objc_msgSend(a1, "hf_showAsIndividualServices") & 1) != 0)
    return 0;
  else
    return objc_msgSend(a1, "hf_isSingleServiceAccessory") ^ 1;
}

- (uint64_t)hf_showAsIndividualServices
{
  uint64_t result;
  void *v3;
  void *v4;
  uint64_t v5;

  result = objc_msgSend(a1, "hf_canShowAsIndividualServices");
  if ((_DWORD)result)
  {
    objc_msgSend(a1, "applicationData");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("HFAccessoryShowAsIndividualServicesKey"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "BOOLValue");

    return v5;
  }
  return result;
}

- (BOOL)hf_canShowAsIndividualServices
{
  uint64_t v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  _BOOL8 v8;

  if ((objc_msgSend(a1, "hf_isSingleServiceAccessory") & 1) != 0)
    return 0;
  objc_msgSend(a1, "siriEndpointProfile");
  v2 = objc_claimAutoreleasedReturnValue();
  if (!v2)
    goto LABEL_4;
  v3 = (void *)v2;
  objc_msgSend(a1, "category");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hf_isMediaAccessory");

  if (!v5)
    return 0;
LABEL_4:
  objc_msgSend(a1, "hf_visibleServices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "na_filter:", &__block_literal_global_16_4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(a1, "hf_isNonServiceBasedAccessory") && objc_msgSend(v7, "count"))
  {
    v8 = 1;
  }
  else if (objc_msgSend(a1, "hf_isMultiServiceAccessory"))
  {
    v8 = (unint64_t)objc_msgSend(v7, "count") > 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (uint64_t)hf_areAllServicesInGroups
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "hf_visibleServices");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "na_all:", &__block_literal_global_15_6);

  return v2;
}

- (BOOL)hf_isMultiServiceAccessory
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "hf_visibleServices");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (unint64_t)objc_msgSend(v1, "count") > 1;

  return v2;
}

- (uint64_t)hf_isSupportedAccessory
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "hf_visibleServices");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {
    v3 = 1;
  }
  else
  {
    objc_msgSend(a1, "hf_componentServices");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "count"))
    {
      v3 = 1;
    }
    else
    {
      objc_msgSend(a1, "cameraProfiles");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "count")
        || (objc_msgSend(a1, "hf_isBridge") & 1) != 0
        || (objc_msgSend(a1, "hf_isMediaAccessory") & 1) != 0
        || (objc_msgSend(a1, "hf_isProgrammableSwitch") & 1) != 0)
      {
        v3 = 1;
      }
      else
      {
        v3 = objc_msgSend(a1, "hf_isRemoteControl");
      }

    }
  }

  return v3;
}

- (id)hf_componentServices
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __48__HMAccessory_HFAdditions__hf_componentServices__block_invoke;
  aBlock[3] = &unk_1EA72D530;
  aBlock[4] = a1;
  v4 = _Block_copy(aBlock);
  +[HFHomePropertyCacheManager sharedManager](HFHomePropertyCacheManager, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForObject:key:invalidationReasons:recalculationBlock:", a1, v6, 3, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)hf_linkedResidentDevice
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[5];

  objc_msgSend(a1, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "residentDevices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __51__HMAccessory_HFAdditions__hf_linkedResidentDevice__block_invoke;
  v6[3] = &unk_1EA72E620;
  v6[4] = a1;
  objc_msgSend(v3, "na_firstObjectPassingTest:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)hf_primaryService
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v13[5];
  _QWORD v14[4];
  id v15;

  objc_msgSend(a1, "hf_standardServices");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_firstObjectPassingTest:", &__block_literal_global_32_3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = v3;
  }
  else
  {
    objc_msgSend(a1, "category");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hf_compatibleServiceTypes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "services");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __45__HMAccessory_HFAdditions__hf_primaryService__block_invoke_2;
    v14[3] = &unk_1EA7283A0;
    v9 = v6;
    v15 = v9;
    objc_msgSend(v7, "na_filter:", v14);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v10, "count"))
    {
      objc_msgSend(v10, "firstObject");
      v4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(a1, "services");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = v8;
      v13[1] = 3221225472;
      v13[2] = __45__HMAccessory_HFAdditions__hf_primaryService__block_invoke_3;
      v13[3] = &unk_1EA7283A0;
      v13[4] = a1;
      objc_msgSend(v11, "na_firstObjectPassingTest:", v13);
      v4 = (id)objc_claimAutoreleasedReturnValue();

    }
  }

  return v4;
}

- (id)hf_servicesBehindBridge
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__HMAccessory_HFAdditions__hf_servicesBehindBridge__block_invoke;
  aBlock[3] = &unk_1EA72D530;
  aBlock[4] = a1;
  v4 = _Block_copy(aBlock);
  +[HFHomePropertyCacheManager sharedManager](HFHomePropertyCacheManager, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForObject:key:invalidationReasons:recalculationBlock:", a1, v6, 3, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)hf_bridgedAccessories
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

  v2 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(a1, "uniqueIdentifiersForBridgedAccessories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessories");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __49__HMAccessory_HFAdditions__hf_bridgedAccessories__block_invoke;
  v10[3] = &unk_1EA727840;
  v11 = v4;
  v7 = v4;
  objc_msgSend(v6, "na_filter:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (uint64_t)hf_requiresFirmwareUpdate
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "services");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "na_any:", &__block_literal_global_102);

  return v2;
}

- (uint64_t)hf_isIdentifiable
{
  if ((objc_msgSend(a1, "hf_isTelevision") & 1) != 0)
    return 0;
  else
    return objc_msgSend(a1, "hf_isMediaAccessory") ^ 1;
}

- (uint64_t)hf_supportsSuspendedState
{
  return objc_msgSend((id)objc_opt_class(), "hf_isSuspendedStateSupported:", objc_msgSend(a1, "suspendedState"));
}

- (BOOL)hf_isPureProgrammableSwitch
{
  void *v2;
  _BOOL8 v3;

  if (!objc_msgSend(a1, "hf_isProgrammableSwitch"))
    return 0;
  objc_msgSend(a1, "hf_visibleServices");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") == 0;

  return v3;
}

- (uint64_t)hf_isVisibleAsBridgedAccessory
{
  uint64_t result;

  result = objc_msgSend(a1, "isBridged");
  if ((_DWORD)result)
    return objc_msgSend(a1, "hf_isNetworkRouterSatellite") ^ 1;
  return result;
}

- (uint64_t)hf_isDoorbell
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a1, "category");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "categoryType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CB7AF0]) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    objc_msgSend(a1, "services");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "na_any:", &__block_literal_global_7_6);

  }
  return v4;
}

- (uint64_t)hf_isNetworkRouter
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a1, "category");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "categoryType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CB7AF8]) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    objc_msgSend(a1, "services");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "na_any:", &__block_literal_global_8_5);

  }
  return v4;
}

- (uint64_t)hf_isNetworkRouterSatellite
{
  uint64_t result;
  void *v3;
  uint64_t v4;

  result = objc_msgSend(a1, "hf_isNetworkRouter");
  if ((_DWORD)result)
  {
    objc_msgSend(a1, "services");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "na_any:", &__block_literal_global_9_8);

    return v4;
  }
  return result;
}

- (uint64_t)hf_isNotificationSupportedCamera
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "cameraProfiles");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "na_any:", &__block_literal_global_11_6);

  return v2;
}

- (id)hf_servicesWithBulletinBoardNotificationTurnedOff
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "services");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "na_filter:", &__block_literal_global_12_8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (uint64_t)hf_isSingleServiceLikeAccessory
{
  uint64_t v2;
  void *v3;

  if ((objc_msgSend(a1, "hf_isSingleServiceAccessory") & 1) != 0)
    return objc_msgSend(a1, "hf_isCategorizedAsBridge") ^ 1;
  if (!objc_msgSend(a1, "hf_isProgrammableSwitch"))
    return 0;
  objc_msgSend(a1, "hf_programmableSwitchServices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count") == 1)
    v2 = objc_msgSend(a1, "hf_isCategorizedAsBridge") ^ 1;
  else
    v2 = 0;

  return v2;
}

- (uint64_t)hf_isRestrictedGuestAllowedAccessory
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "hf_primaryService");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "serviceType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = (void *)MEMORY[0x1E0CBA7D0];
    v7[0] = v2;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "doesAccessoryHaveRestrictedGuestCapableServiceTypes:", v4);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (uint64_t)hf_showsAsAccessoryInControlCentre
{
  if ((objc_msgSend(a1, "hf_isCamera") & 1) != 0
    || (objc_msgSend(a1, "hf_isProgrammableSwitch") & 1) != 0
    || (objc_msgSend(a1, "hf_isRemoteControl") & 1) != 0)
  {
    return 0;
  }
  else
  {
    return objc_msgSend(a1, "hf_isSensorAccessory") ^ 1;
  }
}

- (BOOL)hf_isMultiSensorAccessory
{
  void *v2;
  _BOOL8 v3;

  if (!objc_msgSend(a1, "hf_isSensorAccessory"))
    return 0;
  objc_msgSend(a1, "hf_visibleServices");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (unint64_t)objc_msgSend(v2, "count") > 1;

  return v3;
}

- (uint64_t)hf_shouldSeparateAccessoryName
{
  if ((objc_msgSend(a1, "hf_isNonServiceBasedAccessory") & 1) != 0)
    return 1;
  else
    return objc_msgSend(a1, "hf_isPowerStrip");
}

- (uint64_t)hf_isMatterOnlyAccessory
{
  if (hf_isMatterOnlyAccessory_onceToken != -1)
    dispatch_once(&hf_isMatterOnlyAccessory_onceToken, &__block_literal_global_21_7);
  return 0;
}

- (id)hf_setShowAsIndividualServices:()HFAdditions
{
  void *v2;
  void *v3;
  _QWORD v5[5];

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "applicationData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v2, CFSTR("HFAccessoryShowAsIndividualServicesKey"));

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59__HMAccessory_HFAdditions__hf_setShowAsIndividualServices___block_invoke;
  v5[3] = &unk_1EA7268C8;
  v5[4] = a1;
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithErrorOnlyHandlerAdapterBlock:", v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)hf_groupableServices
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "hf_visibleServices");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "na_filter:", &__block_literal_global_30_1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (uint64_t)hf_hasInputSourceService
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "hf_standardServices");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "na_any:", &__block_literal_global_33_1);

  return v2;
}

- (id)hf_displayNamesForVisibleTiles
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (objc_msgSend(a1, "hf_isVisibleAccessory")
    && objc_msgSend(a1, "hf_showAsAccessoryTile"))
  {
    v2 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(a1, "hf_displayName");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setWithObject:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "hf_visibleServices");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(a1, "hf_isVisibleAccessory") && !objc_msgSend(v3, "count")
      || (objc_msgSend(a1, "hf_isNonServiceBasedAccessory") & 1) != 0
      || objc_msgSend(a1, "hf_isVisibleAsBridge"))
    {
      objc_msgSend(a1, "hf_displayName");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v5);

    }
    objc_msgSend(v3, "na_map:", &__block_literal_global_38);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "unionSet:", v6);

  }
  return v4;
}

- (uint64_t)hf_appPunchOutReason
{
  void *v3;
  char v4;
  void *v5;
  uint64_t v6;

  if ((objc_msgSend(a1, "isAdditionalSetupRequired") & 1) != 0)
    return 1;
  objc_msgSend(a1, "services");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "na_any:", &__block_literal_global_39_1);

  if ((v4 & 1) != 0)
    return 2;
  if (!objc_msgSend(a1, "hf_isBridge"))
    return 0;
  objc_msgSend(a1, "uniqueIdentifiersForBridgedAccessories");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
    return 0;
  else
    return 3;
}

- (uint64_t)hf_numberOfProgrammableSwitches
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "services");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "na_filter:", &__block_literal_global_40_1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (id)hf_serviceOfType:()HFAdditions
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  objc_msgSend(a1, "services");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __45__HMAccessory_HFAdditions__hf_serviceOfType___block_invoke;
  v9[3] = &unk_1EA7283A0;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "na_firstObjectPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)hf_programmableSwitchServices
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v1 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(a1, "services");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_filter:", &__block_literal_global_41);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
    v5 = v3;
  else
    v5 = MEMORY[0x1E0C9AA60];
  objc_msgSend(v1, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)hf_programmableSwitchNamespaceServices
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v2 = (void *)objc_opt_new();
  objc_msgSend(a1, "hf_programmableSwitchServices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __66__HMAccessory_HFAdditions__hf_programmableSwitchNamespaceServices__block_invoke;
  v7[3] = &unk_1EA7339D0;
  v8 = v2;
  v4 = v2;
  objc_msgSend(v3, "na_each:", v7);

  v5 = (void *)objc_msgSend(v4, "copy");
  return v5;
}

- (id)hf_networkConfigurationProfiles
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "profiles");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "na_map:", &__block_literal_global_47_3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (uint64_t)hf_hasManagedNetworkCredential
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "hf_networkConfigurationProfiles");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "na_any:", &__block_literal_global_50_2);

  return v2;
}

- (uint64_t)hf_needsReprovisioningCheck
{
  void *v2;
  uint64_t v3;

  if ((objc_msgSend(a1, "reachableTransports") & 1) != 0)
    return 0;
  objc_msgSend(a1, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "hf_isUserAtHome"))
    v3 = objc_msgSend(a1, "transportTypes") & 1;
  else
    v3 = 0;

  return v3;
}

- (BOOL)hf_isDirectlyReachable
{
  return (objc_msgSend(a1, "reachableTransports") & 3) != 0;
}

+ (id)hf_getUserFriendlyDescriptionKey:()HFAdditions
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = qword_1ED379130;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&qword_1ED379130, &__block_literal_global_51_1);
  objc_msgSend((id)_MergedGlobals_256, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)hf_userFriendlyLocalizedCapitalizedPluralDescription:()HFAdditions
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  objc_msgSend(a1, "hf_getUserFriendlyDescriptionKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingString:", CFSTR("_CategoryCapitalizedPlural"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (objc_msgSend(MEMORY[0x1E0CBA7E0], "hf_userFriendlyLocalizedCapitalizedDescription:", v4),
        (v7 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend(a1, "hf_getUserFriendlyDescriptionKey:", *MEMORY[0x1E0CB7A70]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByAppendingString:", CFSTR("_CategoryCapitalizedPlural"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    _HFLocalizedStringWithDefaultValue(v9, v9, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    _HFLocalizedStringWithDefaultValue(v6, v10, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

+ (id)hf_userFriendlyLocalizedCapitalizedDescription:()HFAdditions
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  objc_msgSend(a1, "hf_getUserFriendlyDescriptionKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingString:", CFSTR("_CategoryCapitalized"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (objc_msgSend(MEMORY[0x1E0CBA7E0], "hf_userFriendlyLocalizedCapitalizedDescription:", v4),
        (v7 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend(a1, "hf_getUserFriendlyDescriptionKey:", *MEMORY[0x1E0CB7A70]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByAppendingString:", CFSTR("_CategoryCapitalized"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    _HFLocalizedStringWithDefaultValue(v9, v9, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    _HFLocalizedStringWithDefaultValue(v6, v10, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

+ (id)hf_userFriendlyLocalizedLowercaseDescription:()HFAdditions
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  objc_msgSend(a1, "hf_getUserFriendlyDescriptionKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingString:", CFSTR("_CategoryLowercase"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (objc_msgSend(MEMORY[0x1E0CBA7E0], "hf_userFriendlyLocalizedLowercaseDescription:", v4),
        (v7 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend(a1, "hf_getUserFriendlyDescriptionKey:", *MEMORY[0x1E0CB7A70]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByAppendingString:", CFSTR("_CategoryLowercase"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    _HFLocalizedStringWithDefaultValue(v9, v9, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    _HFLocalizedStringWithDefaultValue(v6, v10, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (id)hf_userFriendlyLocalizedCapitalizedDescription
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "hf_categoryOrPrimaryServiceType");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "hf_userFriendlyLocalizedCapitalizedDescription:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)hf_userFriendlyLocalizedLowercaseDescription
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "hf_categoryOrPrimaryServiceType");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "hf_userFriendlyLocalizedLowercaseDescription:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (uint64_t)hf_isSuspendedStateSupported:()HFAdditions
{
  NSObject *v5;
  int v6;
  unint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (a3 < 4)
    return (0xEu >> (a3 & 0xF)) & 1;
  HFLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v6 = 134217984;
    v7 = a3;
    _os_log_error_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_ERROR, "Unknown HMAccessorySuspendedState %lu", (uint8_t *)&v6, 0xCu);
  }

  return 1;
}

- (uint64_t)hf_needsOnboarding
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "hf_siriEndpointProfile");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isNeedsOnboarding");

  return v2;
}

- (id)hf_errorForCurrentSessionState
{
  int v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  int v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _DWORD v13[2];
  __int16 v14;
  int v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(a1, "hf_needsOnboarding");
  if ((v2 & 1) != 0
    || (objc_msgSend(a1, "hf_siriEndpointProfile"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "supportsOnboarding"),
        v3,
        !v4))
  {
    v6 = -1;
  }
  else
  {
    objc_msgSend(a1, "hf_siriEndpointProfile");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "sessionState");

  }
  HFLogForCategory(0x3CuLL);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v2 ^ 1;
    objc_msgSend(a1, "hf_siriEndpointProfile");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = 67109890;
    v13[1] = v8;
    v14 = 1024;
    v15 = objc_msgSend(v9, "supportsOnboarding");
    v16 = 2112;
    v17 = a1;
    v18 = 2048;
    v19 = v6;
    _os_log_impl(&dword_1DD34E000, v7, OS_LOG_TYPE_DEFAULT, "accessoryIsOnboarded %{BOOL}d supportsOnBoarding %{BOOL}d sessionState from accessory [%@] = %ld", (uint8_t *)v13, 0x22u);

  }
  if (v6)
  {
    if (v6 == 3)
    {
      v10 = 72;
    }
    else
    {
      if (v6 != 2)
      {
        v11 = 0;
        return v11;
      }
      v10 = 71;
    }
  }
  else
  {
    v10 = 70;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  return v11;
}

- (void)hf_onboardSiriEndpointIfNeededWithSettingKeyPath:()HFAdditions settingValue:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  int v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "hf_siriEndpointProfile");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 && (objc_msgSend(a1, "hf_needsOnboarding") & 1) != 0)
  {
    objc_msgSend(a1, "hf_siriEndpointProfile");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "supportsOnboarding");

    if (v10)
    {
      v11 = objc_alloc_init(MEMORY[0x1E0CBA870]);
      objc_opt_class();
      v12 = v7;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v13 = v12;
      else
        v13 = 0;
      v14 = v13;

      objc_opt_class();
      v15 = v12;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v16 = v15;
      else
        v16 = 0;
      v17 = v16;

      if (objc_msgSend(v6, "isEqualToString:", HFAllowHeySiriSettingKeyPath) && v14)
      {
        -[NSObject setAllowHeySiri:](v11, "setAllowHeySiri:", objc_msgSend(v14, "BOOLValue"));
      }
      else if (objc_msgSend(v6, "isEqualToString:", HFSiriLanguageSettingKeyPath) && v17)
      {
        -[NSObject setLanguageValue:](v11, "setLanguageValue:", v17);
      }
      else if (objc_msgSend(v6, "isEqualToString:", HFLightWhenUsingSiriSettingKeyPath) && v14)
      {
        -[NSObject setLightWhenUsingSiriEnabled:](v11, "setLightWhenUsingSiriEnabled:", objc_msgSend(v14, "BOOLValue"));
      }
      else if (objc_msgSend(v6, "isEqualToString:", HFAirPlayEnabledSettingKeyPath) && v14)
      {
        -[NSObject setAirPlayEnabled:](v11, "setAirPlayEnabled:", objc_msgSend(v14, "BOOLValue"));
      }
      else if (objc_msgSend(v6, "isEqualToString:", HFAllowExplicitContentKeyPath) && v14)
      {
        -[NSObject setExplicitContentAllowed:](v11, "setExplicitContentAllowed:", objc_msgSend(v14, "BOOLValue"));
      }
      else if (objc_msgSend(v6, "isEqualToString:", HFShareSiriAnalyticsKeyPath) && v14)
      {
        -[NSObject setShareSiriAnalyticsEnabled:](v11, "setShareSiriAnalyticsEnabled:", objc_msgSend(v14, "BOOLValue"));
      }
      else if (objc_msgSend(v6, "isEqualToString:", HFDoorbellChimeEnabledKeyPath) && v14)
      {
        -[NSObject setDoorbellChimeEnabled:](v11, "setDoorbellChimeEnabled:", objc_msgSend(v14, "BOOLValue"));
      }
      else if (objc_msgSend(v6, "isEqualToString:", HFAnnounceEnabledKeyPath) && v14)
      {
        -[NSObject setAnnounceEnabled:](v11, "setAnnounceEnabled:", objc_msgSend(v14, "BOOLValue"));
      }
      objc_msgSend(a1, "hf_siriEndpointProfile");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "applyOnboardingSelections:completionHandler:", v11, &__block_literal_global_144);

      goto LABEL_38;
    }
  }
  else
  {

  }
  HFLogForCategory(0x3CuLL);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v18 = objc_msgSend(a1, "hf_needsOnboarding");
    objc_msgSend(a1, "hf_siriEndpointProfile");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138412802;
    v22 = a1;
    v23 = 1024;
    v24 = v18;
    v25 = 1024;
    v26 = objc_msgSend(v19, "supportsOnboarding");
    _os_log_impl(&dword_1DD34E000, v11, OS_LOG_TYPE_DEFAULT, "NOT Implicitly Onboarding accessory:[%@], hf_needsOnboarding = %{BOOL}d, supportsOnboarding = %{BOOL}d", (uint8_t *)&v21, 0x18u);

  }
LABEL_38:

}

- (uint64_t)hf_supportsUserLevelUpdateListeningHistorySetting
{
  uint64_t result;

  result = _os_feature_enabled_impl();
  if ((_DWORD)result)
    return objc_msgSend(a1, "supportsUserMediaSettings");
  return result;
}

- (uint64_t)hf_shouldHideNearbyAccessoryService:()HFAdditions
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  char v9;
  void *v11;
  char v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "accessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "hf_isHomePod") & 1) != 0 || (objc_msgSend(v5, "hf_isAppleTV") & 1) != 0)
    goto LABEL_9;
  if (!objc_msgSend(v5, "isEqual:", a1))
  {
    if ((objc_msgSend(v5, "hf_isCamera") & 1) == 0)
    {
      objc_msgSend(v4, "serviceType");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isEqual:", *MEMORY[0x1E0CB9A90]);

      if ((v9 & 1) == 0)
      {
        objc_msgSend(v4, "serviceType");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0CB9AA8]);

        if ((v12 & 1) != 0)
          v7 = 0;
        else
          v7 = objc_msgSend(v4, "hf_isInGroup");
        goto LABEL_10;
      }
    }
LABEL_9:
    v7 = 1;
    goto LABEL_10;
  }
  HFLogForCategory(0x2FuLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v13 = 138412546;
    v14 = v5;
    v15 = 2112;
    v16 = v4;
    _os_log_debug_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_DEBUG, "Camera-associated filtering for camera:%@ services:%@", (uint8_t *)&v13, 0x16u);
  }

  v7 = objc_msgSend(v4, "hf_isDisplayableSensor") ^ 1;
LABEL_10:

  return v7;
}

- (id)hf_allConnectedHomeToCHIPAccessoryPairingFuture
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];
  _QWORD v10[5];

  if (objc_msgSend(a1, "supportsCHIP"))
  {
    v4 = MEMORY[0x1E0C809B0];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __75__HMAccessory_HFAdditions__hf_allConnectedHomeToCHIPAccessoryPairingFuture__block_invoke;
    v10[3] = &unk_1EA7268F0;
    v10[4] = a1;
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithCompletionHandlerAdapterBlock:", v10);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "flatMap:", &__block_literal_global_148_0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v4;
    v9[1] = 3221225472;
    v9[2] = __75__HMAccessory_HFAdditions__hf_allConnectedHomeToCHIPAccessoryPairingFuture__block_invoke_4;
    v9[3] = &__block_descriptor_40_e27___NAFuture_16__0__NSError_8l;
    v9[4] = a2;
    objc_msgSend(v6, "recover:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", MEMORY[0x1E0C9AA70]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (id)hf_minimumDescription
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("<HMAccessory Name:'%@', id: %@>"), v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (uint64_t)hf_minimumDescriptionsOfAccessories:()HFAdditions
{
  return objc_msgSend(a3, "na_map:", &__block_literal_global_156_0);
}

@end
