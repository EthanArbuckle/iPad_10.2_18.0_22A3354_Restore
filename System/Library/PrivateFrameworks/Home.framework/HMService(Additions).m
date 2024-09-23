@implementation HMService(Additions)

- (id)hf_parentService
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[5];

  objc_msgSend(a1, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hf_standardServices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(a1, "accessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hf_owningBridgeAccessory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "hf_standardServices");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "unionSet:", v7);

  }
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __40__HMService_Additions__hf_parentService__block_invoke;
  v11[3] = &unk_1EA7283A0;
  v11[4] = a1;
  objc_msgSend(v4, "na_filter:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v8, "count") < 2)
  {
    objc_msgSend(v8, "anyObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    NSLog(CFSTR("Found multiple matching parent services for child service %@! This is indicative of either a bug in hf_childServices or a misconfigured accessory. Parents: %@"), a1, v8);
    v9 = 0;
  }

  return v9;
}

- (uint64_t)hf_isTelevision
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "serviceType");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0CB9AF0]);

  return v2;
}

- (uint64_t)hf_isSensorService
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend((id)objc_opt_class(), "hf_sensorServiceTypes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "serviceType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

+ (id)hf_sensorServiceTypes
{
  if (qword_1ED379278 != -1)
    dispatch_once(&qword_1ED379278, &__block_literal_global_32_4);
  return (id)qword_1ED379280;
}

- (uint64_t)hf_isAlarmSensorService
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend((id)objc_opt_class(), "hf_alarmSensorServiceTypes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "serviceType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

+ (id)hf_alarmSensorServiceTypes
{
  if (qword_1ED379288 != -1)
    dispatch_once(&qword_1ED379288, &__block_literal_global_34_5);
  return (id)qword_1ED379290;
}

- (HFServiceDescriptor)hf_serviceDescriptor
{
  HFServiceDescriptor *v2;
  void *v3;
  void *v4;
  HFServiceDescriptor *v5;
  _QWORD v7[4];
  id v8;
  id location;

  objc_initWeak(&location, val);
  v2 = [HFServiceDescriptor alloc];
  objc_msgSend(val, "serviceType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(val, "hf_effectiveServiceSubtype");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__HMService_Additions__hf_serviceDescriptor__block_invoke;
  v7[3] = &unk_1EA7366C8;
  objc_copyWeak(&v8, &location);
  v5 = -[HFServiceDescriptor initWithServiceType:serviceSubtype:parentServiceDescriptorGenerator:](v2, "initWithServiceType:serviceSubtype:parentServiceDescriptorGenerator:", v3, v4, v7);
  objc_destroyWeak(&v8);

  objc_destroyWeak(&location);
  return v5;
}

- (id)hf_effectiveServiceSubtype
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a1, "serviceSubtype");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2 || objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CB9988]))
  {
    v4 = (void *)objc_opt_class();
    objc_msgSend(a1, "serviceType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "hf_defaultServiceSubtypeForServiceType:", v5);
    v6 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v6;
  }
  return v3;
}

+ (id)hf_defaultServiceSubtypeForServiceType:()Additions
{
  if (objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0CB9B08]))
    return (id)*MEMORY[0x1E0CB9970];
  else
    return 0;
}

- (id)hf_childServices
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __40__HMService_Additions__hf_childServices__block_invoke;
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

- (id)hf_effectiveServiceType
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(a1, "associatedServiceType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend(a1, "serviceType");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

- (id)hf_lightProfiles
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[5];

  objc_msgSend(a1, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lightProfiles");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __40__HMService_Additions__hf_lightProfiles__block_invoke;
  v6[3] = &unk_1EA736830;
  v6[4] = a1;
  objc_msgSend(v3, "na_map:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (uint64_t)hf_isLegacyService
{
  uint64_t result;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;

  result = objc_msgSend(a1, "hf_isVisible");
  if ((_DWORD)result)
  {
    objc_msgSend(a1, "hf_requiredCharacteristicTypesForDisplayMetadata");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "characteristics");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __42__HMService_Additions__hf_isLegacyService__block_invoke;
    v8[3] = &unk_1EA72BB50;
    v9 = v3;
    v5 = v3;
    objc_msgSend(v4, "na_filter:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v6, "na_any:", &__block_literal_global_27_7);
    return v7;
  }
  return result;
}

- (uint64_t)hf_isVisible
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a1, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hf_visibleServices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", a1);

  return v4;
}

- (id)hf_iconDescriptor
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "applicationData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("HFApplicationDataServiceIconID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    +[HFServiceIconFactory iconDescriptorWithIdentifier:forService:](HFServiceIconFactory, "iconDescriptorWithIdentifier:forService:", v3, a1);
  else
    +[HFServiceIconFactory defaultIconDescriptorForService:](HFServiceIconFactory, "defaultIconDescriptorForService:", a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)hf_isChildService
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "hf_parentService");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 != 0;

  return v2;
}

+ (id)hf_standardServiceTypes
{
  if (_MergedGlobals_271 != -1)
    dispatch_once(&_MergedGlobals_271, &__block_literal_global_3_10);
  return (id)qword_1ED379240;
}

+ (id)hf_fanServiceTypes
{
  if (qword_1ED379268 != -1)
    dispatch_once(&qword_1ED379268, &__block_literal_global_29_2);
  return (id)qword_1ED379270;
}

- (id)hf_characteristicOfType:()Additions
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  objc_msgSend(a1, "characteristics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __48__HMService_Additions__hf_characteristicOfType___block_invoke;
  v9[3] = &unk_1EA72BB50;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "na_firstObjectPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)hf_isInGroup
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "hf_serviceGroup");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 != 0;

  return v2;
}

- (id)hf_serviceGroup
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __39__HMService_Additions__hf_serviceGroup__block_invoke;
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

- (uint64_t)hf_isNetworkRouter
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "serviceType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CB9B18]) & 1) != 0)
    v3 = 1;
  else
    v3 = objc_msgSend(a1, "hf_isNetworkRouterSatellite");

  return v3;
}

- (uint64_t)hf_isNetworkRouterSatellite
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "serviceType");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0CB9B20]);

  return v2;
}

- (id)hf_childServicesOfType:()Additions
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  objc_msgSend(a1, "hf_childServices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __47__HMService_Additions__hf_childServicesOfType___block_invoke;
  v9[3] = &unk_1EA7283A0;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "na_filter:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)hf_roomsForServices:()Additions
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "na_map:", &__block_literal_global_6_6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_filter:", &__block_literal_global_8_6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (void)hf_serviceComparator
{
  return &__block_literal_global_11_9;
}

+ (id)hf_serviceTypesHiddenFromScenesOrAutomations
{
  if (qword_1ED379248 != -1)
    dispatch_once(&qword_1ED379248, &__block_literal_global_13_9);
  return (id)qword_1ED379250;
}

- (id)hf_updateIconDescriptor:()Additions
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  char v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _QWORD v15[5];
  _QWORD v16[4];
  id v17;

  v4 = a3;
  +[HFServiceIconFactory allIconDescriptorsForService:](HFServiceIconFactory, "allIconDescriptorsForService:", a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __48__HMService_Additions__hf_updateIconDescriptor___block_invoke;
  v16[3] = &unk_1EA729410;
  v17 = v4;
  v7 = v4;
  v8 = objc_msgSend(v5, "na_any:", v16);

  if ((v8 & 1) != 0)
  {
    objc_msgSend(v7, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "applicationData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, CFSTR("HFApplicationDataServiceIconID"));

    v15[0] = v6;
    v15[1] = 3221225472;
    v15[2] = __48__HMService_Additions__hf_updateIconDescriptor___block_invoke_2;
    v15[3] = &unk_1EA7268C8;
    v15[4] = a1;
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithErrorOnlyHandlerAdapterBlock:", v15);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 33);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "futureWithError:", v9);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v13 = (void *)v11;

  return v13;
}

- (uint64_t)hf_supportsGroups
{
  id v2;
  void *v3;
  uint64_t v4;

  if (qword_1ED379258 != -1)
    dispatch_once(&qword_1ED379258, &__block_literal_global_23_3);
  v2 = (id)qword_1ED379260;
  objc_msgSend(a1, "hf_effectiveServiceType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

- (uint64_t)hf_showsAsServiceInControlCentre
{
  if ((objc_msgSend(a1, "hf_isProgrammableSwitch") & 1) != 0
    || (objc_msgSend(a1, "hf_isSensorService") & 1) != 0
    || (objc_msgSend(a1, "hf_isNetworkRouter") & 1) != 0)
  {
    return 0;
  }
  else
  {
    return objc_msgSend(a1, "hf_isNetworkRouterSatellite") ^ 1;
  }
}

- (uint64_t)hf_isFan
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend((id)objc_opt_class(), "hf_fanServiceTypes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "serviceType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

- (uint64_t)hf_isCameraContainedMotionSensor
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a1, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "hf_isCamera"))
  {
    objc_msgSend(a1, "serviceType");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CB9A90]);

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (uint64_t)hf_requiresDeviceUnlock
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "characteristics");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "na_any:", &__block_literal_global_30_2);

  return v2;
}

+ (id)_hf_allowedChildServicesTypeMap
{
  if (qword_1ED379298 != -1)
    dispatch_once(&qword_1ED379298, &__block_literal_global_37_1);
  return (id)qword_1ED3792A0;
}

- (uint64_t)_hf_isDirectlyOrIndirectlyLinkedToService:()Additions
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  while (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObjectAtIndex:", 0);
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    objc_msgSend(v8, "linkedServices", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v18;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v18 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          if ((objc_msgSend(v14, "isEqual:", v4) & 1) != 0)
          {

            v15 = 1;
            goto LABEL_16;
          }
          if ((objc_msgSend(v5, "containsObject:", v14) & 1) == 0)
          {
            objc_msgSend(v5, "addObject:", v14);
            objc_msgSend(v7, "addObject:", v14);
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v11)
          continue;
        break;
      }
    }

    v6 = v7;
  }
  v15 = 0;
LABEL_16:

  return v15;
}

+ (id)hf_descriptionForServiceSubtype:()Additions
{
  id v3;
  id v4;
  void *v5;
  void *v6;

  v3 = a3;
  if (qword_1ED3792A8 != -1)
    dispatch_once(&qword_1ED3792A8, &__block_literal_global_45_1);
  v4 = (id)qword_1ED3792B0;
  v5 = v4;
  if (v3)
    objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Custom(%@)"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (uint64_t)hf_canGroupWithService:()Additions
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  uint64_t v8;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqual:", a1) & 1) == 0
    && objc_msgSend(a1, "hf_supportsGroups")
    && objc_msgSend(v4, "hf_supportsGroups"))
  {
    objc_msgSend(v4, "hf_effectiveServiceType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "hf_effectiveServiceType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToString:", v6);

    if ((v7 & 1) != 0)
    {
      v8 = 1;
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "hf_fanServiceTypes");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "hf_effectiveServiceType");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "containsObject:", v11))
      {
        objc_msgSend((id)objc_opt_class(), "hf_fanServiceTypes");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "hf_effectiveServiceType");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v12, "containsObject:", v13);

      }
      else
      {
        v8 = 0;
      }

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (uint64_t)hf_characteristicsInServices:()Additions
{
  return objc_msgSend(a3, "na_flatMap:", &__block_literal_global_62);
}

- (id)hf_characteristicEqualToType:()Additions forServiceType:
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "serviceType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", v7);

  if (v9)
  {
    objc_msgSend(a1, "hf_characteristicOfType:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (uint64_t)hf_supportsNaturalLighting
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  if (+[HFUtilities isRunningInStoreDemoMode](HFUtilities, "isRunningInStoreDemoMode")
    || +[HFUtilities isPressDemoModeEnabled](HFUtilities, "isPressDemoModeEnabled"))
  {
    return 1;
  }
  objc_msgSend(a1, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hf_enabledResidentsSupportsNaturalLight");

  if (!v4)
    return 0;
  objc_msgSend(a1, "hf_lightProfiles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "na_any:", &__block_literal_global_66_1);

  return v6;
}

- (uint64_t)hf_isDisplayableSensor
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  objc_msgSend(a1, "serviceType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isEqual:", *MEMORY[0x1E0CB9A90]) & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(a1, "serviceType");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "isEqual:", *MEMORY[0x1E0CB9A68]) & 1) != 0)
    {
      v3 = 0;
    }
    else
    {
      objc_msgSend(a1, "serviceType");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v5, "isEqual:", *MEMORY[0x1E0CB9A98]) & 1) != 0)
      {
        v3 = 0;
      }
      else
      {
        objc_msgSend(a1, "serviceType");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v6, "isEqual:", *MEMORY[0x1E0CB99B0]) & 1) != 0)
        {
          v3 = 0;
        }
        else
        {
          objc_msgSend(a1, "serviceType");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v7, "isEqual:", *MEMORY[0x1E0CB99E0]) & 1) != 0)
          {
            v3 = 0;
          }
          else
          {
            objc_msgSend(a1, "serviceType");
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v8, "isEqual:", *MEMORY[0x1E0CB99E8]) & 1) != 0)
            {
              v3 = 0;
            }
            else
            {
              objc_msgSend(a1, "serviceType");
              v9 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v9, "isEqual:", *MEMORY[0x1E0CB99F0]) & 1) != 0)
              {
                v3 = 0;
              }
              else
              {
                objc_msgSend(a1, "serviceType");
                v10 = (void *)objc_claimAutoreleasedReturnValue();
                v11 = *MEMORY[0x1E0CB9A40];
                if ((objc_msgSend(v10, "isEqual:", *MEMORY[0x1E0CB9A40]) & 1) != 0)
                {
                  v3 = 0;
                }
                else
                {
                  objc_msgSend(a1, "serviceType");
                  v16 = (void *)objc_claimAutoreleasedReturnValue();
                  if ((objc_msgSend(v16, "isEqual:", *MEMORY[0x1E0CB9A60]) & 1) != 0)
                  {
                    v3 = 0;
                  }
                  else
                  {
                    objc_msgSend(a1, "serviceType");
                    v15 = (void *)objc_claimAutoreleasedReturnValue();
                    if ((objc_msgSend(v15, "isEqual:", *MEMORY[0x1E0CB9AB8]) & 1) != 0)
                    {
                      v3 = 0;
                    }
                    else
                    {
                      objc_msgSend(a1, "serviceType");
                      v14 = (void *)objc_claimAutoreleasedReturnValue();
                      if ((objc_msgSend(v14, "isEqual:", *MEMORY[0x1E0CB9AF8]) & 1) != 0)
                      {
                        v3 = 0;
                      }
                      else
                      {
                        objc_msgSend(a1, "serviceType");
                        v13 = (void *)objc_claimAutoreleasedReturnValue();
                        v3 = objc_msgSend(v13, "isEqual:", v11) ^ 1;

                      }
                    }

                  }
                }

              }
            }

          }
        }

      }
    }

  }
  return v3;
}

+ (id)hf_getUserFriendlyDescriptionKey:()Additions
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = qword_1ED3792C0;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&qword_1ED3792C0, &__block_literal_global_67_2);
  objc_msgSend((id)qword_1ED3792B8, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)hf_userFriendlyLocalizedCapitalizedDescription:()Additions
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "hf_getUserFriendlyDescriptionKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByAppendingString:", CFSTR("_ServiceTypeCapitalized"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  _HFLocalizedStringWithDefaultValue(v2, 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)hf_userFriendlyLocalizedLowercaseDescription:()Additions
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "hf_getUserFriendlyDescriptionKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByAppendingString:", CFSTR("_ServiceTypeLowercase"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  _HFLocalizedStringWithDefaultValue(v2, 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)hf_userFriendlyLocalizedCapitalizedDescription
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  v2 = (void *)objc_opt_class();
  objc_msgSend(a1, "serviceType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hf_userFriendlyLocalizedCapitalizedDescription:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(a1, "serviceType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedCapitalizedString");
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (id)hf_userFriendlyLocalizedLowercaseDescription
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  v2 = (void *)objc_opt_class();
  objc_msgSend(a1, "serviceType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hf_userFriendlyLocalizedLowercaseDescription:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(a1, "serviceType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedLowercaseString");
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

@end
